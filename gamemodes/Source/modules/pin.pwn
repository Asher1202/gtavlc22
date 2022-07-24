#include <YSI_Coding\y_hooks>
//FUNCTIONS
UpdatePin(playerid) {
	if(strlen(PinText[playerid]) == 0) PlayerTextDrawSetString(playerid, PinPTD[1], "");
	else if(strlen(PinText[playerid]) == 1) PlayerTextDrawSetString(playerid, PinPTD[1], "[]");
	else if(strlen(PinText[playerid]) == 2) PlayerTextDrawSetString(playerid, PinPTD[1], "[[]]");
	else if(strlen(PinText[playerid]) == 3) PlayerTextDrawSetString(playerid, PinPTD[1], "[[[]]]");
	else if(strlen(PinText[playerid]) == 4) PlayerTextDrawSetString(playerid, PinPTD[1], "[[[[]]]]");
	return 1;
}
ShowPinTDs(playerid) {
	for(new i = 0; i < 15; i ++) TextDrawShowForPlayer(playerid, PinTD[i]);	
	SelectTextDraw(playerid, COLOR_WHITE);
	PlayerTextDrawSetString(playerid, PinPTD[1], "");		
	for(new i = 0; i < 2; i++) PlayerTextDrawShow(playerid, PinPTD[i]);
	PinText[playerid] = "";
	SetPVarInt(playerid, "ShowPin", 1);
	return 1;
}
HidePinTDs(playerid) {
	for(new i = 0; i < 15; i ++) TextDrawHideForPlayer(playerid, PinTD[i]);	
	for(new i = 0; i < 2; i++) PlayerTextDrawHide(playerid, PinPTD[i]);
	CancelSelectTextDraw(playerid);
	PinText[playerid] = "";	
	SetPVarInt(playerid, "ShowPin", 0);
	return 1;
}
// ResetPin(playerid) {
// 	PlayerTextDrawSetString(playerid, PinPTD[1], "-");	
// 	PlayerTextDrawShow(playerid, PinPTD[1]);
// 	return 1;
// }
//COMMANDS
CMD:setpin(playerid, params[]) {
	if(strlen(PlayerInfo[playerid][pPin]) != 0) return SendClientMessage(playerid, COLOR_WHITE, "Tai khoan cua ban da co pass 2, hay su dung /loginpin de dang nhap.");
	PlayerTextDrawSetString(playerid, PinPTD[0], "Set pin");
	ShowPinTDs(playerid);
	SetPVarInt(playerid, "PinCase", 1);	
	return 1;
}
CMD:loginpin(playerid, params[]) {
	if(PlayerInfo[playerid][pPinLogged] == 1) return SendClientMessage(playerid, COLOR_WHITE, "Tai khoan cua ban da duoc xac thuc ma PIN!");
	if(strlen(PlayerInfo[playerid][pPin]) == 0) return SendClientMessage(playerid, COLOR_GREY, "Khong co ma PIN. Hay tao mot ma moi. (/setpin)");
	PlayerTextDrawSetString(playerid, PinPTD[0], "Login pin");
	ShowPinTDs(playerid);
	SetPVarInt(playerid, "PinCase", 2);
	return 1;
}
CMD:changepin(playerid, params[]) {
    if(strlen(PlayerInfo[playerid][pPin]) == 0) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co ma PIN.");
    if(PlayerInfo[playerid][pPinLogged] == 0) return SendClientMessage(playerid, COLOR_WHITE, "Su dung '/loginpin' de xac thuc tai khoan.");
	PlayerTextDrawSetString(playerid, PinPTD[0], "Login pin");
	ShowPinTDs(playerid);
	SetPVarInt(playerid, "PinCase", 3);
	return 1;
}
// HOOKS
hook OnPlayerClickTextDraw(playerid, Text:clickedid) {
	for(new i = 1; i < 11; i++) {
		if(clickedid == PinTD[i]) {
			if(strlen(PinText[playerid]) == 4) return PlayerPlaySound(playerid, 1085, 0.0, 0.0, 10.0);			
			if(i == 10) format(PinText[playerid], 5, "%s0", PinText[playerid]);
			else format(PinText[playerid], 5, "%s%d", PinText[playerid], i);
			PlayerPlaySound(playerid, 1083, 0.0, 0.0, 10.0);
			UpdatePin(playerid);

			return ~0;
		}
	}
	return 1;	
}