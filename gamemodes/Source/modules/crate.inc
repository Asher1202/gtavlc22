#include <YSI_Coding\y_hooks>

#define MAX_CRATES 		9
new IsCrates[MAX_PLAYERS], CrateModel[MAX_PLAYERS], CheckMoGuong[MAX_PLAYERS], PlayerText: CratePTD[2], Text: CrateTD[6], CrateTime[MAX_PLAYERS], AlegeCrates[MAX_PLAYERS], Text3D: LabelCrates;
new CrateName[9][30] = {
	{"Random Skin"},
	{"Random Car Silver"}, 
	{"Random Car Gold"}, 
	{"Ticket Than Bi"}, 
	{"Voucher Cao Cap"},
    {"Random Skin Huyen Thoai"},
    {"Random Xe Cao Cap"},
    {"Random Xe Gioi Han"},
    {"Random Xe Huyen Thoai"}
};
new CratePrice[][] = {
	{5000000, 50},
	{10000000, 100},
	{20000000, 200},
	{50000000, 500},
	{100000000, 1000}
};

new CrateColors[9][10] = {
	{"F09E05"}, 
	{"F09E05"},
	{"F09E05"},
	{"e52222"},
	{"7556ff"},
    {"f04aa3"},
    {"ad7af0"},
    {"EEE0C9"},
    {"ff0000"}
};

new StockCarCrate;
new TimerCratesEx[MAX_PLAYERS];

hook OnGameModeInit() {
	// Create3DTextLabel("{e52222}Hop Qua GTAVLC{FFFFFF}\nSu Dung {e52222}/buycrate{FFFFFF} De Mua Crate\n{FFFFFF}Gia Hop Qua: {e52222}50.000.000  SAD {FFFFFF} / {e52222}500 VIP XU",0xFFFFFFFF,1986.7395,-2183.5996,13.5469,25.0, 0, 1);
	// Create3DTextLabel("{eeba24}Hop Qua Sieu Hiem{FFFFFF}\nSu Dung {eeba24}/buycrate{FFFFFF} De Mua Crate\n{FFFFFF}Gia Hop Qua: {eeba24}20.000.000  SAD {FFFFFF} / {eeba24}200 VIP XU",0xFFFFFFFF,1984.8501,-2181.1921,13.5469,25.0, 0, 1);
	// Create3DTextLabel("{610F7D}Hop Qua Hiem{FFFFFF}\nSu Dung {610F7D}/buycrate{FFFFFF} De Mua Crate\n{FFFFFF}Gia Hop Qua: {610F7D}10.000.000  SAD {FFFFFF} / {610F7D}100 VIP XU",0xFFFFFFFF,1980.0298,-2181.1948,13.5469,25.0, 0, 1);
	// Create3DTextLabel("{045AB6}Hop Qua Thuong{FFFFFF}\nSu Dung {045AB6}/buycrate{FFFFFF} De Mua Crate\n{FFFFFF}Gia Hop Qua: {045AB6}5.000.000  SAD {FFFFFF} / {045AB6}50 VIP XU",0xFFFFFFFF,1974.7478,-2181.4993,13.5469,25.0, 0, 1);    

	CrateTD[5] = TextDrawCreate(234.333313, 183.362961, "box");
	TextDrawLetterSize(CrateTD[5], 0.000000, 13.533330);
	TextDrawTextSize(CrateTD[5], 371.000000, 0.000000);
	TextDrawAlignment(CrateTD[5], 1);
	TextDrawColor(CrateTD[5], 0xFFFFFFFF);
	TextDrawUseBox(CrateTD[5], 1);
	TextDrawBoxColor(CrateTD[5], 0x0000005D);
	TextDrawSetShadow(CrateTD[5], 0);
	TextDrawSetOutline(CrateTD[5], 0);
	TextDrawBackgroundColor(CrateTD[5], 0x000000FF);
	TextDrawFont(CrateTD[5], 1);
	TextDrawSetProportional(CrateTD[5], 1);
	TextDrawSetSelectable(CrateTD[5], 0);
	 
	CrateTD[4] = TextDrawCreate(234.333328, 164.266617, "box");
	TextDrawLetterSize(CrateTD[4], 0.000000, 1.666666);
	TextDrawTextSize(CrateTD[4], 371.000000, 0.000000);
	TextDrawAlignment(CrateTD[4], 1);
	TextDrawColor(CrateTD[4], 0xFFFFFFFF);
	TextDrawUseBox(CrateTD[4], 1);
	TextDrawBoxColor(CrateTD[4], 0x000000FE);
	TextDrawSetShadow(CrateTD[4], 0);
	TextDrawSetOutline(CrateTD[4], 0);
	TextDrawBackgroundColor(CrateTD[4], 0x000000FF);
	TextDrawFont(CrateTD[4], 1);
	TextDrawSetProportional(CrateTD[4], 1);
	TextDrawSetSelectable(CrateTD[4], 0);
	 
	CrateTD[3] = TextDrawCreate(303.000000, 163.466629, "Hop Qua");
	TextDrawLetterSize(CrateTD[3], 0.400000, 1.600000);
	TextDrawTextSize(CrateTD[3], 1280.000000, 1280.000000);
	TextDrawAlignment(CrateTD[3], 2);
	TextDrawColor(CrateTD[3], 0xFFFFFFFF);
	TextDrawUseBox(CrateTD[3], 0);
	TextDrawBoxColor(CrateTD[3], 0x80808080);
	TextDrawSetShadow(CrateTD[3], 0);
	TextDrawSetOutline(CrateTD[3], 1);
	TextDrawBackgroundColor(CrateTD[3], 0x000000FF);
	TextDrawFont(CrateTD[3], 3);
	TextDrawSetProportional(CrateTD[3], 1);
	TextDrawSetSelectable(CrateTD[3], 0);
	 
	CrateTD[2] = TextDrawCreate(302.400146, 309.348358, "Mo Hop Qua");
	TextDrawLetterSize(CrateTD[2], 0.280000, 1.475556);
	TextDrawTextSize(CrateTD[2], 10.000000, 136.730698);
	TextDrawAlignment(CrateTD[2], 2);
	TextDrawColor(CrateTD[2], 0xFFFFFFFF);
	TextDrawUseBox(CrateTD[2], 1);
	TextDrawBoxColor(CrateTD[2], 0x00FF001C);
	TextDrawSetShadow(CrateTD[2], 0);
	TextDrawSetOutline(CrateTD[2], 1);
	TextDrawBackgroundColor(CrateTD[2], 0x0000007A);
	TextDrawFont(CrateTD[2], 2);
	TextDrawSetProportional(CrateTD[2], 1);
	TextDrawSetSelectable(CrateTD[2], 1);
	 
	CrateTD[1] = TextDrawCreate(302.466766, 343.450439, "Huy Bo");
	TextDrawLetterSize(CrateTD[1], 0.280000, 1.475556);
	TextDrawTextSize(CrateTD[1], 10.000000, 136.730698);
	TextDrawAlignment(CrateTD[1], 2);
	TextDrawColor(CrateTD[1], 0xFFFFFFFF);
	TextDrawUseBox(CrateTD[1], 1);
	TextDrawBoxColor(CrateTD[1], 0xFF000024);
	TextDrawSetShadow(CrateTD[1], 0);
	TextDrawSetOutline(CrateTD[1], 1);
	TextDrawBackgroundColor(CrateTD[1], 0x0000007A);
	TextDrawFont(CrateTD[1], 2);
	TextDrawSetProportional(CrateTD[1], 1);
	TextDrawSetSelectable(CrateTD[1], 1);
	 
	CrateTD[0] = TextDrawCreate(302.466766, 326.449402, "QUAY MIEN PHI");
	TextDrawLetterSize(CrateTD[0], 0.280000, 1.475556);
	TextDrawTextSize(CrateTD[0], 10.000000, 136.730698);
	TextDrawAlignment(CrateTD[0], 2);
	TextDrawColor(CrateTD[0], 0xFFFFFFFF);
	TextDrawUseBox(CrateTD[0], 1);
	TextDrawBoxColor(CrateTD[0], 0xADD8E619);
	TextDrawSetShadow(CrateTD[0], 0);
	TextDrawSetOutline(CrateTD[0], 1);
	TextDrawBackgroundColor(CrateTD[0], 0x0000007A);
	TextDrawFont(CrateTD[0], 2);
	TextDrawSetProportional(CrateTD[0], 1);
	TextDrawSetSelectable(CrateTD[0], 1);    
}
hook OnPlayerConnect(playerid) {
	CratePTD[0] = CreatePlayerTextDraw(playerid, 254.666626, 186.111084, "");
	PlayerTextDrawLetterSize(playerid, CratePTD[0], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, CratePTD[0], 90.000000, 90.000000);
	PlayerTextDrawAlignment(playerid, CratePTD[0], 1);
	PlayerTextDrawColor(playerid, CratePTD[0], 0xFFFFFFFF);
	PlayerTextDrawUseBox(playerid, CratePTD[0], 0);
	PlayerTextDrawBoxColor(playerid, CratePTD[0], 0x80808080);
	PlayerTextDrawSetShadow(playerid, CratePTD[0], 0);  // skins
	PlayerTextDrawSetOutline(playerid, CratePTD[0], 0);
	PlayerTextDrawBackgroundColor(playerid, CratePTD[0], 0xFFFFFF00);
	PlayerTextDrawFont(playerid, CratePTD[0], 5);
	PlayerTextDrawSetProportional(playerid, CratePTD[0], 0);
	PlayerTextDrawSetSelectable(playerid, CratePTD[0], 0);
	PlayerTextDrawSetPreviewModel(playerid, CratePTD[0], 18631);
	PlayerTextDrawSetPreviewRot(playerid, CratePTD[0], 0.000000, 0.000000, 21.000000, 1.000000);
	 
	CratePTD[1] = CreatePlayerTextDraw(playerid, 301.466675, 285.289215, "Select action~n~You have 0 crates.");
	PlayerTextDrawLetterSize(playerid, CratePTD[1], 0.191331, 0.994368);
	PlayerTextDrawTextSize(playerid, CratePTD[1], 1280.000000, 1280.000000);
	PlayerTextDrawAlignment(playerid, CratePTD[1], 2);
	PlayerTextDrawColor(playerid, CratePTD[1], 0xFFFFFFFF);
	PlayerTextDrawUseBox(playerid, CratePTD[1], 0);
	PlayerTextDrawBoxColor(playerid, CratePTD[1], 0x80808080);
	PlayerTextDrawSetShadow(playerid, CratePTD[1], 0);
	PlayerTextDrawSetOutline(playerid, CratePTD[1], 1);
	PlayerTextDrawBackgroundColor(playerid, CratePTD[1], 0x00000091);
	PlayerTextDrawFont(playerid, CratePTD[1], 2);
	PlayerTextDrawSetProportional(playerid, CratePTD[1], 1);
	PlayerTextDrawSetSelectable(playerid, CratePTD[1], 0);
	return 1;
}
hook OnPlayerClickPlayerTD(playerid, PlayerText:playertextid)
{
	if(playertextid == MoGuong[playerid][11])
	{
		if(PlayerInfo[playerid][pCrates][0] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong co crate.");
		SetPVarInt(playerid, "VoucherType", 1);
		CrateTime[playerid] = 15;
		CrateModel[playerid] = 1;
		PlayerInfo[playerid][pCrates][0] -= 1;
		startcrates(playerid);
	}
	if(playertextid == MoGuong[playerid][12])
	{
		if(PlayerInfo[playerid][pCrates][1] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong co crate.");
		if(GetSlots(playerid) == GetVehicles(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong con slot xe trong de mo hom");
		SetPVarInt(playerid, "VoucherType", 2);
		CrateTime[playerid] = 15;
		CrateModel[playerid] = 1;
		PlayerInfo[playerid][pCrates][1] -= 1;
		startcrates(playerid);
	}
	if(playertextid == MoGuong[playerid][13])
	{
		if(PlayerInfo[playerid][pCrates][2] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong co crate.");
		if(GetSlots(playerid) == GetVehicles(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong con slot xe trong de mo hom");
		SetPVarInt(playerid, "VoucherType", 3);
		CrateTime[playerid] = 15;
		CrateModel[playerid] = 1;
		PlayerInfo[playerid][pCrates][2] -= 1;
		startcrates(playerid);
	}
	if(playertextid == MoGuong[playerid][14])
	{
		if(PlayerInfo[playerid][pCrates][3] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong co crate.");
		if(GetSlots(playerid) == GetVehicles(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong con slot xe trong de mo hom");
		SetPVarInt(playerid, "VoucherType", 4);
		CrateTime[playerid] = 15;
		CrateModel[playerid] = 1;
		PlayerInfo[playerid][pCrates][3] -= 1;
		startcrates(playerid);
	}
	if(playertextid == MoGuong[playerid][15])
	{
		if(PlayerInfo[playerid][pCrates][4] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong co crate.");
		if(GetSlots(playerid) == GetVehicles(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong con slot xe trong de mo hom");
		SetPVarInt(playerid, "VoucherType", 5);
		CrateTime[playerid] = 15;
		CrateModel[playerid] = 1;
		PlayerInfo[playerid][pCrates][4] -= 1;
		startcrates(playerid);
	}
    if(playertextid == MoGuong[playerid][15])
    {
        if(PlayerInfo[playerid][pCrates][4] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong co crate.");
        if(GetSlots(playerid) == GetVehicles(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong con slot xe trong de mo hom");
        SetPVarInt(playerid, "VoucherType", 5);
        CrateTime[playerid] = 15;
        CrateModel[playerid] = 1;
        PlayerInfo[playerid][pCrates][4] -= 1;
        startcrates(playerid);
    }
    if(playertextid == MoGuong[playerid][15])
    {
        if(PlayerInfo[playerid][pCrates][4] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong co crate.");
        if(GetSlots(playerid) == GetVehicles(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong con slot xe trong de mo hom");
        SetPVarInt(playerid, "VoucherType", 5);
        CrateTime[playerid] = 15;
        CrateModel[playerid] = 1;
        PlayerInfo[playerid][pCrates][4] -= 1;
        startcrates(playerid);
    }
    if(playertextid == MoGuong[playerid][28])
    {
        if(PlayerInfo[playerid][pCrates][7] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong co crate.");
        if(GetSlots(playerid) == GetVehicles(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong con slot xe trong de mo hom");
        SetPVarInt(playerid, "VoucherType", 8);
        CrateTime[playerid] = 15;
        CrateModel[playerid] = 1;
        PlayerInfo[playerid][pCrates][7] -= 1;
        startcrates(playerid);
    }
    if(playertextid == MoGuong[playerid][29])
    {
        if(PlayerInfo[playerid][pCrates][6] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong co crate.");
        if(GetSlots(playerid) == GetVehicles(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong con slot xe trong de mo hom");
        SetPVarInt(playerid, "VoucherType", 7);
        CrateTime[playerid] = 15;
        CrateModel[playerid] = 1;
        PlayerInfo[playerid][pCrates][6] -= 1;
        startcrates(playerid);
    }
    if(playertextid == MoGuong[playerid][35])
    {
        if(PlayerInfo[playerid][pCrates][8] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong co crate.");
        SetPVarInt(playerid, "VoucherType", 9);
        CrateTime[playerid] = 15;
        CrateModel[playerid] = 1;
        PlayerInfo[playerid][pCrates][8] -= 1;
        startcrates(playerid);
    }
    if(playertextid == MoGuong[playerid][30])
    {
        if(PlayerInfo[playerid][pCrates][5] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong co crate.");
        SetPVarInt(playerid, "VoucherType", 6);
        CrateTime[playerid] = 15;
        CrateModel[playerid] = 1;
        PlayerInfo[playerid][pCrates][5] -= 1;
        startcrates(playerid);
    }
	if(playertextid == MoGuong[playerid][27])
	{
		TatMoGuong(playerid);
	}
	return 1;
}
hook OnPlayerClickTextDraw(playerid, Text:clickedid) {

	if(clickedid == CrateTD[1]) {
	    if(CrateModel[playerid] >= 0) return true;
		for(new j = 0; j < 6; j++) TextDrawHideForPlayer(playerid, CrateTD[j]);
		for(new j = 0; j < 2; j++) PlayerTextDrawHide(playerid, CratePTD[j]);
		IsCrates[playerid] = 0;
		CancelSelectTextDraw(playerid);
		return ~0;
	}
	else if(clickedid == CrateTD[0]) {
		if(CrateModel[playerid] >= 0) return true;
 		CrateModel[playerid] = 0;
 		CrateTime[playerid] = 20;
    	SendClientMessage(playerid, COLOR_WHITE, "{D81B15}(Crate System){FFFFFF} Ban da mo hop TEST, Se Khong nhan duoc bat cu thu gi.");
    	startcrates(playerid);
		return ~0;
	}	    
    else if(clickedid == Text:INVALID_TEXT_DRAW) {
		if(CrateTime[playerid] > 0) SelectTextDraw(playerid, 0xCA3ADBFF);
		else {
			if(IsCrates[playerid] == 1) {
				IsCrates[playerid] = 0;
				for(new j = 0; j < 6; j++) TextDrawHideForPlayer(playerid, CrateTD[j]);
				for(new j = 0; j < 2; j++) PlayerTextDrawHide(playerid, CratePTD[j]);
				CancelSelectTextDraw(playerid);
				return ~0;
			}
		}
		if(CheckMoGuong[playerid] == 1) TatMoGuong(playerid);
    }  
    return 1;      
}
hook LoadStuffs() {
    new Cache: test = mysql_query(SQL,"SELECT * FROM `stuff`");
	if(cache_num_rows())
    cache_get_value_name_int(0, "stocks", StockCarCrate);
    cache_delete(test);
}
hook ResetVariables(playerid) {
    CrateTime[playerid] = 0;
    IsCrates[playerid] = 0;
    AlegeCrates[playerid] = 0;
    CheckMoGuong[playerid] = 0;
    CrateModel[playerid] = -1;    
    // inSkinTrade[playerid] = -1;
    DeletePVar(playerid, "VoucherType");
}
CMD:crateforall(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 6)
		return SendClientMessage(playerid, COLOR_LGREEN, AdminOnly);

	new type, value;
	if(sscanf(params, "ii", type, value)) {
		SendClientMessage(playerid, COLOR_GREY, "Syntax: {FFFFFF}/crateforall [crate type] [value]");
		SendClientMessage(playerid, COLOR_WHITE, "Rare (0) | Epic (1) | Legendary (2) | Transcendent (3) | Vehicle (4)");
		return true;
	}

	foreach(new i: Player) PlayerInfo[i][pCrates][type] += value, save_crates(i);

	new string[500];
	format(string, 75, "Admin %s da cho tat ca nguoi choi %d crate %s.", GetName(playerid), value, CrateName[type]);
	SCMTA(COLOR_YELLOW, string);
	return 1;
}
function ShowMoGuongTD(playerid) {
	new gString[128];
	format(gString, sizeof(gString), "~g~~h~RANDOM SKIN~N~So Huu : %d", PlayerInfo[playerid][pCrates][0]);
	PlayerTextDrawSetString(playerid, MoGuong[playerid][20], gString);
	format(gString, sizeof(gString), "~g~~h~CAR SILVER BOX~N~So Huu : %d", PlayerInfo[playerid][pCrates][1]);
	PlayerTextDrawSetString(playerid, MoGuong[playerid][21], gString);
	format(gString, sizeof(gString), "~g~~h~CAR GOLD BOX~N~So Huu : %d", PlayerInfo[playerid][pCrates][2]);
	PlayerTextDrawSetString(playerid, MoGuong[playerid][22], gString);
	format(gString, sizeof(gString), "~g~~h~TICKET THAN BI~N~So Huu : %d", PlayerInfo[playerid][pCrates][3]);
	PlayerTextDrawSetString(playerid, MoGuong[playerid][23], gString);
	format(gString, sizeof(gString), "~g~~h~VOUCHER~N~So Huu : %d", PlayerInfo[playerid][pCrates][4]);
	PlayerTextDrawSetString(playerid, MoGuong[playerid][24], gString);
    format(gString, sizeof(gString), "~g~~h~SKIN HUYEN THOAI~N~So Huu : %d", PlayerInfo[playerid][pCrates][5]);
    PlayerTextDrawSetString(playerid, MoGuong[playerid][32], gString);
    format(gString, sizeof(gString), "~g~~h~CAR CAO CAP~N~So Huu : %d", PlayerInfo[playerid][pCrates][6]);
    PlayerTextDrawSetString(playerid, MoGuong[playerid][31], gString);
    format(gString, sizeof(gString), "~g~~h~CAR GIOI HAN~N~So Huu : %d", PlayerInfo[playerid][pCrates][7]);
    PlayerTextDrawSetString(playerid, MoGuong[playerid][33], gString);
    format(gString, sizeof(gString), "~g~~h~CAR HUYEN THOAI~N~So Huu : %d", PlayerInfo[playerid][pCrates][8]);
    PlayerTextDrawSetString(playerid, MoGuong[playerid][36], gString);
	for(new i = 0; i < 37; i++) PlayerTextDrawShow(playerid, MoGuong[playerid][i]);
	SelectTextDraw(playerid, 0xFF0000FF);
	return 1;
}	
function TatMoGuong(playerid) {
	for(new i = 0; i < 37; i++) PlayerTextDrawHide(playerid, MoGuong[playerid][i]);
	CancelSelectTextDraw(playerid);
	CheckMoGuong[playerid] = 0;
	return 1;
}	
function TatQuayGuong(playerid) {
	IsCrates[playerid] = 0;
	for(new j = 0; j < 6; j++) TextDrawHideForPlayer(playerid, CrateTD[j]);
	for(new j = 0; j < 2; j++) PlayerTextDrawHide(playerid, CratePTD[j]);
	CancelSelectTextDraw(playerid);
	CheckMoGuong[playerid] = 1;
	ShowMoGuongTD(playerid);
    DeletePVar(playerid, "VoucherType");
	return 1;
}	
// CMD:crates(playerid ,params[]) {
// 	new string[250];
// 	if(CrateModel[playerid] >= 0) return true;
// 	for(new j = 0; j < 6; j++) TextDrawHideForPlayer(playerid, CrateTD[j]);
// 	for(new j = 0; j < 2; j++) PlayerTextDrawHide(playerid, CratePTD[j]);
// 	format(string, sizeof(string), "Loai Hop\tAmount\n{FFFFFF}Box Random Skin\t{FFFFFF}%d\n{FFFFFF}Random Car Gold \t{FFFFFF}%d\n{FFFFFF}Random Car Silver\t{eeba24}%d\nTicket Than Bi\t{FFFFFF}%d\n{FFFFFF}Voucher Cao Cap\t{20F5F1}%d", PlayerInfo[playerid][pCrates][0], PlayerInfo[playerid][pCrates][1], PlayerInfo[playerid][pCrates][2], PlayerInfo[playerid][pCrates][3], PlayerInfo[playerid][pCrates][4]);
// 	Dialog_Show(playerid, DIALOG_CRATES, DIALOG_STYLE_TABLIST_HEADERS, "Crate Cua Ban", string, "Chon", "Huy Bo");
// 	SelectTextDraw(playerid, 0xCA3ADBFF);
// 	return 1;
// }
CMD:moruong(playerid ,params[]) {
	if(CheckMoGuong[playerid] == 1) return SendClientMessage(playerid, COLOR_YELLOW, "Ban khong the mo guong");
	if(total_skins(playerid) ==  10) return SendClientMessage(playerid, COLOR_GREY, "Ban da co max skin khong the mo hom nua hay xoa bot");
    DeletePVar(playerid, "VoucherType");
	ShowMoGuongTD(playerid);
	CheckMoGuong[playerid] = 1;
	return 1;
}
CMD:givecrate(playerid, params[]) {
	new id;
	if(PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, COLOR_ERROR, "LOI: {FFFFFF}Ban khong co quyen su dung lenh nay.");
	if(sscanf(params, "u", id)) return SendClientMessage(playerid, COLOR_ERROR, "Usage: {FFFFFF}/givecrate <playerid/name>");
	if(!IsPlayerConnected(id)) return SendClientMessage(playerid, COLOR_WHITE, "KHONG HOP LE");
	SetPVarInt(playerid, "id", id);
	new string[128];
	for(new i = 0; i < sizeof(CrateName); i++) format(string, sizeof(string), "%s{%s}%s crate\n", string, CrateColors[i], CrateName[i]);
	Dialog_Show(playerid, DIALOG_GIVECRATES, DIALOG_STYLE_LIST, "Give crates", string, "Chon", "Huy Bo");
	return 1;
}
function totalcrates(playerid) {
	new x; 
	x = PlayerInfo[playerid][pCrates][0] + PlayerInfo[playerid][pCrates][1] + PlayerInfo[playerid][pCrates][2] + PlayerInfo[playerid][pCrates][3] + PlayerInfo[playerid][pCrates][4];
	return x;
}
function ShowCrates(playerid) {
	new string[64];
	PlayerTextDrawSetPreviewModel(playerid, CratePTD[0], 18631);
	format(string, sizeof(string), "Ban co %d hop qua.", totalcrates(playerid));
	PlayerTextDrawSetString(playerid, CratePTD[1], string);
	for(new i = 0; i < 8; i++) TextDrawShowForPlayer(playerid, CrateTD[i]);
	PlayerTextDrawShow(playerid, CratePTD[1]);
	PlayerTextDrawShow(playerid, CratePTD[0]);
	SelectTextDraw(playerid, 0xCA3ADBFF);
	IsCrates[playerid] = 1;
	return true;
}
function startcrates(playerid) {
	TatMoGuong(playerid);
	save_crates(playerid);
	for(new l = 0; l < 7; l++) TextDrawShowForPlayer(playerid, CrateTD[l]);

	// opencrates(playerid);
	ShowCrates(playerid);
	PlayerTextDrawShow(playerid, CratePTD[1]);
	// TimerCratesEx[playerid] = SetTimerEx("opencrates", 500, true, "d", playerid);
	return true;
}
stock LoadSkins(crates, & skin) {
    switch (crates) {
        case 0:{
            new rand = random(132);//skin hiem va sieu hiem
            switch (rand) {
                case 0..10:
                    skin = 170;
                case 11..20:
                    skin = 188;
                case 21..30:
                    skin = 249;
                case 31..40:
                    skin = 159;
                case 41..50:
                    skin = 260;
                case 51..60:
                    skin = 248;
                case 61..70:
                    skin = 264;
                case 71..80:
                    skin = 185;
                case 81..90:
                    skin = 289;
                case 91..100:
                    skin = 249;
                case 101..110:
                    skin = 14;
                case 111..120:
                    skin = 32;
                case 121..130:
                    skin = 56;
                case 131..132:
                skin = 111;
            }
        }
        case 1:{
            new rand = random(6);
            switch (rand) {
                case 0:
                    skin = 0;
                case 1:
                    skin = 164;
                case 2:
                    skin = 242;
                case 3:
                    skin = 241;
                case 4:
                    skin = 212;
                case 5:
                    skin = 83;
                case 6:
                    skin = 111;
            }
        }
        case 2:{
            new rand = random(45);//skin hiem va sieu hiem
            switch (rand) {
                case 0..10:
                    skin = 0;
                case 11..20:
                    skin = 241;
                case 21..30:
                    skin = 242;
                case 31..40:
                    skin = 34;
                case 41..45:
                    skin = 212;

            }
        }
        // case 2:{
        //     new rand = random(9);
        //     switch (rand) {
        //         case 0:
        //             skin = 0;
        //         case 1:
        //             skin = 104;
        //         case 2:
        //             skin = 116;
        //         case 3:
        //             skin = 164;
        //         case 4:
        //             skin = 149;
        //         case 5:
        //             skin = 306;
        //         case 6:
        //             skin = 293;
        //         case 7:
        //             skin = 285;
        //         case 8:
        //             skin = 289;
        //         case 9:
        //             skin = 294;
        //     }
        // }
        // case 3:{
        //     new rand = random(5);
        //     switch (rand) {
        //         case 0:
        //             skin = 93;
        //         case 1:
        //             skin = 108;
        //         case 2:
        //             skin = 171;
        //         case 3:
        //             skin = 177;
        //         case 4:
        //             skin = 217;
        //         case 5:
        //             skin = 271;
        //     }
        // }
    }
    return true;
}
save_crates(playerid) {
	new query[128];
	mysql_format(SQL, query, sizeof(query), "UPDATE `users` SET `Crates`='%d|%d|%d|%d|%d|%d|%d|%d|%d' WHERE `id`='%d'", PlayerInfo[playerid][pCrates][0],PlayerInfo[playerid][pCrates][1],PlayerInfo[playerid][pCrates][2],PlayerInfo[playerid][pCrates][3], PlayerInfo[playerid][pCrates][4], PlayerInfo[playerid][pCrates][5], PlayerInfo[playerid][pCrates][6], PlayerInfo[playerid][pCrates][7], PlayerInfo[playerid][pCrates][8], PlayerInfo[playerid][pSQLID]);
	mysql_tquery(SQL, query,  "", "" );
}

CMD:addstock(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, COLOR_LGREEN, AdminOnly);
	new type, value;
	if(sscanf(params, "ii", type, value)) {
		SendClientMessage(playerid, COLOR_GREY, "Syntax: {FFFFFF}/addstock <type> <value>");
		SendClientMessage(playerid, COLOR_WHITE, "(0) Ruong Phuong Tien ");
		return true;
	}
	if(type > 0) return SendClientMessage(playerid, COLOR_LGREEN, "Khong Hop Le.");
	new string[128];
	StockCarCrate = value;
	switch(type) {
		case 0: {
			new labeles[250];
			format(labeles, sizeof(labeles), "{597F9C}(Stock: %d)\n{20F5F1}Ruong Phuong Tien{FFFFFF}\nSu Dung {20F5F1}/buycrate{FFFFFF} De Mua Crate\n{FFFFFF}Gia Cua Crate: {20F5F1}100.000.000 SAD {FFFFFF} / {20F5F1}1000 Vip Xu", StockCarCrate);
			UpdateDynamic3DTextLabelText(LabelCrates, -1, labeles);
			format(string, sizeof(string), "Admin %s da nhap them %d hop xe.", GetName(playerid), StockCarCrate);
		}
	}
	SendAdminMessage(COLOR_YELLOW, string, 6);
	return 1;
}
hook OnGameModeExit() { //save stock
	mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `stuff` SET `StockCarCrate`='%d' WHERE `ID`='1'", StockCarCrate);
	mysql_query(SQL, gQuery, false);
}
Dialog:DIALOG_GIVECRATES(playerid, response, listitem, inputtext[]) {
    if(!response) return true;
    new id = GetPVarInt(playerid, "id");
    if(!IsPlayerConnected(id))
        return true;
    new string[100];
    format(string, 100, "(/givecrate) {FFFFFF}%s Da dua cho %s %s crate.", GetName(playerid), GetName(id), CrateName[listitem]);
    SendAdminMessage(COLOR_RED, string, 6);
    format(string, 100, "Admin {FF0000}%s{FFFFFF} Da cho ban %s.", GetName(playerid), CrateName[listitem]);
    SendClientMessage(id, COLOR_WHITE, string);
    PlayerInfo[id][pCrates][listitem] += 1;
    save_crates(id);
    return 1;
}
Dialog:DIALOG_BUYCRATES(playerid, response, listitem, inputtext[]) {
    if(!response) 
        return 1;
    new string[120];
    format(string, sizeof(string), "Thanh Toan\tGia Tien\nMoney\t{E26AF2}%d\nVip Xu\t{EEEE3F}%d", CratePrice[AlegeCrates[playerid]][0], CratePrice[AlegeCrates[playerid]][1]);
    Dialog_Show(playerid, DIALOG_BUYCRATES1, DIALOG_STYLE_TABLIST_HEADERS, "Mua Crate", string, "Co", "Khong");
    return 1;
}
Dialog:DIALOG_BUYCRATES1(playerid, response, listitem, inputtext[]) {
    if(!response) return true;
    new x = AlegeCrates[playerid];
    new string[256];
    switch(listitem) {
        case 0: {
            if(GetPlayerCash(playerid) < CratePrice[x][0]) return SendClientMessage(playerid, -1, "Ban khong du Tien");
            GivePlayerMoney(playerid, -CratePrice[x][0]);
            format(string, sizeof(string), "(Crate Systems){FFFFFF} Ban da mua (%s) Voi Gia {E26AF2}%d Money{FFFFFF}! Tong Crate Thuong: %d [%d Tong Cong]", CrateName[x], CratePrice[x][0], PlayerInfo[playerid][pCrates][x]+1, totalcrates(playerid)+1);
        }
        case 1: {
            if(PlayerInfo[playerid][pPremiumPoints] < CratePrice[x][1]) return SendClientMessage(playerid, -1, "Ban khong du VIP XU.");
            PlayerInfo[playerid][pPremiumPoints] -= CratePrice[x][1];
            format(string, sizeof(string), "(Crate Systems){FFFFFF} Ban da mua (%s) Voi Gia {EEEE3F}%d VIP XU{FFFFFF}! Tong Crate Thuong: %d [%d Tong Cong]", CrateName[x], CratePrice[x][1], PlayerInfo[playerid][pCrates][x]+1, totalcrates(playerid)+1);		
            Update(playerid, pPremiumPointsx);
        }
    }		
    SendClientMessage(playerid, 0xD8AADCFF, string);
    if(x == 4) {
        StockCarCrate --;
        format(string, sizeof(string), "{597F9C}(Stock: %d)\n{20F5F1}Hop Qua Xe{FFFFFF}\nSu Dung {20F5F1}/buycrate{FFFFFF} de mua hop qua\n{FFFFFF}Gia Hop Qua: {20F5F1}7000 Money {FFFFFF} / {20F5F1}700 Vip Xu", StockCarCrate);
        UpdateDynamic3DTextLabelText(LabelCrates, -1, string);	
    }	
    SendClientMessage(playerid, -1, "Cam On Ban Da Mua Hang, Su Dung /opencrate De Mo Hop Qua.");
    PlayerInfo[playerid][pCrates][x] ++;
    save_crates(playerid);
    return 1;
}

