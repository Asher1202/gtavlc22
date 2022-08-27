#include <battlepass/bp_textdraw>
#include <battlepass/bp_impl>

#include <YSI_Coding\y_hooks>

hook OnPlayerConnect(playerid) {
    Bp_LoadPlayerTextDraw(playerid);
}

hook OnGameModeInit() {
    Bp_LoadTextDraw();
}
CMD:ghepxe(playerid, params[]) {
    new szDialog[200];
    format(szDialog, sizeof szDialog,"Manh\tSoLuong\nManh Xe Trung Cap\t%d/2\nManh Xe Cao Cap\t%d/4",PlayerInfo[playerid][pManhXeTC],PlayerInfo[playerid][pManhXeCC]);
    Dialog_Show(playerid,DIALOG_GHEPXE,DIALOG_STYLE_TABLIST_HEADERS,"Ghep Xe",szDialog,"Ok","Exit");
    return true;
}
Dialog:DIALOG_GHEPXE(playerid, response, listitem, inputtext[]) {
    if(!response) return true;
    switch(listitem) {
        case 0: {
            if(PlayerInfo[playerid][pManhXeTC] < 2) return SendClientMessage(playerid,COLOR_GREY,"Ban khong du manh");
            if(GetSlots(playerid) <= GetVehicles(playerid)) return SendClientMessage(playerid, -1, "Ban da het slot xe! Hay mua mot slot tai /shop.");
			new temp[100], strings[4000], vehname[50];
			strcat(strings, "Model\n");
			foreach(new id: Cars<1>) {
				if(D_Vehicles[id][dLevel] > 0) format(vehname, sizeof(vehname), "%s "GREY_70"[Level %d]"WHITE"", aVehicleNames[D_Vehicles[id][dModel]-400], D_Vehicles[id][dLevel]);
				else format(vehname, sizeof(vehname), "%s", aVehicleNames[D_Vehicles[id][dModel]-400]);

				format(temp, sizeof(temp), "%s\n", vehname);
				strcat(strings, temp);
			}	
			Dialog_Show(playerid, DIALOG_GHEPXE2, DIALOG_STYLE_TABLIST_HEADERS, "Product List", strings, "Nhan Xe", "Tro ve"); 
        }
        case 1: {
            if(PlayerInfo[playerid][pManhXeCC] < 4) return SendClientMessage(playerid,COLOR_GREY,"Ban khong du manh");
            if(GetSlots(playerid) <= GetVehicles(playerid)) return SendClientMessage(playerid, -1, "Ban da het slot xe! Hay mua mot slot tai /shop.");
			new temp[100], strings[4000], vehname[50];
			strcat(strings, "Model\n");
			foreach(new id: Cars<2>) {
				if(D_Vehicles[id][dLevel] > 0) format(vehname, sizeof(vehname), "%s "GREY_70"[Level %d]"WHITE"", aVehicleNames[D_Vehicles[id][dModel]-400], D_Vehicles[id][dLevel]);
				else format(vehname, sizeof(vehname), "%s", aVehicleNames[D_Vehicles[id][dModel]-400]);

				format(temp, sizeof(temp), "%s\n", vehname);
				strcat(strings, temp);
			}	
			Dialog_Show(playerid, DIALOG_GHEPXE3, DIALOG_STYLE_TABLIST_HEADERS, "Product List", strings, "Nhan Xe", "Tro ve"); 
        }
    }
    return true;
}
Dialog:DIALOG_GHEPXE2(playerid,response,listitem,inputtext[]) {
	if(!response) return true;
	new id = Iter_Index(Cars<1>, listitem);
	GiveVehicle(playerid, D_Vehicles[id][dModel], true);
	PlayerInfo[playerid][pManhXeTC] -= 2;
    UpdateVar(playerid, "ManhXeTC", PlayerInfo[playerid][pManhXeTC]);
	new string[80];
	format(string ,sizeof string, "%s Da Nhan Xe %s Tu Ghep Xe",GetName(playerid),aVehicleNames[D_Vehicles[id][dModel]-400]);
	SendAdminMessage(COLOR_YELLOW, string, 1);
	return true;
}
Dialog:DIALOG_GHEPXE3(playerid,response,listitem,inputtext[]) {
	if(!response) return true;
	new id = Iter_Index(Cars<2>, listitem);
	GiveVehicle(playerid, D_Vehicles[id][dModel], true);
	PlayerInfo[playerid][pManhXeCC] -= 4;
    UpdateVar(playerid, "ManhXeCC", PlayerInfo[playerid][pManhXeCC]);
	new string[80];
	format(string ,sizeof string, "%s Da Nhan Xe %s Tu Ghep Xe",GetName(playerid),aVehicleNames[D_Vehicles[id][dModel]-400]);
	SendAdminMessage(COLOR_YELLOW, string, 1);
	return true;
}
CMD:bpstatus(playerid, params[]) {
    if(PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay");
    new szDialog[150];
    format(szDialog, sizeof szDialog, "Week\tStatus\nWeek 1\t%s\nWeek 2\t%s\nWeek 3\t%s\nWeek 4\t%s",bpweekstatus[0] != 1 ? "{FF0000}locked" : "{3BBF0B}unlocked",bpweekstatus[1] != 1 ? "{FF0000}locked" : "{3BBF0B}unlocked",bpweekstatus[2] != 1 ? "{FF0000}locked" : "{3BBF0B}unlocked",bpweekstatus[3] != 1 ? "{FF0000}locked" : "{3BBF0B}unlocked");
    Dialog_Show(playerid, DIALOG_BPSTATUS, DIALOG_STYLE_TABLIST_HEADERS, "Battlepass Quests", szDialog, "Chon", "Thoat");
    return true;
}
Dialog:DIALOG_BPSTATUS(playerid, response, listitem, inputtext[])
{
	if(!response) return 1;
    Dialog_Show(playerid, DIALOG_BPSTATUS2, DIALOG_STYLE_LIST, "Battlepass Quests", "{3BBF0B}Mo Khoa\n{FF0000}Khoa", "Chon", "Thoat");
	SetPVarInt(playerid, "Selected", listitem);
    return 1;
}
Dialog:DIALOG_BPSTATUS2(playerid, response, listitem, inputtext[])
{
	if(!response) return 1;
    new id = GetPVarInt(playerid, "Selected");
    switch (listitem) {
        case 0: {
            bpweekstatus[id] = 1;
            SendClientMessage(playerid, COLOR_GOLD, "Thao Tac Thanh Cong");
        }
        case 1: {
            bpweekstatus[id] = 0;
            SendClientMessage(playerid, COLOR_GOLD, "Thao Tac Thanh Cong");
        }
    }
    new query[129];
    if(id == 0) format(query, sizeof(query), "UPDATE `stuff` SET `bpw1status`='%d'", bpweekstatus[0]);
    else if(id == 1) format(query, sizeof(query), "UPDATE `stuff` SET `bpw2status`='%d'", bpweekstatus[1]);
    else if(id == 2) format(query, sizeof(query), "UPDATE `stuff` SET `bpw3status`='%d'", bpweekstatus[2]);
    else if(id == 3) format(query, sizeof(query), "UPDATE `stuff` SET `bpw4status`='%d'", bpweekstatus[3]);
	mysql_pquery(SQL, query);
	return 1;
}
CMD:bp(playerid, params[]) {
    if(Battlepassday == 0) return SendClientMessage(playerid, COLOR_GREY,"Da ket thuc season");
	Bit_Let(openingBp, playerid);
    for(new i; i < 10; i++) {
        if(i >= 5) PlayerTextDrawSetPreviewModel(playerid, BpPTD[i], BP_PremiumPrize[i-5][bprize_model]);
        else PlayerTextDrawSetPreviewModel(playerid, BpPTD[i], BP_NormalPrize[i][bprize_model]);
        PlayerTextDrawShow(playerid, BpPTD[i]); 
    }
    for(new i = 10; i  < sizeof(BpPTD); i++) {
        new string[64], nameprize[30];
        if(i >=15) {
            switch (BP_PremiumPrize[i-15][bprize_type]) {
                case PT_MONEY: format(nameprize, sizeof nameprize, "Money");
                case PT_KIM_CUONG: format(nameprize, sizeof nameprize, "Kim Cuong");
                case PT_PLAYER_EXP: format(nameprize, sizeof nameprize, "Exp");
                case PT_RANDOM_CRATE: format(nameprize, sizeof nameprize, "Random Crate");
                case PT_VEHICLESLOT: format(nameprize, sizeof nameprize, "Slot Xe");
                case PT_MATERIAL: format(nameprize, sizeof nameprize, "Vat Lieu");
                case PT_FIREWORK: format(nameprize, sizeof nameprize, "Phao Hoa");
                case PT_BOOMBOX: format(nameprize, sizeof nameprize, "BoomBox");
                case PT_ROBPOINTS: format(nameprize, sizeof nameprize, "Rob Points");
                case PT_PREMIUMPOINTS: format(nameprize, sizeof nameprize, "Xu");
                case PT_EPICCAR_CRATE: format(nameprize, sizeof nameprize, "Crate Epic Car");
                case PT_CHIP: format(nameprize, sizeof nameprize, "Chip");
                case PT_SUPERCARFRAGMENT: format(nameprize, sizeof nameprize, "Manh Cao Cap");
				case PT_MEDEIUMCARFRAGMENT: format(nameprize, sizeof nameprize, "Manh Trung Cap");
            }
            format(string, sizeof string, "%s~n~%s",FormatNumber(BP_PremiumPrize[i-15][bprize_amount]),nameprize);
            PlayerTextDrawSetString(playerid, BpPTD[i], string);
        }
        else {
            switch (BP_NormalPrize[i-10][bprize_type]) {
                case PT_MONEY: format(nameprize, sizeof nameprize, "Money");
                case PT_KIM_CUONG: format(nameprize, sizeof nameprize, "Kim Cuong");
                case PT_PLAYER_EXP: format(nameprize, sizeof nameprize, "Exp");
                case PT_RANDOM_CRATE: format(nameprize, sizeof nameprize, "Random Crate");
                case PT_VEHICLESLOT: format(nameprize, sizeof nameprize, "Slot Xe");
                case PT_MATERIAL: format(nameprize, sizeof nameprize, "Vat Lieu");
                case PT_FIREWORK: format(nameprize, sizeof nameprize, "Phao Hoa");
                case PT_BOOMBOX: format(nameprize, sizeof nameprize, "BoomBox");
                case PT_ROBPOINTS: format(nameprize, sizeof nameprize, "Rob Points");
                case PT_PREMIUMPOINTS: format(nameprize, sizeof nameprize, "Xu");
                case PT_EPICCAR_CRATE: format(nameprize, sizeof nameprize, "Crate Epic Car");
                case PT_CHIP: format(nameprize, sizeof nameprize, "Chip");
                case PT_SUPERCARFRAGMENT: format(nameprize, sizeof nameprize, "Manh Cao Cap");
				case PT_MEDEIUMCARFRAGMENT: format(nameprize, sizeof nameprize, "Manh Trung Cap");
            }
            format(string, sizeof string, "%s~n~%s",FormatNumber(BP_NormalPrize[i-10][bprize_amount]),nameprize);
            PlayerTextDrawSetString(playerid, BpPTD[i], string);
        }
        PlayerTextDrawShow(playerid, BpPTD[i]);       
    }
    TextDrawSetString(BpTD[10], "1");
    TextDrawSetString(BpTD[11], "2");
    TextDrawSetString(BpTD[12], "3");
    TextDrawSetString(BpTD[13], "4");
    TextDrawSetString(BpTD[14], "5");
    new tierr = BpUserData[playerid][bpExp] / 10;
    new sz[10];
    format(sz ,sizeof sz, "Tier Cua Ban: ~r~%d",tierr);
    TextDrawSetString(BpTD[16], sz);
    format(sz ,sizeof sz, "Season Con: ~r~%d~w~Ngay",Battlepassday);
    TextDrawSetString(BpTD[15], sz);
    for(new i; i  < sizeof(BpTD); i++) {
        TextDrawShowForPlayer(playerid, BpTD[i]);
    }
    SelectTextDraw(playerid, 0xFF0000FF);
    SetPVarInt(playerid, "BpPage", 0);
    return 0;
}