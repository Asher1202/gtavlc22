CMD:locations(playerid, params[]) 
{
	if(CP[playerid] != 0) return Dialog_Show(playerid, DIALOG_CHECKPOINT, DIALOG_STYLE_MSGBOX, "Checkpoint", "Mot cham do dang hoat dong.\nBan co muon xoa no khong? Neu muon, hay chon 'Ok'.", "Ok", "Exit");
	if(Iter_Contains(PlayerInRace, playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong the su dung lenh nay trong truong dua xe!");

	Dialog_Show(playerid, DIALOG_LOCATIONS, DIALOG_STYLE_LIST, "SERVER: Server Locations", "Driving School(DMV)\nLos Santos\nLas Venturas\nFaction HQS\nPaintball + Truong dua \nCua hang xe\nCity Hall", "Select", "Close");
	return 1;
}
Dialog:DIALOG_LOCATIONS(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new string[500];
	SetPVarInt(playerid, "Selected", listitem);
	switch(listitem) {
		case 0: {
			SetPlayerCheckpointEx(playerid, 1219.96, -1814.44, 16.5938, 3.0);
			CP[playerid] = 53;
			SendClientMessage(playerid, COLOR_YELLOW, "Theo checkpoint de den dia diem do!");
		}
		case 1: {
			for(new i = 1; i < sizeof(bizTypeName); i++) {
				format(string, sizeof(string), "%s%s (%d cua hang)\n", string, bizTypeName[i], LSBizNumber[i]);
			}
			Dialog_Show(playerid, DIALOG_GPS, DIALOG_STYLE_LIST, "Los Santos Locations", string, "Find", "Back");
		}
		case 2: {
			for(new i = 1; i < sizeof(bizTypeName); i++) {
				format(string, sizeof(string), "%s%s (%d cua hang)\n", string, bizTypeName[i], LVBizNumber[i]);
			}
			Dialog_Show(playerid, DIALOG_GPS, DIALOG_STYLE_LIST, "Las Venturas Locations", string, "Find", "Back");
		}
		case 3: {
			callcmd::factions(playerid, "");
		}
		case 4: {
			SetPlayerCheckpointEx(playerid, gungamePos[0], gungamePos[1], gungamePos[2], 3.0);
			CP[playerid] = 53;
			SendClientMessage(playerid, COLOR_YELLOW, "Theo checkpoint de den dia diem do!");
		}
		case 5: {
			SetPlayerCheckpointEx(playerid, dealershipPos[0][0], dealershipPos[0][1], dealershipPos[0][2], 3.0);
			CP[playerid] = 53;
			SendClientMessage(playerid, COLOR_YELLOW, "Theo checkpoint de den dia diem do!");
		}
		// case 6: { // daily veso
		// 	SetPlayerCheckpointEx(playerid, 1119.2765,-1505.8556,13.6791, 3.0);
		// 	CP[playerid] = 53;
		// 	SendClientMessage(playerid, COLOR_YELLOW, "Theo checkpoint de den dia diem do!");
		// }
		// case 7: { // lau xanh
		// 	SetPlayerCheckpointEx(playerid, 2232.7986,-1159.8341,25.8906, 3.0);
		// 	CP[playerid] = 53;
		// 	SendClientMessage(playerid, COLOR_YELLOW, "Theo checkpoint de den dia diem do!");
		// }
		case 6: { // city hall
			SetPlayerCheckpointEx(playerid, 1481.1591,-1794.6198,18.7957, 3.0);
			CP[playerid] = 53;
			SendClientMessage(playerid, COLOR_YELLOW, "Theo checkpoint de den dia diem do!");
		}
	}
	return 1;
}

Dialog:DIALOG_GPS(playerid, response, listitem, inputtext[]) 
{
	if(!response) return callcmd::locations(playerid, "");
	new string[500], x = listitem+1;
	strcat(string, "ID\tBiz Info\n");
	switch(GetPVarInt(playerid, "Selected")) {
		case 1: {
			foreach(new i: GpsBiz<0>) {
				if(BizzInfo[i][bType] == x) format(string, sizeof(string), "%s%d\t%s (cach %.1fm)\n", string, i, bizTypeName[BizzInfo[i][bType]], GetPlayerDistanceFromPoint(playerid, BizzInfo[i][bEntranceX],BizzInfo[i][bEntranceY],BizzInfo[i][bEntranceZ]));
			}
			if(strlen(string) < 20) return Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Los Santos Locations", "Khong co dia diem nao.", "Find", "Back");
			Dialog_Show(playerid, DIALOG_GPS1, DIALOG_STYLE_TABLIST_HEADERS, "Los Santos Locations", string, "Find", "Back");
		}
		case 2: {
			foreach(new i: GpsBiz<1>) {			
				if(BizzInfo[i][bType] == x) format(string, sizeof(string), "%s%d\t%s (cach %.1fm)\n", string, i, bizTypeName[BizzInfo[i][bType]], GetPlayerDistanceFromPoint(playerid, BizzInfo[i][bEntranceX],BizzInfo[i][bEntranceY],BizzInfo[i][bEntranceZ]));
			}
			if(strlen(string) < 20) return Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Los Santos Locations", "Khong co dia diem nao.", "Find", "Back");
			Dialog_Show(playerid, DIALOG_GPS1, DIALOG_STYLE_TABLIST_HEADERS, "Las Venturas Locations", string, "Find", "Back");
		}	
	}

	return 1;
}
Dialog:DIALOG_GPS1(playerid, response, listitem, inputtext[]) 
{
	if(!response) return callcmd::locations(playerid, "");
	if(JobWorking[playerid] == 1 || BizRobbed[playerid] != 0) return 1;
	if(CP[playerid] != 0 || targetfind[playerid] != -1) return Dialog_Show(playerid, DIALOG_CHECKPOINT, DIALOG_STYLE_MSGBOX, "Checkpoint", "Mot cham do dang hoat dong.\nBan co muon xoa no khong? Neu muon, hay chon 'Ok'.", "Ok", "Exit");
	new i = strval(inputtext);	
	SetPlayerCheckpointEx(playerid, BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ], 3.0);
	CP[playerid] = 53;
	SendClientMessage(playerid, COLOR_YELLOW, "Theo checkpoint de den dia diem do!");
	return 1;
}