CMD:lc(playerid, params[]) {
	if(PlayerInfo[playerid][pLeader] == 0 && PlayerInfo[playerid][pAdmin] == 0) return 1;
	new text[250],string[250];
	if(sscanf(params, "s[250]",text)) return SendClientMessage(playerid,COLOR_GREY, "Su dung: {FFFFFF}/lc <noi dung>");
	else if(PlayerInfo[playerid][pLeader] != 0) format(string, sizeof(string), "Leader %s %s: %s",FactionName(PlayerInfo[playerid][pLeader]),GetName(playerid), text);
	if(PlayerInfo[playerid][pAdmin] > 0) format(string, sizeof(string), "Admin{A2C791} %s: %s", GetName(playerid), text);
	foreach(new i: Player) {
		if((PlayerInfo[i][pLeader] > 0 || PlayerInfo[i][pAdmin] > 0) && IsPlayerLogged[i] == 1) {
			if(toglc[i] == 0) SendClientMessage(i, 0xA2C791FF, string);
		}
	}	
	return 1;
}
CMD:fvrespawn(playerid, params[]) {
    if(PlayerInfo[playerid][pRank] < 5) return 1;
	for(new v = 0; v < MAX_SVEHICLES; v++) {
		if(ServerVehicles[v][vFaction] == PlayerInfo[playerid][pMember]) {
			if(!IsVehicleOccupied(ServerVehicles[v][vSpawned])) SetVehicleToRespawn(ServerVehicles[v][vSpawned]), Gas[ServerVehicles[v][vSpawned]] = 100;
			if(InWar[PlayerInfo[playerid][pMember]] == 1) {
				for(new wi = 1; wi < turfsss;wi++) {
					if(WarInfo[wi][wFaction] == PlayerInfo[playerid][pMember] || WarInfo[wi][wAttacker] == PlayerInfo[playerid][pMember]) SetVehicleVirtualWorld(ServerVehicles[v][vSpawned], wi);
				}
			}
		}
		if(ServerVehicles[v][vModel] == 596 && Copcar2(v)) {
				SetVehicleHealth(v, 1650);
				// new ThanhCops = CreateObject(19304, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
				// AttachObjectToVehicle(ThanhCops, idd, 0.0494, 1.7739, -0.3657, 90.0000, 0.0000, 90.0000);

			}
		if(ServerVehicles[v][vModel] == 599 && Copcar2(v)) {
			SetVehicleHealth(v, 2150);
			// new ThanhCops2 = CreateObject(3280, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
			// new ThanhCops3 = CreateObject(3280, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
			// AttachObjectToVehicle(ThanhCops2, idd, 1.38965, 0.13263, -0.66208, 0.000000, 0.000000, 0.000000);
			// AttachObjectToVehicle(ThanhCops3, idd, -1.41170, 0.13190, -0.66210, 0.000000, 0.000000, 0.000000);
		}
		if(ServerVehicles[v][vModel] == 427 && Copcar2(v)) {
			SetVehicleHealth(v, 6500);
		}
				
	}
	new string[180];
	format(string, sizeof(string), "(i) %s da respawn tat ca cac phuong tien cua to chuc", GetName(playerid));
	SendFactionMessage(PlayerInfo[playerid][pMember], COLOR_LIGHTBLUE, string);			
    return 1;
}
CMD:cvr(playerid, params[]) {
    if(PlayerInfo[playerid][pClanRank] < 4) return Info(playerid, "Ban chua dat rank 4 Clan");
	foreach(new v: ClanVehicle) {
		if(ServerVehicles[v][vClan] == PlayerInfo[playerid][pClan]) {
			if(!IsVehicleOccupied(ServerVehicles[v][vSpawned])) SetVehicleToRespawn(ServerVehicles[v][vSpawned]), Gas[ServerVehicles[v][vSpawned]] = 100;
		}			
	}
	new string[180];
	format(string, sizeof(string), "(i) %s da respawn tat ca cac phuong tien cua Clan", GetName(playerid));
	SendClanMessage(PlayerInfo[playerid][pClan], string);		
    return 1;
}
CMD:cpark(playerid, params[]) {
	if(PlayerInfo[playerid][pClanRank] < 5) return Info(playerid, "Ban chua dat rank 5 Clan");
	new carid = GetPlayerVehicleID(playerid), Float: Pos[3], Float: Angle, string[500], szQuery[256];
	if(!IsPlayerInAnyVehicle(playerid)) return 1;
	new dbid = GetVehicleID(carid);
	if(ServerVehicles[dbid][vClan]!=PlayerInfo[playerid][pClan]) return Info(playerid, "Ban khong o trong xe cua Clan.");
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
	format(plate, sizeof(plate), "%s", ClanInfo[PlayerInfo[playerid][pClan]][clName]);
	format(string, sizeof(string), "{%s}Vi tri cua chiec xe nay da duoc thay doi thanh cong",ClanInfo[PlayerInfo[playerid][pClan]][clColor]);
	SendClientMessage(playerid, -1, string);
	mysql_format(SQL, szQuery, sizeof(szQuery), "UPDATE `svehicles` SET `LocationX` = '%f', `LocationY` = '%f', `LocationZ` = '%f', `Angle` = '%f' WHERE `vID` = '%d'", Pos[0], Pos[1], Pos[2], Angle, dbid);
	mysql_query(SQL, szQuery);
	return 1;
}
CMD:ccolor(playerid, params[]) {
	if(!IsPlayerInAnyVehicle(playerid)) return Info(playerid, "Ban khong o trong xe cua Clan.");
	if(PlayerInfo[playerid][pClanRank] < 5) return Info(playerid, "Ban chua dat rank 5 Clan");
	new vehicleid = GetPlayerVehicleID(playerid), szQuery[256], option, result,
	dbid = GetVehicleID(vehicleid);
	if(ServerVehicles[dbid][vClan]!=PlayerInfo[playerid][pClan]) return Info(playerid, "Ban khong o trong xe cua Clan.");
	if(sscanf(params, "ii", option, result)) return	SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/ccolor <1/2> <id mau>");
	if(option==1) {
		if(result < 0 || result > 256) return SendClientMessage(playerid, COLOR_GREY, "ID mau khong hop le.");
		ChangeVehicleColorEx(vehicleid, result, ServerVehicles[dbid][vColor][1]);
		ServerVehicles[dbid][vColor][0] = result;
		SendClientMessage(playerid, COLOR_LGREEN, "Doi mau xe Clan thanh cong.");

		mysql_format(SQL, szQuery, sizeof(szQuery), "UPDATE `svehicles` SET `Color1` = '%d' WHERE `vID` = '%d'", result, dbid);
		mysql_query(SQL, szQuery);
	}
	if(option==2) {
		if(result < 0 || result > 256) return SendClientMessage(playerid, COLOR_GREY, "ID mau khong hop le.");
		ChangeVehicleColorEx(vehicleid, ServerVehicles[dbid][vColor][0], result);
		ServerVehicles[dbid][vColor][1] = result;
		SendClientMessage(playerid, COLOR_LGREEN, "Doi mau xe Clan thanh cong.");

		mysql_format(SQL, szQuery, sizeof(szQuery), "UPDATE `svehicles` SET `Color2` = '%d' WHERE `vID` = '%d'", result, dbid);
		mysql_query(SQL, szQuery);
	}
	return 1;
}
CMD:members(playerid, params[]) return ShowFactionMembers(playerid);
CMD:setstatus(playerid, params[]) {
	if(PlayerInfo[playerid][pLeader] == 0) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la lanh dao cua to chuc!");
	switch(DynamicFactions[PlayerInfo[playerid][pLeader]][fApp]) {
		case 0: SendClientMessage(playerid, COLOR_WHITE, "Bay gio to chuc cua ban khong con tuyen dung thanh vien nua."), DynamicFactions[PlayerInfo[playerid][pLeader]][fApp] = 1;
		case 1: SendClientMessage(playerid, COLOR_WHITE, "Ban da mo tuyen dung."), DynamicFactions[PlayerInfo[playerid][pLeader]][fApp] = 0;
	}
	new query[180];
	format(query, sizeof(query), "UPDATE `factions` SET `App`='%d' WHERE `ID`='%d'", DynamicFactions[PlayerInfo[playerid][pLeader]][fApp], PlayerInfo[playerid][pLeader]);
	mysql_query(SQL, query);
	return 1;
}
alias:resetraports("traluong")
CMD:resetraports(playerid, params[]) {
    new fid = PlayerInfo[playerid][pMember], string[180], membs, money;
	if(PlayerInfo[playerid][pLeader] == 0) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la lanh dao!");
	foreach(new i: Player) {
		if(PlayerInfo[i][pMember] == fid && IsPlayerConnected(i)) {
			new count = CountRaport(i); 
			if(count > 0) {
				money = count*10000;
				GivePlayerCash(i, money);
				format(string, sizeof(string), "Ban nhan duoc $%s tien luong tu leader cho nhung gi ban da dong gop trong thoi gian qua (%d).", FormatNumber(money), CountRaport(i));
				SendClientMessage(i, COLOR_MONEY, string);
				format(string, sizeof(string), "[TRA LUONG]{FFFFFF} %s dat %d diem hoat dong faction (nhan duoc $%s)", GetName(i), FormatNumber(money));
				SendClientMessage(playerid, COLOR_GOLD, string);
				//InsertLog(i, string, LOG_MONEY);
			}
			PlayerInfo[i][pCommands][0] = 0;
			membs++;
		}
	}
	ResetRaports(PlayerInfo[playerid][pMember]);
	format(string, sizeof(string), "Ban da tra tien thuong va reset bao cao thong ke cua %d thanh vien!", membs);
	SendClientMessage(playerid, COLOR_YELLOW, string);
	return 1;
}