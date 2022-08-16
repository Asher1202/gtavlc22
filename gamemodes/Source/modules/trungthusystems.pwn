save_ttj(playerid) {
    new string[128];
    mysql_format(SQL, string, sizeof(string), "UPDATE `users` SET `TrungThuJob`='%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d' WHERE `ID`='%d'",
        PlayerInfo[playerid][pTrungThuJob][0], PlayerInfo[playerid][pTrungThuJob][1], PlayerInfo[playerid][pTrungThuJob][2], PlayerInfo[playerid][pTrungThuJob][3], PlayerInfo[playerid][pTrungThuJob][4],
        PlayerInfo[playerid][pTrungThuJob][5], PlayerInfo[playerid][pTrungThuJob][6], PlayerInfo[playerid][pTrungThuJob][7], PlayerInfo[playerid][pTrungThuJob][8], PlayerInfo[playerid][pTrungThuJob][9], PlayerInfo[playerid][pTrungThuJob][10],
        PlayerInfo[playerid][pSQLID]);

    mysql_query(SQL, string, false);
}
CMD:1thang(playerid, params[]) {
	new szDialog[100], szDialog2[2000];
	for(new i = 0; i < 10; i++) {
		format(szDialog, sizeof(szDialog), "{FFFFFF}%s: %s (%d lan nua)\n", TrungThuJobName(i), (PlayerInfo[playerid][pTrungThuJob][i] >= 25) ? ("{3DBF0A}Hoan Thanh{FFFFFF}") : ("{CC0E0E}Chua Xong{FFFFFF}"), 10 - PlayerInfo[playerid][pTrungThuJob][i]);
		strcat(szDialog2, szDialog);
	}
    SendClientMessage(playerid, COLOR_NEUTRALGREEN, "Hay den NPC o khu 'SPAWN' de tra nhiem vu ban nhe!");
    SendClientMessage(playerid, COLOR_NEUTRALGREEN, "VAT PHAM SU KIEN : 8.000.000$, 100 xu, 10 kim cuong, 300 banh hamburger, 2 hom random skins, danh hieu 'VUI LA CHINH', random xe ZR-350 hoac PCJ-600, 15 banh trung thu");
	Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Danh sach nhiem vu trung thu:", szDialog2, "Ok", "");
	return 1;
}
CMD:tranhiemvu(playerid, params[]) {
    if(!IsPlayerInRangeOfPoint(playerid, 5.0, 1796.6306,-1846.5983,13.5781)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o dia diem tra nhiem vu.");
    if(PlayerInfo[playerid][pLevel] < 4) return SendClientMessage(playerid, COLOR_GREY, "Ban can level 5 moi co the tra nhiem vu");
    if(PlayerInfo[playerid][pFinishQQ] == 1) return SendClientMessage(playerid, COLOR_GREY, "Ban da tra nhiem vu roi");
    if(PlayerInfo[playerid][pTrungThuJob][0] >= 10 && PlayerInfo[playerid][pTrungThuJob][1] >= 10 && PlayerInfo[playerid][pTrungThuJob][2] >= 10 && PlayerInfo[playerid][pTrungThuJob][3] >= 10 && PlayerInfo[playerid][pTrungThuJob][4] >= 10 && PlayerInfo[playerid][pTrungThuJob][5] >= 10 && PlayerInfo[playerid][pTrungThuJob][6] >= 10 && 
    PlayerInfo[playerid][pTrungThuJob][7] >= 10 && PlayerInfo[playerid][pTrungThuJob][8] >= 10 && PlayerInfo[playerid][pTrungThuJob][9] >= 10 && PlayerInfo[playerid][pTrungThuJob][10] == 0)
    {
        if(GetSlots(playerid) == GetVehicles(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong con slot xe trong de nhan qua");
        Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Danh sach nhiem vu trung thu:", "Chuc mung ban da hoan thanh nhiem vu trung thu, ban se nhan duoc phan thuong", "Ok", "");
        SendClientMessage(playerid, COLOR_NEUTRALGREEN, "Ban da nhan duoc 8.000.000$");
        GivePlayerCash(playerid, 8000000);
        SendClientMessage(playerid, COLOR_NEUTRALGREEN, "Ban da nhan duoc 100 xu");
        PlayerInfo[playerid][pPremiumPoints] += 100;
		Update(playerid, pPremiumPointsx);
        SendClientMessage(playerid, COLOR_NEUTRALGREEN, "Ban da nhan duoc 10 kim cuong");
        PlayerInfo[playerid][pKC] += 10;
	    Update(playerid,pKCx);
        SendClientMessage(playerid, COLOR_NEUTRALGREEN, "Ban da nhan duoc 300 banh hamburger");
        if(Inventory_GetFreeID(playerid, 1) == -1) Inventory_Add(playerid,"Burger", 2703, 300, 2);
	    else Inventory_Add(playerid,"Burger", 2703, 300, 1);
        SendClientMessage(playerid, COLOR_NEUTRALGREEN, "Ban da nhan duoc 2 hom random skins");
        PlayerInfo[playerid][pCrates][0] += 2, save_crates(playerid);
        SendClientMessage(playerid, COLOR_NEUTRALGREEN, "Ban da nhan duoc danh hieu 'VUI LA CHINH'");
        GiveReputation(playerid, 38);
        new a = random(1);
        switch(a)
        {
            case 0: GiveVehicle(playerid, 477), SendClientMessage(playerid, COLOR_NEUTRALGREEN, "Ban da nhan duoc xe ZR-350");
            case 1: GiveVehicle(playerid, 461), SendClientMessage(playerid, COLOR_NEUTRALGREEN, "Ban da nhan duoc xe PCJ-600");
        }
        SendClientMessage(playerid, COLOR_NEUTRALGREEN, "Ban da nhan duoc 15 banh trung thu");
        if(Inventory_GetFreeID(playerid, 1) == -1) Inventory_Add(playerid,"Banh Trung Thu", 2766, 15, 2);
	    else Inventory_Add(playerid,"Banh Trung Thu", 2766, 15, 1);
        PlayerInfo[playerid][pTrungThuJob][10] = 1;
        new string[128];
        format(string, sizeof(string), "%s da hoan thanh event trung thu va nhan duoc cac vat pham su kien [/trungthu]", GetName(playerid));
        SCMTA(COLOR_LGREEN, string);
        PlayerInfo[playerid][pFinishQQ] = 1;
        Update(playerid, pFinishQQx);
        Log("logs/nhanquatrungthu.log", string);
    }
    else SendClientMessage(playerid, COLOR_NEUTRALGREEN, "Ban da nhan qua event hoac chua hoan thanh nhiem vu [/trungthu]");

	return 1;
}