CMD:audio(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 4) return SendClientMessage(playerid, COLOR_LIGHTRED, AdminOnly);
	new link[150];
	if(sscanf(params, "s[150]", link))
		return SendClientMessage(playerid, COLOR_WHITE, "{008080}Usage: {FFFFFF}/music [link]");
	foreach(new i : Player) {
		StopAudioStreamForPlayer(i);
		PlayAudioStreamForPlayer(i, link);
	}
	return true;
}
CMD:trollhacker(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 4) return SendClientMessage(playerid, COLOR_LIGHTRED, AdminOnly);
	new id,string[94];
	if(sscanf(params, "u",id)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/trollhacker <playerid/name>");
	format(string, sizeof string, "{FFFFFF}PHAT HIEN NGHI VAN HACK (%d.%d)", random(5),random(9));
	Dialog_Show(id, 0,DIALOG_STYLE_MSGBOX,"He Thong Chong Sobeit & Cleo",string,"Ok","");
	format(string, sizeof string, "{FFFFFF}Ban da troll hacker %s", GetName(id));
	SendClientMessage(playerid,COLOR_WHITE,string);
	KickEx(id);
	return true;
}
CMD:gotoxyz(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 4) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new string[128],interior,vw;
	new Float:x, Float:y, Float:z;
	if(sscanf(params, "fffii", x,y,z,interior,vw)) return SendClientMessage(playerid,COLOR_GREY, "Su dung: {FFFFFF}/gotoxyz <x> <y> <z> <interior> <virtual world>");
	SetPlayerPosEx(playerid, x, y, z);
	format(string, sizeof(string), "ERROR: {FFFFFF} Ban da dich chuyen thanh cong. (%0.1f,%0.1f,%0.1f | int: %d | vw: %d)",x,y,z,interior, vw);
	SendClientMessage(playerid,COLOR_LGREEN, string);
	SetPlayerVirtualWorld(playerid, vw);
	SetPlayerInterior(playerid,interior);
	InHQ[playerid] = -1;
	InHouse[playerid] = -1;
	InBussines[playerid] = -1;
	return 1;
}
CMD:setskin(playerid, params[]) {
    if(PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new id,model,string[180];
	if(sscanf(params, "ud",id,model)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/setskin <playerid/name> <Skin ID>");	
	if(model < 1 || model > 310) return SendClientMessage(playerid, -1, "Wrong skin ID.");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	if(checkslotskin(id) == 10) return SendClientMessage(playerid, -1, "Nguoi nay da full slot skin.");
	if(checktrungskin(id,model) != 0) return SendClientMessage(playerid, -1, "Nguoi nay da so huu skin do.");
	// if(Player_GetSkinSlot(id, model) != -1) return SendClientMessage(playerid, -1, "Nguoi choi da so huu skin nay.");
	// new const success = Player_AddItem(id, ItemType:item_type_skin, model, 100);
	// if(success == -1) {
	// 	return SendClientMessage(playerid,COLOR_LGREEN, "ERROR: Nguoi choi do da su dung het inventory slot!");
	// }

	PlayerInfo[id][pChar] = model;
	SetPlayerSkinEx(id, PlayerInfo[id][pChar]);
	format(string, sizeof(string), "%s da set skin %d cho %s.", GetName(playerid), model, GetName(id));
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(COLOR_LOGS, string, 1);
	format(string, sizeof(string), "Ban da set cho %s(%d) skin %d.", GetName(id), id, model);
	SendClientMessage(playerid, COLOR_WHITE, string);
	format(string, sizeof(string), "Admin %s da set cho ban skin %d.", GetName(playerid), model);
	
	if(Inventory_GetFreeID(id, 1) == -1) Inventory_Add(id,"Skins", model, 1, 2);
	else Inventory_Add(id,"Skins", model, 1, 1);

	SendClientMessage(id, COLOR_WHITE, string);	
	new query[128];
	format(query,sizeof(query),"UPDATE users SET `CChar`='%d' WHERE `ID`='%d'",PlayerInfo[id][pChar],PlayerInfo[id][pSQLID]);
	mysql_query(SQL,query);
	return 1;
}
CMD:carcolortemp(playerid, params[]) {
    if(PlayerInfo[playerid][pAdmin] < 2) return 1;
	new color1,color2;
	if(sscanf(params, "ii",color1,color2)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/carcolortemp <Color 1> <Color 2>");
    if(color1 < 0 || color1 >= 255) return SendClientMessage(playerid, -1, "Invalid color id.");
    if(color2 < 0 || color2 >= 255) return SendClientMessage(playerid, -1, "Invalid color id.");
    if(IsPlayerInVehicle(playerid, GetPlayerVehicleID(playerid))) ChangeVehicleColorEx(GetPlayerVehicleID(playerid), color1, color2);
    else SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong xe.");
    return 1;
}
CMD:agl(playerid, params[]) {
    if(PlayerInfo[playerid][pAdmin] < 4) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new id,item[10],string[128], str[128];
	if(sscanf(params, "us[10]",id,item)) {
		SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/agl <playerid/name> <License>");
		SendClientMessage(playerid, COLOR_WHITE, "Co san: Driving, Fly, Sailing, Gun.");
		return 1;
	}
	if(id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	if(strcmp(item,"driving",true) == 0) {
		format(string, sizeof(string), "* Ban cap bang lai xe cho %s.",GetName(id));
		SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "* Admin %s cap cho ban bang lai xe.",GetName(playerid));
		SendClientMessage(id, COLOR_LIGHTBLUE, string);
		PlayerInfo[id][pCarLic] = 1;
		PlayerInfo[id][pCarLicT] = 50;
		PlayerInfo[id][pCarLicS] = 0;
		format(str,128,"UPDATE users SET `CarLic`='1',`CarLicT`='50',`CarLicS`='0' WHERE `ID`='%d'",PlayerInfo[id][pSQLID]);
		mysql_query(SQL,str,false);
	}
	else if(strcmp(item,"fly",true) == 0) {
		format(string, sizeof(string), "* Ban cap giay phep bay cho %s.",GetName(id));
		SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "* Admin %s da cap giay phep bay cho ban.",GetName(playerid));
		SendClientMessage(id, COLOR_LIGHTBLUE, string);
		PlayerInfo[id][pFlyLic] = 1;
		PlayerInfo[id][pFlyLicT] = 50;
		PlayerInfo[id][pFlyLicS] = 0;
		format(str,128,"UPDATE users SET `FlyLic`='1',`FlyLicT`='50',`FlyLicS`='0' WHERE `ID`='%d'",PlayerInfo[id][pSQLID]);
		mysql_query(SQL,str,false);
	}
	else if(strcmp(item,"sailing",true) == 0) {
		format(string, sizeof(string), "* Ban cap giay phep dieu huong cho %s.",GetName(id));
		SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "* Admin %s da cap cho ban giay phep dieu huong.",GetName(playerid));
		SendClientMessage(id, COLOR_LIGHTBLUE, string);
		PlayerInfo[id][pBoatLic] = 1;
		PlayerInfo[id][pBoatLicT] = 50;
		PlayerInfo[id][pBoatLicS] = 0;
		format(str,128,"UPDATE users SET `BoatLic`='1',`BoatLicT`='50',`BoatLicS`='0' WHERE `ID`='%d'",PlayerInfo[id][pSQLID]);
		mysql_query(SQL,str,false);
	}
	else if(strcmp(item,"gun",true) == 0) {
		format(string, sizeof(string), "* Ban da cap giay phep sung cho %s.",GetName(id));
		SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "* Admin %s da cap cho ban giay phep sung.",GetName(playerid));
		SendClientMessage(id, COLOR_LIGHTBLUE, string);
		PlayerInfo[id][pGunLic] = 1;
		PlayerInfo[id][pGunLicT] = 50;
		PlayerInfo[id][pGunLicS] = 0;
		format(str,128,"UPDATE users SET `GunLic`='1',`GunLicT`='50', `GunLicS`='0' WHERE `ID`='%d'",PlayerInfo[id][pSQLID]);
		mysql_query(SQL,str,false);
	}
    return 1;
}
CMD:lga(playerid, params[]) {
    if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new id,item[10],string[128], str[128];
	if(sscanf(params, "us[10]",id,item)) {
		SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/agl <playerid/name> <License>");
		SendClientMessage(playerid, COLOR_WHITE, "Co san: Driving, Fly, Sailing, Gun.");
		return 1;
	}
	if(id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	if(strcmp(item,"driving",true) == 0) {
		format(string, sizeof(string), "* Ban cap bang lai xe cho %s.",GetName(id));
		SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "* Admin %s cap cho ban bang lai xe.",GetName(playerid));
		SendClientMessage(id, COLOR_LIGHTBLUE, string);
		PlayerInfo[id][pCarLic] = 1;
		PlayerInfo[id][pCarLicT] = 50;
		PlayerInfo[id][pCarLicS] = 0;
		format(str,128,"UPDATE users SET `CarLic`='1',`CarLicT`='50',`CarLicS`='0' WHERE `ID`='%d'",PlayerInfo[id][pSQLID]);
		mysql_query(SQL,str,false);
	}
	else if(strcmp(item,"fly",true) == 0) {
		format(string, sizeof(string), "* Ban cap giay phep bay cho %s.",GetName(id));
		SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "* Admin %s da cap giay phep bay cho ban.",GetName(playerid));
		SendClientMessage(id, COLOR_LIGHTBLUE, string);
		PlayerInfo[id][pFlyLic] = 1;
		PlayerInfo[id][pFlyLicT] = 50;
		PlayerInfo[id][pFlyLicS] = 0;
		format(str,128,"UPDATE users SET `FlyLic`='1',`FlyLicT`='50',`FlyLicS`='0' WHERE `ID`='%d'",PlayerInfo[id][pSQLID]);
		mysql_query(SQL,str,false);
	}
	else if(strcmp(item,"sailing",true) == 0) {
		format(string, sizeof(string), "* Ban cap giay phep dieu huong cho %s.",GetName(id));
		SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "* Admin %s da cap cho ban giay phep dieu huong.",GetName(playerid));
		SendClientMessage(id, COLOR_LIGHTBLUE, string);
		PlayerInfo[id][pBoatLic] = 1;
		PlayerInfo[id][pBoatLicT] = 50;
		PlayerInfo[id][pBoatLicS] = 0;
		format(str,128,"UPDATE users SET `BoatLic`='1',`BoatLicT`='50',`BoatLicS`='0' WHERE `ID`='%d'",PlayerInfo[id][pSQLID]);
		mysql_query(SQL,str,false);
	}
	else if(strcmp(item,"gun",true) == 0) {
		format(string, sizeof(string), "* Ban da cap giay phep sung cho %s.",GetName(id));
		SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "* Admin %s da cap cho ban giay phep sung.",GetName(playerid));
		SendClientMessage(id, COLOR_LIGHTBLUE, string);
		PlayerInfo[id][pGunLic] = 1;
		PlayerInfo[id][pGunLicT] = 50;
		PlayerInfo[id][pGunLicS] = 0;
		format(str,128,"UPDATE users SET `GunLic`='1',`GunLicT`='50', `GunLicS`='0' WHERE `ID`='%d'",PlayerInfo[id][pSQLID]);
		mysql_query(SQL,str,false);
	}
    return 1;
}
CMD:weather(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 4) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new weather,string[60];
	if(sscanf(params, "i",weather)) return SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/weather <id>");
	if(weather < 0||weather > 45) return SendClientMessage(playerid, -1, "Thoi tiet khong hop le (1-45).");
	SetWeather(weather);
	ServerWeather = weather;
	format(string, sizeof(string), "AdmCmd: %s da set thoi tiet %d.", GetName(playerid),weather);
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(COLOR_LOGS, string, 4);
	return 1;
}
CMD:sethelper(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 4) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new id, string[180], lvl,reason[64];
	if(sscanf(params, "uis[64]",id, lvl,reason)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/sethelper <playerid/name> <level(0-3)> <ly do>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong dang nhap.");
	if(lvl < 0 || lvl > 3) return SendClientMessage(playerid, COLOR_GREY, "Level helper khong hop le! (0-3)");
	// if(id == playerid) return SendClientMessage(playerid, -1, "[hmh] dc faci abuz?");

	PlayerInfo[id][pHelper] = lvl;
	if(lvl > 0) {		
		format(string, sizeof(string), "Ban da duoc thiet lap tro thanh level %d helper by %s, Li do: %s", lvl, GetName(playerid),reason);
		SendClientMessage(id, COLOR_YELLOW, string);
		format(string, sizeof(string), "Ban da thiet lap %s tro thanh level %d helper.", GetName(id));
		SendClientMessage(playerid, -1, string);
		if(!Iter_Contains(PlayerHelpers, playerid)) Iter_Add(PlayerHelpers, playerid);
		// finishAchievement(id, 26);
	}
	else {
		HelperDuty[playerid] = 0, HaveHelp[playerid] = -1;
		format(string, sizeof(string), "Ban da bi giang chuc helper boi %s, Li do: %s", GetName(playerid),reason);
		SendClientMessage(id, COLOR_YELLOW, string);
		format(string, sizeof(string), "Ban da giang chuc %s khoi helper team.", GetName(id));
		SendClientMessage(playerid, -1, string);
		PlayerInfo[id][pHW] = 0;
		UpdateVar(id, "HW", 0);
		NewbieChat[playerid] = 0;
		if(Iter_Contains(PlayerHelpers, playerid)) Iter_Remove(PlayerHelpers, playerid);
		if(Iter_Contains(HelpersDuty, playerid)) Iter_Remove(HelpersDuty, playerid);
	}
	
	format(string, sizeof(string), "%s da thiet lap %s tro thanh level %d helper, Li do: %s", GetName(playerid),GetName(id),lvl,reason);
	if(GetPVarInt(playerid, "Cover") == 0) SendStaffMessage(COLOR_YELLOW, string);
	
	new query[128];
	format(query,sizeof(query),"UPDATE users SET `Helper`='%d',`HelpedPlayers`='0' WHERE `ID`='%d'",lvl,PlayerInfo[id][pSQLID]);
	mysql_query(SQL,query,false);
	return 1;
}
CMD:fpk(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 4) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly); 
	new id,string[200],giveplayer[30],sendername[MAX_PLAYER_NAME],fp,reason[64];
	if(sscanf(params, "uis[64]", id,fp,reason)) return SendClientMessage(playerid,COLOR_GREY, "Su dung: {FFFFFF}/auninvite <playerid/name> <fpunish> <ly do>");
	GetPlayerName(id, giveplayer, sizeof(giveplayer));
	GetPlayerName(playerid, sendername, sizeof(sendername));
	if(IsPlayerConnected(id)) {
		if(id != INVALID_PLAYER_ID) {
			if(PlayerInfo[id][pMember] == 0) return SendClientMessage(playerid, -1, "Nguoi choi do khong o trong mot to chuc!");
			format(string, sizeof(string), "Administrator %s moi %s ra khoi to chuc %s (rank %d) sau %d ngay voi %d fpunish, Li do: %s", GetName(playerid), GetName(id), FactionName(PlayerInfo[id][pMember]), PlayerInfo[id][pRank], PlayerInfo[id][pDays],fp,reason);
			SendAdminMessage(COLOR_LIGHTRED, string, 4);
			
			format(string, sizeof(string), "* Ban da bi moi ra khoi to chuc %s (rank %d) sau %d ngay voi %d fpunish boi administrator %s, Li do: %s",FactionName(PlayerInfo[id][pMember]), PlayerInfo[id][pRank], PlayerInfo[id][pDays],fp, sendername,reason);
			SendClientMessage(id, COLOR_LIGHTBLUE, string);
			new string89[280], query[256];
			
			if(PlayerInfo[id][pAdmin] < 6) {
				format(string89, sizeof(string89), "%s da duoc moi ra boi Admin %s khoi to chuc %s (rank %d) sau %d ngay cu %d fpunish, Li do: %s", GetName(id),GetName(playerid),FactionName(PlayerInfo[id][pMember]),PlayerInfo[id][pRank],PlayerInfo[id][pDays],fp,reason);
				mysql_format(SQL, query, sizeof(query), "INSERT INTO faction_logs (`text`,`player`,`leader`) VALUES ('%s','%d','%d')", string89, PlayerInfo[id][pSQLID], PlayerInfo[playerid][pSQLID]);
				mysql_tquery(SQL,query,"","");
			}
			
			FactionMembers[PlayerInfo[id][pMember]] --;
			new faction = PlayerInfo[id][pMember];
			PlayerInfo[id][pMember]=0;
			PlayerInfo[id][pLeader]=0;
			format(string, sizeof(string), "Administrator %s da xoa %s khoi to chuc %s (rank %d) sau %d ngay voi %d fpunish, Li do: %s", GetName(playerid), GetName(id), FactionName(faction), PlayerInfo[id][pRank], PlayerInfo[id][pDays],fp,reason);
			SendFactionMessage(faction, COLOR_CLIENT, string);
			PlayerInfo[id][pRank] = 0;
			PlayerInfo[id][pChar] = 0;
			PlayerInfo[id][pFACWarns] = 0;
			PlayerInfo[id][pFpunish] = 0;
			PlayerInfo[id][pDays] = 0;
			WarSeconds[id] = 0;
			PlayerInfo[id][pLW] = 0;
			UpdateVar(id, "LW", 0);	
			PlayerInfo[id][pFpunish] = fp;
			Update(id, pFpunishx);			
			gTeam[id] = 3;
			PlayerInfo[id][pTeam] = 3;
			OnDuty[id] = 0;
			tazer[id] = 0;
			SetPlayerArmourEx(id, 0);
			SetPlayerSkinEx(id,PlayerInfo[id][pModel]);
			SetPlayerToTeamColor(id);
			format(query,sizeof(query),"UPDATE users SET `Member`='0',`Leader`='0',`Rank`='0',`CChar`='0',`FWarn`='0',`FPunish`='0',`Team`='3',`Days`='0',`FPunish`='%d' WHERE `ID`='%d'",fp,PlayerInfo[id][pSQLID]);
			mysql_query(SQL,query,false);
			PlayerInfo[id][pCommands][0] = 0;
			ResetWeapons(id);
			format(query, sizeof(query), "UPDATE `users` SET `Commands`='%d' WHERE `ID`='%d'", PlayerInfo[id][pCommands][0], PlayerInfo[id][pSQLID]);
			mysql_query(SQL, query, false);
			//SpawnPlayer(id);
			PlayerTextDrawHide(playerid, WarTime);
			
		}
	}
	else SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong dang nhap.");
	return 1;
}
CMD:unwarn(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 4) return SendClientMessage(playerid, COLOR_WHITE,  AdminOnly);
	new id,string[200];
	if(sscanf(params, "u", id)) return SendClientMessage(playerid,COLOR_GREY, "Su dung: {FFFFFF}/unwarn <playerid/name>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong dang nhap.");
	if(PlayerInfo[id][pWarns] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "* Nguoi choi khong bi canh cao!");
	PlayerInfo[id][pWarns] -= 1;
	format(string, sizeof(string), "AdmCmd: %s da duoc -1 warn boi %s.", GetName(playerid), GetName(id));
	SendAdminMessage(COLOR_LIGHTRED, string, 1);
	format(string, sizeof(string), "* %s da -1 warn cho ban!", GetName(playerid));
	SendClientMessage(id, COLOR_YELLOW, string);	
	Update(id,pWarnsx);
	return 1;
}
CMD:fpkoff(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 4) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new id[25], msg[80];
	if(sscanf(params, "s[25]s[80]", id,msg)) return SendClientMessage(playerid,COLOR_GREY, "Su dung: {FFFFFF}/fpkoff <name> <ly do>");
	new cont = MySQLCheckAccount(id);
	if(cont == 0) return SendClientMessage(playerid,-1, "ERROR: Ten nay khong duoc tim thay tren co so du lieu!");
	
	new string[75], query[184];
	format(query,sizeof(query),"UPDATE users SET `Member`='0', `Leader`='0', `Rank`='0', `CChar`='250', `Days`='0'  WHERE `name`='%s'",id);
	mysql_query(SQL,query, false);

	format(string, sizeof(string), "%s da bi xoa ten khoi to chuc.", id);
	SendClientMessage(playerid, COLOR_YELLOW, string);	
	return 1;
}
CMD:sethw(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 4) return SendClientMessage(playerid, COLOR_LGREEN, AdminOnly);
	new string[180], id, amount, reason[180];
	if(sscanf(params, "uis[180]", id, amount, reason)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/sethw <playerid/name> <amount/3> <ly do>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong ket noi!");
	if(PlayerInfo[id][pHelper] == 0) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la Helper!");
	if(PlayerInfo[id][pAdmin] > PlayerInfo[playerid][pAdmin]) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the dung lenh nay tren nguoi choi do!");
	if(amount > 3) return SendClientMessage(playerid, COLOR_GREY, "Invalid amount! (0-3)");
	if(strlen(reason) < 5) return SendClientMessage(playerid, COLOR_GREY, "Ly do qua ngan!");
	if(id == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren chinh minh!");
	PlayerInfo[id][pHW] = amount;
	UpdateVar(id, "HW", amount);
	format(string, sizeof(string), "AdmCmd: %s da set %s %d/3 helper warns, Li do: %s.", GetName(playerid), GetName(id), amount, reason);
	SendAdminMessage(COLOR_LOGS, string, 1);
	format(string, sizeof(string), "Administrator %s da set %d/3 helper warns, Li do: %s.", GetName(playerid), amount, reason);
	SendClientMessage(id, COLOR_LIGHTBLUE, string);
	if(amount == 3) {
		PlayerInfo[id][pHelper] = 0;
		PlayerInfo[id][pHW] = 0;
		UpdateVar(id, "HW", 0);
		if(HaveHelp[playerid] != -1) {
			OnHelper[HaveHelp[playerid]] = 0;
			SendClientMessage(HaveHelp[playerid], COLOR_YELLOW, "Helper da chap nhan cau hoi cua ban khong the tra loi! Mot nguoi khac se giup ban..");
		}
		HaveHelp[playerid] = -1;
		SendClientMessage(id, COLOR_YELLOW, "Ban da mat chuc vu vi dat 3/3 warns.");
	}
	return 1;
}

CMD:setlw(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 4) return SendClientMessage(playerid, COLOR_LGREEN, AdminOnly);
	new string[180], id, amount, reason[180];
	if(sscanf(params, "uis[180]", id, amount, reason)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/setlw <playerid/name> <amount/3> <ly do>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong ket noi!");
	if(PlayerInfo[id][pLeader] == 0) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong phai la mot lanh dao!");
	if(PlayerInfo[id][pAdmin] > PlayerInfo[playerid][pAdmin]) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the dung lenh nay tren nguoi choi do!");
	if(amount > 3) return SendClientMessage(playerid, COLOR_GREY, "Invalid amount! (0-3)");
	if(strlen(reason) < 5) return SendClientMessage(playerid, COLOR_GREY, "Ly do qua ngan!");
	if(id == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren chinh minh!");
	PlayerInfo[id][pLW] = amount;
	UpdateVar(id, "LW", amount);
	format(string, sizeof(string), "AdmCmd: %s da set cho %s %d/3 leader warns, Li do: %s.", GetName(playerid), GetName(id), amount, reason);
	SendAdminMessage(COLOR_LOGS, string, 1);
	format(string, sizeof(string), "Administrator %s da set cho ban %d/3 leader warns, Li do: %s.", GetName(playerid), amount, reason);
	SendClientMessage(id, COLOR_LIGHTBLUE, string);
	if(amount == 3) {
		PlayerInfo[id][pMember]=0;
		PlayerInfo[id][pLeader]=0;
		PlayerInfo[id][pRank] = 0;
		PlayerInfo[id][pChar] = 0;
		PlayerInfo[id][pFACWarns] = 0;
		PlayerInfo[id][pFpunish] = 0;
		PlayerInfo[id][pDays] = 0;
		WarSeconds[id] = 0;
		PlayerInfo[id][pLW] = 0;
		UpdateVar(id, "LW", 0);				
		gTeam[id] = 3;
		PlayerInfo[id][pTeam] = 3;
		OnDuty[id] = 0;
		tazer[id] = 0;
		SetPlayerArmourEx(id, 0);
		SetPlayerSkinEx(id,PlayerInfo[id][pModel]);
		SetPlayerToTeamColor(id);
		new str[180];
		format(str,sizeof(str),"UPDATE users SET `Member`='0',`Leader`='0',`Rank`='0',`CChar`='0',`FWarn`='0',`FPunish`='0',`Team`='3',`Days`='0' WHERE `ID`='%d'",PlayerInfo[id][pSQLID]);
		mysql_query(SQL,str,false);
		PlayerInfo[id][pCommands][0] = 0;
		new rquery[256];

		format(rquery, sizeof(rquery), "UPDATE `users` SET `Commands`='%d' WHERE `ID`='%d'", PlayerInfo[id][pCommands][0], PlayerInfo[id][pSQLID]);
		mysql_query(SQL, rquery, false);
		SpawnPlayer(id);
		SendClientMessage(id, COLOR_YELLOW, "Ban da mat chuc vu vi dat 3/3 warns.");			
	}
	return 1;
}