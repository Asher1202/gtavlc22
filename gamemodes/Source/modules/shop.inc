enum SHOP_TRANSCATION_UNIT {
	TYPE_PREMIUM_POINTS,
	TYPE_KC,
	TYPE_MONEY
}
enum e_SHOP_INFO {
	SHOP_ITEM_NAME[24],
	SHOP_ITEM_PRICE,
	SHOP_TRANSCATION_UNIT:SHOP_ITEM_UNIT
}
new const NormalShopInfo[][e_SHOP_INFO] = {
	{"Clan 60 ngay", 				300, 	TYPE_PREMIUM_POINTS},
	{"Noi that house", 				150, 	TYPE_PREMIUM_POINTS},
	//{"Premium cars", 				300, 	TYPE_PREMIUM_POINTS},
	{"Xoa 10 FP", 					30, 	TYPE_PREMIUM_POINTS},
	{"Doi ten", 					50, 	TYPE_PREMIUM_POINTS},
	{"Vehicle hidden color", 		30, 	TYPE_PREMIUM_POINTS},
	{"Them 1 slot xe", 				25, 	TYPE_PREMIUM_POINTS},
	// {"Clear 1 warn", 				25, 	TYPE_PREMIUM_POINTS},
	// {"Vehicle KM Reset", 			30, 	TYPE_PREMIUM_POINTS},
	// {"MP3 Player", 					20, 	TYPE_PREMIUM_POINTS},
	{"iPhone", 						50, 	TYPE_PREMIUM_POINTS},
	// {"Thay doi gioi tinh", 			50, 	TYPE_PREMIUM_POINTS},
	{"Phao hoa (10 vien)", 			50, 	TYPE_PREMIUM_POINTS},
	//{"Crate (10 hop)", 				250, 	TYPE_PREMIUM_POINTS},
	// {"Mua giay phep", 				-1, 	TYPE_MONEY},
	{"Vehicle Neon", 				100, 	TYPE_PREMIUM_POINTS}
	// {"Bonus +50% Job (1 gio)", 	70, 	TYPE_PREMIUM_POINTS},
	// {"Bonus +100% Job (1 gio)", 	135, 	TYPE_PREMIUM_POINTS}
};
new const KimCuongShop[][e_SHOP_INFO] = {
	{"Crate Random", 				30, 	TYPE_KC},
	{"Crate Skin", 				45, 	TYPE_KC},
	{"Crate Car Rare", 					60, 	TYPE_KC},
	{"Crate Car Epic", 					125, 	TYPE_KC},
	{"Crate Car Legend", 		250, 	TYPE_KC},
	{"Crate Car Mythical", 				500, 	TYPE_KC}
};

CMD:shop(playerid, params[]) {
	if(strlen(PlayerInfo[playerid][pPin]) != 0 && PlayerInfo[playerid][pPinLogged] == 0) {
		SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay vi ban chua dang nhap PIN.");
		SendClientMessage(playerid, COLOR_GREY, "De xac thuc, su dung '/loginpin'!");
		return 1;
	}
	va_SendClientMessage(playerid, -1, "{ccffcc}SHOP: Ban co %d "DIEMCAOCAP".",PlayerInfo[playerid][pPremiumPoints]);
	Dialog_Show(playerid, DIALOG_SHOPMENU, DIALOG_STYLE_TABLIST_HEADERS, "Shop Menu", 
		"Shop Type\tItem\n\
		{FFEA3B}[+] Shop Info{FFFFFF}\n\
		Normal Shop\t16 items\n\
		Shop Kim Cuong\t6 items\n\
		Extra Packs\t0 items", "Select", "Cancel"
	);
	return 1;
}
Dialog:DIALOG_SHOPMENU(playerid, response, listitem, inputtext[]) {
	if(!response) return 1;
	switch(listitem) {
		case 1: {
			ShowNormalShop(playerid);
		}
		case 2: {
			ShowKCShop(playerid);
		}
		default: {
			Dialog_Show(playerid, DIALOG_SHOPBACK, DIALOG_STYLE_MSGBOX, "GTAVLC System", "Dang cap nhat...", "Dong", "");
		}		
	}
	return 1;
}
ShowNormalShop(playerid) {
	new
		premiumpoints = PlayerInfo[playerid][pPremiumPoints],
		string[80], szDialog[2500];

	strcat(szDialog, "Num\tInfo\n{FFE100}(!) HUONG DAN NAP TIEN (MOMO/CHUYEN KHOAN){FFFFFF}\n");
	
	for(new i; i < sizeof(NormalShopInfo); i++) {
		if(NormalShopInfo[i][SHOP_ITEM_UNIT] == TYPE_PREMIUM_POINTS) {
			format(string, sizeof(string), "%s - %s%s "#DIEMCAOCAP"\n", NormalShopInfo[i][SHOP_ITEM_NAME], premiumpoints >= 300 ? "{1ECC14}" : "{FF0000}", FormatNumber(NormalShopInfo[i][SHOP_ITEM_PRICE]));
			strcat(szDialog, string);	
		}
		else if(NormalShopInfo[i][SHOP_ITEM_UNIT] == TYPE_MONEY) {
			format(string, sizeof(string), "%s\n", NormalShopInfo[i][SHOP_ITEM_NAME]);
			strcat(szDialog, string);
		}
	}
	// if(gold >= 300) format(string, sizeof(string), "Clan(60 ngay) - {1ECC14}300 "#DIEMCAOCAP"\n");
	// else format(string, sizeof(string), "Clan(60 ngay) - {FF0000}300 "#DIEMCAOCAP"\n");
	// strcat(szDialog, string);	
	// if(gold >= 150) format(string, sizeof(string), "Noi that trong nha - {1ECC14}150 "#DIEMCAOCAP"\n");
	// else format(string, sizeof(string), "Noi that trong nha - {FF0000}150 "#DIEMCAOCAP"\n");
	// strcat(szDialog, string);	
	// if(gold >= 500) format(string, sizeof(string), "Xe dac biet - {1ECC14}500 xu\n");
	// else format(string, sizeof(string), "Xe dac biet - {FF0000}500 xu\n");
	// strcat(szDialog, string);
	// if(gold >= 30) format(string, sizeof(string), "Xoa 10 FP - {1ECC14}30 "#DIEMCAOCAP"\n");
	// else format(string, sizeof(string), "Xoa 10 FP - {FF0000}30 "#DIEMCAOCAP"\n");
	// strcat(szDialog, string);
	// if(gold >= 150) format(string, sizeof(string), "Doi ten (Sale off) - {1ECC14}150 "#DIEMCAOCAP"\n");
	// else format(string, sizeof(string), "Doi ten (Sale off) - {FF0000}150 "#DIEMCAOCAP"\n");
	// strcat(szDialog, string);	
	// if(gold >= 30) format(string, sizeof(string), "Hidden color - {1ECC14}30 "#DIEMCAOCAP"\n");
	// else format(string, sizeof(string), "Hidden color - {FF0000}30 "#DIEMCAOCAP"\n");
	// strcat(szDialog, string);	
	// if(gold >= 25) format(string, sizeof(string), "Them mot slot xe - {1ECC14}25 "#DIEMCAOCAP"\n");
	// else format(string, sizeof(string), "Them mot slot xe - {FF0000}25 "#DIEMCAOCAP"\n");
	// strcat(szDialog, string);	
	// if(gold >= 25) format(string, sizeof(string), "Clear 1 warn - {1ECC14}25 "#DIEMCAOCAP"\n");
	// else format(string, sizeof(string), "Clear 1 warn - {FF0000}25 "#DIEMCAOCAP"\n");
	// strcat(szDialog, string);	
	// if(gold >= 30) format(string, sizeof(string), "Vehicle KM reset - {1ECC14}30 "#DIEMCAOCAP"\n");
	// else format(string, sizeof(string), "Vehicle KM reset - {FF0000}30 "#DIEMCAOCAP"\n");
	// strcat(szDialog, string);
	// if(gold >= 20) format(string, sizeof(string), "MP3 Player - {1ECC14}20 "#DIEMCAOCAP"\n");
	// else format(string, sizeof(string), "MP3 Player - {FF0000}20 "#DIEMCAOCAP"\n");
	// strcat(szDialog, string);	
	// if(gold >= 50) format(string, sizeof(string), "iPhone - {1ECC14}50 "#DIEMCAOCAP"\n");
	// else format(string, sizeof(string), "iPhone - {FF0000}50 "#DIEMCAOCAP"\n");
	// strcat(szDialog, string);
	// if(gold >= 50) format(string, sizeof(string), "Chuyen gioi - {1ECC14}50 "#DIEMCAOCAP"\n");
	// else format(string, sizeof(string), "Chuyen gioi - {FF0000}50 "#DIEMCAOCAP"\n");
	// strcat(szDialog, string);
	// if(gold >= 50) format(string, sizeof(string), "Phao hoa (10 vien)- {1ECC14}50 "#DIEMCAOCAP"\n");
	// else format(string, sizeof(string), "Phao hoa (10 vien) - {FF0000}50 "#DIEMCAOCAP"\n");	
	// strcat(szDialog, string);
	// if(gold >= 50) format(string, sizeof(string), "Crates (10 hop)- {1ECC14}250 "#DIEMCAOCAP"\n");
	// else format(string, sizeof(string), "Crates (10 hop) - {FF0000}250 "#DIEMCAOCAP"\n");	
	// strcat(szDialog, string);	
	// format(string, sizeof(string), "> Mua giay phep (SAD) - {FF0000}Xem them\n");
	// strcat(szDialog, string);
	// if(gold >= 100) format(string, sizeof(string), "NEON (khong yeu cau xe VIP) - {1ECC14}100 "#DIEMCAOCAP"\n");
	// else format(string, sizeof(string), "NEON (khong yeu cau xe VIP) - {FF0000}100 "#DIEMCAOCAP"\n");
	// strcat(szDialog, string);
	// if(gold >= 70) format(string, sizeof(string), "Bonus +50%% Job (1 gio) %s - {1ECC14}70 xu "#DIEMCAOCAP"\n", PlayerInfo[playerid][pJobBonus50] > 0 ? "[Dang chay]" : "");
	// else format(string, sizeof(string), "Bonus +50% Job (1 gio) %s - {1ECC14}70 xu "#DIEMCAOCAP"\n", PlayerInfo[playerid][pJobBonus50] > 0 ? "[Dang chay]" : "");
	// strcat(szDialog, string);	
	// if(gold >= 135) format(string, sizeof(string), "Bonus +100%% Job (1 gio) %s - {1ECC14}135 xu "#DIEMCAOCAP"\n", PlayerInfo[playerid][pJobBonus100] > 0 ? "[Dang chay]" : "");
	// else format(string, sizeof(string), "Bonus +100% Job (1 gio) %s - {1ECC14}135 xu "#DIEMCAOCAP"\n", PlayerInfo[playerid][pJobBonus100] > 0 ? "[Dang chay]" : "");
	// strcat(szDialog, string);

	
	new title[50];
	format(title, 50, "Shop: [Ban co %d xu]", premiumpoints);
	Dialog_Show(playerid, DIALOG_SHOP, DIALOG_STYLE_TABLIST_HEADERS, title, szDialog, "Select", "Close");
	return 1;
}
ShowKCShop(playerid) {
	new
		kc = PlayerInfo[playerid][pKC],
		string[80], szDialog[2500];

	strcat(szDialog, "Num\tInfo\n{FFE100}(!) HUONG DAN NAP TIEN (MOMO/CHUYEN KHOAN){FFFFFF}\n");
	
	for(new i; i < sizeof(KimCuongShop); i++) {
		if(KimCuongShop[i][SHOP_ITEM_UNIT] == TYPE_KC) {
			format(string, sizeof(string), "%s - %s%s "#DIEMCAOCAP"\n", KimCuongShop[i][SHOP_ITEM_NAME], kc >= 45 ? "{1ECC14}" : "{FF0000}", FormatNumber(KimCuongShop[i][SHOP_ITEM_PRICE]));
			strcat(szDialog, string);	
		}
		else if(KimCuongShop[i][SHOP_ITEM_UNIT] == TYPE_MONEY) {
			format(string, sizeof(string), "%s\n", KimCuongShop[i][SHOP_ITEM_NAME]);
			strcat(szDialog, string);
		}
	}
	if(kc >= 30) format(string, sizeof(string), "Crate Random - {1ECC14}30 "#DIEMCAOCAP"\n");
	else format(string, sizeof(string), "Crate Random - {FF0000}30 "#DIEMCAOCAP"\n");
	strcat(szDialog, string);	
	if(kc >= 45) format(string, sizeof(string), "Crate Skin - {1ECC14}45 "#DIEMCAOCAP"\n");
	else format(string, sizeof(string), "Crate Skin - {FF0000}45 "#DIEMCAOCAP"\n");
	strcat(szDialog, string);	
	if(kc >= 60) format(string, sizeof(string), "Crate Car Rare - {1ECC14}60 xu\n");
	else format(string, sizeof(string), "Crate Car Rare - {FF0000}60 xu\n");
	strcat(szDialog, string);
	if(kc >= 125) format(string, sizeof(string), "Crate Car Epic - {1ECC14}125 "#DIEMCAOCAP"\n");
	else format(string, sizeof(string), "Crate Car Epic - {FF0000}125 "#DIEMCAOCAP"\n");
	strcat(szDialog, string);
	if(kc >= 250) format(string, sizeof(string), "Crate Car Legend - {1ECC14}250 "#DIEMCAOCAP"\n");
	else format(string, sizeof(string), "Crate Car Legend - {FF0000}250 "#DIEMCAOCAP"\n");
	strcat(szDialog, string);	
	if(kc >= 500) format(string, sizeof(string), "Crate Car Mythical - {1ECC14}500 "#DIEMCAOCAP"\n");
	else format(string, sizeof(string), "Crate Car Mythical - {FF0000}500 "#DIEMCAOCAP"\n");
	strcat(szDialog, string);	
	
	new title[50];
	format(title, 50, "Shop: [Ban co %d kim cuong]", kc);
	Dialog_Show(playerid, DIALOG_SHOPKC, DIALOG_STYLE_TABLIST_HEADERS, title, szDialog, "Select", "Close");
	return 1;
}

Dialog:DIALOG_SHOPBACK(playerid, response, listitem, inputtext[]) {
	if(!response) return callcmd::shop(playerid, "");

	return 1;
}
Dialog:DIALOG_CHANGENAME(playerid, response, listitem, inputtext[]) 
{
	if(!response) return ShowNormalShop(playerid);
	if(PlayerInfo[playerid][pPremiumPoints] < 150) return SendClientMessage(playerid, -1, "Ban khong co du "#DIEMCAOCAP"!");
	if(strlen(inputtext) < 2 || strlen(inputtext) > 24) {
		SendClientMessage(playerid, COLOR_GREY, "Ten phai co tu 3 den 24 ky tu.");
		Dialog_Show(playerid, DIALOG_CHANGENAME, DIALOG_STYLE_INPUT, "Shop:", "Ban chuan bi thay doi ten}.\nChu y, dat ten ma nguoi khac khong su dung.\nGioi han 3 den 24 ky tu.", "Ok", "Back");
		return 1;
	}
	new szQuery[256], name[100], string[200];
	mysql_escape_string(inputtext, name);
	mysql_format(SQL, szQuery, sizeof(szQuery), "SELECT * FROM `users` WHERE `name`='%e' LIMIT 1", inputtext);
	new Cache: result = mysql_query(SQL, szQuery);
	new test = cache_num_rows();
	cache_delete(result);
	if(test != 0) {
		Dialog_Show(playerid, DIALOG_CHANGENAME, DIALOG_STYLE_INPUT, "Shop:", "Ban chuan bi thay doi ten.\nChu y, dat ten ma nguoi khac khong su dung.\nGioi han 3 den 24 ky tu.", "Ok", "Back");
		SendClientMessage(playerid, COLOR_WHITE, "Ten nay da duoc su dung. Vui long dat lai ten!");				
		return 1;
	}
	// Reset properties
	if(PlayerInfo[playerid][pHouse] != 999 && strcmp(GetName(playerid), HouseInfo[PlayerInfo[playerid][pHouse]][hOwner], true) == 0) {
		new houseid = PlayerInfo[playerid][pHouse];
		strmid(HouseInfo[houseid][hOwner], GetName(playerid), 0, strlen(GetName(playerid)), 255);
		format(string, sizeof(string), "UPDATE `houses` SET `Owner`='%s' WHERE `ID`='%d'",GetName(playerid),houseid);
		mysql_query(SQL, string, false);
		OnPropTextdrawUpdate(1,PlayerInfo[playerid][pHouse]);
	}
	if(PlayerInfo[playerid][pBizz] != 255) {
		new bizid2 = PlayerInfo[playerid][pBizz];
		strmid(BizzInfo[bizid2][bOwner], GetName(playerid), 0, strlen(GetName(playerid)), 255);
		format(string, sizeof(string), "UPDATE `bizz` SET `Owner`='%s' WHERE `ID`='%d'",GetName(playerid),bizid2);
		mysql_query(SQL,string,false);
		OnPropTextdrawUpdate(2,PlayerInfo[playerid][pBizz]);
	}
	// Reset some data
	mysql_format(SQL, szQuery, sizeof(szQuery), "UPDATE `friends` SET `friendName`='%s' WHERE `friendName`='%s'", name, GetName(playerid));
	mysql_pquery(SQL, szQuery);

	PlayerInfo[playerid][pPremiumPoints] -= 150;
	Update(playerid, pPremiumPointsx);
	format(string, sizeof(string), "Chuc mung! Ban da doi ten thanh %s.", name);  
	SendClientMessage(playerid, COLOR_GOLD, string);
	format(string,sizeof(string),"%s (ID: %d)",name, playerid);
	PlayerTextDrawSetString(playerid, logoptd, string);		
	PlayerTextDrawShow(playerid, logoptd);
	TextDrawShowForPlayer(playerid, logotd);	
	// SetPlayerName(playerid, name);
	
	new lastname[32];
	format(lastname, sizeof(lastname), "%s", PlayerInfo[playerid][pUsername]);

	for(new i = 0; i < 10; i++) {
		if(PlayerInfo[playerid][pCarKey][i] != 0) {
			new id = PlayerInfo[playerid][pCarKey][i];
			mysql_format(SQL, string, sizeof(string), "UPDATE `cars` SET `Owner`='%s' WHERE `ID`='%d'", name, id);
			mysql_pquery(SQL, string);
			format(CarInfo[id][cOwner], 32, name);
		}
	}

	format(string, sizeof(string), "%s doi ten thanh %s voi gia 200 "#DIEMCAOCAP".", lastname, name);
	Log("logs/shop.log", string);
	mysql_format(SQL, string, sizeof(string), "UPDATE `users` SET `Name`='%e' WHERE `ID`='%d'", name, PlayerInfo[playerid][pSQLID]);
	mysql_pquery(SQL, string);
	SendClientMessage(playerid, COLOR_DARKNICERED, "{00FF00}[!] {FFFFFF} Doi ten thanh cong, xin vui long dang nhap lai de cap nhat ten.");
	KickEx(playerid);
	return 1;
}
Dialog:DIALOG_BUYLICENSE(playerid, response, listitem, inputtext[]) 
{
	if(!response) { InShop[playerid] = 0; return 1; }
	new string[200];
	switch(listitem) {
		case 0: {
			if(GetPlayerCash(playerid) < 1500000) return SendClientMessage(playerid, -1, "Ban khong co du tien");
			SendClientMessage(playerid,COLOR_GOLD,"Chuc mung! Ban da mua 1 giay phep sung tu cua hang. Giay phep se het han sau 90 gio. Pham luat se bi tich thu giay phep.");
			PlayerInfo[playerid][pGunLic] = 1;
			PlayerInfo[playerid][pGunLicT] += 90;
			PlayerInfo[playerid][pGunLicS] = 0;
			format(string,128,"UPDATE users SET `GunLic`='%d',`GunLicT`='%d', `GunLicS`='0' WHERE `ID`='%d'",PlayerInfo[playerid][pGunLic],PlayerInfo[playerid][pGunLicT],PlayerInfo[playerid][pSQLID]);
			mysql_query(SQL,string);
			GivePlayerCash(playerid, -1500000);
			Update(playerid, pCashx);
			format(string, sizeof(string), "%s da mua 1 giay phep sung voi gia $1,500,000.", GetName(playerid));
			Log("logs/shop.log", string);
			finishAchievement(playerid, 7); //sung					
		}
		case 1: {
			if(GetPlayerCash(playerid) < 1000000) return SendClientMessage(playerid, -1, "Ban khong co du tien");					
			SendClientMessage(playerid,COLOR_GOLD,"Chuc mung! Ban da mua 1 giay phep may bay voi gia $1,000,000 tu cua hang. Giay phep se het han sau 90 gio.");
			PlayerInfo[playerid][pFlyLic] = 1;
			PlayerInfo[playerid][pFlyLicT] += 90;
			PlayerInfo[playerid][pFlyLicS] = 0;
			format(string,128,"UPDATE users SET `FlyLic`='1',`FlyLicT`='%d', `FlyLicS`='0' WHERE `ID`='%d'",PlayerInfo[playerid][pFlyLicT],PlayerInfo[playerid][pSQLID]);
			mysql_query(SQL,string);
			GivePlayerCash(playerid, -1000000);
			Update(playerid, pCashx);
			format(string, sizeof(string), "%s da mua giay phep may bay voi gia $1,000,000.", GetName(playerid));
			finishAchievement(playerid, 9); //may bay
		}
		case 2: {
			if(GetPlayerCash(playerid) < 1000000) return SendClientMessage(playerid, -1, "Ban khong co du tien");					
			SendClientMessage(playerid,COLOR_GOLD,"Chuc mung! Ban da mua 1 giay phep thuyen voi gia $1,000,000 tu cua hang. Giay phep se het han sau 90 gio.");
			PlayerInfo[playerid][pBoatLic] = 1;
			PlayerInfo[playerid][pBoatLicT] += 90;
			PlayerInfo[playerid][pBoatLicS] = 0;
			format(string,128,"UPDATE users SET `BoatLic`='1',`BoatLicT`='%d', `BoatLicS`='0' WHERE `ID`='%d'",PlayerInfo[playerid][pBoatLicT],PlayerInfo[playerid][pSQLID]);
			mysql_query(SQL,string);
			GivePlayerCash(playerid, -1000000);
			Update(playerid, pCashx);
			format(string, sizeof(string), "%s da mua giay phep thuyen voi gia $1,000,000.", GetName(playerid));
			finishAchievement(playerid, 8); //thuyen			
		}				
	}	
	return 1;
}
Dialog:DIALOG_SHOP(playerid, response, listitem, inputtext[]) 
{
	new szDialog[1100];
	if(!response) { InShop[playerid] = 0; return 1; }
	listitem --;
	switch(listitem) {
		case -1: {		
			strcat(szDialog, "Voi card dien thoai, ban chi nhan duoc 60-70% so tien, vi vay chung toi khuyen khich ban nen nap Momo/Chuyen khoan\nDe nap tien, hay gui tin nhan cho facebook cua Thanh Toan de duoc tu van: http://bit.do/NapTheGTAVLC.\n");
		}
		case 0: {
			format(szDialog, sizeof(szDialog), "Ban co chac muon mua 1 Clan?\nDe mua no, ban can phai tra 300 "#DIEMCAOCAP".\n\n\
			Loi ich:\n- Clan co san 60 days (co the duoc gia han)\n- Ban co the moi 30 thanh vien");
			SetPVarInt(playerid, "PremiumPoints", 300);
		}
		case 1: {
			format(szDialog, sizeof(szDialog), "Ban chac chan muon thay doi ben trong ngoi nha cua ban?\nDe mua no, ban can phai tra 150 "#DIEMCAOCAP".\n\n\
			Loi ich:\n- Ban co the dat bat cu loai noi that nao vao ngoi nha cua ban.");
			SetPVarInt(playerid, "PremiumPoints", 150);
		}			
		// case 2: {
		// 	format(szDialog, sizeof(szDialog), "Xe mua o muc nay khong the giao dich, hay quyet dinh ki cang.\nBan co chac muon mua?");
		// }	
		case 2: {
			format(szDialog, sizeof(szDialog), "Ban co chac chan muon xoa 10 FP?\nDe mua no, ban can phai tra 15 "#DIEMCAOCAP".");
			SetPVarInt(playerid, "PremiumPoints", 30);
		}	
		case 3: {
			format(szDialog, sizeof(szDialog), "Ban co chac chan muon mua the doi ten?\nDe mua no, ban can phai tra 50 "#DIEMCAOCAP". ");
			SetPVarInt(playerid, "PremiumPoints", 50);
			// return SendClientMessage(playerid, -1, "Dang bao tri shop doi ten.");
		}				
		case 4: {
			format(szDialog, sizeof(szDialog), "Ban co chac chan muon mua 1 mau dac biet?\nDe mua no, ban can phai tra 30 "#DIEMCAOCAP".");
			SetPVarInt(playerid, "PremiumPoints", 30);
		}				
		case 5: {
			format(szDialog, sizeof(szDialog), "Ban co chac chan muon mua 1 slot xe?\nPhi 25 "#DIEMCAOCAP".");
			SetPVarInt(playerid, "PremiumPoints", 25);
		}
		// case 7: {
		// 	format(szDialog, sizeof(szDialog), "Ban co chac chan muon xoa warn?\nDe mua no, ban can phai tra 25 "#DIEMCAOCAP".");
		// 	SetPVarInt(playerid, "PremiumPoints", 25);
		// }	
		// case 8: {
		// 	format(szDialog, sizeof(szDialog), "Ban co chac chan muon xoa quang duong cua phuong tien?\nDe mua no, ban can phai tra 30 "#DIEMCAOCAP".");
		// 	SetPVarInt(playerid, "PremiumPoints", 30);
		// }				
		// case 9: {
		// 	format(szDialog, sizeof(szDialog), "Ban co chac chan muon mua 1 may MP3?\nDe mua no, ban can phai tra 20 "#DIEMCAOCAP".");
		// 	SetPVarInt(playerid, "PremiumPoints", 20);
		// }
		case 6: {
			format(szDialog, sizeof(szDialog), "Ban co chac chan muon mua 1 dien thoai Iphone?\nDe mua no, ban can phai tra 50 "#DIEMCAOCAP".\n\n\
			Loi ich:\n- SDT gom 4 so\n- Su dung lenh /call /sms\n- Gui tin nhan nhanh bang /reply (/re).");
			SetPVarInt(playerid, "PremiumPoints", 50);
		}
		// case 11: {
		// 	Dialog_Show(playerid, DIALOG_CHUYENGIOI, DIALOG_STYLE_MSGBOX, "Chuyen gioi", "Ban co chac chan muon chuyen gioi?\nChi phi chuyen gioi la 100 xu do!", "Chac chan", "Back");
		// 	return 1;
		// }				
		case 7: {
			//TODO: intergrate with inventory system
			if(PlayerInfo[playerid][pVip] == 0) return SendClientMessage(playerid, COLOR_GOLD, "Ban khong phai la tai khoan Premium.");
			if(PlayerInfo[playerid][pPremiumPoints] < 50) return SendClientMessage(playerid, COLOR_GOLD, "Ban khong co du 50 "#DIEMCAOCAP".");
			SendClientMessage(playerid, -1, "{00FF00}[!] {FFFFFF} Ban da mua mot 10 rockets (voi gia 50 "#DIEMCAOCAP"), nhap ''/firework'' de dat / ban.");
			PlayerInfo[playerid][pFire] += 10, 
			PlayerInfo[playerid][pPremiumPoints] -= 50, 
			UpdateVar(playerid, "Firework", PlayerInfo[playerid][pFire]);
			Update(playerid, pPremiumPointsx);
		}
		// case 12: {
		// 	if(PlayerInfo[playerid][pPremiumPoints] < 250) return SendClientMessage(playerid, COLOR_GOLD, "Ban khong co du 250 "#DIEMCAOCAP".");
		// 	SendClientMessage(playerid, -1, "{00FF00}[!] {FFFFFF} Ban da mua 10 diem crates (voi gia 250 "#DIEMCAOCAP"), nhap ''/openbox'' de mo hop.");
		// 	PlayerInfo[playerid][pCrates] += 10, 
		// 	PlayerInfo[playerid][pPremiumPoints] -= 250, 
		// 	UpdateVar(playerid, "Crates", PlayerInfo[playerid][pCrates]);
		// 	Update(playerid, pPremiumPointsx);
		// }						
		// case 13: {
		// 	if(PlayerInfo[playerid][pConnectTime] < 2) return SendClientMessage(playerid, -1, "Ban can co it nhat 2 gio choi de truy cap shop giay phep");
		// 	#if defined DISABLE_LICENSE_SHOP
		// 		return SendClientMessage(playerid, -1, "Shop da ngung cung cap giay phep, ban vui long tim mot giao vien de nho ho cap giay phep. (/dichvu instructor)");
		// 	#else
		// 		Dialog_Show(playerid, DIALOG_BUYLICENSE, DIALOG_STYLE_TABLIST_HEADERS, "Shop giay phep", "Ten\tGia\nGiay phep sung\t$1,500,000\nGiay phep may bay\t$1,000,000\nGiay phep thuyen\t$1,000,000", "Buy", "Back");
		// 		return 1;
		// 	#endif
		// }
		case 8: {
			Dialog_Show(playerid, DIALOG_BUYNEON, DIALOG_STYLE_LIST, "MUA NEON (100 xu)", "{1A28ED}Blue\n{00FF04}Green\n{FFFF00}Yellow\n{FFFFFF}White\n{FF00D0}Pink{FFFFFF}\n{FF0000}Red", "Buy", "Back");
			return 1;
		}
		// case 14: {
		// 	format(szDialog, sizeof(szDialog), "Ban co chac muon mua goi +50% tien job?\nDe mua no, ban can phai tra 70 "#DIEMCAOCAP".\n\n\
		// 	Loi ich:\n- +50% tien khi ban lam tat ca cac job\n- Thoi gian: 1 gio ke tu khi kich hoat.");
		// 	SetPVarInt(playerid, "PremiumPoints", 70);
		// }
		// case 15: {
		// 	format(szDialog, sizeof(szDialog), "Ban co chac muon mua goi +100% tien job?\nDe mua no, ban can phai tra 135 "#DIEMCAOCAP".\n\n\
		// 	Loi ich:\n- +50% tien khi ban lam tat ca cac job\n- Thoi gian: 1 gio ke tu khi kich hoat.");
		// 	SetPVarInt(playerid, "PremiumPoints", 135);
		// }		
	}
	SelectedItem[playerid] = listitem;
	Dialog_Show(playerid, DIALOG_SHOP1, DIALOG_STYLE_MSGBOX, "Shop:", szDialog, "Ok", "Back");
	return 1;
}
Dialog:DIALOG_SHOP1(playerid, response, listitem, inputtext[]) 
{
	if(!response) { InShop[playerid] = 0; ShowNormalShop(playerid); return 1; }
	new gold = GetPVarInt(playerid, "PremiumPoints"), string[200];
	if(PlayerInfo[playerid][pPremiumPoints] < gold && SelectedItem[playerid] != 4) return Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Shop", "Ban khong co du "#DIEMCAOCAP" de mua san pham nay.", "Ok", "");
	switch(SelectedItem[playerid]) {
		case 0: {
			if(PlayerInfo[playerid][pClanRank] == 6) return SendClientMessage(playerid, COLOR_WHITE, "Ban da co 1 Clan.");
			if(PlayerInfo[playerid][pClan] != 0) return SendClientMessage(playerid, COLOR_WHITE, "Ban la thanh vien cua 1 Clan.");
			sSlot[playerid] = 20;
			Dialog_Show(playerid, DIALOG_CLAN, DIALOG_STYLE_INPUT, "Shop:", "Ban sap tao clan 20 slot.\nNhung gi ban phai lam bay gio la,\
			 dat ten cho clan.\nTen clan phai tu 3 den 10 ky tu.", "Ok", "");
			format(string, sizeof(string), "%s Ban da mua  1 Clan voi gia 300 "#DIEMCAOCAP".", GetName(playerid));
		}
		case 1: {
			return SendClientMessage(playerid, -1, "dang update");
		}	
		// case 2: {
		// 	Dialog_Show(playerid, DIALOG_SHOPCAR, DIALOG_STYLE_LIST, "Mua xe (500 xu/xe)", "Cheetah\nTurismo\nBuffalo\nSultan\nElegy\nFCR-900", "Mua ngay", "Khong mua");
		// }
		case 2: {
			if(PlayerInfo[playerid][pFpunish] == 0) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co FP.");
			PlayerInfo[playerid][pFpunish] -= 10;
			PlayerInfo[playerid][pPremiumPoints] -= 30;
			if(PlayerInfo[playerid][pFpunish] < 0) PlayerInfo[playerid][pFpunish] = 0;
			UpdateVar(playerid, "FPunish", 0);
			format(string, sizeof(string), "%s da xoa 10 FP voi gia %d "#DIEMCAOCAP".", GetName(playerid), GetPVarInt(playerid, "PremiumPoints"));
			Log("logs/shop.log", string);			
		}
		case 3: {
			Dialog_Show(playerid, DIALOG_CHANGENAME, DIALOG_STYLE_INPUT, "Shop:", "Ban sap thay doi ten cua minh.\nChu y, khong dat ten nguoi khac dang su dung.\nGioi han 3-24 ky tu.", "Ok", "Back");
		}
		case 4: {
			if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong xe!");
			new idd;
			if(GetVehicles(playerid) == 0) return SendClientMessage(playerid, COLOR_WHITE, "Chiec xe nay khong phai cua ban!");
			new car = GetPlayerVehicleID(playerid);
			new car1 = PlayerInfo[playerid][pCarKey][0], car2 = PlayerInfo[playerid][pCarKey][1], car3 = PlayerInfo[playerid][pCarKey][2], car4 = PlayerInfo[playerid][pCarKey][3], car5 = PlayerInfo[playerid][pCarKey][4],
			car6 = PlayerInfo[playerid][pCarKey][5], car7 = PlayerInfo[playerid][pCarKey][6], car8 = PlayerInfo[playerid][pCarKey][7], car9 = PlayerInfo[playerid][pCarKey][8], car10 = PlayerInfo[playerid][pCarKey][9];
			if(car == CarInfo[car1][Spawned]) idd = PlayerInfo[playerid][pCarKey][0];
			if(car == CarInfo[car2][Spawned]) idd = PlayerInfo[playerid][pCarKey][1];
			if(car == CarInfo[car3][Spawned]) idd = PlayerInfo[playerid][pCarKey][2];
			if(car == CarInfo[car4][Spawned]) idd = PlayerInfo[playerid][pCarKey][3];
			if(car == CarInfo[car5][Spawned]) idd = PlayerInfo[playerid][pCarKey][4];
			if(car == CarInfo[car6][Spawned]) idd = PlayerInfo[playerid][pCarKey][5];
			if(car == CarInfo[car7][Spawned]) idd = PlayerInfo[playerid][pCarKey][6];
			if(car == CarInfo[car8][Spawned]) idd = PlayerInfo[playerid][pCarKey][7];
			if(car == CarInfo[car9][Spawned]) idd = PlayerInfo[playerid][pCarKey][8];
			if(car == CarInfo[car10][Spawned]) idd = PlayerInfo[playerid][pCarKey][9];
			if(idd == 0) return SendClientMessage(playerid, COLOR_WHITE, "Chiec xe nay khong phai cua ban!");
			if(CarInfo[idd][Spawned] != car) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong xe ca nhan cua ban");
			pCarID[playerid] = CarInfo[idd][Spawned];
			GetPlayerPos(playerid, pPos[playerid][0], pPos[playerid][1], pPos[playerid][2]);
			pInteriorID[playerid] = GetPlayerInterior(playerid), pVirtual[playerid] = GetPlayerVirtualWorld(playerid);
			SetVehiclePosEx(playerid, car, -1948.0808, 258.7329, 40.7669);
			SetVehicleVirtualWorld(car, playerid+1);
			SetPlayerVirtualWorld(playerid, playerid+1);
			SetPlayerCameraPos(playerid, -1956.2145, 261.2427, 42.3533);
			SetPlayerCameraLookAt(playerid, -1955.2532, 260.9547, 42.1530);
			SetVehicleZAngleEx(car, 46.4705);
			InShop[playerid] = 1;
			pCar[playerid] = idd;
			TextDrawShowForPlayer(playerid, HiddTD[0]);
			TextDrawShowForPlayer(playerid, HiddTD[1]);
			TextDrawShowForPlayer(playerid, HiddTD[2]);
			TextDrawShowForPlayer(playerid, HiddTD[3]);
			TextDrawShowForPlayer(playerid, HiddTD[4]);
			PlayerTextDrawShow(playerid, HiddTDs[0]);
			PlayerTextDrawShow(playerid, HiddTDs[1]);
			PlayerTextDrawShow(playerid, HiddTDs[2]);
			SelectTextDraw(playerid, 0xFF0000FF);
			PlayerTextDrawSetString(playerid, HiddTDs[0], "Color 1: 128");
			PlayerTextDrawSetString(playerid, HiddTDs[2], "Color 2: 128");
			pColor1[playerid] = 128;
			pColor2[playerid] = 128;
			ChangeVehicleColorEx(GetPlayerVehicleID(playerid), pColor2[playerid], pColor2[playerid]);
		}
		case 5: {
			if(GetSlots(playerid) == 10) return SendClientMessage(playerid, -1, "Ban da dat gioi han slot!");

			for(new i; i < 5; i++) {
				if(PlayerInfo[playerid][pSlot][i] == 0) {
					PlayerInfo[playerid][pSlot][i] = 1; 
					break;
				}
			}
			
			UpdateSlots(playerid);
			PlayerInfo[playerid][pPremiumPoints] -= 25;
			SendClientMessage(playerid, COLOR_GOLD, "Ban da mua 1 slot xe voi gia 25 "#DIEMCAOCAP".");
			format(string, sizeof(string), "%s da mua 1 slot phuong tien voi gia 25 "#DIEMCAOCAP".", GetName(playerid));
			Log("logs/shop.log", string);
		}
		// case 7: {
		// 	if(PlayerInfo[playerid][pWarns] == 0) return SendClientMessage(playerid, COLOR_GREY, "Ban khong bi warn.");
		// 	PlayerInfo[playerid][pWarns] -= 1;
		// 	UpdateVar(playerid, "Warnings", PlayerInfo[playerid][pWarns]);
		// 	PlayerInfo[playerid][pPremiumPoints] -= 25;
		// 	format(string, sizeof(string), "%s da xoa 1 diem warn voi gia %d "#DIEMCAOCAP".", GetName(playerid), GetPVarInt(playerid, "PremiumPoints"));
		// 	//InsertLog(playerid, string, LOG_SHOP);	
		// 	Log("logs/shop.log", string);				
		// }		
		// case 8: {
		// 	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong xe!");
		// 	new idd;
		// 	if(GetVehicles(playerid) == 0) return SendClientMessage(playerid, COLOR_WHITE, "Chiec xe nay khong phai cua ban!");
		// 	new car = GetPlayerVehicleID(playerid);
		// 	new car1 = PlayerInfo[playerid][pCarKey][0], car2 = PlayerInfo[playerid][pCarKey][1], car3 = PlayerInfo[playerid][pCarKey][2], car4 = PlayerInfo[playerid][pCarKey][3], car5 = PlayerInfo[playerid][pCarKey][4],
		// 	car6 = PlayerInfo[playerid][pCarKey][5], car7 = PlayerInfo[playerid][pCarKey][6], car8 = PlayerInfo[playerid][pCarKey][7], car9 = PlayerInfo[playerid][pCarKey][8], car10 = PlayerInfo[playerid][pCarKey][9];
		// 	if(car == CarInfo[car1][Spawned]) idd = PlayerInfo[playerid][pCarKey][0];
		// 	if(car == CarInfo[car2][Spawned]) idd = PlayerInfo[playerid][pCarKey][1];
		// 	if(car == CarInfo[car3][Spawned]) idd = PlayerInfo[playerid][pCarKey][2];
		// 	if(car == CarInfo[car4][Spawned]) idd = PlayerInfo[playerid][pCarKey][3];
		// 	if(car == CarInfo[car5][Spawned]) idd = PlayerInfo[playerid][pCarKey][4];
		// 	if(car == CarInfo[car6][Spawned]) idd = PlayerInfo[playerid][pCarKey][5];
		// 	if(car == CarInfo[car7][Spawned]) idd = PlayerInfo[playerid][pCarKey][6];
		// 	if(car == CarInfo[car8][Spawned]) idd = PlayerInfo[playerid][pCarKey][7];
		// 	if(car == CarInfo[car9][Spawned]) idd = PlayerInfo[playerid][pCarKey][8];
		// 	if(car == CarInfo[car10][Spawned]) idd = PlayerInfo[playerid][pCarKey][9];
		// 	if(idd == 0) return SendClientMessage(playerid, COLOR_WHITE, "Chiec xe nay khong phai cua ban!");
		// 	if(CarInfo[idd][Spawned] != car) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong xe cua ban ");
		// 	pCar[playerid] = idd;
		// 	Dialog_Show(playerid, DIALOG_RESETKM, DIALOG_STYLE_MSGBOX, "Shop:", "Ban co chac muon dat lai quang duong di cua phuong tien?", "Da", "Back");
		// }					
		// case 9: {
		// 	if(PlayerInfo[playerid][pMP3] == 1) return SendClientMessage(playerid,COLOR_WHITE, "Ban da co Radio.");
		// 	PlayerInfo[playerid][pMP3] = 1;
		// 	SendClientMessage(playerid,COLOR_GOLD,"Chuc mung! Ban da mua 1 may MP3 tu cua hang. Su dung /mp3 de nghe nhac.");
		// 	Update(playerid, pRadiox);
		// 	PlayerInfo[playerid][pPremiumPoints] -= GetPVarInt(playerid, "PremiumPoints");
		// 	format(string, sizeof(string), "%s da mua 1 may MP3 voi gia %d "#DIEMCAOCAP".", GetName(playerid), GetPVarInt(playerid, "PremiumPoints"));
		// 	//InsertLog(playerid, string, LOG_SHOP);
		// 	Log("logs/shop.log", string);					
		// }				
		case 6: {
			Dialog_Show(playerid, DIALOG_IPHONE, DIALOG_STYLE_INPUT, "Shop:", "Ban sap mua dien thoai Iphone.\nChu y, hay chon sdt ma ban thich bao gom 4 so.", "Ok", "Back");
		}							
		// case 16: {
		// 	// if(PlayerInfo[playerid][pMP3] == 1) return SendClientMessage(playerid,COLOR_WHITE, "Ban da co Radio.");
		// 	if(gettime() - PlayerInfo[playerid][pJobBonus50] > 0) PlayerInfo[playerid][pJobBonus50] = gettime() + 3600;
		// 	else PlayerInfo[playerid][pJobBonus50] += 3600;
		// 	va_SendClientMessage(playerid, COLOR_GOLD, "Chuc mung! Ban da mua mot goi +50% tien job trong thoi han 1 gio! Thoi gian cua ban: %d", PlayerInfo[playerid][pJobBonus50]-gettime());
		// 	UpdateVar(playerid, "JobBonus50", PlayerInfo[playerid][pJobBonus50]);
		// 	PlayerInfo[playerid][pPremiumPoints] -= GetPVarInt(playerid, "PremiumPoints");
		// 	format(string, sizeof(string), "%s da mua 1 goi +50% job bonus voi gia %d "#DIEMCAOCAP".", GetName(playerid), GetPVarInt(playerid, "PremiumPoints"));
		// 	//InsertLog(playerid, string, LOG_SHOP);
		// 	Log("logs/shop.log", string);
		// }	
		// case 17: {
		// 	// if(PlayerInfo[playerid][pMP3] == 1) return SendClientMessage(playerid,COLOR_WHITE, "Ban da co Radio.");
		// 	if(gettime() - PlayerInfo[playerid][pJobBonus100] > 0) PlayerInfo[playerid][pJobBonus100] = gettime() + 3600;
		// 	else PlayerInfo[playerid][pJobBonus100] += 3600;
		// 	va_SendClientMessage(playerid, COLOR_GOLD, "Chuc mung! Ban da mua mot goi +100% tien job trong thoi han 1 gio! Thoi gian cua ban: %d", PlayerInfo[playerid][pJobBonus100]-gettime());
		// 	UpdateVar(playerid, "JobBonus100", PlayerInfo[playerid][pJobBonus100]);
		// 	PlayerInfo[playerid][pPremiumPoints] -= GetPVarInt(playerid, "PremiumPoints");
		// 	format(string, sizeof(string), "%s da mua 1 goi +100% job bonus voi gia %d "#DIEMCAOCAP".", GetName(playerid), GetPVarInt(playerid, "PremiumPoints"));
		// 	//InsertLog(playerid, string, LOG_SHOP);
		// 	Log("logs/shop.log", string);
		// }	
	}
	Update(playerid, pPremiumPointsx);
	return 1;
}
Dialog:DIALOG_SHOPKC(playerid, response, listitem, inputtext[]) 
{
	new szDialog[1100];
	if(!response) { InShop[playerid] = 0; return 1; }
	listitem --;
	switch(listitem) {
		case -1: {		
			strcat(szDialog, "Voi card dien thoai, ban chi nhan duoc 60-70% so tien, vi vay chung toi khuyen khich ban nen nap Momo/Chuyen khoan\nDe nap tien, hay gui tin nhan cho facebook cua Thanh Toan de duoc tu van: http://bit.do/NapTheGTAVLC.\n");
		}
		case 0: {
			format(szDialog, sizeof(szDialog), "Ban co chac chan muon mua mot hop crate Random\nDe mua no, ban can phai tra 30 "#DIEMCAOCAP".\n\n\
			Vat pham\n- 400.000 - 500.000 sad\n- 5 - 7 RP\n- 15 - 20 xu\n-5.000 - 10.999 mats\n- Skin 167 (35%)\n- Skin 230 (35%)\n-Xe Freeway (15%)\n- Xe Elegy (1%)");
			SetPVarInt(playerid, "KC", 30);
		}
		case 1: {
			format(szDialog, sizeof(szDialog), "Ban co chac chan muon mua mot hop crate Skin\nDe mua no, ban can phai tra 45 "#DIEMCAOCAP".\n\n\
			Vat pham\n- 2.000.000 sad\n- 60 xu\n-Skin 0 (< 10%)\n- Skin 83\n- Skin 124\n- Skin 249\n- Skin 247\n- Skin 287 (< 10%)\n- Skin 285 (20%)\n- Skin 294 (1%)\n- 300 xu (2%)\n- 200 kim cuong (1%)");
			SetPVarInt(playerid, "KC", 45);
		}			
		case 2: {
			format(szDialog, sizeof(szDialog), "Ban co chac chan muon mua mot hop crate Car Rare\nDe mua no, ban can phai tra 60 "#DIEMCAOCAP".\n\n\
			Vat pham\n- 5.000.000 sad\n- 120 xu\n- PCJ-600\n- Uranus\n- Sanchez\n- ZE-350\n- Sandking\n- Super GT\n- Huntley (ít)\n- Jester (cuc ít)\n- Elegy (cuc ít)\n- Sultan (1%)");
			SetPVarInt(playerid, "KC", 60);
		}			
		case 3: {
			format(szDialog, sizeof(szDialog), "Ban co chac chan muon mua mot hop crate Car Epic\nDe mua no, ban can phai tra 125 "#DIEMCAOCAP".\n\n\
			Vat pham\n- 15.000.000 sad\n- 200 xu\n- 50.000 mats\n- Uranus\n- Elegy\n- PCJ-600\n- Jester\n- Buffalo\n- Euros\n- Banshee (cuc ít)\n- Cheetah (cuc ít)\n- Sultan (cuc it)");
			SetPVarInt(playerid, "KC", 125);
		}			
		case 4: {
			format(szDialog, sizeof(szDialog), "Ban co chac chan muon mua mot hop crate Car Legend\nDe mua no, ban can phai tra 250 "#DIEMCAOCAP".\n\n\
			Vat pham\n- 50.000.000 sad\n- 450 xu\n- 120.000 mats\n- FCR-900\n- Banshee\n- Rancher\n- Cheetah\n- Sultan\n- Turismo (ít)\n- Bullet  (cuc ít)\n- 1.000 xu (1%)\n- Infernus (1%)\n- NRG-500 (1%");
			SetPVarInt(playerid, "KC", 250);
		}					
		case 5: {
			format(szDialog, sizeof(szDialog), "Ban co chac chan muon mua mot hop crate Car Mythical\nDe mua no, ban can phai tra 500 "#DIEMCAOCAP".\n\n\
			Vat pham\n- 100.000.000 sad\n- 650 xu\n- 300.000 mats\n- FCR-900\n- Sultan\n- Turismo\n- Bullet\n- NRG-500(it)\n- Infernus (ít)\n- Maverick  (cuc ít)\n- Hotring Racer A (Cuc it)\n- Monster B (cuc it)\n- 1.099 xu  (2%");
			SetPVarInt(playerid, "KC", 500);
		}					
	}
	SelectedItem[playerid] = listitem;
	Dialog_Show(playerid, DIALOG_SHOPKC1, DIALOG_STYLE_MSGBOX, "Shop:", szDialog, "Ok", "Back");
	return 1;
}
Dialog:DIALOG_SHOPKC1(playerid, response, listitem, inputtext[]) 
{
	if(!response) { InShop[playerid] = 0; ShowKCShop(playerid); return 1; }
	new gold = GetPVarInt(playerid, "KC"), string[200];
	if(PlayerInfo[playerid][pKC] < gold) return Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Shop", "Ban khong co du "#DIEMCAOCAP" de mua san pham nay.", "Ok", "");
	switch(SelectedItem[playerid]) {
		case 0: {
			PlayerInfo[playerid][pCrates][0] += 1;
			format(string, sizeof(string), "%s Ban da mua mot Crate Random Skin "#DIEMCAOCAP".", GetName(playerid));
			SendClientMessage(playerid, COLOR_YELLOW, "Ban da mua random crate skin thanh cong");
		}
		case 1: {
			PlayerInfo[playerid][pCrates][1] += 1;
			format(string, sizeof(string), "%s Ban da mua mot Crate Random "#DIEMCAOCAP".", GetName(playerid));
			SendClientMessage(playerid, COLOR_YELLOW, "Ban da mua random crate skin thanh cong");
		}	
		// case 2: {
		// 	Dialog_Show(playerid, DIALOG_SHOPCAR, DIALOG_STYLE_LIST, "Mua xe (500 xu/xe)", "Cheetah\nTurismo\nBuffalo\nSultan\nElegy\nFCR-900", "Mua ngay", "Khong mua");
		// }
		case 2: {
			PlayerInfo[playerid][pCrates][2] += 1;
			format(string, sizeof(string), "%s Ban da mua mot Crate Car Rare "#DIEMCAOCAP".", GetName(playerid));
			SendClientMessage(playerid, COLOR_YELLOW, "Ban da mua random crate skin thanh cong");	
		}
		case 3: {
			PlayerInfo[playerid][pCrates][3] += 1;
			format(string, sizeof(string), "%s Ban da mua mot Crate Car Epic "#DIEMCAOCAP".", GetName(playerid));
			SendClientMessage(playerid, COLOR_YELLOW, "Ban da mua random crate skin thanh cong");
		}
		case 4: {
			PlayerInfo[playerid][pCrates][4] += 1;
			format(string, sizeof(string), "%s Ban da mua mot Crate Car Legend "#DIEMCAOCAP".", GetName(playerid));
			SendClientMessage(playerid, COLOR_YELLOW, "Ban da mua random crate skin thanh cong");
		}
		case 5: {
			PlayerInfo[playerid][pCrates][5] += 1;
			format(string, sizeof(string), "%s Ban da mua mot Crate Car Mythical "#DIEMCAOCAP".", GetName(playerid));
			SendClientMessage(playerid, COLOR_YELLOW, "Ban da mua random crate skin thanh cong");
		}
	}
	Update(playerid, pKCx);
	return 1;
}
Dialog:DIALOG_SHOPCAR(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	if(PlayerInfo[playerid][pPremiumPoints] < 500) return SendClientMessage(playerid, COLOR_WHITE, "Ban can 500 xu de mua san pham nay.");
	// if(GetSlots(playerid) == GetVehicles(playerid) && PlayerInfo[playerid][pVip] > 0) return SendClientMessage(playerid, -1, "Ban co so luong xe ca nhan toi da!"); 
	// else if(GetSlots(playerid) == 8 && PlayerInfo[playerid][pVip] == 0) return SendClientMessage(playerid, -1, "Ban co so luong xe ca nhan toi da! Ban co the mua them slot bang /shop. (mua VIP account de them 2 slot)");
	// else 
	if(GetSlots(playerid) == GetVehicles(playerid)) return SendClientMessage(playerid, -1, "Ban co so luong xe ca nhan toi da! Ban co the mua them slot bang /shop.");
	new id;
	switch(listitem) {
		case 0: id = 415; //cheetah
		case 1: id = 451; // turismo
		case 2: id = 402; // buffalo
		case 3: id = 560;
		case 4: id = 562;
		case 5: id = 521; //fcr		
	}
	new string[200];
	// if(id == 411 || id == 541 || id == 451) return SendClientMessage(playerid, -1, "Infernus, Turrismo va Bullet da ngung ban hoac het hang. Ban hay theo doi fanpage/group de cap nhat thong tin moi nhe.");
	format(string, sizeof(string), "* Ban da mua mot %s tu cua hang voi gia 500 xu!", aVehicleNames[id-400]);
	SendClientMessage(playerid, COLOR_YELLOW, string);
	GiveVehicle(playerid, id);
	PlayerInfo[playerid][pPremiumPoints] -= 500;
	Update(playerid, pPremiumPointsx);
	return 1;
}
Dialog:DIALOG_IPHONE(playerid, response, listitem, inputtext[]) 
{
	if(!response) return ShowNormalShop(playerid);
	if(PlayerInfo[playerid][pPremiumPoints] < 50) return SendClientMessage(playerid, COLOR_WHITE, "Ban can 50 "#DIEMCAOCAP" de mua san pham nay.");			
	if(strlen(inputtext) != 4 || strval(inputtext) < 1000) {
			SendClientMessage(playerid, -1, "So phai la 4 so va bat dau tu 1000.");
			Dialog_Show(playerid, DIALOG_IPHONE, DIALOG_STYLE_INPUT, "Shop:", "Ban sap mua {5F9CC9}1 dien thoai Iphone{FFFFFF}.\nChu y, hay chon sdt ma ban thich bao gom 4 so.", "Ok", "Back");
			return 1;
	}
	new szQuery[256], string[200];
	format(szQuery, sizeof(szQuery), "SELECT * FROM `users` WHERE `PhoneNr`='%d' LIMIT 1", strval(inputtext));
	new Cache: result = mysql_query(SQL, szQuery);
	new test = cache_num_rows ();
	cache_delete(result);
	if(test != 0) {
 		SendClientMessage(playerid, -1, "So dien thoai nay da duoc su dung.");
		Dialog_Show(playerid, DIALOG_IPHONE, DIALOG_STYLE_INPUT, "Shop:", "Ban sap mua 1 dien thoai Iphone.\nChu y, hay chon sdt ma ban thich bao gom 4 so.", "Ok", "Back");
		return 1;
	}
		
	format(string, sizeof(string), "Ban da mua dien thoai Iphone voi gia 50 "#DIEMCAOCAP". So dien thoai da mua: %s", inputtext);
	SendClientMessage(playerid, COLOR_GOLD, string);
	PlayerInfo[playerid][pPhone] = strval(inputtext);
	Update(playerid, pPhonex);
	PlayerInfo[playerid][pPremiumPoints] -= 50;
	Update(playerid, pPremiumPointsx);
	format(string, sizeof(string), "%s da mua dien thoai Iphone (%d) voi gia 50 "#DIEMCAOCAP".", GetName(playerid), strval(inputtext));
	//InsertLog(playerid, string, LOG_SHOP);	
	return 1;
}
Dialog:DIALOG_RESETKM(playerid, response, listitem, inputtext[]) 
{
	if(!response) return ShowNormalShop(playerid);
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong xe!");
	if(PlayerInfo[playerid][pPremiumPoints] < 600) return SendClientMessage(playerid, -1, "Ban khong co du "#DIEMCAOCAP"!");
	new query[100];
	PlayerInfo[playerid][pPremiumPoints] -= 600;
	Update(playerid, pPremiumPointsx);	
	CarInfo[pCar[playerid]][KM] = 0;
	format(query, sizeof(query), "SELECT `cars` SET `Km`='0' WHERE `ID`='%d'", pCar[playerid]);
	mysql_query(SQL, query, false);
	SendClientMessage(playerid, COLOR_GOLD, "Chuc mung! Dong ho toc do da duoc reset.");
	return 1;
}
Dialog:DIALOG_CLAN(playerid, response, listitem, inputtext[]) 
{
	if(!response) return ShowNormalShop(playerid);
	if(ExistaNumeClan(inputtext)) return SendClientMessage(playerid, COLOR_WARNING, "Da co mot clan dang ky voi ten nay!");

	if(strlen(inputtext) < 2 || strlen(inputtext) > 20) {
		SendClientMessage(playerid, COLOR_GREY, "Ten clan phai tu 3 den 20 ky tu.");
		if(sSlot[playerid] == 10) {
			Dialog_Show(playerid, DIALOG_CLAN, DIALOG_STYLE_INPUT, "Shop:", "Ban sap tao clan 10 slot.\nNhung gi ban phai lam bay gio la,\
			 dat ten cho clan.\nTen clan phai tu 3 den 10 ky tu.", "Ok", "Back");
		}
		else if(sSlot[playerid] == 20) {
			Dialog_Show(playerid, DIALOG_CLAN, DIALOG_STYLE_INPUT, "Shop:", "Ban sap tao clan 20 slot.\nNhung gi ban phai lam bay gio la,\
			 dat ten cho clan.\nTen clan phai tu 3 den 10 ky tu.", "Ok", "Back");
		}
		else if(sSlot[playerid] == 40) {
			Dialog_Show(playerid, DIALOG_CLAN, DIALOG_STYLE_INPUT, "Shop:", "Ban sap tao clan 40 slot.\nNhung gi ban phai lam bay gio la,\
			 dat ten cho clan.\nTen clan phai tu 3 den 10 ky tu.", "Ok", "Back");
		}
		return 1;
	}
	
	switch(sSlot[playerid]) {
		case 10: {
			if(PlayerInfo[playerid][pPremiumPoints] < 2000) return SendClientMessage(playerid, -1, "Ban khong co du "#DIEMCAOCAP".");
			else {
				PlayerInfo[playerid][pPremiumPoints] -= 2000;
				Update(playerid, pPremiumPointsx);
			}
		}	
		case 20: {
			if(PlayerInfo[playerid][pPremiumPoints] < 300)return SendClientMessage(playerid, -1, "Ban khong co du "#DIEMCAOCAP".");
			else {
				PlayerInfo[playerid][pPremiumPoints] -= 300;
				Update(playerid, pPremiumPointsx);					
			}
		}	
		case 40: {
			if(PlayerInfo[playerid][pPremiumPoints] < 4000)return SendClientMessage(playerid, -1, "Ban khong co du "#DIEMCAOCAP".");
			else {
				PlayerInfo[playerid][pPremiumPoints] -= 4000;
				Update(playerid, pPremiumPointsx);					
			}
		}	
	}
	
	new
		szDate[180],
		Year, Month, Day, Hour, Minute, Second;

	getdate(Year, Month, Day);
	gettime(Hour, Minute, Second);

	format(szDate, sizeof(szDate), "%02d/%02d/%d - %02d:%02d:%02d", Day, Month, Year, Hour, Minute, Second);
	new query[200];
	mysql_format(SQL, query, sizeof(query), "INSERT INTO `clans` (`Name`, `Owner`, `OwnerSQL`, `RegisterDate`, `Color`, `Slots`) VALUES ('%e', '%e', '%d', '%e', 'FFFFFF', '%d')", inputtext, PlayerInfo[playerid][pUsername], PlayerInfo[playerid][pSQLID], szDate, sSlot[playerid]);
	new Cache: result = mysql_query(SQL, query);
	new i = cache_insert_id();
	cache_delete(result);

	ClanInfo[i][clSlots] = sSlot[playerid];
	new tenclan[64];
	mysql_escape_string(inputtext, tenclan);
	format(ClanInfo[i][clName], 64, tenclan);
	format(ClanInfo[i][clOwner], 256, PlayerInfo[playerid][pUsername]);
	format(ClanInfo[i][clRegisterDate], 256, szDate);
	format(ClanInfo[i][clColor], 256, "FFFFFF");
	ClanMembers[i] ++;
	PlayerInfo[playerid][pClan] = i;
	PlayerInfo[playerid][pClanRank] = 6;
	ClanInfo[i][clDays]	= 60;
	new szText[180];
	format(szText, sizeof(szText), "Ten clan ban da chon la: %s.\nPhan thu hai la chon clan tag.\nThe clan phai tu 3 den 6 ky tu.", inputtext);
	Dialog_Show(playerid, DIALOG_CLAN2, DIALOG_STYLE_INPUT, "Shop:", szText, "Ok", "");

	format(query, sizeof(query), "UPDATE `users` SET `Clan`='%d', `ClanRank`='%d' WHERE `Name`='%s'", PlayerInfo[playerid][pClan], PlayerInfo[playerid][pClanRank], PlayerInfo[playerid][pUsername]);
	mysql_query(SQL, query, false);
	return 1;
}