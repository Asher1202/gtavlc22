#include <YSI_Coding\y_hooks>
#include <Pawn.CMD>

#define     X11_COLOR_CHIP      X11_DARK_TURQUOISE
#define     COLOR_CHIP          DARK_TURQUOISE
#define     CHIP_MONEY_BUY      (1000)
#define     CHIP_MONEY_SELL     (950)
#define 	CHIP_DICE_MIN 		(100)
#define 	CHIP_DICE_MAX 		(500)
#define 	DICE_DELAY 			(10)
#define 	CHIP_TX_MIN			(100)
#define 	CHIP_TX_MAX			(700)

new CasinoOn=1;
new BidaOn = 1;
CMD:exchange(playerid, params[]) {
	if(!IsPlayerInRangeOfPoint(playerid, 4.0, 1949.3138, 1041.4014, 992.8594)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o casino.");
    new str[300];

    format(str, sizeof(str), "No\tOption\tExtra\n\
        1.\tMua chip\t" COLOR_CHIP "1 chip" WHITE " = " LIME_GREEN "$%s\n\
        2.\tBán chip\t" COLOR_CHIP "1 chip" WHITE " = " LIME_GREEN "$%s", FormatNumber(CHIP_MONEY_BUY), FormatNumber(CHIP_MONEY_SELL)
    );

    Dialog_Show(playerid, CASINO_EXCHANGE, DIALOG_STYLE_TABLIST_HEADERS, "Chip exchange", str, 
        "Chon", "Thoat"
    );
    return 1;
}
Dialog:CASINO_EXCHANGE(playerid, response, listitem, inputtext[]) {
    if(!response) return 1;
    new str[300];

    if(listitem == 0) {
        format(str, sizeof(str), "Ban co "COLOR_CHIP"%s"WHITE" chips.\nNhap so luong chip ban muon mua vao:\n\
        Gia "LIME_GREEN"$%s"WHITE" cho moi chip.", FormatNumber(PlayerInfo[playerid][pCasinoChip]), FormatNumber(CHIP_MONEY_BUY));
        Dialog_Show(playerid, CASINO_E_CONFIRM_BUY, DIALOG_STYLE_INPUT, "Chip exchange", str, 
            "Mua", "Thoat"
        );
    }
    else if(listitem == 1) {
        format(str, sizeof(str), "Ban co "COLOR_CHIP"%s"WHITE" chips.\nNhap so luong chip ban muon ban ra:\n\
        Gia "LIME_GREEN"$%s"WHITE" cho moi chip.", FormatNumber(PlayerInfo[playerid][pCasinoChip]), FormatNumber(CHIP_MONEY_SELL));
        Dialog_Show(playerid, CASINO_E_CONFIRM_SELL, DIALOG_STYLE_INPUT, "Chip exchange", str, 
            "Ban", "Thoat"
        );
    }

    return 1;    
}
Dialog:CASINO_E_CONFIRM_BUY(playerid, response, listitem, inputtext[]) {
    if(!response) return 1;
	new const amount = strval(inputtext);
	new str[200];
	if(amount <= 0 || amount > 1000) return SendClientMessage(playerid, -1, "Ban chi co the mua toi da 1000 chip mot lan.");

	SetPVarInt(playerid, "pvBuyAmount", amount);

	format(str, sizeof(str), 
		"Ban co chac chan muon mua "COLOR_CHIP"%s"WHITE" chip voi gia "LIME_GREEN"$%s"WHITE"?",
		FormatNumber(amount), FormatNumber(amount * CHIP_MONEY_BUY)		
	);

    Dialog_Show(playerid, CASINO_E_CONFIRM_BUY2, DIALOG_STYLE_MSGBOX, "Chip exchange", str, "Co", "Khong");
    return 1;
}
Dialog:CASINO_E_CONFIRM_BUY2(playerid, response, listitem, inputtext[]) {
    if(!response) return 1;
	new const amount = GetPVarInt(playerid, "pvBuyAmount");
	new const price = amount * CHIP_MONEY_BUY;

	if(price > GetPlayerCash(playerid)) {
	    Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Chip exchange", "Ban khong du tien.", "Co", "Khong");
	}
	else {
		PlayerInfo[playerid][pCasinoChip] += amount;
		GivePlayerCash(playerid, -price);
		
		UpdateVar(playerid, "CasinoChip", PlayerInfo[playerid][pCasinoChip]);
		Update(playerid, pCashx);

	    Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Chip exchange", "Trao doi thanh cong, hay kiem tra [/stats].", "Ok", "");
	}

	return 1;
}
Dialog:CASINO_E_CONFIRM_SELL(playerid, response, listitem, inputtext[]) {
    if(!response) return 1;
	new const amount = strval(inputtext);
	new str[200];
	if(amount < 100 || amount > PlayerInfo[playerid][pCasinoChip] || amount > 1000) {
	    Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Chip exchange", "It nhat 100 chip, nhieu nhat 1000 chip.", "Thoat", "");
		return 1;
	}

	SetPVarInt(playerid, "pvSellAmount", amount);

	format(str, sizeof(str), 
		"Ban co chac chan muon doi "COLOR_CHIP"%s"WHITE" chip voi gia "LIME_GREEN"$%s"WHITE"?",
		FormatNumber(amount), FormatNumber(amount * CHIP_MONEY_SELL)		
	);

    Dialog_Show(playerid, CASINO_E_CONFIRM_SELL2, DIALOG_STYLE_MSGBOX, "Chip exchange", str, "Co", "Khong");
    return 1;
}
Dialog:CASINO_E_CONFIRM_SELL2(playerid, response, listitem, inputtext[]) {
    if(!response) return 1;
	new const amount = GetPVarInt(playerid, "pvSellAmount");
	new const price = amount * CHIP_MONEY_SELL;

	if(amount > PlayerInfo[playerid][pCasinoChip]) {
	    Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Chip exchange", "Ban khong du chip.", "Thoat", "");
	}
	else {
		PlayerInfo[playerid][pCasinoChip] -= amount;
		GivePlayerCash(playerid, price);
		
		UpdateVar(playerid, "CasinoChip", PlayerInfo[playerid][pCasinoChip]);
		Update(playerid, pCashx);

	    Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Chip exchange", "Trao doi thanh cong, hay kiem tra [/stats].", "Ok", "");
	}
	
	return 1;
}

// CMD:dice2(playerid, params[]) {
// 	new rand = 1 + random(5), string[128];
// 	format(string, sizeof(string), "* %s tha con xuc xac ra so %d.", GetName(playerid), rand);
// 	ProxDetector(10.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
// 	return 1;
// }
CMD:dice(playerid, params[]) {
	if(PlayerInfo[playerid][pLevel] < 5) return SendClientMessage(playerid, -1, "Ban can dat cap 5 de choi dice.");
	if(DeelayCommand[playerid][1] > 0) return DeelayTime(playerid, 1);	
	new userID, chip, szMessage[180];
	if(strlen(PlayerInfo[playerid][pPin]) != 0 && PlayerInfo[playerid][pPinLogged] == 0) {
		 SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay vi ban chua dang nhap PIN.");
		 SendClientMessage(playerid, COLOR_GREY, "De xac thuc, su dung '/loginpin'!");
		 return 1;
	}
	new hour, minute, second;
	gettime(hour,minute,second);

	if(!CasinoOn) return SendClientMessage(playerid, COLOR_LIGHTRED, "Casino chua mo, hay cho doi...");

	// if(!(12 < hour < 15) && !(18 < hour < 21)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Do y thuc nguoi choi + dân trí quá kém => Dan den scam, vi vay dice chi mo tu 13h->15h; 19h, 20h.");
	if(!IsPlayerInRangeOfPoint(playerid, 100.0, 2016.1156,1017.1541,996.875)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o casino.");
	if(sscanf(params, "ui", userID, chip)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/dice <playerid/name> <chip>");
	if(!IsPlayerConnected(userID) && userID == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	if(PlayerInfo[userID][pLevel] < 12) return SendClientMessage(playerid, -1, "Nguoi choi do can dat cap 12 de choi dice.");
	if(!PlayerToPoint(100.0, userID, 2016.2699, 1017.7790, 996.8750)) return SendClientMessage(playerid, -1, "Ban khong o casino!");
	if(userID == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay len chinh minh!");
	if(chip < CHIP_DICE_MIN || chip > CHIP_DICE_MAX) {
		format(szMessage, sizeof(szMessage), "Chi co the cuoc it nhat "COLOR_CHIP"%s chips"WHITE" va cao nhat "COLOR_CHIP"%s chips"WHITE".",
			FormatNumber(CHIP_DICE_MIN), FormatNumber(CHIP_DICE_MAX)
		);
		SendClientMessage(playerid, X11_WHITE, szMessage);
		return 1;
	}
	if(PlayerInfo[playerid][pCasinoChip] < chip) return SendClientMessage(playerid,COLOR_WHITE,"Ban khong co du chip!");
	if(PlayerInfo[userID][pCasinoChip] < chip) return SendClientMessage(playerid,COLOR_WHITE,"Nguoi choi nay khong co du chip.");
	if(!ProxDetectorS(10.0, playerid, userID)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o gan nguoi choi do (10m).");
	if(DiceMoney[userID] == playerid) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the choi dice voi chinh ban!");
	DiceMoney[userID] = chip;
	DiceID[userID] = playerid;
	
	format(szMessage, 256, "%s(%d) thach thuc ban choi dice voi "COLOR_CHIP"%s chips"WHITE"! (/chapnhan dice %d).", GetName(playerid), playerid, FormatNumber(chip), playerid);
	SendClientMessage(userID, 0xFAD4D4FF, szMessage);
	format(szMessage, 256, "Ban da moi %s(%d) choi dice voi "COLOR_CHIP"%s chips"WHITE".", GetName(userID), userID, FormatNumber(chip));
	SendClientMessage(playerid, 0xFAD4D4FF, szMessage);
	DeelayCommand[playerid][1] = DICE_DELAY;
	// return SendClientMessage(playerid, X11_GREY_70, "[DICE]"WHITE" Dice da bi xoa, hay quay lai sau.");
	return 1;
}
timer PlayDice[1000](playerid, id) {
	
	if(IsPlayerConnected(id)) {
		new string[180], szMessage[35];
		if(DiceID[playerid] == id) {
			if(PlayerInfo[playerid][pCasinoChip] < DiceMoney[playerid]) return SendClientMessage(playerid,COLOR_WHITE,"Ban khong co du tien!");
			if(PlayerInfo[id][pCasinoChip] < DiceMoney[playerid]) return SendClientMessage(playerid,COLOR_WHITE,"Nguoi choi nay khong co du tien.");
			if(!ProxDetectorS(10.0, playerid, id)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o gan nguoi choi do!");
			new dice1, dice2;

			for(new i = 0, j = RandomEx(4, 10); i < j; i++) {
				dice1 = RandomEx(2, 12);
				dice2 = RandomEx(2, 12);
			}

			if(dice1 > dice2) {
				format(string, sizeof(string), "%s do xuc sac %d. %s do xuc sac %d. %s thang %s chip.", GetName(playerid), dice1, GetName(id), dice2, GetName(playerid), FormatNumber(DiceMoney[playerid]));
				//InsertLog(playerid, string, LOG_CASINO);	
				Log("logs/dice.log", string);				
				ProxDetector(30.0,playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);					
				format(szMessage, 35,"(+) Ban nhan duoc %s chip.", FormatNumber(DiceMoney[playerid]));
				SendClientMessage(playerid, COLOR_MONEY, szMessage);
				format(szMessage, 35,"(-) Ban thua %s chip.", FormatNumber(DiceMoney[playerid]));
				SendClientMessage(DiceID[playerid], COLOR_MONEY, szMessage);

				PlayerInfo[playerid][pCasinoChip] += DiceMoney[playerid];	
				PlayerInfo[ DiceID[playerid] ][pCasinoChip] -= DiceMoney[playerid];				
				UpdateVar(playerid, "CasinoChip", PlayerInfo[playerid][pCasinoChip]);
				UpdateVar(DiceID[playerid], "CasinoChip", PlayerInfo[ DiceID[playerid] ][pCasinoChip]);
			}
			if(dice2 > dice1) {
				format(string, sizeof(string), "%s do xuc sac %d. %s do xuc sac %d. %s thang %s chip.", GetName(id), dice2, GetName(playerid), dice1, GetName(id), FormatNumber(DiceMoney[playerid]));
				//InsertLog(playerid, string, LOG_CASINO);	
				Log("logs/dice.log", string);
				ProxDetector(30.0,playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);				
				format(szMessage, 35,"(+) Ban nhan duoc %s chip.", FormatNumber(DiceMoney[playerid]));
				SendClientMessage(DiceID[playerid], COLOR_MONEY, szMessage);
				format(szMessage, 35,"(-) Ban thua %s chip.", FormatNumber(DiceMoney[playerid]));
				SendClientMessage(playerid, COLOR_MONEY, szMessage);

				PlayerInfo[playerid][pCasinoChip] -= DiceMoney[playerid];	
				PlayerInfo[ DiceID[playerid] ][pCasinoChip] += DiceMoney[playerid];				
				UpdateVar(playerid, "CasinoChip", PlayerInfo[playerid][pCasinoChip]);
				UpdateVar(DiceID[playerid], "CasinoChip", PlayerInfo[ DiceID[playerid] ][pCasinoChip]);
			}
			else {
				SendClientMessage(DiceID[playerid], COLOR_MONEY, "Hue nhau!");
				SendClientMessage(playerid, COLOR_MONEY, "Hue nhau!");
			}
			for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
				if(PlayerInfo[playerid][pDailyMission][m] == 20) CheckMission(playerid, m);
			}
			for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
				if(PlayerInfo[id][pDailyMission][m] == 20) CheckMission(id, m);
			}
			DiceID[playerid] = -1;
			DiceMoney[playerid] = 0;
		}
		else SendClientMessage(playerid, COLOR_WHITE, "Nguoi choi nay khong moi ban choi voi anh ay.");
	}
	DiceTimer[playerid] = Timer:0;
	return 1;
}

hook OnGameModeInit() {
	new _actor = CreateDynamicActor(98, 1949.3138, 1041.4014, 992.8594, 270);
	SetDynamicActorVirtualWorld(_actor, 1);

	CreateDynamic3DTextLabel("[Bam Y de tuong tac]", X11_WHITE, 1949.3138, 1041.4014, 993, 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 10.0);
	new g_Object[14];
	g_Object[0] = CreateDynamicObject(2180, 1948.2283, 1040.3646, 991.8654, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //MED_OFFICE5_DESK_3
	SetDynamicObjectMaterial(g_Object[0], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0xFFFFFFFF);
	g_Object[1] = CreateDynamicObject(2207, 1950.6281, 1040.3771, 991.8643, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //MED_OFFICE7_DESK_1
	SetDynamicObjectMaterial(g_Object[1], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0xFFFFFFFF);
	g_Object[2] = CreateDynamicObject(2180, 1949.2186, 1042.2155, 991.8654, 0.0000, 0.0000, 180.0000, -1, -1, -1, 100.00, 100.00); //MED_OFFICE5_DESK_3
	SetDynamicObjectMaterial(g_Object[2], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0xFFFFFFFF);
	g_Object[3] = CreateDynamicObject(2190, 1950.6741, 1040.8906, 992.6083, 0.0000, 0.0000, -107.0999, -1, -1, -1, 100.00, 100.00); //PC_1
	g_Object[4] = CreateDynamicObject(1895, 1947.8933, 1041.3376, 993.3594, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wheel_o_fortune
	g_Object[5] = CreateDynamicObject(1831, 1950.3089, 1042.1213, 992.6637, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //kb_bandit2
	g_Object[6] = CreateDynamicObject(1831, 1950.3089, 1040.5412, 992.6637, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //kb_bandit2
	g_Object[7] = CreateDynamicObject(1881, 1948.1175, 1040.2224, 992.9422, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //chip_stack06
	SetDynamicObjectMaterial(g_Object[7], 0, 8391, "ballys01", "casinolightsblu_128", 0xFFFFFFFF);
	g_Object[8] = CreateDynamicObject(1881, 1948.1475, 1042.2216, 992.9822, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //chip_stack06
	SetDynamicObjectMaterial(g_Object[8], 0, 8391, "ballys01", "casinolightsblu_128", 0xFFFFFFFF);
	g_Object[9] = CreateDynamicObject(1852, 1948.6268, 1040.1927, 992.7769, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //dice02
	g_Object[10] = CreateDynamicObject(1852, 1948.4866, 1042.3540, 992.7769, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //dice02
	g_Object[11] = CreateDynamicObject(1550, 1948.3643, 1042.0140, 992.1932, 0.0000, 88.3999, -0.7000, -1, -1, -1, 100.00, 100.00); //CJ_MONEY_BAG
	g_Object[12] = CreateDynamicObject(1550, 1948.3428, 1040.2532, 992.1932, 0.0000, 88.3999, -0.7000, -1, -1, -1, 100.00, 100.00); //CJ_MONEY_BAG
	g_Object[13] = CreateDynamicObject(1829, 1948.6153, 1041.1964, 992.1358, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //man_safenew

	return 1;
}

hook OnPlayerKStateChange(playerid, newkeys, oldkeys) {
	if(newkeys & KEY_YES) {	
		if(IsPlayerInRangeOfPoint(playerid, 4.0, 1949.3138, 1041.4014, 992.8594)) {
			new str[300];

			format(str, sizeof(str), "No\tOption\tExtra\n\
				1.\tMua chip\t" COLOR_CHIP "1 chip" WHITE " = " LIME_GREEN "$%s\n\
				2.\tBán chip\t" COLOR_CHIP "1 chip" WHITE " = " LIME_GREEN "$%s", FormatNumber(CHIP_MONEY_BUY), FormatNumber(CHIP_MONEY_SELL)
			);

			Dialog_Show(playerid, CASINO_EXCHANGE, DIALOG_STYLE_TABLIST_HEADERS, "Chip exchange", str, 
				"Chon", "Thoat"
			);
			return ~0;
		}
	}
	return 1;
}

CMD:toggcasino(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	if(CasinoOn==1) {
		CasinoOn=0;
		SendClientMessageToAll(COLOR_ORANGE, "[INFO] Casino da dong");
	}
	else {
		CasinoOn=1;
		SendClientMessageToAll(COLOR_ORANGE, "[INFO] Casino da mo, nhanh tay dat cuoc nao cac dan choi!");
	}
	return 1;
}
CMD:togbida(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	if(BidaOn==1) {
		BidaOn=0;
		SendClientMessageToAll(COLOR_ORANGE, "[INFO] Bida da dong");
	}
	else {
		BidaOn=1;
		SendClientMessageToAll(COLOR_ORANGE, "[INFO] Bida da mo, nhanh tay lam vai co nao cac dan choi!");
	}
	return 1;
}