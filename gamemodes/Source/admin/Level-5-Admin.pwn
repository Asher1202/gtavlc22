CMD:setfpo(playerid, params[]) {
	if (PlayerInfo[playerid][pAdmin] < 5) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new id[25], fp;
	if(sscanf(params, "s[25]i",id,fp)) return SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/setfp <name> <FP>");
	new cont = MySQLCheckAccount(id);
	if(cont == 0) return SendClientMessage(playerid,-1, "[ERROR] Nguoi choi khong co trong co so du lieu!");
	new query[128];
	format(query,sizeof(query),"UPDATE users SET `FPunish`='%d' WHERE `name`='%s'",fp,id);
	mysql_query(SQL,query,false);//
	return 1;
}
CMD:daugia(playerid, params[]) {
	new item[50], id, time, string[180];
	if(PlayerInfo[playerid][pAdmin] < 5) return 1;
	if(Licitatie == 1) return SendClientMessage(playerid, -1, "Dang dien ra mot cuoc dau gia!");
	if(sscanf(params, "s[50]ii", item, id, time)) {
		SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/daugia <tip> <id> <phut>");
		SendClientMessage(playerid, COLOR_WHITE, "Co san: Nha, Bizz.");
		return 1;
	}
	if(strcmp(item, "nha", true, strlen(item)) == 0) TipLicitatie = 1;
	else if(strcmp(item, "bizz", true, strlen(item)) == 0) TipLicitatie = 2;
	else return SendClientMessage(playerid, COLOR_GREY, "Item khong hop le!");

	Licitatie = 1;
	TimpLicitatie = time*60;
	TotalBani = 0;
	foreach(new i: Player) {
		if(IsPlayerLogged[i] == 1) TotalMoney[i] = 0;
	}
	IDLicitatie = id;
	LastPlayer = -1;

	foreach(new i: Player) {
		if(toglicitatie[i] == 0) {
			SendClientMessage(i, COLOR_YELLOW, "Mot phien dau gia moi vua bat dau. Nhung tuy chon xem thong tin ve cuoc dau gia da bi tat.");
			SendClientMessage(i, COLOR_YELLOW, "Neu ban muon xem thong tin dau gia, hay su dung /tog de bat no len. De hieu them ve dau gia, su dung /info.");
		}
	}
	
	MesajLicitatie(0x7A45FFFF, "Mot phien dau gia moi vua bat dau!");
	switch(TipLicitatie) {
		case 1: format(string, sizeof(string), "Lan nay, chung toi se dau gia House ID %d. (/findhouse %d). ", id, id);
		case 2: format(string, sizeof(string), "Lan nay, chung toi se dau gia Bizz ID %d. (/findbiz %d). ", id, id);
	}
	MesajLicitatie(0x7A45FFFF, string);
	format(string, sizeof(string), "Ban co %d phut de ra gia.", time);
	MesajLicitatie(0x7A45FFFF, string);
	MesajLicitatie(0x7A45FFFF, "Cac lenh co san (/bid - de dat gia), (/info - huong dan & thong tin)");
	return 1;
}
/*
CMD:setgoal(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 5) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new amount, string[64];
	if(sscanf(params, "i", amount)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/setgoal <amount>");
	MAXGOAL = amount;
	format(string, sizeof(string), "Goal Moi: %s", FormatNumber(amount));
	//UpdateJobGoal(0, amount);
	SendClientMessage(playerid, COLOR_YELLOW, string);
	return 1;
}
CMD:resetgoal(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 5) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	ServerGoal = 0;
	//UpdateJobGoal(ServerGoal, MAXGOAL);
	//TerminatJobGoal = 0;
	new gString[180];
	format(gString, sizeof(gString), "(/resetgoal) {FFFFFF}%s Da Reset Goal.", GetName(playerid));
	SendAdminMessage(COLOR_DARKNICERED, gString, 5);
	mysql_tquery(SQL, "UPDATE `stuff` SET `goal`='0'", "", "");
	return 1;
}*/
CMD:money(playerid, params[]) {
    if(PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new money,id,string[180];
	if(sscanf(params, "ui",id,money)) return SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/money <playerid/name> <So tien>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	ResetPlayerCash(id);
	GivePlayerCash(id, money);
	format(string, sizeof(string), "AdmCmd: %s set tien cua %s thanh $%s.", GetName(playerid),GetName(id),FormatNumber(money));
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(COLOR_LOGS, string,5);
	format(string, sizeof(string), "Ban da set tien cho %s(%d) thanh $%s.", GetName(id), id, FormatNumber(money));
	SendClientMessage(playerid, COLOR_WHITE, string);
	format(string, sizeof(string), "Admin %s da set tien cua ban thanh $%s.", GetName(playerid), FormatNumber(money));
	SendClientMessage(id, COLOR_WHITE, string);
	Update(id, pCashx);
	return 1;
}

CMD:givemoney(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new money,id,string[120],sendername[25],giveplayer[25];
	if(sscanf(params, "ui",id,money)) return SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/givemoney <playerid/name> <So tien>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	if(money < 1) return SendClientMessage(playerid, -1, "So tien khong duoc it hon 1.");
	GivePlayerCash(id, money);
	GetPlayerName(id, giveplayer, sizeof(giveplayer));
	GetPlayerName(playerid, sendername, sizeof(sendername));
	format(string, sizeof(string), "AdmCmd: %s da gui %s$ cho %s.", sendername,FormatNumber(money),giveplayer);
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(COLOR_LOGS, string,5);
	format(string, sizeof(string), "Ban da gui %s(%d) so tien $%s.", GetName(id), id, FormatNumber(money));
	SendClientMessage(playerid, COLOR_WHITE, string);
	format(string, sizeof(string), "Admin %s da gui cho ban $%s.", GetName(playerid), FormatNumber(money));
	SendClientMessage(id, COLOR_WHITE, string);
	Update(id, pCashx);	
	format(string, sizeof(string), "%s da nhan duoc $%s tu %s (/givemoney)", GetName(id), FormatNumber(money), GetName(playerid));
	////InsertLog(id, string, LOG_MONEY);
	Log("logs/money.log", string);
	return 1;

}

CMD:giveburger(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new money,id,string[120],sendername[25],giveplayer[25];
	if(sscanf(params, "ui",id,money)) return SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/setburger <playerid/name> <so banh>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	if(money < 1) return SendClientMessage(playerid, -1, "So banh duoc it hon 1.");
	
	GetPlayerName(id, giveplayer, sizeof(giveplayer));
	GetPlayerName(playerid, sendername, sizeof(sendername));
	format(string, sizeof(string), "AdmCmd: %s da gui %d banh burger cho %s.", sendername,money,giveplayer);
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(COLOR_LOGS, string,5);
	format(string, sizeof(string), "Ban da cho %s(%d) %d banh hamburger.", GetName(id), id, money);
	SendClientMessage(playerid, COLOR_WHITE, string);
	format(string, sizeof(string), "Admin %s da gui cho ban %d cai banh hamburger.", GetName(playerid), money);
	SendClientMessage(id, COLOR_WHITE, string);
	Inventory_Add(id,"Burger", 2703, money, 1);
	return 1;

}
CMD:setburger(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new money,id,string[120],sendername[25],giveplayer[25];
	if(sscanf(params, "ui",id,money)) return SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/setburger <playerid/name> <so banh>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	if(money < 1) return SendClientMessage(playerid, -1, "So banh duoc it hon 1.");
	
	GetPlayerName(id, giveplayer, sizeof(giveplayer));
	GetPlayerName(playerid, sendername, sizeof(sendername));
	format(string, sizeof(string), "AdmCmd: %s da set burger cua %s thanh  %d.", sendername,giveplayer,money);
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(COLOR_LOGS, string,5);
	format(string, sizeof(string), "Ban da set %s(%d) %d banh hamburger.", GetName(id), id, money);
	SendClientMessage(playerid, COLOR_WHITE, string);
	format(string, sizeof(string), "Admin %s da set burger cua ban thanh %d.", GetName(playerid), money);
	SendClientMessage(id, COLOR_WHITE, string);
	Inventory_Set(id,"Burger", 1, money);
	return 1;

}
CMD:tod(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 5) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new hour,string[60];
	if(sscanf(params, "i", hour)) return SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/tod <timp>");
	SetWorldTime(hour);
	format(string, sizeof(string), "AdmCmd: %s da set thoi gian %d.", GetName(playerid),hour);
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(COLOR_LOGS, string, 3);
	return 1;
}
CMD:asellhouse(playerid, params[]) {
	new house, string[180], query[180];
	if(sscanf(params, "d", house)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/asellhouse <House ID>");
	if(PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, COLOR_GREY, AdminOnly);
	foreach(new i: Player) {
		if(IsPlayerConnected(i) && PlayerInfo[i][pHouse] == house) {
			PlayerInfo[i][pHouse] = 999;
			PlayerInfo[i][pRented] = -1;
			Update(i, pHousex);
		}
	}
	HouseInfo[house][hHel] = 0;
	HouseInfo[house][hHel] = 0;
	HouseInfo[house][hLock] = 0;
	HouseInfo[house][hOwned] = 1;
	HouseInfo[house][hValue] = 0;
	format(query,sizeof(query),"UPDATE `houses` SET `Hel`='0',`Arm`='0',`Lockk`='0',`Owned`='1',`Owner`='The State',`Value`='0' WHERE `ID`='%d'",house);
	mysql_query(SQL,query,false);
	format(query,sizeof(query),"UPDATE users SET `House`='999' WHERE `name`='%s'",HouseInfo[house][hOwner]);
	mysql_query(SQL,query,false);	
	strmid(HouseInfo[house][hOwner], "The State", 0, strlen("The State"), 255);
	PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	format(string, sizeof(string), "* House %d da duoc ban lai cho tieu bang!", house);
	SendClientMessage(playerid, COLOR_YELLOW, string);
	OnPropTextdrawUpdate(1, house);
	return 1;
}
CMD:editraport(playerid, params[])
{
    new fid , string[180];
	if(PlayerInfo[playerid][pAdmin] < 5) return SendClientMessage(playerid, COLOR_LGREEN, AdminOnly);
	if(sscanf(params, "i", fid)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/editraport <faction>");
	if(fid < 1 || fid > facs) return SendClientMessage(playerid, COLOR_GREY, "To chuc khong hop le! (1-15)");
	format(string, sizeof(string), "Rank 1\t%d\nRank 2\t%d\nRank 3\t%d\nRank 4\t%d\nRank 5\t%d\nRank 6\t%d", FactionInfo[fid][fRank1], FactionInfo[fid][fRank2],
	FactionInfo[fid][fRank3], FactionInfo[fid][fRank4], FactionInfo[fid][fRank5], FactionInfo[fid][fRank6]);
	new title[180];
	format(title, 256, "%s (%d)", FactionName(fid), fid);
    Dialog_Show(playerid, DIALOG_FACTION, DIALOG_STYLE_TABLIST, title, string, "Select", "Back");
	SetPVarInt(playerid, "Faction", fid);
	return 1;
}
CMD:setrankname(playerid, params[])
{
	new string[180], name[180], fid, rank;
	if(PlayerInfo[playerid][pAdmin] < 5) return SendClientMessage(playerid, COLOR_LGREEN, AdminOnly);
	if(sscanf(params, "iis[180]", fid, rank, name)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/setrankname <faction> <rank (1-7)> <name>");
	if(rank < 1 || rank > 7) return SendClientMessage(playerid, -1, "Rank invalid! (1-7)");
	if(fid < 1 || fid > facs) return SendClientMessage(playerid, COLOR_GREY, "To chuc khong hop le! (1-15)");
	format(fRankNames[fid][rank-1], 17, name); 
	format(string, sizeof(string), "* Ban da thiet lap ten rank %d cua to chuc %s tro thanh %s.", rank, FactionName(fid), name);
	SendClientMessage(playerid, COLOR_LGREEN, string);

	new query[250];
	format(query, sizeof(query), "UPDATE `factions` SET `Name1`='%s', `Name2`='%s', `Name3`='%s', `Name4`='%s', `Name5`='%s', `Name6`='%s', `Name7`='%s' WHERE `ID`='%d'", 
	fRankNames[fid][0], fRankNames[fid][1], fRankNames[fid][2], fRankNames[fid][3], fRankNames[fid][4], fRankNames[fid][5], fRankNames[fid][6], fid);
	mysql_query(SQL, query,false);
	return 1;
}
CMD:smotd(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 5) return 1;
	new string[180];
	if(sscanf(params, "s[180]",string)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/staffmotd <noi dung>");
	format(StaffMotd, sizeof(StaffMotd), string);
	format(string, sizeof(string), "[STAFF MOTD]: {FFFFFF}%s",string);
	SendStaffMessage(0xAB0000FF, string);
	format(string, sizeof(string), "UPDATE `stuff` SET `StaffMotd`='%s' WHERE `ID`='%d'",StaffMotd, PlayerInfo[playerid][pMember]);
	mysql_query(SQL ,string, false);
	return 1;
}
CMD:helperchatcolor(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 5) return 1;
	new string[180];
	if(sscanf(params, "s[180]",string)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/staffmotd <noi dung>");
	format(helperChatColor, sizeof(helperChatColor), string);
	format(string, sizeof(string), "{%s} INFO: HELPER CHAT COLOR da duoc doi boi %s.", helperChatColor, GetName(playerid));
	SendStaffMessage(0xAB0000FF, string);
	format(string, sizeof(string), "UPDATE `stuff` SET `HelperChatColor`='%s'", helperChatColor, PlayerInfo[playerid][pMember]);
	mysql_query(SQL ,string, false);	
	return 1;
}
CMD:asellbiz(playerid, params[]) {
	new house, string[180], query[180];
	if(sscanf(params, "d", house)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/asellbiz <Biz ID>");
	if(PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, COLOR_GREY, AdminOnly);
	foreach(new i: Player) {
		if(IsPlayerConnected(i) && PlayerInfo[i][pBizz] == house) {
			PlayerInfo[i][pBizz] = 255;
			Update(i, pBizzx);
		}
	}			
	BizzInfo[house][bLocked] = 0;
	BizzInfo[house][bOwned] = 1;
	BizzInfo[house][bBuyPrice] = 0;
	format(query,sizeof(query),"UPDATE `bizz` SET `Locked`='0',`Owned`='1',`Owner`='The State',`BuyPrice`='0' WHERE `ID`='%d'",house);
	mysql_query(SQL,query,false);
	format(query,sizeof(query),"UPDATE users SET `Bizz`='255' WHERE `name`='%s'",BizzInfo[house][bOwner]);
	mysql_query(SQL,query,false);	
	strmid(BizzInfo[house][bOwner], "The State", 0, strlen("The State"), 255);	
	format(string, sizeof(string), "* Bizz %d da duoc ban lai cho tieu bang!", house);
	SendClientMessage(playerid, COLOR_YELLOW, string);
	OnPropTextdrawUpdate(2, house);
	return 1;
}