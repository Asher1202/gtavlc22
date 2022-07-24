#include <YSI_Coding\y_hooks>

#define MAX_CRATES 		5
new IsCrates[MAX_PLAYERS], CrateModel[MAX_PLAYERS], PlayerText: CratePTD[2], Text: CrateTD[6], CrateTime[MAX_PLAYERS], AlegeCrates[MAX_PLAYERS], Text3D: LabelCrates;
new CrateName[5][30] = {
	{"Hop Qua Thuong"},
	{"Hop Qua Hiem"}, 
	{"Hop Qua Rat Hiem"}, 
	{"Hop Qua GTAVLC"}, 
	{"Sieu Xe"}
};
new CratePrice[][] = {
	{5000000, 50},
	{10000000, 100},
	{20000000, 200},
	{50000000, 500},
	{100000000, 1000}
};

new CrateColors[5][10] = {
	{"F09E05"}, 
	{"F09E05"},
	{"F09E05"},
	{"e52222"},
	{"7556ff"}
};

new StockCarCrate;
new TimerCratesEx[MAX_PLAYERS];

hook OnGameModeInit() {
	Create3DTextLabel("{e52222}Hop Qua GTAVLC{FFFFFF}\nSu Dung {e52222}/buycrate{FFFFFF} De Mua Crate\n{FFFFFF}Gia Hop Qua: {e52222}50.000.000  SAD {FFFFFF} / {e52222}500 VIP XU",0xFFFFFFFF,1986.7395,-2183.5996,13.5469,25.0, 0, 1);
	Create3DTextLabel("{eeba24}Hop Qua Sieu Hiem{FFFFFF}\nSu Dung {eeba24}/buycrate{FFFFFF} De Mua Crate\n{FFFFFF}Gia Hop Qua: {eeba24}20.000.000  SAD {FFFFFF} / {eeba24}200 VIP XU",0xFFFFFFFF,1984.8501,-2181.1921,13.5469,25.0, 0, 1);
	Create3DTextLabel("{610F7D}Hop Qua Hiem{FFFFFF}\nSu Dung {610F7D}/buycrate{FFFFFF} De Mua Crate\n{FFFFFF}Gia Hop Qua: {610F7D}10.000.000  SAD {FFFFFF} / {610F7D}100 VIP XU",0xFFFFFFFF,1980.0298,-2181.1948,13.5469,25.0, 0, 1);
	Create3DTextLabel("{045AB6}Hop Qua Thuong{FFFFFF}\nSu Dung {045AB6}/buycrate{FFFFFF} De Mua Crate\n{FFFFFF}Gia Hop Qua: {045AB6}5.000.000  SAD {FFFFFF} / {045AB6}50 VIP XU",0xFFFFFFFF,1974.7478,-2181.4993,13.5469,25.0, 0, 1);    

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
hook OnPlayerClickTextDraw(playerid, Text:clickedid) {
	if(clickedid == CrateTD[2]) {
		if(totalcrates(playerid) < 1) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong co crate.");
	    if(CrateModel[playerid] >= 0) return true;
		for(new j = 0; j < 6; j++) TextDrawHideForPlayer(playerid, CrateTD[j]);
		for(new j = 0; j < 2; j++) PlayerTextDrawHide(playerid, CratePTD[j]);
		format(string, sizeof(string), "Crates Type\tAmount\n{FFFFFF}Hop Qua Thuong\t{FFFFFF}%d\n{FFFFFF}Hop qua Hiem \t{FFFFFF}%d\n{FFFFFF}Hop Qua Rat Hiem\t{eeba24}%d\nHop Qua GTAVLC\t{FFFFFF}%d\n{FFFFFF}Hop Qua Sieu Xe\t{20F5F1}%d", PlayerInfo[playerid][pCrates][0], PlayerInfo[playerid][pCrates][1], PlayerInfo[playerid][pCrates][2], PlayerInfo[playerid][pCrates][3], PlayerInfo[playerid][pCrates][4]);
		Dialog_Show(playerid, DIALOG_CRATES, DIALOG_STYLE_TABLIST_HEADERS, "Crate Cua Ban", string, "Chon", "Huy Bo");
		return ~0;
	}
	else if(clickedid == CrateTD[1]) {
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
    }        
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
    CrateModel[playerid] = -1;    
}
// CMD:crateforall(playerid, params[]) {
// 	if(PlayerInfo[playerid][pAdmin] < 6)
// 		return SendClientMessage(playerid, COLOR_LGREEN, AdminOnly);

// 	new type, value;
// 	if(sscanf(params, "ii", type, value)) {
// 		SendClientMessage(playerid, COLOR_GREY, "Syntax: {FFFFFF}/crateforall [crate type] [value]");
// 		SendClientMessage(playerid, COLOR_WHITE, "Rare (0) | Epic (1) | Legendary (2) | Transcendent (3) | Vehicle (4)");
// 		return true;
// 	}

// 	foreach(new i: Player) PlayerInfo[i][pCrates][type] += value, save_crates(i);

// 	new string[500];
// 	format(string, 75, "Admin %s a dat %d crate %s.", GetName(playerid), value, CrateName[type]);
// 	SCMTA(COLOR_YELLOW, string);
// 	return 1;
// }
// CMD:buycrate(playerid, params[]) {
// 	new x;
// 	if(PlayerToPoint(3, playerid, 1974.7478,-2181.4993,13.5469)) x = 0;
// 	else if(PlayerToPoint(3, playerid, 1980.0298,-2181.1948,13.5469)) x = 1;
// 	else if(PlayerToPoint(3, playerid, 1984.8501,-2181.1921,13.5469)) x = 2;
// 	else if(PlayerToPoint(3, playerid, 1986.7395,-2183.5996,13.5469)) x = 3;
// 	else if(PlayerToPoint(3, playerid, 1986.5114,-2187.9370,13.5469)) x = 4;
// 	else return SendClientMessage(playerid, COLOR_ERROR, "You're not at the box stand");
// 	AlegeCrates[playerid] = x;
// 	new string[500];
// 	format(string, sizeof(string), "{A0C4D3}Ban co chac chan muon mua %s?\nNo Co Gia La {1A79A2}(%d SAD / %d Vip Xu){A0C4D3}.", CrateName[x], CratePrice[x][0], CratePrice[x][1]);
// 	Dialog_Show(playerid, DIALOG_BUYCRATES, DIALOG_STYLE_MSGBOX, "Buy Crate", string, "Co", "Khong");
// 	return 1;
// }
// CMD:opencrate(playerid, params[]) {
// 	if(IsCrates[playerid] == 1) return true;
// 	if(CrateTime[playerid] > 0) return true;
// 	ShowCrates(playerid);
// 	return 1;
// }
// CMD:crates(playerid ,params[]) {
// 	new string[235];
// 	if(CrateModel[playerid] >= 0) return true;
// 	for(new j = 0; j < 6; j++) TextDrawHideForPlayer(playerid, CrateTD[j]);
// 	for(new j = 0; j < 2; j++) PlayerTextDrawHide(playerid, CratePTD[j]);
// 	format(string, sizeof(string), "Crates Type\tAmount\n{FFFFFF}Hop Qua Thuong\t{FFFFFF}%d\n{FFFFFF}Hop qua Hiem \t{FFFFFF}%d\n{FFFFFF}Hop Qua Rat Hiem\t{eeba24}%d\nHop Qua GTAVLC\t{FFFFFF}%d\n{FFFFFF}Hop Qua Sieu Xe\t{20F5F1}%d", PlayerInfo[playerid][pCrates][0], PlayerInfo[playerid][pCrates][1], PlayerInfo[playerid][pCrates][2], PlayerInfo[playerid][pCrates][3], PlayerInfo[playerid][pCrates][4]);
// 	Dialog_Show(playerid, DIALOG_CRATES, DIALOG_STYLE_TABLIST_HEADERS, "Crate Cua Ban", string, "Chon", "Huy Bo");
// 	SelectTextDraw(playerid, 0xCA3ADBFF);
// 	return 1;
// }
// CMD:givecrate(playerid, params[]) {
// 	new id;
// 	if(PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, COLOR_ERROR, "LOI: {FFFFFF}Ban khong co quyen su dung lenh nay.");
// 	if(sscanf(params, "u", id)) return SendClientMessage(playerid, COLOR_ERROR, "Usage: {FFFFFF}/givecrate <playerid/name>");
// 	if(!IsPlayerConnected(id)) return SendClientMessage(playerid, COLOR_WHITE, "KHONG HOP LE");
// 	SetPVarInt(playerid, "id", id);
// 	new string[128];
// 	for(new i = 0; i < sizeof(CrateName); i++) format(string, sizeof(string), "%s{%s}%s crate\n", string, CrateColors[i], CrateName[i]);
// 	Dialog_Show(playerid, DIALOG_GIVECRATES, DIALOG_STYLE_LIST, "Give crates", string, "Chon", "Huy Bo");
// 	return 1;
// }
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
	for(new i = 0; i < 6; i++) TextDrawShowForPlayer(playerid, CrateTD[i]);
	PlayerTextDrawShow(playerid, CratePTD[1]);
	PlayerTextDrawShow(playerid, CratePTD[0]);
	SelectTextDraw(playerid, 0xCA3ADBFF);
	IsCrates[playerid] = 1;
	return true;
}
function startcrates(playerid) {
	for(new l = 0; l < 6; l++) TextDrawShowForPlayer(playerid, CrateTD[l]);
	opencrates(playerid);
	PlayerTextDrawShow(playerid, CratePTD[1]);
	TimerCratesEx[playerid] = SetTimerEx("opencrates", 500, true, "d", playerid);
	return true;
}
function opencrates(i) {
	new string[500];
	CrateTime[i] --;
	new amount, rand = random(100), x = !CrateModel[i] ? 0 : CrateModel[i]-1;
	if(CrateModel[i] != 5) {
		switch(rand) {
	    	case 0..10: {
	    		LoadSkins(x, amount);
	            format(string, 70, "skin %d (%s)~n~~w~~h~Ban co %d crates.", amount, CrateName[x], totalcrates(i));
	            PlayerTextDrawSetPreviewModel(i, CratePTD[0], amount);
	            PlayerTextDrawSetString(i, CratePTD[1], string);
				PlayerTextDrawShow(i, CratePTD[0]);
	            if(CrateTime[i] == 0) {
			    	if(CrateModel[i] <= 0) { 
			    		format(string, 100,"%s, Mo hop kiem tra va duoc skin %d (%s).", GetName(i), amount, CrateName[x]);
			    		SendClientMessage(i, COLOR_WHITE, string);
	            	} else {
	            		if(total_skins(i) == 10) {
	            		    PlayerInfo[i][pCrates][x] ++;
	            		    save_crates(i);
	            		    SendClientMessage(i, COLOR_LGREEN, "Ban nhan duoc skin, Nhung ban da so huu qua 10 skins ban se duoc lay sau!");
	            	    } else {
							format(string, 120,"(( {%s}%s Crate {A9C4E4}- %s mo hop va nhan duoc skin %d [%s]. ))", CrateColors[x], CrateName[x], GetName(i), amount, CrateName[x]);
						    SCMTA(COLOR_CLIENT, string);  
						    give_skin(i, amount);
						}	
	            	}
	            	KillTimer(TimerCratesEx[i]);
	                CrateModel[i] = -1;
	            }
			}
		    case 11..30: {
			    amount = random(5) + x * 4;
			    new nxtlevel = PlayerInfo[i][pLevel], expamount;
				expamount = nxtlevel*levelexp;
	            format(string, 75, "~y~%s Kinh Nghiem~n~~w~~h~Ban co %d crates.", FormatNumber(amount), totalcrates(i));
				PlayerTextDrawSetPreviewModel(i, CratePTD[0], 1275);
				PlayerTextDrawSetString(i, CratePTD[1], string);
				PlayerTextDrawShow(i, CratePTD[0]);
	            if(CrateTime[i] == 0) {
			        if(CrateModel[i] <= 0) {
					    format(string, 120,"%s, Da mo hop free va duoc %d Kinh Nghiem.", GetName(i),amount);
					    SendClientMessage(i, COLOR_WHITE, string);
					} else {
						format(string, 120,"(( {%s}%s Crate {A9C4E4}- %s mo hop va nhan duoc %d Kinh Nghiem. ))", CrateColors[x], CrateName[x], GetName(i),amount, CrateName[x]);
					    SCMTA(COLOR_CLIENT, string); 
					    PlayerInfo[i][pExp] += amount;
					    Update(i, pRP);
					}
			        KillTimer(TimerCratesEx[i]);
			        CrateModel[i] = -1;
			    }
	        }
	       	case 31..40: {
			    amount = random(10) + x * 20;
	            format(string, 75, "~y~%s Vip Xu~n~~w~~h~Ban co %d crates.", FormatNumber(amount), totalcrates(i));
				PlayerTextDrawSetPreviewModel(i, CratePTD[0], 1275);
				PlayerTextDrawSetString(i, CratePTD[1], string);
				PlayerTextDrawShow(i, CratePTD[0]);
	            if(CrateTime[i] == 0) {
			        if(CrateModel[i] <= 0) {
					    format(string, 120,"%s, Da mo hop free va duoc %d Vip Xu.", GetName(i),amount);
					    SendClientMessage(i, COLOR_WHITE, string);
					} else {
						format(string, 120,"(( {%s}%s Crate {A9C4E4}- %s mo hop va nhan duoc %d Vip Xu. ))", CrateColors[x], CrateName[x], GetName(i),amount);
					    SCMTA(COLOR_CLIENT, string); 
					    PlayerInfo[i][pPremiumPoints] += amount;
					    Update(i, pPremiumPointsx);
					}
			        KillTimer(TimerCratesEx[i]);
			        CrateModel[i] = -1;
			    }
	        }
	        default: {
	            amount = random(2000000) + x * 2000000;
	            format(string, 65, "~g~%s~n~~w~~h~Ban co %d crates.", FormatNumber(amount), totalcrates(i));
				PlayerTextDrawSetPreviewModel(i, CratePTD[0], 1274);
				PlayerTextDrawSetString(i, CratePTD[1], string);
				PlayerTextDrawShow(i, CratePTD[0]);
	            if(CrateTime[i] == 0) {
			        if(CrateModel[i] <= 0) {
					    format(string, 120,"%s, Da mo hop free va duoc $%s.", GetName(i), FormatNumber(amount));
					    SendClientMessage(i, COLOR_WHITE, string);
					} else {
						format(string, 120,"(( {%s}%s Crate {A9C4E4}- %s mo hop va nhan duoc {50DB6F}$%s{A9C4E4}. ))", CrateColors[x], CrateName[x], GetName(i), FormatNumber(amount));
					    SCMTA(COLOR_CLIENT, string); 
					    GivePlayerCash(i, amount);
					}
				    KillTimer(TimerCratesEx[i]);
				    CrateModel[i] = -1;
		        }
	        }
	    }
	} else {
		switch(rand) {
   			case 0..5: {
    		    amount = RandomEx(30, 250);
                format(string, 65, "Super GT~n~~w~~h~Ban co %d crates.", totalcrates(i));
				PlayerTextDrawSetPreviewModel(i, CratePTD[0], 506);
				PlayerTextDrawSetString(i, CratePTD[1], string);
				PlayerTextDrawShow(i, CratePTD[0]);
                if(CrateTime[i] <= 0) {
					if(GetSlots(i) == GetVehicles(i)) { PlayerInfo[i][pCrates][4] ++; save_crates(i); SendClientMessage(i, COLOR_LIGHTGREEN, "Ban khong con slot trong");  CrateModel[i] = -1; KillTimer(TimerCratesEx[i]); return 1; }
					else {
						KillTimer(TimerCratesEx[i]);
						CrateModel[i] = -1;
						GiveVehicle(i, 506);
					    format(string, 120, "(( {7556ff}Vehicle Crate {A9C4E4}- %s mo hop va nhan duoc Super GT. ))", GetName(i));
					    SCMTA(COLOR_CLIENT, string);
				    }
				}
			}
    	    case 6..33: {
    		    amount = random(20) + 20;
                format(string, 64, "Picador~n~~w~~h~Ban co %d crates.", totalcrates(i));
				PlayerTextDrawSetPreviewModel(i, CratePTD[0], 600);
				PlayerTextDrawSetString(i, CratePTD[1], string);
				PlayerTextDrawShow(i, CratePTD[0]);
                if(CrateTime[i] == 0) {
					if(GetSlots(i) == GetVehicles(i)) { PlayerInfo[i][pCrates][4] ++; save_crates(i); SendClientMessage(i, COLOR_LIGHTGREEN, "Ban khong con slot trong");  CrateModel[i] = -1; KillTimer(TimerCratesEx[i]); return 1; }
					else {
						KillTimer(TimerCratesEx[i]);
						CrateModel[i] = -1;
						GiveVehicle(i, 600);
					    format(string, 120,"(( {7556ff}Vehicle Crate {A9C4E4}- %s mo hop va nhan duoc Picador. ))", GetName(i));
					    SCMTA(COLOR_CLIENT,string);
				    }
				}
            }
            case 34..40: {
                format(string, 65, "Freeway~n~~w~~h~Ban co %d crates.", totalcrates(i));
                PlayerTextDrawSetPreviewModel(i, CratePTD[0], 463);
                PlayerTextDrawSetString(i, CratePTD[1], string);
				PlayerTextDrawShow(i, CratePTD[0]);
            	if(CrateTime[i] <= 0) {
					if(GetSlots(i) == GetVehicles(i)) { PlayerInfo[i][pCrates][4] ++; save_crates(i); SendClientMessage(i, COLOR_LIGHTGREEN, "Ban khong con slot trong");  CrateModel[i] = -1; KillTimer(TimerCratesEx[i]); return true; }
					else {
						KillTimer(TimerCratesEx[i]);
						CrateModel[i] = -1;
						GiveVehicle(i, 463);
					    format(string, 120,"(( {7556ff}Vehicle Crate {A9C4E4}- %s mo hop va nhan duoc Freeway. ))", GetName(i));
					    SCMTA(COLOR_CLIENT, string);
				    }
				}
            }
           	case 41..46: {
                format(string, 65, "Stallion (MUI TRAN)~n~~w~~h~Ban co %d crates.", totalcrates(i));
                PlayerTextDrawSetPreviewModel(i, CratePTD[0], 439);
                PlayerTextDrawSetString(i, CratePTD[1], string);
				PlayerTextDrawShow(i, CratePTD[0]);
            	if(CrateTime[i] <= 0) {
					if(GetSlots(i) == GetVehicles(i)) { PlayerInfo[i][pCrates][4] ++; save_crates(i); SendClientMessage(i, COLOR_LIGHTGREEN, "Ban khong con slot trong");  CrateModel[i] = -1; KillTimer(TimerCratesEx[i]); return true; }
					else {
						KillTimer(TimerCratesEx[i]);
						CrateModel[i] = -1;
						GiveVehicle(i, 439);
					    format(string, 120,"(( {7556ff}Vehicle Crate {A9C4E4}- %s mo hop va nhan duoc Stallion (MUI TRAN). ))", GetName(i));
					    SCMTA(COLOR_CLIENT,string);
				    }
				}
            }
           	case 47..53: {
                format(string, 65, "Solair~n~~w~~h~Ban co %d crates.", totalcrates(i));
				PlayerTextDrawSetPreviewModel(i, CratePTD[0], 458);
				PlayerTextDrawSetString(i, CratePTD[1], string);
				PlayerTextDrawShow(i, CratePTD[0]);
            	if(CrateTime[i] <= 0) {
					if(GetSlots(i) == GetVehicles(i)) { PlayerInfo[i][pCrates][4] ++; save_crates(i); SendClientMessage(i, COLOR_LIGHTGREEN, "Ban khong con slot trong");  CrateModel[i] = -1; KillTimer(TimerCratesEx[i]); return true; }
					else {
						KillTimer(TimerCratesEx[i]);
						CrateModel[i] = -1;
						GiveVehicle(i, 458);
					    format(string, 120,"(( {7556ff}Vehicle Crate {A9C4E4}- %s mo hop va nhan duoc Solair. ))", GetName(i));
					    SCMTA(COLOR_CLIENT, string);
				    }
				}
            }
           	case 54..66: {
                format(string, 65, "Faggio~n~~w~~h~Ban co %d crates.", totalcrates(i));
				PlayerTextDrawSetPreviewModel(i, CratePTD[0], 462);
				PlayerTextDrawSetString(i, CratePTD[1], string);
				PlayerTextDrawShow(i, CratePTD[0]);
            	if(CrateTime[i] <= 0) {
					if(GetSlots(i) == GetVehicles(i)) { PlayerInfo[i][pCrates][4] ++; save_crates(i); SendClientMessage(i, COLOR_LIGHTGREEN, "Ban khong con slot trong");  CrateModel[i] = -1; KillTimer(TimerCratesEx[i]); return true; }
					else {
						KillTimer(TimerCratesEx[i]);
						CrateModel[i] = -1;
						GiveVehicle(i, 462);
					    format(string, 120,"(( {7556ff}Vehicle Crate {A9C4E4}- %s mo hop va nhan duoc Faggio.))", GetName(i));
					    SCMTA(COLOR_CLIENT, string);
				    }
				}
            }
            default: {
                format(string, 65, "Savanna~n~~w~~h~Ban co %d crates.", totalcrates(i));
				PlayerTextDrawSetPreviewModel(i, CratePTD[0], 567);
				PlayerTextDrawSetString(i, CratePTD[1], string);
				PlayerTextDrawShow(i, CratePTD[0]);
            	if(CrateTime[i] <= 0) {
					if(GetSlots(i) == GetVehicles(i)) { PlayerInfo[i][pCrates][4] ++; save_crates(i); SendClientMessage(i, COLOR_LIGHTGREEN, "Ban khong con slot trong");  CrateModel[i] = -1; KillTimer(TimerCratesEx[i]); return true; }
					else {
						KillTimer(TimerCratesEx[i]);
						CrateModel[i] = -1;
						GiveVehicle(i, 567);
					    format(string, 120,"(( {7556ff}Vehicle Crate {A9C4E4}- %s mo hop va nhan duoc Savanna. ))", GetName(i));
					    SCMTA(COLOR_CLIENT, string);
				    }
				}
            }
		}
    }
	return 1;
}
save_crates(playerid) {
	new query[128];
	mysql_format(SQL, query, sizeof(query), "UPDATE `users` SET `Crates`='%d|%d|%d|%d|%d' WHERE `id`='%d'", PlayerInfo[playerid][pCrates][0],PlayerInfo[playerid][pCrates][1],PlayerInfo[playerid][pCrates][2],PlayerInfo[playerid][pCrates][3], PlayerInfo[playerid][pCrates][4], PlayerInfo[playerid][pSQLID]);
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

    format(string, 100, "(/givecrate) {FFFFFF}%s Da dua cho %s %s crate.", GetName(playerid), GetName(id), CrateName[listitem]);
    SendAdminMessage(COLOR_RED, string, 6);
    format(string, 100, "Admin {FF0000}%s{FFFFFF} Da cho ban %s.", GetName(playerid), CrateName[listitem]);
    SendClientMessage(id, COLOR_WHITE, string);
    PlayerInfo[id][pCrates][listitem] ++;
    save_crates(id);
    return 1;
}
Dialog:DIALOG_CRATES(playerid, response, listitem, inputtext[]) {
    if(!response) return ShowCrates(playerid);
    if(PlayerInfo[playerid][pCrates][listitem] < 1) return SendClientMessage(playerid, COLOR_LGREEN, "Loi: Ban khong co hop qua nay!"), ShowCrates(playerid);
    format(string, 75, "Ban dang mo hop qua {%s}%s{FFFFFF}! Hay doi...", CrateColors[listitem], CrateName[listitem]);
    SendClientMessage(playerid, COLOR_WHITE, string);
    PlayerInfo[playerid][pCrates][listitem] --;
    save_crates(playerid);
    CrateTime[playerid] = 20;
    CrateModel[playerid] = listitem+1;
    startcrates(playerid);
    return 1;
}
Dialog:DIALOG_BUYCRATES(playerid, response, listitem, inputtext[]) {
    if(!response) 
        return 1;

    format(string, sizeof(string), "Thanh Toan\tGia Tien\nMoney\t{E26AF2}%d\nVip Xu\t{EEEE3F}%d", CratePrice[AlegeCrates[playerid]][0], CratePrice[AlegeCrates[playerid]][1]);
    Dialog_Show(playerid, DIALOG_BUYCRATES1, DIALOG_STYLE_TABLIST_HEADERS, "Mua Crate", string, "Co", "Khong");
    return 1;
}
Dialog:DIALOG_BUYCRATES1(playerid, response, listitem, inputtext[]) {
    if(!response) return true;
    new x = AlegeCrates[playerid];
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

