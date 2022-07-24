// function CancelTrade(playerid) {
// 	new playerID = GetPVarInt(playerid, "OfferBy");
// 	if(playerID != -1 && IsPlayerConnected(playerID)){
// 		SendClientMessage(playerid, -1, "ERROR: {FFFFFF} Giao dich da duoc huy bo vi thoi gian da het han!");
// 		SendClientMessage(playerID, -1, "ERROR: {FFFFFF} Giao dich da duoc huy bo vi thoi gian da het han!");
// 		SetPVarInt(playerid, "OfferBy", -1);
// 	}
// 	return 1;
// }
ShowTradeTDs(playerid) {
	PlayerTextDrawSetString(playerid, TradePTD[4], "~r~Khoa");
	PlayerTextDrawSetString(playerid, TradePTD[5], "~r~Khoa");
	for(new i = 0; i < sizeof(TradePTD); i++) if(i < 6) PlayerTextDrawShow(playerid, TradePTD[i]);
	for(new i = 0; i < sizeof(TradeTD); i++) if(i < 11) TextDrawShowForPlayer(playerid, TradeTD[i]);
	SelectTextDraw(playerid, 0x00BFFFFF);
	return 1;
}
HideTradeTDs(playerid) {
	for(new i = 0; i < sizeof(TradePTD); i++) PlayerTextDrawHide(playerid, TradePTD[i]);
	for(new i = 0; i < sizeof(TradeTD); i++) TextDrawHideForPlayer(playerid, TradeTD[i]);
	TradeID[playerid] = -1;
	TradePlayer[playerid] = -1;
	TradeTime[playerid] = 0;
	return 1;
}
HideTradeItems(playerid) {
	DeletePVar(playerid, "MoneyTrade");
	DeletePVar(playerid, "HouseTrade");
	DeletePVar(playerid, "BusinessTrade");
	SetPVarInt(playerid, "CarTrade", -1);
	
	new id = TradeID[playerid];
	if(GetPVarInt(playerid, "TradeAccepted")  == 0) {
		for(new i = 0; i < sizeof(TradeTitle); i++) {
			if(i >= 0 && i < 5) {
				PlayerTextDrawHide(playerid, TradeTitle[i]);
				PlayerTextDrawHide(id, TradeTitle[i]);
			}	
		}
		for(new i = 0; i < sizeof(TradeIcon); i++) {
			if(i >= 0 && i < 5) {
				PlayerTextDrawHide(playerid, TradeIcon[i]);
				PlayerTextDrawHide(id, TradeIcon[i]);
			}	
		}		
		for(new i = 0; i < sizeof(TradeTD); i++) {
			if(i >= 11 && i < 16) {
				TextDrawHideForPlayer(playerid, TradeTD[i]);
				TextDrawHideForPlayer(id, TradeTD[i]);
			}	
		}
	}
	if(GetPVarInt(playerid, "TradeAccepted")  == 1) {
		for(new i = 0; i < sizeof(TradeTitle); i++) {
			if(i >= 5 && i < 10) {
				PlayerTextDrawHide(playerid, TradeTitle[i]);
				PlayerTextDrawHide(id, TradeTitle[i]);
			}	
		}
		for(new i = 0; i < sizeof(TradeIcon); i++) {
			if(i >= 5 && i < 10) {
				PlayerTextDrawHide(playerid, TradeIcon[i]);
				PlayerTextDrawHide(id, TradeIcon[i]);
			}	
		}		
		for(new i = 0; i < sizeof(TradeTD); i++) {
			if(i >= 16 && i < 21) {
				TextDrawHideForPlayer(playerid, TradeTD[i]);
				TextDrawHideForPlayer(id, TradeTD[i]);
			}
		}
	}	
	TradeItems[playerid] = 0;	
	return 1;
}
FinishTrade(playerid) {
	new id = TradeID[playerid], string[256], string89[256], query[256], logg[300], items[128];
	SendClientMessage(playerid, COLOR_GOLD, "Giao dich da hoan tat!");
	SendClientMessage(id, COLOR_GOLD, "Giao dich da hoan tat!");
	strcat(string, "Ban nhan duoc: ");
	if(GetPVarInt(playerid, "MoneyTrade") != 0) {
		if(GetPlayerCash(playerid) >= GetPVarInt(playerid, "MoneyTrade")) {
			new moneyLeft = PayTax(playerid, GetPVarInt(playerid, "MoneyTrade"), e_TRADE);
			GivePlayerCash(id, moneyLeft);
			GivePlayerCash(playerid, -GetPVarInt(playerid, "MoneyTrade"));
		} 
		else {
			SetPVarInt(playerid, "MoneyTrade", -1);
			new str[129];
			format(str, sizeof(str), "%s su dung bug tien /trade, hay bao lai voi ad cap cao.", GetName(playerid));
			SendStaffMessage(COLOR_YELLOW, str);
		}
		format(string89, sizeof(string89), "$%s ", FormatNumber(GetPVarInt(playerid, "MoneyTrade")));
		strcat(string, string89);
		strcat(items, string89);
	}
	if(GetPVarInt(playerid, "HouseTrade") != 0) {
		format(string89, sizeof(string89), "House %d ", GetPVarInt(playerid, "HouseTrade"));
		strcat(string, string89);
		strcat(items, string89);
		
		if(GetPVarInt(id, "HouseTrade") == 0) {
			PlayerInfo[playerid][pHouse] = 999;
			UpdateVar(playerid, "House", 999);
		}
		
		GiveHouse(id, GetPVarInt(playerid, "HouseTrade"));
		finishAchievement(id, 3);	
	}	
	if(GetPVarInt(playerid, "BusinessTrade") != 0) {
		format(string89, sizeof(string89), "Business %d ", GetPVarInt(playerid, "BusinessTrade"));
		strcat(string, string89);
		strcat(items, string89);
		
		if(GetPVarInt(id, "BusinessTrade") == 0) {
			PlayerInfo[playerid][pBizz] = 255;
			UpdateVar(playerid, "Bizz", 255);
		}	
		GiveBiz(id, GetPVarInt(playerid, "BusinessTrade"));
		finishAchievement(id, 2);
	}	
	if(GetPVarInt(playerid, "CarTrade") != -1) {
		new x = GetPVarInt(playerid, "CarTrade");
		new idd = PlayerInfo[playerid][pCarKey][x];
		format(string89, sizeof(string89), "Xe %s (%d) ", aVehicleNames[CarInfo[idd][cModel]-400], idd);
		strcat(string, string89);			
		strcat(items, string89);
		PlayerInfo[playerid][pCarKey][x] = 0;
		format(query, sizeof(query), "UPDATE `users` SET `CarKey%d`='0' WHERE `ID`='%d'", x+1, PlayerInfo[playerid][pSQLID]);
		mysql_query(SQL, query);	
		new key = FindCSlot(id);
		PlayerInfo[id][pCarKey][key-1] = idd;
		format(CarInfo[idd][cOwner], 64, GetName(id));
		CarInfo[idd][Userid] = PlayerInfo[id][pSQLID];
		format(query, sizeof(query), "UPDATE `cars` SET `Owner`='%s', `Userid`='%d' WHERE `ID`='%d'", GetName(id), PlayerInfo[id][pSQLID], idd);
		mysql_query(SQL, query);	
		format(query, sizeof(query), "UPDATE `users` SET `CarKey%d`='%d' WHERE `ID`='%d'", key, idd, PlayerInfo[id][pSQLID]);
		mysql_query(SQL, query);			
	}
	SendClientMessage(id, COLOR_GOLD, string);
	format(logg, sizeof(logg), "%s da chuyen [%s]", GetName(playerid), items);	
	items = "";
	string = "Ban nhan duoc: ";
	if(GetPVarInt(id, "MoneyTrade") != 0) {
		if(GetPlayerCash(id) >= GetPVarInt(id, "MoneyTrade")) {
			new moneyLeft = PayTax(id, GetPVarInt(id, "MoneyTrade"), e_TRADE);
			GivePlayerCash(playerid, moneyLeft);
			GivePlayerCash(id, -GetPVarInt(id, "MoneyTrade"));
		}
		else {
			SetPVarInt(id, "MoneyTrade", -1);
			new str[129];
			format(str, sizeof(str), "%s su dung bug tien /trade, hay bao lai voi ad cap cao.", GetName(id));
			SendStaffMessage(COLOR_YELLOW, str);
		}		
		format(string89, sizeof(string89), "$%s |", FormatNumber(GetPVarInt(id, "MoneyTrade")));
		strcat(string, string89);
		strcat(items, string89);
	}
	if(GetPVarInt(id, "HouseTrade") != 0) {
		format(string89, sizeof(string89), "House %d ", GetPVarInt(id, "HouseTrade"));
		strcat(string, string89);
		strcat(items, string89);
		
		if(GetPVarInt(playerid, "HouseTrade") == 0) {		
			PlayerInfo[id][pHouse] = 999;
			UpdateVar(id, "House", 999);
		}
		
		GiveHouse(playerid, GetPVarInt(id, "HouseTrade"));
		finishAchievement(playerid, 3);
	}	
	if(GetPVarInt(id, "BusinessTrade") != 0) {
		format(string89, sizeof(string89), "Business %d ", GetPVarInt(id, "BusinessTrade"));
		strcat(string, string89);
		strcat(items, string89);
		
		if(GetPVarInt(playerid, "BusinessTrade") == 0) {	
			PlayerInfo[id][pBizz] = 255;
			UpdateVar(id, "Bizz", 255);
		}
		
		GiveBiz(playerid, GetPVarInt(id, "BusinessTrade"));
		finishAchievement(playerid, 2);
	}				
	if(GetPVarInt(id, "CarTrade") != -1) {
		new x = GetPVarInt(id, "CarTrade");
		new idd = PlayerInfo[id][pCarKey][x];
		format(string89, sizeof(string89), "Xe %s (%d) ", aVehicleNames[CarInfo[idd][cModel]-400], idd);
		strcat(string, string89);	
		strcat(items, string89);
		PlayerInfo[id][pCarKey][x] = 0;
		format(query, sizeof(query), "UPDATE `users` SET `CarKey%d`='0' WHERE `ID`='%d'", x+1, PlayerInfo[id][pSQLID]);
		mysql_query(SQL, query);	
		new key = FindCSlot(playerid);
		PlayerInfo[playerid][pCarKey][key-1] = idd;
		format(CarInfo[idd][cOwner], 64, GetName(playerid));
		CarInfo[idd][Userid] = PlayerInfo[playerid][pSQLID];
		format(query, sizeof(query), "UPDATE `cars` SET `Owner`='%s', `Userid`='%d' WHERE `ID`='%d'", GetName(playerid), PlayerInfo[playerid][pSQLID], idd);
		mysql_query(SQL, query);	
		format(query, sizeof(query), "UPDATE `users` SET `CarKey%d`='%d' WHERE `ID`='%d'", key, idd, PlayerInfo[playerid][pSQLID]);
		mysql_query(SQL, query);			
	}
	SendClientMessage(playerid, COLOR_GOLD, string);
	
	format(logg, sizeof(logg), "%s da chuyen [%s], cho %s (user:%d).", logg, items, GetName(id), PlayerInfo[id][pSQLID]);
	Log("logs/trade.log", logg);
	
	CancelSelectTextDraw(playerid);
	HideTradeItems(playerid);
	HideTradeTDs(playerid);
	
	CancelSelectTextDraw(id);
	HideTradeItems(id);
 	HideTradeTDs(id);
	return 1;
}
AddTradeItem(playerid, type, amount) {
	new string[256], tid, pid;
	if(TradeItems[playerid] == 5) return 1;
	if(GetPVarInt(playerid, "TradeAccepted") == 0) {
		tid = TradeItems[playerid]+11;
		pid = TradeItems[playerid];
	}
	if(GetPVarInt(playerid, "TradeAccepted") == 1) {
		tid = TradeItems[playerid]+16;
		pid = TradeItems[playerid]+5;	
	}		
	TradeItems[playerid] ++;
	new id = TradeID[playerid];
	TextDrawShowForPlayer(playerid, TradeTD[tid]);
	TextDrawShowForPlayer(id, TradeTD[tid]);
	switch(type) {
		case 0: {
			SetPVarInt(playerid, "MoneyTrade", amount);
			format(string, sizeof(string), "$%s", FormatNumber(amount));
			PlayerTextDrawSetString(playerid, TradeTitle[pid], string);
			PlayerTextDrawSetString(id, TradeTitle[pid], string);						
			PlayerTextDrawSetPreviewModel(playerid, TradeIcon[pid], 1212);
			PlayerTextDrawSetPreviewModel(id, TradeIcon[pid], 1212);
		}	
		case 1: {
			SetPVarInt(playerid, "HouseTrade", PlayerInfo[playerid][pHouse]);
			format(string, sizeof(string), "House %d", PlayerInfo[playerid][pHouse]);
			PlayerTextDrawSetString(playerid, TradeTitle[pid], string);
			PlayerTextDrawSetString(id, TradeTitle[pid], string);					
			PlayerTextDrawSetPreviewModel(playerid, TradeIcon[pid], 1273);	
			PlayerTextDrawSetPreviewModel(id, TradeIcon[pid], 1273);			
		}
		case 2: {
			SetPVarInt(playerid, "BusinessTrade", PlayerInfo[playerid][pBizz]);
			format(string, sizeof(string), "Business %d", PlayerInfo[playerid][pBizz]);
			PlayerTextDrawSetString(playerid, TradeTitle[pid], string);
			PlayerTextDrawSetString(id, TradeTitle[pid], string);				
			PlayerTextDrawSetPreviewModel(playerid, TradeIcon[pid], 1272);	
			PlayerTextDrawSetPreviewModel(id, TradeIcon[pid], 1272);				
		}
		case 3: {
			SetPVarInt(playerid, "CarTrade", amount);
			new idd = PlayerInfo[playerid][pCarKey][amount];
			new model = CarInfo[idd][cModel];
			format(string, sizeof(string), "%s~n~%0.2f km > Colors: %d, %d", aVehicleNames[model-400], CarInfo[idd][KM], CarInfo[idd][cColorOne], CarInfo[idd][cColorTwo]);
			PlayerTextDrawSetString(playerid, TradeTitle[pid], string);
			PlayerTextDrawSetString(id, TradeTitle[pid], string);			
			PlayerTextDrawSetPreviewModel(playerid, TradeIcon[pid], model);	
			PlayerTextDrawSetPreviewVehCol(playerid, TradeIcon[pid], CarInfo[idd][cColorOne], CarInfo[idd][cColorTwo]);
			PlayerTextDrawSetPreviewModel(id, TradeIcon[pid], model);	
			PlayerTextDrawSetPreviewVehCol(id, TradeIcon[pid], CarInfo[idd][cColorOne], CarInfo[idd][cColorTwo]);			
		}			
	}
	PlayerTextDrawShow(playerid, TradeTitle[pid]);	
	PlayerTextDrawShow(id, TradeTitle[pid]);	
	PlayerTextDrawShow(playerid, TradeIcon[pid]);	
	PlayerTextDrawShow(id, TradeIcon[pid]);		
	return 1;
}

CMD:trade(playerid, params[]) {
	if(strlen(PlayerInfo[playerid][pPin]) != 0 && PlayerInfo[playerid][pPinLogged] == 0) {
	 SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay vi ban chua dang nhap PIN.");
	 SendClientMessage(playerid, COLOR_GREY, "De xac thuc, su dung '/loginpin'!");
	 return 1;
	}
	new id, string[180];				
	if(sscanf(params, "u", id)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/giaodich <playerid/name>");
	if(GetPlayerInterior(playerid) != 0 || IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the lam dieu nay khi dang o trong Interior hoac tren mot phuong tien!");
	if(GetDistanceBetweenPlayers(playerid,id) > 5) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o gan nguoi choi do");
	if(id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong dang nhap.");
	if(PlayerInfo[id][pLevel] < 5 || PlayerInfo[playerid][pLevel] < 5) return SendClientMessage(playerid, COLOR_GREY, "Ban hoac nguoi choi do khong dat level 5!");
	if(TradePlayer[id] == playerid) return SendClientMessage(playerid, -1, "Ban da gui loi moi giao dich cho nguoi choi nay!");
	if(TradeID[playerid] != -1) return SendClientMessage(playerid, COLOR_WHITE, "Ban da o trong mot cuoc giao dich!");
	if(playerid == id) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the giao dich voi chinh ban!");
	TradePlayer[id] = playerid;
	format(string, sizeof(string), "* Ban da moi %s (%d) giao dich.", GetName(id), id);
	SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
	format(string, sizeof(string), "* %s (%d) da moi ban giao dich. Su dung (/chapnhan trade %d) de chap nhan loi moi.", GetName(playerid), playerid, playerid);
	SendClientMessage(id, COLOR_LIGHTBLUE, string);	
	return 1;
}