/*
	CP[playerid] = 1;
		means that you are in a driving test. 
		This is against /find, /findhouse, /findbiz, etc...


*/

CMD:examen(playerid, params[]) {
	if(DeelayCommand[playerid][2] > 0) return DeelayTime(playerid, 2);

	if(!PlayerToPoint(5.0, playerid, ExamPos[0],ExamPos[1],ExamPos[2])) return SendClientMessage(playerid, -1, "Ban khong o tai DMV [/gps -> Dia diem quan trong -> DMV!");
	if(PlayerInfo[playerid][pCarLic] > 0) return SendClientMessage(playerid, -1, "Ban da co giay phep lai xe!");
	if(PlayerInfo[playerid][pCarLicS] > 0) return SendClientMessage(playerid, COLOR_LGREEN, "[ERROR] Giay phep lai xe cua ban dang bi tich thu!");
	if(PlayerInfo[playerid][pWantedLevel] != 0 ) return SendClientMessage(playerid, COLOR_GREY, "Ban dang bi truy na nen khong the thi bang lai");
	if(CP[playerid] != 0 || targetfind[playerid] != -1) return Dialog_Show(playerid, DIALOG_CHECKPOINT, DIALOG_STYLE_MSGBOX, "Checkpoint", "Mot cham do dang hoat dong.\nBan co muon xoa no khong? Neu muon, hay chon 'Ok'.", "Ok", "Exit");

	if(DrivingTest[playerid] == 3) DrivingTest[playerid] = 0;
	new dialogstr[1000], string[87+MAX_PLAYER_NAME];
	format(string, 87+MAX_PLAYER_NAME,"%s, Ban sap thi bang lai, ban phai vuot qua mot so thu thach de duoc cap bang lai xe.\n",GetName(playerid));
	strcat(dialogstr, string);
	strcat(dialogstr, "Bang lai xe la mot chung chi quan trong ma khong co no thi khong co quyen lai xe.\n");
	strcat(dialogstr, "Dau tien ban phai lam cac bai kiem tra.\n");
	strcat(dialogstr, "Chung toi khong thu phi cua ban, sau khi hoan tat ban se duoc cap bang lai xe.\n");
	strcat(dialogstr, "Ban co muon thi bang lai khong?");
 	Dialog_Show(playerid, DIALOG_DMV, DIALOG_STYLE_MSGBOX, "DMV", dialogstr, "Co", "Khong");
	return 1;
}
Dialog:DIALOG_DMV(playerid, response, listitem, inputtext[]) {
	if(!response) return 1;
	new PlayerText:td = CreatePlayerTextDraw(playerid, -20.0, -20.0, "_");
	PlayerTextDrawUseBox(playerid, td, 1);
	PlayerTextDrawBoxColor(playerid, td, 0xFFFFFF00);
	PlayerTextDrawLetterSize(playerid, td, 680.0, 500.0);
	PlayerTextDrawTextSize(playerid, td, 680.0, 500.0);
	PlayerTextDrawShow(playerid, td);

	PlayerTextDrawBoxFade(playerid, td, 0x00000000, 0x000000FF, 2, 10);

	PlayerInfo[playerid][pColourFading] = 1;
	DeelayCommand[playerid][2] = 5;
	CP[playerid] = 1;
	return 1;
}
public OnPlayerTextDrawFaded(playerid, PlayerText:text, type, from_color, to_color) {
	if(PlayerInfo[playerid][pColourFading] == 1) {
		DrivingTest[playerid] = 1;
		DMV_BuildMap(playerid, PlayerInfo[ playerid ][ c_DmvLastStage ]);
		PlayerInfo[playerid][pColourFading] = 2;
		PlayerTextDrawBoxFade(playerid, text, 0x000000FF, 0x00000000, 2, 10);
	} 
	else if(PlayerInfo[playerid][pColourFading] == 2) PlayerTextDrawDestroy(playerid, text);
}
public OnPlayerEnterDynamicRaceCP(playerid, checkpointid) {
	if(IsValidDynamicRaceCP(checkpointid)) {
		switch( Streamer_GetIntData( STREAMER_TYPE_RACE_CP, checkpointid, E_STREAMER_EXTRA_ID ) ) {
			case e_CP_Dmv: {
				switch(PlayerInfo[ playerid ][ c_Dmv ]) {
					case e_Dmv_180: {
						new Float:X, Float:Y;
						Streamer_GetFloatData( STREAMER_TYPE_RACE_CP, checkpointid, E_STREAMER_X, X);
						Streamer_GetFloatData( STREAMER_TYPE_RACE_CP, checkpointid, E_STREAMER_Y, Y);
						
						DestroyDynamicRaceCP( checkpointid );
						if( X == -2047.5155 && Y == -217.4424 ) Streamer_SetIntData( STREAMER_TYPE_RACE_CP, CreateDynamicRaceCP(2, -2047.6085, -129.8128, 35.2301, 0.0, 0.0, 0.0, 4.0, .playerid = playerid, .streamdistance = 99999 ), E_STREAMER_EXTRA_ID, e_CP_Dmv );
						else if( X == -2047.6085 && Y == -129.8128 ) {
							GUI_InitDMV( playerid, e_Dmv_Whip );
							DMV_DestroyMap(playerid);
							DestroyDynamicRaceCP( checkpointid );
						} 
						return 1;
					}
					case e_Dmv_Whip: {
						new Float:X, Float:Y;
						Streamer_GetFloatData( STREAMER_TYPE_RACE_CP, checkpointid, E_STREAMER_X, X);
						Streamer_GetFloatData( STREAMER_TYPE_RACE_CP, checkpointid, E_STREAMER_Y, Y);
						DestroyDynamicRaceCP( checkpointid );	
						if( X == -2028.6050 && Y == -166.4487 ) {
							GUI_InitDMV( playerid, e_Dmv_Pop );
							DMV_DestroyMap(playerid);
							DestroyDynamicRaceCP( checkpointid );
			
						}
						return 1;
					}
					case e_Dmv_Pop: {
						GUI_InitDMV( playerid, e_Dmv_Lap );
						DMV_DestroyMap(playerid);
						DestroyDynamicRaceCP( checkpointid );
						return 1;
					}
					case e_Dmv_Lap: {
						new Float:X, Float:Y;
						Streamer_GetFloatData( STREAMER_TYPE_RACE_CP, checkpointid, E_STREAMER_X, X);
						Streamer_GetFloatData( STREAMER_TYPE_RACE_CP, checkpointid, E_STREAMER_Y, Y);
						DestroyDynamicRaceCP( checkpointid );	
						if( X == -2046.3871 && Y == -188.6832 ) {
							Streamer_SetIntData( STREAMER_TYPE_RACE_CP, CreateDynamicRaceCP(2, -2056.6497, -139.7147, 35.3203, 0.0, 0.0, 0.0, 4.0, .playerid = playerid, .streamdistance = 99999 ), E_STREAMER_EXTRA_ID, e_CP_Dmv );
						}
						else {
							new lap = GetPVarInt(playerid, INT_pvarDmvLap);	
							
							if(lap == 5 ) DMV_End(playerid, 0);
							else {
								SetPVarInt( playerid, INT_pvarDmvLap, lap+1 );	
								Streamer_SetIntData( STREAMER_TYPE_RACE_CP, CreateDynamicRaceCP(2, -2046.3871,-188.6832,35.3203, 0.0, 0.0, 0.0, 4.0, .playerid = playerid, .streamdistance = 99999 ), E_STREAMER_EXTRA_ID, e_CP_Dmv );
								va_GameTextForPlayer( playerid, "~w~~n~~n~~n~~n~~n~~n~~n~~n~%d/5", 4000, 4, lap+1 );
							}
						}
					}
				}	
			}
		}		
	}
	return 1;
}

DMV_BuildMap(playerid, test_drive) {
	if(DrivingTest[playerid] != 1) return false;

	new vehicleid;
	switch(test_drive) {
		case e_Dmv_Circle: {
			vehicleid = CreateVehicleEx(411, -2048.6272, -152.2440, 35.0609, 180.0000, 55, 0, -1);
			Streamer_SetIntData( STREAMER_TYPE_AREA, PlayerInfo[ playerid ][ c_DmvAreas ][ 0 ] =CreateDynamicCircle(-2048.6272, -152.2440, 7.0, .playerid = playerid), E_STREAMER_EXTRA_ID, e_Area_Dmv );
			PlayerInfo[ playerid ][ c_DmvObjs ][ 0 ] =CreateDynamicObject(1238, -2048.627197, -145.244003, 34.652900, 0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 1 ] =CreateDynamicObject(1238, -2045.127197, -146.181823, 34.652900, 0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 2 ] =CreateDynamicObject(1238, -2042.565063, -148.744003, 34.652900, 0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 3 ] =CreateDynamicObject(1238, -2041.627197, -152.244003, 34.652900, 0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 4 ] =CreateDynamicObject(1238, -2042.565063, -155.744003, 34.652900, 0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 5 ] =CreateDynamicObject(1238, -2045.127197, -158.306182, 34.652900, 0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 6 ] =CreateDynamicObject(1238, -2048.627197, -159.244003, 34.652900, 0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 7 ] =CreateDynamicObject(1238, -2052.127197, -158.306182, 34.652900, 0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 8 ] =CreateDynamicObject(1238, -2054.689453, -155.744003, 34.652900, 0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 9 ] =CreateDynamicObject(1238, -2055.627197, -152.244003, 34.652900, 0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 10 ] =CreateDynamicObject(1238, -2054.689453, -148.744003, 34.652900, 0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 11 ] =CreateDynamicObject(1238, -2052.127197, -146.181823, 34.652900, 0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerTextDrawSetString( playerid, InfosTD, "De xoay xe, hay nhan W va S cung luc~n~va phim mui ten trai hoac phai.");
			PlayerTextDrawShow(playerid, InfosTD);
		}
		case e_Dmv_180:
		{
			vehicleid = CreateVehicleEx(496, -2047.6085, -129.8128, 35.2301, 180.0000, 0, 0, -1);
			Streamer_SetIntData( STREAMER_TYPE_AREA, PlayerInfo[ playerid ][ c_DmvAreas ][ 0 ] =CreateDynamicCube(-2059.4946, -126.0801, 34.3084, -2036.2288, -223.7132, 44.5845, .playerid = playerid), E_STREAMER_EXTRA_ID, e_Area_Dmv );
			PlayerInfo[ playerid ][ c_DmvObjs ][ 0 ] =CreateDynamicObject(1238, -2045.80725, -126.16790, 34.64130,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 1 ] =CreateDynamicObject(1238, -2047.40723, -126.16830, 34.64130,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 2 ] =CreateDynamicObject(1238, -2049.02710, -126.16830, 34.64130,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 3 ] =CreateDynamicObject(1238, -2035.46851, -211.74899, 34.65290,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 4 ] =CreateDynamicObject(1238, -2035.87744, -214.85483, 34.65290,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 5 ] =CreateDynamicObject(1238, -2037.07617, -217.74899, 34.65290,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 6 ] =CreateDynamicObject(1238, -2038.98328, -220.23427, 34.65290,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 7 ] =CreateDynamicObject(1238, -2041.46851, -222.14130, 34.65290,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 8 ] =CreateDynamicObject(1238, -2044.36267, -223.34010, 34.65290,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 9 ] =CreateDynamicObject(1238, -2047.46851, -223.74899, 34.65290,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 10 ] =CreateDynamicObject(1238, -2050.57422, -223.34010, 34.65290,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 11 ] =CreateDynamicObject(1238, -2053.46851, -222.14130, 34.65290,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 12 ] =CreateDynamicObject(1238, -2055.95386, -220.23427, 34.65290,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 13 ] =CreateDynamicObject(1238, -2057.86084, -217.74899, 34.65290,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 14 ] =CreateDynamicObject(1238, -2059.05957, -214.85483, 34.65290,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 15 ] =CreateDynamicObject(1238, -2059.46851, -211.74899, 34.65290,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 16 ] =CreateDynamicObject(1238, -2047.46851, -211.74899, 34.64130,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 17 ] =CreateDynamicObject(1238, -2047.46851, -209.74899, 34.64130,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 18 ] =CreateDynamicObject(1238, -2047.46851, -207.74899, 34.64130,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 19 ] =CreateDynamicObject(1238, -2047.46851, -205.74899, 34.64130,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 20 ] =CreateDynamicObject(1238, -2035.46851, -209.74899, 34.64130,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 21 ] =CreateDynamicObject(1238, -2035.46851, -207.74899, 34.64130,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 22 ] =CreateDynamicObject(1238, -2035.46851, -205.74899, 34.64130,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 23 ] =CreateDynamicObject(1238, -2059.46851, -209.74899, 34.64130,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 24 ] =CreateDynamicObject(1238, -2059.46851, -207.74899, 34.64130,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 25 ] =CreateDynamicObject(1238, -2059.46851, -205.74899, 34.64130,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 26 ] =CreateDynamicObject(1238, -2044.28467, -127.40370, 34.64130,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 27 ] =CreateDynamicObject(1238, -2044.28467, -129.40370, 34.64130,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 28 ] =CreateDynamicObject(1238, -2044.28467, -131.40370, 34.64130,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 29 ] =CreateDynamicObject(1238, -2044.28467, -133.40370, 34.64130,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 30 ] =CreateDynamicObject(1238, -2044.28467, -135.40370, 34.64130,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 31 ] =CreateDynamicObject(1238, -2044.28467, -137.40370, 34.64130,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 32 ] =CreateDynamicObject(1238, -2044.28467, -139.40370, 34.64130,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 33 ] =CreateDynamicObject(1238, -2050.40088, -127.40370, 34.64130,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 34 ] =CreateDynamicObject(1238, -2050.40088, -129.40370, 34.64130,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 35 ] =CreateDynamicObject(1238, -2050.40088, -131.40370, 34.64130,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 36 ] =CreateDynamicObject(1238, -2050.40088, -133.40370, 34.64130,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 37 ] =CreateDynamicObject(1238, -2050.40088, -135.40370, 34.64130,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 38 ] =CreateDynamicObject(1238, -2050.40088, -137.40370, 34.64130,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 39 ] =CreateDynamicObject(1238, -2050.40088, -139.40370, 34.64130,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			Streamer_SetIntData( STREAMER_TYPE_RACE_CP, CreateDynamicRaceCP(2, -2047.5155, -217.4424, 34.6413, 0.0, 0.0, 0.0, 8, .playerid = playerid, .streamdistance = 99999 ), E_STREAMER_EXTRA_ID, e_CP_Dmv );

			PlayerTextDrawSetString( playerid, InfosTD, "De drift 180 do, hay tang toc het muc,~n~nhan 'SPACE' de phanh tay quay va tro ve duong dua");
			PlayerTextDrawShow(playerid, InfosTD);
		}
		case e_Dmv_Whip:
		{
			vehicleid = CreateVehicleEx(429, -2069.6663, -126.5055, 35.1320, 180.0000, 1, 3, -1);
			Streamer_SetIntData( STREAMER_TYPE_AREA, PlayerInfo[ playerid ][ c_DmvAreas ][ 0 ] =CreateDynamicPolygon
			(
				Float:
				{
					-2023.4634, -168.2946, -2025.9553, -170.3347, -2071.9553, -170.3347, -2073.4553, -124.3347, -2071.5400, -121.8253, -2067.5266, -121.6681, -2065.5334, -160.2778, -2025.4590, -162.2961,
					-2023.4304, -165.3318, -2023.4634, -168.2946
				},
				.playerid = playerid), E_STREAMER_EXTRA_ID, e_Area_Dmv 
			);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 0 ] =CreateDynamicObject(1238, -2071.54004, -121.82528, 34.69718,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 1 ] =CreateDynamicObject(1238, -2073.45532, -124.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 2 ] =CreateDynamicObject(1238, -2073.45532, -126.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 3 ] =CreateDynamicObject(1238, -2073.45532, -128.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 4 ] =CreateDynamicObject(1238, -2073.45532, -130.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 5 ] =CreateDynamicObject(1238, -2073.45532, -132.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 6 ] =CreateDynamicObject(1238, -2073.45532, -134.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 7 ] =CreateDynamicObject(1238, -2073.45532, -136.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 8 ] =CreateDynamicObject(1238, -2073.45532, -138.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 9 ] =CreateDynamicObject(1238, -2073.45532, -140.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 10 ] =CreateDynamicObject(1238, -2073.45532, -142.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 11 ] =CreateDynamicObject(1238, -2073.45532, -144.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 12 ] =CreateDynamicObject(1238, -2073.45532, -146.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 13 ] =CreateDynamicObject(1238, -2073.45532, -148.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 14 ] =CreateDynamicObject(1238, -2073.45532, -150.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 15 ] =CreateDynamicObject(1238, -2073.45532, -152.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 16 ] =CreateDynamicObject(1238, -2073.45532, -154.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 17 ] =CreateDynamicObject(1238, -2073.45532, -156.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 18 ] =CreateDynamicObject(1238, -2073.45532, -158.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 19 ] =CreateDynamicObject(1238, -2073.45532, -160.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 20 ] =CreateDynamicObject(1238, -2073.45532, -162.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 21 ] =CreateDynamicObject(1238, -2073.45532, -164.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 22 ] =CreateDynamicObject(1238, -2073.45532, -166.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 23 ] =CreateDynamicObject(1238, -2073.45532, -168.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 24 ] =CreateDynamicObject(1238, -2071.95532, -170.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 25 ] =CreateDynamicObject(1238, -2069.95532, -170.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 26 ] =CreateDynamicObject(1238, -2067.95532, -170.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 27 ] =CreateDynamicObject(1238, -2063.95532, -170.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 28 ] =CreateDynamicObject(1238, -2061.95532, -170.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 29 ] =CreateDynamicObject(1238, -2059.95532, -170.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 30 ] =CreateDynamicObject(1238, -2057.95532, -170.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 31 ] =CreateDynamicObject(1238, -2055.95532, -170.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 32 ] =CreateDynamicObject(1238, -2053.95532, -170.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 33 ] =CreateDynamicObject(1238, -2051.95532, -170.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 34 ] =CreateDynamicObject(1238, -2049.95532, -170.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 35 ] =CreateDynamicObject(1238, -2047.95532, -170.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 36 ] =CreateDynamicObject(1238, -2045.95532, -170.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 37 ] =CreateDynamicObject(1238, -2043.95532, -170.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 38 ] =CreateDynamicObject(1238, -2041.95532, -170.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 39 ] =CreateDynamicObject(1238, -2039.95532, -170.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 40 ] =CreateDynamicObject(1238, -2037.95532, -170.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 41 ] =CreateDynamicObject(1238, -2035.95532, -170.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 42 ] =CreateDynamicObject(1238, -2033.95532, -170.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 43 ] =CreateDynamicObject(1238, -2031.95532, -170.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 44 ] =CreateDynamicObject(1238, -2029.95532, -170.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 45 ] =CreateDynamicObject(1238, -2027.95532, -170.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 46 ] =CreateDynamicObject(1238, -2025.95532, -170.33470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 47 ] =CreateDynamicObject(1238, -2063.41577, -162.31470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 48 ] =CreateDynamicObject(1238, -2061.41577, -162.31470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 49 ] =CreateDynamicObject(1238, -2059.41577, -162.31470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 50 ] =CreateDynamicObject(1238, -2057.41577, -162.31470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 51 ] =CreateDynamicObject(1238, -2055.41577, -162.31470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 52 ] =CreateDynamicObject(1238, -2053.41577, -162.31470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 53 ] =CreateDynamicObject(1238, -2051.41577, -162.31470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 54 ] =CreateDynamicObject(1238, -2049.41577, -162.31470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 55 ] =CreateDynamicObject(1238, -2047.41577, -162.31470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 56 ] =CreateDynamicObject(1238, -2045.41577, -162.31470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 57 ] =CreateDynamicObject(1238, -2043.41577, -162.31470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 58 ] =CreateDynamicObject(1238, -2041.41577, -162.31470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 59 ] =CreateDynamicObject(1238, -2039.41577, -162.31470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 60 ] =CreateDynamicObject(1238, -2037.41577, -162.31470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 61 ] =CreateDynamicObject(1238, -2035.41577, -162.31470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 62 ] =CreateDynamicObject(1238, -2033.41577, -162.31470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 63 ] =CreateDynamicObject(1238, -2031.41577, -162.31470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 64 ] =CreateDynamicObject(1238, -2029.41577, -162.31470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 65 ] =CreateDynamicObject(1238, -2027.41577, -162.31470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 66 ] =CreateDynamicObject(1238, -2025.41577, -162.31470, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 67 ] =CreateDynamicObject(1238, -2023.46472, -168.31451, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 68 ] =CreateDynamicObject(1238, -2023.43042, -165.33185, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 69 ] =CreateDynamicObject(1238, -2065.53345, -124.27780, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 70 ] =CreateDynamicObject(1238, -2065.53345, -126.27780, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 71 ] =CreateDynamicObject(1238, -2065.53345, -128.27780, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 72 ] =CreateDynamicObject(1238, -2065.53345, -130.27780, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 73 ] =CreateDynamicObject(1238, -2065.53345, -132.27780, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 74 ] =CreateDynamicObject(1238, -2065.53345, -134.27780, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 75 ] =CreateDynamicObject(1238, -2065.53345, -136.27780, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 76 ] =CreateDynamicObject(1238, -2065.53345, -138.27780, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 77 ] =CreateDynamicObject(1238, -2065.53345, -140.27780, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 78 ] =CreateDynamicObject(1238, -2065.53345, -142.27780, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 79 ] =CreateDynamicObject(1238, -2065.53345, -144.27780, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 80 ] =CreateDynamicObject(1238, -2065.53345, -146.27780, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 81 ] =CreateDynamicObject(1238, -2065.53345, -148.27780, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 82 ] =CreateDynamicObject(1238, -2065.53345, -150.27780, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 83 ] =CreateDynamicObject(1238, -2065.53345, -152.27780, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 84 ] =CreateDynamicObject(1238, -2065.53345, -154.27780, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 85 ] =CreateDynamicObject(1238, -2065.53345, -156.27780, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 86 ] =CreateDynamicObject(1238, -2065.53345, -158.27780, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 87 ] =CreateDynamicObject(1238, -2065.53345, -160.27780, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 88 ] =CreateDynamicObject(1238, -2065.53345, -170.27780, 34.69720,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][ 89 ] =CreateDynamicObject(1238, -2067.52661, -121.66808, 34.69718,   0.00000, 0.00000, 0.00000, .playerid = playerid);				
			Streamer_SetIntData(STREAMER_TYPE_RACE_CP, CreateDynamicRaceCP(2, -2028.6050, -166.4487, 34.8544, 0.0, 0.0, 0.0, 8, .playerid = playerid, .streamdistance = 99999 ), E_STREAMER_EXTRA_ID, e_CP_Dmv );

			PlayerTextDrawSetString( playerid, InfosTD, "Ban phai chay qua cac duong cong hep de den dich.");
			PlayerTextDrawShow(playerid, InfosTD);
		}
		case e_Dmv_Pop:
		{
			vehicleid = CreateVehicleEx(596, -2054.4883, -128.8904, 35.0049, 180.0000, 0, 1, -1);
			Streamer_SetIntData( STREAMER_TYPE_AREA, PlayerInfo[ playerid ][ c_DmvAreas ][ 0 ] =CreateDynamicPolygon
			(
				Float:
				{
					-2054.4324, -124.7729, -2051.5396, -126.7658, -2048.7554, -128.6833, -2049.3643, -174.3197, -2049.9182, -177.3782, -2050.5503, -180.6644, -2051.6487, -184.4770, -2053.0002, -187.7755, 
					-2054.8926, -190.6648, -2056.0972, -193.3858, -2055.8782, -213.6030, -2051.6021, -218.9725, -2049.8171, -223.2780, -2049.0969, -240.0357, -2053.1506, -242.8182, -2057.2544, -240.6281,
					-2057.7139, -222.4913, -2060.1440, -220.0547, -2062.3481, -216.4624, -2062.7676, -209.4804, -2062.6707, -205.2292, -2062.8086, -200.3463, -2062.6494, -191.9327, -2058.6028, -183.8591,
					-2057.2805, -180.3643, -2057.7617, -176.9307, -2058.5952, -173.9440, -2059.7180, -128.7036, -2057.2810, -126.7197, -2054.4324, -124.7729
				},
				.playerid = playerid), E_STREAMER_EXTRA_ID, e_Area_Dmv 
			);			
			PlayerInfo[ playerid ][ c_DmvObjs ][0] =CreateDynamicObject(1593, -2052.65234, -168.32585, 34.41076,   0.00000, 0.00000, -62.22000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][1] =CreateDynamicObject(1593, -2052.65234, -168.32585, 34.41353,   0.00000, 0.00000, -116.93999, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][2] =CreateDynamicObject(1593, -2054.23682, -168.33516, 34.39985,   0.00000, 0.00000, -62.22000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][3] =CreateDynamicObject(1593, -2054.28003, -168.29855, 34.41353,   0.00000, 0.00000, -116.93999, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][4] =CreateDynamicObject(1593, -2055.84473, -168.30618, 34.41353,   0.00000, 0.00000, -116.93999, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][5] =CreateDynamicObject(1593, -2055.81055, -168.27751, 34.40689,   0.00000, 0.00000, -62.22000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][6] =CreateDynamicObject(1238, -2051.01050, -169.56551, 34.66124,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][7] =CreateDynamicObject(1238, -2057.42114, -169.15189, 34.66124,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][8] =CreateDynamicObject(1238, -2058.37085, -171.29370, 34.66124,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][9] =CreateDynamicObject(1238, -2049.78979, -171.69026, 34.66124,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][10] =CreateDynamicObject(1238, -2049.36426, -174.31972, 34.66124,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][11] =CreateDynamicObject(1238, -2049.91821, -177.37819, 34.66124,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][12] =CreateDynamicObject(1238, -2050.55029, -180.66441, 34.66124,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][13] =CreateDynamicObject(1238, -2051.65112, -184.49689, 34.66124,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][14] =CreateDynamicObject(1238, -2058.59521, -173.94395, 34.66124,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][15] =CreateDynamicObject(1238, -2057.76172, -176.93074, 34.66124,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][16] =CreateDynamicObject(1238, -2057.26074, -180.36061, 34.66124,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][17] =CreateDynamicObject(1238, -2058.58545, -183.86908, 34.66124,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][18] =CreateDynamicObject(1238, -2059.95947, -186.63252, 34.66124,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][19] =CreateDynamicObject(1238, -2061.38452, -189.32382, 34.66124,   0.00000, 0.00000, 0.06000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][20] =CreateDynamicObject(1238, -2062.64941, -191.93272, 34.66124,   0.00000, 0.00000, 0.06000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][21] =CreateDynamicObject(1238, -2053.02344, -187.79172, 34.66124,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][22] =CreateDynamicObject(1238, -2054.91235, -190.66133, 34.66124,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][23] =CreateDynamicObject(1238, -2056.09717, -193.38580, 34.66124,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][24] =CreateDynamicObject(1238, -2056.07397, -197.39780, 34.66124,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][25] =CreateDynamicObject(1238, -2056.09814, -201.39827, 34.66124,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][26] =CreateDynamicObject(1238, -2062.78198, -196.10622, 34.66124,   0.00000, 0.00000, 0.06000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][27] =CreateDynamicObject(1238, -2062.80859, -200.34633, 34.66124,   0.00000, 0.00000, 0.06000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][28] =CreateDynamicObject(1238, -2062.67065, -205.22922, 34.66124,   0.00000, 0.00000, 0.06000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][29] =CreateDynamicObject(1238, -2055.94116, -205.17680, 34.66124,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][30] =CreateDynamicObject(1238, -2062.76758, -209.48041, 34.66124,   0.00000, 0.00000, 0.06000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][31] =CreateDynamicObject(1238, -2055.72729, -209.27083, 34.66124,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][32] =CreateDynamicObject(1238, -2055.87817, -213.60304, 34.66124,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][33] =CreateDynamicObject(1238, -2062.63623, -213.45860, 34.66124,   0.00000, 0.00000, 0.06000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][34] =CreateDynamicObject(1238, -2053.81616, -216.34331, 34.66124,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][35] =CreateDynamicObject(1238, -2062.36035, -216.44653, 34.66124,   0.00000, 0.00000, 0.06000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][36] =CreateDynamicObject(1238, -2053.79761, -216.32195, 34.66124,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][37] =CreateDynamicObject(1238, -2060.15625, -220.03883, 34.66124,   0.00000, 0.00000, 0.06000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][38] =CreateDynamicObject(1238, -2057.71387, -222.49126, 34.66124,   0.00000, 0.00000, 0.06000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][39] =CreateDynamicObject(1238, -2051.60205, -218.97252, 34.66124,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][40] =CreateDynamicObject(1238, -2049.81714, -223.27798, 34.66124,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][41] =CreateDynamicObject(1238, -2049.69727, -228.33189, 34.66124,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][42] =CreateDynamicObject(1238, -2049.46533, -232.42114, 34.66124,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][43] =CreateDynamicObject(1238, -2057.42139, -228.73727, 34.66124,   0.00000, 0.00000, 0.06000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][44] =CreateDynamicObject(1238, -2057.31592, -233.02260, 34.66124,   0.00000, 0.00000, 0.06000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][45] =CreateDynamicObject(1238, -2049.29346, -235.86818, 34.66124,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][46] =CreateDynamicObject(1238, -2057.28613, -236.54527, 34.66124,   0.00000, 0.00000, 0.06000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][47] =CreateDynamicObject(1238, -2049.09692, -240.03574, 34.66124,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][48] =CreateDynamicObject(1238, -2057.25439, -240.62811, 34.66124,   0.00000, 0.00000, 0.06000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][49] =CreateDynamicObject(1238, -2053.15063, -242.81819, 34.66124,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][50] =CreateDynamicObject(1238, -2054.43237, -124.77295, 34.62208,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][51] =CreateDynamicObject(1238, -2057.28101, -126.71973, 34.62208,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][52] =CreateDynamicObject(1238, -2051.53955, -126.76584, 34.62208,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][53] =CreateDynamicObject(1238, -2048.75537, -128.68329, 34.62208,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][54] =CreateDynamicObject(1238, -2059.71802, -128.70363, 34.62208,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][55] =CreateDynamicObject(1238, -2053.21948, -239.37546, 34.66124,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			Streamer_SetIntData(STREAMER_TYPE_RACE_CP, CreateDynamicRaceCP(2, -2053.2195, -239.3755, 34.6612, 0.0, 0.0, 0.0, 8, .playerid = playerid, .streamdistance = 99999 ), E_STREAMER_EXTRA_ID, e_CP_Dmv );

			PlayerTextDrawSetString( playerid, InfosTD, "Hai trong so cac banh xe da bi hong,~n~hay co gang kiem soat toc do va chay den dich.");
			PlayerTextDrawShow(playerid, InfosTD);
		}
		case e_Dmv_Lap:
		{
			vehicleid = CreateVehicleEx(429, -2056.7771, -143.3583, 35.1122, 180.0000, 2, 1, -1);
			Streamer_SetIntData( STREAMER_TYPE_AREA, PlayerInfo[ playerid ][ c_DmvAreas ][ 0 ] =CreateDynamicCube( -2062.9426, -127.5704, 34.2822, -2041.1945, -206.4969, 38.2793, .playerid = playerid ), E_STREAMER_EXTRA_ID, e_Area_Dmv );
			PlayerInfo[ playerid ][ c_DmvObjs ][0] =CreateDynamicObject(1238, -2062.67896, -127.79225, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][1] =CreateDynamicObject(1238, -2058.67896, -127.79225, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][2] =CreateDynamicObject(1238, -2054.67896, -127.79225, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][3] =CreateDynamicObject(1238, -2050.67896, -127.79225, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][4] =CreateDynamicObject(1238, -2046.67896, -127.79225, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][5] =CreateDynamicObject(1238, -2042.67896, -127.79225, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][6] =CreateDynamicObject(1238, -2062.67896, -206.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][7] =CreateDynamicObject(1238, -2058.67896, -206.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][8] =CreateDynamicObject(1238, -2054.67896, -206.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][9] =CreateDynamicObject(1238, -2050.67896, -206.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][10] =CreateDynamicObject(1238, -2046.67896, -206.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][11] =CreateDynamicObject(1238, -2042.67896, -206.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][12] =CreateDynamicObject(1238, -2041.46570, -206.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][13] =CreateDynamicObject(1238, -2041.46570, -202.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][14] =CreateDynamicObject(1238, -2041.46570, -198.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][15] =CreateDynamicObject(1238, -2041.46570, -194.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][16] =CreateDynamicObject(1238, -2041.46570, -190.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][17] =CreateDynamicObject(1238, -2041.46570, -186.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][18] =CreateDynamicObject(1238, -2041.46570, -182.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][19] =CreateDynamicObject(1238, -2041.46570, -178.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][20] =CreateDynamicObject(1238, -2041.46570, -174.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][21] =CreateDynamicObject(1238, -2041.46570, -170.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][22] =CreateDynamicObject(1238, -2041.46570, -166.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][23] =CreateDynamicObject(1238, -2041.46570, -162.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][24] =CreateDynamicObject(1238, -2041.46570, -158.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][25] =CreateDynamicObject(1238, -2041.46570, -154.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][26] =CreateDynamicObject(1238, -2041.46570, -150.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][27] =CreateDynamicObject(1238, -2041.46570, -146.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][28] =CreateDynamicObject(1238, -2041.46570, -142.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][29] =CreateDynamicObject(1238, -2041.46570, -138.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][30] =CreateDynamicObject(1238, -2041.46570, -134.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][31] =CreateDynamicObject(1238, -2041.46570, -130.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][32] =CreateDynamicObject(1238, -2062.67896, -206.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][33] =CreateDynamicObject(1238, -2062.67896, -202.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][34] =CreateDynamicObject(1238, -2062.67896, -198.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][35] =CreateDynamicObject(1238, -2062.67896, -194.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][36] =CreateDynamicObject(1238, -2062.67896, -190.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][37] =CreateDynamicObject(1238, -2062.67896, -186.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][38] =CreateDynamicObject(1238, -2062.67896, -182.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][39] =CreateDynamicObject(1238, -2062.67896, -178.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][40] =CreateDynamicObject(1238, -2062.67896, -174.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][41] =CreateDynamicObject(1238, -2062.67896, -170.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][42] =CreateDynamicObject(1238, -2062.67896, -166.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][43] =CreateDynamicObject(1238, -2062.67896, -162.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][44] =CreateDynamicObject(1238, -2062.67896, -158.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][45] =CreateDynamicObject(1238, -2062.67896, -154.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][46] =CreateDynamicObject(1238, -2062.67896, -150.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][47] =CreateDynamicObject(1238, -2062.67896, -146.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][48] =CreateDynamicObject(1238, -2062.67896, -142.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][49] =CreateDynamicObject(1238, -2062.67896, -138.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][50] =CreateDynamicObject(1238, -2062.67896, -134.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][51] =CreateDynamicObject(1238, -2062.67896, -130.28110, 34.65860,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][52] =CreateDynamicObject(19425, -2053.34180, -139.71809, 34.35240,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][53] =CreateDynamicObject(19425, -2056.64966, -139.71471, 34.35240,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][54] =CreateDynamicObject(19425, -2059.97119, -139.70490, 34.36840,   0.00000, 0.00000, 0.00000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][55] =CreateDynamicObject(979, -2051.68750, -144.48260, 35.13520,   0.00000, 0.00000, -90.42000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][56] =CreateDynamicObject(979, -2051.68750, -155.45621, 35.13520,   0.00000, 0.00000, -90.42000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][57] =CreateDynamicObject(979, -2051.68750, -166.75470, 35.13520,   0.00000, 0.00000, -90.42000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][58] =CreateDynamicObject(979, -2051.68750, -178.25310, 35.13520,   0.00000, 0.00000, -90.42000, .playerid = playerid);
			PlayerInfo[ playerid ][ c_DmvObjs ][59] =CreateDynamicObject(979, -2051.68750, -189.76300, 35.13520,   0.00000, 0.00000, -90.42000, .playerid = playerid);
			Streamer_SetIntData( STREAMER_TYPE_RACE_CP, CreateDynamicRaceCP(2, -2046.3871,-188.6832,35.3203, 0.0, 0.0, 0.0, 8, .playerid = playerid, .streamdistance = 99999 ), E_STREAMER_EXTRA_ID, e_CP_Dmv );
			SetPVarInt( playerid, INT_pvarDmvLap, 1 );

			SetPVarInt( playerid, INT_pvarDmvLap, 0 );	
			PlayerTextDrawSetString( playerid, InfosTD, "Drift nhanh 5 lan,~n~co gang ap dung nhung gi ban da duoc hoc.");
			PlayerTextDrawShow(playerid, InfosTD);
		}
	}
	SetVehicleNumberPlate(vehicleid, "DMV CAR");
	new engine,lights,alarm,doors,bonnet,boot,objective;
	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	SetVehicleParamsEx(vehicleid,VEHICLE_PARAMS_OFF,VEHICLE_PARAMS_OFF,alarm,doors,bonnet,boot,objective);
	SetPlayerVirtualWorld(playerid, vehicleid);
	SetVehicleVirtualWorld(vehicleid, vehicleid);
	SetPVarInt(playerid, INT_pvarDmvVeh, vehicleid);
	SetPVarInt(playerid, INT_pvarDmvTime, DmvTimes[test_drive]);
	PutPlayerInVehicle( playerid, vehicleid, 0 );
	Streamer_Update( playerid );
 	PlayerInfo[ playerid ][ c_Dmv ] = test_drive;
 	PlayerInfo[ playerid ][ c_DmvLastStage ] = test_drive;
	return false;
}
hook OnPlayerUpdate(playerid) 
{
	if(DrivingTest[playerid] == 1) {
		new vehicleid = GetPlayerVehicleID(playerid);
		if(vehicleid) {
			new engine,lights,alarm,doors,bonnet,boot,objective;
			GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
			if(engine == VEHICLE_PARAMS_ON) {
				switch(PlayerInfo[playerid][c_Dmv]) {
					case e_Dmv_Circle: {
						static Float:Z;
						GetVehicleZAngle(vehicleid, Z);
						if( 260.0 <= Z <= 270.0 ) SetPVarInt(playerid, INT_pvarDmvWest, true);
						else if( 80.0 <= Z <= 90.0 ) SetPVarInt(playerid, INT_pvarDmvEast, true);
						else if( 170.0 <= Z <= 180.0 ) {
							if( !!GetPVarInt(playerid, INT_pvarDmvWest) == true && !!GetPVarInt(playerid, INT_pvarDmvEast ) == true ) {
								GUI_InitDMV( playerid, e_Dmv_180 );
								DMV_DestroyMap(playerid);
							}
						}
					}
					case e_Dmv_Pop: {
						if( GetVehicleDistanceFromPoint(vehicleid, -2052.65234, -168.32585, 34.41076) <= 3.0 ) {
							new Panels, Doors, Lights, Tires;
							GetVehicleDamageStatus(vehicleid, Panels, Doors, Lights, Tires);
							UpdateVehicleDamageStatus(vehicleid, Panels, Doors, Lights, (Tires | 0b0011));
						}
					}
				}
			}
		}
	}
	return 1;
}
hook OnPlayerDisconnect(playerid, reason) {
	DMV_DestroyMapObjs(playerid), 
	DMV_End(playerid, 1);
	return 1;
}
hook OnPlayerDeath(playerid, killerid, reason) {
	if(DrivingTest[playerid] == 1) {
		DMV_End(playerid, 1);
		GUI_DestroyCurrentUI(playerid);		
	}
	return 1;
}
GUI_InitDMV( playerid, newtest) {
	if(SelectTD[playerid] != 0) return 1;
	PlayerTextDrawHide(playerid, InfosTD);
	new PlayerText:i = PlayerInfo[playerid][c_GUI_Elements][0] = CreatePlayerTextDraw(playerid, 453.000000, 170.812500, "usebox");
	PlayerTextDrawLetterSize(playerid, i, 0.000000, 17.669445);
	PlayerTextDrawTextSize(playerid, i, 187.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, i, 1);
	PlayerTextDrawColor(playerid, i, 0);
	PlayerTextDrawUseBox(playerid, i, true);
	PlayerTextDrawBoxColor(playerid, i, 102);
	PlayerTextDrawSetShadow(playerid, i, 0);
	PlayerTextDrawSetOutline(playerid, i, 0);
	PlayerTextDrawFont(playerid, i, 0);
	PlayerTextDrawShow(playerid, i);
	Iter_Add(TextsOnClient<playerid>, _:i);
	PlayerInfo[playerid][c_GUI_Elements][1] = i = CreatePlayerTextDraw(playerid, 321.500000, 148.750000, "ld_drv:ribb");
	PlayerTextDrawLetterSize(playerid, i, 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, i, 98.000000, 39.812500);
	PlayerTextDrawAlignment(playerid, i, 1);
	PlayerTextDrawColor(playerid, i, -1);
	PlayerTextDrawSetShadow(playerid, i, 0);
	PlayerTextDrawSetOutline(playerid, i, 0);
	PlayerTextDrawFont(playerid, i, 4);
	PlayerTextDrawShow(playerid, i);
	Iter_Add(TextsOnClient<playerid>, _:i);
	PlayerInfo[playerid][c_GUI_Elements][2] = i = CreatePlayerTextDraw(playerid, 322.000000, 148.750000, "ld_drv:ribb");
	PlayerTextDrawLetterSize(playerid, i, 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, i, -105.000000, 40.687500);
	PlayerTextDrawAlignment(playerid, i, 1);
	PlayerTextDrawColor(playerid, i, -1);
	PlayerTextDrawSetShadow(playerid, i, 0);
	PlayerTextDrawSetOutline(playerid, i, 0);
	PlayerTextDrawFont(playerid, i, 4);
	PlayerTextDrawShow(playerid, i);
	Iter_Add(TextsOnClient<playerid>, _:i);
	PlayerInfo[playerid][c_GUI_Elements][3] = i = CreatePlayerTextDraw(playerid, 262.000000, 129.500000, "ld_drv:gold");
	PlayerTextDrawLetterSize(playerid, i, 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, i, 109.500000, 81.375000);
	PlayerTextDrawAlignment(playerid, i, 1);
	PlayerTextDrawColor(playerid, i, -1);
	PlayerTextDrawSetShadow(playerid, i, 0);
	PlayerTextDrawSetOutline(playerid, i, 0);
	PlayerTextDrawFont(playerid, i, 4);
	PlayerTextDrawShow(playerid, i);
	Iter_Add(TextsOnClient<playerid>, _:i);
	new string[64];
	format(string, 63, "%s~n~~y~PASSED", DmvNames[PlayerInfo[playerid][c_Dmv]]);
	PlayerInfo[playerid][c_GUI_Elements][4] = i = CreatePlayerTextDraw(playerid, 320.500000, 72.625000, string);
	PlayerTextDrawLetterSize(playerid, i, 0.822500, 2.671876);
	PlayerTextDrawAlignment(playerid, i, 2);
	PlayerTextDrawColor(playerid, i, -1);
	PlayerTextDrawSetShadow(playerid, i, 0);
	PlayerTextDrawSetOutline(playerid, i, 1);
	PlayerTextDrawBackgroundColor(playerid, i, 51);
	PlayerTextDrawFont(playerid, i, 3);
	PlayerTextDrawSetProportional(playerid, i, 1);
	PlayerTextDrawShow(playerid, i);
	Iter_Add(TextsOnClient<playerid>, _:i);
	PlayerInfo[playerid][c_GUI_Elements][5] = i = CreatePlayerTextDraw(playerid, 372.500000, 317.187500, "continue");
	PlayerTextDrawLetterSize(playerid, i, 0.367500, 1.315624);
	PlayerTextDrawAlignment(playerid, i, 1);
	PlayerTextDrawColor(playerid, i, -5963521);
	PlayerTextDrawSetShadow(playerid, i, 0);
	PlayerTextDrawSetOutline(playerid, i, 1);
	PlayerTextDrawBackgroundColor(playerid, i, 51);
	PlayerTextDrawFont(playerid, i, 2);
	PlayerTextDrawSetProportional(playerid, i, 1);
	PlayerTextDrawSetSelectable(playerid, i, true);
	PlayerTextDrawShow(playerid, i);
	Iter_Add(TextsOnClient<playerid>, _:i);
	PlayerInfo[playerid][c_GUI_Elements][6] = i = CreatePlayerTextDraw(playerid, 195.000000, 316.312500, "cancel");
	PlayerTextDrawLetterSize(playerid, i, 0.395000, 1.359374);
	PlayerTextDrawTextSize(playerid, i, 269.000000, 66.000000);
	PlayerTextDrawAlignment(playerid, i, 1);
	PlayerTextDrawColor(playerid, i, -5963521);
	PlayerTextDrawSetShadow(playerid, i, 0);
	PlayerTextDrawSetOutline(playerid, i, 1);
	PlayerTextDrawBackgroundColor(playerid, i, 51);
	PlayerTextDrawFont(playerid, i, 2);
	PlayerTextDrawSetProportional(playerid, i, 1);
	PlayerTextDrawSetSelectable(playerid, i, true);
	PlayerTextDrawShow(playerid, i);
	Iter_Add(TextsOnClient<playerid>, _:i);
	if( newtest > e_Dmv_None ) {
		SetPVarInt(playerid, INT_pvarDmvNext, newtest);
		format(string, 63, "New test available:~n~~y~%s", DmvNames[newtest]);
		PlayerInfo[playerid][c_GUI_Elements][7] = i = CreatePlayerTextDraw(playerid, 318.000000, 233.187500, string);
		PlayerTextDrawLetterSize(playerid, i, 0.502499, 1.840625);
		PlayerTextDrawAlignment(playerid, i, 2);
		PlayerTextDrawColor(playerid, i, -1);
		PlayerTextDrawSetShadow(playerid, i, 0);
		PlayerTextDrawSetOutline(playerid, i, 1);
		PlayerTextDrawBackgroundColor(playerid, i, 51);
		PlayerTextDrawFont(playerid, i, 3);
		PlayerTextDrawSetProportional(playerid, i, 1);
		PlayerTextDrawShow(playerid, i);
		Iter_Add(TextsOnClient<playerid>, _:i);
	}
	SelectTextDraw(playerid, 0x708090FF), SelectTD[playerid] = 3;
	return true;
}
GUI_DestroyCurrentUI( const playerid ) {
	if( SelectTD[playerid] == 0 )
		return false;
	TogglePlayerControllable( playerid, true ), SelectTD[playerid] = 0;

	foreach (new i : TextsOnClient<playerid>)
		PlayerTextDrawDestroy( playerid, PlayerText:i);

	Iter_Clear(TextsOnClient<playerid>);
	return true;
}
DMV_DestroyMap(playerid){
	if( DrivingTest[playerid] != 1 ) return 1;

	DMV_DestroyMapObjs(playerid);
	DestroyDynamicRaceCP(GetPlayerVisibleDynamicRaceCP(playerid));
	SetPlayerVirtualWorld( playerid, 0 );
	PlayerInfo[ playerid ][ c_Dmv ] = e_Dmv_None;

	DeletePVar(playerid, INT_pvarDmvWest);
	DeletePVar(playerid, INT_pvarDmvEast);
	DeletePVar(playerid, INT_pvarDmvLap);
	DeletePVar(playerid, INT_pvarDmvTime);
	DeletePVar(playerid, INT_pvarDmvVeh);
	PlayerTextDrawHide(playerid, InfosTD);
	return true;
}
DMV_DestroyMapObjs(playerid){
	if( DrivingTest[playerid] != 1 ) return 1;
	new obj, i = 0;
	for( i = 0; i < 91; i++ )
	{
		obj = PlayerInfo[ playerid ][ c_DmvObjs ][ i ];

		if( obj != 0 )
			DestroyDynamicObject( obj );

		PlayerInfo[ playerid ][ c_DmvObjs ][ i ] = 0;
	}

	for( i = 0; i < 3; i++ )
	{
		obj = PlayerInfo[ playerid ][ c_DmvAreas ][ i ];

		if( obj != 0 )
			DestroyDynamicArea( obj );

		PlayerInfo[ playerid ][ c_DmvAreas ][ i ] = 0;
	}
	DestroyDynamicRaceCP( GetPlayerVisibleDynamicRaceCP( playerid ) );
	DestroyVehicle( GetPVarInt( playerid, INT_pvarDmvVeh ) );
	PlayerTextDrawHide(playerid, InfosTD);
	return true;
}
DMV_End(playerid, failed) {
	if( DrivingTest[playerid] != 1 ) return 1;
	DrivingTest[playerid] = 0;
	CP[playerid] = 0;
	stop DrivingTestTimer[playerid];
	DrivingTestTimer[playerid] = Timer:0;
	DMV_DestroyMap(playerid);
	SetPlayerPosEx( playerid, ExamPos[0],ExamPos[1],ExamPos[2]);
	
	PlayerTextDrawHide(playerid, InfosTD);
	if( failed == 0 ) {
		//if(PlayerInfo[playerid][pLevel] < 5) defer MAGTutorial(playerid);
		PlayerInfo[playerid][pCarLic] = 1;
		PlayerInfo[playerid][pCarLicT] = 50;
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "Ban da duoc cap giay phep lai xe trong 50 gio. Chuc mung!");
		va_mysql_query("UPDATE users SET `CarLic`='1',`CarLicT`='50' WHERE `ID`='%d'",PlayerInfo[playerid][pSQLID]);	
		if(PlayerInfo[playerid][pLevel] < 2) {
			new string[179];
			format(string, sizeof(string), "Ban da nhan duoc tat ca giay phep ngoai tru vu khi trong 10 gio vi ban la nguoi moi bat dau.\nChuc ban online vui tren may chu!\nNeu ban can tro giup, dung quen su dung lenh /n.");
			Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "", string, "Close", "");
			PlayerInfo[playerid][pFlyLicT] = 10;
			PlayerInfo[playerid][pFlyLic] = 1;
			PlayerInfo[playerid][pBoatLicT] = 10;
			PlayerInfo[playerid][pBoatLic] = 1;				
		}
		if(PlayerInfo[playerid][pTutorial] == 0) 
		{
			PlayerInfo[playerid][pTutorial] = 1;
			Tutorial(playerid);
		}
		finishAchievement(playerid, 6);	

		SendClientMessage(playerid, COLOR_YELLOW, "* Xin chuc mung, ban da vuot qua ki thi bang lai va nhan duoc giay phep lai xe.");
		GameTextForPlayer( playerid, "Mission passed!~n~~w~Driving license acquired!", 5000, 0 );
	}
	else {
		// if(PlayerInfo[playerid][pTutorial] == 1) return SendClientMessage(playerid, COLOR_YELLOW, "* De co the tiep tuc voi huong dan, ban can phai co giay phep lai xe, su dung /thibanglai de kiem tra lai."), GameTextForPlayer( playerid, "~r~Mission failed!", 5000, 0 );
		// else return 
		SendClientMessage(playerid, COLOR_YELLOW, "* Ban da bo cuoc, nhung dung nan chi. Ban co the thu lai bat cu luc nao.");
	}
	return true;
}
