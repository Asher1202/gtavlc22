CMD:skick(playerid, params[]) {
	new id,string[100];
	if(PlayerInfo[playerid][pAdmin] == 0 && PlayerInfo[playerid][pHelper] < 2) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	if(sscanf(params, "u", id)) return SendClientMessage(playerid,COLOR_GREY, "Su dung: {FFFFFF}/skick <playerid/name>"); 
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong dang nhap.");
	if(PlayerInfo[id][pAdmin] > PlayerInfo[playerid][pAdmin]) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay len nguoi choi do.");
	if(PlayerInfo[id][pAdmin] != 0 && PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, -1, "Ban khong the kick mot Admin!");
	format(string, sizeof(string), "SKick: %s da bi kick boi %s.",GetName(id),GetName(playerid));
	if(GetPVarInt(playerid, "Cover") == 0) SendStaffMessage(COLOR_LOGS, string);
	KickEx(id);
	return 1;
}

CMD:kick(playerid, params[]) {
	new id, reason[128], string[180];
	if(PlayerInfo[playerid][pAdmin] < 1 && PlayerInfo[playerid][pHelper] < 2) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	if(DeelayCommand[playerid][2] > 0) return DeelayTime(playerid, 2);
	if(sscanf(params, "us[128]", id, reason)) return SendClientMessage(playerid,COLOR_GREY, "Su dung: {FFFFFF}/kick <playerid/name> <ly do>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong dang nhap.");	
	if(FaceReclama(reason)) return RemoveFunction(playerid, reason);
	if(PlayerInfo[id][pAdmin] > PlayerInfo[playerid][pAdmin]) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay len nguoi choi do.");
	DeelayCommand[playerid][2] = 10;
	format(string, sizeof(string), "AdmCmd: %s da bi kick boi %s, Li do: %s", GetName(id), GetName(playerid), reason);
	MesajLung2(COLOR_LOGS, string);

	InsereazaSanctiune(id, playerid, KICK, reason);	
	UpdateVar(playerid, "Kicks", 1);
	KickEx(id);
	PlayerInfo[playerid][pHelpedPlayers] ++;
	PlayerInfo[playerid][pHelpedPlayersToday] ++;
	new szQuery[256];
	format(szQuery, sizeof(szQuery), "UPDATE users SET `HelpedPlayers` = '%d', `HelpedPlayersToday`='%d' WHERE `ID` = '%d'", PlayerInfo[playerid][pHelpedPlayers], PlayerInfo[playerid][pHelpedPlayersToday], PlayerInfo[playerid][pSQLID]);
	mysql_query(SQL, szQuery);							
	return 1;
}