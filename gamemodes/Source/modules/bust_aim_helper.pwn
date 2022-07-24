#include <YSI_Coding\y_hooks>

static _bustAimAttempt[MAX_PLAYERS];

public OnPlayerSuspectedForAimbot(playerid,hitid,weaponid,warnings)
{
	new str[144],nme[MAX_PLAYER_NAME],wname[32],Float:Wstats[BUSTAIM_WSTATS_SHOTS];
	
	_bustAimAttempt[playerid]++;
	GetPlayerName(playerid,nme,sizeof(nme));
	GetWeaponName(weaponid,wname,sizeof(wname));
	if(warnings & WARNING_OUT_OF_RANGE_SHOT)
	{
	    format(str,256,"(anti aimbot) [%d]%s(%d) ban o range xa hon range cua vu khi %s(Normal Range:%d)",_bustAimAttempt[playerid],nme,playerid,wname,BustAim::GetNormalWeaponRange(weaponid));
        SendStaffMessage(0xAA3333AA, str);
		BustAim::GetRangeStats(playerid,Wstats);
		format(str,256,"Shooter to Victim Distance(SA Units): 1)%f 2)%f 3)%f",Wstats[0],Wstats[1],Wstats[2]);
        SendStaffMessage(0xAA3333AA, str);
	}
	if(warnings & WARNING_PROAIM_TELEPORT)
	{
	    format(str,256,"(anti aimbot) [%d]%s(%d) co the su dung proaim (Teleport Detected)",_bustAimAttempt[playerid],nme,playerid);
        SendStaffMessage(0xAA3333AA, str);
		BustAim::GetTeleportStats(playerid,Wstats);
		format(str,256,"Bullet to Victim Distance(SA Units): 1)%f 2)%f 3)%f",Wstats[0],Wstats[1],Wstats[2]);
        SendStaffMessage(0xAA3333AA, str);
	}
	if(warnings & WARNING_RANDOM_AIM)
	{
	    format(str,256,"(anti aimbot) [%d]%s(%d) co the su dung aimbot(Hit with Random Aim with %s)",_bustAimAttempt[playerid],nme,playerid,wname);
        SendStaffMessage(0xAA3333AA, str);
		BustAim::GetRandomAimStats(playerid,Wstats);
		format(str,256,"Random Aim Offsets: 1)%f 2)%f 3)%f",Wstats[0],Wstats[1],Wstats[2]);
        SendStaffMessage(0xAA3333AA, str);
	}
	if(warnings & WARNING_CONTINOUS_SHOTS)
	{
	    format(str,256,"(anti aimbot) [%d]%s(%d) ban 10 shots lien tuc bang vu khi %s(%d)",_bustAimAttempt[playerid],nme,playerid,wname,weaponid);
        SendStaffMessage(0xAA3333AA, str);

	}
	// BustAim::ResetPlayerProfile(playerid);
	return 1;
}


hook OnPlayerConnect(playerid)
{
    _bustAimAttempt[playerid] = 0;
}

CMD:profile(playerid,params[])
{
	if(PlayerInfo[playerid][pAdmin] < 1 && PlayerInfo[playerid][pHelper] < 1) return SendClientMessage(playerid,COLOR_WHITE,AdminOnly);
	new id;
    if(sscanf(params, "u",id))
	{
	    return SendClientMessage(playerid, 0xFF0000AA, "Usage:/profile [PlayerID/Name]");
	}
    new allshots,hitshots,max_cont_shots,out_of_range_warns,random_aim_warns,proaim_tele_warns;
    BustAim::GetPlayerProfile(id,allshots,hitshots,max_cont_shots,out_of_range_warns,random_aim_warns,proaim_tele_warns);
	new str[144],name[MAX_PLAYER_NAME];
	GetPlayerName(id,name,MAX_PLAYER_NAME);
	format(str,144,"BustAim Profile of %s(%d):Complete Profile:Stats of all weapons",name,id);
	SendClientMessage(playerid,COLOR_GREEN,str);
	format(str,144,"Fired:%d Hits:%d HitPercentage:%.2f MaxContinousShots:%d Bullets OutOfRangeWarns:%d AimWarns:%d TeleportWarns:%d",allshots,hitshots,((hitshots*100.0)/allshots),max_cont_shots,out_of_range_warns,random_aim_warns,proaim_tele_warns);
	SendClientMessage(playerid,COLOR_GREEN,str);
	return 1;
}
CMD:wprofile(playerid,params[])
{
	if(PlayerInfo[playerid][pAdmin] < 1 && PlayerInfo[playerid][pHelper] < 1) return SendClientMessage(playerid,COLOR_WHITE,AdminOnly);
    new id,wid;
    if(sscanf(params, "ui",id,wid))
	{
	    return SendClientMessage(playerid, 0xFF0000AA, "Usage:/wprofile [PlayerID/Name] [WeaponID]");
	}
    new allshots,hitshots,max_cont_shots,out_of_range_warns,random_aim_warns,proaim_tele_warns;
    BustAim::GetPlayerWeaponProfile(playerid,wid,allshots,hitshots,max_cont_shots,out_of_range_warns,random_aim_warns,proaim_tele_warns);
	new str[144],name[MAX_PLAYER_NAME],wname[32];
	GetPlayerName(id,name,MAX_PLAYER_NAME);
	GetWeaponName(wid,wname,32);
	format(str,144,"BustAim Weapon Profile of %s(%d):Stats of Weapon %s(%d)",name,id,wname,wid);
	SendClientMessage(playerid,COLOR_GREEN,str);
	format(str,144,"Fired:%d Hits:%d HitPercentage:%.2f MaxContinousShots:%d Bullets OutOfRangeWarns:%d AimWarns:%d TeleportWarns:%d",allshots,hitshots,((hitshots*100.0)/allshots),max_cont_shots,out_of_range_warns,random_aim_warns,proaim_tele_warns);
	SendClientMessage(playerid,COLOR_GREEN,str);
	return 1;
}
CMD:reset(playerid,params[])
{
	if(PlayerInfo[playerid][pAdmin] < 1 && PlayerInfo[playerid][pHelper] < 1) return SendClientMessage(playerid,COLOR_WHITE,AdminOnly);
	new id;
	if(sscanf(params, "u",id))
	{
	    return SendClientMessage(playerid, 0xFF0000AA, "Usage:/reset [PlayerID/Name]");
	}

	BustAim::ResetPlayerProfile(id);
    
	va_SendClientMessage(playerid,COLOR_GREEN,"Reset Profile of Player %d",id);

	new str[500];

	format(str, sizeof(str),"[%d]%s Reset Profile of Player %s [%d]",playerid,ret_GetPlayerName(playerid), ret_GetPlayerName(id), id);
	SendStaffMessage(0xAA3333AA, str);
	return 1;
}
CMD:wreset(playerid,params[])
{
	if(PlayerInfo[playerid][pAdmin] < 1 && PlayerInfo[playerid][pHelper] < 1) return SendClientMessage(playerid,COLOR_WHITE,AdminOnly);
	new tmp;
	if(sscanf(params, "i",tmp))
	{
	    return SendClientMessage(playerid, 0xFF0000AA, "Usage:/wprofile [WeaponID]");
	}
    BustAim::ResetPlayerWeaponProfile(playerid,tmp);
    SendClientMessage(playerid,COLOR_GREEN,"Your weapon profile has been reset.");
	return 1;
}
