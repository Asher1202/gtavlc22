	// Boombox command - Usage: /boombox [URL]
CMD:boombox(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 1 && PlayerInfo[playerid][pVip] == 0) return SendClientMessage(playerid, 0xFFFFCCFF, AdminOnly);
	new string[128];
	if(!GetPVarType(playerid, "BoomboxObject"))
	{
	    if(sscanf(params, "s[256]", params)) {
	    	SendClientMessage(playerid, COLOR_WHITE, "USAGE: /boombox [music url]");
			SendClientMessage(playerid, -1, "Co san: http://"SERVER_NAME".com/radio/<tenradio>");
			return SendClientMessage(playerid, -1, "Ten radio: sontung, avrillavigne.. Vi du: /boombox http://"SERVER_NAME".net/radio/sontung");
		}
		foreach(new i: Player)
	    {
	        if(GetPVarType(i, "BoomboxObject"))
	        {
    			if(IsPlayerInRangeOfPoint(playerid, 100.0, GetPVarFloat(i, "bposX"), GetPVarFloat(i, "bposY"), GetPVarFloat(i, "bposZ")))
				{
				    SendClientMessage(playerid, COLOR_GREY, " Co mot boombox khac da duoc dat o gan day, hay chon cho khac.");
				    return 1;
				}
			}
		}
		
		new Float:x, Float:y, Float:z, Float:a;
	    GetPlayerPos(playerid, x, y, z); GetPlayerFacingAngle(playerid, a);
	    SetPVarInt(playerid, "BoomboxObject", CreateDynamicObject(2103, x, y, z-1.0, 0.0, 0.0, 0.0, .worldid = GetPlayerVirtualWorld(playerid), .interiorid = GetPlayerInterior(playerid)));
	    SetPVarFloat(playerid, "bposX", x); SetPVarFloat(playerid, "bposY", y); SetPVarFloat(playerid, "bposZ", z);
		SetPVarInt(playerid, "bboxareaid", CreateDynamicSphere(x, y, z, 100.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid)));
        format(string, sizeof(string), "Boombox Owner: %s", GetName(playerid));
        SetPVarInt(playerid, "BBLabel", _:CreateDynamic3DTextLabel(string, -1, x, y, z-0.4, 5, .worldid = GetPlayerVirtualWorld(playerid), .interiorid = GetPlayerInterior(playerid)));
	    format(string, sizeof(string), " Ban da dat boombox tai cho cua ban.");
	    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
	    foreach(new i: Player)
		{
			if(IsPlayerInDynamicArea(i, GetPVarInt(playerid, "bboxareaid")))
			{
				PlayAudioStreamForPlayer(i, params, GetPVarFloat(playerid, "bposX"), GetPVarFloat(playerid, "bposY"), GetPVarFloat(playerid, "bposZ"), 100.0, 1);
			}
    	}
		SetPVarString(playerid, "BoomboxURL", params);
	}
	else
	{
	    DestroyDynamicObject(GetPVarInt(playerid, "BoomboxObject"));
	    DeletePVar(playerid, "BoomboxObject"); DeletePVar(playerid, "BoomboxURL");
	    DeletePVar(playerid, "bposX"); DeletePVar(playerid, "bposY"); DeletePVar(playerid, "bposZ");
	    DestroyDynamic3DTextLabel(Text3D:GetPVarInt(playerid, "BBLabel"));
	    if(GetPVarType(playerid, "bboxareaid"))
	    {
	        foreach(new i: Player)
	        {
	            if(IsPlayerInDynamicArea(i, GetPVarInt(playerid, "bboxareaid")))
	            {
	                StopAudioStreamForPlayer(i);
	                SendClientMessage(i, COLOR_GREY, " Nguoi so huu da tat boombox.");
				}
			}
	        DeletePVar(playerid, "bboxareaid");
		}
		SendClientMessage(playerid, COLOR_LIGHTBLUE, " Ban da tat boombox.");
	}
	return 1;
}

// Boombox editing - Usage: /boomboxnext [url]
CMD:boomboxnext(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 1 && PlayerInfo[playerid][pVip] == 0) return SendClientMessage(playerid, 0xFFFFCCFF, AdminOnly);
	if(!GetPVarType(playerid, "BoomboxObject")) return SendClientMessage(playerid, COLOR_GREY, "Ban khong dat mot boombox.");
    if(sscanf(params, "s[256]", params)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /boomboxnext [music url]");
    SendClientMessage(playerid, COLOR_GREY, " Ban da thay doi am nhac.");
    foreach(new i: Player)
	{
		if(IsPlayerInDynamicArea(i, GetPVarInt(playerid, "bboxareaid")))
		{
			PlayAudioStreamForPlayer(i, params, GetPVarFloat(playerid, "bposX"), GetPVarFloat(playerid, "bposY"), GetPVarFloat(playerid, "bposZ"), 100.0, 1);
		}
    }
	SetPVarString(playerid, "BoomboxURL", params);
	return 1;
}

// Playing/Stopping boombox music for nearby players / Updated from Onplayerupdate
public OnPlayerEnterDynamicArea(playerid, areaid)
{
	foreach(new i: Player)
	{
	    if(GetPVarType(i, "bboxareaid"))
	    {
	        new station[256];
	        GetPVarString(i, "BoomboxURL", station, sizeof(station));
	        if(areaid == GetPVarInt(i, "bboxareaid"))
	        {
	        	if(IsPlayerInAnyVehicle(playerid)) {
	        		if(CarRadio[GetPlayerVehicleID(playerid)]==0) PlayAudioStreamForPlayer(playerid, station, GetPVarFloat(i, "bposX"), GetPVarFloat(i, "bposY"), GetPVarFloat(i, "bposZ"), 100.0, 1);
	        	}
	            else PlayAudioStreamForPlayer(playerid, station, GetPVarFloat(i, "bposX"), GetPVarFloat(i, "bposY"), GetPVarFloat(i, "bposZ"), 100.0, 1);
				SendClientMessage(playerid, COLOR_GREY, " Ban dang nghe nhac duoc phat ra tu mot chiec boombox gan do.");
				// PlayAudioStreamForPlayer(playerid, "https://steamcast.com/sbin/listen.m3u?id=6089681");
				return 1;
	        }
	    }
	}
	return 1;
}
public OnPlayerLeaveDynamicArea(playerid, areaid)
{
    foreach(new i: Player)
	{
	    if(GetPVarType(i, "bboxareaid"))
	    {
	        if(areaid == GetPVarInt(i, "bboxareaid"))
	        {
	        	if(IsPlayerInAnyVehicle(playerid)) {
	        		if(CarRadio[GetPlayerVehicleID(playerid)]==0) StopAudioStreamForPlayer(playerid);
	        	}
	        	else StopAudioStreamForPlayer(playerid);
	            SendClientMessage(playerid, COLOR_GREY, " Ban da roi khoi hop nhac boombox");
				return 1;
	        }
	    }
	}
	return 1;
}