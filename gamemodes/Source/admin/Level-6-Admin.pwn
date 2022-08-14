CMD:togcaptcha(playerid,params[]) {
	if(PlayerInfo[playerid][pAdmin] < 6) return 1;
	new string[90];
	if(toghuman == 0) {
		toghuman = 1;
		format(string, sizeof(string), "INFO: %s Da Bat Captcha Khi Farm", GetName(playerid));		
		SendStaffMessage(COLOR_YELLOW, string);
	}
	else if(toghuman == 1) {
		toghuman = 0;
		format(string, sizeof(string), "INFO: %s Da Tat Captcha Khi Farm", GetName(playerid));		
		SendStaffMessage(COLOR_YELLOW, string);
	}
	return 1;
}
CMD:movefactioninterior(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 6) return 1;
	new id;
	if(sscanf(params, "d", id)) return SendClientMessage(playerid, -1, "Usage: /movefactioninterior <ID fac>");
	GetPlayerPos(playerid, DynamicFactions[id][fcX], DynamicFactions[id][fcY], DynamicFactions[id][fcZ]);
	DynamicFactions[id][fInterior] = GetPlayerInterior(playerid);
	DynamicFactions[id][fVW] = GetPlayerVirtualWorld(playerid);

	new query[200];
	format(query, sizeof(query), "UPDATE factions SET IntX='%f', IntY='%f', IntZ='%f', Interior=%d, VW=%d WHERE ID=%d", 
		DynamicFactions[id][fcX], DynamicFactions[id][fcY], DynamicFactions[id][fcZ], DynamicFactions[id][fInterior], DynamicFactions[id][fVW], id);
	mysql_pquery(SQL, query);
	SendClientMessage(playerid, -1, "Thanh cong");
	return 1;
}
CMD:movehq(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 6) return 1;
	new id;
	if(sscanf(params, "d", id)) return SendClientMessage(playerid, -1, "Usage: /movehq <ID fac>");
	GetPlayerPos(playerid, DynamicFactions[id][extX], DynamicFactions[id][extY], DynamicFactions[id][extZ]);
	DestroyDynamic3DTextLabel(DynamicFactions[id][fLabel]);
	DestroyPickup(DynamicFactions[id][fPickup]);
	new label[40];
	if(DynamicFactions[id][fLock] == 0) format(label, sizeof(label), "%s's HQ\n(khoa)", DynamicFactions[id][fName]);
	else format(label, sizeof(label), "%s's HQ\n(khong khoa)", DynamicFactions[id][fName]);
	DynamicFactions[id][fLabel] = Create3DTextLabel(label,COLOR_WHITE,DynamicFactions[id][extX], DynamicFactions[id][extY], DynamicFactions[id][extZ],20.0, 0, 1);
	DynamicFactions[id][fPickup] = CreatePickup(1313, 23, DynamicFactions[id][extX], DynamicFactions[id][extY], DynamicFactions[id][extZ]);
	new query[200];
	format(query, sizeof(query), "UPDATE factions SET X='%f', Y='%f', Z='%f' WHERE ID=%d", 
		DynamicFactions[id][extX], DynamicFactions[id][extY], DynamicFactions[id][extZ], id);
	mysql_pquery(SQL, query);
	return 1;
}
CMD:dropgift(playerid, params[]) {
	if(strlen(PlayerInfo[playerid][pPin]) != 0 && PlayerInfo[playerid][pPinLogged] == 0) {
	 SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay vi ban chua dang nhap PIN.");
	 SendClientMessage(playerid, COLOR_GREY, "De xac thuc, su dung '/loginpin'!");
	 return 1;
	}
	if(PlayerInfo[playerid][pAdmin] < 6) return 1;
	if(cadoumort == 0) return SendClientMessage(playerid,-1,"Da xuat hien mot hop qua.");
	cadouzb();
	return 1;
}
CMD:gotogift(playerid, params[]) {
	if(strlen(PlayerInfo[playerid][pPin]) != 0 && PlayerInfo[playerid][pPinLogged] == 0) {
		SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay vi ban chua dang nhap PIN.");
		SendClientMessage(playerid, COLOR_GREY, "De xac thuc, su dung '/loginpin'!");
		return 1;
	}
	if(PlayerInfo[playerid][pAdmin] < 6) return 1;
	if(cadoumort == 1) return SendClientMessage(playerid,-1,"Khong co chuyen gi xay ra! [cadou]");
	new Float:X,Float:Y,Float:Z;
	
	GetObjectPos(cadouzburator, X, Y, Z);
	SetPlayerPosEx(playerid, X, Y+3, Z);
	SetPlayerInterior(playerid, 0);
	SetPlayerVirtualWorld(playerid,0);
	return 1; 
}
CMD:blockcmd(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, -1, AdminOnly);
	new cmd[30], status[10], string[200], reason[100];
	if(sscanf(params, "s[30]s[10]s[100]", cmd, status, reason)) return SendClientMessage(playerid, COLOR_GREY, "USE: {FFFFFF}/blockcmd <command> <on/off> <ly do>");
	if(strcmp(status, "on", true) == 0) {
		new j = -1;
		foreach(new i: BlockedCommand) {
			if(strcmp(cmd, CommandBlocked[i], true) == 0) {
				j = i;
				break;
			}
		}
		if(j != -1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: {FFFFFF}Lenh nay da bi khoa.");		
		format(string, sizeof(string), "INFO: Lenh %s da bi khoa lai boi %s, ly do: %s", cmd, GetName(playerid), reason);
		SendStaffMessage(COLOR_YELLOW, string);
		new i = Iter_Alloc(BlockedCommand);
		format(BlockReason[i], 80, reason);
		format(CommandBlocked[i], 80, cmd);

		format(string, sizeof(string), "INSERT INTO `blockedcommands` (`Reason`, `Text`) VALUES ('%e','%e')", reason, cmd);
		mysql_query(SQL, string, false);
	}
	else if(strcmp(status, "off", true) == 0) {
		new j = -1;
		foreach(new i: BlockedCommand) {
			if(strcmp(cmd, CommandBlocked[i], true) == 0) {
				j = i;
				break;
			}
		}
		if(j == -1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: {FFFFFF}Lenh khong bi khoa.");
		format(string, sizeof(string), "INFO: Lenh %s da duoc mo khoa boi %s", cmd, GetName(playerid));		
		SendStaffMessage(COLOR_YELLOW, string);
		Iter_Remove(BlockedCommand, j);
		format(string, sizeof(string), "DELETE FROM `blockedcommands` WHERE `Text`='%e'", cmd);
		mysql_query(SQL, string, false);
	} 
	else SendClientMessage(playerid, COLOR_GREY, "USE: {FFFFFF}/blockcmd <command> <on/off>");
	return 1;
}
CMD:blockcmdlist(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;
	if(Iter_Count(BlockedCommand) == 0) return SendClientMessage(playerid, COLOR_GREY, "Khong co lenh nao bi khoa");
	foreach(new i: BlockedCommand) {
		SendClientMessage(playerid, -1, CommandBlocked[i]);
	}
	return 1;
}
CMD:editbizz(playerid, params[]) {
	new id, code[180], list;
	if(PlayerInfo[playerid][pAdmin] < 6) return 1;
    if(sscanf(params, "iis[180]", id,list,code)) {
 		SendClientMessage(playerid, COLOR_GREY, "Su dung:{FFFFFF} /editbizz <biz id> <code> <result>");
 		SendClientMessage(playerid, 0xFFFFFFFF, "(1) Level, (2) Ten, (3) Gia, (4) Owned");
 		return 1;
 	}
 	if(BizzInfo[id][bID] == 0) return SendClientMessage(playerid, COLOR_GOLD, "Biz khong ton tai!");
 	new result = strval(code), string[180], str[180];
 	switch(list) {
 		case 1: {
 			format(string, sizeof(string), "Ban chinh sua level cua biz %d tro thanh %d.", id, result);
 			SendClientMessage(playerid, COLOR_WHITE, string);
 			BizzInfo[id][bLevelNeeded] = result;
			format(str,sizeof(str),"UPDATE bizz SET LevelNeeded='%d' WHERE ID='%d'",BizzInfo[id][bLevelNeeded],id);
			mysql_query(SQL,str,false);
 		}
 		case 2: {
 			format(string, sizeof(string), "Ban chinh sua ten cua biz %d tro thanh %s.", id, code);
 			SendClientMessage(playerid, COLOR_WHITE, string);
 			format(BizzInfo[id][bMessage],256,code);
			format(str,sizeof(str),"UPDATE bizz SET Message='%s' WHERE ID='%d'",BizzInfo[id][bMessage],id);
			mysql_query(SQL,str,false);
		 }
 		case 3: {
 			if(result > 1400000000) return SendClientMessage(playerid, -1, "ERROR");
 			format(string, sizeof(string), "Ban chinh sua gia cua biz %d tro thanh $%s.", id, FormatNumber(result));
 			SendClientMessage(playerid, COLOR_WHITE, string);
			BizzInfo[id][bBuyPrice] = result;
			format(string, sizeof(string), "UPDATE bizz SET `BuyPrice`='%d' WHERE ID=%d",result,id);
			mysql_query(SQL,string,false);
 		}
 		case 4: {
 			format(string, sizeof(string), "Ban chinh sua chu so huu cua biz %d tro thanh %s.", id, result);
 			SendClientMessage(playerid, COLOR_WHITE, string);
			BizzInfo[id][bOwned] = result;
			format(string, sizeof(string), "UPDATE bizz SET `Owned`='%d' WHERE ID=%d",result,id);
			mysql_query(SQL,string,false);
 		}
 	}
 	OnPropTextdrawUpdate(2, id);
	return 1;
}
CMD:edithouse(playerid, params[]) {
	new id, code[180], list;
	if(PlayerInfo[playerid][pAdmin] < 6) return 1;
    if(sscanf(params, "iis[180]", id,list,code)) {
 		SendClientMessage(playerid, COLOR_GREY, "Su dung:{FFFFFF} /edithouse <house id> <code> <result>");
 		SendClientMessage(playerid, 0xFFFFFFFF, "(1) Level, (2) Ten, (3) Gia, (4) Owned (5) Interior Type");
 		return 1;
 	} 	
 	if(HouseInfo[id][hID] == 0) return SendClientMessage(playerid, COLOR_GOLD, "Ngoi nha khong ton tai!");
 	new result = strval(code), string[180], str[180];
 	switch(list) {
 		case 1: {
 			if(result < 1) return 1;
 			format(string, sizeof(string), "Ban chinh sua level cua House %d tro thanh %d.", id, result);
 			SendClientMessage(playerid, COLOR_GOLD, string);
			format(str,sizeof(str),"UPDATE houses SET Level='%d' WHERE ID='%d'",HouseInfo[id][hLevel],id);
			mysql_query(SQL,str);
 		}
 		case 2: {
 			format(string, sizeof(string), "Ban chinh sua ten cua House %d tro thanh %s.", id, code);
 			SendClientMessage(playerid, COLOR_GOLD, string);
 			format(HouseInfo[id][hDiscription],64,code);
			format(str,sizeof(str),"UPDATE houses SET Discription='%s' WHERE ID='%d'",HouseInfo[id][hDiscription],id);
			mysql_query(SQL,str);
		 }
 		case 3: {
 			format(string, sizeof(string), "Ban chinh sua gia cua House %d tro thanh $%s.", id, FormatNumber(result));
 			SendClientMessage(playerid, COLOR_GOLD, string);
			HouseInfo[id][hValue] = result;
			format(string, sizeof(string), "UPDATE houses SET `Value`='%d' WHERE ID=%d",result,id);
			mysql_query(SQL,string);
 		}
 		case 4: {
 			format(string, sizeof(string), "Ban da chinh sua chu so huu cua House %d tro thanh %d.", id, result);
 			SendClientMessage(playerid, COLOR_GOLD, string);
			HouseInfo[id][hOwned] = result;
			format(string, sizeof(string), "UPDATE houses SET `Owned`='%d' WHERE ID=%d",result,id);
			mysql_query(SQL,string);
 		}		
 		case 5: {
 			if(result > 3 || result < 0) return 1;
 			format(string, sizeof(string), "Ban da chinh sua Interior Type cua House %d tro thanh %d.", id, result);
 			SendClientMessage(playerid, COLOR_GOLD, string);
			HouseInfo[id][hInteriorType] = result;
			format(string, sizeof(string), "UPDATE houses SET `InteriorType`='%d' WHERE ID=%d",result,id);
			mysql_query(SQL,string);
 		}  
 	}
 	OnPropTextdrawUpdate(1, id);
	return 1;
}
CMD:ao(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 6) return 1;
	new string[250],result[250];
	if(sscanf(params, "s[250]",result)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/a <noi dung>");
	format(string, sizeof(string), "* (%d) %s %s: %s", PlayerInfo[playerid][pAdmin], GetAdminRank(playerid), GetName(playerid), result);
	SendAdminMessage(0xCC7529FF, string,6);
	return 1;
}
CMD:deleteclan(playerid, params[]) {
	new membrii, szQuery[256], string[180], clanid;
	if(PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, COLOR_GREY, AdminOnly);
	if(sscanf(params, "i", clanid)) {
 		SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/deleteclan <id>");
		for(new h = 0; h < MAX_CLANS; h++) {
			if(strlen(ClanInfo[h][clName]) > 0) {
				format(string, sizeof(string), "%d. Clan: %s (%s) | Owner: %s", h, ClanInfo[h][clName], ClanInfo[h][clTag], ClanInfo[h][clOwner]);
				SendClientMessage(playerid, COLOR_WHITE, string);
			}
		}
		return 1;
	}
	foreach(new i: Player) {
		if(IsPlayerLogged[i] == 1 && PlayerInfo[i][pClan] == clanid && clanid != 0) {
			SendClientMessage(i, COLOR_YELLOW, "Ban da bi sa thai khoi clan nay! Li do: Clan da bi xoa boi Admin.");
			SendClientMessage(i, COLOR_YELLOW, "Server: Clan tag da duoc xoa. Ten cua ban khong bi anh huong.");
			PlayerInfo[i][pClan] = 0;
			PlayerInfo[i][pClanRank] = 0;
			SetPlayerName(i, PlayerInfo[i][pUsername]);
			format(szQuery, sizeof(szQuery), "UPDATE `users` SET `Clan`='0', `ClanRank`='0', `ClanDays`='0', `ClanWarns`='0' WHERE `Name`='%s'", GetName(i));
			mysql_query(SQL, szQuery);
			membrii++;
		}
	}
	for(new h = 0; h < MAX_CLANZONES; h++) {
		if(GraffitiInfo[h][gfOwned] == clanid && clanid != 0) {
			GraffitiInfo[h][gfOwned] = 0;
			DestroyDynamicObject(GraffitiInfo[h][gfObject]);
			GraffitiInfo[h][gfObject] = CreateDynamicObject(19373, GraffitiInfo[h][gfX], GraffitiInfo[h][gfY], GraffitiInfo[h][gfZ], 0.0, 0.0, GraffitiInfo[h][gfRot]);
			format(string, sizeof(string), "None", ClanInfo[GraffitiInfo[h][gfOwned]][clColor], ClanInfo[GraffitiInfo[h][gfOwned]][clTag]);
			SetDynamicObjectMaterialText(GraffitiInfo[h][gfObject], 0, string, OBJECT_MATERIAL_SIZE_256x128, "BankGothic Md BT", 60, 1, 0xfff0f0f0, 0, 1);
			GraffitiInfo[StartedSprayOn[playerid]][gfAttacked] = 0;
			new query[256];
			format(query, sizeof(query), "UPDATE `clanzone` SET `Owned`='%d' WHERE `ID`='%d'", h);
			mysql_query(SQL, query);
		}
	}
    format(ClanInfo[clanid][clName], 256, "");
    format(szQuery, sizeof(szQuery), "SELECT * FROM `users` WHERE `Clan` = '%d'", clanid);
    new Cache: result = mysql_query(SQL, szQuery);
    new idwtf[180];
    for(new i, j = cache_num_rows (); i < j; i++)
    {
		cache_get_value_name(i, "id", idwtf);
 		membrii++;
 		new szQuery2[256];
		mysql_format(SQL, szQuery2, sizeof(szQuery2), "UPDATE `users` SET `Clan`='0', `ClanRank`='0', `ClanDays`='0', `ClanWarns`='0' WHERE `ID`='%d'", strval(idwtf));
		mysql_tquery(SQL,szQuery2, "", "");
    }
    cache_delete(result);
	format(string, sizeof(string), "Ban da xoa clan thanh cong! [%d thanh vien da bi xoa]", membrii);
	SendClientMessage(playerid, COLOR_YELLOW, string);
	mysql_format(SQL, string,128,"DELETE FROM `clans` WHERE `ID`='%d'",clanid);
	mysql_query(SQL, string);
	return 1;
}
CMD:giveallrp(playerid, params[]) {
	new szMessage[120], rp;
	if(sscanf(params, "i", rp)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/rpforall <amount>");
	if(IsPlayerLogged[playerid] == 0) return SendClientMessage(playerid, COLOR_RED, "Ban chua dang nhap!");
	if(PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, COLOR_GREY, AdminOnly);
	foreach(new i: Player) {
		if(IsPlayerConnected(i) && IsPlayerLogged[i] == 1) {
			PlayerInfo[i][pExp] += rp;
			Update(i, pRP);
			format(szMessage, sizeof(szMessage), "* Admin %s da gui tang %d diem kinh nghiem cho tat ca nguoi choi online!",GetName(playerid), rp);
			SendClientMessage(i,COLOR_YELLOW,szMessage);	
			UpdateProgress(i, 0);
		}
	}
	return 1;
}
CMD:givealllevel(playerid, params[]) {
	new szMessage[180];
	if(IsPlayerLogged[playerid] == 0) return SendClientMessage(playerid, COLOR_RED, "Ban chua dang nhap!");
	if(PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, COLOR_GREY, AdminOnly);
	foreach(new i: Player) {
		if(IsPlayerConnected(i) && IsPlayerLogged[i] == 1) {
			new playerlevel = PlayerInfo[i][pLevel];
			PlayerInfo[i][pLevel] = playerlevel + 1;
			Update(i, pLevelx);
			SetPlayerScore(i,PlayerInfo[i][pLevel]);
			format(szMessage, sizeof(szMessage), "* Admin %s da tang %d Level cho tat ca nguoi choi! ",GetName(playerid), PlayerInfo[i][pLevel]);
			SendClientMessage(i,COLOR_YELLOW,szMessage);
			UpdateProgress(i, 0);
		}
	}
	return 1;
}
CMD:giveallmats(playerid, params[]) {
	new money, szMessage[180];
	if(IsPlayerLogged[playerid] == 0) return SendClientMessage(playerid, COLOR_RED, "Ban chua dang nhap!");
	if(PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, COLOR_GREY, AdminOnly);
	if(sscanf(params, "i", money)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/giveallmats <amount>");
	foreach(new i: Player) {
		if(IsPlayerConnected(i) && IsPlayerLogged[i] == 1) {
			PlayerInfo[i][pMats] += money;
			Update(i, pMatsx);
			format(szMessage, sizeof(szMessage), "* Admin %s da tang %s vat lieu cho tat ca nguoi choi!", GetName(playerid), FormatNumber(money));
			SendClientMessage(i,COLOR_YELLOW,szMessage);
		}
	}
	return 1;
}
CMD:giveallkc(playerid, params[]) {
	new money, szMessage[180];
	if(IsPlayerLogged[playerid] == 0) return SendClientMessage(playerid, COLOR_RED, "Ban chua dang nhap!");
	if(PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, COLOR_GREY, AdminOnly);
	if(sscanf(params, "i", money)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/giveallkc <amount>");
	foreach(new i: Player) {
		if(IsPlayerConnected(i) && IsPlayerLogged[i] == 1) {
			PlayerInfo[i][pKC] += money;
			Update(i, pKCx);
			format(szMessage, sizeof(szMessage), "* Admin %s da tang %s kim cuong cho tat ca nguoi choi!", GetName(playerid), FormatNumber(money));
			SendClientMessage(i,COLOR_YELLOW,szMessage);
		}
	}
	return 1;
}
CMD:giveallpp(playerid, params[]) {
	new money, szMessage[180];
	if(IsPlayerLogged[playerid] == 0) return SendClientMessage(playerid, COLOR_RED, "Ban chua dang nhap!");
	if(PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, COLOR_GREY, AdminOnly);
	if(sscanf(params, "i", money)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/ppforall <amount>");
	foreach(new i: Player) {
		if(IsPlayerConnected(i) && IsPlayerLogged[i] == 1) {
			PlayerInfo[i][pPremiumPoints] += money;
			Update(i, pPremiumPointsx);
			format(szMessage, sizeof(szMessage), "* Admin %s da tang %s "#DIEMCAOCAP" cho tat ca nguoi choi!", GetName(playerid), FormatNumber(money));
			SendClientMessage(i,COLOR_YELLOW,szMessage);
		}
	}
	return 1;
}
CMD:giveallmoney(playerid, params[]) {
	new money, szMessage[180];
	if(IsPlayerLogged[playerid] == 0) return SendClientMessage(playerid, COLOR_RED, "Ban chua dang nhap!");
	if(PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, COLOR_GREY, AdminOnly);
	if(sscanf(params, "i", money)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/moneyforall <money>");
	if(money < 1 || money > 1000000) return SendClientMessage(playerid, COLOR_GREY, "So tien khong hop le! ($1-$1,000,000)");
	foreach(new i: Player) {
		if(IsPlayerConnected(i) && IsPlayerLogged[i] == 1) {
			GivePlayerCash(i, money);
			format(szMessage, sizeof(szMessage), "* Admin %s da tang $%s cho tat ca nguoi choi!", GetName(playerid), FormatNumber(money));
			SendClientMessage(i,COLOR_YELLOW,szMessage);
		}
	}
	return 1;
}
CMD:editjob(playerid, params[]) {
	new szTitle[180], szDialog[1024], job;
	if(PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, 0xFFFFCCFF, AdminOnly);
	if(sscanf(params, "i", job)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/editjob <job id>");
	if(strlen(JobInfo[job][jName]) == 0) return SendClientMessage(playerid, COLOR_WHITE, "Job khong hop le!");
	format(szDialog, sizeof(szDialog),
		"Cong viec\t\t%s\nLevel\t\t%d\nLegal\t\t%d\n\
		Skilll 1 Veh\t\t%d\nSkill 2 Veh\t\t%d\nSkill 3 Veh\t\t%d\nSkill 4 Veh\t\t%d\nSkill 5 Veh\t\t%d\nSkill 6 Veh\t\t%d\nJob Bonus\t\t%d%%",
	JobInfo[job][jName], JobInfo[job][jLevel], JobInfo[job][jLegal], JobInfo[job][jSkill1Veh], JobInfo[job][jSkill2Veh], JobInfo[job][jSkill3Veh], JobInfo[job][jSkill4Veh],
	JobInfo[job][jSkill5Veh], JobInfo[job][jSkill6Veh], JobInfo[job][jBonus]);
	format(szTitle, sizeof(szTitle), "Edit job %d", job);
	Dialog_Show(playerid, DIALOG_EDITJOB, DIALOG_STYLE_TABLIST, szTitle, szDialog, "Ok", "Exit");
	EditJobID[playerid] = job;
	return 1;

}

CMD:setleader(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 4) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new id,level,string[180];
	if(sscanf(params, "ui",id,level)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/setleader <playerid/name> <faction>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	if(!(0 < level < (facs+1))) return SendClientMessage(playerid, COLOR_WHITE, "Invalid ID. (1-15).");
	// if(id == playerid) return SendClientMessage(playerid, -1, "[hmh] dc faci abuz?");
	
	if(PlayerInfo[id][pMember] > 0 && PlayerInfo[id][pLeader] > 0) return SendClientMessage(playerid,COLOR_WHITE, "Nguoi choi nay da o trong mot to chuc.");
	format(string, sizeof(string), "%s da tro thanh lanh dao moi cua to chuc.", GetName(id));
	SendFactionMessage(level, COLOR_CLIENT, string);
	
	new ftext[50]; //chu y
	format(ftext, sizeof(ftext), FactionName(level));
	PlayerInfo[id][pMember] = level;
	
	// if(PlayerInfo[playerid][pMember] == 11) finishAchievement(id, 29);	
	// else if(IsACop(playerid)) finishAchievement(id, 30);	
	// else if(IsAMember(playerid)) finishAchievement(id, 31);	
	// else finishAchievement(id, 28);	
	
	
	PlayerInfo[id][pLeader] = level;
	FactionMembers[PlayerInfo[id][pMember]] ++;
	if(level == 0) { PlayerInfo[id][pChar] = 0; }
	else if(level == 1) { PlayerInfo[id][pChar] = 265; } //Police Departament
	else if(level == 2) { PlayerInfo[id][pChar] = 295; } //FBI
	else if(level == 3) { PlayerInfo[id][pChar] = 179; } //National Guard
	else if(level == 4) { PlayerInfo[id][pChar] = 270; } //Triad
	else if(level == 5) { PlayerInfo[id][pChar] = 292; } //Los Vagos
	else if(level == 6) { PlayerInfo[id][pChar] = 273; } //Ballas
	else if(level == 7) { PlayerInfo[id][pChar] = 258; } //School Instructors
	else if(level == 8) { PlayerInfo[id][pChar] = 59; } //Tow Car Company
	else if(level == 9) { PlayerInfo[id][pChar] = 228; } //News Reporters
	else if(level == 10) { PlayerInfo[id][pChar] = 296; } //Los Aztecas
	else if(level == 11) { PlayerInfo[id][pChar] = 294; } //Hitman
	else if(level == 12) { PlayerInfo[id][pChar] = 272; } //School Instructors
	else if(level == 13) { PlayerInfo[id][pChar] = 70; } //Paramedic
	else if(level == 14) { PlayerInfo[id][pChar] = 123; } //Da Nang Boys
	else if(level == 15) { PlayerInfo[id][pChar] = 265; } //LVPD

	if(IsACop(id)) SetPlayerSkinEx(id, 305);
	else SetPlayerSkinEx(id, PlayerInfo[id][pChar]);					
	PlayerInfo[id][pRank] = 7;
	SetPlayerToTeamColor(id);

	new query[256];
	format(string, sizeof(string), "%s da tro thanh lanh dao moi cua to chuc %s.", GetName(id), ftext);
	
	if(PlayerInfo[id][pAdmin] < 6) {
		mysql_format(SQL, query, sizeof(query), "INSERT INTO faction_logs (`text`, `player`,`leader`) VALUES ('%s','%d','%d')", string, PlayerInfo[id][pSQLID],PlayerInfo[playerid][pSQLID]);
		mysql_tquery(SQL,query,"","");			
	}
	
	format(query,sizeof(query),"UPDATE users SET `Leader`='%d',`Member`='%d',`Rank`='7',`Team`='%d',`CChar`='%d' WHERE `ID`='%d'",PlayerInfo[id][pLeader],PlayerInfo[id][pMember],PlayerInfo[id][pTeam],PlayerInfo[id][pChar],PlayerInfo[id][pSQLID]);
	mysql_query(SQL,query);	
	format(string, sizeof(string), "Ban da set %s tro thanh lanh dao cua to chuc %s.", GetName(id),ftext);
	SendClientMessage(playerid, COLOR_LIGHTBLUE, string);	
	
	format(string, sizeof(string), "Admin %s da set ban tro thanh lanh dao cua to chuc %s.", GetName(playerid),ftext);
	SendClientMessage(id, COLOR_LIGHTBLUE, string);		
	return 1;
}
CMD:acc(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	foreach(new i: Player) {
		if(PlayerInfo[i][pAdmin] != 0) {
			for( new j = 0; j <= 100; j++) SendClientMessage(i, COLOR_WHITE, " ");
		}
	}
	new string[100];
	format(string, sizeof(string), "[{B81616}AdmWarning{FFFFFF}]: %s xoa chat log admin.",GetName(playerid));
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(-1, string,1);
	return 1;
}
CMD:givepp(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new id[32],title[64], szDialog[512];
	if(sscanf(params, "s[32]",id)) return SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/givepp <name>");
	new cont = MySQLCheckAccount(id);
	if(cont == 0) return SendClientMessage(playerid, COLOR_LGREEN, "[ERROR] Khong the tim thay tai khoan nay trong co so du lieu!");
	format(title, sizeof(title), "{FFE100}Give premium points: %s", id);
	
	strcat(szDialog, "Vat pham\tSo luong\n");
	strcat(szDialog, "1 euro\t+200PP\n");
	strcat(szDialog, "5 euro\t+1008PP\n");
	strcat(szDialog, "10 euro\t+2040PP\n");
	strcat(szDialog, "15 euro\t+3090PP\n");
	strcat(szDialog, "20 euro\t+4180PP\n");
	strcat(szDialog, "30 euro\t+6360PP\n");
	strcat(szDialog, "40 euro\t+8600PP\n");
	strcat(szDialog, "50 euro\t+10900PP\n");
	strcat(szDialog, "100 euro\t+22500PP\n");

	Dialog_Show(playerid, DIALOG_GIVEPP, DIALOG_STYLE_TABLIST_HEADERS, title, szDialog, "Select", "Exit");
	
	SetPVarString(playerid, "playerName", id);
	return 1;
}
CMD:addsafezone(playerid, params[]) {
	/*new range, string[180], Float: Pos[3];
    if(PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, COLOR_WHITE, "Ban khong the su dung lenh nay!");
	if(sscanf(params, "i", range)) return SendClientMessage(playerid, COLOR_RED, "Cu phap: {FFFFFF}/addsafezone <khoang cach>");
	if(range < 15) return SendClientMessage(playerid, -1, "ERROR: Range khong hop le. (it nhat 15m)");
	GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
    mysql_format(SQL, string, sizeof(string), "INSERT INTO `safezones` (`X`, `Y`, `Z`, `Range`) VALUES ('%f', '%f', '%f', '%d')", Pos[0], Pos[1], Pos[2], range);
	new Cache: result = mysql_query(SQL, string);
	new i = cache_insert_id();
	SafeZone[i][szX] = Pos[0];
	SafeZone[i][szY] = Pos[1];
	SafeZone[i][szZ] = Pos[2];
	SafeZone[i][szRange] = range;
	sfz++;
	cache_delete(result);
	SendClientMessage(playerid, COLOR_GOLD, "Khu an toan nay da duoc them thanh cong vao co so du lieu.");
	format(string, sizeof(string), "Thong tin ID %d, Toa do (%f, %f, %f), khoang cach %d.", i, Pos[0], Pos[1], Pos[2], range);
	SendClientMessage(playerid, COLOR_GOLD, string);*/
	if(PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, COLOR_WHITE, "Ban khong the su dung lenh nay!");
	SendClientMessage(playerid, COLOR_GOLD, "VUI LONG KHONG SU DUNG LENH NAY.");
	return 1;
}
CMD:editsafezone(playerid, params[]) {
	/*new szDialog[1024], szDialog2[1024];
	new szZone[128];
    if(PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	for(new i = 0; i < MAX_SAFEZONES; i++) {
		if(SafeZone[i][szRange] >= 15) {
			GetPlayer3DZone2(SafeZone[i][szX], SafeZone[i][szY], SafeZone[i][szZ], szZone, sizeof(szZone));
			format(szDialog, sizeof(szDialog), "%d. %s\n", i, szZone);
			strcat(szDialog2, szDialog);
		}
	}
	Dialog_Show(playerid, DIALOG_EDITSF, DIALOG_STYLE_TABLIST, "Khu an toan:", szDialog2, "Chon", "Huy bo");*/
	if(PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, COLOR_WHITE, "Ban khong the su dung lenh nay!");
	SendClientMessage(playerid, COLOR_GOLD, "VUI LONG KHONG SU DUNG LENH NAY.");
	return 1;
}
CMD:gotoquest(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 6) return 1;
	new id;
	if(sscanf(params, "i", id)) return SendClientMessage(playerid, COLOR_LGREEN, "/gotoquest <id>");
	if(id < 0 || id > 100) return 1;
	id --;
	SetPlayerPosEx(playerid, QuestPos[id][0], QuestPos[id][1], QuestPos[id][2]);
	return 1;
}
CMD:checkspawncar(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new string[64];
	for(new i = 1; i < MAX_VEHICLES; i++) {
		if(Carspawn[i] != 0)  {
			format(string, sizeof(string), "Car ID: %d",Carspawn[i]);
			SendClientMessage(playerid,COLOR_WHITE,string);
		}
	}
	return 1;
}
CMD:setstat(playerid, params[]) {
	new valoare, item[50], userid, id[64], query[256], string[180];
	if(PlayerInfo[playerid][pAdmin] < 7) return 1;
	if(sscanf(params, "s[64]s[50]i", id, item, valoare)) {
		SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/setstat <ten day du> <item> <amount>");
		SendClientMessage(playerid, COLOR_WHITE, "Level, Money, Bank, House, Bizz, Job, Hours, Premium (ngay), PremiumPoints, GangPoints.");
		SendClientMessage(playerid, COLOR_WHITE, "Rob, Mats, Drugs, Member, Leader, Rank, Fwarn, Warn, FPunish, Phone, Vip, Crates.");
		SendClientMessage(playerid, COLOR_WHITE, "Slot1-10, Vip, Clan, ClanRank, Admin, Helper, Escape, RP (kinh nghiem), chip.");
		return 1;
	}	
	if(IsNumeric(id)) {
		if(IsPlayerConnected(strval(id))) {
			//format(id, 64, "%s" GetName(id));
		}	
		else SendClientMessage(playerid, COLOR_GREY, "Nguoi choi khong ket noi!");
	}
	new cont = MySQLCheckAccount(id);
	if(cont == 0) return SendClientMessage(playerid, COLOR_GREY, "Ten nay khong duoc tim thay tren co so du lieu!");	
	userid = GetPlayerID(id);

	if(userid != INVALID_PLAYER_ID) format(string, sizeof(string), "[/set]: %s's %s da duoc set thanh %d boi admin %s.", GetName(userid), item, valoare, GetName(playerid));	
	else format(string, sizeof(string), "[/set]: %s's %s da duoc set thanh %d boi admin %s.", id, item, valoare, GetName(playerid));
	SendAdminMessage(0xE8B056FF, string, 6);

	if(strcmp(item, "level", true) == 0) {
		if(userid != INVALID_PLAYER_ID) PlayerInfo[userid][pLevel] = valoare, SetPlayerScore(userid, valoare), UpdateProgress(userid, 0);
		mysql_format(SQL, string, sizeof(string), "UPDATE users SET `Level`='%d' WHERE `name`='%s' LIMIT 1", valoare, id);
		mysql_tquery(SQL, string, "", "");
		format(string, sizeof(string), "SQL: UPDATE users SET `Level`='%d' WHERE `name`='%s' LIMIT 1", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	}	
	else if(strcmp(item, "chip", true) == 0) {
		if(userid != INVALID_PLAYER_ID) PlayerInfo[userid][pCasinoChip] = valoare;
		mysql_format(SQL, string, sizeof(string), "UPDATE users SET `CasinoChip`='%d' WHERE `name`='%s' LIMIT 1", valoare, id);
		mysql_tquery(SQL, string, "", "");
		format(string, sizeof(string), "SQL: UPDATE users SET `CasinoChip`='%d' WHERE `name`='%s' LIMIT 1", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	}			
	else if(strcmp(item, "GangPoints", true) == 0) {
		if(userid != INVALID_PLAYER_ID) PlayerInfo[userid][pGangPoints] = valoare;
		mysql_format(SQL, string, sizeof(string), "UPDATE users SET `GangPoints`='%d' WHERE `name`='%s' LIMIT 1", valoare, id);
		mysql_tquery(SQL, string, "", "");
		format(string, sizeof(string), "SQL: UPDATE users SET `GangPoints`='%d' WHERE `name`='%s' LIMIT 1", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	}
	else if(strcmp(item, "Crates", true) == 0) {
		if(userid != INVALID_PLAYER_ID) PlayerInfo[userid][pCrates] = valoare;
		mysql_format(SQL, string, sizeof(string), "UPDATE users SET `Crates`='%d' WHERE `name`='%s' LIMIT 1", valoare, id);
		mysql_tquery(SQL, string, "", "");
		format(string, sizeof(string), "SQL: UPDATE users SET `Crates`='%d' WHERE `name`='%s' LIMIT 1", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	}
	else if(strcmp(item, "slot1", true) == 0) {
		if(userid != INVALID_PLAYER_ID) {
			PlayerInfo[userid][pCarKey][0] = valoare;
			if(valoare > 0) {
				format(CarInfo[valoare][cOwner], 256, GetName(userid));
				CarInfo[valoare][Userid] = PlayerInfo[userid][pSQLID];	
				format(query, sizeof(query), "UPDATE `cars` SET `Userid`='%d', `Name`='%s' WHERE `ID`='%d'", PlayerInfo[userid][pSQLID], GetName(userid), PlayerInfo[userid][pCarKey][0]);
				mysql_query(SQL, query);
			}	
		}
		mysql_format(SQL, string, sizeof(string), "UPDATE users SET CarKey1='%d' WHERE `name`='%s' LIMIT 1", valoare, id);
		mysql_tquery(SQL, string, "", "");
		format(string, sizeof(string), "SQL: UPDATE users SET CarKey1='%d' WHERE `name`='%s' LIMIT 1", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	}
	else if(strcmp(item, "slot2", true) == 0) {
		if(userid != INVALID_PLAYER_ID) {
			PlayerInfo[userid][pCarKey][1] = valoare;
			if(valoare > 0) {
				format(CarInfo[valoare][cOwner], 256, GetName(userid));
				CarInfo[valoare][Userid] = PlayerInfo[userid][pSQLID];	
				format(query, sizeof(query), "UPDATE `cars` SET `Userid`='%d', `Name`='%s' WHERE `ID`='%d'", PlayerInfo[userid][pSQLID], GetName(userid), PlayerInfo[userid][pCarKey][0]);
				mysql_query(SQL, query);
			}				
		}						
		mysql_format(SQL, string, sizeof(string), "UPDATE users SET CarKey2='%d' WHERE `name`='%s' LIMIT 1", valoare, id);
		mysql_tquery(SQL, string, "", "");
		format(string, sizeof(string), "SQL: UPDATE users SET CarKey2='%d' WHERE `name`='%s' LIMIT 1", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	}
	else if(strcmp(item, "slot3", true) == 0) {
		if(userid != INVALID_PLAYER_ID) {
			PlayerInfo[userid][pCarKey][2] = valoare;
			if(valoare > 0) {
				format(CarInfo[valoare][cOwner], 256, GetName(userid));
				CarInfo[valoare][Userid] = PlayerInfo[userid][pSQLID];	
				format(query, sizeof(query), "UPDATE `cars` SET `Userid`='%d', `Name`='%s' WHERE `ID`='%d'", PlayerInfo[userid][pSQLID], GetName(userid), PlayerInfo[userid][pCarKey][0]);
				mysql_query(SQL, query);
			}	
		}	
		mysql_format(SQL, string, sizeof(string), "UPDATE users SET CarKey3='%d' WHERE `name`='%s' LIMIT 1", valoare, id);
		mysql_tquery(SQL, string, "", "");
		format(string, sizeof(string), "SQL: UPDATE users SET CarKey3='%d' WHERE `name`='%s' LIMIT 1", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	}
	else if(strcmp(item, "slot4", true) == 0) {
		if(userid != INVALID_PLAYER_ID) {
			PlayerInfo[userid][pCarKey][3] = valoare;
			if(valoare > 0) {
				format(CarInfo[valoare][cOwner], 256, GetName(userid));
				CarInfo[valoare][Userid] = PlayerInfo[userid][pSQLID];	
				format(query, sizeof(query), "UPDATE `cars` SET `Userid`='%d', `Name`='%s' WHERE `ID`='%d'", PlayerInfo[userid][pSQLID], GetName(userid), PlayerInfo[userid][pCarKey][0]);
				mysql_query(SQL, query);
			}	
		}	
		mysql_format(SQL, string, sizeof(string), "UPDATE users SET CarKey4='%d' WHERE `name`='%s' LIMIT 1", valoare, id);
		mysql_tquery(SQL, string, "", "");
		format(string, sizeof(string), "SQL: UPDATE users SET CarKey4='%d' WHERE `name`='%s' LIMIT 1", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	}
	else if(strcmp(item, "slot5", true) == 0) {
		if(userid != INVALID_PLAYER_ID) {
			PlayerInfo[userid][pCarKey][4] = valoare;
			if(valoare > 0) {
				format(CarInfo[valoare][cOwner], 256, GetName(userid));
				CarInfo[valoare][Userid] = PlayerInfo[userid][pSQLID];	
				format(query, sizeof(query), "UPDATE `cars` SET `Userid`='%d', `Name`='%s' WHERE `ID`='%d'", PlayerInfo[userid][pSQLID], GetName(userid), PlayerInfo[userid][pCarKey][0]);
				mysql_query(SQL, query);
			}	
		}	
		mysql_format(SQL, string, sizeof(string), "UPDATE users SET CarKey5='%d' WHERE `name`='%s' LIMIT 1", valoare, id);
		mysql_tquery(SQL, string, "", "");
		format(string, sizeof(string), "SQL: UPDATE users SET CarKey5='%d' WHERE `name`='%s' LIMIT 1", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	}
	else if(strcmp(item, "slot6", true) == 0) {
		if(userid != INVALID_PLAYER_ID) {
			PlayerInfo[userid][pCarKey][5] = valoare;
			if(valoare > 0) {
				format(CarInfo[valoare][cOwner], 256, GetName(userid));
				CarInfo[valoare][Userid] = PlayerInfo[userid][pSQLID];	
				format(query, sizeof(query), "UPDATE `cars` SET `Userid`='%d', `Name`='%s' WHERE `ID`='%d'", PlayerInfo[userid][pSQLID], GetName(userid), PlayerInfo[userid][pCarKey][0]);
				mysql_query(SQL, query);
			}	
		}
		mysql_format(SQL, string, sizeof(string), "UPDATE users SET CarKey6='%d' WHERE `name`='%s' LIMIT 1", valoare, id);
		mysql_tquery(SQL, string, "", "");
		format(string, sizeof(string), "SQL: UPDATE users SET CarKey6='%d' WHERE `name`='%s' LIMIT 1", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	}	
	else if(strcmp(item, "slot7", true) == 0) {
		if(userid != INVALID_PLAYER_ID) {
			PlayerInfo[userid][pCarKey][6] = valoare;
			if(valoare > 0) {
				format(CarInfo[valoare][cOwner], 256, GetName(userid));
				CarInfo[valoare][Userid] = PlayerInfo[userid][pSQLID];	
				format(query, sizeof(query), "UPDATE `cars` SET `Userid`='%d', `Name`='%s' WHERE `ID`='%d'", PlayerInfo[userid][pSQLID], GetName(userid), PlayerInfo[userid][pCarKey][0]);
				mysql_query(SQL, query);
			}	
		}	
		mysql_format(SQL, string, sizeof(string), "UPDATE users SET CarKey7='%d' WHERE `name`='%s' LIMIT 1", valoare, id);
		mysql_tquery(SQL, string, "", "");
		format(string, sizeof(string), "SQL: UPDATE users SET CarKey7='%d' WHERE `name`='%s' LIMIT 1", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	}
	else if(strcmp(item, "slot8", true) == 0) {
		if(userid != INVALID_PLAYER_ID) {
			PlayerInfo[userid][pCarKey][7] = valoare;
			if(valoare > 0) {
				format(CarInfo[valoare][cOwner], 256, GetName(userid));
				CarInfo[valoare][Userid] = PlayerInfo[userid][pSQLID];	
				format(query, sizeof(query), "UPDATE `cars` SET `Userid`='%d', `Name`='%s' WHERE `ID`='%d'", PlayerInfo[userid][pSQLID], GetName(userid), PlayerInfo[userid][pCarKey][0]);
				mysql_query(SQL, query);
			}	
		}
		mysql_format(SQL, string, sizeof(string), "UPDATE users SET CarKey8='%d' WHERE `name`='%s' LIMIT 1", valoare, id);
		mysql_tquery(SQL, string, "", "");
		format(string, sizeof(string), "SQL: UPDATE users SET CarKey8='%d' WHERE `name`='%s' LIMIT 1", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	}
	else if(strcmp(item, "slot9", true) == 0) {
		if(userid != INVALID_PLAYER_ID) {
			PlayerInfo[userid][pCarKey][8] = valoare;
			if(valoare > 0) {
				format(CarInfo[valoare][cOwner], 256, GetName(userid));
				CarInfo[valoare][Userid] = PlayerInfo[userid][pSQLID];	
				format(query, sizeof(query), "UPDATE `cars` SET `Userid`='%d', `Name`='%s' WHERE `ID`='%d'", PlayerInfo[userid][pSQLID], GetName(userid), PlayerInfo[userid][pCarKey][0]);
				mysql_query(SQL, query);
			}	
		}	
		mysql_format(SQL, string, sizeof(string), "UPDATE users SET CarKey9='%d' WHERE `name`='%s' LIMIT 1", valoare, id);
		mysql_tquery(SQL, string, "", "");
		format(string, sizeof(string), "SQL: UPDATE users SET CarKey9='%d' WHERE `name`='%s' LIMIT 1", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	}	
	else if(strcmp(item, "slot10", true) == 0) {
		if(userid != INVALID_PLAYER_ID) {
			PlayerInfo[userid][pCarKey][9] = valoare;
			if(valoare > 0) {
				format(CarInfo[valoare][cOwner], 256, GetName(userid));
				CarInfo[valoare][Userid] = PlayerInfo[userid][pSQLID];	
				format(query, sizeof(query), "UPDATE `cars` SET `Userid`='%d', `Name`='%s' WHERE `ID`='%d'", PlayerInfo[userid][pSQLID], GetName(userid), PlayerInfo[userid][pCarKey][0]);
				mysql_query(SQL, query);
			}	
		}
		mysql_format(SQL, string, sizeof(string), "UPDATE users SET CarKey10='%d' WHERE `name`='%s' LIMIT 1", valoare, id);
		mysql_tquery(SQL, string, "", "");
		format(string, sizeof(string), "SQL: UPDATE users SET CarKey10='%d' WHERE `name`='%s' LIMIT 1", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	}
	else if(strcmp(item, "admin", true) == 0) {
		if(valoare < 0 || valoare > 6) return SendClientMessage(playerid, COLOR_GREY, "Level admin khong hop le! (0-6)");
		if(userid != INVALID_PLAYER_ID) PlayerInfo[userid][pAdmin] = valoare;		
		format(query, sizeof(query), "UPDATE `users` SET `Admin`='%d' WHERE `name`='%s'", valoare, id);
		mysql_query(SQL, query);
		format(string, sizeof(string), "SQL: UPDATE `users` SET `Admin`='%d' WHERE `name`='%s'", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	}	
	else if(strcmp(item, "helper", true) == 0) {
		if(valoare < 0 || valoare > 3) return SendClientMessage(playerid, COLOR_GREY, "Level helper khong hop le! (0-3)");
		if(userid != INVALID_PLAYER_ID) PlayerInfo[userid][pHelper] = valoare;
		format(query, sizeof(query), "UPDATE `users` SET `Helper`='%d' WHERE `name`='%s'", valoare, id);
		mysql_query(SQL, query);
		format(string, sizeof(string), "SQL: UPDATE `users` SET `Helper`='%d' WHERE `name`='%s'", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	}		
	else if(strcmp(item, "money", true) == 0) {
		if(userid != INVALID_PLAYER_ID) Cash[userid] = valoare;
		format(query, sizeof(query), "UPDATE `users` SET `Money`='%d' WHERE `name`='%s'", valoare, id);
		mysql_query(SQL, query);
		format(string, sizeof(string), "SQL: UPDATE `users` SET `Money`='%d' WHERE `name`='%s'", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	}
	else if(strcmp(item, "bank", true) == 0) {
		if(userid != INVALID_PLAYER_ID) PlayerInfo[userid][pAccount] = valoare;
		format(query, sizeof(query), "UPDATE `users` SET `Bank`='%d' WHERE `name`='%s'", valoare, id);
		mysql_query(SQL, query);
		format(string, sizeof(string), "SQL: UPDATE `users` SET `Bank`='%d' WHERE `name`='%s'", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	}
	else if(strcmp(item, "house", true) == 0) {
		if(userid != INVALID_PLAYER_ID) PlayerInfo[userid][pHouse] = valoare;
		format(query, sizeof(query), "UPDATE `users` SET `House`='%d' WHERE `name`='%s'", valoare, id);
		mysql_query(SQL, query);
		format(string, sizeof(string), "SQL: UPDATE `users` SET `House`='%d' WHERE `name`='%s'", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	}
	else if(strcmp(item, "rp", true) == 0) {
		if(userid != INVALID_PLAYER_ID) PlayerInfo[userid][pExp] = valoare, UpdateProgress(userid, 0);
		format(query, sizeof(query), "UPDATE `users` SET `Respect`='%d' WHERE `name`='%s'", valoare, id);
		mysql_query(SQL, query);
		format(string, sizeof(string), "SQL: UPDATE `users` SET `Respect`='%d' WHERE `name`='%s'", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	}	
	else if(strcmp(item, "bizz", true) == 0) {
		if(userid != INVALID_PLAYER_ID) PlayerInfo[userid][pBizz] = valoare;
		format(query, sizeof(query), "UPDATE `users` SET `Bizz`='%d' WHERE `name`='%s'", valoare, id);
		mysql_query(SQL, query);
		format(string, sizeof(string), "SQL: UPDATE `users` SET `Bizz`='%d' WHERE `name`='%s'", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	}
	else if(strcmp(item, "job", true) == 0) {
		PlayerInfo[userid][pJob] = valoare;
		format(query, sizeof(query), "UPDATE `users` SET `Job`='%d' WHERE `name`='%s'", valoare, id);
		mysql_query(SQL, query);
		format(string, sizeof(string), "SQL: UPDATE `users` SET `Job`='%d' WHERE `name`='%s'", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	}	
	else if(strcmp(item, "hours", true) == 0) {
		if(userid != INVALID_PLAYER_ID) PlayerInfo[userid][pConnectTime] = valoare;
		format(query, sizeof(query), "UPDATE `users` SET `ConnectedTime`='%0.3f' WHERE `name`='%s'", valoare, id);
		mysql_query(SQL, query);
		format(string, sizeof(string), "SQL: UPDATE `users` SET `ConnectedTime`='%0.3f' WHERE `name`='%s'", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	}
	else if(strcmp(item, "premiumpoints", true) == 0) {
		if(userid != INVALID_PLAYER_ID) PlayerInfo[userid][pPremiumPoints] = valoare;
		format(query, sizeof(query), "UPDATE `users` SET `PremiumPoints`='%d' WHERE `name`='%s'", valoare, id);
		mysql_query(SQL, query);
		format(string, sizeof(string), "SQL: UPDATE `users` SET `PremiumPoints`='%d' WHERE `name`='%s'", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	}
	else if(strcmp(item, "rob", true) == 0) {
		if(userid != INVALID_PLAYER_ID) PlayerInfo[userid][pRob] = valoare;
		format(query, sizeof(query), "UPDATE `users` SET `Rob`='%d' WHERE `name`='%s'", valoare, id);
		mysql_query(SQL, query);
		format(string, sizeof(string), "SQL: UPDATE `users` SET `Rob`='%d' WHERE `name`='%s'", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	}
	else if(strcmp(item, "escape", true) == 0) {
		if(userid != INVALID_PLAYER_ID) PlayerInfo[userid][pEscapePoints] = valoare;
		format(query, sizeof(query), "UPDATE `users` SET `EscapePoints`='%d' WHERE `name`='%s'", valoare, id);
		mysql_query(SQL, query);
		format(string, sizeof(string), "SQL: UPDATE `users` SET `EscapePoints`='%d' WHERE `name`='%s'", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	}
	else if(strcmp(item, "mats", true) == 0) {
		if(userid != INVALID_PLAYER_ID) PlayerInfo[userid][pMats] = valoare;	
		format(query, sizeof(query), "UPDATE `users` SET `Materials`='%d' WHERE `name`='%s'", valoare, id);
		mysql_query(SQL, query);
		format(string, sizeof(string), "SQL: UPDATE `users` SET `Materials`='%d' WHERE `name`='%s'", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	}		
	// else if(strcmp(item, "drugs", true) == 0) {
	// 	if(userid != INVALID_PLAYER_ID) PlayerInfo[userid][pDrugs] = valoare;	
	// 	format(query, sizeof(query), "UPDATE `users` SET `Drugs`='%d' WHERE `name`='%s'", valoare, id);
	// 	mysql_query(SQL, query);
	// 	format(string, sizeof(string), "SQL: UPDATE `users` SET `Drugs`='%d' WHERE `name`='%s'", valoare, id);
	// 	SendAdminMessage(COLOR_WARNING, string, 6);
	// }		
	else if(strcmp(item, "member", true) == 0) {
		if(userid != INVALID_PLAYER_ID) PlayerInfo[userid][pMember] = valoare, SetPlayerToTeamColor(userid);	
		format(query, sizeof(query), "UPDATE `users` SET `Member`='%d' WHERE `name`='%s'", valoare, id);
		mysql_query(SQL, query);
		format(string, sizeof(string), "SQL: UPDATE `users` SET `Member`='%d' WHERE `name`='%s'", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	}	
	else if(strcmp(item, "leader", true) == 0) {
		if(userid != INVALID_PLAYER_ID) PlayerInfo[userid][pLeader] = valoare, SetPlayerToTeamColor(userid);	
		format(query, sizeof(query), "UPDATE `users` SET `Leader`='%d' WHERE `name`='%s'", valoare, id);
		mysql_query(SQL, query);
		format(string, sizeof(string), "SQL: UPDATE `users` SET `Leader`='%d' WHERE `name`='%s'", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	}		
	else if(strcmp(item, "rank", true) == 0) {
		if(userid != INVALID_PLAYER_ID) PlayerInfo[userid][pRank] = valoare;	
		format(query, sizeof(query), "UPDATE `users` SET `Rank`='%d' WHERE `name`='%s'", valoare, id);
		mysql_query(SQL, query);
		format(string, sizeof(string), "SQL: UPDATE `users` SET `Rank`='%d' WHERE `name`='%s'", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	}		
	else if(strcmp(item, "fwarn", true) == 0) {
		if(userid != INVALID_PLAYER_ID) PlayerInfo[userid][pFACWarns] = valoare;	
		format(query, sizeof(query), "UPDATE `users` SET `FWarn`='%d' WHERE `name`='%s'", valoare, id);
		mysql_query(SQL, query);
		format(string, sizeof(string), "SQL: UPDATE `users` SET `FWarn`='%d' WHERE `name`='%s'", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	}		
	else if(strcmp(item, "warn", true) == 0) {
		if(userid != INVALID_PLAYER_ID) PlayerInfo[userid][pWarns] = valoare;	
		format(query, sizeof(query), "UPDATE `users` SET `Warnings`='%d' WHERE `name`='%s'", valoare, id);
		mysql_query(SQL, query);
		format(string, sizeof(string), "SQL: UPDATE `users` SET `Warnings`='%d' WHERE `name`='%s'", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	}		
	else if(strcmp(item, "fpunish", true) == 0) {
		if(userid != INVALID_PLAYER_ID) PlayerInfo[userid][pFpunish] = valoare;	
		format(query, sizeof(query), "UPDATE `users` SET `FPunish`='%d' WHERE `name`='%s'", valoare, id);
		mysql_query(SQL, query);
		format(string, sizeof(string), "SQL: UPDATE `users` SET `FPunish`='%d' WHERE `name`='%s'", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	}			
	else if(strcmp(item, "phone", true) == 0) {
		if(userid != INVALID_PLAYER_ID) PlayerInfo[userid][pPhone] = valoare;
		format(query, sizeof(query), "UPDATE `users` SET `PhoneNr`='%d' WHERE `name`='%s'", valoare, id);
		mysql_query(SQL, query);
		format(string, sizeof(string), "SQL: UPDATE `users` SET `PhoneNr`='%d' WHERE `name`='%s'", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);
	} 
	else if(strcmp(item, "vip", true) == 0) {
		if(userid != INVALID_PLAYER_ID) PlayerInfo[userid][pVip] = valoare;	
		format(query, sizeof(query), "UPDATE `users` SET `Vip`='%d' WHERE `name`='%s'", valoare, id);
		mysql_query(SQL, query);
		format(string, sizeof(string), "SQL: UPDATE `users` SET `Vip`='%d' WHERE `name`='%s'", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);	
	}
	else if(strcmp(item, "clan", true) == 0) {
		if(userid != INVALID_PLAYER_ID) PlayerInfo[userid][pClan] = valoare;	
		format(query, sizeof(query), "UPDATE `users` SET `Clan`='%d' WHERE `name`='%s'", valoare, id);
		mysql_query(SQL, query);
		format(string, sizeof(string), "SQL: UPDATE `users` SET `Clan`='%d' WHERE `name`='%s'", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);	
	}		
	else if(strcmp(item, "clanrank", true) == 0) {
		if(userid != INVALID_PLAYER_ID) PlayerInfo[userid][pClanRank] = valoare;	
		format(query, sizeof(query), "UPDATE `users` SET `ClanRank`='%d' WHERE `name`='%s'", valoare, id);
		mysql_query(SQL, query);
		format(string, sizeof(string), "SQL: UPDATE `users` SET `ClanRank`='%d' WHERE `name`='%s'", valoare, id);
		SendAdminMessage(COLOR_WARNING, string, 6);	
	}		
	else {
		SendClientMessage(playerid, COLOR_WHITE, "Level, Money, Bank, House, Bizz, Job, Hours, Premium, PremiumPoints.");
		SendClientMessage(playerid, COLOR_WHITE, "Rob, Mats, Drugs, Member, Leader, Rank, Fwarn, Warn, FPunish, Phone.");
		SendClientMessage(playerid, COLOR_WHITE, "Slot1-10, Vip, Clan, ClanRank, Admin, Helper, Escape, chip.");	
		return 1;
	}
	return 1;
}	
CMD:setadmin(playerid, params[]) {
	new id,adminlevel,string[200],reason[64];
	if(PlayerInfo[playerid][pAdmin] < 6) return 1;
	if(sscanf(params, "uis[64]",id,adminlevel,reason)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/setadmin <playerid/name> <Admin Level> <Reason>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong dang nhap.");
	if(adminlevel < 0 || adminlevel > 6) return SendClientMessage(playerid, COLOR_GREY, "Level admin khong hop le! (0-6)");
	if(PlayerInfo[id][pAdmin] > PlayerInfo[playerid][pAdmin]) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the dung lenh nay tren nguoi choi do!");

	format(string, sizeof(string), "Ban da duoc thiet lap tro thanh level %d admin by %s, Li do: %s", adminlevel, GetName(playerid),reason);
	SendClientMessage(id, COLOR_YELLOW, string);
	format(string, sizeof(string), "Ban da thiet lap %s tro thanh level %d admin.", GetName(id),adminlevel);
	SendClientMessage(playerid, -1, string);
	format(string, sizeof(string), "%s da thiet lap %s tro thanh level %d admin, Li do: %s", GetName(playerid),GetName(id),adminlevel,reason);
	if(GetPVarInt(playerid, "Cover") == 0) SendStaffMessage(COLOR_YELLOW, string);
	
	if(adminlevel == 0) {
		PlayerInfo[id][pAW] = 0;
		UpdateVar(id, "AW", 0);	
		SpecFaction[id] = 0;
		StopFly(id);
		UsedFly[id] = 0;
		SetPlayerHealthEx(id, 99);
		SendClientMessage(id, 0xFFADADFF, "Fly mode off.");
		Iter_Remove(PlayerAdmins, id);
	}
	else {
		// finishAchievement(id, 27);
		Iter_Add(PlayerAdmins, id);
	}
	PlayerInfo[id][pAdmin] = adminlevel;
	
	new query[180];
	format(query,sizeof(query),"UPDATE users SET `Admin`='%d' WHERE `ID`='%d'",adminlevel,PlayerInfo[id][pSQLID]);
	mysql_query(SQL,query);
	return 1;
}
CMD:server(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, COLOR_LGREEN, AdminOnly);
	Dialog_Show(playerid, DIALOG_SERVER, DIALOG_STYLE_LIST, "Server menu", 
		"Unban tat ca nguoi choi\nKhoi dong lai Payday\nBao tri may chu\nDat mat khau may chu\nThay doi ten may chu\nXoa cac nha khong hoat dong\nXoa cac biz khong hoat dong\nReset Quest",
		"Ok", "Exit");		
	return 1;
}
CMD:givehouse(playerid, params[]) {
	new house, id, query[256], string[180];
	if(PlayerInfo[playerid][pAdmin] < 6) return 1;
	if(sscanf(params, "ud", id, house)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/givehouse <playerid/name> <house id>");
	format(query, sizeof(query), "UPDATE `users` SET `House`='999' WHERE `House`='%d'", id);
	mysql_query(SQL, query);
	PlayerInfo[id][pHouse] = house;
	format(query, sizeof(query), "UPDATE `users` SET `House`='%d' WHERE `ID`='%d'", house, PlayerInfo[id][pSQLID]);
	mysql_query(SQL, query);	
	format(string, sizeof(string), "AdmCmd: %s da gui cho %s(%d) House %d.", GetName(playerid), GetName(id), id, house);
	SendAdminMessage(COLOR_LOGS, string, 1);
	format(string, sizeof(string), "Administrator %s da gui cho ban House %d.", GetName(playerid), house);
	SendClientMessage(id, COLOR_YELLOW, string);
	HouseInfo[house][hOwned] = 1;
	format(HouseInfo[house][hOwner], 256, GetName(id));
	HouseInfo[house][hValue] = 0;
	OnPropTextdrawUpdate(1, house);
	format(query, sizeof(query), "UPDATE `houses` SET `Owned`='1', `Owner`='%s', `Value`='0' WHERE `ID`='%d'", GetName(id), house);
	mysql_query(SQL, query);	
	return 1;
}	
CMD:givebiz(playerid, params[]) {
	new biz, id, query[256], string[180];
	if(PlayerInfo[playerid][pAdmin] < 6) return 1;
	if(sscanf(params, "ud", id, biz)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/givebiz <playerid/name> <biz id>");
	format(query, sizeof(query), "UPDATE `users` SET `Bizz`='255' WHERE `Bizz`='%d'", id);
	mysql_query(SQL, query);
	PlayerInfo[id][pBizz] = biz;
	format(query, sizeof(query), "UPDATE `users` SET `Bizz`='%d' WHERE `ID`='%d'", biz, PlayerInfo[id][pSQLID]);
	mysql_query(SQL, query);	
	format(string, sizeof(string), "AdmCmd: %s da gui cho %s(%d) bizz %d.", GetName(playerid), GetName(id), id, biz);
	SendAdminMessage(COLOR_LOGS, string, 1);
	format(string, sizeof(string), "Administrator %s da gui cho ban bizz %d.", GetName(playerid), biz);
	SendClientMessage(id, COLOR_YELLOW, string);
	BizzInfo[biz][bOwned] = 1;
	format(BizzInfo[biz][bOwner], 256, GetName(id));
	BizzInfo[biz][bBuyPrice] = 0;
	OnPropTextdrawUpdate(2, biz);
	format(query, sizeof(query), "UPDATE `bizz` SET `Owned`='1', `Owner`='%s', `BuyPrice`='0' WHERE `ID`='%d'", GetName(id), biz);
	mysql_query(SQL, query);	
	return 1;
}	
CMD:maxmember(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 6)
 	{
 		new fid,maxmembers,string[400];
 		if(sscanf(params, "dd",fid,maxmembers)) return SendClientMessage(playerid, 0xFFFFFFFF, "{FF9900}Su dung: {33CCFF}/maxmembers <FactionID> <Members>");
 		if(maxmembers > 4 && maxmembers <= 50)
 		{
 			if(fid > 0 && fid <= 15)
 			{
 				DynamicFactions[fid][fMaxSlot] = maxmembers;
 				mysql_format(SQL, string, sizeof(string), "UPDATE `factions` SET `Slots`='%d' WHERE `ID`='%d'",DynamicFactions[fid][fMaxSlot], fid);
				mysql_tquery(SQL,string,"","");
				format(string, sizeof(string), "To chuc %s - So luong thanh vien gioi han %d.",DynamicFactions[fid][fName], DynamicFactions[fid][fMaxSlot]);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			}
			else return SendClientMessage(playerid, COLOR_WHITE, "FactionID phai tu 1 and 15.");
		}
		else return SendClientMessage(playerid, COLOR_WHITE, "Max members phai tu 1 and 50.");
	}
	else
	{
 		SendClientMessage(playerid, COLOR_RED, AdminOnly);
	}
	return 1;
}
CMD:minlevel(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 6)
 	{
 		new fid,maxmembers,string[400];
 		if(sscanf(params, "dd",fid,maxmembers)) return SendClientMessage(playerid, 0xFFFFFFFF, "{FF9900}Su dung: {33CCFF}/minlevel <FactionID> <cap do nho nhat>");
 		if(maxmembers > 2)
 		{
 			if(fid > 0 && fid <= 15)
 			{
 				DynamicFactions[fid][fLevel] = maxmembers;
 				mysql_format(SQL, string, sizeof(string), "UPDATE `factions` SET `Level`='%d' WHERE `ID`='%d'",DynamicFactions[fid][fLevel], fid);
				mysql_tquery(SQL,string,"","");
				format(string, sizeof(string), "To chuc %s - Cap do nho nhat yeu cau: %d.",DynamicFactions[fid][fName], DynamicFactions[fid][fLevel]);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			}
			else return SendClientMessage(playerid, COLOR_WHITE, "FactionID phai tu 1 and 15.");
		}
		else return SendClientMessage(playerid, COLOR_WHITE, "Cap do nho nhat phai lon hon 2.");
	}
	else
	{
 		SendClientMessage(playerid, COLOR_RED, AdminOnly);
	}
	return 1;
}
CMD:setaw(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, COLOR_LGREEN, AdminOnly);
	new string[180], id, amount, reason[180];
	if(sscanf(params, "uis[180]", id, amount, reason)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/setaw <playerid/name> <amount/3> <ly do>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong ket noi!");
	if(PlayerInfo[id][pAdmin] == 0) return SendClientMessage(playerid, COLOR_GREY, "Acel player nu este admin!");
	if(PlayerInfo[id][pAdmin] > PlayerInfo[playerid][pAdmin]) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the dung lenh nay tren nguoi choi do!");
	if(amount > 3) return SendClientMessage(playerid, COLOR_GREY, "Invalid amount! (0-3)");
	if(strlen(reason) < 5) return SendClientMessage(playerid, COLOR_GREY, "Ly do qua ngan!");
	if(id == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren chinh minh!");
	PlayerInfo[id][pAW] = amount;
	UpdateVar(id, "AW", amount);
	format(string, sizeof(string), "AdmCmd: %s da set cho %s %d/3 admin warns, Li do: %s.", GetName(playerid), GetName(id), amount, reason);
	SendAdminMessage(COLOR_LOGS, string, 1);
	format(string, sizeof(string), "Administrator %s da set cho ban %d/3 admin warns, Li do: %s.", GetName(playerid), amount, reason);
	SendClientMessage(id, COLOR_LIGHTBLUE, string);
	if(amount == 3) {
		PlayerInfo[id][pAW] = 0;
		UpdateVar(id, "AW", 0);	
		PlayerInfo[id][pAdmin] = 0;
		SendClientMessage(id, COLOR_YELLOW, "Ban da mat chuc vu vi dat 3/3 warns.");
	}
	return 1;
}
CMD:movejob(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 6) return 1;
	new job, string[256], query[180], Float: Pos[3];
	if(sscanf(params, "i", job)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/movehouse <job id>");
	GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
	JobInfo[job][jPosX] = Pos[0];
	JobInfo[job][jPosY] = Pos[1];
	JobInfo[job][jPosZ] = Pos[2];
	DestroyDynamic3DTextLabel(JobInfo[job][jLabel]);
	DestroyDynamicPickup(JobInfo[job][jPickup]);
	format(string, sizeof(string), "{ffffff}ID: {AB0000}#%d{FFFFFF}\n{ffffff}Job: {AB0000}%s{FFFFFF}\nLevel: {AB0000}%d{FFFFFF}\n{FFFFFF}Bam {AB0000}Y{FFFFFF} de nhan cong viec.\n{FFFFFF}Bam {AB0000}N{FFFFFF} de thoat viec.", job, JobInfo[job][jName], JobInfo[job][jLevel]);
	JobInfo[job][jLabel] = CreateDynamic3DTextLabel(string, 0xFFFFFFFF, JobInfo[job][jPosX], JobInfo[job][jPosY], JobInfo[job][jPosZ], 25, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, -1, -1, -1, 100.0);
	JobInfo[job][jPickup] = CreateDynamicPickup(1275, 23, JobInfo[job][jPosX], JobInfo[job][jPosY], JobInfo[job][jPosZ], -1, -1, -1, 100.0);
	format(string, sizeof(string), "Cong viec %d da duoc dinh vi lai.", job);
	SendClientMessage(playerid, COLOR_WHITE, string);
	mysql_format(SQL, query, sizeof(query), "UPDATE `jobs` SET `PosX`='%f', `PosY`='%f', `PosZ`='%f' WHERE `ID`='%d'", Pos[0], Pos[1], Pos[2], job);
	mysql_tquery(SQL, query, "", "");
	return 1;	
}
CMD:movehouse(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 6) return 1;
	new house;
	if(sscanf(params, "i", house)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/movehouse <house id>");
	if(!Iter_Contains(House, house)) return SendClientMessage(playerid, COLOR_GREY, "Invalid house!");
	SetPVarInt(playerid, "MoveID", house);
	Dialog_Show(playerid, DIALOG_MOVEHOUSE, DIALOG_STYLE_LIST, "Move house", "Interior\nExterior", "Ok", "Exit");
	return 1;	
}
CMD:movebiz(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 6) return 1;
	new house;
	if(sscanf(params, "i", house)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/movebiz <biz id>");
	if(house < 1 || house > Iter_Count(Bizs)) return SendClientMessage(playerid, COLOR_GREY, "Invalid biz!");
	SetPVarInt(playerid, "MoveID", house);
	Dialog_Show(playerid, DIALOG_MOVEBIZ, DIALOG_STYLE_LIST, "Move biz", "Interior\nExterior", "Ok", "Exit");
	return 1;	
}
CMD:giftpointsall(playerid, params[]) {
    if(PlayerInfo[playerid][pAdmin] < 6) return 1;
	// if(SpecialWeek == 0) return SendClientMessage(playerid, COLOR_LGREEN, "Giftbox chua duoc kich hoat!");	
	mysql_query(SQL, "UPDATE `users` SET `GiftPoints`='3'");
	foreach(new i: Player)  {
		if(IsPlayerLogged[i] == 1) {
			PlayerInfo[i][pGiftPoints] = 3;
			SendClientMessage(i, COLOR_YELLOW, "Bay gio ban co the su dung (/getgift) vi mot admin da cung cap cho ban 3 diem giftbox");	
		}	
	}
	return 1;
}
CMD:editturf(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 6) return 1;
	new turf, name[64];
	if(sscanf(params, "is[64]", turf, name)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/editturf <turfid> <name>");
	if(turf < 1 || turf >= turfsss) return SendClientMessage(playerid, COLOR_WHITE, "Ban khong o tren mot dia ban!");
	new string[128], query[128];
	format(string, sizeof(string), "Ten cua turf %d da duoc thay doi thanh %s.", turf, name);
	SendAdminMessage(COLOR_YELLOW, string, 1);
	format(query, sizeof(query), "UPDATE `turfs` SET `Name`='%s' WHERE `ID`='%d'", name, turf);
	mysql_tquery(SQL, query, "", "");
	format(TurfInfo[turf][zName], 64, name);
	return 1;
}
CMD:editvehicle(playerid, params[])
{
	new vehicleid = GetPlayerVehicleID(playerid), string[256], szQuery[256], option[25], result;
	if(PlayerInfo[playerid][pAdmin] < 6) return 1;
	if(sscanf(params, "s[25]i", option, result)) {
		SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/editvehicle <option> <result>");
		SendClientMessage(playerid, COLOR_WHITE, "Avaiable: Model, Color1, Color2, Faction, Rank, Clan.");
		return 1;
	}
	if(!IsPlayerInAnyVehicle(playerid)) return 1;
	new dbid = GetVehicleID(vehicleid);
	if(ServerVehicles[dbid][vID] == 0) return SendClientMessage(playerid, COLOR_GREY, "Chiec xe nay khong nam trong co so du lieu.");
	if(strcmp(option, "model" , true) == 0) {
		if(result < 400 || result > 611) return SendClientMessage(playerid, COLOR_GREY, "Model xe khong hop le.");
		DestroyVehicle(vehicleid);
		CreateVehicle(result, ServerVehicles[dbid][vLocation][0], ServerVehicles[dbid][vLocation][1], ServerVehicles[dbid][vLocation][2], ServerVehicles[dbid][vAngle], ServerVehicles[dbid][vColor][0], ServerVehicles[dbid][vColor][1], -1);
		PutPlayerInVehicleEx(playerid, vehicleid, 0);
		ServerVehicles[dbid][vModel] = result;
		format(string, sizeof(string), "Ban da thay doi thanh cong model cua xe nay (vID: %d) tro thanh: %d.", vehicleid, result);
		SendClientMessage(playerid, COLOR_LGREEN, string);

		mysql_format(SQL, szQuery, sizeof(szQuery), "UPDATE `svehicles` SET `vModel` = '%d' WHERE `vID` = '%d'", result, dbid);
		mysql_query(SQL, szQuery);
	}
	if(strcmp(option, "color1" , true) == 0) {
		if(result < 0 || result > 256) return SendClientMessage(playerid, COLOR_GREY, "ID mau khong hop le.");
		ChangeVehicleColorEx(vehicleid, result, ServerVehicles[dbid][vColor][1]);
		ServerVehicles[dbid][vColor][0] = result;
		format(string, sizeof(string), "Ban da thay doi thanh cong mau cua xe nay (vID: %d) thanh: %d.", vehicleid, result);
		SendClientMessage(playerid, COLOR_LGREEN, string);

		mysql_format(SQL, szQuery, sizeof(szQuery), "UPDATE `svehicles` SET `Color1` = '%d' WHERE `vID` = '%d'", result, dbid);
		mysql_query(SQL, szQuery);
	}
	if(strcmp(option, "color2" , true) == 0) {
		if(result < 0 || result > 256) return SendClientMessage(playerid, COLOR_GREY, "ID mau khong hop le.");
		ChangeVehicleColorEx(vehicleid, ServerVehicles[dbid][vColor][0], result);
		ServerVehicles[dbid][vColor][1] = result;
		format(string, sizeof(string), "Ban da thay doi thanh cong mau cua xe nay (vID: %d) thanh: %d.", vehicleid, result);
		SendClientMessage(playerid, COLOR_LGREEN, string);

		mysql_format(SQL, szQuery, sizeof(szQuery), "UPDATE `svehicles` SET `Color2` = '%d' WHERE `vID` = '%d'", result, dbid);
		mysql_query(SQL, szQuery);
	}
	if(strcmp(option, "faction" , true) == 0) {
		ServerVehicles[dbid][vFaction] = result;
		format(string, sizeof(string), "Ban da thay doi thanh cong to chuc cua chiec xe nay (vID: %d) thanh: %d.", vehicleid, result);
		SendClientMessage(playerid, COLOR_LGREEN, string);

		mysql_format(SQL, szQuery, sizeof(szQuery), "UPDATE `svehicles` SET `Faction` = '%d' WHERE `vID` = '%d'", result, dbid);
		mysql_query(SQL, szQuery);
	}
	if(strcmp(option, "rank" , true) == 0) {
		ServerVehicles[dbid][vRank] = result;
		format(string, sizeof(string), "Ban da thay doi thanh cong rank cua chiec xe nay (vID: %d) thanh: %d.", vehicleid, result);
		SendClientMessage(playerid, COLOR_LGREEN, string);

		mysql_format(SQL, szQuery, sizeof(szQuery), "UPDATE `svehicles` SET `Rank` = '%d' WHERE `vID` = '%d'", result, dbid);
		mysql_query(SQL, szQuery);
	}
	if(strcmp(option, "clan" , true) == 0) {
		ServerVehicles[dbid][vClan] = result;
		format(string, sizeof(string), "Ban da thay doi thanh cong clan cua chiec xe nay (vID: %d) thanh: %d.", vehicleid, result);
		SendClientMessage(playerid, COLOR_LGREEN, string);

		if(result!=0) {
			if(GetCVehicles(result)==10) return Info(playerid, "Clan nay da co 10 xe!");
			ClanVehicles[result]++;
			if(!Iter_Contains(ClanVehicle, dbid)) Iter_Add(ClanVehicle, dbid);
		}
		else if(Iter_Contains(ClanVehicle, dbid)) {
			Iter_Remove(ClanVehicle, dbid);
			ClanVehicles[result]--;
		}
		mysql_format(SQL, szQuery, sizeof(szQuery), "UPDATE `svehicles` SET `Clan` = '%d' WHERE `vID` = '%d'", result, dbid);
		mysql_query(SQL, szQuery);
	}
	return 1;
}
CMD:vpark(playerid, params[])
{
    new carid = GetPlayerVehicleID(playerid), Float: Pos[3], Float: Angle, string[500], szQuery[256];
	if(PlayerInfo[playerid][pAdmin] < 6) return 1;
	if(!IsPlayerInAnyVehicle(playerid)) return 1;
	new dbid = GetVehicleID(carid);
	if(ServerVehicles[dbid][vID] == 0) return SendClientMessage(playerid, COLOR_GREY, "Chiec xe nay khong nam trong co so du lieu.");
	GetVehiclePos(carid, Pos[0], Pos[1], Pos[2]);
	GetVehicleZAngle(carid, Angle);
	ServerVehicles[dbid][vLocation][0] = Pos[0];
	ServerVehicles[dbid][vLocation][1] = Pos[1];
	ServerVehicles[dbid][vLocation][2] = Pos[2];
	ServerVehicles[dbid][vAngle] = Angle;
	DestroyVehicle(carid);
	ServerVehicles[dbid][vSpawned] = CreateVehicle(ServerVehicles[dbid][vModel], ServerVehicles[dbid][vLocation][0], ServerVehicles[dbid][vLocation][1], ServerVehicles[dbid][vLocation][2], ServerVehicles[dbid][vAngle], ServerVehicles[dbid][vColor][0], ServerVehicles[dbid][vColor][1], -1);
	ChangeVehicleColorEx(carid, ServerVehicles[dbid][vColor][0], ServerVehicles[dbid][vColor][1]);
	PutPlayerInVehicleEx(playerid, carid, 0);
	new plate[64];
	format(plate, sizeof(plate), "F%d %d", ServerVehicles[dbid][vFaction], ServerVehicles[dbid][vSpawned]);
	format(string, sizeof(string), "Vi tri cua chiec xe nay da duoc thay doi thanh cong (vID: %d).", carid);
	SendClientMessage(playerid, COLOR_LGREEN, string);
	mysql_format(SQL, szQuery, sizeof(szQuery), "UPDATE `svehicles` SET `LocationX` = '%f', `LocationY` = '%f', `LocationZ` = '%f', `Angle` = '%f' WHERE `vID` = '%d'", Pos[0], Pos[1], Pos[2], Angle, dbid);
	mysql_query(SQL, szQuery);
	return 1;
}
tin_getNumrow(const text[]) {
	new temp;
    mysql_query(SQL, text);
    temp = cache_num_rows();
	return temp;
}
CMD:createvehicle(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 6) return 1;
	new Float: Pos[3], Float: Angle, string[256], szQuery[500], modelid, color[2];
	if(sscanf(params, "iii", modelid, color[0], color[1])) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/createvehicle <model> <color1> <color2>");
	if(400 <= modelid >= 611) return SendClientMessage(playerid, COLOR_GREY, "Vehicle id khong hop le. (400 - 611)");
	if(!(0 <= color[0] <= 255 && 0 <= color[1] <= 255)) return SendClientMessage(playerid, COLOR_GREY, "Invalid color id. (0 - 255)");
	if(IsPlayerInAnyVehicle(playerid)) return 1;

	GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
	GetPlayerFacingAngle(playerid, Angle);
	new carid = tin_getNumrow("SELECT * FROM `svehicles`")+1;
	ServerVehicles[carid][vSpawned] = CreateVehicle(modelid, Pos[0], Pos[1], Pos[2], Angle, color[0], color[1], -1);
	SetVehicleNumberPlate(ServerVehicles[carid][vSpawned], "NewCar");
	PutPlayerInVehicleEx(playerid, ServerVehicles[carid][vSpawned], 0);
	ServerVehicles[carid][vID] = carid;
	ServerVehicles[carid][vModel] = modelid;
	ServerVehicles[carid][vLocation][0] = Pos[0];
	ServerVehicles[carid][vLocation][1] = Pos[1];
	ServerVehicles[carid][vLocation][2] = Pos[2];
	ServerVehicles[carid][vAngle] = Angle;
	ServerVehicles[carid][vColor][0] = color[0];
	ServerVehicles[carid][vColor][1] = color[1];

	mysql_format(SQL, szQuery, sizeof(szQuery),
	"INSERT INTO `svehicles` (vID, vModel, LocationX, LocationY, LocationZ, Angle, Color1, Color2) VALUES ('%d', '%d', '%f', '%f', '%f', '%f', '%d', '%d')", carid, modelid, Pos[0], Pos[1], Pos[2], ServerVehicles[carid][vAngle], color[0], color[1]);
	mysql_query(SQL, szQuery);
	format(string, sizeof(string), "Ban da tao thanh cong mot %s (vID: %d).", aVehicleNames[modelid - 400], carid);
	SendClientMessage(playerid, COLOR_LGREEN, string);
	format(string, sizeof(string), "Xe da duoc them vao co so du lieu thanh cong, tong so: %d (xe)!", tin_getNumrow("SELECT * FROM `svehicles`"));
	SendClientMessage(playerid, COLOR_LGREEN, string);
	SendClientMessage(playerid, COLOR_LGREEN, "Neu ban muon sua doi chiec xe nay, su dung lenh /editvehicle.");
	return 1;
}
CMD:crash(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 2) return 1;
    new playerto, AdminWText[100];
    if(sscanf(params, "u", playerto)) return SendClientMessage(playerid, -1, "/crash [playerid/name]");
    format(AdminWText, sizeof(AdminWText), "AdmCmd: %s da gay crash nguoi choi %s.", GetName(playerid), GetName(playerto));
    SendAdminMessage(COLOR_GREY, AdminWText, 1);

    GameTextForPlayer(playerto, "Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 1000, 0);
    GameTextForPlayer(playerto, "Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 2000, 1);
    GameTextForPlayer(playerto, "Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 3000, 2);
    GameTextForPlayer(playerto, "Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 4000, 3);
    GameTextForPlayer(playerto, "Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 5000, 4);
    GameTextForPlayer(playerto, "Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 6000, 5);
    GameTextForPlayer(playerto, "Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 7000, 6);
    return 1;
}
CMD:cras2(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 1) return 1;
    new playerto, AdminWText[100];
    if(sscanf(params, "u", playerto)) return SendClientMessage(playerid, -1, "/crash [playerid/name]");
    format(AdminWText, sizeof(AdminWText), "AdmCmd: %s da gay crash nguoi choi %s.", GetName(playerid), GetName(playerto));
    SendAdminMessage(COLOR_GREY, AdminWText, 1);

    GameTextForPlayer(playerto, "Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 1000, 0);
    GameTextForPlayer(playerto, "Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 2000, 1);
    GameTextForPlayer(playerto, "Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 3000, 2);
    GameTextForPlayer(playerto, "Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 4000, 3);
    GameTextForPlayer(playerto, "Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 5000, 4);
    GameTextForPlayer(playerto, "Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 6000, 5);
    GameTextForPlayer(playerto, "Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 7000, 6);
    return 1;
}
CMD:kickall(playerid, params[]) {
	new reason[100], string[150];
	if(PlayerInfo[playerid][pAdmin] < 7) return 1;
    if(sscanf(params, "s[100]", reason)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/kickall <ly do>");
	format(string, sizeof(string), "Kick: %s da kick tat ca nguoi choi, Li do: %s.", GetName(playerid), reason);
	SCMTA(COLOR_LIGHTRED, string);
    foreach(new i: Player) KickEx(i);
	return 1;
}
CMD:check2(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new id[25], cont;
	if(sscanf(params, "s[25]", id)) return SendClientMessage(playerid,COLOR_GREY, "Su dung: {FFFFFF}/check2 <nume intreg>");
	cont = MySQLCheckAccount(id);
	if(cont == 0) return SendClientMessage(playerid,COLOR_GREY, "Ten nay khong duoc tim thay tren co so du lieu!");
	Dialog_Show(playerid, DIALOG_CHECK, DIALOG_STYLE_LIST, "Kiem tra:", "PIN\nCash\nBank\nHouse\nBusiness\nLevel\nHours\nPremium points\nPremium points win\nHours month\nDaily hours\nLast login\nFaction", "Ok", "Exit");
	SetPVarString(playerid, "CheckName", id);
	return 1;
}
// DS
alias:buycar("muaxe")
function LoadDSCar() {
	new loaded, rows = cache_num_rows();
	while(loaded < rows) {
		cache_get_value_name_int(loaded, "ID", D_Vehicles[loaded][dSQLID]);
		cache_get_value_name_int(loaded, "Price", D_Vehicles[loaded][dPrice]);
		cache_get_value_name_int(loaded, "Stock", D_Vehicles[loaded][dStock]);
		cache_get_value_name_int(loaded, "Level", D_Vehicles[loaded][dLevel]);
		cache_get_value_name_int(loaded, "Coins", D_Vehicles[loaded][dCoins]);
		cache_get_value_name_int(loaded, "Model", D_Vehicles[loaded][dModel]);

		D_Model[D_Vehicles[loaded][dModel]-400] = loaded; // Model to array ID

		if(D_Vehicles[loaded][dLevel] > 0) Iter_Add(Cars<4>, loaded);
		else if(D_Vehicles[loaded][dCoins] > 0) Iter_Add(Cars<3>, loaded);
		else if(D_Vehicles[loaded][dPrice] < 10000000) Iter_Add(Cars<0>, loaded);
		else if(D_Vehicles[loaded][dPrice] < 30000000) Iter_Add(Cars<1>, loaded);
		else if(D_Vehicles[loaded][dPrice] < 300000000) Iter_Add(Cars<2>, loaded);
		loaded++;
	}

	printf("[DEALERSHIP] Loaded %d model%s.", rows, rows == 1 ? "" : "s");
	return 1;
}
CMD:buycar(playerid, params[]) {
	if(PlayerInfo[playerid][pLevel] < DEALERSHIP_MINIUM_LEVEL) return va_SendClientMessage(playerid, COLOR_GREY, "You dont have enough level to access dealership. (minium: %d)", 0, DEALERSHIP_MINIUM_LEVEL);
	new bool:isAtDealerShip = false;
	for(new i; i < sizeof(dealershipPos); i++) {
		if(IsPlayerInRangeOfPoint(playerid, 3, dealershipPos[i][0], dealershipPos[i][1], dealershipPos[i][2])) {
			isAtDealerShip = true;
			break;
		}
	}
	if(!isAtDealerShip) return SendClientMessage(playerid, COLOR_GREY, "Ban khong dung tai dealership");
	new string[300];
	format(string, sizeof(string), "Gia re\t\nTrung binh\t\nCao cap\t"GOLD"[Trending]"WHITE"\nHang nang\t\nCuc pham\t[Limited]");
	Dialog_Show(playerid, DEALERSHIP_BUY_PRODUCT, DIALOG_STYLE_TABLIST, "Dealership", string, "Xem", "Thoat");
	return 1;
}
Dialog:DEALERSHIP_BUY_PRODUCT(playerid, response, listitem, inputtext[]) {
	if(!response) return 1;
	if(Iter_Count(Cars<listitem>) == 0) Dialog_Show(playerid, DEALERSHIP_BUY_PRODUCT2, DIALOG_STYLE_MSGBOX, "", "Khong co mat hang loai nay, mong quy khach quay lai sau.", "Ok", "");
	new temp[100], string[3000], price[50], vehname[50];
	SelectedItem[playerid] = listitem;
	if(Iter_Count(Cars<listitem>) == 0) return Dialog_Show(playerid, DEALERSHIP_BUY_PRODUCT3, DIALOG_STYLE_MSGBOX, "Product List", "Khong co hang", "Tro ve", ""); 
	format(string, sizeof(string), "Model\tPrice\tStock\n");
	foreach(new id: Cars<listitem>) {
		if(D_Vehicles[id][dCoins] > 0) format(price, sizeof(price), "%s "GOLD"Coins"WHITE"", FormatNumber(D_Vehicles[id][dCoins]));
		else format(price, sizeof(price), ""GOLD"$"WHITE"%s", FormatNumber(D_Vehicles[id][dPrice]));
		if(D_Vehicles[id][dLevel] > 0) format(vehname, sizeof(vehname), "%s "GREY_70"[Level %d]"WHITE"", aVehicleNames[D_Vehicles[id][dModel]-400], D_Vehicles[id][dLevel]);
		else format(vehname, sizeof(vehname), "%s", aVehicleNames[D_Vehicles[id][dModel]-400]);

		format(temp, sizeof(temp), "%s\t%s\t%s\n", vehname, price, FormatNumber(D_Vehicles[id][dStock]));
		strcat(string, temp);
	}	
	Dialog_Show(playerid, DEALERSHIP_BUY_PRODUCT1, DIALOG_STYLE_TABLIST_HEADERS, "Product List", string, "Xem thong tin", "Tro ve"); 
	return 1;
}
Dialog:DEALERSHIP_BUY_PRODUCT3(playerid, response, listitem, inputtext[]) {
	return callcmd::buycar(playerid, "");
}
Dialog:DEALERSHIP_BUY_PRODUCT1(playerid, response, listitem, inputtext[]) {
	if(!response) return callcmd::buycar(playerid, "");
	new string[500], type[11], id = Iter_Index(Cars<SelectedItem[playerid]>, listitem);
	switch(SelectedItem[playerid]) {
		case 0: strmid(type, "Gia re", 0, sizeof(type));
		case 1: strmid(type, "Trung binh", 0, sizeof(type));	
		case 2: strmid(type, "Cao cap", 0, sizeof(type));	
		case 3: strmid(type, "Hang nang", 0, sizeof(type));	
		case 4: strmid(type, "Cuc pham", 0, sizeof(type));
	}

	SelectedItem[playerid] = id;
	printf("[DEBUG] %s dang xem model %d tren dealership.", GetName(playerid), D_Vehicles[id][dModel]);
	format(string, sizeof(string), "Model da chon: %s\nLoai: %s\nToc do cao nhat: %i km/h\nGia: %s$\n\n\nAn xac nhan va chung toi se hoan tat thu tuc thanh toan cho ban.", aVehicleNames[D_Vehicles[id][dModel]-400], type, Model_TopSpeed(D_Vehicles[id][dModel]), FormatNumber(D_Vehicles[id][dPrice]));
	Dialog_Show(playerid, DEALERSHIP_MAKE_PAYMENT, DIALOG_STYLE_MSGBOX, "Xac nhan don hang", string, "Xac nhan", "Huy");
	return 1;
}
Dialog:DEALERSHIP_BUY_PRODUCT2(playerid, response, listitem, inputtext[]) return callcmd::buycar(playerid, "");
Dialog:DEALERSHIP_MAKE_PAYMENT(playerid, response, listitem, inputtext[]) {
	if(!response) return 1;
	if(GetSlots(playerid) <= GetVehicles(playerid)) return SendClientMessage(playerid, -1, "Ban da het slot xe! Hay mua mot slot tai /shop.");
	new id = SelectedItem[playerid];
	if(D_Vehicles[id][dStock] <= 0) return SendClientMessage(playerid, COLOR_GREY, "Xe da het hang.");
	if(GetPlayerCash(playerid) < D_Vehicles[id][dPrice]) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co du tien");
	if(PlayerInfo[playerid][pPremiumPoints] < D_Vehicles[id][dCoins]) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co du xu yeu cau.");
	new query[200];
	// Save stock
	D_Vehicles[id][dStock]--;
	va_mysql_query("UPDATE `dscars` SET `Stock` = '%i' WHERE `ID` = '%i'", D_Vehicles[id][dStock], D_Vehicles[id][dSQLID]);
	
	// Money/PremiumPoints
	if(D_Vehicles[id][dCoins] > 0) {
		PlayerInfo[playerid][pPremiumPoints] -= D_Vehicles[id][dCoins];
		Update(playerid, pPremiumPointsx);
		va_SendClientMessage(playerid, COLOR_GREY, "Ban da thanh toan chiec xe voi %d xu.", D_Vehicles[id][dCoins]);
	}
	else {
		GivePlayerCash(playerid, -D_Vehicles[id][dPrice]);
		PayTax(playerid, DrugPrice[playerid], e_MUA_XE);
		Update(playerid, pCashx);
		va_SendClientMessage(playerid, COLOR_GREY, "Ban da thanh toan chiec xe voi $%s.", GetPlayerCash(playerid));
	}
	new idd = GiveVehicle(playerid, D_Vehicles[id][dModel], true);
	format(query, sizeof(query), "%s mua mot chiec %s[%d] tai Dealership.", GetName(playerid), aVehicleNames[D_Vehicles[id][dModel]-400], idd);
	SendAdminMessage(COLOR_YELLOW, query, 1);
	return 1;
}
CMD:gotods(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du quyen han de su dung lenh nay");
	new id;
	if(sscanf(params, "i", id)) return SendClientMessage(playerid, COLOR_GREY, "SU DUNG: {FFFFFF}/gotods [id]");
	if(id > sizeof(dealershipPos) || id < 0) return SendClientMessage(playerid, COLOR_GREY, "Dealership voi ID da nhap khong ton tai");
	SetPlayerPosEx(playerid, dealershipPos[id][0], dealershipPos[id][1], dealershipPos[id][2]);
	va_SendClientMessage(playerid, COLOR_GREY, "Ban da dich chuyen den Dealership ID %d", id);
	return 1;
}
CMD:setstock(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du quyen han de su dung lenh nay.");
	new model, value, option[20];
	if(sscanf(params, "is[20]i", model, option, value)) {
		SendClientMessage(playerid, COLOR_GREY, "SU DUNG: {FFFFFF}/setmodel <model> <option> <value>");
		SendClientMessage(playerid, COLOR_GREY, "Option: stock, price, coins, level");
		return 1;
	}
	if(strcmp(option, "stock", true) == 0) {
		DS_SetModel(playerid, model, .vstock = value);
	} 
	else if(strcmp(option, "price", true) == 0) {
		DS_SetModel(playerid, model, .price = value);
	}
	else if(strcmp(option, "coins", true) == 0) {
		DS_SetModel(playerid, model, .coins = value);
	}
	else if(strcmp(option, "level", true) == 0) {
		DS_SetModel(playerid, model, .level = value);
	}
	else SendClientMessage(playerid, COLOR_GREY, "Option: stock, price, coins, level");
	return 1;	
}
DS_SetModel(playerid, model, vstock = -1, price = -1, coins = -1, level = -1) {
	if(vstock < 0 && vstock != -1) return SendClientMessage(playerid, COLOR_GREY, "Khong hop le");
	if((price < 0 || price > 2000000000) && price != -1) return SendClientMessage(playerid, COLOR_GREY, "Khong hop le");

	new x = D_Model[model-400]; // get array index of the model
	Iter_Remove(Cars<Iter_GetMulti(Cars<>, x)>, x); // delete x in its category
	
	if(coins != -1) D_Vehicles[x][dCoins] = coins;
	if(vstock != -1) D_Vehicles[x][dStock] = vstock;
	if(price != -1) D_Vehicles[x][dPrice] = price;
	if(level != -1) D_Vehicles[x][dLevel] = level;

	// Re-add to the Iterator
	if(D_Vehicles[x][dLevel] > 0) Iter_Add(Cars<4>, x);
	else if(D_Vehicles[x][dCoins] > 0) Iter_Add(Cars<3>, x);
	else if(D_Vehicles[x][dPrice] > 0 && D_Vehicles[x][dPrice] < 10000000) Iter_Add(Cars<0>, x);
	else if(D_Vehicles[x][dPrice] < 30000000) Iter_Add(Cars<1>, x);
	else if(D_Vehicles[x][dPrice] < 300000000) Iter_Add(Cars<2>, x);

	new query[200];
	mysql_format(SQL, query, sizeof(query), "UPDATE `dscars` SET `Price` = '%i', `Stock` = '%i', `Coins` = '%i', `Level` = '%i' WHERE `ID` = '%i'", price, vstock, D_Vehicles[x][dSQLID], coins, level);
	mysql_pquery(SQL, query);

	format(query, sizeof(query), "[DEALERSHIP] "WHITE"Admin %s da sua phuong tien %s (Stock: %i, Price: %s, Coins: %s, Level: %i)", GetName(playerid), aVehicleNames[model-400], vstock, FormatNumber(price), FormatNumber(coins), level);
	SendStaffMessage(COLOR_YELLOW, query);
	return 1;
}
CMD:fixloixe(playerid, params[]) {
	new query[200];
	new Cache: x = mysql_query(SQL, "SELECT * FROM cars WHERE ID > 900"), rows = cache_num_rows(), i, model = -1, id;
	while(i < rows) 
	{
		cache_get_value_name_int(i, "Model", model);
		cache_get_value_name_int(i, "ID", id);
		format(query, sizeof(query), "UPDATE cars SET Value=%d WHERE ID=%d", D_Vehicles[D_Model[model-400]][dPrice], id);
		mysql_pquery(SQL, query);
		SendClientMessage(playerid, -1, query);
		i++;
	}
	cache_delete(x);
	return 1;
}