CMD:contract(playerid, params[]) {
	if(IsPlayerLogged[playerid] == 0) return SendClientMessage(playerid, COLOR_RED, "Ban chua dang nhap!");
	new userID, money, szMessage[180];
	if(sscanf(params, "ui", userID, money)) return SendClientMessage(playerid, COLOR_RED, "Cu phap: {FFFFFF}/contract <playerid/name> <money>");
	if(!IsPlayerConnected(userID) && userID == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi khong ket noi.");
	if(PlayerInfo[playerid][pAdmin] < 7) {
		if(money < 100000 || money > 2000000) return SendClientMessage(playerid, COLOR_GREY, "Ban chi co the thuc hien mot hop dong toi thieu $100,000 va toi da $2,000,000.");
		if(GetPlayerCash(playerid) < money) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co du so tien da nhap!");
		if(IsACop(userID) && money < 1000000) return SendClientMessage(playerid, COLOR_GREY, "Gia toi thieu cua hop dong tren canh sat la $1,000,000");
		if(DeelayCommand[playerid][5] > 0) return DeelayTime(playerid, 5); //delay khong lam dung
		if(userID == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the lam dieu nay!");
		if(PlayerInfo[userID][pMember] == 11 || PlayerInfo[userID][pLeader] == 11) return SendClientMessage(playerid, COLOR_GREY, "Ban khong thuoc to chuc Hitman!");
		if(PlayerInfo[playerid][pMember] == 11 || PlayerInfo[playerid][pLeader] == 11) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung nay vi ban la thanh vien cua to chuc nay.");
		if(PlayerInfo[userID][pAdmin] != 0) return SendClientMessage(playerid, -1, "Muc tieu da chon la Admin.");
	}
	GivePlayerCash(playerid, -money);

	if(Contract[userID] == 1) HeadValue[userID] += money;
	else {
		HeadValue[userID] = money;
		Contract[userID] = 1;
	}
	UsedContract[userID] = 0;
	DeelayCommand[playerid][5] = 500;
	format(szMessage, sizeof(szMessage), "Ban dat mot hop dong lên %s voi giá $%s.", GetName(userID), FormatNumber(money));
	SendClientMessage(playerid, COLOR_WHITE, szMessage);
	format(szMessage, sizeof(szMessage), "# Da co mot hop dong moi voi gia $%s.", FormatNumber(money));
	SendFactionMessage(11, COLOR_LIGHTBLUE, szMessage);
	
	return 1;
}
CMD:contracts(playerid, params[]) {
	if(IsPlayerLogged[playerid] == 0) return SendClientMessage(playerid, COLOR_RED, "Ban chua dang nhap!");
	new contracts, szMessage[180];
	if(PlayerInfo[playerid][pMember] != 11 && PlayerInfo[playerid][pLeader] != 11) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la Hitman!");
	SendClientMessage(playerid, COLOR_SERVER, "------------------- Hop dong -------------------");
	foreach(new i: Player) {
		if(UsedContract[i] == 0 && IsPlayerConnected(i) && IsPlayerLogged[i] == 1) {
			if(Contract[i] == 1) {
				contracts ++;
			}
		}
	}
	if(contracts == 0) return SendClientMessage(playerid, COLOR_WHITE, "Hien tai khong co hop dong nao.");
	else {
		format(szMessage, 256,  "Hien tai co %d hop dong!", contracts);
		SendClientMessage(playerid, -1, szMessage);
	}
	SendClientMessage(playerid, COLOR_SERVER, "------------------- Hop dong -------------------");
	return 1;
}
CMD:gethit(playerid, params[]) {
	new userID, szMessage[180];
	if(PlayerInfo[playerid][pMember] != 11 && PlayerInfo[playerid][pLeader] != 11) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la Hitman!");
	if(!PlayerToPoint(100.0, playerid, -2162.3484,641.3492,1052.3750)) return SendClientMessage(playerid, COLOR_GREY, "Lenh nay chi co the su dung benh trong HQ.");
	if(PlayerHit[playerid] != -1) return SendClientMessage(playerid, COLOR_WHITE, "Ban da nhan mot hop dong khac.");
	new Iterator: Target<100>;
	foreach(new i: Player) {
		if(Contract[i] == 1 && UsedContract[i] == 0) {
			if(IsPlayerConnected(i) && IsPlayerLogged[i] == 1) {
				Iter_Add(Target, i);
				printf("Iter Add %d", i);
			}
		}
	}
	if(Iter_Count(Target) == 0) return SendClientMessage(playerid, COLOR_WHITE, "Hien tai, khong co hop dong nao.");
	userID = Iter_Random(Target);
	// if(PlayerInfo[userID][pMember] == 11) return SendClientMessage(playerid, COLOR_LGREEN, "[ERROR] Ban khong the lam dieu nay ngay bay gio!");
	UsedContract[userID] = 1;
	PlayerHit[playerid] = userID;
	format(szMessage, sizeof(szMessage), "**(( HA Dispatch: Hitman %s (%d) da ky mot hop dong moi voi gia %d$. ))**", GetName(playerid), playerid, HeadValue[userID]);
	SendFactionMessage(11, COLOR_LIGHTBLUE, szMessage);
	return 1;
}
CMD:leavehit(playerid, params[]) {
	if(PlayerInfo[playerid][pMember] != 11 && PlayerInfo[playerid][pLeader] != 11) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la Hitman!");
	if(PlayerHit[playerid] == -1) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co hop dong.");
	new szMessage[95], userID = PlayerHit[playerid];
	format(szMessage, sizeof(szMessage), "**(( HA Dispatch: Hitman %s (%d) da pha vo hop dong cua minh. ))**", GetName(playerid), playerid);
	SendFactionMessage(11, COLOR_LIGHTBLUE, szMessage);
	UsedContract[userID] = 0;
	PlayerHit[playerid] = -1;
	return 1;
}
CMD:mycontract(playerid, params[]) {
	new szMessage[110];
	if(IsPlayerLogged[playerid] == 0) return SendClientMessage(playerid, COLOR_RED, "Ban chua dang nhap!");
	if(PlayerInfo[playerid][pMember] != 11 && PlayerInfo[playerid][pLeader] != 11) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la Hitman!");
	if(PlayerHit[playerid] == -1) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co hop dong.");
	format(szMessage, 110, "Ban co mot hop dong tren mang cua %s(%d) voi gia $%s.", GetName(PlayerHit[playerid]), PlayerHit[playerid], FormatNumber(HeadValue[PlayerHit[playerid]]));
	SendClientMessage(playerid, COLOR_SERVER, szMessage);
	return 1;
}
CMD:undercover(playerid, params[]) {
	if(IsPlayerLogged[playerid] == 0) return SendClientMessage(playerid, COLOR_RED, "Ban chua dang nhap!");
	if(PlayerInfo[playerid][pMember] != 11 && PlayerInfo[playerid][pLeader] != 11) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la Hitman!");
	new string[256];
	if(GetPVarInt(playerid, "Undercover") == 0) {
		if(!PlayerToPoint(100.0, playerid, -2162.3484,641.3492,1052.3750)) return SendClientMessage(playerid, COLOR_GREY, "Lenh nay chi co the duoc su dung ben trong HQ.");
		SetPVarInt(playerid, "Undercover", 1);		
		format(string, sizeof(string), "**(( HA Dispatch: Hitman %s (%d) hien da cai trang. ))**", GetName(playerid), playerid);
		SendTeamMessage(11, 0x2C6CBFFF, string);
		SendClientMessage(playerid, COLOR_WHITE, "Hien tai ban dang cai trang. Nguoi choi khac se khong thay ten cua ban.");
		foreach(new i: Player) ShowPlayerNameTagForPlayer(i, playerid, false);
		TextDrawShowForPlayer(playerid, UndercoverTD);
	}
	else {
		SetPVarInt(playerid, "Undercover", 0);
		SendClientMessage(playerid, COLOR_WHITE, "Ban khong con cai trang nua.");
		foreach(new i: Player) ShowPlayerNameTagForPlayer(i, playerid, true);
		TextDrawHideForPlayer(playerid, UndercoverTD);
	}	
	return 1;
}