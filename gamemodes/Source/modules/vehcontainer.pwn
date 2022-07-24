#include <a_samp>
#include <streamer>
#include <Pawn.CMD>
#include <YSI_Coding\y_hooks>

static IsInVehicle[MAX_PLAYERS];

hook OnGameModeInit()
{
	// print("\n--------------------------------------");
	// print("       FilterScript By JawsPlus         ");
	// print("--------------------------------------\n");
	CreateDynamicObject(19321, 225.77921, 1778.15930, 300.00000,   0.00000, 0.00000, 0.00000,-1,3);
	CreateDynamicObject(19321, 225.77921, 1771.00867, 300.00000,   0.00000, 0.00000, 0.00000,-1,3);

	// CreateVehicle(456, -1712.4635, 13.0354, 3.7423, 0.0000, -1, -1, 100);
	// CreateVehicle(456, -1708.0593, 11.0412, 3.7423, 0.0000, -1, -1, 100);
	// CreateVehicle(456, -1703.7712, 9.2236, 3.7423, 0.0000, -1, -1, 100);

	return 1;
}

CMD:container(playerid,prams[])
{
	SetPlayerPos(playerid,-1704.5363,18.5412,3.5547);
	SetPlayerInterior(playerid, 0);
	IsInVehicle[playerid]  = 0;
	SetPlayerVirtualWorld(playerid,0);
	return 1;
}

hook OnPlayerConnect(playerid)
{
    IsInVehicle[playerid] = 0;
}

hook OnPlayerUpdate(playerid)
{
    new vehicleid = GetNearest_Vehicle(playerid,4);
	new Float:vx, Float:vy, Float:vz;
    GetTrunkPos(vehicleid,vx,vy,vz);
    new Float:vx1, Float:vy1, Float:vz1;
    GetVehiclePos(vehicleid, vx1,vy1,vz1);
    if(IsPlayerInRangeOfPoint(playerid,3.0, vx,vy,vz1))
    {
		if (GetVehicleModel(vehicleid) == 456)
	    {
			GameTextForPlayer(playerid,"~G~Press 'Y' to enter",1000,4);
	 	}
	}
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys == KEY_YES && IsInVehicle[playerid] == 0)
	{
	    new vehicleid = GetNearest_Vehicle(playerid,4);
		new Float:vx, Float:vy, Float:vz;
	    GetTrunkPos(vehicleid,vx,vy,vz);
	    new Float:vx1, Float:vy1, Float:vz1;
    	GetVehiclePos(vehicleid, vx1,vy1,vz1);
    	if(IsPlayerInRangeOfPoint(playerid,3.0, vx,vy,vz1))
	    {
			if (GetVehicleModel(vehicleid) == 456)
		    {
				SetPlayerPos(playerid, 225.7954, 1781.4277, 299.5544);
		        SetPlayerTime(playerid, 00,00);
				SetPlayerFacingAngle(playerid, 180);
		        SetCameraBehindPlayer(playerid);
		        SetPlayerInterior(playerid, 3);
		        SetPlayerVirtualWorld(playerid,vehicleid);
		        IsInVehicle[playerid]  = vehicleid;
		        SendClientMessage(playerid, 0xffffff,"Press 'Enter' to exit");
			 }
		}
	}
	if (newkeys == KEY_SECONDARY_ATTACK && IsInVehicle[playerid]  != 0)
	{
		new Float:vx, Float:vy, Float:vz;
		GetTrunkPos(IsInVehicle[playerid],vx,vy,vz);
		new Float:vx1, Float:vy1, Float:vz1;
		GetVehiclePos(IsInVehicle[playerid], vx1,vy1,vz1);
		SetPlayerPos(playerid, vx,vy, vz1+2);
		SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld(playerid,0);
		IsInVehicle[playerid]  = 0;
		return 1;		    	
	}
	return 1;
}
	
hook OnPlayerDeath(playerid,killerid,reason)
{
	if(IsInVehicle[playerid]  == 1)
	{
		IsInVehicle[playerid]  = 0;
	}
}

hook OnPlayerDisconnect(playerid , reason)
{
    IsInVehicle[playerid]  = 0;
}

stock GetNearest_Vehicle(playerid, Float:distance)
{
	new Float:xX,Float:yY,Float:zZ,retElement = -1;
    for(new i = 0; i < MAX_VEHICLES; i++)
    {
        GetVehiclePos(i, xX, yY, zZ);
        new Float:odist = GetPlayerDistanceFromPoint(playerid, xX, yY, zZ);
        if (retElement == -1)
        {
            retElement = i;
            distance = odist;
        }
        else if (odist < distance)
        {
            retElement = i;
            distance = odist;
        }
    }
    return retElement;
}

stock GetXYBehindVehicle(vehicleid, &Float:x2, &Float:y2, Float:distance)
{
    new Float:a;
    GetVehiclePos(vehicleid, x2, y2, a);
    GetVehicleZAngle(vehicleid, a);
    x2 += (distance * floatsin(-a+180, degrees));
    y2 += (distance * floatcos(-a+180, degrees));
}

stock GetTrunkPos(vehicleid, &Float: x3, &Float:y3, &Float:z3)
{
	new Float: x, Float: y;
	new Float: sizeX, Float: sizeY, Float:sizeZ[2];

	GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_SIZE, sizeX, sizeY, sizeZ[0]);

	GetXYBehindVehicle(vehicleid, x, y, sizeY/2);
	x3 = x;
	y3 = y;

    GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_REAR_BUMPER_Z , sizeX, sizeY, sizeZ[1]);

	z3 = (sizeZ[1] + sizeZ[0]/2);
}