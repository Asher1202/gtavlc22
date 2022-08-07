/* ** Includes ** */
#include <YSI_Coding\y_hooks>

/* ** Definitions ** */

/* ** Variables ** */
stock SetVehicleTrunk(vehicleid, playerid)
{
	new engine,lights,alarm,doors,bonnet,boot,objective;
    GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
    if(boot == VEHICLE_PARAMS_ON)
	{
		SetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,VEHICLE_PARAMS_OFF,objective);
		SendClientMessage(playerid, COLOR_GREEN, "Cop xe  da duoc dong lai.");
	}
    else if(boot == VEHICLE_PARAMS_OFF || boot == VEHICLE_PARAMS_UNSET)
	{
		SetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,VEHICLE_PARAMS_ON,objective);
		SendClientMessage(playerid, COLOR_GREEN, "Cop xe da duoc mo ra.");
	}
}
// CMD:xe(playerid, params[])
// {
// 	if(sscanf(params, "s[16]", params))
// 	{
// 		SendClientMessage(playerid, COLOR_YELLOW, "/xe [Lua Chon]");
// 		SendClientMessage(playerid, COLOR_YELLOW, "CopXe");
// 		return 1;
// 	}
// 	new vid = GetPlayerVehicleID(playerid);
// 	if(IsABike(vid)) return SendClientMessage(playerid, COLOR_GREY, "Xe dap khong co nhung chuc nang nay.");
// 	if(!strcmp(params, "CopXe", true))
//   	{
// 		if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
// 		{
// 			if(GetVehicleModel(vid) == 481 || GetVehicleModel(vid) == 509 || GetVehicleModel(vid) == 510 || IsAPlane(vid) || IsABike(vid) || IsABoat(vid)) return SendClientMessage(playerid,COLOR_GREY,"Lenh nay khong the su dung trong chiec xe nay.");
// 			SetVehicleTrunk(vid, playerid);
// 		}
// 		else if(!IsPlayerInAnyVehicle(playerid))
// 		{
// 			new closestcar = GetClosestVehicle(playerid);
// 			if(closestcar == -1) return SendClientMessage(playerid,COLOR_GREY,"Ban khong dung gan xe nao.");
// 			if(GetVehicleModel(closestcar) == 481 || GetVehicleModel(closestcar) == 509 || GetVehicleModel(closestcar) == 510 || IsAPlane(closestcar) || IsABike(closestcar) || IsABoat(closestcar)) return SendClientMessage(playerid,COLOR_GREY,"Lenh nay khong the su dung tren loai xe nay.");
// 			SetVehicleTrunk(closestcar, playerid);
// 		}
// 	}
// 	return 1;
// }

// /* ** Hooks ** */

// /* ** Functions ** */
// CMD:sung(playerid, params[]) {

// 	if(UsingDrugs[playerid] != 0) return SendClientMessage(playerid, COLOR_WHITE, "Ban dang su dung thuoc phien!");
// 	if(PlayerToPoint(300.0, playerid, -1423.5153,935.8321,1036.4756)) return SendClientMessage(playerid, -1, "Ban dang o trong Event Arena.");
// 	if(PaintType[playerid] != 0) return SendClientMessage(playerid, -1, "Ban dang o trong paintball!");
// 	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000} [HE THONG] {FFFFFF}: Ban dang o trong mot xe!");
// 	new vid = GetClosestVehicle(playerid);
// 	if(XeCaNhan(playerid) == -1) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000} [HE THONG] {FFFFFF}: Ban khong o trong xe ca nhan cua ban!");
// 	if(IsABike(vid)) return SendClientMessage(playerid, COLOR_YELLOW, "Ban khong the bo sung vao xe dap");
// 	new str[128],gunname[32];

// 	//new ammo = CarInfo[vid][cSlotAmmo][slot-1];
// 	if(CarInfo[vid][cSlotSung][0] != 0)
// 		GetWeaponName(CarInfo[vid][cSlotSung][0],gunname,sizeof(gunname));

// 	else	format(gunname,sizeof(gunname),"Trong");
// 	format(str,sizeof(str),"Slot 1:\t%s(%d)\n",gunname);
// 	if(CarInfo[vid][cSlotSung][1] != 0)
// 		GetWeaponName(CarInfo[vid][cSlotSung][1],gunname,sizeof(gunname));
// 	else	format(gunname,sizeof(gunname),"Trong");
// 	format(str,sizeof(str),"%sSlot 2:\t%s(%d)",str,gunname);
// 	ShowPlayerDialog(playerid,0,DIALOG_STYLE_TABLIST,"Xem Slot Sung",str,"OK","");

// 	return 1;

// }

// CMD:xecatsung(playerid, params[])
// {
//     if(OnDuty[playerid] == 1) return SendClientMessage(playerid, COLOR_WHITE, "Ban khong the cat sung khi dang onduty!");
//     if(GetPlayerVirtualWorld(playerid) != 0 ) return SendClientMessage(playerid, COLOR_WHITE, "Ban khong the cat sung khi dang o trong mot VW!");
// 	if(UsingDrugs[playerid] != 0) return SendClientMessage(playerid, COLOR_WHITE, "Ban dang su dung thuoc phien!");
// 	if(PlayerToPoint(300.0, playerid, -1423.5153,935.8321,1036.4756)) return SendClientMessage(playerid, -1, "Ban dang o trong Event Arena.");
// 	if(PaintType[playerid] != 0) return SendClientMessage(playerid, -1, "Ban dang o trong paintball!");
// 	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000} [HE THONG] {FFFFFF}: Ban dang o trong mot xe!");
// 	new weaponid = GetPlayerWeapon(playerid);
// 	new ammo = GetPlayerAmmo(playerid);
// 	new idd, vid;
// 	//new slotsung = GetWeaponSlot(weaponid);
// 	//if(weaponid != PInfo[playerid][Sung][slotsung]) return SendMessage(playerid, COLOR_THATBAI, "Ban khong the cat cay sung nay!",SMHETHONG);
// 	vid = GetClosestVehicle(playerid);
// 	idd = FindSpawnID(vid);
// 	if(XeCaNhan(playerid) == -1) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000} [HE THONG] {FFFFFF}: Ban khong o trong xe ca nhan cua ban!");
// 	if(IsABike(vid)) return SendClientMessage(playerid, COLOR_YELLOW, "Ban khong the bo sung vao xe dap");
// 	ApplyAnimation(playerid,  "BD_FIRE", "wash_up", 4.0, 1, 0, 0, 0, 0, 1);
// 	if(!IsABike(vid) && !IsAPlane(vid) && !IsABoat(vid))
// 	{
// 		new engine,lights,alarm,doors,bonnet,boot,objective;
// 		GetVehicleParamsEx(vid,engine,lights,alarm,doors,bonnet,boot,objective);
// 		if(boot == VEHICLE_PARAMS_OFF || boot == VEHICLE_PARAMS_UNSET) return SendClientMessage(playerid, COLOR_GREY, "Cop xe phai duoc mo ra (/xe copxe).");
// 	}
// 	new slot;
// 	if(sscanf(params, "d", slot)) return SendClientMessage(playerid, COLOR_GREY, "/catsung [slot]");
// 	if(slot>2 || slot < 1) return SendClientMessage(playerid,COLOR_GREY,"Slot tu 1 -> 2");
// 	if(weaponid == 0) return SendClientMessage(playerid,COLOR_GREY,"Ban chua cam vu khi");
// 	if(weaponid == 35) return SendClientMessage(playerid,COLOR_GREY,"Sung nay khong the cat");
// 	for(new i = 0; i<= 6; i++)
// 	{
// 		if(weaponid == PlayerInfo[playerid][pSungGang][i]) return SendClientMessage(playerid, COLOR_RED, "Ban khong the bo mot khau sung lay tu gangster {B6EEBD}vao cop xe!"); 
// 	}
// 	if(CarInfo[vid][cSlotSung][slot-1] != 0) return SendClientMessage(playerid,COLOR_GREY,"Slot nay da co sung");
// 	CarInfo[vid][cSlotSung][slot-1] = weaponid;
// 	CarInfo[vid][cSlotAmmo][slot-1] = ammo;
// 	ResetWeapons(playerid);
// 	new str[128],gunname[32];
// 	GetWeaponName(weaponid,gunname,sizeof(gunname));

// 	format(str,sizeof(str),"Ban da cat cay sung %s va %d vien dan vao slot %i",gunname, ammo, slot);
// 	SendClientMessage(playerid, COLOR_GREEN, str);
// 	new query[512];
// 	mysql_format(SQL, query, sizeof(query), 
// 		"UPDATE cars SET Sung1 = '%d', Sung2 = '%d', Ammo1 = '%d', Ammo2 = '%d' WHERE ID=%d", 
// 	CarInfo[vid][cSlotSung][0], CarInfo[vid][cSlotSung][1],CarInfo[vid][cSlotAmmo][0],CarInfo[vid][cSlotAmmo][1], idd);
// 	mysql_tquery(SQL, query, "", "");
// 	//saveCar(idd);
	
// 	return 1;

// }

CMD:catsung(playerid, params[])
{
    if(OnDuty[playerid] == 1) return SendClientMessage(playerid, COLOR_WHITE, "Ban khong the cat sung khi dang onduty!");
    if(GetPlayerVirtualWorld(playerid) != 0 ) return SendClientMessage(playerid, COLOR_WHITE, "Ban khong the cat sung khi dang o trong mot VW!");
	if(UsingDrugs[playerid] != 0) return SendClientMessage(playerid, COLOR_WHITE, "Ban dang su dung thuoc phien!");
	if(PlayerToPoint(300.0, playerid, -1423.5153,935.8321,1036.4756)) return SendClientMessage(playerid, -1, "Ban dang o trong Event Arena.");
	if(PaintType[playerid] != 0) return SendClientMessage(playerid, -1, "Ban dang o trong paintball!");
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000} [HE THONG] {FFFFFF}: Ban dang o trong mot xe!");
	new weaponid = GetPlayerWeapon(playerid);
	new ammo = GetPlayerAmmo(playerid);
	new gunmodel;
	new wname[32];
	GetWeaponName(weaponid, wname, 32);
	switch(weaponid)
	{
		case 24 : gunmodel = 348;
		case 31 : gunmodel = 356, wname ="M4A1";
		case 30 : gunmodel = 355;
		case 28 : gunmodel = 352;
		case 25 : gunmodel = 349;
		case 5 : gunmodel = 336;
	}
	ApplyAnimation(playerid,  "BD_FIRE", "wash_up", 4.0, 1, 0, 0, 0, 0, 0);
	if(weaponid == 0) return SendClientMessage(playerid,COLOR_GREY,"Ban chua cam vu khi");
	if(weaponid == 35) return SendClientMessage(playerid,COLOR_GREY,"Sung nay khong the cat");
	if(weaponid == 38) return SendClientMessage(playerid,COLOR_GREY,"Sung nay khong the cat");
	for(new i = 0; i<= 6; i++)
	{
		if(weaponid == PlayerInfo[playerid][pSungGang][i]) return SendClientMessage(playerid, COLOR_RED, "Ban khong the bo mot khau sung lay tu gangster {B6EEBD}vao cop xe!"); 
	}
	if(Inventory_GetFreeID(playerid, 1) == -1) Inventory_Add(playerid, wname, gunmodel, ammo, 2);
	else Inventory_Add(playerid, wname, gunmodel, ammo, 1);
	printf("%s %d %d", wname, gunmodel, ammo);
	RemovePlayerWeapon(playerid, GetPlayerWeapon(playerid));
	new str[128];
	format(str,sizeof(str),"Ban da cat cay sung %s va %d vien dan",wname, ammo);
	SendClientMessage(playerid, COLOR_GREEN, str);
	
	return 1;

}
// CMD:xelaysung(playerid, params[])
// {
// 	if(UsingDrugs[playerid] != 0) return SendClientMessage(playerid, COLOR_WHITE, "Ban dang su dung thuoc phien!");
// 	if(PlayerToPoint(300.0, playerid, -1423.5153,935.8321,1036.4756)) return SendClientMessage(playerid, -1, "Ban dang o trong Event Arena.");
// 	if(PaintType[playerid] != 0) return SendClientMessage(playerid, -1, "Ban dang o trong paintball!");
// 	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000} [HE THONG] {FFFFFF}: Ban dang o trong mot xe!");
// 	new idd, vid;
// 	vid = GetClosestVehicle(playerid);
// 	idd = FindSpawnID(vid);
// 	if(XeCaNhan(playerid) == -1) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000} [HE THONG] {FFFFFF}: Ban khong o trong xe ca nhan cua ban!");
// 	if(IsABike(vid)) return SendClientMessage(playerid, COLOR_YELLOW, "Ban khong the lay sung tu xe dap");
// 	if(!IsABike(vid) && !IsAPlane(vid) && !IsABoat(vid))
// 	{
// 		new engine,lights,alarm,doors,bonnet,boot,objective;
// 		GetVehicleParamsEx(vid,engine,lights,alarm,doors,bonnet,boot,objective);
// 		if(boot == VEHICLE_PARAMS_OFF || boot == VEHICLE_PARAMS_UNSET) return SendMessage(COLOR_GREY, "Cop xe phai duoc mo ra (/xe copxe).");
// 	}
// 	new slot;
// 	ApplyAnimation(playerid,  "BD_FIRE", "wash_up", 4.0, 1, 0, 0, 0, 0, 1);
// 	if(sscanf(params, "d", slot)) return SendClientMessage(playerid, COLOR_YELLOW, "/laysung [slot]");
// 	if(slot>2 || slot < 1) return SendClientMessage(playerid,COLOR_GREY,"Slot tu 1 -> 2");
// 	if(CarInfo[vid][cSlotSung][slot-1] == 0) return SendClientMessage(playerid,COLOR_GREY,"Slot nay khong co vu khi nao");
// 	new weapon[12],ammo[12];
// 	for(new i=0; i<12; i++)
// 	{
// 		GetPlayerWeaponData(playerid, i, weapon[i], ammo[i]);
// 		if(CarInfo[vid][cSlotSung][slot-1] == weapon[i] && weapon[i] != 0)
// 			 return SendClientMessage(playerid,COLOR_GREY,"Ban da co mot cay sung nhu the nay trong nguoi");
// 	}
// 	ServerWeapon(playerid, CarInfo[vid][cSlotSung][slot-1],CarInfo[vid][cSlotAmmo][slot-1]);
// 	new str[128],gunname[48];
// 	GetWeaponName(CarInfo[vid][cSlotSung][slot-1],gunname,sizeof(gunname));
// 	new sammo = CarInfo[vid][cSlotAmmo][slot-1];
// 	format(str,sizeof(str),"Ban da lay cay sung %s va %d vien dan ra tu Slot %i",gunname, sammo, slot);
// 	SendClientMessage(playerid, COLOR_GREEN, str);
// 	CarInfo[vid][cSlotSung][slot-1] = 0;
// 	CarInfo[vid][cSlotAmmo][slot-1] = 0;
// 	new query[512];
// 	mysql_format(SQL, query, sizeof(query), 
// 		"UPDATE cars SET Sung1 = '%d', Sung2 = '%d', Ammo1 = '%d', Ammo2 = '%d' WHERE ID=%d", 
// 	CarInfo[vid][cSlotSung][0], CarInfo[vid][cSlotSung][1],CarInfo[vid][cSlotAmmo][0],CarInfo[vid][cSlotAmmo][1], idd);
// 	mysql_tquery(SQL, query, "", "");
// 	//saveCar(idd);
// 	return 1;

// }
