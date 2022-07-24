new sukienbankem;
////////////////////////
new InSummerQuest[MAX_PLAYERS], SummerQuestVehicle[MAX_PLAYERS];
new Text:caykemtd[2];
new Float: SummerQuestPos[30][4] = {
	{1360.6387,-1738.1146,13.5469,2.5125},
	{1727.4286,-1726.4821,13.5469,179.8374},
	{1860.2836,-1746.4373,13.5469,172.3173},
	{1827.3088,-1854.0889,13.5781,88.3432},
	{1817.2568,-1579.3735,13.5469,263.4748},
	{1931.3060,-1164.4729,21.7456,28.6410},
	{2133.2964,-1119.5916,25.3947,340.2189},
	{2928.0044,-1498.2225,11.0469,73.8831},
	{2497.5459,-1738.4048,13.5469,353.6690},
	{1754.3278,-1448.1641,13.5391,356.1757},
	{1437.5499,-1167.8939,23.8255,351.7890},
	{1104.0818,-1411.4613,13.6172,357.0923},
	{467.3168,-1767.0072,5.6222,64.1229},
	{411.4612,-1331.1460,14.8902,209.4875},
	{1031.4043,-949.5829,42.6127,191.0007},
	{1854.0098,862.5802,9.6128,176.2738},
	{2079.0789,1007.7937,10.8203,87.6230},
	{2115.8774,2090.5901,10.8203,268.3947},
	{1895.3218,2049.3259,10.8203,168.4404},
	{1532.2894,666.4435,10.8125,98.8797},
	{2482.2935,-1684.2531,13.5078,355.1655},
	{2309.3765,-1219.1512,23.9111,86.0097},
	{1177.0121,-1414.8817,13.4335,356.0822},
	{1272.8319,-1271.4899,13.5403,174.9738},
	{1705.5479,1434.2284,10.7036,261.4547},
	{2181.0173,1310.0096,10.8203,268.6613},
	{2613.2307,1198.5304,10.8125,90.0596},
	{2416.9795,1027.9063,10.8203,262.0813},
	{1817.3588,1886.1548,6.8608,85.3830},
	{1480.7720,1982.6194,10.8125,181.2639}
};
///////////////////////////////////////////////////////
timer hidesummerquest[5000](playerid) {
	new money = 10000 + random(10000);
	new string[128];
	new sendername[25];
	GetPlayerName(playerid,sendername,sizeof(sendername));
	TextDrawHideForPlayer(playerid, caykemtd[0]);
	TextDrawHideForPlayer(playerid, caykemtd[1]);
	PlayerTextDrawHide(playerid, InfosTD);
	format(string, sizeof(string), "* %s Da Ban Cay Kem Cho Khach Hang Va Nhan Duoc (%d$)", sendername, money);
	ProxDetector(12.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	GivePlayerCash(playerid, money);
	TogglePlayerControllable(playerid, true);
	Freezed[playerid] = 0;
	return 1;
}
function kiemtrasokemdaban(playerid) {
    new x;
    for(new i = 0; i < 30; i++) {
        if(PlayerInfo[playerid][psokemdaban][i]) x ++;
    }
    return x;
}
function savekem(playerid) {
	new szQuery[256], items[60]; //chu y
	format(items, sizeof(items), 
		"%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|", 
		PlayerInfo[playerid][psokemdaban][0], PlayerInfo[playerid][psokemdaban][1], PlayerInfo[playerid][psokemdaban][2], PlayerInfo[playerid][psokemdaban][3], PlayerInfo[playerid][psokemdaban][4],
		PlayerInfo[playerid][psokemdaban][5], PlayerInfo[playerid][psokemdaban][6], PlayerInfo[playerid][psokemdaban][7], PlayerInfo[playerid][psokemdaban][8], PlayerInfo[playerid][psokemdaban][9],
		PlayerInfo[playerid][psokemdaban][10], PlayerInfo[playerid][psokemdaban][11], PlayerInfo[playerid][psokemdaban][12], PlayerInfo[playerid][psokemdaban][13], PlayerInfo[playerid][psokemdaban][14],
		PlayerInfo[playerid][psokemdaban][15], PlayerInfo[playerid][psokemdaban][16], PlayerInfo[playerid][psokemdaban][17], PlayerInfo[playerid][psokemdaban][18], PlayerInfo[playerid][psokemdaban][19],		
		PlayerInfo[playerid][psokemdaban][20], PlayerInfo[playerid][psokemdaban][21], PlayerInfo[playerid][psokemdaban][22], PlayerInfo[playerid][psokemdaban][23], PlayerInfo[playerid][psokemdaban][24],
		PlayerInfo[playerid][psokemdaban][25], PlayerInfo[playerid][psokemdaban][26], PlayerInfo[playerid][psokemdaban][27], PlayerInfo[playerid][psokemdaban][28], PlayerInfo[playerid][psokemdaban][29]);			
	format(szQuery, sizeof(szQuery), 
		"UPDATE `users` SET `SoKemDaBan`='%s' WHERE `ID`='%d'", items, PlayerInfo[playerid][pSQLID]);
	mysql_query(SQL, szQuery, false);	
	return 1;
}
Dialog:DIALOG_SUMMERQUEST(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new szDialog[512];
	format(szDialog, sizeof(szDialog), "%s%s\n", szDialog);
	switch(listitem) 
	{
		case 0: 
		{
			if(sukienbankem == 0) {
				SendClientMessage(playerid, COLOR_WHITE, "Ban da bat khai mo SUMMER QUEST 2020.");
				sukienbankem = 1;
			}
			else {
				SendClientMessage(playerid, COLOR_WHITE, "Ban da tat SUMMER QUEST, Member Khong The Bat Dau Nhiem Vu Nua.");
				sukienbankem = 0;
			}
		}
	}
	return 1;
}
CMD:chinhsuasummerquest(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, COLOR_RED, "Ban khong du quyen han de su dung lenh nay");
	{
		new szDialog[1124], string[180];
		strcat(szDialog, "He thong\tTrang thai\n");
		// 1
		if(sukienbankem == 0) format(string, sizeof(string), "Summer Quest 2020\t{FF0000}Tat{FFFFFF}\n");
		else format(string, sizeof(string), "Summer Quest 2020\t{0AC917}Da Bat{FFFFFF}\n");		
		strcat(szDialog, string);	
		
		Dialog_Show(playerid, DIALOG_SUMMERQUEST, DIALOG_STYLE_TABLIST_HEADERS, "SUMMER QUEST:", szDialog, "Ok", "Close");
	}
	return 1;
}
CMD:resetsummerquest(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, COLOR_RED, "Ban khong du quyen han de su dung lenh nay");
	{
		foreach(new i: Player) 
		{
			if(IsPlayerConnected(i) && kiemtrasokemdaban(i) != 0) {
				for(new x = 0; x < 30; x++) {
					if(PlayerInfo[i][psokemdaban][x] == 1) PlayerInfo[i][psokemdaban][x] = 0;							
				}
				for(new x = 0; x < 30; x++) {
					if(InSummerQuest[i] == 0) 
					{
						SendClientMessage(i, COLOR_GREY, "Nhiem Vu Da Duoc Reset.");
						DestroyVehicle(SummerQuestVehicle[i]);
						SummerQuestVehicle[i] = 0;
						InSummerQuest[i] = 0;
						RemovePlayerMapIcon(i, 70+x);
					}
				}							
				savekem(i);
				SendClientMessage(i, COLOR_YELLOW, "Summer Quest da duoc reset boi mot admin cap cao!");
			}
		}
	}
	return 1;
}
CMD:summerquest(playerid, params[]) 
{
	if(InSummerQuest[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "Ban Dang Thuc Hien Nhiem Vu");
	if(PlayerInfo[playerid][psummerquest] == 1) return SendClientMessage(playerid, COLOR_RED, "Ban Da Thuc Hien Nhiem Vu Nay Roi");
	if(sukienbankem == 1) 
	{
		if(IsPlayerInRangeOfPoint(playerid, 5.0, 440.6093,-1753.2246,8.6343))
		{
			InSummerQuest[playerid] = 1;
			SummerQuestVehicle[playerid] = CreateVehicleEx(423,418.4477,-1803.4058,5.7691,0.0674, 1, 1, 100);
			PutPlayerInVehicle(playerid, SummerQuestVehicle[playerid], 0);
			SetVehicleParamsForPlayer(SummerQuestVehicle[playerid], playerid, 0, 1);
			new engine,lights,alarm,doors,bonnet,boot,objective;
			GetVehicleParamsEx(SummerQuestVehicle[playerid],engine,lights,alarm,doors,bonnet,boot,objective);
		 	SetVehicleParamsEx(SummerQuestVehicle[playerid],VEHICLE_PARAMS_OFF,lights,alarm, 1,bonnet,boot,objective);
			SendClientMessage(playerid, COLOR_YELLOW, "[SUMMER QUEST] Hay Di Tim Kiem Khach Hang Va Ban Kem Cho Tat Ca Nguoi Do!");
			for(new sm; sm < sizeof(SummerQuestPos); sm++) SetPlayerMapIcon(playerid, 70+sm, SummerQuestPos[sm][0], SummerQuestPos[sm][1], SummerQuestPos[sm][2], 56, -1, MAPICON_GLOBAL);
		}
		else {
			SendClientMessage(playerid, COLOR_WHITE, "[SUMMER QUEST] Ban khong o noi bat dau nhiem vu!");
			SetPlayerCheckpointEx(playerid, 440.6093,-1753.2246,8.6343, 5.0);
			CP[playerid] = 53;
		}
	}
	else {
		SendClientMessage(playerid, COLOR_GREY, "[SUMMER QUEST] Su Kien Chua Duoc Khai Mo");
	}
	return 1;
}