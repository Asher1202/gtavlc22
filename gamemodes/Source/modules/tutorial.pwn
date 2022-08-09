#include <YSI_Coding\y_timers>

timer DMVTutorialF[10000](playerid) {

	for(new i = 0; i < 20; i++) SendClientMessage(playerid, COLOR_WHITE, ""); 

	CP[playerid] = 43;
	SetPlayerCheckpointEx(playerid, ExamPos[0],ExamPos[1],ExamPos[2], 5.0);
	TogglePlayerSpectating(playerid, false);
	SetCameraBehindPlayer(playerid);
	SpawnPlayer(playerid);

	SendClientMessage(playerid, COLOR_YELLOW, "Ai cung can phai co mot bang lai xe, di den do va su dung /exam de kiem tra nao.");
	return true;
}
timer DMVTutorial[6000](playerid) {

	for(new i = 0; i < 20; i++) SendClientMessage(playerid, COLOR_WHITE, ""); 

	MesajLung(playerid, COLOR_WHITE, "Day la DMV noi ma ban co the thi bang lai. Hay di den diem mau do (checkpoint) tren ban do de tien hanh ki thi bang lai.");
	SendClientMessage(playerid, COLOR_WHITE, "Giay phep lai xe se het han sau 100 gio choi, khi het han ban phai thi lai.");
	SetPlayerPosEx(playerid, 1236.6477, -1835.9891, 26.6422);
	SetPlayerCameraPos(playerid, 1236.6477, -1835.9891, 26.6422); 
	SetPlayerCameraLookAt(playerid, 1236.0491, -1835.1776, 26.2321);

	ResetPlayerCash(playerid);
	GivePlayerCash(playerid, 15000);
	PlayerInfo[playerid][pAccount] = 20000;
	IsPlayerLogged[playerid] = 1;
	
	defer DMVTutorialF(playerid);  
	return true;
}
timer MAGTutorialF[10000](playerid) {

	for(new i = 0; i < 20; i++) SendClientMessage(playerid, COLOR_WHITE, ""); 

	SetCameraBehindPlayer(playerid);

	SendClientMessage(playerid, COLOR_YELLOW, "Den diem mau do tren ban do de mua dien thoai.");
	SendClientMessage(playerid, COLOR_YELLOW, "De mua thu gi do tu cua hang, hay su dung phim Y.");

	CP[playerid] = 43;
	SetPlayerCheckpointEx(playerid, BizzInfo[10][bEntranceX], BizzInfo[10][bEntranceY], BizzInfo[10][bEntranceZ], 3.0); // de pus checkpoint 

	return true;
}
timer MAGTutorial[5000](playerid) {

	for(new i = 0; i < 20; i++) SendClientMessage(playerid, COLOR_WHITE, ""); 
	// SetPlayerPosEx(playerid, 1352.8973, -1727.6992, 23.8539);
	SetPlayerCameraPos(playerid, 1352.8973, -1727.6992, 23.8539);
	SetPlayerCameraLookAt(playerid, 1352.9351, -1728.7069, 23.5238);

	SendClientMessage(playerid, COLOR_WHITE, "Day la cua hang 24/7. Ban co the mua nhung thu sau:");
	SendClientMessage(playerid, COLOR_WHITE, "- dien thoai di dong - ban co the su dung de goi dien(/call) va gui tin nhan(/sms).");
    SendClientMessage(playerid, COLOR_WHITE, "- danh ba - ban co the tim kiem so dien thoai cua nguoi choi khac bang cach /number.");
	SendClientMessage(playerid, COLOR_WHITE, "- tien dien thoai - de nap tien dien thoai su dung cho cuoc goi.");
    SendClientMessage(playerid, COLOR_WHITE, "- radio - cai nay dung de noi chuyen voi ban be trong kenh chat rieng.");
    SendClientMessage(playerid, COLOR_WHITE, "Chung toi se de ban tu kham pha nhieu thu hon khi ban den voi cua hang 24/7.");

	defer MAGTutorialF(playerid);

	PlayerInfo[playerid][pNewbieStep] = 1;
	va_mysql_query("UPDATE `users` SET `Newbie` = '1' WHERE `id` = '%d'", PlayerInfo[playerid][pSQLID]);

	return true;
}
timer CLOTutorialF[5000](playerid) {

	for(new i = 0; i < 20; i++) SendClientMessage(playerid, COLOR_WHITE, ""); 

	ExitBizz(playerid, 10);
	SetCameraBehindPlayer(playerid);

	SendClientMessage(playerid, COLOR_WHITE, "Den diem mau do tren ban do de nhan cong viec.");
	SendClientMessage(playerid, COLOR_WHITE, "Bam phim Y de nhan cong viec, ban co the xem thong tin cua minh tai (/thongtin).");

	PlayerInfo[playerid][pNewbieStep] = 2;
	va_mysql_query("UPDATE `users` SET `Newbie` = '2' WHERE `id` = '%d'", PlayerInfo[playerid][pSQLID]);
	return true;
}
timer CLOTutorial[4000](playerid) {

	for(new i = 0; i < 20; i++) SendClientMessage(playerid, COLOR_WHITE, ""); 

	// if(GetPlayerVirtualWorld(playerid) == 0) SetPlayerVirtualWorld(playerid, playerid+1); 

	SetPlayerCameraPos(playerid, 439.0838, -2111.7368, 35.9572);
	SetPlayerCameraLookAt(playerid, 438.2896, -2111.1223, 35.6321);
	SetPlayerInterior(playerid, 0);
	SetPlayerVirtualWorld(playerid, 0);
	SetPlayerCheckpointEx(playerid, JobInfo[11][jPosX], JobInfo[11][jPosY], JobInfo[11][jPosZ], 3.0);
	CP[playerid] = 43;

	SendClientMessage(playerid, COLOR_WHITE, "Server chung toi co rat nhieu cong viec, trong do Fisherman la cong viec duoc nhieu nguoi chon nhat.");
	SendClientMessage(playerid, COLOR_WHITE, "Sau khi nhan cong viec, ban co the cau ca (/fish) va ban ca o shop 24/7.");

	defer CLOTutorialF(playerid);

	return true;
}
timer FinishTutorial[5000](playerid) {
	new test[100+MAX_PLAYER_NAME];
	// ExitBizz(playerid, 46);

	ServerAccounts ++;
	for(new i = 0; i < 20; i++) SendClientMessage(playerid, COLOR_WHITE, ""); 
	SendClientMessage(playerid, COLOR_PURPLE, "{00FF00}[!] {FFFFFF} Phan huong dan da ket thuc!");
	SendClientMessage(playerid, COLOR_PURPLE, "{00FF00}[!] {FFFFFF} LENH NEWBIE: /n (hoi dap) /timvieclam /nhiemvu /gps /banbe /trogiup");
	SendClientMessage(playerid, COLOR_PURPLE, "{00FF00}[!] {FFFFFF} Server dang co goi qua tan thu [/quatanthu] de nhan");
	PlayerInfo[playerid][pShowProgress][0] = 1 + random(11);
	UpdateVar(playerid, "ShowProgress1", PlayerInfo[playerid][pShowProgress][0]);
	UpdateProgress(playerid, 0);
	
	format(test, sizeof(test), "%s(%d) da hoan thanh huong dan tan thu. [#%d]", GetName(playerid), playerid, PlayerInfo[playerid][pSQLID]);
	SendAdminMessage(COLOR_LIGHTRED, test, 1);

	format(test, sizeof(test), "UPDATE users SET `Newbie`='0',`Tutorial`='1',`Bank`='20000',`Money`='15000' WHERE `name`='%s'",GetName(playerid));
	mysql_query(SQL, test, false);	
	Inventory_Add(playerid,"Burger", 2703, 10, 1);
	PlayerInfo[playerid][pTut] = 1; gOoc[playerid] = 0; gNews[playerid] = 0; gFam[playerid] = 0;
	PlayerInfo[playerid][pNewbieStep] = 0;
	return true;
}

/*TutorialTime(playerid) 
{
	// if(GetPlayerVirtualWorld(playerid) == 0) SetPlayerVirtualWorld(playerid, playerid+1); 

	for(new i = 0; i < 20; i++) SendClientMessage(playerid, COLOR_WHITE, ""); 

	SendClientMessage(playerid, COLOR_WHITE, "Chao mung ban den voi "#SERVER_URL", ban da dang ky thanh cong.");
	va_SendClientMessage(playerid, COLOR_WHITE, "Xin chao %s[%d]. Chung toi rat vui vi ban la nguoi choi thu %s da dang ky vao server.", GetName(playerid), playerid, FormatNumber(ServerAccounts)); 
	// va_SendClientMessage(playerid, COLOR_WHITE, "Hien tai, server dang co %d/100 nguoi choi online.", Iter_Count(Player));
	MesajLung(playerid, COLOR_WHITE, "Chung toi se huong dan ban cach choi co ban, huong dan se hien sau vai giay nua.");

	defer DMVTutorial(playerid); 
	return true;
}*/