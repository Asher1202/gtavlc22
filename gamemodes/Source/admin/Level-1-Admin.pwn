#if defined BOXING_MAP
	CMD:gotoboxing(playerid, params[]) {
		if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
		if(GetPlayerState(playerid) == 2) SetVehiclePosEx(playerid, GetPlayerVehicleID(playerid), 1346.3131100,2151.5424800,14.6771000);
		else SetPlayerPosEx(playerid, 1346.3131100,2151.5424800,14.6771000);
		SendClientMessage(playerid, COLOR_SERVER, "Map duoc lam boi Dang Duy Tan (Jeck).");
		SetPlayerInterior(playerid,0);
		InHQ[playerid] = -1;
		InHouse[playerid] = -1;
		InBussines[playerid] = -1;
		SetPlayerVirtualWorld(playerid,0);
		return 1;
	}
#endif
CMD:gotocnn(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	if(GetPlayerState(playerid) == 2) SetVehiclePosEx(playerid, GetPlayerVehicleID(playerid), 1134.1735,-1412.2660,13.6323);
	else SetPlayerPosEx(playerid, 1134.1735,-1412.2660,13.6323);
	SetPlayerInterior(playerid,0);
	InHQ[playerid] = -1;
	InHouse[playerid] = -1;
	InBussines[playerid] = -1;
	SetPlayerVirtualWorld(playerid,0);
	return 1;
}
CMD:call112(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] == 0) return 1;
	if(policeHotline) policeHotline = false;
	else policeHotline = true;
	new str[120];
	format(str, sizeof(str), "INFO: Police Hotline (/call 112) da duoc %s. (/call112)", policeHotline ? "{00FF00}Mo" : "{FF0000}Khoa");
	SendStaffMessage(COLOR_GREY, str);
	return 1;
}
CMD:rnewbie(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_LGREEN, AdminOnly);
	new id;
	if(sscanf(params, "u", id)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/rnewbie <playerid/name>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong ket noi!");
	if(PlayerInfo[id][pHelper] != 0) return SendClientMessage(playerid, COLOR_WHITE, "Nguoi choi do la Helper!");
	if(GetPVarInt(id, "Reported") == 0) return SendClientMessage(playerid, COLOR_WHITE, "Nguoi choi do khong gui bao cao.");
	if(GetPVarInt(id, "ReportType") != 4) return SendClientMessage(playerid, COLOR_WHITE, "Ban khong the chuyen bao cao nay.");
	new result[128];
	GetPVarString(id, "ReportText", result, sizeof(result));
	new string[180];
	format(string, sizeof(string), "AdmCmd: %s da chuyen bao cao cua %s (%d) cho doi ngu Helper.", GetName(playerid), GetName(id), id);
	SendStaffMessage(COLOR_LOGS, string);	
	SendClientMessage(id, COLOR_GOLD, "Bao cao cua ban da duoc gui cho doi ngu Helper! Xin hay doi phan hoi..");
	HelpText[id] = "";
	format(HelpText[id], 256, result);
	PlayerInfo[id][pNewbieMute] = 120;
	Iter_Add(PlayerHelped, id);
	OnHelper[id] = 0;	
	SetPVarInt(id, "Reported", 0);
	SetPVarInt(id, "ReportType", 0);
	SetPVarString(id, "ReportedBy", "");
	SetPVarInt(id, "ReportScore", 0);
	SetPVarString(id, "ReportText", "");		
	return 1;
}
CMD:slapcar(playerid, params[]) {
	new carid;
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;
	if(sscanf(params, "i",carid)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/slapcar <carid>");
	if(!IsValidVehicle(carid)) return SendClientMessage(playerid, COLOR_GREY, "Vehicul invalid!");
	new Float: Pos[3];
	GetVehiclePos(carid, Pos[0], Pos[1], Pos[2]);
	SetVehiclePosEx(playerid, carid, Pos[0], Pos[1], Pos[2]+5);
	new string[180];
	format(string, sizeof(string), "[{B81616}AdmWarning{FFFFFF}]: %s da slap xe %d.", GetName(playerid), carid);
	SendAdminMessage(-1, string, 1);
	return 1;
}
CMD:gsearch(playerid, params[]) {
	new result[30], x, string[60];
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;
	if(sscanf(params, "s[30]",result)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/gsearch <name/id>");
	SendClientMessage(playerid, -1, "--------------------------------------------------------------------");
	for(new v = 1; v < 48; v++) {
		if(strfind(GunNames[v], result, true) != -1 || v == strval(result)) {
			format(string, sizeof(string), "Ket qua: %s (%d)", GunNames[v], v);
			SendClientMessage(playerid, 0x9CE6FFFF, string);
			x++;
		}
	}
	if(x == 0) return SendClientMessage(playerid, COLOR_GREY, "* Khong co ket qua nao cho tim kiem nay!"), SendClientMessage(playerid, -1, "--------------------------------------------------------------------");	
	else {
		format(string, sizeof(string), "* Co %d ket qua cho tim kiem nay!", x);
		SendClientMessage(playerid, COLOR_LGREEN, string);
	}
	SendClientMessage(playerid, -1, "--------------------------------------------------------------------");	
	return 1;
}
CMD:vsearch(playerid, params[]) {
	new result[30], x, string[60];
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;
	if(sscanf(params, "s[30]",result)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/vsearch <name/model>");
	SendClientMessage(playerid, -1, "--------------------------------------------------------------------");
	for(new v = 0; v < 212; v++) {
		if(strfind(aVehicleNames[v], result, true) != -1 || v == strval(result)-400) {
			format(string, sizeof(string), "Ket qua: %s (%d)", aVehicleNames[v], v+400);
			SendClientMessage(playerid, 0x9CE6FFFF, string);
			x++;
		}
	}
	if(x == 0) return SendClientMessage(playerid, COLOR_GREY, "* Khong co ket qua nao cho tim kiem nay!"), SendClientMessage(playerid, -1, "--------------------------------------------------------------------");	
	else {
		format(string, sizeof(string), "* Co %d ket qua cho tim kiem nay!", x);
		SendClientMessage(playerid, COLOR_LGREEN, string);
	}
	SendClientMessage(playerid, -1, "--------------------------------------------------------------------");	
	return 1;
}
CMD:starttp(playerid, params[]) {
	new result[180], szMessage[180];
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_LGREEN, AdminOnly);
	if(EventStatus == 0) {
		if(sscanf(params, "s[180]", result)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/starttp <noi dung>");
		if(FaceReclama(result)) return RemoveFunction(playerid, result);
		GetPlayerPos(playerid, etp[0], etp[1], etp[2]);
		SCMTA(0xFF8400FF, "Thoi gian su kien:");
		format(szMessage, 256,"Admin %s tao mot su kien %s.", GetName(playerid), result);
		SCMTA(0xFF8400FF, szMessage);
		SCMTA(0xFF8400FF, "De tham gia su kien, su dung /gotoevent!");
		EventStatus = 1;
		EventInt = GetPlayerInterior(playerid);
		EventVW = GetPlayerVirtualWorld(playerid);
	}
	else {
		format(szMessage, 256,"Diem danh su kien da ket thuc!");
		SCMTA(0xFF8400FF, szMessage);
		EventStatus = 0;
	}
	return 1;
}

CMD:setjob(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new id,jobid,string[100];
	if(sscanf(params, "ui",id,jobid)) return SendClientMessage(playerid, COLOR_RED, "Cu phap: {FFFFFF}/setjob <playerid/name> <Job ID>");
	if(jobid < 1 || jobid > 13) return SendClientMessage(playerid, -1, "ID khong hop le! (1-13)");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi khong ket noi.");
	PlayerInfo[id][pJob] = jobid;
	format(string, sizeof(string), "({FF0000}Admin Info{FFFFFF}) %s set cho %s job %s (%d).", GetName(playerid),GetName(id),JobInfo[jobid][jName],jobid);
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(COLOR_WHITE, string,3);
	format(string, sizeof(string), "Admin %s da set cho ban job %s.", GetName(playerid),JobInfo[jobid][jName]);
	SendClientMessage(id,COLOR_LIGHTBLUE, string);
	new query[128];
	format(query,sizeof(query),"UPDATE users SET `Job`='%d' WHERE `ID`='%d'",PlayerInfo[id][pJob],PlayerInfo[id][pSQLID]);
	mysql_query(SQL,query,false);
	UpdateProgress(id, 1);
	return 1;
}
CMD:bigears(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid,COLOR_WHITE,AdminOnly);
	if(!BigEar[playerid]) {
		BigEar[playerid] = 1;
		SendClientMessage(playerid, COLOR_WHITE, "Bay gio ban se thay chat cua tat ca moi nguoi. (chi mot minh ban thay)");
	}
	else if(BigEar[playerid]) {
		(BigEar[playerid] = 0);
		SendClientMessage(playerid, COLOR_GREY, "Ban se khong con thay moi nguoi tro chuyen nua.");
	}
	return 1;
}
CMD:o(playerid, params[]) {
	if ((noooc) && PlayerInfo[playerid][pAdmin] < 1)
	{
		SendClientMessage(playerid, COLOR_GRAD2, "   Kenh chat OOC da bi tat boi Admin!");
		return 1;
	}
	new text[200],string[250];
	if(sscanf(params, "s[250]",text)) return SendClientMessage(playerid, 0xB8DBFFFF, "Cu phap:{FFFFFF} /o <tin nhan>");
	if(FaceReclama(text)) return RemoveFunction(playerid, text);
	if(FaceReclama(text)) return Reclama(playerid, text);
	if(PlayerInfo[playerid][pAdmin] == 1) format(string, sizeof(string), "(( Admin %s : %s ))",GetName(playerid),text);
	else if(PlayerInfo[playerid][pAdmin] == 2) format(string, sizeof(string), "(( Admin %s : %s ))",GetName(playerid),text);
	else if(PlayerInfo[playerid][pAdmin] == 3) format(string, sizeof(string), "(( Admin %s : %s ))",GetName(playerid),text);
	else if(PlayerInfo[playerid][pAdmin] == 4) format(string, sizeof(string), "(( Admin %s : %s ))",GetName(playerid),text);
	else if(PlayerInfo[playerid][pAdmin] == 5) format(string, sizeof(string), "(( Manager %s : %s ))",GetName(playerid),text);
	else if(PlayerInfo[playerid][pAdmin] == 6) format(string, sizeof(string), "(( Owner %s : %s ))",GetName(playerid),text);
	else if(PlayerInfo[playerid][pAdmin] == 7) format(string, sizeof(string), "(( Developer %s : %s ))",GetName(playerid),text);
	else if(PlayerInfo[playerid][pAdmin] < 1 )	format(string, sizeof(string), "(( Member %s : %s ))",GetName(playerid),text);	
	SCMTA(COLOR_CLIENT, string);

	return 1;
}
CMD:unfreeze(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE,"Ban khong the su dung lenh nay.");
	new id;
	if(sscanf(params, "u",id)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/unfreeze <playerid/name>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	TogglePlayerControllable(id, true);
	Freezed[id] = 0;
	new string[100];
	format(string, sizeof(string), "Ban da duoc pha' bang boi %s.", GetName(playerid));
	SendClientMessage(id, -1, string);
	format(string, sizeof(string), "Ban da pha' bang cho %s.", GetName(id));
	SendClientMessage(playerid, -1, string);	
	return 1;
}
CMD:freeze(playerid, params[]) {
    if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE,"Ban khong the su dung lenh nay.");
	new id;
	if(sscanf(params, "u",id)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/freeze <playerid/name>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	TogglePlayerControllable(id, false);
	Freezed[id] = 1;
	new string[100];
	format(string, sizeof(string), "Ban da bi dong bang boi %s.", GetName(playerid));
	SendClientMessage(id, -1, string);
	format(string, sizeof(string), "Ban da dong bang %s.", GetName(id));
	SendClientMessage(playerid, -1, string);		
	return 1;
}
CMD:cc(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	foreach(new i: Player) {
		if(PlayerInfo[i][pAdmin] < 1) {
			for( new j = 0; j <= 50; j++) SendClientMessage(i, COLOR_WHITE, " ");
		}
	}
	new string[100];
	format(string, sizeof(string), "[{B81616}AdmWarning{FFFFFF}]: %s xoa chat log.",GetName(playerid));
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(-1, string,1);
	return 1;
}
CMD:mute(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1 && PlayerInfo[playerid][pHelper] < 2) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new time,id,string[180],reason[250],str[180];
	if(sscanf(params, "uis[250]",id,time,reason)) return SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/mute <playerid/name> <Time(minutes)> <ly do>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	if(PlayerInfo[id][pAdmin] > PlayerInfo[playerid][pAdmin]) return SendClientMessage(playerid, -1, "Nguoi choi nay co Admin Level lon hon ban!");
	PlayerInfo[id][pMuted] = 1;
	PlayerInfo[id][pMuteTime] = time*60;
	format(string, sizeof(string), "* Ban da mute %s trong %d phut, Li do: %s.", GetName(playerid),time,reason);
	SendClientMessage(id, COLOR_WHITE, string);
	format(string, sizeof(string), "AdmCmd: %s da bi mute %s trong %d phut, Li do: %s.", GetName(id), GetName(playerid),time, reason);
	SCMTA(COLOR_LIGHTRED, string);
	format(str,sizeof(str),"UPDATE users SET `Muted`='1',`MuteTime`='%d' WHERE `ID`='%d'",PlayerInfo[id][pMuteTime], PlayerInfo[id][pSQLID]);
	mysql_query(SQL,str,false);
	UpdateVar(playerid, "Mutes", 1);
	InsereazaSanctiune(id, playerid, MUTE, reason);

	PlayerInfo[playerid][pHelpedPlayers] ++;
	PlayerInfo[playerid][pHelpedPlayersToday] ++;
	new szQuery[256];
	format(szQuery, sizeof(szQuery), "UPDATE users SET `HelpedPlayers` = '%d', `HelpedPlayersToday`='%d' WHERE `ID` = '%d'", PlayerInfo[playerid][pHelpedPlayers], PlayerInfo[playerid][pHelpedPlayersToday], PlayerInfo[playerid][pSQLID]);
	mysql_query(SQL, szQuery,false);							
	return 1;
}
CMD:unmute(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new id,string[180];
	if(sscanf(params, "u",id)) return SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/unmute <playerid/name>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	PlayerInfo[id][pMuted] = 0;
	PlayerInfo[id][pMuteTime] = 0;
	format(string, sizeof(string), "* Ban da duoc unmute boi %s.", GetName(playerid));
	SendClientMessage(id, COLOR_WHITE, string);
	format(string, sizeof(string), "AdmCmd: %s da unmute cho %s.", GetName(playerid),GetName(id));
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(COLOR_LOGS, string,3);
	new string89[184];
	format(string89, sizeof(string89), "UPDATE users SET `Muted`='0',`MuteTime`='0' WHERE `ID`='%d'",PlayerInfo[id][pSQLID]);
	mysql_query(SQL,string89,false);
	return 1;
}
CMD:mutedplayers(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new count = 0,string[60];
	SendClientMessage(playerid, COLOR_WHITE, "--------- Nguoi choi bi mute ---------");
	foreach(new i: Player) {
		if(PlayerInfo[i][pMuted] == 1) {
			format(string, sizeof(string), "%s(%d) - Thoi gian: %d.",GetName(i),i,PlayerInfo[i][pMuteTime]);
			SendClientMessage(playerid,COLOR_WHITE,string);
			count++;
		}
	}
	if(count == 0) SendClientMessage(playerid,COLOR_LIGHTRED,"* Khong co nguoi choi nao bi mute.");
	else {
		format(string, sizeof(string), "* Co %d nguoi choi bi mute.", count);
		SendClientMessage(playerid, COLOR_LIGHTRED, string);
	}
	return 1;
}
CMD:jaillist(playerid, params[]) {
    if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new count = 0,string[60];
	SendClientMessage(playerid, COLOR_WHITE, "--------- Nguoi choi dang ngoi tu ---------");
	foreach(new i: Player) {
		if(PlayerInfo[i][pJailed] >= 1) {
			format(string, sizeof(string), "%s(%d) - Thoi gian: [%d]",GetName(i),i,PlayerInfo[i][pJailTime]);
			SendClientMessage(playerid,COLOR_WHITE,string);
			count++;
		}
	}
	if(count == 0) SendClientMessage(playerid,COLOR_LIGHTRED,"* Khong co nguoi choi dang ngoi tu.");
	else {
		format(string, sizeof(string), "* Hien tai co %d nguoi choi dang ngoi tu.", count);
		SendClientMessage(playerid, COLOR_LIGHTRED, string);
	}
	return 1;
}
CMD:checkweapons(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new id,string[128];
	if(sscanf(params, "u",id)) return SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/checkweapons <playerid/name>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	new Player_Ammos[13], Player_Weapons[13], i;
	for(i = 1;i <= 12;i++) {
		GetPlayerWeaponData(id,i,Player_Weapons[i],Player_Ammos[i]);
		if(Player_Weapons[i] != 0) {
			new weaponName[180];
			GetWeaponName(Player_Weapons[i],weaponName,255);
			format(string,255,"* %s - Vu khi: %s, Dan: %d",GetName(i),weaponName,Player_Ammos[i]);
			SendClientMessage(playerid,0xFFFFFFAA,string);
		}
	}
	return 1;
}
CMD:inevent(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;
	new x, string[180];
	SendClientMessage(playerid, -1, "Nguoi choi trong su kien:");
	foreach(new i: Player) {
		if(InEvent[i] == 1) {
			x++;
			format(string, sizeof(string), "%s (%d)", GetName(i), i);
			SendClientMessage(playerid, -1, string);
		}
	}
	format(string, sizeof(string), "Trong su kien co %d nguoi.", x);
	SendClientMessage(playerid, -1, string);
	return 1;
}
CMD:inrace(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;
	new x, string[180];
	SendClientMessage(playerid, -1, "Nguoi choi o trong Truong Dua:");
	foreach(new i: PlayerInRace) {
		if(IsPlayerConnected(i)) {
			x++;
			format(string, sizeof(string), "%s (%d)", GetName(i), i);
			SendClientMessage(playerid, -1, string);
		}
	}
	format(string, sizeof(string), "Da dem duoc %d nguoi.", x);
	SendClientMessage(playerid, -1, string);
	return 1;
}
CMD:gotohouse(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid,COLOR_WHITE,AdminOnly);
	new housenum;
	if(sscanf(params, "d",housenum)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/house <House ID>");
	if(housenum > Iter_Count(House)) return SendClientMessage(playerid, COLOR_GREY, "ID Invalid!");
	SetPlayerInterior(playerid,HouseInfo[housenum][hInterior]);
	SetPlayerPosEx(playerid,HouseInfo[housenum][hExitx],HouseInfo[housenum][hExity],HouseInfo[housenum][hExitz]);
	PlayerInfo[playerid][pInt] = HouseInfo[housenum][hInterior];
	PlayerInfo[playerid][pLocal] = housenum;
	InHouse[playerid] = housenum;
	SetPlayerVirtualWorld(playerid,HouseInfo[housenum][hVirtual]);
	new string[71];
	format(string, sizeof(string), "AdmCmd: %s da dich chuyen den House %d.", GetName(playerid), housenum);
	SendAdminMessage(COLOR_LOGS, string, 1);
	return 1;
}
CMD:gotobiz(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid,COLOR_WHITE,AdminOnly);
	new housenum;
	if(sscanf(params, "d",housenum)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/biz <Biz ID>");
	if(housenum > Iter_Count(Bizs)) return SendClientMessage(playerid, COLOR_GREY, "ID Invalid!");
	if(BizzInfo[housenum][bSbiz] == 0) {
		SetPlayerInterior(playerid,BizzInfo[housenum][bInterior]);
		SetPlayerPosEx(playerid,BizzInfo[housenum][bExitX],BizzInfo[housenum][bExitY],BizzInfo[housenum][bExitZ]);
		PlayerInfo[playerid][pInt] = BizzInfo[housenum][bInterior];
		PlayerInfo[playerid][pLocal] = housenum+99;		
		SetPlayerVirtualWorld(playerid,BizzInfo[housenum][bVirtual]);
		InBussines[playerid] = housenum;
	}
	else {
		SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld(playerid, 0);
		SetPlayerPosEx(playerid,BizzInfo[housenum][bEntranceX],BizzInfo[housenum][bEntranceY],BizzInfo[housenum][bEntranceZ]);
	}
	new string[180];
	format(string, sizeof(string), "AdmCmd: %s da dich chuyen den Biz %d.", GetName(playerid), housenum);
	SendAdminMessage(COLOR_LOGS, string, 1);			
	return 1;
}
CMD:setint(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new id,intid,string[180];
	if(sscanf(params, "ud", id,intid)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/setint <playerid/name> <Interior ID>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	SetPlayerInterior(id,intid);
	PlayerInfo[id][pInt] = intid;
	format(string, sizeof(string), "Ban set interior cho %s(%d): %d.", GetName(id), id, intid);
	SendClientMessage(playerid, COLOR_WHITE, string);
	format(string, sizeof(string), "Admin %s set interior cho ban %d.", GetName(playerid), intid);
	SendClientMessage(id, COLOR_WHITE, string);
	return 1;
}
CMD:setvw(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new id,vwid,string[180];
	if(sscanf(params, "ud", id,vwid)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/setvw <playerid/name> <Virtual World>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	SetPlayerVirtualWorld(id,vwid);
	format(string, sizeof(string), "Ban set cho %s(%d) virtual world %d.", GetName(id), id, vwid);
	SendClientMessage(playerid, COLOR_WHITE, string);
	format(string, sizeof(string), "Admin %s set virtual world cho ban: %d.", GetName(playerid), vwid);
	SendClientMessage(id, COLOR_WHITE, string);
	return 1;
}
CMD:showfreq(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid,COLOR_WHITE,AdminOnly);
	new id,string[64];
    if(sscanf(params, "u",id)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/showfreq <playerid/name>");
    if(PlayerInfo[id][pWTalkie] == 0) return SendClientMessage(playerid, 0xFFFFFFFF, "Nguoi choi do khong co Walkie Talkie.");
   	format(string, sizeof(string), "Tan so %d.",WTChannel[id]);
    SendClientMessage(playerid, COLOR_WHITE, string);
    return 1;
}
CMD:poll(playerid, params[]) {
	new string[90], minutes, question[180];
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;
	if(SondajTime != 0) return SendClientMessage(playerid, COLOR_GREY, "Khong co cuoc tham do y kien nao hoat dong!");
	if(sscanf(params, "is[180]", minutes, question)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/poll <phut> <cau hoi>");
	if(strlen(question) < 5) return SendClientMessage(playerid, COLOR_GREY, "Cau hoi qua ngan. (it hon 5 ky tu)");
	if(strlen(question) > 100) return SendClientMessage(playerid, COLOR_GREY, "Cau hoi qua dai. (nhieu hon 100 ky tu)");
	if(minutes < 1 || minutes > 5) return SendClientMessage(playerid, COLOR_GREY, "So phut khong hop le! (1-5)");
	foreach(new i: Player) {
		if(IsPlayerLogged[i] == 1) SondajVote[i] = 0;
	}
	SondajTime = minutes*60;
	format(Sondaj, 256, question);
	SondajTimer = defer SondajResult[minutes * 60000]();
	format(string, sizeof(string), "Admin %s da tao mot cuoc tham do y kien, ket thuc sau %d phut.", GetName(playerid), minutes);
	SCMTA(COLOR_YELLOW, string);
	format(question, sizeof(question), "Cau hoi: %s", question);
	SCMTA(COLOR_YELLOW, question);
	SCMTA(COLOR_YELLOW, "Su dung lenh (/vote) de bo phieu quan diem cua ban!");	
	return 1;
}
CMD:repoll(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;
	if(SondajTime == 0) return SendClientMessage(playerid, COLOR_GREY, "Khong co cuoc tham do y kien nao hoat dong!");
	stop SondajTimer;
	SondajTime = 0;
	Sondaj = "";
	new string[180];
	format(string, sizeof(string), "Admin %s da huy cuoc khao sat.", GetName(playerid));
	SCMTA(COLOR_YELLOW, string);	
	return 1;
}
CMD:despawncar(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new id;
	if(sscanf(params, "d", id)) return SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/despawncar <Car ID>");
	if(Carspawn[id] == 0) return SendClientMessage(playerid, COLOR_GREY, "Xe chua duoc spawn ra ngoai.");
	DestroyVehicle(id);
	Carspawn[id] = 0;
	new string[256];
	format(string, sizeof(string), "[{B81616}AdmWarning{FFFFFF}]: %s vua despawned phuong tien %d (tong phuong tien da lay ra - %d).",GetName(playerid), id, CountSpawnCars());
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(-1, string, 2);	
	return 1;
}
CMD:despawncars(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);	
	for(new i = 1; i < MAX_VEHICLES; i++) {
		if(Carspawn[i] != 0) {
			DestroyVehicle(Carspawn[i]);
			Carspawn[i] = 0;
		}
	}	
	new string[256];
	format(string, sizeof(string), "[{B81616}AdmWarning{FFFFFF}]: %s vua despawned tat ca cac phuong tien.",GetName(playerid));
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(-1, string, 2);		
	return 1;
}
CMD:alicenses(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid,COLOR_WHITE,AdminOnly);
	new id;
	if(sscanf(params, "u", id)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/alicenses <playerid/name>");
	if(id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	ShowLicenses(playerid, id);
    return 1;
}
CMD:jailo(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new id[25],reason[128],string[128],sendername[30],minutes,cont;
	GetPlayerName(playerid,sendername,sizeof(sendername));
	if(sscanf(params, "s[25]is[128]", id,minutes,reason)) return SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/ajailo <name> <phut> <ly do>");
	if(FaceReclama(reason)) return RemoveFunction(playerid, reason);
	cont = MySQLCheckAccount(id);
	if(cont == 0) return SendClientMessage(playerid,COLOR_LGREEN, "[ERROR] Khong the tim thay tai khoan nay trong co so du lieu!");
	new timej = minutes*60;
	format(string, sizeof(string), "Offline: %s bi bo tu boi %s trong %d phut, Li do: %s", id, sendername,minutes,reason);
	SCMTA(COLOR_LIGHTRED, string);
	format(string, sizeof(string), "Ban bi bat bo tu boi %s trong %d phut, Li do: %s.", GetName(playerid), minutes, reason);
	InsertEmail(id, GetName(playerid), string, 0);		
	new str1[184];		
	format(str1,sizeof(str1),"UPDATE users SET `Jailed`='3',`AJail`=1,`JailTime`='%d',`WantedLevel`='0' WHERE `name`='%s'",timej,id);
	mysql_query(SQL,str1,false);
	PlayerInfo[playerid][pHelpedPlayers] ++;
	PlayerInfo[playerid][pHelpedPlayersToday] ++;
	new szQuery[256];
	format(szQuery, sizeof(szQuery), "UPDATE users SET `HelpedPlayers` = '%d', `HelpedPlayersToday`='%d' WHERE `ID` = '%d'", PlayerInfo[playerid][pHelpedPlayers], PlayerInfo[playerid][pHelpedPlayersToday], PlayerInfo[playerid][pSQLID]);
	mysql_query(SQL, szQuery,false);	
	return 1;
}

CMD:ajail(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new id,reason[128],string[128],minutes;
	if(sscanf(params, "uis[128]", id,minutes,reason)) return SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/ajail <playerid/name> <phut> <ly do>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	ResetWeapons(id);
	SetPlayerArmourEx(id, 0);
	for(new m = 0; m < 5; m++) SendDeathMessageToPlayer(id, 1001, 1001, 200);
	CheckPaintball();
	PaintType[id] = 0;
	SetPlayerWantedLevel(id, 6);
	PlayerInfo[id][pWantedLevel] = 0;
	Update(id, pWantedLevelx);
	PlayerInfo[id][pJailed] = 3;
	PlayerInfo[id][pJailTime] = minutes*60;
	JailPrice[id] = 0;
	UpdateVar(id, "AJail", 1);
	PlayerInfo[id][pAJail] = 1;
	InsereazaSanctiune(id, playerid, JAIL, reason);
	Update(id,pJailedx);
	Update(id,pJailTimex);
	UpdateVar(playerid, "Jails", 1);
	PlayerInfo[playerid][pHelpedPlayers] ++;
	PlayerInfo[playerid][pHelpedPlayersToday] ++;
	SpawnPlayer(id);
	new szQuery[256];
	format(szQuery, sizeof(szQuery), "UPDATE users SET `HelpedPlayers` = '%d', `HelpedPlayersToday`='%d' WHERE `ID` = '%d'", PlayerInfo[playerid][pHelpedPlayers], PlayerInfo[playerid][pHelpedPlayersToday], PlayerInfo[playerid][pSQLID]);
	mysql_query(SQL, szQuery,false);	
	format(string, sizeof(string), "Ban da bi o tu trong %d phut. Li do: %s", minutes,reason);
	SendClientMessage(id, COLOR_LIGHTBLUE, string);
	format(string, sizeof(string), "AdmCmd: %s bi bo tu boi %s trong %d phut, Li do: %s", GetName(id), GetName(playerid),minutes,reason);
	MesajLung2(COLOR_LIGHTRED, string);
	return 1;
}
CMD:check(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new id;
	if(sscanf(params, "u",id)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/check <playerid/name>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong dang nhap.");
	if(PlayerInfo[id][pAdmin] > PlayerInfo[playerid][pAdmin]) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay len nguoi choi do.");
	ShowStats(playerid,id);
	return 1;
}

CMD:pm(playerid, params[]) {
	new id, message[128], string[180];
	if(PlayerInfo[playerid][pAdmin] < 1 && PlayerInfo[playerid][pHelper] < 1) return 1;
	if(sscanf(params, "us[128]", id, message)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/pm <playerid/name> <noi dung>");
	if(id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong ket noi!");
	if(id == playerid) return 1;
	if(!IsPlayerConnected(id)) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong ket noi!");
	format(string, sizeof(string), "(( PM tu %s: %s ))", GetName(playerid), message);
	SendClientMessage(id, COLOR_YELLOW, string);
	format(string, sizeof(string), "(( PM gui den %s: %s ))", GetName(id) , message);
	SendClientMessage(playerid, 0xC8E0DFFF, string);
	format(string, sizeof(string), "(PM) %s gui den %s: %s", GetName(playerid), GetName(id), message);
	// ChatLog(playerid, string);				
	return 1;
}
CMD:goto(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new id,string[80];
	if(sscanf(params, "u", id)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/goto <playerid/name>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong dang nhap.");
	if(Iter_Contains(PlayerInRace, playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong duoc phep su dung lenh nay khi ban dang o trong dau truong dua xe!");
	if(PlayerInfo[playerid][pHelper] >= 1 && PlayerInfo[playerid][pAdmin] < 5) {
		if(PlayerInfo[id][pLevel] > 3 && PlayerInfo[playerid][pAdmin] == 0) return SendClientMessage(playerid, -1, "La nguoi tro giup, ban chi co the dich chuyen den nguoi choi duoi cap do 3.");
	}
	if(id == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren chinh minh!");
	if(PlayerInfo[id][pAdmin] > PlayerInfo[playerid][pAdmin] && PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay len nguoi choi do.");
	
	new Float:ax,Float:ay,Float:az;
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid,ax,ay,az);	
	GetPlayerPos(id, x, y, z);
	
	new tmpcar = GetPlayerVehicleID(playerid);
	if(GetPlayerState(playerid) == 2) SetVehiclePosEx(playerid, tmpcar, x, y+4, z);
	else SetPlayerPosEx(playerid,x,y+2, z);
	SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(id));
	SetPlayerInterior(playerid, GetPlayerInterior(id));
	if(InHouse[id] > 0) InHouse[playerid] = InHouse[id];
	if(InHQ[id] > 0) InHQ[playerid] = InHQ[id];
	if(InBussines[id] > 0) InBussines[playerid] = InBussines[id];
	format(string,sizeof(string), "Ban da dich chuyen den %s.",GetName(id));
	SendClientMessage(playerid, 0xB5B5B5FF, string);
	format(string,sizeof(string), "Admin %s da dich chuyen den ban.",GetName(playerid));
	SendClientMessage(id, 0xB5B5B5FF, string);
	return 1;
}
CMD:gotolv(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	if(GetPlayerState(playerid) == 2) SetVehiclePosEx(playerid, GetPlayerVehicleID(playerid), 1699.2, 1435.1, 10.7);
	else SetPlayerPosEx(playerid, 1699.2,1435.1, 10.7);
	SetPlayerInterior(playerid,0);
	InHQ[playerid] = -1;
	InHouse[playerid] = -1;
	InBussines[playerid] = -1;
	SetPlayerVirtualWorld(playerid,0);
	return 1;
}

CMD:gotosf(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	if(GetPlayerState(playerid) == 2) SetVehiclePosEx(playerid, GetPlayerVehicleID(playerid), -1417.0,-295.8,14.1);
	else SetPlayerPosEx(playerid, -1417.0,-295.8,14.1);
	SetPlayerInterior(playerid,0);
	InHQ[playerid] = -1;
	InHouse[playerid] = -1;
	InBussines[playerid] = -1;
	SetPlayerVirtualWorld(playerid,0);
	return 1;
}

CMD:gotospawn(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] == 0) return 1;
	if(GetPlayerState(playerid) == 2) SetVehiclePosEx(playerid, GetPlayerVehicleID(playerid), SpawnPos[0], SpawnPos[1], SpawnPos[2]);
	else SetPlayerPosEx(playerid, SpawnPos[0], SpawnPos[1], SpawnPos[2]);
	SetPlayerInterior(playerid,0);
	InHQ[playerid] = -1;
	InHouse[playerid] = -1;
	InBussines[playerid] = -1;
	SetPlayerVirtualWorld(playerid,0);	
	return 1;
}

/*CMD:gotods(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] == 0) return 1;
	if(GetPlayerState(playerid) == 2) SetVehiclePosEx(playerid, GetPlayerVehicleID(playerid), DSPos[0],DSPos[1],DSPos[2]);
	else SetPlayerPosEx(playerid, DSPos[0],DSPos[1],DSPos[2]);
	SetPlayerInterior(playerid,0);
	InHQ[playerid] = -1;
	InHouse[playerid] = -1;
	InBussines[playerid] = -1;
	SetPlayerVirtualWorld(playerid,0);	
	return 1;
}*/

CMD:gotols(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	if(GetPlayerState(playerid) == 2) SetVehiclePosEx(playerid, GetPlayerVehicleID(playerid), 1529.6,-1691.2,13.3);
	else SetPlayerPosEx(playerid, 1529.6,-1691.2,13.3);
	SetPlayerInterior(playerid,0);
	InHQ[playerid] = -1;
	InHouse[playerid] = -1;
	InBussines[playerid] = -1;
	SetPlayerVirtualWorld(playerid,0);
	return 1;
}

CMD:gotom(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	if(GetPlayerState(playerid) == 2) SetVehiclePosEx(playerid, GetPlayerVehicleID(playerid), -2317.8091,-1637.5575,483.7031);
	else SetPlayerPosEx(playerid,-2317.8091,-1637.5575,483.7031);
	SetPlayerInterior(playerid,0);
	InHQ[playerid] = -1;
	InHouse[playerid] = -1;
	InBussines[playerid] = -1;
	SetPlayerVirtualWorld(playerid,0);
	return 1;
}

CMD:gotoin(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	if(GetPlayerState(playerid) == 2) SetVehiclePosEx(playerid, GetPlayerVehicleID(playerid), 1416.107000,0.268620,1000.926000);
	else SetPlayerPosEx(playerid,1416.107000,0.268620,1000.926000);
	SetPlayerInterior(playerid,1);
	InHQ[playerid] = -1;
	InHouse[playerid] = -1;
	InBussines[playerid] = -1;
	SetPlayerVirtualWorld(playerid,0);
	return 1;
}

CMD:aaa3(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;
	SetPlayerPosEx(playerid, 1477.5452,1742.9164,10.8125);
	SetPlayerVirtualWorld(playerid, 666);
	SetPlayerInterior(playerid, 0);
	return 1;
}

CMD:ip(playerid, params[]) {
	new id, playersip[16], string[180], query[150], x;
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	if(sscanf(params, "u", id)) return SendClientMessage(playerid,COLOR_GREY, "Su dung: {FFFFFF}/ip <playerid>"); 
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong dang nhap.");
	if(PlayerInfo[id][pAdmin] >= 1 && PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the lam dieu nay!");
	if(PlayerInfo[id][pAdmin] > PlayerInfo[playerid][pAdmin]) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay len nguoi choi do.");
	GetPlayerIp(id,playersip,sizeof(playersip));
	format(string, sizeof(string), "Tai khoan chua IP cua %s (%d):",GetName(id),id);
	SendClientMessage(playerid,COLOR_SERVER,string);
	
    format(query, sizeof(query), "SELECT * FROM `users` WHERE `IP`='%s'", playersip);
    new Cache: result = mysql_query(SQL, query);
	new name[32], idd[16];
    for(new i, j = cache_num_rows(); i < j; i++) {
		cache_get_value_name(i, "name", name);
		cache_get_value_name(i, "id", idd);		
		x++;
		format(string, sizeof(string), "%d. %s (user %d)", x, name, strval(idd));
		SendClientMessage(playerid, COLOR_WHITE, string);
    }
    cache_delete(result);	
	if(x == 0) SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Khong tim thay tai khoan khac tren IP nay!");
	return 1;
}
CMD:togfind(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid,COLOR_WHITE,AdminOnly);
	if(togfind[playerid] == 1)  {
		togfind[playerid] = 0;
		SendClientMessage(playerid,COLOR_WHITE,"Ban da bat tuy chon de nguoi choi co the tim thay ban.");
	}
	else
	{
		togfind[playerid] = 1;
		SendClientMessage(playerid,COLOR_WHITE,"Ban da tat tuy chon de nguoi choi co the tim thay ban.");
	}
	return 1;
}
CMD:gethere(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new id,string[100];
	if(sscanf(params, "u",id)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/gethere <playerid/name>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong dang nhap.");
	new Float:idcx,Float:idcy,Float:idcz;
	if(PlayerInfo[id][pAdmin] > PlayerInfo[playerid][pAdmin]) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay len nguoi choi do.");
	GetPlayerPos(playerid, idcx, idcy, idcz);
	SetPlayerInterior(id,GetPlayerInterior(playerid));

	if(GetPlayerState(id) == 2) SetVehiclePosEx(id, GetPlayerVehicleID(id), idcx, idcy+4, idcz);
	else SetPlayerPosEx(id,idcx,idcy+2, idcz);
	if(InHouse[playerid] > 0) InHouse[id] = InHouse[playerid];
	if(InHQ[playerid] > 0) InHQ[id] = InHQ[playerid];
	if(InBussines[playerid] > 0) InBussines[id] = InBussines[playerid];
	SetPlayerVirtualWorld(id, GetPlayerVirtualWorld(playerid));

	format(string, sizeof(string), "Ban da dich chuyen %s den ban.", GetName(id));
	SendClientMessage(playerid, 0xB5B5B5FF, string);
	format(string, sizeof(string), "Ban da duoc dich chuyen den vi tri admin %s.", GetName(playerid));
	SendClientMessage(id, 0xB5B5B5FF, string);
	return 1;
}
CMD:managearena(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid,COLOR_WHITE,AdminOnly);
	new x_nr[10];
    if(sscanf(params, "s[10]",x_nr)) SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/managearena <mo/dong>");
    if(strcmp(x_nr,"mo",true) == 0) {
		Update3DTextLabelText(areap, 0xFFFFFFFF, "Event Arena dang mo\nBam phim F de vao");
		areape = 1;
	}
    if(strcmp(x_nr,"dong",true) == 0) {
		Update3DTextLabelText(areap, 0xFFFFFFFF, "Event Arena dang dong\nVui long cho...");
		areape = 0;
 	}
	return 1;
}
CMD:gotojob(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, -1, AdminOnly);
	if(Iter_Contains(PlayerInRace, playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "Khong the su dung lenh nay trong truong dua!");
	if(JobWorking[playerid] == 1) return SendClientMessage(playerid, COLOR_LGREEN, "Khong the su dung lenh nay khi dang lam viec!");
	new szDialog[1024], szDialog2[1024], szTitle[50];
	strcat(szDialog2, "Job name\tDistance\n");
	foreach(new j : Jobs) { 
		format(szDialog, sizeof(szDialog), "%s\t{CBFF96}%0.2fm\n", JobInfo[j][jName], GetPlayerDistanceFromPoint(playerid, JobInfo[j][jPosX],JobInfo[j][jPosY],JobInfo[j][jPosZ]));
		strcat(szDialog2, szDialog);  
	}
	format(szTitle, sizeof(szTitle), "Jobs: %d", Iter_Count(Jobs));
	Dialog_Show(playerid, GOTOJOB, DIALOG_STYLE_TABLIST_HEADERS, szTitle, szDialog2, "Ok", "Cancel");
	return 1;
}

CMD:gotohq(playerid, params[]) {
	new id;
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, -1, AdminOnly);
	if(sscanf(params, "i", id)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/gotohq <hq id>");
	if(id < 1 || id > facs) return SendClientMessage(playerid, -1, "ID invalid! (1-"#MAX_FACTIONS")");
	SetPlayerPosEx(playerid, DynamicFactions[id][extX], DynamicFactions[id][extY], DynamicFactions[id][extZ]);
	SetPlayerVirtualWorld(playerid, 0);
	SetPlayerInterior(playerid, 0);
	new string[180];
	format(string, sizeof(string), "Ban da dich chuyen den %s's HQ. (#%d)", FactionName(id), id);
	SendClientMessage(playerid, -1, string);
	return 1;
}
CMD:playergotojob(playerid, params[]) {
	new id, userid;
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;
	if(sscanf(params, "ui", userid, id)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/playergotojob <userid> <jobid>");
	if(id < 1 || id > 14) return SendClientMessage(playerid, -1, "ID invalid! (1-13)");
	SetPlayerPosEx(userid, JobInfo[id][jPosX], JobInfo[id][jPosY], JobInfo[id][jPosZ]);
	new string[180];
	SetPlayerVirtualWorld(id, 0);
	SetPlayerInterior(id, 0);
	format(string, sizeof(string), "AdmCmd: %s da dich chuyen %s den job %s (%d).", GetName(playerid), GetName(userid), JobInfo[id][jName], id);
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(COLOR_LOGS, string, 1);
	format(string, sizeof(string), "Admin %s da dich chuyen ban den job %s.", GetName(playerid), JobInfo[id][jName]);
	SendClientMessage(userid, COLOR_WHITE, string);
	return 1;
}
CMD:go(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] > 0)
	{
		new string[128], name[30];
		Dialog_Show(playerid, GO, DIALOG_STYLE_LIST, "SERVER: Teleport Locations", "House Interiors\nRace Tracks\nCity Locations\nPopular Locations\nGym Interiors\nOther", "Select", "Cancel");
		GetPlayerName(playerid, name, sizeof(name));
		format(string, sizeof(string), "AdmCmd: {FFFFFF}Admin %s su dung lenh /go.", name);
		SendAdminMessage(COLOR_RED, string, 1);
	}
	return 1;
}
CMD:serverstats(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;
	SendClientMessage(playerid, COLOR_SERVER, "--------------------------------------------------------------------------------------------------------------------------");	

	va_SendClientMessage(playerid, COLOR_WHITE, "Server start on %s | Server version: %s", StartDate, SERVER_VERSION); 
	va_SendClientMessage(playerid, COLOR_WHITE, "Server tick rate: %d{FFFFFF} | Queries: %d | Players online: %d/100 | Players AFK: %d", GetServerTickRate(), mysql_unprocessed_queries(), Iter_Count(Player), GetAFKPlayers()); 
	va_SendClientMessage(playerid, COLOR_WHITE, "Players online today: %d | Record players: %d on %s", PlayersLoggedDay(), MaxPlayers, MaxPlayersDate); 
	va_SendClientMessage(playerid, COLOR_WHITE, "Registered accounts: %s | Houses: %d/%d | Businesses: %d/%d", FormatNumber(Accounts()), FreeHouses(), Iter_Count(House), FreeBusinesses(), Iter_Count(Bizs), sbiss); 
	va_SendClientMessage(playerid, COLOR_WHITE, "Admins online: %d (%d afk) | Helpers online: %d (%d afk) | Leaders online: %d (%d afk)", CheckAdmins(0), CheckAdmins(1), CheckHelpers(0), CheckHelpers(1), CheckLeaders(0), CheckLeaders(1)); 
	va_SendClientMessage(playerid, COLOR_WHITE, "Players in paintball: %d, %d, %d | Players in race: %d", PlayersOnPaint(0), PlayersOnPaint(1), PlayersOnPaint(2), Iter_Count(PlayerInRace));
	va_SendClientMessage(playerid, COLOR_SERVER, "--------------------------------------------------------------------------------------------------------------------------");	
	
	return 1;
}
CMD:closereport(playerid, params[]) {
	new userID, result[180], string[180];
	if(IsPlayerLogged[playerid] == 0) return SendClientMessage(playerid, COLOR_RED, "Ban chua dang nhap!");
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_GREY, AdminOnly);
	if(AcceptedReport[playerid] != -1) {
		SendClientMessage(playerid, COLOR_YELLOW, "Cuoc tro chuyen ket thuc!");
		SendClientMessage(AcceptedReport[playerid], COLOR_YELLOW, "Cuoc tro chuyen ket thuc!");
		AcceptedReport[AcceptedReport[playerid]] = -1;
		AcceptedReport[playerid] = -1;	
		return 1;
	}
	if(sscanf(params, "us[180]", userID, result)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/closereport <playerid/name> <ly do>");
	if(!IsPlayerConnected(userID) || userID == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong ket noi!");
	if(GetPVarInt(userID, "Reported") == 0) return SendClientMessage(playerid, COLOR_WHITE, "Nguoi choi do khong gui bao cao.");
	format(string, sizeof(string), "Admin %s: %s", GetName(playerid), result);
	SendClientMessage(userID, COLOR_GOLD, string);
	SendClientMessage(userID, COLOR_GOLD, "Bao cao cua ban da duoc dong lai.");
	format(string, sizeof(string), "AdmCmd: %s dong bao cao cua %s.", GetName(playerid), GetName(userID));
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(0x9C0000FF, string, 1);
	format(string, sizeof(string), "Reason: %s", result);
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(0x9C0000FF, string, 1);
	
	if(PlayerInfo[playerid][pAdmin] >= 1 && GetPVarInt(userID, "ReportType") != 4) {
		PlayerInfo[playerid][pHelpedPlayers] += GetPVarInt(userID, "ReportScore");
		PlayerInfo[playerid][pHelpedPlayersToday] += GetPVarInt(userID, "ReportScore");
	}
	else {
		PlayerInfo[playerid][pHelpedPlayers] ++;
		PlayerInfo[playerid][pHelpedPlayersToday] ++;
	}
	
	new szQuery[256];
	format(szQuery, sizeof(szQuery), "UPDATE users SET `HelpedPlayers` = '%d', `HelpedPlayersToday`='%d' WHERE `ID` = '%d'", PlayerInfo[playerid][pHelpedPlayers], PlayerInfo[playerid][pHelpedPlayersToday], PlayerInfo[playerid][pSQLID]);
	mysql_query(SQL, szQuery, false);
	
	SetPVarInt(userID, "Reported", 0);
	SetPVarInt(userID, "ReportType", 0);
	SetPVarString(userID, "ReportedBy", "");
	SetPVarInt(userID, "ReportScore", 0);
	SetPVarString(userID, "ReportText", "");		
	return 1;
}

CMD:acceptreport(playerid, params[]) {
	new userID, string[180];
	if(IsPlayerLogged[playerid] == 0) return SendClientMessage(playerid, COLOR_RED, "Ban chua dang nhap!");
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_GREY, AdminOnly);
	if(AcceptedReport[playerid] != -1) return SendClientMessage(playerid, COLOR_GREY, "Ban da chap nhan mot bao cao!");
	if(sscanf(params, "u", userID)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/chapnhanreport <playerid/name>");
	if(!IsPlayerConnected(userID) || userID == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong ket noi!");
	if(GetPVarInt(userID, "Reported") == 0) return SendClientMessage(playerid, COLOR_WHITE, "Nguoi choi do khong gui bao cao.");
	format(string, sizeof(string), "Admin %s da chap nhan bao cao va dang giai quyet van de cua ban.", GetName(playerid));
	SendClientMessage(userID, COLOR_GOLD, string);
	format(string, sizeof(string), "AdmCmd: %s chap nhan bao cao cua %s.", GetName(playerid), GetName(userID));
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(0x9C0000FF, string, 1);
	PlayerInfo[playerid][pHelpedPlayers] ++;
	PlayerInfo[playerid][pHelpedPlayersToday] ++;
	AcceptedReport[playerid] = userID;
	AcceptedReport[userID] = playerid;
	
	format(string, sizeof(string), "Mot cuoc tro chuyen giua ban va admin %s(%d) da duoc tao ra. (/x)", GetName(playerid), playerid);
	SendClientMessage(userID, COLOR_GOLD, string);
	format(string, sizeof(string), "Mot cuoc tro chuyen giua ban va %s(%d) da duoc tao ra. (/x)", GetName(userID), userID);
	SendClientMessage(playerid, COLOR_GOLD, string);
	
	new szQuery[256];
	format(szQuery, sizeof(szQuery), "UPDATE users SET `HelpedPlayers` = '%d', `HelpedPlayersToday`='%d' WHERE `ID` = '%d'", PlayerInfo[playerid][pHelpedPlayers], PlayerInfo[playerid][pHelpedPlayersToday], PlayerInfo[playerid][pSQLID]);
	mysql_query(SQL, szQuery, false);
	
	if(PlayerInfo[playerid][pAdmin] >= 1 && GetPVarInt(userID, "ReportType") != 4) {
		PlayerInfo[playerid][pHelpedPlayers] += GetPVarInt(userID, "ReportScore");
		PlayerInfo[playerid][pHelpedPlayersToday] += GetPVarInt(userID, "ReportScore");
	}
	else {
		PlayerInfo[playerid][pHelpedPlayers] ++;
		PlayerInfo[playerid][pHelpedPlayersToday] ++;
	}
		
	SetPVarInt(userID, "Reported", 0);
	SetPVarInt(userID, "ReportType", 0);
	SetPVarString(userID, "ReportedBy", "");
	SetPVarInt(userID, "ReportScore", 0);
	SetPVarString(userID, "ReportText", "");		
	return 1;
}

CMD:x(playerid, params[]) {
	if(AcceptedReport[playerid] == -1) return SendClientMessage(playerid, COLOR_GREY, "Ban khong tham gia tro chuyen!");
	new string[256], result[256];
	if(sscanf(params, "s[256]", result)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/x <noi dung>");
	if(PlayerInfo[playerid][pAdmin] >= 1) format(string, sizeof(string), "Admin %s: %s", GetName(playerid), result);
	else format(string, sizeof(string), "Player %s: %s", GetName(playerid), result);
	SendClientMessage(playerid, COLOR_YELLOW, string);
	SendClientMessage(AcceptedReport[playerid], COLOR_YELLOW, string);
	return 1;
}

CMD:rmute(playerid, params[]) {
	new userID, time, result[180];
	if(IsPlayerLogged[playerid] == 0) return SendClientMessage(playerid, COLOR_RED, "Ban chua dang nhap!");
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_GREY, AdminOnly);
	if(sscanf(params, "uis[180]", userID, time, result)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/rmute <playerid/name> <time> <ly do>");
	if(!IsPlayerConnected(userID) || userID == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong ket noi!");
	if(PlayerInfo[userID][pAdmin] > PlayerInfo[playerid][pAdmin]) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot Admin cap cao hon ban!");
	if(userID == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren chinh minh!");
	PlayerInfo[userID][pReportTime] = time*60;
	Update(playerid, pReportTimex);
	new string[180];
	format(string, sizeof(string), "Ban da bi cam khoi kenh /report trong %d phut! Li do: %s", time, result);
	SendClientMessage(userID, -1, string);
	format(string, sizeof(string), "AdmCmd: %s da bi cam chat %d phut tren /report tu %s, Li do: %s", GetName(userID), time, GetName(playerid), result);
	SCMTA(COLOR_LIGHTRED, string);
	return 1;
}

CMD:reports(playerid, params[]) {
	new string[180], result[64];
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;
	SendClientMessage(playerid, COLOR_WHITE, "Reports:");
	foreach(new i: Player) {
		if(GetPVarInt(i, "Reported") == 1) {
			GetPVarString(i, "ReportedBy", result, sizeof(result));
			if(GetPVarInt(i, "ReportType") == 1) {
				format(string, sizeof(string), "DM: %s (%d) bao cao boi %s. Score: %d", GetName(i), i, result, GetPVarInt(i, "ReportScore"));
				MesajLung(playerid, COLOR_DBLUE, string);
			}
			if(GetPVarInt(i, "ReportType") == 2) {
				format(string, sizeof(string), "Cheater: %s (%d) bao cao boi %s. Score: %d", GetName(i), i, result, GetPVarInt(i, "ReportScore"));
				MesajLung(playerid, COLOR_DBLUE, string);
			}
			if(GetPVarInt(i, "ReportType") == 3) {
				format(string, sizeof(string), "Ket map: %s (%d)", GetName(i), i);
				MesajLung(playerid, COLOR_WARNING, string);
			}				
			
			if(GetPVarInt(i, "ReportType") == 4) {
				GetPVarString(i, "ReportText", result, sizeof(result));
				format(string, sizeof(string), "Khac: %s (%d): %s", GetName(i), i, result);
				MesajLung(playerid, COLOR_LGREEN, string);
			}		
		}
	}
	return 1;
}


CMD:dm(playerid, params[]) {
	new id, string[180];
	if(PlayerInfo[playerid][pAdmin] == 0) { }
	else {
		if(sscanf(params, "u",id)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/dm <playerid/name>");
		if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong dang nhap.");
		if(id == playerid && PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren chinh minh!");
		if(PlayerInfo[id][pJailTime] != 0) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do da o trong tu!");
		PlayerInfo[id][pDM] ++;
		UpdateVar(playerid, "DM", PlayerInfo[id][pDM]);
		new minutes = PlayerInfo[id][pDM] * 15;
		
		ResetWeapons(id);
		SetPlayerWantedLevel(id, 6);
		
		PlayerInfo[id][pWantedLevel] = 0;
		Update(id, pWantedLevelx);
		PlayerInfo[id][pJailed] = 2;
		PlayerInfo[id][pJailTime] = minutes*60;
		JailPrice[id] = 0;		
		
		UpdateVar(id, "AJail", 1);
		PlayerInfo[id][pAJail] = 1;
		InsereazaSanctiune(id, playerid, JAIL, "DM");	
		Update(id,pJailedx);
		Update(id,pJailTimex);

		UpdateVar(playerid, "Jails", 1);
		PlayerInfo[playerid][pHelpedPlayers] ++;
		PlayerInfo[playerid][pHelpedPlayersToday] ++;
		
		new szQuery[256];
		format(szQuery, sizeof(szQuery), "UPDATE users SET `HelpedPlayers` = '%d', `HelpedPlayersToday`='%d' WHERE `ID` = '%d'", PlayerInfo[playerid][pHelpedPlayers], PlayerInfo[playerid][pHelpedPlayersToday], PlayerInfo[playerid][pSQLID]);
		mysql_query(SQL, szQuery, false);	
		format(szQuery, sizeof(szQuery), "UPDATE `users` SET `GunLic`='0', `GunLicT`='0', `GunLicS`='5' WHERE `ID`='%d'", PlayerInfo[id][pSQLID]);
		mysql_query(SQL, szQuery, false);				
		format(string, sizeof(string), "AdmCmd: %s da bi day vao nguc boi %s trong %d phut, Li do: DM #%d", GetName(id), GetName(playerid), minutes, PlayerInfo[id][pDM]);
		MesajLung2(COLOR_LIGHTRED, string);
		SendClientMessage(id, COLOR_WARNING, "Giay phep sung cua ban da bi tich thu va cam' trong 5 gio vi ban vao tu do pham luat DM!");
		
		PlayerInfo[id][pGunLicS] = 5;
		PlayerInfo[id][pGunLic] = 0;
		PlayerInfo[id][pGunLicT] = 0;
		ResetPlayerWeapons(id);			
		SpawnPlayer(id);			
	}
	return 1;
}

CMD:dmp(playerid, params[]) {
	new id, string[180];
	if(PlayerInfo[playerid][pAdmin] == 0) return 1;
	if(sscanf(params, "u",id)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/dmp <playerid/name>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong dang nhap.");
	if(id == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren chinh minh!");
	if(PlayerInfo[id][pJailTime] != 0) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do da o trong tu!");	
	PlayerInfo[id][pDM] ++;
	UpdateVar(playerid, "DM", PlayerInfo[id][pDM]);
	new minutes = 10;
	
	ResetWeapons(id);
	SetPlayerWantedLevel(id, 6);
	
	PlayerInfo[id][pWantedLevel] = 0;
	Update(id, pWantedLevelx);
	PlayerInfo[id][pJailed] = 2;
	PlayerInfo[id][pJailTime] = minutes*60;
	JailPrice[id] = 0;		
	
	UpdateVar(id, "AJail", 1);
	PlayerInfo[id][pAJail] = 1;
	InsereazaSanctiune(id, playerid, JAIL, "DM");	
	Update(id,pJailedx);
	Update(id,pJailTimex);

	UpdateVar(playerid, "Jails", 1);
	PlayerInfo[playerid][pHelpedPlayers] ++;
	PlayerInfo[playerid][pHelpedPlayersToday] ++;
	
	new szQuery[256];
	format(szQuery, sizeof(szQuery), "UPDATE users SET `HelpedPlayers` = '%d', `HelpedPlayersToday`='%d' WHERE `ID` = '%d'", PlayerInfo[playerid][pHelpedPlayers], PlayerInfo[playerid][pHelpedPlayersToday], PlayerInfo[playerid][pSQLID]);
	mysql_query(SQL, szQuery, false);
	format(string, sizeof(string), "AdmCmd: %s da bi day vao nguc boi %s trong %d phut, Li do: DM #%d", GetName(id), GetName(playerid), minutes, PlayerInfo[id][pDM]);
	MesajLung2(COLOR_LIGHTRED, string);
	SpawnPlayer(id);
	return 1;
}

CMD:report(playerid, params[]) {
	if(PlayerInfo[playerid][pReportTime] >= 1) {	
		new string[128];
		format(string, sizeof(string), "Ban co the bao cao sau %d phut (%d giay).", PlayerInfo[playerid][pReportTime]/60, PlayerInfo[playerid][pReportTime]);
		SendClientMessage(playerid, COLOR_GRAD4, string);
		return 1;
	}
	if(PlayerInfo[playerid][pAdmin] >= 1 && GetPVarInt(playerid, "Cover") == 0) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the bao cao vi ban la Admin!");
	if(PlayerInfo[playerid][pLevel] < 5) SendClientMessage(playerid, COLOR_LGREEN, "Khong bao cao voi nhung ly do khong can thiet nhu: ''can gap admin'' vi ban se bi xu phat!");
	Dialog_Show(playerid, DIALOG_REPORT, DIALOG_STYLE_LIST, "Report", "Bao cao DM\nBao cao phan mem thu 3\nCau hoi ve nap the\nBi ket map\nVan de khac", "Select", "Close");
	return 1;
}
CMD:aduty(playerid, params[], help) {
	new string[120];
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, -1, AdminOnly);
	if(Aduty[playerid] == 0) {
		Aduty[playerid] = 1;
		format(string, sizeof(string), "{He Thong}: {FFFFFF}Admin %s vua onduty", GetName(playerid));
	    SendAdminMessage(COLOR_LIGHTRED, string,1);
		SetPlayerArmourEx(playerid, 1000);
		Update3DTextLabelText(adminLabel[playerid], -1, "");
		adminLabel[playerid] = Create3DTextLabel("", -1, 0.0, 0.0, 0.0, 70.0, 0, 0);
		Update3DTextLabelText(adminLabel[playerid], COLOR_LIGHTRED, "{FFFF00}ADMIN ONDUTY");
		Attach3DTextLabelToPlayer(adminLabel[playerid], playerid, 0.0, 0.0, -0.1);
		SetPlayerHealthEx(playerid, 1000);
		SetPlayerSkinEx(playerid, 217);
	}	
	else if(Aduty[playerid] == 1) {
		Aduty[playerid] = 0;
		format(string, sizeof(string), "{He Thong}: {FFFFFF}Admin %s vua off duty", GetName(playerid));
	    SendAdminMessage(COLOR_LIGHTRED, string,1);
		Delete3DTextLabel(adminLabel[playerid]);
		SetPlayerArmourEx(playerid, 0);
		SetPlayerHealthEx(playerid, 100);
	}
	return 1;	
}


CMD:aoduty(playerid, params[]) {

	if(!Iter_Contains(PlayerAdmins, playerid)) return SendClientMessage(playerid, COLOR_GREY, AdminOnly);
	if(!Iter_Contains(AdminDuty, playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong onduty de su dung lenh nay.");

	SendClientMessage(playerid, COLOR_YELLOW, "Bay gio ban khong con lam nhiem vu nua, de co the bat dau trach nhiem cua ban voi server, su dung: [/aduty]");

	Iter_Remove(AdminDuty, playerid);

	stop dutyTimer[playerid];

	new string[80];
	format(string, 80, "Admin %s hien khong con lam nhiem vu (/aoduty).", GetName(playerid));
	SendAdminMessage(COLOR_ADMCHAT, string, 1);

	return true;
}
CMD:respawnthiscar(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;
	if(!IsPlayerInAnyVehicle(playerid)) return 1;
   	SetVehicleToRespawn(GetPlayerVehicleID(playerid));
	new string[180];
	format(string, sizeof(string), "[{B81616}AdmWarning{FFFFFF}] %s da respawn xe %d.", GetName(playerid), GetPlayerVehicleID(playerid));
	SendAdminMessage(-1, string, 1);
	return 1;
}

CMD:nearplayers(playerid, params[]) {	
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;
	new range, Float:rPos[4], x, string[180];
	if(sscanf(params, "ii", range)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/nearplayers <range>");
    GetPlayerPos(playerid, rPos[0], rPos[1], rPos[2]);
	foreach(new i: Player) {
		if(IsPlayerInRangeOfPoint(i, range, rPos[0], rPos[1], rPos[2])) x ++;
	}
	format(string, sizeof(string), "Ban da tim thay %d nguoi trong pham vi %dm.", x, range);
	SendClientMessage(playerid, COLOR_LGREEN, string);
	return 1;
}
CMD:neargun(playerid, params[])
{
	new range, gun, ammo, Float:rPos[4], x, string[180];
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;
	if(sscanf(params, "iii", gun, ammo, range)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/neargun <gun> <ammo> <range>");
    GetPlayerPos(playerid, rPos[0], rPos[1], rPos[2]);
	foreach(new i: Player) {
		if(IsPlayerInRangeOfPoint(i, range, rPos[0], rPos[1], rPos[2])) {
			ServerWeapon(i, gun, ammo, false);
			x++;
		}
	}
	new wname[32];
	GetWeaponName(gun, wname, 32);
	format(string, sizeof(string), "AdmCmd: %s da set vu khi %s cho %d nguoi trong ban kinh %dm.", GetName(playerid), wname, x, range);
	SendAdminMessage(COLOR_LOGS, string, 1);
	return 1;
}
CMD:count(playerid, params[]) {
	new number;
	if(IsPlayerLogged[playerid] == 0) return SendClientMessage(playerid, COLOR_RED, "Ban chua dang nhap!");
	if(sscanf(params, "i", number)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/count <nr>");
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay.");
	if(number < 2 && number >= 360) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: So khong hop le. (1-360)");
	if(countTimer != Timer:0) {
		TextDrawHideForAll(CountTD);
		stop countTimer;
		countTimer = Timer:0;
	}
	TextDrawShowForAll(CountTD);
	Countnr = number;
	countTimer = repeat Count[1000]();
	return 1;
}
CMD:area(playerid, params[]) {
	new range, Float:rPos[4], string[180], item[50], players;
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;
	if(Iter_Contains(PlayerInRace, playerid) && PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong duoc phep su dung lenh nay khi ban dang o trong dau truong dua xe!");
	if(sscanf(params, "s[50]i", item, range)) {
		SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/area <name> <range>");
		SendClientMessage(playerid, COLOR_WHITE, "freeze, unfreeze, heal, armor, fixveh, disarm, respawn, respawncar.");
		return 1;
	}
	foreach(new i: Player) {
		GetPlayerPos(playerid, rPos[0], rPos[1], rPos[2]);
		if(strcmp(item, "freeze", true) == 0) {
	 		if(IsPlayerInRangeOfPoint(i, range, rPos[0], rPos[1], rPos[2]) && i != playerid && GetPlayerVirtualWorld(i) == GetPlayerVirtualWorld(playerid)) {
		  		TogglePlayerControllable(i, false);
		  		Freezed[i] = 1;
				players++;
				format(string, sizeof(string), "* %s da dong bang ban.", GetName(playerid));
				SendClientMessage(i, COLOR_YELLOW, string);
			}
		}
		else if(strcmp(item, "unfreeze", true) == 0) {
	 		if(IsPlayerInRangeOfPoint(i, range, rPos[0], rPos[1], rPos[2]) && i != playerid && GetPlayerVirtualWorld(i) == GetPlayerVirtualWorld(playerid)) {
	 			Freezed[playerid] = 0;
			  	TogglePlayerControllable(i, true);
				players++;
				format(string, sizeof(string), "* %s da pha' bang cho ban.", GetName(playerid));
				SendClientMessage(i, COLOR_YELLOW, string);
			}
		}		
		else if(strcmp(item, "heal", true) == 0) {
	 		if(IsPlayerInRangeOfPoint(i, range, rPos[0], rPos[1], rPos[2]) && GetPlayerVirtualWorld(i) == GetPlayerVirtualWorld(playerid)) {
				SetPlayerHealthEx(i, 99);
				players++;
				format(string, sizeof(string), "* %s da hoi mau cho ban.", GetName(playerid));
				SendClientMessage(i, COLOR_YELLOW, string);
   			}
		}
		else if(strcmp(item, "armor", true) == 0) {
	 		if(IsPlayerInRangeOfPoint(i, range, rPos[0], rPos[1], rPos[2]) && GetPlayerVirtualWorld(i) == GetPlayerVirtualWorld(playerid)) {
				SetPlayerArmourEx(i, 99);
				players++;
				format(string, sizeof(string), "* %s de cho ban giap.", GetName(playerid));
				SendClientMessage(i, COLOR_YELLOW, string);
   			}
		}
		else if(strcmp(item, "fixveh", true) == 0) {
			if(IsPlayerInRangeOfPoint(i, range, rPos[0], rPos[1], rPos[2]) && GetPlayerVirtualWorld(i) == GetPlayerVirtualWorld(playerid)) {
				if(IsPlayerInVehicle(i, GetPlayerVehicleID(i))) {
					RepairVehicle(GetPlayerVehicleID(i));
					SetVehicleHealth(GetPlayerVehicleID(i), 999.0);
					format(string, sizeof(string), "* %s da sua xe cua ban.", GetName(playerid));
					SendClientMessage(i, COLOR_YELLOW, string);
					players++;
				}
			}
		}
		else if(strcmp(item, "disarm", true, strlen(item)) == 0) {
	 		if(IsPlayerInRangeOfPoint(i, range, rPos[0], rPos[1], rPos[2]) && i != playerid && GetPlayerVirtualWorld(i) == GetPlayerVirtualWorld(playerid)) {
	 			ResetWeapons(i);
				format(string, sizeof(string), "* %s da tich thu vu khi cua ban.", GetName(playerid));
				SendClientMessage(i, COLOR_YELLOW, string);
				players++;
			}
		}
		else if(strcmp(item, "respawn", true, strlen(item)) == 0) {
	 		if(IsPlayerInRangeOfPoint(i, range, rPos[0], rPos[1], rPos[2]) && i != playerid && GetPlayerVirtualWorld(i) == GetPlayerVirtualWorld(playerid)) {
	 			SpawnPlayer(i);
				format(string, sizeof(string), "* %s da respawn ban.", GetName(playerid));
				SendClientMessage(i, COLOR_YELLOW, string);
				players++;
			}
		}		
		else if(strcmp(item, "respawncar", true, strlen(item)) == 0) RespawnCarRange(playerid, range);
		else return SendClientMessage(playerid, COLOR_WHITE, "freeze, unfreeze, heal, armor, fixveh, disarm, respawn, respawncar.");
		
		if(PlayerInfo[i][pAdmin] >= 5) {
			PlayerPlaySound(i, 1056, 0.0, 0.0, 0.0);
			format(string, sizeof(string), "AdmCmd: %s vua su dung '/area %s' cho %d nguoi choi.", GetName(playerid), item, players);
			SendClientMessage(i, COLOR_LOGS, string);
		}
	}
	return 1;
}
CMD:cspec(playerid, params[])
{
	new cid, string[180];
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;
	if(sscanf(params, "i", cid)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/cspec <clan id (0=off)>");
	if(cid < 0 && cid > 500) return SendClientMessage(playerid, COLOR_GREY, "ID khong hop le! (0-500)");
	if(PlayerInfo[playerid][pClan] == cid && cid != 0) return SendClientMessage(playerid, COLOR_GREY, "Ban o trong clan nay!");
	SpecClan[playerid] = cid;
	if(cid == 0) return SendClientMessage(playerid, COLOR_YELLOW, "Tuy chon cua ban da tat tinh nang nay!");
	else {
		format(string, sizeof(string), "Ban dang xem chat cua clan %d.", cid);
		SendClientMessage(playerid, COLOR_YELLOW, string);
	}
	return 1;
}
CMD:fspec(playerid, params[])
{
	new fid, string[180];
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;
	if(sscanf(params, "i", fid)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/fspec <fid (0=off)>");
	if(fid < 0 && fid > 15) return SendClientMessage(playerid, COLOR_GREY, "ID khong hop le! (0-15)");
	if(PlayerInfo[playerid][pMember] == fid && fid != 0) return SendClientMessage(playerid, COLOR_GREY, "Ban o trong to chuc nay!");
	SpecFaction[playerid] = fid;
	if(fid == 0) return SendClientMessage(playerid, COLOR_YELLOW, "Tuy chon cua ban da tat tinh nang nay!");
	else {
		format(string, sizeof(string), "Ban dang xem chat cua faction %s (%d)!", FactionName(fid), fid);
		SendClientMessage(playerid, COLOR_YELLOW, string);
	}
	return 1;
}
CMD:fchat(playerid, params[])
{
	if(IsPlayerConnected(playerid))
	{
		if(PlayerInfo[playerid][pAdmin] >= 1)
		{
			new message[128],name[30], string[256];
			if(sscanf(params, "s[128]",message)) return SendClientMessage(playerid, COLOR_GREY, "Su dung:{FFFFFF} /fchat [message]");
			if(SpecFaction[playerid] > 0)
			{
				GetPlayerName(playerid, name, sizeof(name));
				format(string, sizeof(string),"# Admin %s: %s", name, message);
				SendRadioMessage(SpecFaction[playerid], COLOR_LIGHTRED, string);
			}
			else return SendClientMessage(playerid, COLOR_GREY, "Ban khong theo doi to chuc, /fspec de theo doi.");
		}
		else return 1;
	}
	return 1;
}
CMD:respawncar(playerid, params[])
{
	new carid;
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;
	if(sscanf(params, "i", carid)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/respawncar <car id>");
	SetVehicleToRespawn(carid);
	new string[180];
	format(string, sizeof(string), "[{B81616}AdmWarning{FFFFFF}]: %s da respawn xe %d.", GetName(playerid), carid);
	SendAdminMessage(-1, string, 1);
	return 1;
}
CMD:deletead(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1 && PlayerInfo[playerid][pHelper] < 1) return SendClientMessage(playerid,COLOR_WHITE,AdminOnly);
	new id, reason[120], string[180];
	if(sscanf(params, "us[120]", id, reason)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/deletead <playerid/name> <ly do>");
	if(AdTimer[id] == Timer:0) return SendClientMessage(playerid,COLOR_WHITE, "Nguoi choi do khong dat quang cao.");
	format(string, sizeof(string), "AdmBot: %s da xoa quang cao cua %s, Li do: %s", GetName(playerid), GetName(id), reason);
	SendStaffMessage(COLOR_LOGS, string);
	format(string, sizeof(string), "Quang cao cua ban da bi xoa boi %s, Li do: %s", GetName(playerid), reason);
	SendClientMessage(id, COLOR_YELLOW, string);
	AdTimer[id] = Timer:0;
	stop AdTimer[id];
	PlayerInfo[playerid][pHelpedPlayers] ++;
	PlayerInfo[playerid][pHelpedPlayersToday] ++;
	new szQuery[256];
	format(szQuery, sizeof(szQuery), "UPDATE users SET `HelpedPlayers` = '%d', `HelpedPlayersToday`='%d' WHERE `ID` = '%d'", PlayerInfo[playerid][pHelpedPlayers], PlayerInfo[playerid][pHelpedPlayersToday], PlayerInfo[playerid][pSQLID]);
	mysql_query(SQL, szQuery, false);	
	return 1;
}
CMD:lspec(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1 && PlayerInfo[playerid][pHelper] < 1 && PlayerInfo[playerid][pLeader] != 0) {
		if(InWar[PlayerInfo[playerid][pLeader]]) {
			if(Iter_Contains(PlayerInRace, playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong duoc phep su dung lenh nay khi ban dang o trong dau truong dua xe!");
			new id,string[180];
			if(sscanf(params, "u", id)) return SendClientMessage(playerid,COLOR_GREY, "Su dung: {FFFFFF}/lspec <playerid/name>");
			if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong dang nhap.");
			if(id == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren chinh minh!");
			if(PlayerInfo[id][pMember] != PlayerInfo[playerid][pMember]) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay len thanh vien ngoai to chuc!");
			if(PlayerInfo[id][pAdmin] > PlayerInfo[playerid][pAdmin]) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay len nguoi choi do.");
			Spectate[playerid] = id;
			SpecPlayers[playerid] = 1;
			GetPlayerPos(playerid, SpecPos[playerid][0], SpecPos[playerid][1], SpecPos[playerid][2]);
			IsPlayerSpec[playerid] = 1;
			pInteriorID[playerid] = GetPlayerInterior(playerid);
			pVirtual[playerid] = GetPlayerVirtualWorld(playerid);

			new Float:health;
			GetPlayerHealthEx(Spectate[playerid], health);
			new rank[50];
			if(PlayerInfo[playerid][pAdmin] != 0) rank = "Admin";
			else rank = "Helper";
			
			if(GetPVarInt(id, "ReportType") == 1) format(string, sizeof(string), "%s %s dang spec %s. (bao cao dm, score: %d)", rank, GetName(playerid),GetName(id), GetPVarInt(id, "ReportScore")); 
			else if(GetPVarInt(id, "ReportType") == 2) format(string, sizeof(string), "%s %s dang spec %s. (bao cao phan mem thu 3, score: %d)", rank, GetName(playerid),GetName(id), GetPVarInt(id, "ReportScore"));  
			else if(GetPVarInt(id, "ReportType") == 3)  format(string, sizeof(string), "%s %s dang spec %s. (ket map)", rank, GetName(playerid),GetName(id));
			else format(string, sizeof(string), "%s %s dang spec %s.", rank, GetName(playerid),GetName(id));
			if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(COLOR_YELLOW, string,1);
			
			if(GetPVarInt(id, "Reported") == 1 && GetPVarInt(id, "ReportType") != 4 && PlayerInfo[playerid][pAdmin] >= 1) {
				SetPVarInt(id, "Reported", 0);
				SetPVarInt(id, "ReportType", 0);
				SetPVarString(id, "ReportedBy", "");
				SetPVarInt(id, "ReportScore", 0);
				SetPVarString(id, "ReportText", "");		
			}
			if(PlayerInfo[playerid][pAdmin] >= 1 && GetPVarInt(id, "ReportType") != 4) {
				PlayerInfo[playerid][pHelpedPlayers] += GetPVarInt(id, "ReportScore");
				PlayerInfo[playerid][pHelpedPlayersToday] += GetPVarInt(id, "ReportScore");
			}	
			new szQuery[256];
			format(szQuery, sizeof(szQuery), "UPDATE users SET `HelpedPlayers` = '%d', `HelpedPlayersToday`='%d' WHERE `ID` = '%d'", PlayerInfo[playerid][pHelpedPlayers], PlayerInfo[playerid][pHelpedPlayersToday], PlayerInfo[playerid][pSQLID]);
			mysql_query(SQL, szQuery, false);
			
			format(string, sizeof(string), "[SPEC] (%d) %s | Level: %d | Health: %.2f | AFK Time: %d | Seconds: %.0f | Duty: %d | Ping: %d",id,GetName(id),PlayerInfo[id][pLevel], health, AFKSeconds[id], PlayerInfo[id][pSeconds], OnDuty[id], GetPlayerPing(id));
			SendClientMessage(playerid, 0xFFADADFF, string);
			
			new Player_Weapons[13], Player_Ammos[13], i, guns;
			string = "Weapons:";	
			for(i = 1;i <= 12;i++) {
				GetPlayerWeaponData(id,i,Player_Weapons[i],Player_Ammos[i]);
				if(Player_Weapons[i] != 0) {
					new weaponName[180];
					GetWeaponName(Player_Weapons[i],weaponName,255);
					format(string,255,"%s %s(%d)", string, weaponName,Player_Ammos[i]);
					guns ++;
				}
			}
			if(guns > 0) SendClientMessage(playerid, -1, string);

			TogglePlayerSpectating(playerid, true);
			SetPlayerInterior(playerid, GetPlayerInterior(id));
			SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(id));
			
			if(IsPlayerInAnyVehicle(Spectate[playerid])) PlayerSpectateVehicle(playerid, GetPlayerVehicleID(Spectate[playerid]));
			else PlayerSpectatePlayer(playerid, Spectate[playerid]);
			
			PlayerTextDrawSetString(playerid, SpectatorTD, "Loading...");
			PlayerTextDrawShow(playerid, SpectatorTD);					
		} else SendClientMessage(playerid, -1, "Ban chi co the dung lenh nay khi war.");
	} else return SendClientMessage(playerid, -1, "Ban khong phai la lanh dao.");
	return 1;
}
CMD:spec(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1 && PlayerInfo[playerid][pHelper] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	if(Iter_Contains(PlayerInRace, playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong duoc phep su dung lenh nay khi ban dang o trong dau truong dua xe!");
	new id,string[180];
	if(sscanf(params, "u", id)) return SendClientMessage(playerid,COLOR_GREY, "Su dung: {FFFFFF}/spec <playerid/name>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong dang nhap.");
	if(id == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren chinh minh!");
	if(PlayerInfo[id][pAdmin] > PlayerInfo[playerid][pAdmin]) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay len nguoi choi do.");
	Spectate[playerid] = id;
	SpecPlayers[playerid] = 1;
	GetPlayerPos(playerid, SpecPos[playerid][0], SpecPos[playerid][1], SpecPos[playerid][2]);
	IsPlayerSpec[playerid] = 1;
	pInteriorID[playerid] = GetPlayerInterior(playerid);
	pVirtual[playerid] = GetPlayerVirtualWorld(playerid);

	new Float:health;
	GetPlayerHealthEx(Spectate[playerid], health);
	new rank[50];
	if(PlayerInfo[playerid][pAdmin] != 0) rank = "Admin";
	else rank = "Helper";
	
	if(GetPVarInt(id, "ReportType") == 1) format(string, sizeof(string), "%s %s dang spec %s. (bao cao dm, score: %d)", rank, GetName(playerid),GetName(id), GetPVarInt(id, "ReportScore")); 
	else if(GetPVarInt(id, "ReportType") == 2) format(string, sizeof(string), "%s %s dang spec %s. (bao cao phan mem thu 3, score: %d)", rank, GetName(playerid),GetName(id), GetPVarInt(id, "ReportScore"));  
	else if(GetPVarInt(id, "ReportType") == 3)  format(string, sizeof(string), "%s %s dang spec %s. (ket map)", rank, GetName(playerid),GetName(id));
	else format(string, sizeof(string), "%s %s dang spec %s.", rank, GetName(playerid),GetName(id));
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(COLOR_YELLOW, string,1);
	
	if(GetPVarInt(id, "Reported") == 1 && GetPVarInt(id, "ReportType") != 4 && PlayerInfo[playerid][pAdmin] >= 1) {
		SetPVarInt(id, "Reported", 0);
		SetPVarInt(id, "ReportType", 0);
		SetPVarString(id, "ReportedBy", "");
		SetPVarInt(id, "ReportScore", 0);
		SetPVarString(id, "ReportText", "");		
	}
	if(PlayerInfo[playerid][pAdmin] >= 1 && GetPVarInt(id, "ReportType") != 4) {
		PlayerInfo[playerid][pHelpedPlayers] += GetPVarInt(id, "ReportScore");
		PlayerInfo[playerid][pHelpedPlayersToday] += GetPVarInt(id, "ReportScore");
	}	
	new szQuery[256];
	format(szQuery, sizeof(szQuery), "UPDATE users SET `HelpedPlayers` = '%d', `HelpedPlayersToday`='%d' WHERE `ID` = '%d'", PlayerInfo[playerid][pHelpedPlayers], PlayerInfo[playerid][pHelpedPlayersToday], PlayerInfo[playerid][pSQLID]);
	mysql_query(SQL, szQuery, false);
	
	format(string, sizeof(string), "[SPEC] (%d) %s | Level: %d | Health: %.2f | AFK Time: %d | Seconds: %.0f | Duty: %d | Ping: %d",id,GetName(id),PlayerInfo[id][pLevel], health, AFKSeconds[id], PlayerInfo[id][pSeconds], OnDuty[id], GetPlayerPing(id));
	SendClientMessage(playerid, 0xFFADADFF, string);
	
	new Player_Weapons[13], Player_Ammos[13], i, guns;
	string = "Weapons:";	
	for(i = 1;i <= 12;i++) {
		GetPlayerWeaponData(id,i,Player_Weapons[i],Player_Ammos[i]);
		if(Player_Weapons[i] != 0) {
			new weaponName[180];
			GetWeaponName(Player_Weapons[i],weaponName,255);
			format(string,255,"%s %s(%d)", string, weaponName,Player_Ammos[i]);
			guns ++;
		}
	}
	if(guns > 0) SendClientMessage(playerid, -1, string);

	TogglePlayerSpectating(playerid, true);
	SetPlayerInterior(playerid, GetPlayerInterior(id));
	SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(id));
	
	if(IsPlayerInAnyVehicle(Spectate[playerid])) PlayerSpectateVehicle(playerid, GetPlayerVehicleID(Spectate[playerid]));
	else PlayerSpectatePlayer(playerid, Spectate[playerid]);
	
	PlayerTextDrawSetString(playerid, SpectatorTD, "Loading...");
	PlayerTextDrawShow(playerid, SpectatorTD);						
	return 1;
}
CMD:speco(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	if(Iter_Contains(PlayerInRace, playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong duoc phep su dung lenh nay khi ban dang o trong dau truong dua xe!");
	new id,string[180];
	if(sscanf(params, "u", id)) return SendClientMessage(playerid,COLOR_GREY, "Su dung: {FFFFFF}/speco <playerid/name>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong dang nhap.");
	if(id == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren chinh minh!");
	Spectate[playerid] = id;
	SpecPlayers[playerid] = 1;
	GetPlayerPos(playerid, SpecPos[playerid][0], SpecPos[playerid][1], SpecPos[playerid][2]);
	IsPlayerSpec[playerid] = 1;
	pInteriorID[playerid] = GetPlayerInterior(playerid);
	pVirtual[playerid] = GetPlayerVirtualWorld(playerid);

	new Float:health;
	GetPlayerHealthEx(Spectate[playerid], health);
	
	new Player_Weapons[13], Player_Ammos[13], i, guns;
	string = "Weapons:";	
	for(i = 1;i <= 12;i++) {
		GetPlayerWeaponData(id,i,Player_Weapons[i],Player_Ammos[i]);
		if(Player_Weapons[i] != 0) {
			new weaponName[180];
			GetWeaponName(Player_Weapons[i],weaponName,255);
			format(string,255,"%s %s(%d)", string, weaponName,Player_Ammos[i]);
			guns ++;
		}
	}
	if(guns > 0) SendClientMessage(playerid, -1, string);

	TogglePlayerSpectating(playerid, true);
	SetPlayerInterior(playerid, GetPlayerInterior(id));
	SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(id));
	
	if(IsPlayerInAnyVehicle(Spectate[playerid])) PlayerSpectateVehicle(playerid, GetPlayerVehicleID(Spectate[playerid]));
	else PlayerSpectatePlayer(playerid, Spectate[playerid]);
	
	PlayerTextDrawSetString(playerid, SpectatorTD, "Loading...");
	PlayerTextDrawShow(playerid, SpectatorTD);						
	return 1;
}
CMD:specoff(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1 && PlayerInfo[playerid][pHelper] < 2) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	if(Spectate[playerid] == 255) return 1;
	TogglePlayerControllable(playerid, true);
	TogglePlayerSpectating(playerid, false);
	SetPlayerInterior(playerid,Unspec[playerid][sPint]);
	PlayerInfo[playerid][pInt] = Unspec[playerid][sPint];
	PlayerInfo[playerid][pLocal] = Unspec[playerid][sLocal];
	Unspec[playerid][sLocal] = 255;
	gTeam[playerid] = PlayerInfo[playerid][pTeam];
	SetPlayerToTeamColor(playerid);
	SendClientMessage(playerid, -1, "Ban da stop spec!");
	SpawnPlayer(playerid);
	Spectate[playerid] = 255;
	SpecPlayers[playerid] = 0;
	LastRecon[playerid] = 1;
	PlayerTextDrawHide(playerid, SpectatorTD);
	return 1;
}
CMD:ah(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] >= 1) {
		new szDialog[2000];
		if(PlayerInfo[playerid][pAdmin] >= 1) {
			strcat(szDialog, "{5F9CC9}Admin 1:{FFFFFF}\n/ban /bano /kick /ajail /ajailo /reports /ar /cr /mute /unmute /check /warn /unwarn /goto /gethere /bigears /respawncar /o /disarm\n");
			strcat(szDialog, "/cc /spec /setvw /setint /freeze /unfreeze /starttp /startevent /slapcar /vsearch /fspec /suspend /lp /slap /rmute /respawn /deletead /inrace /as\n");
			strcat(szDialog, "/gotohouse /alicenses /rnewbie /afklist /cspec /inevent /wars /setjob /dm /dmp /suspendo /ip /despawncars /despawncar /fmats (kiem tra vat lieu cua fac) /call112\n");
			strcat(szDialog, "/gotoboxing /boxingevent /gotocnn\n");
			strcat(szDialog, "/profile /wprofile /reset /wreset\n\n");
		}
		if(PlayerInfo[playerid][pAdmin] >= 2) {
			strcat(szDialog, "{5F9CC9}Admin 2:{FFFFFF}\n/unjail /getip /checkweapons /neargun /nearskin /jetpack /area\n");
			strcat(szDialog, "/addobject /removeobjects /aclear /banip\n\n");
		}
		if(PlayerInfo[playerid][pAdmin] >= 3) {
			strcat(szDialog, "{5F9CC9}Admin 3:{FFFFFF}\n/mark /gotomark /getcar /gotocar /rac /alias /unban /setyt /givegun /unbanip\n\n");
		}
		if(PlayerInfo[playerid][pAdmin] >= 4) {
			strcat(szDialog, "{5F9CC9}Admin 4:{FFFFFF}\n/sethp /setarmor /unwarn /fuelcars /weather /skick /sethelper /setleader /setfp /fpkoff /agl\n");
			strcat(szDialog, "/sethw /setlw\n\n");
		}
		if(PlayerInfo[playerid][pAdmin] >= 5) {
			strcat(szDialog, "{5F9CC9}Admin 5:{FFFFFF}\n/gotobiz /gotojob /givemoney /money /asellhouse /asellbiz /licitatie /fpk /tod /deletefurniture /acover /acoveroff /levelupall\n");
 			strcat(szDialog, "/editraport /setrankname /auctions /acc /spawncar /editfac /helperchatcolor /listtoys\n\n");
		}
		if(PlayerInfo[playerid][pAdmin] >= 6) {
			strcat(szDialog, "{5F9CC9}Admin 6:{FFFFFF}\n/restart /restartgame /createhouse /editjob /editclan /edithouse /movehouse /editbizz /deleteclan /givepp /apark /systems\n");
			strcat(szDialog, "/givevehicle /setstat /giftpointsall /restartmissions /addcmd /removecmd /givehouse /givebiz /movebiz /setaw /addsafezone /editsafezone /deletecar\n");
			strcat(szDialog, "/editvehicle /vpark /vinfo /ao /reloadstuffs /minlevel /maxmember /setjobcuangay (/editjob de chinh so tien cong them)\n\n");
			strcat(szDialog, "/giveinv /giveobject /gotogift /dropgift /givecase (member /openbox) /movefactioninterior /tatcmd\n");
		}
		if(PlayerInfo[playerid][pAdmin] >= 7) {
			strcat(szDialog, "{5F9CC9}Admin 7:{FFFFFF}\n/setskin /resetdailybonus (da xoa) /kickall /restartgame /restart /cancelrestart /resetdailyquest /createcode {FF0000}(neu chua reset nhiem vu: /restartmissions)\n/giveallmoney /giveallpp /giveallrp /givealllevel");
		}
		Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "{FFFFFF}Lenh:", szDialog, "Close", "");		
	}
	else SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
 	return 1;
}
CMD:warn(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE,  AdminOnly);
	if(DeelayCommand[playerid][1] > 0) return DeelayTime(playerid, 1);
	new id,reason[128],string[200],ip[25];
	if(sscanf(params, "us[128]", id, reason)) return SendClientMessage(playerid,COLOR_GREY, "Su dung: {FFFFFF}/warn <playerid/name> <ly do>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong dang nhap.");
	GetPlayerIp(id, ip, sizeof(ip));
	if(FaceReclama(reason)) return RemoveFunction(playerid, reason);
	if(PlayerInfo[id][pAdmin] > PlayerInfo[playerid][pAdmin]) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay len nguoi choi do.");
	PlayerInfo[id][pWarns] += 1;
	format(string, sizeof(string), "AdmCmd: %s da bi phat duoc mot diem {FF0000}canh cao{FF6347} boi %s, Li do: %s", GetName(id), GetName(playerid), reason);
	SCMTA(COLOR_LIGHTRED, string);
	InsereazaSanctiune(id, playerid, WARN, reason);
	Update(id,pWarnsx);
	if(PlayerInfo[id][pWarns] >= 3) {
		new year,month,day;
		getdate(year, month, day);
		day += 3;
		if(IsMonth31(month)) {
			if(day > 31) {
				month += 1;
				if(month > 12) {
					year += 1;
					while(day > 31) day -= 31;
				}
				else while(day > 31) day -= 31;
			}
		}
		else if(!IsMonth31(month)) {
			if(day > 30) {
				month += 1;
				if(month > 12) {
					year += 1;
					while(day > 30) day -= 30;
				}
				else while(day > 30) day -= 30;
			}
		}
		else if(!IsMonth31(month) && IsMonth29(year) && month == 2) {
			if(day > 29) {
				month += 1;
				if(month > 12) {
					year += 1;
					while(day > 29) day -= 29;
				}
				else while(day > 29) day -= 29;
			}
		}
		else if(!IsMonth31(month) && !IsMonth29(year) && month == 2) {
			if(day > 28) {
				month += 1;
				if(month > 12) {
					year += 1;
					while(day > 28) day -= 28;
				}
				else while(day > 28) day -= 28;
			}
		}
		DeelayCommand[playerid][1] = 10;
		PlayerInfo[id][pBTemp] = 1;
		PlayerInfo[id][pBYear] = year;
		PlayerInfo[id][pBMonth] = month;
		PlayerInfo[id][pBDay] = day;
		strmid(PlayerInfo[id][pBBy], GetName(playerid), 0, strlen(GetName(playerid)), 34);
		strmid(PlayerInfo[id][pBReason], reason, 0, strlen(reason), 50);
		Update(id,pBTempx);
		Update(id,pBYearx);
		Update(id,pBMonthx);
		Update(id,pBDayx);
		Update(id,pBByx);
		Update(id,pBReasonx);
		PlayerInfo[id][pWarns] = 0;
		UpdateVar(playerid, "Warns", 1);
		Update(id,pWarnsx);
		format(string, sizeof(string), "AdmCmd: %s da bi banned boi AdmBot (3/3 canh cao) trong 2 ngay, Li do: %s", GetName(id),reason);
		SCMTA(COLOR_LIGHTRED, string);
		InsereazaSanctiune(id, playerid, BAN, "3/3 warns");
		Banlog(ip,GetName(id),GetName(playerid),"3 Warnings",2);
		KickEx(id);
	}
	PlayerInfo[playerid][pHelpedPlayers] ++;
	PlayerInfo[playerid][pHelpedPlayersToday] ++;
	new szQuery[256];
	format(szQuery, sizeof(szQuery), "UPDATE users SET `HelpedPlayers` = '%d', `HelpedPlayersToday`='%d' WHERE `ID` = '%d'", PlayerInfo[playerid][pHelpedPlayers], PlayerInfo[playerid][pHelpedPlayersToday], PlayerInfo[playerid][pSQLID]);
	mysql_query(SQL, szQuery, false);								
	return 1;
}

CMD:warno(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE,  AdminOnly);
	if(DeelayCommand[playerid][1] > 0) return DeelayTime(playerid, 1);
	new id[25],reason[128],string[200],sendername[30],cont;
	if(sscanf(params, "s[25]s[128]", id, reason)) return SendClientMessage(playerid,COLOR_GREY, "Su dung: {FFFFFF}/warno <name> <ly do>");
	cont = MySQLCheckAccount(id);
	if(cont == 0) return SendClientMessage(playerid,COLOR_LGREEN, "ERROR: Tai khoan khong duoc tim thay tren co so du lieu!");
	new intid,str1[184];
	format(str1, sizeof(str1), "SELECT `Warnings` FROM users WHERE `name`='%s'",id);
	new Cache: result = mysql_query(SQL,str1);
	cache_get_value_name_int(0, "Warnings", intid);
	cache_delete(result);
	intid++;
	GetPlayerName(playerid, sendername, sizeof(sendername));
	format(string, sizeof(string), "Offline: %s da nhan duoc mot canh bao boi %s, Li do: %s",id, sendername, reason);
	SCMTA(COLOR_LIGHTRED, string);
	new str[180];
	if(intid >= 3) {
		new year,month,day;
		getdate(year, month, day);
		day += 3;
		if(IsMonth31(month)) {
			if(day > 31) {
				month += 1;
				if(month > 12) {
					year += 1;
					while(day > 31) day -= 31;
				}
				else while(day > 31) day -= 31;
			}
		}
		else if(!IsMonth31(month)) {
			if(day > 30) {
				month += 1;
				if(month > 12) {
					year += 1;
					while(day > 30) day -= 30;
				}
				else while(day > 30) day -= 30;
			}
		}
		else if(!IsMonth31(month) && IsMonth29(year) && month == 2) {
			if(day > 29) {
				month += 1;
				if(month > 12) {
					year += 1;
					while(day > 29) day -= 29;
				}
				else while(day > 29) day -= 29;
			}
		}
		else if(!IsMonth31(month) && !IsMonth29(year) && month == 2) {
			if(day > 28) {
				month += 1;
				if(month > 12) {
					year += 1;
					while(day > 28) day -= 28;
				}
				else while(day > 28) day -= 28;
			}
		}
		DeelayCommand[playerid][1] = 10;
		format(string, sizeof(string), "AdmCmd: %s da bi banned boi AdmBot (3/3 canh cao) trong 2 ngay, Li do: %s",id,reason);
		SCMTA(COLOR_LIGHTRED, string);
		Banlog("Offline",id,GetName(playerid),"3 Warnings",2);

		new query[184];		
		mysql_format(SQL, query, sizeof(query), "UPDATE `users` SET `BTemp`='1', `BYear`='%d', `BMonth`='%d', `BDay`='%d', `BBy`='%s', `BReason`='%e' WHERE `name`='%s'",year, month, day, GetName(playerid), reason, id);
		mysql_query(SQL ,query);
		intid = 0;
	}
	format(str,sizeof(str),"UPDATE users SET `Warnings`='%d' WHERE `name`='%s'",intid,id);
	mysql_query(SQL,str);
	format(string, sizeof(string), "Ban da nhan duoc mot canh cao boi %s, Li do: %s.", GetName(playerid), reason);
	InsertEmail(id, GetName(playerid), string, 0);			
	return 1;
}
CMD:bano(playerid, params[]) {
	new name[MAX_PLAYER_NAME];
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid,COLOR_WHITE,AdminOnly);
	if(DeelayCommand[playerid][0] > 0) return DeelayTime(playerid, 0);
	new giveplayerid[25],days,reason[128],string[128],cont;
	if(sscanf(params, "s[25]ds[128]", giveplayerid, days,reason)) return SendClientMessage(playerid,COLOR_GREY, "Su dung: {FFFFFF}/bano <name> <0 = permanent/days> <ly do>");
	if(FaceReclama(reason)) return RemoveFunction(playerid, reason);
	new userID = GetPlayerID( giveplayerid );
	if(userID != INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi nay da ket noi!");
	//if(days <= 0 || days > 1000) return SendClientMessage(playerid, -1, "Invalid Day! (1-1000)");
	cont = MySQLCheckAccount(giveplayerid);
	if(cont == 0) return SendClientMessage(playerid,COLOR_LGREEN, "ERROR: Tai khoan khong duoc tim thay tren co so du lieu!");
	GetPlayerName(playerid, name, sizeof name);
	if(days > 0) {
		new year,month,day;
		getdate(year, month, day);
		day += days;
		if(IsMonth31(month))
		{
			if(day > 31)
			{
				month += 1;
				if(month > 12)
				{
					year += 1;
					while(day > 31) day -= 31;
				}
				else while(day > 31) day -= 31;
			}
		}
		else if(!IsMonth31(month))
		{
			if(day > 30)
			{
				month += 1;
				if(month > 12)
				{
					year += 1;
					while(day > 30) day -= 30;
				}
				else while(day > 30) day -= 30;
			}
		}
		else if(!IsMonth31(month) && IsMonth29(year) && month == 2)
		{
			if(day > 29)
			{
				month += 1;
				if(month > 12)
				{
					year += 1;
					while(day > 29) day -= 29;
				}
				else while(day > 29) day -= 29;
			}
		}
		else if(!IsMonth31(month) && !IsMonth29(year) && month == 2)
		{
			if(day > 28)
			{
				month += 1;
				if(month > 12)
				{
					year += 1;
					while(day > 28) day -= 28;
				}
				else while(day > 28) day -= 28;
			}
		}
		DeelayCommand[playerid][0] = 10;
		if(days == 1) {
			format(string,128,"Offline: %s da bi day ra dao khi boi %s trong %d ngay, Li do: %s",giveplayerid,name,days,reason);
			SCMTA(COLOR_LIGHTRED,string);
		}
		else if(days > 1) {
			format(string,128,"Offline: %s da bi day ra dao khi boi %s trong %d ngay, Li do: %s",giveplayerid,name,days,reason);
			SCMTA(COLOR_LIGHTRED,string);
		}
		new szQuery[256];
		format(szQuery, sizeof(szQuery), "UPDATE `users` SET `BTemp`='1', `BYear`='%d', `BMonth`='%d', `BDay`='%d', `BBy`='%s', `BReason`='%s' WHERE `name`='%s'",year, month, day, name, reason, giveplayerid);
		mysql_query(SQL ,szQuery);	
	}
	else if(days == 0) {
		new szQuery[256];
		format(szQuery,sizeof(szQuery),"UPDATE users SET `Banned`='1', `BBy`='%s', `BReason`='%s' WHERE `name`='%s'", GetName(playerid), reason, giveplayerid);
		mysql_query(SQL,szQuery);	
		format(szQuery, sizeof(szQuery), "UPDATE users SET `HelpedPlayers` = '%d', `HelpedPlayersToday`='%d' WHERE `ID` = '%d'", PlayerInfo[playerid][pHelpedPlayers], PlayerInfo[playerid][pHelpedPlayersToday], PlayerInfo[playerid][pSQLID]);
		mysql_query(SQL, szQuery, false);	
		if(strfind(reason, "Silent", true) != -1) {
			format(string, sizeof(string), "Silent: %s (offline) da bi day ra dao khi boi %s, Li do: %s", giveplayerid, GetName(playerid),reason);
			SendAdminMessage(COLOR_LIGHTRED, string, 1);		
		}
		else {
			format(string, sizeof(string), "Offline: %s da bi day ra dao khi boi %s, Li do: %s", giveplayerid, GetName(playerid),reason);
			SCMTA(COLOR_LIGHTRED, string);			
		}	
	}
	else return 1;
	
	Banlog("Offline",giveplayerid,GetName(playerid),reason,days);
	PlayerInfo[playerid][pHelpedPlayers] += 2;
	PlayerInfo[playerid][pHelpedPlayersToday] += 2;
	
	new szQuery[256];
	format(szQuery, sizeof(szQuery), "UPDATE users SET `HelpedPlayers` = '%d', `HelpedPlayersToday`='%d' WHERE `ID` = '%d'", PlayerInfo[playerid][pHelpedPlayers], PlayerInfo[playerid][pHelpedPlayersToday], PlayerInfo[playerid][pSQLID]);
	mysql_query(SQL, szQuery, false);				
	return 1;
}
#if defined BOXING_MAP
	static Float:BoxingX, Float:BoxingY, Float:BoxingZ, BoxingPickup, Text3D:Boxing3DText;
	CMD:boxingevent(playerid, params[]) {
		if(PlayerInfo[playerid][pAdmin] < 1) return 1;
		new info[200];
		format(info, sizeof(info), "Chon mot tuy chon\nDat vi tri pickup\n%s boxing event", isBoxingOn ? "Tat" : "Bat");
		Dialog_Show(playerid, DIALOG_BOXINGEVENT, DIALOG_STYLE_TABLIST_HEADERS, "Boxing event", info, "Ok", "Cancel");
		return 1;
	}
	Dialog:DIALOG_BOXINGEVENT(playerid, response, listitem, inputtext[]) {
		if(!response) return 1;
		if(IsValidDynamicPickup(BoxingPickup)) DestroyDynamicPickup(BoxingPickup);
		if(IsValidDynamic3DTextLabel(Boxing3DText)) DestroyDynamic3DTextLabel(Boxing3DText);
		if(listitem == 0) {
			if(isBoxingOn == false) return SendClientMessage(playerid, -1, "Ban chua bat boxing event.");
			GetPlayerPos(playerid, BoxingX, BoxingY, BoxingZ);
			BoxingPickup = CreateDynamicPickup(1985, 1, BoxingX, BoxingY, BoxingZ+1.3, .streamdistance = 50);
			Boxing3DText = CreateDynamic3DTextLabel("Su dung /fightstyle de hoc cac the vo", 0xFFFF0099, BoxingX, BoxingY, BoxingZ+1.4, 15.0);
		} 
		else {
			if(isBoxingOn) {
				SendClientMessage(playerid, -1, "Da tat");
				isBoxingOn = false;
			}
			else {
				SendClientMessage(playerid, -1, "Da khoi dong");
				GetPlayerPos(playerid, BoxingX, BoxingY, BoxingZ);
				BoxingPickup = CreateDynamicPickup(1985, 1, BoxingX, BoxingY, BoxingZ+1.3, .streamdistance = 50);
				Boxing3DText = CreateDynamic3DTextLabel("Su dung /fightstyle de hoc cac the vo", 0xFFFF0099, BoxingX, BoxingY, BoxingZ+1.4, 15.0);
				isBoxingOn = true;
			}			
		}
		return 1;
	}
#endif
CMD:fightstyle(playerid,params[])
{
	#if defined BOXING_MAP
		if(isBoxingOn == true && IsPlayerInRangeOfPoint(playerid, 2, BoxingX, BoxingY, BoxingZ)) {
			Dialog_Show(playerid,DIALOG_GYM,DIALOG_STYLE_LIST,"Tuy chon","Boxing $1,000\nKungfu $1,500\nElbow $800\nGrabkick $500\nKneehead $600","Select","Cancel");
			return 1;
		} 
	#endif
	if(InBussines[playerid] > 0)
	{
		if(BizzInfo[InBussines[playerid]][bType] == 8)
		{
			Dialog_Show(playerid,DIALOG_GYM,DIALOG_STYLE_LIST,"Tuy chon","Boxing $1,000\nKungfu $1,500\nElbow $800\nGrabkick $500\nKneehead $600","Select","Cancel");
    	}
    	else return SendClientMessage(playerid, -1, "{FFB870}Ban khong o tai mot phong Gym.");
    }
    return 1;
}
CMD:respawn(playerid, params[]) {
	if(!(PlayerInfo[playerid][pAdmin] > 0 || PlayerInfo[playerid][pHelper] >= 2)) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new id,string[100];
	if(sscanf(params, "u", id)) return SendClientMessage(playerid,COLOR_GREY, "Su dung: {FFFFFF}/respawn <playerid/name>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong dang nhap.");
	if(PlayerInfo[id][pAdmin] > PlayerInfo[playerid][pAdmin]) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay len nguoi choi do.");	
	format(string, sizeof(string), "[{B81616}AdmWarning{FFFFFF}]: %s da respawn %s.", GetName(playerid), GetName(id));
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(-1, string,4);
	format(string, sizeof(string), "* Admin %s da respawn ban.", GetName(playerid));
	SendClientMessage(id, -1, string);
	SpawnPlayer(id);
	return 1;
}
CMD:ban(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new id,reason[128],string[200],type, str[128];
	if(DeelayCommand[playerid][0] > 0) return DeelayTime(playerid, 0);
	if(sscanf(params, "uds[128]", id,type,reason)) return SendClientMessage(playerid,COLOR_GREY, "Su dung: {FFFFFF}/ban <playerid/name> <days | 0 = permanent ip ; 1 = permanent account> <ly do>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong dang nhap.");
	if(FaceReclama(reason)) return RemoveFunction(playerid, reason);
	if(PlayerInfo[id][pAdmin] == 7) return 1;
	if(PlayerInfo[id][pAdmin] > PlayerInfo[playerid][pAdmin]) return SendClientMessage(playerid, -1, "Nguoi choi do co Level Admin lon hon ban!");
	InsereazaSanctiune(id, playerid, BAN, reason);		
	 
	if(type == 1) {
		if(strfind(reason, "silent", true) != -1) {
			format(string, sizeof(string), "Silent: %s da bi day ra dao khi boi %s, Li do: %s", GetName(id), GetName(playerid), reason);
			SendAdminMessage(COLOR_LIGHTRED, string, 1);
		}
		else {
			format(string, sizeof(string), "AdmCmd: %s da bi day ra dao khi boi %s, Li do: %s", GetName(id), GetName(playerid), reason);
			MesajLung2(COLOR_LIGHTRED, string);
		}
		PlayerInfo[id][pBanned] = 1;
		format(str,sizeof(str),"UPDATE users SET `Banned`='1' WHERE `ID`='%d'",PlayerInfo[id][pSQLID]);
		mysql_query(SQL, str, false);
		new ip[25];
		GetPlayerIp(id, ip, sizeof(ip));
		Banlog(ip,GetName(id),GetName(playerid),reason,0);
		KickEx(id);
	}
	else if(type == 0) {
		if(strfind(reason, "silent", true) != -1) {
			format(string, sizeof(string), "Silent: %s da bi truc xuat ra dao o voi khi vinh vien boi %s, Li do: %s", GetName(id), GetName(playerid), reason);
			SendAdminMessage(COLOR_LIGHTRED, string, 1);
		}
		else {
			format(string, sizeof(string), "AdmCmd: %s da bi truc xuat ra dao o voi khi vinh vien boi %s, Li do: %s", GetName(id), GetName(playerid), reason);
			MesajLung2(COLOR_LIGHTRED, string);		
		}
		PlayerInfo[id][pBanned] = 1;
		format(str,sizeof(str),"UPDATE users SET `Banned`='1' WHERE `ID`='%d'",PlayerInfo[id][pSQLID]);
		mysql_query(SQL,str);
		new ip[25];
		GetPlayerIp(id, ip, sizeof(ip));
		Banlog(ip,GetName(id),GetName(playerid),reason,0);
		// BanSerial(id, playerid, reason);
		Ban(id);
		KickEx(id);
	}
	else if(type > 1) {
		if(strfind(reason, "silent", true) != -1) {
			format(string, sizeof(string), "Silent: %s da bi day ra dao khi boi %s trong %d ngay, Li do: %s", GetName(id), GetName(playerid), type, reason);
			SendAdminMessage(COLOR_LIGHTRED, string, 1);
		}
		else {
			format(string, sizeof(string), "AdmCmd: %s da bi day ra dao khi boi %s trong %d ngay, Li do: %s", GetName(id), GetName(playerid), type, reason);
			MesajLung2(COLOR_LIGHTRED, string);		
		}
		new year,month,day;
		getdate(year, month, day);
		day += type;
		if(IsMonth31(month)) {
			if(day > 31) {
				month += 1;
				if(month > 12) {
					year += 1;
					while(day > 31) day -= 31;
				}
				else while(day > 31) day -= 31;
			}
		}
		else if(!IsMonth31(month)) {
			if(day > 30) {
				month += 1;
				if(month > 12) {
					year += 1;
					while(day > 30) day -= 30;
				}
				else while(day > 30) day -= 30;
			}
		}
		else if(!IsMonth31(month) && IsMonth29(year) && month == 2) {
			if(day > 29) {
				month += 1;
				if(month > 12) {
					year += 1;
					while(day > 29) day -= 29;
				}
				else while(day > 29) day -= 29;
			}
		}
		else if(!IsMonth31(month) && !IsMonth29(year) && month == 2) {
			if(day > 28) {
				month += 1;
				if(month > 12) {
					year += 1;
					while(day > 28) day -= 28;
				}
				else while(day > 28) day -= 28;
			}
		}
		new ip[25], szQuery[256];
		GetPlayerIp(id, ip, sizeof(ip));
		Banlog(ip,GetName(id),GetName(playerid),reason,type);
		KickEx(id);
		format(szQuery, sizeof(szQuery), "UPDATE `users` SET `BTemp`='1', `BYear`='%d', `BMonth`='%d', `BDay`='%d', `BBy`='%s', `BReason`='%s' WHERE `ID`='%d'",year, month, day, GetName(playerid), reason, PlayerInfo[id][pSQLID]);
		mysql_query(SQL ,szQuery);		
	}
	SendClientMessage(id,COLOR_WARNING,"Ban da bi banned! Neu ban nghi ban khong lam gi sai, hay nop don len ucp ("#SERVER_URL"/panel/unbans).");
	strmid(PlayerInfo[id][pBBy], GetName(playerid), 0, strlen(GetName(playerid)), 34);
	strmid(PlayerInfo[id][pBReason], reason, 0, strlen(reason), 50);
	Update(id,pBByx);
	Update(id,pBReasonx);					
	UpdateVar(playerid, "Bans", 1);
	PlayerInfo[playerid][pHelpedPlayers] += 2;
	PlayerInfo[playerid][pHelpedPlayersToday] += 2;
	DeelayCommand[playerid][0] = 10;
	new szQuery[256];
	format(szQuery, sizeof(szQuery), "UPDATE users SET `HelpedPlayers` = '%d', `HelpedPlayersToday`='%d' WHERE `ID` = '%d'", PlayerInfo[playerid][pHelpedPlayers], PlayerInfo[playerid][pHelpedPlayersToday], PlayerInfo[playerid][pSQLID]);
	mysql_query(SQL, szQuery, false);					
	return 1;
}
CMD:muteo(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new id[25],cont,msg[80],time,string[184];
	if(sscanf(params, "s[25]is[80]", id,time,msg)) return SendClientMessage(playerid,COLOR_GREY, "Su dung: {FFFFFF}/muteo <name> <Time(minutes)> <ly do>");
	if(FaceReclama(msg)) return RemoveFunction(playerid, msg);
	cont = MySQLCheckAccount(id);
	if(cont == 0) return SendClientMessage(playerid,COLOR_LGREEN, "ERROR: Tai khoan khong duoc tim thay tren co so du lieu!");
	if(time <= 0) return SendClientMessage(playerid,-1, "Invalid mute time.");

	PlayerInfo[playerid][pHelpedPlayers] ++;
	PlayerInfo[playerid][pHelpedPlayersToday] ++;
	
	new szQuery[256];
	format(szQuery, sizeof(szQuery), "UPDATE users SET `HelpedPlayers` = '%d', `HelpedPlayersToday`='%d' WHERE `ID` = '%d'", PlayerInfo[playerid][pHelpedPlayers], PlayerInfo[playerid][pHelpedPlayersToday], PlayerInfo[playerid][pSQLID]);
	mysql_query(SQL, szQuery, false);	
	format(szQuery,sizeof(szQuery),"UPDATE users SET `Muted`='1',`MuteTime`='%d' WHERE `name`='%s'",time*60,id);
	mysql_query(SQL,szQuery);
	
	format(string, sizeof(string), "Ban bi mute boi 5s trong %d phut, ly do %s.", GetName(playerid), time, msg);
	InsertEmail(id, GetName(playerid), string, 0);
	format(string, sizeof(string), "Offline: %s da bi mute boi %s trong %d phut, Li do: %s", id, GetName(playerid),time,msg);
	SCMTA(COLOR_LIGHTRED, string);	
	return 1;
}
CMD:sethp(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new id,hp,string[100];
	if(sscanf(params, "ui", id, hp)) return SendClientMessage(playerid,COLOR_GREY, "Su dung: {FFFFFF}/sethp <playerid/name> <hp>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong dang nhap.");
	if(PlayerInfo[id][pAdmin] > PlayerInfo[playerid][pAdmin]) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the dung lenh nay tren nguoi choi do!");
	SetPlayerHealthEx(id, hp);

	format(string, sizeof(string), "AdmCmd: %s da set HP cua %s thanh %d (hp).", GetName(playerid),GetName(id),hp);
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(COLOR_LOGS, string,2);
	return 1;
}
CMD:a(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] == 0) return 1;
	new result[250];
	if(sscanf(params, "s[250]",result)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/a <noi dung>");
	format(result, sizeof(result), "* (%d) %s %s: %s", PlayerInfo[playerid][pAdmin], GetAdminRank(playerid), GetName(playerid), result);
	SendAdminMessage(COLOR_ADMCHAT, result, 1);
	return 1;
}
CMD:sampcac(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin]+PlayerInfo[playerid][pHelper] == 0) return 1;
	new info[2000];
	strcat(info, "ID\tName\n");
	foreach(new i: Player) {
		if(UsingSampcac{i} == 1) format(info, sizeof(info), "%s%d\t%s\n", info, i, GetName(i));
	}
	Dialog_Show(playerid, 0, DIALOG_STYLE_TABLIST_HEADERS, "Danh sach nguoi choi cai SAMPCAC", info, "Dong", "");
	return 1;
}
CMD:fmats(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] == 0) return 1;
	new info[1000], szDialog[100];
	strcat(info, "To chuc\tVat lieu\tTien\tThuoc phien\n");
	for(new i = 1; i <= facs; i++) {
		new x = i - 1;
		format(szDialog, sizeof(szDialog), "%d. %s\t%s\t%s\t%s\n", i, DynamicFactions[i][fName], FormatNumber(SafeInfo[x][sMaterials]), FormatNumber(SafeInfo[x][sMoney]), FormatNumber(SafeInfo[x][sDrugs]));
		strcat(info, szDialog);
	}
	Dialog_Show(playerid, 0, DIALOG_STYLE_TABLIST_HEADERS, "To chuc:", info, "Ok", "Close");	
	return 1;
}