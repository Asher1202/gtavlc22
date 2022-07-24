TutorialTime(playerid) 
{
	if(GetPlayerVirtualWorld(playerid) == 0) SetPlayerVirtualWorld(playerid, playerid+1); 
	for(new i = 0; i < 20; i++) SendClientMessage(playerid, COLOR_WHITE, ""); 

	va_SendClientMessage(playerid, "Chao mung %s den voi "SERVER_NAME" 2019. Chung toi rat vui vi ban la nguoi choi thu %s da dang ky.", GetName(playerid), FormatNumber(ServerAccounts));
	SendClientMessage(playerid, -1, "Day la series Huong dan Tan thu. Toi se tom tat mot so phan quan trong trong game.");

	defer Tutorial_1(playerid); 

	return true;
}
timer Tutorial_1[6000](playerid) {
	for(new i = 0; i < 20; i++) SendClientMessage(playerid, COLOR_WHITE, ""); 
	SetPlayerCameraPos(playerid, 1352.8973, -1727.6992, 23.8539);
	SetPlayerCameraLookAt(playerid, 1352.9351, -1728.7069, 23.5238);

	SendClientMessage(playerid, -1, "Chung toi co cac doanh nghiep: cnn, bar, gun shop, gym...");
	SendClientMessage(playerid, -1, "Trong do co 24/7, noi ban co the mua nhung item:");
	SendClientMessage(playerid, COLOR_WHITE, "- dien thoai di dong - ban co the su dung de goi dien(/call) va gui tin nhan(/sms).");
    SendClientMessage(playerid, COLOR_WHITE, "- danh ba - ban co the tim kiem so dien thoai cua nguoi choi khac bang cach /number.");
	SendClientMessage(playerid, -1, "Va nhieu hon nua, chung toi se de ban tu tim hieu...");
	SendClientMessage(playerid, -1, "");

	defer Tutorial_2[6000](playerid);
	// defer GiveMission[7000](playerid, 1, 1);
	return true;
}
timer Tutorial_2[6000](playerid) {
	GiveMission(playerid, 1, 1);

	return 1;
}
GetMissionName(season, chapter) {
	new missionname[50];
	switch(season) {
		case 1: {
			switch(chapter) {
				case 1: FORMAT:name("Mua mot dien thoai di dong");
				case 2: FORMAT:name("");
				case 3: FORMAT:name("");
				case 4: FORMAT:name("");
			}
		}
	}
}
GiveMission(playerid, season, chapter)
{
	switch(season) {
		case 1: {
			if(chapter == 0) {
				FORMAT:name("Mua mot dien thoai di dong");
				FORMAT:description("Vao trong mot cua hang 24/7 va mua mot dien thoai.");
			}
		}
	}
	va_SendClientMessage(playerid, -1, "Nhiem vu moi: %s", Mission[season][chapter]);
	return 1;
}