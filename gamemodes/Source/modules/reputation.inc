#include <YSI_Coding\y_hooks>

#define 	REPUTATION_DISTANCE		30.0

new const DanhHieu[MAX_REPUTATION][] = {
	{""SIENNA_3"VIP 1"}, // 0
	{""SIENNA_2"VIP 2"},	
	{""SIENNA_1"VIP 3"},	
	{"{51A3FA}VIP 4"},	
	{"{0F52CD}VIP 5"},
	{"{072BF3}VIP 6"},	
	{""GOLD_2"VIP 7"},	
	{""GOLD_1"VIP 8"},	
	{""GOLD_1"VIP 9"},	
	{""FIREBRICK_1"VIP 10"},
	{""GOLD_1"Premium Account"},  
	{""SPRING_GREEN_1"Fish Master"}, // 11 
	{""ORANGE"Pizzaboi"}, 
	{""SEA_GREEN_1"True Farmer"},
	{""HOT_PINK_1"Drug Dealer"}, 
	{""FIREBRICK_1"Truck Master"}, 
	{""FIREBRICK_1"TOP 1 GANG"},
	{""CORAL_1"Weapon Master"},
	{""RED2"Top Money"},
	{""LIGHTGREEN"Top Level"},
	{"{E0FFFF}Top Gio choi"},
	{"{00FFFF}Crime Hunter"},	
	{"{FF0000}Ted La Trum"},
	{"{7A07F6}FOUNDER GVLC"},
	{"{00FF7F}Bac Thay Quay Tay"},
	{"{77FF00}TOP CLAN"},
	{"{01FF91}Trum hoat dong"},
	{"{00ffc7}Obama Trum Server"},
	{"{FF0000}Sugar Daddy"},
	{"{CA00FF}Grays Rich Kid"},
	{"{008DFF}Top 2 Level"},
	{"{65FF00}Plunderer"},
	{"{E80C0C}God Of Death"},
	{"{B8FF04}Dev Mapping"},
	{"{ff0066}SIEU CHIEN BINH"},
	{"{66ff99}FARMER"},
	{"{66ff99}THE BEST CLAN"},
	{"{FF0000}KING DE"}

	

};

hook ResetVariables(playerid) {
    for(new i = 0; i < sizeof(DanhHieu); i++) {
        PlayerInfo[playerid][pDanhHieu][i] = -1, 
        PlayerInfo[playerid][pDanhHieuActive][i] = 0;
    }
    reputationLabel[playerid] = Create3DTextLabel("", -1, 0.0, 0.0, 0.0, 50.0, 0, 1);	
}

AttachPlayerReputation3DText(playerid) {
	new str[150];
	for(new i, j; i < sizeof(DanhHieu); i++) {
		if(PlayerInfo[playerid][pDanhHieu][i] != -1 && PlayerInfo[playerid][pDanhHieuActive][i] == 1) {
			j++;
			format(str, sizeof(str), "%s%s\n", str, DanhHieu[ PlayerInfo[playerid][pDanhHieu][i] ]);
			if(j % 2 == 0) break;
		}
	}
	Update3DTextLabelText(reputationLabel[playerid], COLOR_LIGHTRED, str);
	Attach3DTextLabelToPlayer(reputationLabel[playerid], playerid, 0.0, 0.0, 0.6);	// tang neu no chen len ten nguoi choi
}
CMD:traodanhhieu(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, -1, AdminOnly);
	new str[1000];
	for(new i; i < sizeof(DanhHieu); i++) {
		format(str, sizeof(str), "%s%s\n", str, DanhHieu[i]);
	}
	Dialog_Show(playerid, DANHHIEU_TRAO, DIALOG_STYLE_LIST, "Chon danh hieu ban muon trao", str, "Next", "Exit");
	return 1;
}
Dialog:DANHHIEU_TRAO(playerid, response, listitem, inputtext[]) {
	if(!response) return 1;
	SelectedItem[playerid] = listitem;
	Dialog_Show(playerid, DANHHIEU_TRAO1, DIALOG_STYLE_INPUT, "Nhap ID nguoi ban muon trao", "Nhap ID vao ben duoi:", "Hoan tat", "Exit");
	return 1;
}
Dialog:DANHHIEU_TRAO1(playerid, response, listitem, inputtext[]) {
	if(!response) return 1;
	new id;
	sscanf(inputtext, "u", id);
	if(!VALID_PLAYERID(id) || !IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, -1, "Nguoi choi khong ket noi.");
	GiveReputation(id, SelectedItem[playerid]);
	va_SendAdminMessage(COLOR_WARNING, "[DANH HIEU] %s da trao cho %s danh hieu %s.", 1, PlayerInfo[playerid][pUsername], PlayerInfo[id][pUsername], DanhHieu[SelectedItem[playerid]]);
	return 1;	
}
IsPlayerHaveReputation(playerid, reID) {
	for(new i; i < sizeof(DanhHieu); i++) {
		if(PlayerInfo[playerid][pDanhHieu][i] == reID) return true;
	}
	return false;
}
findReputationSlot(playerid) {
	for(new i; i < sizeof(DanhHieu); i++) {
		if(PlayerInfo[playerid][pDanhHieu][i] == -1) return i;
	}
	return -1;
}
GiveReputation(playerid, reID) {
	if(IsPlayerHaveReputation(playerid, reID)) return 1;
	new i = findReputationSlot(playerid);
	PlayerInfo[playerid][pDanhHieu][i] = reID;
	PlayerInfo[playerid][pDanhHieuActive][i] = 0;
	va_SendClientMessage(playerid, X11_SPRING_GREEN, "[DANH HIEU]: "WHITE"Xin chuc mung! Ban vua nhan duoc danh hieu %s, [/danhhieu].", DanhHieu[reID]);
	SaveReputation(playerid);
	return reID;
}
SaveReputation(playerid) {
	new str[200],string[1000];
	for(new i; i < sizeof(DanhHieu); i++) {
		format(str, sizeof(str), "%d|", PlayerInfo[playerid][pDanhHieu][i]);
		strcat(string,str);
	}
	str[strlen(str)-1] = EOS;
	UpdateStr(playerid, "DanhHieu", string);

	str[0] = EOS;
	string[0] = EOS;

	for(new i; i < sizeof(DanhHieu); i++) {
		format(str, sizeof(str), "%d|", PlayerInfo[playerid][pDanhHieuActive][i]);
		strcat(string,str);
	}
	str[strlen(str)-1] = EOS;
	UpdateStr(playerid, "DanhHieuActive", string);
}
CMD:danhhieu(playerid, params[]) {
	new str[1000];
	strcat(str, "Danh hieu\tTrang thai\n");
	for(new i; i < sizeof(DanhHieu); i++) {
		if(PlayerInfo[playerid][pDanhHieu][i] != -1) 
		
		format(str, sizeof(str), "%s%s\t%s\n", str, DanhHieu[ PlayerInfo[playerid][pDanhHieu][i] ], 
			PlayerInfo[playerid][pDanhHieuActive][i] > 0 ? ""GREEN_2"On" : ""RED_3"Off"
		);

		else format(str, sizeof(str), "%s[ Trong ]\t...\n", str);
	}
	Dialog_Show(playerid, DANHHIEU_CHON, DIALOG_STYLE_TABLIST_HEADERS, "Tuy chinh danh hieu", str, "Toggle", "Cancel");
	return 1;
}
Dialog:DANHHIEU_CHON(playerid, response, listitem, inputtext[]) {
	if(!response) return 1;
	if(PlayerInfo[playerid][pDanhHieu][listitem] == -1) return 1;
	new j;
	if(PlayerInfo[playerid][pDanhHieuActive][listitem] == 0) {
		for(new i; i < sizeof(DanhHieu); i++) {
			if(PlayerInfo[playerid][pDanhHieuActive][i] != 0) j++;
		}
		if(j >= 2) return SendClientMessage(playerid, -1, "Ban da bat toi da 2 danh hieu");
	}
	PlayerInfo[playerid][pDanhHieuActive][listitem] = !PlayerInfo[playerid][pDanhHieuActive][listitem];
	AttachPlayerReputation3DText(playerid);
	SendClientMessage(playerid, X11_DARK_GREEN, "[DANH HIEU] "WHITE"Thanh cong!");

	return callcmd::danhhieu(playerid, "");
}