CMD:refund(playerid, params[]) {
	// if(PlayerInfo[playerid][pAdmin] == 0) return 1;
	if(gettime() < GetPVarInt(playerid, "DelayRefund")) return SendClientMessage(playerid, X11_GREY_70, "Vui long thu lai sau vai phut.");
	new info[1000];
	strcat(info, "Xin chao %s, vay la GTAVLC v1 da ket thuc va v2 da den dem theo nhieu tinh nang moi.\nGTAVLC cam on ban da luon ung ho, va day la chinh sach refund tu v1\n- Tien IC (money + bank) se duoc REFUND 50% tren tong so tien cua ban."WHITE"\n- Cac xe se duoc REFUND 100% tru 4 xe (NRG-500, Bullet, Infernus, Turismo), co the REFUND 1 trong 4 xe do neu ban so huu\\");
	strcat(info, "- Tai san OOC se duoc giu nguyen.\n- REFUND 100% HOUSE va BIZ.\nBuoc tiep theo, ban can nhap tai khoan va mat khau cu (pass 2 neu co). Va ban se duoc refund tu dong.");
	Dialog_Show(playerid, REFUND_INFORMATION, DIALOG_STYLE_MSGBOX, "Thong tin Refund tu GTAVLC V1", info, "Tiep tuc", "Tro ve");
	return 1; 
}
Dialog:REFUND_INFORMATION(playerid, response, listitem, inputtext[]) {
	if(!response) return 1;
	Dialog_Show(playerid, REFUND_ACCOUNTNAME, DIALOG_STYLE_INPUT, "BUOC 1: TAI KHOAN", "Nhap tai khoan cu cua ban:", "Tiep tuc", "Tro ve");
	return 1;
}
IsAccountValid(const str[]) {
	new query[200];
	format(query, sizeof(query), "SELECT ID FROM oldusers WHERE name='%s' AND Banned=0", str);
	mysql_query(SQL, query, false);
	if(cache_num_rows()) return 0;
	return 1;
}
Dialog:REFUND_ACCOUNTNAME(playerid, response, listitem, inputtext[]) {
	if(!response) return callcmd::refund(playerid, "");
	new str[MAX_PLAYER_NAME];
	mysql_escape_string(inputtext, str);
	if(!IsAccountValid(str)) return Info(playerid, "Tai khoan nay khong ton tai tren may chu.");
	SetPVarString(playerid, "AccountName", str);
	Dialog_Show(playerid, REFUND_PASSWORD, DIALOG_STYLE_PASSWORD, "BUOC 2: MAT KHAU", "Nhap mat khau cua ban:", "Tiep tuc", "Tro ve");
	return 1;
}
Dialog:REFUND_PIN(playerid, response, listitem, inputtext[]) {
	if(!response) return callcmd::refund(playerid, "");
	new accountName[MAX_PLAYER_NAME], password[100];
	GetPVarString(playerid, "AccountName", accountName, MAX_PLAYER_NAME);	
	GetPVarString(playerid, "AccountPassword", password, MAX_PLAYER_NAME);

	new Cache: x = va_mysql_query("SELECT ID FROM oldusers WHERE Name='%s' AND Password='%s' AND Pin='%s' LIMIT 1", accountName, password, inputtext);
	if(cache_num_rows() == 0) return cache_delete(x), SendClientMessage(playerid, -1, "Ban da nhap sai ma PIN."), callcmd::refund(playerid, "");
	ShowAccountInformation(playerid, accountName, password);
	cache_delete(x);
	return 1;
}
Dialog:REFUND_PASSWORD(playerid, response, listitem, inputtext[]) {
	if(!response) return Dialog_Show(playerid, REFUND_ACCOUNTNAME, DIALOG_STYLE_INPUT, "BUOC 1: TAI KHOAN", "Nhap tai khoan cu cua ban:", "Tiep tuc", "Tro ve");
	new accountName[MAX_PLAYER_NAME];
	GetPVarString(playerid, "AccountName", accountName, MAX_PLAYER_NAME);
	new Cache: x = va_mysql_query("SELECT Pin FROM oldusers WHERE Name='%s' AND Password='%s' LIMIT 1", accountName, inputtext);
	if(cache_num_rows() == 0) return Info(playerid, "Mat khau khong chinh xac, vui long thu lai sau vai phut."), SetPVarInt(playerid, "DelayRefund", gettime() + 2 * 60);
	else {
		new pin[30];
		cache_get_value_name(0, "Pin", pin);
		if(strlen(PlayerInfo[playerid][pPin]) != 0) {
			SetPVarString(playerid, "AccountPassword", inputtext);			
			Dialog_Show(playerid, REFUND_PIN, DIALOG_STYLE_PASSWORD, "BUOC 2.5: MA PIN", "Ban can ma PIN de dang nhap vao tai khoan:", "Hoan tat", "Thoat");
		}
		else {
			ShowAccountInformation(playerid, accountName, inputtext);
		}
	}
	cache_delete(x);
	return 1;
}

ShowAccountInformation(const playerid, const acc[], const pass[]) {
	new str[200], query[300], refundFor[MAX_PLAYER_NAME], isRefund;
	format(query, sizeof(query), "SELECT `Refund`, `Bank`, `Money`, `House`, `refundFor`, `Level` FROM oldusers WHERE Name='%s' AND Password='%s' LIMIT 1", acc, pass);
	new Cache: x = mysql_query(SQL, query);
	cache_get_value_name_int(0, "Refund", isRefund);
	if(isRefund == 1) {
		cache_get_value_name(0, "refundFor", refundFor), 
		cache_delete(x), 
		va_Info(playerid, "Tai khoan nay da duoc mot nguoi khac Refund (%s).", refundFor);
		return 1;
	}
	//AND Refund=0 AND Banned=0 AND BTemp=0
	new bank, money, /*house = 999,*/ level; // house 999 default, bizz 255 default
	cache_get_value_name_int(0, "Bank", bank);
	cache_get_value_name_int(0, "Money", money);
	// cache_get_value_name_int(0, "House", house);
	cache_get_value_name_int(0, "Level", level);
	// cache_get_value_name_int(0, "Bizz", bizz);
	// cache_get_value_name_int(0, "Vip", vip);
	money = money / 2;
	GivePlayerCash(playerid, money);
	bank = bank / 2;
	PlayerInfo[playerid][pAccount] += bank;
	PlayerInfo[playerid][pLevel] = level;
	SetPlayerScore(playerid, PlayerInfo[playerid][pLevel]);
	UpdateProgress(playerid, 0);
	format(query, sizeof(query), "UPDATE `oldusers` SET Refund=1, refundFor='%s' WHERE `name`='%s'", GetName(playerid), acc);
	mysql_pquery(SQL, query);
	format(query, sizeof(query), "UPDATE `users` SET `Bank` = Bank + '%d' WHERE `ID`=%d", bank, PlayerInfo[playerid][pSQLID]);
	mysql_pquery(SQL, query);
	Update(playerid, pLevelx);
	// if(house != 999) {
/*		PlayerInfo[playerid][pHouseKey] = h, PlayerInfo[playerid][pRentKey] = 0, GiveAchievement(playerid, 9, "Mua mot ngoi nha");
		if(HouseInfo[h][hOwned] && HouseInfo[h][hSellPrice]) {
			foreach(new userID: Player) {
				if(PlayerInfo[userID][pSQLID] == HouseInfo[h][hOwnedSQLID]) PlayerInfo[userID][pAccount] += HouseInfo[h][hSellPrice], PlayerInfo[userID][pHouseKey] = 0;
			}
			va_SendEmail( HouseInfo[h][hOwnedSQLID], "%s da mua house %d voi gia $%s.", GetName(playerid), h, FormatNumber(HouseInfo[h][hSellPrice])), va_mysql_pquery("UPDATE `players` SET `Account`='Account'+'%d',`HouseKey`='0' WHERE ID='%d'", price, HouseInfo[h][hOwnedSQLID]);
		}
		HouseInfo[h][hOwned] = 1, 
		strmid(HouseInfo[h][hOwner], PlayerInfo[playerid][pUsername], 0, MAX_PLAYER_NAME, MAX_PLAYER_NAME), 
		HouseInfo[h][hSellPrice] = 0, 
		HouseInfo[h][hOwnedSQLID] = PlayerInfo[playerid][pSQLID], 
		HouseInfo[h][hValue] = HouseInfo[h][hLevel]*10000, 
		saveHouse(h), 
		GivePlayerCash(playerid, -price), 
		PlayerInfo[playerid][pSpawnChange] = 2;
	 	va_mysql_pquery("UPDATE players SET `RentKey`= '%d', `SpawnChange`= '%d', `HouseKey` = '%d' WHERE `ID`= '%d'", PlayerInfo[playerid][pRentKey] ,PlayerInfo[playerid][pSpawnChange],PlayerInfo[playerid][pHouseKey], PlayerInfo[playerid][pSQLID]),
		GameTextForPlayer(playerid, "~w~Welcome Home~n~Ban co the ra va vao bat cu luc nao bang cach dung ngay cua va nhap /exit", 5000, 3), 
		SendClientMessage(playerid, COLOR_SYN2, "Congratulations, for your new purchase !"), 
		HouseUpdate(h);*/
	// 	new id = playerid;
	// 	format(query, sizeof(query), "UPDATE `users` SET `House`='999' WHERE `House`='%d'", id);
	// 	mysql_query(SQL, query);
	// 	PlayerInfo[id][pHouse] = house;
	// 	format(query, sizeof(query), "UPDATE `users` SET `House`='%d' WHERE `ID`='%d'", house, PlayerInfo[id][pSQLID]);
	// 	mysql_query(SQL, query);
	// 	HouseInfo[house][hOwned] = 1;
	// 	format(HouseInfo[house][hOwner], 256, GetName(id));
	// 	HouseInfo[house][hValue] = 0;
	// 	OnPropTextdrawUpdate(1, house);
	// 	format(query, sizeof(query), "UPDATE `houses` SET `Owned`='1', `Owner`='%s', `Value`='0' WHERE `ID`='%d'", GetName(id), house);
	// 	mysql_query(SQL, query);
	// }
	cache_delete(x);
	format(str, sizeof(str), "Ban da refund tai khoan thanh cong!\nTai khoan: %s (level %d)\nMoney: %s (bank: %s)", acc, level, money);
	Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Refund thanh cong", str, "Ok", "");
	return 1;
}