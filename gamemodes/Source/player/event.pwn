CMD:event(playerid, params[]) {
    if(activeevent == 0) return SendClientMessage(playerid, COLOR_YELLOW, "Khong co mot su kien hoat dong.");
   	new string[256], name[MAX_PLAYER_NAME];
   	foreach(new i: Player) {
   		if(eventorganizer[i] == 1) GetPlayerName(i, name, sizeof(name));
   	}
   	format(string, sizeof(string), "[SU KIEN] Tieu de: %s Tien thuong: $%s Di diem: %s Thoi gian: %s",eventtitle,FormatNumber(eventprize), eventlocation, eventtime);
   	SendClientMessage(playerid, COLOR_YELLOW, string);
   	format(string, sizeof(string), "[SU KIEN] Nguoi to chuc: %s Mo ta: %s",name,eventdescription);
   	SendClientMessage(playerid, COLOR_YELLOW, string);
   	return 1;
}
CMD:e(playerid, params[]) {
	if(eventorganizer[playerid] == 0 && PlayerInfo[playerid][pAdmin]+PlayerInfo[playerid][pHelper] == 0) return SendClientMessage(playerid, 0xFFFF00FF, "Ban khong phai la nguoi to chuc su kien.");
	if(activeevent == 0) return SendClientMessage(playerid, 0xFFFFFFFF, "Khong co mot event hoat dong.");
	new string[300], text[250];
	if(sscanf(params, "s[250]", text)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/e <noi dung>");
	if(eventorganizer[playerid] != 0) format(string, sizeof(string), "Nguoi to chuc %s: %s", GetName(playerid), text);
	else if(PlayerInfo[playerid][pAdmin] >= 1) format(string, sizeof(string), "Admin %s: %s", GetName(playerid), text);
	else if(PlayerInfo[playerid][pHelper] >= 1) format(string, sizeof(string), "Helper %s: %s", GetName(playerid), text); 
	SendEventChat(0x7094DBFF, string);
	return 1;
}

CMD:stopevent(playerid, params[]) {
	if(activeevent == 0 && PlayerInfo[playerid][pAdmin] >= 1) return SendClientMessage(playerid, 0xFFFFFFFF, "Khong co mot event hoat dong.");
	if(eventorganizer[playerid] == 0 && PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, 0xFFFFFFFF, "Ban khong phai la nguoi to chuc su kien.");
	foreach(new i: Player) {
		if(eventorganizer[i] != 0) eventorganizer[i] = 0;
	}
	new string[128];
	format(string, sizeof(string), "Su kien da ket thuc! %s da ket thuc su kien.", GetName(playerid));
	SendEventChat(COLOR_YELLOW, string);
	activeevent = 0;
	return 1;
}

CMD:acceptevent(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	if(activeevent == 1) return SendClientMessage(playerid, 0xFFFFFFFF, "Da co mot su kien hoat dong.");
	new eventid;
	if(sscanf(params, "d", eventid)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/chapnhanevent <eventid>");
	if(requestingevent[eventid] == 0) return SendClientMessage(playerid, 0xFFFFFFFF, "Invalid event ID.");
	strmid(eventtitle, requestingtitle[eventid], 0, strlen(requestingtitle[eventid]));
	strmid(eventlocation, requestinglocation[eventid], 0, strlen(requestinglocation[eventid]));
	strmid(eventdescription, requestingdescription[eventid], 0, strlen(requestingdescription[eventid]));
	eventprize = requestingprize[eventid];
	strmid(eventtime, requestingtime[eventid], 0, strlen(requestingtime[eventid]));
	new string[300],name[MAX_PLAYER_NAME];
	GetPlayerName(eventid, name, sizeof(name));
	format(string, sizeof(string), "* %s(%d) da chap nhan yeu cau su kien cua %s.",GetName(playerid),playerid,name);
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(COLOR_LOGS, string,1);
 	format(string, sizeof(string), "[SU KIEN] Tieu de: %s Tien thuong: $%s Di diem: %s Thoi gian: %s",eventtitle,FormatNumber(eventprize), eventlocation, eventtime);
   	SendEventChat(COLOR_YELLOW, string);
   	format(string, sizeof(string), "[SU KIEN] Nguoi to chuc: %s Mo ta: %s",name,eventdescription);
	SendEventChat(COLOR_YELLOW, string);
	eventorganizer[eventid] = 1;
	requestingevent[eventid] = 0;
	activeevent = 1;
	return 1;
}

CMD:requestevent(playerid, params[]) {
	if(PlayerInfo[playerid][pWantedLevel] > 0) return SendClientMessage(playerid,-1, "Ban dang bi truy na.");
	if(activeevent == 1) return SendClientMessage(playerid, 0xFFFFFFFF, "Mot su kien dang hoat dong.");
	if(requestingevent[playerid] == 1) return SendClientMessage(playerid, 0xFFFFFFFF, "Ban da gui mot yeu cau.");
	new title[50], location[50], description[100], prize, time[50];
	if(sscanf(params, "p<|>s[50]s[50]s[50]s[100]d", title, location, time, description, prize)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/requestevent <Title|Locate|Time|Describe|Reward>");
	if(PlayerInfo[playerid][pLevel] < 10) return SendClientMessage(playerid, -1, "Ban can dat Level 10 de yeu cau su kien!");
	if(strlen(title) < 1 || strlen(title) > 50) return SendClientMessage(playerid, 0xFFFFFFFF, "Tieu de qua dai.");
	if(strlen(location) < 1 || strlen(location) > 50) return SendClientMessage(playerid, 0xFFFFFFFF, "Dia diem qua dai.");
	if(strlen(time) < 1 || strlen(time) > 50) return SendClientMessage(playerid, 0xFFFFFFFF, "Thoi gian qua dai.");
	if(strlen(description) < 1 || strlen(description) > 100) return SendClientMessage(playerid, 0xFFFFFFFF, "Mo ta qua dai.");
	if(prize < 1 || prize > 200000) return SendClientMessage(playerid, 0xFFFFFFFF, "So tien khong hop le. ($1-$200,000)");
	if(GetPlayerCash(playerid) < prize) return SendClientMessage(playerid, -1, "Ban khong co du tien ma ban da neu ra!");
	new string[1000],name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof(name));
	requestingevent[playerid] = 1;
	strmid(requestingtitle[playerid], title, 0, strlen(title));
	strmid(requestinglocation[playerid], location, 0, strlen(location));
	strmid(requestingdescription[playerid], description, 0, strlen(description));
	requestingprize[playerid] = prize;
	strmid(requestingtime[playerid], time, 0, strlen(time));
	format(string, sizeof(string), "Yeu cau da duoc gui thanh cong!", playerid);
	SendClientMessage(playerid, COLOR_YELLOW, string);
	format(string, sizeof(string), "[SU KIEN] Tieu de: %s Tien thuong: $%s Di diem: %s Thoi gian: %s",title,FormatNumber(prize), location, time);
   	SendClientMessage(playerid, COLOR_YELLOW, string);
   	format(string, sizeof(string), "[SU KIEN] Nguoi to chuc: %s Mo ta: %s",name,description);
   	SendClientMessage(playerid, COLOR_YELLOW, string);
	format(string, sizeof(string), "%s(%d) muon tao mot su kien.", GetName(playerid), playerid);
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(COLOR_YELLOW, string,1);
	format(string, sizeof(string), "Event %d: Tieu de: %s Tien thuong: $%s Di diem: %s Thoi gian: %s",playerid,title,FormatNumber(prize), location, time);
   	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(COLOR_YELLOW, string,1);
	format(string, sizeof(string), "Event %d: Nguoi to chuc: %s Mo ta: %s",playerid,name,description);
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(COLOR_YELLOW, string,1);
	return 1;
}

CMD:rejectevent(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new id, reason[100],string[300];
	if(sscanf(params, "us[100]", id, reason)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/rejectevent <eventid> <ly do>");
	if(requestingevent[id] == 0) return SendClientMessage(playerid, 0xFFFFFFFF, "Invalid event ID.");
	new receivername[MAX_PLAYER_NAME],sendername[MAX_PLAYER_NAME];
	requestingevent[id] = 0;
	GetPlayerName(playerid, sendername, sizeof(sendername));
	GetPlayerName(id, receivername, sizeof(receivername));
	format(string, sizeof(string), "Admin %s da huy yeu cau su kien cua ban, Li do: %s", sendername, reason);
	SendClientMessage(id, COLOR_YELLOW, string);
	format(string, sizeof(string), "Ban da huy yeu cau su kien cua %s, Li do: %s", receivername, reason);
	SendClientMessage(playerid, COLOR_YELLOW, string);
	return 1;
}

CMD:events(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
    new szDialog[1024],tmpstring[100], titlestring[100], count = 0, name[MAX_PLAYER_NAME];
	strcat(szDialog, "Ten (id)\tTieu de su kien\n");
	foreach(new i: Player) {
		if(requestingevent[i] == 1) {
  			GetPlayerName(i, name, sizeof(name));
    		format(tmpstring, sizeof(tmpstring), "%s (%d)\t%s\n", name, i, requestingtitle[i]);
     		strcat(szDialog, tmpstring);
      		count ++;
       	}
   	}
   	if(count == 0) return SendClientMessage(playerid, COLOR_GREY, "Khong co su kien dang cho duyet!");
   	format(titlestring, sizeof(titlestring), "Events: %d", count);
	Dialog_Show(playerid, 0, DIALOG_STYLE_TABLIST_HEADERS, titlestring, szDialog, "Ok", "Close");
   	SendClientMessage(playerid, COLOR_YELLOW, "Su dung lenh /cevent de biet them thong tin.");
   	return 1;
}

CMD:cevent(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new eventid, string[300];
	if(sscanf(params, "u", eventid)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/checkevent <eventid>");
	if(requestingevent[eventid] == 0) return SendClientMessage(playerid, 0xFFFFFFFF, "Invalid event ID.");
	format(string, sizeof(string), "Event %d: Tieu de: %s Tien thuong: $%s Di diem: %s Thoi gian: %s",eventid,requestingtitle[eventid],FormatNumber(requestingprize[eventid]), requestinglocation[eventid], requestingtime[eventid]);
   	SendClientMessage(playerid, COLOR_YELLOW, string);
	format(string, sizeof(string), "Event %d: Nguoi to chuc: %s Mo ta: %s",eventid,GetName(eventid),requestingdescription[eventid]);
	SendClientMessage(playerid, COLOR_YELLOW, string);
	format(string, sizeof(string), "Su dung [/chapnhanevent %d] de chap nhan.", eventid);
    SendClientMessage(playerid, COLOR_YELLOW, string);
   	return 1;
}