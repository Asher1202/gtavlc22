CMD:emails(playerid, params[]) return CategoryEmails(playerid);
	
CategoryEmails(playerid) {
	new string[256], query[256], send, read, emails;

	format(query, sizeof(query), "SELECT * FROM `emails` WHERE `Name`='%s' ORDER BY `emails`.`ID` DESC LIMIT 10", GetName(playerid));
	new Cache: result = mysql_query(SQL, query);	
	for(new i, x = cache_num_rows (); i < x; i++) {
		cache_get_value_name_int(i, "Read", read);
		if(read == 0) emails++;
	}	
	cache_delete(result);	
	
    format(query, sizeof(query), "SELECT * FROM `emails` WHERE `Type`='1' AND `By`='%s'", GetName(playerid));
    new Cache: result2 = mysql_query(SQL, query);
    send = cache_num_rows ();
    cache_delete(result2);			
	
	format(string, sizeof(string), "{FCBF4C}(+) Gui email{FFFFFF}\nInbox (%d chua doc)\nTin nhan da gui (%d tin)", emails, send);
	Dialog_Show(playerid, DIALOG_EMAILS, DIALOG_STYLE_LIST, "Emails", string, "Ok", "Close"); 
	return 1;
}
	
InsertEmail(playername[], by[], text[], type) {
	new 
		szQuery[1024], szDate[180], Year, Month, Day, Hour, Minute, Second;
		
	getdate(Year, Month, Day);
	gettime(Hour, Minute, Second);

	format(szDate, sizeof(szDate), "%02d/%02d/%d - %02d:%02d:%02d", Day, Month, Year, Hour, Minute, Second); 
	format(szQuery, sizeof(szQuery), "INSERT INTO `emails` (`Name`, `Text`, `By`, `Date`, `Type`) VALUES ('%s', '%s', '%s', '%s', '%d')", playername, text, by, szDate, type);
	mysql_query(SQL, szQuery);	
	
	new userid = GetPlayerID(playername);
	if(userid != INVALID_PLAYER_ID) SendClientMessage(userid, COLOR_YELLOW, "* Ban da nhan duoc mot email moi! Su dung lenh /emails de doc."), PlayerPlaySound(userid, 1052, 0.0, 0.0, 0.0);	
	return 1;
}

ShowEmails(playerid, type) {
	SetPVarInt(playerid, "Type", 0);
	
	new 
		szDialog[1200], szDialog2[256], text[64], email[50], szQuery[256], qresult[5][256], s;
	
	if(GetPVarInt(playerid, "Type") == 0) format(szQuery, sizeof(szQuery), "SELECT * FROM `emails` WHERE `Name`='%s' ORDER BY `emails`.`ID` DESC LIMIT 10", GetName(playerid), type);
	else format(szQuery, sizeof(szQuery), "SELECT * FROM `emails` WHERE `By`='%s' ORDER BY `emails`.`ID` DESC LIMIT 10", GetName(playerid), type);
	new Cache: result = mysql_query(SQL, szQuery);	
	
	if(GetPVarInt(playerid, "Type") == 0) strcat(szDialog, "Email\tBy\tDate\n");
	else strcat(szDialog, "Email\tTo\tDate\n");
	for(new i, x = cache_num_rows (); i < x; i++) {
		cache_get_value_name(i, "Text", qresult[0]);
		if(GetPVarInt(playerid, "Type") == 0) cache_get_value_name(i, "By", qresult[1]);
		else cache_get_value_name(i, "Name", qresult[1]);
		cache_get_value_name(i, "Date", qresult[2]);
		cache_get_value_name(i, "Read", qresult[3]);
		cache_get_value_name(i, "ID", qresult[4]);
		EmailID[playerid][s] = strval(qresult[4]);
		if(strval(qresult[3]) == 0) text = "(chua doc) ";
		else text= "";
		format(email, 45, "%s", qresult[0]);
		strcat(email, "...");
		if(GetPVarInt(playerid, "Type") == 0) format(szDialog2, sizeof(szDialog2), "%s%s\t%s\t%s\n", text, email, qresult[1], qresult[2]);
		else format(szDialog2, sizeof(szDialog2), "%s\t%s\t%s\n", email, qresult[1], qresult[2]);
		strcat(szDialog, szDialog2);
		s++;
	}	
	cache_delete(result);
	new title[64];
	if(GetPVarInt(playerid, "Type") == 0) title = "Inbox";
	else title = "Tin nhan da gui";	
	
	Dialog_Show(playerid, DIALOG_EMAILS, DIALOG_STYLE_TABLIST_HEADERS, title, szDialog, "Select", "Exit");
	return 1;
}

CalculateEmails(playerid) {
	new szQuery[115], emails, read, string[70];
	format(szQuery, sizeof(szQuery), "SELECT * FROM `emails` WHERE `Name`='%s' ORDER BY `emails`.`ID` DESC LIMIT 10", GetName(playerid));
	new Cache: result = mysql_query(SQL, szQuery);	
	for(new i, x = cache_num_rows (); i < x; i++) {
		cache_get_value_name_int(i, "Read", read);
		if(read == 0) emails++;
	}	
	cache_delete(result);
	if(emails > 0) {	
		format(string, sizeof(string), "(Emails) Ban co %d email chua doc. Su dung /emails de xem chung!", emails);
		SendClientMessage(playerid, COLOR_YELLOW, string);
	}
	return 1;
}