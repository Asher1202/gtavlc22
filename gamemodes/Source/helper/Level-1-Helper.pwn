CMD:sc(playerid, params[]) {
	if(PlayerInfo[playerid][pHelper]== 0 && PlayerInfo[playerid][pAdmin] == 0) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la Helper."); 
	new text[250],string[250];
	if(sscanf(params, "s[250]",text)) return SendClientMessage(playerid,COLOR_GREY, "Su dung: {FFFFFF}/sc <noi dung>");
	if(PlayerInfo[playerid][pAdmin] > 0) format(string, sizeof(string), "{%s}* (%d) %s %s: %s",helperChatColor,PlayerInfo[playerid][pAdmin],GetAdminRank(playerid),GetName(playerid), text);
	else format(string, sizeof(string), "{%s}* (%d) Helper %s: %s", helperChatColor, PlayerInfo[playerid][pHelper], GetName(playerid), text);
	SendStaffMessage(COLOR_GREY, string);
	return 1;
}
CMD:nduty(playerid, params[]) {
	if(PlayerInfo[playerid][pHelper] == 0) return SendClientMessage(playerid, COLOR_GREY, AdminOnly);
	switch(Iter_Contains(HelpersDuty, playerid)) {
	    case 0: {
	    	Iter_Add(HelpersDuty, playerid);

	    	SendClientMessage(playerid, -1, "Ban se nhan duoc cau hoi. Hay tra loi that tot nhe, ban co the chuyen cau hoi cho admin voi lenh /nreport, /nskip de bo qua, /ndelete de xoa.");
	    }
	    case 1: {
			if(HaveHelp[playerid] != -1) 
				return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay vi co mot cau hoi chua duoc ban tra loi.");

			Iter_Remove(HelpersDuty, playerid);

			SendClientMessage(playerid, -1, "Tu bay gio, ban se khong con nhan duoc cau hoi.");	
		}
	}
	return 1;	
}
CMD:nskip(playerid, params[]) {
    if(PlayerInfo[playerid][pHelper] == 0) return SendClientMessage(playerid, COLOR_GREY, AdminOnly);
    if(!Iter_Contains(HelpersDuty, playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban chua onduty nhu mot helper.");
	if(HaveHelp[playerid] == -1) return SendClientMessage(playerid, COLOR_GREY, "Ban khong nhan duoc cau hoi nao.");
	new helpers, string[180];
	foreach(new i: PlayerHelpers) {
		if(IsPlayerConnected(i) && IsPlayerLogged[i] == 1) {
			if(PlayerInfo[i][pHelper] != 0 && Iter_Contains(HelpersDuty, playerid) && HaveHelp[i] == -1 && i != playerid) {
				helpers++;
			}
		}
	}
	if(helpers == 0) return SendClientMessage(playerid, -1, "Chi co mot minh ban la Helper dang onduty. Hay co gang tra loi nhe, hoac ban co the hoi Admin.");
	new helperID, attempt;
	do {
		helperID = Iter_Random(PlayerHelpers);
		attempt++;
	}
	while((helperID != playerid && Iter_Contains(HelpersDuty, helperID) && HaveHelp[helperID] == -1) || attempt == 30);

	if(attempt != 30) {
		new userID = HaveHelper[helperID]; PlayerPlaySound(userID, 1056, 0.0, 0.0, 0.0);
		format(string, sizeof(string), "AdmCmd: Helper %s da bo qua cau hoi cua %s va nguoi tra loi cau hoi nay se la %s.", GetName(playerid), GetName(HaveHelp[playerid]), GetName(helperID));
		if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(COLOR_LOGS, string, 1);
		format(string, sizeof(string), "Mot Helper da bo qua cau hoi cua ban va nguoi tra loi cau hoi nay se la %s (%d).", GetName(helperID), helperID);
		SendClientMessage(HaveHelp[playerid], COLOR_LGREEN, string);
		format(string, sizeof(string), "* %s (%d) hoi: %s", GetName(HaveHelp[playerid]), HaveHelp[playerid], HelpText[HaveHelp[playerid]]);
		SendClientMessage(userID, 0x4FB021FF, string);
		HaveHelp[helperID] = HaveHelp[playerid];
		SendClientMessage(playerid, COLOR_YELLOW, "Ban da bo qua cau hoi nay.");
		HaveHelp[playerid] = -1;
	}
	else return SendClientMessage(playerid, -1, "Chi co mot minh ban la Helper dang online. Hay co gang tra loi nhe, hoac ban co the hoi Admin.");
	return 1;
}
CMD:nreport(playerid, params[]) {
	if(PlayerInfo[playerid][pHelper] == 0) return SendClientMessage(playerid, COLOR_GREY, AdminOnly);
    if(!Iter_Contains(HelpersDuty, playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban chua onduty nhu mot helper.");
	if(HaveHelp[playerid] == -1) return SendClientMessage(playerid, COLOR_GREY, "Ban khong nhan duoc cau hoi nao.");
	new userID = HaveHelp[playerid];
	new string[180];
	format(string, sizeof(string), "AdmCmd: %s da gui cau hoi cua %s (%d) cho doi ngu Admin.", GetName(playerid), GetName(userID), userID);
	SendStaffMessage(COLOR_LOGS, string);
	SendClientMessage(userID, COLOR_GOLD, "Cau hoi cau ban da duoc gui den doi ngu Admin!");	
	format(string, sizeof(string), "Bao cao tu %s (%d): %s.", GetName(userID), userID, HelpText[userID]);
	SendAdminMessage(0xC9161FFF, string, 1);
	format(string, sizeof(string), "Bao cao cua ban da duoc gui den doi ngu admin.");
	stop ReportTimer[userID];
	ReportTimer[userID] = defer CheckReport(userID);
	SendClientMessage(userID, COLOR_YELLOW, string);
	
	SetPVarInt(userID, "Reported", 1);
	SetPVarInt(userID, "ReportType", 4);						
	SetPVarString(userID, "ReportText", HelpText[HaveHelp[playerid]]);	
	
	PlayerInfo[userID][pReportTime] = 120;
	HaveHelp[playerid] = -1;
	Iter_Remove(PlayerHelped, userID);
	return 1;
}
CMD:nmute(playerid, params[]) {
	new userID, time, result[180];
	if(IsPlayerLogged[playerid] == 0) return SendClientMessage(playerid, COLOR_RED, "Ban chua dang nhap!");
	if(PlayerInfo[playerid][pAdmin] < 1 && PlayerInfo[playerid][pHelper] < 1) return SendClientMessage(playerid, COLOR_GREY, AdminOnly);
	if(sscanf(params, "uis[180]", userID, time, result)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/nmute <playerid/name> <time> <ly do>");
	if(!IsPlayerConnected(userID) && userID == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong dang nhap.");		
	if(PlayerInfo[userID][pAdmin] > PlayerInfo[playerid][pAdmin]) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot Admin cap cao hon ban!");
	if(userID == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren chinh minh!");
	PlayerInfo[userID][pNewbieMute] = time*60;
	Update(playerid, pNewbieMutex);
	
	new string[180];
	format(string, sizeof(string), "AdmCmd: %s da bi cam chat trong %d phut tren kenh /newbie boi %s, Li do: %s", GetName(userID), time, GetName(playerid), result);
	SCMTA(COLOR_LIGHTRED, string);
	format(string, sizeof(string), "Ban da bi cam chat tren kenh /newbie trong %d phut! Li do: %s", time, result);
	SendClientMessage(userID, COLOR_WARNING, string);	
	return 1;
}
CMD:hh(playerid, params[]) {
	if(PlayerInfo[playerid][pHelper] == 0) return 1;
	new szDialog[500];
	if(PlayerInfo[playerid][pHelper] > 0) {
		strcat(szDialog, "{5F9CC9}Helper 1:{FFFFFF}\n");
		strcat(szDialog, "/slap /cc /hpoints /sc(staff chat) /hac\n/nduty, /nreply, /nskip, /ndelete, /checkhelp, /pm, /deletead, /nreport.\n");
	}
	if(PlayerInfo[playerid][pHelper] > 1) {
		strcat(szDialog, "{5F9CC9}Helper 2:{FFFFFF}\n");
		strcat(szDialog, "/skick /kick /freeze /unfreeze /spec /specoff /mute");
	}
    Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "{FFFFFF}Lenh:", szDialog, "Close", "");
	return 1;
}
CMD:helps(playerid, params[]) {
	new string[180];
	if(PlayerInfo[playerid][pAdmin] < 1 && PlayerInfo[playerid][pHelper] < 1) return 1;
	SendClientMessage(playerid, -1, "------------------------------------------------------------------------------------");
	foreach(new i : PlayerHelped) { 
		format(string, 512, "* %s (%d) da hoi %s: %s", GetName(i), i, LaCineEsteIntrebarea(i), HelpText[i]);
		MesajLung(playerid, COLOR_LGREEN, string);
	}
	format(string, sizeof(string), "Co %d cau hoi dang cho duoc tra loi!", Iter_Count(PlayerHelped));
	SendClientMessage(playerid, COLOR_WHITE, string);
	SendClientMessage(playerid, -1, "------------------------------------------------------------------------------------");
	return 1;
}
CMD:nr(playerid, params[]) {
	if(PlayerInfo[playerid][pHelper] == 0) return SendClientMessage(playerid, COLOR_GREY, AdminOnly);
    if(!Iter_Contains(HelpersDuty, playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong lam nhiem vu nhu mot helper (/nduty).");
	if(HaveHelp[playerid] == -1) return SendClientMessage(playerid, COLOR_GREY, "Ban khong nhan duoc cau hoi nao.");
	new result[250], string[180];
	if(sscanf(params, "s[250]",result)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/nr <noi dung>");
	new userID = HaveHelp[playerid];
	format(string, sizeof(string), "* Newbie %s: %s", GetName(userID), HelpText[userID]);
	SendNewbieMessage2(0x9DFE8080, string);	
	format(string, sizeof(string), "* Helper %s: @%s, %s", GetName(playerid), GetName(userID), result);
	foreach(new i: Player) {
		if(IsPlayerLogged[i] == 1) {
			if(i == userID) MesajLung(i, COLOR_YELLOW, string);
			else if(PlayerInfo[i][pAdmin]+PlayerInfo[i][pHelper] != 0) MesajLung(i, 0x9DFE8080, string);
		}
	}
	HaveHelp[playerid] = -1;
	GivePlayerCash(playerid, 15000);
	PlayerInfo[playerid][pHelpedPlayers] ++;
	PlayerInfo[playerid][pHelpedPlayersToday] ++;
	Iter_Remove(PlayerHelped, userID);
	new szQuery[256];
	format(szQuery, sizeof(szQuery), "UPDATE users SET `HelpedPlayers` = '%d', `HelpedPlayersToday`='%d' WHERE `ID` = '%d'", PlayerInfo[playerid][pHelpedPlayers], PlayerInfo[playerid][pHelpedPlayersToday], PlayerInfo[playerid][pSQLID]);
	mysql_query(SQL, szQuery);	
	return 1;
}
CMD:checkhelp(playerid, params[]) {
    if(PlayerInfo[playerid][pHelper] == 0) return SendClientMessage(playerid, COLOR_GREY, AdminOnly);
    if(!Iter_Contains(HelpersDuty, playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong lam nhiem vu nhu mot helper (/nduty).");
	if(HaveHelp[playerid] == -1) return SendClientMessage(playerid, COLOR_GREY, "Ban khong nhan duoc cau hoi nao.");
	new userID = HaveHelp[playerid], string[180];
	format(string, sizeof(string), "* %s da hoi: %s", GetName(userID), HelpText[userID]);
	SendClientMessage(playerid, COLOR_LGREEN, string);
	return 1;
}
CMD:ndelete(playerid, params[]) {
    if(PlayerInfo[playerid][pHelper] == 0) return SendClientMessage(playerid, COLOR_GREY, AdminOnly);
    if(!Iter_Contains(HelpersDuty, playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong lam nhiem vu nhu mot helper (/nduty).");
	if(HaveHelp[playerid] == -1) return SendClientMessage(playerid, COLOR_GREY, "Ban khong nhan duoc cau hoi nao.");
	new result[64], string[256];
	if(sscanf(params, "s[64]",result)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/ndelete <ly do>");
	new userID = HaveHelp[playerid];
	format(string, sizeof(string), "* Cau hoi cua ban da bi xoa boi %s. Li do: %s", GetName(playerid), result);
	SendClientMessage(userID, COLOR_YELLOW, string);
	format(string, sizeof(string), "AdmBot: Helper %s da xoa cau hoi cua %s. Li do: %s", GetName(playerid), GetName(HaveHelp[playerid]), result);
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(COLOR_LOGS, string, 1);
	SendClientMessage(playerid, COLOR_YELLOW, "* Ban da xoa cau hoi nay.");
	Iter_Remove(PlayerHelped, userID);
	HaveHelp[playerid] = -1;
	PlayerInfo[playerid][pHelpedPlayers] ++;
	PlayerInfo[playerid][pHelpedPlayersToday] ++;
	new szQuery[256];
	format(szQuery, sizeof(szQuery), "UPDATE users SET `HelpedPlayers` = '%d', `HelpedPlayersToday`='%d' WHERE `ID` = '%d'", PlayerInfo[playerid][pHelpedPlayers], PlayerInfo[playerid][pHelpedPlayersToday], PlayerInfo[playerid][pSQLID]);
	mysql_query(SQL, szQuery);	
	return 1;
}