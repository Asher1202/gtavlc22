Float:GetDistanceBetweenPlayers(p1,p2) {
	new Float:x1, Float:y1, Float:z1;
	if(!IsPlayerConnected(p1) || !IsPlayerConnected(p2)) return -1.00;
	GetPlayerPos(p1,x1,y1,z1);
	return GetPlayerDistanceFromPoint(p2, x1, y1, z1);
}
Float:DistanceToPlayer(playerid, targetid) {
	new Float:x1, Float:y1, Float:z1;
	GetPlayerPos(targetid, x1, y1, z1);
	return GetPlayerDistanceFromPoint(playerid, x1, y1, z1);
}
stock Dialog_ShowInfo(playerid, const str[] = "Dang cap nhat...") {
	Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "GTAVLC System", str, "Dong", "");
}
