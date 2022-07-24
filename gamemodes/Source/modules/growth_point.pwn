#define GROWTHPOINTS_PER_TASK 50

increaseGrowthPoint(playerid, growthPoints) {
    PlayerInfo[playerid][pGrowthPoints] += growthPoints;

    new query[200];
	format(query, sizeof(query), "UPDATE `users` SET `GrowthPoints`='%d' WHERE `ID`='%d'", PlayerInfo[playerid][pGrowthPoints], PlayerInfo[playerid][pSQLID]);
    mysql_query(SQL, query, false);

    va_SendClientMessage(playerid, COLOR_YELLOW, "Ban da nhan duoc %d growth points.", growthPoints);
}