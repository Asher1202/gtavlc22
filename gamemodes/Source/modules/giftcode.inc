// CMD:denbubaotri(playerid, params[]) {
// 	#if defined GIFTCODE_GTAVLC
// 		// new code[50];
		
// 		// if(sscanf(params, "s[50]", code)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/nhapgiftcode [text]");
// 		if(PlayerInfo[playerid][pGotCode] == 1) return SendClientMessage(playerid, COLOR_WHITE, "Ban da nhap giftcode nay roi.");
// 		new ranmoney,ranrp, ranpoints, ranmats, ranburger;
// 		ranmoney = RandomMinMax(500000, 1200000);
// 		ranrp = RandomMinMax(2, 5);
// 		ranpoints = RandomMinMax(20, 50);
// 		ranmats = RandomMinMax(1000, 3000);
// 		ranburger = RandomMinMax(50, 120);
// 		// if(strlen(code) > 0 && !strcmp(code, GIFTCODE_GTAVLC, false))
// 		// {
// 		GivePlayerCash(playerid, ranmoney);
// 		SendClientMessage(playerid, -1, "Ban da nhan duoc $600.000");
// 		PlayerInfo[playerid][pPremiumPoints] += ranpoints;
// 		Update(playerid, pPremiumPointsx);
// 		SCMf(playerid, -1, "Ban da nhan duoc %d xu", ranpoints);
// 		Update(playerid, pRP);
// 		PlayerInfo[playerid][pExp] += ranrp;
// 		SCMf(playerid, -1, "Ban da nhan duoc %d diem kinh nghiem", ranrp);
// 		PlayerInfo[playerid][pMats] += ranmats;
// 		Update(playerid,pMatsx);
// 		SCMf(playerid, -1, "Ban da nhan duoc %d vat lieu", ranmats);
// 		Inventory_Add(playerid,"Burger", 2703, ranburger, 1);
// 		SCMf(playerid, -1, "Ban da nhan duoc %d banh burger", ranburger);
// 		// ....
								
// 		PlayerInfo[playerid][pGotCode] = 1;		
// 		UpdateVar(playerid, "GotCode", 1); 
// 		// }
// 	// #else
// 	// 	SendClientMessage(playerid, COLOR_GREY, "Hien tai khong the su dung lenh nay.");
// 	// #endif
// 		return 1;
// }