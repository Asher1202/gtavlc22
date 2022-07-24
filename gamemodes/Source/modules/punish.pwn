CMD:dp(playerid, params[]) {
	new id;
	if(PlayerInfo[playerid][pAdmin] < 5) return 1;
	if(sscanf(params, "i", id)) return SendClientMessage(playerid,COLOR_GREY, "Su dung: {FFFFFF}/dp <punish id>");
	new szQuery[256];
	format(szQuery, sizeof(szQuery), "SELECT * FROM `sanctions` WHERE `ID`='%d'", id);
	new Cache: result = mysql_query(SQL, szQuery);
	new test = cache_num_rows ();
	cache_delete(result);
	if(test == 0) return SendClientMessage(playerid, COLOR_GREY, "Punish id invalid!");
	format(szQuery, sizeof(szQuery), "DELETE FROM `sanctions` WHERE `ID`='%d'", id);
	mysql_query(SQL, szQuery);
	return 1;
}
CMD:lp(playerid, params[]) {
	new id;
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;
	if(sscanf(params, "u", id)) return SendClientMessage(playerid,COLOR_GREY, "Su dung: {FFFFFF}/lastpunish <playerid/name>");
	if(id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong dang nhap.");
	ShowPunish(playerid, id);
	return 1;
}
CMD:mylp(playerid, params[]) return ShowPunish(playerid, playerid);
function ShowPunish(playerid, targetid) {
	new 
		szDialog2[4000], id, szQuery[256], string[180], Cache: result, b, k, j, m, w,
		by[180], time[180], reason[180];
		
	format(szQuery, sizeof(szQuery), "SELECT * FROM `sanctions` WHERE `Userid`='%d' AND `Type`='%d' ORDER BY `sanctions`.`ID` DESC LIMIT 10", PlayerInfo[targetid][pSQLID], BAN);
	result = mysql_query(SQL, szQuery);	
	strcat(szDialog2, "Dao khi:\n");	
	for(new i, x = cache_num_rows(); i < x; i++) {
		cache_get_value_name_int(i, "ID", id);
		cache_get_value_name(i, "By", by);
		cache_get_value_name(i, "Time", time);
		cache_get_value_name(i, "Reason", reason);
		format(string, sizeof(string), "(#%d) [%s] Ban bi banned boi %s, Li do: %s.\n", id, time, by, reason);
		strcat(szDialog2, string);
		b++;
	}
	if(b == 0) strcat(szDialog2, "Khong co lan xu phat nao.\n\n");
	else strcat(szDialog2, "\n");
	cache_delete(result);
	
	format(szQuery, sizeof(szQuery), "SELECT * FROM `sanctions` WHERE `Userid`='%d' AND `Type`='%d' ORDER BY `sanctions`.`ID` DESC LIMIT 10", PlayerInfo[targetid][pSQLID], KICK);
	result = mysql_query(SQL, szQuery);
	strcat(szDialog2, "Kick:\n");	
	for(new i, x = cache_num_rows (); i < x; i++) {	
		cache_get_value_name_int(i, "ID", id);
		cache_get_value_name(i, "By", by);
		cache_get_value_name(i, "Time", time);	
		cache_get_value_name(i, "Reason", reason); 
		format(string, sizeof(string), "(#%d) [%s] Ban bi kick boi Admin %s, Li do: %s.\n", id, time, by, reason);
		strcat(szDialog2, string);		
		k ++;
	}
	if(k == 0) strcat(szDialog2, "Khong co lan kick nao.\n\n");
	else strcat(szDialog2, "\n");	
	cache_delete(result);

	format(szQuery, sizeof(szQuery), "SELECT * FROM `sanctions` WHERE `Userid`='%d' AND `Type`='%d' ORDER BY `sanctions`.`ID` DESC LIMIT 10", PlayerInfo[targetid][pSQLID], WARN);
	result = mysql_query(SQL, szQuery);
	strcat(szDialog2, "Canh cao:\n");	
	for(new i, x = cache_num_rows (); i < x; i++) {	
		cache_get_value_name_int(i, "ID", id);
		cache_get_value_name(i, "By", by);
		cache_get_value_name(i, "Time", time);	
		cache_get_value_name(i, "Reason", reason);
		format(string, sizeof(string), "(#%d) [%s] Ban bi mot diem canh cao boi Admin %s, Li do: %s.\n", id, time, by, reason);
		strcat(szDialog2, string);		
		w ++;
	}
	if(w == 0) strcat(szDialog2, "Khong co lan canh cao nao.\n\n");
	else strcat(szDialog2, "\n");	
	cache_delete(result);	
	
	format(szQuery, sizeof(szQuery), "SELECT * FROM `sanctions` WHERE `Userid`='%d' AND `Type`='%d' ORDER BY `sanctions`.`ID` DESC LIMIT 10", PlayerInfo[targetid][pSQLID], JAIL);
	result = mysql_query(SQL, szQuery);
	strcat(szDialog2, "Vao tu:\n");	
	for(new i, x = cache_num_rows (); i < x; i++) {	
		cache_get_value_name_int(i, "ID", id);
		cache_get_value_name(i, "By", by);
		cache_get_value_name(i, "Time", time);	
		cache_get_value_name(i, "Reason", reason);
		format(string, sizeof(string), "(#%d) [%s] Ban bi bo tu boi Admin %s, Li do: %s.\n", id, time, by, reason);
		strcat(szDialog2, string);		
		j ++;
	}
	if(j == 0) strcat(szDialog2, "Khong co lan bo tu nao.\n\n");
	else strcat(szDialog2, "\n");
	cache_delete(result);	

	format(szQuery, sizeof(szQuery), "SELECT * FROM `sanctions` WHERE `Userid`='%d' AND `Type`='%d' ORDER BY `sanctions`.`ID` DESC LIMIT 10", PlayerInfo[targetid][pSQLID], MUTE);
	result = mysql_query(SQL, szQuery);
	strcat(szDialog2, "Mute:\n");	
	for(new i, x = cache_num_rows (); i < x; i++) {
		cache_get_value_name_int(i, "ID", id);
		cache_get_value_name(i, "By", by);
		cache_get_value_name(i, "Time", time);
		cache_get_value_name(i, "Reason", reason);
		format(string, sizeof(string), "(#%d) [%s] Ban bi cam chat boi Admin %s, Li do: %s.\n", id, time, by, reason);
		strcat(szDialog2, string);		
		m ++;
	}
	if(m == 0) strcat(szDialog2, "Khong co lan cam chat nao.\n");
	cache_delete(result);	
	Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Xu phat vi pham", szDialog2, "Ok", "");
	return 1;
}