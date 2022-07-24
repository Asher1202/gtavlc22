CMD:addsafezone(playerid, params[]) {
	new range, string[180], Float: Pos[3];
    if(PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, COLOR_WHITE, "Ban khong the su dung lenh nay!");
	if(sscanf(params, "i", range)) return SendClientMessage(playerid, COLOR_RED, "Cu phap: {FFFFFF}/addsafezone <khoang cach>");
	if(range < 15) return SendClientMessage(playerid, -1, "ERROR: Range khong hop le. (it nhat 15m)");
	GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
    mysql_format(SQL, string, sizeof(string), "INSERT INTO `safezones` (`X`, `Y`, `Z`, `Range`) VALUES ('%f', '%f', '%f', '%d')", Pos[0], Pos[1], Pos[2], range);
	new Cache: result = mysql_query(SQL, string);
	new i = cache_insert_id();
	SafeZone[i][szX] = Pos[0];
	SafeZone[i][szY] = Pos[1];
	SafeZone[i][szZ] = Pos[2];
	SafeZone[i][szRange] = range;
	sfz++;
	cache_delete(result);
	SendClientMessage(playerid, COLOR_GOLD, "Khu an toan nay da duoc them thanh cong vao co so du lieu.");
	format(string, sizeof(string), "Thong tin ID %d, Toa do (%f, %f, %f), khoang cach %d.", i, Pos[0], Pos[1], Pos[2], range);
	SendClientMessage(playerid, COLOR_GOLD, string);
	return 1;
}
CMD:editsafezone(playerid, params[]) {
	new szDialog[1024], szDialog2[1024];
	new szZone[128];
    if(PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	for(new i = 0; i < MAX_SAFEZONES; i++) {
		if(SafeZone[i][szRange] >= 15) {
			GetPlayer3DZone2(SafeZone[i][szX], SafeZone[i][szY], SafeZone[i][szZ], szZone, sizeof(szZone));
			format(szDialog, sizeof(szDialog), "%d. %s\n", i, szZone);
			strcat(szDialog2, szDialog);
		}
	}
	Dialog_Show(playerid, DIALOG_EDITSF, DIALOG_STYLE_TABLIST, "Khu an toan:", szDialog2, "Chon", "Huy bo");
	return 1;
}
Dialog:DIALOG_EDITSF(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new string[100];
	SelectedItem[playerid] = listitem+1;
	format(string, sizeof(string), "Position\t(%f, %f, %f)\nRange\t%d", SafeZone[listitem+1][szX], SafeZone[listitem+1][szY], SafeZone[listitem+1][szZ], SafeZone[listitem+1][szRange]);
	new title[180];
	format(title, sizeof(title), "Edit safe zone %d", listitem+1);
	Dialog_Show(playerid, DIALOG_EDITSF1, DIALOG_STYLE_TABLIST, title, string, "Select", "Cancel");	
	return 1;
}
Dialog:DIALOG_EDITSF1(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	switch(listitem) {
		case 0: Dialog_Show(playerid, DIALOG_EDITSF2, DIALOG_STYLE_INPUT, "Position:", "Viet ben duoi gia tri ban muon bien nay co.\nSyntax: x, y, z", "Ok", "Exit");
		case 1: Dialog_Show(playerid, DIALOG_EDITSF2, DIALOG_STYLE_INPUT, "Range:", "Viet ben duoi gia tri ban muon bien nay co.", "Ok", "Exit");
	}
	EditJob[playerid] = listitem;	
	return 1;
}
Dialog:DIALOG_EDITSF2(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new job = SelectedItem[playerid];
	new amount = strval(inputtext), string[200];
	switch(EditJob[playerid]) {
		case 0: {
			new Float: Pos[3];
			if(sscanf(inputtext, "fff", Pos[0], Pos[1], Pos[2])) return SendClientMessage(playerid, -1, "Invalid syntax!");
			SafeZone[job][szX] = Pos[0];
			SafeZone[job][szY] = Pos[1];
			SafeZone[job][szZ] = Pos[2];
			format(string, sizeof(string), "Ban da thay doi 'Vi tri' cua Job ID %d, tro thanh: %f, %f, %f.", job, Pos[0], Pos[1], Pos[2]);
			SendClientMessage(playerid, COLOR_WHITE, string);
			mysql_format(SQL, string, sizeof(string), "UPDATE `safezones` SET `X`='%f', `Y`='%f', `Z`='%f' WHERE `ID`='%d'", Pos[0], Pos[1], Pos[2], job);
			mysql_tquery(SQL, string, "", "");
		}
		case 1: {
			SafeZone[job][szRange] = amount;
			format(string, sizeof(string), "Ban da thay doi 'Pham vi' cua Job ID %d, tro thanh: %d.", job, amount);
			SendClientMessage(playerid, COLOR_WHITE, string);
			mysql_format(SQL, string, sizeof(string), "UPDATE `safezones` SET `Range`='%d' WHERE `ID`='%d'", amount, job);
			mysql_tquery(SQL, string, "", "");
		}
	}	
	return 1;
}