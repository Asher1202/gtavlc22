#define MAX_DAMAGES 100

x#define		BODY_PART_TORSO 	3
#define 	BODY_PART_GROIN 	4
#define 	BODY_PART_RIGHT_ARM 5
#define 	BODY_PART_LEFT_ARM 	6
#define	 	BODY_PART_RIGHT_LEG 7
#define 	BODY_PART_LEFT_LEG 	8
#define 	BODY_PART_HEAD 		9

enum dmgInfo
{
	dmgIssuerName[MAX_PLAYER_NAME],
	dmgDamage,
	dmgWeapon,
	dmgBodypart,
	bool:dmgKevlarhit,
	dmgSeconds,
}
new DamageInfo[MAX_PLAYERS][MAX_DAMAGES][dmgInfo];

timer ResetPlayerDamages[10000](playerid) {
	for(new id = 0; id < MAX_DAMAGES; id++)
		if(DamageInfo[playerid][id][dmgDamage] != 0) DamageInfo[playerid][id][dmgDamage] = 0;
	return 1;
}
stock GetBodypartName(bodypart){
	new bodyname[10];
	switch(bodypart)
	{
		case BODY_PART_TORSO: FORMAT:bodyname("TORSO");
		case BODY_PART_GROIN: FORMAT:bodyname("GROIN");
		case BODY_PART_RIGHT_ARM: FORMAT:bodyname("RIGHT ARM");
		case BODY_PART_LEFT_ARM: FORMAT:bodyname("LEFT ARM");
		case BODY_PART_RIGHT_LEG: FORMAT:bodyname("RIGHT ARM");
		case BODY_PART_LEFT_LEG: FORMAT:bodyname("LEFT LEG");
		case BODY_PART_HEAD: FORMAT:bodyname("HEAD");
	}
	return bodyname;
}
stock ShowPlayerDamages(playerid, toid) {
	new  str[1000], str1[100], count = 0, name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof(name));
	for(new id = 0; id < MAX_DAMAGES; id++) if(DamageInfo[playerid][id][dmgDamage] != 0) count++;
	if(count == 0) return Dialog_Show(toid, 0, DIALOG_STYLE_LIST, name, "There is no damage to display...", "Close", "");
	else if(count > 0)
	{	
		for(new gunname[50], id = 0; id < MAX_DAMAGES; id++)
		{
			if(DamageInfo[playerid][id][dmgDamage] != 0)
			{
				GetWeaponNameEx(DamageInfo[playerid][id][dmgWeapon],gunname,sizeof(gunname));	
				format(str1, sizeof(str1), "%s gave %d dmg, using %s to %s (Armor: %s) %ds ago\n", DamageInfo[playerid][id][dmgIssuerName], 
					DamageInfo[playerid][id][dmgDamage], 
					gunname, 
					GetBodypartName(DamageInfo[playerid][id][dmgBodypart]), 
					(DamageInfo[playerid][id][dmgKevlarhit]==true) ? "Yes" : "No", 
					gettime() - DamageInfo[playerid][id][dmgSeconds]);
				strcat(str, str1);
			}
		}
		Dialog_Show(toid, 0, DIALOG_STYLE_LIST, name, str, "Close", "");
	}
	return 1;
}
/*
hook OnPlayerDeath(playerid) {
	// ShowPlayerDamages(playerid, playerid);
	// defer ResetPlayerDamages[10000](playerid);
}
*/
CMD:damages(playerid, params[])
{
	new 
	id, Float: ppPos[3];
	if(sscanf(params, "u", id)) return SendClientMessage(playerid, -1, "Su dung: {FFFFFF}/damages [playerid/PartOfName]");
	if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, "Nguoi choi khong ket noi.");
	
	GetPlayerPos(playerid, ppPos[0], ppPos[1], ppPos[2]);
	if(IsPlayerInRangeOfPoint(playerid, 7.0, ppPos[0], ppPos[1], ppPos[2])) ShowPlayerDamages(id, playerid);
	else return SendClientMessage(playerid, 0xB8BAC6FF, "Ban o qua xa ho.");
	return 1;
}