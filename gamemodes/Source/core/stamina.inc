/* ** Includes ** */

#include <a_samp>
#include <YSI_Coding\y_hooks>

/* ** Definitions ** */
#if !defined STAMINA_DEFAULT_RECOVERYTIME
	#define STAMINA_DEFAULT_RECOVERYTIME    (4000)
#endif
/* ** Variables ** */
new Text:staminaIcon;
new Text:armorIcon;
new PlayerText:staminaText[MAX_PLAYERS];
new PlayerBar:staminaProgressBar[MAX_PLAYERS];

/* ** Hooks ** */
hook OnGameModeInit() {
	armorIcon = TextDrawCreate(610.000000, 46.000000, "HUD:radar_tshirt");
	TextDrawFont(armorIcon, 4);
	TextDrawLetterSize(armorIcon, 0.600000, 2.000000);
	TextDrawTextSize(armorIcon, 8.000000, 8.500000);
	TextDrawSetOutline(armorIcon, 1);
	TextDrawSetShadow(armorIcon, 0);
	TextDrawAlignment(armorIcon, 1);
	TextDrawColor(armorIcon, -1);
	TextDrawBackgroundColor(armorIcon, 255);
	TextDrawBoxColor(armorIcon, 50);
	TextDrawUseBox(armorIcon, 1);
	TextDrawSetProportional(armorIcon, 1);
	TextDrawSetSelectable(armorIcon, 0);

	staminaIcon = TextDrawCreate(610.000000, 56.000000, "HUD:radar_burgershot");
	TextDrawFont(staminaIcon, 4);
	TextDrawLetterSize(staminaIcon, 0.600000, 2.000000);
	TextDrawTextSize(staminaIcon, 8.000000, 8.500000);
	TextDrawSetOutline(staminaIcon, 1);
	TextDrawSetShadow(staminaIcon, 0);
	TextDrawAlignment(staminaIcon, 1);
	TextDrawColor(staminaIcon, -1);
	TextDrawBackgroundColor(staminaIcon, 255);
	TextDrawBoxColor(staminaIcon, 50);
	TextDrawUseBox(staminaIcon, 1);
	TextDrawSetProportional(staminaIcon, 1);
	TextDrawSetSelectable(staminaIcon, 0);
	return 1;
}

hook OnPlayerConnect(playerid) {
	/*Player Progress Bars
	Requires "progress2" include by Southclaws
	Download: https://github.com/Southclaws/progress2/releases */
	staminaProgressBar[playerid] = CreatePlayerProgressBar(playerid, 548.000000, 58.000000, 62.500000, 4.500000, -764862721, 100.000000, 0);
	SetPlayerProgressBarValue(playerid, staminaProgressBar[playerid], 50.000000);

	//Player Textdraws
	staminaText[playerid] = CreatePlayerTextDraw(playerid, 578.000000, 55.000000, "100%");
	PlayerTextDrawFont(playerid, staminaText[playerid], 2);
	PlayerTextDrawLetterSize(playerid, staminaText[playerid], 0.212497, 0.899998);
	PlayerTextDrawTextSize(playerid, staminaText[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, staminaText[playerid], 1);
	PlayerTextDrawSetShadow(playerid, staminaText[playerid], 0);
	PlayerTextDrawAlignment(playerid, staminaText[playerid], 2);
	PlayerTextDrawColor(playerid, staminaText[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, staminaText[playerid], 255);
	PlayerTextDrawBoxColor(playerid, staminaText[playerid], 50);
	PlayerTextDrawUseBox(playerid, staminaText[playerid], 0);
	PlayerTextDrawSetProportional(playerid, staminaText[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, staminaText[playerid], 0);
	return 1;
}



hook AfterDBLoad(playerid) {
	printf("[Stamina] Show Stamina for %s", ret_GetPlayerName(playerid));

	ShowPlayerProgressBar(playerid, staminaProgressBar[playerid]);
	PlayerTextDrawShow(playerid, staminaText[playerid]);
	TextDrawShowForPlayer(playerid, staminaIcon);
	TextDrawShowForPlayer(playerid, armorIcon); // Nếu check player có armour thì mới show sẽ hay hơn và nhìn ít rối hơn.
	
	SetPlayerMaxStamina(playerid, 100);
	//Stamina_SetValue(playerid, PlayerInfo[playerid][pHunger]);

	return 1;
}

hook OnPlayerSpawn(playerid)
{
	Stamina_SetValue(playerid, 0);
	SetPlayerStamina(playerid, 100);
}
/* ** Functions ** */

//						minus?, JUWOV
// Remember to put a - if you want to minus. 
Stamina_SetValue(playerid, num) {
					/***********************CHECK AND SET PLAYER HUNGER************************/
	if(PlayerInfo[playerid][pHunger] + num < 0) PlayerInfo[playerid][pHunger] = 0;
	else if(PlayerInfo[playerid][pHunger] + num > 100) PlayerInfo[playerid][pHunger] = 100;
	PlayerInfo[playerid][pHunger] += num;
					/***********************SET PROGRESS BAR + TEXTDRAW************************/
	SetPlayerProgressBarValue(playerid, staminaProgressBar[playerid], PlayerInfo[playerid][pHunger]);
	new str[10];
	format(str, sizeof(str), "%d%%", PlayerInfo[playerid][pHunger]);
	PlayerTextDrawSetString(playerid, staminaText[playerid], str);
					/***********************SAVE************************/
	Update(playerid, pHungerx);
					/***********************CHECKS************************/
	switch(PlayerInfo[playerid][pHunger])
	{
		case 0: {
			SetPlayerHealth(playerid, Float:0.0);
			PlayerInfo[playerid][pHunger] = 11;
			Update(playerid, pHungerx);
			SendClientMessage(playerid, COLOR_YELLOW, "Ban bi chet vi qua doi");
		}
		case 1..3: {
			new Float:health;
			GetPlayerHealthEx(playerid, health);
			LoopingAnim(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
			SetPlayerHealthEx(playerid, health-3);
			SendClientMessage(playerid, COLOR_YELLOW, "Ban qua doi, hay mo tui do de an mot chiec hamburger");
			SetPlayerDrunkLevel (playerid, 5000);
		}

		case 4..14: {
			new Float:health;
			GetPlayerHealthEx(playerid, health);
			LoopingAnim(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
			SetPlayerHealthEx(playerid, health-3);
			SendClientMessage(playerid, COLOR_YELLOW, "Ban qua doi, hay mo tui do de an mot chiec hamburger");
		}
		case 15..25: {
			new Float:health;
			GetPlayerHealthEx(playerid, health);
			SendClientMessage(playerid, COLOR_YELLOW, "Ban da qua doi, hay tim mot chut gi de de an [/tuido]");
			SetPlayerHealthEx(playerid, health-2);
		}
	}
}


//forward OnPlayerStaminaOver(playerid);
stock IsPlayerRunning(playerid) // Check if the player is running
{
    if(!IsPlayerConnected(playerid) || IsPlayerInAnyVehicle(playerid) || IsPlayerExhausted(playerid)) return 0;

    new keys, updown, leftright;
    GetPlayerKeys(playerid, keys, updown, leftright);
    if(keys & KEY_SPRINT && GetPlayerSpecialAction(playerid) != SPECIAL_ACTION_USEJETPACK) return 1;
    else return 0;
}

stock IsPlayerExhausted(playerid)
{
	if(GetPVarInt(playerid, "Exhausted") == 1) return true;
	else return false;
}

/*
forward SetPlayerExhausted(playerid, bool:Exhausted);
public SetPlayerExhausted(playerid, bool:Exhausted) 
{
	if(Exhausted) 
	{
		TogglePlayerControllable(playerid,0);
		TogglePlayerControllable(playerid,1);

		ApplyAnimation(playerid, "FAT", "IDLE_tired", 4.1, 0, 1, 1, 0, STAMINA_DEFAULT_RECOVERYTIME, 1);

		SetPVarInt(playerid, "Exhausted", 1);
		SetTimerEx("SetPlayerExhausted", STAMINA_DEFAULT_RECOVERYTIME, false, "ib", playerid, false);
	}
	else SetPVarInt(playerid, "Exhausted", 0), ClearAnimations(playerid);
	return 1;
}


public OnPlayerStaminaOver(playerid) 
{
	SetPlayerExhausted(playerid, true);
	return 1;
}
*/
stock GetPlayerStamina(playerid)
{
	if(!IsPlayerConnected(playerid) || GetPVarType(playerid, "MAX_Stamina") == PLAYER_VARTYPE_NONE) return -1;
	new stamina = GetPVarInt(playerid, "Stamina");
	return stamina;
}


stock GetPlayerMaxStamina(playerid) 
{
	if(!IsPlayerConnected(playerid) || GetPVarType(playerid, "MAX_Stamina") == PLAYER_VARTYPE_NONE) return -1;
	new maxstamina = GetPVarInt(playerid, "MAX_Stamina");
	return maxstamina;
}

stock GivePlayerStamina(playerid, value)
{
	new stamina = GetPVarInt(playerid, "Stamina");

	if(stamina == -1) return 1;
	//if(stamina + value == 0) return CallLocalFunction("OnPlayerStaminaOver", "i", playerid);
	if(stamina + value <= GetPVarInt(playerid, "MAX_Stamina")) 
	{
		stamina = stamina+value;
		SetPVarInt(playerid, "Stamina", stamina);
		
		//Stamina_SetUIValue(playerid, stamina);
		return 1;
	}
	else return 0;
}


stock GivePlayerMaxStamina(playerid, value) 
{
	new maxstamina = GetPVarInt(playerid, "MAX_Stamina"), stamina = GetPVarInt(playerid, "Stamina");

	maxstamina = maxstamina + value;
	SetPVarInt(playerid, "MAX_Stamina", maxstamina);

	if(stamina > maxstamina) stamina = maxstamina, SetPVarInt(playerid, "Stamina", stamina);

	//Stamina_SetUIValue(playerid, stamina);

	return 1;
}


stock SetPlayerStamina(playerid, value)
{
	if(value > GetPVarInt(playerid, "MAX_Stamina")) return SetPVarInt(playerid, "Stamina", GetPVarInt(playerid, "MAX_Stamina")); 
	//else if(value == 0) OnPlayerStaminaOver(playerid);

	SetPVarInt(playerid, "Stamina", value);
	
	//Stamina_SetUIValue(playerid, value);
	return 1;
}


stock SetPlayerMaxStamina(playerid, value) 
{
	new stamina = GetPlayerStamina(playerid), max_stamina = value;

	if(stamina > max_stamina) stamina = max_stamina, SetPVarInt(playerid, "Stamina", stamina);
	SetPVarInt(playerid, "MAX_Stamina", max_stamina);
	
	//Stamina_SetUIValue(playerid, stamina);
	return 1;
}