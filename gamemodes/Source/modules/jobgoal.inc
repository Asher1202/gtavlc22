#include <YSI_Coding\y_hooks>

UpdateJobGoal(update, updatemax) {
	new playerid;
	ServerGoal += update;
	MAXGOAL = updatemax;
	new gString[264];
	format(gString, 60, "~g~$%s", ServerGoal >= MAXGOAL ? FormatNumber(MAXGOAL) : FormatNumber(ServerGoal));
	TextDrawSetString(GoalTD[1], gString);
	format(gString, 60, "$%s", FormatNumber(MAXGOAL));
	TextDrawSetString(GoalTD[3], gString);
	format(gString, 60, "Job Goal (%d%s)", ServerGoal * 100 / MAXGOAL, "%");
	TextDrawSetString(GoalTD[0], gString);
	//if(showgoal[playerid] == 1) for(new i = 0; i < 4; i++) TextDrawShowForPlayer(playerid, GoalTD[i]);
	//TextDrawShowForPlayer(playerid, GoalTD[i]);

	if(TerminatJobGoal != 1) {
		if(ServerGoal >= MAXGOAL) {
			foreach(new b: Player) {
				new amount, rand = random(30);
				switch(rand) {
					case 0..10: {
						amount = RandomEx(1000000, 1500000);
						format(gString, 100, "Job Goal: {FFFFFF}Chuc Mung! Ban da nhan duoc %d Money Tu Job Goal.", amount);
						SendClientMessage(b, 0xF5C738FF, gString);
						GivePlayerCash(b, amount);
					}
					case 11..19: {
						amount = RandomEx(5, 20);
						format(gString, 100, "Job Goal: {FFFFFF}Chuc Mung! Ban Nhan Duoc %d Vip Xu Tu Job Goal.", amount);
						SendClientMessage(b, 0xF5C738FF, gString);
						PlayerInfo[b][pPremiumPoints] += amount;
						Update(b, pPremiumPointsx);		
					}
					default: {
						amount = RandomEx(500000, 1000000);
						format(gString, 100, "Job Goal: {FFFFFF}Chuc Mung! Ban Nhan Duoc %d Money Tu Job Goal.", amount);
						SendClientMessage(b, 0xF5C738FF, gString);
						//PlayerInfo[playerid][pExp] += amount;
						//Update(b, pRP);
						GivePlayerCash(b, amount);
					}
				}
			}
			TerminatJobGoal = 1;
		}
		if(ServerGoal >= MAXGOAL) 
		{
			foreach(new b: Player)
			{
				ServerGoal = 0;
				UpdateJobGoal(ServerGoal, MAXGOAL);
				TerminatJobGoal = 0;

			}
		}
	}
	return true;
}

hook OnGameModeExit() {
	new query[100];

	format(query, sizeof(query), "UPDATE `stuff` SET `ServerGoal`='%d'", ServerGoal);
	mysql_query(SQL, query, false);	
}