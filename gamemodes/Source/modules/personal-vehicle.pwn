#include <YSI_Coding\y_hooks>

// DIALOGS
Dialog:DIALOG_SELLCAR(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new vsid = PlayerSellCar[playerid], string[200];
	if(CarInfo[vsid][cSpecial] == 1) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Chiec xe nay khong the ban cho nha nuoc!");
	if(CarInfo[vsid][Spawned] == 0) return 1;
	VehicleOwned[CarInfo[vsid][Spawned]] = CarInfo[vsid][Spawned];
	VehicleSQL[CarInfo[vsid][Spawned]] = vsid;
				
	new value;
	CheckVehicle(CarInfo[vsid][Spawned]);
	value = CarPriceValid(CarInfo[vsid][cModel]) / 2;
	GivePlayerCash(playerid, value);
	format(string, sizeof(string), "Ban nhan duoc $%s boi vi ban da ban chiec xe cua ban!",FormatNumber(value), "%%");
	SendClientMessage(playerid,COLOR_MONEY,string);
				
	format(string, sizeof(string), "%s ban chiec xe cua minh %s[%d] (cho tieu bang) va nhan ve $%s.", GetName(playerid), aVehicleNames[CarInfo[vsid][cModel]-400], vsid, FormatNumber(value));
	SendAdminMessage(COLOR_YELLOW, string, 1); 
	//InsertLog(playerid, string, LOG_CAR);	
	Log("logs/car.log", string);

	if(CarInfo[vsid][cNeon] != INVALID_OBJECT_ID) {
		DestroyDynamicObject(neon[0][CarInfo[vsid][Spawned]]);
		DestroyDynamicObject(neon[1][CarInfo[vsid][Spawned]]);
		neon[0][CarInfo[vsid][Spawned]] = INVALID_OBJECT_ID;
		neon[1][CarInfo[vsid][Spawned]] = INVALID_OBJECT_ID;	
	}
	if(strlen(CarInfo[vsid][cText]) >= 3) {
		DestroyDynamicObject(nameobject[CarInfo[vsid][Spawned]]);
	}	
	
	DestroyVehicle(CarInfo[vsid][Spawned]);		

	format(string, sizeof(string), "DELETE FROM cars WHERE ID=%d", vsid);
	mysql_query(SQL, string, false);

	if(PlayerInfo[playerid][pCarKey][0] == vsid) { PlayerInfo[playerid][pCarKey][0] = 0; mysql_format(SQL, string, sizeof(string), "UPDATE `users`SET CarKey1 = %d WHERE `name`='%s'",PlayerInfo[playerid][pCarKey][0],PlayerInfo[playerid][pUsername]); }
	else if(PlayerInfo[playerid][pCarKey][1] == vsid) { PlayerInfo[playerid][pCarKey][1] = 0; mysql_format(SQL, string, sizeof(string), "UPDATE `users`SET CarKey2 = %d WHERE `name`='%s'",PlayerInfo[playerid][pCarKey][1],PlayerInfo[playerid][pUsername]); }
	else if(PlayerInfo[playerid][pCarKey][2] == vsid) { PlayerInfo[playerid][pCarKey][2] = 0; mysql_format(SQL, string, sizeof(string), "UPDATE `users`SET CarKey3 = %d WHERE `name`='%s'",PlayerInfo[playerid][pCarKey][2],PlayerInfo[playerid][pUsername]); }
	else if(PlayerInfo[playerid][pCarKey][3] == vsid) { PlayerInfo[playerid][pCarKey][3] = 0; mysql_format(SQL, string, sizeof(string), "UPDATE `users`SET CarKey4 = %d WHERE `name`='%s'",PlayerInfo[playerid][pCarKey][3],PlayerInfo[playerid][pUsername]); }
	else if(PlayerInfo[playerid][pCarKey][4] == vsid) { PlayerInfo[playerid][pCarKey][4] = 0; mysql_format(SQL, string, sizeof(string), "UPDATE `users`SET CarKey5 = %d WHERE `name`='%s'",PlayerInfo[playerid][pCarKey][4],PlayerInfo[playerid][pUsername]); }
	else if(PlayerInfo[playerid][pCarKey][5] == vsid) { PlayerInfo[playerid][pCarKey][5] = 0; mysql_format(SQL, string, sizeof(string), "UPDATE `users`SET CarKey6 = %d WHERE `name`='%s'",PlayerInfo[playerid][pCarKey][5],PlayerInfo[playerid][pUsername]); }
	else if(PlayerInfo[playerid][pCarKey][6] == vsid) { PlayerInfo[playerid][pCarKey][6] = 0; mysql_format(SQL, string, sizeof(string), "UPDATE `users`SET CarKey7 = %d WHERE `name`='%s'",PlayerInfo[playerid][pCarKey][6],PlayerInfo[playerid][pUsername]); }
	else if(PlayerInfo[playerid][pCarKey][7] == vsid) { PlayerInfo[playerid][pCarKey][7] = 0; mysql_format(SQL, string, sizeof(string), "UPDATE `users`SET CarKey8 = %d WHERE `name`='%s'",PlayerInfo[playerid][pCarKey][7],PlayerInfo[playerid][pUsername]); }
	else if(PlayerInfo[playerid][pCarKey][8] == vsid) { PlayerInfo[playerid][pCarKey][8] = 0; mysql_format(SQL, string, sizeof(string), "UPDATE `users`SET CarKey9 = %d WHERE `name`='%s'",PlayerInfo[playerid][pCarKey][8],PlayerInfo[playerid][pUsername]); }
	else if(PlayerInfo[playerid][pCarKey][9] == vsid) { PlayerInfo[playerid][pCarKey][9] = 0; mysql_format(SQL, string, sizeof(string), "UPDATE `users`SET CarKey10 = %d WHERE `name`='%s'",PlayerInfo[playerid][pCarKey][9],PlayerInfo[playerid][pUsername]); }
					
	mysql_query(SQL, string, false);
	CarInfo[vsid][cID] = -2;
	CarInfo[vsid][Spawned] = 0;
	CarInfo[vsid][cNeon] = 0;
	CarInfo[vsid][cValue] = 0;
	format(CarInfo[vsid][cText], 16, "-");
	foreach(new i: Player) {
		if(IsPlayerConnected(i) && IsPlayerLogged[i] == 1) {
			if(GetPVarInt(i, "OfferBy") == playerid) {
				SendClientMessage(playerid, -1, "Giao dich da duoc huy bo!");
				SendClientMessage(i, -1, "Giao dich da duoc huy bo!");
				SetPVarInt(i, "OfferBy", -1);		
			}
			if(TradePlayer[i] == playerid) {
				SendClientMessage(playerid, -1, "Giao dich da duoc huy bo!");
				SendClientMessage(i, -1, "Giao dich da duoc huy bo!");				
				TradePlayer[i] = -1;
			}
		}
	}		
	return 1;
}
Dialog:DIALOG_FINDCAR(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new idd, string[200];
	if(PlayerInfo[playerid][pCarKey][listitem] == 0) return 1;
	
	idd = PlayerInfo[playerid][pCarKey][listitem];		
	if(CarInfo[idd][Spawned] == 0) return SendClientMessage(playerid, COLOR_GREY, "Phuong tien do chua duoc lay ra ngoai!");	
	if(CP[playerid] != 0) return Dialog_Show(playerid, DIALOG_CHECKPOINT, DIALOG_STYLE_MSGBOX, "Checkpoint", "Mot cham do dang hoat dong.\nBan co muon xoa no khong? Neu muon, hay chon 'Ok'.", "Ok", "Exit");
	new Float:vehx, Float:vehy, Float:vehz;
	GetVehiclePos(CarInfo[idd][Spawned], vehx, vehy, vehz);
	SetPlayerCheckpointEx(playerid, vehx, vehy, vehz, 3.0);
	new szZone[128];
	GetPlayer3DZone2(vehx, vehy, vehz, szZone, sizeof(szZone));
	format(string, sizeof(string), "Xe cua ban, %s, da duoc lay ra khoi kho va hien dang nam tai %s.", aVehicleNames[CarInfo[idd][cModel]-400], szZone);
	SendClientMessage(playerid, COLOR_GOLD, string);
	CP[playerid] = 53;
	return 1;
}
Dialog:DIALOG_GARAGE(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new idd, string[200];
	if(PlayerInfo[playerid][pCarKey][listitem] == 0) return 1;

	sVehicle[5][playerid] = idd = PlayerInfo[playerid][pCarKey][listitem];
	SetPVarInt(playerid, "VehicleSlot", listitem);
	if(CarInfo[idd][Spawned] != 0) strcat(string, "Thong tin\nDinh vi\nDau xe (/park)\nKeo ve (vi tri cuoi cung duoc biet)\nCat xe\nSua xe bi mac ket\nBan xe\nBao hiem\nNang cap len VIP - {FFFF00}1008 "#DIEMCAOCAP"{FFFFFF}\n{FF0000}Xoa mod xe");
	else if(CarInfo[idd][Spawned] == 0) strcat(string, "Thong tin\nDinh vi\nDau xe (/park)\nKeo xe (vi tri cuoi cung duoc biet)\nLay xe ra\nSua xe bi mac ket\nBan xe\nBao hiem\nNang cap len VIP - {FFFF00}1008 "#DIEMCAOCAP"{FFFFFF}\n{FF0000}Xoa mod xe");
	if(CarInfo[idd][Confiscated] == 1) strcat(string, "\n{FFFFFF}Thanh toan tien phat cho TTC");
	
	Dialog_Show(playerid, DIALOG_GARAGE1, DIALOG_STYLE_LIST, "Options", string, "Ok", "Back");
	return 1;
}
Dialog:VEHICLE_LEVELUP(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	SendClientMessage(playerid, -1, "He thong dang duoc thu nghiem. Truy cap dien dan de cap nhat thong tin moi nhat.");
	// new idd = GetPVarInt(playerid, "VehicleID"), string[200];
	// PlayerInfo[playerid][pPremiumPoints] -= 10;
	// Update(playerid, pPremiumPointsx);	
	// format(string, sizeof(string), "%s da nang cap chiec xe %s[id: %d] len VIP voi gia 1008 "#DIEMCAOCAP".", GetName(playerid), aVehicleNames[CarInfo[idd][cModel]-400], idd);
	// //InsertLog(playerid, string, LOG_SHOP);
	// CarInfo[idd][cLevel] += 1;
	// format(string, sizeof(string), "UPDATE `cars` SET `Level`='%d' WHERE `ID`='%d'", CarInfo[idd][cLevel], idd);
	// mysql_query(SQL, string);

	return 1;
}
Dialog:DIALOG_GARAGE1(playerid, response, listitem, inputtext[]) 
{
	if(!response) return ShowPlayerVehiclePlayerVehicle(playerid);
	new vsid = sVehicle[5][playerid], string[200], query[200];
	switch(listitem) {
		case 0: { // info
			new locktext[15];
			if(CarInfo[vsid][cLock] > 0) {locktext = "Khoa";}
			else {locktext = "Khong khoa";}
			format(string, sizeof(string), "Model: %s (%d)\nTrang thai: %s\nColor 1: %d\nColor 2: %d\nOdometer: %.2f km\nDiem bao hiem: %d\nPhi bao hiem: $%s", aVehicleNames[CarInfo[vsid][cModel]-400], CarInfo[vsid][Spawned], locktext, CarInfo[vsid][cColorOne], CarInfo[vsid][cColorTwo], CarInfo[vsid][KM], CarInfo[vsid][cPoints], FormatNumber(CarInfo[vsid][cTax]));
			Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Thong tin xe", string, "Close", "");		
		}
		case 1: { // find
			if(CarInfo[vsid][Spawned] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Phuong tien chua duoc lay ra ngoai!");
			if(CP[playerid] != 0) return Dialog_Show(playerid, DIALOG_CHECKPOINT, DIALOG_STYLE_MSGBOX, "Checkpoint", "Mot cham do dang hoat dong.\nBan co muon xoa no khong? Neu muon, hay chon 'Ok'.", "Ok", "Exit");
			new Float:vehx, Float:vehy, Float:vehz;
			GetVehiclePos(CarInfo[vsid][Spawned], vehx, vehy, vehz);
			SetPlayerCheckpointEx(playerid, vehx, vehy, vehz, 3.0);
			new szZone[128];
			GetPlayer3DZone2(vehx, vehy, vehz, szZone, sizeof(szZone));
			format(string, sizeof(string), "[Manage vehicle] Phuong tien cua ban, %s da duoc dinh vi va hien dang o %s.", aVehicleNames[CarInfo[vsid][cModel]-400], szZone);
			SendClientMessage(playerid, COLOR_GOLD, string);
			CP[playerid] = 53;
		}
		case 2: { // tow				
			if(GetPlayerCash(playerid) < 1000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co $1000!");
			if(IsVehicleOccupied(CarInfo[vsid][Spawned])) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ai do dang su dung phuong tien cua ban!");
			if(CarInfo[vsid][Confiscated] == 1) return SendClientMessage(playerid, -1, "Phuong tien cua ban da bi tich thu vi do sai cho! Thanh toan tien phat (hang cuoi cung cua menu).");
			if(CarInfo[vsid][Spawned] == 0) SpawnPlayerCar(vsid);
			else {
				if(IsAttached(CarInfo[vsid][Spawned])) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the su dung tinh nang tai thoi diem nay!");
				SetVehicleToRespawn(CarInfo[vsid][Spawned]);
			}
			SetTunning(vsid);
			GivePlayerCash(playerid, -1000);
			// BizzInfo[InBussines[playerid]][bTill] += 1000; 
			//need fix bug
			// mysql_format(SQL, string, sizeof(string), "UPDATE bizz SET Till = %d WHERE ID = %d",BizzInfo[InBussines[playerid]][bTill],30);
			// mysql_tquery(SQL, string, "", "");
			format(string, sizeof(string), "[Manage vehicle] Phuong tien cua ban, %s, da duoc respawned.", aVehicleNames[CarInfo[vsid][cModel]-400]);
			SendClientMessage(playerid, COLOR_GOLD, string);	
		}
		case 3: { // tow
			if(IsAttached(CarInfo[vsid][Spawned])) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the su dung tinh nang tai thoi diem nay!");
			if(GetPlayerCash(playerid) < 1000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co $1000!");
			if(IsVehicleOccupied(CarInfo[vsid][Spawned])) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ai do dang su dung phuong tien cua ban!");
			
			if(CarInfo[vsid][Spawned] != 0) {
				SetVehiclePosEx(playerid, CarInfo[vsid][Spawned], CarInfo[vsid][cLastPos][0], CarInfo[vsid][cLastPos][1], CarInfo[vsid][cLastPos][2]);
			}
			else SpawnPlayerCar(vsid);
			// GivePlayerCash(playerid, -1000);
			// BizzInfo[16][bTill] += 1000;
			// mysql_format(SQL, string, sizeof(string), "UPDATE bizz SET Till = %d WHERE ID = %d",BizzInfo[InBussines[playerid]][bTill],30);
			// mysql_tquery(SQL, string, "", "");					
			format(string, sizeof(string), "[Manage vehicle] Phuong tien cua ban, %s, da duoc respawned.", aVehicleNames[CarInfo[vsid][cModel]-400]);
			SendClientMessage(playerid, COLOR_GOLD, string);					
		}				
		case 4: { // despawn & spawn
			if(CarInfo[vsid][Spawned] == 0) {	
				if(CarInfo[vsid][Confiscated] == 1) return SendClientMessage(playerid, -1, "Phuong tien cua ban da bi tich thu vi do sai cho! Thanh toan tien phat (hang cuoi cung cua menu).");	
				SpawnPlayerCar(vsid);
				format(string, sizeof(string), "[Manage vehicle] Phuong tien cua ban, %s da duoc lay ra ngoai (%d).", aVehicleNames[CarInfo[vsid][cModel]-400], CarInfo[vsid][Spawned]);
				SendClientMessage(playerid, COLOR_GOLD, string);
			}
			else {
				if(IsAttached(CarInfo[vsid][Spawned])) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the su dung tinh nang tai thoi diem nay!");
				if(IsVehicleOccupied(CarInfo[vsid][Spawned])) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ai do dang su dung phuong tien cua ban!");
				DestroyPlayerCar(vsid);			
				format(string, sizeof(string), "[Manage vehicle] Phuong tien cua ban, %s da duoc cat di.", aVehicleNames[CarInfo[vsid][cModel]-400]);
				SendClientMessage(playerid, COLOR_GOLD, string);
			}
		}
		case 5: { // Debug
			if(CarInfo[vsid][Spawned] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Phuong tien chua duoc lay ra ngoai!");
			if(IsAttached(CarInfo[vsid][Spawned])) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the su dung tinh nang tai thoi diem nay!");
			if(IsVehicleOccupied(CarInfo[vsid][Spawned])) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ai do dang su dung phuong tien cua ban!");
			if(CP[playerid] != 0) return Dialog_Show(playerid, DIALOG_CHECKPOINT, DIALOG_STYLE_MSGBOX, "Checkpoint", "Mot cham do dang hoat dong.\nBan co muon xoa no khong? Neu muon, hay chon 'Ok'.", "Ok", "Exit");
			SetVehiclePosEx(playerid, CarInfo[vsid][Spawned], 1688.9471,1306.3896,10.9159);
			SetVehicleZAngleEx(CarInfo[vsid][Spawned], 359.3103);
			CP[playerid] = 53;
			if(IsAFLYCar(CarInfo[vsid][Spawned])) {
				format(string, sizeof(string), "Den cham do tren ban do de lay xe.", aVehicleNames[CarInfo[vsid][cModel]-400]);
				SendClientMessage(playerid, COLOR_YELLOW, string);
				SetVehiclePosEx(playerid, CarInfo[vsid][Spawned], -1649.1798, -159.0667, 17.3618);
				SetVehicleZAngleEx(CarInfo[vsid][Spawned], -44.1000);
				new randspawn = random(sizeof(HeliVehPos));
				SetVehiclePosEx(playerid, CarInfo[vsid][Spawned], HeliVehPos[randspawn][0], HeliVehPos[randspawn][1], HeliVehPos[randspawn][2]);
				SetVehicleZAngleEx(CarInfo[vsid][Spawned], 44.4000);
				SetPlayerCheckpointEx(playerid, HeliVehPos[randspawn][0], HeliVehPos[randspawn][1], HeliVehPos[randspawn][2], 5.0);
				return 1;
			}
			else if(IsABOATCar(CarInfo[vsid][Spawned])) {
				format(string, sizeof(string), "Den cham do tren ban do de lay xe.", aVehicleNames[CarInfo[vsid][cModel]-400]);
				SendClientMessage(playerid, COLOR_YELLOW, string);
				new randspawn = random(sizeof(BoatVehPos));
				SetVehiclePosEx(playerid, CarInfo[vsid][Spawned], BoatVehPos[randspawn][0], BoatVehPos[randspawn][1], BoatVehPos[randspawn][2]);
				SetVehicleZAngleEx(CarInfo[vsid][Spawned], -173.4001);
				SetPlayerCheckpointEx(playerid, BoatVehPos[randspawn][0], BoatVehPos[randspawn][1], BoatVehPos[randspawn][2], 5.0);
				return 1;
			}
			else {
				format(string, sizeof(string), "Den cham do tren ban do de lay xe.", aVehicleNames[CarInfo[vsid][cModel]-400]);
				SendClientMessage(playerid, COLOR_YELLOW, string);
				SetVehiclePosEx(playerid, CarInfo[vsid][Spawned], 2345.3784,1433.6382,42.8203);
				SetVehicleZAngleEx(CarInfo[vsid][Spawned], 173.2143);
				SetPlayerCheckpointEx(playerid, 2345.3784,1433.6382,42.8203, 5.0);
				return 1;
			}
		}
		case 6: { // sell
			if(TradeID[playerid] != -1) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the su dung thao tac nay khi ban dang trong mot cuoc giao dich!");
			if(CarInfo[vsid][Spawned] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Phuong tien chua duoc lay ra ngoai!");
			// if(CarInfo[vsid][cSpecial] == 1) return SendClientMessage(playerid, -1, "Khong the ban' xe ban nhan duoc cho nha nuoc!");
			new bool:isAtDealerShip = false;
			for(new i; i < sizeof(dealershipPos); i++) {
				if(IsPlayerInRangeOfPoint(playerid, 3, dealershipPos[i][0], dealershipPos[i][1], dealershipPos[i][2])) {
					isAtDealerShip = true;
					break;
				}
			}
			if(!isAtDealerShip) return SendClientMessage(playerid, COLOR_WHITE, "Ban phai o tai Dealership. Su dung /gps de xem no o dau.");
			if(IsAttached(CarInfo[vsid][Spawned])) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the su dung tinh nang tai thoi diem nay!");
			new value;
			value = CarPriceValid(CarInfo[vsid][cModel]) / 2;
			format(string, sizeof(string), "Ban co chac chan muon ban %s voi gia $%s khong?",aVehicleNames[CarInfo[vsid][cModel]-400],FormatNumber(value));
			Dialog_Show(playerid, DIALOG_SELLCAR, DIALOG_STYLE_MSGBOX, "Dealership", string, "Yes", "No");
			PlayerSellCar[playerid] = vsid;
			if(CP[playerid] == 43 || CP[playerid] == 53) { CP[playerid] = 0; DisablePlayerCheckpointEx(playerid); }
		}
		case 7: Dialog_Show(playerid, DIALOG_INSURANCE, DIALOG_STYLE_INPUT, "Bao hiem", "Nhap so diem bao hiem ma ban muon mua vao ben duoi.\nBan co the mua toi da 10 diem bao hiem va chi phi duoc tinh dua tren thue' phuong tien", "Mua", "Close");		
		case 8: {
			if(CarInfo[vsid][Spawned] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Phuong tien chua duoc lay ra ngoai!");
			if(valid_vip_vehicle(CarInfo[vsid][cModel]) == 0) return SendClientMessage(playerid, COLOR_GREY, "Khong the nang cap xe nay!");
			if(strlen(CarInfo[vsid][cText]) > 1) return SendClientMessage(playerid, -1, "Chiec xe nay da la VIP!");
			if(PlayerInfo[playerid][pPremiumPoints] < 1008) return SendClientMessage(playerid, -1, "Ban khong co du "#DIEMCAOCAP".");
			SetPVarInt(playerid, "VehicleID", vsid);
			Dialog_Show(playerid, DIALOG_UPGRADEVIP, DIALOG_STYLE_MSGBOX, "Upgrade to VIP Vehicle", "Ban co chac chan muon lam dieu nay khong?\nBan se phai tra 1008 "#DIEMCAOCAP".", "Yes", "No");
		}
		case 9: { // rem tunn
			if(CarInfo[vsid][Spawned] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Phuong tien chua duoc lay ra ngoai!");
			new car = CarInfo[vsid][Spawned];
			if(CarInfo[vsid][mod0] != 0) RemoveVehicleComponent(car,CarInfo[vsid][mod0]);
			if(CarInfo[vsid][mod1] != 0) RemoveVehicleComponent(car,CarInfo[vsid][mod1]);
			if(CarInfo[vsid][mod2] != 0) RemoveVehicleComponent(car,CarInfo[vsid][mod2]);
			if(CarInfo[vsid][mod3] != 0) RemoveVehicleComponent(car,CarInfo[vsid][mod3]);
			if(CarInfo[vsid][mod4] != 0) RemoveVehicleComponent(car,CarInfo[vsid][mod4]);
			if(CarInfo[vsid][mod5] != 0) RemoveVehicleComponent(car,CarInfo[vsid][mod5]);
			if(CarInfo[vsid][mod6] != 0) RemoveVehicleComponent(car,CarInfo[vsid][mod6]);
			if(CarInfo[vsid][mod7] != 0) RemoveVehicleComponent(car,CarInfo[vsid][mod7]);
			if(CarInfo[vsid][mod8] != 0) RemoveVehicleComponent(car,CarInfo[vsid][mod8]);
			if(CarInfo[vsid][mod9] != 0) RemoveVehicleComponent(car,CarInfo[vsid][mod9]);
			if(CarInfo[vsid][mod10] != 0) RemoveVehicleComponent(car,CarInfo[vsid][mod10]);
			if(CarInfo[vsid][mod11] != 0) RemoveVehicleComponent(car,CarInfo[vsid][mod11]);
			if(CarInfo[vsid][mod12] != 0) RemoveVehicleComponent(car,CarInfo[vsid][mod12]);
			if(CarInfo[vsid][mod13] != 0) RemoveVehicleComponent(car,CarInfo[vsid][mod13]);
			CarInfo[vsid][mod0] = 0;
			CarInfo[vsid][mod1] = 0;
			CarInfo[vsid][mod2] = 0;
			CarInfo[vsid][mod3] = 0;
			CarInfo[vsid][mod4] = 0;
			CarInfo[vsid][mod5] = 0;
			CarInfo[vsid][mod6] = 0;
			CarInfo[vsid][mod7] = 0;
			CarInfo[vsid][mod8] = 0;
			CarInfo[vsid][mod9] = 0;
			CarInfo[vsid][mod10] = 0;
			CarInfo[vsid][mod11] = 0;
			CarInfo[vsid][mod12] = 0;
			CarInfo[vsid][mod13] = 0;
			CarInfo[vsid][paintjob] = 3;
			ChangeVehiclePaintjob(CarInfo[vsid][Spawned], 3);
			mysql_format(SQL, query, sizeof(query), "UPDATE cars SET mod0='%d' WHERE id=%d",CarInfo[vsid][mod0],vsid);
			mysql_tquery(SQL, query, "", "");
			mysql_format(SQL, query, sizeof(query), "UPDATE cars SET mod1='%d' WHERE id=%d",CarInfo[vsid][mod1],vsid);
			mysql_tquery(SQL, query, "", "");
			mysql_format(SQL, query, sizeof(query), "UPDATE cars SET mod2='%d' WHERE id=%d",CarInfo[vsid][mod2],vsid);
			mysql_tquery(SQL, query, "", "");
			mysql_format(SQL, query, sizeof(query), "UPDATE cars SET mod3='%d' WHERE id=%d",CarInfo[vsid][mod3],vsid);
			mysql_tquery(SQL, query, "", "");
			mysql_format(SQL, query, sizeof(query), "UPDATE cars SET mod4='%d' WHERE id=%d",CarInfo[vsid][mod4],vsid);
			mysql_tquery(SQL, query, "", "");
			mysql_format(SQL, query, sizeof(query), "UPDATE cars SET mod5='%d' WHERE id=%d",CarInfo[vsid][mod5],vsid);
			mysql_tquery(SQL, query, "", "");
			mysql_format(SQL, query, sizeof(query), "UPDATE cars SET mod6='%d' WHERE id=%d",CarInfo[vsid][mod6],vsid);
			mysql_tquery(SQL, query, "", "");
			mysql_format(SQL, query, sizeof(query), "UPDATE cars SET mod7='%d' WHERE id=%d",CarInfo[vsid][mod7],vsid);
			mysql_tquery(SQL, query, "", "");
			mysql_format(SQL, query, sizeof(query), "UPDATE cars SET mod8='%d' WHERE id=%d",CarInfo[vsid][mod8],vsid);
			mysql_tquery(SQL, query, "", "");
			mysql_format(SQL, query, sizeof(query), "UPDATE cars SET mod9='%d' WHERE id=%d",CarInfo[vsid][mod9],vsid);
			mysql_tquery(SQL, query, "", "");
			mysql_format(SQL, query, sizeof(query), "UPDATE cars SET mod10='%d' WHERE id=%d",CarInfo[vsid][mod10],vsid);
			mysql_tquery(SQL, query, "", "");
			mysql_format(SQL, query, sizeof(query), "UPDATE cars SET mod11='%d' WHERE id=%d",CarInfo[vsid][mod11],vsid);
			mysql_tquery(SQL, query, "", "");
			mysql_format(SQL, query, sizeof(query), "UPDATE cars SET mod12='%d' WHERE id=%d",CarInfo[vsid][mod12],vsid);
			mysql_tquery(SQL, query, "", "");
			mysql_format(SQL, query, sizeof(query), "UPDATE cars SET mod13='%d' WHERE id=%d",CarInfo[vsid][mod13],vsid);
			mysql_tquery(SQL, query, "", "");
			mysql_format(SQL, query, sizeof(query), "UPDATE cars SET paintjob='%d' WHERE id=%d",CarInfo[vsid][paintjob],vsid);
			mysql_tquery(SQL, query, "", "");					
		}
		case 10: {
			if(CarInfo[vsid][Confiscated] == 0) return 1;
			if(GetPlayerCash(playerid) < CarInfo[vsid][cTax]) return SendClientMessage(playerid, -1, "Ban khong co du tien!");
			Dialog_Show(playerid, DIALOG_TAX, DIALOG_STYLE_MSGBOX, "Thanh toan tien phat",
			"Ban co chac muon tra tien phat vi dau xe trai phep khong?\nNeu ban thay rang minh khong lam sai, hay nop don kien o tren forum.", "Yes", "No");
		}				
	}		
	return 1;
}
Dialog:DIALOG_UPGRADEVIP(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new idd = GetPVarInt(playerid, "VehicleID"), string[200];
	if(CarInfo[idd][Spawned] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Phuong tien chua duoc lay ra ngoai!");
	if(valid_vip_vehicle(CarInfo[idd][cModel]) == 0) return SendClientMessage(playerid, COLOR_GREY, "Khong the nang cap xe nay!");
	if(PlayerInfo[playerid][pPremiumPoints] < 1008) return SendClientMessage(playerid, -1, "Ban khong co du "#DIEMCAOCAP".");		
	if(IsABike2(CarInfo[idd][Spawned])) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the nang cap chiec xe nay!");
	PlayerInfo[playerid][pPremiumPoints] -= 1008;
	Update(playerid, pPremiumPointsx);	
	SendClientMessage(playerid, COLOR_YELLOW, "* Chuc mung! Ban da nang cap thanh cong chiec xe cua minh len VIP.");
	format(string, sizeof(string), "%s da nang cap chiec xe %s[id: %d] len VIP voi gia 1008 "#DIEMCAOCAP".", GetName(playerid), aVehicleNames[CarInfo[idd][cModel]-400], idd);
	//InsertLog(playerid, string, LOG_SHOP);	
	Log("logs/car.log", string);			
	format(string, sizeof(string), "UPDATE `cars` SET `Text`='%s' WHERE `ID`='%d'", GetName(playerid), idd);
	mysql_query(SQL, string);
	format(CarInfo[idd][cText], 32, GetName(playerid));
	attach_vip_text(idd);
	return 1;
}
Dialog:DIALOG_TAX(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new vsid = sVehicle[5][playerid], string[200];
	GivePlayerCash(playerid, -CarInfo[vsid][cTax]);
	CarInfo[vsid][Confiscated] = 0;

	format(string, sizeof(string), "UPDATE `cars` SET `Confiscated`='0' WHERE `ID`='%d'", vsid);
	mysql_query(SQL, string);
	format(string, sizeof(string), "**(( TTC Dispatch: %s (%d) da tra tien phat $%s de chuoc xe cua minh %d ))**", GetName(playerid), playerid, FormatNumber(CarInfo[vsid][cTax]), vsid);
	SendFactionMessage(TOWTRUCK_FACTION_ID, COLOR_LIGHTBLUE, string);
	format(string, sizeof(string), "Ban da tra tien phat $%s vi dau xe bat hop phap. Hay luu y!", FormatNumber(CarInfo[vsid][cTax]));
	SendClientMessage(playerid, COLOR_MONEY, string);
	DynamicFactions[7][fBank] += CarInfo[vsid][cTax]; 
	return 1;
}
Dialog:DIALOG_INSURANCE(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new vsid = sVehicle[5][playerid], string[200];
	new points = strval(inputtext);
	if(points < 1) return 1;
	if(points + CarInfo[vsid][cPoints] > 10) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the co nhieu hon 10 diem bao hiem!");
	CarInfo[vsid][cPoints] += points;
	format(string, sizeof(string), "(+) Ban da mua %d diem bao hiem voi gia $%s.", points, FormatNumber(CarInfo[vsid][cTax]*points));
	SendClientMessage(playerid, COLOR_MONEY, string);
	GivePlayerCash(playerid, -points*CarInfo[vsid][cTax]);
	format(string, sizeof(string), "UPDATE `cars` SET `Points`='%d' WHERE `ID`='%d'", CarInfo[vsid][cPoints], vsid);
	mysql_query(SQL, string);
	return 1;
}
// COMMANDS
CMD:checkvehicles(playerid, params[]) {
	new id, string[180];
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;
	if(sscanf(params, "u", id)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/checkvehicles <playerid/name>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong dang nhap.");
	
	format(string, sizeof(string), "-- %s's (%d) vehicles --", GetName(id), id);
	SendClientMessage(playerid, COLOR_WHITE, string);
	new colors[64];
	for(new i = 0; i < 11; i++) {//cap nhat max slot
		if(PlayerInfo[id][pCarKey][i] != 0) {
			new car = PlayerInfo[id][pCarKey][i];
			format(colors, sizeof(colors), "%d, %d", CarInfo[car][cColorOne], CarInfo[car][cColorTwo]);		
			format(string, sizeof(string), "(%d) Vehicle: %s [%d] | ID: %d | Colors: %s", i, aVehicleNames[CarInfo[car][cModel]-400], car, CarInfo[car][Spawned], colors);
			SendClientMessage(playerid, COLOR_LGREEN, string);	
		}		
	}
	return 1;
}


hook OnPlayerDisconnect(playerid, reason)
{//cap nhat max slot
	for(new i = 0; i < 11; i++) if(PlayerInfo[playerid][pCarKey][i] > 0 && CarInfo[PlayerInfo[playerid][pCarKey][i]][Spawned] > 0) DespawnVehicle(CarInfo[PlayerInfo[playerid][pCarKey][i]][Spawned]);
	return 1;
}
hook OnPlayerClickTextDraw(playerid, Text:clickedid) 
{	
	new str[15];
	if(clickedid == HiddTD[0]) {
		if(pColor1[playerid] == 128) pColor1[playerid] = 256;
		pColor1[playerid] --;
		ChangeVehicleColorEx(GetPlayerVehicleID(playerid), pColor1[playerid], pColor2[playerid]);
		format(str, sizeof(str), "Color 1: %d", pColor1[playerid]);
		PlayerTextDrawSetString(playerid, HiddTDs[0], str);
		PlayerTextDrawShow(playerid, HiddTDs[0]);
		return ~0;
	}
	else if(clickedid == HiddTD[1]) {
		if(pColor1[playerid] == 255) pColor1[playerid] = 127;
		pColor1[playerid] ++;
		ChangeVehicleColorEx(GetPlayerVehicleID(playerid), pColor1[playerid], pColor2[playerid]);
		format(str, sizeof(str), "Color 1: %d", pColor1[playerid]);
		PlayerTextDrawSetString(playerid, HiddTDs[0], str);
		PlayerTextDrawShow(playerid, HiddTDs[0]);
		return ~0;
	}
	else if(clickedid == HiddTD[3]) {
		if(pColor2[playerid] == 128) pColor2[playerid] = 256;
		pColor2[playerid] --;
		ChangeVehicleColorEx(GetPlayerVehicleID(playerid), pColor1[playerid], pColor2[playerid]);
		format(str, sizeof(str), "Color 2: %d", pColor2[playerid]);
		PlayerTextDrawSetString(playerid, HiddTDs[2], str);
		PlayerTextDrawShow(playerid, HiddTDs[2]);
		return ~0;
	}
	else if(clickedid == HiddTD[4]) {
		if(pColor2[playerid] == 255) pColor2[playerid] = 127;
		pColor2[playerid] ++;
		ChangeVehicleColorEx(GetPlayerVehicleID(playerid), pColor1[playerid], pColor2[playerid]);
		format(str, sizeof(str), "Color 2: %d", pColor2[playerid]);
		PlayerTextDrawSetString(playerid, HiddTDs[2], str);
		PlayerTextDrawShow(playerid, HiddTDs[2]);
		return ~0;
	}
	else if(clickedid == HiddTD[2]) {
		new idd = pCar[playerid];
		ChangeVehicleColorEx(GetPlayerVehicleID(playerid), CarInfo[idd][cColorOne], CarInfo[idd][cColorTwo]);
    	SetCameraBehindPlayer(playerid), SetPlayerInterior(playerid, pInteriorID[playerid]), SetVehiclePosEx(playerid, GetPlayerVehicleID(playerid), pPos[playerid][0], pPos[playerid][1], pPos[playerid][2]);
		SetPlayerVirtualWorld(playerid, 0);
		SetVehicleVirtualWorld(GetPlayerVehicleID(playerid), 0);
		TextDrawHideForPlayer(playerid, HiddTD[0]);
		TextDrawHideForPlayer(playerid, HiddTD[1]);
		TextDrawHideForPlayer(playerid, HiddTD[2]);
		TextDrawHideForPlayer(playerid, HiddTD[3]);
		TextDrawHideForPlayer(playerid, HiddTD[4]);
		PlayerTextDrawHide(playerid, HiddTDs[0]);
		PlayerTextDrawHide(playerid, HiddTDs[1]);
		PlayerTextDrawHide(playerid, HiddTDs[2]);
		InShop[playerid] = 0;
		CancelSelectTextDraw(playerid);
		return ~0;
	}
	return 1;
}
TotalSlots(playerid) {
	new x; 
	if(PlayerInfo[playerid][pCarKey][0] >= 0) x++;
	if(PlayerInfo[playerid][pCarKey][1] >= 0) x++;
	if(PlayerInfo[playerid][pCarKey][2] >= 0) x++;
	if(PlayerInfo[playerid][pCarKey][3] >= 0) x++;
	if(PlayerInfo[playerid][pCarKey][4] >= 0) x++;
	if(PlayerInfo[playerid][pCarKey][5] >= 0) x++;

	if(PlayerInfo[playerid][pCarKey][6] >= 0 && PlayerInfo[playerid][pSlot][0] == 1) x++;
	if(PlayerInfo[playerid][pCarKey][7] >= 0 && PlayerInfo[playerid][pSlot][1] == 1) x++;
	if(PlayerInfo[playerid][pCarKey][8] >= 0 && PlayerInfo[playerid][pSlot][2] == 1) x++;
	if(PlayerInfo[playerid][pCarKey][9] >= 0 && PlayerInfo[playerid][pSlot][3] == 1) x++;
	if(PlayerInfo[playerid][pCarKey][10] >= 0 && PlayerInfo[playerid][pSlot][4] == 1) x++;
	
	
	//if(PlayerInfo[playerid][pVip] == 0) x -= 2; //TODO: increase veh slot if higher vip
	switch(PlayerInfo[playerid][pVip])// 0 1 2 3 -- 3 4 5
	{
		case 0: x -=3;
		case 1: x -=2;
		case 2: x -=1;
	}
	return x;
}
ShowPlayerVehiclePlayerVehicle(playerid) {
    new szTitle[40], szDialog2[1300], vstatus[200];
    if(GetVehicles(playerid) == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong co phuong tien ca nhan!");
    format(szTitle, sizeof(szTitle), "Phuong tien cua ban (%d/%d)", GetVehicles(playerid), GetSlots(playerid));
    strcat(szDialog2, "Model\tTrang thai\tID\n");

	new const hadVehicle = GetVehicles(playerid);
	// new const maxVehicleSlot = GetSlots(playerid);
	//TODO: Show [ trong - co san khi dat cap xx]
	new loaded;
    for(new i = 0; i < 11; i++) { // to max slot, break when get enough hadVehicle
        if(PlayerInfo[playerid][pCarKey][i] != 0) {
			loaded++;
            new car =  PlayerInfo[playerid][pCarKey][i];
            if(IsVehicleOccupied(CarInfo[car][Spawned])) format(vstatus, sizeof(vstatus), "{FFFFFF}%s\t{FFFF00}dang ban{FFFFFF}\t%d\n", aVehicleNames[CarInfo[car][cModel]-400],CarInfo[car][Spawned]);
            else if(CarInfo[car][Spawned] > 0) format(vstatus, sizeof(vstatus), "{FFFFFF}%s\t{26B309}ben ngoai{FFFFFF}\t%d\n", aVehicleNames[CarInfo[car][cModel]-400],CarInfo[car][Spawned]);
            else format(vstatus, sizeof(vstatus), "{FFFFFF}%s\t{FF0000}trong kho{FFFFFF}\tchua duoc lay ra ngoai\n", aVehicleNames[CarInfo[car][cModel]-400]);

            strcat(szDialog2, vstatus);
        }
        else {
			strcat(szDialog2, "{FFD857}<slot trong>\n");
			sVehicle[i][playerid] = 0;
		}
		if(hadVehicle == loaded) break;
    }
    Dialog_Show(playerid, DIALOG_GARAGE, DIALOG_STYLE_TABLIST_HEADERS, szTitle, szDialog2, "Ok", "Exit");
    return 1;
}
GetVehicles(playerid) {
	new x;
	for(new i; i < 11; i++) {//cap nhat max slot
		if(PlayerInfo[playerid][pCarKey][i] != 0) x++;
	}
	return x;
}





GetSlots(playerid) { // Get vehicle slot that a player can have 
	new x = 2; // default for every player
	for(new i; i < 5; i++) {
		if(PlayerInfo[playerid][pSlot][i] == 1) x++;
	}
	for(new i = 3; i <= 5; i++) {
		if(PlayerInfo[playerid][pLevel] >= 5*i) x++;
	}
	// if(PlayerInfo[playerid][pCarKey][5] >= 0 && PlayerInfo[playerid][pSlot][0] == 1) x ++;
	// if(PlayerInfo[playerid][pCarKey][6] >= 0 && PlayerInfo[playerid][pSlot][1] == 1) x ++;
	// if(PlayerInfo[playerid][pCarKey][7] >= 0 && PlayerInfo[playerid][pSlot][2] == 1) x ++;
	// if(PlayerInfo[playerid][pCarKey][8] >= 0 && PlayerInfo[playerid][pSlot][3] == 1) x ++;
	// if(PlayerInfo[playerid][pCarKey][9] >= 0 && PlayerInfo[playerid][pSlot][4] == 1) x ++;
	return x;
}	
UpdateSlots(playerid) {
	new query[150];
	format(query, sizeof(query), 
		"UPDATE `users` SET `Slot1`='%d', `Slot2`='%d', `Slot3`='%d', `Slot4`='%d', `Slot5`='%d' WHERE `ID`='%d'",
		PlayerInfo[playerid][pSlot][0], PlayerInfo[playerid][pSlot][1], PlayerInfo[playerid][pSlot][2], PlayerInfo[playerid][pSlot][3], PlayerInfo[playerid][pSlot][4], PlayerInfo[playerid][pSQLID]);
	mysql_query(SQL, query, false);	
	return 1;
}
FindCSlot(playerid) {
	for(new i = 0; i < 11; i++) {//cap nhat max slot
		if(PlayerInfo[playerid][pCarKey][i] == 0) return i+1;
	}							
	return -1;
}


CMD:v(playerid, params[]) {
	if(strlen(PlayerInfo[playerid][pPin]) != 0 && PlayerInfo[playerid][pPinLogged] == 0) {
		SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay vi ban chua dang nhap PIN.");
		SendClientMessage(playerid, COLOR_GREY, "De xac thuc, su dung '/loginpin'!");
		return 1;
	}
	return ShowPlayerVehiclePlayerVehicle(playerid);	
} 
GiveVehicle(playerid, modelid, bool:buyatDealership = false) {
	CP[playerid] = 53;
	new string[180];	

	new idd;
	format(string, sizeof(string), "INSERT INTO cars (Model) VALUES (%d)", modelid);
	new Cache: result = mysql_query(SQL, string);
	new i = cache_insert_id();
	cache_delete(result);	
	idd = i;
	
	new key = FindCSlot(playerid);
	PlayerInfo[playerid][pCarKey][key-1] = idd;
	mysql_format(SQL, string, sizeof(string), "UPDATE users SET CarKey%d='%d' WHERE `ID`='%d' LIMIT 1", key, PlayerInfo[playerid][pCarKey][key-1], PlayerInfo[playerid][pSQLID]);
	mysql_pquery(SQL, string);

	CarInfo[idd][Userid] = PlayerInfo[playerid][pSQLID];
	CarInfo[idd][cID] = idd;
	CarInfo[idd][cModel] = modelid;
	CarInfo[idd][cValue] = D_Vehicles[D_Model[modelid-400]][dPrice];
	CarInfo[idd][cSpecial] = 0;

	if(!buyatDealership) {
		CarInfo[idd][cLocationx] = 2333.3838;	CarInfo[idd][cLocationy] = 1501.0060;	CarInfo[idd][cLocationz] = 42.8203;	
		CarInfo[idd][cAngle] = 179.2304; //chu y: spawn o tren noc nha LV
		CarInfo[idd][cSpecial] = 0;
		CarInfo[idd][cValue] = 1;
	}
	else {
		CP[playerid] = 53;
		if(IsABoat(CarInfo[idd][cModel])) {
			CarInfo[idd][cLocationx] = 219.4101; CarInfo[idd][cLocationy] = -1898.7161; CarInfo[idd][cLocationz] = -0.1303;
			CarInfo[idd][cAngle] = 359.9950;
			SetPlayerCheckpointEx(playerid,219.4101,-1898.7161,-0.1303,5.0);
		}
		else if(IsAPlane(CarInfo[idd][cModel])) {
			CarInfo[idd][cLocationx] = 2060.6848;	CarInfo[idd][cLocationy] = -2309.8992;	CarInfo[idd][cLocationz] =  15.8429;
			CarInfo[idd][cAngle] = 0.0000;
			SetPlayerCheckpointEx(playerid,2060.6848,-2309.8992,15.8429,5.0);
		}
		else {
			new rand = random(5)+1;
			CarInfo[idd][cLocationx] = 1269.0233+(5.0*float(rand));	CarInfo[idd][cLocationy] = -1424.9340;	CarInfo[idd][cLocationz] = 13.8;
			CarInfo[idd][cAngle] = 180.0;
			SetPlayerCheckpointEx(playerid,1269.0233+(5.0*float(rand)),-1424.9340,13.2330,5.0);
		}
		finishAchievement(playerid, 1);
	}

	CarInfo[idd][cColorOne] = 1;	CarInfo[idd][cColorTwo] = 1;
	strmid(CarInfo[idd][cOwner], PlayerInfo[playerid][pUsername], 0, strlen(PlayerInfo[playerid][pUsername]), 255);
	strmid(CarInfo[idd][cLicense], "NewCar", 0, 6, 255);
	CarInfo[idd][cAlarm] = 0;	CarInfo[idd][cLock] = 0;
	CarInfo[idd][mod0] = 0;		CarInfo[idd][mod1] = 0;		CarInfo[idd][mod2] = 0;		CarInfo[idd][mod3] = 0;
	CarInfo[idd][mod4] = 0;		CarInfo[idd][mod5] = 0;		CarInfo[idd][mod6] = 0;		CarInfo[idd][mod7] = 0;
	CarInfo[idd][mod8] = 0;		CarInfo[idd][mod9] = 0;		CarInfo[idd][mod10] = 0;	CarInfo[idd][mod11] = 0;
	CarInfo[idd][mod12] = 0;	CarInfo[idd][mod13] = 0;	CarInfo[idd][paintjob] = 3;	CarInfo[idd][KM] = 0;
	
	CarInfo[idd][cPoints] = 5; CarInfo[idd][cTax] = 50;
	CarInfo[idd][cSlotSung][0] = 0; 
	CarInfo[idd][cSlotSung][1] = 0;
	CarInfo[idd][cSlotAmmo][0] = 0; CarInfo[idd][cSlotAmmo][1] = 0;
	saveCar(idd);
	// mysql_tquery(SQL, string, "", "");

	CarInfo[idd][Spawned] = CreateVehicleEx(CarInfo[idd][cModel],CarInfo[idd][cLocationx],CarInfo[idd][cLocationy],CarInfo[idd][cLocationz],CarInfo[idd][cAngle],CarInfo[idd][cColorOne],CarInfo[idd][cColorTwo],-1);
	new e,l,aa,d,b,bo,o;
	GetVehicleParamsEx(CarInfo[idd][Spawned],e,l,aa,d,b,bo,o);
	SetVehicleParamsEx(CarInfo[idd][Spawned],e,l,aa,1,b,bo,o);
	SetVehicleNumberPlate(CarInfo[idd][Spawned],CarInfo[idd][cLicense]);
	CarInfo[idd][cLock] = 1;
	
	format(string, sizeof(string), "%s: %s vua mua mot chiec %s[%d].", buyatDealership ? "[DEALERSHIP]" : "[SHOP]", GetName(playerid), aVehicleNames[CarInfo[idd][cModel]-400], idd);
	SendAdminMessage(COLOR_YELLOW, string, 1); 
	Log("logs/car.log", string);
		
	VehicleOwned[CarInfo[idd][Spawned]] = CarInfo[idd][Spawned];
	VehicleSQL[CarInfo[idd][Spawned]] = idd;
	
	mysql_format(SQL, string, sizeof(string), "UPDATE cars SET Spawned='%d' WHERE ID=%d", CarInfo[idd][Spawned], idd);
	mysql_tquery(SQL, string, "", "");
	return idd;
}
GiveVehicle2(playerid, modelid) {
	CP[playerid] = 53;
	new string[180];	
	new idd;
	format(string, sizeof(string), "INSERT INTO cars (Model) VALUES (%d)", modelid);
	new Cache: result = mysql_query(SQL, string);
	new i = cache_insert_id();
	cache_delete(result);	
	idd = i;

	new key = FindCSlot(playerid);
	PlayerInfo[playerid][pCarKey][key-1] = idd;
	mysql_format(SQL, string, sizeof(string), "UPDATE users SET CarKey%d='%d' WHERE `ID`='%d' LIMIT 1", key, PlayerInfo[playerid][pCarKey][key-1], PlayerInfo[playerid][pSQLID]);
	mysql_tquery(SQL, string, "", "");
					
	CarInfo[idd][Userid] = PlayerInfo[playerid][pSQLID];
	CarInfo[idd][cID] = idd;
	CarInfo[idd][cModel] = modelid;
	CarInfo[idd][cValue] = 1;
	CarInfo[idd][cSpecial] = 1;
	new Float: Pos[3];
	GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
	CarInfo[idd][cLocationx] = Pos[0];	CarInfo[idd][cLocationy] = Pos[1];	CarInfo[idd][cLocationz] = Pos[2];
	CarInfo[idd][cColorOne] = 1;	CarInfo[idd][cColorTwo] = 1;
	strmid(CarInfo[idd][cOwner], PlayerInfo[playerid][pUsername], 0, strlen(PlayerInfo[playerid][pUsername]), 255);
	strmid(CarInfo[idd][cLicense], "NewCar", 0, 6, 255);
	CarInfo[idd][cAlarm] = 0;	CarInfo[idd][cLock] = 0;
	CarInfo[idd][mod0] = 0;		CarInfo[idd][mod1] = 0;		CarInfo[idd][mod2] = 0;		CarInfo[idd][mod3] = 0;
	CarInfo[idd][mod4] = 0;		CarInfo[idd][mod5] = 0;		CarInfo[idd][mod6] = 0;		CarInfo[idd][mod7] = 0;
	CarInfo[idd][mod8] = 0;		CarInfo[idd][mod9] = 0;		CarInfo[idd][mod10] = 0;	CarInfo[idd][mod11] = 0;
	CarInfo[idd][mod12] = 0;	CarInfo[idd][mod13] = 0;	CarInfo[idd][paintjob] = 3;	CarInfo[idd][KM] = 0;
	
	format(CarInfo[idd][cText], 16, GetName(playerid));
	
	CarInfo[idd][cPoints] = 5; CarInfo[idd][cTax] = 50;
	CarInfo[idd][cSlotSung][0] = 0; 
	CarInfo[idd][cSlotSung][1] = 0;
	CarInfo[idd][cSlotAmmo][0] = 0; CarInfo[idd][cSlotAmmo][1] = 0;
	saveCar(idd);

	CarInfo[idd][Spawned] = CreateVehicleEx(CarInfo[idd][cModel],CarInfo[idd][cLocationx],CarInfo[idd][cLocationy],CarInfo[idd][cLocationz],CarInfo[idd][cAngle],CarInfo[idd][cColorOne],CarInfo[idd][cColorTwo],-1);
	nameobject[CarInfo[idd][Spawned]] = CreateDynamicObject(19327, -2597.0762, -2638.4270, -5.3536, -87.6999, 90.4001, -87.1805);
	SetDynamicObjectMaterialText(nameobject[CarInfo[idd][Spawned]], 0, GetName(playerid), OBJECT_MATERIAL_SIZE_256x128, "Comic Sans MS", 30, 1, -1, 0, 1);
	AttachDynamicObjectToVehicle(nameobject[CarInfo[idd][Spawned]], CarInfo[idd][Spawned], 0.0, -1.9, 0.3, 270.0, 0.0, 0.0);	
		
	new e,l,aa,d,b,bo,o;
	GetVehicleParamsEx(CarInfo[idd][Spawned],e,l,aa,d,b,bo,o);
	SetVehicleParamsEx(CarInfo[idd][Spawned],e,l,aa,1,b,bo,o);
	SetVehicleNumberPlate(CarInfo[idd][Spawned],CarInfo[idd][cLicense]);
	CarInfo[idd][cLock] = 1;
	
	format(string, sizeof(string), "%s da nhan duoc mot %s[%d] - VIP.", GetName(playerid), aVehicleNames[CarInfo[idd][cModel]-400], idd);
	SendAdminMessage(COLOR_YELLOW, string, 1); 
	Log("logs/car.log", string);
	
	mysql_format(SQL, string, sizeof(string), "UPDATE cars SET Spawned='%d', `Text`='%s' WHERE ID=%d", CarInfo[idd][Spawned], GetName(playerid), idd);
	mysql_tquery(SQL, string, "", "");
	
	PutPlayerInVehicleEx(playerid, CarInfo[idd][Spawned], 0);
	return 1;
}

CMD:givevehicle(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new id, model, string[100];
	if(sscanf(params, "ui", id, model)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/givevehicle <playerid/name> <model (411-infernus,541-bullet,560-sultan)>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	// if(GetSlots(id) == GetVehicles(id) && PlayerInfo[id][pVip] > 0) return SendClientMessage(playerid, -1, "Nguoi choi da het slot xe!"); 
	// else if(GetSlots(id) == 8 && PlayerInfo[id][pVip] == 0) return SendClientMessage(playerid, -1, "Nguoi choi da het slot xe! Ho van co the mua mot slot tai /shop.");
	// else 
	if(GetSlots(id) == GetVehicles(id)) return SendClientMessage(playerid, -1, "Nguoi choi da het slot xe! Ho van co the mua mot slot tai /shop.");
	
	format(string, sizeof(string), "* Ban da nhan duoc mot %s tu Admin %s.", aVehicleNames[model-400], GetName(playerid));
	SendClientMessage(id, COLOR_YELLOW, string);
	format(string, sizeof(string), "* Ban da gui cho %s mot %s.", GetName(id), aVehicleNames[model-400]);
	SendClientMessage(playerid, COLOR_YELLOW, string);				
	GiveVehicle(id, model);	
	return 1;
}
CMD:givevehicle2(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new id, model, string[180];
	if(sscanf(params, "ui", id, model)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/givevehicle <playerid/name> <model (411-infernus,541-bullet,560-sultan)>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	// if(GetSlots(id) == GetVehicles(id) && PlayerInfo[id][pVip] > 0) return SendClientMessage(playerid, -1, "Nguoi choi da het slot xe!"); 
	// else if(GetSlots(id) == 8 && PlayerInfo[id][pVip] == 0) return SendClientMessage(playerid, -1, "Nguoi choi da het slot xe! Ho van co the mua mot slot tai /shop.");
	// else 
	if(GetSlots(id) == GetVehicles(id)) return SendClientMessage(playerid, -1, "Nguoi choi da het slot xe! Ho van co the mua mot slot tai /shop.");
	
	format(string, sizeof(string), "* Ban da nhan duoc mot %s tu Admin %s.", aVehicleNames[model-400], GetName(playerid));
	SendClientMessage(id, COLOR_YELLOW, string);
	format(string, sizeof(string), "* Ban da gui cho %s mot %s.", GetName(id), aVehicleNames[model-400]);
	SendClientMessage(playerid, COLOR_YELLOW, string);				
	GiveVehicle2(id, model);	
	return 1;
}