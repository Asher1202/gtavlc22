save_ttj(playerid) {
    new string[128];
    mysql_format(SQL, string, sizeof(string), "UPDATE `users` SET `TrungThuJob`='%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|' WHERE `ID`='%d'",
        PlayerInfo[playerid][TrungThuJob][0], PlayerInfo[playerid][TrungThuJob][1], PlayerInfo[playerid][TrungThuJob][2], PlayerInfo[playerid][TrungThuJob][3], PlayerInfo[playerid][TrungThuJob][4],
        PlayerInfo[playerid][TrungThuJob][5], PlayerInfo[playerid][TrungThuJob][6], PlayerInfo[playerid][TrungThuJob][7], PlayerInfo[playerid][TrungThuJob][8], PlayerInfo[playerid][TrungThuJob][9],
        PlayerInfo[playerid][pSQLID]);

    mysql_query(SQL, string, false);
}
CMD:trungthuevent(playerid, params[]) {
	new szDialog[100], szDialog2[2000];
	for(new i = 0; i < 9; i++) {
		format(szDialog, sizeof(szDialog), "{FFFFFF}%s: %s (%d lan nua)\n", TrungThuJobName(i), (PlayerInfo[playerid][pTrungThuJob][i] >= 10) ? ("{3DBF0A}Hoan Thanh{FFFFFF}") : ("{CC0E0E}Chua Xong{FFFFFF}"), 10 - PlayerInfo[playerid][pTrungThuJob][i]);
		strcat(szDialog2, szDialog);
	}
	Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Danh sach nhiem vu trung thu:", szDialog2, "Ok", "");
	return 1;
}