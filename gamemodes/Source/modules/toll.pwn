#include <YSI_Coding\y_timers>
#include <YSI_Coding\y_hooks>

#define TOLL_COST                (3000) // gia mo cong
#define TOLL_OPEN_DISTANCE       (7.0) // pham vi mo
#define MAX_TOLLS                (2) // toi da cong thu phi

enum TOLL_ENUM
{
    E_tLocked, 
    E_tOpenTime 
}

static aTolls[MAX_TOLLS][TOLL_ENUM];

static Float: toll_gate_pos[MAX_TOLLS][3] =
{
 	{66.1974,-1527.1326,4.8833}, //xyz
    {52.1328,-1537.7883,5.1342}
};
	
static Float: toll_gate_rot[MAX_TOLLS][2] =
{
	{-0.399999, 82.200119}, //rx - rz
	{-0.399999, 262.200134} //rx - rz
};

static TollObject[MAX_TOLLS];

timer TimerCloseToll[5000](tollid)
{
	if(aTolls[tollid][E_tOpenTime] == 1) 
	{
		Toll_Close(tollid);
		aTolls[tollid][E_tOpenTime] = 0;
	}
}

Toll_Close(tollid)
{
    return SetDynamicObjectRot(TollObject[tollid], toll_gate_rot[tollid][0], 90.0, toll_gate_rot[tollid][1]);
}

Toll_Open(tollid)
{
	aTolls[tollid][E_tOpenTime] = 1;
	defer TimerCloseToll(tollid);
	return SetDynamicObjectRot(TollObject[tollid], toll_gate_rot[tollid][0], 0.0, toll_gate_rot[tollid][1]);
}

Toll_Nearest(playerid)
{
	new tollid = -1;

	for(new i; i < MAX_TOLLS; i++)
	{
	    if (!IsPlayerInRangeOfPoint(playerid, TOLL_OPEN_DISTANCE, toll_gate_pos[i][0], toll_gate_pos[i][1], toll_gate_pos[i][2])) continue;
	        
		tollid = i;
		break;
	}

	return tollid;
}


hook OnGameModeInit()
{
    // MAP TOLL 
	CreateDynamicObject(8168, 59.837707, -1532.740478, 6.086700, -0.700001, -0.599999, 6.999980, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(966, 59.334518, -1530.039184, 3.932843, 0.000000, 0.000000, -98.000022, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(997, 60.486564, -1523.200561, 3.918420, 0.000000, 0.000000, 83.499893, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(966, 58.457553, -1535.339111, 3.932843, 0.000000, 0.000000, 81.599983, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(997, 56.973423, -1545.375610, 3.918420, 0.000000, 0.000000, 83.499893, -1, -1, -1, 300.00, 300.00); 

   	TollObject[0] = CreateDynamicObject(968, 59.324638, -1530.040405, 4.855693, -0.399999, 90.000000, 82.200119, -1); // LS
 	TollObject[1] = CreateDynamicObject(968, 58.474330, -1535.139404, 4.856738, -0.399999, 90.000000, 262.200134, -1); // LS
	return 1;
}

CMD:gotoll(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] == 0) return 1;
	return SetPlayerPosEx(playerid, 66.1974,-1527.1326,4.8833);
}

CMD:tlock(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] == 0) return 1;
	for(new i=0; i < MAX_TOLLS;i++)
	{
		if(aTolls[i][E_tLocked]) aTolls[i][E_tLocked] = 0;
		else if(aTolls[i][E_tLocked] == 0) aTolls[i][E_tLocked] = 1;
	}
	return 1;
}

CMD:otoll(playerid, params[])
{
	new tollid;
	if ((tollid = Toll_Nearest(playerid)) == -1) return 1;

	if (aTolls[tollid][E_tOpenTime] > 0) 	return SendSuccessMessage(playerid, "Cong da mo, vui long doi cho den khi no dong lai. ");

	if (aTolls[tollid][E_tLocked])		return SendSuccessMessage(playerid, "Tram thu phi hien tai da dung hoat dong");
	if (GetPlayerMoney(playerid) < TOLL_COST)	return SendSuccessMessage(playerid, "Ban phai tra $3.000 de qua cong.");
		
	GivePlayerCash(playerid, -TOLL_COST);
	Update(playerid, pCashx);
	SendSuccessMessage(playerid, "Ban da tra 3.000$ cho viec qua cua tram thu phi.");

	Toll_Open(tollid);
	return 1;
}
