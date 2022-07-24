CMD:bangxephang(playerid, params[]) {
	Dialog_Show(playerid, BANGXEPHANG, DIALOG_STYLE_TABLIST_HEADERS, "Bang xep hang", "Chon bang xep hang ma ban muon xem\nTop gio choi\nTop Money\nTop Level\nTop Clan\nTop diem hoat dong", "Xem", "Dong");
	return 1;
}
Dialog:BANGXEPHANG(playerid, response, listitem, inputtext[]) {
	if(!response) return 1;
	if(listitem == 0) {
		new query[200];
		format(query, sizeof(query), "SELECT name, ConnectedTime, Level FROM users ORDER BY `ConnectedTime` DESC LIMIT 10");
		new Cache: x = mysql_query(SQL, query), rows = cache_num_rows(), loaded;
		new name[MAX_PLAYER_NAME], level, Float:connectedTime, str[300];
		strcat(str, "Hang\tTen\tLevel\tGio choi\n");
		while(loaded < rows) {
			cache_get_value_name(loaded, "name", name);
			cache_get_value_name_int(loaded, "Level", level);
			cache_get_value_name_float(loaded, "ConnectedTime", connectedTime);
			format(str, sizeof(str), "%s%d\t%s\t%d\t%0.2f\n", str, ++loaded, name, level, connectedTime);
		}
		cache_delete(x);
		Dialog_Show(playerid, 0, DIALOG_STYLE_TABLIST_HEADERS, "Top gio choi", str, "Dong", "");
	}
	if(listitem == 1) {
		new query[200];
		format(query, sizeof(query), "SELECT name, Money, Bank FROM users ORDER BY `Money`+`Bank` DESC LIMIT 10");
		new Cache: x = mysql_query(SQL, query), rows = cache_num_rows(), loaded;
		new name[MAX_PLAYER_NAME], money, bank, total, str[400];
		strcat(str, "Hang\tTen\tMoney\n");
		while(loaded < rows) {
			cache_get_value_name(loaded, "name", name);
			cache_get_value_name_int(loaded, "Money", money);
			cache_get_value_name_int(loaded, "Bank", bank);
			total=money+bank;
			format(str, sizeof(str), "%s%d\t%s\t$%s\n", str, ++loaded, name, FormatNumber(total));
		}
		cache_delete(x);
		Dialog_Show(playerid, 0, DIALOG_STYLE_TABLIST_HEADERS, "Top money", str, "Dong", "");
	}
	if(listitem == 2) {
		new query[200];
		format(query, sizeof(query), "SELECT name, Level, Respect FROM users ORDER BY `Level` DESC LIMIT 15");
		new Cache: x = mysql_query(SQL, query), rows = cache_num_rows(), loaded;
		new name[MAX_PLAYER_NAME], level, respect, str[300];
		strcat(str, "Hang\tTen\tLevel\tRespect\n");
		while(loaded < rows) {
			cache_get_value_name(loaded, "name", name);
			cache_get_value_name_int(loaded, "Level", level);
			cache_get_value_name_int(loaded, "Respect", respect);
			format(str, sizeof(str), "%s%d\t%s\t%d\t%d\n", str, ++loaded, name, level, respect);
		}
		cache_delete(x);
		Dialog_Show(playerid, 0, DIALOG_STYLE_TABLIST_HEADERS, "Top Level", str, "Dong", "");
	}
	if(listitem == 3) {
		new query[200];
		format(query, sizeof(query), "SELECT Name, ActivePoints FROM clans ORDER BY `ActivePoints` DESC LIMIT 10");
		new Cache: x = mysql_query(SQL, query), rows = cache_num_rows(), loaded;
		new name[30], points, str[300];
		strcat(str, "Hang\tTen Clan\tDiem hoat dong\n");
		while(loaded < rows) {
			cache_get_value_name(loaded, "Name", name);
			cache_get_value_name_int(loaded, "ActivePoints", points);
			format(str, sizeof(str), "%s%d\t%s\t%d\n", str, ++loaded, name, points);
		}
		cache_delete(x);
		Dialog_Show(playerid, 0, DIALOG_STYLE_TABLIST_HEADERS, "Top Clan", str, "Dong", "");
	}
	if(listitem == 4) {
		new query[200];
		format(query, sizeof(query), "SELECT name, ActivePoints FROM users ORDER BY `ActivePoints` DESC LIMIT 10");
		new Cache: x = mysql_query(SQL, query), rows = cache_num_rows(), loaded;
		new name[30], points, str[300];
		strcat(str, "Hang\tTen\tDiem hoat dong\n");
		while(loaded < rows) {
			cache_get_value_name(loaded, "name", name);
			cache_get_value_name_int(loaded, "ActivePoints", points);
			format(str, sizeof(str), "%s%d\t%s\t%d\n", str, ++loaded, name, points);
		}
		cache_delete(x);
		Dialog_Show(playerid, 0, DIALOG_STYLE_TABLIST_HEADERS, "Top diem hoat dong", str, "Dong", "");
	}
	return 1;	
}