/*
	   Chợ đen 
	(Blackmarket)

	- Leader là người đặt gian hàng và thành viên trong gang đặt món hàng của họ vào.
	- Các lệnh: /datgianhang 
		/datgianhang: Gian hàng tồn tại trong 24 giờ, sau 24 giờ gian hàng biến mất
	- Hotkeys: 
		Lại gần gian hàng, sử dụng phím Y để xem hàng:
			+ Hiển thị DIALOG_STYLE_LIST:
				Cảnh báo. Một số hàng bị cấm sử dụng, hãy cẩn thận vì bạn có thể ngồi tù.
					[Mua hàng] [Thoát]
				+ Nếu mua hàng: 
					Một gian hàng có 20 slot. 
					Nếu slot nào có người mua thì hiện (đã thanh toán)
				+ Thoát

	* Chợ đen không cung cấp tên của người bán vật phẩm.
*/

#include <YSI_Coding\y_hooks>
	
#define MAX_CAMPS 5
#define MAX_CITEMS 100
#define MAX_BOBJECT	80

enum ciInfo {
	ciSQLID,
	ciItemType,
	ciAmount,
	ciMoney,
	ciGangPoints,
	ciSeller
};
enum campInfo {
	caID,
	Float: cax,
	Float: cay,
	Float: caz,
	Text3D:caLabel,
	caOwner
};
new CampInfo[MAX_CAMPS][campInfo],
	CampItemInfo[MAX_CITEMS][ciInfo],
	Iterator: CampItemList<MAX_CAMPS, MAX_CITEMS>,
	Iterator: CampItem<MAX_CITEMS>,
	Iterator: Camp<MAX_CAMPS>;

CMD:createcamp(playerid, params[]) {
	new Float: pos[3], str[100];
	GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
	
	new x = Iter_Free(Camp);
	if(x >= 0) {
		FORMAT:str("Blackmartket (ID: {FF0000}%d{FFFFFF})\nSo huu boi: %s\n{00FF00}Dang hoat dong", x, GetNameBySQLID(PlayerInfo[playerid][pSQLID]));
		CampInfo[x][cax] = pos[0];
		CampInfo[x][cay] = pos[1];
		CampInfo[x][caz] = pos[2]+2.5;
		CampInfo[x][caLabel] = CreateDynamic3DTextLabel(str, COLOR_WHITE, pos[0], pos[1], pos[2], 50);
		CampInfo[x][caOwner] = PlayerInfo[playerid][pSQLID];

		Iter_Add(Camp, x);

		new query[200];
		mysql_format(SQL, query, sizeof(query), "INSERT INTO `camps`(`player`,`active`,`x`,`y`,`z`,`starttime`) VALUES ('%d','1','%f','%f','%f','CURRENT_TIMESTAMP')", PlayerInfo[playerid][pSQLID], pos[0], pos[1], pos[2]);
		mysql_query(SQL, query);

		SendClientMessage(playerid, -1, "{00FF00}[!] {FFFFFF}Camp da duoc tao thanh cong.");		
	}
	else SendClientMessage(playerid, -1, "ERROR: {FFFFFF}So luong camp da dat gioi han.");
	return 1;
}
CMD:removecamp(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 6) return 1;
	new string[100], campid;
	foreach(new i: Camp) {
		if(IsPlayerInRangeOfPoint(playerid, 2, CampInfo[i][cax], CampInfo[i][cay], CampInfo[i][caz])) {
			SetPVarInt(playerid, "campid", i);
			campid = i;
			FORMAT:string("Ban co chac chan muon xoa Camp ID %d, so huu boi %s", campid, GetNameBySQLID(CampInfo[i][caOwner]));
		}
	}
	if(campid == 0) return 1;
	Dialog_Show(playerid, CAMP_DELETECONFRIM, DIALOG_STYLE_MSGBOX, "{FF3A3A}GTAVLC-SYSTEM: {FFFFFF}CAMP", string, "Tiep tuc", "Huy bo");
	return 1;
}
CMD:addcampitem(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 6) return 1;
	new bool: test = false;
	foreach(new i: Camp) {
		if(IsPlayerInRangeOfPoint(playerid, 4, CampInfo[i][cax], CampInfo[i][cay], CampInfo[i][caz])) {
			SetPVarInt(playerid, "zoneid", i);
			test = true;
			break;
		}
	}
	if(!test) return 1;
	OpenInventory(playerid, 1);
	return 1;
}
CMD:checkcamp(playerid, params[]) {
	foreach(new i: Camp) {
		if(IsPlayerInRangeOfPoint(playerid, 4, CampInfo[i][cax], CampInfo[i][cay], CampInfo[i][caz])) {
			SetPVarInt(playerid, "zoneid", i);
			Dialog_Show(playerid, CAMP_CHECK, DIALOG_STYLE_MSGBOX, "Cho den", "Chao mung ban den cho den, mot vai hang o day bi cam va ban co the o tu neu tang tru chung. Hay can than.", "Tiep tuc", "Thoat");
			printf("[cmd:checkcamp, zoneid: %d", GetPVarInt(playerid, "zoneid"));
			break;
		}
	}
	return 1;
}
Dialog:CAMP_CHECK(playerid, response, listitem, inputtext[]) {
	if(!response) return 1;
	new str1[1000], str2[100];
	strcat(str1, "Ten vat pham\tSo luong\tMoney\tGang Points\tNguoi ban\n");
	foreach(new i: CampItemList<GetPVarInt(playerid, "zoneid")>) {
		format(str2, sizeof(str2), "%s\t%s\t%s\t%s\t%s\n", ItemName[CampItemInfo[i][ciItemType]], 
			FormatNumber(CampItemInfo[i][ciAmount]), FormatNumber(CampItemInfo[i][ciMoney]), 
			FormatNumber(CampItemInfo[i][ciGangPoints]), GetNameBySQLID(CampItemInfo[i][ciSeller]));
		strcat(str1, str2);
	}
	Dialog_Show(playerid, CAMP_TRADE, DIALOG_STYLE_TABLIST_HEADERS, "{FF3A3A}GTAVLC-SYSTEM: {FFFFFF}BLACK MARKET", str1, "Xem", "Thoat");
	return 1;
}
Dialog:CAMP_TRADE(playerid, response, listitem, inputtext[]) {
	if(!response) return 1;
	new string[200], dem = 0, j;
	
	foreach(new i: CampItemList<GetPVarInt(playerid, "zoneid")>) {
		dem++;
		if(dem == listitem) {
			j = i;
			break;
		}
	}
	SetPVarInt(playerid, "itemID", j);

	printf("[dialog:CAMP_TRADE, zoneid: %d, itemSQLID: %d", GetPVarInt(playerid, "zoneid"), CampItemInfo[j][ciSQLID]);

	format(string, sizeof(string), "Ten vat pham: %s\nSo luong: %s\nGia: $%s, %s GP.\n\nNhan xac nhan de hoan tat.", 
		ItemName[CampItemInfo[j][ciItemType]], FormatNumber(CampItemInfo[j][ciAmount]), FormatNumber(CampItemInfo[j][ciMoney]), 
		FormatNumber(CampItemInfo[j][ciGangPoints]));

	Dialog_Show(playerid, CAMP_CONFIRMTRADE, DIALOG_STYLE_MSGBOX, "{FF3A3A}GTAVLC-SYSTEM: {FFFFFF}XAC NHAN HANG", string, "Xac nhan", "Thoat");
	return 1;
}
Dialog:CAMP_CONFIRMTRADE(playerid, response, listitem, inputtext[]) {
	if(!response) return 1;
	new j = GetPVarInt(playerid, "itemID");

	printf("[dialog:CAMP_CONFIRMTRADE, itemSQLID: %d, GP: %s, Money: %s", CampItemInfo[j][ciSQLID], FormatNumber(CampItemInfo[j][ciGangPoints]), FormatNumber(CampItemInfo[j][ciMoney]));
	if(PlayerInfo[playerid][pGangPoints] < CampItemInfo[j][ciGangPoints]) return ShowAlertDialog(playerid, "Khong du Gang Points", "Ban khong co du GP de mua mon hang nay.");
	if(GetPlayerCash(playerid) < CampItemInfo[j][ciMoney]) return ShowAlertDialog(playerid, "Khong du SAD", "Ban khong co du tien de mua mon hang nay.");

	PlayerInfo[playerid][pGangPoints] -= CampItemInfo[j][ciGangPoints];
	GivePlayerCash(playerid, -CampItemInfo[j][ciMoney]);
	Update(playerid, pCashx);
	UpdateVar(playerid, "GangPoints", PlayerInfo[playerid][pGangPoints]);

	GiveInventory(playerid, CampItemInfo[j][ciItemType], CampItemInfo[j][ciAmount]);

	DeleteBlackItem(playerid, j);

	return 1;
}
Dialog:CAMP_DELETECONFRIM(playerid, response, listitem, inputtext[]) {
	if(!response) return 1;
	new x = GetPVarInt(playerid, "campid"), query[100];
	FORMAT:query("DELETE FROM `camps` WHERE `id` = `%d`", CampInfo[x][caID]);
	mysql_tquery(SQL, query, "", "");
	FORMAT:query("DELETE FROM `blackitems` WHERE `bid` = '%d'", CampInfo[x][caID]);
	mysql_tquery(SQL, query, "", "");

	DeletePVar(playerid, "campid");
	Iter_Remove(Camp, x);

	CampInfo[x][cax] = 0;
	CampInfo[x][cay] = 0;
	CampInfo[x][caz] = 0;
	DestroyDynamic3DTextLabel(CampInfo[x][caLabel]);
	CampInfo[x][caOwner] = -1;

	new string[100];
	FORMAT:string("[{B81616}AdmWarning{FFFFFF}]: %s removed a camp. (campid: %d)", GetNameEx(playerid), x);
	SendAdminMessage(COLOR_ADMCHAT, string, 1);

	va_SendClientMessage(playerid, -1, "{00FF00}[!] {FFFFFF}Ban da xoa camp %d [SQLID: %d] thanh cong.", x, CampInfo[x][caID]);
	return 1;
}
Dialog:CAMP_CHOOSEAMOUNT(playerid, response, listitem, inputtext[]) {
	if(!response) return 1;

	if(PlayerInventory[playerid][SelectedItem[playerid]][iSQLID] == 0) return 1;
	new tit[30], string[200];
	FORMAT:tit("%s", ItemName[PlayerInventory[playerid][listitem][iType]]);
	SelectedItem[playerid] = listitem; //slot
	if(PlayerInventory[playerid][listitem][iType] < 49)	{
		FORMAT:string("Hien dang co %d ammo, nhap so luong ma ban:", PlayerInventory[playerid][listitem][iValue]);
	} 
	else if(PlayerInventory[playerid][listitem][iType] == 49) {
		FORMAT:string("Hien dang co %d drugs, nhap so luong:", PlayerInventory[playerid][listitem][iValue]);
	}
	else if(PlayerInventory[playerid][listitem][iType] == 50) {
		FORMAT:string("Hien dang co %d materials, nhap so luong:", PlayerInventory[playerid][listitem][iValue]);
	}
	Dialog_Show(playerid, CAMP_CHOOSEMONEY, DIALOG_STYLE_INPUT, tit, string, "Tiep tuc", "Thoat");
	return 1;
}
Dialog:CAMP_CHOOSEMONEY(playerid, response, listitem, inputtext[]) {
	if(!response) return 1;

	new amount = strval(inputtext);

	if(amount > PlayerInventory[playerid][SelectedItem[playerid]][iValue]) return ShowAlertDialog(playerid, "ERROR", "Ban khong co du.");

	SetPVarInt(playerid, "itemAmount", amount);

	Dialog_Show(playerid, CAMP_CHOOSEGANGPOINTS, DIALOG_STYLE_INPUT, "Nhap so tien - {FF3A3A}GTAVLC-SYSTEM", "Nhap so tien (don vi SAD):", "Tiep tuc", "Thoat");
	return 1;
}
Dialog:CAMP_CHOOSEGANGPOINTS(playerid, response, listitem, inputtext[]) {
	if(!response) return 1;
	new a = strval(inputtext);
	if(a > 0) {
		SetPVarInt(playerid, "itemMoney", strval(inputtext));
		Dialog_Show(playerid, CAMP_FINAL, DIALOG_STYLE_INPUT, "Gang Points - {FF3A3A}GTAVLC-SYSTEM", "Nhap Gang Points:", "Tiep tuc", "Thoat");
		return 1;
	}
	return ShowAlertDialog(playerid, "Khong hop le", "Ban vua nhap so tien khong hop le");
}
Dialog:CAMP_FINAL(playerid, response, listitem, inputtext[]) {
	if(!response) return 1;
	new a = strval(inputtext);
	if(a > 0) {
		SetPVarInt(playerid, "itemGangPoints", strval(inputtext));
		new string[200];
		format(string, sizeof(string), "{FF0000}Thong tin:\n{FFFFFF}Ten vat pham: {00FF00}%s\n{FFFFFF}So luong: {FFFF00}%s\nGia: $%s, %s GP.\n\n{FFFFFF}Nhan tiep tuc khi ban da chac chan.", 
			ItemName[PlayerInventory[playerid][SelectedItem[playerid]][iType]], FormatNumber(GetPVarInt(playerid, "itemAmount")), FormatNumber(GetPVarInt(playerid, "itemMoney")),
			FormatNumber(GetPVarInt(playerid, "itemGangPoints")));
		Dialog_Show(playerid, CAMP_FINAL2, DIALOG_STYLE_MSGBOX, "Add Items - {FF3A3A}GTAVLC-SYSTEM", string, "Tiep tuc", "Thoat");
		return 1;
	}
	return ShowAlertDialog(playerid, "Khong hop le", "Ban vua nhap so luong khong hop le");
}
Dialog:CAMP_FINAL2(playerid, response, listitem, inputtext[]) {
	if(!response) return 1;
	new x = Iter_Free(CampItem), query[200];
	new zoneid = GetPVarInt(playerid, "zoneid");

	mysql_format(SQL, query, sizeof(query), "INSERT INTO `blackitems` (`type`,`money`,`gangpoints`,`amount`,`player`,`bid`) VALUES ('%d','%d','%d','%d','%d','%d')",
	PlayerInventory[playerid][SelectedItem[playerid]][iType],GetPVarInt(playerid, "itemMoney"),GetPVarInt(playerid, "itemGangPoints"),GetPVarInt(playerid, "itemAmount"),PlayerInfo[playerid][pSQLID],SelectedItem[playerid],zoneid);
	mysql_query(SQL, query);

	CampItemInfo[x][ciSQLID] = cache_insert_id();
	CampItemInfo[x][ciItemType] = PlayerInventory[playerid][SelectedItem[playerid]][iType];
	CampItemInfo[x][ciAmount] = GetPVarInt(playerid, "itemAmount");
	CampItemInfo[x][ciMoney] = GetPVarInt(playerid, "itemMoney");
	CampItemInfo[x][ciGangPoints] = GetPVarInt(playerid, "itemGangPoints");
	CampItemInfo[x][ciSeller] = PlayerInfo[playerid][pSQLID];

	DeletePVar(playerid, "itemAmount");
	DeletePVar(playerid, "itemMoney");
	DeletePVar(playerid, "itemGangPoints");
	DeletePVar(playerid, "zoneid");

	printf("[ADDED ITEM: %d]", CampItemInfo[x][ciSQLID]);
	SendClientMessage(playerid, COLOR_WHITE, "{00FF00}[!] {FFFFFF}Item da duoc them.");

	Iter_Add(CampItemList<zoneid>, x);
	Iter_Add(CampItem, x);

	SaveInventoryInSlot(playerid, SelectedItem[playerid], PlayerInventory[playerid][SelectedItem[playerid]][iValue]-CampItemInfo[x][ciAmount]);
	return 1;
}
//functions
LoadBlackItems(n) {
	new query[100];
	mysql_format(SQL, query, sizeof(query), "SELECT * FROM `blackitems` WHERE `bid` = '%d'", n);
	new Cache: x = mysql_query(SQL, query);
	for(new i, j = cache_num_rows(); i < j; i++) {
		new k = Iter_Free(CampItem);

		cache_get_value_name_int(i, "id", CampItemInfo[k][ciSQLID]);
		cache_get_value_name_int(i, "type", CampItemInfo[k][ciItemType]);
		cache_get_value_name_int(i, "amount", CampItemInfo[k][ciAmount]);
		cache_get_value_name_int(i, "money", CampItemInfo[k][ciMoney]);
		cache_get_value_name_int(i, "gangpoints", CampItemInfo[k][ciGangPoints]);
		cache_get_value_name_int(i, "player", CampItemInfo[k][ciSeller]);

		printf("[Item ID: %d] Name: %s, Amount: %s, Money: %s, GangPoint: %s, Seller: %s", CampItemInfo[k][ciSQLID], ItemName[CampItemInfo[k][ciItemType]], FormatNumber(CampItemInfo[k][ciAmount]), 
			FormatNumber(CampItemInfo[k][ciMoney]), FormatNumber(CampItemInfo[k][ciGangPoints]), GetNameBySQLID(CampItemInfo[k][ciSeller]));
		Iter_Add(CampItemList<n>, k);
		Iter_Add(CampItem, k);
	}
	cache_delete(x);
	return 1;	
}
LoadBlackMarket() {
	new Cache: x = mysql_query(SQL, "SELECT * FROM `camps` LIMIT 5");
	new str[100];
	for(new i, j = cache_num_rows(); i < j; i++) {
		cache_get_value_name_int(i, "id", CampInfo[i][caID]);
		cache_get_value_name_int(i, "player", CampInfo[i][caOwner]);
		cache_get_value_name_float(i, "x", CampInfo[i][cax]);
		cache_get_value_name_float(i, "y", CampInfo[i][cay]);
		cache_get_value_name_float(i, "z", CampInfo[i][caz]);

		FORMAT:str("Blackmartket (ID: {FF0000}%d{FFFFFF})\nSo huu boi: %s\n{00FF00}Dang hoat dong", i, GetNameBySQLID(CampInfo[i][caOwner]));
		CampInfo[i][caLabel] = CreateDynamic3DTextLabel(str, COLOR_WHITE, CampInfo[i][cax], CampInfo[i][cay], CampInfo[i][caz], 50);

		Iter_Add(Camp, i);


		printf("[Camp ID %d] Owner: %s", CampInfo[i][caID], GetNameBySQLID(CampInfo[i][caOwner]));
		LoadBlackItems(CampInfo[i][caID]);
	}
	cache_delete(x);
	return 1;
}
GetNameBySQLID(sqlid) {
	new query[50], name[MAX_PLAYER_NAME];
	mysql_format(SQL, query, sizeof(query), "SELECT `name` FROM `users` WHERE `id` = '%d'", sqlid);
	new Cache: x = mysql_query(SQL, query);
	cache_get_value_name(0, "name", name);
	cache_delete(x);
	return name;
}
DeleteBlackItem(playerid, sqlid) {
	new query[200];
	mysql_format(SQL, query, sizeof(query), "DELETE FROM `blackitems` WHERE `id` = '%d'", sqlid);
	mysql_query(SQL, query);

	printf("[DeleteBlackItem, Item SQLID: %d]", sqlid);
	new x = -1;

	foreach(new i: CampItem)
	{
		if(CampItemInfo[i][ciSQLID] == sqlid) {
			x = i;
			break;
		}
	}

	if(x == -1) {
		printf("System cant find item with SQLID %d in DeleteBlackItem. Please check it out.", sqlid);
	}
	else {
		CampItemInfo[x][ciSQLID] = 0;
		CampItemInfo[x][ciItemType] = 0;
		CampItemInfo[x][ciAmount] = 0;
		CampItemInfo[x][ciMoney] = 0;
		CampItemInfo[x][ciGangPoints] = 0;
		CampItemInfo[x][ciSeller] = 0;		

		Iter_Remove(CampItem, x);
		Iter_Remove(CampItemList<GetPVarInt(playerid, "zoneid")>, x);
	}


	return 1;
}

hook OnPlayerConnect(playerid) {
	DeletePVar(playerid, "campid");
	DeletePVar(playerid, "zoneid");
	DeletePVar(playerid, "itemSQLID");
	DeletePVar(playerid, "itemAmount");
	DeletePVar(playerid, "itemMoney");
	DeletePVar(playerid, "itemGangPoints");
	return 1;
}