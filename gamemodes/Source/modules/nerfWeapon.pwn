
#include <YSI_Coding\y_hooks>

// uzi 1 tay
hook OnPlayerConnect(playerid) {
    //Tec9
    SetPlayerSkillLevel(playerid, 32, 1);
    //Uzi
    SetPlayerSkillLevel(playerid, 28, 1);
    //Shotgun Shawoff
    SetPlayerSkillLevel(playerid, 26, 1);

    return 1;
}