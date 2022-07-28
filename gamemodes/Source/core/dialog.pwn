Dialog:LOAD_HANG(playerid, response, listitem, inputtext[])
{
	if(listitem) return 1;
	playerObject2[playerid] = CreateObject( 1271,0,0,0,0,0,0,80);
	AttachObjectToVehicle(playerObject2[playerid], GetPlayerVehicleID(playerid), 0.000000, 0.599999, 0.499999, 0.000000, 0.000000, 0.000000 );	
	DisablePlayerCheckpointEx(playerid);
	CP[playerid] ++;
	PlayerTextDrawSetString(playerid, InfosTD, "Di toi ~r~~h~diem mau do~w~~h~ tren ban do de giao hang hoa!");
	defer HideTextdraw(playerid);
	PlayerTextDrawShow(playerid, InfosTD);		
	SetPlayerCheckpointEx(playerid, 969.1779, 2160.7847, 10.8203, 2.0);
	return 1;
}
Dialog:GO(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		switch(listitem)
		{
			case 0: Dialog_Show(playerid, GO1, DIALOG_STYLE_LIST, "SERVER: House Interiors", "Madd Doggs\nCJ House\nRyder House\nTiger Skin Brothel\nColonel Fuhrbergers\nCrack Den\nDenises Room\nKatie's Room", "Select", "Cancel");
			case 1: Dialog_Show(playerid, GO2, DIALOG_STYLE_LIST, "SERVER: Race Tracks", "Dirt Track\nVice Stadium\nBloodbowl Stadium\n8-Track Stadium\nKickstart Stadium", "Select", "Cancel");
			case 2: Dialog_Show(playerid, GO3, DIALOG_STYLE_LIST, "SERVER: City Locations", "Los Santos\nSan Fierro\nLas Venturas", "Select", "Cancel");
			case 3: Dialog_Show(playerid, GO4, DIALOG_STYLE_LIST, "SERVER: Popular Locations", "Bank (ben ngoai)\nGym (exterior)\nAll Saints Hospital\nCounty General Hospital\nNewbie Spawn\n", "Select", "Cancel");
			case 4: Dialog_Show(playerid, GO6, DIALOG_STYLE_LIST, "SERVER: Gym Interiors", "Ganton Gym (LS)\nCobra Martial Arts (SF)\nBelow the Belt Gym (LV)", "Select", "Cancel");
			case 5: Dialog_Show(playerid, GO5, DIALOG_STYLE_LIST, "SERVER: Vi tri khac", "RC Battlefield\nArea 69\nWarehouse 1\nWarehouse 2\nMeat Factory\nSherman Dam\n", "Select", "Cancel");
		}
	}
	return 1;
}
Dialog:THUYSAN(playerid, response, listitem, inputtext[])
{
	if(!response) return 1;
	// if(GetPVarInt(playerid, "tpDrugRunTimer") != 0) return TeleportHack(playerid);
	new string[128];
	GivePlayerCash(playerid, ThuySan[playerid]);
	format(string, sizeof(string), "Ban da nhan duoc $%s vi ban thuy san cua ban cua ban!", FormatNumber(ThuySan[playerid]));
	SendClientMessage(playerid, COLOR_MONEY, string);
	format(string, sizeof(string), "%s nhan duoc $%s tien thuong cho cong viec %s.", GetName(playerid), FormatNumber(ThuySan[playerid]), JobInfo[PlayerInfo[playerid][pJob]][jName]);
	Log("logs/jobmoney.log", string);
	// InsertLog(playerid, string, LOG_MONEY);
	// format(string2, sizeof(string2), "[JOB]: %s[%d] da ban thuy san voi gia tien $%s va nhan %d uy tin .", GetName(playerid),playerid, FormatNumber(ThuySan[playerid]),sv);
	// GuiDenAdminVaHelper(COLOR_YELLOW, string2, 1);
	ThuySan[playerid] = 0;
	Update(playerid,pCashx);
	PlayerInfo[playerid][pFishes] = 0;
	// if(PlayerInfo[playerid][pLuoiBieng] <= 100) PlayerInfo[playerid][pLuoiBieng] += random(2);
	if(PlayerInfo[playerid][pMember] == 0) {
		for(new m; m < 2; m++) {
			if(PlayerInfo[playerid][pDailyMission][m] == 15 || PlayerInfo[playerid][pDailyMission][m] == 16) CheckMission(playerid, m);
		}
	}
	for(new m; m < 2; m++) {
		if(PlayerInfo[playerid][pDailyMission][m] == 2) CheckMission(playerid, m);
	}
	return 1;
}
Dialog:GO1(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		switch(listitem)
		{
			case 0: {
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 5);
				SetPlayerPosEx(playerid, 1267.663208, -781.323242, 1091.906250);
			}
			case 1: {
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 3);
				SetPlayerPosEx(playerid, 2496.049804, -1695.238159, 1014.742187);
			}
			case 2: {
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 2);
				SetPlayerPosEx(playerid, 2454.717041, -1700.871582, 1013.515197);
			}
			case 3: {
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 3);
				SetPlayerPosEx(playerid, 964.106994, -53.205497, 1001.124572);
			}
			case 4: {
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 8);
				SetPlayerPosEx(playerid, 2807.619873, -1171.899902, 1025.570312);
			}
			case 5: {
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 5);
				SetPlayerPosEx(playerid, 318.564971, 1118.209960, 1083.882812);
			}
			case 6: {
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 1);
				SetPlayerPosEx(playerid, 244.411987, 305.032989, 999.148437);
			}
			case 7: {
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 2);
				SetPlayerPosEx(playerid, 271.884979, 306.631988, 999.148437);
			}
		}
	}
	return 1;
}
Dialog:GO2(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		switch(listitem)
		{
			case 0: {
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 4);
				SetPlayerPosEx(playerid, -1444.645507, -664.526000, 1053.572998);
			}
			case 1: {
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 1);
				SetPlayerPosEx(playerid, -1401.829956, 107.051300, 1032.273437);
			}
			case 2: {
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 15);
				SetPlayerPosEx(playerid, -1398.103515, 937.631164, 1036.479125);
			}
			case 3: {
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 7);
				SetPlayerPosEx(playerid, -1398.065307, -217.028900, 1051.115844);
			}
			case 4: {
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 14);
				SetPlayerPosEx(playerid, -1465.268676, 1557.868286, 1052.531250);
			}
		}
	}
	return 1;
}
Dialog:GO3(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		switch(listitem)
		{
			case 0: {
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 0);
				SetPlayerPosEx(playerid, 1550.2311, -1675.4509, 15.3155);
			}
			case 1: {
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 0);
				SetPlayerPosEx(playerid, -1641.9742, 431.1623, 7.1102);
			}
			case 2: {
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 0);
				SetPlayerPosEx(playerid, 1699.2, 1435.1, 10.7);
			}
		}
	}
	return 1;
}
Dialog:GO4(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		switch(listitem)
		{
			case 0: {
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 0);
				SetPlayerPosEx(playerid, 595.5443,-1250.3405,18.2836);
			}
			case 1: {
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 0);
				SetPlayerPosEx(playerid, 2222.6714, -1724.8436, 13.5625);
			}
			case 2: {
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 0);
				SetPlayerPosEx(playerid, 1172.359985, -1323.313110, 15.402919);
			}
			case 3: {
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 0);
				SetPlayerPosEx(playerid, 2034.196166, -1402.591430, 17.295030);
			}
			case 4: {
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 0);
				SetPlayerPosEx(playerid, 738.9963, -1417.2211, 13.5234);
			}
		}
	}
	return 1;
}
Dialog:GO5(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		switch(listitem)
		{
			case 0: {
			   	SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 10);
				SetPlayerPosEx(playerid, -975.975708, 1060.983032, 1345.671875);
			}
			case 1: {
			   	SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 0);
				SetPlayerPosEx(playerid, 223.431976, 1872.400268, 13.734375);
			}
			case 2: {
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 1);
				SetPlayerPosEx(playerid, 1412.639892, -1.787510, 1000.924377);
		 	}
			case 3: {
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 18);
				SetPlayerPosEx(playerid, 1302.519897, -1.787510, 1001.028259);
			}
			case 4: {
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 1);
				SetPlayerPosEx(playerid, 963.418762, 2108.292480, 1011.030273);
			}
			case 5: {
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 17);
				SetPlayerPosEx(playerid, -959.564392, 1848.576782, 9.000000);
			}
		}
	}
	return 1;
}
Dialog:GO6(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		switch(listitem)
		{
			case 0: {
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 5);
				SetPlayerPosEx(playerid, 772.111999, -3.898649, 1000.728820);
			}
			case 1: {
	   			SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 6);
				SetPlayerPosEx(playerid, 774.213989, -48.924297, 1000.585937);
			}
			case 2: {
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 7);
				SetPlayerPosEx(playerid, 773.579956, -77.096694, 1000.655029);
			}
		}
	}
	return 1;
}
Dialog:GOTOJOB(playerid, response, listitem, inputtext[])
{
	new string[100];
	if(!response) return 1;
	new j = listitem + 1; 

	SetPlayerPosEx(playerid, JobInfo[j][jPosX], JobInfo[j][jPosY], JobInfo[j][jPosZ]);
	SetPlayerVirtualWorld(playerid, 0);
	SetPlayerInterior(playerid, 0); 

	format(string, sizeof(string), "AdmCmd: %s vua dich chuyen den job %s (%d).", GetName(playerid), JobInfo[j][jName], j);
	SendAdminMessage(COLOR_LOGS, string, 1);
	return 1;
}
Dialog:DIALOG_ADMINPASSWORD(playerid, response, listitem, inputtext[])
{
	if(response){
		if(strfind(ADMIN_PASSWORD, inputtext, true) == 0){
			SendClientMessage(playerid, COLOR_GREY, "{00FF00}[!] {FFFFFF}Xac minh danh tinh thanh cong.");
			// stop logina[playerid];
		} else {
			// stop logina[playerid];
			KickEx(playerid);
		}
	} else return KickEx(playerid);
	return 1;
}
Dialog:DIALOG_CUSTOMGAME(playerid, response, listitem, inputtext[])
{
	if(!response) return 1;
	if(listitem == 0) {
		if(OnDuty[playerid] == 1) return SendClientMessage(playerid, COLOR_WHITE, "Ban dang onduty, khong the vao trong.");
		// if(!IsPlayerInRangeOfPoint(playerid,3.0,BizzInfo[20][bEntranceX], BizzInfo[20][bEntranceY], BizzInfo[20][bEntranceZ])) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o tai paintball. Hay su dung /gps de xem no o dau.");
		if(PlayerInfo[playerid][pWantedLevel] > 0) return SendClientMessage(playerid, -1, "Ban dang bi truy na, khong the vao trong!");
		// if(PlayerInfo[playerid][pConnectTime] < 5) return SendClientMessage(playerid, COLOR_LGREEN, "Ban can 5 gio de choi paintball!");
		if(PlayerInfo[playerid][pGunLic] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "Ban can co giay phep sung de vao dau truong Counter Strike!");
		new szDialog[1024], szDialog2[1024];
		strcat(szDialog2, "Mode\tNguoi choi\tBan do\tTrang thai\n");
		if(PaintTime[0] > 0) format(szDialog, 1024, "Clasic\t%d nguoi choi\t%s\t{FFE203}Dang dien ra (%s)\n", PlayersOnPaint(0), MapName(0), CalculeazaTimp2(PaintTime[0]));
		else format(szDialog, 1024, "Clasic\t%d nguoi choi\t%s\t{2BAD2B}Dang cho...\n", PlayersOnPaint(0), MapName(0));
		strcat(szDialog2, szDialog);
		if(PaintTime[1] > 0) format(szDialog, 1024, "Clasic + giap\t%d nguoi choi\t%s\t{FFE203}Dang dien ra (%s)\n", PlayersOnPaint(1), MapName(1), CalculeazaTimp2(PaintTime[1]));
		else format(szDialog, 1024, "Clasic + giap\t%d nguoi choi\t%s\t{2BAD2B}Dang cho...\n", PlayersOnPaint(1), MapName(1));
		strcat(szDialog2, szDialog);
		if(PaintTime[2] > 0) format(szDialog, 1024, "Gun Game\t%d nguoi choi\t%s\t{FFE203}Dang dien ra (%s)\n", PlayersOnPaint(2), MapName(2), CalculeazaTimp2(PaintTime[2]));
		else format(szDialog, 1024, "Gun Game\t%d nguoi choi\t%s\t{2BAD2B}Dang cho...\n", PlayersOnPaint(2), MapName(2));
		strcat(szDialog2, szDialog);
		Dialog_Show(playerid, DIALOG_MODE, DIALOG_STYLE_TABLIST_HEADERS, "Paintball:", szDialog2, "Ok", "Exit");								
	} 
	else {
		if(OnDuty[playerid] == 1) return SendClientMessage(playerid, COLOR_WHITE, "Ban dang onduty, khong the vao trong.");
		if(Iter_Count(PlayerInRace) == 20) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong the tham gia dau truong dua xe vi truong dua da day!");
		if(RaceStarted == 1) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong the vao trong vi cuoc dua da bat dau!");
		if(PlayerInfo[playerid][pCarLic] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban can giay phep lai xe de tham gia cuoc dua!");
		if(CP[playerid] != 0 || targetfind[playerid] != -1) return Dialog_Show(playerid, DIALOG_CHECKPOINT, DIALOG_STYLE_MSGBOX, "Checkpoint", "Mot cham do dang hoat dong.\nBan co muon xoa no khong? Neu muon, hay chon 'Ok'.", "Ok", "Exit");
		EnterRaceArena(playerid);								
	}
	return 1;
}
Dialog:DIALOG_COLLECTCADOU(playerid, response, listitem, inputtext[]) 
{
	GivePlayerCash(playerid, cadoubani[playerid]);
	Update(playerid, pCashx);
	if(dmgdat[playerid] > 500) PlayerInfo[playerid][pPremiumPoints] += cadoupp[playerid], PlayerInfo[playerid][pExp] += cadourp[playerid];
	Update(playerid, pPremiumPointsx);
	Update(playerid, pRP);
	UpdateProgress(playerid, 0);
	SendClientMessage(playerid, COLOR_MONEY,"[GIFTBOX] Ban da nhan thuong!");
	colectgf[playerid] = 1;	
	return 1;
}
Dialog:DIALOG_CODE(playerid, response, listitem, inputtext[]) 
{
	new query[70], string[100];
	if(!response) return 1;
	format(query, sizeof(query), "SELECT * FROM `codes` WHERE `Code`='%s' LIMIT 1", inputtext);
	new Cache: result = mysql_query(SQL, query);
	new test = cache_num_rows();
	if(test == 0) {
		SendClientMessage(playerid, -1, "Code khong hop le!");
		cache_delete(result);
		return 1;
	}
	new type, money, rp, pp; 
	cache_get_value_name_int(0, "Type", type);
	cache_get_value_name_int(0, "Money", money);
	cache_get_value_name_int(0, "RP", rp);
	cache_get_value_name_int(0, "PP", pp);
	cache_delete(result);

	switch(type) {
		case 0: {
			format(string, sizeof(string), "Code thuong: {FFFFFF}$%s, %d "DIEMCAOCAP", %d Respect Points.", FormatNumber(money), pp, rp);
		}
		case 1: {
			format(string, sizeof(string), "Code cao cap: {FFFFFF}$%s, %d "DIEMCAOCAP", %d Respect Points.", FormatNumber(money), pp, rp);
		}
	}
	SendClientMessage(playerid, COLOR_GREEN, string);

	format(query, sizeof(query), "DELETE FROM `codes` WHERE `Code`='%s'", inputtext);
	mysql_tquery(SQL, query, "", "");
	GivePlayerCash(playerid, money);
	PlayerInfo[playerid][pPremiumPoints] += pp;
	PlayerInfo[playerid][pExp] += rp;
	
	////InsertLog(playerid, sprintf("%s vua kich hoat %s", GetName(playerid), string), LOG_GIFTCODE);
	Update(playerid, pPremiumPointsx);
	Update(playerid, pRP);	
	return 1;
}
Dialog:DIALOG_GIVEPP(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new name[32], amount, euro, string[100], query[150];
	GetPVarString(playerid, "playerName", name, sizeof(name));

	switch(listitem) {
		case 0: amount = 200, euro = 1;
		case 1: amount = 1008, euro = 5;
		case 2: amount = 2040, euro = 10;
		case 3: amount = 3090, euro = 15;
		case 4: amount = 4180, euro = 20;
		case 5: amount = 6360, euro = 30;
		case 6: amount = 8600, euro = 40;
		case 7: amount = 10900, euro = 50;
		case 8: amount = 22500, euro = 100;
	}

	new userID = GetPlayerID(name);
	if(userID != INVALID_PLAYER_ID) PlayerInfo[userID][pPremiumPoints] += amount;	

	format(string, sizeof(string), "%s gui %s (%d euro) "#DIEMCAOCAP" cho %s.", GetName(playerid),FormatNumber(amount),euro, name);
	SendAdminMessage(COLOR_YELLOW, string,5);	
	
	format(string, sizeof(string), "Ban da nap %d euro va ban da nhan duoc %s "#DIEMCAOCAP".\nCam on ban da ung ho!", euro, FormatNumber(amount));				
	InsertEmail(name, "AdmBot", string, 0);	
	
	format(query, sizeof(query), "UPDATE `users` SET `PremiumPoints`=`PremiumPoints`+'%d' WHERE `name`='%s'", amount, name);
	mysql_query(SQL, query, false);	
	
	format(string, sizeof(string), "%s da nap %d euro va nhan duoc %s "#DIEMCAOCAP".", name, euro, FormatNumber(amount));
	Log("logs/shop.log", string);	
	return 1;
}
Dialog:DIALOG_REPORT(playerid, response, listitem, inputtext[]) {
	if(!response) return 1;
	new string[100];
	SetPVarInt(playerid, "Selected", listitem);
	switch(listitem) {
		case 0: Dialog_Show(playerid, DIALOG_REPORT1, DIALOG_STYLE_INPUT, "Bao cao DM", "Ban hay nhap ID nguoi vi pham vao day, chung toi se xu ly:", "Next", "Back");
		case 1: Dialog_Show(playerid, DIALOG_REPORT1, DIALOG_STYLE_INPUT, "Bao cao phan mem thu 3", "Ban hay nhap ID nguoi vi pham vao day, chung toi se xu ly:", "Next", "Back");
		case 2: {
			Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Cau hoi ve nap the", 
			"Lam the nao toi co the nap the?\nDe nap the, xin dai ca hay inb cho facebook cua Khang (/fb). Hoac ban co the nap the truc tiep tren ucp (/ucp).", "Close", "");	
		}	
		case 3: {
			format(string, sizeof(string), "%s (%d) dang bi ket map.", GetName(playerid), playerid);
			SendAdminMessage(0xC9161FFF, string, 1);
			stop ReportTimer[playerid];
			ReportTimer[playerid] = defer CheckReport(playerid);
			SendClientMessage(playerid, COLOR_YELLOW, "Bao cao cua ban da duoc gui den doi ngu admin.");
			PlayerInfo[playerid][pReportTime] = 180;

			SetPVarInt(playerid, "Reported", 1);
			SetPVarInt(playerid, "ReportType", 3);			
		}	
		case 4: Dialog_Show(playerid, DIALOG_REPORT1, DIALOG_STYLE_INPUT, "Mot van de khac", "Hay nhap ro van de cua ban.\nNgoai ra, ban con co the nhap: 'can gap admin' de duoc kick ra khoi server.", "Ok", "Back");
	}	
	return 1;
}
Dialog:DIALOG_REPORT1(playerid, response, listitem, inputtext[]) 
{
	if(!response) return Dialog_Show(playerid, DIALOG_REPORT, DIALOG_STYLE_LIST, "Report", "Bao cao DM\nBao cao phan mem thu 3\nCau hoi ve nap the\nBi ket map\nVan de khac", "Select", "Close");
	new type = GetPVarInt(playerid, "Selected"), id = strval(inputtext);

	if(type != 4) {
		if(sscanf(inputtext, "u", id)) {
			Dialog_Show(playerid, DIALOG_REPORT, DIALOG_STYLE_LIST, "Report", "Bao cao DM\nBao cao phan mem thu 3\nCau hoi ve nap the\nBi ket map\nVan de khac", "Select", "Close");
			SendClientMessage(playerid, COLOR_GRAD3, "ID khong hop le!");
			return 1;
		}
		if(id == playerid) {
			Dialog_Show(playerid, DIALOG_REPORT, DIALOG_STYLE_LIST, "Report", "Bao cao DM\nBao cao phan mem thu 3\nCau hoi ve nap the\nBi ket map\nVan de khac", "Select", "Close");
			SendClientMessage(playerid, COLOR_GRAD4, "Ban khong the them chinh ban vao danh sach!");		
			return 1;
		}	
		if(!IsPlayerConnected(id)) {
			Dialog_Show(playerid, DIALOG_REPORT, DIALOG_STYLE_LIST, "Report", "Bao cao DM\nBao cao phan mem thu 3\nCau hoi ve nap the\nBi ket map\nVan de khac", "Select", "Close");
			SendClientMessage(playerid, COLOR_GRAD4, "Nguoi choi khong online!");			
			return 1;
		}
	}
	new string[200];
	switch(type) {
		case 0: {
			format(string, sizeof(string), "%s (%d) da bao cao rang %s (ID: %d) vi pham luat DM.", GetName(playerid), playerid, GetName(id), id);
			SendAdminMessage(0xC9161FFF, string, 1);
			
			SetPVarInt(id, "Reported", 1);
			SetPVarInt(id, "ReportType", 1);
			SetPVarString(id, "ReportedBy", GetName(playerid));
			SetPVarInt(id, "ReportScore", GetPVarInt(id, "ReportScore")+1);
		}
		case 1: {
			format(string, sizeof(string), "%s (%d) da bao cao rang %s (ID: %d) dang su dung phan mem thu 3.", GetName(playerid), playerid, GetName(id), id);
			SendAdminMessage(0xC9161FFF, string, 1);

			SetPVarInt(id, "Reported", 1);
			SetPVarInt(id, "ReportType", 2);
			SetPVarString(id, "ReportedBy", GetName(playerid));
			SetPVarInt(id, "ReportScore", GetPVarInt(id, "ReportScore")+1);			
		}
		case 4: {
			if(CuvinteCheie(inputtext)) {
				new time = 2;
				PlayerInfo[playerid][pReportTime] += time*60;
				Update(playerid, pReportTimex);
				format(string, sizeof(string), "Ban da bi chan khoi kenh /report trong %d phut! Ly do: noi dung bao cao khong neu ro van de.", time);
				SendClientMessage(playerid, -1, string);
				format(string, sizeof(string), "AdmCmd: %s da bi cam chat trong %d phut khoi kenh /report boi Admbot, ly do: noi dung bao cao khong neu ro van de.", GetName(playerid), time);
				SendStaffMessage(COLOR_LOGS, string);
				return 1;
			}	
			else {
				format(string, sizeof(string), "Bao cao tu %s (ID: %d, lvl: %d): %s.", GetName(playerid), playerid, PlayerInfo[playerid][pLevel], inputtext);
				SendAdminMessage(0xC9161FFF, string, 1);
				SetPVarInt(playerid, "Reported", 1);
				SetPVarInt(playerid, "ReportType", 4);						
				SetPVarString(playerid, "ReportText", inputtext);				
			}		
		}
	}
	stop ReportTimer[playerid];
			
	PlayerInfo[playerid][pReportTime] = 180;
	Ajutor[playerid] = 1;
	ReportTimer[playerid] = defer CheckReport(playerid);
	SendClientMessage(playerid, COLOR_YELLOW, "Bao cao cua ban da duoc gui den doi ngu admin.");	
	return 1;
}
Dialog:DIALOG_BETCASINO(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;			
	if(strval(inputtext) < 1000 || strval(inputtext) > 50000) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: So tien khong hop le! Ban co the dat it nhat $1.000 va toi da $50,000.");
	if(GetPlayerCash(playerid) < strval(inputtext)) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong co so tien nay!");
	new string[100];
	SetPVarInt(playerid, "BetAmount", strval(inputtext));
	GivePlayerCash(playerid, -strval(inputtext));
	format(string, sizeof(string), "~w~~h~Bet: ~g~$%s", FormatNumber(strval(inputtext)));
	PlayerTextDrawSetString(playerid, CasinoPTD[32], string);
	PlayerTextDrawShow(playerid, CasinoPTD[32]);	
	return 1;
}
/*Dialog:DIALOG_EDITVEHICLE(playerid, response, listitem, inputtext[]) 
{
	if(!response) return SendClientMessage(playerid, COLOR_LGREEN, "Ban da dong dialog!");
	switch(listitem) {
		case 0: Dialog_Show(playerid, DIALOG_EDITVEHICLE1, DIALOG_STYLE_INPUT, "Edit Value", "Scrie mai jos valoarea in pe care vrei sa modifici!", "Ok", "Exit");
		case 1: Dialog_Show(playerid, DIALOG_EDITVEHICLE1, DIALOG_STYLE_INPUT, "Edit Max. Speed", "Scrie mai jos valoarea in pe care vrei sa modifici!", "Ok", "Exit");
		case 2: Dialog_Show(playerid, DIALOG_EDITVEHICLE1, DIALOG_STYLE_INPUT, "Edit Stock", "Scrie mai jos valoarea in pe care vrei sa modifici!", "Ok", "Exit");	
	}
	SetPVarInt(playerid, "listitem", listitem);	
	return 1;
}
Dialog:DIALOG_EDITVEHICLE1(playerid, response, listitem, inputtext[]) 
{
	if(!response) return SendClientMessage(playerid, COLOR_LGREEN, "Ban da dong dialog!");
	listitem = GetPVarInt(playerid, "listitem");
	new idd = GetPVarInt(playerid, "VehicleID"), string[100];
	switch(listitem) {
		case 0: {
			DSModels[idd][dPrice] = strval(inputtext);
			format(string, sizeof(string), "Gia moi cua chiec xe nay hien nay la $%s!",FormatNumber(strval(inputtext)));
			SendClientMessage(playerid, COLOR_LGREEN, string);
			format(string, sizeof(string), "UPDATE `dsveh` SET `Price`='%d' WHERE `ID`='%d'", DSModels[idd][dPrice], idd);
			mysql_query(SQL, string, false);		
		}
		case 1: {
			DSModels[idd][dMaxSpeed] = strval(inputtext);
			format(string, sizeof(string), "Toc do toi da moi cua chiec xe nay hien nay la %d!",strval(inputtext));
			SendClientMessage(playerid, COLOR_LGREEN, string);
			format(string, sizeof(string), "UPDATE `dsveh` SET `MaxSpeed`='%d' WHERE `ID`='%d'", DSModels[idd][dMaxSpeed], idd);
			mysql_query(SQL, string, false);		
		}	
		case 2: {
			DSModels[idd][dStock] = strval(inputtext);
			format(string, sizeof(string), "So luong xe model nay da duoc sua doi thanh %d!",strval(inputtext));
			SendClientMessage(playerid, COLOR_LGREEN, string);
			format(string, sizeof(string), "UPDATE `dsveh` SET `Stock`='%d' WHERE `ID`='%d'", DSModels[idd][dStock], idd);
			mysql_query(SQL, string, false);		
		}			
	}
	return 1;
}*/
Dialog:DIALOG_CALLS(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new id = SelectedPlayers[playerid][listitem], string[200], sendername[MAX_PLAYER_NAME];
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong ket noi!");
	switch(PlayerInfo[playerid][pMember]) {
		case 12: {
			if(TaxiService[id] == 1 && AcceptedTaxiService[id] == 0) {
				if(PlayerInfo[playerid][pMember] != 12) return 1;
				if(TaxiService[id] == 0) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi khong goi dich vu nay!");
				if(AcceptedService[playerid] != -1) return SendClientMessage(playerid, COLOR_GREY, "Ban da chap nhan mot yeu cau de thoat khoi yeu cau hien tai, hay su dung '/cancel command'.");
				if(AcceptedTaxiService[id] == 1) return SendClientMessage(playerid, COLOR_GREY, "Thu tu cua nguoi choi do se duoc mot thanh vien khac cua phe chap nhan.");
				if(!FactionVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong mot chiec xe cua to chuc ban");
				AcceptedTaxiService[id] = 1;
				AcceptedService[playerid] = id;
				targetfind[playerid] = id;
				UsedFind[playerid] = 1;
				format(string, sizeof(string), "**(( Taxi Dispatch: Taxi Driver %s (%d) da chap nhan cuoc goi cua %s (%d). ))**", GetName(playerid), playerid, GetName(id), id);
				SendFactionMessage(12, 0x2C6CBFFf, string);
				format(string, sizeof(string), "* Taxi Driver %s da chap nhan cuoc goi cua ban.", GetName(playerid));
				SendClientMessage(id, COLOR_YELLOW, string);	
				CP[playerid] = 53;
			}
			else return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Nguoi choi do khong goi dich vu taxi hoac mot thanh vien khac trong to chuc da chap nhan cuoc goi!");
		}
		case 13: {
			if(MedicCall[id] == id) {
				if(PlayerInfo[playerid][pMember] != MEDIC_FACTION_ID) return SendClientMessage(playerid, COLOR_WHITE, "Ban khong phai la Medic!");
				if(MedicCallTime[playerid] > 0) return SendClientMessage(playerid, COLOR_WHITE, "Ban da chap nhan mot cuoc goi medic.");
				if(IsAnAmbulance(GetPlayerVehicleID(playerid))) return SendClientMessage(playerid,COLOR_WHITE, "Ban khong o trong xe cuu thuong.");
				if(MedicCall[id] != id) return SendClientMessage(playerid,COLOR_WHITE, "Nguoi choi nay khong goi xe cuu thuong.");
				format(string, sizeof(string), "**(( Paramedic Dispatch: Paramedic %s (%d) da chap nhan yeu cau cua %s (%d). ))**",GetName(playerid), playerid, GetName(id), id);
				SendFactionMessage(MEDIC_FACTION_ID, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "* Medic %s da chap nhan cuoc goi cua ban.",sendername);
				SendClientMessage(MedicCall[id], COLOR_YELLOW, string);
				new Float:X,Float:Y,Float:Z;
				GetPlayerPos(MedicCall[id], X, Y, Z);
				SetPlayerCheckpointEx(playerid, X, Y, Z, 5);
				MedicCallTime[playerid] = 1;
				MedicCall[id] = -1;
				CP[playerid] = 53;				
			}
			else return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Nguoi choi do khong goi dich vu cuu thuong hoac mot thanh vien khac trong to chuc da chap nhan cuoc goi!");
		}	
		case 8: {
			if(MechanicCall[id] == id) {
				if(CP[playerid] != 0) return Dialog_Show(playerid, DIALOG_CHECKPOINT, DIALOG_STYLE_MSGBOX, "Checkpoint", "Mot cham do dang hoat dong.\nBan co muon xoa no khong? Neu muon, hay chon 'Ok'.", "Ok", "Exit");
				if(PlayerInfo[playerid][pMember] != TOWTRUCK_FACTION_ID) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la thanh vien cua Mechanic.");
				if(MechanicCallTime[playerid] == 1) return SendClientMessage(playerid, COLOR_WHITE, "Ban da chap nhan mot cuoc goi!");
				if(MechanicCall[id] != id) return SendClientMessage(playerid,COLOR_WHITE,"Nguoi choi khong goi dich vu nay!");
				format(string, sizeof(string), "**(( TTC Dispatch: Tow Truck Member %s (%d) da chap nhan yeu cau cua %s (%d). ))**", GetName(playerid), playerid, GetName(id), id);
				SendFactionMessage(TOWTRUCK_FACTION_ID, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "* Mechanic %s da chap nhan cuoc goi cua ban.",sendername);
				SendClientMessage(MechanicCall[id], COLOR_WHITE, string);
				new Float:X,Float:Y,Float:Z;
				GetPlayerPos(MechanicCall[id], X, Y, Z);
				SetPlayerCheckpointEx(playerid, X, Y, Z, 5);
				UsedFind[playerid] = 1;
				targetfind[playerid] = id;
				MechanicCall[id] = -1;
				CP[playerid] = 53;			
			}
			else return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Nguoi choi do khong goi dich vu co khi hoac mot thanh vien khac trong to chuc da chap nhan cuoc goi!");
		}
		case 7: {
			if(InstructorCall[id] == 1) {
				if(InstructorCall[id] == 0) return SendClientMessage(playerid, COLOR_WHITE, "Nguoi choi do khong goi cho dich vu giao vien.");
				if(IsATeacher(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la thanh vien cua doi ngu giao vien.");
				if(CP[playerid] != 0) return Dialog_Show(playerid, DIALOG_CHECKPOINT, DIALOG_STYLE_MSGBOX, "Checkpoint", "Mot cham do dang hoat dong.\nBan co muon xoa no khong? Neu muon, hay chon 'Ok'.", "Ok", "Exit");
				format(string, sizeof(string), "**(( SI Dispatch: Instructor %s (%d) da chap nhan yeu cau cua %s (%d). ))**", GetName(playerid), playerid, GetName(id), id);
				SendFactionMessage(INSTRUCTOR_FACTION_ID, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "* Ban da chap nhan cuoc goi cua %s.",GetName(id));
				SendClientMessage(playerid, COLOR_WHITE, string);
				format(string, sizeof(string), "* Instructor %s da chap nhan cuoc goi cua ban.",GetName(playerid));
				SendClientMessage(id, COLOR_YELLOW, string);
				new Float:X,Float:Y,Float:Z;
				GetPlayerPos(InstructorCall[id], X, Y, Z);
				SetPlayerCheckpointEx(playerid, X, Y, Z, 5);
				UsedFind[playerid] = 1;
				targetfind[playerid] = id;
				InstructorCall[id] = 0;
				CP[playerid] = 53;			
			}
			else return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Nguoi choi do khong goi dich vu giao vien hoac mot thanh vien khac trong to chuc da chap nhan cuoc goi!");
		}		
	}		
	return 1;
}
Dialog:DIALOG_VIPCOLOR(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;		
	new car = GetPlayerVehicleID(playerid), string[200], query[150];
	if(GetVehicles(playerid) == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong co phuong tien ca nhan!");
	if(PersonalCar(playerid) == -1) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong o trong phuong tien ca nhan cua minh!");
	new idd = PersonalCar(playerid);
	if(CarInfo[idd][Spawned] != car) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong xe cua ban.");
	if(strlen(CarInfo[idd][cText]) > 1) {
		DestroyDynamicObject(nameobject[CarInfo[idd][Spawned]]);
	}			
	CarInfo[idd][cTextColor] = listitem;
	format(query, sizeof(query), "UPDATE `cars` SET `ColorText`='%d' WHERE `ID`='%d'", listitem, idd);
	mysql_query(SQL, query, false);			
	format(string, sizeof(string), "Mau sac cua van ban o phia sau cua chiec xe da duoc thay doi thanh {%s}%s{FFFFFF}.", serverColors(listitem), CarInfo[idd][cText]);
	SendClientMessage(playerid, -1, string);
	attach_vip_text(idd);	
	return 1;
}
Dialog:DIALOG_MOVEHOUSE(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new Float: Pos[3], id = GetPVarInt(playerid, "MoveID"), query[200];
	GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
	switch(listitem) {
		case 0: {
			if(GetPlayerInterior(playerid) == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong o trong nha!");
			HouseInfo[id][hExitx] = Pos[0];
			HouseInfo[id][hExity] = Pos[1];
			HouseInfo[id][hExitz] = Pos[2];
			HouseInfo[id][hInterior] = GetPlayerInterior(playerid);
			SendClientMessage(playerid, COLOR_LGREEN, "Noi that cua ngoi nha da duoc sua doi!");
			OnPropTextdrawUpdate(1, id);
			format(query, sizeof(query), "UPDATE `houses` SET `Exitx`='%f', `Exity`='%f', `Exitz`='%f', `Interior`='%d' WHERE `ID`='%d'", Pos[0], Pos[1], Pos[2], GetPlayerInterior(playerid), id);
			mysql_query(SQL, query, false);			
		}
		case 1: {
			if(GetPlayerInterior(playerid) != 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban dang o trong mot noi that!");
			HouseInfo[id][hEntrancex] = Pos[0];
			HouseInfo[id][hEntrancey] = Pos[1];
			HouseInfo[id][hEntrancez] = Pos[2];
			SendClientMessage(playerid, COLOR_LGREEN, "Ben ngoai ngoi nha da duoc sua doi!");
			OnPropTextdrawUpdate(1, id);
			format(query, sizeof(query), "UPDATE `houses` SET `Entrancex`='%f', `Entrancey`='%f', `Entrancez`='%f' WHERE `ID`='%d'", Pos[0], Pos[1], Pos[2], id);
			mysql_query(SQL, query, false);		
		}
	}	
	return 1;
}
Dialog:DIALOG_MOVEBIZ(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new Float: Pos[3], id = GetPVarInt(playerid, "MoveID"), query[200];
	GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
	switch(listitem) {
		case 0: {
			if(GetPlayerInterior(playerid) == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong o trong nha!");
			BizzInfo[id][bExitX] = Pos[0];
			BizzInfo[id][bExitY] = Pos[1];
			BizzInfo[id][bExitZ] = Pos[2];
			BizzInfo[id][bInterior] = GetPlayerInterior(playerid);
			SendClientMessage(playerid, COLOR_LGREEN, "Noi that doanh nghiep da duoc thay doi!");
			OnPropTextdrawUpdate(1, id);
			format(query, sizeof(query), "UPDATE `bizz` SET `Exitx`='%f', `Exity`='%f', `Exitz`='%f', `Interior`='%d', WHERE `ID`='%d'", Pos[0], Pos[1], Pos[2], GetPlayerInterior(playerid), id);
			mysql_query(SQL, query, false);			
		}
		case 1: {
			if(GetPlayerInterior(playerid) != 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban dang o trong mot noi that!");
			BizzInfo[id][bEntranceX] = Pos[0];
			BizzInfo[id][bEntranceY] = Pos[1];
			BizzInfo[id][bEntranceZ] = Pos[2];
			SendClientMessage(playerid, COLOR_LGREEN, "Ben ngoai doanh nghiep da duoc thay doi!");
			OnPropTextdrawUpdate(2, id);
			format(query, sizeof(query), "UPDATE `bizz` SET `Entrancex`='%f', `Entrancey`='%f', `Entrancez`='%f' WHERE `ID`='%d'", Pos[0], Pos[1], Pos[2], id);
			mysql_query(SQL, query, false);		
		}
	}	
	return 1;
}
Dialog:DIALOG_BUYNEON(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	if(PlayerInfo[playerid][pPremiumPoints] < 100) return SendClientMessage(playerid, COLOR_DARKNICERED, "Ban khong co du 100 "#DIEMCAOCAP" mua mon hang nay.");
	new vehicleid = GetPlayerVehicleID(playerid), query[200];
	new carid = FindSpawnID(vehicleid);
	if(carid == 0) return SendClientMessage(playerid, COLOR_CLIENT, "Da xay ra loi! Thu lai sau...");
	if(CarInfo[carid][cNeon] != 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban da mua nang cap neon. De thay doi neon, su dung /changeneon.");
	switch(listitem) {
		case 0: {
			neon[0][vehicleid] = CreateDynamicObject(18648,0,0,0,0,0,0);
			neon[1][vehicleid] = CreateDynamicObject(18648,0,0,0,0,0,0);
		}
		case 1: {
			neon[0][vehicleid] = CreateDynamicObject(18649,0,0,0,0,0,0);
			neon[1][vehicleid] = CreateDynamicObject(18649,0,0,0,0,0,0);
		}
		case 2: {
			neon[0][vehicleid] = CreateDynamicObject(18650,0,0,0,0,0,0);
			neon[1][vehicleid] = CreateDynamicObject(18650,0,0,0,0,0,0);
		}
		case 3: {
			neon[0][vehicleid] = CreateDynamicObject(18652,0,0,0,0,0,0);
			neon[1][vehicleid] = CreateDynamicObject(18652,0,0,0,0,0,0);
		}
		case 4: {
			neon[0][vehicleid] = CreateDynamicObject(18651,0,0,0,0,0,0);
			neon[1][vehicleid] = CreateDynamicObject(18651,0,0,0,0,0,0);
		}
		case 5: {
			neon[0][vehicleid] = CreateDynamicObject(18647,0,0,0,0,0,0);
			neon[1][vehicleid] = CreateDynamicObject(18647,0,0,0,0,0,0);					
		}
	}
	CarInfo[carid][cNeon] = listitem+1;
	AttachDynamicObjectToVehicle(neon[0][vehicleid], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
	AttachDynamicObjectToVehicle(neon[1][vehicleid], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);				
	SendClientMessage(playerid, COLOR_GOLD, "Ban mua neon tu (/shop) voi 100 "#DIEMCAOCAP", ban co the bat tat neon voi lenh /neon!");
	PlayerInfo[playerid][pPremiumPoints] -= 100;
	Update(playerid, pPremiumPointsx);
	format(query, sizeof(query), "UPDATE `cars` SET `Neon`='%d' WHERE `ID`='%d'", CarInfo[carid][cNeon], carid);
	mysql_query(SQL, query, false);		
	return 1;
}
Dialog:DIALOG_CHANGENEON(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new vehicleid = GetPlayerVehicleID(playerid);
	new carid = FindSpawnID(vehicleid), query[200];
	if(carid == 0) return SendClientMessage(playerid, COLOR_CLIENT, "Da xay ra loi! Thu lai sau...");		
	if(CarInfo[carid][cNeon] != INVALID_OBJECT_ID) {
		DestroyDynamicObject(neon[0][CarInfo[carid][Spawned]]);
		DestroyDynamicObject(neon[1][CarInfo[carid][Spawned]]);
		neon[0][CarInfo[carid][Spawned]] = INVALID_OBJECT_ID;
		neon[1][CarInfo[carid][Spawned]] = INVALID_OBJECT_ID;	
	}			
	switch(listitem) {
		case 0: {
			neon[0][vehicleid] = CreateDynamicObject(18648,0,0,0,0,0,0);
			neon[1][vehicleid] = CreateDynamicObject(18648,0,0,0,0,0,0);
		}
		case 1: {
			neon[0][vehicleid] = CreateDynamicObject(18649,0,0,0,0,0,0);
			neon[1][vehicleid] = CreateDynamicObject(18649,0,0,0,0,0,0);
		}
		case 2: {
			neon[0][vehicleid] = CreateDynamicObject(18650,0,0,0,0,0,0);
			neon[1][vehicleid] = CreateDynamicObject(18650,0,0,0,0,0,0);
		}
		case 3: {
			neon[0][vehicleid] = CreateDynamicObject(18652,0,0,0,0,0,0);
			neon[1][vehicleid] = CreateDynamicObject(18652,0,0,0,0,0,0);
		}
		case 4: {
			neon[0][vehicleid] = CreateDynamicObject(18651,0,0,0,0,0,0);
			neon[1][vehicleid] = CreateDynamicObject(18651,0,0,0,0,0,0);
		}
		case 5: {
			neon[0][vehicleid] = CreateDynamicObject(18647,0,0,0,0,0,0);
			neon[1][vehicleid] = CreateDynamicObject(18647,0,0,0,0,0,0);					
		}
	}
	CarInfo[carid][cNeon] = listitem+1;
	AttachDynamicObjectToVehicle(neon[0][vehicleid], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
	AttachDynamicObjectToVehicle(neon[1][vehicleid], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);			
	if(PlayerInfo[playerid][pVip] == 0)
	{
		PlayerInfo[playerid][pPremiumPoints] -= 25;
		SendClientMessage(playerid, COLOR_GOLD, "Ban da thay doi mau neon cua ban voi 25 "#DIEMCAOCAP"!");
		Update(playerid, pPremiumPointsx);	
	} else SendClientMessage(playerid, COLOR_GOLD, "VIP nen khong can phai tra 25 xu tien doi mau neon.");
	format(query, sizeof(query), "UPDATE `cars` SET `Neon`='%d' WHERE `ID`='%d'", CarInfo[carid][cNeon], carid);
	mysql_query(SQL, query, false);		
	return 1;
}
Dialog:DIALOG_TELEPORT(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	switch(listitem) {
		case 0: {
			SetPlayerVirtualWorld(playerid, 1339);
			SetPlayerPosEx(playerid, 1772.0298,-1548.0693,9.9068);
			SetPlayerInterior(playerid, 0);				
		}
		case 1: {
			SetPlayerVirtualWorld(playerid, 4);
			SetPlayerPosEx(playerid, 1798.5109,-1578.3337,14.0848);
			SetPlayerInterior(playerid, 0);				
		}				
	}	
	return 1;
}
Dialog:DIALOG_MP3(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new i = listitem;
	if(i == 0) {
		PlayRadio[playerid] = 0;
		StopAudioStreamForPlayer(playerid);
		RemovePlayerAttachedObject(playerid, 4);				
		return 1;
	}
	if(i == sizeof(RadioLink)) Dialog_Show(playerid, DIALOG_YOUTUBE, DIALOG_STYLE_INPUT, "Youtube custom URL", "Nhap lien ket videoclip youtube vao ben duoi:", "Ok", "Exit");
	else {							
		PlayAudioStreamForPlayer(playerid, RadioLink[i]);	
		PlayRadio[playerid] = i;
		SetPlayerAttachedObject(playerid, 4, 19421, 2, 0.050000, -0.014999, 0.000000, 95.000000, 183.000000, 89.000000, 1, 1, 1, 0xffffffff);
	}	
	return 1;
}
Dialog:DIALOG_YOUTUBE(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	if(strfind(inputtext, "youtube", true) != -1) { }
	else return SendClientMessage(playerid, COLOR_GREY, "Invalid link!");			
	new string[100];
	format(string, sizeof(string), "http://www.youtubeinmp3.com/fetch/?video=%s", inputtext);
	PlayAudioStreamForPlayer(playerid, string);
	SetPlayerAttachedObject(playerid, 4, 19421, 2, 0.050000, -0.014999, 0.000000, 95.000000, 183.000000, 89.000000, 1, 1, 1, 0xffffffff);	
	return 1;
}
Dialog:DIALOG_TICKET(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new giveplayerid = GetPVarInt(playerid, "userID");
	if(ProxDetectorS(8.0, playerid, giveplayerid)) { }
	else return SendClientMessage(playerid, -1, "Nguoi choi do khong o gan ban."); 
	new giveplayer[64], string[200], sendername[MAX_PLAYER_NAME];
	new moneys = ticketValue(listitem);
	new result[64];
	format(result, 64, ticketName(listitem));
	GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
	GetPlayerName(playerid, sendername, sizeof(sendername));
	format(string, sizeof(string), "* Ban da gui %d mot ve phat $%s, ly do: %s", giveplayer, FormatNumber(moneys), result);
	SendClientMessage(playerid, COLOR_MONEY, string);
	format(string, sizeof(string), "* Si quan %s da viet mot ve phat $%s, ly do: %s, su dung /chapnhan ticket %d de tra tien phat.", sendername, FormatNumber(moneys), result,playerid);
	SendClientMessage(giveplayerid, COLOR_MONEY, string);
	TicketOffer[giveplayerid] = playerid;
	TicketMoney[giveplayerid] = moneys;	
	DeletePVar(playerid, "userID");		
	return 1;
}
Dialog:DIALOG_TRADE(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	if(TradeReady[playerid] == 1 || TradeID[playerid] == -1) return 1;
	new id = TradeID[playerid];
	new string[200];
	switch(listitem) {
		case 0: {
			if(GetPVarInt(playerid, "MoneyTrade") != 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban da gui mot khoan tien vao trong giao dich!");
			Dialog_Show(playerid, DIALOG_TRADE1, DIALOG_STYLE_INPUT, "Trade money", "Nhap so tien ma ban muon gui vao giao dich!", "Ok", "Back");
		}
		case 1: {
			if(GetPVarInt(playerid, "HouseTrade") != 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban da gui mot ngoi nha vao trong giao dich!");
			if(PlayerInfo[playerid][pHouse] != 999 && strcmp(GetName(playerid), HouseInfo[PlayerInfo[playerid][pHouse]][hOwner], true) == 0) { }
			else return SendClientMessage(playerid, COLOR_WHITE, "Ban khong so huu mot ngoi nha.");
			//if(PlayerInfo[id][pHouse] != 999) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Acel player are deja o casa!");
			AddTradeItem(playerid, 1, 0);
		}
		case 2: {
			if(GetPVarInt(playerid, "BusinessTrade") != 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban da gui mot doanh nghiep vao trong giao dich!");
			if(PlayerInfo[playerid][pBizz] == 255) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong so huu mot doanh nghiep!");
			//if(PlayerInfo[id][pBizz] != 255) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Acel player are deja o afacere!");
			AddTradeItem(playerid, 2, 0);
		}		
		case 3: {
			if(GetPVarInt(playerid, "CarTrade") != -1) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban da gui mot chiec xe vao giao dich!");
			if(GetVehicles(playerid) == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong co phuong tien ca nhan!");
			if(GetSlots(id) <= GetVehicles(id)) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Nguoi choi da het slot xe!");
			new szDialog[500];
			for(new i = 0; i < 11; i++) { //update vip
				if(PlayerInfo[playerid][pCarKey][i] != 0) {
					format(string, sizeof(string), "%s\n", aVehicleNames[CarInfo[PlayerInfo[playerid][pCarKey][i]][cModel]-400]);
					strcat(szDialog, string);
				}
				else strcat(szDialog, "{FFD857}<slot trong>{FFFFFF}\n");
			}
			Dialog_Show(playerid, DIALOG_TRADE2, DIALOG_STYLE_LIST, "Trade vehicle", szDialog, "Ok", "Back");
		}				
	}	
	return 1;
}
Dialog:DIALOG_TRADE1(playerid, response, listitem, inputtext[]) 
{
	if(!response) return Dialog_Show(playerid, DIALOG_TRADE, DIALOG_STYLE_LIST, "Giao dich", "Money\nHouse\nBusiness\nVehicle", "Ok", "Cancel");
	if(strval(inputtext) < 1) return SendClientMessage(playerid, COLOR_GREY, "So tien khong hop le!");
	if(GetPlayerCash(playerid) < strval(inputtext)) return SendClientMessage(playerid, COLOR_GREY, "So tien khong hop le!");
	AddTradeItem(playerid, 0, strval(inputtext));	
	return 1;
}
Dialog:DIALOG_TRADE2(playerid, response, listitem, inputtext[]) 
{
	if(!response) return Dialog_Show(playerid, DIALOG_TRADE, DIALOG_STYLE_LIST, "Giao dich", "Money\nHouse\nBusiness\nVehicle", "Ok", "Cancel");
	if(PlayerInfo[playerid][pCarKey][listitem] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong co xe tren slot nay!"); 
	if(CarInfo[PlayerInfo[playerid][pCarKey][listitem]][Spawned] == 0)  return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Chiec xe do con o trong kho!"); 
	if(CarInfo[PlayerInfo[playerid][pCarKey][listitem]][cSpecial] == 1)  return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the giao dich chiec xe nay!");
	AddTradeItem(playerid, 3, listitem);	
	return 1;
}
Dialog:DIALOG_DILDO(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	switch(listitem) {
		case 0: {
			if(GetPlayerCash(playerid) < 500) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co du tien de mua vat pham nay!");
			ServerWeapon(playerid, 10, 1);
			GivePlayerCash(playerid, -500);
			SendClientMessage(playerid,COLOR_WHITE,"Ban da mua mot Double-ended Dildo.");
			BizzInfo[6][bTill] += 500;
		}
		case 1: {
			if(GetPlayerCash(playerid) < 500) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co du tien de mua vat pham nay!");
			ServerWeapon(playerid, 11, 1);
			GivePlayerCash(playerid, -500);
			SendClientMessage(playerid,COLOR_WHITE,"Ban da mua mot Dildo.");
			BizzInfo[6][bTill] += 500;
		}
		case 2: {
			if(GetPlayerCash(playerid) < 500) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co du tien de mua vat pham nay!");
			ServerWeapon(playerid, 12, 1);
			GivePlayerCash(playerid, -500);
			SendClientMessage(playerid,COLOR_WHITE,"Ban da mua mot Vibrator.");
			BizzInfo[InBussines[playerid]][bTill] += 500;
		}
		case 3: {
			if(GetPlayerCash(playerid) < 500) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co du tien de mua vat pham nay!");
			ServerWeapon(playerid, 13, 1);
			GivePlayerCash(playerid, -500);
			SendClientMessage(playerid,COLOR_WHITE,"Ban da mua mot Silver Vibrator.");
			BizzInfo[InBussines[playerid]][bTill] += 500;
		}
		case 4: {
			if(GetPlayerCash(playerid) < 1000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co du tien de mua vat pham nay!");
			ServerWeapon(playerid, 14, 1);
			GivePlayerCash(playerid, -1000);
			SendClientMessage(playerid,COLOR_WHITE,"Ban da mua mot doa' hoa.");
			BizzInfo[InBussines[playerid]][bTill] += 1000;
		}		
	}
	new string[200];
	format(string, sizeof(string), "UPDATE users SET Money='%d' WHERE `ID`='%s'", GetPlayerCash(playerid), PlayerInfo[playerid][pSQLID]);
	mysql_query(SQL,string);
	format(string, sizeof(string), "UPDATE `bizz` SET `Till`='%d' WHERE `ID`='%d'",BizzInfo[InBussines[playerid]][bTill], InBussines[playerid]);
	mysql_query(SQL,string);		
	return 1;
}
Dialog:DIALOG_STAFF(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new szQuery[1024], szDialog[1024], szDialog2[4000], szResult[100], Cache: result;
	new szPlayers, szPlayersT;
	new szName[180], szAdmin, szLastOn[180], x, y, szTitle[180], warns, userID;
	switch(listitem) {
		case 0: {
			format(szQuery, sizeof(szQuery), "SELECT * FROM `users` WHERE `Admin`>'0' ORDER BY `users`.`Admin` ASC LIMIT 50");
			result = mysql_query(SQL, szQuery);			
			strcat(szDialog2, "Ten\tTrang thai\tBao cao\tCanh cao\n");
			for(new i, j = cache_num_rows(); i < j; i++)
			{
				cache_get_value_name(i, "name", szName);
				cache_get_value_name_int(i, "Admin", szAdmin);
				cache_get_value_name(i, "lastOn", szResult); format(szLastOn, 256, "Offline (%s)", szResult);	
				cache_get_value_name_int(i, "HelpedPlayers", szPlayers);
				cache_get_value_name_int(i, "HelpedPlayersToday", szPlayersT);
				cache_get_value_name_int(i, "AW", warns);
				userID = GetPlayerID( szName );
				userID = GetPlayerID( szName );
				if(userID != INVALID_PLAYER_ID) format(szLastOn, 256, "Online (%d)", userID);
				
				x++;
				format(szDialog, sizeof(szDialog), "(%d) %s\t%s\t%d trong tuan nay / %d tong cong\t%d/3\n", szAdmin, szName, szLastOn, szPlayersT, szPlayers, warns);
				strcat(szDialog2, szDialog);			
			}
			cache_delete(result);
			format(szTitle, sizeof(szTitle), "{FFEE00}Admins (%d/%d)", GetStaffOnline(0), x);
		}
		case 1: {
			format(szQuery, sizeof(szQuery), "SELECT * FROM `users` WHERE `Helper`>'0' ORDER BY `users`.`Helper` ASC LIMIT 50");
			result = mysql_query(SQL, szQuery);				
			strcat(szDialog2, "Ten\tTrang thai\tBao cao\tCanh cao\n");
			for(new i, j = cache_num_rows(); i < j; i++)
			{
				cache_get_value_name(i, "name", szName);
				cache_get_value_name_int(i, "Helper", szAdmin);
				cache_get_value_name(i, "lastOn", szResult); format(szLastOn, 256, "Offline (%s)", szResult);	
				cache_get_value_name_int(i, "HelpedPlayers", szPlayers);
				cache_get_value_name_int(i, "HelpedPlayersToday", szPlayersT);
				cache_get_value_name_int(i, "HW", warns);
				
				userID = GetPlayerID( szName );
				if(userID != INVALID_PLAYER_ID) format(szLastOn, 256, "Online (%d)", userID);
				y++;
				format(szDialog, sizeof(szDialog), "(%d) %s\t%s\t%d hom nay / %d tong cong\t%d/3\n", szAdmin, szName, szLastOn, szPlayersT, szPlayers, warns);
				strcat(szDialog2, szDialog);		
			}
			cache_delete(result);
			format(szTitle, sizeof(szTitle), "{FFEE00}Helpers (%d/%d)", GetStaffOnline(1), y);
		}
	}
	Dialog_Show(playerid, DIALOG_STAFF1, DIALOG_STYLE_TABLIST_HEADERS, szTitle, szDialog2, "Ok", "Back");	
	return 1;
}
Dialog:DIALOG_STAFF1(playerid, response, listitem, inputtext[]) 
{
	if(!response) return Dialog_Show(playerid, DIALOG_STAFF, DIALOG_STYLE_LIST, "Staff", "Admins\nHelpers", "Ok", "Close");	
	return 1;
}
Dialog:DIALOG_REFERRALS(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new szQuery[256], szDialog[1024], Cache: result, money, rp, lvl, regdate[100], ore, name[100];
	
	if(listitem == 0)  {
		format(szQuery, sizeof(szQuery), "SELECT * FROM `users` WHERE `id`='%d'", PlayerInfo[playerid][pReferral]);
		result = mysql_query(SQL, szQuery);
		if(cache_num_rows()) cache_get_value_name(0, "name", name);


		if(PlayerInfo[playerid][pReferral] != 0) format(szDialog, sizeof(szDialog),  "Ban da bi du do choi game boi %s.\nTai khoan cua ban duoc dang ky vao %s\nMa gioi thieu cua ban la %d.", name, PlayerInfo[playerid][pRegistredDate], PlayerInfo[playerid][pSQLID]);
		else format(szDialog, sizeof(szDialog),  "Khong ai ru ban choi server nay.\nBan da dang ky vao %s\nMa gioi thieu cua ban la %d.\nBan da loi keo duoc %d nguoi.", PlayerInfo[playerid][pRegistredDate], PlayerInfo[playerid][pSQLID], CountReferrals(playerid));				
		Dialog_Show(playerid, DIALOG_REFERRALS1, DIALOG_STYLE_MSGBOX, "Thong tin keo mem", szDialog, "Tro ve", "Thoat");				
		return 1;
	}
	listitem --;
	format(szQuery, sizeof(szQuery), "SELECT * FROM `users` WHERE `name`='%s'", Selected[playerid][listitem]);
	result = mysql_query(SQL, szQuery);
	cache_get_value_name(0, "RegisterDate", regdate);
	cache_get_value_name_int(0, "Level", lvl); 
	cache_get_value_name_int(0, "ReferralRP", rp);
	cache_get_value_name_int(0, "ReferralMoney", money);
	cache_get_value_name_int(0, "ConnectedTime", ore);
	cache_delete(result);		
	format(szDialog, sizeof(szDialog), "Thong tin ve %s\nDang ky vao: %s\nLevel: %d\nGio choi: %d\nTien kiem duoc tu nguoi nay: $%s\nRP kiem duoc tu nguoi nay: %d", Selected[playerid][listitem], regdate, lvl, ore, FormatNumber(money), rp);
	Dialog_Show(playerid, DIALOG_REFERRALS1, DIALOG_STYLE_MSGBOX, "Gioi thieu nguoi choi", szDialog, "Back", "Exit");		
	return 1;
}
Dialog:DIALOG_REFERRALS1(playerid, response, listitem, inputtext[]) 
{
	if(response) return 1;
	return 1;
}
Dialog:DIALOG_SYSTEMS(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new string[100];
	switch(ServerSystem[listitem]) {
		case 0: {
			if(Licitatie == 1) SCMTA(COLOR_CLIENT, "SERVER: Da tat he thong dau gia!");
			Licitatie = 0;
			TimpLicitatie = 0;		
			ServerSystem[listitem] = 1;
		}	
		case 1: ServerSystem[listitem] = 0;
	}
	format(string, sizeof(string), "Warning: %s da %s he thong '%s'.", GetName(playerid), (ServerSystem[listitem] == 0) ? ("mo") : ("tat"), SystemName(listitem));
	SendAdminMessage(COLOR_WARNING, string, 5);		
	return 1;
}
Dialog:DIALOG_EMAILS(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;			
	switch(listitem) {
		case 0: Dialog_Show(playerid, DIALOG_SENDMAIL, DIALOG_STYLE_INPUT, "Send mail", "Nhap dia chi email ma ban muon gui tin nhan.", "Next", "Back");
		case 1: SetPVarInt(playerid, "Type", 0), ShowEmails(playerid, 0);
		case 2: SetPVarInt(playerid, "Type", 1), ShowEmails(playerid, 1);
	}	
	return 1;
}
Dialog:DIALOG_EMAILS1(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new eid = EmailID[playerid][listitem], text[256];
	new qresult[5][256], query[100];				
	format(query, sizeof(query), "SELECT * FROM `emails` WHERE `ID`='%d'", eid);
	new Cache: result = mysql_query(SQL, query);	
	for(new i, x = cache_num_rows(); i < x; i++) {
		cache_get_value_name(i, "Text", qresult[0]);
		cache_get_value_name(i, "By", qresult[1]);
		cache_get_value_name(i, "Date", qresult[2]);	
		cache_get_value_name(i, "Read", qresult[3]);
		cache_get_value_name(i, "ID", qresult[4]);				
	}
	cache_delete(result);
	if(strval(qresult[3]) == 0) {
		format(query, sizeof(query), "UPDATE `emails` SET `Read`='1' WHERE `ID`='%d'", eid);
		mysql_query(SQL, query, false);
	}	
	if(GetPVarInt(playerid, "Type") == 0) format(text, sizeof(text), "%s\n\nEmail nhan luc %d boi %s.", qresult[0], qresult[2], qresult[1]);
	else format(text, sizeof(text), "%s\n\nEmail duoc gui vao %s boi %s.", qresult[0], qresult[2], qresult[1]);
	Dialog_Show(playerid, DIALOG_EMAIL1, DIALOG_STYLE_MSGBOX, "Email", text, "Ok", "Back");	
	return 1;
}
Dialog:DIALOG_EMAIL1(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;	
	return 1;
}
Dialog:DIALOG_SENDMAIL(playerid, response, listitem, inputtext[]) 
{
	if(!response) return ShowEmails(playerid, 0);
	//if(strcmp(PlayerInfo[playerid][pEmail], inputtext, true) == 0) return Dialog_Show(playerid, DIALOG_SENDMAIL, DIALOG_STYLE_INPUT, "Check email", "Nhap dia chi email ma ban muon gui tin nhan.", "Next", "Back");
	new szQuery[256], string[200];
	mysql_format(SQL, szQuery, sizeof(szQuery), "SELECT * FROM `users` WHERE `Email`='%e' LIMIT 1", inputtext);
	new Cache: result = mysql_query(SQL, szQuery);
	new test = cache_num_rows ();
	cache_delete(result);
	if(test == 0) return Dialog_Show(playerid, DIALOG_SENDMAIL, DIALOG_STYLE_INPUT, "Check email", "Email sai!\nNhap dia chi email ma ban muon gui tin nhan.", "Next", "Back");
	format(string, sizeof(string), "Viet tin nhan ban muon gui den dia chi %s\nSo ky tu toi thieu la 10 va so toi da la 100.", inputtext);
	Dialog_Show(playerid, DIALOG_SENDMAIL1, DIALOG_STYLE_INPUT, "Send message", string, "Send", "Back");
	SetPVarString(playerid, "Email", inputtext);	
	return 1;
}
Dialog:DIALOG_SENDMAIL1(playerid, response, listitem, inputtext[]) 
{
	if(!response) return Dialog_Show(playerid, DIALOG_SENDMAIL, DIALOG_STYLE_INPUT, "Check email", "Nhap dia chi email ma ban muon gui tin nhan.", "Next", "Back");		
	new email[64], string[100], query[200];
	GetPVarString(playerid, "Email", email, sizeof(email));
	if(strlen(inputtext) < 10 || strlen(inputtext) > 100) {
		format(string, sizeof(string), "Viet tin nhan ban muon gui den dia chi %s\nSo ky tu toi thieu la 10 va so toi da la 100.", email);
		Dialog_Show(playerid, DIALOG_SENDMAIL1, DIALOG_STYLE_INPUT, "Send message", string, "Send", "Back");		
		return 1;
	}
	format(string, sizeof(string), "Email da duoc gui thanh cong!", email);
	SendClientMessage(playerid, COLOR_YELLOW, string);

	new name[64];
	format(query, sizeof(query), "SELECT * FROM `users` WHERE `Email`='%s'", email);
	new Cache: result = mysql_query(SQL, query);
	cache_get_value_name(0, "name", name); 
	cache_delete(result);					
	InsertEmail(name, GetName(playerid), inputtext, 1);
	return 1;
}
// Dialog:DIALOG_WHEELS(playerid, response, listitem, inputtext[]) 
// {
// 	if(!response) return 1;
// 	new car = GetPlayerVehicleID(playerid), idd;
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
// 	if(CarInfo[idd][Spawned] != car) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong xe cua ban.");
// 	if(idd == 0) return SendClientMessage(playerid, COLOR_WHITE, "Chiec xe nay khong phai cua ban!")	;		
// 	PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
// 	switch(listitem) {
// 		case 0: AddVehicleComponent(car,1073);
// 		case 1: AddVehicleComponent(car,1079);
// 		case 2: AddVehicleComponent(car,1080);
// 		case 3: AddVehicleComponent(car,1083);
// 	}
// 	SendClientMessage(playerid, COLOR_YELLOW, "Thay doi da duoc cap nhat thanh cong!");
// 	saveTuning(playerid, GetPlayerVehicleID(playerid));
// 	// BizzInfo[InBussines[playerid]][bTill] += 50;			
// 	return 1;
// }
Dialog:DIALOG_SPAWNCHANGE(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	switch(listitem) {
		case 0: {
			if(PlayerInfo[playerid][pHouse] == 999) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong co nha/thue nha!");
			SendClientMessage(playerid, -1, "Ban se duoc hoi sinh tai nha rieng/phong.");
			SpawnChange[playerid] = 1;	
			UpdateVar(playerid, "SpawnChange", 1);		
		}
		case 1: {
			SendClientMessage(playerid, -1, "Ban se duoc hoi sinh tai spawn civil.");
			SpawnChange[playerid] = 0;	
			UpdateVar(playerid, "SpawnChange", 0);		
		}	
		case 2: {
			if(PlayerInfo[playerid][pRentedApartment] == 0) return SendClientMessage(playerid, -1, "Ban khong thue bat ky can ho nao.");
			SendClientMessage(playerid, -1, "Ban se duoc hoi sinh tai can ho cua ban.");
			SpawnChange[playerid] = 2;
			UpdateVar(playerid, "SpawnChange", 2);
		}
	}	
	return 1;
}
Dialog:DIALOG_SONDAJ(playerid, response, listitem, inputtext[]) 
{
	SondajVote[playerid] = 1;
	if(!response) return SendClientMessage(playerid, COLOR_YELLOW, "Ban da bo phieu 'Khong' cho cuoc tham do y kien nay!"), SondajVotes[1]++;
	SendClientMessage(playerid, COLOR_YELLOW, "Ban da bo phieu 'Co' cho cuoc tham do y kien nay!");
	SondajVotes[0]++;	
	return 1;
}
Dialog:DIALOG_BUYGUN2(playerid, response, listitem, inputtext[]) 
{
	if(!response || InTraining[playerid] == 0) return 1;
	switch(listitem) {
		case 0: ServerWeapon(playerid, 24, 50);		
		case 1: ServerWeapon(playerid, 31, 200);			
		case 2: ServerWeapon(playerid, 30, 200);	
		case 3: ServerWeapon(playerid, 28, 200);			
		case 4: ServerWeapon(playerid, 25, 20);			
		case 5: ServerWeapon(playerid, 5, 20);			
	}
	Update(playerid, pCashx);	
	return 1;
}
Dialog:DIALOG_SUSPECT(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new id = GetPVarInt(playerid, "Userid");
	new i = listitem, string[200];
	if(!IsPlayerConnected(id)) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong dang nhap!");
	new level = wantedList[i][0];
	if(level + PlayerInfo[id][pWantedLevel] > 6) PlayerInfo[id][pWantedLevel] = 6;
	else PlayerInfo[id][pWantedLevel] = level+PlayerInfo[id][pWantedLevel];
	format(string, sizeof(string), "Khong ro");
	strmid(PlayerInfo[id][pVictim], string, 0, strlen(string), 255);
	Update(id,pVictimx);
	strmid(PlayerInfo[id][pAccused], GetName(playerid), 0, strlen(GetName(playerid)), 255);
	Update(id,pAccusedx);
	new y,m,d,h,mi;
	getdate(y,m,d);
	gettime(h,mi);
	if(strcmp(PlayerInfo[id][pCrime1], "Khong co toi", true) == 0)
	{
		format(string, sizeof(string), "%s - reporter: %s",wantedName(i),GetName(playerid));
		strmid(PlayerInfo[id][pCrime1], string, 0, strlen(string), 255);
		Update(id,pCrime1x);
	}
	else if(strcmp(PlayerInfo[id][pCrime2], "Khong co toi", true) == 0)
	{
		format(string, sizeof(string), "%s - reporter: %s",wantedName(i),GetName(playerid));
		strmid(PlayerInfo[id][pCrime2], string, 0, strlen(string), 255);
		Update(id,pCrime2x);
	}
	else if(strcmp(PlayerInfo[id][pCrime3], "Khong co toi", true) == 0)
	{
		format(string, sizeof(string), "%s - reporter: %s",wantedName(i),GetName(playerid));
		strmid(PlayerInfo[id][pCrime3], string, 0, strlen(string), 255);
		Update(id,pCrime3x);
	}
	else if(strcmp(PlayerInfo[id][pCrime1],  "Khong co toi", true) == 0 && strcmp(PlayerInfo[id][pCrime2], "Khong co toi", true) == 0 && strcmp(PlayerInfo[id][pCrime3], "Khong co toi", true) == 0) { }
	else
	{
		format(string, sizeof(string), "%s - reporter: %s",wantedName(i),GetName(playerid));
		strmid(PlayerInfo[id][pCrime1], string, 0, strlen(string), 255);
		Update(id,pCrime1x);
		format(string, sizeof(string), "Khong co toi");
		strmid(PlayerInfo[id][pCrime2], string, 0, strlen(string), 255);
		strmid(PlayerInfo[id][pCrime3], string, 0, strlen(string), 255);
		Update(id,pCrime2x);
		Update(id,pCrime3x);
	}
	SetPlayerWantedLevel(id,PlayerInfo[id][pWantedLevel]);
	format(string, sizeof(string), "Ban da pham toi: %s, duoc bao cao boi: %s. W: +%d. Cap do truy na hien tai: %d.",wantedName(i),GetName(playerid),level,PlayerInfo[id][pWantedLevel]);
	SendClientMessage(id, COLOR_WARNING, string);
	format(string, sizeof(string), "Tru so: %s [%d] da bi bao cao pham toi: %s. Nguoi bao cao: %s. W: +%d. Cap do truy na moi: %d.",GetName(id),id,wantedName(i),GetName(playerid),level,PlayerInfo[id][pWantedLevel]);
	SendTeamMessage(3, 0x2e64feFF, string);
	SendTeamMessage(2, 0x2e64feFF, string);
	SendTeamMessage(1, 0x2e64feFF, string);
	SendTeamMessage(15, 0x2e64feFF, string);
	PlayCopSound();
	Update(id,pWantedLevelx);
	ShowWanted[id] = 1;	
	foreach(new x: Player) {
		if(IsACop(x) && OnDuty[x] == 1 && GetDistanceBetweenPlayers(x, playerid) < 250) {
			SetHitStreamOut(x, id);
			SetHitStreamIn(x, id);	
		}	
	}
	WantedTime[playerid] = 0;	
	return 1;
}
Dialog:DIALOG_EDITSF(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new string[100];
	SelectedItem[playerid] = listitem+1;
	format(string, sizeof(string), "Position\t(%f, %f, %f)\nRange\t%d", SafeZone[listitem+1][szX], SafeZone[listitem+1][szY], SafeZone[listitem+1][szZ], SafeZone[listitem+1][szRange]);
	new title[180];
	format(title, sizeof(title), "Edit safe zone %d", listitem+1);
	Dialog_Show(playerid, DIALOG_EDITSF1, DIALOG_STYLE_TABLIST, title, string, "Select", "Cancel");	
	return 1;
}
Dialog:DIALOG_EDITSF1(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	switch(listitem) {
		case 0: Dialog_Show(playerid, DIALOG_EDITSF2, DIALOG_STYLE_INPUT, "Position:", "Viet ben duoi gia tri ban muon bien nay co.\nSyntax: x, y, z", "Ok", "Exit");
		case 1: Dialog_Show(playerid, DIALOG_EDITSF2, DIALOG_STYLE_INPUT, "Range:", "Viet ben duoi gia tri ban muon bien nay co.", "Ok", "Exit");
	}
	EditJob[playerid] = listitem;	
	return 1;
}
Dialog:DIALOG_EDITSF2(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new job = SelectedItem[playerid];
	new amount = strval(inputtext), string[200];
	switch(EditJob[playerid]) {
		case 0: {
			new Float: Pos[3];
			if(sscanf(inputtext, "fff", Pos[0], Pos[1], Pos[2])) return SendClientMessage(playerid, -1, "Invalid syntax!");
			SafeZone[job][szX] = Pos[0];
			SafeZone[job][szY] = Pos[1];
			SafeZone[job][szZ] = Pos[2];
			format(string, sizeof(string), "Ban da thay doi 'Vi tri' cua Job ID %d, tro thanh: %f, %f, %f.", job, Pos[0], Pos[1], Pos[2]);
			SendClientMessage(playerid, COLOR_WHITE, string);
			mysql_format(SQL, string, sizeof(string), "UPDATE `safezones` SET `X`='%f', `Y`='%f', `Z`='%f' WHERE `ID`='%d'", Pos[0], Pos[1], Pos[2], job);
			mysql_tquery(SQL, string, "", "");
		}
		case 1: {
			SafeZone[job][szRange] = amount;
			format(string, sizeof(string), "Ban da thay doi 'Pham vi' cua Job ID %d, tro thanh: %d.", job, amount);
			SendClientMessage(playerid, COLOR_WHITE, string);
			mysql_format(SQL, string, sizeof(string), "UPDATE `safezones` SET `Range`='%d' WHERE `ID`='%d'", amount, job);
			mysql_tquery(SQL, string, "", "");
		}
	}	
	return 1;
}
Dialog:DIALOG_MYBL(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new i = SelectedFaction2[playerid][listitem], string[120], query[150];
	if(!IsInBlacklist(playerid, i)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co trong danh sach den cua to chuc do! Co the ban da duoc xoa ra.");
	if(GetPlayerCash(playerid) < 100000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co $100.000 de thoat khoi danh sach den cua to chuc nay!");
	GivePlayerCash(playerid, -100000);
	format(query, sizeof(query), "DELETE FROM `blacklist` WHERE `Userid`='%d' AND `Faction`='%d'", PlayerInfo[playerid][pSQLID], i);
	mysql_query(SQL, query, false);
	format(string, sizeof(string), "* Ban da tra $100.000 de thoat khoi danh sach den cua to chuc %s!", FactionName(i));
	SendClientMessage(playerid, COLOR_MONEY, string);
	format(string, sizeof(string), "* %s (%d) da tra $100,000 de duoc xoa ten khoi danh sach den cua to chuc ban.", GetName(playerid), playerid);
	SendFactionMessage(i, 0x0080FFFF, string);
	SafeInfo[i-1][sMoney] += 100000;
	SaveSeif(i-1);		
	return 1;
}
Dialog:DIALOG_BMENU(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new biz = PlayerInfo[playerid][pBizz], string[200];
	switch(listitem) {
		case 0: {
			format(string, sizeof(string), "Ten: %s\nThue: $%s\nTien da gui: $%s", BizzInfo[biz][bMessage], FormatNumber(BizzInfo[biz][bEntranceCost]), FormatNumber(BizzInfo[biz][bTill]));
			Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Thong tin", string, "Ok", "");
		}
		case 1: {
			format(string, sizeof(string), "Trong ket an toan cua doanh nghiep co $%s\nNhap so tien ma ban muon rut ra!\nDe rut so tien ra, ban phai o trong doanh nghiep!", FormatNumber(BizzInfo[biz][bTill]));
			Dialog_Show(playerid, DIALOG_BMENU1, DIALOG_STYLE_INPUT, "Ket an toan", string, "Ok", "Back");		
		}
		case 2: {
			if(BizzInfo[biz][bLocked] == 1) {
				BizzInfo[biz][bLocked] = 0;
				SendClientMessage(playerid, COLOR_LGREEN, "Doanh nghiep cua ban da mo cua!");
			}
			else if(BizzInfo[biz][bLocked] == 0) {
				BizzInfo[biz][bLocked] = 1;
				SendClientMessage(playerid, COLOR_LGREEN, "Doanh nghiep cua ban da dong cua!");
			}
			mysql_format(SQL, string, sizeof(string),"UPDATE `bizz` SET `Locked`='%d' WHERE `ID`='%d'",BizzInfo[biz][bLocked], biz);
			mysql_query(SQL,string);								
		}
		case 3: Dialog_Show(playerid, DIALOG_BMENU1, DIALOG_STYLE_INPUT, "Dat ten", "Nhap ten ma ban muon dat cho doanh nghiep.", "Ok", "Back");
		case 4: Dialog_Show(playerid, DIALOG_BMENU1, DIALOG_STYLE_INPUT, "Phi vao cua", "Nhap le phi ma ban muon nguoi choi tra khi ho vao cua.\n", "Ok", "Back");		
		case 5: {
			if(TradeID[playerid] != -1) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the su dung thao tac nay khi ban dang trong mot cuoc giao dich!");
			Dialog_Show(playerid, DIALOG_BMENU1, DIALOG_STYLE_INPUT, "Ban doanh nghiep", "Nhap gia tien ma ban muon ban' biz cua minh.\nHay suy nghi ky truoc khi thuc hien hanh dong nay.\nNeu ban khong muon' ban' no (tat ban' biz) ban co the dat gia la 0, chung toi se xoa no.", "Ok", "Back");  
		}
		case 6: {
			if(BizzInfo[biz][bRadio] == -1) return SendClientMessage(playerid, -1, "Ban khong co radio. Ban co the mua radio tai /shop voi gia 20 "#DIEMCAOCAP" (castigate).");
			new szDialog[1024], szDialog2[1024];
			strcat(szDialog2, "Ten\tSo nguoi dang nghe\n");
			for(new i = 0; i < sizeof(RadioNames); i++) {
				if(i == 0) format(szDialog, sizeof(szDialog), "%s\n", RadioNames[i]);
				else format(szDialog, sizeof(szDialog), "%s\t%d\n", RadioNames[i], ListenThisRadio(i));
				strcat(szDialog2, szDialog);
			}
			Dialog_Show(playerid, DIALOG_BRADIO, DIALOG_STYLE_TABLIST_HEADERS, "Business Radio", szDialog2, "Ok", "Close");		
		}
	}
	SelectedItem[playerid] = listitem;	
	return 1;
}
Dialog:DIALOG_BMENU1(playerid, response, listitem, inputtext[]) 
{
	new biz = PlayerInfo[playerid][pBizz], string[200];
	if(!response) {
		if(biz == 255) return SendClientMessage(playerid, COLOR_GREY, "Ban khong so huu mot doanh nghiep!");
		new open[64];
		if(biz < 100) {
			if(BizzInfo[biz][bLocked] == 0) open = "Dong cua";
			else open = "Mo cua";
		}
		else open = "Dong cua";
		format(string, sizeof(string), "Thong tin\nKet an toan\n%s\nDat ten\nPhi vao cua\nBan doanh nghiep\nRadio", open);
		Dialog_Show(playerid, DIALOG_BMENU, DIALOG_STYLE_LIST, "Business menu", string, "Ok", "Exit");			
		return 1;
	}
	new suma = strval(inputtext);
	switch(SelectedItem[playerid]) {
		case 1: {
			if(suma > BizzInfo[biz][bTill] || suma < 1) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co so tien nay!");
			if(!PlayerToPoint(50.0, playerid,BizzInfo[biz][bExitX],BizzInfo[biz][bExitY],BizzInfo[biz][bExitZ]) && BizzInfo[biz][bSbiz] == 0) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong doanh nghiep cua ban!");
			else if(!PlayerToPoint(5.0, playerid,BizzInfo[biz][bEntranceX],BizzInfo[biz][bEntranceY],BizzInfo[biz][bEntranceZ]) && BizzInfo[biz][bSbiz] == 1) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong doanh nghiep cua ban!");
			GivePlayerCash(playerid,suma);
			BizzInfo[biz][bTill] -= suma;
			format(string, sizeof(string), "Ban lay $%s ra khoi ket sat. So con lai: $%s.", FormatNumber(suma),FormatNumber(BizzInfo[biz][bTill]));
			SendClientMessage(playerid, COLOR_MONEY, string);
			mysql_format(SQL, string, sizeof(string),"UPDATE `bizz` SET `Till`='%d' WHERE `ID`='%d'",BizzInfo[biz][bTill],biz);
			mysql_query(SQL, string, false);
			Update(playerid, pCashx);
			////InsertLog(playerid, string, LOG_BIZ);
			Log("logs/bizz.log", string);	
		}
		case 3: {
			if(strlen(inputtext) < 5 || strlen(inputtext) > 60) return SendClientMessage(playerid, COLOR_GREY, "Vui long nhap it nhat la 5 va nhieu nhat la 60!");
			strmid(BizzInfo[biz][bMessage], inputtext, 0, 64, 255);
			format(string, sizeof(string), "Ten doanh nghiep da duoc thay doi thanh '%s'.",BizzInfo[biz][bMessage]);
			SendClientMessage(playerid, COLOR_LGREEN, string);
			format(string, sizeof(string),"UPDATE bizz SET Message='%s' WHERE ID='%d'",BizzInfo[biz][bMessage],biz);
			mysql_query(SQL,string);
			OnPropTextdrawUpdate(2, biz);
		}
		case 4: {
			if(suma > ValidBizPrice(biz) || suma < 1) {
				format(string, sizeof(string), "Doanh nghiep cua ban chi co the dat toi da $%s phi.", FormatNumber(ValidBizPrice(biz)));
				SendClientMessage(playerid, COLOR_GREY, string);
				return 1;					
			}
			BizzInfo[biz][bEntranceCost] = suma;
			format(string, sizeof(string), "Phi bay gio la $%s.", FormatNumber(BizzInfo[biz][bEntranceCost]));
			SendClientMessage(playerid, COLOR_LGREEN, string);
			format(string, sizeof(string),"UPDATE `bizz` SET `EntranceCost`='%d' WHERE `ID`='%d'",BizzInfo[biz][bEntranceCost],biz);
			mysql_query(SQL,string);
			OnPropTextdrawUpdate(2,biz);		
		}
		case 5: {
			if(suma < 0 || suma > 500000000) return SendClientMessage(playerid, COLOR_GREY, "So khong hop le! ($1-$500,000,000)");
			format(string, sizeof(string), "Ban dat gia ban' biz cua minh la $%s.", FormatNumber(suma));
			SendClientMessage(playerid, COLOR_MONEY, string);
			BizzInfo[biz][bBuyPrice]= suma;
			format(string, sizeof(string), "UPDATE `bizz` SET `BuyPrice`= '%d' WHERE `ID`= '%d'", suma, biz);
			mysql_query(SQL, string);
			OnPropTextdrawUpdate(2,biz);
			format(string, sizeof(string), "%s da dat gia biz (%d) $%s.", GetName(playerid), biz, FormatNumber(suma));
			Log("logs/bizz.log", string);			
		}
	}	
	return 1;
}
Dialog:DIALOG_HMENU(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	if(PlayerInfo[playerid][pHouse] != 999 && strcmp(GetName(playerid), HouseInfo[PlayerInfo[playerid][pHouse]][hOwner], true) == 0) { }
	else return SendClientMessage(playerid, COLOR_GREY, "Ban khong co nha!");			
	new house = PlayerInfo[playerid][pHouse], string[200];
	switch(listitem) {
		case 0: {
			format(string, sizeof(string), "Ten ngoi nha: %s\nRent: $%s\nKet an toan: $%s\nNguoi thue nha online: %d", HouseInfo[house][hDiscription], FormatNumber(HouseInfo[house][hRent]), FormatNumber(HouseInfo[house][hTakings]), houseTenants(house));
			Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Thong tin", string, "Ok", "");
		}
		case 1: showTenants(playerid);
		case 2: {
			format(string, sizeof(string), "Trong ket an toan co $%s\nNhap so tien ma ban muon rut ra!\nDe lay tien ra ban can phai o trong ngoi nha!", FormatNumber(HouseInfo[house][hTakings]));
			Dialog_Show(playerid, DIALOG_HMENU1, DIALOG_STYLE_INPUT, "Ket an toan", string, "Ok", "Back");
		}
		case 3: {
			if(!PlayerToPoint(5, playerid,HouseInfo[house][hEntrancex], HouseInfo[house][hEntrancey], HouseInfo[house][hEntrancez]) || PlayerToPoint(3, playerid,HouseInfo[house][hExitx], HouseInfo[house][hExity], HouseInfo[house][hExitz]))
				return SendClientMessage(playerid, COLOR_GREY, "Ban khong o gan cua nha!");
				
			if(HouseInfo[house][hLock] == 1) {
				HouseInfo[house][hLock] = 0;
				SendClientMessage(playerid, COLOR_LGREEN, "Ban da mo cua ngoi nha!");
			}
			else if(HouseInfo[house][hLock] == 0) {
				HouseInfo[house][hLock] = 1;
				SendClientMessage(playerid, COLOR_LGREEN, "Ban dong cua nha!");
			}	
			PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
			format(string, sizeof(string),"UPDATE `houses` SET `Lockk`='%d' WHERE `ID`='%d'",HouseInfo[house][hLock], house);
			mysql_query(SQL,string,false);			
		}
		case 4: Dialog_Show(playerid, DIALOG_HMENU1, DIALOG_STYLE_LIST, "Nang cap nha", "Health Upgrade ($500)\nArmour Upgrade ($1000)", "Ok", "Back");
		case 5: Dialog_Show(playerid, DIALOG_HMENU1, DIALOG_STYLE_INPUT, "Dat ten", "Nhap ten ma ban muon dat cho ngoi nha cua minh.", "Ok", "Back");
		case 6: Dialog_Show(playerid, DIALOG_HMENU1, DIALOG_STYLE_INPUT, "Dat tien thue phong", "Nhap so tien.\nIt nhat $1 va cao nhat $10000.\nDat $0 neu ban muon cho thue mien phi!", "Ok", "Back");
		case 7: {
			if(TradeID[playerid] != -1) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the su dung thao tac nay khi ban dang trong mot cuoc giao dich!");
			Dialog_Show(playerid, DIALOG_HMENU1, DIALOG_STYLE_INPUT, "Ban nha", "Nhap so tien ma ban muon treo ban ngoi nha.\nSuy nghi ki truoc khi ra lua chon nay.\nNeu ban muon tat chuc nang nay, hay dat so tien la 0$.", "Ok", "Back"); 
		}
		case 8: {
			if(HouseInfo[house][hMusic] == -1) return SendClientMessage(playerid, -1, "House khong co radio. Ban co the mua o /shop voi gia 15 XU.");
			new szDialog[1024], szDialog2[1024];
			strcat(szDialog2, "Ten\tSo nguoi dang nghe\n");
			for(new i = 0; i < sizeof(RadioNames); i++) {
				if(i == 0) format(szDialog, sizeof(szDialog), "%s\n", RadioNames[i]);
				else format(szDialog, sizeof(szDialog), "%s\t%d\n", RadioNames[i], ListenThisRadio(i));
				strcat(szDialog2, szDialog);
			}
			Dialog_Show(playerid, DIALOG_HRADIO, DIALOG_STYLE_TABLIST_HEADERS, "House Radio", szDialog2, "Ok", "Close");		
		}
	}
	SelectedItem[playerid] = listitem;	
	return 1;
}
Dialog:DIALOG_HMENU1(playerid, response, listitem, inputtext[]) 
{
	new string[200], query[200];
	if(!response) {
		if(PlayerInfo[playerid][pHouse] != 999 && strcmp(GetName(playerid), HouseInfo[PlayerInfo[playerid][pHouse]][hOwner], true) == 0) {
			new open[64];
			if(HouseInfo[PlayerInfo[playerid][pHouse]][hLock] == 0) open = "Dong cua";
			else open = "Mo cua";
			format(string, sizeof(string), "Thong tin\nNguoi thue nha\nKet an toan\n%s\nHouse upgrade\nDat ten\nDat tien thue phong\nBan nha\nRadio", open);
			Dialog_Show(playerid, DIALOG_HMENU, DIALOG_STYLE_LIST, "House menu", string, "Ok", "Exit");
		}
		else SendClientMessage(playerid, COLOR_GREY, "Ban khong co nha!");			
		return 1;
	}
	if(PlayerInfo[playerid][pHouse] != 999 && strcmp(GetName(playerid), HouseInfo[PlayerInfo[playerid][pHouse]][hOwner], true) == 0) { }
	else return SendClientMessage(playerid, COLOR_GREY, "Ban khong co nha!");
	new suma = strval(inputtext), house = PlayerInfo[playerid][pHouse];
	switch(SelectedItem[playerid]) {
		case 2: {
			if(suma > HouseInfo[house][hTakings] || suma < 1) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co so tien nay trong ket an toan!");
			if(!PlayerToPoint(100, playerid,HouseInfo[house][hExitx],HouseInfo[house][hExity],HouseInfo[house][hExitz])) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong nha!");
			GivePlayerCash(playerid, suma);
			HouseInfo[house][hTakings] -= suma;
			format(string, sizeof(string), "Ban lay $%s trong ket an toan, so con lai: $%s", FormatNumber(suma),FormatNumber(HouseInfo[house][hTakings]));
			SendClientMessage(playerid, COLOR_MONEY, string);
			Update(playerid, pCashx);
			format(query, sizeof(query),"UPDATE `houses` SET `Takings`='%d' WHERE `ID`='%d'",HouseInfo[house][hTakings],HouseInfo[house][hID]);
			mysql_query(SQL, query, false);
			//InsertLog(playerid, string, LOG_SELL);
			Log("logs/housesafe.log", string);	
		}	
		case 4: {
			switch(listitem) {
				case 0:
				{
					if(GetPlayerCash(playerid) < 500) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co du tien!");
					if(HouseInfo[house][hHel] == 1) return SendClientMessage(playerid, COLOR_GREY, "Ngoi nha cua ban da co mat hang nay!");
					HouseInfo[house][hHel] = 1;
					GivePlayerCash(playerid,-500);
					
					// BizzInfo[InBussines[playerid]][bTill] += 500;
					// format(query, sizeof(query),"UPDATE `bizz` SET `Till`='%d' WHERE `ID`='18'",BizzInfo[InBussines[playerid]][bTill]);
					// mysql_query(SQL,query);		
			
					PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					format(query, sizeof(query),"UPDATE `houses` SET `Hel`='1' WHERE `ID`='%d'",house);
					mysql_query(SQL,query);
				}
				case 1:
				{
					if(!IsACop(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la canh sat!");
					if(GetPlayerCash(playerid) < 1000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co du tien!");
					if(HouseInfo[house][hHel] == 1) return SendClientMessage(playerid, COLOR_GREY, "Ngoi nha cua ban da co mat hang nay!");
					HouseInfo[house][hHel] = 1;
					GivePlayerCash(playerid,-1000);
					// BizzInfo[InBussines[playerid]][bTill] += 1000;
					// format(query, sizeof(query),"UPDATE `bizz` SET `Till`='%d' WHERE `ID`='18'",BizzInfo[InBussines[playerid]][bTill]);
					// mysql_query(SQL,query);								
					PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					format(query, sizeof(query),"UPDATE `houses` SET `Arm`='1' WHERE `ID`='%d'",house);
					mysql_query(SQL,query);
				}
			}
			SendClientMessage(playerid, COLOR_LGREEN, "Ban da nang cap thanh cong. Su dung '/heal' de hoi mau.");
		}
		case 5: {
			if(strlen(inputtext) < 5 || strlen(inputtext) > 60) return SendClientMessage(playerid, COLOR_GREY, "Vui long nhap it nhat la 5 va nhieu nhat la 60!");
			format(HouseInfo[house][hDiscription], 64, inputtext);
			format(string, sizeof(string), "Ten nha da duoc thay doi thanh '%s'.",HouseInfo[house][hDiscription]);
			SendClientMessage(playerid, COLOR_LGREEN, string);
			format(query, sizeof(query),"UPDATE houses SET Discription='%s' WHERE ID='%d'",HouseInfo[house][hDiscription],PlayerInfo[playerid][pHouse]);
			mysql_query(SQL,query);
			OnPropTextdrawUpdate(1, house);					
		}
		case 6: {
			if(suma < 0 || suma > 10000) return SendClientMessage(playerid, COLOR_GREY, "So tien toi thieu la $1 va so tien toi da la $10,000!");
			if(suma == 0) HouseInfo[house][hRentabil] = 0;
			else HouseInfo[house][hRentabil] = 1;
			HouseInfo[house][hRent] = suma;
			format(query,90,"UPDATE `houses` SET `Rent`='%d',`Rentabil`='%d' WHERE `ID`='%d'",suma,HouseInfo[house][hRentabil],house);
			mysql_query(SQL,query);	
			OnPropTextdrawUpdate(1, house);	
		}
		case 7: {
			if(suma < 0 || suma > 500000000) return SendClientMessage(playerid, COLOR_GREY, "Invalid price! ($1-$500,000,000)");
			format(string, sizeof(string), "Ban set gia nha la $%s.", FormatNumber(suma));
			SendClientMessage(playerid, COLOR_MONEY, string);
			HouseInfo[house][hValue] = suma;
			format(query, sizeof(query), "UPDATE `houses` SET `Value`= '%d' WHERE `ID`= '%d'", HouseInfo[house][hValue], house);
			mysql_query(SQL, query, false);
			OnPropTextdrawUpdate(1,house);
			format(string, sizeof(string), "%s set gia House (%d) la $%s.", GetName(playerid), house, FormatNumber(suma));
			Log("logs/housesafe.log", string);				
		}
	}	
	return 1;
}
Dialog:DIALOG_TENANTS(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new string[200];
	format(string, sizeof(string), "Ban co chac muon duoi %s ra khoi nha?\nSuy nghi ki truoc khi lam vay!", Selected[playerid][listitem]);
	Dialog_Show(playerid, DIALOG_TENANTS1, DIALOG_STYLE_MSGBOX, "Nguoi thue nha", string, "Da", "Back");
	SelectedItem[playerid] = listitem;	
	return 1;
}
Dialog:DIALOG_TENANTS1(playerid, response, listitem, inputtext[]) 
{
	if(!response) return showTenants(playerid);
	new userID = GetPlayerID(Selected[playerid][SelectedItem[playerid]]), query[200], string[200];
	if(PlayerInfo[playerid][pSQLID] == userID) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the lam dieu do!");
	if(userID != INVALID_PLAYER_ID) {
		SendClientMessage(userID, COLOR_YELLOW, "Ban da bi chu nha duoi, hien tai ban la nguoi vo gia cu!");
		PlayerInfo[userID][pHouse] = 999;
		PlayerInfo[userID][pRented] = -1;
	}
	else {
		format(query, sizeof(query), "UPDATE `users` SET `House`='999', `Rented`='-1' WHERE `name`='%s'", Selected[playerid][SelectedItem[playerid]]);
		mysql_query(SQL, query, false);
	}
	format(string, sizeof(string), "Ban da duoi %s ra khoi nha!", Selected[playerid][SelectedItem[playerid]]);
	SendClientMessage(playerid, COLOR_YELLOW, string);	
	return 1;
}
Dialog:DIALOG_WANTED(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;			
	new id = SelectedPlayers[playerid][listitem], string[200];
	if(PlayerInfo[id][pWantedLevel] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Nguoi choi khong con bi truy na!");
	ShowMDC(playerid, id);
	UsedFind[playerid] = 1;
	new Float:X,Float:Y,Float:Z;
	GetPlayerPos(id, X,Y,Z);
	SetPlayerCheckpointEx(playerid, X,Y,Z, 3.5);
	targetfind[playerid] = id;
	CP[playerid] = 53;
	format(string, sizeof(string), "* Cham do duoc dat tai %s (ID %d) tai khu vuc %s.",GetName(id),id,GetPlayerZone(id));
	SendClientMessage(playerid,COLOR_YELLOW,string);		
	return 1;
}
Dialog:DIALOG_SERVER(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	switch(listitem) {
		case 0: Dialog_Show(playerid, DIALOG_SERVER1, DIALOG_STYLE_MSGBOX, "Server menu", "Ban co chac muon unban tat ca tai khoan?", "Yes", "No");
		case 1: Dialog_Show(playerid, DIALOG_SERVER1, DIALOG_STYLE_MSGBOX, "Server menu", "Ban co chac muon khoi dong lai may chu vao payday tiep theo khong?", "Yes", "No");
		case 2: Dialog_Show(playerid, DIALOG_SERVER1, DIALOG_STYLE_MSGBOX, "Server menu", "Ban co chac muon bao tri may chu ngay bay gio khong?", "Yes", "No");	
		case 3: Dialog_Show(playerid, DIALOG_SERVER1, DIALOG_STYLE_INPUT, "Server menu", "Nhap mat khau server ma ban muon dat\nNeu ban muon xoa no, hay nhap '0'.", "Ok", "Huy bo");
		case 4: Dialog_Show(playerid, DIALOG_SERVER1, DIALOG_STYLE_INPUT, "Server menu", "Nhap ten ma ban muon server doi thanh (Nhap Khong neu ban muon tat tinh nang nay)", "Ok", "Huy bo");	
		case 5: Dialog_Show(playerid, DIALOG_SERVER1, DIALOG_STYLE_MSGBOX, "Server menu", "Ban co chac muon xoa nhung can nha khong hoat dong?", "Yes", "No");		
		case 6: Dialog_Show(playerid, DIALOG_SERVER1, DIALOG_STYLE_MSGBOX, "Server menu", "Ban co chac muon xoa cac biz khong hoat dong?", "Yes", "No");	
		case 7: Dialog_Show(playerid, DIALOG_SERVER1, DIALOG_STYLE_MSGBOX, "Server menu", "Ban co chac muon reset quest?", "Yes", "No");
	}
	SelectedItem[playerid] = listitem;
	return 1;
}
Dialog:DIALOG_SERVER1(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new string[200], query[200];
	switch(SelectedItem[playerid]) {
		case 0: {
			format(query, sizeof(query),"UPDATE users SET `BTemp`='0', `BYear`='0', `BMonth`='0', `BDay`='0', `Banned`='0'");
			mysql_query(SQL,query);
			SendRconCommand("reloadbans");	
			SendClientMessage(playerid, COLOR_YELLOW, "Ban da unban tat ca tai khoan!");
		}
		case 1: {
			RestartPayday = 1;
			SendClientMessage(playerid, COLOR_YELLOW, "May chu se khoi dong lai vao lan Payday sau do (khoi dong lai mat tam 1 phut)!");
		}
		case 2: {		
			foreach(new i: Player) {
				if(IsPlayerLogged[i] == 1) {
					if(PlayerInfo[i][pAdmin] == 0) {
						SendClientMessage(i, COLOR_CLIENT, "May chu da bao tri! Xin quay lai sau vai phut.");
						KickEx(i);
					}
					else SendClientMessage(i, COLOR_CLIENT, "May chu dang bao tri! Ban khong bi kick vi ban la Admin.");
				}	
			}
			SendRconCommand("hostname [0.3.7] "SERVER_NAME" : BAO TRI!");
			SendRconCommand("password 1");
		}
		case 3: {
			format(string, sizeof(string), "password %s", inputtext);
			SendRconCommand(string);
			if(strlen(inputtext) == 0) format(string, sizeof(string), "Ban xoa mat khau!");
			else format(string, sizeof(string), "Ban dat pass server la '%s'!", inputtext);
			SendClientMessage(playerid, COLOR_YELLOW, string);
		}
		case 4: {
			format(string, sizeof(string), "hostname %s", inputtext);
			SendRconCommand(string);
			format(string, sizeof(string), "Ban dat ten server la '%s'!", inputtext);
			SendClientMessage(playerid, COLOR_YELLOW, string);
		}
		case 5: {
			new Cache: result, name[64], userid, x, hours;
			foreach(new i : House) {
				if(strcmp(HouseInfo[i][hOwner], "The State", true) == 0) { }
				else {							
					format(query, sizeof(query), "SELECT * FROM `users` WHERE `name`='%s'", HouseInfo[i][hOwner]);
					result = mysql_query(SQL, query);
					if(cache_num_rows()) {
						cache_get_value_name_int(0, "id", userid);
						cache_get_value_name_int(0, "HoursMonth", hours);						
						cache_get_value_name(0, "name", name); 
					}
					cache_delete(result);
					if(hours <= 5) {
						format(string, sizeof(string), "Ban da mat can nha #%d boi vi ban choi it hon 5 gio trong thang nay.", i);
						InsertEmail(HouseInfo[i][hOwner], "AdmBot", string, 0);
						format(query, sizeof(query), "UPDATE `users` SET `House`='999' WHERE `ID`='%d'", userid);
						mysql_tquery(SQL, query, "", "");
						x++;
						HouseInfo[i][hOwned] = 1;
						HouseInfo[i][hValue] = 0;
						strmid(HouseInfo[i][hOwner], "The State", 0, strlen("The State"), 255);
						format(query, sizeof(query),"UPDATE `houses` SET `Hel`='0',`Arm`='0',`Lockk`='0',`Owned`='1',`Owner`='The State',`Value`='0' WHERE `ID`='%d'",BizzInfo[i][bID]);
						mysql_tquery(SQL, query, "", "");
						OnPropTextdrawUpdate(2, i);	
					}
				}
			}
			if(x != 0) format(string, sizeof(string), "Da xoa house ID %d khoi co so du lieu!", x);
			else format(string, sizeof(string), "Khong tim thay ngoi nha nao de xoa!");
			SendClientMessage(playerid, COLOR_YELLOW, string);		
		}
		case 6: {
			new Cache: result, name[64], userid, x, hours;
			foreach(new i : Bizs) {
				if(strcmp(BizzInfo[i][bOwner], "The State", true) == 0) { }
				else {
					format(query, sizeof(query), "SELECT * FROM `users` WHERE `name`='%s'", BizzInfo[i][bOwner]);
					result = mysql_query(SQL, query);
					if(cache_num_rows()) {
						cache_get_value_name_int(0, "id", userid);
						cache_get_value_name_int(0, "HoursMonth", hours);						
						cache_get_value_name(0, "name", name);
					}
					cache_delete(result);
					if(hours <= 5) {
						format(string, sizeof(string), "Ban bi mat biz #%d boi vi ban choi it hon 5 gio trong thang nay.", i);
						InsertEmail(BizzInfo[i][bOwner], "AdmBot", string, 0);
						format(query, sizeof(query), "UPDATE `users` SET `Bizz`='255' WHERE `ID`='%d'", userid);
						mysql_tquery(SQL, query, "", "");
						x++;
						BizzInfo[i][bLocked] = 0;
						BizzInfo[i][bOwned] = 1;
						BizzInfo[i][bBuyPrice] = 0;
						strmid(BizzInfo[i][bOwner], "The State", 0, strlen("The State"), 255);
						format(query, sizeof(query),"UPDATE `bizz` SET `Locked`='0',`Owned`='1',`Owner`='The State',`BuyPrice`='0' WHERE `ID`='%d'",BizzInfo[i][bID]);
						mysql_tquery(SQL, query, "", "");
						OnPropTextdrawUpdate(2, i);							
					}
				}
			}
			if(x != 0) format(string, sizeof(string), "Biz %d da bi xoa khoi co so du lieu!", x);
			else format(string, sizeof(string), "Khong co biz nao duoc tim thay trong co so du lieu!");
			SendClientMessage(playerid, COLOR_YELLOW, string);		
		}	
		case 7: {
			SendClientMessage(playerid, COLOR_YELLOW, "Quest da duoc reset!");
			foreach(new i: Player) {
				if(IsPlayerConnected(i) && CheckObjects(i) != 0) {
					for(new x = 0; x < 50; i++) {
						if(PlayerInfo[i][pSpecialQuest][x] == 1) PlayerInfo[i][pSpecialQuest][x] = 0, DestroyPlayerObject(i, PlayerInfo[i][pObjectQuest][x]);							
					}
					for(new x = 0; x < 50; x++) {
						if(PlayerInfo[i][pSpecialQuest][x] == 0) {
							PlayerInfo[i][pObjectQuest][x] = CreatePlayerObject(i, QUEST_OBJECT, QuestPos[x][0], QuestPos[x][1], QuestPos[x][2], 0, 0, 0, 300.0);
						}
					}							
					SaveQuest(i);
					SendClientMessage(i, COLOR_YELLOW, "Quest da duoc reset boi mot admin cap cao!");
				}
			}
			ResetQuest();
		}				
	}
	return 1;
}
Dialog:DIALOG_ADDCOMMAND(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	if(ExistaComanda(inputtext)) return SendClientMessage(playerid, COLOR_GREY, "Lenh nay da bi tat!");
	new reason[100], string[200];
	GetPVarString(playerid, "Reason", reason, sizeof(reason));
	format(string, sizeof(string), "INSERT INTO `commands` (`Name`, `Reason`) VALUES ('%s', '%s')", inputtext, reason);
	mysql_query(SQL, string);
	format(string, sizeof(string), "Lenh '%s' da duoc tat thanh cong. Ly do: %s", inputtext, reason);
	SendClientMessage(playerid, COLOR_YELLOW, string);
	return 1;
}
Dialog:DIALOG_BUYGUN(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	if(listitem != 5 && PlayerInfo[playerid][pLevel] < 5) return SendClientMessage(playerid, COLOR_LGREEN, "Ban can dat cap 5 de mua sung!");
	new query[200];
	switch(listitem) {
		case 0: {
			if(GetPlayerCash(playerid) < 500000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du $500,000 de mua vu khi nay!");
			//ServerWeapon(playerid, 24, 50);
			if(checkslotinv(playerid) == 24) return SendClientMessage(playerid, -1, "Tui do cua ban da day.");
			if(Inventory_GetFreeID(playerid, 1) == -1) Inventory_Add(playerid,"DE", 348, 50, 2);
			else Inventory_Add(playerid,"DE", 348, 50, 1);
			SendClientMessage(playerid, COLOR_MONEY, "Ban da mua mot Deagle voi gia $500,000.");
			GivePlayerCash(playerid, -500000);
			BizzInfo[InBussines[playerid]][bTill] += 500000;
			format(query, sizeof(query),"UPDATE `bizz` SET `Till`='%d',`Products`='%d' WHERE `ID`='%d'",BizzInfo[InBussines[playerid]][bTill],BizzInfo[InBussines[playerid]][bProducts],InBussines[playerid]);
			mysql_query(SQL,query);			
		}
		case 1: {
			if(GetPlayerCash(playerid) < 1400000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du $1,400,000 de mua vu khi nay!");
			//ServerWeapon(playerid, 31, 200);
			if(checkslotinv(playerid) == 24) return SendClientMessage(playerid, -1, "Tui do cua ban da day.");
			if(Inventory_GetFreeID(playerid, 1) == -1) Inventory_Add(playerid,"M4", 356, 230, 2);
			else Inventory_Add(playerid,"M4", 356, 230, 1);
			SendClientMessage(playerid, COLOR_MONEY, "Ban da mua mot M4 voi gia $1,400,000.");
			GivePlayerCash(playerid, -1400000);
			BizzInfo[InBussines[playerid]][bTill] += 1400000;
			format(query, sizeof(query),"UPDATE `bizz` SET `Till`='%d',`Products`='%d' WHERE `ID`='%d'",BizzInfo[InBussines[playerid]][bTill],BizzInfo[InBussines[playerid]][bProducts],InBussines[playerid]);
			mysql_query(SQL,query);				
		}
		case 2: {
			if(GetPlayerCash(playerid) < 1000000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du $1,000,000 de mua vu khi nay!");
			//ServerWeapon(playerid, 30, 200);
			if(checkslotinv(playerid) == 24) return SendClientMessage(playerid, -1, "Tui do cua ban da day.");
			if(Inventory_GetFreeID(playerid, 1) == -1) Inventory_Add(playerid,"AK47", 355, 230, 2);
			else Inventory_Add(playerid,"AK47", 355, 230, 1);
			SendClientMessage(playerid, COLOR_MONEY, "Ban da mua mot AK47 voi gia $1,000,000.");
			GivePlayerCash(playerid, -1000000);
			BizzInfo[InBussines[playerid]][bTill] += 1000000;
			format(query, sizeof(query),"UPDATE `bizz` SET `Till`='%d',`Products`='%d' WHERE `ID`='%d'",BizzInfo[InBussines[playerid]][bTill],BizzInfo[InBussines[playerid]][bProducts],InBussines[playerid]);
			mysql_query(SQL,query);				
		}	
		case 3: {
			if(GetPlayerCash(playerid) < 700000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du $700,000 de mua vu khi nay!");
			//ServerWeapon(playerid, 28, 200);
			if(checkslotinv(playerid) == 24) return SendClientMessage(playerid, -1, "Tui do cua ban da day.");
			if(Inventory_GetFreeID(playerid, 1) == -1) Inventory_Add(playerid,"Uzi", 352, 200, 2);
			else Inventory_Add(playerid,"Uzi", 352, 200, 1);
			SendClientMessage(playerid, COLOR_MONEY, "Ban da mua mot Micro SMG voi gia $700,000.");
			GivePlayerCash(playerid, -700000);
			BizzInfo[InBussines[playerid]][bTill] += 700000;
			format(query, sizeof(query),"UPDATE `bizz` SET `Till`='%d',`Products`='%d' WHERE `ID`='%d'",BizzInfo[InBussines[playerid]][bTill],BizzInfo[InBussines[playerid]][bProducts],InBussines[playerid]);
			mysql_query(SQL,query);				
		}	
		case 4: {
			if(GetPlayerCash(playerid) < 400000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du $400,000 de mua vu khi nay!");
			//ServerWeapon(playerid, 25, 20);
			if(checkslotinv(playerid) == 24) return SendClientMessage(playerid, -1, "Tui do cua ban da day.");
			if(Inventory_GetFreeID(playerid, 1) == -1) Inventory_Add(playerid,"Shotgun", 349, 30, 2);
			else Inventory_Add(playerid,"Shotgun", 349, 30, 1);
			SendClientMessage(playerid, COLOR_MONEY, "Ban da mua mot Shotgun voi gia $400,000.");
			GivePlayerCash(playerid, -400000);
			BizzInfo[InBussines[playerid]][bTill] += 400000;
			format(query, sizeof(query),"UPDATE `bizz` SET `Till`='%d',`Products`='%d' WHERE `ID`='%d'",BizzInfo[InBussines[playerid]][bTill],BizzInfo[InBussines[playerid]][bProducts],InBussines[playerid]);
			mysql_query(SQL,query);				
		}	
		case 5: {
			if(GetPlayerCash(playerid) < 50000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du $50,000 de mua vu khi nay!");
			//ServerWeapon(playerid, 5, 20);
			if(checkslotinv(playerid) == 24) return SendClientMessage(playerid, -1, "Tui do cua ban da day.");
			if(Inventory_GetFreeID(playerid, 1) == -1) Inventory_Add(playerid,"Baseballbat", 336, 1, 2);
			else Inventory_Add(playerid,"Baseballbat", 336, 1, 1);
			SendClientMessage(playerid, COLOR_MONEY, "Ban da mua mot Baseball Bat voi gia $50,000.");
			GivePlayerCash(playerid, -50000);
			BizzInfo[InBussines[playerid]][bTill] += 50000;
			format(query, sizeof(query),"UPDATE `bizz` SET `Till`='%d',`Products`='%d' WHERE `ID`='%d'",BizzInfo[InBussines[playerid]][bTill],BizzInfo[InBussines[playerid]][bProducts],InBussines[playerid]);
			mysql_query(SQL,query);				
		}
	}
	Update(playerid, pCashx);
	return 1;
}
Dialog:DIALOG_FDEPOSIT(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	switch(listitem) {
		case 0: {
			Dialog_Show(playerid, DIALOG_FDEPOSIT1, DIALOG_STYLE_INPUT, "Deposit", "Nhap so tien ma ban muon gui vao!", "Select", "Back");
		}
		case 1: {
			Dialog_Show(playerid, DIALOG_FDEPOSIT1, DIALOG_STYLE_INPUT, "Deposit", "Viet so vat lieu ma ban muon gui vao!", "Select", "Back");
		}
		case 2: {
			Dialog_Show(playerid, DIALOG_FDEPOSIT1, DIALOG_STYLE_INPUT, "Deposit", "Viet so thuoc phien ma ban muon gui vao!", "Select", "Back");
		}
	}
	SelectedItem[playerid] = listitem;
	return 1;
}
Dialog:DIALOG_FDEPOSIT1(playerid, response, listitem, inputtext[]) 
{
	if(!response) {
		Dialog_Show(playerid, DIALOG_FDEPOSIT, DIALOG_STYLE_LIST, "Gui vao to chuc", "Money\nMaterials\nDrugs", "Ok", "Exit");
		return 1;
	}
	new string[200];
	switch(SelectedItem[playerid]) {
		case 0: {
			if(GetPlayerCash(playerid) < strval(inputtext) || strval(inputtext) <= 0) return SendClientMessage(playerid, COLOR_WHITE, "* So tien khong hop le!");
			SafeInfo[SeifID[playerid]][sMoney] += strval(inputtext);
			GivePlayerCash(playerid, -strval(inputtext));
			format(string, sizeof(string), "* %s da gui $%s vao ket an toan cua to chuc.", GetName(playerid), FormatNumber(strval(inputtext)));
			SendFactionMessage(PlayerInfo[playerid][pMember], COLOR_LIGHTBLUE, string);	
			Log("logs/facsafe.log", string);	
		}
		case 1: {
			if(PlayerInfo[playerid][pMats] < strval(inputtext) || strval(inputtext) <= 0) return SendClientMessage(playerid, COLOR_WHITE, "* So tien khong hop le!");
			SafeInfo[SeifID[playerid]][sMaterials] += strval(inputtext);
			PlayerInfo[playerid][pMats] -= strval(inputtext);
			format(string, sizeof(string), "* %s da gui %s vat lieu vao ket an toan cua to chuc.", GetName(playerid), FormatNumber(strval(inputtext)));
			SendFactionMessage(PlayerInfo[playerid][pMember], COLOR_LIGHTBLUE, string);	
			UpdateVar(playerid, "Materials", PlayerInfo[playerid][pMats]);
			Log("logs/facsafe.log", string);	
		}
		case 2: {
			// if(PlayerInfo[playerid][pDrugs] < strval(inputtext) || strval(inputtext) <= 0) return SendClientMessage(playerid, COLOR_WHITE, "* So tien khong hop le!");
			// SafeInfo[SeifID[playerid]][sDrugs] += strval(inputtext);
			// PlayerInfo[playerid][pDrugs] -= strval(inputtext);
			// UpdateVar(playerid, "Drugs", PlayerInfo[playerid][pDrugs]);
			// format(string, sizeof(string), "* %s da gui %s thuoc phien vao ket an toan cua to chuc.", GetName(playerid), FormatNumber(strval(inputtext)));
			// SendFactionMessage(PlayerInfo[playerid][pMember], COLOR_LIGHTBLUE, string);
			// //InsertLog(playerid, string, LOG_DEPOSIT);
			return SendClientMessage(playerid, X11_GREY_70, "[THUOC PHIEN] He thong dang duoc xay dung, hay thu lai sau.");
		}			
	}
	SaveSeif(SeifID[playerid]);
	return 1;
}
Dialog:DIALOG_FWITHDRAW(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new string[200];
	switch(listitem) {
		case 0: {
			format(string, sizeof(string), "Ket sat cua to chuc co tong cong: $%s.\nNhap so luong ma ban muon lay ra/rut ra!", FormatNumber(SafeInfo[SeifID[playerid]][sMoney]));
			Dialog_Show(playerid, DIALOG_FWITHDRAW1, DIALOG_STYLE_INPUT, "Withdraw", string, "Select", "Back");
		}
		case 1: {
			format(string, sizeof(string), "Ket sat cua to chuc co tong cong: %s vat lieu.\nNhap so luong ma ban muon lay ra/rut ra!", FormatNumber(SafeInfo[SeifID[playerid]][sMaterials]));
			Dialog_Show(playerid, DIALOG_FWITHDRAW1, DIALOG_STYLE_INPUT, "Withdraw", string, "Select", "Back");
		}
		case 2: {
			format(string, sizeof(string), "Ket sat cua to chuc co tong cong: %s thuoc phien.\nNhap so luong ma ban muon lay ra/rut ra!", FormatNumber(SafeInfo[SeifID[playerid]][sDrugs]));
			Dialog_Show(playerid, DIALOG_FWITHDRAW1, DIALOG_STYLE_INPUT, "Withdraw", string, "Select", "Back");
		}
	}
	SelectedItem[playerid] = listitem;
	return 1;
}
Dialog:DIALOG_FWITHDRAW1(playerid, response, listitem, inputtext[]) 
{
	new string[200];
	if(!response) {
		new s = SeifID[playerid];
		format(string, sizeof(string), "Tuy chon\tSo luong\nTien\t$%s\nVat lieu\t%s\nThuoc phien\t%s\n", FormatNumber(SafeInfo[s][sMoney]), FormatNumber(SafeInfo[s][sMaterials]), FormatNumber(SafeInfo[s][sDrugs]));
		Dialog_Show(playerid, DIALOG_FWITHDRAW, DIALOG_STYLE_TABLIST_HEADERS, "Faction withdraw", string, "Ok", "Exit");
		return 1;
	}
	switch(SelectedItem[playerid]) {
		case 0: {
			if(SafeInfo[SeifID[playerid]][sMoney] < strval(inputtext) || strval(inputtext) <= 0) return SendClientMessage(playerid, COLOR_WHITE, "* So tien khong hop le!");
			SafeInfo[SeifID[playerid]][sMoney] -= strval(inputtext);
			GivePlayerCash(playerid, strval(inputtext));
			format(string, sizeof(string), "Ban lay tu ket sat to chuc $%s! So con lai ben trong la: $%s.", FormatNumber(strval(inputtext)), FormatNumber(SafeInfo[SeifID[playerid]][sMoney]));
			SendClientMessage(playerid, COLOR_MONEY, string);
			Update(playerid, pCashx);
			Log("logs/facsafe.log", string);	
		}
		case 1: {
			if(SafeInfo[SeifID[playerid]][sMaterials] < strval(inputtext) || strval(inputtext) <= 0) return SendClientMessage(playerid, COLOR_WHITE, "* So tien khong hop le!");
			SafeInfo[SeifID[playerid]][sMaterials] -= strval(inputtext);
			PlayerInfo[playerid][pMats] += strval(inputtext);
			format(string, sizeof(string), "Ban lay tu ket sat to chuc %s vat lieu! So con lai ben trong la %s vat lieu.", FormatNumber(strval(inputtext)), FormatNumber(SafeInfo[SeifID[playerid]][sMaterials]));
			SendClientMessage(playerid, COLOR_MONEY, string);
			format(string, sizeof(string), "UPDATE `users` SET `Materials`='%d' WHERE `ID`='%d'", PlayerInfo[playerid][pMats], PlayerInfo[playerid][pSQLID]);
			mysql_query(SQL, string, false);
			//InsertLog(playerid, string, LOG_DEPOSIT);	
			Log("logs/facsafe.log", string);	
		}
		case 2: {
			// if(SafeInfo[SeifID[playerid]][sDrugs] < strval(inputtext) || strval(inputtext) <= 0) return SendClientMessage(playerid, COLOR_WHITE, "* So tien khong hop le!");
			// SafeInfo[SeifID[playerid]][sDrugs] -= strval(inputtext);
			// PlayerInfo[playerid][pDrugs] += strval(inputtext);
			// format(string, sizeof(string), "Ban lay tu ket sat to chuc %s grams thuoc phien! So con lai ben trong la: %s grams thuoc.", FormatNumber(strval(inputtext)), FormatNumber(SafeInfo[SeifID[playerid]][sDrugs]));
			// SendClientMessage(playerid, COLOR_MONEY, string);	
			// format(string, sizeof(string), "UPDATE `users` SET `Drugs`='%d' WHERE `ID`='%d'", PlayerInfo[playerid][pDrugs], PlayerInfo[playerid][pSQLID]);
			// mysql_query(SQL, string, false);
			// //InsertLog(playerid, string, LOG_DEPOSIT);
			return SendClientMessage(playerid, X11_GREY_70, "[THUOC PHIEN] He thong dang duoc xay dung, hay thu lai sau.");
		}
	}
	SaveSeif(SeifID[playerid]);	
	return 1;
}
Dialog:DIALOG_QUITCLAN(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new query[300],cid=PlayerInfo[playerid][pClan];
	ClanMembers[PlayerInfo[playerid][pClan]]--;
	ClanInfo[cid][clPoints]-=PlayerInfo[playerid][pPoints];
	format(query, sizeof(query), "UPDATE clans SET `ActivePoints`='%d' WHERE `ID`='%d'", ClanInfo[cid][clPoints], PlayerInfo[playerid][pClan]);
	mysql_query(SQL, query, false);
	PlayerInfo[playerid][pClanRank] = 0;
	PlayerInfo[playerid][pClanDays] = 0;
	PlayerInfo[playerid][pClanWarn] = 0;
	PlayerInfo[playerid][pPoints] = 0;
	PlayerInfo[playerid][pClan] = 0;
	SetPlayerName(playerid, PlayerInfo[playerid][pUsername]);
	format(query, sizeof(query), "UPDATE `users` SET `Clan`='%d',`ClanRank`='%d',`ClanDays`='0',`ClanWarns`='0',`ActivePoints`='0' WHERE `Name`='%s'", PlayerInfo[playerid][pClan], PlayerInfo[playerid][pClanRank], PlayerInfo[playerid][pUsername]);
	mysql_query(SQL, query, false);
	format(query, sizeof(query), "{%s}%s da roi khoi clan (Diem hoat dong -%d)", ClanInfo[cid][clColor], GetName(playerid), PlayerInfo[playerid][pPoints]);
	SendClanMessage(cid, query);
	SendClientMessage(playerid, COLOR_YELLOW, "* Ban da roi khoi Clan.");
	return 1;
}
Dialog:DIALOG_SELLBIZ(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	if(strcmp(GetName(playerid), BizzInfo[PlayerInfo[playerid][pBizz]][bOwner], true) == 0)
	{
		new string[200];
		new bouse = PlayerInfo[playerid][pBizz];
		BizzInfo[bouse][bBuyPrice] = 0;
		BizzInfo[bouse][bLocked] = 1;
		BizzInfo[bouse][bOwned] = 1;
		strmid(BizzInfo[bouse][bOwner], "The State", 0, strlen("The State"), 255);
		new cashb = 150000;
		GivePlayerCash(playerid,cashb);
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
		format(string, sizeof(string), "* Ban da sell biz cua minh cho nha nuoc voi gia $%s.", FormatNumber(cashb));
		SendClientMessage(playerid, COLOR_MONEY, string);
		
		format(string, sizeof(string), "%s ban biz cua minh (%d) cho nha nuoc va nhan ve $150,000.", GetName(playerid), bouse);
		Log("logs/bizz.log", string);	
	
		PlayerInfo[playerid][pBizz] = 255;
		new str1[184];
		format(str1,sizeof(str1),"UPDATE `bizz` SET `Locked`='0',`Owned`='1',`Till`='0',`BuyPrice`='0',`Owner`='The State' WHERE `ID`='%d'",bouse);
		mysql_query(SQL,str1);
		Update(playerid,pCashx);
		Update(playerid,pBizzx);
		OnPropTextdrawUpdate(2,bouse);
	}
	else return SendClientMessage(playerid,COLOR_GREY, "Ban khong so huu mot biz.");
	return 1;
}
Dialog:DIALOG_SELLHOUSE(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new string[200];
	new house = PlayerInfo[playerid][pHouse];
	HouseInfo[house][hHel] = 0;
	HouseInfo[house][hHel] = 0;
	HouseInfo[house][hLock] = 0;
	HouseInfo[house][hOwned] = 1;
	HouseInfo[house][hValue] = 0;
	PlayerInfo[playerid][pRented] = 0;
	strmid(HouseInfo[house][hOwner], "The State", 0, strlen("The State"), 255);
	ConsumingMoney[playerid] = 1;
	GivePlayerCash(playerid,50000);
	PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	format(string, sizeof(string), "* Ban da ban' House cua minh cho nha nuoc voi gia $50,000.");
	SendClientMessage(playerid, COLOR_MONEY, string);
	format(string, sizeof(string), "%s ban house cua minh (%d) cho nha nuoc voi gia $50,000.", GetName(playerid), house);
	Log("logs/housesafe.log", string);	
	PlayerInfo[playerid][pHouse] = 999;
	PlayerInfo[playerid][pRented] = -1;
	if(InHouse[playerid] == house)
	{
		SetPlayerInterior(playerid,0);
		SetPlayerPosEx(playerid,HouseInfo[house][hEntrancex],HouseInfo[house][hEntrancey],HouseInfo[house][hEntrancez]);
		PlayerInfo[playerid][pInt] = 0;
	}
	Update(playerid,pCashx);
	Update(playerid,pRentedx);
	Update(playerid,pHousex);
	new str2[180];
	format(str2,sizeof(str2),"UPDATE `houses` SET `Hel`='0',`Arm`='0',`Lockk`='0',`Owned`='1',`Value`='0',`Owner`='The State' WHERE `ID`='%d'",HouseInfo[house][hID]);
	mysql_query(SQL,str2);
	OnPropTextdrawUpdate(1,house);
	return 1;
}
Dialog:DIALOG_CHECK(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new name[180], szQuery[256], check[180], string[200];
	GetPVarString(playerid, "CheckName", name, 256);
	format(szQuery, sizeof(szQuery), "SELECT * FROM `users` WHERE `name`='%s'", name);
	new Cache: result = mysql_query(SQL, szQuery);
	switch(listitem) {
		case 0: cache_get_value_name(0, "Pin", check);
		case 1: cache_get_value_name(0, "Money", check);
		case 2: cache_get_value_name(0, "Bank", check);
		case 3: cache_get_value_name(0, "House", check);
		case 4: cache_get_value_name(0, "Bizz", check);
		case 5: cache_get_value_name(0, "Level", check);
		case 6: cache_get_value_name(0, "ConnectedTime", check);
		case 7: cache_get_value_name(0, "PremiumPoints", check);
		case 8: cache_get_value_name(0, "GoldCastigat", check);
		case 9: cache_get_value_name(0, "HoursMonth", check);
		case 10: cache_get_value_name(0, "DayHours", check);
		case 11: cache_get_value_name(0, "lastOn", check);
		case 12: cache_get_value_name(0, "Member", check);							
	}
	if(listitem != 13) format(string, sizeof(string), "* Database result: %s", check);
	else format(string, sizeof(string), "* Database result: %s", FactionName(strval(check)));
	SendClientMessage(playerid, 0xFFB657FFF, string);		
	cache_delete(result);	
	return 1;
}
Dialog:DIALOG_BLACKLIST(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	if(listitem == 0) {
		Dialog_Show(playerid, DIALOG_BLACKLIST1, DIALOG_STYLE_INPUT, "Blacklist:", "Nhap ten cua nguoi ma ban muon them vao danh sach den (blacklist).\nNguoi do phai online thi ban moi co the them.", "Ok", "Exit");
		return 1;
	}
	format(pName[playerid], 256, Selected[playerid][listitem-1]);
	new szTitle[180];
	format(szTitle, sizeof(szTitle), "%s", pName[playerid]);
	Dialog_Show(playerid, DIALOG_BLACKLIST2, DIALOG_STYLE_LIST, szTitle, "{FF0000}Xoa khoi danh sach den", "Select", "Back");
	return 1;
}
Dialog:DIALOG_BLACKLIST1(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new id;
	if(sscanf(inputtext, "u", id)) {
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid, COLOR_WHITE, "Nguoi choi khong online!");
	}
	else {
		new string[200];
		if(id == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the them chinh ban vao danh sach!");
		if(PlayerInfo[id][pMember] == PlayerInfo[playerid][pMember]) return SendClientMessage(playerid, -1, "Ban khong the lam dieu nay voi dong nghiep!");
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid, COLOR_WHITE, "Nguoi choi khong online!");
		if(IsInBlacklist(id, PlayerInfo[playerid][pLeader])) return SendClientMessage(playerid, -1, "Nguoi choi do da co trong danh sach den cua to chuc!");
		format(string, sizeof(string), "%s (%d) hien da duoc them vao danh sach den cua to chuc.", GetName(id), id);
		SendClientMessage(playerid, COLOR_GOLD, string);
		format(string, sizeof(string), "%s (%d) da ghi ten ban vao danh sach den cua to chuc %s.", GetName(playerid), playerid, FactionName(PlayerInfo[playerid][pLeader]));
		SendClientMessage(id, COLOR_GOLD, string);
		format(string, sizeof(string), "INSERT INTO `blacklist` (`Userid`, `Name`, `Faction`, `Added`) VALUES ('%d', '%s', '%d', '%s')", PlayerInfo[id][pSQLID], PlayerInfo[id][pUsername], PlayerInfo[playerid][pLeader], PlayerInfo[playerid][pUsername]);
		mysql_tquery(SQL, string, "", "");
	}
	return 1;
}
Dialog:DIALOG_BLACKLIST2(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new string[200];
	format(string, sizeof(string), "%s khong con trong danh sach den nua.", pName[playerid]);
	SendClientMessage(playerid, COLOR_GOLD, string);
	new userID = GetPlayerID( pName[playerid] );
	if(userID != INVALID_PLAYER_ID) {
		mysql_format(SQL, string,128,"DELETE FROM `blacklist` WHERE `Userid`='%d'",PlayerInfo[userID][pSQLID]);
		mysql_query(SQL, string);
		format(string, sizeof(string), "%s da xoa ten ban khoi danh sach den cua to chuc %s.", GetName(playerid), FactionName(PlayerInfo[playerid][pLeader]));
		SendClientMessage(userID, COLOR_GOLD, string);
	}
	else {
		mysql_format(SQL, string,128,"DELETE FROM `blacklist` WHERE `Name`='%s'",pName[playerid]);
		mysql_query(SQL, string);
	}
	return 1;
}
Dialog:DIALOG_FRIENDS(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	if(listitem == 0) {
		Dialog_Show(playerid, DIALOG_FRIENDS1, DIALOG_STYLE_INPUT, "Xoa ban:", "Nhap ten cua nguoi ma ban muon them vao danh sach ban be.\nNguoi do phai online thi ban moi co the them.", "Ok", "Exit");
		return 1;
	}
	format(pName[playerid], 256, Selected[playerid][listitem-1]);
	new userid = GetPlayerID(pName[playerid]);
	new szTitle[180];
	format(szTitle, sizeof(szTitle), "%s", pName[playerid]);
	if(userid != INVALID_PLAYER_ID) Dialog_Show(playerid, DIALOG_FRIENDS2, DIALOG_STYLE_LIST, szTitle, "Call\nSMS\n{FF0000}Xoa ban", "Select", "Back");
	else Dialog_Show(playerid, DIALOG_FRIENDS3, DIALOG_STYLE_LIST, szTitle, "{FF0000}Xoa ban", "Select", "Back");
	return 1;
}
Dialog:DIALOG_FRIENDS1(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new id, string[200];
	if(sscanf(inputtext, "u", id)) {
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid, COLOR_WHITE, "Nguoi choi khong online!");
	}
	else {
		if(id == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the them chinh ban vao danh sach!");
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid, COLOR_WHITE, "Nguoi choi khong online!");
		new test, friends;
		format(string, sizeof(string), "SELECT * FROM `friends` WHERE `friendID`='%d'", PlayerInfo[id][pSQLID]);
		new Cache: db = mysql_query (SQL, string);
		if(cache_num_rows())
		{
			for(new i, j = cache_num_rows(); i != j; ++i) {
				cache_get_value_name_int(i, "AddBy", test);
				if(test == PlayerInfo[playerid][pSQLID]) return SendClientMessage(playerid, COLOR_WHITE, "Nguoi choi nay da co trong danh sach ban be cua ban!");
				friends++;
			}
		}
		//TODO: increase friend limit if target is vip
		cache_delete( db );
		format(string, sizeof(string), "%s (%d) da duoc them vao danh sach ban be.", GetName(id), id);
		SendClientMessage(playerid, COLOR_GOLD, string);
		format(string, sizeof(string), "%s (%d) da them ban vao danh sach ban be cua cau ay.", GetName(playerid), playerid);
		SendClientMessage(id, COLOR_GOLD, string);
		finishAchievement(playerid, 10);	
		format(string, sizeof(string), "INSERT INTO `friends` (`friendID`, `friendName`, `AddBy`) VALUES ('%d', '%s', '%d')", PlayerInfo[id][pSQLID], PlayerInfo[id][pUsername], PlayerInfo[playerid][pSQLID]);
		mysql_tquery(SQL, string, "", "");
	}
	return 1;
}
Dialog:DIALOG_FRIENDS2(playerid, response, listitem, inputtext[]) 
{
	if(!response) return ShowPlayerFriends(playerid);
	new userid = GetPlayerID(pName[playerid]);
	if(!IsPlayerConnected(userid)) return 1;
	new string[200];
	switch(listitem) {
		case 0: {
			if(PlayerInfo[playerid][pPhone] == 0) return SendClientMessage(playerid, -1, "Ban khong co dien thoai di dong!");
			foreach(new i: Player) {
				if(PlayerInfo[i][pPhone] == PlayerInfo[userid][pPhone]) {						
					new giveplayerid = i, giveplayer[MAX_PLAYER_NAME];
					if(PlayerInfo[giveplayerid][pPhone] == 0) return SendClientMessage(playerid, -1, "Nguoi choi do khong co dien thoai!");
					if(!IsPlayerConnected(giveplayerid)) return 1;
					if(giveplayerid == INVALID_PLAYER_ID) return 1;
					if(IsBlocked(giveplayerid, playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "Nguoi choi do da chan ban! Ban khong the lien lac voi nguoi ay!");
					if(IsBlocked(playerid, giveplayerid)) return SendClientMessage(playerid, COLOR_LGREEN, "Ban da chan nguoi do, ban khong the lien lac voi ho.");
					if(PhoneOnline[giveplayerid] > 0) return SendClientMessage(playerid, -1, "Dien thoai da tat nguon.");
					if(Mobile[giveplayerid] != 255) return 1;
					Mobile[playerid] = giveplayerid;
					format(string, sizeof(string), "%s (%s) goi cho ban. Su dung '/pickup' de nhac may.", GetName(playerid), DecimalNumber(playerid));
					SendClientMessage(giveplayerid, COLOR_YELLOW, string);
					new tel[180], tel2[180];
					format(tel, 256, "%d", PlayerInfo[playerid][pPhone]);
					format(tel2, 256, "%d", PlayerInfo[giveplayerid][pPhone]);								
					if(strlen(tel) == 4) format(string, sizeof(string), "%s lay iPhone ra va cham cham vao man hinh.", GetName(playerid));
					else format(string, sizeof(string), "%s lay dien thoai ra, bam bam.", GetName(playerid));		
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					GetPlayerName(giveplayerid,giveplayer,sizeof(giveplayer));
					if(PlayerInfo[playerid][pPhone] == 0) SetPlayerAttachedObject(playerid,4,330,6, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000);
					else if(PlayerInfo[playerid][pPhone] == 1) SetPlayerAttachedObject(playerid, 4, 18865, 6, 0.086043, 0.027719, 0.003817, 95.232246, 178.651031, 1.691840, 1.002077, 1.000000, 1.000000); // MobilePhone1 - phone1
					else if(PlayerInfo[playerid][pPhone] == 2) SetPlayerAttachedObject(playerid,4, 18874, 6, 0.086043, 0.027719, 0.003817, 95.232246, 178.651031, 1.691840, 1.002077, 1.000000, 1.000000); // MobilePhone10 - phone10
					if(strlen(tel2) == 4) format(string, sizeof(string), "* iPhone cua %s dang rung len.", giveplayer);
					else format(string, sizeof(string), "* Dien thoai cua %s dang reo len.", giveplayer);
					ProxDetector(20.0, giveplayerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					CellTime[playerid] = 1;
					Update(playerid, pCashx);
					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
					if(PlayerInfo[playerid][pPhone] == 0) SetPlayerAttachedObject(playerid,4,330,6, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000 );
					else if(PlayerInfo[playerid][pPhone] == 1) SetPlayerAttachedObject( playerid, 4, 18865, 6, 0.086043, 0.027719, 0.003817, 95.232246, 178.651031, 1.691840, 1.002077, 1.000000, 1.000000 ); // MobilePhone1 - phone1
					else if(PlayerInfo[playerid][pPhone] == 2) SetPlayerAttachedObject( playerid,4, 18874, 6, 0.086043, 0.027719, 0.003817, 95.232246, 178.651031, 1.691840, 1.002077, 1.000000, 1.000000 ); // MobilePhone10 - phone10	
				}			
			}
		}
		case 1: {
			if(PlayerInfo[playerid][pPhone] == 0) return SendClientMessage(playerid, -1, "Ban khong co dien thoai di dong!");
			Dialog_Show(playerid, DIALOG_FRIENDS4, DIALOG_STYLE_INPUT, "SMS:", "Nhap tin nhan ma ban muon gui.", "Ok", "Exit");
		}
		case 2: {
			mysql_format(SQL, string,128,"DELETE FROM `friends` WHERE `friendID`='%d' AND `AddBy`='%d'",PlayerInfo[userid][pSQLID], PlayerInfo[playerid][pSQLID]);
			mysql_query(SQL, string);
			format(string, sizeof(string), "%s da duoc xoa khoi danh sach ban be.", PlayerInfo[userid][pUsername]);
			SendClientMessage(playerid, COLOR_GOLD, string);
		}
	}
	return 1;
}
Dialog:DIALOG_FRIENDS3(playerid, response, listitem, inputtext[]) 
{
	if(!response) return ShowPlayerFriends(playerid);
	new string[128];
	mysql_format(SQL, string,128,"DELETE FROM `friends` WHERE `friendName`='%s' AND `AddBy`='%d'",pName[playerid], PlayerInfo[playerid][pSQLID]);
	mysql_query(SQL, string);
	format(string, sizeof(string), "%s da duoc xoa khoi danh sach ban be.", pName[playerid]);
	SendClientMessage(playerid, COLOR_GOLD, string);
	return 1;
}
Dialog:DIALOG_FRIENDS4(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new userid = GetPlayerID(pName[playerid]), string[200], sendername[MAX_PLAYER_NAME];
	if(!IsPlayerConnected(userid)) return 1;
	foreach(new i: Player){
		if(PlayerInfo[i][pPhone] == PlayerInfo[userid][pPhone] && PlayerInfo[userid][pPhone] != 0) {
			new giveplayerid = i;
			if(PhoneOnline[giveplayerid] > 0) return SendClientMessage(playerid, -1, "Nguoi nay da tat nguon dien thoai.");
			GetPlayerName(playerid, sendername, sizeof(sendername));
			if(PlayerInfo[giveplayerid][pAdmin] >= 1) {
				format(string, sizeof(string), "SMS tu %s (%d): %s",GetName(playerid),playerid, inputtext);
				SendClientMessage(giveplayerid, COLOR_YELLOW, string);
			}
			else {
				format(string, sizeof(string), "SMS tu %s (%s): %s",GetName(playerid),DecimalNumber(playerid), inputtext);
				SendClientMessage(giveplayerid, COLOR_YELLOW, string);						
			}
			format(string, sizeof(string), "SMS gui den %s (%s): %s",GetName(giveplayerid),DecimalNumber(giveplayerid),inputtext);
			SendClientMessage(playerid, 0xC8E0DFFF, string);
			format(string, sizeof(string), "(sms) %s den %s: %s", sendername, GetName(giveplayerid), inputtext);
			// ChatLog(playerid, string);	

			format(string, sizeof(string), "(SMS LOG) %s(%d) den %s(%d): %s", sendername, playerid, GetName(giveplayerid), giveplayerid, inputtext);
			if(PlayerInfo[playerid][pAdmin] < 6) EarsMessage(0xFFC400FF, string);   
			PlayerPlaySound(giveplayerid, 1138, 0.0, 0.0, 0.0);
			Reply[giveplayerid] = playerid;
		}
	}
	return 1;
}
Dialog:DIALOG_WHEELS(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new car = GetPlayerVehicleID(playerid), idd;
	new car1 = PlayerInfo[playerid][pCarKey][0], car2 = PlayerInfo[playerid][pCarKey][1], car3 = PlayerInfo[playerid][pCarKey][2], car4 = PlayerInfo[playerid][pCarKey][3], car5 = PlayerInfo[playerid][pCarKey][4],
	car6 = PlayerInfo[playerid][pCarKey][5], car7 = PlayerInfo[playerid][pCarKey][6], car8 = PlayerInfo[playerid][pCarKey][7], car9 = PlayerInfo[playerid][pCarKey][8], car10 = PlayerInfo[playerid][pCarKey][9],
	car11 = PlayerInfo[playerid][pCarKey][10];			
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
	if(car == CarInfo[car11][Spawned]) idd = PlayerInfo[playerid][pCarKey][10];
	if(CarInfo[idd][Spawned] != car) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong xe cua ban.");
	if(idd == 0) return SendClientMessage(playerid, COLOR_WHITE, "Chiec xe nay khong phai cua ban!")	;		
	PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
	switch(listitem) {
		case 0: AddVehicleComponent(car,1073);
		case 1: AddVehicleComponent(car,1079);
		case 2: AddVehicleComponent(car,1080);
		case 3: AddVehicleComponent(car,1083);
	}
	SendClientMessage(playerid, COLOR_YELLOW, "Thay doi da duoc cap nhat thanh cong!");
	saveTuning(playerid, GetPlayerVehicleID(playerid));
	// BizzInfo[InBussines[playerid]][bTill] += 50;			
	return 1;
}

Dialog:DIALOG_FACTIONS(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new string[200];
	new i = listitem+1;
	format(string, sizeof(string), "To chuc: %s\nLanh dao: %s\nThanh vien: %s/%d\nTuyen dung: %s", FactionName(i), GetLeader(i), GetFactionMembers(i), DynamicFactions[i][fMaxSlot], GetFactionStatus(i));
	Dialog_Show(playerid, DIALOG_FACTIONS1, DIALOG_STYLE_MSGBOX, "Info", string, "HQ", "Close");
	SelectedFaction[playerid] = i;
	return 1;
}
Dialog:DIALOG_FACTIONS1(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	if(Iter_Contains(PlayerInRace, playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong duoc phep su dung lenh nay khi ban dang o trong dau truong dua xe!");
	if(CP[playerid] != 0 || targetfind[playerid] != -1) return Dialog_Show(playerid, DIALOG_CHECKPOINT, DIALOG_STYLE_MSGBOX, "Checkpoint", "Mot cham do dang hoat dong.\nBan co muon xoa no khong? Neu muon, hay chon 'Ok'.", "Ok", "Exit");
	new i = SelectedFaction[playerid];
	SetPlayerCheckpointEx(playerid,DynamicFactions[i][extX], DynamicFactions[i][extY], DynamicFactions[i][extZ],4.0);
	SendClientMessage(playerid,COLOR_YELLOW, "Mot cham do da da duoc dat tren ban do tai vi tri ma ban da chon.");
	CP[playerid] = 43;	
	return 1;
}
Dialog:DIALOG_HRADIO(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new i = listitem, query[200];
	HouseInfo[PlayerInfo[playerid][pHouse]][hMusic] = i;
	format(query, sizeof(query), "UPDATE `houses` SET `Music`='%d' WHERE `ID`='%d'", i, PlayerInfo[playerid][pHouse]);
	mysql_query(SQL, query, false);
	SendClientMessage(playerid, COLOR_YELLOW, "Thay doi da duoc cap nhat thanh cong!");
	if(i == 0) return StopHouseRadio(PlayerInfo[playerid][pHouse]);			
	foreach(new x: Player) {
		if(InHouse[x] == PlayerInfo[playerid][pHouse]) {
			PlayAudioStreamForPlayer(x, RadioLink[HouseInfo[PlayerInfo[playerid][pHouse]][hMusic]]);
			PlayRadio[x] = i;
		}
	}
	return 1;
}
Dialog:DIALOG_BRADIO(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new i = listitem, query[200];
	BizzInfo[PlayerInfo[playerid][pBizz]][bRadio] = i;
	format(query, sizeof(query), "UPDATE `bizz` SET `Radio`='%d' WHERE `ID`='%d'", i, PlayerInfo[playerid][pBizz]);
	mysql_query(SQL, query, false);
	SendClientMessage(playerid, COLOR_YELLOW, "Thay doi da duoc cap nhat thanh cong!");
	if(i == 0) return StopBizRadio(PlayerInfo[playerid][pBizz]);			
	foreach(new x: Player) {
		if(InBussines[x] == PlayerInfo[playerid][pBizz]) {
			PlayAudioStreamForPlayer(x, RadioLink[BizzInfo[PlayerInfo[playerid][pBizz]][bRadio]]);
			PlayRadio[x] = i;
		}
	}
	return 1;
}
Dialog:DIALOG_PCOLOR(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new string[100], query[200];
	PlayerInfo[playerid][pColor] = listitem;
	format(query, sizeof(query), "UPDATE `users` SET `Color`='%d' WHERE `ID`='%d'", listitem, PlayerInfo[playerid][pSQLID]);
	mysql_query(SQL, query, false);			
	if(listitem == 0) return SendClientMessage(playerid, -1, "Ban da thay doi mau sac!");
	format(string, sizeof(string), "Mau sac ma ban chon lua la {%s}mau nay{FFFFFF}.", serverColors(listitem));
	SendClientMessage(playerid, -1, string);
	return 1;
}
Dialog:DIALOG_BET(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new suma = strval(inputtext);
	if(suma < 1000 || suma > 10000) return SendClientMessage(playerid, COLOR_GREY, "Ban co the dat it nhat la $1,000 va toi da la $10,000.");
	if(GetPlayerCash(playerid) < suma) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co so tien nay!");
	new string[100];
	GivePlayerCash(playerid, -suma);
	RaceBet[playerid] = suma;
	format(string, sizeof(string), "Ban cuoc $%s cho cuoc dua nay.", FormatNumber(suma));
	SendClientMessage(playerid, COLOR_MONEY, string);
	format(string, sizeof(string), "Dat cuoc: ~g~$%s", FormatNumber(suma));
	PlayerTextDrawSetString(playerid, RacePTD[1], string);
	PlayerTextDrawShow(playerid, RacePTD[1]);
	return 1;
}
Dialog:DIALOG_VOTERMAP(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new string[100];
	RaceVotes[listitem] ++;
	Voted[playerid] = 1;
	format(string, sizeof(string), "Ban da bo phieu cho map %s.", RaceMapName(listitem));
	SendClientMessage(playerid, COLOR_CLIENT, string);
	return 1;
}
Dialog:DIALOG_COLIZIUNI(playerid, response, listitem, inputtext[]) 
{
	Voted2[playerid] = 1;
	if(!response) SendClientMessage(playerid, COLOR_CLIENT, "Ban khong bo phieu cho che do Va cham!");
	else {
		SendClientMessage(playerid, COLOR_CLIENT, "Ban da bo phieu cho che do Va cham!");
		RaceVotes[5] ++;
	}
	return 1;
}
Dialog:DIALOG_VOTE(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	MapVotes[PaintType[playerid]-1][listitem] ++;
	Voted[playerid] = 1;
	new string[140];
	format(string, sizeof(string), "%s da bo phieu cho ban do %s.", GetName(playerid), MapName2(listitem));
	SendPaintMessage(PaintType[playerid], COLOR_CLIENT, string);
	return 1;
}
Dialog:DIALOG_CARRADIO(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new i = listitem;
	if(i == 0) {
		if(CarRadio[GetPlayerVehicleID(playerid)] == 0) return 1;
		else StopAudioStreamForPlayersInCar(GetPlayerVehicleID(playerid)), CarRadio[GetPlayerVehicleID(playerid)] = 0;
		return 1;
	}
	foreach(new x: Player) {
		if(IsPlayerInAnyVehicle(x) && GetPlayerVehicleID(x) == GetPlayerVehicleID(playerid)) PlayRadio[x] = i;
	}			
	if(i == sizeof(RadioLink)) {
		Dialog_Show(playerid, DIALOG_CARRADIO2, DIALOG_STYLE_INPUT, "Youtube custom URL", "Nhap lien ket videoclip youtube vao ben duoi:", "Ok", "Exit");
	}
	else {							
		new string[100];
		PlayAudioStreamForPlayersInCar(GetPlayerVehicleID(playerid), RadioLink[i]);
		format(string, sizeof(string), "* %s nghe radio %s.", GetName(playerid), RadioNames[i]);
		NearMessage(playerid, COLOR_PURPLE, string);	
		CarRadio[GetPlayerVehicleID(playerid)] = i;
	}	
	return 1;
}
Dialog:DIALOG_CARRADIO2(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	if(!IsPlayerInAnyVehicle(playerid)) return 1;
	/*if(strfind(inputtext, "youtube", true) != -1) { }
	else return SendClientMessage(playerid, COLOR_GREY, "Invalid link!");*/		
	new k = sizeof(RadioLink);
	new string[200];
	format(string, sizeof(string), "%s", inputtext);
	foreach(new x: Player) {
		if(IsPlayerInAnyVehicle(x) && GetPlayerVehicleID(x) == GetPlayerVehicleID(playerid)) {
			PlayRadio[x] = k; 
			PlayAudioStreamForPlayer(x, string);
		}	
	}			
	CarRadio[GetPlayerVehicleID(playerid)] = k;
	format(CarLink[GetPlayerVehicleID(playerid)], 256, string);
	return 1;
}
Dialog:DIALOG_BID(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	if(Licitatie == 0) return SendClientMessage(playerid, -1, "Khong co mot cuoc dau gia hoat dong!");
	new suma = SelectedMoney[playerid];
	if(GetPlayerCash(playerid) < TotalBani) return SendClientMessage(playerid, -1, "Ban khong co du tien!");
	if(GetPlayerCash(playerid) < suma) return SendClientMessage(playerid, -1, "Ban khong co du tien!");
	new string[200];
	if(suma < TotalBani+50000 && TotalBani != 0) {
		format(string, sizeof(string), "So tien khong hop le! Tien chao gia toi thieu la $%s.", FormatNumber(TotalBani+50000));
		SendClientMessage(playerid, COLOR_GREY, string);
		return 1;
	}				
	TotalBani = suma;
	TotalMoney[playerid] = suma;
	LastPlayer = playerid;
	if(toglicitatie[playerid] == 0) {
		toglicitatie[playerid] = 1;
		SendClientMessage(playerid, COLOR_YELLOW, "May chu se tu dong cho phep ban xem thong bao dau gia.");
		UpdateVar(playerid, "TogLicitatie", 1);
	}
	format(string, sizeof(string), "[BID] %s chao gia so tien $%s.", GetName(playerid), FormatNumber(suma));
	MesajLicitatie(0x7A45FFFF, string);
	return 1;
}
Dialog:DIALOG_QUITFACTION(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new string89[180];
	new id = playerid, reason, szQuery[256];
	format(szQuery, sizeof(szQuery), "SELECT * FROM `users` WHERE `Leader`='%d'", PlayerInfo[playerid][pMember]);
	new Cache: result = mysql_query(SQL, szQuery);
	reason = cache_num_rows ();
	cache_delete(result);
	FactionMembers[PlayerInfo[playerid][pMember]] --;
	new str[180];
	if(reason != 0) {
		format(string89, sizeof(string89), "%s roi khoi to chuc %s (rank %d) sau %d ngay (/quitfaction) cung voi 20 FP.", GetName(playerid),FactionName(PlayerInfo[playerid][pMember]),PlayerInfo[playerid][pRank],PlayerInfo[playerid][pDays]);
		mysql_format(SQL, szQuery, sizeof(szQuery), "INSERT INTO faction_logs (`text`,`player`,`leader`) VALUES ('%s','%d','%d')", string89, PlayerInfo[playerid][pSQLID], PlayerInfo[playerid][pSQLID]);
		mysql_tquery(SQL,szQuery,"","");
		PlayerInfo[playerid][pMember]=0;
		PlayerInfo[playerid][pLeader]=0;
		PlayerInfo[playerid][pRank] = 0;
		PlayerInfo[playerid][pChar] = 0;
		PlayerInfo[playerid][pFACWarns] = 0;
		PlayerInfo[playerid][pFpunish] = 20;
		format(str,sizeof(str),"UPDATE users SET `Member`='0',`Leader`='0',`Rank`='0',`CChar`='0',`FWarn`='0',`FPunish`='20',`Team`='3',`Days`='0' WHERE `ID`='%d'",PlayerInfo[playerid][pSQLID]);
		mysql_query(SQL,str);				
	}
	else {
		format(string89, sizeof(string89), "%s roi to chuc %s (rank %d) sau %d ngay (/quitfaction) khong mang theo fp, ly do: la lanh dao to chuc.", GetName(playerid),FactionName(PlayerInfo[playerid][pMember]),PlayerInfo[playerid][pRank],PlayerInfo[playerid][pDays]);
		mysql_format(SQL, szQuery, sizeof(szQuery), "INSERT INTO faction_logs (`text`,`player`,`leader`) VALUES ('%s','%d','%d')", string89, PlayerInfo[playerid][pSQLID], PlayerInfo[playerid][pSQLID]);
		mysql_tquery(SQL,szQuery,"","");
		PlayerInfo[playerid][pMember]=0;
		PlayerInfo[playerid][pLeader]=0;
		PlayerInfo[playerid][pRank] = 0;
		PlayerInfo[playerid][pChar] = 0;
		PlayerInfo[playerid][pFACWarns] = 0;
		PlayerInfo[playerid][pFpunish] = 0;				
		format(str,sizeof(str),"UPDATE users SET `Member`='0',`Leader`='0',`Rank`='0',`CChar`='0',`FWarn`='0',`FPunish`='0',`Team`='3',`Days`='0' WHERE `ID`='%d'",PlayerInfo[playerid][pSQLID]);
		mysql_query(SQL,str);	
		SendClientMessage(playerid, COLOR_YELLOW, "Ban khong bi Han che to chuc vi ban la leader!");
	}
	
	gTeam[playerid] = 3;
	PlayerInfo[playerid][pTeam] = 3;
	OnDuty[playerid] = 0;
	tazer[playerid] = 0;
	SetPlayerArmourEx(id, 0);
	SetPlayerSkinEx(id,PlayerInfo[playerid][pModel]);
	SetPlayerToTeamColor(id);
	PlayerInfo[playerid][pCommands][0] = 0;

	format(szQuery, sizeof(szQuery), "UPDATE `users` SET `Commands`='%d' WHERE `ID`='%d'", PlayerInfo[playerid][pCommands][0], PlayerInfo[playerid][pSQLID]);
	mysql_query(SQL, szQuery);
	SpawnPlayer(id);
	return 1;
}
Dialog:DIALOG_MODE(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new string[200];
	PaintType[playerid] = listitem+1;
	PKills[playerid] = 0, PDeaths[playerid] = 0;
	format(string, sizeof(string), "%s da buoc vao dau truong paintball.", GetName(playerid));
	SendPaintMessage(listitem+1, COLOR_YELLOW, string);
	PlayerTextDrawHide(playerid, PaintTD);
	ResetPlayerWeapons(playerid);
	PaintSpawn(playerid);

	foreach(new i: Player) {
		if(PaintType[i] != 0) PKills[i] = 0, PDeaths[i] = 0;
	}
	if(PlayersOnPaint(listitem) == 2) {	
		PaintTime[listitem] = -1;
		PaintText[listitem] = 60;
		SendPaintMessage(listitem+1, COLOR_YELLOW, "Round moi se bat dau sau 1 phut. De bo phieu cho mot ban do, su dung lenh /votemap.");
		PaintVote[listitem] = 1;	
		if(PaintTimer[listitem] != Timer:0) {
			stop PaintTimer[listitem];
			PaintTimer[listitem] = Timer:0;
		}
		PaintTimer[listitem] = defer CalculateVote(listitem);
	}
	else if(PlayersOnPaint(listitem) < 2) SendClientMessage(playerid, COLOR_YELLOW, "De bat dau round moi, can phai co it nhat 2 nguoi choi.");
	return 1;
}
Dialog:DIALOG_CHECKPOINT(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	if(Iter_Contains(PlayerInRace, playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Checkpoint nay thuoc ve Truong Dua va ban khong the xoa no!");
	if(CP[playerid] == 50) return SendClientMessage(playerid,COLOR_WHITE, "Checkpoint do la CP rob.");
	if(DrivingTest[playerid] == 1 && CP[playerid] == 1) {
		DMV_End(playerid, 1), 
		GUI_DestroyCurrentUI(playerid);
	}
	DisablePlayerRaceCheckpointEx(playerid);
	targetfind[playerid] = -1;
	CP[playerid] = 0;
	UsedFind[playerid] = 0;		

	DisablePlayerCheckpointEx(playerid);
	SendClientMessage(playerid,COLOR_WHITE,"Checkpoint da duoc xoa thanh cong.");
	PlayerTextDrawHide(playerid, FindTD);
	PlayerTextDrawHide(playerid, JobTD);
	PlayerTextDrawHide(playerid, InfosTD);
	DisablePlayerCheckpointEx(playerid);	
	if(CP[playerid] == 177 || CP[playerid] == 178) {
		RemovePlayerAttachedObject(playerid, ATTACHMENT_ID_BALE);
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		ApplyAnimation(playerid, #CARRY, #crry_prtial, 4.0, 0, 0, 0, 0, 0);
		if(IsValidPlayerObject(playerid, plant[playerid])) DestroyPlayerObject(playerid, plant[playerid]);
		ClearAnimations(playerid); TogglePlayerControllable(playerid, true);
	}
	if(JobWorking[playerid] == 1) {
		SendClientMessage(playerid, COLOR_GREY, "Cong viec that bai!");
		SetPlayerSpecialAction(playerid, 0);
		if(playerObject[playerid] != 0) DestroyPlayerObject(playerid, playerObject[playerid]), playerObject[playerid] = 0;
		if(playerObject2[playerid] != 0) DestroyObject(playerObject2[playerid]), playerObject2[playerid] = 0;
		JobWorking[playerid] = 0;
		PlayerTextDrawHide(playerid, JobTD);
		if(JobVehicle[playerid] != 0) { DestroyVehicle(JobVehicle[playerid]); JobVehicle[playerid] = 0; }
		if(Trailer[playerid] != 0) { DestroyVehicle(Trailer[playerid]); Trailer[playerid] = 0; }
		PlayerTextDrawHide(playerid, InfosTD);
		DisablePlayerCheckpointEx(playerid);
		DisablePlayerRaceCheckpointEx(playerid);
		CP[playerid] = 0;
		JobVehicle[playerid] = 0;
		Iter_Remove(IsSpeed, playerid);		
		RemovePlayerAttachedObject(playerid, 2);
		RemovePlayerAttachedObject(playerid, 6);
		JobDeelay[playerid][PlayerInfo[playerid][pJob]] = 100;
		DestroyWoodObject(playerid);
		if(PlayerInfo[playerid][pJob] == 3) ResetWeapons(playerid);
		SetPlayerSpecialAction(playerid, 0);
	}	
	JobLeftTime[playerid] = 0;
	return 1;
}
/*Dialog:DIALOG_FISH(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	// if(DeelayCommand[playerid][7] > 0) return NightBot(playerid, "Teleport #1");
	if(TimpMateriale[playerid] == 1) return Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Ban ca", "ERROR: Ban khong the ban mot con ca qua nhanh, hay tro lai sau!", "Ok", "Cancel");
	if(pFishess[playerid] == 0) return NightBot(playerid, "Dialog Cheat #1");
	// DeelayCommand[playerid][7] = 60*32;
	new string[200];
	// new skin = GetPlayerSkin(playerid), 
	
	new totalmony = 0;
	// if(skin == 170 || skin == 188 || skin == 249 || skin == 159 || skin == 260) {
	// 	format(string, sizeof(string), "Skin HIEM: +$%s [10%s].", FormatNumber(FishPrice[playerid]/4), "%%");
	// 	SendClientMessage(playerid, COLOR_YELLOW, string);
	// 	totalmony += FishPrice[playerid]/4;
	// }
	// else if(skin == 228 || skin == 248 || skin == 264 || skin == 189 || skin == 185 || skin == 146) {
	// 	format(string, sizeof(string), "Skin SIEU HIEM: +$%s [25%s].", FormatNumber(FishPrice[playerid]/3), "%%");
	// 	SendClientMessage(playerid, COLOR_YELLOW, string);
	// 	totalmony += FishPrice[playerid]/3;
	// }
	// else if(skin == 0 || skin == 104 || skin == 116 || skin == 149 || skin == 164 || skin == 285 || skin == 289 || skin == 294 || skin == 293 || skin == 306) {
	// 	format(string, sizeof(string), "Skin HUYEN THOAI: +$%s [50%s].", FormatNumber(FishPrice[playerid]/2), "%%");
	// 	SendClientMessage(playerid, COLOR_YELLOW, string);
	// 	totalmony += FishPrice[playerid]/2;
	// }
	// else if(skin == 124 || skin == 181 || skin == 187 || skin == 241 || skin == 242 || skin == 292 || skin == 309) {
	// 	format(string, sizeof(string), "Skin SIEU VIET: +$%s [75%s].", FormatNumber(FishPrice[playerid] - 10000), "%%");
	// 	SendClientMessage(playerid, COLOR_YELLOW, string);
	// 	totalmony += FishPrice[playerid] - 10000;
	// }
	format(string, 35,"Ban nhan duoc $%s!", FormatNumber(FishPrice[playerid] + totalmony));
	UpdateJobGoal(FishPrice[playerid], MAXGOAL);
	SendClientMessage(playerid, COLOR_YELLOW, string);
	new bonus = 0;
	if(TodayJob == 11 || TodayJob == 15) {
		bonus = JobInfo[PlayerInfo[playerid][pJob]][jBonus]*(FishPrice[playerid]/100);
		format(string, 130, "Ban nhan them $%s Fisherman Bonus. Tong nhan duoc: $%s.", FormatNumber(bonus), FormatNumber(totalmony+bonus+FishPrice[playerid]));
		SendClientMessage(playerid, COLOR_GOLD, string);
	}
	new const totalCash = totalmony + bonus + FishPrice[playerid];
	GivePlayerCash(playerid, totalCash);	
	format(string, sizeof(string), "%s da nhan duoc $%s cho cong viec %s.", GetName(playerid), FormatNumber(totalCash), JobInfo[PlayerInfo[playerid][pJob]][jName]);

	//InsertLog(playerid, string, LOG_MONEY);
	Update(playerid, pCashx);
	FishPrice[playerid] = 0;
	pFishess[playerid] = 0;
	PlayerInfo[playerid][pFishSkill] ++;
	UpdateVar(playerid, "FishSkill", PlayerInfo[playerid][pFishSkill]);
	if(PlayerInfo[playerid][pFishSkill] == 50)
	{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 2. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
	else if(PlayerInfo[playerid][pFishSkill] == 100)
	{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 3. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
	else if(PlayerInfo[playerid][pFishSkill] == 200)
	{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 4. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
	else if(PlayerInfo[playerid][pFishSkill] == 400)
	{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 5. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
	if(togjob[playerid] == 0) {
		JobProgress(playerid);
	}
	CheckNhiemVuCapDo(playerid);
	if(GetPlayerSkill(playerid) == 5) finishAchievement(playerid, 0);
	if(PlayerInfo[playerid][pMember] == 0) {
		for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
			if(PlayerInfo[playerid][pDailyMission][m] == 15 || PlayerInfo[playerid][pDailyMission][m] == 16) CheckMission(playerid, m);
		}					
	}
	for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
		if(PlayerInfo[playerid][pDailyMission][m] == 2) CheckMission(playerid, m);
	}				
	return 1;
}*/
Dialog:DIALOG_KIEMTRANHIEMVU(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	switch(listitem) {
		case 0: {
			new status1[21], status2[21], status3[21], stringmsg1[200],stringmsg2[200],stringmsg3[200],stringmsg4[200],stringmsg5[250];
			if(PlayerInfo[playerid][pProgress][0] >= GetNeedProgress(playerid, 0)) format(status1, 21, "Nhiem vu da hoan tat");
			else format(status1, 10, "%d/%d", PlayerInfo[playerid][pProgress][0], GetNeedProgress(playerid, 0));
			if(PlayerInfo[playerid][pProgress][1] >= GetNeedProgress(playerid, 1)) format(status2, 21, "Nhiem vu da hoan tat");
			else format(status2, 10, "%d/%d", PlayerInfo[playerid][pProgress][1], GetNeedProgress(playerid, 1));
			if(PlayerInfo[playerid][pProgress][2] >= GetNeedProgress(playerid, 2)) format(status3, 21, "Nhiem vu da hoan tat");
			else format(status3, 10, "%d/%d", PlayerInfo[playerid][pProgress][2], GetNeedProgress(playerid, 2));
			format(stringmsg1, sizeof(stringmsg1), "(1) {fced42}%s{ffffff} (Tien do: {00FF23}%s{ffffff})", missionName(playerid, PlayerInfo[playerid][pDailyMission][0], 0), status1);
			format(stringmsg2, sizeof(stringmsg2), "(2) {fced42}%s{ffffff}  (Tien do: {00FF23}%s{ffffff})", missionName(playerid, PlayerInfo[playerid][pDailyMission][1], 1), status2);
			format(stringmsg3, sizeof(stringmsg3), "(3) {fced42}%s{ffffff}  (Tien do: {00FF23}%s{ffffff})", missionName(playerid, PlayerInfo[playerid][pDailyMission][2], 1), status2);
			format(stringmsg4, sizeof(stringmsg4), "(Phan Thuong) : 1 RP va > $50.000", stringmsg3);
			format(stringmsg5, sizeof(stringmsg5), "%s\n%s\n%s\n%s",stringmsg1,stringmsg2,stringmsg3,stringmsg4);
			Dialog_Show(playerid, DIALOG_KIEMTRANHIEMVU, DIALOG_STYLE_MSGBOX, "KIEM TRA NHIEM VU",stringmsg5, "Co", "Huy Bo");
		}		
		case 1: {
            //showQuestWeek(playerid);
        }
	}
	return 1;
}
Dialog:DIALOG_TOG(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	switch(listitem) {
		case 0: {
			if(NewbieChat[playerid] == 0) {
				if(PlayerInfo[playerid][pHelper] >= 1) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the tat vi ban la Helper.");
				NewbieChat[playerid] = 1;
			}
			else NewbieChat[playerid] = 0;
			UpdateVar(playerid, "NewbieChat", NewbieChat[playerid]);
		}
		case 1: {
			if(PlayerInfo[playerid][pLeader] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong phai la lanh dao!");
			if(toglc[playerid] == 0) toglc[playerid] = 1;
			else toglc[playerid] = 0;
			UpdateVar(playerid, "TogLC", toglc[playerid]);
		}
		case 2: {
			if(PlayerInfo[playerid][pMember] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong o trong mot to chuc!");
			if(gFam[playerid] == 0) gFam[playerid] = 1;
			else gFam[playerid] = 0;
			UpdateVar(playerid, "TogFC", gFam[playerid]);
		}
		case 3: {
			if(WTToggle[playerid] == 0) WTToggle[playerid] = 1;
			else WTToggle[playerid] = 0;
			UpdateVar(playerid, "TogWT", WTToggle[playerid]);
		}
		case 4: {
			if(HidePM[playerid] == 1) HidePM[playerid] = 0;
			else HidePM[playerid] = 1;
			UpdateVar(playerid, "HidePM", HidePM[playerid]);
		}
		case 5: {
			if(gOoc[playerid] == 0) gOoc[playerid] = 1;
			else gOoc[playerid] = 0;
		}
		case 6: {
			if(gNews[playerid] == 0) gNews[playerid] = 1;
			else gNews[playerid] = 0;
			UpdateVar(playerid, "TogNews", gNews[playerid]);
		}
		case 7: {
			if(toglicitatie[playerid] == 0) toglicitatie[playerid] = 1, SendClientMessage(playerid, COLOR_YELLOW, "De xem thong tin dau gia, hay su dung /info.");
			else toglicitatie[playerid] = 0;	
			UpdateVar(playerid, "TogLicitatie", toglicitatie[playerid]);		
		}
		case 8: {
			if(togclan[playerid] == 0) togclan[playerid] = 1;
			else togclan[playerid] = 0;
			UpdateVar(playerid, "TogClan", togclan[playerid]);	
		}		
		case 9: {
			if(PlayerInfo[playerid][pAdmin] < 5) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the su dung muc nay!");
			if(GetPVarInt(playerid, "Undercover") == 0) {
				SetPVarInt(playerid, "Undercover", 1);
				SendClientMessage(playerid, COLOR_WHITE, "Ban da duoc cai trang.");
				foreach(new i: Player) ShowPlayerNameTagForPlayer(playerid, i, false);
			}
			else {
				SetPVarInt(playerid, "Undercover", 0);
				SendClientMessage(playerid, COLOR_WHITE, "Ban khong con cai trang nua.");
				foreach(new i: Player) ShowPlayerNameTagForPlayer(playerid, i, true);
			}				
		}
		case 10: {
			if(togevent[playerid] == 0) togevent[playerid] = 1;
			else togevent[playerid] = 0;
			UpdateVar(playerid, "TogEvent", togevent[playerid]);
		}	
		case 11: {
			if(togding[playerid] == 0) togding[playerid] = 1;
			else togding[playerid] = 0;		
			UpdateVar(playerid, "TogDing", togding[playerid]);		
		}
		case 12: {
			if(togsurf[playerid] == 0) togsurf[playerid] = 1;
			else togsurf[playerid] = 0;		
			UpdateVar(playerid, "TogSurf", togsurf[playerid]);		
		}	
		case 13: {
			if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid,COLOR_WHITE,AdminOnly);
			if(togfind[playerid] == 0) togfind[playerid] = 1;
			else togfind[playerid] = 0;		
			UpdateVar(playerid, "TogFind", togfind[playerid]);		
		}	
		case 14: {
			if(tograport[playerid] == 0) tograport[playerid] = 1;
			else tograport[playerid] = 0;		
			UpdateVar(playerid, "TogRaport", tograport[playerid]);					
		}
		case 15: {
			if(togjob[playerid] == 0) togjob[playerid] = 1;
			else togjob[playerid] = 0;		
			UpdateVar(playerid, "TogJob", togjob[playerid]);					
		}				
		case 16: {
			if(togvip[playerid] == 0) togvip[playerid] = 1;
			else togvip[playerid] = 0;		
			UpdateVar(playerid, "TogVip", togvip[playerid]);		
		}							
	}
	SendClientMessage(playerid, 0xFFADADFF, "Thay doi da duoc cap nhat thanh cong!");
	return 1;
}
Dialog:DIALOG_EDITMOBILA(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	SlotSel[playerid] = listitem;
	Dialog_Show(playerid, DIALOG_EDITMOBILA2, DIALOG_STYLE_LIST, "Thiet lap", "Dat ten cho noi that\nXoa\nChinh sua", "Ok", "Cancel");
	return 1;
}
Dialog:DIALOG_EDITMOBILA2(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new id = SelMobila[playerid][SlotSel[playerid]];
	EditedObjectID[playerid] = id;
	EditHouse[playerid] = 2;
	new string[128];
	new obj2 = FurnitureInfo[id][fiObject];
	switch(listitem) {
		case 0: Dialog_Show(playerid, DIALOG_OBIECTNAME, DIALOG_STYLE_INPUT, "Ten cua do noi that", "Nhap ten ma ban muon dat cho Object.\nNhieu nhat 64 ky tu va it nhat la 3.", "Ok", "Back");
		case 1: {
			mysql_format(SQL, string,128,"DELETE FROM `fobjects` WHERE `ID`='%d'",id);
			mysql_query(SQL, string);
			SendClientMessage(playerid, COLOR_YELLOW, "Object da duoc xoa.");
			DestroyDynamicObject(FurnitureInfo[id][fiObject]);
			FurnitureInfo[id][fiHouse] = 0;
		}
		case 2: {
			EditHouse[playerid] = 2;
			SendClientMessage(playerid, COLOR_YELLOW, "Object da duoc nap de ban co the chinh sua.");
			SendClientMessage(playerid, COLOR_YELLOW, "Ban co the duy chuyen camera bang phim SPACE, chinh vi tri bang cach giu cac truc (X,Y,Z)");
			SendClientMessage(playerid, COLOR_YELLOW, "Neu ban khong the duy chuyen cac truc, hay mo samp.exe bang quyen quan tri vien (Run As Administrator).");
			EditDynamicObject(playerid, obj2);
		}
	}	
	return 1;
}
Dialog:DIALOG_OBIECTNAME(playerid, response, listitem, inputtext[]) 
{
	if(!response) return Dialog_Show(playerid, DIALOG_EDITMOBILA2, DIALOG_STYLE_LIST, "Thiet lap", "Dat ten cho noi that\nXoa\nChinh sua", "Ok", "Cancel");
	if(strlen(inputtext) < 3 || strlen(inputtext) > 64) return Dialog_Show(playerid, DIALOG_OBIECTNAME, DIALOG_STYLE_INPUT, "Object name", "Nhap ten ma ban dat cho object.\nERROR: Toi da 64 ky tu va it nhat la 3.", "Ok", "Back");
	new id = SelMobila[playerid][SlotSel[playerid]];
	new string[100];
	format(FurnitureInfo[id][fiName], 64, inputtext);
	format(string, sizeof(string), "Ten cua object slot %d da duoc dat thanh %s.", SlotSel[playerid]+1, inputtext);
	SendClientMessage(playerid, COLOR_YELLOW, string);
	format(string, sizeof(string), "UPDATE `fobjects` SET `Name`='%s' WHERE `ID`='%d'", inputtext, id);
	mysql_query(SQL, string);
	return 1;
}
Dialog:DIALOG_FACTION(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	SelectedRank[playerid] = listitem;
	Dialog_Show(playerid, DIALOG_FACTION1, DIALOG_STYLE_INPUT, "He thong bao cao:", "Nhap so luong cong viec ma ban muon thanh vien trong rank nay thuc hien!", "Chon", "Tro ve");
	return 1;
}
Dialog:DIALOG_FACTION1(playerid, response, listitem, inputtext[]) 
{
	new ffID = GetPVarInt(playerid, "Faction");
	new string[200];
	if(!response) {
		format(string, sizeof(string), "Rank 1\t%d\nRank 2\t%d\nRank 3\t%d\nRank 4\t%d\nRank 5\t%d\nRank 6\t%d", FactionInfo[ffID][fRank1], FactionInfo[ffID][fRank2],
		FactionInfo[ffID][fRank3], FactionInfo[ffID][fRank4], FactionInfo[ffID][fRank5], FactionInfo[ffID][fRank6]);
		Dialog_Show(playerid, DIALOG_FACTION, DIALOG_STYLE_TABLIST, "He thong bao cao:", string, "Select", "Back");
		return 1;
	}
	format(string, sizeof(string), "So luong cong viec ma thanh vien rank %d phai thuc hien trong to chuc %s, bay gio la: %d", SelectedRank[playerid]+1, FactionName(ffID), strval(inputtext));
	SendClientMessage(playerid, -1, string);
	switch(SelectedRank[playerid]) {
		case 0: FactionInfo[ffID][fRank1] = strval(inputtext);
		case 1: FactionInfo[ffID][fRank2] = strval(inputtext);
		case 2: FactionInfo[ffID][fRank3] = strval(inputtext);
		case 3: FactionInfo[ffID][fRank4] = strval(inputtext);
		case 4: FactionInfo[ffID][fRank5] = strval(inputtext);
		case 5: FactionInfo[ffID][fRank6] = strval(inputtext);
	}
	format(string, sizeof(string), "UPDATE `factions` SET `Rank1`='%d', `Rank2`='%d', `Rank3`='%d', `Rank4`='%d', `Rank5`='%d', `Rank6`='%d' WHERE `ID`='%d'",
	FactionInfo[ffID][fRank1], FactionInfo[ffID][fRank2], FactionInfo[ffID][fRank3], FactionInfo[ffID][fRank4], FactionInfo[ffID][fRank5], FactionInfo[ffID][fRank6], ffID);
	mysql_query(SQL, string);
	return 1;
}
Dialog:DIALOG_MEMBERS(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	if(PlayerInfo[playerid][pRank] < 6) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban can rank 6+ de thuc hien thao tac nay!");
	new szQuery[256], rank, string[150];
	format(pName[playerid], 256, Selected[playerid][listitem]);	
	format(szQuery, sizeof(szQuery), "SELECT * FROM `users` WHERE `name`='%s'", pName[playerid]);
	new Cache: result = mysql_query(SQL, szQuery);
	if(cache_num_rows()) cache_get_value_name_int(0, "Rank", rank);
	if(rank == 7)  return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Khong the thay doi nguoi lanh dao!");
	cache_delete(result);						
	format(string, sizeof(string), "Member: %s", pName[playerid]);
	Dialog_Show(playerid, DIALOG_MEMBERS1, DIALOG_STYLE_LIST, string, "Bao cao\nRank\nFaction warn (canh bao to chuc)\nXoa faction warn\nMoi ra", "Ok", "Back");
	return 1;
}
Dialog:DIALOG_RAPORTS(playerid, response, listitem, inputtext[]) 
{
	if(!response) return ShowFactionMembers(playerid);
	return 1;
}
Dialog:DIALOG_MEMBERS1(playerid, response, listitem, inputtext[]) 
{
	new szQuery[256], str[256], Memberstring[400], name[MAX_PLAYER_NAME], string[200];
	if(!response) return ShowFactionMembers(playerid);
	new userID = GetPlayerID(pName[playerid]);
	if(PlayerInfo[playerid][pRank] < 6) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban can rank 6+ de thuc hien thao tac nay!");
	switch(listitem) {
		case 0: {
			new rank[64], fw[64];
			format(szQuery, sizeof(szQuery), "SELECT * FROM `users` WHERE `name`='%s'", pName[playerid]);
			new Cache: result = mysql_query(SQL, szQuery);
			if(!IsACop(playerid)) {
				new cmds[3];
				for(new i, j = cache_num_rows (); i != j; ++i)
				{
					cache_get_value_name(i, "name", name);
					cache_get_value_name_int(i, "Commands", cmds[0]);
					cache_get_value_name_int(i, "InvalidCommands", cmds[1]);
					cache_get_value_name_int(i, "Fires", cmds[2]);
					cache_get_value_name(i, "Rank", rank); 
					cache_get_value_name(i, "FWarn", fw);

					if(PlayerInfo[playerid][pMember] == 13) format(string, sizeof(string), "Ten: %s\nRank: %s\nFaction warns: %s\nLenh: %d/%d\nLan chua chay: %d\nLenh khong hop le: %d", name, rank, fw, cmds[0], GetNeedPointsR2(strval(rank), PlayerInfo[playerid][pMember]), cmds[2], cmds[1]);
					else format(string, sizeof(string), "Ten: %s\nRank: %s\nFaction warns: %s\nLenh: %d/%d\nLenh khong hop le: %d", name, rank, fw, cmds[0], GetNeedPointsR2(strval(rank), PlayerInfo[playerid][pMember]), cmds[1]);
					
					strcat(Memberstring, string);
				}
				cache_delete(result);
			}
			else {
				new cmds[6];
				for(new i, j = cache_num_rows (); i != j; ++i)
				{
					cache_get_value_name(i, "name", name);
					cache_get_value_name_int(i, "Commands", cmds[0]);
					cache_get_value_name_int(i, "Commands2", cmds[1]);
					cache_get_value_name_int(i, "Commands3", cmds[2]);
					cache_get_value_name_int(i, "Commands4", cmds[3]);
					cache_get_value_name_int(i, "Commands5", cmds[4]);
					cache_get_value_name_int(i, "InvalidCommands", cmds[5]);
					cache_get_value_name(i, "Rank", rank);
					cache_get_value_name(i, "FWarn", fw);

					format(string, sizeof(string), "Ten: %s\nRank: %s\nFaction warns: %s\nRunners: %d\nBat giu: %d\nPhat tien: %d\nGiay phep da tich thu: %d\nThuoc phien da tich thu: %d\nLenh khong hop le: %d", name, rank, fw, cmds[0], cmds[1], cmds[2], cmds[3], cmds[4], cmds[5]);
					strcat(Memberstring, string);
				}
				cache_delete(result);	
			}
			Dialog_Show(playerid, DIALOG_RAPORTS, DIALOG_STYLE_MSGBOX, "Cac bao cao", Memberstring, "Ok", "Back");					
		}
		case 1: {
			if(PlayerInfo[playerid][pRank] < 7) return SendClientMessage(playerid, COLOR_LIGHTRED, "Chi lanh dao moi co the give rank");
			format(string, sizeof(string), "Nhap rank ma ban muon set cho %s.", pName[playerid]);
			Dialog_Show(playerid, DIALOG_MEMBERS2, DIALOG_STYLE_INPUT, "Give rank", string, "Ok", "Close");
		}
		case 2: {					
			format(szQuery, sizeof(szQuery), "SELECT * FROM `users` WHERE `name`='%s'", pName[playerid]);
			new Cache: result = mysql_query(SQL, szQuery);
			new fw, days, rank, id;
			cache_get_value_name_int(0, "FWarn", fw);
			cache_get_value_name_int(0, "Days", days);
			cache_get_value_name_int(0, "Rank", rank);
			if(PlayerInfo[playerid][pRank] == 6 && rank >= 6) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the give FW cho thanh vien Rank 6+!");
			cache_get_value_name_int(0, "id", id);				
			cache_delete(result);
			fw++;
			
			format(string, sizeof(string), "%s give cho %s 1 diem Canh Cao To Chuc.", GetName(playerid), pName[playerid]);
			SendFactionMessage(PlayerInfo[playerid][pMember], COLOR_CLIENT, string);
			
			mysql_format(SQL,str,128,"UPDATE `users` SET `FWarn`='%d' WHERE `name`='%s' LIMIT 1",fw,pName[playerid]);
			mysql_tquery(SQL,str, "", "");
			if(userID != INVALID_PLAYER_ID) {
				PlayerInfo[userID][pFACWarns] = fw;						
			}
			if(fw >= 3)
			{
				FactionMembers[PlayerInfo[playerid][pMember]] --;
				format(string, sizeof(string), "Ban da bi moi ra khoi to chuc %s (rank %d) sau %d ngay boi %s, ly do: 3/3 Canh cao to chuc", FactionName(PlayerInfo[playerid][pMember]), rank, days, GetName(playerid));
				InsertEmail(pName[playerid], GetName(playerid), string, 0);
				if(userID != INVALID_PLAYER_ID) {
					PlayerInfo[userID][pFACWarns] = 0;	
					PlayerInfo[userID][pMember] = 0;
					PlayerInfo[userID][pRank] = 0;
					PlayerInfo[userID][pFpunish] = 20;
					PlayerInfo[userID][pDays] = 0;
					PlayerInfo[userID][pChar] = 47;
					PlayerTextDrawHide(userID, WarTime);
					SetPlayerSkinEx(userID, 47);
					SpawnPlayer(userID); 
					format(string, sizeof(string), "Ban da bi sa thai khoi to chuc %s boi AdmBot, ly do: 3/3 Canh cao to chuc.", FactionName(PlayerInfo[playerid][pMember]));
					Dialog_Show(userID, 0, DIALOG_STYLE_MSGBOX, "Uninvite", string, "Close", "");							
				}					
				format(string, sizeof(string), "%s da bi sa thai khoi to chuc boi Admbot, ly do: 3/3 Canh cao to chuc.", pName[playerid]);
				SendFactionMessage(PlayerInfo[playerid][pMember], COLOR_CLIENT, string);
			
				new string89[200];
				format(string89, sizeof(string89), "%s da bi lanh dao %s sa thai khoi %s (rank %d) sau %d ngay.", pName[playerid],GetName(playerid),FactionName(PlayerInfo[playerid][pMember]),rank, days);
				mysql_format(SQL, string89, sizeof(string89), "INSERT INTO faction_logs (`text`,`player`,`leader`) VALUES ('%s','%d','%d')", string89, id, PlayerInfo[playerid][pSQLID]);
				mysql_tquery(SQL,string89,"","");							
				mysql_format(SQL,str,sizeof(str),"UPDATE `users` SET `Member`='0',`Rank`='0',`CChar`='250',`FPunish`='20',`FWarn`='0',`Leader`='0',`Days`='0' WHERE `name`='%s' LIMIT 1",pName[playerid]);
				mysql_tquery(SQL,str, "", "");
			}
		}
		case 3: {
			format(szQuery, sizeof(szQuery), "SELECT * FROM `users` WHERE `name`='%s'", pName[playerid]);
			new Cache: result = mysql_query(SQL, szQuery);
			new fw;
			cache_get_value_name_int(0, "FWarn", fw);
			cache_delete(result);
			if(fw == 0) return SendClientMessage(playerid, -1, "Thanh vien nay khong co FW.");
			format(string, sizeof(string), "%s xoa FW cho %s.", GetName(playerid), pName[playerid]);
			SendFactionMessage(PlayerInfo[playerid][pMember], COLOR_CLIENT, string);			
			mysql_format(SQL,str,128,"UPDATE `users` SET `FWarn`='%d' WHERE `name`='%s' LIMIT 1",fw-1,pName[playerid]);
			mysql_tquery(SQL,str, "", "");
		}
		case 4: {
			format(string, sizeof(string), "Uninvite %s", pName[playerid]);
			Dialog_Show(playerid, DIALOG_REASON, DIALOG_STYLE_INPUT, string, "Viet ra ly do ban muon sa thai nguoi choi nay.", "Ok", "Close");				
		}
	}
	return 1;
}
Dialog:DIALOG_REASON(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new string[200];
	SetPVarString(playerid, "Reason", inputtext);
	format(string, sizeof(string), "Uninvite %s", pName[playerid]);
	Dialog_Show(playerid, DIALOG_MEMBERS3, DIALOG_STYLE_INPUT, string, "Nhap ly do ma ban sa thai thanh vien nay.\nMot thanh vien o trong to chuc hon 7 ngay, khi bi sa thai se khong nhan FP", "Ok", "Close");
	return 1;
}
Dialog:DIALOG_MEMBERS2(playerid, response, listitem, inputtext[]) 
{
	new str[180];
	if(!response) return 1;
	new userID = GetPlayerID(pName[playerid]);
	new rank = strval(inputtext), string[200];
	if(rank < 1 || rank > 6) return SendClientMessage(playerid, -1, "Rank khong hop le.");
	format(string, sizeof(string), "%s da give %d rank %d.", GetName(playerid), pName[playerid], rank);
	SendFactionMessage(PlayerInfo[playerid][pMember], COLOR_CLIENT, string);	
	if(userID != INVALID_PLAYER_ID) PlayerInfo[userID][pRank] = rank;
	mysql_format(SQL, str,128,"UPDATE `users` SET `Rank`='%d' WHERE `name`='%s' LIMIT 1",rank,pName[playerid]);
	mysql_tquery(SQL, str, "", "");
	format(string, sizeof(string), "Duoc set rank %d.", rank);
	FactionLog(PlayerInfo[playerid][pMember],pName[playerid],string);
	return 1;
}
Dialog:DIALOG_MEMBERS3(playerid, response, listitem, inputtext[]) 
{
	new str[500];
	if(!response) return 1;
	new fp = strval(inputtext), string[200], query[320];
	if(fp > 20) fp = 20;
	new userID = GetPlayerID(pName[playerid]), szQuery[256], reason[64];
	GetPVarString(playerid, "Reason", reason, 64);
	if(userID != INVALID_PLAYER_ID) SendClientMessage(playerid, -1, "Nguoi choi do khong dang nhap.");
	format(szQuery, sizeof(szQuery), "SELECT * FROM `users` WHERE `name`='%s'", pName[playerid]);
	new Cache: result = mysql_query(SQL, szQuery);
	new id, rank, days;
	cache_get_value_name_int(0, "id", id);
	cache_get_value_name_int(0, "Rank", rank);
	cache_get_value_name_int(0, "Days", days); 	
	cache_delete(result);
	if(PlayerInfo[playerid][pRank] == 6 && rank >= 6) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the sa thai mot thanh vien rank 6+!");			
	FactionMembers[PlayerInfo[playerid][pMember]] --;
	mysql_format(SQL, string, sizeof(string), "Ban da bi sa thai khoi to chuc %s (rank %d) sau %d ngay boi %s, ly do: %e.",  FactionName(PlayerInfo[playerid][pMember]), rank, days, GetName(playerid), reason);
	InsertEmail(pName[playerid], GetName(playerid), string, 0);			
	new string89[180];
	mysql_format(SQL, string89, sizeof(string89), "%s da bi gach ten khoi %s boi %s (rank %d) sau %d ngay, ly do: %e.", pName[playerid],GetName(playerid),FactionName(PlayerInfo[playerid][pMember]),rank, days,reason);
	FactionLog(PlayerInfo[playerid][pMember],pName[playerid],string89);
	mysql_format(SQL, query, sizeof(query), "INSERT INTO faction_logs (`text`,`player`,`leader`) VALUES ('%s','%d','%d')", string89, id, PlayerInfo[playerid][pSQLID]);
	mysql_tquery(SQL,query,"","");	
	FactionLog(PlayerInfo[playerid][pMember],pName[playerid],"Roi khoi to chuc.");
	if(userID != INVALID_PLAYER_ID) {
		PlayerInfo[userID][pFACWarns] = 0;	
		PlayerInfo[userID][pMember] = 0;
		PlayerInfo[userID][pRank] = 0;
		PlayerInfo[userID][pFpunish] = 0;
		PlayerInfo[userID][pDays] = 0;
		PlayerInfo[userID][pChar] = 47;
		PlayerTextDrawHide(userID, WarTime);
		SetPlayerSkinEx(userID, 47);
		SpawnPlayer(userID); 
	}
		
	if(fp == 0) {
		format(string, sizeof(string), "%s da sa thai %s khong faction punish, ly do: %s.", GetName(playerid), pName[playerid], reason);
		SendFactionMessage(PlayerInfo[playerid][pMember], COLOR_CLIENT, string);	
		if(userID != INVALID_PLAYER_ID) {
			format(string, sizeof(string), "Ban da bi sa thai khoi %s boi %s khong FP, ly do: %s.", FactionName(PlayerInfo[playerid][pMember]), GetName(playerid), reason);
			Dialog_Show(userID, 0, DIALOG_STYLE_MSGBOX, "Uninvite", string, "Close", "");
		}								
	}
	else {
		format(string, sizeof(string), "%s da sa thai %s khoi to chuc cung voi FP, ly do: %s.", GetName(playerid), pName[playerid], reason);
		SendFactionMessage(PlayerInfo[playerid][pMember], COLOR_CLIENT, string);	
		if(userID != INVALID_PLAYER_ID) {
			format(string, sizeof(string), "Ban da bi sai thai khoi to chuc %s boi %s voi FP, ly do: %s.", FactionName(PlayerInfo[playerid][pMember]), GetName(playerid), reason);
			Dialog_Show(userID, 0, DIALOG_STYLE_MSGBOX, "Uninvite", string, "Close", "");
		}					
	}
	mysql_format(SQL,str,256,"UPDATE `users` SET `Member`='0',`Rank`='0',`CChar`='250',`FPunish`='%d',`FWarn`='0',`SpawnChange`='0',`Commands`='0',`Leader`='0',`Days`='0' WHERE `name`='%s' LIMIT 1",fp, pName[playerid]);
	mysql_tquery(SQL,str, "", "");		
	return 1;
}
Dialog:DIALOG_CLANTURFS(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	if(CP[playerid] != 0) return Dialog_Show(playerid, DIALOG_CHECKPOINT, DIALOG_STYLE_MSGBOX, "Checkpoint", "Mot cham do dang hoat dong.\nBan co muon xoa no khong? Neu muon, hay chon 'Ok'.", "Ok", "Exit");
	new i;
	i = listitem+1;
	SetPlayerCheckpointEx(playerid, GraffitiInfo[i][gfX], GraffitiInfo[i][gfY], GraffitiInfo[i][gfZ]-3, 5.0);
	SendClientMessage(playerid, COLOR_YELLOW, "Diem mau do da duoc dat tren vi tri ban da chon.");
	CP[playerid] = 53;
	return 1;
}
Dialog:DIALOG_CLAN_COMMAND(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	switch(listitem) {
		case 0: {
			new str[300],cid=PlayerInfo[playerid][pClan];
			format(str, sizeof(str), "Ten Clan: %s\nTag: %s\nChu Clan: %s\nThanh vien: %d/%d\nDia ban: %d\nDiem hoat dong: %d", ClanInfo[cid][clName], ClanInfo[cid][clTag], ClanInfo[cid][clOwner], GetCMembers(cid), ClanInfo[cid][clSlots], GetClanTurfs(cid), ClanInfo[cid][clPoints]);
		    Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Thong tin Clan", str, "Dong", "");
		}
		case 1: Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX , "Lenh cho clan:", "/clan, /(c)lanchat, /cinvite, /clanduty, /spray, /clanzones.", "Dong", "");
		case 2: {
			new
			szDialog[1024], szDialog2[1024],
			Members, name[180], cwarn[180], cdays[180],
			szRank1[180], query[200], points;

		    format(query, sizeof(query), "SELECT * FROM `users` WHERE `users`.`Clan` = '%d' ORDER BY `users`.`ClanRank` DESC LIMIT 50", PlayerInfo[playerid][pClan]);
		    new Cache: result = mysql_query(SQL, query);

		    strcat(szDialog2, "#. Ten\tRank\tCanh cao\tNgay\tDiem\n");
		    for(new i, j = cache_num_rows (); i != j; ++i)
		    {
		    	cache_get_value_name(i, "name", name);
		    	cache_get_value_name(i, "ClanRank", szRank1);
		    	cache_get_value_name(i, "ClanWarns", cwarn);
		    	cache_get_value_name(i, "ClanDays", cdays);
		    	cache_get_value_int(i, "ActivePoints", points);
		    	
		    	format(Selected[playerid][Members], MAX_PLAYER_NAME, name);
		    	format(szDialog, sizeof(szDialog), "%d. %s\t%d\t%s/3\t%s\t%d\n", Members+1, name, strval(szRank1), cwarn, cdays, points);
		    	strcat(szDialog2, szDialog);
		    	Members++;
		    }
		    cache_delete(result);
		    Dialog_Show(playerid, DIALOG_CLAN_MEMBERS, DIALOG_STYLE_TABLIST_HEADERS, "Thanh vien clan", szDialog2, "Ok", "Back");
		    return 1;
		}
		case 3: {
			if(PlayerInfo[playerid][pClanRank] < 6) return 1;
			Dialog_Show(playerid, DIALOG_CLAN_SETTINGS, DIALOG_STYLE_LIST, "Thiet lap:", "Thay doi mau\nThay doi thong bao\nThay doi ten rank\n{FFCC00}(620 PP){FFFFFF} Thay doi ten clan\n{FFCC00}(310 PP){FFFFFF} Thay doi clan tag\n{FFCC00}(720PP){FFFFFF} Gia han clan (+30 ngay)", "Select", "Back");
		}
		case 4: {
			new clanid = PlayerInfo[playerid][pClan], string[200];
			format(string, sizeof(string), "{FFF785}%s{FFFFFF}%s\n%s{FFF785}%s{FFFFFF}\nXoa tag", ClanInfo[clanid][clTag], GetName(playerid), GetName(playerid), ClanInfo[clanid][clTag]);		
			Dialog_Show(playerid, DIALOG_CLANTAG, DIALOG_STYLE_LIST , "Clan TAG", string, "Ok", "Close");					
		}
		case 5: ShowClanVehicle(playerid);
	}
	return 1;
}
Dialog:DIALOG_CLANTAG(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	if(listitem == 2) {
		PlayerInfo[playerid][pTag] = -1;
		UpdateVar(playerid, "Tag", -1);
		SendClientMessage(playerid, COLOR_LGREEN, "Ban da xoa clan tag!");
		SetPlayerName(playerid, PlayerInfo[playerid][pUsername]);
		return 1;
	}
	PlayerInfo[playerid][pTag] = listitem;
	UpdateVar(playerid, "Tag", listitem);
	SendClientMessage(playerid, COLOR_LGREEN, "Vi tri cua clan tag da duoc thay doi!");
	new clanid = PlayerInfo[playerid][pClan], string[200];
	if(PlayerInfo[playerid][pClan] != 0 && PlayerInfo[playerid][pTag] == 0) {
		format(string, sizeof(string), "%s%s", ClanInfo[clanid][clTag], PlayerInfo[playerid][pUsername]);
		SetPlayerName(playerid, string);
	}
	else if(PlayerInfo[playerid][pClan] != 0 && PlayerInfo[playerid][pTag] == 1) {
		format(string, sizeof(string), "%s%s", PlayerInfo[playerid][pUsername], ClanInfo[clanid][clTag]);
		SetPlayerName(playerid, string);
	}
	new str[41],name[30];
	GetPlayerName(playerid, name, sizeof(name));
	format(str,sizeof(str),"%s (ID: %d)",name, playerid);
	PlayerTextDrawSetString(playerid, logoptd, str);
	PlayerTextDrawShow(playerid, logoptd);
	TextDrawShowForPlayer(playerid, logotd);
	return 1;
}
Dialog:DIALOG_CLAN_MEMBERS(playerid, response, listitem, inputtext[]) 
{
	if(!response) return Dialog_Show(playerid, DIALOG_CLAN_COMMAND, DIALOG_STYLE_LIST, "Clan:", "Thong tin clan\nLenh cho clan\nThanh vien trong clan\nCai dat\nTag\nXe clan", "Chon", "Dong");
	if(PlayerInfo[playerid][pClanRank] < 6) return SendClientMessage(playerid, COLOR_WHITE, "Ban can dat rank 6");
	format(pName[playerid], MAX_PLAYER_NAME, Selected[playerid][listitem]);
	Dialog_Show(playerid, DIALOG_CLAN_MANAGE2, DIALOG_STYLE_LIST, "Thiet lap:", "Uninvite\nGive rank\nClan warn\nUn Clan warn", "Ok" ,"Back");
	return 1;
}
Dialog:DIALOG_THUYSAN(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	if(TimpMateriale[playerid] == 1) return Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Ban ca", "ERROR: Ban khong the ban mot con ca qua nhanh, hay tro lai sau!", "Ok", "Cancel");
	new string2[180], string[128];
	GivePlayerCash(playerid, ThuySan[playerid]);
	format(string, sizeof(string), "Ban da nhan duoc $%s vi ban thuy san cua ban cua ban!", FormatNumber(ThuySan[playerid]));
	SendClientMessage(playerid, COLOR_MONEY, string);
	format(string, sizeof(string), "%s nhan duoc $%s tien thuong cho cong viec %s.", GetName(playerid), FormatNumber(ThuySan[playerid]), JobInfo[PlayerInfo[playerid][pJob]][jName]);
	
	// sv = GetPlayerSkill(playerid) + randomEx(1,4);
	// PlayerInfo[playerid][pDiemUyTin] += sv;
	// SCMf(playerid, COLOR_YELLOW,"Ban duoc {FF0000}+%d{FFFF00} diem uy tin vi hoan thanh cong viec", sv);
	// Update(playerid,pDiemUyTinx);
	format(string2, sizeof(string2), "[JOB]: %s[%d] da ban thuy san voi gia tien $%s va nhan %d .", GetName(playerid),playerid, FormatNumber(ThuySan[playerid]));
	GuiDenAdminVaHelper(COLOR_YELLOW, string2, 1);
	Log("logs/jobmoney.log", string2);
	ThuySan[playerid] = 0;
	Update(playerid,pCashx);
	PlayerInfo[playerid][pFishes] = 0;
	// if(PlayerInfo[playerid][pLuoiBieng] <= 100) PlayerInfo[playerid][pLuoiBieng] += random(2);
	if(PlayerInfo[playerid][pMember] == 0) {
		for(new m; m < 2; m++) {
			if(PlayerInfo[playerid][pDailyMission][m] == 15 || PlayerInfo[playerid][pDailyMission][m] == 16) CheckMission(playerid, m);
		}
	}
	for(new m; m < 2; m++) {
		if(PlayerInfo[playerid][pDailyMission][m] == 2) CheckMission(playerid, m);
	}
	return 1;
}
Dialog:DIALOG_CLAN_MANAGE2(playerid, response, listitem, inputtext[]) 
{
	if(!response) {
		new
			szDialog[1024], szDialog2[1024],
			Members, name[180], cwarn[180], cdays[180],
			szRank1[180], query[200], points;

	    format(query, sizeof(query), "SELECT * FROM `users` WHERE `users`.`Clan` = '%d' ORDER BY `users`.`ClanRank` DESC LIMIT 50", PlayerInfo[playerid][pClan]);
	    new Cache: result = mysql_query(SQL, query);

	    strcat(szDialog2, "#. Ten\tRank\tCanh cao\tNgay\tDiem\n");
	    for(new i, j = cache_num_rows (); i != j; ++i)
	    {
	    	cache_get_value_name(i, "name", name);
	    	cache_get_value_name(i, "ClanRank", szRank1);
	    	cache_get_value_name(i, "ClanWarns", cwarn);
	    	cache_get_value_name(i, "ClanDays", cdays);
	    	cache_get_value_int(i, "ActivePoints", points);
		
	    	format(Selected[playerid][Members], MAX_PLAYER_NAME, name);
	    	format(szDialog, sizeof(szDialog), "%d. %s\t%d\t%s/3\t%s\t%d\n", Members+1, name, strval(szRank1), cwarn, cdays, points);
	    	strcat(szDialog2, szDialog);
	    	Members++;
	    }
	    cache_delete(result);
	    Dialog_Show(playerid, DIALOG_CLAN_MEMBERS, DIALOG_STYLE_TABLIST_HEADERS, "Thanh vien clan", szDialog2, "Ok", "Back");
	    return 1;
	}
	new string[200];
	switch(listitem) {
		case 0: {
			new
				userID = GetPlayerID(pName[playerid]),
				clanid = PlayerInfo[playerid][pClan],
				points, sql[300];

			if(userID == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren chinh minh!");
			format(string, sizeof(string), "Ban da bi truc xuat khoi clan %s boi %s.", ClanInfo[clanid][clName], GetName(playerid));
			InsertEmail(pName[playerid], GetName(playerid), string, 0);					
			if(userID != INVALID_PLAYER_ID) {
  				format(string, sizeof(string), "Ban da bi truc xuat khoi clan boi %s.", GetName(playerid));
  				SendClientMessage(userID, COLOR_LIGHTBLUE, string);
				PlayerInfo[userID][pClan] = 0;
				PlayerInfo[userID][pClanRank] = 0;
				PlayerInfo[userID][pClanDays] = 0;
				PlayerInfo[userID][pClanWarn] = 0;
				SetPlayerName(userID, PlayerInfo[userID][pUsername]);
				ClanInfo[clanid][clPoints]-=PlayerInfo[userID][pPoints];
				format(string, sizeof(string), "{%s}[CLAN] %s da truc xuat %s khoi clan (-%d diem hoat dong).", ClanInfo[clanid][clColor], GetName(playerid), pName[playerid], PlayerInfo[userID][pPoints]);
			}
			else {
			    format(sql, sizeof(sql), "SELECT ActivePoints FROM users WHERE `name`='%s'",pName[userID]);
			    new Cache: x = mysql_query(SQL, sql);
			    cache_get_value_int(0, "ActivePoints", points);
			    ClanInfo[clanid][clPoints]-=points;
			    format(string, sizeof(string), "{%s}[CLAN] %s da truc xuat %s (offline) khoi clan (-%d diem hoat dong).", ClanInfo[clanid][clColor], GetName(playerid), pName[playerid], points);
			    cache_delete(x);
		    }
			SendClanMessage(clanid, string);
			ClanMembers[PlayerInfo[playerid][pClan]] --;
			format(sql, sizeof(sql), "UPDATE `users` SET `Clan`='0', `ClanRank`='0', `ClanDays`='0', `ClanWarns`='0' WHERE `Name`='%s'", pName[playerid]);
			mysql_pquery(SQL, sql);
			format(sql, sizeof(sql), "UPDATE `clans` SET `ActivePoints`='%d' WHERE `ID`='%d'", ClanInfo[clanid][clPoints], clanid);
			mysql_tquery(SQL, sql,"","");
		}
		case 1:
		{
			new szDialog[1024];
			format(szDialog, sizeof(szDialog), "Ban muon give rank gi cho %s?\nSu dung cac rank hop le (1-5).", pName[playerid]);
			Dialog_Show(playerid, DIALOG_CLAN_GRANK, DIALOG_STYLE_INPUT, "Give rank", szDialog, "Ok", "Back");
		}
		case 2: {
			new userID = GetPlayerID(pName[playerid]), szQuery[256], clanid = PlayerInfo[playerid][pClan];
			format(szQuery, sizeof(szQuery), "SELECT * FROM `users` WHERE `name`='%s'", pName[playerid]);
			new Cache: result = mysql_query(SQL, szQuery);
			new cw;
			cache_get_value_name_int(0, "ClanWarns", cw);
			cache_delete(result);
			cw ++;
			new query[200];
			format(query, sizeof(query), "UPDATE `users` SET `ClanWarns`='%d' WHERE `Name`='%s'", cw, pName[playerid]);
			mysql_pquery(SQL, query);	
			format(string, sizeof(string), "{%s}[CLAN] %s da them 1 warn cho %s.", ClanInfo[clanid][clColor], GetName(playerid), pName[playerid]);
			SendClanMessage(clanid, string);
			if(userID != INVALID_PLAYER_ID) PlayerInfo[userID][pClanWarn] ++;
			if(cw == 3) {
				ClanMembers[PlayerInfo[playerid][pClan]] --;
				format(string, sizeof(string), "Ban da bi truc xuat khoi clan %s boi %s, ly do: 3/3 Clan Warns.", ClanInfo[clanid][clName], GetName(playerid));
				InsertEmail(pName[playerid], GetName(playerid), string, 0);			
				if(userID != INVALID_PLAYER_ID) {					
					format(string, sizeof(string), "Ban da bi truc xuat khoi clan boi %s (3/3 cw).", GetName(playerid));
					SendClientMessage(userID, COLOR_LIGHTBLUE, string);
					PlayerInfo[userID][pClan] = 0;
					PlayerInfo[userID][pClanRank] = 0;
					PlayerInfo[userID][pClanDays] = 0;
					PlayerInfo[userID][pClanWarn] = 0;
					format(string, sizeof(string), "{%s}[CLAN] %s da truc xuat %s khoi clan (3/3 cw).", ClanInfo[clanid][clColor], GetName(playerid), pName[playerid]);
					SetPlayerName(userID, PlayerInfo[userID][pUsername]);						
				}
				else format(string, sizeof(string), "{%s}[CLAN] %s da truc xuat %s (offline) khoi clan (3/3 cw).", ClanInfo[clanid][clColor], GetName(playerid), pName[playerid]);	
				format(query, sizeof(query), "UPDATE `users` SET `Clan`='0', `ClanRank`='0', `ClanDays`='0', `ClanWarns`='0' WHERE `Name`='%s'", pName[playerid]);
				mysql_pquery(SQL, query);						
			}
		}
		case 3: {
			new userID = GetPlayerID(pName[playerid]), szQuery[256], clanid = PlayerInfo[playerid][pClan];
			format(szQuery, sizeof(szQuery), "SELECT * FROM `users` WHERE `name`='%s'", pName[playerid]);
			new Cache: result = mysql_query(SQL, szQuery);
			new cw;
			cache_get_value_name_int(0, "ClanWarns", cw);									
			cache_delete(result);
			if(cw == 0) return SendClientMessage(playerid, -1, "Thanh vien do khong co canh bao!");
			cw --;
			format(string, sizeof(string), "{%s}[CLAN] %s da -1 cw cho %s.", ClanInfo[clanid][clColor], GetName(playerid), pName[playerid]);
			SendClanMessage(clanid, string);					
			format(string, sizeof(string), "UPDATE `users` SET `ClanWarns`='%d' WHERE `Name`='%s'", cw, pName[playerid]);
			mysql_pquery(SQL, string);
			if(userID != INVALID_PLAYER_ID) PlayerInfo[userID][pClanWarn] --;	
		} 
	}
	return 1;
}
Dialog:DIALOG_CLAN_GRANK(playerid, response, listitem, inputtext[]) 
{
	new string[200], query[200];
	if(!response) {
		new
			szDialog[1024], szDialog2[1024],
			Members, name[180], cwarn[180], cdays[180],
			szRank1[180];

		format(query, sizeof(query), "SELECT * FROM `users` WHERE `users`.`Clan` = '%d' ORDER BY `users`.`ClanRank` DESC LIMIT 50", PlayerInfo[playerid][pClan]);
		new Cache: result = mysql_query(SQL, query);

		strcat(szDialog2, "#. Ten\tRank\tCanh cao\tNgay\n");
		for(new i, j = cache_num_rows (); i != j; ++i)
		{
			cache_get_value_name(i, "name", name);
			cache_get_value_name(i, "ClanRank", szRank1);
			cache_get_value_name(i, "ClanWarns", cwarn);
			cache_get_value_name(i, "ClanDays", cdays);
			
			format(Selected[playerid][Members], MAX_PLAYER_NAME, name);
			format(szDialog, sizeof(szDialog), "%d. %s\t%d\t%s/3\t%s\n", Members+1, name, strval(szRank1), cwarn, cdays);
			strcat(szDialog2, szDialog);
			Members++;
		}
		cache_delete(result);
		Dialog_Show(playerid, DIALOG_CLAN_MEMBERS, DIALOG_STYLE_TABLIST_HEADERS, "Clan members", szDialog2, "Ok", "Back");
		return 1;
	}
	if(strval(inputtext) <= 0 || strval(inputtext) >= 6) return SendClientMessage(playerid, COLOR_GREY, "Rank-ul este khong hop le. Trebuie sa fie cuprins intre 1 si 5!");
	new
		userID = GetPlayerID(pName[playerid]),
		clanid = PlayerInfo[playerid][pClan];

	if(userID == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren chinh minh!");
	if(userID != INVALID_PLAYER_ID) {
		PlayerInfo[userID][pClanRank] = strval(inputtext);
		format(string, sizeof(string), "{%s}[CLAN] %s da give rank %d cho %s.", ClanInfo[clanid][clColor], GetName(playerid), strval(inputtext), pName[playerid]);
	}
	else format(string, sizeof(string), "{%s}[CLAN] %s da give rank %d cho %s (offline).", ClanInfo[clanid][clColor], GetName(playerid), strval(inputtext), pName[playerid]);
	SendClanMessage(clanid, string);

	format(query, sizeof(query), "UPDATE `users` SET `ClanRank`='%d' WHERE `Name`='%s'", strval(inputtext), pName[playerid]);
	mysql_query(SQL, query, false);
	return 1;
}
Dialog:DIALOG_CLAN2(playerid, response, listitem, inputtext[]) 
{
	if(!response) {
		SendClientMessage(playerid, COLOR_WHITE, "Clan tag phai tu 3 den 9 ky tu.");
		new szText[180];
		format(szText, sizeof(szText), "Ten clan ban da chon la: %s.\nPhan thu hai la chon clan tag.\nClan tag phai tu 3 den 6 ky tu.", ClanInfo[PlayerInfo[playerid][pClan]][clName]);
		Dialog_Show(playerid, DIALOG_CLAN2, DIALOG_STYLE_INPUT, "Shop:", szText, "Ok", "");			
		return 1;
	}
	if(!ValidClanTag(inputtext)) {
		SendClientMessage(playerid, COLOR_GREY, "Tag can phai nam trong cap dau [ ].");
		new szText[180];
		format(szText, sizeof(szText), "Ten clan ban da chon la: %s.\nPhan thu hai la chon clan tag.\nClan tag phai tu 3 den 6 ky tu.", ClanInfo[PlayerInfo[playerid][pClan]][clName]);
		Dialog_Show(playerid, DIALOG_CLAN2, DIALOG_STYLE_INPUT, "Shop:", szText, "Ok", "");					
		return 1;
	}	
	if(InvalidClanTag(inputtext)) {
		SendClientMessage(playerid, COLOR_GREY, "Ky tu khong hop le! Tag khong duoc chua cac ky tu nhu #, {}, @.");
		new szText[180];
		format(szText, sizeof(szText), "Ten clan ban da chon la: %s.\nPhan thu hai la chon clan tag.\nClan tag phai tu 3 den 6 ky tu.", ClanInfo[PlayerInfo[playerid][pClan]][clName]);
		Dialog_Show(playerid, DIALOG_CLAN2, DIALOG_STYLE_INPUT, "Shop:", szText, "Ok", "");					
		return 1;
	}	
	if(ExistaTagClan(inputtext)) { 
		SendClientMessage(playerid, COLOR_WARNING, "Da co mot clan dang ky voi TAG nay!");	
		new szText[180];
		format(szText, sizeof(szText), "Ten clan ban da chon la: %s.\nPhan thu hai la chon clan tag.\nThe clan phai tu 3 den 6 ky tu.", inputtext);
		Dialog_Show(playerid, DIALOG_CLAN2, DIALOG_STYLE_INPUT, "Shop:", szText, "Ok", "");					
		return 1;
	}
	if(strlen(inputtext) < 3 || strlen(inputtext) > 9) {
		SendClientMessage(playerid, COLOR_WHITE, "Clan tag phai tu 3 den 9 ky tu.");
		new szText[180];
		format(szText, sizeof(szText), "Ten clan ban da chon la: %s.\nPhan thu hai la chon clan tag.\nThe clan phai tu 3 den 6 ky tu.", inputtext);
		Dialog_Show(playerid, DIALOG_CLAN2, DIALOG_STYLE_INPUT, "Shop:", szText, "Ok", "");
		return 1;
	}
	new clanid = PlayerInfo[playerid][pClan], query[200];
	format(ClanInfo[clanid][clTag], 32, inputtext);
	format(query, sizeof(query), "UPDATE `clans` SET `Tag`='%s' WHERE `ID`='%d'", inputtext, clanid);
	mysql_query(SQL, query, false);

	new szName[180], string[200];
	format(string, sizeof(string), "Chuc mung! Ban da mua tu cua hang mot clan co %d slot thanh cong.", sSlot[playerid]);
	SendClientMessage(playerid, COLOR_GOLD, string);
	Update(playerid, pPremiumPointsx);
	format(string, sizeof(string), "[Thong tin]: Ten cua clan: %s (tag: %s). [clan #%d]", ClanInfo[clanid][clName], ClanInfo[clanid][clTag], PlayerInfo[playerid][pClan]);
	SendClientMessage(playerid, COLOR_GOLD, string);

	format(query, sizeof(query), "UPDATE `clans` SET `TagType`='%d' WHERE `ID`='%d'", listitem, clanid);
	mysql_query(SQL, query, false);

	format(ClanInfo[clanid][clRankName1], 30, "Rank 1");
	format(ClanInfo[clanid][clRankName2], 30, "Rank 2");
	format(ClanInfo[clanid][clRankName3], 30, "Rank 3");
	format(ClanInfo[clanid][clRankName4], 30, "Rank 4");
	format(ClanInfo[clanid][clRankName5], 30, "Rank 5");
	format(ClanInfo[clanid][clRankName6], 30, "Rank 6");
	format(ClanInfo[clanid][clMotd], 100, "None");

	format(szName, sizeof(szName), "%s%s", ClanInfo[clanid][clTag], PlayerInfo[playerid][pUsername]);
	SetPlayerName(playerid, szName);	
	return 1;
}
Dialog:DIALOG_CLAN_SETTINGS(playerid, response, listitem, inputtext[]) 
{
	if(!response) return Dialog_Show(playerid, DIALOG_CLAN_COMMAND, DIALOG_STYLE_LIST, "Clan:", "Thong tin clan\nLenh cho clan\nThanh vien trong clan\nCai dat\nTag\nXe clan", "Chon", "Dong");
	switch(listitem)
	{
		case 0:
		{
			Dialog_Show(playerid, DIALOG_CLAN_COLOR, DIALOG_STYLE_INPUT, "Cai dat:", "Nhap mau clan vao phia duoi. (EX: FFFFFF - ALB)\nXem ma mau: http://www.colorpicker.com/", "Select", "Back");
		}
		case 1:
		{
			Dialog_Show(playerid, DIALOG_CLAN_MOTD, DIALOG_STYLE_INPUT, "Cai dat", "Nhap thong bao hang ngay (MOTD).", "Select", "Back");
		}
		case 2:
		{
			Dialog_Show(playerid, DIALOG_CLAN_RANK, DIALOG_STYLE_INPUT, "Cai dat", "Nhap ten rank cua clan ma ban muon dat.", "Select", "Back");
		}
		case 3: {
			if(PlayerInfo[playerid][pPremiumPoints] < 620) return SendClientMessage(playerid, COLOR_GREY, "Ban can 620 "#DIEMCAOCAP" de thuc hien thao tac nay");
			Dialog_Show(playerid, DIALOG_CLANNAME, DIALOG_STYLE_INPUT, "Change clan name", "Nhap ten clan ma ban muon thay doi.\nChi phi thay doi la 25 "#DIEMCAOCAP", hay suy nghi can than roi hay bam nhe!", "Select", "Back");
		}
		case 4: {
			if(PlayerInfo[playerid][pPremiumPoints] < 310) return SendClientMessage(playerid, COLOR_GREY, "Ban can 310 "#DIEMCAOCAP" de thuc hien thao tac nay");
			Dialog_Show(playerid, DIALOG_CHANGETAG, DIALOG_STYLE_INPUT, "Change clan TAG", "Nhap clan tag ma ban muon thay doi.\nChi phi thay doi la 25 "#DIEMCAOCAP", hay suy nghi ky roi hay bam nhe!", "Select", "Back");
		}
		case 5: {
			if(PlayerInfo[playerid][pPremiumPoints] < 720) return SendClientMessage(playerid, COLOR_GREY, "Ban can 720 "#DIEMCAOCAP" de thuc hien thao tac nay");
			new clanid = PlayerInfo[playerid][pClan];
			PlayerInfo[playerid][pPremiumPoints] -= 720;
			Update(playerid, pPremiumPointsx);
			ClanInfo[clanid][clDays] += 30;
			new query[140];
			format(query, sizeof(query), "UPDATE `clans` SET `Days`='%d' WHERE `ID`='%d'", ClanInfo[clanid][clDays], clanid);
			mysql_query(SQL, query, false);
			new string[140];
			format(string, sizeof(string), "Ban da gia han clan them 30 ngay. Clan cua ban se het han sau %d ngay.", ClanInfo[clanid][clDays]);
			SendClientMessage(playerid, COLOR_MONEY, string);
		}
	}
	return 1;
}
Dialog:DIALOG_CLANNAME(playerid, response, listitem, inputtext[]) 
{
	if(ExistaNumeClan(inputtext)) return SendClientMessage(playerid, COLOR_WARNING, "Da co mot clan dang ky voi ten nay!");	
	if(strlen(inputtext) < 3 || strlen(inputtext) > 10) return SendClientMessage(playerid, COLOR_GREY, "Ten Clan phai chua it nhat 3 ky tu va toi da 10 ky tu!");
	if(PlayerInfo[playerid][pPremiumPoints] < 620) return SendClientMessage(playerid, COLOR_GREY, "Ban can 620 "#DIEMCAOCAP" de thuc hien thao tac nay");
	PlayerInfo[playerid][pPremiumPoints] -= 620;
	Update(playerid, pPremiumPointsx);			
	new clanid = PlayerInfo[playerid][pClan];
	format(ClanInfo[clanid][clName], 64, inputtext);
	new string[150], query[150];
	format(query, sizeof(query), "UPDATE `clans` SET `Name`='%s' WHERE `ID`='%d'", inputtext, clanid);
	mysql_query(SQL, query, false);
	format(string, sizeof(string), "{%s}[CLAN] %s da thay doi ten clan thanh %s.", ClanInfo[clanid][clColor], GetName(playerid), inputtext);
	SendClanMessage(clanid, string);
	new tagname[180];
	for(new i = 0; i < MAX_CLANZONES; i++)
	{
		if(GraffitiInfo[i][gfOwned] == PlayerInfo[playerid][pClan]) {
			DestroyDynamicObject(GraffitiInfo[i][gfObject]);
			GraffitiInfo[i][gfObject] = CreateDynamicObject(19353, GraffitiInfo[i][gfX], GraffitiInfo[i][gfY], GraffitiInfo[i][gfZ], 0.0, 0.0, GraffitiInfo[i][gfRot]);
			format(tagname, sizeof(tagname), "{%s}%s\n%s", ClanInfo[GraffitiInfo[i][gfOwned]][clColor], ClanInfo[GraffitiInfo[i][gfOwned]][clName], ClanInfo[GraffitiInfo[i][gfOwned]][clTag]);
			SetDynamicObjectMaterialText(GraffitiInfo[i][gfObject], 0, tagname, OBJECT_MATERIAL_SIZE_512x256, "BankGothic Md BT", 60, 1, 0xfff0f0f0, 0, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
		}
	}
	return 1;
}
Dialog:DIALOG_CHANGETAG(playerid, response, listitem, inputtext[]) 
{
	if(ExistaTagClan(inputtext)) return SendClientMessage(playerid, COLOR_WARNING, "Da co mot clan dang ky voi TAG nay!");
	if(!ValidClanTag(inputtext)) return SendClientMessage(playerid, COLOR_GREY, "Tag can phai nam trong cap dau [ ] .");
	if(InvalidClanTag(inputtext)) return SendClientMessage(playerid, COLOR_GREY, "Ky tu khong hop le! The khong the chua #, {}, @.");		
	if(strlen(inputtext) < 3 || strlen(inputtext) > 10) return SendClientMessage(playerid, COLOR_GREY, "The clan phai chua it nhat 3 ky tu va toi da 10 ky tu!");
	if(PlayerInfo[playerid][pPremiumPoints] < 310) return SendClientMessage(playerid, COLOR_GREY, "Ban can 720 "#DIEMCAOCAP" de thuc hien thao tac nay");
	new clanid = PlayerInfo[playerid][pClan];
	PlayerInfo[playerid][pPremiumPoints] -= 310;
	Update(playerid, pPremiumPointsx);				
	format(ClanInfo[clanid][clTag], 64, inputtext);
	new query[150], string[150];
	format(query, sizeof(query), "UPDATE `clans` SET `Tag`='%s' WHERE `ID`='%d'", inputtext, clanid);
	mysql_query(SQL, query, false);
	format(string, sizeof(string), "{%s}[CLAN] %s da thay doi TAG clan thanh %s.", ClanInfo[clanid][clColor], GetName(playerid), inputtext);
	SendClanMessage(clanid, string);
	new tagname[180];
	for(new i = 0; i < MAX_CLANZONES; i++)
	{
		if(GraffitiInfo[i][gfOwned] == PlayerInfo[playerid][pClan]) {
			DestroyDynamicObject(GraffitiInfo[i][gfObject]);
			GraffitiInfo[i][gfObject] = CreateDynamicObject(19353, GraffitiInfo[i][gfX], GraffitiInfo[i][gfY], GraffitiInfo[i][gfZ], 0.0, 0.0, GraffitiInfo[i][gfRot]);
			format(tagname, sizeof(tagname), "{%s}%s\n%s", ClanInfo[GraffitiInfo[i][gfOwned]][clColor], ClanInfo[GraffitiInfo[i][gfOwned]][clName], ClanInfo[GraffitiInfo[i][gfOwned]][clTag]);
			SetDynamicObjectMaterialText(GraffitiInfo[i][gfObject], 0, tagname, OBJECT_MATERIAL_SIZE_512x256, "BankGothic Md BT", 60, 1, 0xfff0f0f0, 0, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
		}
	}
	foreach(new i: Player) {
		if(PlayerInfo[i][pClan] == clanid && IsPlayerConnected(i)) {
			if(PlayerInfo[i][pTag] == 0) {
				format(string, sizeof(string), "%s%s", ClanInfo[clanid][clTag], PlayerInfo[i][pUsername]);
				SetPlayerName(i, string);
			}
			else if(PlayerInfo[i][pTag] == 1) {
				format(string, sizeof(string), "%s%s", PlayerInfo[i][pUsername], ClanInfo[clanid][clTag]);
				SetPlayerName(i, string);
			}
		}
	}		
	return 1;
}
Dialog:DIALOG_CLAN_COLOR(playerid, response, listitem, inputtext[]) 
{
	new clanid = PlayerInfo[playerid][pClan];
	if(!response) return  Dialog_Show(playerid, DIALOG_CLAN_SETTINGS, DIALOG_STYLE_LIST, "Cai dat:", "Thay doi mau\nThay doi thong bao\nThay doi ten rank\n{FFCC00}(620 PP){FFFFFF} Thay doi ten clan\n{FFCC00}(310 PP){FFFFFF} Thay doi clan tag\n{FFCC00}(720PP){FFFFFF} Gia han clan (+30 ngay)", "Select", "Back");
	if(strlen(inputtext) <= 0 || strlen(inputtext) > 6) return  Dialog_Show(playerid, DIALOG_CLAN_SETTINGS, DIALOG_STYLE_LIST, "Cai dat:", "Thay doi mau\nThay doi thong bao\nThay doi ten rank\n{FFCC00}(620 PP){FFFFFF} Thay doi ten clan\n{FFCC00}(310 PP){FFFFFF} Thay doi clan tag\n{FFCC00}(720PP){FFFFFF} Gia han clan (+30 ngay)", "Select", "Back");
	format(ClanInfo[clanid][clColor], 256, inputtext);
	new string[150], query[150];
	format(string, sizeof(string), "{%s}[CLAN] %s vua doi mau clan.", ClanInfo[clanid][clColor], GetName(playerid), inputtext);
	SendClanMessage(clanid, string);
	new tagname[180];
	for(new i = 0; i < MAX_CLANZONES; i++)
	{
		if(GraffitiInfo[i][gfOwned] == PlayerInfo[playerid][pClan]) {
			DestroyDynamicObject(GraffitiInfo[i][gfObject]);
			GraffitiInfo[i][gfObject] = CreateDynamicObject(19353, GraffitiInfo[i][gfX], GraffitiInfo[i][gfY], GraffitiInfo[i][gfZ], 0.0, 0.0, GraffitiInfo[i][gfRot]);
			format(tagname, sizeof(tagname), "{%s}%s\n%s", ClanInfo[GraffitiInfo[i][gfOwned]][clColor], ClanInfo[GraffitiInfo[i][gfOwned]][clName], ClanInfo[GraffitiInfo[i][gfOwned]][clTag]);
			SetDynamicObjectMaterialText(GraffitiInfo[i][gfObject], 0, tagname, OBJECT_MATERIAL_SIZE_512x256, "BankGothic Md BT", 60, 1, 0xfff0f0f0, 0, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
		}
	}
	format(query, sizeof(query), "UPDATE `clans` SET `Color`='%s' WHERE `ID`='%d'", ClanInfo[clanid][clColor], clanid);
	mysql_query(SQL, query, false);
	return 1;
}
Dialog:DIALOG_CLAN_MOTD(playerid, response, listitem, inputtext[]) 
{
	if(!response) return  Dialog_Show(playerid, DIALOG_CLAN_SETTINGS, DIALOG_STYLE_LIST, "Cai dat:", "Thay doi mau\nThay doi thong bao\nThay doi ten rank\n{FFCC00}(620 PP){FFFFFF} Thay doi ten clan\n{FFCC00}(310 PP){FFFFFF} Thay doi clan tag\n{FFCC00}(720PP){FFFFFF} Gia han clan (+30 ngay)", "Select", "Back");
	new clanid = PlayerInfo[playerid][pClan], string[150], query[150];
	format(string, sizeof(string), "{%s}[CLAN] %s thay doi thong bao clan thanh %s.", ClanInfo[clanid][clColor], GetName(playerid), inputtext);
	SendClanMessage(clanid, string);

	format(ClanInfo[clanid][clMotd], 100, "%s", inputtext);
	format(query, sizeof(query), "UPDATE `clans` SET `Motd`='%s' WHERE `ID`='%d'", ClanInfo[clanid][clMotd], clanid);
	mysql_query(SQL, query, false);
	return 1;
}
Dialog:DIALOG_CLAN_RANK(playerid, response, listitem, inputtext[]) 
{
	if(!response) return  Dialog_Show(playerid, DIALOG_CLAN_SETTINGS, DIALOG_STYLE_LIST, "Cai dat:", "Thay doi mau\nThay doi thong bao\nThay doi ten rank\n{FFCC00}(620 PP){FFFFFF} Thay doi ten clan\n{FFCC00}(310 PP){FFFFFF} Thay doi clan tag\n{FFCC00}(720PP){FFFFFF} Gia han clan (+30 ngay)", "Select", "Back");
	new string[256];
	format(string, sizeof(string), "%s", inputtext);
	format(szRank[playerid], 256, string);
	Dialog_Show(playerid, DIALOG_CLAN_RANK2, DIALOG_STYLE_LIST, "Choose rank:", "Rank 1\nRank 2\nRank 3\nRank 4\nRank 5\nRank 6", "Thay doi", "Back");
	return 1;
}
Dialog:DIALOG_CLAN_RANK2(playerid, response, listitem, inputtext[]) 
{
	if(!response) return Dialog_Show(playerid, DIALOG_CLAN_RANK, DIALOG_STYLE_INPUT, "Setarile clanului:", "{FFFFFF}Nhap ten rank cua clan ma ban muon dat.", "Select", "Back");
	new
		ClanRank,
		clanid = PlayerInfo[playerid][pClan], query[200], string[200];

	switch(listitem) {
		case 0: {
			ClanRank = 1;
			format(ClanInfo[clanid][clRankName1], 30, "%s", szRank[playerid]);
			format(query, sizeof(query), "UPDATE `clans` SET `RankName1`='%s' WHERE `ID`='%d'", ClanInfo[clanid][clRankName1], clanid);
			mysql_query(SQL, query, false);
		}
		case 1: {
			ClanRank = 2;
			format(ClanInfo[clanid][clRankName2], 30, "%s", szRank[playerid]);
			format(query, sizeof(query), "UPDATE `clans` SET `RankName2`='%s' WHERE `ID`='%d'", ClanInfo[clanid][clRankName2], clanid);
			mysql_query(SQL, query, false);
		}
		case 2: {
			ClanRank = 3;
			format(ClanInfo[clanid][clRankName3], 30, "%s", szRank[playerid]);
			format(query, sizeof(query), "UPDATE `clans` SET `RankName3`='%s' WHERE `ID`='%d'", ClanInfo[clanid][clRankName3], clanid);
			mysql_query(SQL, query, false);
		}
		case 3: {
			ClanRank = 4;
			format(ClanInfo[clanid][clRankName4], 30, "%s", szRank[playerid]);
			format(query, sizeof(query), "UPDATE `clans` SET `RankName4`='%s' WHERE `ID`='%d'", ClanInfo[clanid][clRankName4], clanid);
			mysql_query(SQL, query, false);
		}
		case 4: {
			ClanRank = 5;
			format(ClanInfo[clanid][clRankName5], 30, "%s", szRank[playerid]);
			format(query, sizeof(query), "UPDATE `clans` SET `RankName5`='%s' WHERE `ID`='%d'", ClanInfo[clanid][clRankName5], clanid);
			mysql_query(SQL, query, false);
		}
		case 5: {
			ClanRank = 6;
			format(ClanInfo[clanid][clRankName6], 30, "%s", szRank[playerid]);
			format(query, sizeof(query), "UPDATE `clans` SET `RankName6`='%s' WHERE `ID`='%d'", ClanInfo[clanid][clRankName6], clanid);
			mysql_query(SQL, query, false);
		}
	}
	format(string, sizeof(string), "{%s}[CLAN] %s thay doi ten rank %d tro thanh %s.", ClanInfo[clanid][clColor], GetName(playerid), ClanRank, szRank[playerid]);
	SendClanMessage(clanid, string);
	return 1;
}
Dialog:DIALOG_CLANVEHICLE(playerid, response, listitem, inputtext[]) {
	if(!response) return 1;
	if(listitem==0) return Info(playerid, "Mua xe clan se duoc mo khi ket thuc dua top Clan");
	for(new i=0; i<10; i++) {
	    if(listitem==i+1) {
			if(CP[playerid] != 0) return Dialog_Show(playerid, DIALOG_CHECKPOINT, DIALOG_STYLE_MSGBOX, "Checkpoint", "Mot cham do dang hoat dong.\nBan co muon xoa no khong? Neu muon, hay chon 'Ok'.", "Ok", "Exit");
			new Float:x, Float:y, Float:z, vid=ClanVehicle[PlayerInfo[playerid][pClan]][i];
			GetVehiclePos(ServerVehicles[vid][vSpawned], x, y, z);
			SetPlayerCheckpointEx(playerid, x, y, z, 4.0);
			CP[playerid]=53;
		}
	}
	return 1;
}
Dialog:DIALOG_CHUYENGIOI(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	if(PlayerInfo[playerid][pPremiumPoints] < 50) return SendClientMessage(playerid, -1, "Ban khong co du xu");
	PlayerInfo[playerid][pPremiumPoints] -= 50;
	Update(playerid, pPremiumPointsx);
	if(PlayerInfo[playerid][pSex] == 1) {
		//Nam
		SendClientMessage(playerid, -1, "{00FF00}[!] {FFFFFF} Ban da chuyen gioi thanh nu, hay su dung /thongtin de kiem tra.");
		PlayerInfo[playerid][pSex] = 2;
		UpdateVar(playerid, "Sex", 2);
	} else {
		SendClientMessage(playerid, -1, "{00FF00}[!] {FFFFFF} Ban da chuyen gioi thanh nam, hay su dung /thongtin de kiem tra.");
		PlayerInfo[playerid][pSex] = 1;
		UpdateVar(playerid, "Sex", 1);				
	}
	return 1;
}
Dialog:DIALOG_GYM(playerid, response, listitem, inputtext[]) 
{
	if(response)
	{
		if(InBussines[playerid] == -1 && !isBoxingOn) return 1;
		new string[200];
		if(listitem == 0 && GetPlayerCash(playerid) >= 1000)
		{
			GivePlayerCash(playerid, -1000);
			SetPlayerFightingStyle (playerid, FIGHT_STYLE_BOXING);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Ban tra $1.000 de thay doi phong cach danh vo cua ban thanh Boxing.");
			BizzInfo[InBussines[playerid]][bTill] += 1000;
			PlayerInfo[playerid][pFightStyle] = 1;
		}
		else if(listitem == 1 && GetPlayerCash(playerid) >= 1500)
		{
			GivePlayerCash(playerid, -1500);
			SetPlayerFightingStyle (playerid, FIGHT_STYLE_KUNGFU);
			PlayerInfo[playerid][pFightStyle] = 2;
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Ban tra $1.500 de thay doi phong cach danh vo cua ban thanh Kung Fu.");
			BizzInfo[InBussines[playerid]][bTill] += 1500;
		}
		else if(listitem == 2 && GetPlayerCash(playerid) >= 800)
		{
			GivePlayerCash(playerid, -800);
			SetPlayerFightingStyle (playerid, FIGHT_STYLE_ELBOW);
			PlayerInfo[playerid][pFightStyle] = 3;
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Ban tra $800 de thay doi phong cach danh vo cua ban thanh Elbow.");
			BizzInfo[InBussines[playerid]][bTill] += 800;
		}
		else if(listitem == 3 && GetPlayerCash(playerid) >= 500)
		{
			GivePlayerCash(playerid, -500);
			SetPlayerFightingStyle (playerid, FIGHT_STYLE_GRABKICK);
			PlayerInfo[playerid][pFightStyle] = 4;
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Ban tra $500 de thay doi phong cach danh vo cua ban thanh Grabkick.");
			BizzInfo[InBussines[playerid]][bTill] += 500;
		}
		else if(listitem == 4 && GetPlayerCash(playerid) >= 600)
		{
			GivePlayerCash(playerid, -600);
			SetPlayerFightingStyle (playerid, FIGHT_STYLE_KNEEHEAD);
			PlayerInfo[playerid][pFightStyle] = 5;
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Ban tra $600 de thay doi phong cach danh vo cua ban thanh Kneehead.");
			BizzInfo[InBussines[playerid]][bTill] += 600;
		}
		else return SendClientMessage(playerid, COLOR_WHITE, "{FFB870}Ban khong co du tien.");
		UpdateVar(playerid, "FightStyle", PlayerInfo[playerid][pFightStyle]);
		mysql_format(SQL,string,sizeof(string),"UPDATE `bizz` SET `Till`='%d' WHERE `ID`='25'",BizzInfo[InBussines[playerid]][bTill]);
		mysql_tquery(SQL,string,"","");				
	}
	return 1;
}


Dialog:DIALOG_SHOW(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new szDialog[512];
	for(new i = 0; i < 13; i++) format(szDialog, sizeof(szDialog), "%s%s\n", szDialog, HudName[i]);
	switch(listitem) {
		case 0: {
			if(PlayerInfo[playerid][pShowJob] == 0) {
				SendClientMessage(playerid, COLOR_WHITE, "Ban da bat tuy chon de xem thong tin cong viec.");
				SendClientMessage(playerid, COLOR_WHITE, "Ban se thay chi tiet cua cong viec tu dong khi ban lam viec.");
				PlayerInfo[playerid][pShowJob] = 1;
			}
			else {
				SendClientMessage(playerid, COLOR_WHITE, "Ban da tat tuy chon xem thong tin cong viec.");
				SendClientMessage(playerid, COLOR_WHITE, "Bay gio, ban se khong thay chi tiet cong viec nua.");
				PlayerInfo[playerid][pShowJob] = 0;
				if(JobWorking[playerid] == 1) PlayerTextDrawHide(playerid, JobTD);
			}
		}
		case 1: {
			if(PlayerInfo[playerid][pShowFP] == 0) {
				SendClientMessage(playerid, COLOR_WHITE, "Ban da bat tuy chon de xem FPS & Ping.");
				PlayerInfo[playerid][pShowFP] = 1;
			}
			else {
				SendClientMessage(playerid, COLOR_WHITE, "Ban da tat tuy chon xem FPS & Ping.");
				PlayerInfo[playerid][pShowFP] = 0;
				PlayerTextDrawSetString(playerid, ShowTD, "");
				PlayerTextDrawHide(playerid, ShowTD);
			}
		}
		case 2: {
			if(PlayerInfo[playerid][pShowCeas] == 0) {
				SendClientMessage(playerid, COLOR_WHITE, "Ban da kich hoat tuy chon de xem dong ho.");
				PlayerInfo[playerid][pShowCeas] = 1;
				TextDrawShowForPlayer(playerid, Logo[0]);
				TextDrawShowForPlayer(playerid, Logo[1]);
				new str[41],name[30];
	            GetPlayerName(playerid, name, sizeof(name));
		        format(str,sizeof(str),"%s",name);
	            PlayerTextDrawSetString(playerid, logoptd, str);
	            PlayerTextDrawShow(playerid, logoptd);
				TextDrawShowForPlayer(playerid, logotd);
			}
			else {
				SendClientMessage(playerid, COLOR_WHITE, "Ban da tat tuy chon de xem dong ho.");
				PlayerInfo[playerid][pShowCeas] = 0;
				TextDrawHideForPlayer(playerid, Logo[0]);
				TextDrawHideForPlayer(playerid, Logo[1]);
				PlayerTextDrawHide(playerid, logoptd);
				TextDrawHideForPlayer(playerid, logotd);
			}
		}
		case 3: SelectedHud[playerid] = 0, Dialog_Show(playerid, DIALOG_HUDSELECT,DIALOG_STYLE_LIST,"Mau sac thanh HP",szDialog,"Ok","Close");
		case 4: SelectedHud[playerid] = 1, Dialog_Show(playerid, DIALOG_HUDSELECT,DIALOG_STYLE_LIST,"Mau sac thanh giap",szDialog,"Ok","Close"); 			
		case 5: {
			if(PlayerInfo[playerid][pShowDMG] == 0) {
				PlayerInfo[playerid][pShowDMG] = 1;
				SendClientMessage(playerid, 0xFFADADFF, "Damage Informer da duoc kich hoat!");
			}
			else {
				PlayerInfo[playerid][pShowDMG] = 0;
				SendClientMessage(playerid, 0xFFADADFF, "Damage Informer da duoc tat!");
			}
			UpdateVar(playerid, "ShowDMG", PlayerInfo[playerid][pShowDMG]);
		}	
		case 6: SelectedHud[playerid] = 2, Dialog_Show(playerid, DIALOG_HUDSELECT,DIALOG_STYLE_LIST,"Mau sac canh bao",szDialog,"Ok","Close"); 			
		case 7: {
			if(PlayerInfo[playerid][pShowCP] == 0) {
				SendClientMessage(playerid, COLOR_WHITE, "Ban da kich hoat tuy chon xem khoang cach den checkpoint.");
				PlayerInfo[playerid][pShowCP] = 1;						
			}
			else {
				SendClientMessage(playerid, COLOR_WHITE, "Ban da tat tuy chon xem khoang cach den checkpoint.");
				PlayerInfo[playerid][pShowCP] = 0;
				PlayerTextDrawSetString(playerid, CpTD, "");
				PlayerTextDrawHide(playerid, CpTD);
			}
			UpdateVar(playerid, "ShowCP", PlayerInfo[playerid][pShowCP]);
		}
		case 8: SelectedHud[playerid] = 3, Dialog_Show(playerid, DIALOG_HUDSELECT,DIALOG_STYLE_LIST,"Level Bar Color",szDialog,"Ok","Close");
		// case 9: SelectedHud[playerid] = 4, Dialog_Show(playerid, DIALOG_HUDSELECT,DIALOG_STYLE_LIST,"Mau sac Level Bar",szDialog,"Ok","Close");
		/*case 9:
		{
			if(showgoal[playerid] == 0) 
			{
				showgoal[playerid] = 1;
				SendClientMessage(playerid, 0xFFADADFF, "Job Goal Da Duoc Bat");
				for(new i = 0; i < 4; i++) TextDrawShowForPlayer(playerid, GoalTD[i]);
			}
			else {
				showgoal[playerid] = 0;
				SendClientMessage(playerid, 0xFFADADFF, "Job Goal da duoc tat!");
				for(new i = 0; i < 4; i++) TextDrawHideForPlayer(playerid, GoalTD[i]);
			}
		}*/
	}			
	Update(playerid, pShowJobx);
	Update(playerid, pShowFPx);
	Update(playerid, pShowLogox);
	Update(playerid, pShowCeasx);
	return 1;
}
Dialog:DIALOG_UPDATE(playerid, response, listitem, inputtext[]) 
{
	if(response)
	{
	    new File: handle = fopen( LINKMOFILELOG, io_read );
	    if ( ! handle )
	        return SendClientMessage( playerid, COLOR_YELLOW, "Khong co update nao de hien thi." );
	    new version[ 32 ], x = 0;
		printf("1");
	    while ( fread( handle, version ) )
	    {
	        if ( x == listitem )
	        {
	            // xoa khoang trang 
	            strreplace( version, "\n", "" ), trimString( version );
	            // mo mot file rieng le
	            new File: changelog_handle = fopen( sprintf( UPDATEDIRECTORY # "/%s.txt", version ), io_read );
	            if ( ! changelog_handle )
	                return SendClientMessage( playerid, COLOR_YELLOW,  "Khong co update nao gan day." );
	            erase( stringDocFileNho );
	            erase( stringDocFileTo );
	            while ( fread( changelog_handle, stringDocFileNho ) )
	            {
	                new
	                    find = strfind( stringDocFileNho, "(+)" );
	                // them
	                if( find != -1 )
	                {
	                    strins( stringDocFileNho, "{23D96F}Them :{FFFFFF}\t", find + 3 );
	                    strdel( stringDocFileNho, find, find + 3);
	                }
	                // xoa
	                find = strfind( stringDocFileNho, "(-)" );
	                if( find != -1 )
	                {
	                    strins( stringDocFileNho, "{D92323}Xoa :{FFFFFF}\t", find + 3 );
	                    strdel( stringDocFileNho, find, find + 3 );
	                }
	                // sua
	                find = strfind( stringDocFileNho, "(*)" );
	                if ( find != -1 )
	                {
	                    strins( stringDocFileNho, "{D9A823}Fix :{FFFFFF}\t", find + 3 );
	                    strdel( stringDocFileNho, find, find + 3 );
	                }
	                // thay doi
	                find = strfind( stringDocFileNho, "(/)" );
	                if ( find != -1 )
	                {
	                    strins( stringDocFileNho, "{c0c0c0}Sua :{FFFFFF}\t", find + 3 );
	                    strdel( stringDocFileNho, find, find + 3 );
	                }
	                // append
	                strcat( stringDocFileTo, stringDocFileNho );
					printf("2");
	            }
	            fclose( changelog_handle );
				printf("3");
	            Dialog_Show( playerid, DIALOG_NULL, DIALOG_STYLE_MSGBOX, sprintf( "{FFFFFF}CAP NHAT GAN NHAT - %s", version ), stringDocFileTo, "Okay", "" );
	        }
	        x ++;
	    }
	    fclose( handle );
	}
	return 1;
}
Dialog:DIALOG_NULL(playerid, response, listitem, inputtext[]) 
{
	return 1;
}
Dialog:DIALOG_HUDSELECT(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	switch(SelectedHud[playerid]) {
		case 0: PlayerInfo[playerid][pShowHP] = listitem;
		case 1: PlayerInfo[playerid][pShowAP] = listitem;	
		case 2: {
			togalert[playerid] = listitem;
			UpdateVar(playerid, "TogAlert", listitem);
		}
		case 3: {
			PlayerInfo[playerid][pShowProgress][0] = listitem;
			UpdateVar(playerid, "ShowProgress1", listitem);
			if(listitem == 0) DestroyProgress(playerid, 0);
			else UpdateProgress(playerid, 0);
		}
		case 4: {
			PlayerInfo[playerid][pShowProgress][1] = listitem;
			UpdateVar(playerid, "ShowProgress2", listitem);
			if(listitem == 0) DestroyProgress(playerid, 1);
			else UpdateProgress(playerid, 1);
		}				
	}
	SendClientMessage(playerid, 0xFFADADFF, "Tuy chon HUD da duoc cap nhat!");
	Update(playerid, pShowHPx);
	Update(playerid, pShowAPx);
	return 1;
}
Dialog:DIALOG_EDITJOB(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	if(PlayerInfo[playerid][pAdmin] < 6) return 1;
	switch(listitem) {
		case 0: Dialog_Show(playerid, DIALOG_EDITJOB1, DIALOG_STYLE_INPUT, "Job Name:", "Viet ben duoi gia tri ban muon bien nay co.", "Ok", "Close");
		case 1: Dialog_Show(playerid, DIALOG_EDITJOB1, DIALOG_STYLE_INPUT, "Level:", "Viet ben duoi gia tri ban muon bien nay co.", "Ok", "Close");
		case 2: Dialog_Show(playerid, DIALOG_EDITJOB1, DIALOG_STYLE_INPUT, "Tip:", "Viet ben duoi gia tri ban muon bien nay co.", "Ok", "Close");
		case 3: Dialog_Show(playerid, DIALOG_EDITJOB1, DIALOG_STYLE_INPUT, "Skill 1 Veh:", "Viet ben duoi gia tri ban muon bien nay co.", "Ok", "Close");
		case 4: Dialog_Show(playerid, DIALOG_EDITJOB1, DIALOG_STYLE_INPUT, "Skill 2 Veh:", "Viet ben duoi gia tri ban muon bien nay co.", "Ok", "Close");
		case 5: Dialog_Show(playerid, DIALOG_EDITJOB1, DIALOG_STYLE_INPUT, "Skill 3 Veh:", "Viet ben duoi gia tri ban muon bien nay co.", "Ok", "Close");
		case 6: Dialog_Show(playerid, DIALOG_EDITJOB1, DIALOG_STYLE_INPUT, "Skill 4 Veh:", "Viet ben duoi gia tri ban muon bien nay co.", "Ok", "Close");
		case 7: Dialog_Show(playerid, DIALOG_EDITJOB1, DIALOG_STYLE_INPUT, "Skill 5 Veh:", "Viet ben duoi gia tri ban muon bien nay co.", "Ok", "Close");
		case 8: Dialog_Show(playerid, DIALOG_EDITJOB1, DIALOG_STYLE_INPUT, "Skill 6 Veh:", "Viet ben duoi gia tri ban muon bien nay co.", "Ok", "Close");
		case 9: Dialog_Show(playerid, DIALOG_EDITJOB1, DIALOG_STYLE_INPUT, "Job Bonus:", "Nhap %% luong ma job nhan them khi job do la job cua hom nay.", "Ok", "Close");
	}
	EditJob[playerid] = listitem;
	return 1;
}
Dialog:DIALOG_EDITJOB1(playerid, response, listitem, inputtext[]) 
{
	new
		amount = strval(inputtext),
		job = EditJobID[playerid],
		string[200], query[200];
	if(!response) {
		new szTitle[180], szDialog[1024];
		if(PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, 0xFFFFCCFF, AdminOnly);
		format(szDialog, sizeof(szDialog),
			"Cong viec\t\t%s\nCap do\t\t%d\nHop phap\t\t%d\n\
			Skilll 1 Veh\t\t%d\nSkill 2 Veh\t\t%d\nSkill 3 Veh\t\t%d\nSkill 4 Veh\t\t%d\nSkill 5 Veh\t\t%d\nSkill 6 Veh\t\t%d",
		JobInfo[job][jName], JobInfo[job][jLevel], JobInfo[job][jLegal], JobInfo[job][jSkill1Veh], JobInfo[job][jSkill2Veh], JobInfo[job][jSkill3Veh], JobInfo[job][jSkill4Veh],
		JobInfo[job][jSkill5Veh], JobInfo[job][jSkill6Veh]);
		format(szTitle, sizeof(szTitle), "Chinh sua job %d", job);
		Dialog_Show(playerid, DIALOG_EDITJOB, DIALOG_STYLE_TABLIST, szTitle, szDialog, "Ok", "Exit");
		EditJobID[playerid] = job;
		return 1;
	}
	if(PlayerInfo[playerid][pAdmin] < 6) return 1;
	switch(EditJob[playerid]) {
		case 0: {
			format(JobInfo[job][jName], 64, inputtext);
			format(string, sizeof(string), "Ban da chinh sua 'Job Name' cua Job ID %d, tro thanh: %s.", job, inputtext);
			SendClientMessage(playerid, COLOR_WHITE, string);
			DestroyDynamic3DTextLabel(JobInfo[job][jLabel]);
			DestroyDynamicPickup(JobInfo[job][jPickup]);
			format(string, sizeof(string), "{ffffff}ID: {AB0000}#%d{FFFFFF}\n{ffffff}Job: {AB0000}%s{FFFFFF}\nLevel: {AB0000}%d{FFFFFF}\n{FFFFFF}Bam {AB0000}Y{FFFFFF} de nhan cong viec.\n{FFFFFF}Bam {AB0000}N{FFFFFF} de thoat viec.", job, JobInfo[job][jName]);
			//CreateDynamic3DTextLabel(string,0xFFFFFFFF,JobInfo[job][jPosX], JobInfo[job][jPosY], JobInfo[job][jPosZ], INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 100.0);
			JobInfo[job][jLabel] = CreateDynamic3DTextLabel(string, 0xFFFFFFFF, JobInfo[job][jPosX], JobInfo[job][jPosY], JobInfo[job][jPosZ], 25, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, -1, -1, -1, 100.0);
			JobInfo[job][jPickup] = CreateDynamicPickup(1275, 23, JobInfo[job][jPosX], JobInfo[job][jPosY], JobInfo[job][jPosZ], -1, -1, -1, 100.0);
			mysql_format(SQL, query, sizeof(query), "UPDATE `jobs` SET `Name`='%s' WHERE `ID`='%d'", inputtext, job);
			mysql_tquery(SQL, query, "", "");
		}
		case 1: {
			JobInfo[job][jLevel] = amount;
			DestroyDynamic3DTextLabel(JobInfo[job][jLabel]);
			DestroyDynamicPickup(JobInfo[job][jPickup]);
			format(string, sizeof(string), "{ffffff}ID: {AB0000}#%d{FFFFFF}\n{ffffff}Job: {AB0000}%s{FFFFFF}\nLevel: {AB0000}%d{FFFFFF}\n{FFFFFF}Bam {AB0000}Y{FFFFFF} de nhan cong viec.\n{FFFFFF}Bam {AB0000}N{FFFFFF} de thoat viec.", job, JobInfo[job][jName]);
			JobInfo[job][jLabel] = CreateDynamic3DTextLabel(string, 0xFFFFFFFF, JobInfo[job][jPosX], JobInfo[job][jPosY], JobInfo[job][jPosZ], 25, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, -1, -1, -1, 100.0);
			JobInfo[job][jPickup] = CreateDynamicPickup(1275, 23, JobInfo[job][jPosX], JobInfo[job][jPosY], JobInfo[job][jPosZ], -1, -1, -1, 100.0);
			format(string, sizeof(string), "Ban da chinh sua 'Level' cua Job ID %d, tro thanh: %d.", job, amount);
			SendClientMessage(playerid, COLOR_WHITE, string);
			mysql_format(SQL, query, 55, "UPDATE `jobs` SET `NeedLevel`='%d' WHERE `ID`='%d'", amount, job);
			mysql_tquery(SQL, query, "", "");
		}
		case 2: {
			JobInfo[job][jLegal] = amount;
			format(string, sizeof(string), "Ban da chinh sua 'Legal' cua Job ID %d, tro thanh: %d.", job, amount);
			SendClientMessage(playerid, COLOR_WHITE, string);
			mysql_format(SQL, query, 50, "UPDATE `jobs` SET `Legal`='%d' WHERE `ID`='%d'", amount, job);
			mysql_tquery(SQL, query, "", "");
		}
		case 3: {
			JobInfo[job][jSkill1Veh] = amount;
			format(string, sizeof(string), "Ban da chinh sua 'Skill1Veh' cua Job ID %d, tro thanh: %d.", job, amount);
			SendClientMessage(playerid, COLOR_WHITE, string);
			mysql_format(SQL, query, 55, "UPDATE `jobs` SET `Skill1Veh`='%d' WHERE `ID`='%d'", amount, job);
			mysql_tquery(SQL, query, "", "");
		}
		case 4: {
			JobInfo[job][jSkill2Veh] = amount;
			format(string, sizeof(string), "Ban da chinh sua 'Skill2Veh' cua Job ID %d, tro thanh: %d.", job, amount);
			SendClientMessage(playerid, COLOR_WHITE, string);
			mysql_format(SQL, query, 55, "UPDATE `jobs` SET `Skill2Veh`='%d' WHERE `ID`='%d'", amount, job);
			mysql_tquery(SQL, query, "", "");
		}
		case 5: {
			JobInfo[job][jSkill3Veh] = amount;
			format(string, sizeof(string), "Ban da chinh sua 'Skill3Veh' cua Job ID %d, tro thanh: %d.", job, amount);
			SendClientMessage(playerid, COLOR_WHITE, string);
			mysql_format(SQL, query, 55, "UPDATE `jobs` SET `Skill3Veh`='%d' WHERE `ID`='%d'", amount, job);
			mysql_tquery(SQL, query, "", "");
		}
		case 6: {
			JobInfo[job][jSkill4Veh] = amount;
			format(string, sizeof(string), "Ban da chinh sua 'Skill4Veh' cua Job ID %d, tro thanh: %d.", job, amount);
			SendClientMessage(playerid, COLOR_WHITE, string);
			mysql_format(SQL, query, 55, "UPDATE `jobs` SET `Skill4Veh`='%d' WHERE `ID`='%d'", amount, job);
			mysql_tquery(SQL, query, "", "");
		}
		case 7: {
			JobInfo[job][jSkill5Veh] = amount;
			format(string, sizeof(string), "Ban da chinh sua 'Skill5Veh' cua Job ID %d, tro thanh: %d.", job, amount);
			SendClientMessage(playerid, COLOR_WHITE, string);
			mysql_format(SQL, query, 55, "UPDATE `jobs` SET `Skill5Veh`='%d' WHERE `ID`='%d'", amount, job);
			mysql_tquery(SQL, query, "", "");
		}
		case 8: {
			JobInfo[job][jSkill6Veh] = amount;
			format(string, sizeof(string), "Ban da chinh sua 'Skill6Veh' cua Job ID %d, tro thanh: %d.", job, amount);
			SendClientMessage(playerid, COLOR_WHITE, string);
			mysql_format(SQL, query, 55, "UPDATE `jobs` SET `Skill6Veh`='%d' WHERE `ID`='%d'", amount, job);
			mysql_tquery(SQL, query, "", "");
		}
		case 9: {
			JobInfo[job][jBonus] = amount;
			format(string, sizeof(string), "Ban da chinh sua 'Job Bonus' cua Job ID %d, tro thanh: %d.", job, amount);
			SendClientMessage(playerid, COLOR_WHITE, string);
			mysql_format(SQL, query, 50, "UPDATE `jobs` SET `Bonus`='%d' WHERE `ID`='%d'", amount, job);
			mysql_tquery(SQL, query, "", "");
		}
	}
	return 1;
}
Dialog:DIALOG_JOBS(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	SetPVarInt(playerid, "jListitem", listitem);
	Dialog_Show(playerid, DIALOG_JOBS1, DIALOG_STYLE_LIST, "Cong viec", "Xem huong dan\nDinh vi", "Select", "Cancel");
	return 1;
}
Dialog:DIALOG_JOBS1(playerid, response, listitem, inputtext[]) 
{
	if(!response) return callcmd::jobs(playerid, "");
	new string[200];
	if(listitem == 0) {
		switch(GetPVarInt(playerid, "jListitem")) {
			case 0: {
				strcat(string, "Job ID 1: Nong Dan\n");
				strcat(string, "*Chao mung ban den voi cong viec Nong dan. Ban co the bat dau lam viec bang lenh </startwork>, de ket thuc cong viec su dung lenh <stopwork>. Chuc ban choi game vui ve!");
			}
			case 1: {
				strcat(string, "Job ID 2: Trucker\n");
				strcat(string, "*Chao mung ban dedn voi cong viec Trucker. Ban co the bat dau lam viec bang lenh </startwork>, ban se duoc chon cac dia diem giao hang tuy vao ki nang Trucker, ki nang cang cao $ nhan duoc cang lon, de ket thuc cong viec su dung lenh </stopwork>. Chuc ban choi game vui ve!");
			}
			case 2: {
				strcat(string, "Job ID 3: Chat go\n");
				strcat(string, "*Chao mung ban den voi cong viec Chat go. Ban co the bat dau lam viec bang lenh <startwork>, ban se lai xe tai den 1 cai cay nao do va xuong xe dung phim ALT trai de tu dong chat go, sau khi chat go hay lai gan chiec xe tai bam phim <Y>, luu y phai hoan thanh trong vong 3phut neu khong cong viec se that bai, de ket thuc cong viec dung lenh </stopwork>. Chuc ban choi game vui ve!");		
			}
			case 3: {
				strcat(string, "Job ID 4: CarJacker\n");
				strcat(string, "*Chao mung ban den voi cong viec Car Jacker. Ban co the bat dau lam viec bang lenh </startwork> va leo len 1 chiec xe nao do trong Thanh pho mang no den Checkpoints se hoan thanh cong viec, de ket thuc cong viec su dung lenh <stopwork>. Chuc ban choi game vui ve!");		
			}
			case 4: {
				strcat(string, "Job ID 5: Tho che sung\n");
				strcat(string, "*Chao mung ban den voi cong viec Tho che sung. Ban co the bat dau lam viec bang lenh </startwork>, de ket thuc cong viec su dung lenh </stopwork>. Luu y Vat lieu co the mua bang lenh /getmats. Chuc ban choi game vui ve!");		
			}
			case 5: {
				strcat(string, "Job ID 6: Buon thuoc phien\n");
				strcat(string, "*Chao mung ban den voi cong viec Buon thuoc phien. Hay di vao DrugsHouse va su dung lenh </getdrugs>. Chuc ban choi game vui ve!");	
			}
			case 6: {
				strcat(string, "Job ID 7: Nguoi lam vuon\n");
				strcat(string, "*Chao mung ban den voi cong viec Nguoi lam vuon. Ban co the bat dau lam viec bang lenh </startwork>, de ket thuc cong viec su dung lenh </stopwork>. Chuc ban choi game vui ve!");
			}
			case 7: {
				strcat(string, "Job ID 8: Tham tu\n");
				strcat(string, "*Chao mung ban den voi cong viec Tham tu. Ban co the dinh vi mot nguoi choi bang cach su dung /timkiem <ID>, su dung </xoamuctieu> de huy tim kiem hoac checkpoints. Chuc ban choi game vui ve!");
			}
			case 8: {
				strcat(string, "Job ID 9: PizzaBoy\n");
				strcat(string, "*Chao mung ban den voi cong viec giao Pizza. Ban co the bat dau lam viec bang lenh </startwork>, de ket thuc cong viec su dung lenh </stopwork>. Chuc ban choi game vui ve!");		
			}
			case 9: {
				strcat(string, "Job ID 10: Chuyen phat nhanh\n");
				strcat(string, "*Chao mung ban den voi cong viec Chuyen phat nhanh. Ban co the bat dau lam viec bang lenh <startwork>, di den gan dia diem can giao hang va lay Buu pham bang phim <Y> phia sau xe, de ket thuc cong viec su dung </stopwork>. Chuc ban choi game vui ve!");		
			}
			case 10: {
				strcat(string, "Job ID 11: Fisherman LS\n");
				strcat(string, "*Chao mung ban den voi cong viec Cau ca. Ban co the bat dau lam viec bang lenh </cauca>, hay di den cua hang 24/7 gan nhat de ban ca. Chuc ban choi game vui ve!");		
			}
			/*
			case 10: {
				strcat(string, "Job ID 12: Phi cong");
				strcat(string, "*Chao mung ban den voi cong viec Phi cong. Ban co the bat dau lam viec bang lenh </startwork>, lai chiec may bay bay qua cac Checkpoint tren Ban do, de ket thuc cong viec su dung </stopwork>. Chuc ban choi game vui ve!");		
			}*/
			case 11, 15: {
				strcat(string, "Job ID 13: Nguoi keo hang\n");
				strcat(string, "*Chao mung ban den voi cong viec Nguoi keo hang. Ban co the bat dau lam viec bang lenh </startwork>, lay chiec xe roi di keo nhung thung hang tai Cang, de ket thuc cong viec su dung </stopwork>. Chuc ban choi game vui ve!");
			}
			/*
			case 12: {
				strcat(string, "Job ID 14: Giao bao");
				strcat(string, "*Chao mung ban den voi cong viec Giao bao. Ban co the bat dau lam viec bang lenh </startwork>, hay di den Checkpoints tren Ban do khi toi noi dung <Y> de lay bao tu chiec xe dap, de ket thuc cong viec su dung </stopwork>. Chuc ban choi game vui ve!");
				strcat(string, "*Chao mung ban den voi cong viec Giao bao. Ban co the bat dau lam viec bang lenh </startwork>, hay di den Checkpoints tren Ban do khi toi noi dung <Y> de lay bao tu chiec xe dap, de ket thuc cong viec su dung </stopwork>. Chuc ban choi game vui ve!");
			}*/
			default: strcat(string, "Huong dan dang duoc cap nhat hoac chua co.");
		}				
		Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Huong dan cong viec", string, "Ok", "Exit");
	} else {
		if(CP[playerid] != 0) return Dialog_Show(playerid, DIALOG_CHECKPOINT, DIALOG_STYLE_MSGBOX, "Checkpoint", "Mot cham do dang hoat dong.\nBan co muon xoa no khong? Neu muon, hay chon 'Ok'.", "Ok", "Exit");
		new j = GetPVarInt(playerid, "jListitem") + 1;
		format(string, sizeof(string), "Mot diem mau do da duoc dat tai job %s. Khoang cach: %0.2fm", JobInfo[j][jName], GetPlayerDistanceFromPoint(playerid, JobInfo[j][jPosX], JobInfo[j][jPosY], JobInfo[j][jPosZ]));
		SendClientMessage(playerid, COLOR_YELLOW, string);
		SetPlayerCheckpointEx(playerid, JobInfo[j][jPosX], JobInfo[j][jPosY], JobInfo[j][jPosZ], 1);
		CP[playerid] = 53;				
	}
	return 1;
}
Dialog:DIALOG_TRUCKER(playerid, response, listitem, inputtext[]) 
{
	if(!response) {
		JobWorking[playerid] = 0;
		PlayerTextDrawHide(playerid, JobTD);
		if(JobVehicle[playerid] != 0) { DestroyVehicle(JobVehicle[playerid]); JobVehicle[playerid] = 0; }
		if(Trailer[playerid] != 0) { DestroyVehicle(Trailer[playerid]); Trailer[playerid] = 0;  }
		PlayerTextDrawHide(playerid, InfosTD);
		DisablePlayerCheckpointEx(playerid);
		CP[playerid] = 0;
		JobVehicle[playerid] = 0;
		SendClientMessage(playerid, COLOR_GREY, "Cong viec that bai! Ban roi khoi xe.");	
		// Iter_Remove(IsSpeed, playerid);			
		return 1;
	}
	if(JobWorking[playerid] == 0) return 1;
	if(CP[playerid] == 52) return NightBot(playerid, "Dialog Cheat #3");
	if(listitem >= 2) {	
		new szDialog2[1024];
		strcat(szDialog2, "Danh muc\tLoai\tKy nang\n");
		strcat(szDialog2, "Quan ao\t{F21313}Hop phap\t1+\n");
		strcat(szDialog2, "Thuc pham\t{F21313}Hop phap\t1+\n");
		strcat(szDialog2, "Do noi that\t{F21313}Hop phap\t1+\n");
		strcat(szDialog2, "Chat no\t{F21313}Hop phap\t2+\n");
		strcat(szDialog2, "Sung\t{F21313}Bat hop phap\t3+\n");
		strcat(szDialog2, "Xe bi trom\t{F21313}Bat hop phap\t3+\n");
		if(listitem == 2) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Do noi that da het hang, xin hay doi!"), Dialog_Show(playerid, DIALOG_TRUCKER, DIALOG_STYLE_TABLIST_HEADERS, "Chon diem den", szDialog2, "Select", "Cancel");
		if(listitem == 3 && GetPlayerSkill(playerid) < 2) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: De thuc hien viec van chuyen do ban can ky nang 2+!"), Dialog_Show(playerid, DIALOG_TRUCKER, DIALOG_STYLE_TABLIST_HEADERS, "Chon diem den", szDialog2, "Select", "Cancel");
		if(listitem == 4 && GetPlayerSkill(playerid) < 3) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: De thuc hien viec van chuyen do ban can ky nang 3+!"), Dialog_Show(playerid, DIALOG_TRUCKER, DIALOG_STYLE_TABLIST_HEADERS, "Chon diem den", szDialog2, "Select", "Cancel");	
		if(listitem == 5 && GetPlayerSkill(playerid) < 3) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: De thuc hien viec van chuyen do ban can ky nang 3+!"), Dialog_Show(playerid, DIALOG_TRUCKER, DIALOG_STYLE_TABLIST_HEADERS, "Chon diem den", szDialog2, "Select", "Cancel");					
	}
		 
	CP[playerid] = 52;
	
	new Float:pX,Float:pY,Float:pZ,Float:vA;
	GetPlayerPos(playerid,pX,pY,pZ);
	GetVehicleZAngle(GetPlayerVehicleID(playerid),vA);
	if(listitem == 0) Trailer[playerid] = CreateVehicleEx(435, pX+6, pY+6, pZ+6, vA, -1, -1, -1);
	else if(listitem == 2) Trailer[playerid] = CreateVehicleEx(591, pX+6, pY+6, pZ+6, vA, -1, -1, -1);
	else if(listitem == 3) {
		Trailer[playerid] = CreateVehicleEx(584, pX+6, pY+6, pZ+6, vA, -1, -1, -1);
		SetVehicleHealth(Trailer[playerid], 500);
	}	
	else Trailer[playerid] = CreateVehicleEx(450, pX+6, pY+6, pZ+6, vA, -1, -1, -1);

	
	// cp pos

	
	SetPVarInt(playerid, "Category", listitem);
	new Float:truckX, Float:truckY, Float:truckZ;
	do {
		new rand = random(4);
		switch(listitem) {
			case 0: {
				// Clothes
				truckX = TruckClothesPos[rand][0];
				truckY = TruckClothesPos[rand][1];
				truckZ = TruckClothesPos[rand][2];
			}
			case 1: {
				// Food
				truckX = TruckFoodPos[rand][0];
				truckY = TruckFoodPos[rand][1];
				truckZ = TruckFoodPos[rand][2];
			}
			case 2: {
				// Furniture
				truckX = TruckFurniturePos[rand][0];
				truckY = TruckFurniturePos[rand][1];
				truckZ = TruckFurniturePos[rand][2];
			}	
			case 3: {
				// Explosib
				truckX = TruckExplosePos[rand][0];
				truckY = TruckExplosePos[rand][1];
				truckZ = TruckExplosePos[rand][2];
			}	
			case 4: {
				// Guns
				truckX = TruckGunPos[rand][0];
				truckY = TruckGunPos[rand][1];
				truckZ = TruckGunPos[rand][2];
			}	
			case 5: {
				// Stolen cars
				truckX = TruckStolenCar[rand][0];
				truckY = TruckStolenCar[rand][1];
				truckZ = TruckStolenCar[rand][2];
			}					
		}
	}
	while(GetPlayerDistanceFromPoint(playerid, truckX, truckY, truckZ) < 700.0);
	// if(GetVehicleModel(JobVehicle[playerid]) == 514) SetVehicleSpeedCap(JobVehicle[playerid], 98); 
	// else if(GetVehicleModel(JobVehicle[playerid]) == 515)  SetVehicleSpeedCap(JobVehicle[playerid], 113);
	SetPlayerCheckpointEx(playerid, truckX, truckY, truckZ, 5);
	defer AttachTrailer[1000](playerid);
	UpdateJobStats(playerid);
	return 1;
}
Dialog:DIALOG_LOGIN2(playerid, response, listitem, inputtext[]) 
{
	if(!response) return Kick(playerid);
	if(strlen(inputtext)) {
		new tmppass[64];
		mysql_escape_string(inputtext, tmppass);
		OnPlayerLoginEx(playerid, tmppass);
	}
	else {
		new string[200];
		format(string,sizeof(string),"Mat khau ban vua nhap khong chinh xac!\nHay nhap chinh xac mat khau, neu khong ban se bi kick!",GetName(playerid));
		Dialog_Show(playerid, DIALOG_LOGIN3,DIALOG_STYLE_PASSWORD,"Dang nhap",string,"Dang nhap","Quit");
		gPlayerLogTries[playerid] += 1;				
		if(gPlayerLogTries[playerid] < 3) format(string, sizeof(string), "Mat khau khong chinh xac! Ban con %d lan thu lai.", 3-gPlayerLogTries[playerid]);
		else format(string, sizeof(string), "Mat khau khong chinh xac! Ban da su dung het so lan thu dang nhap.", 3-gPlayerLogTries[playerid]);
		SendClientMessage(playerid, COLOR_WARNING, string);		
		if(gPlayerLogTries[playerid] == 3) KickEx(playerid);
	}
	return 1;
}
Dialog:DIALOG_LOGIN3(playerid, response, listitem, inputtext[]) 
{
	if(!response) return Kick(playerid);
	if(IsPlayerLogged[playerid] == 1) return NightBot(playerid, "Dialog Cheat #2");
	if(strlen(inputtext)) {
		new tmppass[64];
		mysql_escape_string(inputtext, tmppass);
		OnPlayerLoginEx(playerid,tmppass);
	}
	else {
		new string[200];
		format(string,sizeof(string),"Mat khau ban vua nhap khong chinh xac!\nHay nhap chinh xac mat khau, neu khong ban se bi kick!",GetName(playerid));
		Dialog_Show(playerid, DIALOG_LOGIN3,DIALOG_STYLE_PASSWORD,"Dang nhap",string,"Dang nhap","Quit");
		gPlayerLogTries[playerid] += 1;				
		if(gPlayerLogTries[playerid] < 3) format(string, sizeof(string), "Mat khau khong chinh xac! Ban con %d lan thu lai.", 3-gPlayerLogTries[playerid]);
		else format(string, sizeof(string), "Mat khau khong chinh xac! Ban da su dung het so lan thu dang nhap.", 3-gPlayerLogTries[playerid]);
		SendClientMessage(playerid, COLOR_WARNING, string);			
		if(gPlayerLogTries[playerid] == 3) KickEx(playerid);
	}
	return 1;
}
Dialog:DIALOG_LOGIN1(playerid, response, listitem, inputtext[]) 
{
	if(strlen(inputtext) >= 6 && strlen(inputtext) <= 30) {
		new tmppass[64];
		mysql_escape_string(inputtext, tmppass);
		OnPlayerRegister(playerid,tmppass);
	}
	else {
		new string[200];
		format(string, sizeof(string), "Chao mung, %s!\nTai khoan cau ban chua ai dang ky het.\nDe co the dang ky, xin hay nhap mat khau vao phia duoi.\n{FFA1A1}Mat khau cua ban can co it nhat 6 ky tu!",GetName(playerid));
		Dialog_Show(playerid, DIALOG_LOGIN1, DIALOG_STYLE_PASSWORD, "Dang ky", string, "Dang ky", "Thoat");
	}
	return 1;
}
Dialog:DIALOG_REGISTER(playerid, response, listitem, inputtext[]) 
{
	if(response) {
		PlayerInfo[playerid][pSex] = 1;
		SendClientMessage(playerid, 0xFFDE96FF, "Gender: Male.");
		Dialog_Show(playerid, DIALOG_REGISTER2, DIALOG_STYLE_INPUT,"Dang ky:","Nhap tuoi ma ban muon dat cho nhan vat cua minh:","Ok","");
		RegistrationStep[playerid] = 2;
		SetPlayerInterior(playerid, 0);
		SetPlayerSkinEx(playerid, 250);
		PlayerInfo[playerid][pModel] = 250;
	}
	else {
		PlayerInfo[playerid][pSex] = 2;
		SendClientMessage(playerid, 0xFFDE96FF, "Gender: Female.");
		Dialog_Show(playerid, DIALOG_REGISTER2,DIALOG_STYLE_INPUT,"Dang ky:","Nhap tuoi ma ban muon dat cho nhan vat cua minh:","Ok","");
		RegistrationStep[playerid] = 2;
		SetPlayerInterior(playerid, 0);
		SetPlayerSkinEx(playerid, 192);
		PlayerInfo[playerid][pModel] = 192;
	}
	new query[200];
	format(query, sizeof(query), "UPDATE users SET `Sex`='%d',`Model`='%d' WHERE `ID`='%d'",PlayerInfo[playerid][pSex], PlayerInfo[playerid][pModel], PlayerInfo[playerid][pSQLID]);
	mysql_query(SQL,query);		
	return 1;
}
Dialog:DIALOG_REGISTER2(playerid, response, listitem, inputtext[]) 
{
	new tmppass[64];
	mysql_escape_string(inputtext, tmppass);
	new age = strval(tmppass);
	if(age > 7 && age < 50 && response) {
		PlayerInfo[playerid][pAge] = age;
		va_mysql_query("UPDATE users SET `Age`='%d' WHERE `ID`='%d'",PlayerInfo[playerid][pAge],PlayerInfo[playerid][pSQLID]);
		va_SendClientMessage(playerid, 0xFFDE96FF, "Age: %d.",age);
		RegistrationStep[playerid] = 4;
		Dialog_Show(playerid, DIALOG_REGISTER4, DIALOG_STYLE_INPUT, "Dang ky:", "Nhap dia chi email cua ban vao phia duoi!\nVi du: taikhoan@gmail.com\n", "Ok", "Bo qua");
		SetPlayerInterior(playerid, 0);
	}
	else return Dialog_Show(playerid, DIALOG_REGISTER2,DIALOG_STYLE_INPUT,"Dang ky:","Nhap tuoi ma ban muon dat cho nhan vat cua minh:","Ok","");
	return 1;
}
Dialog:DIALOG_REGISTER4(playerid, response, listitem, inputtext[]) 
{
	if(!response) {
		SendClientMessage(playerid, 0xFFDE96FF, "Ban co the cap nhat email bat cu luc nao tai "#UCP".");
		Dialog_Show(playerid, DIALOG_REGISTER5, DIALOG_STYLE_INPUT, "Gioi thieu nguoi choi:", "Ban co duoc ai moi den cong dong nay khong?\nNeu co, hay nhap ID cua nguoi do vao phia duoi. Hoac ban cung co the chon nut Bo Qua.", "Ok", "Bo qua");
		return 1;
	}
	new length = strlen(inputtext);
	if(length > 40) return Dialog_Show(playerid, DIALOG_REGISTER4, DIALOG_STYLE_INPUT, "Dang ky:", "Nhap dia chi email cua ban vao phia duoi!\nVi du: taikhoan@gmail.com\n\nEmail khong hop le!", "Ok", "Bo qua");
	if(IsMail(inputtext) && response && strlen(inputtext) < 30) {
		new emailtext[64];
		mysql_escape_string(inputtext, emailtext);
		strmid(PlayerInfo[playerid][pEmail], emailtext, 0, strlen(emailtext), 64);
		new str1[120];
		format(str1,120,"UPDATE users SET `Email`='%s' WHERE `ID`='%d'",PlayerInfo[playerid][pEmail],PlayerInfo[playerid][pSQLID]);
		mysql_query(SQL,str1);
		format(str1, sizeof(str1), "Email da duoc set: %s.", PlayerInfo[playerid][pEmail]);
		SendClientMessage(playerid, 0xFFDE96FF, str1);
		Dialog_Show(playerid, DIALOG_REGISTER5, DIALOG_STYLE_INPUT, "Gioi thieu nguoi choi:", "Ban co duoc ai moi den cong dong nay khong?\nNeu co, hay nhap ID cua nguoi do vao phia duoi. Hoac ban cung co the chon nut Bo Qua.", "Ok", "Bo qua");
		return 1;
	}
	else Dialog_Show(playerid, DIALOG_REGISTER4, DIALOG_STYLE_INPUT, "Dang ky:", "Nhap dia chi email cua ban vao phia duoi!\nVi du: taikhoan@gmail.com\n\nEmail khong hop le!", "Ok", "Bo qua");
	return 1;
}
Dialog:DIALOG_REGISTER5(playerid, response, listitem, inputtext[]) 
{
	if(!response) {
		PlayerInfo[playerid][pTut] = 1; gOoc[playerid] = 0; gNews[playerid] = 0; gFam[playerid] = 0;
		ResetPlayerCash(playerid);
		GivePlayerCash(playerid, 15000);
		PlayerInfo[playerid][pAccount] = 20000;				
		new string[200];	
		format(string, sizeof(string), "UPDATE users SET `Tutorial`='1',`Bank`='20000',`Money`='15000' WHERE `name`='%s'",GetName(playerid));
		mysql_query(SQL, string);
		format(string, sizeof(string), "%s(%d) da dang ky vao may chu. [#%d]", GetName(playerid), playerid, PlayerInfo[playerid][pSQLID]);
		SendAdminMessage(COLOR_LIGHTRED, string, 1);
		TogglePlayerSpectating(playerid, true);
		TutorialTime(playerid);
		return 1;				
	}
	else {
		new szQuery[256], id = strval(inputtext), Cache: result;
		if(id == PlayerInfo[playerid][pSQLID]) {
			SendClientMessage(playerid, COLOR_WARNING, "Ban khong the nhap ID cua chinh minh!");
			Dialog_Show(playerid, DIALOG_REGISTER5, DIALOG_STYLE_INPUT, "Gioi thieu nguoi choi:", "Ban co duoc ai moi den cong dong nay khong?\nNeu co, hay nhap ID cua nguoi do vao phia duoi. Hoac ban cung co the chon nut Bo Qua.", "Ok", "No");	
			return 1;
		}
		format(szQuery, sizeof(szQuery), "SELECT * FROM `users` WHERE `id`='%d' LIMIT 1", id);
		result = mysql_query(SQL, szQuery);
		new test = cache_num_rows();
		cache_delete(result);
		if(test == 0) return Dialog_Show(playerid, DIALOG_REGISTER5, DIALOG_STYLE_INPUT, "Gioi thieu nguoi choi:", "Ban co duoc ai moi den cong dong nay khong?\nNeu co, hay nhap ID cua nguoi do vao phia duoi. Hoac ban cung co the chon nut Bo Qua.\n{FFA1A1}Referral ID invalid!", "Ok", "No");
		new name[64];
		format(szQuery, sizeof(szQuery), "SELECT * FROM `users` WHERE `ID`='%d'", id);
		result = mysql_query(SQL, szQuery);
		if(cache_num_rows()) cache_get_value_name(0, "name", name);
		cache_delete(result);
		SetPVarInt(playerid, "Referral", id);
		format(szQuery, sizeof(szQuery), "Ban co chac chan rang %s da gioi thieu ban den' cong dong?", name);
		Dialog_Show(playerid, DIALOG_REGISTER6, DIALOG_STYLE_MSGBOX, "Gioi thieu nguoi choi:", szQuery, "Ok", "Back");
	}
	return 1;
}
Dialog:DIALOG_REGISTER6(playerid, response, listitem, inputtext[]) 
{
	if(!response) return Dialog_Show(playerid, DIALOG_REGISTER5, DIALOG_STYLE_INPUT, "Gioi thieu nguoi choi:", "Ban co duoc ai moi den cong dong nay khong?\nNeu co, hay nhap ID cua nguoi do vao phia duoi. Hoac ban cung co the chon nut Bo Qua.", "Ok", "Close");
	new id = GetPVarInt(playerid, "Referral"), string[200];
	foreach(new i: Player) {
		if(IsPlayerConnected(i) && PlayerInfo[i][pSQLID] == id) {
			format(string, sizeof(string), "Cam on ban da gioi thieu %s(%d) den cong dong!", GetName(playerid), playerid);
			SendClientMessage(i, COLOR_MONEY, string);
		}
	}
	UpdateVar(playerid, "Referral", id);
	PlayerInfo[playerid][pReferral] = id;

	PlayerInfo[playerid][pTut] = 1; gOoc[playerid] = 0; gNews[playerid] = 0; gFam[playerid] = 0;
	ResetPlayerCash(playerid);
	GivePlayerCash(playerid, 15000);
	PlayerInfo[playerid][pAccount] = 20000;					
	format(string, sizeof(string), "UPDATE users SET `Tutorial`='1',`Bank`='20000',`Money`='15000' WHERE `name`='%s'",GetName(playerid));
	mysql_query(SQL, string);
	format(string, sizeof(string), "%s(%d) da dang ky vao may chu. [#%d]", GetName(playerid), playerid, PlayerInfo[playerid][pSQLID]);
	SendAdminMessage(COLOR_LIGHTRED, string, 1);				
	TutorialTime(playerid);
	return 1;
}
Dialog:DIALOG_TRANSFER(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	if(TradeID[playerid] != -1) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the su dung thao tac nay khi ban dang trong mot cuoc giao dich!");
	new cashbank = TransferMoney[playerid]/100;
	if(PlayerInfo[playerid][pAccount] < TransferMoney[playerid]+cashbank) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong co du so tien nay trong tai khoan ngan hang de tien hanh chuyen tien!");
	PlayerInfo[playerid][pAccount] -= TransferMoney[playerid]+cashbank;

	// Tax
	new moneyLeft = PayTax(playerid, TransferMoney[playerid], e_CHUYEN_TIEN);

	PlayerInfo[TransferOffer[playerid]][pAccount] += moneyLeft;
	BizzInfo[InBussines[playerid]][bTill] += cashbank;
	new string[200], query[200];
	format(string, sizeof(string), "Ban da chuyen $%s vao tai khoan ngan hang cua %s. Thue: $%s", FormatNumber(moneyLeft), GetName(TransferOffer[playerid]),FormatNumber(cashbank + (TransferMoney[playerid] - moneyLeft)));
	PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	SendClientMessage(playerid, COLOR_MONEY, string);

	format(string, sizeof(string), "Ban nhan duoc $%s vao tai khoan ngan hang, duoc chuyen boi %s.", FormatNumber(moneyLeft), GetName(playerid), playerid);
	SendClientMessage(TransferOffer[playerid], COLOR_MONEY, string);
	
	if(CountIP(GetIP(playerid)) > 1) {
		format(string, sizeof(string), "($) %s chuyen $%s cho %s (cung mot IP).", GetName(playerid), FormatNumber(moneyLeft), GetName(TransferOffer[playerid]));
		SendAdminMessage(COLOR_YELLOW, string,1);
	}
	format(string, sizeof(string), "($) %s chuyen $%s cho %s.", GetName(playerid), FormatNumber(moneyLeft), GetName(TransferOffer[playerid]));
	Log("logs/trade.log", string);	
	PlayerPlaySound(TransferOffer[playerid], 1052, 0.0, 0.0, 0.0);
	Update(playerid, pBank);
	Update(TransferOffer[playerid], pBank);
	format(query,sizeof(query),"UPDATE `bizz` SET `Till`='%d' WHERE `ID`='%d'",BizzInfo[InBussines[playerid]][bTill], InBussines[playerid]);
	mysql_query(SQL,query);
	new ip1[42],ip2[42];
	GetPlayerIp(playerid,ip1,sizeof(ip1));
	GetPlayerIp(TransferOffer[playerid],ip2,sizeof(ip2));
	Transferlog(ip2,ip1,PlayerInfo[TransferOffer[playerid]][pSQLID],PlayerInfo[playerid][pSQLID],moneyLeft);
	TransferOffer[playerid] = 999;
	TransferMoney[playerid] = 0;
	return 1;
}
Dialog:DIALOG_NEWPASS(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	if(strcmp(inputtext, PlayerInfo[playerid][pKey])) {
		SendClientMessage(playerid, COLOR_WARNING, "Mat khau khong dung!");
		return 1;
	}
	Dialog_Show(playerid, DIALOG_NEWPASS1,DIALOG_STYLE_INPUT, "Doi mat khau","Nhap mat khau moi:","Ok","Close");
	return 1;
}
Dialog:DIALOG_NEWPASS1(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new length = strlen(inputtext);
	if(length == 0 || length > 15) return Dialog_Show(playerid, DIALOG_NEWPASS1,DIALOG_STYLE_INPUT, "Change password","Nhap mat khau ma ban muon co.","Ok","Close");
	if(strlen(inputtext) > 1 && strlen(inputtext) < 16) {
		new emailtext[64];
		mysql_escape_string(inputtext, emailtext);
		format(PlayerInfo[playerid][pKey], 50, emailtext);
		new str1[200];
		format(str1,sizeof(str1),"UPDATE users SET `password`='%s' WHERE `ID`='%d'",PlayerInfo[playerid][pKey],PlayerInfo[playerid][pSQLID]);
		mysql_query(SQL,str1);
		format(str1, sizeof(str1), "Mat khau moi cua ban la %s.", inputtext);
		Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "New password", str1, "Ok", "");
		format(str1, sizeof(str1), "Mat khau da duoc thay doi!");
		SendClientMessage(playerid, COLOR_YELLOW,str1);
	}
	else Dialog_Show(playerid, DIALOG_NEWPASS1,DIALOG_STYLE_INPUT, "Thay doi mat khau:","Nhap mat khau ma ban muon doi thanh.","Ok","Exit");
	return 1;
}
Dialog:DIALOG_STORE(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	if(InBussines[playerid] == -1) return SendClientMessage(playerid, -1, "Ban khong o trong biz 24/7.");
	new string[200], query[200];
	switch(listitem) {
		case 0: { 
			if(GetPlayerCash(playerid) < 25000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du tien de mua vat pham nay.");
			new tel[16];
			format(tel, 256, "%d", PlayerInfo[playerid][pPhone]);								
			if(strlen(tel) == 4) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the mua mot dien thoai khac vi ban da co iPhone!");
			GivePlayerCash(playerid,-25000);
			BizzInfo[InBussines[playerid]][bTill] += 25000; // BUG: Attempted to read/write array element at negative index -1
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			new randphone = 5000 + random(9999) + 5000 ;
			PlayerInfo[playerid][pPhone] = randphone;
			format(string, sizeof(string), "Ban da mua mot dien thoai va so dien thoai cua ban la %d.", randphone);
			SendClientMessage(playerid, COLOR_WHITE, string);
			format(query,sizeof(query),"UPDATE users SET `Money`='%d',`PhoneNr`='%d' WHERE `ID`='%d'",GetPlayerCash(playerid),PlayerInfo[playerid][pPhone],PlayerInfo[playerid][pSQLID]);
			mysql_query(SQL,query);
			format(query,sizeof(query),"UPDATE `bizz` SET `Till`='%d',`Products`='%d' WHERE `ID`='%d'",BizzInfo[InBussines[playerid]][bTill],BizzInfo[InBussines[playerid]][bProducts],InBussines[playerid]);
			mysql_query(SQL,query,false);

			if(PlayerInfo[playerid][pNewbieStep] == 1) defer CLOTutorial(playerid);
		}
		case 1: {
			if(GetPlayerCash(playerid) < 10000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du tien de mua vat pham nay.");
			GivePlayerCash(playerid,-10000);
			BizzInfo[InBussines[playerid]][bTill] += 10000;
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			PlayerInfo[playerid][pPhoneBook] = 1;
			SendClientMessage(playerid, COLOR_WHITE, "Ban da mua mot danh ba. Su dung /number de xem so dien thoai cua mot nguoi choi (hoac ban co the TAB va click vao mot nguoi choi).");
			format(query,sizeof(query),"UPDATE users SET `Money`='%d',`Phonebook`='%d' WHERE `ID`='%d'",GetPlayerCash(playerid),PlayerInfo[playerid][pPhoneBook],PlayerInfo[playerid][pSQLID]);
			mysql_query(SQL,query);
			format(query,sizeof(query),"UPDATE `bizz` SET `Till`='%d',`Products`='%d' WHERE `ID`='%d'",BizzInfo[InBussines[playerid]][bTill],BizzInfo[InBussines[playerid]][bProducts],InBussines[playerid]);
			mysql_query(SQL,query, false);
		}
		case 2: {
			if(GetPlayerCash(playerid) < 30000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du tien de mua vat pham nay.");
			GivePlayerCash(playerid, - 30000);
			BizzInfo[InBussines[playerid]][bTill] += 30000;			
			PlayerInfo[playerid][pWTalkie] = 1;
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_WHITE, "Ban da mua mot radio chay tan so. Su dung /setfreq de dat tan so.");
			format(query,sizeof(query),"UPDATE users SET `Money`='%d', `WTalkie`='1' WHERE `ID`='%d'",GetPlayerCash(playerid),PlayerInfo[playerid][pSQLID]);
			mysql_query(SQL,query);
			format(query,sizeof(query),"UPDATE `bizz` SET `Till`='%d',`Products`='%d' WHERE `ID`='%d'",BizzInfo[InBussines[playerid]][bTill],BizzInfo[InBussines[playerid]][bProducts],InBussines[playerid]);
			mysql_query(SQL,query, false);
		}
		case 3: {
			if(GetPlayerCash(playerid) < 7000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du tien de mua vat pham nay.");
			if(PlayerInfo[playerid][pLighter] != 0) return SendClientMessage(playerid, COLOR_WHITE, "Ban da mua mot bat lua.");
			GivePlayerCash(playerid, - 7000);
			BizzInfo[InBussines[playerid]][bTill] += 7000;			
			PlayerInfo[playerid][pLighter] = 10;
			SendClientMessage(playerid, -1, "Ban da mua mot bat lua.");
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			format(query,sizeof(query),"UPDATE users SET `Money`='%d' WHERE `ID`='%d'",GetPlayerCash(playerid),PlayerInfo[playerid][pSQLID]);
			mysql_query(SQL,query, false);
			format(query,sizeof(query),"UPDATE `bizz` SET `Till`='%d',`Products`='%d' WHERE `ID`='%d'",BizzInfo[InBussines[playerid]][bTill],BizzInfo[InBussines[playerid]][bProducts],InBussines[playerid]);
			mysql_query(SQL,query, false);
		}
		case 4: {
			if(GetPlayerCash(playerid) < 10000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du tien de mua vat pham nay.");
			if(checkslotinv(playerid) == 24) return SendClientMessage(playerid, -1, "Tui do cua ban da day.");
			if (Inventory_Count(playerid, "Smoke") != 0) return SendClientMessage(playerid, -1, "Ban da co thuoc la.");
			GivePlayerCash(playerid, - 10000);
			BizzInfo[InBussines[playerid]][bTill] += 10000;		
			if(Inventory_GetFreeID(playerid, 1) == -1) Inventory_Add(playerid,"Smoke", 19897, 10, 2);
			else Inventory_Add(playerid,"Smoke", 19897, 10, 1);
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_WHITE, "Ban da mua thuoc la. De hut thuoc hay su dung [/tuido].");
			format(query,sizeof(query),"UPDATE users SET `Money`='%d' WHERE `ID`='%d'",GetPlayerCash(playerid),PlayerInfo[playerid][pSQLID]);
			mysql_query(SQL,query, false);
			format(query,sizeof(query),"UPDATE `bizz` SET `Till`='%d',`Products`='%d' WHERE `ID`='%d'",BizzInfo[InBussines[playerid]][bTill],BizzInfo[InBussines[playerid]][bProducts],InBussines[playerid]);
			mysql_query(SQL,query, false);
		}
		case 5: {
			if(GetPlayerCash(playerid) < 20000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du tien de mua vat pham nay.");
			if(PlayerInfo[playerid][pGasCan] != 0) return SendClientMessage(playerid, COLOR_WHITE, "Ban da so huu mot Gas Can du phong.");
			GivePlayerCash(playerid, - 20000);
			BizzInfo[InBussines[playerid]][bTill] += 20000;				
			PlayerInfo[playerid][pGasCan] = 1;
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_WHITE, "Ban da mua mot Gas Can. De do xang khi xe het xang giau chung, hay su dung /fillgascan.");
			format(query,sizeof(query),"UPDATE users SET `Money`='%d', `GasCan`='1' WHERE `ID`='%d'",GetPlayerCash(playerid),PlayerInfo[playerid][pSQLID]);
			mysql_query(SQL,query, false);
			format(query,sizeof(query),"UPDATE `bizz` SET `Till`='%d',`Products`='%d' WHERE `ID`='%d'",BizzInfo[InBussines[playerid]][bTill],BizzInfo[InBussines[playerid]][bProducts],InBussines[playerid]);
			mysql_query(SQL,query, false);
		}
		case 6: {
			if(GetPlayerCash(playerid) < 70000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du tien de mua vat pham nay.");
			GivePlayerCash(playerid, - 70000);
			BizzInfo[InBussines[playerid]][bTill] += 70000;				
			ServerWeapon(playerid, 43, 50);
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_WHITE, "Ban da mua mot Camera ky thuat so voi gia $70,000.");
			format(query,sizeof(query),"UPDATE users SET `Money`='%d' WHERE `ID`='%d'",GetPlayerCash(playerid),PlayerInfo[playerid][pSQLID]);
			mysql_query(SQL,query, false);
			format(query,sizeof(query),"UPDATE `bizz` SET `Till`='%d',`Products`='%d' WHERE `ID`='%d'",BizzInfo[InBussines[playerid]][bTill],BizzInfo[InBussines[playerid]][bProducts],InBussines[playerid]);
			mysql_query(SQL,query, false);
		}
		case 7: {
			if(GetPlayerCash(playerid) < 5000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du tien de mua vat pham nay.");
			if(PlayerInfo[playerid][pBackpack] != 0) return SendClientMessage(playerid, COLOR_WHITE, "Ban da co mot backpack!");
			BizzInfo[InBussines[playerid]][bTill] += 5000;				
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);					
			SendClientMessage(playerid, COLOR_WHITE, "Ban da mua backpack voi gia $5,000. De quan ly tui, hay su dung /backpack.");
			format(query,sizeof(query),"UPDATE users SET `Money`='%d', `Backpack`='1' WHERE `ID`='%d'",GetPlayerCash(playerid),PlayerInfo[playerid][pSQLID]);
			mysql_query(SQL,query, false);
			format(query,sizeof(query),"UPDATE `bizz` SET `Till`='%d',`Products`='%d' WHERE `ID`='%d'",BizzInfo[InBussines[playerid]][bTill],BizzInfo[InBussines[playerid]][bProducts],InBussines[playerid]);
			mysql_query(SQL,query, false);					
			PlayerInfo[playerid][pBackpack] = 1;
			SetPlayerAttachedObject( playerid, 8, 3026, 1, -0.172813, -0.112569, -0.022387, 0.000000, 0.000000, 3.390071, 1.000000, 1.000000, 1.130721);					
		}
		case 8: {
			// format(string, sizeof(string), "Item\tGia\n");
			// strcat(string, "{FFFFFF}Can cau\t{25B336}$5,000\n");
			// strcat(string, "{FFFFFF}Moi cau x5\t{25B336}$10,000\n");
			// strcat(string, "{FFFFFF}Moi cau x10\t{25B336}$20,000\n");
			format(string, sizeof(string), "Dang cap nhat!");
			Dialog_Show(playerid, 0,DIALOG_STYLE_MSGBOX,"Mua:",string,"Ok","Close");
		}
	}
	return 1;
}
Dialog:DIALOG_USEDRUGS(playerid, response, listitem, inputtext[]) {
    if(!response) return 1;
    switch(listitem) {
    	case 0:  {
    		if(PlayerInfo[playerid][pMatuy1]<1) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co du Indica.");
            else {
            	PlayerInfo[playerid][pMatuy1]--;
            	Update(playerid, pMatuy1x);
            }	
    	}
    	case 1: {
    		if(PlayerInfo[playerid][pMatuy2]<1) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co du Sativa.");
    	    else {
            	PlayerInfo[playerid][pMatuy2]--;
            	Update(playerid, pMatuy2x);	
    	    }
    	}
    }
    if(UsingDrugs[playerid] != 0) return SendClientMessage(playerid, COLOR_WHITE, "Ban dang phe can!");
    if(IsPlayerInRangeOfPoint(playerid, 300.0, -1423.5153,935.8321,1036.4756)) return SendClientMessage(playerid, -1, "Ban khong the su dung ma tuy khi dang trong Event Arena.");
	if(PaintType[playerid] != 0) return SendClientMessage(playerid, -1, "Ban khong the su dung ma tuy khi dang trong Paintball!");
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban dang ngoi trong xe!");
	PlayerStoned[playerid] += 2;
	new sendername[25];
	GetPlayerName(playerid, sendername, sizeof(sendername));
	Freezed[playerid] = 1;
	new string[90];
	format(string, sizeof(string), "%s lay mot goi bot mau trang ra, dot len va hit lay hit de.", sendername);
	ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	SendClientMessage(playerid, COLOR_WHITE, "Xin hay doi 30 giay de thuoc phat huy het tac dung.");
	UsingDrugs[playerid] = 1;
	drug[playerid] = defer DrugEffectGone[30000](playerid);
	LoopingAnim(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
	for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
		if(PlayerInfo[playerid][pDailyMission][m] == 13) CheckMission(playerid, m);	
	}
	return 1;		
}
Dialog:DIALOG_INVENTORY(playerid, response, listitem, inputtext[]) {
	if(!response) return 1;
	new id = playerDialogID[playerid], Float:health;
	new yourskill = GetPlayerSkill(playerid), x, strings[128], string[200], totalmony =0 ;
	switch(listitem) {
		
		case 0: {
			/*switch(invData[playerid][id][invExists]) {
				case 1: {
					if(strmatch("Sativa", invData[playerid][id][invItem])) {
						if(gettime() < GetPVarInt(playerid, "ChoDoi")) return SCMf(playerid, COLOR_LGREEN, ">> Vui long doi %d giay!", GetPVarInt(playerid, "ChoDoi") - gettime());
						if (Inventory_Count(playerid, "Sativa") < 2) return SendClientMessage(playerid, -1, "Ban can it nhat 2 grams Sativa.");
						if(UsingDrugs[playerid] != 0) return SendClientMessage(playerid, COLOR_WHITE, "Ban dang phe can!");
					    if(IsPlayerInRangeOfPoint(playerid, 300.0, -1423.5153,935.8321,1036.4756)) return SendClientMessage(playerid, -1, "Ban khong the su dung ma tuy khi dang trong Event Arena.");
						if(PaintType[playerid] != 0) return SendClientMessage(playerid, -1, "Ban khong the su dung ma tuy khi dang trong Paintball!");
						if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban dang ngoi trong xe!");
						PlayerStoned[playerid] += 2;
						new sendername[25];
						GetPlayerHealthEx(playerid, health);
						// if(health > 95) return Error(playerid, "You can't eat, your health is full.");
						if(health < 85) {
							SetPlayerHealthEx(playerid, health + random(20));
						}
						GetPlayerName(playerid, sendername, sizeof(sendername));
						Freezed[playerid] = 1;
						//new string[90];
						format(string, sizeof(string), "%s lay mot goi bot mau trang ra, dot len va hit lay hit de.", sendername);
						ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						SendClientMessage(playerid, COLOR_WHITE, "Xin hay doi 30 giay de thuoc phat huy het tac dung.");
						UsingDrugs[playerid] = 1;
						drug[playerid] = defer DrugEffectGone[30000](playerid);
						LoopingAnim(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
						for(new m; m < 5; m++) {
							if(PlayerInfo[playerid][pDailyMission][m] == 13) CheckMission(playerid, m);	
						}
						Inventory_Remove(playerid, "Sativa", invData[playerid][id][invExists]);
					}
					if(strmatch("Indica", invData[playerid][id][invItem])) {
						if(gettime() < GetPVarInt(playerid, "ChoDoi")) return SCMf(playerid, COLOR_LGREEN, ">> Vui long doi %d giay!", GetPVarInt(playerid, "ChoDoi") - gettime());
						if (Inventory_Count(playerid, "Indica") < 2) return SendClientMessage(playerid, -1, "Ban can it nhat 2 grams Indica.");
						if(UsingDrugs[playerid] != 0) return SendClientMessage(playerid, COLOR_WHITE, "Ban dang phe can!");
					    if(IsPlayerInRangeOfPoint(playerid, 300.0, -1423.5153,935.8321,1036.4756)) return SendClientMessage(playerid, -1, "Ban khong the su dung ma tuy khi dang trong Event Arena.");
						if(PaintType[playerid] != 0) return SendClientMessage(playerid, -1, "Ban khong the su dung ma tuy khi dang trong Paintball!");
						if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban dang ngoi trong xe!");
						PlayerStoned[playerid] += 2;
						new sendername[25];
						GetPlayerName(playerid, sendername, sizeof(sendername));
						Freezed[playerid] = 1;
						if(health < 85) {
							SetPlayerHealthEx(playerid, health + random(20));
						}
						//new string[90];
						format(string, sizeof(string), "%s lay mot goi bot mau trang ra, dot len va hit lay hit de.", sendername);
						ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						SendClientMessage(playerid, COLOR_WHITE, "Xin hay doi 30 giay de thuoc phat huy het tac dung.");
						UsingDrugs[playerid] = 1;
						drug[playerid] = defer DrugEffectGone[30000](playerid);
						LoopingAnim(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
						for(new m; m < 5; m++) {
							if(PlayerInfo[playerid][pDailyMission][m] == 13) CheckMission(playerid, m);	
						}
						Inventory_Remove(playerid, "Sativa", invData[playerid][id][invExists]);
					}
					if(strmatch("C.B.D", invData[playerid][id][invItem])) {
						if(gettime() < GetPVarInt(playerid, "ChoDoi")) return SCMf(playerid, COLOR_LGREEN, ">> Vui long doi %d giay!", GetPVarInt(playerid, "ChoDoi") - gettime());
						if (Inventory_Count(playerid, "C.B.D") < 2) return SendClientMessage(playerid, -1, "Ban can it nhat 2 grams C.B.D.");
						if(UsingDrugs[playerid] != 0) return SendClientMessage(playerid, COLOR_WHITE, "Ban dang phe can!");
					    if(IsPlayerInRangeOfPoint(playerid, 300.0, -1423.5153,935.8321,1036.4756)) return SendClientMessage(playerid, -1, "Ban khong the su dung ma tuy khi dang trong Event Arena.");
						if(PaintType[playerid] != 0) return SendClientMessage(playerid, -1, "Ban khong the su dung ma tuy khi dang trong Paintball!");
						if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban dang ngoi trong xe!");
						PlayerStoned[playerid] += 2;
						new sendername[25];
						GetPlayerName(playerid, sendername, sizeof(sendername));
						Freezed[playerid] = 1;
						if(health < 85) {
							SetPlayerHealthEx(playerid, health + RandomEx(40,80));
						}
						//new string[90];
						format(string, sizeof(string), "%s lay mot goi bot mau trang ra, dot len va hit lay hit de.", sendername);
						ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						SendClientMessage(playerid, COLOR_WHITE, "Xin hay doi 30 giay de thuoc phat huy het tac dung.");
						UsingDrugs[playerid] = 1;
						drug[playerid] = defer DrugEffectGone[30000](playerid);
						LoopingAnim(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
						for(new m; m < 5; m++) {
							if(PlayerInfo[playerid][pDailyMission][m] == 13) CheckMission(playerid, m);	
						}
						Inventory_Remove(playerid, "Sativa", invData[playerid][id][invExists]);
					}		
					else if(strmatch("Burger", invData[playerid][id][invItem])) {
						if(gettime() < GetPVarInt(playerid, "ChoDoi")) return SCMf(playerid, COLOR_LGREEN, ">> Vui long doi %d giay!", GetPVarInt(playerid, "ChoDoi") - gettime());
						GetPlayerHealthEx(playerid, health);
						if(PlayerInfo[playerid][pHunger] < 96) Stamina_SetValue(playerid, 5);
						Inventory_Remove(playerid, "Burger", invData[playerid][id][invExists]);
						ApplyAnimation(playerid,"FOOD","EAT_Burger", 3.0, 0, 0, 0, 0, 0);
						if(health < 85 && InWar[PlayerInfo[playerid][pMember]] == 1) {
							SetPlayerHealthEx(playerid, health + 15);
						}
						type = 1;
					}
					else if(strmatch("Smoke", invData[playerid][id][invItem])) {
						if(IsSmoking[playerid] != 0) return SendClientMessage(playerid, -1, "Ban da hut thuoc roi.");
						if (Inventory_Count(playerid, "Smoke") == 0) return SendClientMessage(playerid, -1, "Ban khong co thuoc la.");
						if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,COLOR_GREY, "Xin hay xuong xe.");
						PlayerInfo[playerid][pLighter] -= 1;
						IsSmoking[playerid] = 60;
						SetPlayerSpecialAction(playerid,SPECIAL_ACTION_SMOKE_CIGGY);
						Inventory_Remove(playerid, "Smoke", invData[playerid][id][invExists]);
					}
					else if(strmatch("Ca Thuong", invData[playerid][id][invItem])) {
						if(gettime() < GetPVarInt(playerid, "Ban2Ca")) NightBot(playerid, "Ban 2 ca");
						if(TimpMateriale[playerid] == 1) return Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Ban ca", "ERROR: Ban khong the ban mot con ca qua nhanh, hay tro lai sau!", "Ok", "Cancel");
						if(BizzInfo[InBussines[playerid]][bType] == 6)
						{
							//if(PlayerInfo[playerid][pJob] != 15 || PlayerInfo[playerid][pJob] != 11) return SendClientMessage(playerid, COLOR_YELLOW, "Ban khong phai la Fisherman");
							Inventory_Remove(playerid, "Ca Thuong", invData[playerid][id][invExists]);
							pFishing[playerid] = 0;
							if(yourskill == 1) x = 5000 + random(3000);
							if(yourskill == 2) x = 10000 + random(2000);
							if(yourskill == 3) x = 15000 + random(3000);
							if(yourskill == 4) x = 20000 + random(3000);
							if(yourskill == 5) x = 25000 + random(3000);	
							format(strings, sizeof(strings), "{FF0000}>>{FFFFFF} %s (%d) da ban mot con {FFF400}Ca Thuong{FFFFFF} voi gia ({15FF00}$%s{FFFFFF}).", GetName(playerid), playerid, FormatNumber(x));
							NearMessage(playerid, COLOR_YELLOW, strings);	
							GuiDenAdminVaHelper(COLOR_YELLOW, strings, 1); 
							FishPrice[playerid] = x;
							SetPVarInt(playerid, "Ban2Ca", gettime() + 25);
							format(string, 35,"Ban nhan duoc $%s!", FormatNumber(FishPrice[playerid] + totalmony));
							//UpdateJobGoal(FishPrice[playerid], MAXGOAL);
							SendClientMessage(playerid, COLOR_YELLOW, string);
							new bonus = 0;
							if(TodayJob == 11 || TodayJob == 15) {
								bonus = JobInfo[PlayerInfo[playerid][pJob]][jBonus]*(FishPrice[playerid]/100);
								format(string, 130, "Ban nhan them $%s Fisherman Bonus. Tong nhan duoc: $%s.", FormatNumber(bonus), FormatNumber(totalmony+bonus+FishPrice[playerid]));
								SendClientMessage(playerid, COLOR_GOLD, string);
							}
							new const totalCash = totalmony + bonus + FishPrice[playerid];
							GivePlayerCash(playerid, totalCash);	
							format(string, sizeof(string), "%s da nhan duoc $%s cho cong viec %s.", GetName(playerid), FormatNumber(totalCash), JobInfo[PlayerInfo[playerid][pJob]][jName]);

							//InsertLog(playerid, string, LOG_MONEY);
							Log("logs/jobmoney.log", string);	
							Update(playerid, pCashx);
							FishPrice[playerid] = 0;
							//pFishess[playerid] = 0;
							PlayerInfo[playerid][pFishSkill] ++;
							UpdateVar(playerid, "FishSkill", PlayerInfo[playerid][pFishSkill]);
							if(PlayerInfo[playerid][pFishSkill] == 50)
							{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 2. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
							else if(PlayerInfo[playerid][pFishSkill] == 100)
							{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 3. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
							else if(PlayerInfo[playerid][pFishSkill] == 200)
							{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 4. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
							else if(PlayerInfo[playerid][pFishSkill] == 400)
							{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 5. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
							if(togjob[playerid] == 0) {
								JobProgress(playerid);
							}
							//CheckNhiemVuCapDo(playerid);
							if(GetPlayerSkill(playerid) == 5) finishAchievement(playerid, 0);
							if(PlayerInfo[playerid][pMember] == 0) {
								for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
									if(PlayerInfo[playerid][pDailyMission][m] == 15 || PlayerInfo[playerid][pDailyMission][m] == 16) CheckMission(playerid, m);
								}					
							}
							for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
								if(PlayerInfo[playerid][pDailyMission][m] == 2) CheckMission(playerid, m);
							}				
							if(PlayerInfo[playerid][pClan]!=0) {
								new ran=1+random(3),sql[200],cid=PlayerInfo[playerid][pClan];
								ClanInfo[cid][clPoints]+=ran;
								PlayerInfo[playerid][pPoints]+=ran;
								Update(playerid, pPoints);
								format(string, sizeof(string), "{%s}Diem hoat dong Clan: +%d (%d) - %s", ClanInfo[cid][clColor], ran, ClanInfo[cid][clPoints], GetName(playerid));
								SendClanMessage(cid, string);
								format(sql, sizeof(sql), "UPDATE clans SET `ActivePoints`='%d' WHERE `ID`='%d'", ClanInfo[cid][clPoints], cid);
								mysql_tquery(SQL, sql, "", "");
							}
							type = 1;
						}
						else SendClientMessage(playerid, COLOR_YELLOW, "Ban khong o tai 24/7");
					}
					else if(strmatch("Ca Hiem", invData[playerid][id][invItem])) {
						if(gettime() < GetPVarInt(playerid, "Ban2Ca")) NightBot(playerid, "Ban 2 ca");
						if(TimpMateriale[playerid] == 1) return Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Ban ca", "ERROR: Ban khong the ban mot con ca qua nhanh, hay tro lai sau!", "Ok", "Cancel");
						//if(PlayerInfo[playerid][pJob] != 15 || PlayerInfo[playerid][pJob] != 11) return SendClientMessage(playerid, COLOR_YELLOW, "Ban khong phai la Fisherman");
						if(BizzInfo[InBussines[playerid]][bType] == 6)
						{
							Inventory_Remove(playerid, "Ca Hiem", invData[playerid][id][invExists]);
							if(yourskill == 1) x = 20000 + random(500);
							if(yourskill == 2) x = 25000 + random(2000);
							if(yourskill == 3) x = 30000 + random(3000);
							if(yourskill == 4) x = 30000 + random(5000);
							if(yourskill == 5) x = 35000 + random(1000);
							
							format(strings, sizeof(strings), "{FF0000}>>{FFFFFF} %s (%d) da ban mot con {FFF400}Ca Hiem{FFFFFF} voi gia ({15FF00}$%s{FFFFFF}).", GetName(playerid), playerid, FormatNumber(x));
							NearMessage(playerid, COLOR_YELLOW, strings);
							GuiDenAdminVaHelper(COLOR_YELLOW, string, 1); 	
							FishPrice[playerid] = x;
							SetPVarInt(playerid, "Ban2Ca", gettime() + 25);
							format(string, 35,"Ban nhan duoc $%s!", FormatNumber(FishPrice[playerid] + totalmony));
							//UpdateJobGoal(FishPrice[playerid], MAXGOAL);
							SendClientMessage(playerid, COLOR_YELLOW, string);
							new bonus = 0;
							if(TodayJob == 11 || TodayJob == 15) {
								bonus = JobInfo[PlayerInfo[playerid][pJob]][jBonus]*(FishPrice[playerid]/100);
								format(string, 130, "Ban nhan them $%s Fisherman Bonus. Tong nhan duoc: $%s.", FormatNumber(bonus), FormatNumber(totalmony+bonus+FishPrice[playerid]));
								SendClientMessage(playerid, COLOR_GOLD, string);
							}
							new const totalCash = totalmony + bonus + FishPrice[playerid];
							GivePlayerCash(playerid, totalCash);	
							format(string, sizeof(string), "%s da nhan duoc $%s cho cong viec %s.", GetName(playerid), FormatNumber(totalCash), JobInfo[PlayerInfo[playerid][pJob]][jName]);
							Log("logs/jobmoney.log", string);	
							Update(playerid, pCashx);
							FishPrice[playerid] = 0;
							pFishing[playerid] = 0;
							//pFishess[playerid] = 0;
							PlayerInfo[playerid][pFishSkill] ++;
							UpdateVar(playerid, "FishSkill", PlayerInfo[playerid][pFishSkill]);
							if(PlayerInfo[playerid][pFishSkill] == 50)
							{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 2. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
							else if(PlayerInfo[playerid][pFishSkill] == 100)
							{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 3. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
							else if(PlayerInfo[playerid][pFishSkill] == 200)
							{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 4. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
							else if(PlayerInfo[playerid][pFishSkill] == 400)
							{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 5. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
							if(togjob[playerid] == 0) {
								JobProgress(playerid);
							}
							//CheckNhiemVuCapDo(playerid);
							if(GetPlayerSkill(playerid) == 5) finishAchievement(playerid, 0);
							if(PlayerInfo[playerid][pMember] == 0) {
								for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
									if(PlayerInfo[playerid][pDailyMission][m] == 15 || PlayerInfo[playerid][pDailyMission][m] == 16) CheckMission(playerid, m);
								}					
							}
							for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
								if(PlayerInfo[playerid][pDailyMission][m] == 2) CheckMission(playerid, m);
							}				
							type = 1;
							if(PlayerInfo[playerid][pClan]!=0) {
								new ran=1+random(3),sql[200],cid=PlayerInfo[playerid][pClan];
								ClanInfo[cid][clPoints]+=ran;
								PlayerInfo[playerid][pPoints]+=ran;
								Update(playerid, pPoints);
								format(string, sizeof(string), "{%s}Diem hoat dong Clan: +%d (%d) - %s", ClanInfo[cid][clColor], ran, ClanInfo[cid][clPoints], GetName(playerid));
								SendClanMessage(cid, string);
								format(sql, sizeof(sql), "UPDATE clans SET `ActivePoints`='%d' WHERE `ID`='%d'", ClanInfo[cid][clPoints], cid);
								mysql_tquery(SQL, sql, "", "");
							}
						}
						else SendClientMessage(playerid, COLOR_YELLOW, "Ban khong o tai 24/7");
					}
					else if(strmatch("Ca Vang", invData[playerid][id][invItem])) {
						if(gettime() < GetPVarInt(playerid, "Ban2Ca")) NightBot(playerid, "Ban 2 ca");
						if(TimpMateriale[playerid] == 1) return Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Ban ca", "ERROR: Ban khong the ban mot con ca qua nhanh, hay tro lai sau!", "Ok", "Cancel");
						//if(PlayerInfo[playerid][pJob] != 15 || PlayerInfo[playerid][pJob] != 11) return SendClientMessage(playerid, COLOR_YELLOW, "Ban khong phai la Fisherman");
						if(BizzInfo[InBussines[playerid]][bType] == 6)
						{
							Inventory_Remove(playerid, "Ca Vang", invData[playerid][id][invExists]);
							pFishing[playerid] = 0;
							x = 20000 + random(45000);
							format(strings, sizeof(strings), "{FF0000}>>{FFFFFF} %s (%d) da ban mot con {FFF400}Ca Vang{FFFFFF} voi gia ({15FF00}$%s{FFFFFF}).", GetName(playerid), playerid, FormatNumber(x));
							NearMessage(playerid, COLOR_YELLOW, strings);	
							GuiDenAdminVaHelper(COLOR_YELLOW, string, 1); 
							FishPrice[playerid] = x;
							SetPVarInt(playerid, "Ban2Ca", gettime() + 25);
							format(string, 35,"Ban nhan duoc $%s!", FormatNumber(FishPrice[playerid] + totalmony));
							//UpdateJobGoal(FishPrice[playerid], MAXGOAL);
							SendClientMessage(playerid, COLOR_YELLOW, string);
							new bonus = 0;
							if(TodayJob == 11 || TodayJob == 15) {
								bonus = JobInfo[PlayerInfo[playerid][pJob]][jBonus]*(FishPrice[playerid]/100);
								format(string, 130, "Ban nhan them $%s Fisherman Bonus. Tong nhan duoc: $%s.", FormatNumber(bonus), FormatNumber(totalmony+bonus+FishPrice[playerid]));
								SendClientMessage(playerid, COLOR_GOLD, string);
							}
							new const totalCash = totalmony + bonus + FishPrice[playerid];
							GivePlayerCash(playerid, totalCash);	
							format(string, sizeof(string), "%s da nhan duoc $%s cho cong viec %s.", GetName(playerid), FormatNumber(totalCash), JobInfo[PlayerInfo[playerid][pJob]][jName]);
							
							//InsertLog(playerid, string, LOG_MONEY);
							Log("logs/jobmoney.log", string);	
							Update(playerid, pCashx);
							FishPrice[playerid] = 0;
							pFishing[playerid] = 0;
							
							//pFishess[playerid] = 0;
							PlayerInfo[playerid][pFishSkill] ++;
							UpdateVar(playerid, "FishSkill", PlayerInfo[playerid][pFishSkill]);
							if(PlayerInfo[playerid][pFishSkill] == 50)
							{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 2. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
							else if(PlayerInfo[playerid][pFishSkill] == 100)
							{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 3. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
							else if(PlayerInfo[playerid][pFishSkill] == 200)
							{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 4. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
							else if(PlayerInfo[playerid][pFishSkill] == 400)
							{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 5. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
							if(togjob[playerid] == 0) {
								JobProgress(playerid);
							}
							//CheckNhiemVuCapDo(playerid);
							if(GetPlayerSkill(playerid) == 5) finishAchievement(playerid, 0);
							if(PlayerInfo[playerid][pMember] == 0) {
								for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
									if(PlayerInfo[playerid][pDailyMission][m] == 15 || PlayerInfo[playerid][pDailyMission][m] == 16) CheckMission(playerid, m);
								}					
							}
							for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
								if(PlayerInfo[playerid][pDailyMission][m] == 2) CheckMission(playerid, m);
							}			
							if(PlayerInfo[playerid][pClan]!=0) {
								new ran=1+random(3),sql[200],cid=PlayerInfo[playerid][pClan];
								ClanInfo[cid][clPoints]+=ran;
								PlayerInfo[playerid][pPoints]+=ran;
								Update(playerid, pPoints);
								format(string, sizeof(string), "{%s}Diem hoat dong Clan: +%d (%d) - %s", ClanInfo[cid][clColor], ran, ClanInfo[cid][clPoints], GetName(playerid));
								SendClanMessage(cid, string);
								format(sql, sizeof(sql), "UPDATE clans SET `ActivePoints`='%d' WHERE `ID`='%d'", ClanInfo[cid][clPoints], cid);
								mysql_tquery(SQL, sql, "", "");
							}	
							type = 1;
						}
						else SendClientMessage(playerid, COLOR_YELLOW, "Ban khong o tai 24/7");
					}
					else if(strmatch("Ca Map", invData[playerid][id][invItem])) {
						if(gettime() < GetPVarInt(playerid, "Ban2Ca")) NightBot(playerid, "Ban 2 ca");
						if(TimpMateriale[playerid] == 1) return Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Ban ca", "ERROR: Ban khong the ban mot con ca qua nhanh, hay tro lai sau!", "Ok", "Cancel");
						//if(PlayerInfo[playerid][pJob] != 15 || PlayerInfo[playerid][pJob] != 11) return SendClientMessage(playerid, COLOR_YELLOW, "Ban khong phai la Fisherman");
						if(BizzInfo[InBussines[playerid]][bType] == 6)
						{
							Inventory_Remove(playerid, "Ca Map", invData[playerid][id][invExists]);
							x = 150000;
							SetPVarInt(playerid, "Ban2Ca", gettime() + 25);
							pFishing[playerid] = 0;
							format(strings, sizeof(strings), "{FF0000}>>{FFFFFF} %s (%d) da ban mot con {FFF400}Ca Map{FFFFFF} voi gia ({15FF00}$%s{FFFFFF}).", GetName(playerid), playerid, FormatNumber(x));
							NearMessage(playerid, COLOR_YELLOW, strings);	
							GuiDenAdminVaHelper(COLOR_YELLOW, string, 1); 
							FishPrice[playerid] = x;
							format(string, 35,"Ban nhan duoc $%s!", FormatNumber(FishPrice[playerid] + totalmony));
							//UpdateJobGoal(FishPrice[playerid], MAXGOAL);
							SendClientMessage(playerid, COLOR_YELLOW, string);
							new bonus = 0;
							if(TodayJob == 11 || TodayJob == 15) {
								bonus = JobInfo[PlayerInfo[playerid][pJob]][jBonus]*(FishPrice[playerid]/100);
								format(string, 130, "Ban nhan them $%s Fisherman Bonus. Tong nhan duoc: $%s.", FormatNumber(bonus), FormatNumber(totalmony+bonus+FishPrice[playerid]));
								SendClientMessage(playerid, COLOR_GOLD, string);
							}
							new const totalCash = totalmony + bonus + FishPrice[playerid];
							GivePlayerCash(playerid, totalCash);	
							format(string, sizeof(string), "%s da nhan duoc $%s cho cong viec %s.", GetName(playerid), FormatNumber(totalCash), JobInfo[PlayerInfo[playerid][pJob]][jName]);
							Log("logs/jobmoney.log", string);	
							Update(playerid, pCashx);
							FishPrice[playerid] = 0;
							//pFishess[playerid] = 0;
							PlayerInfo[playerid][pFishSkill] ++;
							UpdateVar(playerid, "FishSkill", PlayerInfo[playerid][pFishSkill]);
							if(PlayerInfo[playerid][pFishSkill] == 50)
							{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 2. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
							else if(PlayerInfo[playerid][pFishSkill] == 100)
							{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 3. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
							else if(PlayerInfo[playerid][pFishSkill] == 200)
							{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 4. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
							else if(PlayerInfo[playerid][pFishSkill] == 400)
							{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 5. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
							if(togjob[playerid] == 0) {
								JobProgress(playerid);
							}
							if(PlayerInfo[playerid][pClan]!=0) {
								new ran=1+random(3),sql[200],cid=PlayerInfo[playerid][pClan];
								ClanInfo[cid][clPoints]+=ran;
								PlayerInfo[playerid][pPoints]+=ran;
								Update(playerid, pPoints);
								format(string, sizeof(string), "{%s}Diem hoat dong Clan: +%d (%d) - %s", ClanInfo[cid][clColor], ran, ClanInfo[cid][clPoints], GetName(playerid));
								SendClanMessage(cid, string);
								format(sql, sizeof(sql), "UPDATE clans SET `ActivePoints`='%d' WHERE `ID`='%d'", ClanInfo[cid][clPoints], cid);
								mysql_tquery(SQL, sql, "", "");
							}
							//CheckNhiemVuCapDo(playerid);
							if(GetPlayerSkill(playerid) == 5) finishAchievement(playerid, 0);
							if(PlayerInfo[playerid][pMember] == 0) {
								for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
									if(PlayerInfo[playerid][pDailyMission][m] == 15 || PlayerInfo[playerid][pDailyMission][m] == 16) CheckMission(playerid, m);
								}					
							}
							for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
								if(PlayerInfo[playerid][pDailyMission][m] == 2) CheckMission(playerid, m);
							}				
							type = 1;
						}
						else SendClientMessage(playerid, COLOR_YELLOW, "Ban khong o tai 24/7");
					}
					else if(strmatch("DE", invData[playerid][id][invItem])) {
						ServerWeapon(playerid, getGunID(invData[playerid][id][invItem]), invData[playerid][id][invQuantity]);
						Inventory_Remove(playerid, invData[playerid][id][invItem], invData[playerid][id][invExists], invData[playerid][id][invQuantity]);
					}
					else if(strmatch("M4", invData[playerid][id][invItem])) {
						ServerWeapon(playerid, getGunID(invData[playerid][id][invItem]), invData[playerid][id][invQuantity]);
						Inventory_Remove(playerid, invData[playerid][id][invItem], invData[playerid][id][invExists], invData[playerid][id][invQuantity]);
					}
					else if(strmatch("Shotgun", invData[playerid][id][invItem])) {
						ServerWeapon(playerid, getGunID(invData[playerid][id][invItem]), invData[playerid][id][invQuantity]);
						Inventory_Remove(playerid, invData[playerid][id][invItem], invData[playerid][id][invExists], invData[playerid][id][invQuantity]);
					}
					else if(strmatch("AK47", invData[playerid][id][invItem])) {
						ServerWeapon(playerid, getGunID(invData[playerid][id][invItem]), invData[playerid][id][invQuantity]);
						Inventory_Remove(playerid, invData[playerid][id][invItem], invData[playerid][id][invExists], invData[playerid][id][invQuantity]);
					}
					else if(strmatch("Shotgun", invData[playerid][id][invItem])) {
						ServerWeapon(playerid, getGunID(invData[playerid][id][invItem]), invData[playerid][id][invQuantity]);
						Inventory_Remove(playerid, invData[playerid][id][invItem], invData[playerid][id][invExists], invData[playerid][id][invQuantity]);
					}
					else if(strmatch("Baseballbat", invData[playerid][id][invItem])) {
						ServerWeapon(playerid, getGunID(invData[playerid][id][invItem]), invData[playerid][id][invQuantity]);
						Inventory_Remove(playerid, invData[playerid][id][invItem], invData[playerid][id][invExists], invData[playerid][id][invQuantity]);
					}
					else if(strmatch("Uzi", invData[playerid][id][invItem])) {
						ServerWeapon(playerid, getGunID(invData[playerid][id][invItem]), invData[playerid][id][invQuantity]);
						Inventory_Remove(playerid, invData[playerid][id][invItem], invData[playerid][id][invExists], invData[playerid][id][invQuantity]);
					}
					NearMessage2(playerid, 25.0,COLOR_PURPLE, "** %s da lay %s tu tui do ra va su dung.", GetName(playerid), invData[playerid][id][invItem]);
					SetPVarInt(playerid, "ChoDoi", gettime() + 3);
				}
				case 2: {
					ServerWeapon(playerid, getGunID(invData[playerid][id][invItem]), invData[playerid][id][invQuantity]);
					NearMessage2(playerid, 25.0, COLOR_PURPLE, "** %s da tao mot khau sung %s voi %d vien dan *", GetName(playerid), invData[playerid][id][invItem], invData[playerid][id][invQuantity]);
					Inventory_Remove(playerid, invData[playerid][id][invItem], invData[playerid][id][invExists], invData[playerid][id][invQuantity]);
				}
				case 3: {
					PlayerInfo[playerid][pChar] = invData[playerid][id][invModel]; 
					// pUpdateInt(playerid, "playerSkin", invData[playerid][id][invModel]);
					SetPlayerSkin(playerid, invData[playerid][id][invModel]);
					NearMessage2(playerid, 25.0, COLOR_PURPLE, "** %s da thay doi skin.", GetName(playerid));
				}
			}*/
			if(strmatch("Sativa", invData[playerid][id][invItem])) {
				if(gettime() < GetPVarInt(playerid, "ChoDoi")) return SCMf(playerid, COLOR_LGREEN, ">> Vui long doi %d giay!", GetPVarInt(playerid, "ChoDoi") - gettime());
				if (Inventory_Count(playerid, "Sativa") < 2) return SendClientMessage(playerid, -1, "Ban can it nhat 2 grams Sativa.");
				if(UsingDrugs[playerid] != 0) return SendClientMessage(playerid, COLOR_WHITE, "Ban dang phe can!");
				if(IsPlayerInRangeOfPoint(playerid, 300.0, -1423.5153,935.8321,1036.4756)) return SendClientMessage(playerid, -1, "Ban khong the su dung ma tuy khi dang trong Event Arena.");
				if(PaintType[playerid] != 0) return SendClientMessage(playerid, -1, "Ban khong the su dung ma tuy khi dang trong Paintball!");
				if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban dang ngoi trong xe!");
				PlayerStoned[playerid] += 2;
				new sendername[25];
				GetPlayerHealthEx(playerid, health);
				// if(health > 95) return Error(playerid, "You can't eat, your health is full.");
				if(health < 85) {
					SetPlayerHealthEx(playerid, health + random(20));
				}
				GetPlayerName(playerid, sendername, sizeof(sendername));
				Freezed[playerid] = 1;
				//new string[90];
				format(string, sizeof(string), "%s lay mot goi bot mau trang ra, dot len va hit lay hit de.", sendername);
				ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				SendClientMessage(playerid, COLOR_WHITE, "Xin hay doi 30 giay de thuoc phat huy het tac dung.");
				UsingDrugs[playerid] = 1;
				drug[playerid] = defer DrugEffectGone[30000](playerid);
				LoopingAnim(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
				for(new m; m < 5; m++) {
					if(PlayerInfo[playerid][pDailyMission][m] == 13) CheckMission(playerid, m);	
				}
				Inventory_Remove(playerid, "Sativa");
			}
			if(strmatch("Indica", invData[playerid][id][invItem])) {
				if(gettime() < GetPVarInt(playerid, "ChoDoi")) return SCMf(playerid, COLOR_LGREEN, ">> Vui long doi %d giay!", GetPVarInt(playerid, "ChoDoi") - gettime());
				if (Inventory_Count(playerid, "Indica") < 2) return SendClientMessage(playerid, -1, "Ban can it nhat 2 grams Indica.");
				if(UsingDrugs[playerid] != 0) return SendClientMessage(playerid, COLOR_WHITE, "Ban dang phe can!");
				if(IsPlayerInRangeOfPoint(playerid, 300.0, -1423.5153,935.8321,1036.4756)) return SendClientMessage(playerid, -1, "Ban khong the su dung ma tuy khi dang trong Event Arena.");
				if(PaintType[playerid] != 0) return SendClientMessage(playerid, -1, "Ban khong the su dung ma tuy khi dang trong Paintball!");
				if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban dang ngoi trong xe!");
				PlayerStoned[playerid] += 2;
				new sendername[25];
				GetPlayerName(playerid, sendername, sizeof(sendername));
				Freezed[playerid] = 1;
				if(health < 85) {
					SetPlayerHealthEx(playerid, health + random(20));
				}
				//new string[90];
				format(string, sizeof(string), "%s lay mot goi bot mau trang ra, dot len va hit lay hit de.", sendername);
				ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				SendClientMessage(playerid, COLOR_WHITE, "Xin hay doi 30 giay de thuoc phat huy het tac dung.");
				UsingDrugs[playerid] = 1;
				drug[playerid] = defer DrugEffectGone[30000](playerid);
				LoopingAnim(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
				for(new m; m < 5; m++) {
					if(PlayerInfo[playerid][pDailyMission][m] == 13) CheckMission(playerid, m);	
				}
				Inventory_Remove(playerid, "Sativa");
			}
			if(strmatch("C.B.D", invData[playerid][id][invItem])) {
				if(gettime() < GetPVarInt(playerid, "ChoDoi")) return SCMf(playerid, COLOR_LGREEN, ">> Vui long doi %d giay!", GetPVarInt(playerid, "ChoDoi") - gettime());
				if (Inventory_Count(playerid, "C.B.D") < 2) return SendClientMessage(playerid, -1, "Ban can it nhat 2 grams C.B.D.");
				if(UsingDrugs[playerid] != 0) return SendClientMessage(playerid, COLOR_WHITE, "Ban dang phe can!");
				if(IsPlayerInRangeOfPoint(playerid, 300.0, -1423.5153,935.8321,1036.4756)) return SendClientMessage(playerid, -1, "Ban khong the su dung ma tuy khi dang trong Event Arena.");
				if(PaintType[playerid] != 0) return SendClientMessage(playerid, -1, "Ban khong the su dung ma tuy khi dang trong Paintball!");
				if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban dang ngoi trong xe!");
				PlayerStoned[playerid] += 2;
				new sendername[25];
				GetPlayerName(playerid, sendername, sizeof(sendername));
				Freezed[playerid] = 1;
				if(health < 85) {
					SetPlayerHealthEx(playerid, health + RandomEx(40,80));
				}
				//new string[90];
				format(string, sizeof(string), "%s lay mot goi bot mau trang ra, dot len va hit lay hit de.", sendername);
				ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				SendClientMessage(playerid, COLOR_WHITE, "Xin hay doi 30 giay de thuoc phat huy het tac dung.");
				UsingDrugs[playerid] = 1;
				drug[playerid] = defer DrugEffectGone[30000](playerid);
				LoopingAnim(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
				for(new m; m < 5; m++) {
					if(PlayerInfo[playerid][pDailyMission][m] == 13) CheckMission(playerid, m);	
				}
				Inventory_Remove(playerid, "Sativa");
			}		
			else if(strmatch("Burger", invData[playerid][id][invItem])) {
				if(gettime() < GetPVarInt(playerid, "ChoDoi")) return SCMf(playerid, COLOR_LGREEN, ">> Vui long doi %d giay!", GetPVarInt(playerid, "ChoDoi") - gettime());
				GetPlayerHealthEx(playerid, health);
				if(PlayerInfo[playerid][pHunger] < 96) Stamina_SetValue(playerid, 5);
				Inventory_Remove(playerid, "Burger");
				ApplyAnimation(playerid,"FOOD","EAT_Burger", 3.0, 0, 0, 0, 0, 0);
				if(health < 85 && InWar[PlayerInfo[playerid][pMember]] == 1) {
					SetPlayerHealthEx(playerid, health + 15);
				}
				//type = 1;
			}
			else if(strmatch("Smoke", invData[playerid][id][invItem])) {
				if(IsSmoking[playerid] != 0) return SendClientMessage(playerid, -1, "Ban da hut thuoc roi.");
				if (Inventory_Count(playerid, "Smoke") == 0) return SendClientMessage(playerid, -1, "Ban khong co thuoc la.");
				if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,COLOR_GREY, "Xin hay xuong xe.");
				PlayerInfo[playerid][pLighter] -= 1;
				IsSmoking[playerid] = 60;
				SetPlayerSpecialAction(playerid,SPECIAL_ACTION_SMOKE_CIGGY);
				Inventory_Remove(playerid, "Smoke");
			}
			else if(strmatch("Ca Thuong", invData[playerid][id][invItem])) {
				if(gettime() < GetPVarInt(playerid, "Ban2Ca")) NightBot(playerid, "Ban 2 ca");
				if(TimpMateriale[playerid] == 1) return Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Ban ca", "ERROR: Ban khong the ban mot con ca qua nhanh, hay tro lai sau!", "Ok", "Cancel");
				if(BizzInfo[InBussines[playerid]][bType] == 6)
				{
					//if(PlayerInfo[playerid][pJob] != 15 || PlayerInfo[playerid][pJob] != 11) return SendClientMessage(playerid, COLOR_YELLOW, "Ban khong phai la Fisherman");
					Inventory_Remove(playerid, "Ca Thuong");
					pFishing[playerid] = 0;
					if(yourskill == 1) x = 5000 + random(3000);
					if(yourskill == 2) x = 10000 + random(2000);
					if(yourskill == 3) x = 15000 + random(3000);
					if(yourskill == 4) x = 20000 + random(3000);
					if(yourskill == 5) x = 25000 + random(3000);	
					format(strings, sizeof(strings), "{FF0000}>>{FFFFFF} %s (%d) da ban mot con {FFF400}Ca Thuong{FFFFFF} voi gia ({15FF00}$%s{FFFFFF}).", GetName(playerid), playerid, FormatNumber(x));
					NearMessage(playerid, COLOR_YELLOW, strings);	
					GuiDenAdminVaHelper(COLOR_YELLOW, strings, 1); 
					FishPrice[playerid] = x;
					SetPVarInt(playerid, "Ban2Ca", gettime() + 25);
					format(string, 35,"Ban nhan duoc $%s!", FormatNumber(FishPrice[playerid] + totalmony));
					//UpdateJobGoal(FishPrice[playerid], MAXGOAL);
					SendClientMessage(playerid, COLOR_YELLOW, string);
					new bonus = 0;
					if(TodayJob == 11 || TodayJob == 15) {
						bonus = JobInfo[PlayerInfo[playerid][pJob]][jBonus]*(FishPrice[playerid]/100);
						format(string, 130, "Ban nhan them $%s Fisherman Bonus. Tong nhan duoc: $%s.", FormatNumber(bonus), FormatNumber(totalmony+bonus+FishPrice[playerid]));
						SendClientMessage(playerid, COLOR_GOLD, string);
					}
					new const totalCash = totalmony + bonus + FishPrice[playerid];
					GivePlayerCash(playerid, totalCash);	
					format(string, sizeof(string), "%s da nhan duoc $%s cho cong viec %s.", GetName(playerid), FormatNumber(totalCash), JobInfo[PlayerInfo[playerid][pJob]][jName]);

					//InsertLog(playerid, string, LOG_MONEY);
					Log("logs/jobmoney.log", string);	
					Update(playerid, pCashx);
					FishPrice[playerid] = 0;
					//pFishess[playerid] = 0;
					PlayerInfo[playerid][pFishSkill] ++;
					UpdateVar(playerid, "FishSkill", PlayerInfo[playerid][pFishSkill]);
					if(PlayerInfo[playerid][pFishSkill] == 50)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 2. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
					else if(PlayerInfo[playerid][pFishSkill] == 100)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 3. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
					else if(PlayerInfo[playerid][pFishSkill] == 200)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 4. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
					else if(PlayerInfo[playerid][pFishSkill] == 400)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 5. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
					if(togjob[playerid] == 0) {
						JobProgress(playerid);
					}
					//CheckNhiemVuCapDo(playerid);
					if(GetPlayerSkill(playerid) == 5) finishAchievement(playerid, 0);
					if(PlayerInfo[playerid][pMember] == 0) {
						for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
							if(PlayerInfo[playerid][pDailyMission][m] == 15 || PlayerInfo[playerid][pDailyMission][m] == 16) CheckMission(playerid, m);
						}					
					}
					for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
						if(PlayerInfo[playerid][pDailyMission][m] == 2) CheckMission(playerid, m);
					}				
					if(PlayerInfo[playerid][pClan]!=0) {
						new ran=1+random(3),sql[200],cid=PlayerInfo[playerid][pClan];
						ClanInfo[cid][clPoints]+=ran;
						PlayerInfo[playerid][pPoints]+=ran;
						Update(playerid, pPoints);
						format(string, sizeof(string), "{%s}Diem hoat dong Clan: +%d (%d) - %s", ClanInfo[cid][clColor], ran, ClanInfo[cid][clPoints], GetName(playerid));
						SendClanMessage(cid, string);
						format(sql, sizeof(sql), "UPDATE clans SET `ActivePoints`='%d' WHERE `ID`='%d'", ClanInfo[cid][clPoints], cid);
						mysql_tquery(SQL, sql, "", "");
					}
					//type = 1;
				}
				else SendClientMessage(playerid, COLOR_YELLOW, "Ban khong o tai 24/7");
			}
			else if(strmatch("Ca Hiem", invData[playerid][id][invItem])) {
				if(gettime() < GetPVarInt(playerid, "Ban2Ca")) NightBot(playerid, "Ban 2 ca");
				if(TimpMateriale[playerid] == 1) return Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Ban ca", "ERROR: Ban khong the ban mot con ca qua nhanh, hay tro lai sau!", "Ok", "Cancel");
				//if(PlayerInfo[playerid][pJob] != 15 || PlayerInfo[playerid][pJob] != 11) return SendClientMessage(playerid, COLOR_YELLOW, "Ban khong phai la Fisherman");
				if(BizzInfo[InBussines[playerid]][bType] == 6)
				{
					Inventory_Remove(playerid, "Ca Hiem");
					if(yourskill == 1) x = 20000 + random(500);
					if(yourskill == 2) x = 25000 + random(2000);
					if(yourskill == 3) x = 30000 + random(3000);
					if(yourskill == 4) x = 30000 + random(5000);
					if(yourskill == 5) x = 35000 + random(1000);
					
					format(strings, sizeof(strings), "{FF0000}>>{FFFFFF} %s (%d) da ban mot con {FFF400}Ca Hiem{FFFFFF} voi gia ({15FF00}$%s{FFFFFF}).", GetName(playerid), playerid, FormatNumber(x));
					NearMessage(playerid, COLOR_YELLOW, strings);
					GuiDenAdminVaHelper(COLOR_YELLOW, string, 1); 	
					FishPrice[playerid] = x;
					SetPVarInt(playerid, "Ban2Ca", gettime() + 25);
					format(string, 35,"Ban nhan duoc $%s!", FormatNumber(FishPrice[playerid] + totalmony));
					//UpdateJobGoal(FishPrice[playerid], MAXGOAL);
					SendClientMessage(playerid, COLOR_YELLOW, string);
					new bonus = 0;
					if(TodayJob == 11 || TodayJob == 15) {
						bonus = JobInfo[PlayerInfo[playerid][pJob]][jBonus]*(FishPrice[playerid]/100);
						format(string, 130, "Ban nhan them $%s Fisherman Bonus. Tong nhan duoc: $%s.", FormatNumber(bonus), FormatNumber(totalmony+bonus+FishPrice[playerid]));
						SendClientMessage(playerid, COLOR_GOLD, string);
					}
					new const totalCash = totalmony + bonus + FishPrice[playerid];
					GivePlayerCash(playerid, totalCash);	
					format(string, sizeof(string), "%s da nhan duoc $%s cho cong viec %s.", GetName(playerid), FormatNumber(totalCash), JobInfo[PlayerInfo[playerid][pJob]][jName]);
					Log("logs/jobmoney.log", string);	
					Update(playerid, pCashx);
					FishPrice[playerid] = 0;
					pFishing[playerid] = 0;
					//pFishess[playerid] = 0;
					PlayerInfo[playerid][pFishSkill] ++;
					UpdateVar(playerid, "FishSkill", PlayerInfo[playerid][pFishSkill]);
					if(PlayerInfo[playerid][pFishSkill] == 50)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 2. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
					else if(PlayerInfo[playerid][pFishSkill] == 100)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 3. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
					else if(PlayerInfo[playerid][pFishSkill] == 200)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 4. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
					else if(PlayerInfo[playerid][pFishSkill] == 400)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 5. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
					if(togjob[playerid] == 0) {
						JobProgress(playerid);
					}
					//CheckNhiemVuCapDo(playerid);
					if(GetPlayerSkill(playerid) == 5) finishAchievement(playerid, 0);
					if(PlayerInfo[playerid][pMember] == 0) {
						for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
							if(PlayerInfo[playerid][pDailyMission][m] == 15 || PlayerInfo[playerid][pDailyMission][m] == 16) CheckMission(playerid, m);
						}					
					}
					for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
						if(PlayerInfo[playerid][pDailyMission][m] == 2) CheckMission(playerid, m);
					}				
					//type = 1;
					if(PlayerInfo[playerid][pClan]!=0) {
						new ran=1+random(3),sql[200],cid=PlayerInfo[playerid][pClan];
						ClanInfo[cid][clPoints]+=ran;
						PlayerInfo[playerid][pPoints]+=ran;
						Update(playerid, pPoints);
						format(string, sizeof(string), "{%s}Diem hoat dong Clan: +%d (%d) - %s", ClanInfo[cid][clColor], ran, ClanInfo[cid][clPoints], GetName(playerid));
						SendClanMessage(cid, string);
						format(sql, sizeof(sql), "UPDATE clans SET `ActivePoints`='%d' WHERE `ID`='%d'", ClanInfo[cid][clPoints], cid);
						mysql_tquery(SQL, sql, "", "");
					}
				}
				else SendClientMessage(playerid, COLOR_YELLOW, "Ban khong o tai 24/7");
			}
			else if(strmatch("Ca Vang", invData[playerid][id][invItem])) {
				if(gettime() < GetPVarInt(playerid, "Ban2Ca")) NightBot(playerid, "Ban 2 ca");
				if(TimpMateriale[playerid] == 1) return Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Ban ca", "ERROR: Ban khong the ban mot con ca qua nhanh, hay tro lai sau!", "Ok", "Cancel");
				//if(PlayerInfo[playerid][pJob] != 15 || PlayerInfo[playerid][pJob] != 11) return SendClientMessage(playerid, COLOR_YELLOW, "Ban khong phai la Fisherman");
				if(BizzInfo[InBussines[playerid]][bType] == 6)
				{
					Inventory_Remove(playerid, "Ca Vang");
					pFishing[playerid] = 0;
					x = 20000 + random(45000);
					format(strings, sizeof(strings), "{FF0000}>>{FFFFFF} %s (%d) da ban mot con {FFF400}Ca Vang{FFFFFF} voi gia ({15FF00}$%s{FFFFFF}).", GetName(playerid), playerid, FormatNumber(x));
					NearMessage(playerid, COLOR_YELLOW, strings);	
					GuiDenAdminVaHelper(COLOR_YELLOW, string, 1); 
					FishPrice[playerid] = x;
					SetPVarInt(playerid, "Ban2Ca", gettime() + 25);
					format(string, 35,"Ban nhan duoc $%s!", FormatNumber(FishPrice[playerid] + totalmony));
					//UpdateJobGoal(FishPrice[playerid], MAXGOAL);
					SendClientMessage(playerid, COLOR_YELLOW, string);
					new bonus = 0;
					if(TodayJob == 11 || TodayJob == 15) {
						bonus = JobInfo[PlayerInfo[playerid][pJob]][jBonus]*(FishPrice[playerid]/100);
						format(string, 130, "Ban nhan them $%s Fisherman Bonus. Tong nhan duoc: $%s.", FormatNumber(bonus), FormatNumber(totalmony+bonus+FishPrice[playerid]));
						SendClientMessage(playerid, COLOR_GOLD, string);
					}
					new const totalCash = totalmony + bonus + FishPrice[playerid];
					GivePlayerCash(playerid, totalCash);	
					format(string, sizeof(string), "%s da nhan duoc $%s cho cong viec %s.", GetName(playerid), FormatNumber(totalCash), JobInfo[PlayerInfo[playerid][pJob]][jName]);
					
					//InsertLog(playerid, string, LOG_MONEY);
					Log("logs/jobmoney.log", string);	
					Update(playerid, pCashx);
					FishPrice[playerid] = 0;
					pFishing[playerid] = 0;
					
					//pFishess[playerid] = 0;
					PlayerInfo[playerid][pFishSkill] ++;
					UpdateVar(playerid, "FishSkill", PlayerInfo[playerid][pFishSkill]);
					if(PlayerInfo[playerid][pFishSkill] == 50)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 2. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
					else if(PlayerInfo[playerid][pFishSkill] == 100)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 3. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
					else if(PlayerInfo[playerid][pFishSkill] == 200)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 4. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
					else if(PlayerInfo[playerid][pFishSkill] == 400)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 5. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
					if(togjob[playerid] == 0) {
						JobProgress(playerid);
					}
					//CheckNhiemVuCapDo(playerid);
					if(GetPlayerSkill(playerid) == 5) finishAchievement(playerid, 0);
					if(PlayerInfo[playerid][pMember] == 0) {
						for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
							if(PlayerInfo[playerid][pDailyMission][m] == 15 || PlayerInfo[playerid][pDailyMission][m] == 16) CheckMission(playerid, m);
						}					
					}
					for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
						if(PlayerInfo[playerid][pDailyMission][m] == 2) CheckMission(playerid, m);
					}			
					if(PlayerInfo[playerid][pClan]!=0) {
						new ran=1+random(3),sql[200],cid=PlayerInfo[playerid][pClan];
						ClanInfo[cid][clPoints]+=ran;
						PlayerInfo[playerid][pPoints]+=ran;
						Update(playerid, pPoints);
						format(string, sizeof(string), "{%s}Diem hoat dong Clan: +%d (%d) - %s", ClanInfo[cid][clColor], ran, ClanInfo[cid][clPoints], GetName(playerid));
						SendClanMessage(cid, string);
						format(sql, sizeof(sql), "UPDATE clans SET `ActivePoints`='%d' WHERE `ID`='%d'", ClanInfo[cid][clPoints], cid);
						mysql_tquery(SQL, sql, "", "");
					}	
					//type = 1;
				}
				else SendClientMessage(playerid, COLOR_YELLOW, "Ban khong o tai 24/7");
			}
			else if(strmatch("Ca Map", invData[playerid][id][invItem])) {
				if(gettime() < GetPVarInt(playerid, "Ban2Ca")) NightBot(playerid, "Ban 2 ca");
				if(TimpMateriale[playerid] == 1) return Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Ban ca", "ERROR: Ban khong the ban mot con ca qua nhanh, hay tro lai sau!", "Ok", "Cancel");
				//if(PlayerInfo[playerid][pJob] != 15 || PlayerInfo[playerid][pJob] != 11) return SendClientMessage(playerid, COLOR_YELLOW, "Ban khong phai la Fisherman");
				if(BizzInfo[InBussines[playerid]][bType] == 6)
				{
					Inventory_Remove(playerid, "Ca Map");
					x = 150000;
					SetPVarInt(playerid, "Ban2Ca", gettime() + 25);
					pFishing[playerid] = 0;
					format(strings, sizeof(strings), "{FF0000}>>{FFFFFF} %s (%d) da ban mot con {FFF400}Ca Map{FFFFFF} voi gia ({15FF00}$%s{FFFFFF}).", GetName(playerid), playerid, FormatNumber(x));
					NearMessage(playerid, COLOR_YELLOW, strings);	
					GuiDenAdminVaHelper(COLOR_YELLOW, string, 1); 
					FishPrice[playerid] = x;
					format(string, 35,"Ban nhan duoc $%s!", FormatNumber(FishPrice[playerid] + totalmony));
					//UpdateJobGoal(FishPrice[playerid], MAXGOAL);
					SendClientMessage(playerid, COLOR_YELLOW, string);
					new bonus = 0;
					if(TodayJob == 11 || TodayJob == 15) {
						bonus = JobInfo[PlayerInfo[playerid][pJob]][jBonus]*(FishPrice[playerid]/100);
						format(string, 130, "Ban nhan them $%s Fisherman Bonus. Tong nhan duoc: $%s.", FormatNumber(bonus), FormatNumber(totalmony+bonus+FishPrice[playerid]));
						SendClientMessage(playerid, COLOR_GOLD, string);
					}
					new const totalCash = totalmony + bonus + FishPrice[playerid];
					GivePlayerCash(playerid, totalCash);	
					format(string, sizeof(string), "%s da nhan duoc $%s cho cong viec %s.", GetName(playerid), FormatNumber(totalCash), JobInfo[PlayerInfo[playerid][pJob]][jName]);
					Log("logs/jobmoney.log", string);	
					Update(playerid, pCashx);
					FishPrice[playerid] = 0;
					//pFishess[playerid] = 0;
					PlayerInfo[playerid][pFishSkill] ++;
					UpdateVar(playerid, "FishSkill", PlayerInfo[playerid][pFishSkill]);
					if(PlayerInfo[playerid][pFishSkill] == 50)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 2. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
					else if(PlayerInfo[playerid][pFishSkill] == 100)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 3. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
					else if(PlayerInfo[playerid][pFishSkill] == 200)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 4. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
					else if(PlayerInfo[playerid][pFishSkill] == 400)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cong viec Cau Ca da dat level 5. Ban se nhan duoc nhieu tien hon va cau duoc ca' to hon."); }
					if(togjob[playerid] == 0) {
						JobProgress(playerid);
					}
					if(PlayerInfo[playerid][pClan]!=0) {
						new ran=1+random(3),sql[200],cid=PlayerInfo[playerid][pClan];
						ClanInfo[cid][clPoints]+=ran;
						PlayerInfo[playerid][pPoints]+=ran;
						Update(playerid, pPoints);
						format(string, sizeof(string), "{%s}Diem hoat dong Clan: +%d (%d) - %s", ClanInfo[cid][clColor], ran, ClanInfo[cid][clPoints], GetName(playerid));
						SendClanMessage(cid, string);
						format(sql, sizeof(sql), "UPDATE clans SET `ActivePoints`='%d' WHERE `ID`='%d'", ClanInfo[cid][clPoints], cid);
						mysql_tquery(SQL, sql, "", "");
					}
					//CheckNhiemVuCapDo(playerid);
					if(GetPlayerSkill(playerid) == 5) finishAchievement(playerid, 0);
					if(PlayerInfo[playerid][pMember] == 0) {
						for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
							if(PlayerInfo[playerid][pDailyMission][m] == 15 || PlayerInfo[playerid][pDailyMission][m] == 16) CheckMission(playerid, m);
						}					
					}
					for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
						if(PlayerInfo[playerid][pDailyMission][m] == 2) CheckMission(playerid, m);
					}				
					//type = 1;
				}
				else SendClientMessage(playerid, COLOR_YELLOW, "Ban khong o tai 24/7");
			}
			else if(strmatch("DE", invData[playerid][id][invItem])) {
				ServerWeapon(playerid, getGunID(invData[playerid][id][invItem]), invData[playerid][id][invQuantity]);
				Inventory_Remove(playerid, invData[playerid][id][invItem], invData[playerid][id][invQuantity]);
			}
			else if(strmatch("M4", invData[playerid][id][invItem])) {
				ServerWeapon(playerid, getGunID(invData[playerid][id][invItem]), invData[playerid][id][invQuantity]);
				Inventory_Remove(playerid, invData[playerid][id][invItem], invData[playerid][id][invQuantity]);
			}
			else if(strmatch("Shotgun", invData[playerid][id][invItem])) {
				ServerWeapon(playerid, getGunID(invData[playerid][id][invItem]), invData[playerid][id][invQuantity]);
				Inventory_Remove(playerid, invData[playerid][id][invItem], invData[playerid][id][invQuantity]);
			}
			else if(strmatch("AK47", invData[playerid][id][invItem])) {
				ServerWeapon(playerid, getGunID(invData[playerid][id][invItem]), invData[playerid][id][invQuantity]);
				Inventory_Remove(playerid, invData[playerid][id][invItem], invData[playerid][id][invQuantity]);
			}
			else if(strmatch("Shotgun", invData[playerid][id][invItem])) {
				ServerWeapon(playerid, getGunID(invData[playerid][id][invItem]), invData[playerid][id][invQuantity]);
				Inventory_Remove(playerid, invData[playerid][id][invItem], invData[playerid][id][invQuantity]);
			}
			else if(strmatch("Baseballbat", invData[playerid][id][invItem])) {
				ServerWeapon(playerid, getGunID(invData[playerid][id][invItem]), invData[playerid][id][invQuantity]);
				Inventory_Remove(playerid, invData[playerid][id][invItem], invData[playerid][id][invQuantity]);
			}
			else if(strmatch("Uzi", invData[playerid][id][invItem])) {
				ServerWeapon(playerid, getGunID(invData[playerid][id][invItem]), invData[playerid][id][invQuantity]);
				Inventory_Remove(playerid, invData[playerid][id][invItem], invData[playerid][id][invQuantity]);
			}
			else if(strmatch("Skins", invData[playerid][id][invItem])) {
				PlayerInfo[playerid][pChar] = invData[playerid][id][invModel]; 
				// pUpdateInt(playerid, "playerSkin", invData[playerid][id][invModel]);
				SetPlayerSkin(playerid, invData[playerid][id][invModel]);
			}
			if(strmatch("Skins", invData[playerid][id][invItem])) {
				NearMessage2(playerid, 25.0,COLOR_PURPLE, "** %s da thay doi trang phuc (%d)", GetName(playerid), invData[playerid][id][invModel]);
				SetPVarInt(playerid, "ChoDoi", gettime() + 3);
				if(isInInven[playerid]! = 0) {
					inventoryTextDraws(playerid, false);
					isInInven[playerid] = 0;
					CancelSelectTextDraw(playerid);
				}
			}
			else {
				NearMessage2(playerid, 25.0,COLOR_PURPLE, "** %s da lay %s tu tui do ra va su dung.", GetName(playerid), invData[playerid][id][invItem]);
				SetPVarInt(playerid, "ChoDoi", gettime() + 3);
			}
		}
		case 1: {
			if(strmatch("Skins", invData[playerid][id][invItem])) {
				if(PlayerInfo[playerid][pChar] == invData[playerid][id][invModel]) {
					PlayerInfo[playerid][pChar] = 250; 
					SetPlayerSkin(playerid, 250);
				}
				SCMf(playerid, -1, "Ban da lay trang phuc %d tu tui do ra va vut di.", invData[playerid][id][invModel]);
				Inventory_Remove(playerid, invData[playerid][id][invItem],invData[playerid][id][invQuantity], invData[playerid][id][invModel], invData[playerid][id][invID]);
				SetPVarInt(playerid, "ChoDoi", gettime() + 3);
			}
			else {
				SCMf(playerid, -1, "Ban da lay %s tu tui do ra va vut di.", invData[playerid][id][invItem]);
				Inventory_Remove(playerid, invData[playerid][id][invItem]);
				if(pFishing[playerid] == 1) pFishing[playerid] = 0;
				SetPVarInt(playerid, "ChoDoi", gettime() + 3);
			}
			/*switch(invData[playerid][id][invExists]) {
				case 1: {
					SCMf(playerid, -1, "Ban da vut bo mot cai %s.", invData[playerid][id][invItem]);
					Inventory_Remove(playerid, invData[playerid][id][invItem], invData[playerid][id][invExists]);
					if(pFishing[playerid] == 1) pFishing[playerid] = 0;
				}
				case 2: {
					SCMf(playerid, -1, "Ban da vut bo khau sung %s voi tat ca dan.", invData[playerid][id][invItem]);
					Inventory_Remove(playerid, invData[playerid][id][invItem], invData[playerid][id][invExists], invData[playerid][id][invQuantity]);
				}
				case 3: {
					SCMf(playerid, -1, "Ban da xoa mot skin cua minh.", invData[playerid][id][invItem]);
					Inventory_Remove(playerid, invData[playerid][id][invItem], invData[playerid][id][invExists], invData[playerid][id][invQuantity]);
				}
			}*/
		}
	}
	return 1;
}