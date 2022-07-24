#include <battlepass/bp_textdraw>
#include <battlepass/bp_impl>

#include <YSI_Coding\y_hooks>

hook OnPlayerConnect(playerid) {
    Bp_LoadPlayerTextDraw(playerid);
}

hook OnGameModeInit() {
    Bp_LoadTextDraw();
}

CMD:bp(playerid, params[]) {
	Bit_Let(openingBp, playerid);

    for(new i; i  < sizeof(BpPTD); i++) {
        PlayerTextDrawShow(playerid, BpPTD[i]);        
    }
    for(new i; i  < sizeof(BpTD); i++) {
        TextDrawShowForPlayer(playerid, BpTD[i]);
    }

    SelectTextDraw(playerid, 0xFF0000FF);
    return 0;
}