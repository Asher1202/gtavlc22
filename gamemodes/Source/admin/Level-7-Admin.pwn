CMD:sound(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, COLOR_LGREEN, AdminOnly);
	PlayerPlaySound(playerid, strval(params), 0, 0, 0);
	return 1;
}
CMD:givedauxanh(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new money,id,string[120],sendername[25],giveplayer[25];
	if(sscanf(params, "ui",id,money)) return SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/givedauxanh <playerid/name> <So Luong>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	if(money < 1) return SendClientMessage(playerid, -1, "So dau xanh khong duoc it hon 1.");
	PlayerInfo[id][pDauXanh] += money;
	Update(id,pDauXanhx);
	GetPlayerName(id, giveplayer, sizeof(giveplayer));
	GetPlayerName(playerid, sendername, sizeof(sendername));
	format(string, sizeof(string), "AdmCmd: %s da gui %s dau xanh cho %s.", sendername,FormatNumber(money),giveplayer);
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(COLOR_LOGS, string,5);
	format(string, sizeof(string), "Ban da gui %s(%d) %s dau xanh.", GetName(id), id, FormatNumber(money));
	SendClientMessage(playerid, COLOR_WHITE, string);
	format(string, sizeof(string), "Admin %s da gui cho ban %s dau xanh.", GetName(playerid), FormatNumber(money));
	SendClientMessage(id, COLOR_WHITE, string);
	Update(id, pDauXanhx);	
	format(string, sizeof(string), "%s da nhan duoc %s dau xanh tu %s (/givedauxanh)", GetName(id), FormatNumber(money), GetName(playerid));
	Log("logs/nhanquatrungthu.log", string);
	return 1;
}
CMD:givebanhtrungthu(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new money,id,string[120],sendername[25],giveplayer[25];
	if(sscanf(params, "ui",id,money)) return SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/givebanhtrungthu <playerid/name> <So Luong>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	if(money < 1) return SendClientMessage(playerid, -1, "So banh khong duoc it hon 1.");
	PlayerInfo[id][pBanhTrungThu] += money;
	Update(id,pBanhTrungThux);
	GetPlayerName(id, giveplayer, sizeof(giveplayer));
	GetPlayerName(playerid, sendername, sizeof(sendername));
	format(string, sizeof(string), "AdmCmd: %s da gui %s banh trung thu cho %s.", sendername,FormatNumber(money),giveplayer);
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(COLOR_LOGS, string,5);
	format(string, sizeof(string), "Ban da gui %s(%d) %s banh trung thu.", GetName(id), id, FormatNumber(money));
	SendClientMessage(playerid, COLOR_WHITE, string);
	format(string, sizeof(string), "Admin %s da gui cho ban %s banh trung thu.", GetName(playerid), FormatNumber(money));
	SendClientMessage(id, COLOR_WHITE, string);
	Update(id, pBanhTrungThux);	
	format(string, sizeof(string), "%s da nhan duoc %s banh trung thu tu %s (/givebanhtrungthu)", GetName(id), FormatNumber(money), GetName(playerid));
	Log("logs/nhanquatrungthu.log", string);
	return 1;
}
CMD:createcode(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 7) return 1;
    new 
		code[64], query[126], tien, rp, xu, mats;
	if(sscanf(params, "iiii",xu,tien,rp, mats)) return SendClientMessage(playerid, COLOR_GREY, "Su dung{FFFFFF} /taogiftcode [XU] [Tien IC] [RP] [MATS]");
	format(code, sizeof(code), "%s", generateCode());
	format(query, sizeof(query), "INSERT INTO `codes` (`Code`, `Type`, `Money`, `RP`, `PP`, `Mats`) VALUES ('%s', '1', '%d', '%d', '%d', '%d')", code, tien, rp, xu, mats);
	mysql_query(SQL, query);
	format(query, sizeof(query), "Code: %s / Tien: %d / RP: %d / Vat Lieu : %d", code, tien, rp, mats);
	SendClientMessage(playerid, COLOR_PURPLE, query);
	return 1;
}

// CMD:payday(playerid, params[])
// {
// 	if(PlayerInfo[playerid][pAdmin] >= 7) 
// 	{
// 			// loop through jobs, if job is fisherman, reset job attempt
// 		JobInfo[FISHING_LS_JOB_ID][jAttemptPerHour] = getFishAttemptPerHour(FISHING_LS_JOB_ID);
// 		JobInfo[FISHING_LV_JOB_ID][jAttemptPerHour] = getFishAttemptPerHour(FISHING_LV_JOB_ID);
// 		updateFishingTag(FISHING_LS_JOB_ID);
// 		updateFishingTag(FISHING_LV_JOB_ID);

// 		new string[128];
// 		new interest, account;
// 		Paydaydat = 1;
// 		defer ResetPD[60000]();
// 		new rent[MAX_PLAYERS];
// 		defer DecreaseLicenseHour[4000]();
// 		GameTextForAll("~g~Payday", 5000, 1);
// 		foreach(new i: Player) {
// 			if(IsPlayerLogged[i] == 1) {
// 				// Exception{i} += 2;
// 				new key = PlayerInfo[i][pHouse];
// 				if(key != 999) {
// 					rent[i] = HouseInfo[key][hRent];
// 					HouseInfo[key][hTakings] += rent[i];
// 				}
// 				new tmpintrate;
// 				SendClientMessage(i, COLOR_SERVER, "------------------------------------------------------------------------------------------------");
// 				if(PlayerInfo[i][pVip] > 0){
// 					tmpintrate = 2;
// 					PlayerInfo[i][pPayDayHad] += 1;
// 					if(PlayerInfo[i][pPayDayHad] >= 5) {
// 						// PlayerInfo[i][pExp]++;
// 						PlayerInfo[i][pPayDayHad] = 0;
// 					}
// 					new bonus = PlayerInfo[i][pPayCheck] / 2;
// 					PlayerInfo[i][pPayCheck] += bonus;
// 				}
// 				else {
// 					tmpintrate = 1;
// 				}
// 				account = PlayerInfo[i][pAccount];
// 				Tax += TaxValue;
				
// 				//PlayerInfo[i][pAccount] -= TaxValue;
// 				new checks = PlayerInfo[i][pLevel]*4000+random(3000);
// 				// if(PlayerInfo[i][pDailyLogin] == 0) checks = checks*2;			
// 				GivePlayerCash(i, checks);
// 				interest = (PlayerInfo[i][pAccount]/1000)*(tmpintrate);
// 				// if(PlayerInfo[i][pDailyLogin] == 0 || ServerSystem[21] == 0) {
// 				// 	interest = interest*2;
// 				// 	PlayerInfo[i][pExp] += 2;
// 				// }
// 				// else 
// 				// PlayerInfo[i][pExp] += 1;
// 				UpdateProgress(i, 0);
// 				PlayerInfo[i][pAccount] += interest+5000;
			
// 				SendClientMessage(i, COLOR_WHITE, "Luong cua ban da den! Hay den ngan hang de kiem tra.");
// 				format(string, sizeof(string), "Ban nhan duoc %0.2f gio choi. (%.0f phut)", PlayerInfo[i][pSeconds]/3600, PlayerInfo[i][pSeconds]/60);
// 				SendClientMessage(i, COLOR_WHITE, string);
// 				format(string, sizeof(string), "Gio choi: %0.2f~n~PayCheck: $%s~n~So du cu: $%s~n~Thue: $%s~n~Lai suat: $%d~n~So du moi: $%s", PlayerInfo[i][pSeconds]/3600, 
// 					FormatNumber(checks), FormatNumber(account), FormatNumber(TaxValue), FormatNumber(interest), FormatNumber(PlayerInfo[i][pAccount]));
// 				PlayerTextDrawSetString(i, PaydayTD, string);
// 				TextDrawShowForPlayer(i, PPaydayTDS);
// 				PlayerTextDrawShow(i, PaydayTD);
// 				defer HidePaydayTD(i);
// 				PlayerInfo[i][pSeconds] = 0;
				
// 				// if(PlayerInfo[i][pDailyLogin] == 0) {
// 				// 	PlayerInfo[i][pDailyLogin] = 1;
// 				// 	UpdateVar(i, "DailyLogin", 1);
// 				// 	SendClientMessage(i, COLOR_LIGHTBLUE, "Ban nhan duoc them hai diem rp va gap doi tien luong cho lan payday dau tien trong ngay.");
// 				// }
				
// 				// Update(i, pRP);
// 				PlayerInfo[i][pPayDay] = 0;
// 				PlayerInfo[i][pPayCheck] = 0;
// 				SendClientMessage(i, COLOR_SERVER, "------------------------------------------------------------------------------------------------");
// 				if(PlayerInfo[i][pExp] >= PlayerInfo[i][pLevel]*levelexp) SendClientMessage(i,COLOR_GOLD,"Ban da co du respect point yeu cau, ban co the su dung /muacapdo.");
// 			}
// 		}
// 	}
// 	return 1;
// }
CMD:fupdate(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 7) return 1;
	new szQuery[256], Float: Pos[3];
	GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
	format(szQuery, sizeof(szQuery), "UPDATE `factions` SET `IntX`='%f', `IntY`='%f', `IntZ`='%f', `VW`='%d', `Interior`='%d' WHERE `ID`='%d'", Pos[0], Pos[1], Pos[2], GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid), PlayerInfo[playerid][pMember]);
	mysql_query(SQL, szQuery);
	SendClientMessage(playerid, COLOR_RED, szQuery);
	return 1;
}


CMD:achange(playerid, params[]){
	if(PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, -1, AdminOnly);
	new n;
	if(sscanf(params, "i", n)) {
		SendClientMessage(playerid, -1, "Su dung: /achange [code]");
		SendClientMessage(playerid, -1, "Code: (1) Spawn Civil (2) Fish Place (3) Khoa Giftcode (chi scripter su dung)");
		SendClientMessage(playerid, -1, "(4) Reset all pGotCode (5) No xe cuc manh (6) Tat chat the gioi");
		return 1;
	}
	new string[100];
	switch(n){
		case 1: {
			GetPlayerPos(playerid, SpawnPos[0], SpawnPos[1], SpawnPos[2]);
			GetPlayerFacingAngle(playerid, SpawnPos[3]);
			mysql_format(SQL, string, sizeof(string), "UPDATE `stuff` SET `SpawnX`='%f', `SpawnY`='%f', `SpawnZ`='%f', `SpawnAngle` = '%f'", SpawnPos[0], SpawnPos[1], SpawnPos[2], SpawnPos[3]);
		}
		case 2: {
			GetPlayerPos(playerid, FishPos[0], FishPos[1], FishPos[2]);
			mysql_format(SQL, string, sizeof(string), "UPDATE `stuff` SET `FishX`='%f', `FishY`='%f', `FishZ`='%f'", FishPos[0], FishPos[1], FishPos[2]);
		}
		case 3: {
			return SendClientMessage(playerid, -1, "99%");
		}
		case 4: {
			mysql_format(SQL, string, sizeof(string), "UPDATE `users` SET `GotCode`='0'");	
			foreach(new i: Player) PlayerInfo[i][pGotCode] = 0;
		}
		default: {
			SendClientMessage(playerid, -1, "ERROR: {FFFFFF} Code khong hop le.");
			return 1;
		}
	}
	mysql_tquery(SQL, string, "", "");
	SendClientMessage(playerid, COLOR_WHITE, string);
	return 1;
}
CMD:restartgame(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 7) return 1;
	new string[100];
	format(string, sizeof(string), "AdmBot: Admin %s da khoi dong lai server.", GetName(playerid));
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(COLOR_LOGS, string, 6);
	GameModeExit();
	return 1;
}
CMD:restart(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 7) return 1;
	new time, string[180];
	if(sscanf(params, "i", time)) return SendClientMessage(playerid,COLOR_GREY, "Su dung: {FFFFFF}/restart <thoi gian (phut)>");
	format(string, sizeof(string), "(( Admin %s: {FF9696}Server se khoi dong lai sau %d giay (%d phut). {A9C4E4}))", GetName(playerid), time*60, time);
	SCMTA(COLOR_CLIENT, string);
	RestartTime = time*60;
	return 1;
}
CMD:cancelrestart(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 7) return 1;
	new string[130];
	format(string, sizeof(string), "(( Admin %s: {FF9696}Khoi dong lai da bi huy, khong co khoi dong nua nha moi nguoi. {A9C4E4}))", GetName(playerid));
	SCMTA(COLOR_CLIENT, string);
	RestartTime = 0;
	return 1;
}
CMD:tatdangky(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 7) return 1;
	{
		if(DISABLEREG == 0)
		{
			SendClientMessage(playerid, COLOR_CLIENT, "Ban da bat chuc nang tat dang ki, hay /tatdangky lan nua neu muon bat lai");
			DISABLEREG = 1;
		}
		else {
			SendClientMessage(playerid, COLOR_CLIENT, "Ban da co phep dang ky");
			DISABLEREG = 0;
		}
	}
	return 1;
}


CMD:blowup(playerid, params[])
{
	new string[128], giveplayerid;
	if(sscanf(params, "u", giveplayerid)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: /blowup [player]");
	// if((PlayerInfo[giveplayerid][pAdmin] >= PlayerInfo[playerid][pAdmin]) && giveplayerid != playerid) return SendClientMessage(playerid, COLOR_GREY, "You cannot use this command on the same/greater level admin than you!");
	if(IsPlayerConnected(giveplayerid))
	{
		if(PlayerInfo[playerid][pAdmin] >= 4 )
		{
			if(IsPlayerConnected(giveplayerid))
			{
				format(string, sizeof(string), "Ban da no tung %s (ID: %d).",GetName(giveplayerid),giveplayerid);
				SCMf(playerid,COLOR_GRAD2,string);
				new Float:boomx, Float:boomy, Float:boomz;
				GetPlayerPos(giveplayerid,boomx, boomy, boomz);
				CreateExplosion(boomx, boomy , boomz, 7, 1);
			}
			else SendClientMessage(playerid, COLOR_GRAD1, "ID khong dung.");
		}
		else
		{
			SendClientMessage(playerid, COLOR_GREY, "Ban khong duoc dung lenh nay.");
		}
	}
	return 1;
}
