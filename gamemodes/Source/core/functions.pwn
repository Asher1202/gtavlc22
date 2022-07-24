
SendSuccessMessage(playerid, str[]) {
	return	va_SendClientMessage(playerid, COLOR_GREY, "{00FF00}[!] {FFFFFF}%s", str);
}

SendFailMessage(playerid, str[]) {
	return va_SendClientMessage(playerid, COLOR_GREY, "{FF0000}[!] {FFFFFF}%s", str);
}

savePlayerInfo(const playerid) {
	new query[100];
	format(query, sizeof(query), "UPDATE users SET `EscapePoints`='%d' WHERE ID=%i", PlayerInfo[playerid][pEscapePoints], PlayerInfo[playerid][pSQLID]);
	mysql_pquery(SQL, query);
}
va_Info(playerid, txt[], va_args<>) {
	return Info(playerid, va_return(txt, va_start<2>));
}
timer Timer_HideInfo[5000](playerid, _:_itxt1, _:_itxt2, _:_itxt3) {
	PlayerTextDrawDestroy(playerid, PlayerText:_itxt1);
	PlayerTextDrawDestroy(playerid, PlayerText:_itxt2);
	PlayerTextDrawDestroy(playerid, PlayerText:_itxt3);
}
Info(playerid, txt[]) {
	SendClientMessage(playerid, COLOR_YELLOW, txt);

	new PlayerText:_itxt3 = CreatePlayerTextDraw(playerid, 316.000000, 412.000000, "_");
	PlayerTextDrawFont(playerid, _itxt3, 1);
	PlayerTextDrawLetterSize(playerid, _itxt3, 0.600000, 2.499996);
	PlayerTextDrawTextSize(playerid, _itxt3, 298.500000, 199.000000);
	PlayerTextDrawSetOutline(playerid, _itxt3, 1);
	PlayerTextDrawSetShadow(playerid, _itxt3, 0);
	PlayerTextDrawAlignment(playerid, _itxt3, 2);
	PlayerTextDrawColor(playerid, _itxt3, -1);
	PlayerTextDrawBackgroundColor(playerid, _itxt3, 255);
	PlayerTextDrawBoxColor(playerid, _itxt3, 190);
	PlayerTextDrawUseBox(playerid, _itxt3, 1);
	PlayerTextDrawSetProportional(playerid, _itxt3, 1);
	PlayerTextDrawSetSelectable(playerid, _itxt3, 0);
	new PlayerText:_itxt2 = CreatePlayerTextDraw(playerid, 212.000000, 403.000000, "LD_CHAT:badchat");
	PlayerTextDrawFont(playerid, _itxt2 , 4);
	PlayerTextDrawLetterSize(playerid, _itxt2 , 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, _itxt2 , 19.500000, 18.500000);
	PlayerTextDrawSetOutline(playerid, _itxt2 , 1);
	PlayerTextDrawSetShadow(playerid, _itxt2 , 0);
	PlayerTextDrawAlignment(playerid, _itxt2 , 1);
	PlayerTextDrawColor(playerid, _itxt2 , -1);
	PlayerTextDrawBackgroundColor(playerid, _itxt2 , 255);
	PlayerTextDrawBoxColor(playerid, _itxt2 , 50);
	PlayerTextDrawUseBox(playerid, _itxt2 , 1);
	PlayerTextDrawSetProportional(playerid, _itxt2 , 1);
	PlayerTextDrawSetSelectable(playerid, _itxt2 , 0);
	new PlayerText:_itxt1 = CreatePlayerTextDraw(playerid, 231.000000, 414.000000, txt);
	PlayerTextDrawFont(playerid, _itxt1, 1);
	PlayerTextDrawLetterSize(playerid, _itxt1, 0.225000, 0.800000);
	PlayerTextDrawTextSize(playerid, _itxt1, 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, _itxt1, 1);
	PlayerTextDrawSetShadow(playerid, _itxt1, 0);
	PlayerTextDrawAlignment(playerid, _itxt1, 1);
	PlayerTextDrawColor(playerid, _itxt1, -1);
	PlayerTextDrawBackgroundColor(playerid, _itxt1, 255);
	PlayerTextDrawBoxColor(playerid, _itxt1, 50);
	PlayerTextDrawUseBox(playerid, _itxt1, 0);
	PlayerTextDrawSetProportional(playerid, _itxt1, 1);
	PlayerTextDrawSetSelectable(playerid, _itxt1, 0);

	PlayerTextDrawShow(playerid, _itxt1);
	PlayerTextDrawShow(playerid, _itxt3);
	PlayerTextDrawShow(playerid, _itxt2);

	printf("Info PTD: %d, %d, %d\n", _:_itxt1, _:_itxt2, _:_itxt3);

    defer Timer_HideInfo[10000](playerid, _:_itxt1, _:_itxt2, _:_itxt3);
	return 1;
}
DestroyWoodObject(playerid) {
	for(new i = 0; i < 7; i++) {
		if(WoodObject[playerid][i] != 0 || IsValidDynamicObject(WoodObject[playerid][i])) DestroyDynamicObject(WoodObject[playerid][i]), WoodObject[playerid][i] = 0;
	}	
	return 1;
}
saveTuning(playerid, vehicleid) {
	new idd = FindSpawnID(vehicleid);
	if(idd != 0) {
		new component;
		new query[256];
		component = GetVehicleComponentInSlot(GetPlayerVehicleID(playerid), 0);
		mysql_format(SQL, query, sizeof(query), "UPDATE cars SET mod0='%d' WHERE id=%d",component,idd);
		mysql_pquery(SQL, query);
		CarInfo[idd][mod0] = component;
		component = GetVehicleComponentInSlot(GetPlayerVehicleID(playerid), 1);
		mysql_format(SQL, query, sizeof(query), "UPDATE cars SET mod1='%d' WHERE id=%d",component,idd);
		mysql_pquery(SQL, query);
		CarInfo[idd][mod1] = component;
		component = GetVehicleComponentInSlot(GetPlayerVehicleID(playerid), 2);
		mysql_format(SQL, query, sizeof(query), "UPDATE cars SET mod2='%d' WHERE id=%d",component,idd);
		mysql_pquery(SQL, query);
		CarInfo[idd][mod2] = component;
		component = GetVehicleComponentInSlot(GetPlayerVehicleID(playerid), 3);
		mysql_format(SQL, query, sizeof(query), "UPDATE cars SET mod3='%d' WHERE id=%d",component,idd);
		mysql_pquery(SQL, query);
		CarInfo[idd][mod3] = component;
		component = GetVehicleComponentInSlot(GetPlayerVehicleID(playerid), 4);
		mysql_format(SQL, query, sizeof(query), "UPDATE cars SET mod4='%d' WHERE id=%d",component,idd);
		mysql_pquery(SQL, query);
		CarInfo[idd][mod4] = component;
		component = GetVehicleComponentInSlot(GetPlayerVehicleID(playerid), 5);
		mysql_format(SQL, query, sizeof(query), "UPDATE cars SET mod5='%d' WHERE id=%d",component,idd);
		mysql_pquery(SQL, query);
		CarInfo[idd][mod5] = component;
		component = GetVehicleComponentInSlot(GetPlayerVehicleID(playerid), 6);
		mysql_format(SQL, query, sizeof(query), "UPDATE cars SET mod6='%d' WHERE id=%d",component,idd);
		mysql_pquery(SQL, query);
		CarInfo[idd][mod6] = component;
		component = GetVehicleComponentInSlot(GetPlayerVehicleID(playerid), 7);
		mysql_format(SQL, query, sizeof(query), "UPDATE cars SET mod7='%d' WHERE id=%d",component,idd);
		mysql_pquery(SQL, query);
		CarInfo[idd][mod7] = component;
		component = GetVehicleComponentInSlot(GetPlayerVehicleID(playerid), 8);
		mysql_format(SQL, query, sizeof(query), "UPDATE cars SET mod8='%d' WHERE id=%d",component,idd);
		mysql_pquery(SQL, query);
		CarInfo[idd][mod8] = component;
		component = GetVehicleComponentInSlot(GetPlayerVehicleID(playerid), 9);
		mysql_format(SQL, query, sizeof(query), "UPDATE cars SET mod9='%d' WHERE id=%d",component,idd);
		mysql_pquery(SQL, query);
		CarInfo[idd][mod9] = component;
		component = GetVehicleComponentInSlot(GetPlayerVehicleID(playerid), 10);
		mysql_format(SQL, query, sizeof(query), "UPDATE cars SET mod10='%d' WHERE id=%d",component,idd);
		mysql_pquery(SQL, query);
		CarInfo[idd][mod10] = component;
		component = GetVehicleComponentInSlot(GetPlayerVehicleID(playerid), 11);
		mysql_format(SQL, query, sizeof(query), "UPDATE cars SET mod11='%d' WHERE id=%d",component,idd);
		mysql_pquery(SQL, query);
		CarInfo[idd][mod11] = component;
		component = GetVehicleComponentInSlot(GetPlayerVehicleID(playerid), 12);
		mysql_format(SQL, query, sizeof(query), "UPDATE cars SET mod12='%d' WHERE id=%d",component,idd);
		mysql_pquery(SQL, query);
		CarInfo[idd][mod12] = component;
		component = GetVehicleComponentInSlot(GetPlayerVehicleID(playerid), 13);
		mysql_format(SQL, query, sizeof(query), "UPDATE cars SET mod13='%d' WHERE id=%d",component,idd);
		mysql_pquery(SQL, query);
		CarInfo[idd][mod13] = component;
		BizzInfo[29][bTill] += 50;
	}	
	return 1;
}
RaceCheckpoints() {
	new x;
	switch(RaceMap) {
		case 0: x = sizeof(RaceMap1)+1;
		case 1: x = sizeof(RaceMap2)+1;
		case 2: x = sizeof(RaceMap3)+1;
		case 3: x = sizeof(RaceMap4)+1;
		case 4: x = sizeof(RaceMap5)+1;
	}
	return x;
}
DespawnVehicle(carid) {
	new dbid = FindSpawnID(carid);
	DestroyPlayerCar(dbid);
	printf("Vehicle %d despawned. [db: %d]", carid, dbid);
	return 1;
}
LoadFurnitures() {
	new Cache: db = mysql_query(SQL, "SELECT * FROM `fobjects` ORDER BY `fobjects`.`ID` ASC");
	new objects = 0, x;
 	for(new i, j = cache_num_rows(); i != j; ++i) {
	    objects ++;
       	cache_get_value_name_int(i, "ID", x);
		cache_get_value_name(i, "Name", FurnitureInfo[x][fiName]);
       	cache_get_value_name_int(i, "Model", FurnitureInfo[x][fiModel]);
       	cache_get_value_name_float(i, "X", FurnitureInfo[x][fiX]);
     	cache_get_value_name_float(i, "Y", FurnitureInfo[x][fiY]);
      	cache_get_value_name_float(i, "Z", FurnitureInfo[x][fiZ]);
       	cache_get_value_name_float(i, "RotX", FurnitureInfo[x][fiRotX]);
       	cache_get_value_name_float(i, "RotY", FurnitureInfo[x][fiRotY]);
       	cache_get_value_name_float(i, "RotZ", FurnitureInfo[x][fiRotZ]);
       	cache_get_value_name_int(i, "Virtual", FurnitureInfo[x][fiVirtual]);
	   	cache_get_value_name_int(i, "House", FurnitureInfo[x][fiHouse]);
        FurnitureInfo[x][fiObject] = CreateDynamicObject(FurnitureInfo[x][fiModel], FurnitureInfo[x][fiX], FurnitureInfo[x][fiY], FurnitureInfo[x][fiZ], FurnitureInfo[x][fiRotX], FurnitureInfo[x][fiRotY], FurnitureInfo[x][fiRotZ], FurnitureInfo[x][fiVirtual], -1, -1, 200.0);
	}
	printf("Furnitures: %d", objects);
	cache_delete(db);
	return 1;
}
// VaildFishPlace(playerid){
// 	if(IsPlayerConnected(playerid))
// 	{
// 		if(IsPlayerInRangeOfPoint(playerid, 4,403.8266,-2088.7598,7.8359) || IsPlayerInRangeOfPoint(playerid, 4,398.7553,-2088.7490,7.8359)) return 1;
// 		else if(IsPlayerInRangeOfPoint(playerid, 4,396.2197,-2088.6692,7.8359) || IsPlayerInRangeOfPoint(playerid, 4,391.1094,-2088.7976,7.8359)) return 1;
// 		else if(IsPlayerInRangeOfPoint(playerid, 4,383.4157,-2088.7849,7.8359) || IsPlayerInRangeOfPoint(playerid, 4,374.9598,-2088.7979,7.8359)) return 1;
// 		else if(IsPlayerInRangeOfPoint(playerid, 4,369.8107,-2088.7927,7.8359) || IsPlayerInRangeOfPoint(playerid, 4,367.3637,-2088.7925,7.8359)) return 1;
// 		else if(IsPlayerInRangeOfPoint(playerid, 4,362.2244,-2088.7981,7.8359) || IsPlayerInRangeOfPoint(playerid, 4,354.5382,-2088.7979,7.8359)) return 1;
// 		//
// 		else if(IsPlayerInRangeOfPoint(playerid, 4,562.1295,-1970.2815,2.4359) || IsPlayerInRangeOfPoint(playerid, 4,559.3134,-1968.3323,2.4359)) return 1;
// 		else if(IsPlayerInRangeOfPoint(playerid, 4,565.6227,-1968.4651,2.4359) || IsPlayerInRangeOfPoint(playerid, 4,564.8177,-1971.9146,2.4359)) return 1;
// 		//
// 		else if(IsPlayerInRangeOfPoint(playerid, 10,2000.5741,1563.2089,15.3672)) return 1;
// 	}
// 	return 0;
// }
ShowRandomFishingKey(playerid) {
	if(Times[playerid] < 20) {
		new oldkey = FishingKey[playerid];

		do FishingKey[playerid] = random(3); 
		while(oldkey == FishingKey[playerid]);
		/* Hien ki tu */

		TextDrawShowForPlayer(playerid, KhungKey);
		if(FishingKey[playerid] == 0) PlayerTextDrawSetString(playerid, Key, "Y"); 
		else if(FishingKey[playerid] == 1) PlayerTextDrawSetString(playerid, Key, "N");
		else PlayerTextDrawSetString(playerid, Key, "H");
		PlayerTextDrawShow(playerid, Key);
	}
	else {
		PlayerTextDrawHide(playerid, Key);
		TextDrawHideForPlayer(playerid, KhungKey);
		HidePlayerProgressBar(playerid, jProgress[playerid]);
		DestroyPlayerProgressBar(playerid, jProgress[playerid]);
		Fishing[playerid] = 0;
		stop TimeOut[playerid];
		TimeOut[playerid] = Timer:0;		
		Fish(playerid);
	}
	return 1;
}
BatDauCauCa(playerid) {
	Times[playerid] = 0;
	Fishing[playerid] = 1;

	defer Countdown(playerid, 5);
	return 1;
}
ShowFishingBar(playerid) {
	jProgress[playerid] = CreatePlayerProgressBar(playerid, 247.00, 420.00, 142.50, 8.19, -1048321, 200.0);
	SetPlayerProgressBarMaxValue(playerid, jProgress[playerid], 200);
	SetPlayerProgressBarValue(playerid, jProgress[playerid], 0);
	ShowPlayerProgressBar(playerid, jProgress[playerid]);
	return 1;
}
RandomEx(min, max) { return random(max - min) + min; } // By Y_Less

PersonalCar(playerid) {
	for(new i = 0; i < 11; i++) {
		if(CarInfo[PlayerInfo[playerid][pCarKey][i]][Spawned] == GetPlayerVehicleID(playerid) && IsPlayerInAnyVehicle(playerid)) return PlayerInfo[playerid][pCarKey][i];
	}
	return -1;
}
function XeCaNhan(playerid) {
	for(new i = 0; i < 10; i++) {
		if(CarInfo[PlayerInfo[playerid][pCarKey][i]][Spawned] == GetClosestVehicle(playerid)) return PlayerInfo[playerid][pCarKey][i];
	}
	return -1;
}
cadouzb() { 
	if(cadoumsg == 1) return 1;
	new indiciu = random(2);cadoulevel = 1 + random(4);
	switch(indiciu) {
		case 0:
			cadouzburator = CreateObject(19054,3066.0925,2091.6895,322.0981, 0,0,0, 500),
			MoveObject(cadouzburator,2901.3501,2040.6469,10.8203,30),
			SCMTA(COLOR_DEPART, "[GIFTBOX] Mot vat the la roi ra khoi UFO thang xuong thanh pho Las Venturas'. Goi y: Ocean.");
		case 1:
			cadouzburator = CreateObject(19054,1342.2188,-2685.3093,273.5103, 0,0,0, 500),
			MoveObject(cadouzburator,1418.4274,-2621.2546,13.5469,30),
			SCMTA(COLOR_DEPART, "[GIFTBOX] Mot vat the la roi ra khoi UFO thang xuong thanh pho Los Santos'. Goi y: Aero."); 
		case 2: cadouzburator = CreateObject(19054,1079.5297,1067.8638,270.8250, 0,0,0, 500),MoveObject(cadouzburator,1088.6166,1070.4855,10.8359,30),SCMTA(COLOR_DEPART, "[GIFTBOX] Mot vat the la roi ra khoi UFO thang xuong thanh pho Las Venturas'. Goi y: BattleGrounds.");
	} 
	SCMTA(COLOR_DEPART, "[GIFTBOX] Vat the co hinh dang mot mon qua, no se cham dat trong vai giay!"),
	SCMTA(COLOR_DEPART, "[GIFTBOX] Tat ca nguoi choi tham gia deu nhan duoc giai thuong, nhung giai thuong dac biet se gianh cho nguoi gioi nhat!");
	parazburator = CreateObject(2903, 0,0,0,0,0,0, 500),AttachObjectToObject(parazburator, cadouzburator, 0,0,6,0,0,0, 1);flamazburator = CreateObject(18728, 0,0,0,0,0,0, 500),AttachObjectToObject(flamazburator, cadouzburator, 0,0,-2,0,0,0, 1);
	switch(cadoulevel){ case 1: cadouviata = 2500; case 2: cadouviata = 5000; case 3: cadouviata = 7500; case 4: cadouviata = 10000; case 5: cadouviata = 12000; case 6: cadouviata = 15000;}
	foreach(new i: Player) dmgdat[i] = 0,cadoubani[i] = 0,cadourp[i] = 0,cadoupp[i] = 0,cadoutimeractiv[i] = 0,cadoulqw[i] = 0,colectgf[i] = 0;
	cadoumort = 0,cadoumsg = 1,azisceva = 0,cadoumesaj = 0,cadouviatai = cadouviata;
	SetTimer("destroypara", 12000, false),DestroyObject(collectobject),DestroyDynamic3DTextLabel(Cadolabel);
	return 1;
}
//distrugere parachute info2
function destroypara() cadoulabel(),DestroyObject(parazburator),SCMTA(COLOR_DEPART, "[GIFTBOX] Vat the da cham dat!");
// update 3dtextlabel info3
cadoulabel() {
	if(cadoumort == 1) return 1;
	new string[100],Float:X,Float:Z,Float:Y;
	if(cadoulbl == 0) GetObjectPos(cadouzburator, X,Y,Z),format(string, sizeof(string), "GIFT LEVEL {ff0000}%d{ffffff}\nHP: {ff0000}%d",cadoulevel,cadouviata),Cadolabel = CreateDynamic3DTextLabel(string, -1, X,Y,Z+1.5, 50, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 0, -1, -1, 500.0),cadoulbl = 1;
	if(cadoulbl == 1) format(string, sizeof(string), "GIFT LEVEL {ff0000}%d{ffffff}\nHP: {ff0000}%d",cadoulevel,cadouviata),UpdateDynamic3DTextLabelText(Cadolabel, -1, string);
	return 1;
}
UpdateVar(playerid, const varname[], amount) {
	if(playerid == INVALID_PLAYER_ID) return 1;
	new query[256];
	mysql_format(SQL, query, sizeof(query), "UPDATE `users` SET `%s`='%d' WHERE `ID`='%d'", varname, amount, PlayerInfo[playerid][pSQLID]);
	mysql_pquery(SQL, query);
	return 1;
}
UpdateStr(playerid, const varname[], amount[]) {
	if(playerid == INVALID_PLAYER_ID) return 1;
	new query[256];
	mysql_format(SQL, query, sizeof(query), "UPDATE `users` SET `%s`='%s' WHERE `ID`='%d'", varname, amount, PlayerInfo[playerid][pSQLID]);
	mysql_pquery(SQL, query);
	return 1;
}
CheckVehicle(carid) {
	foreach(new i: Player) {
		if(IsPlayerConnected(i) && IsPlayerLogged[i] == 1) {
			if(VehicleKey[i] == carid) VehicleKey[i] = 0;
		}
	}
	return 1;
}
LockCarFunction(playerid) {
	new 
		string[64],
		engine,lights,alarm,doors,bonnet,boot,objective,
		idd, car;
		
	car = IsPlayerInAnyVehicle(playerid) ? GetPlayerVehicleID(playerid) : GetClosestVehicle(playerid);

	if(car == INVALID_VEHICLE_ID) return 1;
	if(!IsPlayerNearVehicle(playerid, car, 5) && !IsABoat(car)) return 1;
	if(!IsPlayerNearVehicle(playerid, car, 10) && IsABoat(car)) return 1;

	GetVehicleParamsEx(car,engine,lights,alarm,doors,bonnet,boot,objective);

	//rent
	if(HireCar[playerid] == car) {
		if(doors == 0) {
			SetVehicleParamsEx(HireCar[playerid],engine,lights,alarm,1,bonnet,boot,objective);
			format(string, sizeof(string), "~w~%s~n~~r~Khoa",aVehicleNames[GetVehicleModel(HireCar[playerid])-400]);
			GameTextForPlayer(playerid, string, 5000, 4);
		}
		else if(doors == 1) {
			SetVehicleParamsEx(HireCar[playerid],engine,lights,alarm,0,bonnet,boot,objective);
			format(string, sizeof(string), "~w~%s~n~~g~Khong khoa",aVehicleNames[GetVehicleModel(HireCar[playerid])-400]);
			GameTextForPlayer(playerid, string, 5000, 4);
		}
		return 1;
	}

	// job
	if(JobWorking[playerid] == 1 && JobVehicle[playerid] == car) {
		if(doors == 1) {
			format(string, sizeof(string), "~w~%s~n~~g~Khong khoa",aVehicleNames[GetVehicleModel(car)-400]);
			GameTextForPlayer(playerid, string, 3000, 4);
			SetVehicleParamsEx(car,engine,lights,alarm,0,bonnet,boot,objective);
		}
		else {
			format(string, sizeof(string), "~w~%s~n~~r~Khoa",aVehicleNames[GetVehicleModel(car)-400]);
			GameTextForPlayer(playerid, string, 3000, 4);				
			SetVehicleParamsEx(car,engine,lights,alarm,1,bonnet,boot,objective);
		}		
		return 1;
	}	
	
	idd = FindSpawnID(car);

	// key
	if(VehicleKey[playerid] != 0 && VehicleKey[playerid] == car) {
		if(CarInfo[idd][cLock] == 0) {
			CarInfo[idd][cLock] = 1;
			SetVehicleParamsEx(car,engine,lights,alarm,1,bonnet,boot,objective);
			format(string, sizeof(string), "~w~%s~n~~r~Khoa",aVehicleNames[CarInfo[idd][cModel]-400]);
			GameTextForPlayer(playerid, string, 5000, 4);
		}
		else {
			CarInfo[idd][cLock] = 0;
			SetVehicleParamsEx(car,engine,lights,alarm,0,bonnet,boot,objective);
			format(string, sizeof(string), "~w~%s~n~~g~Khong khoa",aVehicleNames[CarInfo[idd][cModel]-400]);
			GameTextForPlayer(playerid, string, 5000, 4);
		}
		mysql_format(SQL, string, sizeof(string), "UPDATE cars SET Lockk='%d' WHERE ID=%d", CarInfo[idd][cLock], idd);
		mysql_tquery(SQL, string, "", "");	
		return 1;
	}
	
	// personal
	if(GetVehicles(playerid) == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong co phuong tien ca nhan!");
	
	if(idd == 0) return 1;
	new succes;
	for(new i = 0; i < 11; i++) {
		if(PlayerInfo[playerid][pCarKey][i] == idd && idd != 0) succes = 1;
	}
	if(succes == 0) return 1;

	if(CarInfo[idd][cLock] == 0) {
		CarInfo[idd][cLock] = 1;	
		SetVehicleParamsEx(car,engine,lights,alarm,1,bonnet,boot,objective);
		format(string, sizeof(string), "~w~%s~n~~r~Khoa",aVehicleNames[GetVehicleModel(car)-400]);
		GameTextForPlayer(playerid, string, 5000, 4);
	}
	else {
		CarInfo[idd][cLock] = 0;
		SetVehicleParamsEx(car,engine,lights,alarm,0,bonnet,boot,objective);
		format(string, sizeof(string), "~w~%s~n~~g~Khong khoa",aVehicleNames[GetVehicleModel(car)-400]);
		GameTextForPlayer(playerid, string, 5000, 4);
	}
	mysql_format(SQL, string, sizeof(string), "UPDATE cars SET Lockk='%d' WHERE ID=%d", CarInfo[idd][cLock], idd);
	mysql_pquery(SQL, string);	
	return 1;
}
hook IsVehicleOccupied(vehicleid) {
	foreach(new i: Player) if(IsPlayerInVehicle(i,vehicleid)) return 1;
	return 0;
}
RespawnCarRange(playerid, range) {
	for(new i; i != MAX_VEHICLES; i++)  {
		new Float:PosX,Float:PosY,Float:PosZ;
		GetVehiclePos(i,PosX,PosY,PosZ);
		if(IsPlayerInRangeOfPoint(playerid, range, PosX,PosY,PosZ)) {
			SetVehicleToRespawn(i);
		}
	}
	return 1;
}
/*ShowDealershipTextdraws(playerid) {
	new szText[1024];
	if(InDealer[playerid] == 1) {
		if(GetPlayerCash(playerid) >= DSModels[SelectedCar[playerid][DealerID[playerid]]][dPrice]) format(szText, sizeof(szText), "~y~Vehicle %d~w~~h~~n~Model: %s~n~Toc do: %d km/h~n~Gia: ~g~$%s~w~~h~~n~So luong: %d", DealerID[playerid], aVehicleNames[GetVehicleModel(DealerCar[playerid])-400], DSModels[SelectedCar[playerid][DealerID[playerid]]][dMaxSpeed], FormatNumber(DSModels[SelectedCar[playerid][DealerID[playerid]]][dPrice]), DSModels[SelectedCar[playerid][DealerID[playerid]]][dStock]);
		else if(GetPlayerCash(playerid) < DSModels[SelectedCar[playerid][DealerID[playerid]]][dPrice]) format(szText, sizeof(szText), "~y~Vehicle %d~w~~h~~n~Model: %s~n~Toc do: %d km/h~n~Gia: ~r~$%s~w~~h~~n~So luong: %d", DealerID[playerid], aVehicleNames[GetVehicleModel(DealerCar[playerid])-400], DSModels[SelectedCar[playerid][DealerID[playerid]]][dMaxSpeed], FormatNumber(DSModels[SelectedCar[playerid][DealerID[playerid]]][dPrice]), DSModels[SelectedCar[playerid][DealerID[playerid]]][dStock]);
	}
	PlayerTextDrawSetString(playerid, InfoDS, szText);
	PlayerTextDrawShow(playerid, InfoDS);
	PlayerTextDrawShow(playerid, MainColor), PlayerTextDrawShow(playerid, SecColor),
	PlayerTextDrawShow(playerid, NextColorMain), PlayerTextDrawShow(playerid, BackColorMain), PlayerTextDrawShow(playerid, NextColorSec),
	PlayerTextDrawShow(playerid, BackColorSec);
	PlayerTextDrawShow(playerid, RotLeft), PlayerTextDrawShow(playerid, RotRight), PlayerTextDrawShow(playerid, BuyModel), PlayerTextDrawShow(playerid, TestModel),
	PlayerTextDrawShow(playerid, ExitDS), PlayerTextDrawShow(playerid, BackCar), PlayerTextDrawShow(playerid, NextCar);
	PlayerTextDrawShow(playerid, DSTds[0]);
	PlayerTextDrawShow(playerid, DSTds[1]);
	PlayerTextDrawShow(playerid, DSTds[2]);
	if(PlayerInfo[playerid][pAdmin] > 5) PlayerTextDrawShow(playerid, DSTds[3]);	
	PlayerTextDrawShow(playerid, DSTds[4]);	
	return 1;
}
HideDealershipTextdraws(playerid) {
	PlayerTextDrawHide(playerid, InfoDS), PlayerTextDrawHide(playerid, MainColor), PlayerTextDrawHide(playerid, SecColor),
	PlayerTextDrawHide(playerid, NextColorMain), PlayerTextDrawHide(playerid, BackColorMain), PlayerTextDrawHide(playerid, NextColorSec),
	PlayerTextDrawHide(playerid, BackColorSec), PlayerTextDrawHide(playerid, CarsCategory), PlayerTextDrawHide(playerid, BikesCategory),
	PlayerTextDrawHide(playerid, BoatsCategory), PlayerTextDrawHide(playerid, AirCategory), PlayerTextDrawHide(playerid, SpecialCategory),
	PlayerTextDrawHide(playerid, RotLeft), PlayerTextDrawHide(playerid, RotRight), PlayerTextDrawHide(playerid, BuyModel), PlayerTextDrawHide(playerid, TestModel),
	PlayerTextDrawHide(playerid, ExitDS), PlayerTextDrawHide(playerid, BackCar), PlayerTextDrawHide(playerid, NextCar);
	PlayerTextDrawHide(playerid, DSTds[0]);
	PlayerTextDrawHide(playerid, DSTds[1]);
	PlayerTextDrawHide(playerid, DSTds[2]);
	PlayerTextDrawHide(playerid, DSTds[3]);	
	PlayerTextDrawHide(playerid, DSTds[4]);	
	return 1;
}*/
SetTunning(idd) {
    new carid = CarInfo[idd][Spawned];
    new engine,lights,alarm,doors,bonnet,boot,objective;
	GetVehicleParamsEx(carid,engine,lights,alarm,doors,bonnet,boot,objective);
	SetVehicleParamsEx(carid,0,lights,alarm,CarInfo[idd][cLock],bonnet,boot,objective);
	if(CarInfo[idd][mod0] != 0) AddVehicleComponent(carid,CarInfo[idd][mod0]);
	if(CarInfo[idd][mod1] != 0) AddVehicleComponent(carid,CarInfo[idd][mod1]);
	if(CarInfo[idd][mod2] != 0) AddVehicleComponent(carid,CarInfo[idd][mod2]);
	if(CarInfo[idd][mod3] != 0) AddVehicleComponent(carid,CarInfo[idd][mod3]);
	if(CarInfo[idd][mod4] != 0) AddVehicleComponent(carid,CarInfo[idd][mod4]);
	if(CarInfo[idd][mod5] != 0) AddVehicleComponent(carid,CarInfo[idd][mod5]);
	if(CarInfo[idd][mod7] != 0) AddVehicleComponent(carid,CarInfo[idd][mod7]);
	if(CarInfo[idd][mod8] != 0) AddVehicleComponent(carid,CarInfo[idd][mod8]);
	if(CarInfo[idd][mod9] != 0) AddVehicleComponent(carid,CarInfo[idd][mod9]);
	if(CarInfo[idd][mod10] != 0) AddVehicleComponent(carid,CarInfo[idd][mod10]);
	if(CarInfo[idd][mod11] != 0) AddVehicleComponent(carid,CarInfo[idd][mod11]);
	if(CarInfo[idd][mod12] != 0) AddVehicleComponent(carid,CarInfo[idd][mod12]);
	if(CarInfo[idd][mod13] != 0) AddVehicleComponent(carid,CarInfo[idd][mod13]);
	SetVehicleNumberPlate(carid, CarInfo[idd][cLicense]);
	ChangeVehiclePaintjob(carid, CarInfo[idd][paintjob]);
}
CarPriceValid(model) {
	// for(new i = 0; i < 150; i ++) {
	// 	if(DSModels[i][dModel] == model) return DSModels[i][dPrice];
	// }
	// return 0;	
	return D_Vehicles[D_Model[model-400]][dPrice];
}

LoadInventory(playerid) {
    new query[500];
    format(query, sizeof(query), "SELECT * FROM `inventory` WHERE `invOwnerID` = '%d'", PlayerInfo[playerid][pSQLID]);
    new Cache:db = mysql_query(SQL, query);
	if(!cache_num_rows()) return 1;
	for(new i = 0; i < (cache_num_rows()) && i < MAX_INVENTORY; i++) {
		cache_get_value_name_int(i , "invQuantity", invData[playerid][i][invQuantity]);
		cache_get_value_name_int(i ,"invID", invData[playerid][i][invID]);
		cache_get_value_name(i ,"invOwnerName", invData[playerid][i][invOwnerName]);
		cache_get_value_name(i ,"invItem", gQuery), format(invData[playerid][i][invItem], 32, gQuery);
		cache_get_value_name_int(i , "invModel", invData[playerid][i][invModel]);
		//cache_get_value_name_int(i , "invQuantity", invData[playerid][i][invQuantity]);
		cache_get_value_name_int(i , "invType", invData[playerid][i][invExists]);

	}
    cache_delete(db);
	return 1;
}
LoadPlayerCars(playerid) {
	new string[90];
	for(new i = 0; i < 11; i++) //update max slot
		if(PlayerInfo[playerid][pCarKey][i] > 0) {
			// for(new j = 0; j < i; j++) {
			new j;
			while(j < i) {
				if(PlayerInfo[playerid][pCarKey][j] == PlayerInfo[playerid][pCarKey][i]) {
					PlayerInfo[playerid][pCarKey][i] = 0;
					mysql_format(SQL, string, sizeof(string), "UPDATE users SET CarKey%d=0 WHERE id=%d", i, PlayerInfo[playerid][pSQLID]);
					mysql_pquery(SQL, string);
				}
				j++;
			}
			if(i == j) LoadCar(PlayerInfo[playerid][pCarKey][i], i, playerid);
		}
	return 1;
}
LoadCar(id, slotid, playerid) {
	if(CarInfo[id][cModel] != 0) return 1;
	new query[50];
	format(query, sizeof(query), "SELECT * FROM `cars` WHERE `ID`='%d'", id);
	new Cache: db = mysql_query(SQL, query);
	if(cache_num_rows()) {
		new i = 0;
		CarInfo[id][cID] = id;
		cache_get_value_name_int(i, "Model", CarInfo[id][cModel]);
		cache_get_value_name_float(i, "Locationx", CarInfo[id][cLocationx]);
		cache_get_value_name_float(i, "Locationy", CarInfo[id][cLocationy]);
		cache_get_value_name_float(i, "Locationz", CarInfo[id][cLocationz]);
		cache_get_value_name_float(i, "Angle", CarInfo[id][cAngle]);
		cache_get_value_name_int(i, "ColorOne", CarInfo[id][cColorOne]);
		cache_get_value_name_int(i, "ColorTwo", CarInfo[id][cColorTwo]);
		cache_get_value_name(i, "Owner", CarInfo[id][cOwner]);
		cache_get_value_name(i, "Text", CarInfo[id][cText]);
		cache_get_value_name_int(i, "ColorText", CarInfo[id][cTextColor]);
		cache_get_value_name_int(i, "Value", CarInfo[id][cValue]);
		cache_get_value_name(i, "License", CarInfo[id][cLicense]);
		cache_get_value_name_int(i, "Alarm", CarInfo[id][cAlarm]);
		cache_get_value_name_int(i, "Lockk", CarInfo[id][cLock]);
		cache_get_value_name_int(i, "mod0", CarInfo[id][mod0]);
		cache_get_value_name_int(i, "mod1", CarInfo[id][mod1]);
		cache_get_value_name_int(i, "mod2", CarInfo[id][mod2]);
		cache_get_value_name_int(i, "mod3", CarInfo[id][mod3]);
		cache_get_value_name_int(i, "mod4", CarInfo[id][mod4]);
		cache_get_value_name_int(i, "mod5", CarInfo[id][mod5]);
		cache_get_value_name_int(i, "mod6", CarInfo[id][mod6]);
		cache_get_value_name_int(i, "mod7", CarInfo[id][mod7]);
		cache_get_value_name_int(i, "mod8", CarInfo[id][mod8]);
		cache_get_value_name_int(i, "mod9", CarInfo[id][mod9]);
		cache_get_value_name_int(i, "mod10", CarInfo[id][mod10]);
		cache_get_value_name_int(i, "mod11", CarInfo[id][mod11]);
		cache_get_value_name_int(i, "mod12", CarInfo[id][mod12]);
		cache_get_value_name_int(i, "mod13", CarInfo[id][mod13]);
		cache_get_value_name_int(i, "paintjob", CarInfo[id][paintjob]);
		cache_get_value_name_float(i, "KM", CarInfo[id][KM]);
		cache_get_value_name_int(i, "Userid", CarInfo[id][Userid]);
		cache_get_value_name_int(i, "Confiscated", CarInfo[id][Confiscated]);
		cache_get_value_name_int(i, "Special", CarInfo[id][cSpecial]);
		cache_get_value_name_int(i, "Tax", CarInfo[id][cTax]);
		cache_get_value_name_int(i, "Points", CarInfo[id][cPoints]);
		cache_get_value_name_int(i, "Fuel", CarInfo[id][cFuel]);
		cache_get_value_name_int(i, "Neon", CarInfo[id][cNeon]);	
		cache_get_value_name_int(i, "Sung1", CarInfo[id][cSlotSung][0]);
		cache_get_value_name_int(i, "Sung2", CarInfo[id][cSlotSung][1]);
		cache_get_value_name_int(i, "Ammo1", CarInfo[id][cSlotAmmo][0]);
		cache_get_value_name_int(i, "Ammo1", CarInfo[id][cSlotAmmo][1]);
		CarInfo[id][Spawned] = 0;
	} 
	else {
		new text[140];
		format(text, sizeof(text), "[280519/%d/%d/%d] %s dang bi loi /v, xin hay bao [code] lai cho Scripter.", slotid, id, PlayerInfo[playerid][pSQLID], GetName(playerid));
		SendStaffMessage(COLOR_LOGS, text);
	}
	cache_delete(db);

	return 1;
}
/*function LoadDSVeh() {
	dsvehs = cache_num_rows();
	for(new i = 1; i <= dsvehs; i++) {
		new j = i - 1;
		cache_get_value_name_int(j, "ID", DSModels[i][dID]);
		cache_get_value_name_int(j, "Model", DSModels[i][dModel]);
		cache_get_value_name_int(j, "Price", DSModels[i][dPrice]);
		// cache_get_value_name_int(j, "Doors", DSModels[i][dDoors]);
		cache_get_value_name_int(j, "Type", DSModels[i][dType]);
		cache_get_value_name_int(j, "MaxSpeed", DSModels[i][dMaxSpeed]);
		cache_get_value_name_int(j, "Stock", DSModels[i][dStock]);
		// cache_get_value_name_int(j, "Gold", DSModels[i][dGold]);
	}
	printf("Dealership models: %d", dsvehs);
}*/
OnPropTextdrawUpdate(update, h)
{
	new Propertystring[256];
	if(update == 1)
	{
		new type[10],locked[20], selltext[64];
		if(HouseInfo[h][hInteriorType] == 0) format(type, sizeof(type),"Nho");
		if(HouseInfo[h][hInteriorType] == 1) format(type, sizeof(type),"Vua");
		if(HouseInfo[h][hInteriorType] == 2) format(type, sizeof(type),"Lon");
		if(HouseInfo[h][hLock] == 1) format(locked, sizeof(locked), "\n(da khoa)");
		if(strcmp(HouseInfo[h][hOwner], "AdmBot", false) == 0)
			HouseIcon[h] = CreateDynamicMapIcon(HouseInfo[h][hEntrancex],HouseInfo[h][hEntrancey],HouseInfo[h][hEntrancez],31,0,-1,-1,-1,200.0);
		else HouseIcon[h] = CreateDynamicMapIcon(HouseInfo[h][hEntrancex],HouseInfo[h][hEntrancey],HouseInfo[h][hEntrancez],32,0,-1,-1,-1,200.0);

		if(HouseInfo[h][hValue] > 0) format(selltext, sizeof(selltext),"\n{FFFFFF}Price {008080}$%s (/buyhouse)",FormatNumber(HouseInfo[h][hValue]));
		if(HouseInfo[h][hOwned] == 0)
		{
			DestroyDynamic3DTextLabel(HouseLabel[h]);
			format(Propertystring, sizeof(Propertystring),"{FFFFFF}House {008080}%d \n{008080}%s \n{FFFFFF}Size: {008080}%s \n{FFFFFF}Price: {008080}$%s (/buyhouse) \n{FFFFFF}Level: {008080}%d %s",h,HouseInfo[h][hDiscription],type,FormatNumber(HouseInfo[h][hValue]),HouseInfo[h][hLevel],locked);
			HouseLabel[h] = CreateDynamic3DTextLabel(Propertystring, 0xFFFFFFFF, HouseInfo[h][hEntrancex], HouseInfo[h][hEntrancey], HouseInfo[h][hEntrancez], 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 100.0);
			DestroyDynamicPickup(HousePickup[h]);
			HousePickup[h] = CreateDynamicPickup(1273, 23, HouseInfo[h][hEntrancex], HouseInfo[h][hEntrancey], HouseInfo[h][hEntrancez]);
		}
		else if(HouseInfo[h][hOwned] == 1)
		{
			new tenants=0,query[256];
			format(query, sizeof(query), "SELECT * FROM `users` WHERE `Rented` = '%d' AND `Status`='1'", h);
			new Cache: membresult = mysql_query(SQL, query);
			tenants = cache_num_rows();
			cache_delete(membresult);
			if(HouseInfo[h][hRentabil] == 1)
			{
				DestroyDynamic3DTextLabel(HouseLabel[h]);
				format(Propertystring, sizeof(Propertystring),"{FFFFFF}House {008080}%d \n{008080}%s \n{FFFFFF}So huu: {008080}%s \n{FFFFFF}Nguoi thue nha: {008080}%d \n{FFFFFF}Kich thuoc: {008080}%s \n{FFFFFF}Thue phong: {008080}$%d (/rentroom) %s %s",h,HouseInfo[h][hDiscription],HouseInfo[h][hOwner],tenants,type,HouseInfo[h][hRent],selltext,locked);
				HouseLabel[h] = CreateDynamic3DTextLabel(Propertystring, 0xFFFFFFFF, HouseInfo[h][hEntrancex], HouseInfo[h][hEntrancey], HouseInfo[h][hEntrancez], 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 100.0);
				DestroyDynamicPickup(HousePickup[h]);
				HousePickup[h] = CreateDynamicPickup(1272, 23, HouseInfo[h][hEntrancex], HouseInfo[h][hEntrancey], HouseInfo[h][hEntrancez]);
			}
			else {
				DestroyDynamic3DTextLabel(HouseLabel[h]);
				format(Propertystring, sizeof(Propertystring),"{FFFFFF}House {008080}%d \n{008080}%s \n{FFFFFF}So huu: {008080}%s \n{FFFFFF}Nguoi thue nha: {008080}%d \n{FFFFFF}Kich thuoc: {008080}%s %s %s",h,HouseInfo[h][hDiscription],HouseInfo[h][hOwner], tenants, type, selltext, locked);
				HouseLabel[h] = CreateDynamic3DTextLabel(Propertystring, 0xFFFFFFFF, HouseInfo[h][hEntrancex], HouseInfo[h][hEntrancey], HouseInfo[h][hEntrancez], 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 100.0);
				DestroyDynamicPickup(HousePickup[h]);
				HousePickup[h] = CreateDynamicPickup(1272, 23, HouseInfo[h][hEntrancex], HouseInfo[h][hEntrancey], HouseInfo[h][hEntrancez]);
			}
		}
	}
	else if(update == 2)
	{
		new pret[55];
		if(BizzInfo[h][bBuyPrice] > 0) format(pret, 55, "\n{FFFFFF}Gia: {40A6FF}$%s (/buybiz)", FormatNumber(BizzInfo[h][bBuyPrice]));
		if(BizzInfo[h][bOwned] == 0) {
			DestroyDynamic3DTextLabel(BizzLabel[h]);
			format(Propertystring, sizeof(Propertystring),"{40A6FF}%s{FFFFFF}\n{FFFFFF}Business {40A6FF}#%d\n{FFFFFF}Doanh nghiep nay dang duoc treo ban \n {FFFFFF}Gia: {40A6FF}%s \n{FFFFFF}Level: {40A6FF}%d",BizzInfo[h][bMessage],h,FormatNumber(BizzInfo[h][bBuyPrice]),BizzInfo[h][bLevelNeeded]);
			BizzLabel[h] = CreateDynamic3DTextLabel(Propertystring ,0x0066FFFF,BizzInfo[h][bEntranceX], BizzInfo[h][bEntranceY], BizzInfo[h][bEntranceZ],25, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 0, -1, -1, 100.0);
			DestroyDynamicPickup(BizzPickup[h]);
			BizzPickup[h] = CreateDynamicPickup(1272, 23, BizzInfo[h][bEntranceX], BizzInfo[h][bEntranceY], BizzInfo[h][bEntranceZ]);
		}
		else if(BizzInfo[h][bOwned] == 1) {
			DestroyDynamic3DTextLabel(BizzLabel[h]);
			format(Propertystring, sizeof(Propertystring),"{40A6FF}%s{FFFFFF}\n{FFFFFF}Business {40A6FF}#%d\n{FFFFFF}So huu: {40A6FF}%s \n{FFFFFF}Phi vao cua: {40A6FF}$%s\n{FFFFFF}Level:{40A6FF} %d%s",BizzInfo[h][bMessage],h,BizzInfo[h][bOwner],FormatNumber(BizzInfo[h][bEntranceCost]),BizzInfo[h][bLevelNeeded],pret);
			BizzLabel[h] = CreateDynamic3DTextLabel(Propertystring ,0x0066FFFF,BizzInfo[h][bEntranceX], BizzInfo[h][bEntranceY], BizzInfo[h][bEntranceZ],25, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 0, -1, -1, 100.0);
			DestroyDynamicPickup(BizzPickup[h]);
			BizzPickup[h] = CreateDynamicPickup(1272, 23, BizzInfo[h][bEntranceX], BizzInfo[h][bEntranceY], BizzInfo[h][bEntranceZ]);
		}
	}
	return 1;
}
OtherTimer() 
{
	new iswar;
	new string[180];
	for(new w = 0; w < facs; w++) 
	{
		if(InWar[w] == 1) iswar = 1;
	}
	if(iswar == 1) {
		for(new i = 1; i < turfsss; i++) {
			new attackers = WarInfo[i][wAttacker];
			new defenders = WarInfo[i][wFaction];
			if(WarInfo[i][wTime] > 0) {
				WarInfo[i][wTime] -= 1;
				foreach(new j: PlayerGangster) {
					if(IsPlayerInTurf(j,i) == 1) {
						if(PlayerInfo[j][pMember] == attackers) WarScoreF[attackers][i] += 0.002;
						else if(PlayerInfo[j][pMember] == defenders) WarScoreF[defenders][i] += 0.002;
					}
				}
				if(WarInfo[i][wTime] == 0) {
					FactionDeelay[attackers] = gettime() + 370; // 6 phút
					FactionDeelay[defenders] = gettime() + 180; // 3 phút
					new Float: atscore = 0.0;
					new Float: defscore = 0.0;
					atscore = WarScoreF[attackers][i];
					defscore = WarScoreF[defenders][i];
					new winner;
					SetVehicle(attackers, 0);
					SetVehicle(defenders, 0);
					foreach(new j: PlayerGangster) {
						if(PlayerInfo[j][pMember] == attackers) {
							SendClientMessage(j, COLOR_MONEY, "--------------------- THONG KE WAR ---------------------");
							RespawnVehicle(attackers);
							ZoneStopFlashForPlayer(j,Turfs[i]);
							format(string,sizeof(string),"Cuoc chien giua %s va %s tren dia ban %d da ket thuc.",FactionName(attackers),FactionName(defenders),i);
							SendClientMessage(j, COLOR_MONEY,string);
							for(new m = 0; m < 5; m++) SendDeathMessageToPlayer(j, 1001, 1001, 200);
							PlayerTextDrawHide(j, WarTime);
						}
						else if(PlayerInfo[j][pMember] == defenders) {
							SendClientMessage(j, COLOR_MONEY, "--------------------- THONG KE WAR ---------------------");
							RespawnVehicle(defenders);
							ZoneStopFlashForPlayer(j,Turfs[i]);
							format(string,sizeof(string),"Cuoc chien giua %s va %s tren dia ban %d da ket thuc.",FactionName(attackers),FactionName(defenders),i);
							SendClientMessage(j, COLOR_MONEY,string);
							for(new m = 0; m < 5; m++) SendDeathMessageToPlayer(j, 1001, 1001, 200);
							PlayerTextDrawHide(j, WarTime);
						}
					}
					DestroyPickups(i);
					if(atscore > defscore) winner = 1;
					else winner = 2;
					new winbest, losebest;
					new winbestj = -1, losebestj = -1;
					new bestname1[25],bestname2[25],bestname[25],worstname[25];
					foreach(new j: Player) {
						if(winner == 1) {
							if(PlayerInfo[j][pMember] == attackers) {
								winbest = bestscoreat[i];
								if(bestmemberat[i] != 999) {
									if(PlayerInfo[bestmemberat[i]][pMember] == attackers) {
										winbestj = bestmemberat[i];
										GetPlayerName(winbestj,bestname1,sizeof(bestname1));
										strmid(bestname, bestname1, 0, strlen(bestname1), 255);
									}
								}
								else {
									format(bestname,sizeof(bestname),"Null");
									strmid(bestname, bestname, 0, strlen(bestname), 255);
								}
							}
							if(PlayerInfo[j][pMember] == defenders) {
								losebest = worstscoredf[i];
								if(worstmemberdf[i] != 999) {
									if(PlayerInfo[worstmemberdf[i]][pMember] == defenders) {
										losebestj = worstmemberdf[i];
										GetPlayerName(losebestj,bestname2,sizeof(bestname2));
										strmid(worstname, bestname2, 0, strlen(bestname2), 255);
									}
								}
								else {
									format(worstname,sizeof(worstname),"Null");
									strmid(worstname, worstname, 0, strlen(worstname), 255);
								}
							}
						}
						if(winner == 2) {
							if(PlayerInfo[j][pMember] == defenders) {
								winbest = bestscoredf[i];
								if(bestmemberdf[i] != 999) {
									if(PlayerInfo[bestmemberdf[i]][pMember] == defenders) {
										winbestj = bestmemberdf[i];
										GetPlayerName(winbestj,bestname1,sizeof(bestname1));
										strmid(bestname, bestname1, 0, strlen(bestname1), 255);
									}
								}
								else {
									format(bestname,sizeof(bestname),"Null");
									strmid(bestname, bestname, 0, strlen(bestname), 255);
								}
							}
							if(PlayerInfo[j][pMember] == attackers) {
								losebest = worstscoreat[i];
								if(worstmemberat[i] != 999) {
									if(PlayerInfo[worstmemberat[i]][pMember] == attackers) {
										losebestj = worstmemberat[i];
										GetPlayerName(losebestj,bestname2,sizeof(bestname2));
										strmid(worstname, bestname2, 0, strlen(bestname2), 255);
									}
								}
								else {
									format(worstname,sizeof(worstname),"Null");
									strmid(worstname, worstname, 0, strlen(worstname), 255);
								}
							}
						}
					}
					foreach(new j: PlayerGangster) {
						new uciderii = 0;
						uciderii += ucideri[j][i];
						new decesee = 0;
						decesee += decese[j][i];
						ucideri[j][i] = 0;
						decese[j][i] = 0;
						
						if((PlayerInfo[j][pMember] == attackers) || (PlayerInfo[j][pMember] == defenders)) {
							SetPlayerVirtualWorld(j, 0);
							if(WarSeconds[j] > 300) UpdateFactionRaport(j, 0); 
							WarSeconds[j] = 0;
							if(winner == 1) {					
								format(string,sizeof(string),"%s (%.1f) vs %s (%.1f)",FactionName(WarInfo[i][wAttacker]),atscore,FactionName(WarInfo[i][wFaction]),defscore);
								SendClientMessage(j, COLOR_MONEY,string);
								format(string,sizeof(string),"Choi hay nhat: %s(%d). Choi te nhat: %s(-%d)", bestname, winbest, worstname, losebest);
								SendClientMessage(j, COLOR_MONEY,string);
								format(string,sizeof(string),"Thong ke cua ban: Diem %d (%d giet duoc va chet %d lan)",uciderii-decesee, uciderii, decesee);
								SendClientMessage(j, COLOR_MONEY,string);
								TurfInfo[i][zOwned] = WarInfo[i][wAttacker];
								Wartimeon[j] = 0;
							}
							if(winner == 2) {
								format(string,sizeof(string),"%s (%.1f) vs %s (%.1f)",FactionName(WarInfo[i][wFaction]),defscore,FactionName(WarInfo[i][wAttacker]),atscore);
								SendClientMessage(j, COLOR_MONEY,string);
								format(string,sizeof(string),"Choi hay nhat: %s(%d). Choi te nhat: %s(-%d)", bestname, winbest, worstname, losebest);
								SendClientMessage(j, COLOR_MONEY,string);
								format(string,sizeof(string),"Thong ke cua ban: Diem %d (%d giet duoc va chet %d lan)",uciderii-decesee,uciderii, decesee);
								SendClientMessage(j, COLOR_MONEY,string);
								Wartimeon[j] = 0;
							}
							SendClientMessage(j, COLOR_MONEY, "---------------------------------------------------------------");
							WarScoreF[defenders][i] = 0.0;
							WarScoreF[attackers][i] = 0.0;
							InWar[attackers] = 0;
							InWar[defenders] = 0;
						}
						if(winner == 1) {
							HideZoneForPlayer(j,Turfs[i]);
							if(attackers == 4) ShowZoneForPlayer(j,Turfs[i],0x0CAB3C99);
							if(attackers == 5) ShowZoneForPlayer(j,Turfs[i],0x18EBD699);
							if(attackers == 6) ShowZoneForPlayer(j,Turfs[i],0xFFAE00C8);
							if(attackers == 10) ShowZoneForPlayer(j,Turfs[i],0xAB00FA99);
							if(attackers == 14) ShowZoneForPlayer(j,Turfs[i],0xFF000099);
						}
					}
					if(winner == 1) {
						new str[60];
						format(str,60,"UPDATE `turfs` SET `Owned`='%d' WHERE `ID`='%d'",TurfInfo[i][zOwned],i);
						mysql_pquery(SQL,str);
					}
					WarInfo[i][wTime] = 0;
					WarInfo[i][wFaction] = 0;
					WarInfo[i][wAttacker] = 0;
					TurfInfo[i][zTurfDelay] = gettime() + 60*30;
					worstscoreat[i] = 0;
					worstmemberat[i] = 999;
					bestscoreat[i] = 0;
					bestmemberat[i] = 999;
					worstscoredf[i] = 0;
					worstmemberdf[i] = 999;
					bestscoredf[i] = 0;
					bestmemberdf[i] = 999;
					mysql_pquery(SQL, "UPDATE `users` SET `WarTurf`='0', `WarKills`='0', `WarDeaths`='0'");
				}
				else {
					foreach(new j: Player) {
						if(TurfsDisp[j] == 1 || PlayerInfo[j][pMember] == attackers || PlayerInfo[j][pMember] == defenders) {
							switch(WarInfo[i][wAttacker]) {
								case 4: ZoneFlashForPlayer(j,Turfs[i], 0x0CAB3C99);
								case 5: ZoneFlashForPlayer(j,Turfs[i], 0x11F2F299);
								case 6: ZoneFlashForPlayer(j,Turfs[i], 0xFFAE00C8);
								case 10: ZoneFlashForPlayer(j,Turfs[i], 0xAB00FA99);
								case 14: ZoneFlashForPlayer(j,Turfs[i], 0xFF000099);
							}
						}
					}
				}				
			}
		}
	}
	return 1;
}
WeaponObject(wid) {
	switch(wid) {
		case 1: return 331; 
		case 2: return 332; 
		case 3: return 333; 
		case 5: return 334; 
		case 6: return 335; 
		case 7: return 336; 
		case 10: return 321; 
		case 11: return 322; 
		case 12: return 323; 
		case 13: return 324; 
		case 14: return 325; 
		case 15: return 326; 
		case 23: return 347; 
		case 24: return 348; 
		case 25: return 349; 
		case 26: return 350; 
		case 27: return 351; 
		case 28: return 352; 
		case 29: return 353; 
		case 30: return 355; 
		case 31: return 356; 
		case 33: return 357; 
		case 4: return 335; 
		case 34: return 358; 
		case 41: return 365; 
		case 42: return 366; 
		case 43: return 367; 
	}
	return 0;
}						
DestroyPickups(turfid) {
	for(new i = 0; i < MAX_PICKUPSW; i++) {
		if(Pickups[i][psWar] == turfid && Pickups[i][psID] != 0) {
			DestroyDynamicPickup(Pickups[i][psID]);
			Pickups[i][psType] = 0;
			Pickups[i][psID] = 0;
			Pickups[i][psWar] = 0;	
			Iter_Remove(iPickUp, i);
		}
	}

	return 1;
}
IsAFLYCar(carid) {
	new modelid = GetVehicleModel(carid);
	switch(modelid)
	{
		case 592, 577, 511, 512, 593, 520, 553, 476, 519, 460, 513, 487: return 1;
		default: return 0;
	}
	return 0;
}
IsABOATCar(carid) {
	new modelid = GetVehicleModel(carid);
	if(modelid == 430 || modelid == 446 || modelid == 452 || modelid == 453 || modelid == 454 || modelid == 472 || modelid == 473 || modelid == 484 || modelid == 493 || modelid == 595) return 1;
	return 0;
}
// //InsertLog(playerid, const text[], type) {
// 	if(!IsPlayerConnected(playerid)) return 1;
// 	new 
// 		szQuery[1024], szDate[180], Year, Month, Day, Hour, Minute, Second, ip[180];
		
// 	getdate(Year, Month, Day);
// 	gettime(Hour, Minute, Second);
// 	GetPlayerIp(playerid, ip, sizeof(ip));
// 	format(szDate, sizeof(szDate), "%02d/%02d/%d - %02d:%02d:%02d", Day, Month, Year, Hour, Minute, Second); 
// 	mysql_format(SQL, szQuery, sizeof(szQuery), "INSERT INTO `logs` (`Userid`, `Text`, `Date`, `Type`, `IP`) VALUES ('%d', '%e', '%s', '%d', '%s')", PlayerInfo[playerid][pSQLID], text, szDate, type, ip);
// 	mysql_query(SQL, szQuery, false);
// 	return 1;
// }
InsereazaSanctiune(playerid, by, type, const reason[]) {
	new 
		szQuery[1024], name[180], aname[180],
		szDate[180], Year, Month, Day, Hour, Minute, Second;
		
	format(name, 256, "%s (%d)", GetName(playerid), PlayerInfo[playerid][pSQLID]);
	getdate(Year, Month, Day);
	gettime(Hour, Minute, Second);
	format(szDate, sizeof(szDate), "%02d/%02d/%d - %02d:%02d:%02d", Day, Month, Year, Hour, Minute, Second);
	
	if(by == AdmBot) aname = "AdmBot";
	else format(aname, 256, "%s (%d)", GetName(by), PlayerInfo[by][pSQLID]);
	mysql_format(SQL, szQuery, sizeof(szQuery), "INSERT INTO `sanctions` (`Player`, `By`, `Time`, `Userid`, `Type`, `Reason`) VALUES ('%s', '%s', '%s', '%d', '%d', '%e')", name, aname, szDate, PlayerInfo[playerid][pSQLID], type, reason);
	mysql_query(SQL, szQuery, false);	
	return 1;
}
OnPlayerUseVending(playerid) {
    SetPlayerHealthEx(playerid, 99);
    GivePlayerCash(playerid, -500);
    Update(playerid, pCashx);
    GameTextForPlayer(playerid, "~r~-$500", 1000, 1);
    return 1;
}
FailEscape(playerid) {
	PlayerTextDrawHide(playerid, CpTD);
	Escape2[playerid] = 0;
	Escape[playerid] = 0;
	EscapeProces[playerid] =0;
	SendClientMessage(playerid, COLOR_YELLOW, "No luc vuot nguc cua ban da that bai!");
	return 1;
}
ListenThisRadio(id) {
	new x;
	foreach(new i: Player) {
		if(PlayRadio[i] == id && IsPlayerConnected(i)) x++;
	}
	return x;
}
HouseRadio(playerid, hid) {
	if(HouseInfo[hid][hMusic] > sizeof(RadioLink)) return 1;
	if(HouseInfo[hid][hMusic] != -1) {
		if(HouseInfo[hid][hMusic] == 0) StopAudioStreamForPlayer(playerid);
		else PlayAudioStreamForPlayer(playerid, RadioLink[HouseInfo[hid][hMusic]]);
		PlayRadio[playerid] = HouseInfo[hid][hMusic];
	}
	return 1; 
}
StopHouseRadio(hid) {
	foreach(new i: Player) {
		if(InHouse[i] == hid) {
			StopAudioStreamForPlayer(i);
			PlayRadio[i] = 0;
		}
	}
	return 1;
}
BizzRadio(playerid, hid) {
	if(BizzInfo[hid][bRadio] != -1) {
		if(BizzInfo[hid][bRadio] == 0) StopAudioStreamForPlayer(playerid);
		else PlayAudioStreamForPlayer(playerid, RadioLink[BizzInfo[hid][bRadio]]);
	}
	return 1; 
}
StopBizRadio(hid) {
	foreach(new i: Player) {
		if(InBussines[i] == hid) {
			StopAudioStreamForPlayer(i);
			PlayRadio[i] = 0;
		}
	}
	return 1;
}
GiveBiz(id, biz) {
	PlayerInfo[id][pBizz] = biz;
	UpdateVar(id, "Bizz", biz);	
	BizzInfo[biz][bOwned] = 1;
	format(BizzInfo[biz][bOwner], 256, GetName(id));
	BizzInfo[biz][bBuyPrice] = 0;
	OnPropTextdrawUpdate(2, biz);
	new query[180];
	format(query, sizeof(query), "UPDATE `bizz` SET `Owned`='1', `Owner`='%s', `BuyPrice`='0' WHERE `ID`='%d'", GetName(id), biz);
	mysql_pquery(SQL, query);
	return 1;
}
GiveHouse(id, house) {
	PlayerInfo[id][pHouse] = house;
	UpdateVar(id, "House", house);
	HouseInfo[house][hOwned] = 1;
	format(HouseInfo[house][hOwner], 256, GetName(id));
	HouseInfo[house][hValue] = 0;
	OnPropTextdrawUpdate(1, house);
	new query[180];
	format(query, sizeof(query), "UPDATE `houses` SET `Owned`='1', `Owner`='%s', `Value`='0' WHERE `ID`='%d'", GetName(id), house);
	mysql_query(SQL, query, false);
	return 1;
}
SetVehicle(fid, turf) {
	for(new i; i < MAX_SVEHICLES; i++) {
		if(ServerVehicles[i][vFaction] == fid) SetVehicleVirtualWorld(ServerVehicles[i][vSpawned], turf);
	}
	return 1;
}
RespawnVehicle(fid) {
	for(new i; i < MAX_SVEHICLES; i++) {
		if(ServerVehicles[i][vFaction] == fid) {
			SetVehicleVirtualWorld(i, 0);
			SetVehicleToRespawn(i);
		}	
	}					
	return 1;
}
SendUserMessage(color, text[], userid) {
	foreach(new i: Player) {
		if(PlayerInfo[i][pSQLID] == userid && IsPlayerConnected(i)) SendClientMessage(i, color, text);
	}
	return 1;
}
SendAdmin(color, text[]) {
	foreach(new i: PlayerAdmins) {
		if(IsPlayerConnected(i)) {
			if(!IsACop(i) && PlayerInfo[i][pMember] != 13 && PlayerInfo[i][pMember] != 12) SendClientMessage(i, color, text);
		}
	}
	return 1;
}
ShowMDC(playerid, targetid) {
	new id = targetid,  string[256];
	MDCOn[playerid] = id;
	if(PlayerInfo[id][pWantedLevel] == 0) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do dang bi truy na!");
	SendClientMessage(playerid, -1, "------------------------------------------- MDC -------------------------------------------");	
	format(string, sizeof(string), "Ten: %s (%d) | Truy na: {FFFB00}%d{FFFFFF} | Thoi gian truy na: %d phut | Bi truy duoi boi %d canh sat", GetName(id), id, PlayerInfo[id][pWantedLevel], 10-WantedTime[id], ChasedBy(id));
	SendClientMessage(playerid, -1, string);
	new mdc[256];
	if(strcmp(PlayerInfo[id][pCrime1],  "Khong co toi", false) == 0) { }
	else {
		format(mdc, sizeof(mdc), "%s", PlayerInfo[id][pCrime1]);
		SendClientMessage(playerid, -1, mdc);
	}
	if(strcmp(PlayerInfo[id][pCrime2],  "Khong co toi", false) == 0) { }
	else {
		format(mdc, sizeof(mdc), "%s", PlayerInfo[id][pCrime2]);
		SendClientMessage(playerid, -1, mdc);
	}
	if(strcmp(PlayerInfo[id][pCrime3], "Khong co toi", false) == 0) { }
	else {
		format(mdc, sizeof(mdc), "%s", PlayerInfo[id][pCrime3]);
		SendClientMessage(playerid, -1, mdc);
	}					
	SendClientMessage(playerid, -1, "----------------------------------------------------------------------------------------------");
	return 1;
}
ChasedBy(playerid) {
	new x;
	foreach(new i: Player) {
		if(IsPlayerConnected(i) && IsPlayerLogged[i] == 1) {
			if(MDCOn[i] == playerid && targetfind[i] == playerid) x++;
		}
	}
	return x;
}
show_near_wanted(playerid) {
	if(IsACop(playerid) && NearWanted[playerid] == 1) {
		new szDialog[120], szDialog2[1000];
		strcat(szDialog2, "~y~Truy na o gan:~w~~h~~n~");
		foreach(new i: Player) {
			if(PlayerInfo[i][pWantedLevel] >= 1) {
				if(GetDistanceBetweenPlayers(playerid,i) < 300) {
					format(szDialog, sizeof(szDialog), "%s (%d) - W: %d - %0.1fm~n~", GetName(i), i, PlayerInfo[i][pWantedLevel], GetDistanceBetweenPlayers(playerid,i));
					strcat(szDialog2, szDialog);
				}
			}
		}	
		PlayerTextDrawSetString(playerid, NearTD, szDialog2);
		PlayerTextDrawShow(playerid, NearTD);
	}
	return 1;
}
houseTenants(hid) {
	new x;
	foreach(new i: Player) {
		if(PlayerInfo[i][pRented] == hid && IsPlayerConnected(i)) x++;
	}	
	return x;
}
showTenants(playerid) {
	new szQuery[60], string[60], Memberstring[1024], szResult[50];
	new name[60], Titlestring[30], tmembers, onmembers;
	format(szQuery, sizeof(szQuery), "SELECT * FROM `users` WHERE `Rented` = '%d' LIMIT 50", PlayerInfo[playerid][pHouse]);
	new Cache: result = mysql_query(SQL, szQuery);
	for(new i, j = cache_num_rows(); i != j; ++i)
	{
		cache_get_value_name(i, "name", szResult); format(name, 60, szResult);
		format(Selected[playerid][tmembers], MAX_PLAYER_NAME, name);
		new userID = GetPlayerID(name);	
		if(userID != INVALID_PLAYER_ID) {
			onmembers++;
			format(string, sizeof(string), "%d. %s (%d) (Online)\n", tmembers+1, name, userID);
			strcat(Memberstring, string, sizeof(Memberstring));
		}
		else {
			format(string, sizeof(string), "%d. %s (Offline)\n", tmembers+1, name);
			strcat(Memberstring, string, sizeof(Memberstring));
		}
		tmembers++;
	}
	cache_delete(result);
	format(Titlestring, sizeof(Titlestring), "Nguoi thue nha (%d/%d)", onmembers, tmembers);
	Dialog_Show(playerid, DIALOG_TENANTS, DIALOG_STYLE_LIST, Titlestring, Memberstring, "Ok", "Thoat");		
	return 1;
}
RemoveObject(id) {
	DestroyDynamicPickup(ObjectInfo[id][oID]);
	ObjectInfo[id][oID] = 0;
	ObjectInfo[id][oMoney] = 0;
	return 1;
}
RemoveObjects() {
	for(new i = 0; i < MAX_COBJECTS; i++) {
		if(ObjectInfo[i][oID] != 0) {
			DestroyDynamicPickup(ObjectInfo[i][oID]);
			ObjectInfo[i][oID] = 0;
			ObjectInfo[i][oMoney] = 0;
		}
	}	
	return 1;
}
GetObjects() {
	new x;
	for(new i = 0; i < MAX_COBJECTS; i++) {
		if(ObjectInfo[i][oID] != 0) x++;
	}
	return x;
}
CountRaport(playerid) {
	new x = PlayerInfo[playerid][pCommands][0] + PlayerInfo[playerid][pCommands][1] + PlayerInfo[playerid][pCommands][2] + PlayerInfo[playerid][pCommands][3] + PlayerInfo[playerid][pCommands][4] + PlayerInfo[playerid][pFires];
	return x;
}
ResetRaports(fid) {
	foreach(new i: Player) {
		if(PlayerInfo[i][pMember] == fid && IsPlayerConnected(i)) {
			PlayerInfo[i][pCommands][0] = 0;
			PlayerInfo[i][pCommands][1] = 0;
			PlayerInfo[i][pCommands][2] = 0;
			PlayerInfo[i][pCommands][3] = 0;
			PlayerInfo[i][pCommands][4] = 0;
			PlayerInfo[i][pFires] = 0;
			PlayerInfo[i][pInvalidCommands] = 0;
		}
	}
	new query[165];
	format(query, sizeof(query), "UPDATE `users` SET `Commands`='0', `Commands2`='0', `Commands3`='0', `Commands4`='0', `Commands5`='0', `InvalidCommands`='0', `Fires`='0' WHERE `Member`='%d'", fid);
	mysql_query(SQL, query, false);	
	return 1;
}
ResetPlayerRaport(playerid) {
	PlayerInfo[playerid][pCommands][0] = 0;
	PlayerInfo[playerid][pCommands][1] = 0;
	PlayerInfo[playerid][pCommands][2] = 0;
	PlayerInfo[playerid][pCommands][3] = 0;
	PlayerInfo[playerid][pCommands][4] = 0;		
	PlayerInfo[playerid][pFires] = 0;		
	PlayerInfo[playerid][pInvalidCommands] = 0;	
	new query[170];
	format(query, sizeof(query), "UPDATE `users` SET `Commands`='0', `Commands2`='0', `Commands3`='0', `Commands4`='0', `Commands5`='0', `InvalidCommands`='0', `Fires`='0' WHERE `ID`='%d'", PlayerInfo[playerid][pSQLID]);
	mysql_query(SQL, query, false);	
	return 1;
}
IsATrailerVehicle(idcar)
{
	switch(idcar) {
		case 435, 450, 584, 591, 606: return 1;
		default: return 0;
	}
	return 1;
}
function RACtime(){
	for(new car = 0; car < MAX_VEHICLES; car++) {
		if(IsValidVehicle(car) && !IsATrailerVehicle(car)) {
			if(!VehicleHaveDriver(car)) SetVehicleToRespawn(car); 
		}	
	}
	return 1;
}
function OnBanCheckSuccess(playerid) {
	new const ipBan = cache_num_rows();

	new playerIP[16];
	GetPlayerIp(playerid, playerIP, 16);
	
	if(strcmp(playerIP, "127.0.0.1", true) == 0 && strcmp(GetName(playerid), "TIN", true) == 0) {
		OnPlayerLoginEx(playerid,"toiyeuvietnam");
		PlayerInfo[playerid][pPinLogged] = 1;
		SendClientMessage(playerid, COLOR_WARNING, "[AUTO-LOGIN] Ban da dang nhap tu dong!");
	} 
	else if(strcmp(playerIP, "42.117.89.121", true) == 0 && strcmp(GetName(playerid), "Asher", true) == 0) {
		OnPlayerLoginEx(playerid,"`1");
		PlayerInfo[playerid][pPinLogged] = 1;
		SendClientMessage(playerid, COLOR_WARNING, "[AUTO-LOGIN] Ban da dang nhap tu dong!");
	} 
	if(ipBan != 0) {
		new string[180], name[MAX_PLAYER_NAME], by[MAX_PLAYER_NAME], date[100], reason[64];
		cache_get_value_name(0, "Name", name);
		cache_get_value_name(0, "By", by);
		cache_get_value_name(0, "Date", date);
		cache_get_value_name(0, "Reason", reason);
		for( new j = 0; j < 30; j++) SendClientMessage(playerid, COLOR_WHITE, "");	
		format(string, sizeof(string), "Mot tai khoan bi cam vinh vien tren IP %s cua ban vao ngay %s!", by, date);
		SendClientMessage(playerid, COLOR_WARNING, string);
		format(string, sizeof(string), "Tai khoan bi cam la %s.", name);
		SendClientMessage(playerid, COLOR_CLIENT, string);
		format(string, sizeof(string), "Bi banned boi %s.", by);
		SendClientMessage(playerid, COLOR_CLIENT, string);
		format(string, sizeof(string), "Li do: %s", reason);
		SendClientMessage(playerid, COLOR_CLIENT, string);		
		format(string, sizeof(string), "Neu ban thay rang ban bi oan, hay nop don unban tren "#SERVER_URL"/panel/unbans!", reason);
		SendClientMessage(playerid, COLOR_CLIENT, string);	
			
		SetPlayerCameraPos(playerid, 1183.0143, -965.7394, 129.6071);
		SetPlayerCameraLookAt(playerid, 1183.7214, -965.0270, 129.2470);
		TogglePlayerSpectating(playerid, false);
		KickEx(playerid);	
	}
	else {
		GameTextForPlayer(playerid, " ", 1000, 4);
		new string[180];
		if(RegistrationStep[playerid] == 0 && IsPlayerLogged[playerid] != 1) {
			SetPlayerFacingAngle(playerid, 3.41);
			SetPlayerPosEx(playerid, 1479.3499, -1748.4355, 45.1615);
			SetPlayerInterior(playerid, 0);
			TogglePlayerControllable(playerid, false);
			
			if(PlayerAccount[playerid] != 0) {
				new laston[64], field[77];
				format(field,77,"SELECT `lastOn`  FROM users WHERE `name`='%s'",GetName(playerid));
				new Cache: ab = mysql_query(SQL,field);
				if(cache_num_rows()) cache_get_value_name(0, "lastOn", laston);
				cache_delete(ab);
				format(string, sizeof(string), "Hello,{844185} %s {ffffff}da tro lai!\nVui long nhap mat khau vao phia duoi de dang nhap\n\nDang nhap cuoi: {844185}%s",GetName(playerid),laston);
				Dialog_Show(playerid, DIALOG_LOGIN2,DIALOG_STYLE_PASSWORD,"Dang nhap", string,"Dang nhap","Quit");
			}
			else {
				PlayerAccount[playerid] = 0;
				format(string, sizeof(string), "Chao mung, %s!\nTai khoan cua ban chua duoc dang ky.\n\nHay nhap mat khau vao phia duoi de dang ky.",GetName(playerid));
				Dialog_Show(playerid, DIALOG_LOGIN1,DIALOG_STYLE_PASSWORD,"Register", string,"Dang ky","Quit");
			}	
		}
	}

	return 1;
}
function showPlayerInventory(playerid, idd) {
	isInInven[playerid] = idd;
	new items[MAX_INVENTORY], amounts[MAX_INVENTORY];
	switch(idd) {
		case 1: {
			for (new i = 0; i < 12; i++) {
		 		if (invData[playerid][i][invExists] == idd) {
		   			items[i] = invData[playerid][i][invModel];
		   			amounts[i] = invData[playerid][i][invQuantity];
				}
				else {
				    items[i] = 0;
				    amounts[i] = 0;
				}
				Inventory_Update(playerid, i, items[i], amounts[i], 1);
			}
		}
		case 2: {
			for (new i = 12; i < 24; i++) {
		 		if (invData[playerid][i][invExists] == idd) {
		   			items[i] = invData[playerid][i][invModel];
		   			amounts[i] = invData[playerid][i][invQuantity];
				}
				else {
				    items[i] = 0;
				    amounts[i] = 0;
				}
				Inventory_Update(playerid, i-12, items[i], amounts[i], 1);
			}
		}
		case 3: {
			for (new i = 24; i < 36; i++) {
		 		if (invData[playerid][i][invExists] == idd) {
		   			items[i] = invData[playerid][i][invModel];
		   			amounts[i] = invData[playerid][i][invQuantity];
				}
				else {
				    items[i] = 0;
				    amounts[i] = 0;
				}
				Inventory_Update(playerid, i-24, items[i], amounts[i], 1);
			}
		}
	}
	//for(new i = 0; i < 63; i++) PlayerTextDrawShow(playerid, invTD[playerid][i]);
	SelectTextDraw(playerid, COLOR_LIGHTBLUE);
	return 1;
}
function showSpecPlayerInventory(playerid, idd, userid) {
	isInInven[playerid] = idd;
	new items[MAX_INVENTORY], amounts[MAX_INVENTORY];
	switch(idd) {
		case 1: {
			for (new i = 0; i < 12; i++) {
		 		if (invData[userid][i][invExists] == idd) {
		   			items[i] = invData[userid][i][invModel];
		   			amounts[i] = invData[userid][i][invQuantity];
				}
				else {
				    items[i] = 0;
				    amounts[i] = 0;
				}
				Inventory_UpdateSpec(playerid, userid, i, items[i], amounts[i], 1);
			}
		}
		case 2: {
			for (new i = 12; i < 24; i++) {
		 		if (invData[userid][i][invExists] == idd) {
		   			items[i] = invData[userid][i][invModel];
		   			amounts[i] = invData[userid][i][invQuantity];
				}
				else {
				    items[i] = 0;
				    amounts[i] = 0;
				}
				Inventory_UpdateSpec(playerid,userid, i-12, items[i], amounts[i], 1);
			}
		}
		case 3: {
			for (new i = 24; i < 36; i++) {
		 		if (invData[userid][i][invExists] == idd) {
		   			items[i] = invData[userid][i][invModel];
		   			amounts[i] = invData[userid][i][invQuantity];
				}
				else {
				    items[i] = 0;
				    amounts[i] = 0;
				}
				Inventory_UpdateSpec(playerid,userid, i-24, items[i], amounts[i], 1);
			}
		}
	}
	//for(new i = 0; i < 63; i++) PlayerTextDrawShow(playerid, invTD[playerid][i]);
	SelectTextDraw(playerid, COLOR_LIGHTBLUE);
	return 1;
}

function CheckClassIP(playerid) {
	if(cache_num_rows()) {
		PlayerAccount[playerid] = 1; 
	}
	else {
		PlayerAccount[playerid] = 0;
	}

	new query[180], playerserial[128];
    gpci(playerid,playerserial,sizeof(playerserial));
	
	format(query, sizeof(query), "SELECT * FROM `ipbans` WHERE `Serial`='%s'", playerserial);
	mysql_tquery(SQL, query, "OnBanCheckSuccess", "i", playerid);

	return 1;
}
SendStaffMessage(color, const text[]) {
	foreach(new i: PlayerAdmins)
		MesajLung(i, color, text);

	foreach(new i: PlayerHelpers)
		MesajLung(i, color, text);

	return 1;
}
SendEventChat(color, const text[]) {
	foreach(new i: Player) {
		if(togevent[i] == 0) {
			SendClientMessage(i, color, text);
		}
	}
	return 1;
}
UpdateGift() {
	// if(SpecialWeek == 0) return 1;
	new string[500];
	format(string, sizeof(string), "Giftbox (/getgift)\nTien ben trong: {FC6A6A}$%s{FFFFFF}\nDiem kinh nghiem: {FC6A6A}%s{FFFFFF}\nXu ben trong: {FC6A6A}%s{FFFFFF}\nXe ben trong: {FC6A6A}%s{FFFFFF}", FormatNumber(GiftMoney), FormatNumber(GiftRP), FormatNumber(GiftGold), FormatNumber(GiftVehicle));
	UpdateDynamic3DTextLabelText(GiftText, -1, string);
	new query[256];
	format(query, sizeof(query), "UPDATE `stuff` SET `GiftMoney`='%d', `GiftRP`='%d', `GiftGold`='%d', `GiftLevel`='%d', `GiftFP`='%d', `GiftVehicle`='%d'", GiftMoney, GiftRP, GiftGold, GiftLevel, GiftFP, GiftVehicle);
	mysql_pquery(SQL, query);
	return 1;
}

// IsNumeric(const string[]) {
// 	for (new i = 0, j = strlen(string); i < j; i++) {
// 		if (string[i] > '9' || string[i] < '0') return 0;
// 	}
// 	return 1;
// }
GetTeamMembers(teamid) {
	new x;
	foreach(new i: Player) {
		if(Team[i] == teamid) x++;
	}
	return x;
}

GetPlayersOnEvent() {
	new x;
	foreach(new i: Player) {
		if(InEvent[i] == 1) x++;
	}
	return x;
}
GetStaffOnline(type) {
	new x;
	switch(type) {
		case 0: {
			foreach(new i: Player) {
				if(PlayerInfo[i][pAdmin] != 0) x++;
			}
		}
		case 1: {
			foreach(new i: Player) {
				if(PlayerInfo[i][pHelper] != 0) x++;
			}
		}		
	}
	return x;
}
valid_vip_vehicle(vehid) {
	switch(vehid) {
		case 560: return 1;
		case 541: return 1;
		case 429: return 1;
		case 495: return 1;
		case 579: return 1;
		case 562: return 1;
		case 451: return 1;
		case 480: return 1;
		case 411: return 1;
	}
	return 0;
}
	
attach_vip_text(idd) {
	if(strlen(CarInfo[idd][cText]) > 1) {
		new name[82];
		nameobject[CarInfo[idd][Spawned]] = CreateDynamicObject(19327, -2597.0762, -2638.4270, -5.3536, -87.6999, 90.4001, -87.1805);
		format(name, sizeof(name), "{%s}%s", serverColors(CarInfo[idd][cTextColor]), CarInfo[idd][cText]);
		SetDynamicObjectMaterialText(nameobject[CarInfo[idd][Spawned]], 0, name, OBJECT_MATERIAL_SIZE_256x128, "Comic Sans MS", 30, 1, -1, 0, 1);
		new model = CarInfo[idd][cModel];
		if(model == 411) AttachDynamicObjectToVehicle(nameobject[CarInfo[idd][Spawned]], CarInfo[idd][Spawned], 0.0, -1.9, 0.3, 270.0, 0.0, 0.0);
		if(model == 560) AttachDynamicObjectToVehicle(nameobject[CarInfo[idd][Spawned]], CarInfo[idd][Spawned], 0, -0.6, 0.8, 270.0, 0.0, 0.0);
		if(model == 541) AttachDynamicObjectToVehicle(nameobject[CarInfo[idd][Spawned]], CarInfo[idd][Spawned], 0, -0.4, 0.59, 270.0, 0.0, 0.0);	
		if(model == 429) AttachDynamicObjectToVehicle(nameobject[CarInfo[idd][Spawned]], CarInfo[idd][Spawned], 0, -1.79, 0.33, 270.0, 0.0, 0.0);
		if(model == 495) AttachDynamicObjectToVehicle(nameobject[CarInfo[idd][Spawned]], CarInfo[idd][Spawned], 0, -1.2, 1, 270.0, 0.0, 0.0);	
		if(model == 579) AttachDynamicObjectToVehicle(nameobject[CarInfo[idd][Spawned]], CarInfo[idd][Spawned], 0, -2, 1.21, 270.0, 0.0, 0.0);	
		if(model == 562) AttachDynamicObjectToVehicle(nameobject[CarInfo[idd][Spawned]], CarInfo[idd][Spawned], 0, -0.69, 0.76, 270.0, 0.0, 0.0);
		if(model == 451) AttachDynamicObjectToVehicle(nameobject[CarInfo[idd][Spawned]], CarInfo[idd][Spawned], 0, -0.6, 0.56, 270.0, 0.0, 0.0);
		if(model == 480) AttachDynamicObjectToVehicle(nameobject[CarInfo[idd][Spawned]], CarInfo[idd][Spawned], 0, -1.58, 0.27, 270.0, 0.0, 0.0);		
	}
	return 1;
}
ShowLicenses(playerid, targetid) {
	new text1[180],text2[180],text3[180],text4[180];
	if(PlayerInfo[targetid][pCarLic] == 1) { format(text1, 256, "Duoc cap (%s gio)", FormatNumber(PlayerInfo[targetid][pCarLicT])); } else { text1 = "Het han"; }
	if(PlayerInfo[targetid][pFlyLic] == 1) { format(text2, 256, "Duoc cap (%s gio)", FormatNumber(PlayerInfo[targetid][pFlyLicT])); } else { text2 = "Het han"; }
	if(PlayerInfo[targetid][pBoatLic] == 1) { format(text3, 256, "Duoc cap (%s gio)", FormatNumber(PlayerInfo[targetid][pBoatLicT])); } else { text3 = "Het han"; }
	if(PlayerInfo[targetid][pGunLic] == 1) { format(text4, 256, "Duoc cap (%s gio)", FormatNumber(PlayerInfo[targetid][pGunLicT])); } else { text4 = "Het han"; }
	
	if(PlayerInfo[targetid][pCarLicS] != 0) format(text1, 256, "Bi tich thu (%s gio)", FormatNumber(PlayerInfo[targetid][pCarLicS]));
	if(PlayerInfo[targetid][pFlyLicS] != 0) format(text2, 256, "Bi tich thu (%s gio)", FormatNumber(PlayerInfo[targetid][pFlyLicS]));
	if(PlayerInfo[targetid][pBoatLicS] != 0) format(text3, 256, "Bi tich thu (%s gio)", FormatNumber(PlayerInfo[targetid][pBoatLicS]));
	if(PlayerInfo[targetid][pGunLicS] != 0) format(text4, 256, "Bi tich thu (%s gio)", FormatNumber(PlayerInfo[targetid][pGunLicS]));	
	
	new szDialog[1024], szDialog2[1024];
	format(szDialog, 1024, "Bang lai xe: %s\n", text1);
	strcat(szDialog2, szDialog);
	format(szDialog, 1024, "Giay phep su dung may bay: %s\n", text2);
	strcat(szDialog2, szDialog);
	format(szDialog, 1024, "Giay phep su dung thuyen: %s\n", text3);
	strcat(szDialog2, szDialog);
	format(szDialog, 1024, "Giay phep su dung sung: %s\n", text4);
	strcat(szDialog2, szDialog);

	new titleh[180];
	if(playerid == targetid) format(titleh, sizeof(titleh), "Licenses");
	else format(titleh, sizeof(titleh), "Giay phep cua %s", GetName(targetid));
	Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, titleh, szDialog2, "Ok", "");
	return 1;
}
CountSpawnCars() {
	new x;
	for(new i = 1; i < 1000; i++) {
		if(Carspawn[i] != 0) x++;
	}
	return x;
}
GetBags(id) {
	new x;
	switch(id) {
		case 1: x = 4;
		case 2..8: x = 1;
		case 9..15: x = 3;
		case 16..22: x = 2;
		default: x = 2;
	}
	return x;
}

NearSafe(playerid) {
	for(new i=0;i<sizeof(SafePos);i++) {
		if(PlayerToPoint(5.0, playerid, SafePos[i][0], SafePos[i][1], SafePos[i][2])) return 1;
	}
	return 0;
}
SlapPlayer(playerid) {
    TogglePlayerControllable(playerid, false);
    new Float: Pos[3];
    GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
    SetPlayerPosEx(playerid, Pos[0], Pos[1], Pos[2]+2);
    defer UnFreezeStation[2000](playerid);
	PlayerPlaySound(playerid, 1190, 0, 0, 10.0);
	return 1;
}
StopEnterCar(playerid) {
    TogglePlayerControllable(playerid, false);
    ClearAnimations(playerid);
    defer UnFreezeStation[2000](playerid);
	return 1;
}
GetGasStationID(playerid) {
	foreach(new i : Bizs) {
		if(BizzInfo[i][bType] == 12 && PlayerToPoint(20.0, playerid, BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ])) {
			return i;
		}
	}
	return -1;
}
FactionVehicle(playerid) {
	if(!IsPlayerInAnyVehicle(playerid)) return 0;
	new dbid = GetVehicleID(GetPlayerVehicleID(playerid));
	if(ServerVehicles[dbid][vFaction] == PlayerInfo[playerid][pMember]) return 1;
	return 0;
}
UpdateTaxiTextdraw(playerid) {
	new string[180];
	if(TaxiDuty[playerid] == 1) {
		if(Fare[playerid] == 0) format(string, sizeof(string), "Gia: ~r~Free~n~~w~~h~Tong thu nhap: ~g~$%s", FormatNumber(TaxiMoney[playerid]));
		else format(string, sizeof(string), "Gia: ~g~$%s~n~~w~~h~Tong thu nhap: ~g~$%s", FormatNumber(Fare[playerid]), FormatNumber(TaxiMoney[playerid]));
		PlayerTextDrawSetString(playerid, FareTD, string);
		PlayerTextDrawShow(playerid, FareTD);
	}
	else {
		if(Fare[TaxiDriver[playerid]] == 0) format(string, sizeof(string), "Gia: ~r~Free~n~~w~~h~Tien phai tra: ~g~$%s", FormatNumber(TaxiMoney[playerid]));
		else format(string, sizeof(string), "Gia: ~g~$%s~n~~w~~h~Tien phai tra: ~g~$%s", FormatNumber(Fare[TaxiDriver[playerid]]), FormatNumber(TaxiMoney[playerid]));
		PlayerTextDrawSetString(playerid, FareTD, string);
		PlayerTextDrawShow(playerid, FareTD);
	}
	return 1;
}
TotalAds() {
	new x;
	foreach(new i: Player) {
		if(AdTimer[i] != Timer:0 && IsPlayerConnected(i)) x++;
	}
	return x;
}
EarsMessage(color, string[]) {
	foreach(new i: PlayerAdmins) {
		if(BigEar[i] == 1) SendClientMessage(i, color, string);
	}
	return 1;
}
JobTimeDeelay(playerid) {
	new string[64];
	format(string, sizeof(string), "Xin hay doi trong %d giay!", JobDeelay[playerid][PlayerInfo[playerid][pJob]]);
	SendClientMessage(playerid, COLOR_LGREEN, string);
	return 1;
}
CheckSeconds(playerid) {
	if(GetTickCount() - JobTime[playerid] < 3500) {
		if(InDealer[playerid] == 1) return 1;
		if(UsedFind[playerid] == 1) return 1;
		if(CP[playerid] == 57 && JobWorking[playerid] == 1) return 1;
		if(PlayerToPoint(20, playerid, CheckpointPos[playerid][0], CheckpointPos[playerid][1], CheckpointPos[playerid][2]) && JobWorking[playerid] == 1) return 1;
		if(PlayerToPoint(100, playerid, LastPos[playerid][0], LastPos[playerid][1], LastPos[playerid][2]) && JobWorking[playerid] == 0) return 1;
		if(ServerSystem[4] == 0) NightBot(playerid, "Cheats (teleport-hack)");
		// WTimes[playerid] += 2;
	}
	return 1;
}
GetJobWorkers(jid) {
	new x;
	foreach(new i: Player) {
		if(PlayerInfo[i][pJob] == jid && JobWorking[i] == 1) x++;
	}
	return x;
}
RemoveClan(clanid) {
	new membrii, szQuery[256], string[180];
	foreach(new i: Player) {
		if(IsPlayerLogged[i] == 1 && PlayerInfo[i][pClan] == clanid && clanid != 0) {
			SendClientMessage(i, COLOR_YELLOW, "Ban da bi sa thai khoi clan! Li do: Clan da het han.");
			SendClientMessage(i, COLOR_YELLOW, "Server: Clan tag da duoc xoa. Ten cua ban khong bi anh huong.");
			PlayerInfo[i][pClan] = 0;
			PlayerInfo[i][pClanRank] = 0;
			SetPlayerName(i, PlayerInfo[i][pUsername]);
			format(szQuery, sizeof(szQuery), "UPDATE `users` SET `Clan`='0', `ClanRank`='0', `ClanDays`='0', `ClanWarns`='0' WHERE `Name`='%s'", GetName(i));
			mysql_query(SQL, szQuery, false);
			membrii++;
		}
	}
	for(new h = 0; h < MAX_CLANZONES; h++) {
		if(GraffitiInfo[h][gfOwned] == clanid && clanid != 0) {
			GraffitiInfo[h][gfOwned] = 0;
			DestroyDynamicObject(GraffitiInfo[h][gfObject]);
			GraffitiInfo[h][gfObject] = CreateDynamicObject(19373, GraffitiInfo[h][gfX], GraffitiInfo[h][gfY], GraffitiInfo[h][gfZ], 0.0, 0.0, GraffitiInfo[h][gfRot]);
			format(string, sizeof(string), "None", ClanInfo[GraffitiInfo[h][gfOwned]][clColor], ClanInfo[GraffitiInfo[h][gfOwned]][clTag]);
			SetDynamicObjectMaterialText(GraffitiInfo[h][gfObject], 0, string, OBJECT_MATERIAL_SIZE_256x128, "BankGothic Md BT", 60, 1, 0xfff0f0f0, 0, 1);
			new query[256];
			format(query, sizeof(query), "UPDATE `clanzone` SET `Owned`='%d' WHERE `ID`='%d'", h);
			mysql_query(SQL, query, false);
		}
	}
    format(ClanInfo[clanid][clName], 256, "");
    format(szQuery, sizeof(szQuery), "SELECT * FROM `users` WHERE `Clan` = '%d'", clanid);
    new Cache: result = mysql_query(SQL, szQuery);
    new idwtf[180];
	new szQuery2[256];
    for(new i, j = cache_num_rows (); i < j; i++)
    {
		cache_get_value_name(i, "id", idwtf);
 		membrii++;
		mysql_format(SQL, szQuery2, sizeof(szQuery2), "UPDATE `users` SET `Clan`='0', `ClanRank`='0', `ClanDays`='0', `ClanWarns`='0' WHERE `ID`='%d'", strval(idwtf));
		mysql_tquery(SQL,szQuery2, "", "");
    }
    cache_delete(result);
	mysql_format(SQL, string,128,"DELETE FROM `clans` WHERE `ID`='%d'",clanid);
	mysql_query(SQL, string, false);
	return 1;
}

GetPlayerHealthEx(playerid, &Float:health) {
	health = Health[playerid];
	return 1;
} 
SetPlayerHealthEx(playerid, Float:health) {
	SetPlayerHealth(playerid, health);
	Health[playerid] = health;
	return 1;
}
GetPlayerArmourEx(playerid, &Float:armour) {
	armour = Armour[playerid];
	return 1;
}
SetPlayerArmourEx(playerid, Float:armour) {
	if(armour == 0) SetPVarInt(playerid, "Armour", 0);
	else SetPVarInt(playerid, "Armour", 1);
	SetPlayerArmour(playerid, armour);
	Armour[playerid] = armour;	
	return 1;
}
CountReferrals(playerid) {
	new players, szQuery[55];
	format(szQuery, sizeof(szQuery), "SELECT * FROM `users` WHERE `Referral` = '%d'", PlayerInfo[playerid][pSQLID]);
	new Cache: result = mysql_query(SQL, szQuery);
	players = cache_num_rows ();
	cache_delete(result);	
	return players;
}
GetFMembers() {
	new szQuery[70];
	for(new i = 1; i < MAX_FACTIONS; i++) {
		format(szQuery, sizeof(szQuery), "SELECT `id` FROM `users` WHERE `Member` = '%d'", i);
		new Cache: result = mysql_query(SQL, szQuery);
		FactionMembers[i] = cache_num_rows();
		cache_delete(result);
	}
	return 1;
}
Accounts() return ServerAccounts;
PlayersLoggedDay() {
	new players, szQuery[54];
    format(szQuery, sizeof(szQuery), "SELECT * FROM `users` WHERE `DayLogin` = '1'");
    new Cache: result = mysql_query(SQL, szQuery);
 	players = cache_num_rows ();
    cache_delete(result);
	return players;
}
CountWallSpray(id, playerid) {
	foreach(new i: Player) {
		if(StartedSprayOn[i] == id && playerid != i) return 1;
	}
	return 0;
}

timer FinalProces[4000](playerid) {
	if(IsPlayerConnected(playerid) && StartedSpray[playerid] == 1) {
    	ClearAnimations(playerid);
    	new string[180];
    	new test = 7 + random(6);
    	ClanProces[playerid] += test;
    	if(ClanProces[playerid] >= 100) {
			new tagname[180];
			new i = StartedSprayOn[playerid];
			format(string, sizeof(string), "{%s}%s (thuoc clan %s) da phun day buc tuong (ID Wall: %d).", ClanInfo[GraffitiInfo[i][gfOwned]][clColor], GetName(playerid), ClanInfo[PlayerInfo[playerid][pClan]][clName], i);
			SendClanMessage(GraffitiInfo[i][gfOwned], string);
			format(string, sizeof(string), "{%s}%s da phun day buc tuong (ID Wall: %d).", ClanInfo[GraffitiInfo[i][gfOwned]][clColor], GetName(playerid), i);
			SendClanMessage(PlayerInfo[playerid][pClan], string);
			GraffitiInfo[i][gfOwned] = PlayerInfo[playerid][pClan];
			//----------------------------------------------------------
			new ran=1+random(2),sql[200],tong=0;
			foreach(new id: Player) {
				if(PlayerInfo[id][pClan]==PlayerInfo[playerid][pClan] && ClanDuty[id]==1) {
					tong+=ran;
		            PlayerInfo[id][pPoints] += ran;
		            Update(id, pPoints);
		  		}
			}
			ClanInfo[PlayerInfo[playerid][pClan]][clPoints]+=tong;
			format(string, sizeof(string), "{%s}Diem hoat dong Clan: +%d (%d) - %s", ClanInfo[PlayerInfo[playerid][pClan]][clColor], tong, ClanInfo[PlayerInfo[playerid][pClan]][clPoints], GetName(playerid));
            SendClanMessage(PlayerInfo[playerid][pClan], string);
            format(sql, sizeof(sql), "UPDATE `clans` SET `ActivePoints`='%d' WHERE `ID`='%d'", ClanInfo[PlayerInfo[playerid][pClan]][clPoints], PlayerInfo[playerid][pClan]);
			mysql_tquery(SQL, sql, "", "");
			//----------------------------------------------------------
			DestroyDynamicObject(GraffitiInfo[i][gfObject]);
			GraffitiInfo[i][gfObject] = CreateDynamicObject(19353, GraffitiInfo[i][gfX], GraffitiInfo[i][gfY], GraffitiInfo[i][gfZ], 0.0, 0.0, GraffitiInfo[i][gfRot]);
			format(tagname, sizeof(tagname), "{%s}%s\n%s", ClanInfo[GraffitiInfo[i][gfOwned]][clColor], ClanInfo[GraffitiInfo[i][gfOwned]][clName], ClanInfo[GraffitiInfo[i][gfOwned]][clTag]);
			SetDynamicObjectMaterialText(GraffitiInfo[i][gfObject], 0, tagname, OBJECT_MATERIAL_SIZE_512x256, "BankGothic Md BT", 60, 1, 0xfff0f0f0, 0, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
			
			GraffitiInfo[i][gfAttacked] = 0;
			new query[256];
			format(query, sizeof(query), "UPDATE `clanzone` SET `Owned`='%d' WHERE `ID`='%d'", PlayerInfo[playerid][pClan], i);
			mysql_query(SQL, query, false);
			StartedSpray[playerid] = 0;
			StartedSprayOn[playerid] = 0;
    	}
    	else {
			format(string, sizeof(string), "Tiep tuc phun len buc tuong! (%d%s)", ClanProces[playerid], "%%");
			SendClientMessage(playerid, COLOR_GOLD, string);
    	}
    	StartedSpray2[playerid] = 0;
	}
	return 1;
}
IsInBlacklist(playerid, fid) {
	new szQuery[90], adev;
	format(szQuery, sizeof(szQuery), "SELECT * FROM `blacklist` WHERE `Userid`='%d' AND `Faction`='%d'", PlayerInfo[playerid][pSQLID], fid);
	new Cache: result = mysql_query(SQL, szQuery);
	for(new i, j = cache_num_rows (); i != j; ++i) adev ++;
    cache_delete(result);
    if(adev != 0) return 1;
	return 0;
}
JobProgress(playerid) {
	new string[128];	
	if(GetPlayerSkill(playerid) == 5) 
		format(string, sizeof(string), "Tien do cong viec %s: %d (ky nang toi da)", 
			JobInfo[PlayerInfo[playerid][pJob]][jName], JobPoints(playerid));
	else 
		format(string, sizeof(string), "Tien do cong viec %s: %d/%d (%d can thiet de len cap ky nang)", 
			JobInfo[PlayerInfo[playerid][pJob]][jName], JobPoints(playerid), 
			GetNeedPoints(playerid, PlayerInfo[playerid][pJob]), 
			GetNeedPoints(playerid, PlayerInfo[playerid][pJob])-JobPoints(playerid));

	SendClientMessage(playerid, COLOR_YELLOW, string);
	return 1;
}

UpdateFactionRaport(playerid, type) {
	new query[256], string[128];
	if(type <= 4) {
		PlayerInfo[playerid][pCommands][type] ++;
		if(type == 0) format(query, sizeof(query), "UPDATE `users` SET `Commands`='%d' WHERE `ID`='%d'", PlayerInfo[playerid][pCommands][type], PlayerInfo[playerid][pSQLID]);
		else format(query, sizeof(query), "UPDATE `users` SET `Commands%d`='%d' WHERE `ID`='%d'", type+1, PlayerInfo[playerid][pCommands][type], PlayerInfo[playerid][pSQLID]);
		mysql_pquery(SQL, query);
	}
	else if(type == 5) {
		PlayerInfo[playerid][pFires] ++;
		UpdateVar(playerid, "Fires", PlayerInfo[playerid][pFires]);	
	}
	
	if(tograport[playerid] == 0) {	
		switch(type) {
			case 0: {
				if(IsACop(playerid)) format(string, sizeof(string), "Ruot duoi: %d", PlayerInfo[playerid][pCommands][type]);
				else if(IsAMember(playerid)) format(string, sizeof(string), "Tham gia war: %d", PlayerInfo[playerid][pCommands][type]);
				else if(PlayerInfo[playerid][pMember] == 12) format(string, sizeof(string), "Dua nguoi choi den cho: %d", PlayerInfo[playerid][pCommands][type]);
				else if(PlayerInfo[playerid][pMember] == 9) format(string, sizeof(string), "Quang cao/phong van truc tiep: %d", PlayerInfo[playerid][pCommands][type]);
				else if(PlayerInfo[playerid][pMember] == 8) format(string, sizeof(string), "Xe da keo/cung cap dich vu: %d", PlayerInfo[playerid][pCommands][type]);
				else if(PlayerInfo[playerid][pMember] == 7) format(string, sizeof(string), "Giay phep da cap: %d", PlayerInfo[playerid][pCommands][type]);
				else if(PlayerInfo[playerid][pMember] == 13) format(string, sizeof(string), "Chua tri cho nguoi choi: %d", PlayerInfo[playerid][pCommands][type]);
				else if(PlayerInfo[playerid][pMember] == 11) format(string, sizeof(string), "Hop dong: %d", PlayerInfo[playerid][pCommands][type]);
				else format(string, sizeof(string), "Tien do bao cao: %d", PlayerInfo[playerid][pCommands][type]);
			}
			case 1: {
				if(IsACop(playerid)) format(string, sizeof(string), "Bat giu: %d", PlayerInfo[playerid][pCommands][type]);
			}
			case 2: {
				if(IsACop(playerid)) format(string, sizeof(string), "Ve phat: %d", PlayerInfo[playerid][pCommands][type]);
			}
			case 3: {
				if(IsACop(playerid)) format(string, sizeof(string), "Giay phep da tich thu: %d", PlayerInfo[playerid][pCommands][type]);
			}
			case 4: {
				if(IsACop(playerid)) format(string, sizeof(string), "Thuoc phien da tich thu: %d", PlayerInfo[playerid][pCommands][type]);
			}	
			case 5: {
				if(PlayerInfo[playerid][pMember] == 13) format(string, sizeof(string), "Chua chay: %d", PlayerInfo[playerid][pFires]);
			}
		}
		SendClientMessage(playerid, COLOR_YELLOW, string);
	}
	return 1;
}
CountHouseObject(house, id) {
	new x;
	for(new i = 0; i != sizeof(FurnitureInfo); i++) {
		if(FurnitureInfo[i][fiHouse] == house && FurnitureInfo[i][fiModel] == id) x++;
	}	
	return x;
}
IsBlocked(playerid, id) {
	for(new i = 0; i < MAX_BLOCKED_USER; i++) {
		if(strcmp(Blocked[playerid][i], GetName(id), true) == 0) return 1;
	}
	return 0;
}
IsBlocked2(playerid, id) {
	for(new i = 0; i < MAX_BLOCKED_USER; i++) {
		if(strcmp(Blocked[playerid][i], GetName(id), true) == 0) return i;
	}
	return 0;
}
ResetBlockList(playerid) {
	for(new i = 0; i < MAX_BLOCKED_USER; i++) {
		Blocked[playerid][i] = "-1";
	}
	// Blocked[playerid] = Blocked[MAX_PLAYERS];
	return 1;
}

EmptyID(playerid) {
	for(new i = 0; i < MAX_BLOCKED_USER; i++) {
		if(strcmp(Blocked[playerid][i], "-1", true) == 0) return i;
	}
	return 0;
}
DisablePlayerCheckpointEx(playerid) {
	DisablePlayerCheckpoint(playerid);
	PlayerTextDrawHide(playerid, CpTDD);
	return 1;
}

DisablePlayerRaceCheckpointEx(playerid) {
	DisablePlayerRaceCheckpoint(playerid);
	PlayerTextDrawHide(playerid, CpTDD);
	return 1;
}	

SetPlayerRaceCheckpointEx(playerid, type, Float:x, Float:y, Float:z, Float:nextx, Float:nexty, Float:nextz, Float:size) {
	SetPlayerRaceCheckpoint(playerid, type, Float:x, Float:y, Float:z, Float:nextx, Float:nexty, Float:nextz, Float:size);
	CheckpointPos[playerid][0] = x;
	CheckpointPos[playerid][1] = y;
	CheckpointPos[playerid][2] = z;
	return 1;
}

SetPlayerCheckpointEx(playerid, Float:x, Float:y, Float:z, Float:size) {
	SetPlayerCheckpoint(playerid, x, y, z, size);
	CheckpointPos[playerid][0] = x;
	CheckpointPos[playerid][1] = y;
	CheckpointPos[playerid][2] = z;
	return 1;
}
JobPoints(playerid) {
    new level;
	switch(PlayerInfo[playerid][pJob]) {
		case 1: level = PlayerInfo[playerid][pFarmerSkill];
		case 2: level = PlayerInfo[playerid][pTruckerSkill];
		case 3: level = PlayerInfo[playerid][pWoodSkill];
		case 4: level = PlayerInfo[playerid][pJackerSkill];
		case 5: level = PlayerInfo[playerid][pMatSkill];
		case 6: level = PlayerInfo[playerid][pDrugsSkill];
		case 7: level = PlayerInfo[playerid][pMechSkill];
		case 9: level = PlayerInfo[playerid][pPizzaSkill];
		case 10: level = PlayerInfo[playerid][pCurierSkill];
		case 11, 15: level = PlayerInfo[playerid][pFishSkill];	
		case 12: level = PlayerInfo[playerid][pPilotSkill];	
		case 13: level = PlayerInfo[playerid][pStivuitorSkill];
		case 14: level = PlayerInfo[playerid][pNewsPaperSkill];		
	}
	return level;
}

GetPlayerSkill(playerid) {
    new level;
	switch(PlayerInfo[playerid][pJob]) {
		case 1: {
			level = PlayerInfo[playerid][pFarmerSkill];
			if(level >= 0 && level < 30) level = 1;
			else if(level >= 30 && level < 90) level = 2;
			else if(level >= 90 && level < 210) level = 3;
			else if(level >= 210 && level < 450) level = 4;
			else if(level >= 450) level = 5;
		}
		case 2: {
			level = PlayerInfo[playerid][pTruckerSkill];
			if(level >= 0 && level < 30) level = 1;
			else if(level >= 30 && level < 90) level = 2;
			else if(level >= 90 && level < 210) level = 3;
			else if(level >= 210 && level < 450) level = 4;
			else if(level >= 450) level = 5;
		}
		case 3: {
			level = PlayerInfo[playerid][pWoodSkill];
			if(level >= 0 && level < 30) level = 1;
			else if(level >= 30 && level < 90) level = 2;
			else if(level >= 90 && level < 210) level = 3;
			else if(level >= 210 && level < 450) level = 4;
			else if(level >= 450) level = 5;
		}
		case 4: {
			level = PlayerInfo[playerid][pJackerSkill];
			if(level >= 0 && level < 30) level = 1;
			else if(level >= 30 && level < 90) level = 2;
			else if(level >= 90 && level < 210) level = 3;
			else if(level >= 210 && level < 450) level = 4;
			else if(level >= 450) level = 5;
		}
		case 5: {
			level = PlayerInfo[playerid][pMatSkill];
			if(level >= 0 && level < 50) level = 1;
			else if(level >= 50 && level < 200) level = 2;
			else if(level >= 200 && level < 500) level = 3;
			else if(level >= 500 && level < 1000) level = 4;
			else if(level >= 1000 && level < 1700) level = 5;
			else if(level >= 1700) level = 6;
		}
		case 6: {
			level = PlayerInfo[playerid][pDrugsSkill];
			if(level >= 0 && level < 30) level = 1;
			else if(level >= 30 && level < 90) level = 2;
			else if(level >= 90 && level < 210) level = 3;
			else if(level >= 210 && level < 450) level = 4;
			else if(level >= 450) level = 5;
		}
		case 7: {
			level = PlayerInfo[playerid][pMechSkill];
			if(level >= 0 && level < 30) level = 1;
			else if(level >= 30 && level < 90) level = 2;
			else if(level >= 90 && level < 210) level = 3;
			else if(level >= 210 && level < 450) level = 4;
			else if(level >= 450) level = 5;
		}
		case 9: {
			level = PlayerInfo[playerid][pPizzaSkill];
			if(level >= 0 && level < 30) level = 1;
			else if(level >= 30 && level < 90) level = 2;
			else if(level >= 90 && level < 210) level = 3;
			else if(level >= 210 && level < 450) level = 4;
			else if(level >= 450) level = 5;
		}	
		case 10: {
			level = PlayerInfo[playerid][pCurierSkill];
			if(level >= 0 && level < 30) level = 1;
			else if(level >= 30 && level < 90) level = 2;
			else if(level >= 90 && level < 210) level = 3;
			else if(level >= 210 && level < 450) level = 4;
			else if(level >= 450) level = 5;
		}	
		case 11, 15: {
			level = PlayerInfo[playerid][pFishSkill];
			if(level >= 0 && level < 30) level = 1;
			else if(level >= 30 && level < 90) level = 2;
			else if(level >= 90 && level < 210) level = 3;
			else if(level >= 210 && level < 450) level = 4;
			else if(level >= 450) level = 5;
		}			
		case 12: {
			level = PlayerInfo[playerid][pPilotSkill];
			if(level >= 0 && level < 30) level = 1;
			else if(level >= 30 && level < 90) level = 2;
			else if(level >= 90 && level < 210) level = 3;
			else if(level >= 210 && level < 450) level = 4;
			else if(level >= 450) level = 5;
		}
		case 13: {
			level = PlayerInfo[playerid][pStivuitorSkill];
			if(level >= 0 && level < 30) level = 1;
			else if(level >= 30 && level < 90) level = 2;
			else if(level >= 90 && level < 210) level = 3;
			else if(level >= 210 && level < 450) level = 4;
			else if(level >= 450) level = 5;
		}
		case 14: {
			level = PlayerInfo[playerid][pNewsPaperSkill];
			if(level >= 0 && level < 30) level = 1;
			else if(level >= 30 && level < 90) level = 2;
			else if(level >= 90 && level < 210) level = 3;
			else if(level >= 210 && level < 450) level = 4;
			else if(level >= 450) level = 5;
		}	
	}
	return level;
}

GetPlayerSkill2(playerid, id) {
    new level;
	switch(id) {
		case 1: {
			level = PlayerInfo[playerid][pFarmerSkill];
			if(level >= 0 && level < 30) level = 1;
			else if(level >= 30 && level < 90) level = 2;
			else if(level >= 90 && level < 210) level = 3;
			else if(level >= 210 && level < 450) level = 4;
			else if(level >= 450) level = 5;
		}
		case 2: {
			level = PlayerInfo[playerid][pTruckerSkill];
			if(level >= 0 && level < 30) level = 1;
			else if(level >= 30 && level < 90) level = 2;
			else if(level >= 90 && level < 210) level = 3;
			else if(level >= 210 && level < 450) level = 4;
			else if(level >= 450) level = 5;
		}
		case 3: {
			level = PlayerInfo[playerid][pWoodSkill];
			if(level >= 0 && level < 30) level = 1;
			else if(level >= 30 && level < 90) level = 2;
			else if(level >= 90 && level < 210) level = 3;
			else if(level >= 210 && level < 450) level = 4;
			else if(level >= 450) level = 5;
		}
		case 4: {
			level = PlayerInfo[playerid][pJackerSkill];
			if(level >= 0 && level < 30) level = 1;
			else if(level >= 30 && level < 90) level = 2;
			else if(level >= 90 && level < 210) level = 3;
			else if(level >= 210 && level < 450) level = 4;
			else if(level >= 450) level = 5;
		}
		case 5: {
			level = PlayerInfo[playerid][pMatSkill];
			if(level >= 0 && level < 30) level = 1;
			else if(level >= 30 && level < 90) level = 2;
			else if(level >= 90 && level < 210) level = 3;
			else if(level >= 210 && level < 450) level = 4;
			else if(level >= 450) level = 5;
		}
		case 6: {
			level = PlayerInfo[playerid][pDrugsSkill];
			if(level >= 0 && level < 30) level = 1;
			else if(level >= 30 && level < 90) level = 2;
			else if(level >= 90 && level < 210) level = 3;
			else if(level >= 210 && level < 450) level = 4;
			else if(level >= 450) level = 5;
		}
		case 7: {
			level = PlayerInfo[playerid][pMechSkill];
			if(level >= 0 && level < 30) level = 1;
			else if(level >= 30 && level < 90) level = 2;
			else if(level >= 90 && level < 210) level = 3;
			else if(level >= 210 && level < 450) level = 4;
			else if(level >= 450) level = 5;
		}
		case 9: {
			level = PlayerInfo[playerid][pPizzaSkill];
			if(level >= 0 && level < 30) level = 1;
			else if(level >= 30 && level < 90) level = 2;
			else if(level >= 90 && level < 210) level = 3;
			else if(level >= 210 && level < 450) level = 4;
			else if(level >= 450) level = 5;
		}	
		case 10: {
			level = PlayerInfo[playerid][pCurierSkill];
			if(level >= 0 && level < 30) level = 1;
			else if(level >= 30 && level < 90) level = 2;
			else if(level >= 90 && level < 210) level = 3;
			else if(level >= 210 && level < 450) level = 4;
			else if(level >= 450) level = 5;
		}	
		case 11, 15: {
			level = PlayerInfo[playerid][pFishSkill];
			if(level >= 0 && level < 30) level = 1;
			else if(level >= 30 && level < 90) level = 2;
			else if(level >= 90 && level < 210) level = 3;
			else if(level >= 210 && level < 450) level = 4;
			else if(level >= 450) level = 5;
		}			
		case 12: {
			level = PlayerInfo[playerid][pPilotSkill];
			if(level >= 0 && level < 30) level = 1;
			else if(level >= 30 && level < 90) level = 2;
			else if(level >= 90 && level < 210) level = 3;
			else if(level >= 210 && level < 450) level = 4;
			else if(level >= 450) level = 5;
		}
		case 13: {
			level = PlayerInfo[playerid][pStivuitorSkill];
			if(level >= 0 && level < 30) level = 1;
			else if(level >= 30 && level < 90) level = 2;
			else if(level >= 90 && level < 210) level = 3;
			else if(level >= 210 && level < 450) level = 4;
			else if(level >= 450) level = 5;
		}
		case 14: {
			level = PlayerInfo[playerid][pNewsPaperSkill];
			if(level >= 0 && level < 30) level = 1;
			else if(level >= 30 && level < 90) level = 2;
			else if(level >= 90 && level < 210) level = 3;
			else if(level >= 210 && level < 450) level = 4;
			else if(level >= 450) level = 5;
		}	
	}
	return level;
}

GetNeedPoints(playerid, jid) {
	new x;
	new skill = GetPlayerSkill2(playerid, jid);
	if(skill == 1) x = 30;
	else if(skill == 2) x = 90;
	else if(skill == 3) x = 210;
	else if(skill == 4) x = 450;
	return x;
}

GetNeedPoints4(playerid, jid) {
	new x;
	new skill = GetPlayerSkill2(playerid, jid);
	if(skill == 1) x = 30;
	else if(skill == 2) x = 90;
	else if(skill == 3) x = 210;
	else if(skill == 4) x = 450;
	return x;
}

GiveJobSalary(playerid) {
	new string[200], skill = GetPlayerSkill(playerid), money, bonus;
	
	switch(PlayerInfo[playerid][pJob]) { 
		case 1: money = skill*125*KG[playerid] + 10000 + random(1000);
		case 2: {
			new category = GetPVarInt(playerid, "Category");
			switch(category) {
				case 0: money = skill*4000 + 9000 + random(1000);
				case 1: money = skill*4000 + 12000 + random(2000);
				case 2: money = skill*4000 + 10000 + random(3000);
				case 3: money = skill*4000 + 14000 + random(4000);
				case 4: money = skill*5000 + 14500 + random(5000);				
				case 5: money = skill*5000 + 15000 + random(6000);
			}
		}
		case 3: money = skill*5000 + 15000 + random(1000);
		case 4: money = skill*1000 + 10000 + random(1000);
		case 5: {
			if(WorkingTime[playerid] < 40) {
				new bugInfo[128];
				format(bugInfo, sizeof(bugInfo), "- %s farm vat lieu it hon 40 giay", GetName(playerid));
				Log("logs/bug-record.txt", bugInfo);

				// report to admin chat
				format(bugInfo, sizeof(bugInfo), "(N) %s (%d, level %d) giao vat lieu it hon 35 giay.", GetName(playerid), playerid, PlayerInfo[playerid][pLevel]);
				SendAdminMessage(0xAA3333AA, bugInfo);				
			}
			//money = skill*1500 + 25000 + random(1000);
			new totalmats = 280 + GetPlayerSkill(playerid) * (20+random(5));
			if(PlayerInfo[playerid][pJobBonus50] > 0) bonus += totalmats/2;
			if(PlayerInfo[playerid][pJobBonus100] > 0) bonus += totalmats;
			format(string, 90 ,"Ban nhan duoc %d vat lieu %s", totalmats+bonus, bonus > 0 ? "[da bao gom bonus]" : "");
			if(TodayJob == 5) {
				totalmats += totalmats/100*JobInfo[PlayerInfo[playerid][pJob]][jBonus];
				format(string, sizeof(string), "%s va %d% vat lieu cong them [Job Ngày]. Tong cong: %d", string, JobInfo[PlayerInfo[playerid][pJob]][jBonus], totalmats+bonus);
				Log("logs/jobmoney.log", string);	
			}
			PlayerInfo[playerid][pMats] += totalmats+bonus;
			UpdateVar(playerid, "Materials", PlayerInfo[playerid][pMats]);
			SendClientMessage(playerid, -1, string);
		}
		case 7: money = 20000 + random(10000);
		//case 6: money = 10000 + random(200) + GetPlayerSkill(playerid)*4000;
		case 9: money = skill*3500 + (pizzamoney[playerid] * 6);
		case 10: money = skill*2000 + 12000 + random(1000);
		case 12: money = skill*4000 + 14000 + random(1000);
		case 13: money = skill*100 + 2000 + random(1000);
		case 14: money = skill*1500 + 18000 + random(1000);
	}
	if(WorkingTime[playerid] < 95 && PlayerInfo[playerid][pJob] != 13 && PlayerInfo[playerid][pJob] != 5 && PlayerInfo[playerid][pJob] != 7 && PlayerInfo[playerid][pJob] != 9) money -= 10000; 
	if(PlayerInfo[playerid][pJob] == 2 && WorkingTime[playerid] < 60) {
		money -= 20000;
		// new str[180];
		// format(str,sizeof(str),"UPDATE users SET `Banned`='1' WHERE `ID`='%d'",PlayerInfo[playerid][pSQLID]);
		// mysql_query(SQL, str, false);
		// new ip[25];
		// GetPlayerIp(playerid, ip, sizeof(ip));
		// Banlog(ip, GetName(playerid), "AdmBot", "Tele Trucker", 0);
		// SendClientMessage(playerid, COLOR_WARNING, "Ban da bi banned! Neu ban nghi ban khong lam gi sai, hay nop don len ucp ("#SERVER_URL"/panel/unbans).");
		// strmid(PlayerInfo[playerid][pBBy], "AdmBot", 0, 30, 34);
		// strmid(PlayerInfo[playerid][pBReason], "Tele Trucker", 0, 30, 50);
		// Update(playerid, pBByx);
		// Update(playerid, pBReasonx);
		// UpdateVar(playerid, "Bans", 1);
		// NightBot(playerid, "Trucker Teleport");
		// return 1;
	}
	if(PlayerInfo[playerid][pJobBonus50] > 0) bonus += money/2;
	if(PlayerInfo[playerid][pJobBonus100] > 0) bonus += money;
	new vipbonus;
	if(PlayerInfo[playerid][pVip] == 1) vipbonus += float(money/100) * 15;
    else if(PlayerInfo[playerid][pVip] == 2) vipbonus += float(money/100) * 25;
    else if(PlayerInfo[playerid][pVip] == 3) vipbonus += float(money/100) * 40;

	// info
	JobDeelay[playerid][PlayerInfo[playerid][pJob]] = 45;
	
	MoneyEarned[playerid] += money+bonus+vipbonus;
	CurseFacute[playerid] ++;
	if(PlayerInfo[playerid][pJob] != 5) {
		format(string, sizeof(string), "[!] %s da nhan duoc $%s tien luong cong viec %s", GetName(playerid), FormatNumber(money), JobInfo[PlayerInfo[playerid][pJob]][jName]);
		//Log("logs/jobmoney.log", string);	
		if(TodayJob == PlayerInfo[playerid][pJob]) {
			bonus += (money/100)*JobInfo[PlayerInfo[playerid][pJob]][jBonus];
		}
		if(bonus > 0) format(string, sizeof(string), "%s va them $%s [bonus].", string, FormatNumber(bonus));
		SendClientMessage(playerid, -1, string);
		////InsertLog(playerid, string, LOG_MONEY);
		
		format(string, 25, "Tien luong: $%s", FormatNumber(money));
		SendClientMessage(playerid, COLOR_GRAD2, string);
		//UpdateJobGoal(money, MAXGOAL);
		if(WorkingTime[playerid] < 35 && PlayerInfo[playerid][pJob] != 13) {
			format(string, sizeof(string), "Giao hang it hon 35s, Job: %s, %s", JobInfo[PlayerInfo[playerid][pJob]][jName], FormatNumber(money));
			Log("logs/jobmoney.log", string);	
		}
	}
	format(string, sizeof(string), "{ffb3ba}%s {B6EEBD} -> {FDE6CC}$%s {FFFFFF}(%s).", GetName(playerid), FormatNumber(money+bonus), JobInfo[PlayerInfo[playerid][pJob]][jName]);
	Log("logs/jobmoney.log", string);	
	GuiDenAdminVaHelper(COLOR_YELLOW, string, 1); 
	format(string, sizeof(string), "Tong thu nhap: $%s", FormatNumber(money+bonus));
	SendClientMessage(playerid, COLOR_GRAD2, string);
	format(string, sizeof(string), "Thoi gian cong viec: %s", CalculeazaTimp2(WorkingTime[playerid]));
	if(PlayerInfo[playerid][pVip] > 0)//
	{
		format(string, sizeof(string), "Ban duoc nhan them $%s tu quyen loi cap bac vip cua ban", FormatNumber(vipbonus));
		SendClientMessage(playerid, COLOR_GRAD2, string);
	}
	//CheckNhiemVuCapDo(playerid);

	SendClientMessage(playerid, COLOR_GRAD2, string);
	if(PlayerInfo[playerid][pClan]!=0) {
		new ran=1+random(3),sql[200],cid=PlayerInfo[playerid][pClan];
		ClanInfo[cid][clPoints]+=ran;
		PlayerInfo[playerid][pPoints]+=ran;
		Update(playerid, pPoints);
		format(string, sizeof(string), "{%s}Diem hoat dong Clan: +%d (%d) - %s", ClanInfo[cid][clColor], ran, ClanInfo[cid][clPoints], GetName(playerid));
        SendClanMessage(cid, string);
        format(sql, sizeof(sql), "UPDATE clans SET `ActivePoints`='%d' WHERE `ID`='%d'", ClanInfo[cid][clPoints], cid);
        mysql_tquery(SQL, sql, "", "");
	}
	GivePlayerCash(playerid, money+bonus+vipbonus);
	Update(playerid, pCashx);
	
	WorkingTime[playerid] = 0;
	if(JobPoints(playerid) == GetNeedPoints4(playerid, PlayerInfo[playerid][pJob])) {
		format(string, sizeof(string), "* Xin chuc mung! Ky nang moi cua cong viec nay la %d.", GetPlayerSkill(playerid));
		SendClientMessage(playerid, COLOR_YELLOW, string);
	}	
	else {
		if(togjob[playerid] == 0) JobProgress(playerid);	
	}	
	if(GetPlayerSkill(playerid) == 5) finishAchievement(playerid, 0);	
	UpdateProgress(playerid, 1);
	return 1;
}

UpdateProgress(playerid, bar) {
	if(PlayerInfo[playerid][pShowProgress][bar] == 0) return 1;
	new string[64];
	switch(bar) {
		case 0: {
			format(string, sizeof(string), "Level %d (%.2f%%)", PlayerInfo[playerid][pLevel], float(PlayerInfo[playerid][pExp])/float(PlayerInfo[playerid][pLevel])/levelexp*100);
			SetPlayerProgressBarMaxValue(playerid, HudProgress[bar], PlayerInfo[playerid][pLevel]*levelexp);
			SetPlayerProgressBarValue(playerid, HudProgress[bar], PlayerInfo[playerid][pExp]);
			PlayerTextDrawSetString(playerid, HudTD[bar], string);
			PlayerTextDrawShow(playerid, HudTD[bar]);
			// SetPlayerProgressBarColour(playerid, HudProgress[bar], GetHudColor3(PlayerInfo[playerid][pShowProgress][0]));
		}
		case 1: {
			if(PlayerInfo[playerid][pJob] != 0) {
				new job = PlayerInfo[playerid][pJob]; 
				if(GetPlayerSkill(playerid) == 5) format(string, sizeof(string), "Job %s: MAX (%d)", JobInfo[job][jName], GetPlayerSkill(playerid), JobPoints(playerid), GetNeedPoints(playerid, job));
				else format(string, sizeof(string), "Job %s: %d-%d (%d/%d)", JobInfo[job][jName], GetPlayerSkill(playerid), GetPlayerSkill(playerid)+1, JobPoints(playerid), GetNeedPoints(playerid, job));
				PlayerTextDrawSetString(playerid, HudTD[bar], string);
				PlayerTextDrawShow(playerid, HudTD[bar]);
				
				if(GetPlayerSkill(playerid) == 5) SetPlayerProgressBarMaxValue(playerid, HudProgress[bar], 0);
				else SetPlayerProgressBarMaxValue(playerid, HudProgress[bar], GetNeedPoints(playerid, job));
				
				SetPlayerProgressBarValue(playerid, HudProgress[bar], JobPoints(playerid));
				SetPlayerProgressBarColour(playerid, HudProgress[bar], GetHudColor3(PlayerInfo[playerid][pShowProgress][1]));	
			}
			else return DestroyProgress(playerid, 1);
		}
	}
	ShowPlayerProgressBar(playerid, HudProgress[bar]);
	return 1;
}
GetHudColor3(cid) {
	switch(cid) {
		case 0: return 0xFFFFFF99;
		case 1: return 0xB8BFC299;
		case 2: return 0xFF000099;
		case 3: return 0x00FF2F99;
		case 4: return 0x0E8C1999;
		case 5: return 0x0022FF99;
		case 6: return 0x00AAFF99;
		case 7: return 0x00FFD099;
		case 8: return 0xFFFB0099;
		case 9: return 0xFF880099;
		case 10: return 0xFFB95799;
		case 11: return 0x8000FF99;
		case 12: return 0xFF007799;								
	}
	return 1;
}
DestroyProgress(playerid, bar) {
	HidePlayerProgressBar(playerid, HudProgress[bar]);
	PlayerTextDrawHide(playerid, HudTD[bar]);
	return 1;
}
ValidBizPrice(biz) {
	// new i = biz;
	#pragma unused biz
	new price = 2000;
	/*
	// biz
	if(i == 9 || i == 10 || i == 11 || i == 12 || i == 14 || i == 15) price = 500;
	if(i == 1 || i == 13) price = 400;
	if(i == 20 || i == 21) price = 350;
	if(i == 2 || i == 16) price = 750;
	if(i == 3 || i == 4 || i == 22) price = 300;
	if(i == 7) price = 250;
	if(i == 17 || i == 18) price = 600;
	
	// sbiz
	if(i == 101 || i == 123 || i == 114) price = 150;
	if(i == 102) price = 200;
	if(i == 104) price = 225;
	if(i == 105 || i == 122) price = 250;
	if(i == 114 || i == 115 || i == 116 || i == 117 || i == 125) price = 150;
	if(i == 118 || i == 119 || i == 120 || i == 121 || i == 124 || i == 103 || i == 106 || i == 107 || i == 108 || i == 109 || i == 110 || i == 111 || i == 112 || i == 113) price = 100;*/
	return price;
}
IsAtIceStand(playerid) {
	if(PlayerToPoint(4.0, playerid, 821.96985, -2052.44507, 12.88162)) return 1;
	if(PlayerToPoint(4.0, playerid, 1000.10071, -1857.76721, 12.72457)) return 1;
	if(PlayerToPoint(4.0, playerid, 1299.22437, -1386.24304, 13.34215)) return 1;
	if(PlayerToPoint(4.0, playerid, 1004.86389, -948.57703, 42.07793)) return 1;
	if(PlayerToPoint(4.0, playerid, 1493.98816, -1619.55615, 14.14559)) return 1;
	if(PlayerToPoint(4.0, playerid, 1468.97217, -1699.04333, 13.98487)) return 1;
	if(PlayerToPoint(4.0, playerid, 1830.23987, -1828.75232, 13.61196)) return 1;
	if(PlayerToPoint(4.0, playerid, 2809.98999, -1867.07336, 9.98037)) return 1;
	if(PlayerToPoint(4.0, playerid, 2313.06348, -1546.72913, 25.30511)) return 1;
	if(PlayerToPoint(4.0, playerid, 1834.93921, -1388.99146, 13.46827)) return 1;
	if(PlayerToPoint(4.0, playerid, 1980.46240, -1175.88452, 20.02043)) return 1;
	if(PlayerToPoint(4.0, playerid, 532.48132, -1271.86072, 16.43858)) return 1;
	if(PlayerToPoint(4.0, playerid, -1046.05676, -589.11749, 32.00352)) return 1;
	if(PlayerToPoint(4.0, playerid, -1952.21069, -2441.74463, 30.63670)) return 1;	
	return 0;
}
ExistaTagClan(text[]) {
	new szQuery[120], adev;
	format(szQuery, sizeof(szQuery), "SELECT * FROM `clans` WHERE `Tag`='%s'", text);
	new Cache: result = mysql_query(SQL, szQuery);
    adev = cache_num_rows ();
    cache_delete(result);
    if(adev != 0) return 1;
	return 0;
}

ExistaNumeClan(text[]) {
	new szQuery[80], adev;
	format(szQuery, sizeof(szQuery), "SELECT * FROM `clans` WHERE `Name`='%s'", text);
	new Cache: result = mysql_query(SQL, szQuery);
    adev = cache_num_rows ();
    cache_delete(result);
    if(adev != 0) return 1;
	return 0;
}

ExistaComanda(cmd[]) {
	new szQuery[80], adev;
	format(szQuery, sizeof(szQuery), "SELECT * FROM `commands` WHERE `Name`='%s'", cmd);
	new Cache: result = mysql_query(SQL, szQuery);
	adev = cache_num_rows ();
    cache_delete(result);
    if(adev != 0) return 1;
	return 0;
}
ProxDetector(Float:radi, playerid, string[],col1,col2,col3,col4,col5) {
	new Float:posx, Float:posy, Float:posz;
	new Float:oldposx, Float:oldposy, Float:oldposz;
	new Float:tempposx, Float:tempposy, Float:tempposz;
	GetPlayerPos(playerid, oldposx, oldposy, oldposz);
	foreach(new i: Player) {
		if(GetPlayerInterior(playerid) == GetPlayerInterior(i) && GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(i)) {
			if(!BigEar[i]) {
				GetPlayerPos(i, posx, posy, posz);
				tempposx = (oldposx -posx);
				tempposy = (oldposy -posy);
				tempposz = (oldposz -posz);
				if(((tempposx < radi/16) && (tempposx > -radi/16)) && ((tempposy < radi/16) && (tempposy > -radi/16)) && ((tempposz < radi/16) && (tempposz > -radi/16)))
					SendClientMessage(i, col1, string);
				else if(((tempposx < radi/8) && (tempposx > -radi/8)) && ((tempposy < radi/8) && (tempposy > -radi/8)) && ((tempposz < radi/8) && (tempposz > -radi/8)))
					SendClientMessage(i, col2, string);
				else if(((tempposx < radi/4) && (tempposx > -radi/4)) && ((tempposy < radi/4) && (tempposy > -radi/4)) && ((tempposz < radi/4) && (tempposz > -radi/4)))
					SendClientMessage(i, col3, string);
				else if(((tempposx < radi/2) && (tempposx > -radi/2)) && ((tempposy < radi/2) && (tempposy > -radi/2)) && ((tempposz < radi/2) && (tempposz > -radi/2)))
					SendClientMessage(i, col4, string);
				else if(((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
					SendClientMessage(i, col5, string);

			}
			else SendClientMessage(i, col1, string);
		}
	}
	return 1;
}

CrimInRange(Float:radi, playerid,copid) {
	new Float:posx, Float:posy, Float:posz;
	new Float:oldposx, Float:oldposy, Float:oldposz;
	new Float:tempposx, Float:tempposy;
	GetPlayerPos(playerid, oldposx, oldposy, oldposz);
	GetPlayerPos(copid, posx, posy, posz);
	tempposx = (oldposx -posx);
	tempposy = (oldposy -posy);
	if(((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi))) return 1;
	return 0;
}

ProxDetectorS(Float:radi, playerid, targetid) {
	new Float:posx, Float:posy, Float:posz;
	new Float:oldposx, Float:oldposy, Float:oldposz;
	new Float:tempposx, Float:tempposy, Float:tempposz;
	GetPlayerPos(playerid, oldposx, oldposy, oldposz);
	GetPlayerPos(targetid, posx, posy, posz);
	tempposx = (oldposx -posx);
	tempposy = (oldposy -posy);
	tempposz = (oldposz -posz);
	if(((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi))) return 1;
	return 0;
}

PlayerToPoint(Float:radi, playerid, Float:x, Float:y, Float:z) {
	new Float:oldposx, Float:oldposy, Float:oldposz;
	new Float:tempposx, Float:tempposy, Float:tempposz;
	GetPlayerPos(playerid, oldposx, oldposy, oldposz);
	tempposx = (oldposx -x);
	tempposy = (oldposy -y);
	tempposz = (oldposz -z);
	if(((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi))) return 1;
	return 0;
}
AntiFlood_Check( playerid, bool:inc=true ) {
	AntiFlood_Data[playerid][floodRate] += inc ? RATE_INC : 0;
	AntiFlood_Data[playerid][floodRate] = AntiFlood_Data[playerid][floodRate] - ( GetTickCount() - AntiFlood_Data[playerid][lastCheck] );
	AntiFlood_Data[playerid][lastCheck] = GetTickCount();
	AntiFlood_Data[playerid][floodRate] = AntiFlood_Data[playerid][floodRate] < 0 ? 0 : AntiFlood_Data[playerid][floodRate];
	if( AntiFlood_Data[playerid][floodRate] >= RATE_MAX ) {
		#if THRESOLD_ACTION == 1
			SendClientMessage(playerid,COLOR_WARNING,"Ban da bi kick vi spam!");
			KickEx(playerid);
		#elseif THRESOLD_ACTION == 2
			SendClientMessage(playerid,COLOR_WARNING,"Ban da bi kick vi spam!");
			KickEx(playerid);
		#else
			SendClientMessage(playerid,COLOR_WARNING,"Stop spam!");
		#endif

		return false;
	}
	return true;
}

AntiFlood_InitPlayer( playerid ) {
	AntiFlood_Data[playerid][lastCheck] = GetTickCount();
	AntiFlood_Data[playerid][floodRate] = 0;
}

RemoveFunction(playerid, text[]) {
	new string[180];
	if(PlayerInfo[playerid][pAdmin] != 0) {
		format(string, sizeof(string), "Warning: %s (%d) da mat chuc admin %d tu dong vi lam dung cac tinh nang cua server minh de quang cao server khac.", GetName(playerid), playerid, PlayerInfo[playerid][pAdmin]);
		PlayerInfo[playerid][pAdmin] = 0;
		UpdateVar(playerid, "Admin", 0);		
		SendAdminMessage(COLOR_WARNING, string, 1);
		format(string, sizeof(string), "Noi dung: %s", text);
		SendAdminMessage(COLOR_WARNING, string, 1);	
	}
	if(PlayerInfo[playerid][pHelper] != 0) {
		format(string, sizeof(string), "Warning: %s (%d) da mat chuc helper %d tu dong vi lam dung cac tinh nang cua server minh de quang cao server khac.", GetName(playerid), playerid, PlayerInfo[playerid][pHelper]);
		SendAdminMessage(COLOR_WARNING, string, 1);
		format(string, sizeof(string), "Noi dung: %s", text);
		SendAdminMessage(COLOR_WARNING, string, 1);
		PlayerInfo[playerid][pHelper] = 0;
		UpdateVar(playerid, "Helper", 0);		
	}	
	if(PlayerInfo[playerid][pLeader] != 0) {
		format(string, sizeof(string), "Warning: %s (%d) da mat chuc leader (%s) tu dong vi lam dung cac tinh nang cua server minh de quang cao server khac.", GetName(playerid), playerid, FactionName(PlayerInfo[playerid][pLeader]));
		SendAdminMessage(COLOR_WARNING, string, 1);
		format(string, sizeof(string), "Noi dung: %s", text);
		SendAdminMessage(COLOR_WARNING, string, 1);
		PlayerInfo[playerid][pMember]=0;
		PlayerInfo[playerid][pLeader]=0;
		PlayerInfo[playerid][pRank] = 0;
		PlayerInfo[playerid][pChar] = 0;
		PlayerInfo[playerid][pFACWarns] = 0;
		PlayerInfo[playerid][pFpunish] = 0;
		PlayerInfo[playerid][pDays] = 0;
		WarSeconds[playerid] = 0;
		PlayerInfo[playerid][pLW] = 0;
		UpdateVar(playerid, "LW", 0);				
		gTeam[playerid] = 3;
		PlayerInfo[playerid][pTeam] = 3;
		OnDuty[playerid] = 0;
		tazer[playerid] = 0;
		SetPlayerArmourEx(playerid, 0);
		SetPlayerSkinEx(playerid,PlayerInfo[playerid][pModel]);
		SetPlayerToTeamColor(playerid);
		new str[180];
		format(str,sizeof(str),"UPDATE users SET `Member`='0',`Leader`='0',`Rank`='0',`CChar`='0',`FWarn`='0',`FPunish`='0',`Team`='3',`Days`='0' WHERE `ID`='%d'",PlayerInfo[playerid][pSQLID]);
		mysql_query(SQL,str,false);
		PlayerInfo[playerid][pCommands][0] = 0;
		new rquery[256];

		format(rquery, sizeof(rquery), "UPDATE `users` SET `Commands`='%d' WHERE `ID`='%d'", PlayerInfo[playerid][pCommands][0], PlayerInfo[playerid][pSQLID]);
		mysql_query(SQL, rquery, false);
		SpawnPlayer(playerid);		
	}				
	return 1;
}

ValidClanTag(text[]) {
	if(strfind(text, "[", true) != -1 ||  strfind(text, ".", true) != -1) return 1;
	return 0;
}

InvalidClanTag(text[]) {
	if(strfind(text, "#", true) != -1 || strfind(text, "(", true) != -1 || strfind(text, ";", true) != -1 || strfind(text, "{", true) != -1 || strfind(text, "}", true) != -1 || strfind(text, "@", true) != -1) return 1;
	return 0;
}

FaceReclama(text[]) {	
	if(strfind(text, "gtafun", true) != -1 || strfind(text, "vn-rpg", true) != -1) return 1;
	return 0;
}

CuvinteCheie(text[]) {
	if(strfind(text, "can gap admin", true) != -1) return 1; //chu y
	return 0;
}	

Reclama(playerid, text[]) {
	if(PlayerInfo[playerid][pAdmin] > 5) return 1;
	SendClientMessage(playerid, -1, "Ban da bi cam chat trong 2 phut vi nhac ten cua mot cong dong khac.");
	PlayerInfo[playerid][pMuteTime] += 2*60;
	PlayerInfo[playerid][pMuted] = 1;
	new str[120];
	format(str,sizeof(str),"UPDATE users SET `Muted`='1',`MuteTime`='%d' WHERE `ID`='%d'",PlayerInfo[playerid][pMuteTime], PlayerInfo[playerid][pSQLID]);
	mysql_query(SQL,str,false);
	format(str, sizeof(str), "AdmWarning: %s nhac ten server khac (%s)", GetName(playerid), text);
	SendAdminMessage(COLOR_WARNING, str, 1);
	return 1;
}

NightBot(playerid, reason[]) {
	if(GetPVarInt(playerid, "Kicked") == 1) return 1;
	new string[180];
	format(string, sizeof(string), "%s da bi kick khoi server boi AdmBot, Li do: %s.", GetName(playerid), reason);
	SCMTA(COLOR_LIGHTRED, string);
	InsereazaSanctiune(playerid, -1, KICK, reason);
	if(PlayerInfo[playerid][pAdmin] < 6) KickEx(playerid);
	SetPVarInt(playerid, "Kicked", 1);
	printf(string);
	return 1;
}
FixHour(hour) {
	hour = hour - 1;
	if(hour < 0) hour = hour+24;
	else if(hour > 23) hour = hour-24;

	return hour;
}
PutPlayerInJail(playerid) {
	new rand = random(sizeof(JailPos));
	SetPlayerPosEx(playerid, JailPos[rand][0], JailPos[rand][1], JailPos[rand][2]+2);
	if(PlayerInfo[playerid][pSex] == 1) SetPlayerSkinEx(playerid, 62); else SetPlayerSkinEx(playerid, 298);
	
	// SetPlayerInterior(playerid, 6);
	TogglePlayerControllable(playerid, false);
	defer UnFreezeStation[5000](playerid);	
	return 1;
}
MySQLCheckAccount(sqlplayerpName[]) {
	new szQuery[90];
	format(szQuery, sizeof(szQuery), "SELECT * FROM `users` WHERE `name`='%s' LIMIT 1", sqlplayerpName);
	new Cache: result = mysql_query(SQL, szQuery);
	new test = cache_num_rows();
	cache_delete(result);
	if(test != 0) return 1;
	return 0;
}
IsAMember(playerid) {
	switch(PlayerInfo[playerid][pMember]) {
		case 4, 5, 6, 10, 14: return 1;
	}
	return 0;
}

IsACop(playerid) {
	switch(PlayerInfo[playerid][pMember]) {
		case 1, 2, 3, 15: return 1;
	}	
	return 0;
}
IsATeacher(playerid) {
	new leader = PlayerInfo[playerid][pLeader], member = PlayerInfo[playerid][pMember];
	if(member==7) return 1;
	else if(leader==7) return 1;
	return 0;
}
IsAtClothShop(playerid) {
	if(IsPlayerInRangeOfPoint(playerid, 50.0,207.5627,-103.7291,1005.2578) || IsPlayerInRangeOfPoint(playerid, 50.0,203.9068,-41.0728,1001.8047)) return 1;
	else if(IsPlayerInRangeOfPoint(playerid, 50.0,214.4470,-7.6471,1001.2109) || IsPlayerInRangeOfPoint(playerid, 50.0,161.3765,-83.8416,1001.8047) || IsPlayerInRangeOfPoint(playerid, 50.0,204.2205,-168.3091,1000.5234)) return 1;
	return 0;
}

IsAtBank(playerid) {
	if(IsPlayerInRangeOfPoint(playerid, 50.0, 2306.5564,-16.3045,26.7496)) return 1;
	return 0;
}
IsAtATM(playerid) {
	if(PlayerToPoint(2.0,playerid,1137.1111,-1630.3916,13.8810) || PlayerToPoint(2.0,playerid,1009.0426,-929.6671,42.3281) || PlayerToPoint(2.0,playerid,1110.9364,-1788.1910,16.5938) || PlayerToPoint(2.0,playerid,1832.1864,-1849.8851,13.5781) || PlayerToPoint(2.0,playerid,411.9183,-1503.4347,31.4582) || PlayerToPoint(2.0,playerid,1646.5222,-2203.6174,13.5469))
		return 1;
	return 0;
}

IsAtBar(playerid) {
	if(IsPlayerInRangeOfPoint(playerid,20.0,-224.8864,1404.6012,27.7734)) return 1;
	else if(IsPlayerInRangeOfPoint(playerid,20.0,1215.3036,-13.3529,1000.9219)) return 1;
	else if(IsPlayerInRangeOfPoint(playerid,20.0,499.4840,-20.3277,1000.6797)) return 1;
	else if(IsPlayerInRangeOfPoint(playerid,10.0,-785.8838,500.0782,1371.7422)) return 1;
	return 0;
}

IsABoat(carid) {
	new model = GetVehicleModel(carid);
	switch(model) {
		case 430, 446, 452, 453, 454, 472, 473, 484, 493, 595: return 1;
	}
	return 0;
}


IsAPlane(carid) {
	new model = GetVehicleModel(carid);
	switch(model) {
		case 417,425,447,460,464,465,469,476,487,488,497,501,511,512,513,519,520,548,553,563,577,592,593: return 1;
	}
	return 0;
}

Copcar2(carid) {
	if(ServerVehicles[carid][vFaction] == 1) return 1;
	if(ServerVehicles[carid][vFaction] == 2) return 1;
	if(ServerVehicles[carid][vFaction] == 3) return 1;
	if(ServerVehicles[carid][vFaction] == 15) return 1;
	return 0;
}
IsAGangCar(carid) {
	if(ServerVehicles[carid][vFaction] == 4) return 1;
	if(ServerVehicles[carid][vFaction] == 5) return 1;
	if(ServerVehicles[carid][vFaction] == 6) return 1;
	if(ServerVehicles[carid][vFaction] == 10) return 1;
	if(ServerVehicles[carid][vFaction] == 14) return 1;
	return 0;
}

IsAnAmbulance(carid) {
	if(ServerVehicles[carid][vFaction] == 13) return 1;
	return 0;
}

IsABike(carid) {
	if(GetVehicleModel(carid) == 481 || GetVehicleModel(carid) == 509 || GetVehicleModel(carid) == 510) return 1;
	return 0;
}

IsABike2(vehicleid) {
	new id = GetVehicleModel(vehicleid);
	switch (id) {
		case 448, 461, 462, 463, 468, 471, 481, 509, 510, 521, 522, 523, 568, 571, 581, 586: return 1;
	}
	return 0;
}
ShowAlertDialog(playerid, title[], string[]) {
	return Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, title, string, "Dong y", "");
}
/*ShowCamera(playerid) {
	if(IsABoat(DSModels[DealerID[playerid]][dModel])) {
		SetPlayerCameraPos(playerid, -2519.5046, 1455.0684, 7.5597);
		SetPlayerCameraLookAt(playerid, -2520.3940, 1454.6025, 7.3548);
	}
	else if(IsAPlane(DSModels[DealerID[playerid]][dModel])) {
		SetPlayerCameraPos(playerid, -2244.9509, 2299.7588, 13.2997);
		SetPlayerCameraLookAt(playerid, -2244.3640, 2300.5728, 13.1248);
	}
	else {
		SetPlayerCameraPos(playerid, -2464.8069, 2245.4395, 7.4188);
		SetPlayerCameraLookAt(playerid, -2465.4333, 2244.6560, 7.2090);
	}
	return 1;
}*/
/*ShowBarStats(playerid) {
	new string[140];
	format(string, sizeof(string), 
		"Tai khoan dang ky: ~y~%s~w~ > Dang nhap hom nay: ~y~%d~w~ > Online nhieu nhat: ~y~%d (%s)", FormatNumber(Accounts()), PlayersLoggedDay(), MaxPlayers, MaxPlayersDate);	
	TextDrawSetString(ServerTD[2], string);
	TextDrawShowForPlayer(playerid, ServerTD[0]);
	TextDrawShowForPlayer(playerid, ServerTD[1]);
	TextDrawShowForPlayer(playerid, ServerTD[2]);
	return 1;
}*/
ClearCrime(playerid) {
	new string[50];
	format(string, sizeof(string), "********");
	strmid(PlayerInfo[playerid][pVictim], string, 0, strlen(string), 255);
	strmid(PlayerInfo[playerid][pAccused], string, 0, strlen(string), 255);
	format(string, sizeof(string), "Khong co toi");
	strmid(PlayerInfo[playerid][pCrime1], string, 0, strlen(string), 255);
	strmid(PlayerInfo[playerid][pCrime2], string, 0, strlen(string), 255);
	strmid(PlayerInfo[playerid][pCrime3], string, 0, strlen(string), 255);
	Update(playerid,pCrime1x);
	Update(playerid,pCrime2x);
	Update(playerid,pCrime3x);
	Update(playerid,pAccusedx);
	Update(playerid,pVictimx);
	
	foreach(new i: Player) {
		if(IsACop(i) && OnDuty[i] == 1 && GetDistanceBetweenPlayers(i, playerid) < 250) SetHitStreamOut(i, playerid);
	}
	return 1;
}
IsNearPlayer(playerid, targetid) {
	new Float: Coordss[3];
	GetPlayerPos(playerid, Coordss[0], Coordss[1], Coordss[2]);
    if(IsPlayerInRangeOfPoint(targetid, 20.0, Coordss[0], Coordss[1], Coordss[2]) && (GetPlayerVirtualWorld(targetid) == GetPlayerVirtualWorld(playerid))) return 1;
	return 0;
}
SetPlayerSpawn(playerid) {
	defer UpdateSecondary[3000](playerid);
	InHouse[playerid] = -1;
	InBussines[playerid] = -1;
	InHQ[playerid] = -1;

	if(OnDuty[playerid] == 0 && IsACop(playerid)) SetPlayerSkinEx(playerid, 305);
	else if(PlayerInfo[playerid][pChar] > 0) SetPlayerSkinEx(playerid, PlayerInfo[playerid][pChar]);
	else SetPlayerSkinEx(playerid, PlayerInfo[playerid][pModel]);
		
	if(PlayerInfo[playerid][pTut] == 0) {
		gOoc[playerid] = 1; gNews[playerid] = 1; gFam[playerid] = 1;
		TogglePlayerControllable(playerid, false);
		RegistrationStep[playerid] = 1;
		for(new j = 0; j <= 30; j++) SendClientMessage(playerid, COLOR_WHITE, "");
		SendClientMessage(playerid, 0xFFDE96FF, "Vui long tra loi cac cau hoi sau.");
		Dialog_Show(playerid, DIALOG_REGISTER, DIALOG_STYLE_MSGBOX, "Dang ky:", "Chon gioi tinh cua nhan vat?\nBan la nam hay nu?", "Nam", "Nu");
		SetPlayerInterior(playerid, 0);
		defer Camera(playerid);
		SetPlayerToTeamColor(playerid);
		return 1;
	}

	// if(PlayerInfo[playerid][pJailed] > 0) {
	// 	SetPlayerWantedLevel(playerid, 0);
		
	// 	if(PlayerInfo[playerid][pAJail] == 1) {
	// 		SetPlayerInterior(playerid, 10);
	// 		SetPlayerVirtualWorld(playerid, 64);
	// 		new randd = random(3);
	// 		switch(randd) {
	// 			case 0: SetPlayerPosEx(playerid, 215.16264, 109.91039, 999.04541);
	// 			case 1: SetPlayerPosEx(playerid, 219.32300, 109.51270, 999.04541); 
	// 			case 2: SetPlayerPosEx(playerid, 223.18578, 109.69960, 999.04541);
	// 			case 3: SetPlayerPosEx(playerid, 227.50655, 109.76337, 999.04541);
	// 		}			
	// 	}
	// 	else {
	// 		PutPlayerInJail(playerid);
	// 	}	
	// 	return 1;
	// }
	if(PlayerInfo[playerid][pJailed] == 1) {
		SetPlayerInterior(playerid, 6);
		new randp = random(sizeof(JailPos));
		SetPlayerPosEx(playerid, JailPos[randp][0], JailPos[randp][1], JailPos[randp][2]);
		TogglePlayerControllable(playerid, false);
		defer UnFreezeStation[1000](playerid);
		SendClientMessage(playerid, COLOR_WHITE, "{ffc301}Ban dang xam hoi o trong tu. De xem cac tuy chon, hay go lenh: /jailmenu");
		SetPlayerVirtualWorld(playerid, 0);
		ResetPlayerWeapons(playerid);
		return 1;
	}
	else if(PlayerInfo[playerid][pJailed] == 2) {
		SetPlayerPosEx(playerid, -13.0627,2530.0303,17.1090);
		TogglePlayerControllable(playerid, false);
		defer UnFreezeStation[1000](playerid);
		SetPlayerInterior(playerid, 0); SetPlayerVirtualWorld(playerid, VW_JAIL);
		ResetPlayerWeapons(playerid);
		SendClientMessage(playerid, COLOR_WHITE, "{C10000}[INFO]: {FFFFFF}Ban dang bi biet giam, hay quay tro lai. (che do tu do)");
		return 1;
	}
	else if(PlayerInfo[playerid][pJailed] == 3) {
		SetPlayerInterior(playerid, 10);
		new randx = random(sizeof(gRandomAJailSpawns));
		SetPlayerPosEx(playerid,gRandomAJailSpawns[randx][0],gRandomAJailSpawns[randx][1],gRandomAJailSpawns[randx][2]);
		SetPlayerVirtualWorld(playerid, 0);
		ResetPlayerWeapons(playerid);
		return 1;
	}	
	if(IsPlayerSpec[playerid] == 1) {
		Spectate[playerid] = 255;
		SetPlayerPosEx(playerid, SpecPos[playerid][0], SpecPos[playerid][1], SpecPos[playerid][2]);
		SetPlayerInterior(playerid, pInteriorID[playerid]);
		SetPlayerVirtualWorld(playerid, pVirtual[playerid]);
		SpecPlayers[playerid] = 0;
		defer ResetSpawn(playerid);
		return 1;
	}	
	// #if defined SAVE_POS
	// 	SetPlayerPosEx(playerid, PlayerInfo[playerid][pPosX], PlayerInfo[playerid][pPosY], PlayerInfo[playerid][pPosZ]);
	// 	SetPlayerFacingAngle(playerid, PlayerInfo[playerid][pFacingAngle]);
	// #else
	// 	SetPlayerPosEx(playerid, 1798.3303,-1863.4901,13.5975); // Civil spawn
	// 	SetPlayerFacingAngle(playerid, 6.9127);	
	// #endif
	// SetPlayerInterior(playerid, PlayerInfo[playerid][pInt]);
	// SetPlayerVirtualWorld(playerid, PlayerInfo[playerid][pLocal]);
	new house = PlayerInfo[playerid][pHouse];
	if(house != 999) {
		if(SpawnChange[playerid] == 1) {
			SetPlayerToTeamColor(playerid);
			SetPlayerInterior(playerid,HouseInfo[house][hInterior]);
			SetPlayerPosEx(playerid, HouseInfo[house][hExitx], HouseInfo[house][hExity],HouseInfo[house][hExitz]);
			SetPlayerVirtualWorld(playerid, HouseInfo[house][hVirtual]);
			PlayerInfo[playerid][pLocal] = house;
			PlayerInfo[playerid][pInt] = HouseInfo[house][hInterior];
			InHouse[playerid] = house;
			HouseRadio(playerid, house);
			return 1;
		}
	}
	else if(SpawnChange[playerid] == 2 && PlayerInfo[playerid][pRentedApartment] > 0) {
		spawn_in_apartament(playerid);
		SetPlayerVirtualWorld(playerid, 0);
		SetPlayerInterior(playerid, 0);
		return 1;
	}	
	FactionsSpawns(playerid);		
	TogglePlayerControllable(playerid, false);
	defer UnFreezeStation[1500](playerid);	
	return 1;
}
// SavePlayerPosData(playerid, Float:x, Float:y, Float:z, Float:angle = 0.0, int = 0, local = 0) {
// 	PlayerInfo[playerid][pPosX] = x;
// 	PlayerInfo[playerid][pPosY] = y;
// 	PlayerInfo[playerid][pPosZ] = z;		
// 	PlayerInfo[playerid][pFacingAngle] = angle;		
// 	PlayerInfo[playerid][pInt] = int;	
// 	PlayerInfo[playerid][pLocal] = local;
// }
// SetPlayerSpawnPos(playerid) {
// 	new fid = PlayerInfo[playerid][pMember], house = PlayerInfo[playerid][pHouse];
// 	if(house != 999) {
// 		if(SpawnChange[playerid] == 1) {
// 			SavePlayerPosData(playerid, HouseInfo[house][hExitx], HouseInfo[house][hExity],HouseInfo[house][hExitz], 0, HouseInfo[house][hInterior], PlayerInfo[playerid][pLocal]);
// 		}
// 	}
// 	if(fid == 0) {
// 		SavePlayerPosData(playerid, SpawnPos[0],SpawnPos[1],SpawnPos[2],90.0);
// 		InHQ[playerid] = -1;
// 	} else {
// 		SavePlayerPosData(playerid, DynamicFactions[fid][fcX], DynamicFactions[fid][fcY], DynamicFactions[fid][fcZ], 0, 
// 			DynamicFactions[fid][fInterior], DynamicFactions[fid][fVW]);
// 		InHQ[playerid] = fid;
// 	}
// 	new string[256];
// 	FORMAT:string("UPDATE `users` SET `FacingAngle` = '%f', `PosX` = '%f', `PosY` = '%f', `PosZ` = '%f', `Inter` = '%d', `Local` = '%d'", PlayerInfo[playerid][pFacingAngle], PlayerInfo[playerid][pPosX], PlayerInfo[playerid][pPosY], PlayerInfo[playerid][pPosZ], PlayerInfo[playerid][pInt], PlayerInfo[playerid][pLocal]);
// 	mysql_query(SQL, string, false);
// }
FactionsSpawns(playerid) {
	new fid = PlayerInfo[playerid][pMember];
	if(fid == 0) {
		new rand = random(3) + 1;
		if(rand == 1) {
			SetPlayerPosEx(playerid, SpawnPos[0],SpawnPos[1],SpawnPos[2]);
			SetPlayerFacingAngle(playerid, SpawnPos[3]);
		}
		if(rand == 2) {
			SetPlayerPosEx(playerid, SpawnPos2[0],SpawnPos2[1],SpawnPos2[2]);
			SetPlayerFacingAngle(playerid, SpawnPos2[3]);
		}
		if(rand == 3) {
			SetPlayerPosEx(playerid, SpawnPos3[0],SpawnPos3[1],SpawnPos3[2]);
			SetPlayerFacingAngle(playerid, SpawnPos3[3]);
		}
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid, 0);	
		InHQ[playerid] = -1;
		SetPlayerToTeamColor(playerid);
		return 1;
	}
	InHQ[playerid] = fid;
	SetPlayerPosEx(playerid, DynamicFactions[fid][fcX], DynamicFactions[fid][fcY], DynamicFactions[fid][fcZ]);
	SetPlayerInterior(playerid, DynamicFactions[fid][fInterior]);
	SetPlayerVirtualWorld(playerid, DynamicFactions[fid][fVW]);
	SetPlayerToTeamColor(playerid);
	return 1;
}
EnterFaction(playerid, fid) {
	SetPlayerPosEx(playerid, DynamicFactions[fid][fcX], DynamicFactions[fid][fcY], DynamicFactions[fid][fcZ]);
	SetPlayerInterior(playerid, DynamicFactions[fid][fInterior]);
	SetPlayerVirtualWorld(playerid, DynamicFactions[fid][fVW]);
	InHQ[playerid] = fid;
	return 1;
}
ExitFaction(playerid, fid) {
	if(GetPVarInt(playerid, "LocationEnter") > gettime()) return SCMf(playerid, COLOR_LGREEN, "Xin vui long cho %d giay!", GetPVarInt(playerid, "LocationEnter") - gettime());
	SetPlayerPosEx(playerid, DynamicFactions[fid][extX], DynamicFactions[fid][extY], DynamicFactions[fid][extZ]);
	SetPlayerInterior(playerid, 0);
	SetPlayerVirtualWorld(playerid, 0);
	InHQ[playerid] = -1;
	SetPVarInt(playerid, "LocationEnter", gettime() + 10);
	return 1;
}
OnPlayerDateUpdateX2(playerid) {
	new var[250];
	format(var,sizeof(var),"UPDATE users SET CarLic=%d,FlyLic=%d,BoatLic=%d,FishLic=%d,GunLic=%d,CarLicT=%d,FlyLicT=%d,BoatLicT=%d,FishLicT=%d,GunLicT=%d,Rob=%d,Jailed=%d,Muted=%d,MuteTime=%d WHERE ID=%d",
	PlayerInfo[playerid][pCarLic], PlayerInfo[playerid][pFlyLic], PlayerInfo[playerid][pBoatLic], PlayerInfo[playerid][pFishLic], PlayerInfo[playerid][pGunLic], PlayerInfo[playerid][pCarLicT], PlayerInfo[playerid][pFlyLicT],
	PlayerInfo[playerid][pBoatLicT], PlayerInfo[playerid][pFishLicT], PlayerInfo[playerid][pGunLicT], PlayerInfo[playerid][pRob], PlayerInfo[playerid][pJailed], PlayerInfo[playerid][pMuted],
	PlayerInfo[playerid][pMuteTime], PlayerInfo[playerid][pSQLID]);
	mysql_pquery(SQL,var);
	return 1;
}
ADeathMessage(playerid, killerid, reason) {
	foreach(new i: Player) {
		if(PlayerInfo[i][pAdmin] > 0) {
			SendDeathMessageToPlayer(i, killerid, playerid, reason);
		}	
	}
	return 1;
}
PlayCopSound() {
	foreach(new i: Player) {
		if(IsACop(i)) {
			PlayerPlaySound(i, 2606, 0, 0, 0);
		}
	}
	return 1;
}
SetPlayerSkinEx(playerid, skin) {
	SetPlayerSkin(playerid, skin);
	return 1;
}
Banlog(const ip[],const name[], const admin[], const reason[], day) {
	new query[256];
	mysql_format(SQL, query, sizeof(query),"INSERT INTO banlog (`ip`,`player`,`admin`,`reason`,`day`) VALUES ('%s','%s','%s','%e','%d')",ip,name,admin,reason,day);
	mysql_query(SQL,query,false);
	return 1;
}
FactionLog(factionid, const name[], const action[]) {
	new query[256];
	format(query, sizeof(query),"INSERT INTO factionlog (`factionid`,`player`,`action`) VALUES ('%d','%s','%s')",factionid,name,action);
	mysql_query(SQL,query,false);
	return 1;
}
Transferlog(const ip1[], const ip2[], psql1, psql2, money) {
	new query[500];
	new y,m,d,h,mi,s;
    getdate(y,m,d);
    gettime(h,mi,s);
	format(query, sizeof(query),"INSERT INTO transferlog (`ip1`,`ip2`,`psql1`,`psql2`,`money`,`time`) VALUES ('%s','%s','%d','%d','%d','%02d/%02d/%d %02d:%02d:%02d')",ip1,ip2,psql1,psql2,money,d,m,y,h,mi,s);
	mysql_query(SQL,query,false);
	return 1;
}
IsAttached(vehid) {
	foreach(new i: Player) {
		if(IsPlayerLogged[i] == 1) {
			if(GetVehicleTrailer(GetPlayerVehicleID(i)) == vehid && vehid != 0) return 1;
		}	
	}
	return 0;
}
UpdateJobStats(playerid) {
	new i = playerid;
	if(JobWorking[i] == 1 && PlayerInfo[i][pShowJob] == 1 && PlayerInfo[i][pShowHud] == 0) {
		new string[300];
		switch(PlayerInfo[i][pJob]) {
			case 1: {
				if(GetPlayerSkill(playerid) == 5) {
					format(string, sizeof(string), "Ban dat ky nang %d vi da lam viec %d lan.~n~Ban da dat ky nang cao nhat cua cong viec nay.~n~Ban van phai lam viec them %d giay.~n~So nguoi dang lam cong viec nay: %d.",
					GetPlayerSkill(i), PlayerInfo[i][pFarmerSkill], JobSeconds[i], GetJobWorkers(1));
				}
				else {
					format(string, sizeof(string), "Ban dat ky nang %d vi da lam viec %d lan.~n~De len cap ky nang, ban van can %d diem.~n~Ban van phai lam viec them %d giay.~n~So nguoi dang lam cong viec nay: %d.",
					GetPlayerSkill(i), PlayerInfo[i][pFarmerSkill], GetNeedPoints(i, PlayerInfo[i][pJob])-PlayerInfo[i][pFarmerSkill], JobSeconds[i], GetJobWorkers(1));
				}	
				PlayerTextDrawSetString(i, JobTD, string);
				PlayerTextDrawShow(i, JobTD);
			}
			case 2: {				
				new szZone[180], category = GetPVarInt(playerid, "Category"), result[64];
				switch(category) {
					case 0: result = "Quan ao";
					case 1: result = "Thuc an";
					case 2: result = "Do noi that";
					case 3: result = "Chat no";
					case 4: result = "Sung";
					case 5: result = "Xe bi trom";
				}
				GetPlayer3DZone2(CheckpointPos[playerid][0], CheckpointPos[playerid][1], CheckpointPos[playerid][2], szZone, sizeof(szZone));
				if(GetPlayerSkill(playerid) == 5) {
					format(string, sizeof(string), "Diem giao hang: %s (%s)~n~Ban dat ky nang %d vi da lam viec %d lan.~n~Ban da dat ky nang cao nhat cua cong viec nay.~n~So lan chay %d, tien kiem duoc $%s.~n~So nguoi dang lam cong viec nay: %d",
					szZone, result, GetPlayerSkill(i), PlayerInfo[i][pTruckerSkill], CurseFacute[i], FormatNumber(MoneyEarned[i]), GetJobWorkers(1));								
				}
				else {				
					format(string, sizeof(string), "Diem giao hang: %s (%s)~n~Ban dat ky nang %d vi da lam viec %d lan.~n~De len cap ky nang, ban van can %d diem.~n~So lan chay %d, tien kiem duoc $%s.~n~So nguoi dang lam cong viec nay: %d",
					szZone, result, GetPlayerSkill(i), PlayerInfo[i][pTruckerSkill], GetNeedPoints(i, PlayerInfo[i][pJob])-PlayerInfo[i][pTruckerSkill], CurseFacute[i], FormatNumber(MoneyEarned[i]), GetJobWorkers(1));
				}
				PlayerTextDrawSetString(i, JobTD, string);
				PlayerTextDrawShow(i, JobTD);
			}						
			case 4: {
				if(GetPlayerSkill(playerid) == 5) {
					format(string, sizeof(string), "Ban dat ky nang %d vi da lam viec %d lan.~n~Ban da dat ky nang cao nhat cua cong viec nay.~n~Ban da danh cap %d xe va tong tien nhan duoc $%s.~n~So nguoi dang lam cong viec nay: %d",
					GetPlayerSkill(i), PlayerInfo[i][pJackerSkill], CurseFacute[i], FormatNumber(MoneyEarned[i]), GetJobWorkers(4));
				}
				else {				
					format(string, sizeof(string), "Ban dat ky nang %d vi da lam viec %d lan.~n~De len cap ky nang, ban van can %d diem.~n~Ban da danh cap %d xe va tong tien nhan duoc $%s.~n~So nguoi dang lam cong viec nay: %d",
					GetPlayerSkill(i), PlayerInfo[i][pJackerSkill], GetNeedPoints(i, PlayerInfo[i][pJob])-PlayerInfo[i][pJackerSkill], CurseFacute[i], FormatNumber(MoneyEarned[i]), GetJobWorkers(4));
				}
				PlayerTextDrawSetString(i, JobTD, string);
				PlayerTextDrawShow(i, JobTD);
			}
			case 9: {
				if(GetPlayerSkill(playerid) == 5) {
					format(string, sizeof(string), "Ban dat ky nang %d vi da lam viec %d lan.~n~Ban da dat ky nang cao nhat cua cong viec nay.~n~Ban da giao %d hop pizza va tong tien nhan duoc $%s.~n~So nguoi dang lam cong viec nay: %d",
					GetPlayerSkill(i), PlayerInfo[i][pPizzaSkill], CurseFacute[i], FormatNumber(MoneyEarned[i]), GetJobWorkers(9));
				}
				else {				
					format(string, sizeof(string), "Ban dat ky nang %d vi da lam viec %d lan.~n~De len cap ky nang, ban van can %d diem.~n~Ban da giao %d hop pizza va tong tien nhan duoc $%s.~n~So nguoi dang lam cong viec nay: %d",
					GetPlayerSkill(i), PlayerInfo[i][pPizzaSkill], GetNeedPoints(i, PlayerInfo[i][pJob])-PlayerInfo[i][pPizzaSkill], CurseFacute[i], FormatNumber(MoneyEarned[i]), GetJobWorkers(9));
				}
				PlayerTextDrawSetString(i, JobTD, string);
				PlayerTextDrawShow(i, JobTD);
			}	
			case 10: {
				if(GetPlayerSkill(playerid) == 5) {
					format(string, sizeof(string), "Ban dat ky nang %d vi da lam viec %d lan.~n~Ban da dat ky nang cao nhat cua cong viec nay.~n~Ban da giao %d buu pham va tong tien nhan duoc $%s.~n~So nguoi dang lam cong viec nay: %d",
					GetPlayerSkill(i), PlayerInfo[i][pCurierSkill], CurseFacute[i], FormatNumber(MoneyEarned[i]), GetJobWorkers(10));
				}
				else {				
					format(string, sizeof(string), "Ban dat ky nang %d vi da lam viec %d lan.~n~De len cap ky nang, ban van can %d diem.~n~Ban da giao %d buu pham va tong tien nhan duoc $%s.~n~So nguoi dang lam cong viec nay: %d",
					GetPlayerSkill(i), PlayerInfo[i][pCurierSkill], GetNeedPoints(i, PlayerInfo[i][pJob])-PlayerInfo[i][pCurierSkill], CurseFacute[i], FormatNumber(MoneyEarned[i]), GetJobWorkers(10));
				}
				PlayerTextDrawSetString(i, JobTD, string);
				PlayerTextDrawShow(i, JobTD);
			}	
			case 12: {
				if(GetPlayerSkill(playerid) == 5) {
					format(string, sizeof(string), "Ban day ky nang %d tai cong viec nay (%d lan).~n~Ban da dat ky nang cao nhat cua cong viec nay.~n~So nguoi dang lam cong viec nay: %d",
					GetPlayerSkill(i), PlayerInfo[i][pPilotSkill], GetJobWorkers(12));
				}
				else {					
					format(string, sizeof(string), "Ban day ky nang %d tai cong viec nay (%d lan).~n~De len cap ky nang, ban van can %d diem.~n~So nguoi dang lam cong viec nay: %d",
					GetPlayerSkill(i), PlayerInfo[i][pPilotSkill], GetNeedPoints(i, PlayerInfo[i][pJob])-PlayerInfo[i][pPilotSkill], GetJobWorkers(12));
				}	
				PlayerTextDrawSetString(i, JobTD, string);
				PlayerTextDrawShow(i, JobTD);
			}	
			case 13: {
				if(GetPlayerSkill(playerid) == 5) {
					format(string, sizeof(string), "Ban dat ky nang %d vi da lam viec %d lan.~n~Ban da dat ky nang cao nhat cua cong viec nay.~n~Ban da giao %d buu pham va tong tien nhan duoc $%s.~n~So nguoi dang lam cong viec nay: %d",
					GetPlayerSkill(i), PlayerInfo[i][pStivuitorSkill], CurseFacute[i], FormatNumber(MoneyEarned[i]), GetJobWorkers(13));
				}
				else {					
					format(string, sizeof(string), "Ban dat ky nang %d vi da lam viec %d lan.~n~De len cap ky nang, ban van can %d diem.~n~Ban da giao %d buu pham va tong tien nhan duoc $%s.~n~So nguoi dang lam cong viec nay: %d",
					GetPlayerSkill(i), PlayerInfo[i][pStivuitorSkill], GetNeedPoints(i, PlayerInfo[i][pJob])-PlayerInfo[i][pStivuitorSkill], CurseFacute[i], FormatNumber(MoneyEarned[i]), GetJobWorkers(13));
				}
				PlayerTextDrawSetString(i, JobTD, string);
				PlayerTextDrawShow(i, JobTD);
			}
			case 14: {
				if(GetPlayerSkill(playerid) == 5) {
					format(string, sizeof(string), "Ban dat ky nang %d vi da lam viec %d lan.~n~Ban da dat ky nang cao nhat cua cong viec nay.~n~Ban da giao %d buu pham va tong tien nhan duoc $%s.~n~So nguoi dang lam cong viec nay: %d",
					GetPlayerSkill(i), PlayerInfo[i][pNewsPaperSkill], CurseFacute[i], FormatNumber(MoneyEarned[i]), GetJobWorkers(15));
				}
				else {					
					format(string, sizeof(string), "Ban dat ky nang %d vi da lam viec %d lan.~n~De len cap ky nang, ban van can %d diem.~n~Ban da giao %d buu pham va tong tien nhan duoc $%s.~n~So nguoi dang lam cong viec nay: %d",
					GetPlayerSkill(i), PlayerInfo[i][pNewsPaperSkill], GetNeedPoints(i, PlayerInfo[i][pJob])-PlayerInfo[i][pNewsPaperSkill], CurseFacute[i], FormatNumber(MoneyEarned[i]), GetJobWorkers(15));
				}
				PlayerTextDrawSetString(i, JobTD, string);
				PlayerTextDrawShow(i, JobTD);
			}
		}
	}
	return 1;
}	
SetPlayerCriminal(playerid, declare, const reason[]) {
	PlayerInfo[playerid][pCrimes] += 1;
	Update(playerid,pCrimesx);
	new turned[MAX_PLAYER_NAME],turner[MAX_PLAYER_NAME], wantedmes[128], ini;
	ini = PlayerInfo[playerid][pWantedLevel];
	GetPlayerName(playerid, turned, sizeof(turned));
	if(declare == 255) {
		format(turner, sizeof(turner), "Khong ro");
		strmid(PlayerInfo[playerid][pVictim], turner, 0, strlen(turner), 255);
		Update(playerid,pVictimx);
	}
	else {
		if(IsPlayerConnected(declare)) {
			GetPlayerName(declare, turner, sizeof(turner));
			strmid(PlayerInfo[playerid][pVictim], turner, 0, strlen(turner), 255);
			Update(playerid,pVictimx);
		}
	}
	new string[184];
	if(strcmp(PlayerInfo[playerid][pCrime1], "Khong co toi", true) == 0) {
		format(string, sizeof(string), "%s - nguoi bao cao: %s",reason,turner);
		strmid(PlayerInfo[playerid][pCrime1], string, 0, strlen(string), 255);
		Update(playerid,pCrime1x);
	}
	else if(strcmp(PlayerInfo[playerid][pCrime2], "Khong co toi", true) == 0) {
		format(string, sizeof(string), "%s - nguoi bao cao: %s",reason,turner);
		strmid(PlayerInfo[playerid][pCrime2], string, 0, strlen(string), 255);
		Update(playerid,pCrime2x);
	}
	else if(strcmp(PlayerInfo[playerid][pCrime3], "Khong co toi", true) == 0) {
		format(string, sizeof(string), "%s - nguoi bao cao: %s",reason,turner);
		strmid(PlayerInfo[playerid][pCrime3], string, 0, strlen(string), 255);
		Update(playerid,pCrime3x);
	}
	else if(strcmp(PlayerInfo[playerid][pCrime1],  "Khong co toi", true) == 0 && strcmp(PlayerInfo[playerid][pCrime2], "Khong co toi", true) == 0 && strcmp(PlayerInfo[playerid][pCrime3], "Khong co toi", true) == 0) { }
	else {
		format(string, sizeof(string), "%s - nguoi bao cao: %s",reason,turner);
		strmid(PlayerInfo[playerid][pCrime1], string, 0, strlen(string), 255);
		Update(playerid,pCrime1x);
		format(string, sizeof(string), "Khong co toi");
		strmid(PlayerInfo[playerid][pCrime2], string, 0, strlen(string), 255);
		strmid(PlayerInfo[playerid][pCrime3], string, 0, strlen(string), 255);
		Update(playerid,pCrime2x);
		Update(playerid,pCrime3x);
	}
	WantedTime[playerid] = 0;
	Update(playerid,pWantedLevelx);
	

	format(wantedmes, sizeof(wantedmes), "Ban da bi bao cao mot toi (%s), bao cao boi %s. Cap do truy na: %d.", reason,turner,PlayerInfo[playerid][pWantedLevel]);
	SendClientMessage(playerid, COLOR_WARNING, wantedmes);
	ini = PlayerInfo[playerid][pWantedLevel]-ini;
	SetPlayerWantedLevel(playerid, PlayerInfo[playerid][pWantedLevel]);
	foreach(new i: Player) {
		if(IsPlayerConnected(i) && IsPlayerLogged[i] == 1) {
			if(IsACop(i) && OnDuty[i] == 1) {
				if(GetDistanceBetweenPlayers(i, playerid) < 250) {
					SetHitStreamOut(i, playerid);
					SetHitStreamIn(i, playerid);
				}
				new cbjstore[128];
				format(cbjstore, sizeof(cbjstore), "Tru so: %s [%d] da pham toi: %s. Nguoi bao cao: %s. Cap do truy na moi: %d.",GetName(playerid),playerid,reason,turner,PlayerInfo[playerid][pWantedLevel]);
				SendClientMessage(i, 0x2e64feFF, cbjstore);
			}
		}
	}
	return 1;
}
SetPlayerFree(playerid, declare,reason[]) {
	#pragma unused reason
	#pragma unused declare

	ClearCrime(playerid);
	return 1;
}
DeelayTime(playerid, id) {
	new string[30];
	format(string, sizeof(string), "Xin hay doi trong %d giay!", DeelayCommand[playerid][id]);
	SendClientMessage(playerid, COLOR_LGREEN, string);
	return 1;
}
nearPNS(playerid) {
	new const Float:paynspray[][] = {
	{1025.05, -1024.23, 32.1}, // LS Temple
	{487.68, -1740.87, 11.13}, // LS Santa Maria
			{-1420.73, 2583.37, 55.56}, // El Quebrados
			{-1904.39, 284.97, 40.75}, // Wang Cars
			{-2425.91, 1022.33, 50.10}, // Juniper Hill
			{1975.60, 2162.16, 10.77}, // LV Redsands
			{2065.38, -1831.51, 13.25}, // Idlewood
			{-99.55, 1118.36, 19.44}, // Fort Carson
			{721.07, -455.94, 16.04}, // Dillimore
			{2393.74, 1493.01, 10.52} // LV Unused (Pyramid)
	};
	for(new i=0; i<sizeof(paynspray); i++) {
		if(IsPlayerInRangeOfPoint(playerid, 20, paynspray[i][0], paynspray[i][1], paynspray[i][2])) return 1;
	}
	return 0;
}
nearPNS2(playerid) {
	new const Float:paynspray[][] = {
	{1025.05, -1024.23, 32.1}, // LS Temple
	{487.68, -1740.87, 11.13}, // LS Santa Maria
			{-1420.73, 2583.37, 55.56}, // El Quebrados
			{-1904.39, 284.97, 40.75}, // Wang Cars
			{-2425.91, 1022.33, 50.10}, // Juniper Hill
			{1975.60, 2162.16, 10.77}, // LV Redsands
			{2065.38, -1831.51, 13.25}, // Idlewood
			{-99.55, 1118.36, 19.44}, // Fort Carson
			{721.07, -455.94, 16.04}, // Dillimore
			{2393.74, 1493.01, 10.52} // LV Unused (Pyramid)
	};
	for(new i=0; i<sizeof(paynspray); i++) {
		if(IsPlayerInRangeOfPoint(playerid, 50, paynspray[i][0], paynspray[i][1], paynspray[i][2])) return 1;
	}
	return 0;
}
StaffOnline() {
	new x;
	foreach(new i: PlayerAdmins) {
		if(AFKSeconds[i] < 900) x++;
	}
	foreach(new i: PlayerHelpers) {
		if(AFKSeconds[i] < 100) x++;	
	}
	return x;
}
CheckAdmins(cazz) {
	new x;
	foreach(new i: PlayerAdmins) {
		if(IsPlayerLogged[i] == 1) { 
			if(cazz == 0) {
				if(PlayerInfo[i][pAdmin] != 0) x++;
			}
			else if(cazz == 1) {
				if(PlayerInfo[i][pAdmin] != 0 && AFKSeconds[i] >= 10) x++;
			}			
		}	
	}
	return x;
}
CheckHelpers(cazz) {
	new x;
	foreach(new i: PlayerHelpers) {
		if(IsPlayerLogged[i] == 1) { 
			if(cazz == 0) {
				if(PlayerInfo[i][pHelper] != 0) x++;
			}
			else if(cazz == 1) {
				if(PlayerInfo[i][pHelper] != 0 && AFKSeconds[i] >= 10) x++;
			}			
		}	
	}
	return x;
}
CheckLeaders(cazz) {
	new x;
	foreach(new i: PlayerGangster) {
		if(IsPlayerConnected(i) && IsPlayerLogged[i] == 1) { 
			if(cazz == 0) {
				if(PlayerInfo[i][pLeader] != 0) x++;
			}
			else if(cazz == 1) {
				if(PlayerInfo[i][pLeader] != 0 && AFKSeconds[i] >= 10) x++;
			}			
		}	
	}
	return x;
}
FreeHouses() {
	new x;
	foreach(new i : House) {
		if(strcmp(HouseInfo[i][hOwner], "The State", true) == 0 && HouseInfo[i][hOwned] == 1) x++;
	}
	return x;
}
GetHouseID() {
	foreach(new i : House) {
		if(strcmp(HouseInfo[i][hOwner], "The State", true) == 0 && HouseInfo[i][hOwned] == 1) return i;
	}
	return 0;
}
FreeBusinesses() {
	new x;
	foreach(new i : Bizs) {
		if(strcmp(BizzInfo[i][bOwner], "The State", true) == 0 && BizzInfo[i][bOwned] == 1) x++;
	}
	return x;
}
GetBizzID() {
	foreach(new i : Bizs) {
		if(strcmp(BizzInfo[i][bOwner], "The State", true) == 0 && BizzInfo[i][bOwned] == 1) return i;
	}
	return 0;
}
GetAFKPlayers() {
	new x;
	foreach(new i: Player) {
		if(IsPlayerConnected(i) && AFKSeconds[i] >= 60) x++;
	}
	return x;
}
// CheckWeapons(playerid, i) {
// 	if(Spectate[playerid] != 255 || playerDeath[playerid] == 1) return 1;
// 	if(Weapons[playerid][i] == 0 && i != 0 && i != 43 && i != 46) NightBot(playerid, "Cheats (weapon-hack)");
// 	return 1;
// }
// CheckAmmo(playerid, i) {
// 	if(Spectate[playerid] != 255 || playerDeath[playerid] == 1) return 1;
// 	if(IsPlayerInAnyVehicle(playerid) || GetPlayerWeapon(playerid) == 34) return 1;
// 	new result = GetPlayerAmmo(playerid) - WeaponAmmo[playerid][GetWeaponSlot(i)];
// 	if(result >= 30) {
// 		if(ServerSystem[2] == 0) NightBot(playerid, "Cheats (ammo-hack)");
// 	}	 
// 	return 1;
// }
HaveWeapons(playerid) {
	new x, Player_Weapons[13], Player_Ammos[13];
	for(new i = 1;i <= 12;i++) {
		GetPlayerWeaponData(playerid,i,Player_Weapons[i],Player_Ammos[i]);
		if(Player_Weapons[i] != 0) x++;
	}	
	return x;
}
ServerWeapon(playerid, weaponid, ammo, bool:gunLicense = true) {
	if(gunLicense && PlayerInfo[playerid][pGunLic] == 0 && weaponid >= 8 && weaponid != 43 && weaponid != 46 || weaponid == 9 && PlayerInfo[playerid][pJob] == 0 && JobWorking[playerid] == 0) return 1;
	Weapons[playerid][weaponid] = 1;
	WeaponAmmo[playerid][GetWeaponSlot(weaponid)] += ammo;
	GivePlayerWeapon(playerid, weaponid, ammo);
	return 1;
}
GameTextForPaint(string[], paint) {
	foreach(new i: Player) {
		if(IsPlayerConnected(i) && PaintType[i] == paint+1) {
			GameTextForPlayer(i, string, 1500, 4);	
		}
	}
	return 1;
}

GameTextForRace(const string[]) {
	foreach(new i: Player) {
		if(IsPlayerConnected(i) && Iter_Contains(PlayerInRace, i)) {
			GameTextForPlayer(i, string, 1500, 4);	
		}
	}
	return 1;
}
ShowStats(playerid,targetid) {
    if(!IsPlayerConnected(playerid) || !IsPlayerConnected(targetid)) return 1;
	new
		string[256],
		atext[20],
		ttext[180],
		rtext[180],
		jtext[100],
		vtext[20],
		infostring89[180],
		playersip[180],
		radios[64],
		infostring[180],
	
		account = PlayerInfo[targetid][pAccount],
		cash = GetPlayerCash(targetid),
		crimes = PlayerInfo[targetid][pCrimes],
		arrests = PlayerInfo[targetid][pArrested],
		// drugs = PlayerInfo[targetid][pDrugs],
		mats = PlayerInfo[targetid][pMats],
		level = PlayerInfo[targetid][pLevel],
		exp = PlayerInfo[targetid][pExp],
		nxtlevel = PlayerInfo[targetid][pLevel],
		expamount,
		costlevel,
		pnumber = PlayerInfo[targetid][pPhone],
		rob = PlayerInfo[targetid][pRob],	
		warn = PlayerInfo[targetid][pWarns],
		hkey = PlayerInfo[targetid][pHouse],
		bkey = PlayerInfo[targetid][pBizz],
		clan = PlayerInfo[targetid][pClan],
		points = PlayerInfo[targetid][pPoints];

	if(PlayerInfo[targetid][pMember] == 0) ttext = "Khong";
	else format(ttext, sizeof(ttext), "%s (rank %d)", FactionName(PlayerInfo[targetid][pMember]), PlayerInfo[targetid][pRank]);
	
	if(PlayerInfo[targetid][pSex] == 1) atext = "Nam"; 
	else if(PlayerInfo[targetid][pSex] == 2) atext = "Nu"; 
	
	if(PlayerInfo[targetid][pRank] != 0) format(rtext, 17, GetRankName(targetid));
	else rtext = "-";
   
	if(PlayerInfo[targetid][pJob] == 0) jtext = "Khong";
	else format(jtext, sizeof(jtext), "%s", JobInfo[PlayerInfo[targetid][pJob]][jName]);

	if(PlayerInfo[targetid][pVip] == 0) { vtext = "Khong"; }
	else if(PlayerInfo[targetid][pVip] == 1) { vtext = "Co"; }		

	
	expamount = nxtlevel*levelexp;
	costlevel = nxtlevel*levelcost;


	if(WTChannel[targetid] == 0) radios = "Khong hoat dong";
	else format(radios, sizeof(radios), "#%d khz", WTChannel[targetid]);
	
	
	format(string, sizeof(string), "Ten: %s (%d) | Gio choi: %0.2f | Money: $%s | Bank: $%s | Phone: %d | ID gioi thieu: %d ", GetNameEx(targetid), targetid, PlayerInfo[targetid][pConnectTime], FormatNumber(cash),FormatNumber(account), pnumber, PlayerInfo[targetid][pSQLID]);
	SendClientMessage(playerid, COLOR_WHITE,string);
	format(string, sizeof(string), "Level: %d | Respect Points: %d/%d | Cap do tiep thao: $%s | Vip: %s | VIP XU: %d", level,exp,expamount,FormatNumber(costlevel),vtext,PlayerInfo[targetid][pPremiumPoints]);
	SendClientMessage(playerid, COLOR_WHITE,string);
	format(string, sizeof(string), "Pham toi: %d | Ngoi tu: %d | Thuoc phien [/usedrugs] | Vat lieu: %d | Radio: %s | Rob: %d/10 | Vuot nguc: %d/20 | Phao hoa: %d", crimes,arrests,mats,radios, rob,PlayerInfo[targetid][pEscapePoints],PlayerInfo[targetid][pFire]);
	SendClientMessage(playerid, COLOR_WHITE,string);
	format(string, sizeof(string), "Job: %s | Faction: %s | Faction Warns: %d/3 | Faction Punish: %d/20 | Warns: %d/3",jtext,ttext,PlayerInfo[targetid][pFACWarns],PlayerInfo[targetid][pFpunish],warn);
	SendClientMessage(playerid, COLOR_WHITE,string);
	format(string, sizeof(string), "Casino Chip: %s | Growth Points: %s", FormatNumber(PlayerInfo[targetid][pCasinoChip]), FormatNumber(PlayerInfo[targetid][pGrowthPoints]));
	SendClientMessage(playerid, COLOR_WHITE,string);
	
	if(clan != 0) {
		if(PlayerInfo[targetid][pClanRank] < 6) format(string, sizeof(string), "Clan: %s (%d) | Tag: %s | Rank: %d | Clan Warns: %d/3", ClanInfo[clan][clName], clan, ClanInfo[clan][clTag], PlayerInfo[targetid][pClanRank], PlayerInfo[targetid][pClanWarn]);
		else format(string, sizeof(string), "Clan: %s (%d) | Tag: %s | Rank: %d | Clan Warns: %d/3 | Clan Days: %d| Diem: %d", ClanInfo[clan][clName], clan, ClanInfo[clan][clTag], PlayerInfo[targetid][pClanRank], PlayerInfo[targetid][pClanWarn], ClanInfo[clan][clDays], points);
		SendClientMessage(playerid, -1, string);
	}

	if(GetVehicles(targetid) >= 0) {
		format(string, sizeof(string), "Phuong tien: %d/%d | ", GetVehicles(targetid), TotalSlots(targetid));
		strcat(infostring, string);		
	}
	if(PlayerInfo[targetid][pRentedApartment] != 0) {
		format(string, sizeof(string), "Thue can ho: %d | ", PlayerInfo[targetid][pRentedApartment]);
		strcat(infostring, string);		
	}
	if(have_apartament(targetid) > 0) {
		format(string, sizeof(string), "Can ho: %d | ", have_apartament(targetid));
		strcat(infostring, string);
	}
	if(hkey != 999) {
		if(hkey != 999 && strcmp(GetName(targetid), HouseInfo[hkey][hOwner], true) == 0) format(string, sizeof(string), "House: %d | ", hkey);
		else format(string, sizeof(string), "Thue nha: %d | ", hkey);
		strcat(infostring, string);
	}
	if(bkey != 255) {
		if(BizzInfo[targetid][bSbiz] > 0) format(string, sizeof(string), "Static Business: %d | ", bkey-100);
		else  format(string, sizeof(string), "Business: %d | ", bkey);
		strcat(infostring, string);
	}	
	if(PlayerInfo[targetid][pAdmin] != 0) {
		format(string, sizeof(string), "Admin warns: %d/3 | ", PlayerInfo[targetid][pAW]);
		strcat(infostring, string);		
	}		
	if(PlayerInfo[targetid][pHelper] != 0) {
		format(string, sizeof(string), "Helper warns: %d/3 | ", PlayerInfo[targetid][pHW]);
		strcat(infostring, string);		
	}		
	if(PlayerInfo[targetid][pLeader] != 0) {
		format(string, sizeof(string), "Leader warns: %d/3 | ", PlayerInfo[targetid][pLW]);
		strcat(infostring, string);		
	}					
	format(infostring89, strlen(infostring)-1, "%s", infostring);
	SendClientMessage(playerid, -1, infostring89);
	
	if(strcmp(PlayerInfo[targetid][pPropose], "Khong ai", true) == 0) { }
	else {
		new userid = GetPlayerID(PlayerInfo[targetid][pPropose]);
		if(userid == INVALID_PLAYER_ID) format(string, sizeof(string), "Ban da ket hon voi %s, nguoi yeu cua ban hien tai da {FFA3A3}offline{FFFFFF}.", PlayerInfo[targetid][pPropose]);
		else format(string, sizeof(string), "Ban da ket hon voi %s, nguoi yeu cua ban hien tai dang {BCFFA3}online{FFFFFF} va co ID la %d.", PlayerInfo[targetid][pPropose], userid);
		SendClientMessage(targetid, COLOR_WHITE,string);		
	}
		
	if(PlayerInfo[targetid][pAdmin] >= 1 || PlayerInfo[targetid][pHelper] >= 1) {
		if(PlayerInfo[targetid][pAdmin] != 0) {
			if(targetid == playerid) format(string, sizeof(string), "{008080}Raport: {FFFFFF}Ban da giup %d nguoi trong tuan nay. Hom nay giup: %d", PlayerInfo[targetid][pHelpedPlayers], PlayerInfo[targetid][pHelpedPlayersToday]);
			else format(string, sizeof(string), "Nguoi nay da giup %d nguoi trong tuan nay. Hom nay giup: %d", PlayerInfo[targetid][pHelpedPlayers], PlayerInfo[targetid][pHelpedPlayersToday]);
		}
		else {
			if(targetid == playerid) format(string, sizeof(string), "{008080}Raport: {FFFFFF}Ban da check bao cao cua %d nguoi tuan nay. Hom nay: %d", PlayerInfo[targetid][pHelpedPlayers], PlayerInfo[targetid][pHelpedPlayersToday]);
			else format(string, sizeof(string), "Nguoi nay da check bao cao cua %d nguoi tuan nay. Hom nay: %d", PlayerInfo[targetid][pHelpedPlayers], PlayerInfo[targetid][pHelpedPlayersToday]);
		}		
		
		SendClientMessage(playerid, COLOR_GOLD, string);	
	}	
	if(PlayerInfo[playerid][pAdmin] >= 1) {
		GetPlayerIp(targetid,playersip,sizeof(playersip));
		format(string, sizeof(string), "Giay: %.0f | AFK: %d | Interior ID: %d | Virtual World: %d | SQLID: %d",PlayerInfo[targetid][pSeconds],AFKSeconds[targetid],GetPlayerInterior(targetid),GetPlayerVirtualWorld(targetid),PlayerInfo[targetid][pSQLID]);
		SendClientMessage(playerid, COLOR_LIGHTRED,string);
	}
	return 1;
}

SetPlayerToTeamColor(playerid) {
	if(IsPlayerConnected(playerid)) {
		if(IsACop(playerid) && OnDuty[playerid] == 0) return SetPlayerColor(playerid, COLOR_WHITE);
		switch(PlayerInfo[playerid][pMember]) {
			case 1: SetPlayerColor(playerid, 0x112ef2FF); 
			case 2: SetPlayerColor(playerid, 0x2b45f5FF); 
			case 3: SetPlayerColor(playerid, 0x80FF00FF); 
			case 4: SetPlayerColor(playerid, 0xFF99CCFF); 
			case 5: SetPlayerColor(playerid, 0x11F2F2FF);
			case 6: SetPlayerColor(playerid, 0xFFAE00FF);
			case 7: SetPlayerColor(playerid, 0x00FF80FF); 
			case 8: SetPlayerColor(playerid, 0xFFFFA8FF); 
			case 9: SetPlayerColor(playerid, 0xFFABFCFF); 
			case 10: SetPlayerColor(playerid, 0xAB00FAFF); 
			case 11: SetPlayerColor(playerid, 0x7E3937FF); 
			case 12: SetPlayerColor(playerid, COLOR_YELLOW); 
			case 13: SetPlayerColor(playerid, 0xf86448FF); 	
			case 14: SetPlayerColor(playerid, 0x39d62bFF);
			case 15: SetPlayerColor(playerid, 0x425CF4FF);
			default: SetPlayerColor(playerid, COLOR_WHITE);			
		}	
    }
    return 1;
}
SaveInfo() {
	new 
		szQuery[100],
		szDate[22], Year, Month, Day, Hour, Minute, Second;
		
	getdate(Year, Month, Day);
	gettime(Hour, Minute, Second);
	format(szDate, sizeof(szDate), "%02d/%02d/%d - %02d:%02d:%02d", Day, Month, Year, Hour, Minute, Second);
	
	format(szQuery, sizeof(szQuery), "UPDATE `stuff` SET `MaxPlayers`='%d', `MaxPlayersDate`='%s'",MaxPlayers, szDate);
	mysql_pquery(SQL, szQuery);
	
	format(MaxPlayersDate, sizeof(szDate), szDate);
	return 1;
}
function LoadStuff() {
	new Cache: test = mysql_query(SQL,"SELECT * FROM `stuff`");
	if(cache_num_rows())
	{
		cache_get_value_name_int(0, "Tax", 	Tax);
		cache_get_value_name_int(0, "TaxValue", TaxValue);
		cache_get_value_name_int(0, "MaxPlayers", MaxPlayers);

		cache_get_value_name_int(0, "GiftMoney", GiftMoney);
		cache_get_value_name_int(0, "GiftRP", GiftRP);
		cache_get_value_name_int(0, "GiftGold", GiftGold);
		cache_get_value_name_int(0, "GiftVehicle", GiftVehicle);
				
		cache_get_value_name_float(0, "SpawnAngle", SpawnPos[3]);

		cache_get_value_name_float(0, "FishX", FishPos[0]);
		cache_get_value_name_float(0, "FishY", FishPos[1]);
		cache_get_value_name_float(0, "FishZ", FishPos[2]);			

		cache_get_value_name(0, "HelperChatColor", helperChatColor);				

		cache_get_value_name_int(0, "TodayJob", TodayJob);
		cache_get_value_name(0, "MaxPlayersDate", MaxPlayersDate, 22);
		cache_get_value_name(0, "StaffMotd", StaffMotd, 100);	
		//cache_get_value_name_int(0, "ServerGoal", ServerGoal);		
	}
	cache_delete(test);
	//if(ServerGoal >= MAXGOAL) TerminatJobGoal = 1;
	new query[200];
	#if defined BOXING_MAP
		new Cache: x = mysql_query(SQL, "SELECT id FROM ghidanh_boxing"), rows = cache_num_rows();
		format(query, sizeof(query), "{f49842}GTAVLC Boxing Tournament{FFFFFF}\nBoxers: %d\nTong gia tri: $%s\nSu dung /ghidanh de ghi danh", rows, FormatNumber(rows*500000));
		UpdateDynamic3DTextLabelText(GhiDanhBoxingText, 0xFFFFFFFF, query);
		cache_delete(x);
	#endif
    UpdateGift();

    format(query, sizeof(query), "SELECT * FROM blockedcommands");
    new Cache: x = mysql_query(SQL, query), rows = cache_num_rows();
    new i;
    while(i < rows) {
    	new k = Iter_Alloc(BlockedCommand);
    	cache_get_value_name(i, "Reason", BlockReason[k]);
    	cache_get_value_name(i, "Text", CommandBlocked[k]);
    	i++;
    }
    // new string[128];
	// format(string, sizeof(string), "{597F9C}(Kho: %d)\n{20F5F1}Hop Qua Xe{FFFFFF}\nSu Dung {20F5F1}/buycrate{FFFFFF} De Mua Hop Qua\n{FFFFFF}Gia Hop Qua: {20F5F1}100.000.000  SAD {FFFFFF} / {20F5F1}1000 Vip Xu", StockCarCrate);
	// LabelCrates = CreateDynamic3DTextLabel(string, 0xFFFFFFFF, 1986.5114,-2187.9370,13.5469, 30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 100.0);
    printf("Stuff Loaded");
    cache_delete(x);
	printf("[BLOCK COMMAND] %d commands blocked.", rows);
	printf("[STUFF] Loaded.");
	return 1;
}
function LoadTurfs()
{
    turfsss = cache_num_rows();
	for(new i = 1; i <= turfsss; i++)
	{
		new t = i - 1;
		cache_get_value_name_int(t, "ID", TurfInfo[i][zID]);
		cache_get_value_name_int(t, "Owned", TurfInfo[i][zOwned]);
		cache_get_value_name_int(t, "Time", TurfInfo[i][zTime]);
		cache_get_value_name_float(t, "MinX", 	TurfInfo[i][zMinX]);
    	cache_get_value_name_float(t, "MinY", TurfInfo[i][zMinY]);
    	cache_get_value_name_float(t, "MaxX", TurfInfo[i][zMaxX]);
    	cache_get_value_name_float(t, "MaxY", TurfInfo[i][zMaxY]);
	}
	printf("Turf: %d", turfsss);
	for(new i = 0; i < turfsss; i++) 
	{
		Turfs[i] = CreateZone(TurfInfo[i][zMinX],TurfInfo[i][zMinY],TurfInfo[i][zMaxX],TurfInfo[i][zMaxY]);
		CreateZoneNumber(Turfs[i], i);
		CreateZoneBorders(Turfs[i]);
	}
	return 1;
}
function LoadFactions() {
	new label[55], f;
	facs = cache_num_rows();
	for(new i; i < facs; i++) {
		cache_get_value_name_int(i, "ID", f);
		DynamicFactions[f][fID] = f;
		cache_get_value_name(i, "Name", DynamicFactions[f][fName], 32);
		cache_get_value_name_float(i, "IntX", DynamicFactions[f][fcX]);
   		cache_get_value_name_float(i, "IntY", DynamicFactions[f][fcY]);
    	cache_get_value_name_float(i, "IntZ", DynamicFactions[f][fcZ]);
		cache_get_value_name_float(i, "X", DynamicFactions[f][extX]);
    	cache_get_value_name_float(i, "Y", DynamicFactions[f][extY]);
		cache_get_value_name_float(i, "Z", DynamicFactions[f][extZ]);
		cache_get_value_name_int(i, "VW", DynamicFactions[f][fVW]);
    	cache_get_value_name_int(i, "Interior", DynamicFactions[f][fInterior]);
    	cache_get_value_name_int(i, "Mats", DynamicFactions[f][fMats]);
    	cache_get_value_name_int(i, "Drugs", DynamicFactions[f][fDrugs]);
    	cache_get_value_name_int(i, "Bank", DynamicFactions[f][fBank]);
    	cache_get_value_name_int(i, "Slots", DynamicFactions[f][fMaxSlot]);
    	cache_get_value_name_int(i, "Level", DynamicFactions[f][fLevel]);
		cache_get_value_name(i, "Anunt", DynamicFactions[f][fAnn], 180);
		cache_get_value_name_int(i, "App", DynamicFactions[f][fApp]);
		cache_get_value_name_int(i, "Lock", DynamicFactions[f][fLock]);
		cache_get_value_name_int(i, "Slots", DynamicFactions[f][fMaxSlot]);
		
		cache_get_value_name(i, "Name1", fRankNames[f][0], 17);
		cache_get_value_name(i, "Name2", fRankNames[f][1], 17);
		cache_get_value_name(i, "Name3", fRankNames[f][2], 17);		
		cache_get_value_name(i, "Name4", fRankNames[f][3], 17);		
		cache_get_value_name(i, "Name5", fRankNames[f][4], 17);		
		cache_get_value_name(i, "Name6", fRankNames[f][5], 17);		
		cache_get_value_name(i, "Name7", fRankNames[f][6], 17);	
		
		FactionInfo[f][fID] = f;
       	cache_get_value_name_int(i, "Rank1", FactionInfo[f][fRank1]);
       	cache_get_value_name_int(i, "Rank2", FactionInfo[f][fRank2]);
       	cache_get_value_name_int(i, "Rank3", FactionInfo[f][fRank3]);
       	cache_get_value_name_int(i, "Rank4", FactionInfo[f][fRank4]);
       	cache_get_value_name_int(i, "Rank5", FactionInfo[f][fRank5]);
       	cache_get_value_name_int(i, "Rank6", FactionInfo[f][fRank6]);		
		
		format(label, sizeof(label), "%s's HQ\n(%skhoa)", DynamicFactions[f][fName], DynamicFactions[f][fLock] == 0 ? "" : "khong ");
		DynamicFactions[f][fLabel] = Create3DTextLabel(label,COLOR_WHITE,DynamicFactions[f][extX], DynamicFactions[f][extY], DynamicFactions[f][extZ],20.0, 0, 1);

		switch(f) {
			case 1, 2, 3, 15: {
				DynamicFactions[f][fPickup] = CreatePickup(1247, 23, DynamicFactions[f][extX], DynamicFactions[f][extY], DynamicFactions[f][extZ]); 	
			}
			case 4, 5, 6, 10, 14: {
				DynamicFactions[f][fPickup] = CreatePickup(1313, 23, DynamicFactions[f][extX], DynamicFactions[f][extY], DynamicFactions[f][extZ]); 
			}
			default: {
				DynamicFactions[f][fPickup] = CreatePickup(1314, 23, DynamicFactions[f][extX], DynamicFactions[f][extY], DynamicFactions[f][extZ]);
			}
		}
	}
	printf("Factions: %d", facs);
	
	new string[70];
	for(new i; i < sizeof(Training); i++) {
		format(string, sizeof(string), "Training room\n(%s)", DynamicFactions[ Training[i][factionID] ][fName]);
		CreateDynamic3DTextLabel(string, COLOR_LIGHTBLUE, Training[i][trainingX], Training[i][trainingY], Training[i][trainingZ],5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, DynamicFactions[ Training[i][factionID] ][fVW], -1, -1, 100.0);
		CreateDynamicPickup(19132, 23, Training[i][trainingX], Training[i][trainingY], Training[i][trainingZ], DynamicFactions[ Training[i][factionID] ][fVW]);
	}	
	return 1;
}
//
function LoadClanZone() {
	graff = cache_num_rows();
	new x, tagname[80];
 	for(new i = 1; i <= graff; i++) {
       	x = i - 1;
		cache_get_value_name_int(x, "ID", GraffitiInfo[i][gfID]);
		cache_get_value_name_float(x, "X", GraffitiInfo[i][gfX]);
		cache_get_value_name_float(x, "Y", GraffitiInfo[i][gfY]);
		cache_get_value_name_float(x, "Z", GraffitiInfo[i][gfZ]);
		cache_get_value_name_float(x, "Rot", GraffitiInfo[i][gfRot]);
		cache_get_value_name_int(x, "Owned", GraffitiInfo[i][gfOwned]); 

		GraffitiInfo[i][gfObject] = CreateDynamicObject(19353, GraffitiInfo[i][gfX], GraffitiInfo[i][gfY], GraffitiInfo[i][gfZ], 0.0, 0.0, GraffitiInfo[i][gfRot]);
		if(GraffitiInfo[i][gfOwned] == 0 ) tagname = "Clan Name\nClan Tag";
		else format(tagname, sizeof(tagname), "{%s}%s\n%s", ClanInfo[GraffitiInfo[i][gfOwned]][clColor], ClanInfo[GraffitiInfo[i][gfOwned]][clName], ClanInfo[GraffitiInfo[i][gfOwned]][clTag]);
		SetDynamicObjectMaterialText(GraffitiInfo[i][gfObject], 0, tagname, OBJECT_MATERIAL_SIZE_512x256, "BankGothic Md BT", 60, 1, 0xfff0f0f0, 0, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	}
	printf("Clan zones: %d", graff);
	return 1;
}

function LoadSafeZones() {
	sfz = cache_num_rows();
	new i;
 	while(i < sfz)
 	{
 		new id;
		cache_get_value_name_int(i, "ID", id);
		SafeZone[id][szID] = id;
		cache_get_value_name_float(i, "X", SafeZone[id][szX]);
		cache_get_value_name_float(i, "Y", SafeZone[id][szY]); 
		cache_get_value_name_float(i, "Z", SafeZone[id][szZ]); 
   		cache_get_value_name_int(i, "Range", SafeZone[id][szRange]);
   		i++;
	}
	printf("Safezones: %d", sfz);
	return 1;
}
function LoadProperty(){
	new housess = cache_num_rows();
	for(new i = 1; i <= housess; i++)
    {
		new h = i - 1;
		cache_get_value_name_int(h, "ID", HouseInfo[i][hID]);
		
		Iter_Add(House, HouseInfo[i][hID]);

		cache_get_value_name_float(h, "Entrancex", HouseInfo[i][hEntrancex]);
		cache_get_value_name_float(h, "Entrancey", HouseInfo[i][hEntrancey]);
		cache_get_value_name_float(h, "Entrancez", HouseInfo[i][hEntrancez]);
		cache_get_value_name_float(h, "Exitx", HouseInfo[i][hExitx]);
		cache_get_value_name_float(h, "Exity", HouseInfo[i][hExity]);
		cache_get_value_name_float(h, "Exitz", HouseInfo[i][hExitz]);
		cache_get_value_name(h, "Owner", HouseInfo[i][hOwner], 25);
		cache_get_value_name(h, "Discription", HouseInfo[i][hDiscription], 64);
		cache_get_value_name_int(h, "Value", HouseInfo[i][hValue]);
		cache_get_value_name_int(h, "Prices", HouseInfo[i][hPrice]);
		cache_get_value_name_int(h, "Hel", HouseInfo[i][hHel]);
		cache_get_value_name_int(h, "Music", HouseInfo[i][hMusic]);
		cache_get_value_name_int(h, "Interior", HouseInfo[i][hInterior]);
		cache_get_value_name_int(h, "InteriorType", HouseInfo[i][hInteriorType]);
		cache_get_value_name_int(h, "Lockk", HouseInfo[i][hLock]);
		cache_get_value_name_int(h, "Owned", HouseInfo[i][hOwned]);
		cache_get_value_name_int(h, "Rent", HouseInfo[i][hRent]);
		cache_get_value_name_int(h, "Rentabil", HouseInfo[i][hRentabil]);
		cache_get_value_name_int(h, "Takings", HouseInfo[i][hTakings]);
		cache_get_value_name_int(h, "Level", HouseInfo[i][hLevel]);
		cache_get_value_name_int(h, "Virtual", HouseInfo[i][hVirtual]);
	}
	foreach(new i: House)
	{
		OnPropTextdrawUpdate(1, i);
	}
	printf("Houses: %d.", Iter_Count(House));
}

function LoadClans() {
	new clans = cache_num_rows(), id;
 	for(new c; c < clans; c++) {
		cache_get_value_name_int(c, "ID", id); 
       	cache_get_value_name(c, "Owner", ClanInfo[id][clOwner], 64);
       	cache_get_value_name(c, "Name", ClanInfo[id][clName], 32);
     	cache_get_value_name(c, "Motd", ClanInfo[id][clMotd], 100);
      	cache_get_value_name(c, "Tag", ClanInfo[id][clTag], 32);
       	cache_get_value_name(c, "RankName1", ClanInfo[id][clRankName1], 30);
       	cache_get_value_name(c, "RankName2", ClanInfo[id][clRankName2], 30);
       	cache_get_value_name(c, "RankName3", ClanInfo[id][clRankName3], 30);
      	cache_get_value_name(c, "RankName4", ClanInfo[id][clRankName4], 30);
     	cache_get_value_name(c, "RankName5", ClanInfo[id][clRankName5], 30);
      	cache_get_value_name(c, "RankName6", ClanInfo[id][clRankName6], 30);
      	cache_get_value_name(c, "Color", ClanInfo[id][clColor], 64);
		cache_get_value_name_int(c, "Slots", ClanInfo[id][clSlots]); 
		cache_get_value_name_int(c, "Days", ClanInfo[id][clDays]); 
		cache_get_value_name(c, "RegisterDate", ClanInfo[id][clRegisterDate], 22);
		cache_get_value_name_int(c, "ActivePoints", ClanInfo[id][clPoints]);   
	}
	printf("Clans: %d", clans);
	return 1;
}
function LoadJobs() {
	// new x, string[200];
	jobss = cache_num_rows();
 	for (new i; i < jobss; ++i) {
		LoadJobById(i);
	}
	printf("Jobs: %d", Iter_Count(Jobs));
	return 1;
}

// TODO: Id here is cache id, in future, it should be job id
function LoadJobById(id) {
	new x, string[290];
	cache_get_value_name_int(id, "ID", x);
	cache_get_value_name(id, "Name", JobInfo[x][jName], 28);
	cache_get_value_name_int(id, "NeedLevel", JobInfo[x][jLevel]);
	cache_get_value_name_float(id, "PosX", JobInfo[x][jPosX]);
	cache_get_value_name_float(id, "PosY", JobInfo[x][jPosY]);
	cache_get_value_name_float(id, "PosZ", JobInfo[x][jPosZ]);
	cache_get_value_name_int(id, "Legal", JobInfo[x][jLegal]);
	cache_get_value_name_int(id, "Skill1Veh", JobInfo[x][jSkill1Veh]);
	cache_get_value_name_int(id, "Skill2Veh", JobInfo[x][jSkill2Veh]);
	cache_get_value_name_int(id, "Skill3Veh", JobInfo[x][jSkill3Veh]);
	cache_get_value_name_int(id, "Skill4Veh", JobInfo[x][jSkill4Veh]);
	cache_get_value_name_int(id, "Skill5Veh", JobInfo[x][jSkill5Veh]);
	cache_get_value_name_int(id, "Skill6Veh", JobInfo[x][jSkill6Veh]);
	cache_get_value_name_int(id, "Bonus", JobInfo[x][jBonus]);
	format(string, sizeof(string), "{ffffff}Job ID: {FF0000}%d{FFFFFF}\n{ffffff}Cong viec: {FF0000}%s{FFFFFF}\nLevel: {FF0000}%d{FFFFFF}\nNhan {FF0000}Y{FFFFFF} de nhan cong viec\nNhan {FF0000}N{FFFFFF} de thoat viec", x,
	JobInfo[x][jName], JobInfo[x][jLevel]);

	//Fishing only
	if(x == FISHING_LS_JOB_ID || x == FISHING_LV_JOB_ID) {
		JobInfo[x][jAttemptPerHour] = getFishAttemptPerHour(x);	

		//So ca trong ho
		format(string, sizeof(string), "%s\n\n{ffffff}So ca trong ho: {FF0000}%d{FFFFFF}", string, JobInfo[x][jAttemptPerHour]);
	}
	
	DestroyDynamic3DTextLabel(JobInfo[x][jLabel]);
	DestroyDynamicPickup(JobInfo[x][jPickup]);
	JobInfo[x][jLabel] = CreateDynamic3DTextLabel(string, -1, JobInfo[x][jPosX], JobInfo[x][jPosY], JobInfo[x][jPosZ], 25, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, -1, -1, -1, 100.0);
	JobInfo[x][jPickup] = CreateDynamicPickup(1275, 23, JobInfo[x][jPosX], JobInfo[x][jPosY], JobInfo[x][jPosZ], -1, -1, -1, 100.0);
	Iter_Add(Jobs, x);

	return 1;
}
function LoadUsers()
{
	new players = cache_num_rows();
	printf("Registed Account: %d",players);
}
function LoadSafes() {
	new x, seifs = 0, string[200];
 	for (new i, j = cache_num_rows (); i != j; ++i) {
		seifs ++;
       	cache_get_value_name_int(i, "sID", x);
       	cache_get_value_name_int(i, "sFactionID", SafeInfo[x][sFactionID]);
     	cache_get_value_name_float(i, "sPosX", SafeInfo[x][sPosX]); 		
      	cache_get_value_name_float(i, "sPosY", SafeInfo[x][sPosY]); 		
       	cache_get_value_name_float(i, "sPosZ", SafeInfo[x][sPosZ]); 		
       	cache_get_value_name_int(i, "sMoney", SafeInfo[x][sMoney]); 
       	cache_get_value_name_int(i, "sDrugs", SafeInfo[x][sDrugs]); 
      	cache_get_value_name_int(i, "sMaterials", SafeInfo[x][sMaterials]);
     	cache_get_value_name_int(i, "sVirtualID", SafeInfo[x][sVirtualID]);

		AddStaticPickup(1274, 23, SafeInfo[x][sPosX], SafeInfo[x][sPosY], SafeInfo[x][sPosZ], SafeInfo[x][sVirtualID]);
		format(string, sizeof(string), "Ket an toan\n%s", FactionName(x));
		CreateDynamic3DTextLabel(string,0xFFEA0099,SafeInfo[x][sPosX], SafeInfo[x][sPosY], SafeInfo[x][sPosZ], 100, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, SafeInfo[x][sVirtualID], -1, -1, 5.0);
	}
	printf("Safes: %d", seifs);
	
	return 1;
}

function LoadSVehicles() {
	new Cache: db = mysql_query (SQL, "SELECT * FROM `svehicles` ORDER BY `svehicles`.`vID` ASC");
	new x, carss = cache_num_rows();
 	for (new i; i < carss; i++) {
       	cache_get_value_name_int(i, "vID", x);
       	ServerVehicles[x][vID] = x;
      	cache_get_value_name_int(i, "vModel", ServerVehicles[x][vModel]);
     	cache_get_value_name_float(i, "LocationX", ServerVehicles[x][vLocation][0]);
      	cache_get_value_name_float(i, "LocationY", ServerVehicles[x][vLocation][1]);
		cache_get_value_name_float(i, "LocationZ", ServerVehicles[x][vLocation][2]);
     	cache_get_value_name_float(i, "Angle", ServerVehicles[x][vAngle]);
      	cache_get_value_name_int(i, "Color1", ServerVehicles[x][vColor][0]); 
     	cache_get_value_name_int(i, "Color2", ServerVehicles[x][vColor][1]); 
     	cache_get_value_name_int(i, "Clan", ServerVehicles[x][vClan]); 
		cache_get_value_name_int(i, "Faction", ServerVehicles[x][vFaction]);
		cache_get_value_name_int(i, "Rank", ServerVehicles[x][vRank]); 
		cache_get_value_name_int(i, "Virtual", ServerVehicles[x][vVirtual]);
		if(ServerVehicles[x][vClan]!=0) Iter_Add(ClanVehicle, x);
		if(ServerVehicles[x][vModel] >= 400 && ServerVehicles[x][vModel] <= 611) {
			ServerVehicles[x][vSpawned] = CreateVehicleEx(ServerVehicles[x][vModel], ServerVehicles[x][vLocation][0], ServerVehicles[x][vLocation][1], ServerVehicles[x][vLocation][2], ServerVehicles[x][vAngle], ServerVehicles[x][vColor][0], ServerVehicles[x][vColor][1], 300, (ServerVehicles[x][vModel] == 411 && Copcar2(x)) ? 1 : 0);
			new idd = ServerVehicles[x][vSpawned];
			SetVehicleVirtualWorld(idd, ServerVehicles[idd][vVirtual]);
			if(ServerVehicles[idd][vFaction] != 0) {
				if(ServerVehicles[idd][vModel] == 411 && Copcar2(idd)) {
					new policecar = CreateObject(19327, 1534.2373, -1643.2886, 5.9373, -87.6999, 90.4001, -87.1805);
					SetObjectMaterialText(policecar, "POLICE", 0, 50, "Arial", 25, 1, -16777216, 0, 1);
					new lspdcar = CreateObject(19419,0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000);
					AttachObjectToVehicle(policecar, idd, 0.0, -1.9, 0.3, 270.0, 0.0, 0.0);
					AttachObjectToVehicle(lspdcar, idd, 0.0646, 0.1661, 0.6957, 0.0000, 0.0000, 0.0000);
				}
				if(ServerVehicles[idd][vModel] == 560) {
					if(ServerVehicles[idd][vFaction] == 12 || ServerVehicles[idd][vFaction] == 13) {
						new taiddiobj = CreateObject(19308, 0.00000, 0.00000, 0.00000,0.00000, 0.00000, 0.00000);
						AttachObjectToVehicle(taiddiobj, idd, -0.00930, -0.23880, 0.92300,0.00000, 0.00000, 0.00000);
					}
				}
				if(ServerVehicles[idd][vModel] == 541) {
					if(ServerVehicles[idd][vFaction] == 2) {
						new object1 = CreateObject(18646, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
						new object2 = CreateObject(18646, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
						AttachObjectToVehicle(object1, idd, 0.375000,0.524999,0.375000,0.000000,0.000000,0.000000);
						AttachObjectToVehicle(object2, idd, 0.375000,0.524999,0.375000,0.000000,0.000000,0.000000);
					}
				}
				if(ServerVehicles[idd][vModel] == 596 && Copcar2(idd)) {
					SetVehicleHealth(idd, 1650);
					// new ThanhCops = CreateObject(19304, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
					// AttachObjectToVehicle(ThanhCops, idd, 0.0494, 1.7739, -0.3657, 90.0000, 0.0000, 90.0000);

				}
				if(ServerVehicles[idd][vModel] == 599 && Copcar2(idd)) {
					SetVehicleHealth(idd, 2150);
					// new ThanhCops2 = CreateObject(3280, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
					// new ThanhCops3 = CreateObject(3280, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
					// AttachObjectToVehicle(ThanhCops2, idd, 1.38965, 0.13263, -0.66208, 0.000000, 0.000000, 0.000000);
					// AttachObjectToVehicle(ThanhCops3, idd, -1.41170, 0.13190, -0.66210, 0.000000, 0.000000, 0.000000);
				}
				if(ServerVehicles[idd][vModel] == 427 && Copcar2(idd)) {
					SetVehicleHealth(idd, 6500);
				}
				if(ServerVehicles[idd][vModel] == 525) {
					new object1 = CreateObject(19294, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
					new object2 = CreateObject(19294, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
					AttachObjectToVehicle(object1, idd, -0.600000,-0.485000,1.450000,0.000000,0.000000,0.000000);
					AttachObjectToVehicle(object2, idd, 0.600000,-0.485000,1.450000,0.000000,0.000000,0.000000);
				}			
			}
	
			new str[64];
			if(ServerVehicles[idd][vFaction] != 0) format(str, 64, "F%d %d", ServerVehicles[idd][vFaction], idd);
			else format(str, sizeof(str), "VN-0%d", ServerVehicles[x][vSpawned]);
			SetVehicleNumberPlate(idd, str);
		}
	}
	printf("Server vehicles: %d", carss);
	cache_delete(db);	
	return 1;
}

GetVehicleID(vehicleid) {
	for(new i = 0; i < MAX_SVEHICLES; i++) {
		if(ServerVehicles[i][vSpawned] == vehicleid) return i;
	}
	return 0;
}
function ResetGates() {
	GateStatus = 0;
	MoveDynamicObject(ttcgate[0], 2423.84619, -2083.33496, 15.34760, 3.0);
	MoveDynamicObject(ttcgate[1], 2423.84619, -2094.83081, 15.34760, 3.0);
	return 1;
}

HideDeathMessage() {
	foreach(new i: Player) {
		if(IsPlayerLogged[i] == 1) {
			for(new x = 0; x < 5; x++) SendDeathMessageToPlayer(i, 1001, 1001, 200);
		}		
	}		
	if(Licitatie == 1) SCMTA(COLOR_YELLOW, "Day la mot phien dau gia hoat dong. De biet them chi tiet, hay su dung lenh /info.");
	else if(activeevent == 1) SCMTA(COLOR_YELLOW, "Tai thoi diem nay co mot su kien hoat dong. De biet them chi tiet, hay su dung lenh /event.");
	return 1;
}
GetNeedProgress(playerid, cazz) {
	return PlayerInfo[playerid][pNeedProgress][cazz];
}
QuestProgress(playerid, type, id) {
	new progress;
	switch(type) {
		case 0..5: progress = 1 + random(15);
		case 6..14: progress = 1;
		case 15..16: progress = 1 + random(8);
		case 17..19: progress = 1 + random(5);
		case 20: progress = 1;
	}
	PlayerInfo[playerid][pNeedProgress][id] = progress;
	PlayerInfo[playerid][pProgress][id] = 0;
	new query[180];
	format(query, sizeof(query), "UPDATE `users` SET `NeedProgress%d`='%d' WHERE `ID`='%d'", id+1, progress, PlayerInfo[playerid][pSQLID]);
	mysql_pquery(SQL ,query);
	return 1;
}

GiveQuest(playerid) {
	new i = playerid;
	PlayerInfo[i][pDailyMission][0] = random(20);
	PlayerInfo[i][pDailyMission][1] = 1+random(19);
	PlayerInfo[i][pDailyMission][2] = 2+random(18);
	if(PlayerInfo[i][pDailyMission][0] == PlayerInfo[i][pDailyMission][1]) PlayerInfo[i][pDailyMission][1] = 0;
	new query[100];
	format(query, sizeof(query), "UPDATE users SET DailyMission=%d,DailyMission2=%d,DailyMission3=%d WHERE ID=%i",PlayerInfo[playerid][pDailyMission][0],PlayerInfo[playerid][pDailyMission][1],PlayerInfo[playerid][pDailyMission][2],PlayerInfo[playerid][pSQLID]);
	mysql_pquery(SQL, query);
	QuestProgress(i, PlayerInfo[i][pDailyMission][0], 0);
	QuestProgress(i, PlayerInfo[i][pDailyMission][1], 1);
	QuestProgress(i, PlayerInfo[i][pDailyMission][2], 2);
	return 1;
}
CheckMission(playerid, id) {
	new string[180], query[180], money = 20000 + PlayerInfo[playerid][pLevel] * 1000 + random(50000);
	if(PlayerInfo[playerid][pDailyMission][id] != -1) {
		PlayerInfo[playerid][pProgress][id] ++;	
		if(PlayerInfo[playerid][pProgress][id] == PlayerInfo[playerid][pNeedProgress][id]) {
			format(string, sizeof(string), "Nhiem vu '%s' da hoan thanh.", missionName(playerid, PlayerInfo[playerid][pDailyMission][id], id));
			SendClientMessage(playerid, COLOR_YELLOW, string);
			format(string, sizeof(string), "Ban nhan duoc $%s va RP.", FormatNumber(money));
			SendClientMessage(playerid, COLOR_YELLOW, string);
			PlayerInfo[playerid][pExp] ++;
			GivePlayerCash(playerid, money);
			PlayerInfo[playerid][pProgress][id] ++;
			UpdateProgress(playerid, 0);
			increaseGrowthPoint(playerid, GROWTHPOINTS_PER_TASK);
		}
		else if(PlayerInfo[playerid][pProgress][id] < PlayerInfo[playerid][pNeedProgress][id]) {
			format(string, sizeof(string), "Tien do nhiem vu '%s': %d/%d", missionName(playerid, PlayerInfo[playerid][pDailyMission][id], id), PlayerInfo[playerid][pProgress][id], PlayerInfo[playerid][pNeedProgress][id]);
			SendClientMessage(playerid, COLOR_YELLOW, string);		
		}
		if(id == 0) format(query, sizeof(query), "UPDATE `users` SET `Progress`='%d' WHERE `ID`='%d'", PlayerInfo[playerid][pProgress][id], PlayerInfo[playerid][pSQLID]);
		else if(id == 1) format(query, sizeof(query), "UPDATE `users` SET `Progress2`='%d' WHERE `ID`='%d'", PlayerInfo[playerid][pProgress][id], PlayerInfo[playerid][pSQLID]);
		else if(id == 2) format(query, sizeof(query), "UPDATE `users` SET `Progress3`='%d' WHERE `ID`='%d'", PlayerInfo[playerid][pProgress][id], PlayerInfo[playerid][pSQLID]);
		mysql_pquery(SQL, query);		

		// update user growth point - growth points per task
	}
	Update(playerid, pRP);
	return 1;
}
// ResetDailyBonus() {
// 	mysql_pquery(SQL ,"UPDATE `users` SET `DailyBonus`='0'");
//     foreach(new i: Player) {
// 		if(IsPlayerLogged[i] == 1) {
// 			new randpp = 1+ random(4),string[160];
// 			PlayerInfo[i][pDailyBonus] = 1;
// 			Update(i, pDailyBonusx);
// 			PlayerInfo[i][pExp] += 2;
// 			PlayerInfo[i][pPremiumPoints] += randpp;
// 			Update(i, pRP);
// 			Update(i, pPremiumPointsx);
// 			format(string,170,"* Diem danh hang ngay da duoc reset. Ban da diem danh ngay hom nay thanh cong, ban nhan duoc: 2 diem kinh nghiem va %d "#DIEMCAOCAP"!",randpp);
// 			SendClientMessage(i, COLOR_YELLOW, string);
// 		}
//     }
// 	return 1;
// }
SaveQuest(playerid) {
	new szQuery[256], items[200]; //chu y
	format(items, sizeof(items), 
		"%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d", 
		PlayerInfo[playerid][pSpecialQuest][0], PlayerInfo[playerid][pSpecialQuest][1], PlayerInfo[playerid][pSpecialQuest][2], PlayerInfo[playerid][pSpecialQuest][3], PlayerInfo[playerid][pSpecialQuest][4],
		PlayerInfo[playerid][pSpecialQuest][5], PlayerInfo[playerid][pSpecialQuest][6], PlayerInfo[playerid][pSpecialQuest][7], PlayerInfo[playerid][pSpecialQuest][8], PlayerInfo[playerid][pSpecialQuest][9],
		PlayerInfo[playerid][pSpecialQuest][10], PlayerInfo[playerid][pSpecialQuest][11], PlayerInfo[playerid][pSpecialQuest][12], PlayerInfo[playerid][pSpecialQuest][13], PlayerInfo[playerid][pSpecialQuest][14],
		PlayerInfo[playerid][pSpecialQuest][15], PlayerInfo[playerid][pSpecialQuest][16], PlayerInfo[playerid][pSpecialQuest][17], PlayerInfo[playerid][pSpecialQuest][18], PlayerInfo[playerid][pSpecialQuest][19],		
		PlayerInfo[playerid][pSpecialQuest][20], PlayerInfo[playerid][pSpecialQuest][21], PlayerInfo[playerid][pSpecialQuest][22], PlayerInfo[playerid][pSpecialQuest][23], PlayerInfo[playerid][pSpecialQuest][24],
		PlayerInfo[playerid][pSpecialQuest][25], PlayerInfo[playerid][pSpecialQuest][26], PlayerInfo[playerid][pSpecialQuest][27], PlayerInfo[playerid][pSpecialQuest][28], PlayerInfo[playerid][pSpecialQuest][29],	
		PlayerInfo[playerid][pSpecialQuest][30], PlayerInfo[playerid][pSpecialQuest][31], PlayerInfo[playerid][pSpecialQuest][32], PlayerInfo[playerid][pSpecialQuest][33], PlayerInfo[playerid][pSpecialQuest][34],
		PlayerInfo[playerid][pSpecialQuest][35], PlayerInfo[playerid][pSpecialQuest][36], PlayerInfo[playerid][pSpecialQuest][37], PlayerInfo[playerid][pSpecialQuest][38], PlayerInfo[playerid][pSpecialQuest][39],	
		PlayerInfo[playerid][pSpecialQuest][40], PlayerInfo[playerid][pSpecialQuest][41], PlayerInfo[playerid][pSpecialQuest][42], PlayerInfo[playerid][pSpecialQuest][43], PlayerInfo[playerid][pSpecialQuest][44],
		PlayerInfo[playerid][pSpecialQuest][45], PlayerInfo[playerid][pSpecialQuest][46], PlayerInfo[playerid][pSpecialQuest][47], PlayerInfo[playerid][pSpecialQuest][48], PlayerInfo[playerid][pSpecialQuest][49],
		PlayerInfo[playerid][pSpecialQuest][50], PlayerInfo[playerid][pSpecialQuest][51], PlayerInfo[playerid][pSpecialQuest][52], PlayerInfo[playerid][pSpecialQuest][53], PlayerInfo[playerid][pSpecialQuest][54],
		PlayerInfo[playerid][pSpecialQuest][55], PlayerInfo[playerid][pSpecialQuest][56], PlayerInfo[playerid][pSpecialQuest][57], PlayerInfo[playerid][pSpecialQuest][58], PlayerInfo[playerid][pSpecialQuest][59],
		PlayerInfo[playerid][pSpecialQuest][60], PlayerInfo[playerid][pSpecialQuest][61], PlayerInfo[playerid][pSpecialQuest][62], PlayerInfo[playerid][pSpecialQuest][63], PlayerInfo[playerid][pSpecialQuest][64],
		PlayerInfo[playerid][pSpecialQuest][65], PlayerInfo[playerid][pSpecialQuest][66], PlayerInfo[playerid][pSpecialQuest][67], PlayerInfo[playerid][pSpecialQuest][68], PlayerInfo[playerid][pSpecialQuest][69],		
		PlayerInfo[playerid][pSpecialQuest][70], PlayerInfo[playerid][pSpecialQuest][71], PlayerInfo[playerid][pSpecialQuest][72], PlayerInfo[playerid][pSpecialQuest][73], PlayerInfo[playerid][pSpecialQuest][74],
		PlayerInfo[playerid][pSpecialQuest][75], PlayerInfo[playerid][pSpecialQuest][76], PlayerInfo[playerid][pSpecialQuest][77], PlayerInfo[playerid][pSpecialQuest][78], PlayerInfo[playerid][pSpecialQuest][79],	
		PlayerInfo[playerid][pSpecialQuest][80], PlayerInfo[playerid][pSpecialQuest][81], PlayerInfo[playerid][pSpecialQuest][82], PlayerInfo[playerid][pSpecialQuest][83], PlayerInfo[playerid][pSpecialQuest][84],
		PlayerInfo[playerid][pSpecialQuest][85], PlayerInfo[playerid][pSpecialQuest][86], PlayerInfo[playerid][pSpecialQuest][87], PlayerInfo[playerid][pSpecialQuest][88], PlayerInfo[playerid][pSpecialQuest][89],	
		PlayerInfo[playerid][pSpecialQuest][90], PlayerInfo[playerid][pSpecialQuest][91], PlayerInfo[playerid][pSpecialQuest][92], PlayerInfo[playerid][pSpecialQuest][93], PlayerInfo[playerid][pSpecialQuest][94],
		PlayerInfo[playerid][pSpecialQuest][95], PlayerInfo[playerid][pSpecialQuest][96], PlayerInfo[playerid][pSpecialQuest][97], PlayerInfo[playerid][pSpecialQuest][98], PlayerInfo[playerid][pSpecialQuest][99]);			
	format(szQuery, sizeof(szQuery), 
		"UPDATE `users` SET `SpecialQuest`='%s' WHERE `ID`='%d'", items, PlayerInfo[playerid][pSQLID]);
	mysql_query(SQL, szQuery, false);	
	return 1;
}

	/*	
SaveAchievements(playerid) {
	new szQuery[1024], items[1024];
	format(items, sizeof(items), 
		"%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d", 
		PlayerInfo[playerid][pAchievementStatus][0], PlayerInfo[playerid][pAchievementStatus][1], PlayerInfo[playerid][pAchievementStatus][2], PlayerInfo[playerid][pAchievementStatus][3], PlayerInfo[playerid][pAchievementStatus][4],
		PlayerInfo[playerid][pAchievementStatus][5], PlayerInfo[playerid][pAchievementStatus][6], PlayerInfo[playerid][pAchievementStatus][7], PlayerInfo[playerid][pAchievementStatus][8], PlayerInfo[playerid][pAchievementStatus][9],
		PlayerInfo[playerid][pAchievementStatus][10], PlayerInfo[playerid][pAchievementStatus][11], PlayerInfo[playerid][pAchievementStatus][12], PlayerInfo[playerid][pAchievementStatus][13], PlayerInfo[playerid][pAchievementStatus][14],
		PlayerInfo[playerid][pAchievementStatus][15], PlayerInfo[playerid][pAchievementStatus][16], PlayerInfo[playerid][pAchievementStatus][17], PlayerInfo[playerid][pAchievementStatus][18], PlayerInfo[playerid][pAchievementStatus][19],		
		PlayerInfo[playerid][pAchievementStatus][20], PlayerInfo[playerid][pAchievementStatus][21], PlayerInfo[playerid][pAchievementStatus][22], PlayerInfo[playerid][pAchievementStatus][23], PlayerInfo[playerid][pAchievementStatus][24],
		PlayerInfo[playerid][pAchievementStatus][25], PlayerInfo[playerid][pAchievementStatus][26], PlayerInfo[playerid][pAchievementStatus][27], PlayerInfo[playerid][pAchievementStatus][28], PlayerInfo[playerid][pAchievementStatus][29],	
		PlayerInfo[playerid][pAchievementStatus][30], PlayerInfo[playerid][pAchievementStatus][31]);
		
	format(szQuery, sizeof(szQuery), 
		"UPDATE `users` SET `AchievementStatus`='%s' WHERE `ID`='%d'", items, PlayerInfo[playerid][pSQLID]);
	mysql_tquery(SQL, szQuery, "", "");	
	return 1;
}*/
finishAchievement(playerid, id) {
	#pragma unused playerid
	#pragma unused id
	// if(PlayerInfo[playerid][pAchievementStatus][id] == 1) return 1;
	// PlayerInfo[playerid][pAchievementStatus][id] = 1;
	// SaveAchievements(playerid);

	// new string[256], money = 25000 + random(5000);
	// GivePlayerCash(playerid, money);
	// PlayerInfo[playerid][pPremiumPoints] += 5;
	// PlayerInfo[playerid][pExp] ++;
	// Update(playerid, pPremiumPointsx);
	// Update(playerid, pRP);
	// UpdateProgress(playerid, 0);	
	// format(string, sizeof(string), "(Achievements): {FFFFFF}Chuc mung! Thanh tuu '%s' da hoan thanh.", achievementNames(id));
	// SendClientMessage(playerid, 0x87E32BFF, string);
			
	// format(string, sizeof(string), "~n~Da mo khoa thanh tuu!~n~~y~\"%s\"~w~~h~~n~Ban nhan duoc: $%d, 1 respect point va 5 xu.~n~", achievementNames(id), money);
	// PlayerTextDrawSetString(playerid, AchivPTD[0], string);
	// PlayerTextDrawShow(playerid, AchivPTD[0]);
	// TextDrawShowForPlayer(playerid, AchivTD[0]);
	// TextDrawShowForPlayer(playerid, AchivTD[1]);
	
	// defer HideTDAchiv(playerid);
	return 1;
}
OpenCells() {
	new Float: Pos[3];
	for(new i = 0; i < 12; i++) {
		GetDynamicObjectPos(JailGate[i], Pos[0], Pos[1], Pos[2]);
		MoveDynamicObject(JailGate[i], Pos[0], Pos[1], Pos[2]-5, 2);
	}
	return 1;
}

CloseCells() {
	new Float: Pos[3];
	for(new i = 0; i < 12; i++) {
		GetDynamicObjectPos(JailGate[i], Pos[0], Pos[1], Pos[2]);
		MoveDynamicObject(JailGate[i], Pos[0], Pos[1], 1770.986938, 2);
	}
	return 1;
}
IsPlayerInArea(playerid, Float:MinX, Float:MinY, Float:MaxX, Float:MaxY) {
	new Float:X, Float:Y, Float:Z;
	GetPlayerPos(playerid, X, Y, Z);
	if(X >= MinX && X <= MaxX && Y >= MinY && Y <= MaxY) return 1;
	return 0;
}

IsPlayerInTurf(playerid, turfid) {
	if(turfid == -1) return 0;
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid,x,y,z);
	if(x >= TurfInfo[turfid][zMinX] && x < TurfInfo[turfid][zMaxX] && y >= TurfInfo[turfid][zMinY] && y < TurfInfo[turfid][zMaxY]) return 1;
	return 0;
}
strtok(const string[], &index) {
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' ')) index++;
	new offset = index;
	new result[20];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1))) {
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}

OnPlayerRegister(playerid, password[]) {
	new Str[200];
	format(Str,sizeof(Str),"INSERT INTO `users` (`name`,`password`) VALUES ('%s','%s')",GetName(playerid),password);
	mysql_query(SQL,Str,false);
	strmid(PlayerInfo[playerid][pKey], password, 0, strlen(password), 255);
	PlayerInfo[playerid][pCash] = GetPlayerCash(playerid);
	GetPlayerHealthEx(playerid,PlayerInfo[playerid][pHealth]);
	new wakaname[25];
	GetPlayerName(playerid,wakaname,25);
	new str[128];
	format(str,128,"UPDATE users SET `pHealth`='%.1f' WHERE `ID`='%d'",PlayerInfo[playerid][pHealth],PlayerInfo[playerid][pSQLID]);
	mysql_query(SQL,str,false);
	new loginstring[128];
	new loginname[64];
	GetPlayerName(playerid,loginname,sizeof(loginname));
	format(loginstring,sizeof(loginstring),"Ban da dang ky thanh cong!\nNhap mat khau cua ban de dang nhap.",loginname);
	Dialog_Show(playerid, DIALOG_LOGIN2,DIALOG_STYLE_PASSWORD,"Dang nhap",loginstring,"Dang nhap","Quit");
	PlayerInfo[playerid][pShowLogo] = 1;
	PlayerInfo[playerid][pShowCeas] = 1;
	return 1;
}
// showMissions(playerid, key) {
// 	new string[128], status1[21], status2[21], status3[21];
// 	if(PlayerInfo[playerid][pProgress][0] >= GetNeedProgress(playerid, 0)) format(status1, 21, "Nhiem vu da hoan tat");
// 	else format(status1, 10, "%d/%d", PlayerInfo[playerid][pProgress][0], GetNeedProgress(playerid, 0));
// 	if(PlayerInfo[playerid][pProgress][1] >= GetNeedProgress(playerid, 1)) format(status2, 21, "Nhiem vu da hoan tat");
// 	else format(status2, 10, "%d/%d", PlayerInfo[playerid][pProgress][1], GetNeedProgress(playerid, 1));
// 	if(PlayerInfo[playerid][pProgress][2] >= GetNeedProgress(playerid, 2)) format(status3, 21, "Nhiem vu da hoan tat");
// 	else format(status3, 10, "%d/%d", PlayerInfo[playerid][pProgress][2], GetNeedProgress(playerid, 2));
// 	format(string, sizeof(string), "Nhiem Vu >> %s (Tien do: %s)", missionName(playerid, PlayerInfo[playerid][pDailyMission][0], 0), status1);
// 	SendClientMessage(playerid, COLOR_YELLOW, string);
// 	format(string, sizeof(string), "Nhiem Vu >> %s (Tien do: %s)", missionName(playerid, PlayerInfo[playerid][pDailyMission][1], 1), status2);
// 	SendClientMessage(playerid, COLOR_YELLOW, string);
// 	format(string, sizeof(string), "Nhiem Vu >> %s (Tien do: %s)", missionName(playerid, PlayerInfo[playerid][pDailyMission][2], 2), status3);
// 	SendClientMessage(playerid, COLOR_YELLOW, string);
	
// 	if(SpecialWeek == 1 && key != 1) {
// 		format(string, sizeof(string), "["QUEST_NAME"] Tien do: %d/100", CheckObjects(playerid));
// 		SendClientMessage(playerid, COLOR_YELLOW, string);
// 		SendClientMessage(playerid, COLOR_YELLOW, "De hoan thanh nhiem vu nay, ban can mot cai Backpack mua o shop 24/7 (/gps).");
// 		SendClientMessage(playerid, COLOR_YELLOW, "Giai thuong: 500.000$, 10 rp, 20 diem cuop, 20 diem vuot nguc, 50 pp, 1 level up, 1 slot xe.");
// 	}	
// }
timer SetSpawnInfoEx[500](playerid, team, skin, Float:x, Float:y, Float:z, Float:rotation, weapon1, weapon1_ammo, weapon2, weapon2_ammo, weapon3, weapon3_ammo)
{
    SetSpawnInfo(playerid, team, skin, x, y, z, rotation, weapon1, weapon1_ammo, weapon2, weapon2_ammo, weapon3, weapon3_ammo);
}
OnPlayerLoginEx(playerid, const password[]) {
	new playername2[MAX_PLAYER_NAME];
    GetPlayerName(playerid, playername2, sizeof(playername2));
    new qstr[120];
    new result[456];
    mysql_format(SQL, qstr,sizeof(qstr),"SELECT * FROM users WHERE `name`='%e' AND `password`='%e'", playername2, password);
    new Cache: ab = mysql_query(SQL,qstr);
    if(cache_num_rows()) {
		GameTextForPlayer(playerid, "~r~LOADING...", 1400, 3);
		
		cache_get_value_name(0, "password", PlayerInfo[playerid][pKey], 32);
		cache_get_value_name_int(0, "Level", 	PlayerInfo[playerid][pLevel]);
		cache_get_value_name_int(0, "Admin", 	PlayerInfo[playerid][pAdmin]);	
		cache_get_value_name_int(0, "Backpack", 	PlayerInfo[playerid][pBackpack]);
		cache_get_value_name(0, "Propose", PlayerInfo[playerid][pPropose], 64);
		cache_get_value_name_int(0, "DailyBonus", 	PlayerInfo[playerid][pDailyBonus]);

		cache_get_value_name_int(0, "ShowProgress1", 	PlayerInfo[playerid][pShowProgress][0]);	
		cache_get_value_name_int(0, "ShowProgress2", 	PlayerInfo[playerid][pShowProgress][1]);	
		
		cache_get_value_name_int(0, "DM", 	PlayerInfo[playerid][pDM]);
		cache_get_value_name_int(0, "Vip", 	PlayerInfo[playerid][pVip]);
		cache_get_value_name_int(0, "Helper", 	PlayerInfo[playerid][pHelper]);
		cache_get_value_name_int(0, "Newbie", 	PlayerInfo[playerid][pNewbieStep]);
		cache_get_value_name_float(0, "ConnectedTime", PlayerInfo[playerid][pConnectTime]);
		// cache_get_value_name_float(0, "PosX", PlayerInfo[playerid][pPosX]);
		// cache_get_value_name_float(0, "PosY", PlayerInfo[playerid][pPosY]);
		// cache_get_value_name_float(0, "PosZ", PlayerInfo[playerid][pPosZ]);
		// cache_get_value_name_float(0, "FacingAngle", PlayerInfo[playerid][pFacingAngle]);
		cache_get_value_name_int(0, "Registered", 	PlayerInfo[playerid][pReg]);
		cache_get_value_name_int(0, "Sex", 	PlayerInfo[playerid][pSex]);
		cache_get_value_name_int(0, "Age", 	PlayerInfo[playerid][pAge]);
		cache_get_value_name_int(0, "Muted", 	PlayerInfo[playerid][pMuted]);
		cache_get_value_name_int(0, "MuteTime", 	PlayerInfo[playerid][pMuteTime]);
		cache_get_value_name_int(0, "Respect", 	PlayerInfo[playerid][pExp]);
		cache_get_value_name_int(0, "Money", 	PlayerInfo[playerid][pCash]);
		cache_get_value_name_int(0, "Bank", 	PlayerInfo[playerid][pAccount]);
		cache_get_value_name_int(0, "Crimes", 	PlayerInfo[playerid][pCrimes]);
		cache_get_value_name_int(0, "Kills", 	PlayerInfo[playerid][pKills]);
		cache_get_value_name_int(0, "Deaths", 	PlayerInfo[playerid][pDeaths]);
		cache_get_value_name_int(0, "Arrested", 	PlayerInfo[playerid][pArrested]);
		cache_get_value_name_int(0, "WantedDeaths", 	PlayerInfo[playerid][pWantedDeaths]);
		cache_get_value_name_int(0, "Phonebook", 	PlayerInfo[playerid][pPhoneBook]);
		cache_get_value_name_int(0, "LottoNr", 	PlayerInfo[playerid][pLottoNr]);
		cache_get_value_name_int(0, "ReAp", PlayerInfo[playerid][pRentedApartment]);
		cache_get_value_name_int(0, "WantedLevel", 	PlayerInfo[playerid][pWantedLevel]);
		cache_get_value_name_int(0, "ToySlot", 	PlayerInfo[playerid][pToySlot]);
		cache_get_value_name_int(0, "Job", 	PlayerInfo[playerid][pJob]);
		cache_get_value_name_int(0, "Paycheck", 	PlayerInfo[playerid][pPayCheck]);
		cache_get_value_name_int(0, "HeadValue", 	PlayerInfo[playerid][pHeadValue]);
		cache_get_value_name_int(0, "Jailed", 	PlayerInfo[playerid][pJailed]);
		cache_get_value_name_int(0, "JailTime", 	PlayerInfo[playerid][pJailTime]);
		cache_get_value_name_int(0, "Materials", 	PlayerInfo[playerid][pMats]);
		// cache_get_value_name_int(0, "Drugs", 	PlayerInfo[playerid][pDrugs]);
		cache_get_value_name_int(0, "Leader", 	PlayerInfo[playerid][pLeader]);
		cache_get_value_name_int(0, "Member", 	PlayerInfo[playerid][pMember]);
		cache_get_value_name_int(0, "Rank", 	PlayerInfo[playerid][pRank]);
		cache_get_value_name_int(0, "CChar", 	PlayerInfo[playerid][pChar]);
		cache_get_value_name_int(0, "FWarn", 	PlayerInfo[playerid][pFACWarns]);
		cache_get_value_name_int(0, "FPunish", 	PlayerInfo[playerid][pFpunish]);
		cache_get_value_name_int(0, "Acceptpoints", 	PlayerInfo[playerid][pLawyer]);
		cache_get_value_name_int(0, "LawSkill", 	PlayerInfo[playerid][pLawSkill]);
		cache_get_value_name_int(0, "MechSkill", 	PlayerInfo[playerid][pMechSkill]);
		cache_get_value_name_int(0, "DrugsSkill", 	PlayerInfo[playerid][pDrugsSkill]);
		cache_get_value_name_int(0, "MowerSkill", 	PlayerInfo[playerid][pWoodSkill]);
		cache_get_value_name_int(0, "StivuitorSkill", 	PlayerInfo[playerid][pStivuitorSkill]);
		cache_get_value_name_int(0, "NewsPaperSkill", 	PlayerInfo[playerid][pNewsPaperSkill]);
		cache_get_value_name_int(0, "TruckerSkill", 	PlayerInfo[playerid][pTruckerSkill]);
		cache_get_value_name_int(0, "IceSkill", 	PlayerInfo[playerid][pJackerSkill]);
		cache_get_value_name_int(0, "GarbageSkill", 	PlayerInfo[playerid][pGarbageSkill]);
		cache_get_value_name_int(0, "FarmerSkill", 	PlayerInfo[playerid][pFarmerSkill]);
		cache_get_value_name_int(0, "FishSkill", 	PlayerInfo[playerid][pFishSkill]);
		cache_get_value_name_int(0, "MatSkill", 	PlayerInfo[playerid][pMatSkill]);
		cache_get_value_name_int(0, "RobSkill", 	PlayerInfo[playerid][pRobSkill]);
		cache_get_value_name_int(0, "GotCode", 	PlayerInfo[playerid][pGotCode]);
		cache_get_value_name_float(0, "pHealth", 	PlayerInfo[playerid][pHealth]);
		cache_get_value_name_int(0, "Inter", PlayerInfo[playerid][pInt]);
		cache_get_value_name_int(0, "Local", PlayerInfo[playerid][pLocal]);
		cache_get_value_name_int(0, "Team", PlayerInfo[playerid][pTeam]);
		cache_get_value_name_int(0, "Model", PlayerInfo[playerid][pModel]);
		cache_get_value_name_int(0, "PhoneNr", PlayerInfo[playerid][pPhone]);
		cache_get_value_name_int(0, "House", PlayerInfo[playerid][pHouse]);
		cache_get_value_name_int(0, "Bizz", PlayerInfo[playerid][pBizz]);
		cache_get_value_name_int(0, "Rob", PlayerInfo[playerid][pRob]);
		cache_get_value_name_int(0, "CarLicT", PlayerInfo[playerid][pCarLicT]);
		cache_get_value_name_int(0, "CarLic", PlayerInfo[playerid][pCarLic]);
		cache_get_value_name_int(0, "FlyLicT", PlayerInfo[playerid][pFlyLicT]);
		cache_get_value_name_int(0, "FlyLic", PlayerInfo[playerid][pFlyLic]);
		cache_get_value_name_int(0, "BoatLicT", PlayerInfo[playerid][pBoatLicT]);
		cache_get_value_name_int(0, "BoatLic", PlayerInfo[playerid][pBoatLic]);
		cache_get_value_name_int(0, "FishLicT", PlayerInfo[playerid][pFishLicT]);
		cache_get_value_name_int(0, "FishLic", PlayerInfo[playerid][pFishLic]);
		cache_get_value_name_int(0, "GunLicT", PlayerInfo[playerid][pGunLicT]);
		cache_get_value_name_int(0, "GunLic", PlayerInfo[playerid][pGunLic]);
		cache_get_value_name_int(0, "PayDay", PlayerInfo[playerid][pPayDay]);
		cache_get_value_name_int(0, "PayDayHad", PlayerInfo[playerid][pPayDayHad]);
		cache_get_value_name_int(0, "Tutorial", PlayerInfo[playerid][pTut]);
		cache_get_value_name_int(0, "Warnings", PlayerInfo[playerid][pWarns]);
		cache_get_value_name_int(0, "Rented", PlayerInfo[playerid][pRented]);
		cache_get_value_name_int(0, "Fuel", PlayerInfo[playerid][pFuel]);
		cache_get_value_name_int(0, "WTalkie", PlayerInfo[playerid][pWTalkie]);
		cache_get_value_name_int(0, "Lighter", PlayerInfo[playerid][pLighter]);
		cache_get_value_name_int(0, "Firework", PlayerInfo[playerid][pFire]);
		cache_get_value_name_int(0, "Cigarettes", PlayerInfo[playerid][pCigarettes]);
		cache_get_value_name(0, "Email", PlayerInfo[playerid][pEmail], 50); //chu y
		cache_get_value_name(0, "RegisterDate", PlayerInfo[playerid][pRegistredDate], 20);
		cache_get_value_name_int(0, "Banned", PlayerInfo[playerid][pBanned]);
		cache_get_value_name_int(0, "Radio2", PlayerInfo[playerid][pMP3]);
		cache_get_value_name_int(0, "CRank", PlayerInfo[playerid][pCRank]);
		cache_get_value_name_int(0, "WantedTime", 	WantedTime[playerid]);
		cache_get_value_name_int(0, "id", PlayerInfo[playerid][pSQLID]);
		cache_get_value_name_int(0, "Crates", PlayerInfo[playerid][pCrates]);
	
		new turf;
		cache_get_value_name_int(0, "WarTurf", turf);
		cache_get_value_name_int(0, "WarKills", ucideri[playerid][turf]);
		cache_get_value_name_int(0, "WarDeaths", decese[playerid][turf]);
		WarKills[playerid] = ucideri[playerid][turf];
		WarDeaths[playerid] = decese[playerid][turf];
					
		cache_get_value_name_int(0, "Referral", PlayerInfo[playerid][pReferral]);
		cache_get_value_name_int(0, "ReferralRP", PlayerInfo[playerid][pReferralRP]);
		cache_get_value_name_int(0, "ReferralMoney", PlayerInfo[playerid][pReferralMoney]);
		cache_get_value_name_int(0, "JobBonus50", PlayerInfo[playerid][pJobBonus50]);
		cache_get_value_name_int(0, "JobBonus100", PlayerInfo[playerid][pJobBonus100]);
		cache_get_value_name(0, "Victim", PlayerInfo[playerid][pVictim], 64);
		cache_get_value_name(0, "Accused", PlayerInfo[playerid][pAccused], 64);
		cache_get_value_name(0, "Crime1", PlayerInfo[playerid][pCrime1], 50);
		cache_get_value_name(0, "Crime2", PlayerInfo[playerid][pCrime2], 50);
		cache_get_value_name(0, "Crime3", PlayerInfo[playerid][pCrime3], 50);
		cache_get_value_name_int(0, "BTemp", 	PlayerInfo[playerid][pBTemp]);
		cache_get_value_name_int(0, "BYear", 	PlayerInfo[playerid][pBYear]);
		cache_get_value_name_int(0, "BMonth", 	PlayerInfo[playerid][pBMonth]);
		cache_get_value_name_int(0, "BDay", 	PlayerInfo[playerid][pBDay]);
		cache_get_value_name(0, "BBy", PlayerInfo[playerid][pBBy], 34);
		cache_get_value_name(0, "BReason", PlayerInfo[playerid][pBReason], 50);
		cache_get_value_name_int(0, "ALeader", 	PlayerInfo[playerid][pALeader]);

		cache_get_value_name_int(0, "ShowJob", 	PlayerInfo[playerid][pShowJob]);
		cache_get_value_name_int(0, "GiftPoints", PlayerInfo[playerid][pGiftPoints]);
		cache_get_value_name_int(0, "NewbieMute", PlayerInfo[playerid][pNewbieMute]);
		cache_get_value_name_int(0, "ReportTime", PlayerInfo[playerid][pReportTime]);
		cache_get_value_name_int(0,  "WTChannel", WTChannel[playerid]);

		cache_get_value_name_int(0, "HelpedPlayers", 	PlayerInfo[playerid][pHelpedPlayers]);
		cache_get_value_name_int(0, "HelpedPlayersToday", 	PlayerInfo[playerid][pHelpedPlayersToday]);
		cache_get_value_name_int(0, "ShowFP", 	PlayerInfo[playerid][pShowFP]);
		cache_get_value_name_int(0, "ShowLogo", 	PlayerInfo[playerid][pShowLogo]);
		cache_get_value_name_int(0, "ShowCeas", 	PlayerInfo[playerid][pShowCeas]);
		cache_get_value_name_int(0, "FightStyle", 	PlayerInfo[playerid][pFightStyle]);
		switch(PlayerInfo[playerid][pFightStyle]){
			case 1: SetPlayerFightingStyle(playerid, FIGHT_STYLE_BOXING);
			case 2: SetPlayerFightingStyle(playerid, FIGHT_STYLE_KUNGFU);
			case 3: SetPlayerFightingStyle(playerid, FIGHT_STYLE_ELBOW);
			case 4: SetPlayerFightingStyle(playerid, FIGHT_STYLE_GRABKICK);
			case 5: SetPlayerFightingStyle(playerid, FIGHT_STYLE_KNEEHEAD);
		}
		cache_get_value_name_int(0, "PremiumPoints", 	PlayerInfo[playerid][pPremiumPoints]);
		cache_get_value_name_int(0, "GangPoints", 	PlayerInfo[playerid][pGangPoints]);
		// tog
		cache_get_value_name_int(0, "NewbieChat", NewbieChat[playerid]);
		cache_get_value_name_int(0, "TogLC", toglc[playerid]);
		cache_get_value_name_int(0, "TogFC", gFam[playerid]);
		cache_get_value_name_int(0, "TogWT", WTToggle[playerid]);
		cache_get_value_name_int(0, "HidePM", HidePM[playerid]);
		cache_get_value_name_int(0, "TogNews", gNews[playerid]);
		cache_get_value_name_int(0, "TogLicitatie", toglicitatie[playerid]);
		cache_get_value_name_int(0, "TogClan", togclan[playerid]);
		cache_get_value_name_int(0, "TogVip", togvip[playerid]);
		cache_get_value_name_int(0, "TogEvent", togevent[playerid]);
		cache_get_value_name_int(0, "TogDing", togding[playerid]);
		cache_get_value_name_int(0, "TogSurf", togsurf[playerid]);			
		cache_get_value_name_int(0, "TogRaport", tograport[playerid]);
		cache_get_value_name_int(0, "TogAlert", togalert[playerid]);
		cache_get_value_name_int(0, "TogJob", togjob[playerid]);		
		cache_get_value_name_int(0, "TogFind", togfind[playerid]);
		cache_get_value_name_int(0, "TogDice", togdice[playerid]);
		cache_get_value_name_int(0, "PhoneOnline", PhoneOnline[playerid]);

		cache_get_value_name_int(0, "Clan", 	PlayerInfo[playerid][pClan]);
		cache_get_value_name_int(0, "Tag", 	PlayerInfo[playerid][pTag]);
		
		cache_get_value_name_int(0, "ClanRank", 	PlayerInfo[playerid][pClanRank]);
		cache_get_value_name_int(0, "ClanWarns", 	PlayerInfo[playerid][pClanWarn]);
		cache_get_value_name_int(0, "ClanDays", 	PlayerInfo[playerid][pClanDays]);
															
		cache_get_value_name_int(0, "InvalidCommands", 	PlayerInfo[playerid][pInvalidCommands]);			
		cache_get_value_name_int(0, "Commands", 	PlayerInfo[playerid][pCommands][0]);
		cache_get_value_name_int(0, "Commands2", 	PlayerInfo[playerid][pCommands][1]);
		cache_get_value_name_int(0, "Commands3", 	PlayerInfo[playerid][pCommands][2]);
		cache_get_value_name_int(0, "Commands4", 	PlayerInfo[playerid][pCommands][3]);
		cache_get_value_name_int(0, "Commands5", 	PlayerInfo[playerid][pCommands][4]);

		//Growth points
		cache_get_value_name_int(0, "GrowthPoints", 	PlayerInfo[playerid][pGrowthPoints]);

		new questsvar[256];
		cache_get_value_name(0, "SpecialQuest", result); format(questsvar, sizeof(questsvar), result);
		sscanf(questsvar, "p<|>a<i>[101]", PlayerInfo[playerid][pSpecialQuest]);

		new somayman[100];
	    cache_get_value_name(0, "SoMayMan", result); format(somayman, 64, result);
	    sscanf(somayman, "p<|>iiiii", PlayerInfo[playerid][plottonumber][0],PlayerInfo[playerid][plottonumber][1],PlayerInfo[playerid][plottonumber][2],PlayerInfo[playerid][plottonumber][3],PlayerInfo[playerid][plottonumber][4]);

	    new skin[64];
		cache_get_value_name(0, "Skin", result); format(skin, 64, result);
        sscanf(skin, "p<|>iiiiiiiiii", PlayerInfo[playerid][pSkins][0], PlayerInfo[playerid][pSkins][1], PlayerInfo[playerid][pSkins][2], PlayerInfo[playerid][pSkins][3], PlayerInfo[playerid][pSkins][4],
        PlayerInfo[playerid][pSkins][5], PlayerInfo[playerid][pSkins][6], PlayerInfo[playerid][pSkins][7], PlayerInfo[playerid][pSkins][8], PlayerInfo[playerid][pSkins][9]);
        
        new Crates[100];
		cache_get_value_name(0, "Crates", result); format(Crates, 64, result);
        sscanf(Crates, "p<|>iiiii", PlayerInfo[playerid][pCrates][0], PlayerInfo[playerid][pCrates][1], PlayerInfo[playerid][pCrates][2], PlayerInfo[playerid][pCrates][3], PlayerInfo[playerid][pCrates][4]);

		// cache_get_value_name(0, "Drugs", questsvar), questsvar[strlen(questsvar)-1] = EOS;
		// sscanf(questsvar, "p<|>a<i>[30]", PlayerInfo[playerid][pDrugs]);

		for(new i = 0; i < 100; i++) {
			if(PlayerInfo[playerid][pSpecialQuest][i] == 0) {				
				PlayerInfo[playerid][pObjectQuest][i] = CreatePlayerObject(playerid, 2406, QuestPos[i][0], QuestPos[i][1], QuestPos[i][2], 0, 0, 0, 300.0);
			}
		}

		new achivar[65];
		cache_get_value_name(0, "AchievementStatus", achivar);
		sscanf(achivar, "p<|>a<i>[33]", PlayerInfo[playerid][pAchievementStatus]);

		/*cache_get_value_name(0, "Seeds", achivar);
		sscanf(achivar, "p<|>iii", PlayerInfo[playerid][Seeds][1], PlayerInfo[playerid][Seeds][2], PlayerInfo[playerid][Seeds][3]);*/

		new tmpstr[50], tmpstr2[15];
		cache_get_value_name(0, "DanhHieu", tmpstr);
		format(tmpstr2, sizeof(tmpstr2), "p<|>a<i>[%d]", sizeof(DanhHieu));
		sscanf(tmpstr, tmpstr2, PlayerInfo[playerid][pDanhHieu]);

		cache_get_value_name(0, "DanhHieuActive", tmpstr);
		format(tmpstr2, sizeof(tmpstr2), "p<|>a<i>[%d]", sizeof(DanhHieu));
		sscanf(tmpstr, tmpstr2, PlayerInfo[playerid][pDanhHieuActive]);
		
		cache_get_value_name_int(0, "CasinoChip", PlayerInfo[playerid][pCasinoChip]);

		cache_get_value_name_int(0, "SpawnChange", SpawnChange[playerid]);
		cache_get_value_name_float(0, "Seconds", 	PlayerInfo[playerid][pSeconds]);
		cache_get_value_name_int(0, "Used", 	PlayerInfo[playerid][pUsed]);
	
		cache_get_value_name_int(0, "RacePlace1", 	PlayerInfo[playerid][pRacePlace][0]);
		cache_get_value_name_int(0, "RacePlace2", 	PlayerInfo[playerid][pRacePlace][1]);
		cache_get_value_name_int(0, "RacePlace3", 	PlayerInfo[playerid][pRacePlace][2]);
		cache_get_value_name_int(0, "RacePlace4", 	PlayerInfo[playerid][pRacePlace][3]);
				
		cache_get_value_name_int(0, "ArenaKills", 	PlayerInfo[playerid][pArenaStats][0]);
		cache_get_value_name_int(0, "ArenaDeaths", 	PlayerInfo[playerid][pArenaStats][1]);
								
		cache_get_value_name_int(0, "PaintKills1", 	PlayerInfo[playerid][pPaintKills][0]);
		cache_get_value_name_int(0, "PaintKills2", 	PlayerInfo[playerid][pPaintKills][1]);
		cache_get_value_name_int(0, "PaintKills3", 	PlayerInfo[playerid][pPaintKills][2]);

		cache_get_value_name_int(0, "PaintDeaths1", 	PlayerInfo[playerid][pPaintDeaths][2]);
		cache_get_value_name_int(0, "PaintDeaths2", 	PlayerInfo[playerid][pPaintDeaths][2]);
		cache_get_value_name_int(0, "PaintDeaths3", 	PlayerInfo[playerid][pPaintDeaths][2]);

		cache_get_value_name_int(0, "CarLicS", PlayerInfo[playerid][pCarLicS]);
		cache_get_value_name_int(0, "BoatLicS", PlayerInfo[playerid][pBoatLicS]);
		cache_get_value_name_int(0, "FlyLicS", PlayerInfo[playerid][pFlyLicS]);
		cache_get_value_name_int(0, "GunLicS", PlayerInfo[playerid][pGunLicS]);		

		cache_get_value_name_int(0, "CarKey1", PlayerInfo[playerid][pCarKey][0]);
		cache_get_value_name_int(0, "CarKey2", PlayerInfo[playerid][pCarKey][1]);
		cache_get_value_name_int(0, "CarKey3", PlayerInfo[playerid][pCarKey][2]);
		cache_get_value_name_int(0, "CarKey4", PlayerInfo[playerid][pCarKey][3]);
		cache_get_value_name_int(0, "CarKey5", PlayerInfo[playerid][pCarKey][4]);
		cache_get_value_name_int(0, "CarKey6", PlayerInfo[playerid][pCarKey][5]);
		cache_get_value_name_int(0, "CarKey7", PlayerInfo[playerid][pCarKey][6]);
		cache_get_value_name_int(0, "CarKey8", PlayerInfo[playerid][pCarKey][7]);
		cache_get_value_name_int(0, "CarKey9", PlayerInfo[playerid][pCarKey][8]);
		cache_get_value_name_int(0, "CarKey10", PlayerInfo[playerid][pCarKey][9]);
		cache_get_value_name_int(0, "CarKey11", PlayerInfo[playerid][pCarKey][10]);//update vip

		cache_get_value_name_int(0, "ShowDMG", PlayerInfo[playerid][pShowDMG]);
		cache_get_value_name_int(0, "Slot1", PlayerInfo[playerid][pSlot][0]);
		cache_get_value_name_int(0, "Slot2", PlayerInfo[playerid][pSlot][1]);
		cache_get_value_name_int(0, "Slot3", PlayerInfo[playerid][pSlot][2]);
		cache_get_value_name_int(0, "Slot4", PlayerInfo[playerid][pSlot][3]);
		cache_get_value_name_int(0, "Slot5", PlayerInfo[playerid][pSlot][4]);
		
		cache_get_value_name_int(0, "DailyMission", PlayerInfo[playerid][pDailyMission][0]);
		cache_get_value_name_int(0, "DailyMission2", PlayerInfo[playerid][pDailyMission][1]);
		cache_get_value_name_int(0, "DailyMission3", PlayerInfo[playerid][pDailyMission][2]);
		cache_get_value_name_int(0, "NeedProgress1", PlayerInfo[playerid][pNeedProgress][0]);
		cache_get_value_name_int(0, "NeedProgress2", PlayerInfo[playerid][pNeedProgress][1]);			
		cache_get_value_name_int(0, "NeedProgress3", PlayerInfo[playerid][pNeedProgress][2]);	
		cache_get_value_name_int(0, "Progress", PlayerInfo[playerid][pProgress][0]);
		cache_get_value_name_int(0, "Progress2", PlayerInfo[playerid][pProgress][1]);
		cache_get_value_name_int(0, "Progress3", PlayerInfo[playerid][pProgress][2]);
		cache_get_value_name_int(0, "DailyMission4", PlayerInfo[playerid][pDailyMission][3]);   
		cache_get_value_name_int(0, "DailyMission5", PlayerInfo[playerid][pDailyMission][4]);
		cache_get_value_name_int(0, "DailyMission6", PlayerInfo[playerid][pDailyMission][5]);
        cache_get_value_name_int(0, "NeedProgress4", PlayerInfo[playerid][pNeedProgress][3]);
		cache_get_value_name_int(0, "NeedProgress5", PlayerInfo[playerid][pNeedProgress][4]);			
		cache_get_value_name_int(0, "NeedProgress6", PlayerInfo[playerid][pNeedProgress][5]);
        cache_get_value_name_int(0, "Progress4", PlayerInfo[playerid][pProgress][3]);
		cache_get_value_name_int(0, "Progress5", PlayerInfo[playerid][pProgress][4]);
		cache_get_value_name_int(0, "Progress6", PlayerInfo[playerid][pProgress][5]);


		cache_get_value_name_int(0, "PizzaSkill", PlayerInfo[playerid][pPizzaSkill]);
		cache_get_value_name_int(0, "CurierSkill", PlayerInfo[playerid][pCurierSkill]);
		cache_get_value_name_int(0, "GasCan", PlayerInfo[playerid][pGasCan]);
		
		cache_get_value_name_int(0, "ShowHP", PlayerInfo[playerid][pShowHP]);
		cache_get_value_name_int(0, "ShowCP", PlayerInfo[playerid][pShowCP]);
		cache_get_value_name_int(0, "ShowAP", PlayerInfo[playerid][pShowAP]);
		cache_get_value_name_int(0, "Pin", PlayerInfo[playerid][pPin]);
		
		cache_get_value_name_int(0, "Fires", PlayerInfo[playerid][pFires]);
		cache_get_value_name_int(0, "Color", PlayerInfo[playerid][pColor]);
		cache_get_value_name_int(0, "Youtuber", PlayerInfo[playerid][pYT]);
		cache_get_value_name_int(0, "Days", PlayerInfo[playerid][pDays]);		
		
		cache_get_value_name_int(0, "PilotSkill", PlayerInfo[playerid][pPilotSkill]);		
		cache_get_value_name_int(0, "EscapePoints", PlayerInfo[playerid][pEscapePoints]);
		cache_get_value_name_int(0, "DailyLogin", PlayerInfo[playerid][pDailyLogin]);

		cache_get_value_name_int(0, "AJail", PlayerInfo[playerid][pAJail]);		

		cache_get_value_name_int(0, "HW", PlayerInfo[playerid][pHW]);
		cache_get_value_name_int(0, "AW", PlayerInfo[playerid][pAW]);
		cache_get_value_name_int(0, "LW", PlayerInfo[playerid][pLW]);
		cache_get_value_name_int(0, "Matuy1", PlayerInfo[playerid][pMatuy1]);
		cache_get_value_name_int(0, "Matuy2", PlayerInfo[playerid][pMatuy2]);
		cache_get_value_name_int(0, "Seed1", PlayerInfo[playerid][pSeed1]);
		cache_get_value_name_int(0, "Seed2", PlayerInfo[playerid][pSeed2]);
		cache_get_value_name_int(0, "ActivePoints", PlayerInfo[playerid][pPoints]);
		cache_get_value_name_int(0, "Hunger", PlayerInfo[playerid][pHunger]);
		new clanid = PlayerInfo[playerid][pClan], string[180];
		if(PlayerInfo[playerid][pClan] != 0 && PlayerInfo[playerid][pTag] == 0) {
			format(string, sizeof(string), "%s%s", ClanInfo[clanid][clTag], PlayerInfo[playerid][pUsername]);
			SetPlayerName(playerid, string);
		}
		else if(PlayerInfo[playerid][pClan] != 0 && PlayerInfo[playerid][pTag] == 1) {
			format(string, sizeof(string), "%s%s", PlayerInfo[playerid][pUsername], ClanInfo[clanid][clTag]);
			SetPlayerName(playerid, string);
		}
		
		LoadPlayerCars(playerid);
		LoadPlayerToys(playerid);
		LoadInventory(playerid);
		
		CallLocalFunction("OnPlayerLogin", "i", playerid); // Used in other modules to load other data.

		SetPlayerToTeamColor(playerid);
		if(PlayerInfo[playerid][pAdmin] > 0) {
			format(string, sizeof(string), "{00FF00}[!]{FFFFFF} HelloBot: %s da dang nhap vao.", GetName(playerid));
			SendAdminMessage(0xA37718FF, string, 1);
		}
		
		new ip[16];
		GetPlayerIp(playerid, ip, sizeof(ip));
		mysql_format(SQL, string, sizeof(string), "UPDATE `users` SET `Status` = '1',`DayLogin`=1,`IP`='%s' WHERE `ID`='%d'", ip, PlayerInfo[playerid][pSQLID]);
		mysql_pquery(SQL,string);
		TextDrawHideForPlayer(playerid, ServerTD[0]);
		TextDrawHideForPlayer(playerid, ServerTD[1]);
		TextDrawHideForPlayer(playerid, ServerTD[2]);
		GameTextForPlayer(playerid, " ", 1000, 4);
		if(PlayerInfo[playerid][pAdmin] > 0) Iter_Add(PlayerAdmins, playerid); 
		if(PlayerInfo[playerid][pHelper] > 0) Iter_Add(PlayerHelpers, playerid); 
		if(PlayerInfo[playerid][pYT] > 0) Iter_Add(PlayerYoutuber, playerid);
		for(new j = 0; j <= 20; j++) SendClientMessage(playerid, COLOR_WHITE, "");

		CallLocalFunction("AfterDBLoad", "i", playerid); 
	}
	else {
		new loginstring[128];
		format(loginstring,sizeof(loginstring),"Mat khau da nhap khong chinh xac\nHay nhap chinh xac mat khau, neu khong ban se bi kick!");
		Dialog_Show(playerid, DIALOG_LOGIN3,DIALOG_STYLE_PASSWORD,"Dang nhap",loginstring,"Dang nhap","Quit");
		cache_delete(ab);
		gPlayerLogTries[playerid] += 1;
		new string[180];
		if(gPlayerLogTries[playerid] < 3) format(string, sizeof(string), "Mat khau khong chinh xac! Ban con %d lan thu lai.", 3-gPlayerLogTries[playerid]);
		else format(string, sizeof(string), "Mat khau khong chinh xac! Ban da het so lan thu lai, ban bi kick ra.", 3-gPlayerLogTries[playerid]);
		SendClientMessage(playerid, COLOR_WARNING, string);				
		if(gPlayerLogTries[playerid] == 3) KickEx(playerid);
		return 1;
	}
	cache_delete(ab);
	
	if(Iter_Contains(LoginQueue[0], playerid)) {
		Iter_Remove(LoginQueue[0], playerid);
		if(Iter_Count(LoginQueue[1]) > 0 && Iter_Count(LoginQueue[0]) <= MAX_LOGIN) {
			new last = Iter_First(LoginQueue[1]);
			Iter_Remove(LoginQueue[1], last);
			Iter_Add(LoginQueue[0], last);
			GameTextForPlayer(last,"  ", 100, 3);
			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof(gQuery), "SELECT * FROM `users` WHERE `name`='%s' LIMIT 1", GetName(last));
			mysql_tquery(SQL, gQuery, "CheckClassIP", "i", last);
		}
	}

	ResetPlayerCash(playerid);
	GivePlayerCash(playerid,PlayerInfo[playerid][pCash]);
		
	UpdateProgress(playerid, 0);
	UpdateProgress(playerid, 1);

	stop login[playerid];
	if(PlayerInfo[playerid][pReg] == 0) {
		PlayerInfo[playerid][pLevel] = 1;
		PlayerInfo[playerid][pHealth] = 100.0;
		PlayerInfo[playerid][pInt] = 0;
		PlayerInfo[playerid][pLocal] = 255;
		PlayerInfo[playerid][pTeam] = 3;
		PlayerInfo[playerid][pModel] = 250;
		PlayerInfo[playerid][pHouse] = 999;
		PlayerInfo[playerid][pBizz] = 255;
		PlayerInfo[playerid][pAccount] = 1000;
		PlayerInfo[playerid][pReg] = 1;
		SetPlayerInterior(playerid,0);
		new string[60],d,m,y,h,mine,s,str[300];
		getdate(y,m,d);
		gettime(h,mine,s);
		format(string, sizeof(string),  "%d/%d/%d %d:%d:%d",d,m,y,h,mine,s);
		strmid(PlayerInfo[playerid][pRegistredDate], string, 0, strlen(string), 20);
		format(str,sizeof(str),"UPDATE users SET `Money`='%d',`Level`='%d',`House`='%d',`Bizz`='%d',`PhoneNr`='%d',`Registered`='1',`RegisterDate`='%s',`pHealth`='100.0',`Team`='3',`Model`='250' WHERE `ID`='%d'",
			GetPlayerCash(playerid), 1, 999, 255, PlayerInfo[playerid][pPhone], PlayerInfo[playerid][pRegistredDate], PlayerInfo[playerid][pSQLID]);
		mysql_pquery(SQL,str);
	}
	if(PlayerInfo[playerid][pBTemp] == 1) { 
		TempBanCheck(playerid); 
		return 1; 
	}
	if(PlayerInfo[playerid][pBanned] == 1) {
		for(new j = 0; j <= 30; j++) SendClientMessage(playerid, COLOR_WHITE, "");
		va_SendClientMessage(playerid, COLOR_WARNING, "Tai khoan %s bi banned vinh vien.", GetName(playerid));
		new str[50];
		format(str, 34, "Banned boi Admin %s.",PlayerInfo[playerid][pBBy]);
		SendClientMessage(playerid, COLOR_CLIENT, str);
		format(str, 50, "Li do: %s",PlayerInfo[playerid][pBReason]);
		SendClientMessage(playerid, COLOR_CLIENT, str);		
		KickEx(playerid);
		SetPlayerCameraPos(playerid, 1183.0143, -965.7394, 129.6071);
		SetPlayerCameraLookAt(playerid, 1183.7214, -965.0270, 129.2470);
		TogglePlayerSpectating(playerid, false);
		return 1;
	}
    StopAudioStreamForPlayer(playerid);
	SetPlayerScore(playerid, PlayerInfo[playerid][pLevel]);
	
	if(PlayerInfo[playerid][pTut] == 0) {
		gOoc[playerid] = 1; gNews[playerid] = 1; gFam[playerid] = 1;
		RegistrationStep[playerid] = 1;
		// SavePlayerPosData(playerid, 1172.4181,-1323.3702,15.4030,263.7793);
		SendClientMessage(playerid, 0xFFDE96FF, "Vui long tra loi cac cau hoi sau.");
		Dialog_Show(playerid, DIALOG_REGISTER, DIALOG_STYLE_MSGBOX, "Dang ky:", "Chon gioi tinh cua nhan vat?\nBan la nam hay nu?", "Nam", "Nu");
		SetPlayerInterior(playerid, 0);
		TogglePlayerControllable(playerid, false);
	} 
	else {	
		new string89[18+MAX_PLAYER_NAME];
		IsPlayerLogged[playerid] = 1;
		format(string89, sizeof(string89), "Chao mung ban, %s!", GetName(playerid));
		SendClientMessage(playerid, -1, string89);
	}
	if(PlayerInfo[playerid][pWantedLevel] > 0 && PlayerInfo[playerid][pTut] != 0) {
		new string89[65];
		format(string89, sizeof(string89), "Ban da dat cap do truy na %d trong lan cuoi cung ban roi game.",PlayerInfo[playerid][pWantedLevel]);
		SetPlayerWantedLevel(playerid, PlayerInfo[playerid][pWantedLevel]);
		SendClientMessage(playerid, COLOR_LIGHTRED, string89);
	}
	if(gTeam[playerid] == 0) 
		gTeam[playerid] = 3; 
	else 
		gTeam[playerid] = PlayerInfo[playerid][pTeam];
	if(PlayerInfo[playerid][pMember] != 0 && PlayerInfo[playerid][pTut] != 0) {
		new disc[50+MAX_PLAYER_NAME];
		format(disc,sizeof(disc),"[TO CHUC] %s da dang nhap vao may chu.",GetName(playerid));
		SendFactionMessage(PlayerInfo[playerid][pMember], COLOR_CLIENT, disc);
	}
	new sendername[25], playersip[16];
	GetPlayerName(playerid,sendername,sizeof(sendername));
	GetPlayerIp(playerid,playersip,sizeof(playersip));

	format(result,sizeof(result),"INSERT INTO iplogs (`ip`,`playerid`) VALUES ('%s','%d')", playersip,PlayerInfo[playerid][pSQLID]);
	mysql_pquery(SQL,result);

	printf("%s da dang nhap voi IP %s.",sendername,playersip);

	if(PlayerInfo[playerid][pDailyMission][0] == -1 || PlayerInfo[playerid][pDailyMission][1] == -1 || PlayerInfo[playerid][pDailyMission][2] == -1) {
		GiveQuest(playerid);
	}
	if(PlayerInfo[playerid][pTut] != 0) {
	    if(PlayerInfo[playerid][pVip] != 0) {
			SendClientMessage(playerid, COLOR_GOLD, "INFO >> {FFFFFF}Ban la VIP Account.");
			GiveReputation(playerid, PlayerInfo[playerid][pVip] - 1); // give reputation base on player vip level
		}
	    //showMissions(playerid, 1);
		if(PlayerInfo[playerid][pLevel] < 10) {
			SendClientMessage(playerid, COLOR_GOLD, "TIP >> {FFFFFF}Hay lam nhiem vu de nhan RP va cac phan qua gia tri khac (/nhiemvu).");
		}
		new clanid = PlayerInfo[playerid][pClan], string[180];
		if(clanid != 0) {
			format(string, sizeof(string), "{%s}[CLAN]: %s.", ClanInfo[PlayerInfo[playerid][pClan]][clColor], ClanInfo[PlayerInfo[playerid][pClan]][clMotd]);
			MesajLung(playerid, -1, string);
		}
		if(PlayerInfo[playerid][pMember] != 0) {
			if(strlen(DynamicFactions[PlayerInfo[playerid][pMember]][fAnn]) > 0)
			{
				new factioninfo[128];
				format(factioninfo,sizeof(factioninfo), "[FACTION]: %s",DynamicFactions[PlayerInfo[playerid][pMember]][fAnn]);
				MesajLung(playerid,COLOR_YELLOW,factioninfo);
			}
		}
		new szQuery[75], szstring[MAX_PLAYER_NAME], onf;
		format(szQuery, sizeof(szQuery), "SELECT * FROM `friends` WHERE `AddBy` = '%d'", PlayerInfo[playerid][pSQLID]);
		new Cache: results = mysql_query(SQL, szQuery);
		// playerid login
		for(new i, j = cache_num_rows(); i != j; ++i) {
			cache_get_value_name(i, "friendName", szstring);
			new userID = GetPlayerID(szstring);
			if(userID != INVALID_PLAYER_ID) onf ++;
		}
		cache_delete(results);
		
		if(onf != 0) {
			format(string, sizeof(string), "%d ban be cua ban dang online.", onf);
			PlayerTextDrawSetString(playerid, FriendTD, string);
			PlayerTextDrawShow(playerid, FriendTD);
			defer HideFriendTD[3000](playerid);			
		}
		// if(PlayerInfo[playerid][pDailyBonus] == 0) {
		// 	new randpp = 1+random(4);
		// 	PlayerInfo[playerid][pDailyBonus] = 1;
		// 	Update(playerid, pDailyBonusx);
		// 	PlayerInfo[playerid][pExp] += 2;
		// 	PlayerInfo[playerid][pPremiumPoints] += randpp;
		// 	Update(playerid, pRP);
		// 	Update(playerid, pPremiumPointsx);
		// 	format(string,sizeof(string),"INFO {FFFFFF} Ban da duoc diem danh tu dong, ban nhan duoc 2 diem kinh nghiem va %d "#DIEMCAOCAP"!", randpp);
		// 	SendClientMessage(playerid, COLOR_YELLOW, string);
		// }

		// if(PlayerInfo[playerid][pDailyLogin] == 0) SendClientMessage(playerid, -1, "O lan payday dau tien, ban nhan gap doi diem RP. Chuc ban online vui ve.");
		if(PlayerInfo[playerid][pBizz] != 255) finishAchievement(playerid, 2);
		if(PlayerInfo[playerid][pHouse] != 999 && strcmp(GetName(playerid), HouseInfo[PlayerInfo[playerid][pHouse]][hOwner], true) == 0) finishAchievement(playerid, 3);

		new string2[128];
		format(string, sizeof(string), "{EEE0C9}%s[%d]{FFFFFF} {FFFF00}(%s){FFFFFF} {32a852}(%s).", GetName(playerid), playerid, playersip, IsPlayerAndroid(playerid) ? "Dien Thoai" : "PC");
		GuiDenAdminVaHelper(COLOR_WHITE, string, 1);
		format(string2, sizeof(string2), "{FF7FF0}Tien{FFFFFF} : [%s] | {CAFFBE}Level{FFFFFF} : [%d] | {B6EEBD}Ping{FFFFFF} : [%d].", FormatNumber(GetPlayerCash(playerid)), PlayerInfo[playerid][pLevel],GetPlayerPing(playerid));
		GuiDenAdminVaHelper(COLOR_WHITE, string2, 1);
		if(PlayerInfo[playerid][pAdmin]+PlayerInfo[playerid][pHelper] != 0) {
			new strings[180];
			format(strings, sizeof(strings), "[STAFF]: {FFFFFF}%s",StaffMotd);
			SendClientMessage(playerid, COLOR_WARNING, strings);
		}
		// if exist player in other friend list
		// foreach(new i: Player) {
		// 	if(IsPlayerLogged[i] == 1) {
		// 		format(szQuery, sizeof(szQuery), "SELECT * FROM `friends` WHERE `AddBy` = '%d' AND `friendID` = '%d'", PlayerInfo[i][pSQLID], PlayerInfo[playerid][pSQLID]);
		// 		results = mysql_query(SQL, szQuery);
		// 		if(cache_num_rows())
		// 		{
		// 			new friendID;					
		// 			cache_get_value_name_int(0, "AddBy", friendID);
		// 			if(PlayerInfo[i][pSQLID] == friendID && friendID != 0) {
		// 				if(PlayerInfo[playerid][pAdmin] < 7) {
		// 					format(string, sizeof(string), "Ban be cua ban, %s vua dang nhap.", GetName(playerid));
		// 					PlayerTextDrawSetString(i, FriendTD, string);
		// 					PlayerTextDrawShow(i, FriendTD);
		// 					defer HideFriendTD[3000](i);	
		// 				}
		// 			}
		// 		}
		// 		cache_delete(results);
		// 	}
		// }

		SpawnPlayer(playerid);

		// #if defined _nex_ac_included
		SetSpawnTimer[playerid] = defer SetSpawnInfoEx(playerid, PlayerInfo[playerid][pTeam], PlayerInfo[playerid][pModel], SpawnPos[0], SpawnPos[1], SpawnPos[2], 1.0, -1, -1, -1, -1, -1, -1);
		CalculateEmails(playerid);

		if(PlayerInfo[playerid][pAdmin]+PlayerInfo[playerid][pHelper] != 0) {

			if(PlayerInfo[playerid][pAdmin] > 0) {
				Iter_Add(PlayerAdmins, playerid);
				#if defined _nex_ac_included
					for(new i; i < 53; i++) {
						EnableAntiCheatForPlayer(playerid, i, 0);
					}
				#endif
			}
			if(PlayerInfo[playerid][pHelper] > 0) Iter_Add(PlayerHelpers, playerid);

			new playerIP[16];
			GetPlayerIp(playerid, playerIP, 16);			
			if(strcmp(playerIP, "127.0.0.1", true) == 0 || strcmp(GetName(playerid), "TIN", true) == 0 || strcmp(GetName(playerid), "Asher", true) == 0) {}
			else {			
				Dialog_Show(playerid, DIALOG_ADMINPASSWORD, DIALOG_STYLE_PASSWORD, "XAC NHAN", "Nhap mat khau cap 2, lien he Admin cap cao de nhan mat khau:", "Gui", "");
				logina[playerid] = defer LoginAdmin[30000](playerid);
			}
		}
		//(playerid, MAXGOAL);

		new str[41],name[30];
		GetPlayerName(playerid, name, sizeof(name));
		format(str,sizeof(str),"%s (ID: %d)",name, playerid);
		PlayerTextDrawSetString(playerid, logoptd, str);
		PlayerTextDrawShow(playerid, logoptd);
		TextDrawShowForPlayer(playerid, logotd);
	
		if(IsAMember(playerid)) {
			
			Iter_Add(PlayerGangster, playerid);
			/*if(CAC_GetStatus(playerid) || GetPVarInt(playerid, "NotAndroid") == 0)
			{
			 	UsingSampcac{playerid} = 1;
				SendClientMessage(playerid, COLOR_GOLD, "SAMPCAC >> {FFFFFF}Ban dang su dung SAMPCAC phien ban moi nhat. Chuc vui ve.");
			}
			else SendClientMessage(playerid, COLOR_GOLD, "SAMPCAC >> {FFFFFF}Ban chua cai dat SAMPCAC nen ban khong the tham gia war. Hay tai SAMPCAC o discord.");*/
		}
	}
	return 1;
}
SendNewbieMessage2(color,const string[]) {
	new text[180];
	foreach(new i: Player) {
		if(IsPlayerLogged[i] == 1) {
			if(PlayerInfo[i][pAdmin]+PlayerInfo[i][pHelper] != 0) {
				format(text, sizeof(text), string);
				SendClientMessage(i, color, text);
			}
		}
	}
	return 1;
}

SendMessage(color,const string[]) {
	new text[180];
	foreach(new i: Player) {
		if(IsPlayerLogged[i] == 1) {
			if(PlayerInfo[i][pAdmin] == 0) {
				format(text, 256, string);
				SendClientMessage(i, color, text);				
			}
		}
	}
	printf("%s", string);
	return 1;
}
va_SendAdminMessage(colour, const fmat[], level, va_args<>) {
	return SendAdminMessage(colour, va_return(fmat, va_start<3>), level);
}
SendAdminMessage(color,const string[], level = 1) {
	new text[144];
	foreach(new i: PlayerAdmins) {
		if(IsPlayerLogged[i] == 1) {
			if(PlayerInfo[i][pAdmin] >= level) {
				format(text, 144, string);
				SendClientMessage(i, color, text);				
			}
		}
	}
	printf("%s", string);
	return 1;
}
OOCNews(color,string[]) {
	foreach(new i: Player) {
		if(!gNews[i]) SendClientMessage(i, color, string);
	}
	return 1;
}

SendRadioMessage(member, color, string[]) {
	foreach(new i: Player) {
		if(PlayerInfo[i][pMember] == member || PlayerInfo[i][pLeader] == member) SendClientMessage(i, color, string);
		if(SpecFaction[i] == member) SendClientMessage(i, color, string);		
	}
	return 1;
}

SendTeamMessage(member, color, string[]) {
	foreach(new i: Player) {
		if(PlayerInfo[i][pMember] == member || PlayerInfo[i][pLeader] == member) SendClientMessage(i, color, string);
		if(SpecFaction[i] == member) SendClientMessage(i, color, string);
	}
	return 1;
}

SendFactionMessage(family, color, string[]) {
	foreach(new i: Player) {
		if(IsPlayerLogged[i] == 1) {
			if(PlayerInfo[i][pMember] == family || PlayerInfo[i][pLeader] == family) {
				if(!gFam[i]) MesajLung(i, color, string);
			}
			if(SpecFaction[i] == family) MesajLung(i, color, string);
		}
	}
	return 1;
}

OnePlayAnim(playerid, animlib[], animname[], Float:Speed, looping, lockx, locky, lockz, lp) {
	if(GetPVarInt(playerid, "Pressed") == 0) ApplyAnimation(playerid, animlib, animname, Speed, looping, lockx, locky, lockz, lp);
}
LoopingAnim(playerid, animlib[], animname[], Float:Speed, looping, lockx, locky, lockz, lp) {
	if(HaveBag[playerid] == 0 && GetPVarInt(playerid, "Pressed") == 0) {
		gPlayerUsingLoopingAnim[playerid] = 1;
		ApplyAnimation(playerid, animlib, animname, Speed, looping, lockx, locky, lockz, lp);
	}
}
StopLoopingAnim(playerid) {
	gPlayerUsingLoopingAnim[playerid] = 0;
    ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 0);
}
GetClanTurfs(clanid) {
	new x;
	for(new j = 0; j < MAX_CLANZONES; j++) {
		if(j != 0) {
			if(GraffitiInfo[j][gfOwned] == clanid) x++;
		}	
	}	
	return x;
}
	
GClanMembers() {
	new szQuery[45];
	for(new i = 0; i < MAX_CLANS; i++) {
		if(strlen(ClanInfo[i][clName]) > 0) {
			format(szQuery, sizeof(szQuery), "SELECT `id` FROM `users` WHERE `Clan`='%d'", i);
			new Cache: result = mysql_query(SQL, szQuery);
			ClanMembers[i] = cache_num_rows();
			cache_delete(result);			
		}	
	}	
	return 1;
}
GClanVehicles() {
	new szQuery[45];
	for(new i = 0; i < MAX_CLANS; i++) {
		if(strlen(ClanInfo[i][clName]) > 0) {
			new vehicles;
			format(szQuery, sizeof(szQuery), "SELECT `id` FROM `svehicles` WHERE `Clan`='%d'", i);
			new Cache: result = mysql_query(SQL, szQuery);
			vehicles = cache_num_rows ();
			cache_delete(result);
			ClanVehicles[i] = vehicles;
		}	
	}	
	return 1;
}
GetCMembers(clan) return ClanMembers[clan];
GetCVehicles(clan) return ClanVehicles[clan];

AMXProtection() {
    new b;

    #emit load.pri b
    #emit stor.pri b

	new a[][] =
	{
		"Unarmed (Fist)",
		"Brass K"
	};

	#pragma unused a
}

SendArenaMessage(color, text[]) {
	foreach(new i: PlayerInRace) {
		if(IsPlayerConnected(i)) SendClientMessage(i, color, text);
	}
}
EnterRaceArena(playerid) {
	Iter_Add(PlayerInRace, playerid);
	RaceBet[playerid] = 0;
	SelCar[playerid] = 0;
	RaceColor[playerid][0] = 1;
	RaceColor[playerid][1] = 1;
	RaceCP[playerid] = 0;
	new string[180];
	format(string, sizeof(string), "Bravura");
	PlayerTextDrawSetString(playerid, RacePTD[0], string);
	format(string, sizeof(string), "Tien cuoc: $0");
	PlayerTextDrawSetString(playerid, RacePTD[1], string);
	for(new i = 0; i < 11; i++) TextDrawShowForPlayer(playerid, RaceTD[i]);
	for(new i = 0; i < 2; i++) PlayerTextDrawShow(playerid, RacePTD[i]);		
	RaceVehicle[playerid] = CreateVehicleEx(RaceCars[SelCar[playerid]][0],  1091.8584, 1759.6836, 10.5870, -36.0600, 1, 1, 100);
	SetVehicleVirtualWorld(RaceVehicle[playerid], playerid+1);
	SetPlayerVirtualWorld(playerid, playerid+1);
	PutPlayerInVehicleEx(playerid, RaceVehicle[playerid], 0);
	SetPlayerCameraPos(playerid, 1096.7817, 1774.7838, 12.2794);
	SetPlayerCameraLookAt(playerid, 1096.4858, 1773.8246, 12.1340);	
	SelectTextDraw(playerid, 0x2EA1FFFF);
	if(Iter_Count(PlayerInRace) == 1) RaceTimer = SetTimer("CheckRace", 60000, 0);	
	return 1;
}
LeaveRaceArena(playerid) {
	DestroyVehicle(RaceVehicle[playerid]);
	DisablePlayerCheckpointEx(playerid);
	DisablePlayerRaceCheckpointEx(playerid);
	PlayerTextDrawHide(playerid, CpTD);
	DisableRemoteVehicleCollisions(playerid, 0);
	RaceVehicle[playerid] = 0;
	Iter_Remove(PlayerInRace, playerid);
	RaceBet[playerid] = 0;
	SelCar[playerid] = 0;
	RaceColor[playerid][0] = 1;
	RaceCP[playerid] = 0;
	RaceColor[playerid][1] = 1;	
	
	if(Voted[playerid] == 1) Voted[playerid] = 0;
	if(Voted2[playerid] == 1) Voted2[playerid] = 0;	
	SendClientMessage(playerid, COLOR_YELLOW, "Ban khong o trong Dau truong dua xe!");
	new string[180];
	format(string, sizeof(string), "%s da roi Dau truong dua xe.", GetName(playerid));
	SendArenaMessage(0xFFD375FF, string);
	for(new i = 0; i < 11; i++) TextDrawHideForPlayer(playerid, RaceTD[i]);		
	for(new i = 0; i < 2; i++) PlayerTextDrawHide(playerid, RacePTD[i]);		
	SetCameraBehindPlayer(playerid);
	SetPlayerVirtualWorld(playerid, 0);
	CancelSelectTextDraw(playerid);
	SetPlayerPosEx(playerid, gungamePos[0], gungamePos[1], gungamePos[2]);
	if(Iter_Count(PlayerInRace) == 0) RaceStarted = 0, ResetRace();
	TogglePlayerControllable(playerid, true);
	if(Iter_Count(PlayerInRace) == 1 && RaceStarted == 1) {
		foreach(new i: Player) {
			if(Iter_Contains(PlayerInRace, i)) {
				RaceStarted = 0;
				LeaveRaceArena(i);
				SendClientMessage(i, 0xFFD375FF, "Ban da bi kick tu dong khoi Dau truong dua xe boi vi chi co minh ban!");
			}	
		}
	}
	if(Iter_Count(PlayerInRace) < 1 && RaceStarted == 0) KillTimer(RaceTimer);
	RaceBet[playerid] = 0;
	return 1;
}
function CheckRace() {
	if(Iter_Count(PlayerInRace) < 3) {
		SendArenaMessage(COLOR_YELLOW, "Cuoc dua khong the bat dau vi co it hon 3 nguoi!");
		foreach(new i: Player) {
			if(IsPlayerConnected(i) && Iter_Contains(PlayerInRace, i)) {
				LeaveRaceArena(i);
				if(Voted[i] == 1) Voted[i] = 0;
				if(Voted2[i] == 1) Voted2[i] = 0;
				if(RaceBet[i] != 0) {
					GivePlayerCash(i, RaceBet[i]);
					SendClientMessage(i, COLOR_WHITE, "Tien cuoc da duoc tra lai cho ban.");
					RaceBet[i] = 0;
				}				
			}
		}
		ResetRace();
		return 1;
	}
	new map, string[85], players;
	if(RaceVotes[0] >= RaceVotes[1] && RaceVotes[0] >= RaceVotes[2] && RaceVotes[0] >= RaceVotes[3] && RaceVotes[0] >= RaceVotes[4]) map = 0;
	else if(RaceVotes[1] >= RaceVotes[0] && RaceVotes[1] >= RaceVotes[2] && RaceVotes[1] >= RaceVotes[3] && RaceVotes[1] >= RaceVotes[4]) map = 1;
	else if(RaceVotes[2] >= RaceVotes[0] && RaceVotes[2] >= RaceVotes[1] && RaceVotes[2] >= RaceVotes[3] && RaceVotes[2] >= RaceVotes[4]) map = 2;
	else if(RaceVotes[3] >= RaceVotes[0] && RaceVotes[3] >= RaceVotes[1] && RaceVotes[3] >= RaceVotes[2] && RaceVotes[3] >= RaceVotes[4]) map = 3;
	else if(RaceVotes[4] >= RaceVotes[0] && RaceVotes[4] >= RaceVotes[1] && RaceVotes[4] >= RaceVotes[2] && RaceVotes[4] >= RaceVotes[3]) map = 4;
	format(string, sizeof(string), "Ban do duoc nhieu nguoi chon nhat la %s. Cuoc dua se bat dau sau 5 giay!", RaceMapName(map));
	SendArenaMessage(0xFFD375FF, string);
	RaceTime = 6;
	foreach(new i: Player) {
		if(Iter_Contains(PlayerInRace, i)) {			
			for(new x = 0; x < 11; x++) TextDrawHideForPlayer(i, RaceTD[x]);		
			for(new x = 0; x < 3; x++) PlayerTextDrawHide(i, RacePTD[x]);						
			SetCameraBehindPlayer(i);
			CancelSelectTextDraw(i);
			TogglePlayerControllable(i, false);
			players ++;
			SetVehicleVirtualWorld(GetPlayerVehicleID(i), 1337);
			SetPlayerVirtualWorld(i, 1337);	
			SetPlayerInterior(i, 0);			
			RaceCP[i] = 1;						
			switch(map) {
				case 0: {
					SetVehiclePos(GetPlayerVehicleID(i), RaceMap1Pos[players][0], RaceMap1Pos[players][1], RaceMap1Pos[players][2]);
					SetVehicleZAngleEx(GetPlayerVehicleID(i), 90);	
				}
				case 1: {
					SetVehiclePos(GetPlayerVehicleID(i), RaceMap2Pos[players][0], RaceMap2Pos[players][1], RaceMap2Pos[players][2]);
					SetVehicleZAngleEx(GetPlayerVehicleID(i), 0);					
				}
				case 2: {
					SetVehiclePos(GetPlayerVehicleID(i), RaceMap3Pos[players][0], RaceMap3Pos[players][1], RaceMap3Pos[players][2]);
					SetVehicleZAngleEx(GetPlayerVehicleID(i), 54.3891);					
				}
				case 3: {
					SetVehiclePos(GetPlayerVehicleID(i), RaceMap4Pos[players][0], RaceMap4Pos[players][1], RaceMap4Pos[players][2]);
					SetVehicleZAngleEx(GetPlayerVehicleID(i), 265.5652);					
				}
				case 4: {
					SetVehiclePos(GetPlayerVehicleID(i), RaceMap5Pos[players][0], RaceMap5Pos[players][1], RaceMap5Pos[players][2]);
					SetVehicleZAngleEx(GetPlayerVehicleID(i), 90);					
				}
			}
			RemovePlayerAttachedObject(i, 8);
		}
	}
	
	RaceMap = map;
	RaceStarted = 1;
	return 1;
}
SetRaceCP(playerid) {
	new id = RaceCP[playerid] - 1, map = RaceMap;
	switch(map) {
		case 0: {
			if(id+1 == sizeof(RaceMap1)) SetPlayerRaceCheckpointEx(playerid, 1, RaceMap1[id][0], RaceMap1[id][1], RaceMap1[id][2], RaceMap1[id][0], RaceMap1[id][1], RaceMap1[id][2], 8.0);
			else SetPlayerRaceCheckpointEx(playerid, 0, RaceMap1[id][0], RaceMap1[id][1], RaceMap1[id][2], RaceMap1[id+1][0], RaceMap1[id+1][1], RaceMap1[id+1][2], 8.0);
		}
		case 1: {
			if(id+1 == sizeof(RaceMap2)) SetPlayerRaceCheckpointEx(playerid, 1, RaceMap2[id][0], RaceMap2[id][1], RaceMap2[id][2], RaceMap2[id][0], RaceMap2[id][1], RaceMap2[id][2], 8.0);
			else SetPlayerRaceCheckpointEx(playerid, 0, RaceMap2[id][0], RaceMap2[id][1], RaceMap2[id][2], RaceMap2[id+1][0], RaceMap2[id+1][1], RaceMap2[id+1][2], 8.0);		
		}
		case 2: {
			if(id+1 == sizeof(RaceMap3)) SetPlayerRaceCheckpointEx(playerid, 1, RaceMap3[id][0], RaceMap3[id][1], RaceMap3[id][2], RaceMap3[id][0], RaceMap3[id][1], RaceMap3[id][2], 8.0);
			else SetPlayerRaceCheckpointEx(playerid, 0, RaceMap3[id][0], RaceMap3[id][1], RaceMap3[id][2], RaceMap3[id+1][0], RaceMap3[id+1][1], RaceMap3[id+1][2], 8.0);		
		}
		case 3: {
			if(id+1 == sizeof(RaceMap4)) SetPlayerRaceCheckpointEx(playerid, 1, RaceMap4[id][0], RaceMap4[id][1], RaceMap4[id][2], RaceMap4[id][0], RaceMap4[id][1], RaceMap4[id][2], 8.0);
			else SetPlayerRaceCheckpointEx(playerid, 0, RaceMap4[id][0], RaceMap4[id][1], RaceMap4[id][2], RaceMap4[id+1][0], RaceMap4[id+1][1], RaceMap4[id+1][2], 8.0);		
		}
		case 4: {
			if(id+1 == sizeof(RaceMap5)) SetPlayerRaceCheckpointEx(playerid, 1, RaceMap5[id][0], RaceMap5[id][1], RaceMap5[id][2], RaceMap5[id][0], RaceMap5[id][1], RaceMap5[id][2], 8.0);
			else SetPlayerRaceCheckpointEx(playerid, 0, RaceMap5[id][0], RaceMap5[id][1], RaceMap5[id][2], RaceMap5[id+1][0], RaceMap5[id+1][1], RaceMap5[id+1][2], 8.0);		
		}
	}
	return 1;
}

FinishMap(playerid) {
	new string[90], money;
	RacePlace ++;

	if(RacePlace == 1) {
		PlayerInfo[playerid][pRacePlace][0] ++;
		UpdateVar(playerid, "RacePlace1", PlayerInfo[playerid][pRacePlace][0]);
	}
	else if(RacePlace == 2) {
		PlayerInfo[playerid][pRacePlace][1] ++;
		UpdateVar(playerid, "RacePlace2", PlayerInfo[playerid][pRacePlace][1]);
	}	
	else if(RacePlace == 3) {
		PlayerInfo[playerid][pRacePlace][2] ++;
		UpdateVar(playerid, "RacePlace2", PlayerInfo[playerid][pRacePlace][2]);
	}		
	else if(RacePlace >= 4) {
		PlayerInfo[playerid][pRacePlace][3] ++;	
		UpdateVar(playerid, "RacePlace3", PlayerInfo[playerid][pRacePlace][3]);
	}		
	
	format(string, sizeof(string), "%s hoan tat chan dua tai dia diem %d. [time: %s]", GetName(playerid), RacePlace, CalculeazaTimp2(playerRaceTime[playerid]));
	SendArenaMessage(0xFFD375FF, string);
	
	if(RacePlace == 1) {
		foreach(new i: Player) {
			if(IsPlayerConnected(i) && RaceBet[i] != 0) {
				money += RaceBet[i];
			}
		}
		if(money != 0)  { 
			GivePlayerCash(playerid, money);
			format(string, 85, "Boi vi ban hoan thanh chan dua voi thanh tich hang nhat, Ban nhan duoc $%s!", FormatNumber(money));
			SendClientMessage(playerid, COLOR_MONEY, string);
		}	
	}
	Iter_Remove(PlayerInRace, playerid);
	RaceBet[playerid] = 0;
	RaceCP[playerid] = 0;
	DisablePlayerCheckpointEx(playerid);
	DisablePlayerRaceCheckpointEx(playerid);
	DestroyVehicle(RaceVehicle[playerid]);
	SetPlayerVirtualWorld(playerid, 0);
	PlayerTextDrawHide(playerid, CpTD);
	DisableRemoteVehicleCollisions(playerid, 0);
	SetPlayerPosEx(playerid, gungamePos[0], gungamePos[1], gungamePos[2]);
	for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
		if(PlayerInfo[playerid][pDailyMission][m] == 17) CheckMission(playerid, m);
	}
	finishAchievement(playerid, 11);		
	return 1;
}

StartRaceArena() {
	new engine,lights,alarm,doors,bonnet,boot,objective, string[180];
	
	foreach(new i: Player) {
		if(IsPlayerLogged[i] == 1) {
			if(Voted[i] == 1) Voted[i] = 0;
			if(Voted2[i] == 1) Voted2[i] = 0;
			
			if(Iter_Contains(PlayerInRace, i)) {
				PlayerPlaySound(i, 1057, 0.0, 0.0, 0.0);	
				TogglePlayerControllable(i, true);
				format(string, sizeof(string), "Cuoc dua bat dau! Ngay bay gio co %d nguoi dang canh tranh.", Iter_Count(PlayerInRace));
				SendClientMessage(i, COLOR_YELLOW, string);
				if(RaceVotes[5] >= Iter_Count(PlayerInRace)/2) {
					DisableRemoteVehicleCollisions(i, 1);
					format(string, sizeof(string), "Va cham da bi vo hieu hoa vi chi co %d phieu bau!", RaceVotes[5]);
					SendClientMessage(i, COLOR_YELLOW, string);
				}
				SetRaceCP(i);	
				Gas[GetPlayerVehicleID(i)] = 100;
				GetVehicleParamsEx(GetPlayerVehicleID(i),engine,lights,alarm,doors,bonnet,boot,objective);
				SetVehicleParamsEx(GetPlayerVehicleID(i),VEHICLE_PARAMS_ON,lights,alarm,doors,bonnet,boot,objective);
				playerRaceTime[i] = 0;
				playerRacePlace[i] = 0;
			}
			format(string, sizeof(string), "NR AdmBot: Tai thoi diem nay co %d nguoi o Dau truong dua xe.", Iter_Count(PlayerInRace));
			SendClientMessage(i,COLOR_NEWS,string);	
		}	
	}	
	RacePlayers = Iter_Count(PlayerInRace);
	ResetRace();
	return 1;
}

ResetRace() {
	RacePlace = 0;
	RaceVotes[0] = 0;
	RaceVotes[1] = 0;
	RaceVotes[2] = 0;
	RaceVotes[3] = 0;
	RaceVotes[4] = 0;
	RaceVotes[5] = 0;
	for(new i = 0; i < 40; i++) RacePlaces[i] = 0;
	return 1;
}
/*new AaF_cache[MAX_PLAYERS] = { -1, ... };
new AaF_cacheTime[MAX_PLAYERS];
Float:DistanceCameraTargetToLocation(Float:CamX, Float:CamY, Float:CamZ, Float:ObjX, Float:ObjY, Float:ObjZ, Float:FrX, Float:FrY, Float:FrZ) {
	new Float:TGTDistance;
	// get distance from camera to target
	TGTDistance = floatsqroot((CamX - ObjX) * (CamX - ObjX) + (CamY - ObjY) * (CamY - ObjY) + (CamZ - ObjZ) * (CamZ - ObjZ));
	new Float:tmpX, Float:tmpY, Float:tmpZ;
	tmpX = FrX * TGTDistance + CamX;
	tmpY = FrY * TGTDistance + CamY;
	tmpZ = FrZ * TGTDistance + CamZ;
	return floatsqroot((tmpX - ObjX) * (tmpX - ObjX) + (tmpY - ObjY) * (tmpY - ObjY) + (tmpZ - ObjZ) * (tmpZ - ObjZ));
} 

RemoveSmokeFromFire(id) {
    for(new i; i < 5; i++) {
		DestroyObject(Flame[id][Smoke][i]);
		Flame[id][Smoke][i] = -1;
	}
}
CreateFire(Float:x, Float:y, Float:z) {
	new slot = Iter_Alloc(iFlame);
	if(slot == -1) { return slot; }
	Flame[slot][Flame_Exists] = 1;
	Flame[slot][Flame_pos][0] = x;
	Flame[slot][Flame_pos][1] = y;
	Flame[slot][Flame_pos][2] = z - Z_DIFFERENCE;
	Flame[slot][Flame_id] = CreateObject(18689, Flame[slot][Flame_pos][0], Flame[slot][Flame_pos][1], Flame[slot][Flame_pos][2], 0.0, 0.0, 0.0);
	for(new i; i < 5; i++) Flame[slot][Smoke][i] = -1;
	return slot;
}
 
DestroyFire(id) {
	DestroyObject(Flame[id][Flame_id]);
	Flame[id][Flame_Exists] = 0;
	Iter_Remove(iFlame, id);
	Flame[id][Flame_pos][0] = 0.0;
	Flame[id][Flame_pos][1] = 0.0;
	Flame[id][Flame_pos][2] = 0.0;
	RemoveSmokeFromFire(id);
}


Incendii() {
	if(ActiveFire == 1) return 1;
	new rand = 1+random(6);
	// , Enable;
	// foreach(new i: Player) {
	// 	if(IsPlayerConnected(i)) {
	// 		if(PlayerInfo[i][pMember] == 13) Enable = 1;
	// 	}	
	// }
	// if(Enable == 0) return 1;
	ActiveFire = 1;
	
	switch(rand) {
		case 1: {
			SCMTA(COLOR_LIGHTBLUE, "**(( Fireman Dispatch: Tat ca nguoi dan San Andreas hay can than! Mot dam chay dang dien ra o Dealership (gan san bay LS). ))**");
			CreateFire(1447.33362, -2270.97876, 13.53329);
			CreateFire(1449.19092, -2281.46582, 13.53329);
			CreateFire(1450.10107, -2292.59912, 13.53329);
			CreateFire(1444.30566, -2293.84229, 13.53329);
			CreateFire(1439.56592, -2281.49438, 13.53329);
			CreateFire(1446.06042, -2276.06177, 13.53329);
			CreateFire(1440.99780, -2295.79102, 13.53329);
			CreateFire(1446.97278, -2298.66260, 13.53329);
			CreateFire(1439.44263, -2292.82886, 13.53329);
			CreateFire(1450.84875, -2288.62695, 17.73017);
			CreateFire(1451.00476, -2280.73560, 18.60952);
			CreateFire(1451.12659, -2292.72192, 19.00922);
			ActiveFires = 12;	
		}
		case 2: {
			SCMTA(COLOR_LIGHTBLUE, "**(( Fireman Dispatch: Tat ca nguoi dan San Andreas hay can than! Mot dam chay dang dien ra o khu vuc Bank LS. ))**");
			CreateFire(1461.29077, -1020.04413, 24.39252);
			CreateFire(1453.41455, -1018.86261, 24.78256);
			CreateFire(1457.31860, -1021.81921, 23.66661);
			CreateFire(1472.64844, -1021.95868, 23.86036);
			CreateFire(1470.11157, -1018.45203, 25.06591);
			CreateFire(1466.07129, -1023.56616, 23.86035);
			CreateFire(1451.05774, -1022.35870, 23.86035);
			CreateFire(1477.53076, -1021.78857, 23.86035);
			CreateFire(1466.21130, -1020.53876, 32.02980);
			CreateFire(1454.94385, -1010.21252, 27.00608);
			CreateFire(1457.23840, -1013.37164, 27.00608);
			CreateFire(1468.42810, -1011.77533, 27.00608);
			CreateFire(1470.46069, -1013.74866, 27.00608);
			ActiveFires = 13;	
		}	
		case 3: {
			SCMTA(COLOR_LIGHTBLUE, "**(( Fireman Dispatch: Tat ca nguoi dan San Andreas hay can than! Mot dam chay dang dien ra o khu vuc Benh vien LS. ))**");
			CreateFire(1173.6420, -1311.1465, 16.2516);
			CreateFire(1176.3635, -1313.2428, 12.9905);
			CreateFire(1173.8491, -1319.7798, 14.1583);
			CreateFire(1173.2473, -1316.1572, 15.2792);
			CreateFire(1178.2623, -1317.4094, 13.0812);
			CreateFire(1174.7070, -1323.7081, 13.7589);
			CreateFire(1171.7349, -1327.6919, 15.5322);
			CreateFire(1177.1036, -1330.5254, 13.0297);
			CreateFire(1173.0571, -1332.5093, 16.1815);
			CreateFire(1175.5625, -1327.1409, 13.3478);
			CreateFire(1173.4460, -1334.4224, 14.6413);
			CreateFire(1175.2076, -1333.0369, 12.9747);
			CreateFire(1173.3470, -1312.7200, 15.6086);
			ActiveFires = 13;	
		}
		case 4: {
			SCMTA(COLOR_LIGHTBLUE, "**(( Fireman Dispatch: Tat ca nguoi dan San Andreas hay can than! Mot dam chay dang dien ra o khu vuc City Hall LS. ))**");
			CreateFire(1471.2257, -1747.2070, 13.6019);
			CreateFire(1478.5143, -1750.8141, 18.1465);
			CreateFire(1478.5143, -1750.8141, 14.5618);
			CreateFire(1475.8438, -1752.1500, 14.6049);
			CreateFire(1483.7394, -1749.4760, 14.6049);
			CreateFire(1481.2520, -1752.4677, 14.6049);
			CreateFire(1479.3599, -1761.7220, 17.2895);
			CreateFire(1480.4056, -1763.2598, 18.7660);
			CreateFire(1484.9719, -1759.5471, 17.7796);
			CreateFire(1470.0608, -1759.6865, 19.5259);
			CreateFire(1475.4269, -1759.1777, 17.2620);
			CreateFire(1492.4440, -1759.1493, 17.8372);
			CreateFire(1486.9480, -1759.0610, 18.4096);
			ActiveFires = 13;	
		}
		case 5: {
			SCMTA(COLOR_LIGHTBLUE, "**(( Fireman Dispatch: Tat ca nguoi dan San Andreas hay can than! Mot dam chay dang dien ra o khu vuc CNN LS. ))**");
			CreateFire(1143.0273,-1419.4666,13.4334);
			CreateFire(1140.6815,-1420.5711,13.4334);
			CreateFire(1139.0225,-1416.0004,13.4334);
			CreateFire(1136.2081,-1419.9488,13.4334);
			CreateFire(1135.0714,-1419.0253,13.4334);
			CreateFire(1132.2939,-1416.6721,13.4334);
			CreateFire(1130.6403,-1420.3807,13.4334);
			CreateFire(1127.9373,-1420.1279,13.4334);
			CreateFire(1125.3940,-1422.5349,13.4334);
			CreateFire(1128.0363,-1417.0174,13.4334);
			CreateFire(1124.9595,-1418.1000,13.4334);
			CreateFire(1121.7322,-1420.6076,13.4334);
			CreateFire(1119.0516,-1419.4093,13.4334);
			CreateFire(1121.7360,-1416.1755,13.4334);
			CreateFire(1116.2637,-1418.3240,13.4334);
			ActiveFires = 15;
		}
		case 6: {
			SCMTA(COLOR_LIGHTBLUE, "**(( Fireman Dispatch: Tat ca nguoi dan San Andreas hay can than! Mot dam chay dang dien ra o khu vuc Nghia trang LS. ))**");
			CreateFire(834.42230, -1102.63550, 24.32769);
			CreateFire(832.82513, -1096.31262, 24.32769);
			CreateFire(831.43103, -1107.05066, 24.32769);
			CreateFire(828.20605, -1112.53174, 24.32769);
			CreateFire(832.88177, -1109.87598, 24.32769);
			CreateFire(827.47925, -1092.92334, 24.32769);
			CreateFire(836.82794, -1097.99402, 24.32769);
			CreateFire(834.97687, -1107.24231, 24.32769);
			CreateFire(831.45331, -1099.08691, 24.32769);
			CreateFire(830.32629, -1095.59424, 25.74726);
			CreateFire(830.32959, -1110.23877, 25.74726);
			CreateFire(824.17328, -1098.36670, 25.96719);
			CreateFire(823.70483, -1106.10046, 25.96719);
			CreateFire(825.56116, -1101.07373, 25.96719);
			ActiveFires = 14;	
		}
		case 7: {
			SCMTA(COLOR_LIGHTBLUE, "**(( Fireman Dispatch: Tat ca nguoi dan San Andreas hay can than! Mot dam chay dang dien ra o khu vuc Dealership gan CNN. ))**");
			CreateFire(1305.1740,-1415.9807,11.2996);
			CreateFire(1298.3923,-1418.7242,11.1023);
			CreateFire(1295.7797,-1416.5821,11.3009);
			CreateFire(1300.9633,-1416.8632,11.0875);
			CreateFire(1312.9210,-1417.1586,11.1013);
			CreateFire(1307.3242,-1417.9655,11.8554);
			CreateFire(1287.6235,-1418.0328,11.4318);
			CreateFire(1291.2949,-1419.0675,11.5564);
			ActiveFires = 8;			
		}
	}
	return 1;
}

function ExtinguishTimer(playerid, id) {
	if(id < -1 && (Aiming_at_Flame(playerid) == id || Pissing_at_Flame(playerid) == id)) { 
		TogglePlayerBurning(id+MAX_PLAYERS, false); 
	}
	
	else if(Flame[id][Flame_Exists] && ((Pressing(playerid) & KEY_FIRE && Aiming_at_Flame(playerid) == id) || (Pissing_at_Flame(playerid) == id))) {
		new sendername[MAX_PLAYER_NAME+26];
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(Aiming_at_Flame(playerid) == id) {
			if(PlayerInfo[playerid][pMember] == 13) {
				PlayerTextDrawSetString(playerid, InfosTD, "~y~Ban da dap tat ngon lua nay!");
				defer HideTextdraw(playerid);
				PlayerTextDrawShow(playerid, InfosTD);
				playerFire[playerid] ++;
			}	
		}
		DestroyFire(id);
		ActiveFires --;
		if(ActiveFires == 0) FinalFire();		
	}
	KillTimer(PlayerFireTimer[playerid][2]);
	PlayerFireTimer[playerid][2] = -1;
}

FinalFire() {
	SCMTA(COLOR_LIGHTBLUE, "**(( Fireman Dispatch: Ngon lua da tat thanh cong! ))**");
	new string[128];
	foreach(new i: Player) {
		if(playerFire[i] != 0) {
			format(string, sizeof(string), "Dap tat chay: %d", playerFire[i]);
			SendClientMessage(i, COLOR_GRAD2, string);
			new money = 5000 * playerFire[i] + random(100);
			format(string, sizeof(string), "So tien con lai: $%s", FormatNumber(money));
			SendClientMessage(i, COLOR_GRAD2, string);	
			GivePlayerCash(i, money);
			playerFire[i] = 0;	
			UpdateFactionRaport(i, 5);			
		}
	}
	ActiveFire = 0;
	return 1;
}

TogglePlayerBurning(playerid, burning) {
	if(burning) {
		SetPlayerAttachedObject(playerid, FIRE_OBJECT_SLOT, 18690, 2, -1, 0, -1.9, 0, 0);
		GetPlayerHealth(playerid, PlayerOnFireHP[playerid]);
		KillTimer(PlayerFireTimer[playerid][0]); KillTimer(PlayerFireTimer[playerid][1]);
		PlayerFireTimer[playerid][0] = SetTimerEx("BurningTimer", 91, 1, "d", playerid);
		PlayerFireTimer[playerid][1] = SetTimerEx("TogglePlayerBurning", 7000, 0, "dd", playerid, 0);
	}
	else {
		KillTimer(PlayerFireTimer[playerid][0]);
		RemovePlayerAttachedObject(playerid, FIRE_OBJECT_SLOT);
	}
	SetPVarInt(playerid, "IsOnFire", burning);
	return 1;
}
 
function BurningTimer(playerid) {
	if(GetPVarInt(playerid, "IsOnFire")) {
		new Float:hp;
		GetPlayerHealth(playerid, hp);
		if(hp < PlayerOnFireHP[playerid]) PlayerOnFireHP[playerid] = hp;
		PlayerOnFireHP[playerid] -= 1.0;
		SetPlayerHealthEx(playerid, PlayerOnFireHP[playerid]);
	}
	else { KillTimer(PlayerFireTimer[playerid][0]); KillTimer(PlayerFireTimer[playerid][1]); }
}
*/
SetCheckpoint(playerid) {
	new rand = random(5);
	switch(rand) {
		case 0: SetPlayerCheckpointEx(playerid, 2566.9636,-2450.5378,13.6262, 5.0);
		case 1: SetPlayerCheckpointEx(playerid, 2550.3438,-2221.8779,13.3113, 5.0);
		case 2: SetPlayerCheckpointEx(playerid, 1767.1932,-2031.7592,13.7906, 5.0);
		case 3: SetPlayerCheckpointEx(playerid, 2684.4473,-1110.4076,69.3969, 5.0);
		case 4: SetPlayerCheckpointEx(playerid, 2311.5100,-1238.0265,24.0475, 5.0);
		case 5: SetPlayerCheckpointEx(playerid, 797.5410,-617.5146,16.3359, 5.0);		
	}
	CP[playerid] = 60;
	return 1;
}

ShowCasinoTDs(playerid) {
	ResetColorTD(playerid);
	PlayerTextDrawSetString(playerid, CasinoPTD[32], "Enter bet amount");
	TextDrawColor(CasinoTD[9], -1);
	TextDrawColor(CasinoTD[7], -1);
	TextDrawColor(CasinoTD[12], -1);
	for(new i = 0; i < 33; i++) PlayerTextDrawShow(playerid, CasinoPTD[i]);
	for(new i = 0; i < 15; i++) TextDrawShowForPlayer(playerid, CasinoTD[i]);
	PlayerTextDrawHide(playerid, CasinoPTD[30]);
	SelectTextDraw(playerid, 0x80FF00FF);
	SetPVarInt(playerid, "MoneyEarned", 0);
	SetPVarInt(playerid, "Mines", 0);
	SetPVarInt(playerid, "MineType", 0);	
	SetPVarInt(playerid, "BetAmount", 0);	
	SetPVarInt(playerid, "StartedGame", 0);	
	SetPVarInt(playerid, "Loser", 0);
	for(new i = 0; i < 30; i++) MineActive[playerid][i] = 0;
	return 1;
}

ResetColorTD(playerid) {
	for(new i = 0; i < 33; i++) {
		PlayerTextDrawBoxColor(playerid, CasinoPTD[i], -123);
		PlayerTextDrawShow(playerid, CasinoPTD[i]);
	}
	return 1;
}

HideCasinoTDs(playerid) {
	for(new i = 0; i < 33; i++) PlayerTextDrawHide(playerid, CasinoPTD[i]);
	for(new i = 0; i < 15; i++) TextDrawHideForPlayer(playerid, CasinoTD[i]);
	CancelSelectTextDraw(playerid);
	SetPVarInt(playerid, "PlayMine", 0);
	SetPVarInt(playerid, "BetAmount", 0);
	SetPVarInt(playerid, "Mines", 0);
	SetPVarInt(playerid, "StartedGame", 0);
	SetPVarInt(playerid, "MineType", 0);
	return 1;
}
ShowClanVehicle(playerid) {
	new str[16],string[150],v = 0, title[15];
	format(title, sizeof(title), "Xe Clan (%d/10)", GetCVehicles(PlayerInfo[playerid][pClan]));
	format(string, sizeof(string),"{FE9A2E}[+]Mua xe Clan\n");
    foreach(new id: ClanVehicle) {
        if(ServerVehicles[id][vClan] == PlayerInfo[playerid][pClan]) {
            ClanVehicle[PlayerInfo[playerid][pClan]][v] = id;
		    format(str, sizeof(str), "%d. %s\n",v,aVehicleNames[ServerVehicles[id][vModel] -400]);
            strcat(string, str);
            v++;
        }
	}
	Dialog_Show(playerid, DIALOG_CLANVEHICLE, DIALOG_STYLE_LIST, title, string,"Chon","Dong");
}
function GuiDenAdminVaHelper(color,const string[],level) {
	new text[180];
	foreach(new i: Player) {
	    if(IsPlayerConnected(i) && IsPlayerLogged[i] == 1) {
			if(IsPlayerLogged[i] == 1) {
				if(PlayerInfo[i][pAdmin] >= level || PlayerInfo[i][pHelper] >= level ) {
					format(text, 256, string);
					SendClientMessage(i, color, text);
				}
			}
		}
	}
	return 1;
}
function GetVehicleSpeedUp(playerid, carid) {
	return EVF::GetVehicleSpeed(GetPlayerVehicleID(playerid)) > GetVehicleMaxSpeed(GetVehicleModel(GetPlayerVehicleID(playerid)))+16 ? (true) : (false);
}		


function GiveVehicleSpeed(i) {
    // if(ServerSystem[11] == 1 || !IsPlayerInAnyVehicle(i)) return true;
    
    new
        vehicleid = GetPlayerVehicleID(i),
        keys,
        Float:vx,
        Float:vy,
        Float:vz,
        carid = FindSpawnID(GetPlayerVehicleID(i))
    ;   

	if(GetVehicleSpeedUp(i, carid))
		return true;

    GetPlayerKeys(i, keys, _:vx, _:vx);

    if ((keys & (KEY_VEHICLE_FORWARD | KEY_VEHICLE_BACKWARD | KEY_HANDBRAKE)) == KEY_VEHICLE_FORWARD) {
		// printf("Debug da tang toc do");
        GetVehicleVelocity(vehicleid, vx, vy, vz);

        if (vx * vx + vy * vy < g_SpeedThreshold)
            return true;


        vx *= SPEED_MULTIPLIER;
        vy *= SPEED_MULTIPLIER;


        if (vz > 0.04 || vz < -0.04)
            vz -= 0.020;

        SetVehicleVelocity(vehicleid, vx, vy, vz);
	}
    return true;
}

function GetVehicleMaxSpeed(model) {
	new speed;
	model -= 400;
	switch(model) {
		case 0: speed = 149; // model 400
		case 1: speed = 139; // model 401
		case 2: speed = 176; // model 402
		case 3: speed = 104; // model 403
		case 4: speed = 125; // model 404
		case 5: speed = 155; // model 405
		case 6: speed = 104; // model 406
		case 7: speed = 140; // model 407
		case 8: speed = 94;  // model 408
		case 9: speed = 149; // model 409
		case 10: speed = 122; // model 410
		case 11: speed = 209; // model 411
		case 12: speed = 159; // model 412
		case 13: speed = 104; // model 413
		case 14: speed = 100; // model 414
		case 15: speed = 181; // model 415
		case 16: speed = 145; // model 416
		case 17: speed = 127; // model 417
		case 18: speed = 109; // model 418
		case 19: speed = 141; // model 419
		case 20: speed = 137; // model 420
		case 21: speed = 145; // model 421
		case 22: speed = 132; // model 422
		case 23: speed = 93;  // model 423
		case 24: speed = 128; // model 424
		case 25: speed = 191; // model 425
		case 26: speed = 164; // model 426
		case 27: speed = 156; // model 427
		case 28: speed = 148; // model 428
		case 29: speed = 190; // model 429
		case 30: speed = 100; // model 430
		case 31: speed = 123; // model 431
		case 32: speed = 89;  // model 432
		case 33: speed = 104; // model 433
		case 34: speed = 158; // model 434
		case 35: speed = 0;   // model 435
		case 36: speed = 141; // model 436
		case 37: speed = 149; // model 437
		case 38: speed = 135; // model 438
		case 39: speed = 159; // model 439
		case 40: speed = 128; // model 440
		case 41: speed = 71;  // model 441
		case 42: speed = 131; // model 442
		case 43: speed = 119; // model 443
		case 44: speed = 104; // model 444
		case 45: speed = 155; // model 445
		case 46: speed = 140; // model 446
		case 47: speed = 126; // model 447
		case 48: speed = 106; // model 448
		case 49: speed = 169; // model 449
		case 50: speed = 0;   // model 450
		case 51: speed = 182; // model 451
		case 52: speed = 141; // model 452
		case 53: speed = 58;  // model 453
		case 54: speed = 115; // model 454
		case 55: speed = 119; // model 455
		case 56: speed = 100; // model 456
		case 57: speed = 90;  // model 457
		case 58: speed = 138; // model 458
		case 59: speed = 128; // model 459
		case 60: speed = 0;   // model 460
		case 61: speed = 151; // model 461
		case 62: speed = 105; // model 462
		case 63: speed = 136; // model 463
		case 64: speed = 0;   // model 464
		case 65: speed = 0;   // model 465
		case 66: speed = 139; // model 466
		case 67: speed = 132; // model 467
		case 68: speed = 136; // model 468
		case 69: speed = 0;   // model 469
		case 70: speed = 148; // model 470
		case 71: speed = 104; // model 471
		case 72: speed = 0;   // model 472
		case 73: speed = 0;   // model 473
		case 74: speed = 141; // model 474
		case 75: speed = 163; // model 475
		case 76: speed = 0;   // model 476
		case 77: speed = 176; // model 477
		case 78: speed = 111; // model 478
		case 79: speed = 132; // model 479
		case 80: speed = 174; // model 480
		case 81: speed = 68;  // model 481
		case 82: speed = 148; // model 482
		case 83: speed = 116; // model 483
		case 84: speed = 0;   // model 484
		case 85: speed = 94;  // model 485
		case 86: speed = 60;  // model 486
		case 87: speed = 0;   // model 487
		case 88: speed = 0;   // model 488
		case 89: speed = 132; // model 489
		case 90: speed = 148; // model 490
		case 91: speed = 141; // model 491
		case 92: speed = 132; // model 492
		case 93: speed = 0;   // model 493
		case 94: speed = 203; // model 494
		case 95: speed = 166; // model 495
		case 96: speed = 153; // model 496
		case 97: speed = 0;   // model 497
		case 98: speed = 115; // model 498
		case 99: speed = 116; // model 499
		case 100: speed = 132; // model 500
		case 101: speed = 0;   // model 501
		case 102: speed = 203; // model 502
		case 103: speed = 203; // model 503
		case 104: speed = 163; // model 504
		case 105: speed = 132; // model 505
		case 106: speed = 169; // model 506
		case 107: speed = 156; // model 507
		case 108: speed = 102; // model 508
		case 109: speed = 74;  // model 509
		case 110: speed = 95;  // model 510
		case 111: speed = 0;   // model 511
		case 112: speed = 0;   // model 512
		case 113: speed = 0;   // model 513
		case 114: speed = 113; // model 514
		case 115: speed = 126; // model 515
		case 116: speed = 148; // model 516
		case 117: speed = 148; // model 517
		case 118: speed = 155; // model 518
		case 119: speed = 0;   // model 519
		case 120: speed = 0;   // model 520
		case 121: speed = 150; // model 521
		case 122: speed = 166; // model 522
		case 123: speed = 142; // model 523
		case 124: speed = 123; // model 524
		case 125: speed = 151; // model 525
		case 126: speed = 149; // model 526
		case 127: speed = 141; // model 527
		case 128: speed = 166; // model 528
		case 129: speed = 141; // model 529
		case 130: speed = 57;  // model 530
		case 131: speed = 66;  // model 531
		case 132: speed = 104; // model 532
		case 133: speed = 157; // model 533
		case 134: speed = 159; // model 534
		case 135: speed = 149; // model 535
		case 136: speed = 163; // model 536
		case 137: speed = 0;   // model 537
		case 138: speed = 0;   // model 538
		case 139: speed = 94;  // model 539
		case 140: speed = 141; // model 540
		case 141: speed = 191; // model 541
		case 142: speed = 155; // model 542
		case 143: speed = 142; // model 543
		case 144: speed = 140; // model 544
		case 145: speed = 139; // model 545
		case 146: speed = 141; // model 546
		case 147: speed = 135; // model 547
		case 148: speed = 0;   // model 548
		case 149: speed = 145; // model 549
		case 150: speed = 137; // model 550
		case 151: speed = 148; // model 551
		case 152: speed = 114; // model 552
		case 153: speed = 0;   // model 553
		case 154: speed = 136; // model 554
		case 155: speed = 149; // model 555
		case 156: speed = 104; // model 556
		case 157: speed = 104; // model 557
		case 158: speed = 147; // model 558
		case 159: speed = 168; // model 559
		case 160: speed = 159; // model 560
		case 161: speed = 145; // model 561
		case 162: speed = 168; // model 562
		case 163: speed = 0;   // model 563
		case 164: speed = 83;  // model 564
		case 165: speed = 155; // model 565
		case 166: speed = 151; // model 566
		case 167: speed = 163; // model 567
		case 168: speed = 138; // model 568
		case 169: speed = 0;   // model 569
		case 170: speed = 0;   // model 570
		case 171: speed = 88;  // model 571
		case 172: speed = 58;  // model 572
		case 173: speed = 104; // model 573
		case 174: speed = 57;  // model 574
		case 175: speed = 149; // model 575
		case 176: speed = 140; // model 576  
		case 177: speed = 0;   // model 577
		case 178: speed = 123; // model 578
		case 179: speed = 149; // model 579
		case 180: speed = 144; // model 580
		case 181: speed = 101; // model 581
		case 182: speed = 115; // model 582
		case 183: speed = 66;  // model 583
		case 184: speed = 0;   // model 584
		case 185: speed = 144; // model 585
		case 186: speed = 132; // model 586
		case 187: speed = 155; // model 587
		case 188: speed = 102; // model 588
		case 189: speed = 153; // model 589
		case 190: speed = 0;   // model 590
		case 191: speed = 0;   // model 591
		case 192: speed = 0;   // model 592
		case 193: speed = 0;   // model 593
		case 194: speed = 57;  // model 594
		case 195: speed = 0;   // model 595
		case 196: speed = 166; // model 596
		case 197: speed = 166; // model 597
		case 198: speed = 166; // model 598
		case 199: speed = 149; // model 599
		case 200: speed = 142; // model 600
		case 201: speed = 104; // model 601
		case 202: speed = 160; // model 602
		case 203: speed = 162; // model 603
		case 204: speed = 139; // model 604
		case 205: speed = 142; // model 605
		case 206: speed = 0;   // model 606
		case 207: speed = 0;   // model 607
		case 208: speed = 0;   // model 608
		case 209: speed = 102; // model 609
		case 210: speed = 0;   // model 610
	}
	return speed;
}

stock Carspeed(playerid,mode = 1) {
    new Float:Velocity [3];
    GetVehicleVelocity ( GetPlayerVehicleID ( playerid ) , Velocity [ 0 ] , Velocity [ 1 ] , Velocity [ 2 ] ) ;
    return IsPlayerInAnyVehicle ( playerid ) ? floatround ( ( ( floatsqroot ( ( ( Velocity [ 0 ] * Velocity [ 0 ] ) + ( Velocity [ 1 ] * Velocity [ 1 ] ) + ( Velocity [ 2 ] * Velocity [ 2 ] ) ) ) * ( !mode ? 105.0 : 170.0 ) ) ) * 1 ) : 0;
}
