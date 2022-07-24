#include <YSI_Coding\y_hooks>

// Undermaintain
CMD:toyshop(playerid, params[]) {
    Dialog_Show(playerid, DIALOG_TOYAUCTION, DIALOG_STYLE_TABLIST_HEADERS, "Toy auction", "Example", "Ok", "Cancel");
    return 1;
}

Dialog:DIALOG_TOYAUCTION(playerid, response, listitem, inputtext[]) {
    if(!response) return 1;

    return 1;
}

hook OnGameModeInit() {
    printf("[Hello minasan]");
    return 1;
}