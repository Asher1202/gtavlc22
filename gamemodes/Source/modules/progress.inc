
#include 							< YSI_Coding\y_hooks >
#include                            < progress2 >

/* ** Definitions ** */
#define PROGRESS_CHEBOT				1
#define PROGRESS_STUFF				2
#define PROGRESS_THALUOI			3
#define PROGRESS_CHEBANHTRUNGTHU	4

/* ** Variables ** */
static stock
	PlayerBar:p_ProgressBar		[MAX_PLAYERS] = {PlayerBar: INVALID_PLAYER_BAR_ID, ...},
	PlayerText:p_ProgressTitle		[MAX_PLAYERS] = {PlayerText: INVALID_TEXT_DRAW, ...},

	bool: p_ProgressStarted         [ MAX_PLAYERS char ],
	bool: p_CancelProgress 			[ MAX_PLAYERS char ],
	p_ProgressUpdateTimer			[ MAX_PLAYERS ] = { -1, ... }
;

/* ** Forwards ** */
forward OnPlayerProgressUpdate(playerid, progressid, bool: canceled, params);
forward OnProgressCompleted(playerid, progressid, params);

/* ** Hooks ** */
hook OnPlayerConnect(playerid)
{								
	p_ProgressBar[playerid] = CreatePlayerProgressBar(playerid, 247.00, 420.00, 142.50, 8.19, -1048321, 100.0);

	p_ProgressTitle[playerid] = CreatePlayerTextDraw(playerid, 320.000000, 205.000000, "_");
	PlayerTextDrawAlignment(playerid, p_ProgressTitle[playerid], 2);
	PlayerTextDrawBackgroundColor(playerid, p_ProgressTitle[playerid], 255);
	PlayerTextDrawFont(playerid, p_ProgressTitle[playerid], 0);
	PlayerTextDrawLetterSize(playerid, p_ProgressTitle[playerid], 0.559999, 1.700000);
	PlayerTextDrawColor(playerid, p_ProgressTitle[playerid], -1);
	PlayerTextDrawSetOutline(playerid, p_ProgressTitle[playerid], 1);
	PlayerTextDrawSetProportional(playerid, p_ProgressTitle[playerid], 1);
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	StopProgressBar(playerid);
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (PRESSED(KEY_CROUCH) || PRESSED(KEY_SPRINT))
	{

		if (p_ProgressStarted{playerid} && !p_CancelProgress{playerid})
		{
			new keys, updown, leftright;
    		GetPlayerKeys(playerid, keys, updown, leftright);
			if(keys) {
				SendClientMessage(playerid, -1, "Vi ban di chuyen nen hanh dong da bi huy.");
				p_CancelProgress{playerid} = true;
				DeletePVar(playerid, "MuaThucAn");
			}
			SendClientMessage(playerid, -1, "Ban da huy hanh dong nay.");
			p_CancelProgress{playerid} = true;
			DeletePVar(playerid, "MuaThucAn");
			return 1;
		}
	}
	return 1;
}

/* ** Functions ** */
stock ShowProgressBar(playerid, title[64], progress_id, total_time = 1000, color, params = 0)
{
	if (!IsPlayerConnected(playerid))
	    return 0;

	if (p_ProgressStarted{playerid})
	{
    	StopProgressBar(playerid);
		p_CancelProgress{playerid} = true; // Cancel.
		CallLocalFunction("OnPlayerProgressUpdate", "dddd", playerid, GetPVarInt(playerid, "progress_lastid"), true, GetPVarInt(playerid, "progress_lastparams"));
		return ShowProgressBar(playerid, title, progress_id, total_time, color, params), 1;
	}

	new
		tickrate = floatround(float(total_time) / 100.0 * 5.0); // Tang 5% moi lan

    if (p_ProgressUpdateTimer[playerid] != -1) {
 		KillTimer(p_ProgressUpdateTimer[playerid]);
		p_ProgressUpdateTimer[playerid] = -1;
    }

	p_ProgressStarted{playerid} = true;

	// HidePlayerProgressBar(playerid, p_ProgressBar[playerid]);
	ShowPlayerProgressBar(playerid, p_ProgressBar[playerid]);
	PlayerTextDrawSetString(playerid, p_ProgressTitle[playerid], title);
	SetPlayerProgressBarColour(playerid, p_ProgressBar[playerid], color);
	SetPlayerProgressBarValue(playerid, p_ProgressBar[playerid], 0.0);

	// PlayerTextDrawColor(playerid, p_ProgressTitle[playerid], color);
    PlayerTextDrawShow(playerid, p_ProgressTitle[playerid]);

    SetPVarInt(playerid, "progress_lastparams", params);
    SetPVarInt(playerid, "progress_lastid", 	 progress_id);

    KillTimer(p_ProgressUpdateTimer[playerid]);
	p_ProgressUpdateTimer[playerid] = CallLocalFunction("ProgressBar_Update", "dddd", playerid, progress_id, tickrate, params);
	return 1;
}

stock StopProgressBar(playerid)
{
	KillTimer(p_ProgressUpdateTimer[playerid]);

	p_ProgressUpdateTimer	[playerid] = -1;
	p_ProgressStarted		{playerid} = false;
    p_CancelProgress 		{playerid} = false;

	HidePlayerProgressBar(playerid, p_ProgressBar[playerid]);
    PlayerTextDrawHide(playerid, p_ProgressTitle[playerid]);

	return ClearAnimations(playerid), 1;
}

function ProgressBar_Update(playerid, progressid, tickrate, params)
{
	if (!IsPlayerConnected(playerid) || p_ProgressStarted{playerid} == false)
	{
    	StopProgressBar(playerid);
		CallLocalFunction("OnPlayerProgressUpdate", "dddd", playerid, progressid, true, params);
	    return 1;
	}

	new
		Float: current_progress = GetPlayerProgressBarValue(playerid, p_ProgressBar[playerid]);

	CallLocalFunction("OnPlayerProgressUpdate", "dddd", playerid, progressid, p_CancelProgress{playerid}, params);

	if (current_progress + 5.0 >= 100.0)
	{
    	StopProgressBar(playerid);
    	CallLocalFunction("OnProgressCompleted", "ddd", playerid, progressid, params);
    	return 1;
 	}
 	else
 	{
		SetPlayerProgressBarValue(playerid, p_ProgressBar[playerid], current_progress + 5.0);
 	}

    // restart timer
 	KillTimer(p_ProgressUpdateTimer[playerid]);
	return (p_ProgressUpdateTimer[playerid] = SetTimerEx("ProgressBar_Update", tickrate, false, "dddd", playerid, progressid, tickrate, params));
}

stock IsPlayerProgressBarStarted(playerid) {
	return p_ProgressStarted{playerid};
}
