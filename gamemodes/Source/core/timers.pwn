#include <YSI_Coding\y_timers>
timer HideTextdraw[5000](playerid) {
	PlayerTextDrawHide(playerid, InfosTD);
	return 1;
}
timer traoqua_spray[900000](clanid) {
	new sodiaban = GetClanTurfs(clanid);
	new string[100];
	if(sodiaban >= 3 && sodiaban < 6) {
		ClanInfo[clanid][clVatLieu] += 15000;
		ClanInfo[clanid][clMaTuy] += 20;
		ClanInfo[clanid][clMoney] += 3000000;
		format(string, sizeof string, "[CLAN] Anh Em Da Kiem Duoc 15,000 Vat Lieu, 20 Ma Tuy, $3.000.000 Ve Ket Sat");
	}
	else if(sodiaban >= 6 && sodiaban < 10) {
		ClanInfo[clanid][clVatLieu] += 35000;
		ClanInfo[clanid][clMaTuy] += 40;
		ClanInfo[clanid][clMoney] += 7000000;
		format(string, sizeof string, "[CLAN] Anh Em Da Kiem Duoc 35,000 Vat Lieu, 40 Ma Tuy, $7.000.000 Ve Ket Sat");
	}
	else if(sodiaban >= 10 && sodiaban < 15) {
		ClanInfo[clanid][clVatLieu] += 55000;
		ClanInfo[clanid][clMaTuy] += 60;
		ClanInfo[clanid][clMoney] += 11000000;
		format(string, sizeof string, "[CLAN] Anh Em Da Kiem Duoc 55,000 Vat Lieu, 60 Ma Tuy, $11.000.000 Ve Ket Sat");
	}
	else if(sodiaban >= 15 && sodiaban < 20) {
		ClanInfo[clanid][clVatLieu] += 100000;
		ClanInfo[clanid][clMaTuy] += 100;
		ClanInfo[clanid][clMoney] += 15000000;
		format(string, sizeof string, "[CLAN] Anh Em Da Kiem Duoc 100,000 Vat Lieu, 100 Ma Tuy, $15.000.000 Ve Ket Sat");
	}
	else if(sodiaban >= 20) {
		ClanInfo[clanid][clVatLieu] += 150000;
		ClanInfo[clanid][clMaTuy] += 150;
		ClanInfo[clanid][clMoney] += 30000000;
		format(string, sizeof string, "[CLAN] Anh Em Da Kiem Duoc 150,000 Vat Lieu, 150 Ma Tuy, $30.000.000 Ve Ket Sat");
	}
	SendClanMessage(clanid,string);
	SendClanMessage(clanid,"[CLAN] Anh Em Vat Va Roi");
	save_ketclan(clanid);
	return 1;
}
timer Advertisment[60000](playerid) {
	if(IsPlayerConnected(playerid) && AdTimer[playerid] != Timer:0) {
		new string[1024];
		format(string, sizeof(string), "Quang cao cua %s (SDT: {FFFFFF}%d{00D900}): %s",GetName(playerid),PlayerInfo[playerid][pPhone],AdText[playerid]);
		SendMessage(0x00D900FF, string);
		AdTimer[playerid] = Timer:0;
	}
	return 1;
}
timer ShowMine[5000](playerid) {
	if(GetPVarInt(playerid, "StartedGame") == 1 && IsPlayerLogged[playerid] == 1) {
		ShowCasinoTDs(playerid);
		PlayerTextDrawSetString(playerid, CasinoPTD[31], "Lan choi: ~g~0~w~~h~~n~Tien nhan duoc: ~g~0");	
	}					
	return 1;
}
timer HideHPAlert[1000](playerid) return PlayerTextDrawHide(playerid, HPAlert);
timer DamageInformer[2000](playerid) {
	PlayerTextDrawHide(playerid, DMGTD[0]);
	PlayerTextDrawHide(playerid, DMGTD[1]);
	return 1;
}
timer OnLightFlash[125](vehicleid)
{
    new panels, doors, lights, tires;
    GetVehicleDamageStatus(vehicleid, panels, doors, lights, tires);

    switch(Flash[vehicleid])
    {
    	case 0: UpdateVehicleDamageStatus(vehicleid, panels, doors, 2, tires);

		case 1: UpdateVehicleDamageStatus(vehicleid, panels, doors, 5, tires);

		case 2: UpdateVehicleDamageStatus(vehicleid, panels, doors, 2, tires);

		case 3: UpdateVehicleDamageStatus(vehicleid, panels, doors, 4, tires);

		case 4: UpdateVehicleDamageStatus(vehicleid, panels, doors, 5, tires);

		case 5: UpdateVehicleDamageStatus(vehicleid, panels, doors, 4, tires);
    }
    if(Flash[vehicleid] > 4) Flash[vehicleid] = 0;
    else Flash[vehicleid] ++;
    return 1;
}
timer WoodCutter[10000](playerid) {
	if(IsPlayerLogged[playerid] == 0) return 1;
	if(GetPVarInt(playerid, "Trees") > 7) return 1;
	if(JobWorking[playerid] == 0) {
		SendClientMessage(playerid, COLOR_GRAD4, "Cong viec that bai!");
		ClearAnimations(playerid);
		ResetWeapons(playerid);
		return 1;
	}
	SetPVarInt(playerid, "Trees", GetPVarInt(playerid, "Trees")+1);
	SetPVarInt(playerid, "InHand", 1);
	ClearAnimations(playerid);
	SetPlayerAttachedObject( playerid, 6, 1463, 1, 0.187385, 0.559032, -0.002791, 93.806076, 91.723266, 0.000000, 0.442207, 1.000000, 0.799356 );
	if(GetPVarInt(playerid, "Trees") <= 6) {
		new string[256];
		format(string, sizeof(string), "Di toi chiec xe tai noi lam viec va ~r~~h~nhan Y~w~~h~ de dat go len xe!~n~Ban van phai chat them %d cay.", 7-GetPVarInt(playerid, "Trees"));
		PlayerTextDrawSetString(playerid, InfosTD, string);
		PlayerTextDrawShow(playerid, InfosTD);
	}	
	defer HideTextdraw(playerid);
	BagTime[playerid] = 30;
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	Freezed[playerid] = 0;
	return 1;
}
timer CheckStar[60000*20]() {
	if(StuntPickup != 0 && ActiveEvent == 1) {
		SCMTA(COLOR_CLIENT, "(( AdmBot: Su kien 'Stunt' da bi huy vi khong ai tim duoc ngoi sao! ))");
		DestroyDynamicPickup(StuntPickup);
		ActiveEvent = 0;
		EventTime = 1;	
	}
	return 1;
}
timer Firework[300](playerid, i)
{
    new Float:x, Float:y, Float:z;
    x = Frx[playerid][i], y = Fry[playerid][i], z = Frz[playerid][i], z += 73;
    if(RocketExplosions[playerid][i] == 0) DestroyObject(Rocket[playerid][i]), DestroyObject(RocketLight[playerid][i]), DestroyObject(RocketSmoke[playerid][i]),
		CreateExplosion(x ,y, z, 4, 10), CreateExplosion(x ,y, z, 5, 10), CreateExplosion(x ,y, z, 6, 10);
    else if(RocketExplosions[playerid][i] > 4)
    {
		for(new j = 0; j <= 50; j++) CreateExplosion(x + float(j - (50 / 2)), y, z, 7, 10),
			CreateExplosion(x, y + float(j - (50 / 2)), z, 7, 10), CreateExplosion(x, y, z + float(j - (50 / 2)), 7, 10);
		RocketExplosions[playerid][i] = -1, fireWork[playerid][0] = 0, fireWork[playerid][1] = 0;
		return 1;
    }
    else x += float(random(50) - (50 / 2)), y += float(random(50) - (50 / 2)),
		z += float(random(50) - (50 / 2)), CreateExplosion(x, y, z, 7, 10);
    RocketExplosions[playerid][i]++, defer Firework[300](playerid, i);
    return 1;
}
timer RainbowChange[200](playerid){
	if(IsPlayerInAnyVehicle(playerid)){
		new c1 = random(255), c2 = random(255);
		ChangeVehicleColor(GetPlayerVehicleID(playerid), c1, c2);
	}
	return 1;
}
timer HideCountTD[500](playerid) {
	TextDrawHideForPlayer(playerid, CountTD2);
	return 1;
}
timer DecreaseFishingBar[1200](playerid) {
	Times[playerid] -= 1;

	if(Times[playerid] == 0) {
		PlayerTextDrawHide(playerid, Key);
		TextDrawHideForPlayer(playerid, KhungKey);
		HidePlayerProgressBar(playerid, jProgress[playerid]);
		DestroyPlayerProgressBar(playerid, jProgress[playerid]);

		ClearAnimations(playerid);
		ApplyAnimation(playerid, "CARRY", "crry_prtial", 2.0, 0, 0, 0, 0, 0);
	 	TogglePlayerControllable(playerid, true);
		RemovePlayerAttachedObject(playerid, 9);
		Times[playerid] = 0;
		stop TimeOut[playerid];
		TimeOut[playerid] = Timer:0;
		return 1;
	}
	SetPlayerProgressBarValue(playerid, jProgress[playerid], Times[playerid]*10);
	ShowPlayerProgressBar(playerid, jProgress[playerid]); 
	return 1;
}
timer Countdown[1000](playerid, sec) {
	if(sec > 0) {
		new str[2];
		defer Countdown(playerid, sec-1);
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
		format(str, sizeof(str), "%d", sec);
		TextDrawSetString(CountTD2, str);
		TextDrawShowForPlayer(playerid, CountTD2);
		defer HideCountTD(playerid);
	} else {
		ShowFishingBar(playerid);
		ShowRandomFishingKey(playerid);
		TimeOut[playerid] = repeat DecreaseFishingBar[2000](playerid);
	}
	return 1;
}
timer ComepleteJobWait[1000](playerid, sec) {
	if(sec > 0) {
		new str[2];
		defer ComepleteJobWait(playerid, sec-1);
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
		format(str, sizeof(str), "%d", sec);
		TextDrawSetString(CountTD2, str);
		TextDrawShowForPlayer(playerid, CountTD2);
		defer HideCountTD(playerid);
	} else {
		if(PlayerInfo[playerid][pJob] == 9 && GetPVarInt(playerid, "JobCheck") == 9)
		{
			new j = RandomEx(1, Iter_Count(House) + 1);
			while(GetCity1(HouseInfo[j][hEntrancex],HouseInfo[j][hEntrancey]) != 3 
				|| j == JobCP[playerid] 
				|| GetPlayerDistanceFromPoint(playerid, HouseInfo[j][hEntrancex], HouseInfo[j][hEntrancey], HouseInfo[j][hEntrancez]) < 200.0)
			{
				//printf("distance from pizza point: %0.1fm", GetPlayerDistanceFromPoint(playerid, HouseInfo[j][hEntrancex], HouseInfo[j][hEntrancey], HouseInfo[j][hEntrancez]));
				//printf("house id: %d", j);
				j = RandomEx(1, Iter_Count(House) + 1);
			}
			TogglePlayerControllable(playerid, true);
			new string[128];
			SetPlayerCheckpointEx(playerid, HouseInfo[j][hEntrancex],HouseInfo[j][hEntrancey],HouseInfo[j][hEntrancez], 7.0);
			format(string, sizeof(string), "Di den diem mau ~r~~h~do~w~~h~ tren ban do de giao pizza.~n~Khoang cach: ~y~%0.1fm.", GetPlayerDistanceFromPoint(playerid, HouseInfo[j][hEntrancex],HouseInfo[j][hEntrancey],HouseInfo[j][hEntrancez]));
			PlayerTextDrawSetString(playerid, InfosTD, string);
			defer HideTextdraw(playerid);
			PlayerTextDrawShow(playerid, InfosTD);
			JobCP[playerid] = j;
			CP[playerid] = 155;
		}
		else if(PlayerInfo[playerid][pJob] == 5 && GetPVarInt(playerid, "JobCheck") == 5)
		{
			if(GetPlayerVehicleID(playerid) != JobVehicle[playerid]) return SendClientMessage(playerid, -1, "[THO CHE SUNG]: Ban khong o tren xe co the chua vat lieu");
			DisablePlayerCheckpointEx(playerid);
			new string[128];
			SetPlayerCheckpointEx(playerid, 2770.2822,-1610.9043,11.0418, 10.0);
			format(string, sizeof(string), "Tro ve cho cu neu ban muon tiep tuc farm vat lieu.~n~Khoang cach: ~y~%0.1fm.", GetPlayerDistanceFromPoint(playerid, 2770.2822,-1610.9043,11.0418));
			PlayerTextDrawSetString(playerid, InfosTD, string);
			defer HideTextdraw(playerid);
			PlayerTextDrawShow(playerid, InfosTD);
			TogglePlayerControllable(playerid, true);
			PlayerInfo[playerid][pTrungThuJob][3] += 1;
			save_ttj(playerid);
			CP[playerid] = 699;
			// JobVehicle[playerid] = 0;
			// JobWorking[playerid] = 0;
			PlayerInfo[playerid][pMatSkill] ++;
			UpdateVar(playerid, "MatSkill", PlayerInfo[playerid][pMatSkill]);
			GiveJobSalary(playerid);
			for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
				if(PlayerInfo[playerid][pDailyMission][m] == 3) CheckMission(playerid, m);
			}
		}
		else {
			new string[128];
			format(string, sizeof(string), "ASHER :{EEE0C9}%s[%d]{FFFFFF} nghi van dang nhan job này nhung làm job khac admin vui long check .", GetName(playerid), playerid);
			GuiDenAdminVaHelper(COLOR_WHITE, string, 1);
		}
	}
	return 1;
}
timer telecauca[10000](playerid)
{
	if(IsPlayerConnected(playerid)) TimpMateriale[playerid] = 0;
	return 0;
}
timer Fish[15000](playerid) {
	new job = PlayerInfo[playerid][pJob];

	JobInfo[job][jAttemptPerHour] -= 1;
	updateFishingTag(job);

    stop FishTimer[playerid];
    FishTimer[playerid] = Timer:0;
    if(!(PlayerInfo[playerid][pJob] == 11 || PlayerInfo[playerid][pJob] == 15)) return 1;
	new randnr = random(105),strings[120];    
    StartFish[playerid] = 0;
	Freezed[playerid] = 0;			
	TimpMateriale[playerid] = 1;    
	defer telecauca(playerid);
    new cathuong = 77, cahiem = 97, sailormoon = 105; 
    if(randnr > 0 && randnr <= cathuong)
    {
    	format(strings, sizeof(strings), "{FF0000}>> {FFFFFF}Ban Da Cau Duoc {FFF400}Ca Thuong{FFFFFF} !");
		SendClientMessage(playerid, COLOR_YELLOW, strings);	
		SendClientMessage(playerid, -1, "{FF0000}>> {FFFFFF}Ca da duoc cho vao tui do cua ban [/tuido].");
		SendClientMessage(playerid, COLOR_WHITE, "{FFFFFF}-------------------------------------------");	
		format(strings, sizeof(strings), "{FF0000}>>{FFFFFF} %s (%d) Da Cau Duoc {FFF400}Ca Thuong{FFFFFF} .", GetName(playerid), playerid);
		NearMessage(playerid, COLOR_YELLOW, strings);	
		//money = 15000 + random(20000);
		//FishPrice[playerid] = x;
		if(Inventory_GetFreeID(playerid, 1) == -1) Inventory_Add(playerid,"Ca Thuong", 19630, 1, 2);
		else Inventory_Add(playerid,"Ca Thuong", 19630, 1, 1);
		//format(strings,sizeof(strings),"* %s bat duoc mot con ca BINH THUONG, co gia khoang $%s.", GetName(playerid), FormatNumber(money));
		//NearMessage(playerid, COLOR_YELLOW, strings);
		//pFishess[playerid] = 1;     	
    } else if(randnr > cathuong && randnr <= cahiem){
		format(strings, sizeof(strings), "{FF0000}>> {FFFFFF}Ban Da Cau Duoc {0011FF}Ca Hiem{FFFFFF} !");
		SendClientMessage(playerid, COLOR_WHITE, strings);
		SendClientMessage(playerid, -1, "{FF0000}>> {FFFFFF}Ca da duoc cho vao tui do cua ban [/tuido].");
		SendClientMessage(playerid, COLOR_WHITE, "{FFFFFF}-------------------------------------------");	
		format(strings, sizeof(strings), "{FF0000}>>{FFFFFF} %s (%d) Da Cau Duoc {0011FF}Ca Hiem{FFFFFF}.", GetName(playerid), playerid);
		NearMessage(playerid, COLOR_YELLOW, strings);	
		if(Inventory_GetFreeID(playerid, 1) == -1) Inventory_Add(playerid,"Ca Hiem", 1600, 1, 2);
		else Inventory_Add(playerid,"Ca Hiem", 1600, 1, 1);
		//pFishess[playerid] = 1;
    } 
	else if(randnr > cahiem && randnr <= sailormoon){
		format(strings, sizeof(strings), "{FF0000}>> {FFFFFF}Ban Da Cau Duoc {34eb86}Sailor Moon{FFFFFF} !");
		SendClientMessage(playerid, COLOR_WHITE, strings);
		SendClientMessage(playerid, -1, "{FF0000}>> {FFFFFF}Sailor Moon da duoc cho vao tui do cua ban [/tuido].");
		SendClientMessage(playerid, -1, "{FF0000}>> {FFFFFF}Ca Sailor Moon se khong co gia tri, ban chi co the su dung ca Sailor Moon de che tao banh trung thu");
		SendClientMessage(playerid, COLOR_WHITE, "{FFFFFF}-------------------------------------------");	
		format(strings, sizeof(strings), "{FF0000}>>{FFFFFF} %s (%d) Da Cau Duoc {34eb86}Sailor Moon{FFFFFF}.", GetName(playerid), playerid);
		NearMessage(playerid, COLOR_YELLOW, strings);	
		if(pFishing[playerid] == 1) pFishing[playerid] = 0;
		PlayerInfo[playerid][pTrungThuJob][0] += 1;
		save_ttj(playerid);
		if(Inventory_GetFreeID(playerid, 1) == -1) Inventory_Add(playerid,"Sailor Moon", 953, 1, 2);
		else Inventory_Add(playerid,"Sailor Moon", 953, 1, 1);
		//pFishess[playerid] = 1;
    }else {
		new k = random(4);
		if(k == 1) {
			format(strings, sizeof(strings), "{FF0000}>>{FFFFFF} %s Da Cau Duoc Mot Con Ca Map.", GetName(playerid));
			NearMessage(playerid, COLOR_PURPLE, strings);
			SetPlayerHealthEx(playerid, 0.0);
			SendClientMessage(playerid, -1, "{FF0000}>> {FFFFFF}Ca da duoc cho vao tui do cua ban [/tuido].");
			if(Inventory_GetFreeID(playerid, 1) == -1) Inventory_Add(playerid,"Ca Map", 1608, 1, 2);
			else Inventory_Add(playerid,"Ca Map", 1608, 1, 1);
		}
		else {
			format(strings, sizeof(strings), "{FF0000}>>{FFFFFF} %s (%d) Da Cau Duoc {0011FF}CA VANG{FFFFFF}.", GetName(playerid), playerid);
			NearMessage(playerid, COLOR_YELLOW, strings);
			SendClientMessage(playerid, -1, "{FF0000}>> {FFFFFF}Ca da duoc cho vao tui do cua ban [/tuido].");

			if(Inventory_GetFreeID(playerid, 1) == -1) Inventory_Add(playerid,"Ca Vang", 1604, 1, 2);
			else Inventory_Add(playerid,"Ca Vang", 1604, 1, 1);

		}
    }
	ClearAnimations(playerid);
	ApplyAnimation(playerid, "CARRY", "crry_prtial", 2.0, 0, 0, 0, 0, 0);
 	TogglePlayerControllable(playerid, true);
	RemovePlayerAttachedObject(playerid, 9);
	// if(PlayerInfo[playerid][pMember] == 0) {
	// 	for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
	// 		if(PlayerInfo[playerid][pDailyMission][m] == 15 || PlayerInfo[playerid][pDailyMission][m] == 16) CheckMission(playerid, m);
	// 	}					
	// }
	/*for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
		if(PlayerInfo[playerid][pDailyMission][m] == 2) CheckMission(playerid, m);
	}*/
 	return 1;
}
timer Count[1000]() {
	new string[30];
	format(string, sizeof(string), "~w~Dem nguoc: ~y~%d", --Countnr);
	TextDrawSetString(CountTD, (Countnr == 0) ? "~r~GO! ~y~GO! ~b~GO!" : string);
	if(Countnr < 0) {
		TextDrawHideForAll(CountTD);
		countTimer = Timer:0;
	}
	return 1;
}
timer OffDuty[600000](playerid) {

	if(!Iter_Contains(PlayerAdmins, playerid) && !Iter_Contains(AdminDuty, playerid)) return true;

	Iter_Remove(AdminDuty, playerid);

	SendClientMessage(playerid, COLOR_YELLOW, "Ban off qua lau nen ban da khong con lam nhiem vu nua, su dung: [/aduty]");

	new string[128];
	format(string, 128, "Admin %s hien khong con dang lam nhiem vu (tu dong tat sau 10 phut).", GetName(playerid));
	SendAdminMessage(COLOR_ADMCHAT, string, 1);

	return true;
}
timer updatecadoubar[100](playerid) {
	if(cadoumort == 1) PlayerTextDrawHide(playerid, cadouzburatorPTD[0]),DestroyPlayerProgressBar(playerid, cadouBAR[playerid]),cadoulqw[playerid] = 0;
	new Float:X,Float:Y,Float:Z;
	GetObjectPos(cadouzburator, X,Y,Z);
	if(!IsPlayerInRangeOfPoint(playerid, 115.0, X,Y,Z)) return PlayerTextDrawHide(playerid, cadouzburatorPTD[0]),DestroyPlayerProgressBar(playerid, cadouBAR[playerid]),cadoulqw[playerid] = 0;
	new string[65];
	
	if(cadouviata > 999) format(string,sizeof(string),"Gift Level ~r~%d~w~~n~  HP: ~r~%d~w~/%d",cadoulevel,cadouviata,cadouviatai),PlayerTextDrawSetString(playerid, cadouzburatorPTD[0], string),PlayerTextDrawShow(playerid, cadouzburatorPTD[0]);
	if(cadouviata < 1000) format(string,sizeof(string),"Gift Level ~r~%d~w~~n~ HP: ~r~%d~w~/%d",cadoulevel,cadouviata,cadouviatai),PlayerTextDrawSetString(playerid, cadouzburatorPTD[0], string),PlayerTextDrawShow(playerid, cadouzburatorPTD[0]);
	if(cadoulqw[playerid] == 0) { 
		cadouBAR[playerid] = CreatePlayerProgressBar(playerid,265.00, 411.00, 131.50, 21.20, 16711935, 100.0), 
		SetPlayerProgressBarMaxValue(playerid, cadouBAR[playerid], cadouviatai),cadoulqw[playerid] = 1; 
	} else { 
		SetPlayerProgressBarValue(playerid, cadouBAR[playerid], cadouviata),
		ShowPlayerProgressBar(playerid, cadouBAR[playerid]); 
	}
	return 1;
}
/*timer CancelTestDrive[180000](playerid) {
	if(TestingModel[playerid] == 0) return 1;  
	SendClientMessage(playerid, COLOR_YELLOW, "Thoi gian thu xe da ket thuc.");
	PutPlayerInVehicleEx(playerid, DealerCar[playerid], 0);
	if(DealerCarType[playerid] == 1) {
		SetPlayerInterior(playerid, 0);
		DealerCarAngle[playerid] = -61.3200;
		SetVehiclePosEx(playerid, DealerCar[playerid], -2316.1819, 198.3852, 35.5608), SetVehicleZAngleEx(DealerCar[playerid], 75.7200);
		LinkVehicleToInterior(DealerCar[playerid], 0);
		SetPlayerCameraPos(playerid, -2329.9380, 185.0620, 37.8267);
		SetPlayerCameraLookAt(playerid, -2329.1919, 185.7270, 37.6017);
	}
	else if(DealerCarType[playerid] == 2) {
		SetPlayerInterior(playerid, 0);
		DealerCarAngle[playerid] = -61.3200;
		SetVehiclePosEx(playerid, DealerCar[playerid], -2316.1819, 198.3852, 35.5608), SetVehicleZAngleEx(DealerCar[playerid], 75.7200);
		LinkVehicleToInterior(DealerCar[playerid], 0);
		SetPlayerCameraPos(playerid, -2329.9380, 185.0620, 37.8267);
		SetPlayerCameraLookAt(playerid, -2329.1919, 185.7270, 37.6017);
	}
	else if(DealerCarType[playerid] == 3) {
		DealerCarAngle[playerid] = 214.5153;
		SetVehiclePosEx(playerid, DealerCar[playerid], 179.2214,-1935.9833,-0.2331), SetVehicleZAngleEx(DealerCar[playerid], 214.5153);
		SetPlayerCameraPos(playerid, 195.5355, -1952.8099, 8.7636);
		SetPlayerCameraLookAt(playerid, 194.7955, -1952.1398, 8.3886);
	}
	else if(DealerCarType[playerid] == 4) {
		DealerCarAngle[playerid] = 320.7336;
		SetVehiclePosEx(playerid, DealerCar[playerid], 1765.7640, -2286.8374, 27.4146), SetVehicleZAngleEx(DealerCar[playerid], 320.7336);
		SetPlayerCameraPos(playerid, 1769.0742, -2266.9126, 32.7817);
		SetPlayerCameraLookAt(playerid, 1768.9325, -2267.9021, 32.4167);
	}
	else if(DealerCarType[playerid] == 5) {
		DealerCarAngle[playerid] = 121.0334;
		SetVehiclePosEx(playerid, DealerCar[playerid], 1543.3701,-1355.8428,328.6331), SetVehicleZAngleEx(DealerCar[playerid], 121.0334);
		SetPlayerCameraPos(playerid, 1542.2255, -1370.4922, 333.8188);
		SetPlayerCameraLookAt(playerid, 1542.3651, -1369.5028, 333.4086);
	}
	TestingModel[playerid] = 0;
	ShowDealershipTextdraws(playerid);
	SelectTextDraw(playerid, 0xFF0000FF);
	TogglePlayerControllable(playerid, false);
	new e,l,a,d,b,bo,o;
	GetVehicleParamsEx(DealerCar[playerid],e,l,a,d,b,bo,o);
	SetVehicleParamsEx(DealerCar[playerid],0,l,a,d,b,bo,o);
	return 1;
}*/
timer EscapePlayer[5000](playerid) {
	if(!IsPlayerConnected(playerid)) return 1;
   	new test = 7 + random(6), string[180];
    EscapeProces[playerid] += test;
	if(EscapeProces[playerid] < 100) {
		format(string, sizeof(string), "Tiep tuc pha hang rao! (%d%s)", EscapeProces[playerid], "%%");
		SendClientMessage(playerid, 0xFFB870FF, string);
	}
	else {
		SendClientMessage(playerid, COLOR_YELLOW, "Ban da thoat khoi nha tu. Hay den mot cua hang quan ao de cai trang thoat khoi canh sat!");
		SetPlayerPosEx(playerid, 1824.9187,-1537.7224,13.5469);
		SetPlayerVirtualWorld(playerid, 0);
		PlayerInfo[playerid][pJailed] = 0;
		PlayerInfo[playerid][pJailTime] = 0;
		Update(playerid,pJailedx);
		Update(playerid,pJailTimex);		
		Escape2[playerid] = 0;	
		EscapeProces[playerid] = 0;
		PlayerTextDrawHide(playerid, Jailtime);
		// SetTimerEx("GiveWanted", 1000, false, "i", playerid);		
		SetPlayerWantedLevel(playerid, 6);
		PlayerInfo[playerid][pWantedLevel] = 6;
		SetPlayerCriminal(playerid,255, "Vuot nguc");	
	}
    Escape2[playerid] = 0;
	ClearAnimations(playerid);
	RemovePlayerAttachedObject(playerid, 5);
	return 1;
}
timer CheckReport[300000](playerid) {
	if(Ajutor[playerid] == 1) {
		SendClientMessage(playerid, COLOR_YELLOW, "Bao cao cua ban da bi dong' tu dong vi ban khong nhan duoc cau tra loi.");
		Ajutor[playerid] = 0;
		SetPVarInt(playerid, "Reported", 0);
		SetPVarInt(playerid, "ReportType", 0);
		SetPVarString(playerid, "ReportedBy", "");
		SetPVarInt(playerid, "ReportScore", 0);
		SetPVarString(playerid, "ReportText", "");		
	}
	return 1;
}
timer StartEvent[60000]() {
	new string [180];
	format(string, sizeof(string), "So nguoi tham gia su kien la %d nguoi.", GetPlayersOnEvent());
	foreach(new i: Player) {
		if(IsPlayerLogged[i] == 1) {
     		if(GetPlayersOnEvent() < 2 && InEvent[i] == 1) {
     			InEvent[i] = 0;
				ActiveEvent = 0;
				EventTime = 1;
     			SpawnPlayer(i);				
			 	format(string, sizeof(string), "(( AdmBot: Su kien da bi huy tu dong! Khong co du 2 nguoi choi. ))");
				SendClientMessage(i, COLOR_CLIENT, string);
     		}
			else if(InEvent[i]) {
				TextDrawShowForPlayer(i, EventCS);
				SendClientMessage(i, 0xA0D8EBFF, "Su kien da bat dau!");
				SendClientMessage(i, 0xA0D8EBFF, string);
				TogglePlayerControllable(i, true);
				SetPlayerHealthEx(i, 99);
			}
		}
	}
	if(ActiveEvent == 0) {
		if(PlayerInfo[EventBy][pAdmin] != 0 && IsPlayerConnected(EventBy)) GivePlayerCash(EventBy, EventMoney);
	}
	EventTime = 0;
	return 1;
}
timer SondajResult[60000]() {
	SondajTime = 0;
	new string[180];
	SCMTA(COLOR_YELLOW, "Cuoc tham do da ket thuc! Dang tinh toan ket qua...");
	format(string, sizeof(string), "Co %d nguoi choi da bo phieu va %d giu quan diem trung lap.", SondajVotes[0], SondajVotes[1]);
	SCMTA(COLOR_YELLOW, string);
	SondajVotes[0] = 0;
	SondajVotes[1] = 0;
	return 1;
}
timer UpdateFare[10000](playerid) {
	if(!IsPlayerInAnyVehicle(playerid)) return 1;
	if(TaxiDriver[playerid] == -1) return 1;
	if(TaxiDuty[TaxiDriver[playerid]] == 0) return 1;
	if(PlayerInfo[playerid][pMember] == 12) return 1;
	new string[180];
	if(GetPlayerCash(playerid) < Fare[TaxiDriver[playerid]]) {
		if(TaxiMoney[playerid] != 0) {
			if(TaxiMoney[playerid] >= 20) UpdateFactionRaport(TaxiDriver[playerid], 0);	
			AcceptedService[TaxiDriver[playerid]] = -1;	
			foreach(new i: Player) {
				if(IsNearPlayer(playerid, i)) {
					format(string, sizeof(string), "* %s da tra cho tai xe taxi %s so tien $%s cho chuyen di.", GetName(playerid), GetName(TaxiDriver[playerid]), FormatNumber(TaxiMoney[playerid]));
					SendClientMessage(i, COLOR_PURPLE, string);
				}
			}
			TaxiMoney[playerid] = 0;
		}
		TaxiDriver[playerid] = -1;
		PlayerTextDrawHide(playerid, FareTD);
		stop TaxiTimer[playerid];
		RemovePlayerFromVehicle(playerid);
		return 1;
	}
	TaxiMoney[TaxiDriver[playerid]] += Fare[TaxiDriver[playerid]];
	TaxiMoney[playerid] += Fare[TaxiDriver[playerid]];
	GivePlayerCash(playerid, -Fare[TaxiDriver[playerid]]);
    UpdateTaxiTextdraw(playerid);
    UpdateTaxiTextdraw(TaxiDriver[playerid]);
	return 1;
}
timer DrugEffectGone[30000](playerid) {
	if(IsPlayerConnected(playerid) && UsingDrugs[playerid] == 1) {		
		UsingDrugs[playerid] = 0;
		ClearAnimations(playerid);
		SetPlayerDrunkLevel(playerid, 0);
		SetPlayerWeather(playerid, 2);
		PlayerStoned[playerid] = 0;
		Freezed[playerid] = 0;
		SetPlayerHealthEx(playerid, 99);
		// PlayerInfo[playerid][pDrugs] -= 1;	
		Update(playerid, pCashx);
	}
	return 1;
}
timer AttachTrailer[1000](playerid) {
	new Float:pX, Float:pY, Float:pZ;
	GetPlayerPos(playerid,pX,pY,pZ);
	new Float:vX, Float:vY, Float:vZ;
	GetVehiclePos(Trailer[playerid],vX,vY,vZ);
	if((floatabs(pX-vX)<100.0)&&(floatabs(pY-vY)<100.0)&&(floatabs(pZ-vZ)<100.0)&&(Trailer[playerid]!=GetPlayerVehicleID(playerid)))  AttachTrailerToVehicle(Trailer[playerid],GetPlayerVehicleID(playerid));
	return 1;
}

timer ClearWanted[60000](playerid) {
	new string[80];
	format(string, sizeof(string), "None");
	strmid(WantedName[playerid], string, 0, strlen(string), 255);
	WantedReason[playerid] = 999;
	return 1;
}
timer UnFreezeStation2[7000](playerid) {
	TogglePlayerControllable(playerid, true);
	Freezed[playerid] = 0;
	new j = Iter_Random(House);
	if(j == 0) j = 1;
	SetPlayerCheckpointEx(playerid, HouseInfo[j][hEntrancex],HouseInfo[j][hEntrancey],HouseInfo[j][hEntrancez], 7.0);
	new string[170];
	format(string, sizeof(string), "Di den diem ~r~~h~mau do~w~~h~ tren ban do de giao buu kien.~n~De lay goi, nhan phim Y phia sau xe!~n~khoang cach: ~y~%0.1fm.", GetPlayerDistanceFromPoint(playerid, HouseInfo[j][hEntrancex],HouseInfo[j][hEntrancey],HouseInfo[j][hEntrancez]));
	PlayerTextDrawSetString(playerid, InfosTD, string);
	defer HideTextdraw(playerid);
	PlayerTextDrawShow(playerid, InfosTD);	
	CP[playerid] = 58;
	return 1;
}

timer UnFreezeStation[1000](playerid) return TogglePlayerControllable(playerid, true);
timer lspdgateclose[9000]() return MoveObject(gatelspd, 1588.6552, -1637.9025, 15.0358, 1.5);
timer nggateclose[9000]() return MoveObject(gateng, 135.2833, 1941.3331, 21.6932, 1.5);
timer lspdbarclose[9000]() return MoveObject(lspdbar, 1544.7007, -1630.7527, 13.2983, 1.5,0.0000, 90.0200, 90.0000);
timer jailclosegate[9000]() return MoveObject(cell2, 1767.6273, -1583.4294, 1745.0659, 1.5);
timer UpdatePlayer[2000](playerid) {
    if(GetPlayerMoney(playerid) != Cash[playerid]) {
		ResetMoneyBar(playerid);
		UpdateMoneyBar(playerid, Cash[playerid]);
    }
    return 1;
}
task Spectator[2000]() {
	new 
		Float:health, Float: armour,
		text1[6], text2[6], szTD[230];
	
	foreach(new i: PlayerHelpers) {
		if(Spectate[i] != 255 && IsPlayerLogged[i] == 1 && Spectate[i] < 253 && InWar[PlayerInfo[i][pMember]] == 0) {	
			new targetid = Spectate[i];	
			if(IsPlayerConnected(targetid)) {
				GetPlayerHealthEx(targetid, health);
				GetPlayerArmourEx(targetid, armour);
				if(PlayerInfo[targetid][pWantedLevel] == 0) text1 = "Khong";
				else format(text1, sizeof(text1), "%d", PlayerInfo[targetid][pWantedLevel]);
				if(PlayerInfo[targetid][pJailTime] == 0) text2 = "Khong";
				else format(text2, sizeof(text2), "%d", PlayerInfo[targetid][pJailTime]);
			
				if(GetPlayerState(targetid) == PLAYER_STATE_DRIVER) {							
					new Float:Valoarea;
					new carid = GetPlayerVehicleID(targetid);
					GetVehicleHealth(carid,Valoarea);
					new speed = Carspeed(targetid);
					format(szTD, sizeof(szTD), "~y~%s (%d) - L: %d~n~~w~~h~Health: ~r~%.1f  ~w~~h~Armour: ~r~%.1f~n~~w~~h~Wanted: ~r~%s~w~~h~  ~w~~h~Jail: ~r~%s~n~~w~~h~Vehicle ID: ~r~%d~n~~w~~h~Speed: ~b~%d km/h", GetName(targetid), targetid, PlayerInfo[targetid][pLevel], health, armour, text1, text2, carid, speed);
					PlayerTextDrawSetString(i, SpectatorTD, szTD);
					PlayerTextDrawShow(i, SpectatorTD);						
				}
				else {
					format(szTD, sizeof(szTD), "~y~%s (%d) - L: %d~n~~w~~h~Health: ~r~%.1f  ~w~~h~Armour: ~r~%.1f~n~~w~~h~Wanted: ~r~%s~w~~h~  ~w~~h~Jail: ~r~%s", GetName(targetid), targetid, PlayerInfo[targetid][pLevel], health, armour, text1, text2);
					PlayerTextDrawSetString(i, SpectatorTD, szTD);
				}
				if(GetPlayerInterior(targetid) > -1) SetPlayerInterior(i,GetPlayerInterior(targetid));
				if(GetPlayerVirtualWorld(targetid) > -1) SetPlayerVirtualWorld(i,GetPlayerVirtualWorld(targetid));
			}
		}
		else PlayerTextDrawHide(i, SpectatorTD);
	}
	foreach(new i: PlayerAdmins) {
		if(Spectate[i] != 255 && Spectate[i] < 253 && InWar[PlayerInfo[i][pMember]] == 0 && IsPlayerLogged[i] == 1) {	
			new targetid = Spectate[i];	
			if(IsPlayerConnected(targetid)) {
				GetPlayerHealthEx(targetid, health);
				GetPlayerArmourEx(targetid, armour);
				if(PlayerInfo[targetid][pWantedLevel] == 0) text1 = "Khong";
				else format(text1, sizeof(text1), "%d", PlayerInfo[targetid][pWantedLevel]);
				if(PlayerInfo[targetid][pJailTime] == 0) text2 = "Khong";
				else format(text2, sizeof(text2), "%d", PlayerInfo[targetid][pJailTime]);
			
				if(GetPlayerState(targetid) == PLAYER_STATE_DRIVER) {							
					new Float:Valoarea;
					new carid = GetPlayerVehicleID(targetid);
					GetVehicleHealth(carid,Valoarea);
					new speed = Carspeed(targetid);
					format(szTD, sizeof(szTD), "~y~%s (%d) - L: %d~n~~w~~h~Health: ~r~%.1f  ~w~~h~Armour: ~r~%.1f~n~~w~~h~Wanted: ~r~%s~w~~h~  ~w~~h~Jail: ~r~%s~n~~w~~h~Vehicle ID: ~r~%d~n~~w~~h~Speed: ~b~%d km/h", GetName(targetid), targetid, PlayerInfo[targetid][pLevel], health, armour, text1, text2, carid, speed);
					PlayerTextDrawSetString(i, SpectatorTD, szTD);
					PlayerTextDrawShow(i, SpectatorTD);						
				}
				else {
					format(szTD, sizeof(szTD), "~y~%s (%d) - L: %d~n~~w~~h~Health: ~r~%.1f  ~w~~h~Armour: ~r~%.1f~n~~w~~h~Wanted: ~r~%s~w~~h~  ~w~~h~Jail: ~r~%s", GetName(targetid), targetid, PlayerInfo[targetid][pLevel], health, armour, text1, text2);
					PlayerTextDrawSetString(i, SpectatorTD, szTD);
				}
				if(GetPlayerInterior(targetid) > -1) SetPlayerInterior(i,GetPlayerInterior(targetid));
				if(GetPlayerVirtualWorld(targetid) > -1) SetPlayerVirtualWorld(i,GetPlayerVirtualWorld(targetid));
			}
		}
		else PlayerTextDrawHide(i, SpectatorTD);
	}
	foreach(new i: Player) {
		// -- Variables
		for(new t = 0; t < sizeof(DeelayCommand[]); t++) {
			if(DeelayCommand[i][t] != 0) {
				if(DeelayCommand[i][t] < 0) DeelayCommand[i][t] = 0;
				else {
					DeelayCommand[i][t] -= 2;
				}
			}				
		}
		for(new t = 0; t < sizeof(JobDeelay[]); t++) {
			if(JobDeelay[i][t] != 0) {
				JobDeelay[i][t] -= 2;	
				if(JobDeelay[i][t] < 0) JobDeelay[i][t] = 0;
			}
		}
		if(Exception{i} > 0) Exception{i} -= 2;
	}

	return 1;
}
task SendMSG[60000*15]() {
    new randMSG = random(sizeof(RandomMSG));
	foreach(new i: Player) {
		if(gNews[i] == 0) SendClientMessage(i,COLOR_LIGHTBLUE, RandomMSG[randMSG]);
	}
    return 1;
}
timer Camera[1000](playerid) {
	TogglePlayerSpectating(playerid, false);
	InterpolateCameraPos(playerid, 1364.371582, -2478.107421, 92.893699, 1532.775390, -2236.529785, 68.596260, 20000);
	InterpolateCameraLookAt(playerid, 1367.008911, -2474.025390, 91.718505, 1534.416381, -2232.174316, 66.769660, 20000);
	SetPlayerPosEx(playerid, 1545.4091,-2414.3760,13.5547);
	return 1;
}
timer ResetSpawn[500](playerid) return IsPlayerSpec[playerid] = 0;
timer UpdateSecondary[3000](playerid) {
    if(IsPlayerLogged[playerid] != 0) {
    	new query[200];
    	format(query, sizeof(query), "UPDATE users SET Money=%d,Bank=%d,ConnectedTime='%0.3f',Respect=%d,PayDay=%d,JailTime=%d WHERE ID=%d", 
    		GetPlayerCash(playerid), PlayerInfo[playerid][pAccount], PlayerInfo[playerid][pConnectTime], PlayerInfo[playerid][pExp], PlayerInfo[playerid][pPayDay], PlayerInfo[playerid][pJailTime], PlayerInfo[playerid][pSQLID]);
    	mysql_pquery(SQL, query);
		OnPlayerDateUpdateX2(playerid);
	}
	return 1;
}
timer CalculateVote[60000](paintid) {
	PaintTime[paintid] = 0;
	PaintTimer[paintid] = Timer:0;
	if(PlayersOnPaint(paintid) < 2) return SendPaintMessage(paintid+1, COLOR_CLIENT, "Tran dau da bi huy vi chi co mot nguoi choi");

	new string[180], map;
	PaintVote[paintid] = 0;
	if(MapVotes[paintid][0] >= MapVotes[paintid][1] && MapVotes[paintid][0] >= MapVotes[paintid][2] && MapVotes[paintid][0] >= MapVotes[paintid][3] && MapVotes[paintid][0] >= MapVotes[paintid][4] && MapVotes[paintid][0] >= MapVotes[paintid][5]) map = 0;
	else if(MapVotes[paintid][1] >= MapVotes[paintid][0] && MapVotes[paintid][1] >= MapVotes[paintid][2] && MapVotes[paintid][1] >= MapVotes[paintid][3] && MapVotes[paintid][1] >= MapVotes[paintid][4] && MapVotes[paintid][1] >= MapVotes[paintid][5]) map = 1;
	else if(MapVotes[paintid][2] >= MapVotes[paintid][0] && MapVotes[paintid][2] >= MapVotes[paintid][1] && MapVotes[paintid][2] >= MapVotes[paintid][3] && MapVotes[paintid][2] >= MapVotes[paintid][4] && MapVotes[paintid][2] >= MapVotes[paintid][5]) map = 2;
	else if(MapVotes[paintid][3] >= MapVotes[paintid][0] && MapVotes[paintid][3] >= MapVotes[paintid][1] && MapVotes[paintid][3] >= MapVotes[paintid][2] && MapVotes[paintid][3] >= MapVotes[paintid][4] && MapVotes[paintid][3] >= MapVotes[paintid][5]) map = 3;
	else if(MapVotes[paintid][4] >= MapVotes[paintid][0] && MapVotes[paintid][4] >= MapVotes[paintid][1] && MapVotes[paintid][4] >= MapVotes[paintid][2] && MapVotes[paintid][4] >= MapVotes[paintid][3] && MapVotes[paintid][4] >= MapVotes[paintid][5]) map = 4;
	else if(MapVotes[paintid][5] >= MapVotes[paintid][0] && MapVotes[paintid][5] >= MapVotes[paintid][1] && MapVotes[paintid][5] >= MapVotes[paintid][2] && MapVotes[paintid][5] >= MapVotes[paintid][3] && MapVotes[paintid][5] >= MapVotes[paintid][4]) map = 5;
	
	format(string, sizeof(string), "Bo phieu da ket thuc. Map %s da duoc chon voi %d phieu bau.", MapName2(map), MapVotes[paintid][map]);
	PaintMap[paintid] = map;
	if(paintid == 2) PaintTime[paintid] = 600;
	else PaintTime[paintid] = 300;
	SendPaintMessage(paintid+1, COLOR_CLIENT, string);
	MapVotes[paintid][0] = 0; MapVotes[paintid][1] = 0; MapVotes[paintid][2] = 0; MapVotes[paintid][3] = 0; MapVotes[paintid][4] = 0; MapVotes[paintid][5] = 0; 
	foreach(new i: Player) {
		if(IsPlayerLogged[i] == 1)  {
			if(PaintType[i] == paintid+1) Voted[i] = 0, SpawnPlayer(i);
		}
	}
	return 1;
}
timer LoginTimer[60000](playerid) {
	SendClientMessage(playerid, COLOR_WARNING, "Ban da bi kick vi khong nhap mat khau trong 60 giay!");
	KickEx(playerid);	
	return 1;
}
task SomeTimer[10000]() {
	// Record players
	if(Iter_Count(Player) > MaxPlayers) {
		new string[50];
		MaxPlayers = Iter_Count(Player);
		SaveInfo();
		format(string, sizeof(string), "Warning: So nguoi choi da dat ky luc %d.", MaxPlayers);
		SendStaffMessage(COLOR_WARNING, string);
	}
}
task LocalTimer[1000]() {
	new year, month, day;
	getdate(year, month, day);
	new days[10], string[200];
	format(days, sizeof(days), GetWeekDay(day, month, year));
	#pragma unused month
	#pragma unused year

	new hour,minute,second;
	gettime(hour,minute,second);

	gtm = gettime();
	format(string, 16, "%02d~p~:~w~%02d", hour, minute); TextDrawSetString(TimeTD[0], string);
	format(string, 14, ":%02d", second); TextDrawSetString(TimeTD[1], string);
	format(string, 40, "~p~%d~w~ %s %d", day, MonthName[month-1], year); TextDrawSetString(TimeTD[2], string);
	//format(string, 14, "%02i.%02i.%i", day, month, year); TextDrawSetString(Logo[1], string);

	// print("[LocalTimer]");

	
	if(second == 0 && hour == 00 && strcmp(days,"Monday",true) == 0) {
		mysql_query(SQL ,"UPDATE `users` SET `HelpedPlayersToday`='0' WHERE `Admin`>='1'", false);
		
		foreach(new i: Player) {
			if(IsPlayerLogged[i] == 1) {
				if(PlayerInfo[i][pAdmin] != 0) PlayerInfo[i][pHelpedPlayersToday] = 0;
			}
		}
	}
	if(ServerSystem[10] == 0 && (strcmp(days,"Saturday",true) == 0 || strcmp(days,"Sunday",true) == 0)) {
		if(hour == 20 && Licitatie == 0 || hour == 21 && Licitatie == 0) {
			if(FreeBusinesses() > 0) {
				new id = GetBizzID();
				Licitatie = 1;
				TipLicitatie = 2;
				TimpLicitatie = 5*60;
				TotalBani = 0;
				foreach(new i: Player) {
					if(IsPlayerConnected(i) && IsPlayerLogged[i] == 1) TotalMoney[i] = 0;
				}
				IDLicitatie = id;
				LastPlayer = -1;

				foreach(new i: Player) {
					if(IsPlayerConnected(i) && toglicitatie[i] == 0) {
						SendClientMessage(i, COLOR_YELLOW, "Mot phien dau gia moi vua bat dau. Nhung tuy chon xem thong tin ve phien dau gia da bi tat.");
						SendClientMessage(i, COLOR_YELLOW, "Neu ban muon xem thong tin dau gia, hay su dung /tog de bat no len. De hieu them ve dau gia, su dung /info.");
					}
				}
				
				MesajLicitatie(0x7A45FFFF, "Mot phien dau gia moi vua bat dau!");
				switch(TipLicitatie) {
					case 1: format(string, sizeof(string), "Lan nay, chung toi se dau gia House ID %d. (/findhouse %d). ", id, id);
					case 2: format(string, sizeof(string), "Lan nay, chung toi se dau gia Bizz ID %d. (/findbiz %d). ", id, id);
				}
				MesajLicitatie(0x7A45FFFF, string);
				format(string, sizeof(string), "Ban co 5 phut de ra gia.");
				MesajLicitatie(0x7A45FFFF, string);
				MesajLicitatie(0x7A45FFFF, "Cac lenh co san (/bid - de dat gia), (/info - xem huong dan & thong tin)");		
			}
			else if(FreeHouses() > 0) {
				new id = GetHouseID();
				Licitatie = 1;
				TipLicitatie = 1;
				TimpLicitatie = 5*60;
				TotalBani = 0;
				foreach(new i: Player) {
					if(IsPlayerConnected(i) && IsPlayerLogged[i] == 1) TotalMoney[i] = 0;
				}
				IDLicitatie = id;
				LastPlayer = -1;

				foreach(new i: Player) {
					if(IsPlayerConnected(i) && toglicitatie[i] == 0) {
						SendClientMessage(i, COLOR_YELLOW, "Mot phien dau gia moi vua bat dau. Nhung tuy chon xem thong tin ve phien dau gia da bi tat.");
						SendClientMessage(i, COLOR_YELLOW, "Neu ban muon xem thong tin dau gia, hay su dung /tog de bat no len. De hieu them ve dau gia, su dung /info.");
					}
				}
				
				MesajLicitatie(0x7A45FFFF, "Mot phien dau gia moi vua bat dau!");
				switch(TipLicitatie) {
					case 1: format(string, sizeof(string), "Lan nay, chung toi se dau gia House ID %d. (/findhouse %d). ", id, id);
					case 2: format(string, sizeof(string), "Lan nay, chung toi se dau gia Bizz ID %d. (/findbiz %d). ", id, id);
				}
				MesajLicitatie(0x7A45FFFF, string);
				format(string, sizeof(string), "Ban co 5 phut de ra gia.");
				MesajLicitatie(0x7A45FFFF, string);
				MesajLicitatie(0x7A45FFFF, "Cac lenh co san (/bid - de dat gia), (/info - xem huong dan & thong tin)");
			}			
			else if(minute == 0 && second == 0) SendAdminMessage(COLOR_LOGS, "AdmBot: Khong co thong tin nao ve cuoc dau gia.", 1);
		}
	}
	
	// Race Arena
	if(RaceStarted == 1 && Iter_Count(PlayerInRace) == 0) RaceStarted = 0;
	if(RaceTime > 0) {
		RaceTime --;
		format(string, sizeof(string), "~y~%d", RaceTime);
		GameTextForRace(string);
		if(RaceTime == 0) {
			StartRaceArena();
			format(string, sizeof(string), "~y~GO! GO! GO!");
			GameTextForRace(string);		
		}
	}
	
	// Paintball arena
	if(painttime > 0) painttime--;	
	if(PaintText[0] > 0) {
		PaintText[0] --;
		if(PaintText[0] == 0) format(string, sizeof(string), "~w~Round da bat dau~n~Chuc tat ca may man!");
		else format(string, sizeof(string), "~w~Round moi bat dau sau ~n~~b~%d giay", PaintText[0]);
		GameTextForPaint(string, 0);
	}
	if(PaintText[1] > 0) {
		PaintText[1] --;
		if(PaintText[1] == 0) format(string, sizeof(string), "~w~Round da bat dau~n~Chuc tat ca may man!");
		else  format(string, sizeof(string), "~w~Round moi bat dau sau ~n~~b~%d giay", PaintText[1]);
		GameTextForPaint(string, 1);
	}	
	if(PaintText[2] > 0) {
		PaintText[2] --;
		if(PaintText[2] == 0) format(string, sizeof(string), "~w~Round da bat dau~n~Chuc tat ca may man!");
		else  format(string, sizeof(string), "~w~Round moi bat dau sau ~n~~b~%d giay", PaintText[2]);
		GameTextForPaint(string, 2);
	}						
	if(PaintTime[0] > 0 && PlayersOnPaint(0) > 1) {
		PaintTime[0] --;
		if(PaintTime[0] == 0) {
			SendPaintMessage(1, COLOR_YELLOW, "Tran dau se bat dau sau mot phut. De binh chon ban do, hay su dung /votemap.");
			PaintVote[0] = 1;	
			if(PaintTimer[0] != Timer:0) {
				stop PaintTimer[0]; 
				PaintTimer[0] = Timer:0;
			}
			PaintTimer[0] = defer CalculateVote(0);		
		}
	}
	if(PaintTime[1] > 0 && PlayersOnPaint(1) > 1) {
		PaintTime[1] --;
		if(PaintTime[1] == 0) {
			SendPaintMessage(1+1, COLOR_YELLOW, "Tran dau se bat dau sau mot phut. De binh chon ban do, hay su dung /votemap.");
			PaintVote[1] = 1;	
			if(PaintTimer[1] != Timer:0) {
				stop PaintTimer[1];
				PaintTimer[1] = Timer:0;
			}
			PaintTimer[1] = defer CalculateVote(1);
		}		
	}
	if(PaintTime[2] > 0 && PlayersOnPaint(2) > 1) {
		PaintTime[2] --;
		if(PaintTime[2] == 0) {
			SendPaintMessage(2+1, COLOR_YELLOW, "Tran dau se bat dau sau mot phut. De binh chon ban do, hay su dung /votemap.");
			PaintVote[2] = 1;	
			if(PaintTimer[2] != Timer:0) {
				stop PaintTimer[2]; 
				PaintTimer[2] = Timer:0;
			}
			PaintTimer[2] = defer CalculateVote(2);	
		}		
	}

	// Restart Server
	if(RestartTime > 0) {
		RestartTime--;
		
		if(RestartTime <= 60) {
			format( string, sizeof(string), "~w~May chu se khoi dong lai sau~n~~r~%d giay", RestartTime);
			GameTextForAll( string, 1100, 4 );
		}
		if(RestartTime == 3) {
			foreach(new i: Player) {
				if(IsPlayerConnected(i) && IsPlayerLogged[i] == 1 && PlayerInfo[i][pAdmin] < 7) KickEx(i);
			}
		}
		if(RestartTime == 0) GameModeExit();
	}

	// Dynamic Event
	if(ActiveEvent == 1 && EventTime == 0) {
		if(EventType == 3) {
			format(string, sizeof(string), "~r~Khung bo: ~w~~h~%d~n~~b~Chong khung bo: ~w~~h~%d", GetTeamMembers(1), GetTeamMembers(2));
			TextDrawSetString(EventCS, string);
		}
		else if(EventType == 6) {
			format(string, sizeof(string), "~p~Zombies: ~w~~h~%d~n~~w~Humans: ~w~~h~%d", GetTeamMembers(1), GetTeamMembers(2));
			TextDrawSetString(EventCS, string);		
		}
		else {
			format(string, sizeof(string), "~p~Con song: ~w~~h~%d", GetPlayersOnEvent());
			TextDrawSetString(EventCS, string);		
		}		
		
		if(EventType == 3) {
			if(GetTeamMembers(1) == 0) {
				format(string, sizeof(string), "(( AdmBot: Team {5AAFFA}Chong khung bo{A9C4E4} da gianh chien thang su kien va da nhan duoc tien thuong $%s. Xin chuc mung! ))", FormatNumber(EventMoney));
				SCMTA(COLOR_CLIENT, string);
				foreach(new i: Player) {
					if(Team[i] == 2 && IsPlayerConnected(i)) GivePlayerCash(i, EventMoney), SpawnPlayer(i);
					if(InEvent[i]) InEvent[i] = 0;
				}
				ActiveEvent = 0;
			}
			else if(GetTeamMembers(2) == 0) {
				format(string, sizeof(string), "(( AdmBot: Team {FA5A5A}Khung bo{A9C4E4} da gianh chien thang su kien va da nhan duoc tien thuong $%s. Xin chuc mung! ))", FormatNumber(EventMoney));
				SCMTA(COLOR_CLIENT, string);
				foreach(new i: Player) {
					if(Team[i] == 1 && IsPlayerConnected(i))  GivePlayerCash(i, EventMoney), SpawnPlayer(i);
					if(InEvent[i]) InEvent[i] = 0;
				}
				ActiveEvent = 0;
			}
		}
		else if(EventType == 6) {
			if(GetTeamMembers(2) == 0) {
				format(string, sizeof(string), "(( AdmBot: Team {B366FF}Zombie{A9C4E4} da gianh chien thang su kien va da nhan duoc tien thuong $%s. Xin chuc mung! ))", FormatNumber(EventMoney));
				SCMTA(COLOR_CLIENT, string);
				foreach(new i: Player) {
					if(Team[i] == 1 && IsPlayerConnected(i)) GivePlayerCash(i, EventMoney), SpawnPlayer(i);
					if(InEvent[i]) InEvent[i] = 0;
				}
				ActiveEvent = 0;
			}
			else if(GetTeamMembers(1) == 0) {
				format(string, sizeof(string), "(( AdmBot: Team {FFFFFF}Human{A9C4E4} da gianh chien thang su kien va da nhan duoc tien thuong $%s. Xin chuc mung! ))", FormatNumber(EventMoney));
				SCMTA(COLOR_CLIENT, string);
				foreach(new i: Player) {
					if(Team[i] == 2 && IsPlayerConnected(i)) GivePlayerCash(i, EventMoney), SpawnPlayer(i);
					if(InEvent[i]) InEvent[i] = 0;
				}
				ActiveEvent = 0;
			}
		}			
		else CheckEventWinner();	
	}
	
	// Licitatie
	if(Licitatie == 1) {
		TimpLicitatie --;
		if(TimpLicitatie == 0) {
			Licitatie = 0;
			if(LastPlayer == -1) SCMTA(COLOR_YELLOW, "Phien dau gia da bi huy vi khong co nguoi tham gia.");
			else {
				if(!IsPlayerConnected(LastPlayer) || TotalMoney[LastPlayer] == 0) SCMTA(COLOR_YELLOW, "Phien dau gia da bi huy vi nguoi cuoi cung dat gia da out game.");
				else {
					SCMTA(0x7A45FFFF, "Dau gia da ket thuc.");
					format(string, sizeof(string), "Dau gia da ket thuc, nguoi chien thang la %s(%d) voi so tien dat ra la $%s.", GetName(LastPlayer), LastPlayer, FormatNumber(TotalMoney[LastPlayer]));
					SCMTA(0x7A45FFFF, string);
					GivePlayerCash(LastPlayer, -TotalBani);
					new query[200];
					switch(TipLicitatie) {
						case 1: {
							format(string, sizeof(string), "Ban da mat House (%d) vi no da duoc ban dau gia khi ban offline qua lau.", IDLicitatie);
							InsertEmail(HouseInfo[IDLicitatie][hOwner], "AdmBot", string, 0);
							format(string, sizeof(string), "Ban nhan duoc House %d thanh cong. Chuc mung!", IDLicitatie);
							SendClientMessage(LastPlayer, COLOR_YELLOW, string);
							// finishAchievement(LastPlayer, 3);	
							format(query, sizeof(query), "UPDATE `users` SET `House`='999' WHERE `House`='%d'", IDLicitatie);
							mysql_query(SQL, query, false);
							foreach(new i: Player) {
								if(IsPlayerConnected(i) && PlayerInfo[i][pHouse] == IDLicitatie) {
									SendClientMessage(i, COLOR_YELLOW, "Ban da mat ngoi nha yeu thuong cua minh sau cuoc dau gia. Li do: vi ban off qua lau.");
									PlayerInfo[i][pHouse] = 999;
									Update(i,pHousex);
								}
							}
							PlayerInfo[LastPlayer][pHouse] = IDLicitatie;
							PlayerInfo[LastPlayer][pRented] = -1;
							HouseInfo[IDLicitatie][hOwned] = 1;
							HouseInfo[IDLicitatie][hValue] = 0;
							
							strmid(HouseInfo[IDLicitatie][hOwner], GetName(LastPlayer), 0, strlen(GetName(LastPlayer)), 255);
							Update(LastPlayer,pHousex);
							format(query, sizeof(query),"UPDATE `houses` SET `Owned`='1',`Owner`='%s',`Value`='0' WHERE `ID`='%d'",GetName(LastPlayer),IDLicitatie);
							mysql_query(SQL, query, false);
							OnPropTextdrawUpdate(1,IDLicitatie);
						}
						case 2: {
							format(string, sizeof(string), "Ban da mat Bizz (%d) vi no da duoc ban dau gia khi ban offline qua lau.", IDLicitatie);
							InsertEmail(BizzInfo[IDLicitatie][bOwner], "AdmBot", string, 0);					
							format(string, sizeof(string), "Ban nhan duoc Bizz %d thanh cong. Chuc mung!", IDLicitatie);
							SendClientMessage(LastPlayer, COLOR_YELLOW, string);
							// finishAchievement(LastPlayer, 2);	
							format(query, sizeof(query), "UPDATE `users` SET `Bizz`='255' WHERE `Bizz`='%d'", IDLicitatie);
							mysql_query(SQL, query, false);
							foreach(new i: Player) {
								if(IsPlayerConnected(i) && PlayerInfo[i][pBizz] == IDLicitatie) {
									SendClientMessage(i, COLOR_YELLOW, "Ban da mat di bizz cua minh vi no da duoc ban dau gia. Li do: vi ban offline qua lau.");
									PlayerInfo[i][pBizz] = 255;
									Update(i,pBizzx);
								}
							}
							PlayerInfo[LastPlayer][pBizz] = IDLicitatie;
							BizzInfo[IDLicitatie][bOwned] = 1;
							BizzInfo[IDLicitatie][bBuyPrice] = 0;
							strmid(BizzInfo[IDLicitatie][bOwner], GetName(LastPlayer), 0, strlen(GetName(LastPlayer)), 255);
							format(query, sizeof(query),"UPDATE users SET `Money`='%d',`Bizz`='%d' WHERE `ID`='%d'",GetPlayerCash(LastPlayer),PlayerInfo[LastPlayer][pBizz],PlayerInfo[LastPlayer][pSQLID]);
							mysql_query(SQL,query, false);
							format(query, sizeof(query),"UPDATE `bizz` SET `Owned`='1',`Owner`='%s',`BuyPrice`='0' WHERE `ID`='%d'",BizzInfo[IDLicitatie][bOwner],IDLicitatie);
							mysql_query(SQL,query, false);
							OnPropTextdrawUpdate(2,IDLicitatie);
						}
					}
				}
			}	
		}
	}
	return 1;
}
ptask PlayerWantd[15000](playerid) {
	if(PlayerInfo[playerid][pWantedLevel] > 0 && !Iter_Contains(PlayerWanted, playerid)) Iter_Add(PlayerWanted, playerid);
	else if(PlayerInfo[playerid][pWantedLevel] == 0) Iter_Remove(PlayerWanted, playerid);
	if(PlayerInfo[playerid][pJobBonus50] != 0 && gettime() - PlayerInfo[playerid][pJobBonus50] > 0) {
		SendClientMessage(playerid, COLOR_GREY, "[JOB BONUS PACK] "WHITE"Goi +50%% job money cua ban da het han.");
		PlayerInfo[playerid][pJobBonus50] = 0;
		UpdateVar(playerid, "JobBonus50", 0);
	}
	if(PlayerInfo[playerid][pJobBonus100] != 0 && gettime() - PlayerInfo[playerid][pJobBonus100] > 0) {
		SendClientMessage(playerid, COLOR_GREY, "[JOB BONUS PACK] "WHITE"Goi +100%% job money cua ban da het han.");
		PlayerInfo[playerid][pJobBonus100] = 0;
		UpdateVar(playerid, "JobBonus100", 0);		
	}
}
task DecreaseTimer[1000]() { 
	new string[150];
	
	foreach(new i : PlayerWanted) {
		if(PlayerInfo[i][pWantedLevel] > 0 && WantedTime[i] >= 10) {
   			WantedTime[i] = 0;
		    PlayerInfo[i][pWantedLevel] --;
			SetPlayerWantedLevel(i, PlayerInfo[i][pWantedLevel]);
		    Update(i, pWantedLevelx);
		    if(PlayerInfo[i][pWantedLevel] == 0) {
		    	SendClientMessage(i, COLOR_YELLOW, "Ban khong con bi truy na nua vi canh sat da de mat dau ban!");
		    	PlayerTextDrawHide(i, WantedTD[i]);
				ClearCrime(i);
				// finishAchievement(i, 15);
		    }
		    else va_SendClientMessage(i, COLOR_YELLOW, "Canh sat dang mat dau ban! Truy na thuc te: %d", PlayerInfo[i][pWantedLevel]);

			format(string, sizeof(string), "%s [%d] mat mot cap do truy na. W: %d", GetName(i), i, PlayerInfo[i][pWantedLevel]);
			SendTeamMessage(3, COLOR_DBLUE, string);
			SendTeamMessage(2, COLOR_DBLUE, string);
			SendTeamMessage(1, COLOR_DBLUE, string);			
			SendTeamMessage(15, COLOR_DBLUE, string);			
		}
	}	
	foreach(new i: PlayerGangster) {
		if(InWar[PlayerInfo[i][pMember]] == 1 && ServerSystem[13] == 1 && IsPlayerLogged[i] == 1) {
			new faction = PlayerInfo[i][pMember];
			for(new wi = 1; wi < turfsss;wi++) {
				if(WarInfo[wi][wFaction] == faction || WarInfo[wi][wAttacker] == faction) {
					new attackers = WarInfo[wi][wAttacker];
					new defenders = WarInfo[wi][wFaction];
					new uciderii = 0;
					uciderii += ucideri[i][wi];
					new decesee = 0;
					decesee += decese[i][wi];
					new Float: atscore = 0.0;
					new Float: defscore = 0.0;
					atscore = WarScoreF[attackers][wi];
					defscore = WarScoreF[defenders][wi];						
			
					if(playerDeath[i] == 0 && PlayerInfo[i][pWantedLevel] == 0 && PlayerInfo[i][pJailTime] == 0 && GetPlayerInterior(i) == 0 && GetPlayerVirtualWorld(i) == 0) {
						SetPlayerVirtualWorld(i, wi);
						format(string, sizeof(string), "Ban da duoc dich chuyen den virtual world %d (the gioi ao) vi mafia cua ban dang bao ve hoac tranh gianh dia ban.", wi);
						SendClientMessage(i, COLOR_YELLOW, string);
					}

					if(WarInfo[wi][wFaction] == faction)
					{
						format(string, sizeof(string), "Turf: %s (%d)~n~%s %.1f - %.1f %s~n~Giet: %d Chet: %d Diem: %d~n~Giay tren dia ban: %d~n~Thoi gian war: ~y~~h~%s~w~~h~",
						TurfInfo[wi][zName],wi,FactionName(attackers),atscore,defscore,FactionName(defenders),
						uciderii, decesee, uciderii-decesee, WarSeconds[i], CalculeazaTimp2(WarInfo[wi][wTime]));
					}
					else if(WarInfo[wi][wAttacker] == faction)
					{
						format(string, sizeof(string), "Turf: %s (%d)~n~%s %.1f - %.1f %s~n~Giet: %d Chet: %d Diem: %d~n~Giay tren dia ban: %d~n~Thoi gian war: ~y~~h~%s~w~~h~",
						TurfInfo[wi][zName],wi,FactionName(attackers),atscore,defscore,FactionName(defenders),
						uciderii, decesee, uciderii-decesee, WarSeconds[i], CalculeazaTimp2(WarInfo[wi][wTime]));
					}			
					break;
				}
			}
			PlayerTextDrawSetString(i, WarTime, string);
			PlayerTextDrawShow(i, WarTime);

			if(IsPlayerInTurf(i, InWarTurf[PlayerInfo[i][pMember]])) {
				new turf = InWarTurf[PlayerInfo[i][pMember]];
				if(WarInfo[turf][wFaction] == PlayerInfo[i][pMember] || WarInfo[turf][wAttacker] == PlayerInfo[i][pMember]) {
					if(IsPlayerPaused(i) == false) WarSeconds[i] ++;
					if(IsPlayerInAnyVehicle(i)) {
						SendClientMessage(i, COLOR_YELLOW, "Ban da vao khu vuc chiem dia ban.");
					    new Float: Pos[3], vid= GetPlayerVehicleID(i);
					    GetPlayerPos(i, Pos[0], Pos[1], Pos[2]);
					    SetPlayerPosEx(i, Pos[0], Pos[1], Pos[2]+1);
					    SetVehicleToRespawn(ServerVehicles[vid][vSpawned]), Gas[ServerVehicles[vid][vSpawned]] = 100;
					}
					/*if(GetPlayerVirtualWorld(i) != 0 && UsingSampcac{i} == 0) {
						SetPlayerVirtualWorld(i, 0);
					}*/
				}
			}
		}
	}
	foreach(new i: Player) {
		if(IsPlayerLogged[i] == 1) {
			new Float: playerArmour; 
			GetPlayerArmour(i, playerArmour);			
			if(playerArmour == 100 && PlayerInfo[i][pAdmin] == 0 && GetPVarInt(i, "Armour") == 0) {
				if(ServerSystem[3] == 0) NightBot(i, "Cheats (armour-hack)");	
			}
			if(PlayerMobileInfo[i][isMobile] == false) Resetnametag(i);
			// if(IsPlayerInRangeOfPoint(i, 40.0, 1116.1476,-1457.6807,13.8592)) {	
			// 	PlayAudioStreamForPlayer(i, "https://steamcast.com/sbin/listen.m3u?id=6105239", 1116.1476,-1457.6807,13.8592, 100.0, 1);
			// }	
			// }
			// else {
			// 	if(GetPVarInt(i, "Listening") == 1) SetPVarInt(i, "Listening", 0);
			// }
			//if(FPS2[i] == 0 && AFKSeconds[i] > 120 && PlayerInfo[i][pSleeping] == 0) NightBot(i, "rakdroid");

			// new Float: playerHealth; 
			// GetPlayerArmour(i, playerHealth);			
			// if(playerHealth == 100 && PlayerInfo[i][pAdmin] == 0) {
			// 	if(ServerSystem[8] == 0) NightBot(i, "Cheats (health-hack)");	
			// }
			
			// if(IsPlayerInRangeOfPoint(i, 30.0, 184.3529,-1825.4983,8.7530)) {	
			// 	if(GetPVarInt(i, "Listening") == 0) {
			// 		PlayAudioStreamForPlayer(i, beachlink, 184.3529,-1825.4983,8.7530, 30.0, 1);
			// 		SetPVarInt(i, "Listening", 1);
			// 	}	
			// }
			// else {
			// 	if(GetPVarInt(i, "Listening") == 1) SetPVarInt(i, "Listening", 0);
			// }

			if(timeVCarSpawn[i] >= 1)   
				timeVCarSpawn[i]--;
			else timeVCarSpawn[i] = 0;

			// if(AcWarning{i} >= 1) AcWarning{i} --;
			if(PlayerInfo[i][pReportTime] > 0) {
				PlayerInfo[i][pReportTime] -= 1;
			} else if(PlayerInfo[i][pReportTime] < 0) PlayerInfo[i][pReportTime] = 0;
			if(PlayerInfo[i][pNewbieMute] > 0) {
				PlayerInfo[i][pNewbieMute] -= 1;				
			} else if(PlayerInfo[i][pNewbieMute] < 0) PlayerInfo[i][pNewbieMute] = 0;
			if(FreezeTime[i] != 0) {
				FreezeTime[i] -= 1;
				if(FreezeTime[i] < 0) FreezeTime[i] = 0;
				else if(FreezeTime[i] == 0) {
					SendClientMessage(i, COLOR_LIGHTBLUE, "Ban khong con bi dong bang!");
					TogglePlayerControllable(i, true);
				}
			}
			if(PlayerInfo[i][pJob] == 11) GangZoneShowForPlayer(i, CauCaZoneZ[0], 0xFF00A250); //None
			if(PlayerInfo[i][pJob] == 11)  GangZoneShowForPlayer(i, CauCaZoneZ[1], 0xFF00A250); //None
			if(PlayerInfo[i][pJob] == 11)  GangZoneShowForPlayer(i, CauCaZoneZ[2], 0xFF00A250); //None
			if(PlayerInfo[i][pJob] != 11) GangZoneHideForPlayer(i, CauCaZoneZ[0]); //None
			if(PlayerInfo[i][pJob] != 11) GangZoneHideForPlayer(i, CauCaZoneZ[1]); //None
			if(PlayerInfo[i][pJob] != 11) GangZoneHideForPlayer(i, CauCaZoneZ[2]); //None

			
			if(GetPlayerState(i) == PLAYER_STATE_DRIVER || GetPlayerState(i) == PLAYER_STATE_PASSENGER)
			{
				if(PlayerInfo[i][pWantedLevel] != 0)
				{
					new Float: vhp;
					GetVehicleHealth(GetPlayerVehicleID(i), vhp);
					if(vhp < 255.0) {
						new Float:slx, Float:sly, Float:slz;
						SetPlayerHealthEx(i, 150);
						GetPlayerPos(i, slx, sly, slz);
						SetPlayerPosEx(i, slx, sly, slz+10);
						PlayerPlaySound(i, 1190, slx, sly, slz+10);
					}
				}
			}
			if(InWar[PlayerInfo[i][pMember]] == 0) {
				for(new sf = 0; sf < sizeof(sfz); sf++) {
					if(PlayerToPoint(20.0, i, GraffitiInfo[sf][gfX], GraffitiInfo[sf][gfY], GraffitiInfo[sf][gfZ]) && Showed[i] == 0) {
						PlayerTextDrawSetString(i, SafeTD, "KHU VUC CLAN");
						PlayerTextDrawShow(i, SafeTD);	
						Showed[i] = 2;
						SFID[i] = sf;
					}
					// else if(!PlayerToPoint(20.0, i, GraffitiInfo[SFID[i]][gfX], GraffitiInfo[SFID[i]][gfY], GraffitiInfo[SFID[i]][gfZ]) && Showed[i] == 2) {
					// 	PlayerTextDrawHide(i, SafeTD);	
					// 	Showed[i] = 0;
					// 	SFID[i] = 0;					
					// } Array index out of bounds SFID get clan num return > SFID
					
					if(SafeZone[sf][szRange] >= 15) {
						if(PlayerToPoint(SafeZone[sf][szRange], i, SafeZone[sf][szX], SafeZone[sf][szY], SafeZone[sf][szZ]) && Showed[i] == 0) {
							Showed[i] = 1;
							SFID[i] = sf;
							PlayerTextDrawSetString(i, SafeTD, "KHU AN TOAN");
							PlayerTextDrawShow(i, SafeTD);
						}
						else if(!PlayerToPoint(SafeZone[SFID[i]][szRange], i, SafeZone[SFID[i]][szX], SafeZone[SFID[i]][szY], SafeZone[SFID[i]][szZ]) && Showed[i] == 1) {
							Showed[i] = 0;
							SFID[i] = 0;
							PlayerTextDrawHide(i, SafeTD);
						}
					}
				}
			}
			// if(InWar[PlayerInfo[i][pMember]] == 0) {
			// 	new bool:test = false, bool:isInClanZone = false;
			// 	for(new sf = 0; sf < sizeof(sfz); sf++) {
			// 		if(IsPlayerInRangeOfPoint(i, SafeZone[sf][szRange], SafeZone[sf][szX], SafeZone[sf][szY], SafeZone[sf][szZ]) && SafeZone[sf][szRange] > 15) {
			// 			// Showed[i] = 1;
			// 			SFID[i] = sf;
			// 			PlayerTextDrawSetString(i, SafeTD, "SAFE-ZONE");
			// 			PlayerTextDrawShow(i, SafeTD);
			// 			test = true;
			// 			break;
			// 		}
			// 	}
			// 	if(!test) {
			// 		for(new sf = 0; sf < MAX_CLANZONES; sf++) {
			// 			if(IsPlayerInRangeOfPoint(i, 20.0, GraffitiInfo[sf][gfX], GraffitiInfo[sf][gfY], GraffitiInfo[sf][gfZ])) {
			// 				PlayerTextDrawSetString(i, SafeTD, "CLAN-ZONE");
			// 				PlayerTextDrawShow(i, SafeTD);
			// 				// SFID[i] = sf;
			// 				isInClanZone = test = true;
			// 				break;
			// 			}
			// 		}					
			// 	}
			// 	if(!test && !isInClanZone) {
			// 		// Showed[i] = 0;
			// 		SFID[i] = 0;
			// 		PlayerTextDrawHide(i, SafeTD);
			// 	}
			// }
		}
	}	
	return 1;
}
task Timers[1000]() {
	new 
		string[180],
		Float: x, Float: y, Float: z, Float: animpos[3], anim;

	foreach(new i : PlayerWanted) {
		if(PlayerInfo[i][pWantedLevel] > 0) {
			format(string, sizeof(string), "Truy na thuc te: ~y~%d~n~~w~~h~Truy na giam sau: ~y~%d phut.", PlayerInfo[i][pWantedLevel], 10-WantedTime[i]);
			PlayerTextDrawSetString(i, WantedTD[i], string);
			PlayerTextDrawShow(i, WantedTD[i]);
		}		
		else PlayerTextDrawHide(i, WantedTD[i]);
	}

	foreach(new i: Player) {
		if(IsPlayerLogged[i] == 1) {
			if(JobWorking[i] == 1) {
				WorkingTime[i] ++;
				if(JobLeftTime[i] > 0) {
					JobLeftTime[i] --;
					if(JobLeftTime[i] == 60) SendClientMessage(i, COLOR_YELLOW, "Ban co 1 phut de quay lai chiec xe lam viec.");
					if(JobLeftTime[i] == 0) {
						SendClientMessage(i, COLOR_GREY, "Cong viec that bai! Ban da khong tro ve xe kip luc.");
						if(playerObject[i] != 0) DestroyPlayerObject(i, playerObject[i]), playerObject[i] = 0;
						if(playerObject2[i] != 0) DestroyObject(playerObject2[i]), playerObject2[i] = 0;
						JobWorking[i] = 0;
						PlayerTextDrawHide(i, JobTD);
						if(JobVehicle[i] != 0) { DestroyVehicle(JobVehicle[i]); JobVehicle[i] = 0; }
						if(Trailer[i] != 0) { DestroyVehicle(Trailer[i]); Trailer[i] = 0;  }
						PlayerTextDrawHide(i, InfosTD);
						DisablePlayerCheckpointEx(i);
						DisablePlayerRaceCheckpointEx(i);
						RemovePlayerAttachedObject(i, 6);
						RemovePlayerAttachedObject(i, 2);
						CP[i] = 0;
						JobVehicle[i] = 0;
						JobDeelay[i][PlayerInfo[i][pJob]] = 180;	
						DestroyWoodObject(i);	
					}
				}
			}
			if(Iter_Contains(PlayerInRace, i) && RaceStarted == 1 && RaceTime == 0) {
				playerRaceTime[i] ++;
				format(string, sizeof(string), "Vi tri: ~y~%d/%d~w~~h~~n~Checkpoints: ~y~%d/%d~w~~h~~n~Thoi gian: ~y~%s", playerRacePlace[i], RacePlayers, RaceCP[i]-1, RaceCheckpoints(), CalculeazaTimp2(playerRaceTime[i]));
				PlayerTextDrawSetString(i, CpTD, string);
				PlayerTextDrawShow(i, CpTD);		
			}
			if(PlayerInfo[i][pDelayXiDach] != 0 && PlayerInfo[i][pCountXiDach] != 0 )
				PlayerInfo[i][pDelayXiDach]--;
			else if(PlayerInfo[i][pDelayXiDach] <= 0 && PlayerInfo[i][pCountXiDach] != 0) {
				PlayerInfo[i][pCountXiDach] = 0;
				PlayerInfo[i][pDelayXiDach] = 0;

				SendClientMessage(i, COLOR_YELLOW, "Ban da co the choi xi dach");
			}
			if(CP[i] != 0 && PlayerInfo[i][pShowCP] == 1) {
				new str[64], Float: fDistance = GetPlayerDistanceFromPoint(i, CheckpointPos[i][0], CheckpointPos[i][1], CheckpointPos[i][2]);
				format(str, sizeof(str), "Khoang cach: %0.1fm", fDistance);
				PlayerTextDrawSetString(i, CpTDD, str);
				PlayerTextDrawShow(i, CpTDD);
			}	
			
			if(NearWanted[i] == 1) show_near_wanted(i);

			if(IsPlayerRunning(i) && Aduty[i] != 1 && InWar[PlayerInfo[i][pMember]] == 0){
				GivePlayerStamina(i, -6);
			}
			if(GetPlayerStamina(i) <= 30) //The smaller the faster it drains 
			{
				Stamina_SetValue(i, -RandomMinMax(1, 2));
				SetPlayerStamina(i, 100);
			}
			if(InTraining[i] == 1 && PlayerInfo[i][pWantedLevel] != 0) {
				InTraining[i] = 0;
				FactionsSpawns(i);
				new t = GetPVarInt(i, "Training");
				SetPlayerPosEx(i, Training[t][trainingX], Training[t][trainingY], Training[t][trainingZ]);
				DeletePVar(i, "Training");
				ResetPlayerWeapons(i);
				SendClientMessage(i, COLOR_YELLOW, "Ban da duoc dua ra khoi phong tap vi bi truy na!");			   
			}
			if(GetPlayerState(i) == PLAYER_STATE_DRIVER && GetPlayerInterior(i) == 0) {
				if(!nearPNS(i) && VehicleExist[GetPlayerVehicleID(i)] == 1 && PlayerInfo[i][pAdmin] == 0) {
					new Float: vhp;
					GetVehicleHealth(GetPlayerVehicleID(i), vhp);
					if(vhp == 1000) {
						// if(ServerSystem[7] == 0) NightBot(i, "Cheats (repair-hack)");
						RemovePlayerFromVehicle(i);
					}					
				}
				if(!nearPNS2(i) && NearPNS[i] == 1) DisableRemoteVehicleCollisions(i, 0), NearPNS[i] = 0;
				if(nearPNS2(i)) {
					DisableRemoteVehicleCollisions(i, 1);
					NearPNS[i] = 1;
				}
			}	
			if(TradeTime[i] > 0) {
				TradeTime[i] --;
				new id = TradeID[i];
				format(string, sizeof(string), "00:0%d", TradeTime[i]);
				PlayerTextDrawSetString(i, TradePTD[6], string);
				PlayerTextDrawSetString(id, TradePTD[6], string);
				PlayerTextDrawShow(i, TradePTD[6]);
				PlayerTextDrawShow(id, TradePTD[6]);				
				if(TradeTime[i] == 0) {
					FinishTrade(i);
					PlayerTextDrawHide(i, TradePTD[6]);
					PlayerTextDrawHide(id, TradePTD[6]);					
				}
			}
			if(CrateTime[i] > 0 )
			{
				CrateTime[i] --;				
				new amount;
				if(CrateTime[i] == 0)
				{
					if(CrateModel[i] == 0) {
					KillTimer(TimerCratesEx[i]);
					CrateModel[i] = -1;
					TatQuayGuong(i);
					return 1;
					}
				}
				switch(GetPVarInt(i, "VoucherType")) {
				case 1: {
					format(string, sizeof(string), "%s da mo crate Random Skin con lai %d.", GetName(i), PlayerInfo[i][pCrates][0]);
					Log("logs/opencrate.log", string);
					new rand = random(100);
					switch(rand) {
				    	case 0..74: {
				    		LoadSkins(0, amount);
				            format(string, 70, "Skin %d", amount);
				            PlayerTextDrawSetPreviewModel(i, CratePTD[0], amount);
				            PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
				            if(CrateTime[i] == 0) {
						    	{
				            		{
				            			if(CrateModel[i] == 0) {
											KillTimer(TimerCratesEx[i]);
						                	CrateModel[i] = -1;
						                	return 1;
				            			}
										format(string, 120,"(( Random Skin {A9C4E4}- %s mo hop va nhan duoc skin %d ))", GetName(i), amount);
										SCMTA(COLOR_CLIENT, string);  
										// new const success = Player_AddItem(i, ItemType:item_type_skin, amount, 100);
										// if(success == -1) {
										// 	PlayerInfo[i][pCrates][0] ++;
										// 	save_crates(i);
										// 	KillTimer(TimerCratesEx[i]);
						                // 	CrateModel[i] = -1; TatQuayGuong(i);
										// 	return SendClientMessagei,COLOR_LGREEN, "ERROR: Ban da het slot skin cho nen ban se duoc tra lai mot hom!");

										// }
										if(checkslotinv(i) == 24) {
											SendClientMessage(i, -1, "Tui do cua ban da day.");
											PlayerInfo[i][pCrates][0] += 1, save_crates(i);
											KillTimer(TimerCratesEx[i]);
						                	CrateModel[i] = -1; TatQuayGuong(i);
										}
										if(checkslotskin(i) == 10) {
											SendClientMessage(i, -1, "Ban da full slot skin.");
											PlayerInfo[i][pCrates][0] += 1, save_crates(i);
											KillTimer(TimerCratesEx[i]);
						                	CrateModel[i] = -1; TatQuayGuong(i);
										}
										if(checktrungskin(i,amount) != 0) {
											SendClientMessage(i, -1, "Ban da so huu skin nay.");
											PlayerInfo[i][pCrates][0] += 1, save_crates(i);
											KillTimer(TimerCratesEx[i]);
						                	CrateModel[i] = -1; TatQuayGuong(i);
										}
										if(Inventory_GetFreeID(i, 1) == -1) Inventory_Add(i,"Skins", amount, 1, 2);
											else Inventory_Add(i,"Skins", amount, 1, 1);
										save_crates(i);
										KillTimer(TimerCratesEx[i]);
						                CrateModel[i] = -1; TatQuayGuong(i);
									}	
				            	}
				            }
						}
						case 75..87: {
							amount = 2000000;
							format(string, 64, "2.000.000$");
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 1212);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
							if(CrateTime[i] == 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GivePlayerCash(i, 2000000);
									// GiveVehicle(i, 555);
									TatQuayGuong(i);
									format(string, 120,"(( {7556ff}Random Skin{A9C4E4}- %s mo hop va nhan duoc 2.000.000$. ))", GetName(i));
									SCMTA(COLOR_CLIENT,string);
							}
						}
						case 88..97: {
							amount = 60;
				            format(string, 75, "~y~%s Vip Xu.", FormatNumber(amount), totalcrates(i));
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 1275);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
				            if(CrateTime[i] == 0) {
						        if(CrateModel[i] == 0) {
									format(string, 120,"(( {7556ff}Random Skin{A9C4E4}- %s mo hop va nhan duoc %d xu. ))", GetName(i), amount);
								    SCMTA(COLOR_CLIENT, string); 
								    PlayerInfo[i][pPremiumPoints] += amount;
								    Update(i, pPremiumPointsx);
								}
						        KillTimer(TimerCratesEx[i]);
						        CrateModel[i] = -1; TatQuayGuong(i);
						    }
						}
						case 98..99: {
							amount = 300;
				            format(string, 75, "~y~%s Vip Xu.", FormatNumber(amount), totalcrates(i));
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 1275);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
				            if(CrateTime[i] == 0) {
						        if(CrateModel[i] == 0) {
									format(string, 120,"(( {7556ff}Random Skin{A9C4E4}- %s mo hop va nhan duoc %d xu. ))", GetName(i), amount);
								    SCMTA(COLOR_CLIENT, string); 
								    PlayerInfo[i][pPremiumPoints] += amount;
								    Update(i, pPremiumPointsx);
								}
						        KillTimer(TimerCratesEx[i]);
						        CrateModel[i] = -1; TatQuayGuong(i);
						    }
						}
						case 100: {
							amount = 200;
				            format(string, 75, "~y~%s Kim Cuong.", FormatNumber(amount), totalcrates(i));
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 953);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
				            if(CrateTime[i] == 0) {
						        if(CrateModel[i] == 0) {
									format(string, 120,"(( {7556ff}Random Skin{A9C4E4}- %s mo hop va nhan duoc %d Kim Cuong. ))", GetName(i), amount);
								    SCMTA(COLOR_CLIENT, string); 
								    PlayerInfo[i][pKC] += amount;
								    Update(i, pKCx);
								}
						        KillTimer(TimerCratesEx[i]);
						        CrateModel[i] = -1; TatQuayGuong(i);
						    }
						}
						default : {
							SendClientMessage(i, COLOR_YELLOW, "Chuc ban may man lan sau");
							printf("%s, %d da mo hop", GetName(i), rand);
						}
					}
				}
				case 3:{
				new rand = random(100);
				format(string, sizeof(string), "%s da mo crate Random Car Rare con lai %d.", GetName(i), PlayerInfo[i][pCrates][1]);
				Log("logs/opencrate.log", string);
				switch(rand) {
						case 0..5: {
							amount = 5000000;
							format(string, 64, "%d", amount);
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 1212);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
							if(CrateTime[i] == 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GivePlayerCash(i, amount);
									// GiveVehicle(i, 555);
									TatQuayGuong(i);
									format(string, 120,"(( {7556ff}Random Car Rare{A9C4E4}- %s mo hop va nhan duoc %s. ))", GetName(i), FormatNumber(amount));
									SCMTA(COLOR_CLIENT,string);
							}
						}
				    	    case 6..33: {
				    		    amount = 120;
								format(string, 75, "~y~%s Vip Xu.", FormatNumber(amount), totalcrates(i));
								PlayerTextDrawSetPreviewModel(i, CratePTD[0], 1275);
								PlayerTextDrawSetString(i, CratePTD[1], string);
								PlayerTextDrawShow(i, CratePTD[0]);
								if(CrateTime[i] == 0) {
						        if(CrateModel[i] == 0) {
									format(string, 120,"(( {7556ff}Random Car Rare {A9C4E4}- %s mo hop va nhan duoc %d xu. ))", GetName(i), amount);
								    SCMTA(COLOR_CLIENT, string); 
								    PlayerInfo[i][pPremiumPoints] += amount;
								    Update(i, pPremiumPointsx);
								}
						        KillTimer(TimerCratesEx[i]);
						        CrateModel[i] = -1; TatQuayGuong(i);
						    }
				            }
				            case 34..40: {
				                format(string, 65, "PCJ-600");
				                PlayerTextDrawSetPreviewModel(i, CratePTD[0], 461);
				                PlayerTextDrawSetString(i, CratePTD[1], string);
								PlayerTextDrawShow(i, CratePTD[0]);
				            	if(CrateTime[i] <= 0) {

										KillTimer(TimerCratesEx[i]);
										CrateModel[i] = -1; TatQuayGuong(i);
										GiveVehicle(i, 461);
									    format(string, 120,"(( {7556ff}Random Car Rare {A9C4E4}- %s mo hop va nhan duoc PCJ-600. ))", GetName(i));
									    SCMTA(COLOR_CLIENT, string);
								}
				            }
				           	case 41..46: {
				                format(string, 65, "Uranus");
				                PlayerTextDrawSetPreviewModel(i, CratePTD[0], 558);
				                PlayerTextDrawSetString(i, CratePTD[1], string);
								PlayerTextDrawShow(i, CratePTD[0]);
				            	if(CrateTime[i] <= 0) {

										KillTimer(TimerCratesEx[i]);
										CrateModel[i] = -1; TatQuayGuong(i);
										GiveVehicle(i, 558);
									    format(string, 120,"(( {7556ff}Random Car Rare {A9C4E4}- %s mo hop va nhan duoc Uranus. ))", GetName(i));
									    SCMTA(COLOR_CLIENT,string);
								}
				            }
				           	case 47..53: {
				                format(string, 65, "Sanchez");
								PlayerTextDrawSetPreviewModel(i, CratePTD[0], 468);
								PlayerTextDrawSetString(i, CratePTD[1], string);
								PlayerTextDrawShow(i, CratePTD[0]);
				            	if(CrateTime[i] <= 0) {

										KillTimer(TimerCratesEx[i]);
										CrateModel[i] = -1; TatQuayGuong(i);
										GiveVehicle(i, 468);
									    format(string, 120,"(( {7556ff}Random Car Rare {A9C4E4}- %s mo hop va nhan duoc Sanchez. ))", GetName(i));
									    SCMTA(COLOR_CLIENT, string);
								    
								}
				            }
				           	case 54..66: {
				                format(string, 65, "ZR-350");
								PlayerTextDrawSetPreviewModel(i, CratePTD[0], 477);
								PlayerTextDrawSetString(i, CratePTD[1], string);
								PlayerTextDrawShow(i, CratePTD[0]);
				            	if(CrateTime[i] <= 0) {

										KillTimer(TimerCratesEx[i]);
										CrateModel[i] = -1; TatQuayGuong(i);
										GiveVehicle(i, 477);
									    format(string, 120,"(( {7556ff}Random Car Rare {A9C4E4}- %s mo hop va nhan duoc ZR-350.))", GetName(i));
									    SCMTA(COLOR_CLIENT, string);
								}
				            }
				           	case 67..70: {
				                format(string, 65, "Super GT");
								PlayerTextDrawSetPreviewModel(i, CratePTD[0], 506);
								PlayerTextDrawSetString(i, CratePTD[1], string);
								PlayerTextDrawShow(i, CratePTD[0]);
				            	if(CrateTime[i] <= 0) {

										KillTimer(TimerCratesEx[i]);
										CrateModel[i] = -1; TatQuayGuong(i);
										GiveVehicle(i, 506);
									    format(string, 120,"(( {7556ff}Random Car Rare {A9C4E4}- %s mo hop va nhan duoc Super GT.))", GetName(i));
									    SCMTA(COLOR_CLIENT, string);
								}
				            }
				            case 71..75: {
				                format(string, 65, "Sandking");
								PlayerTextDrawSetPreviewModel(i, CratePTD[0], 495);
								PlayerTextDrawSetString(i, CratePTD[1], string);
								PlayerTextDrawShow(i, CratePTD[0]);
				            	if(CrateTime[i] <= 0) {

										KillTimer(TimerCratesEx[i]);
										CrateModel[i] = -1; TatQuayGuong(i);
										GiveVehicle(i, 495);
									    format(string, 120,"(( {7556ff}Random Car Rare {A9C4E4}- %s mo hop va nhan duoc Sandking.))", GetName(i));
									    SCMTA(COLOR_CLIENT, string);
								}
				            }
				            case 76..85: {
				                format(string, 65, "Huntley");
								PlayerTextDrawSetPreviewModel(i, CratePTD[0], 579);
								PlayerTextDrawSetString(i, CratePTD[1], string);
								PlayerTextDrawShow(i, CratePTD[0]);
				            	if(CrateTime[i] <= 0) {

										KillTimer(TimerCratesEx[i]);
										CrateModel[i] = -1; TatQuayGuong(i);
										GiveVehicle(i, 579);
									    format(string, 120,"(( {7556ff}Random Car Rare {A9C4E4}- %s mo hop va nhan duoc Huntley.))", GetName(i));
									    SCMTA(COLOR_CLIENT, string);
								}
				            }
				           	case 86..90: {
				                format(string, 65, "Elegy");
								PlayerTextDrawSetPreviewModel(i, CratePTD[0], 562);
								PlayerTextDrawSetString(i, CratePTD[1], string);
								PlayerTextDrawShow(i, CratePTD[0]);
				            	if(CrateTime[i] <= 0) {

										KillTimer(TimerCratesEx[i]);
										CrateModel[i] = -1; TatQuayGuong(i);
										GiveVehicle(i, 562);
									    format(string, 120,"(( {7556ff}Random Car Rare {A9C4E4}- %s mo hop va nhan duoc Elegy.))", GetName(i));
									    SCMTA(COLOR_CLIENT, string);
								}
				            }
				            case 91..95: {
				                format(string, 65, "PCJ-600");
								PlayerTextDrawSetPreviewModel(i, CratePTD[0], 461);
								PlayerTextDrawSetString(i, CratePTD[1], string);
								PlayerTextDrawShow(i, CratePTD[0]);
				            	if(CrateTime[i] <= 0) {

										KillTimer(TimerCratesEx[i]);
										CrateModel[i] = -1; TatQuayGuong(i);
										GiveVehicle(i, 461);
									    format(string, 120,"(( {7556ff}Random Car Rare {A9C4E4}- %s mo hop va nhan duoc PCJ-600.))", GetName(i));
									    SCMTA(COLOR_CLIENT, string);
								}
				            }
				            case 96..97: {
				                format(string, 65, "Jester");
								PlayerTextDrawSetPreviewModel(i, CratePTD[0], 559);
								PlayerTextDrawSetString(i, CratePTD[1], string);
								PlayerTextDrawShow(i, CratePTD[0]);
				            	if(CrateTime[i] <= 0) {

										KillTimer(TimerCratesEx[i]);
										CrateModel[i] = -1; TatQuayGuong(i);
										GiveVehicle(i, 559);
									    format(string, 120,"(( {7556ff}Random Car Rare {A9C4E4}- %s mo hop va nhan duoc Jester.))", GetName(i));
									    SCMTA(COLOR_CLIENT, string);
								}
				            }
				            case 98..100: {
				                format(string, 65, "Sultan");
								PlayerTextDrawSetPreviewModel(i, CratePTD[0], 540);
								PlayerTextDrawSetString(i, CratePTD[1], string);
								PlayerTextDrawShow(i, CratePTD[0]);
				            	if(CrateTime[i] <= 0) {

										KillTimer(TimerCratesEx[i]);
										CrateModel[i] = -1; TatQuayGuong(i);
										GiveVehicle(i, 540);
									    format(string, 120,"(( {7556ff}Random Car Rare {A9C4E4}- %s mo hop va nhan duoc Sultan.))", GetName(i));
									    SCMTA(COLOR_CLIENT, string);
								}
				            }
							default : {
							SendClientMessage(i, COLOR_YELLOW, "Chuc ban may man lan sau");
							printf("%s, %d da mo hop", GetName(i), rand);
							}
						}
					}
				case 2:{
					format(string, sizeof(string), "%s da mo crate Random con lai %d.", GetName(i), PlayerInfo[i][pCrates][0]);
					Log("logs/opencrate.log", string);
					new rand = random(89);
					switch(rand) {
				    	case 0..20: {
				    		LoadSkins(1, amount);
				            format(string, 70, "Skin %d", amount);
				            PlayerTextDrawSetPreviewModel(i, CratePTD[0], amount);
				            PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
				            if(CrateTime[i] == 0) {
						    	{
				            		{
				            			if(CrateModel[i] == 0) {
											KillTimer(TimerCratesEx[i]);
						                	CrateModel[i] = -1;
						                	return 1;
				            			}
										format(string, 120,"(( Random {A9C4E4}- %s mo hop va nhan duoc skin %d ))", GetName(i), amount);
										SCMTA(COLOR_CLIENT, string);  
										// new const success = Player_AddItem(i, ItemType:item_type_skin, amount, 100);
										// if(success == -1) {
										// 	PlayerInfo[i][pCrates][0] ++;
										// 	save_crates(i);
										// 	KillTimer(TimerCratesEx[i]);
						                // 	CrateModel[i] = -1; TatQuayGuong(i);
										// 	return SendClientMessagei,COLOR_LGREEN, "ERROR: Ban da het slot skin cho nen ban se duoc tra lai mot hom!");

										// }
										if(checkslotinv(i) == 24) {
											SendClientMessage(i, -1, "Tui do cua ban da day.");
											PlayerInfo[i][pCrates][1] += 1, save_crates(i);
											KillTimer(TimerCratesEx[i]);
						                	CrateModel[i] = -1; TatQuayGuong(i);
										}
										if(checkslotskin(i) == 10) {
											SendClientMessage(i, -1, "Ban da full slot skin.");
											PlayerInfo[i][pCrates][1] += 1, save_crates(i);
											KillTimer(TimerCratesEx[i]);
						                	CrateModel[i] = -1; TatQuayGuong(i);
										}
										if(checktrungskin(i,amount) != 0) {
											SendClientMessage(i, -1, "Ban da so huu skin nay.");
											PlayerInfo[i][pCrates][1] += 1, save_crates(i);
											KillTimer(TimerCratesEx[i]);
						                	CrateModel[i] = -1; TatQuayGuong(i);
										}
										if(Inventory_GetFreeID(i, 1) == -1) Inventory_Add(i,"Skins", amount, 1, 2);
											else Inventory_Add(i,"Skins", amount, 1, 1);
										save_crates(i);
										KillTimer(TimerCratesEx[i]);
						                CrateModel[i] = -1; TatQuayGuong(i);
									}	
				            	}
				            }
						}
						case 21..40: {
							amount = RandomEx(400000,500000);
							format(string, 64, "%d", amount);
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 1212);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
							if(CrateTime[i] == 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GivePlayerCash(i, amount);
									// GiveVehicle(i, 555);
									TatQuayGuong(i);
									format(string, 120,"(( {7556ff}Random{A9C4E4}- %s mo hop va nhan duoc %s. ))", GetName(i), FormatNumber(amount));
									SCMTA(COLOR_CLIENT,string);
							}
						}
						case 41..60: {
							amount = RandomMinMax(15, 20);
				            format(string, 75, "~y~%s Vip Xu.", FormatNumber(amount), totalcrates(i));
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 1275);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
				            if(CrateTime[i] == 0) {
						        if(CrateModel[i] == 0) {
									format(string, 120,"(( {7556ff}Random{A9C4E4}- %s mo hop va nhan duoc %d xu. ))", GetName(i), amount);
								    SCMTA(COLOR_CLIENT, string); 
								    PlayerInfo[i][pPremiumPoints] += amount;
								    Update(i, pPremiumPointsx);
								}
						        KillTimer(TimerCratesEx[i]);
						        CrateModel[i] = -1; TatQuayGuong(i);
						    }
						}
						case 61..80: {
							amount = RandomMinMax(5000, 10999);
				            format(string, 75, "~y~%s vat lieu.", FormatNumber(amount), totalcrates(i));
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 1576);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
				            if(CrateTime[i] == 0) {
						        if(CrateModel[i] == 0) {
									format(string, 120,"(( {7556ff}Random{A9C4E4}- %s mo hop va nhan duoc %d vat lieu. ))", GetName(i), FormatNumber(amount));
								    SCMTA(COLOR_CLIENT, string); 
								    PlayerInfo[i][pPremiumPoints] += amount;
								    Update(i, pPremiumPointsx);
								}
						        KillTimer(TimerCratesEx[i]);
						        CrateModel[i] = -1; TatQuayGuong(i);
						    }
						}
						case 81..88: {
			    		    // amount = random(20) + 20;
			                format(string, 64, "Freeway");
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 463);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
			                if(CrateTime[i] == 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GiveVehicle(i, 463);
								    format(string, 120,"(( {7556ff}Random{A9C4E4}- %s mo hop va nhan duoc Freeway. ))", GetName(i));
								    SCMTA(COLOR_CLIENT,string);
							}
			            }
						case 89: {
			    		    // amount = random(20) + 20;
			                format(string, 64, "Elegy");
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 562);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
			                if(CrateTime[i] == 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GiveVehicle(i, 562);
								    format(string, 120,"(( {7556ff}Random{A9C4E4}- %s mo hop va nhan duoc Elegy. ))", GetName(i));
								    SCMTA(COLOR_CLIENT,string);
							}
			            }
						default : {
							SendClientMessage(i, COLOR_YELLOW, "Chuc ban may man lan sau");
							printf("%s, %d da mo hop", GetName(i), rand);
						}
					}
				}
			case 4:{
				new rand = random(100);
				format(string, sizeof(string), "%s da mo crate Car Epic con lai %d.", GetName(i), PlayerInfo[i][pCrates][3]);
				Log("logs/opencrate.log", string);
				switch(rand) {
			   			case 0..10: {
							amount = 15000000;
							format(string, 64, "%d", amount);
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 1212);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
							if(CrateTime[i] == 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GivePlayerCash(i, amount);
									// GiveVehicle(i, 555);
									TatQuayGuong(i);
									format(string, 120,"(( {7556ff}Random Car Epic{A9C4E4}- %s mo hop va nhan duoc %s. ))", GetName(i), FormatNumber(amount));
									SCMTA(COLOR_CLIENT,string);
							}
						}
				    	    case 11..21: {
				    		    amount = 200;
								format(string, 75, "~y~%s Vip Xu.", FormatNumber(amount), totalcrates(i));
								PlayerTextDrawSetPreviewModel(i, CratePTD[0], 1275);
								PlayerTextDrawSetString(i, CratePTD[1], string);
								PlayerTextDrawShow(i, CratePTD[0]);
								if(CrateTime[i] == 0) {
						        if(CrateModel[i] == 0) {
									format(string, 120,"(( {7556ff}Random Car Epic {A9C4E4}- %s mo hop va nhan duoc %d xu. ))", GetName(i), amount);
								    SCMTA(COLOR_CLIENT, string); 
								    PlayerInfo[i][pPremiumPoints] += amount;
								    Update(i, pPremiumPointsx);
								}
						        KillTimer(TimerCratesEx[i]);
						        CrateModel[i] = -1; TatQuayGuong(i);
						    }
			            }
			            case 22..32: {
			                amount = 50000;
				            format(string, 75, "~y~%s vat lieu.", FormatNumber(amount), totalcrates(i));
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 1576);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
				            if(CrateTime[i] == 0) {
						        if(CrateModel[i] == 0) {
									format(string, 120,"(( {7556ff}Random Car Epic {A9C4E4}- %s mo hop va nhan duoc %d vat lieu. ))", GetName(i), FormatNumber(amount));
								    SCMTA(COLOR_CLIENT, string); 
								    PlayerInfo[i][pPremiumPoints] += amount;
								    Update(i, pPremiumPointsx);
								}
						        KillTimer(TimerCratesEx[i]);
						        CrateModel[i] = -1; TatQuayGuong(i);
						    }
			            }
			           	case 33..40: {
				    		format(string, 65, "Uranus");/**/
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 558);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
			            	if(CrateTime[i] <= 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GiveVehicle(i, 558);
								    format(string, 120,"(( {7556ff}Random Car Epic {A9C4E4}- %s mo hop va nhan duoc Uranus.))", GetName(i));
								    SCMTA(COLOR_CLIENT, string);
							}
			            }
			           	case 41..51: {
			                format(string, 65, "Jester");/**/
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 559);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
			            	if(CrateTime[i] <= 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GiveVehicle(i, 559);
								    format(string, 120,"(( {7556ff}Random Car Epic {A9C4E4}- %s mo hop va nhan duoc Jester.))", GetName(i));
								    SCMTA(COLOR_CLIENT, string);
							}
			            }
			           	case 52..62: {
			                format(string, 65, "Buffalo");
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 402);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
			            	if(CrateTime[i] <= 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GiveVehicle(i, 402);
								    format(string, 120,"(( {7556ff}Random Car Epic {A9C4E4}- %s mo hop va nhan duoc Buffalo.))", GetName(i));
								    SCMTA(COLOR_CLIENT, string);
							}
			            }
			            case 63..70: {
						    format(string, 65, "Euros");
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 587);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
			            	if(CrateTime[i] <= 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GiveVehicle(i, 587);
								    format(string, 120,"(( {7556ff}Random Car Epic {A9C4E4}- %s mo hop va nhan duoc Euros.))", GetName(i));
								    SCMTA(COLOR_CLIENT, string);
							} 
			            }
			            case 71..80: {
			                format(string, 65, "Banshee");
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 429);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
			            	if(CrateTime[i] <= 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GiveVehicle(i, 429);
								    format(string, 120,"(( {7556ff}Random Car Epic {A9C4E4}- %s mo hop va nhan duoc Banshee.))", GetName(i));
								    SCMTA(COLOR_CLIENT, string);
							}
			            }
			           	case 81..86: {
			                format(string, 65, "Elegy");
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 562);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
			            	if(CrateTime[i] <= 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GiveVehicle(i, 562);
								    format(string, 120,"(( {7556ff}Random Car Epic {A9C4E4}- %s mo hop va nhan duoc Elegy.))", GetName(i));
								    SCMTA(COLOR_CLIENT, string);
							}
			            }
			            case 87..94: {
			                format(string, 65, "PCJ-600");
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 461);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
			            	if(CrateTime[i] <= 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GiveVehicle(i, 461);
								    format(string, 120,"(( {7556ff}Random Car Epic {A9C4E4}- %s mo hop va nhan duoc PCJ-600.))", GetName(i));
								    SCMTA(COLOR_CLIENT, string);
							}
			            }
			            case 95..97: {
				          	format(string, 65, "Cheetah");
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 415);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
			            	if(CrateTime[i] <= 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GiveVehicle(i, 415);
								    format(string, 120,"(( {7556ff}Random Car Epic {A9C4E4}- %s mo hop va nhan duoc Cheetah.))", GetName(i));
								    SCMTA(COLOR_CLIENT, string);
							}
			            }
			            case 98..100: {
			                format(string, 65, "Sultan");
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 540);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
			            	if(CrateTime[i] <= 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GiveVehicle(i, 540);
								    format(string, 120,"(( {7556ff}Random Car Epic {A9C4E4}- %s mo hop va nhan duoc Sultan.))", GetName(i));
								    SCMTA(COLOR_CLIENT, string);
							}
			            }
						default : {
							SendClientMessage(i, COLOR_YELLOW, "Chuc ban may man lan sau");
							printf("%s, %d da mo hop", GetName(i), rand);
						}
					}
				}

			case 5:
			{
			new rand = random(100);
			format(string, sizeof(string), "%s da mo crate Random Car Legend con lai %d.", GetName(i), PlayerInfo[i][pCrates][4]);
			Log("logs/opencrate.log", string);
			switch(rand) {
			   			case 0..8: {
			    		    amount = 120000;
				            format(string, 75, "~y~%s vat lieu.", FormatNumber(amount), totalcrates(i));
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 1576);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
				            if(CrateTime[i] == 0) {
						        if(CrateModel[i] == 0) {
									format(string, 120,"(( {7556ff}Random Car Legend{A9C4E4}- %s mo hop va nhan duoc %d vat lieu. ))", GetName(i), FormatNumber(amount));
								    SCMTA(COLOR_CLIENT, string); 
								    PlayerInfo[i][pPremiumPoints] += amount;
								    Update(i, pPremiumPointsx);
								}
						        KillTimer(TimerCratesEx[i]);
						        CrateModel[i] = -1; TatQuayGuong(i);
						    }
						}
			           
			           	case 9..17: {
				    		amount = 30000000;
							format(string, 64, "%d", amount);
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 1212);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
							if(CrateTime[i] == 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GivePlayerCash(i, amount);
									// GiveVehicle(i, 555);
									TatQuayGuong(i);
									format(string, 120,"(( {7556ff}Random Car Legend{A9C4E4}- %s mo hop va nhan duoc %s. ))", GetName(i), FormatNumber(amount));
									SCMTA(COLOR_CLIENT,string);
							}
			            }
						case 18..26: {
				          	amount = random(30) * 4;
						    // new nxtlevel = PlayerInfo[i][pLevel];
							// expamount = nxtlevel*levelexp;
				            format(string, 75, "~y~%s Kinh Nghiem.", FormatNumber(amount), totalcrates(i));
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 1275);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
				            if(CrateTime[i] == 0) {
						        if(CrateModel[i] <= 0) {
								    format(string, 120,"%s, Da mo hop free va duoc %d Kinh Nghiem.", GetName(i),amount);
								    SendClientMessage(i, COLOR_WHITE, string);
								} else {
									format(string, 120,"(( {7556ff}Random Car Legend{A9C4E4}- %s mo hop va nhan duoc %d kinh nghiem. ))", GetName(i), amount);
								    SCMTA(COLOR_CLIENT, string); 
								    PlayerInfo[i][pExp] += amount;
								    Update(i, pRP);
								}
						        KillTimer(TimerCratesEx[i]);
						        CrateModel[i] = -1; TatQuayGuong(i);
						    }
			            }
			            case 27..34: {
						    amount = 450;
				            format(string, 75, "~y~%s Vip Xu.", FormatNumber(amount), totalcrates(i));
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 1275);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
				            if(CrateTime[i] == 0) {
						        if(CrateModel[i] <= 0) {
								    format(string, 120,"%s, Da mo hop free va duoc %d Vip Xu.", GetName(i),amount);
								    SendClientMessage(i, COLOR_WHITE, string);
								} else {
									format(string, 120,"(( {7556ff}Random Car Legend{A9C4E4}- %s mo hop va nhan duoc %d xu. ))", GetName(i), amount);
								    SCMTA(COLOR_CLIENT, string); 
								    PlayerInfo[i][pPremiumPoints] += amount;
								    Update(i, pPremiumPointsx);
								}
						        KillTimer(TimerCratesEx[i]);
						        CrateModel[i] = -1; TatQuayGuong(i);
						    }
			            }
			           	case 35..43: {
			                format(string, 65, "Rancher");
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 489);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
			            	if(CrateTime[i] <= 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GiveVehicle(i, 489);
								    format(string, 120,"(( {7556ff}Random Car Legend{A9C4E4}- %s mo hop va nhan duoc Rancher.))", GetName(i));
								    SCMTA(COLOR_CLIENT, string);
							}
			            }
						
						case 44..52: {
			                format(string, 65, "FCR-900");
			                PlayerTextDrawSetPreviewModel(i, CratePTD[0], 521);
			                PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
			            	if(CrateTime[i] <= 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GiveVehicle(i, 521);
								    format(string, 120,"(( {7556ff}Random Car Legend{A9C4E4}- %s mo hop va nhan duoc FCR-900. ))", GetName(i));
								    SCMTA(COLOR_CLIENT, string);
							}
			            }
			            case 53..61: {
			                format(string, 65, "Cheetah");
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 415);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
			            	if(CrateTime[i] <= 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GiveVehicle(i, 415);
								    format(string, 120,"(( {7556ff}Random Car Legend{A9C4E4}- %s mo hop va nhan duoc Cheetah.))", GetName(i));
								    SCMTA(COLOR_CLIENT, string);
							}
			            }
			           	case 62..68: {
			                format(string, 65, "Turismo");
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 451);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
			            	if(CrateTime[i] <= 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GiveVehicle(i, 451);
								    format(string, 120,"(( {7556ff}Random Car Legend{A9C4E4}- %s mo hop va nhan duoc Turismo.))", GetName(i));
								    SCMTA(COLOR_CLIENT, string);
							}
			            }
			            case 69..77: {
			                format(string, 65, "Banshee");
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 429);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
			            	if(CrateTime[i] <= 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GiveVehicle(i, 429);
								    format(string, 120,"(( {7556ff}Random Car Legend{A9C4E4}- %s mo hop va nhan duoc Banshee.))", GetName(i));
								    SCMTA(COLOR_CLIENT, string);
							}
			            }
						case 78..85: {
			                format(string, 65, "Sultan");
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 560);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
			            	if(CrateTime[i] <= 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GiveVehicle(i, 560);
								    format(string, 120,"(( {7556ff}Random Car Legend{A9C4E4}- %s mo hop va nhan duoc Sultan.))", GetName(i));
								    SCMTA(COLOR_CLIENT, string);
							}
			            }
			            case 86..94: {
			                format(string, 65, "Bullet");
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 541);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
			            	if(CrateTime[i] <= 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GiveVehicle(i, 541);
								    format(string, 120,"(( {7556ff}Random Car Legend{A9C4E4}- %s mo hop va nhan duoc Bullet.))", GetName(i));
								    SCMTA(COLOR_CLIENT, string);
								}
				            }
						case 95..96: {
			                amount = 1000;
				            format(string, 75, "~y~%s Vip Xu.", FormatNumber(amount), totalcrates(i));
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 1275);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
				            if(CrateTime[i] == 0) {
						        if(CrateModel[i] <= 0) {
								    format(string, 120,"%s, Da mo hop free va duoc %d Vip Xu.", GetName(i),amount);
								    SendClientMessage(i, COLOR_WHITE, string);
								} else {
									format(string, 120,"(( {7556ff}Random Car Legend{A9C4E4}- %s mo hop va nhan duoc %d xu. ))", GetName(i), amount);
								    SCMTA(COLOR_CLIENT, string); 
								    PlayerInfo[i][pPremiumPoints] += amount;
								    Update(i, pPremiumPointsx);
								}
						        KillTimer(TimerCratesEx[i]);
						        CrateModel[i] = -1; TatQuayGuong(i);
						    }
				            }
						case 97..98: {
			                format(string, 65, "Infernus");
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 411);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
			            	if(CrateTime[i] <= 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GiveVehicle(i, 411);
								    format(string, 120,"(( {7556ff}Random Car Legend{A9C4E4}- %s mo hop va nhan duoc Infernus.))", GetName(i));
								    SCMTA(COLOR_CLIENT, string);
								}
				            }
						case 99..100: {
			                format(string, 65, "NRG-500");
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 522);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
			            	if(CrateTime[i] <= 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GiveVehicle(i, 522);
								    format(string, 120,"(( {7556ff}Random Car Legend{A9C4E4}- %s mo hop va nhan duoc NRG-500.))", GetName(i));
								    SCMTA(COLOR_CLIENT, string);
								}
				            }
							default : {
							SendClientMessage(i, COLOR_YELLOW, "Chuc ban may man lan sau");
							printf("%s, %d da mo hop", GetName(i), rand);
							}
						}
					}
			// case 6:
			// 	{
			// 		format(string, sizeof(string), "%s da mo crate Random Skin Huyen Thoai con lai %d.", GetName(i), PlayerInfo[i][pCrates][5]);
			// 		Log("logs/opencrate.log", string);
			// 		new rand = random(100);
			// 		switch(rand) {
			// 	    	case 0..100: {
			// 	    		LoadSkins(2, amount);
			// 	            format(string, 70, "Skin %d", amount);
			// 	            PlayerTextDrawSetPreviewModel(i, CratePTD[0], amount);
			// 	            PlayerTextDrawSetString(i, CratePTD[1], string);
			// 				PlayerTextDrawShow(i, CratePTD[0]);
			// 	            if(CrateTime[i] == 0) {
			// 			    	{
			// 	            		{
			// 	            			if(CrateModel[i] == 0) {
			// 								KillTimer(TimerCratesEx[i]);
			// 			                	CrateModel[i] = -1;
			// 			                	return 1;
			// 	            			}
			// 							format(string, 120,"(( Random Skin Huyen Thoai {A9C4E4}- %s mo hop va nhan duoc skin %d (%s). ))", GetName(i), amount);
			// 							SCMTA(COLOR_CLIENT, string);  
			// 							// new const success = Player_AddItem(i, ItemType:item_type_skin, amount, 100);
			// 							// if(success == -1) {
			// 							// 	PlayerInfo[i][pCrates][0] ++;
			// 							// 	save_crates(i);
			// 							// 	KillTimer(TimerCratesEx[i]);
			// 			                // 	CrateModel[i] = -1; TatQuayGuong(i);
			// 							// 	return SendClientMessagei,COLOR_LGREEN, "ERROR: Ban da het slot skin cho nen ban se duoc tra lai mot hom!");

			// 							// }
			// 							give_skin(i, amount);
			// 							save_crates(i);
			// 							KillTimer(TimerCratesEx[i]);
			// 			                CrateModel[i] = -1; TatQuayGuong(i);
			// 						}	
			// 	            	}
			// 	            }
			// 			}
			// 		}
			// 	}
			// case 6:
			// {
			// new rand = random(100);
			// format(string, sizeof(string), "%s da mo crate Car Cao Cap con lai %d.", GetName(i), PlayerInfo[i][pCrates][6]);
			// Log("logs/opencrate.log", string);
			// switch(rand) {
			//    			case 0..10: {
			//     		    amount = RandomEx(30, 250);
			//                 format(string, 65, "Sultan");
			// 				PlayerTextDrawSetPreviewModel(i, CratePTD[0], 579);
			// 				PlayerTextDrawSetString(i, CratePTD[1], string);
			// 				PlayerTextDrawShow(i, CratePTD[0]);
			//                 if(CrateTime[i] <= 0) {
			// 						KillTimer(TimerCratesEx[i]);
			// 						CrateModel[i] = -1; TatQuayGuong(i);
			// 						GiveVehicle(i, 579);
			// 					    format(string, 120, "(( {7556ff}Car Cao Cap{A9C4E4}- %s mo hop va nhan duoc Sultan ))", GetName(i));
			// 					    SCMTA(COLOR_CLIENT, string);
			// 				}
			// 			}
			//     	    case 11..20: {
			//     		    amount = random(20) + 20;
			//                 format(string, 64, "Turismo");
			// 				PlayerTextDrawSetPreviewModel(i, CratePTD[0], 587);
			// 				PlayerTextDrawSetString(i, CratePTD[1], string);
			// 				PlayerTextDrawShow(i, CratePTD[0]);
			//                 if(CrateTime[i] == 0) {
			// 						KillTimer(TimerCratesEx[i]);
			// 						CrateModel[i] = -1; TatQuayGuong(i);
			// 						GiveVehicle(i, 587);
			// 					    format(string, 120,"(( {7556ff}Car Cao Cap {A9C4E4}- %s mo hop va nhan duoc Turismo. ))", GetName(i));
			// 					    SCMTA(COLOR_CLIENT,string);
			// 				}
			//             }
			//             case 21..30: {
			//                 format(string, 65, "Cheetah");
			//                 PlayerTextDrawSetPreviewModel(i, CratePTD[0], 489);
			//                 PlayerTextDrawSetString(i, CratePTD[1], string);
			// 				PlayerTextDrawShow(i, CratePTD[0]);
			//             	if(CrateTime[i] <= 0) {
			// 						KillTimer(TimerCratesEx[i]);
			// 						CrateModel[i] = -1; TatQuayGuong(i);
			// 						GiveVehicle(i, 489);
			// 					    format(string, 120,"(( {7556ff}Car Cao Cap {A9C4E4}- %s mo hop va nhan duoc Cheetah. ))", GetName(i));
			// 					    SCMTA(COLOR_CLIENT, string);
			// 				}
			//             }
			// 			}
			// 		}
			case 6:
			{
			new rand = random(100);
			format(string, sizeof(string), "%s da mo crate Car Mythical con lai %d.", GetName(i), PlayerInfo[i][pCrates][7]);
			Log("logs/opencrate.log", string);
			switch(rand) {
				case 0..20: {
			    		    amount = 300000;
				            format(string, 75, "~y~%s vat lieu.", FormatNumber(amount), totalcrates(i));
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 1576);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
				            if(CrateTime[i] == 0) {
						        if(CrateModel[i] == 0) {
									format(string, 120,"(( {7556ff}Random Car Mythical{A9C4E4}- %s mo hop va nhan duoc %d vat lieu. ))", GetName(i), FormatNumber(amount));
								    SCMTA(COLOR_CLIENT, string); 
								    PlayerInfo[i][pPremiumPoints] += amount;
								    Update(i, pPremiumPointsx);
								}
						        KillTimer(TimerCratesEx[i]);
						        CrateModel[i] = -1; TatQuayGuong(i);
						    }
						}
			           
			           	case 21..30: {
				    		amount = 55000000;
							format(string, 64, "%d", amount);
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 1212);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
							if(CrateTime[i] == 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GivePlayerCash(i, amount);
									// GiveVehicle(i, 555);
									TatQuayGuong(i);
									format(string, 120,"(( {7556ff}Random Car Mythical{A9C4E4}- %s mo hop va nhan duoc %s. ))", GetName(i), FormatNumber(amount));
									SCMTA(COLOR_CLIENT,string);
							}
			            }
			            case 31..40: {
						    amount = 650;
				            format(string, 75, "~y~%s Vip Xu.", FormatNumber(amount), totalcrates(i));
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 1275);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
				            if(CrateTime[i] == 0) {
						        if(CrateModel[i] <= 0) {
								    format(string, 120,"%s, Da mo hop free va duoc %d Vip Xu.", GetName(i),amount);
								    SendClientMessage(i, COLOR_WHITE, string);
								} else {
									format(string, 120,"(( {7556ff}Random Car Mythical{A9C4E4}- %s mo hop va nhan duoc %d xu. ))", GetName(i), amount);
								    SCMTA(COLOR_CLIENT, string); 
								    PlayerInfo[i][pPremiumPoints] += amount;
								    Update(i, pPremiumPointsx);
								}
						        KillTimer(TimerCratesEx[i]);
						        CrateModel[i] = -1; TatQuayGuong(i);
						    }
			            }
						case 41..50: {
						    amount = 1099;
				            format(string, 75, "~y~%s Vip Xu.", FormatNumber(amount), totalcrates(i));
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 1275);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
				            if(CrateTime[i] == 0) {
						        if(CrateModel[i] <= 0) {
								    format(string, 120,"%s, Da mo hop free va duoc %d Vip Xu.", GetName(i),amount);
								    SendClientMessage(i, COLOR_WHITE, string);
								} else {
									format(string, 120,"(( {7556ff}Random Car Mythical{A9C4E4}- %s mo hop va nhan duoc %d xu. ))", GetName(i), amount);
								    SCMTA(COLOR_CLIENT, string); 
								    PlayerInfo[i][pPremiumPoints] += amount;
								    Update(i, pPremiumPointsx);
								}
						        KillTimer(TimerCratesEx[i]);
						        CrateModel[i] = -1; TatQuayGuong(i);
						    }
			            }
			   			
			    	    case 51..60: {
			    		    amount = random(20) + 20;
			                format(string, 64, "Sultan");
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 560);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
			                if(CrateTime[i] == 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GiveVehicle(i, 560);
								    format(string, 120,"(( {7556ff}Random Car Mythical{A9C4E4}- %s mo hop va nhan duoc Sultan. ))", GetName(i));
								    SCMTA(COLOR_CLIENT,string);
							}
			            }
			    	    case 61..70: {
			    		    amount = random(20) + 20;
			                format(string, 64, "Turismo");
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 451);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
			                if(CrateTime[i] == 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GiveVehicle(i, 451);
								    format(string, 120,"(( {7556ff}Random Car Mythical{A9C4E4}- %s mo hop va nhan duoc Turismo. ))", GetName(i));
								    SCMTA(COLOR_CLIENT,string);
							}
			            }
			    	    case 71..80: {
			    		    amount = random(20) + 20;
			                format(string, 64, "Bullet");
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 541);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
			                if(CrateTime[i] == 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GiveVehicle(i, 541);
								    format(string, 120,"(( {7556ff}Random Car Mythical{A9C4E4}- %s mo hop va nhan duoc Bullet. ))", GetName(i));
								    SCMTA(COLOR_CLIENT,string);
							}
			            }
			    	    case 81..85: {
			    		    amount = random(20) + 20;
			                format(string, 64, "NRG-500");
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 522);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
			                if(CrateTime[i] == 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GiveVehicle(i, 522);
								    format(string, 120,"(( {7556ff}Random Car Mythical{A9C4E4}- %s mo hop va nhan duoc NRG-500. ))", GetName(i));
								    SCMTA(COLOR_CLIENT,string);
							}
			            }
			    	    case 86..90: {
			    		    amount = random(20) + 20;
			                format(string, 64, "Infernus");
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 411);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
			                if(CrateTime[i] == 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GiveVehicle(i, 411);
								    format(string, 120,"(( {7556ff}Random Car Mythical{A9C4E4}- %s mo hop va nhan duoc Infernus. ))", GetName(i));
								    SCMTA(COLOR_CLIENT,string);
							}
			            }
						case 91..95: {
			    		    amount = RandomEx(30, 250);
			                format(string, 65, "Hotring Racer A");
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 502);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
			                if(CrateTime[i] <= 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GiveVehicle(i, 502);
								    format(string, 120, "(( {7556ff}Random Car Mythical{A9C4E4}- %s mo hop va nhan duoc Hotring Racer A ))", GetName(i));
								    SCMTA(COLOR_CLIENT, string);
							}
						}
			           	case 96..98: {
			                format(string, 65, "Monster B");
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 557);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
			            	if(CrateTime[i] <= 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GiveVehicle(i, 557);
								    format(string, 120,"(( {7556ff}Random Car Mythical{A9C4E4}- %s mo hop va nhan duoc Monster B.))", GetName(i));
								    SCMTA(COLOR_CLIENT, string);
							}
			            }
						case 99..100: {
			                format(string, 65, "Maverick");
							PlayerTextDrawSetPreviewModel(i, CratePTD[0], 487);
							PlayerTextDrawSetString(i, CratePTD[1], string);
							PlayerTextDrawShow(i, CratePTD[0]);
			            	if(CrateTime[i] <= 0) {
									KillTimer(TimerCratesEx[i]);
									CrateModel[i] = -1; TatQuayGuong(i);
									GiveVehicle(i, 487);
								    format(string, 120,"(( {7556ff}Random Car Mythical{A9C4E4}- %s mo hop va nhan duoc Maverick.))", GetName(i));
								    SCMTA(COLOR_CLIENT, string);
							}
			            }
						default : {
							SendClientMessage(i, COLOR_YELLOW, "Chuc ban may man lan sau");
							printf("%s, %d da mo hop", GetName(i), rand);
						}
				        }
				    }
			// case 8:
			// {
			// new rand = random(30);
			// format(string, sizeof(string), "%s da mo crate Car Huyen Thoai con lai %d.", GetName(i), PlayerInfo[i][pCrates][7]);
			// Log("logs/opencrate.log", string);
			// switch(rand) {
			//    			case 0..10: {
			//     		    amount = RandomEx(30, 250);
			//                 format(string, 65, "NRG-500");
			// 				PlayerTextDrawSetPreviewModel(i, CratePTD[0], 522);
			// 				PlayerTextDrawSetString(i, CratePTD[1], string);
			// 				PlayerTextDrawShow(i, CratePTD[0]);
			//                 if(CrateTime[i] <= 0) {
			// 						KillTimer(TimerCratesEx[i]);
			// 						CrateModel[i] = -1; TatQuayGuong(i);
			// 						GiveVehicle(i, 522);
			// 					    format(string, 120, "(( {7556ff}Car Huyen Thoai{A9C4E4}- %s mo hop va nhan duoc NRG-500 ))", GetName(i));
			// 					    SCMTA(COLOR_CLIENT, string);
			// 				}
			// 			}
			//     	    case 11..20: {
			//     		    amount = random(20) + 20;
			//                 format(string, 64, "Bullet");
			// 				PlayerTextDrawSetPreviewModel(i, CratePTD[0], 541);
			// 				PlayerTextDrawSetString(i, CratePTD[1], string);
			// 				PlayerTextDrawShow(i, CratePTD[0]);
			//                 if(CrateTime[i] == 0) {
			// 						KillTimer(TimerCratesEx[i]);
			// 						CrateModel[i] = -1; TatQuayGuong(i);
			// 						GiveVehicle(i, 541);
			// 					    format(string, 120,"(( {7556ff}Car Huyen Thoai {A9C4E4}- %s mo hop va nhan duoc Bullet. ))", GetName(i));
			// 					    SCMTA(COLOR_CLIENT,string);
			// 				}
			//             }
			//             case 21..30: {
			//                 format(string, 65, "Infernus");
			//                 PlayerTextDrawSetPreviewModel(i, CratePTD[0], 411);
			//                 PlayerTextDrawSetString(i, CratePTD[1], string);
			// 				PlayerTextDrawShow(i, CratePTD[0]);
			//             	if(CrateTime[i] <= 0) {
			// 						KillTimer(TimerCratesEx[i]);
			// 						CrateModel[i] = -1; TatQuayGuong(i);
			// 						GiveVehicle(i, 411);
			// 					    format(string, 120,"(( {7556ff}Car Huyen Thoai {A9C4E4}- %s mo hop va nhan duoc Infernus. ))", GetName(i));
			// 					    SCMTA(COLOR_CLIENT, string);
			// 				}
			//             }
			// 	}
			// }
		}
	}
			if(SafeRTime[i] > 0) {
				SafeRTime[i] --;
				if(SafeRTime[i] == 0) {
					TogglePlayerControllable(i,true);
					BagTime[i] = 60;
					Freezed[i] = 0;
					SendClientMessage(i, COLOR_YELLOW, "* Ban co 1 phut de ra sau xe lay buu kien. (Bam phim Y)");
					SetPlayerAttachedObject( i, 0, 1550, 1, 0.024558, -0.279748, -0.060589, 6.105677, 137.291320, 147.132202, 1.019888, 1.000000, 1.000000 );
					ClearAnimations(i);
				}
			}
			
			if(BagTime[i] > 0) {
				BagTime[i] --;
				if(BagTime[i] == 0) {				
					if(JobWorking[i] == 1 && PlayerInfo[i][pJob] == 3) {
						SendClientMessage(i, COLOR_GREY, "Cong viec that bai! Ban khong mang go den kip gio.");
						if(playerObject[i] != 0) DestroyPlayerObject(i, playerObject[i]), playerObject[i] = 0;
						if(playerObject2[i] != 0) DestroyObject(playerObject2[i]), playerObject2[i] = 0;
						JobWorking[i] = 0;
						PlayerTextDrawHide(i, JobTD);
						if(JobVehicle[i] != 0) { DestroyVehicle(JobVehicle[i]); JobVehicle[i] = 0; }
						if(Trailer[i] != 0) { DestroyVehicle(Trailer[i]); Trailer[i] = 0;  }
						PlayerTextDrawHide(i, InfosTD);
						DisablePlayerCheckpointEx(i);
						DisablePlayerRaceCheckpointEx(i);
						RemovePlayerAttachedObject(i, 6);
						RemovePlayerAttachedObject(i, 2);
						SetPlayerSpecialAction(i,0);
						CP[i] = 0;
						JobVehicle[i] = 0;
						JobDeelay[i][PlayerInfo[i][pJob]] = 180;	
						DestroyWoodObject(i);
						if(PlayerInfo[i][pJob] == 3) ResetWeapons(i);	
					}
					else FailRob(i, "Khong mang go den kip thoi gian");						
				}	
				else {
					format(string, sizeof(string), "~w~%d", BagTime[i]);
					GameTextForPlayer(i, string, 1500, 4);
				}
			}					
							
			// AdmBot - Kick
			if(GetPlayerState(i) == PLAYER_STATE_DRIVER && !IsAPlane(GetPlayerVehicleID(i))) {
				new speed = Carspeed(i);		
				if(speed > 230 && PlayerInfo[i][pAdmin] < 1 && !IsPlayerInArea(i, -3000, -2274.5, -1776, -859.5))
				{	
					if(GetVehicleModel(i) == 522 && speed < 250) return 1;
					if(Iter_Count(PlayerAdmins) > 0 && gettime() - GetPVarInt(i, "SpeedHack") > 0) {
						SetPVarInt(i, "Speedhack", gettime() + 5);
						format(string, sizeof(string), "(Vui long spec): %s(%d) chay voi toc do %.0d km/h bang xe %s.", GetName(i),i,speed,aVehicleNames[GetVehicleModel(GetPlayerVehicleID(i))-400]);
						if(GetPVarInt(i, "Cover") == 0) SendAdminMessage(COLOR_WARNING, string,1);
					}
					else if(ServerSystem[5] == 0) NightBot(i, "Cheats (speed-hack)");
				}
			}
			if(PlayerInfo[i][pAdmin] < 1) {
				anim = GetPlayerAnimationIndex(i);
				GetPlayerVelocity(i, animpos[0], animpos[1], animpos[2]);			
				if(animpos[0] <= -0.800000 || animpos[1] <= -0.800000 || animpos[2] <= -0.800000 && anim == 1008) {
					new surfx = GetPlayerSurfingVehicleID(i);
					if(surfx == INVALID_VEHICLE_ID && !IsABike2(gLastCar[i])) {					
						format(string, sizeof(string), "AdmWarning: %s (%d) co the su dung Fly-Hack.", GetName(i), i);
						SendAdminMessage(COLOR_WARNING, string, 1);
						if(ServerSystem[6] == 0 && ++CheatWarnings[i] > 5) NightBot(i, "Cheats (fly-hack)");	
					}
				}
			}
			if(CheatWarnings[i] != 0) CheatWarnings[i]--;
			//Car Surfing
			// if(GetPlayerSurfingVehicleID(i) != INVALID_VEHICLE_ID && PlayerInfo[i][pAdmin] == 0 && !IsABoat(GetPlayerSurfingVehicleID(i)) ) {
			// 	new pid = GetVehicleDriver(GetPlayerSurfingVehicleID(i));
			// 	if(togsurf[pid] == 0 && IsPlayerInVehicle(pid, GetPlayerSurfingVehicleID(i))) SlapPlayer(i);
			// }
				
			if(IsPlayerPaused(i) == true || IsPlayerInRangeOfPoint(i, 1.1, LastPos[i][0], LastPos[i][1], LastPos[i][2])) {
				/*if(HelperDuty[i] == 1) {
					DutyAFK[i] ++;
					if(DutyAFK[i] == 60) {
						HelperDuty[i] = 0;
						SendClientMessage(HaveHelp[i], -1, "Intrebarea ta a fost stearsa deoarece helper-ul nu a raspuns in cele 60 de secunde.");
						Helped[HaveHelp[i]] = 0;
						HaveHelp[i] = -1;
						
						SendClientMessage(i, -1, "Acum nu mai esti la datorie ca helper deoarece ai stat AFK mai mult de un minut.");
					}
				}
				else DutyAFK[i] = 0;*/

				AFKSeconds[i] ++;
				if(AFKSeconds[i] == 5400 && PlayerInfo[i][pSleeping] == 0 && PlayerInfo[i][pAdmin] < 6) {
					format(string, sizeof(string), "AdmCmd: %s da bi kick boi AdmBot, Li do: AFK hoac /sleep trong 1 gio.", GetNameEx(i));
					SCMTA(COLOR_LIGHTRED, string);
					KickEx(i);
				}
				if(AFKSeconds[i] > 120) {
					if(JobWorking[i] == 1) {
						SendClientMessage(i, COLOR_GREY, "Cong viec that bai! Ban da AFK trong 2 phut.");
						if(playerObject[i] != 0) DestroyPlayerObject(i, playerObject[i]), playerObject[i] = 0;
						if(playerObject2[i] != 0) DestroyObject(playerObject2[i]), playerObject2[i] = 0;
						JobWorking[i] = 0;
						PlayerTextDrawHide(i, JobTD);
						if(JobVehicle[i] != 0) { DestroyVehicle(JobVehicle[i]); JobVehicle[i] = 0; }
						if(Trailer[i] != 0) { DestroyVehicle(Trailer[i]); Trailer[i] = 0; }
						PlayerTextDrawHide(i, InfosTD);
						DisablePlayerCheckpointEx(i);
						DisablePlayerRaceCheckpointEx(i);
						CP[i] = 0;
						JobVehicle[i] = 0;
						JobDeelay[i][PlayerInfo[i][pJob]] = 180;
						RemovePlayerAttachedObject(i, 6);
						RemovePlayerAttachedObject(i, 2);
						SetPlayerSpecialAction(i, 0);
						DestroyWoodObject(i);
						if(PlayerInfo[i][pJob] == 3) ResetWeapons(i);
						SetPlayerSpecialAction(i, 0);
						Iter_Remove(IsSpeed, i);		
					}
				}
			}	
			else AFKSeconds[i] = 0;
			if(AFKSeconds[i] < 10 && PlayerInfo[i][pSleeping] == 0 && Spectate[i] == 255) PlayerInfo[i][pSeconds] ++;
				// return NightBot(i, "Cheats (teleport-hack)");
			GetPlayerPos(i, LastPos[i][0], LastPos[i][1], LastPos[i][2]);

			// if(GetPlayerWeapon(i) != 0 && AFKSeconds[i] == 0) {
			// 	if(ServerSystem[1] == 0 && GetPlayerWeapon(i) != 0) CheckWeapons(i, GetPlayerWeapon(i));
			// 	if(ServerSystem[2] == 0 && GetPlayerWeapon(i) != 0) CheckAmmo(i, GetPlayerWeapon(i));
			// }
			if(PlayerInfo[i][pAdmin] == 0 && GetPlayerSpecialAction(i) == 2 && ServerSystem[9] == 0) NightBot(i, "Cheats (jetpack)");
			/*if(WTimes[i] >= 6) {
				if(GetAdmins() > 0) {
					format(string, sizeof(string), "AdmCmd: %s a primit kick de la AdmBot. Li do: Checkpoint teleport (3/3)", GetName(i));
					SCMTA(COLOR_LIGHTRED, string);	
					KickEx(i);
				}
				else if(ServerSystem[4] == 0) NightBot(i, "Checkpoint teleport");
				WTimes[i] = 0;
			}		
			if(WTimes[i] != 0) WTimes[i] -= 2;
			*/
			if(GetPlayerDrunkLevel(i) < 100) SetPlayerDrunkLevel(i, 2000);
			else {
				if(pDrunkLevelLast[i] != GetPlayerDrunkLevel(i)) {
					new wfps = pDrunkLevelLast[i] - GetPlayerDrunkLevel(i);
					if((wfps > 0) && (wfps < 200)) FPS2[i] = wfps;
					pDrunkLevelLast[i] = GetPlayerDrunkLevel(i);
				}
			}
			if(PlayerInfo[i][pShowFP] == 1 && PlayerInfo[i][pShowHud] == 0) {
				if(PlayerInfo[i][pAdmin] == 0) format(string, sizeof(string), "~g~%d~n~~w~~h~FPS~n~~n~~p~%d~n~~w~~h~PING", FPS2[i]-1, GetPlayerPing(i));
				else format(string, sizeof(string), "~r~%d~n~~w~~h~Tick~n~~n~~g~%d~n~~w~~h~FPS~n~~n~~p~%d~n~~w~~h~PING", GetServerTickRate(), FPS2[i]-1, GetPlayerPing(i));
				PlayerTextDrawSetString(i, ShowTD, string);
				PlayerTextDrawShow(i, ShowTD);
			}
			
			if(GetPlayerAnimationIndex(i)==1660) OnPlayerUseVending(i);	
			if(GetPlayerSurfingVehicleID(i) != INVALID_VEHICLE_ID && !IsABoat(GetPlayerSurfingVehicleID(i))) {
				if(GetPlayerWeapon(i) != 0) {
					SetPlayerArmedWeapon(i, 0);
					SendClientMessage(i, COLOR_WARNING, "Ban khong the vu khi o tren xe!");
				}	
			}			
			if(PaintType[i] != 0 && PlayersOnPaint(PaintType[i]-1) > 1) {
				new pp = PaintType[i]-1;
				if(IsPlayerConnected(i) && IsPlayerConnected(PaintballWinner[pp]))
				{
					if(pp < 2) {
						// printf("%s", CalculeazaTimp2(PaintTime[pp]));
						// printf("%s", MapName(pp));
						// printf("%d %d %d", PKills[i], PDeaths[i], PKills[i]-PDeaths[i]);
						// printf("%s %d", GetName(PaintballWinner[pp]), PKills[PaintballWinner[pp]]);

						format(string, sizeof(string), "Thoi gian: %s~n~Ban do hien tai: %s~n~Thong ke: %d kills, %d deaths.~n~Tong diem: %d~n~Best player: %s (kills: %d)~n~%d nguoi choi trong paintball.",
						CalculeazaTimp2(PaintTime[pp]), MapName(pp), PKills[i], PDeaths[i], PKills[i]-PDeaths[i], GetName(PaintballWinner[pp]), PKills[PaintballWinner[pp]], PlayersOnPaint(pp));
						// print(string);
					}
					else {
						new masadenume[32];
						GetWeaponNameEx(GetPlayerWeapon(i), masadenume, sizeof(masadenume));

						format(string, sizeof(string), "Thoi gian: %s~n~Ban do hien tai: %s~n~Thong ke: %d kills, %d deaths.~n~Tong diem: %d~n~Level %d, Weapon: %s~n~Best player: %s (kills: %d)~n~%d nguoi choi trong paintball.",
						CalculeazaTimp2(PaintTime[pp]), MapName(pp), PKills[i], PDeaths[i], PKills[i]-PDeaths[i], GetPaintLevel(i), masadenume, GetName(PaintballWinner[pp]), PKills[PaintballWinner[pp]], PlayersOnPaint(pp));
					}					
				}
				
				if(PaintTime[pp] == 0 && PaintballWinner[pp] != -1) {
					for(new m = 0; m < 5; m++) SendDeathMessageToPlayer(i, 1001, 1001, 200);
					format(string, sizeof(string), "So lieu thong ke trong round nay: %d giet duoc va chet %d lan.", PKills[i], PDeaths[i]);
					SendClientMessage(i, COLOR_YELLOW, string);
					new swinner[85];
					format(swinner, 85, "* %s da thang round nay voi %d mang giet duoc (kill).", GetName(PaintballWinner[pp]), PKills[PaintballWinner[pp]]);
					PKills[i] = 0, PDeaths[i] = 0;
					ResetWeapons(i);				
					PaintballWinnerScore[pp] = 0;					
					SendPaintMessage(PaintType[i], COLOR_YELLOW, swinner);
					PaintballWinner[pp] = -1;
					// finishAchievement(i, 12); //round	
				}
				if(PaintTime[pp] != 0 && PaintText[pp] == 0) {
					PlayerTextDrawSetString(i, PaintTD, string);
					PlayerTextDrawShow(i, PaintTD);					
				}	
				else {					
					PlayerTextDrawHide(i, PaintTD);	
				}	
			}
			else PlayerTextDrawHide(i, PaintTD);			   

			if(PlayerInfo[i][pJob] == 1 && JobWorking[i] == 1) {
				if(IsPlayerInRangeOfPoint(i, 100, -258.4948,-1376.7416,11.2800) && Carspeed(i) > 25) {
					JobSeconds[i] --;
					UpdateJobStats(i);
					if(JobSeconds[i] == 0) {
						new rand = 10 + random(30);
						KG[i] = rand;
						format(string, sizeof(string), "Ban nhan duoc %d kilogram bot. Hay den Burger Shot de doi tien.", KG[i]);
						SendClientMessage(i, COLOR_MONEY, string);
						SendClientMessage(i, COLOR_WHITE, "De den duoc Burger Shot, su dung lenh /gps -> Doanh nghiep.");
						JobWorking[i] = 0;
						PlayerTextDrawHide(i, JobTD);
						if(JobVehicle[i] != 0) { DestroyVehicle(JobVehicle[i]); JobVehicle[i] = 0; }
						PlayerTextDrawHide(i, InfosTD);
						DisablePlayerCheckpointEx(i);
						JobVehicle[i] = 0;			
						if(PlayerInfo[i][pDauXanh] < 10)
						{
							PlayerInfo[i][pDauXanh] += 1;
							Update(i, pDauXanhx);
							SendClientMessage(i, COLOR_YELLOW, "Ban Nhan Duoc 1 Dau Xanh");
						}			
					}
				}
			}

			// printf("%i, %.0f", i, Health[i]);
			if(PlayerInfo[i][pShowHP] != 0 && Health[i] > 0)
			{
				format(string, sizeof(string), "%.0f", Health[i]);
				PlayerTextDrawSetString(i, CleoTD[0], string);
				PlayerTextDrawShow(i, CleoTD[0]);
				PlayerTextDrawColor(i, CleoTD[0], GetHudColor(PlayerInfo[i][pShowHP]));
			}
			else PlayerTextDrawHide(i, CleoTD[0]);


			if(PlayerInfo[i][pShowAP] != 0 && Armour[i] > 0)
			{
				format(string, sizeof(string), "%.0f", Armour[i]);
				PlayerTextDrawSetString(i, CleoTD[1], string);
				PlayerTextDrawShow(i, CleoTD[1]);
				PlayerTextDrawColor(i, CleoTD[1], GetHudColor(PlayerInfo[i][pShowAP]));
			}
			else PlayerTextDrawHide(i, CleoTD[1]);
			
			if(SafeTime[i] > 0) SafeTime[i]--;
			if(SafeTime[i] == 1) {
				if(PlayerAccount[i] == 1 && IsPlayerLogged[i] == 0) {
					format(string, sizeof(string), "Ban da dang ky thanh cong!\nNhap mat khau cua ban de dang nhap.",GetName(i));
					Dialog_Show(i,DIALOG_LOGIN2,DIALOG_STYLE_PASSWORD,"Dang nhap", string,"Dang nhap","Quit");
				}
			}
			if(PlayerInfo[i][pLevel] > 23) PlayerInfo[i][pPayCheck] += 14;
			else PlayerInfo[i][pPayCheck] += ((PlayerInfo[i][pLevel] % 2 == 0) ? (PlayerInfo[i][pLevel] / 2) : (PlayerInfo[i][pLevel]+1 / 2)) + 1;

			if(PlayerInfo[i][pJailed] > 0) {
				if(PlayerInfo[i][pJailTime] > 0) {
					if(IsPlayerLogged[i] == 1) {
						PlayerInfo[i][pJailTime]--;
						PlayerTextDrawShow(i, Jailtime);
						if(PlayerInfo[i][pJailTime]/60 > 1) format(string, sizeof(string), "Ngoi tu: ~r~%d phut", PlayerInfo[i][pJailTime]/60);
						else if(PlayerInfo[i][pJailTime]/60 == 1) format(string, sizeof(string), "Ngoi tu: ~r~%d phut", PlayerInfo[i][pJailTime]/60);
						else if(PlayerInfo[i][pJailTime]/60 == 0) format(string, sizeof(string), "Ngoi tu: ~r~%d giay", PlayerInfo[i][pJailTime]);
						PlayerTextDrawSetString(i, Jailtime, string);
					}
				}
				else {
					PlayerInfo[i][pJailTime] = 0;
					PutPlayerInJail(i);
					PlayerInfo[i][pJailed] = 0;
					Update(i, pJailTimex);
					Update(i, pJailedx);
					SpawnPlayer(i);
					SetPlayerSpecialAction(i,SPECIAL_ACTION_NONE);
					RemovePlayerAttachedObject(i,1);
					PlayerTextDrawHide(i, Jailtime);
					if(PlayerInfo[i][pChar] > 0) SetPlayerSkinEx(i, PlayerInfo[i][pChar]); 
					else SetPlayerSkinEx(i, PlayerInfo[i][pModel]);
					ClearCrime(i);
					PlayerInfo[i][pAJail] = 0;
					UpdateVar(i, "AJail", 0);
					SetPlayerToTeamColor(i);
					TogglePlayerControllable(i, true);
				}
			}
			
			if(PlayerInfo[i][pHitT] > 0) PlayerInfo[i][pHitT] -= 1;
			if(PlayerInfo[i][pMuted] > 0) {
				if(--PlayerInfo[i][pMuteTime] < 0) {
					PlayerInfo[i][pMuteTime] = 0;
					SendClientMessage(i, COLOR_GREY, "Ban da duoc unmute tu dong.");
					PlayerInfo[i][pMuted] = 0;
				}
			}
			if(targetfind[i] > -1 && UsedFind[i] == 1) {
				new target, j;
				target = targetfind[i];
				if(Spectate[target] != 255) {
					PlayerTextDrawHide(i, FindTD);
					DisablePlayerCheckpointEx(i);
					SendClientMessage(i, COLOR_YELLOW, "Admin do dang ban! Diem mau do da bi huy kich hoat.");
					targetfind[i] = -1;
					CP[i] = 0;
					UsedFind[i] = 0;	
				}
				else {
					new szTD[120];
					if(InBussines[target] > 0) {
						j = InBussines[target];
						SetPlayerCheckpointEx(i,BizzInfo[j][bEntranceX], BizzInfo[j][bEntranceY], BizzInfo[j][bEntranceZ],4);
						format(szTD, 95, "Name: ~r~~h~%s (%d)~n~Distance: ~r~~h~%0.1fm (%s)", GetName(targetfind[i]), targetfind[i], GetPlayerDistanceFromPoint(i, BizzInfo[j][bEntranceX], BizzInfo[j][bEntranceY], BizzInfo[j][bEntranceZ]), GetCity(target));
						PlayerTextDrawSetString(i, FindTD, szTD);
						PlayerTextDrawShow(i, FindTD);
					}
					else if(InHouse[target] > 0) {
						j = InHouse[target];
						SetPlayerCheckpointEx(i,HouseInfo[j][hEntrancex],HouseInfo[j][hEntrancey],HouseInfo[j][hEntrancez],4);
						format(szTD, 95, "Name: ~r~~h~%s (%d)~n~Distance: ~r~~h~%0.1fm (%s)", GetName(targetfind[i]), targetfind[i], GetPlayerDistanceFromPoint(i, HouseInfo[j][hEntrancex],HouseInfo[j][hEntrancey],HouseInfo[j][hEntrancez]), GetCity(target));
						PlayerTextDrawSetString(i, FindTD, szTD);
						PlayerTextDrawShow(i, FindTD);
					}
					else if(InHQ[target] > 0) {
						j = InHQ[target];
						SetPlayerCheckpointEx(i, DynamicFactions[j][fcX], DynamicFactions[j][fcY], DynamicFactions[j][fcZ], 4);
						format(szTD, 95, "Name: ~r~~h~%s (%d)~n~Distance: ~r~~h~%0.1fm (%s)", GetName(targetfind[i]), targetfind[i], GetPlayerDistanceFromPoint(i, DynamicFactions[j][fcX], DynamicFactions[j][fcY], DynamicFactions[j][fcZ]), GetCity(target));
						PlayerTextDrawSetString(i, FindTD, szTD);
						PlayerTextDrawShow(i, FindTD);				
					}
					else {
						GetPlayerPos(target,x,y,z);
						SetPlayerCheckpointEx(i,x,y,z,4);
						format(szTD, 95, "Name: ~r~~h~%s (%d)~n~Distance: ~r~~h~%0.1fm (%s)", GetName(targetfind[i]), targetfind[i], GetPlayerDistanceFromPoint(i, x,y,z), GetCity(target));
						PlayerTextDrawSetString(i, FindTD, szTD);
						PlayerTextDrawShow(i, FindTD);
					}
				}	
			}
			if(IsAMember(i)) {
				// if(UsingSampcac{i} == 0 || ServerSystem[13] == 0) return SendClientMessage(i, COLOR_GOLD, "INFO: {FFFFFF}Ban chua cai dat SAMPCAC nen ban khong the tham gia war. Hay tai SAMPCAC o bai dang tren group.");
				// if(InWar[PlayerInfo[i][pMember]] == 1 && (UsingSampcac{i} == 1 || ServerSystem[13] == 1) && IsPlayerLogged[i] == 1) {
				if(InWar[PlayerInfo[i][pMember]] == 1 && IsPlayerLogged[i] == 1) {
					new faction = PlayerInfo[i][pMember];
					for(new wi = 1; wi < turfsss;wi++) {
						if(WarInfo[wi][wFaction] == faction || WarInfo[wi][wAttacker] == faction) {
							new attackers = WarInfo[wi][wAttacker];
							new defenders = WarInfo[wi][wFaction];
							new uciderii = 0;
							uciderii += ucideri[i][wi];
							new decesee = 0;
							decesee += decese[i][wi];
							new Float: atscore = 0.0;
							new Float: defscore = 0.0;
							atscore = WarScoreF[attackers][wi];
							defscore = WarScoreF[defenders][wi];						
					
							if(playerDeath[i] == 0 && PlayerInfo[i][pWantedLevel] == 0 && PlayerInfo[i][pJailTime] == 0 && GetPlayerInterior(i) == 0 && GetPlayerVirtualWorld(i) == 0) {
								if(CAC_GetStatus(i) || GetPVarInt(i, "NotAndroid") == 0) 
								{
									SetPlayerVirtualWorld(i, wi);
									format(string, sizeof(string), "Ban da duoc dich chuyen den virtual world %d (the gioi ao) vi mafia cua ban dang bao ve hoac tranh gianh dia ban.", wi);
									SendClientMessage(i, COLOR_YELLOW, string);
									SetPlayerArmourEx(i, 30);
								}
								if(ServerSystem[13] == 0) SendClientMessage(i, COLOR_GOLD, "SAMPCAC >> {FFFFFF}Ban chua cai dat SAMPCAC nen ban khong the tham gia war. Hay tai SAMPCAC o discord.");
								// SetPlayerVirtualWorld(i, wi);
								// format(string, sizeof(string), "Ban da duoc dich chuyen den virtual world %d (the gioi ao) vi mafia cua ban dang bao ve hoac tranh gianh dia ban.", wi);
								// SendClientMessage(i, COLOR_YELLOW, string);
							}


							if(WarInfo[wi][wFaction] == faction)
							{
								format(string, sizeof(string), "Turf: %s (%d)~n~%s %.1f - %.1f %s~n~Giet: %d Chet: %d Diem: %d~n~Giay tren dia ban: %d~n~Thoi gian war: ~y~~h~%s~w~~h~",
								TurfInfo[wi][zName],wi,FactionName(attackers),atscore,defscore,FactionName(defenders),
								uciderii, decesee, uciderii-decesee, WarSeconds[i], CalculeazaTimp2(WarInfo[wi][wTime]));
							}
							else if(WarInfo[wi][wAttacker] == faction)
							{
								format(string, sizeof(string), "Turf: %s (%d)~n~%s %.1f - %.1f %s~n~Giet: %d Chet: %d Diem: %d~n~Giay tren dia ban: %d~n~Thoi gian war: ~y~~h~%s~w~~h~",
								TurfInfo[wi][zName],wi,FactionName(attackers),atscore,defscore,FactionName(defenders),
								uciderii, decesee, uciderii-decesee, WarSeconds[i], CalculeazaTimp2(WarInfo[wi][wTime]));
							}			
							break;
						}
					}
					PlayerTextDrawSetString(i, WarTime, string);
					PlayerTextDrawShow(i, WarTime);

					if(IsPlayerInTurf(i, InWarTurf[PlayerInfo[i][pMember]])) {
						new turf = InWarTurf[PlayerInfo[i][pMember]];
						if(WarInfo[turf][wFaction] == PlayerInfo[i][pMember] || WarInfo[turf][wAttacker] == PlayerInfo[i][pMember]) {
							if(IsPlayerPaused(i) == false) WarSeconds[i] ++;
							if(IsPlayerInAnyVehicle(i)) {
								SendClientMessage(i, COLOR_YELLOW, "Ban da vao khu vuc chiem dia ban.");
							    new Float: Pos[3], vid= GetPlayerVehicleID(i);
							    GetPlayerPos(i, Pos[0], Pos[1], Pos[2]);
							    SetPlayerPosEx(i, Pos[0], Pos[1], Pos[2]+1);
							    SetVehicleToRespawn(ServerVehicles[vid][vSpawned]), Gas[ServerVehicles[vid][vSpawned]] = 100;
							}
							/*if(GetPlayerVirtualWorld(i) != 0 && UsingSampcac{i} == 0) 
							{
								SetPlayerVirtualWorld(i, 0);
							}*/
						}
					}
				}
			}
			if(PlayerTazeTime[i] > 0) {
				PlayerTazeTime[i] += 1;
				if(PlayerTazeTime[i] == 15) PlayerTazeTime[i] = 0;
				else {
					new Float:angle;
					GetPlayerFacingAngle(i, angle);
					SetPlayerFacingAngle(i, angle + 90);
				}
			}
			if(PlayerDrunk[i] > 4) {
				PlayerDrunkTime[i] += 1;
				if(PlayerDrunkTime[i] == 5) {
					PlayerDrunkTime[i] = 0;
					LoopingAnim(i,"PED","WALK_DRUNK",4.0,1,1,1,1,0);
					if(random(1) == 0)
					{
						SetPlayerWeather(i, -84);
			 			SetPlayerDrunkLevel(i, 10000);
			 			SetPlayerTime(i,4,00);						
					} else {
				  		SetPlayerWeather(i, -66);
						SetPlayerDrunkLevel(i, 10000);
						SetPlayerTime(i,12,00);
					}
				}
			}
			// if(InWar[PlayerInfo[i][pMember]] == 0) {
			// 	new bool:test = false, bool:isInClanZone = false;
			// 	for(new sf = 0; sf < MAX_SAFEZONES; sf++) {
			// 		if(IsPlayerInRangeOfPoint(i, SafeZone[sf][szRange], SafeZone[sf][szX], SafeZone[sf][szY], SafeZone[sf][szZ]) && SafeZone[sf][szRange] > 15) {
			// 			Showed[i] = 1;
			// 			SFID[i] = sf;
			// 			PlayerTextDrawSetString(i, SafeTD, "SAFE-ZONE");
			// 			PlayerTextDrawShow(i, SafeTD);
			// 			test = true;
			// 			break;
			// 		}
			// 	}
			// 	if(!test) {
			// 		for(new sf = 0; sf < MAX_CLANZONES; sf++) {
			// 			if(IsPlayerInRangeOfPoint(i, 20.0, GraffitiInfo[sf][gfX], GraffitiInfo[sf][gfY], GraffitiInfo[sf][gfZ])) {
			// 				PlayerTextDrawSetString(i, SafeTD, "CLAN-ZONE");
			// 				PlayerTextDrawShow(i, SafeTD);
			// 				SFID[i] = sf;
			// 				isInClanZone = test = true;
			// 				break;
			// 			}
			// 		}					
			// 	}
			// 	if(!test && !isInClanZone) {
			// 		Showed[i] = 0;
			// 		SFID[i] = 0;
			// 	 	PlayerTextDrawHide(i, SafeTD);
			// 	}
			// }
			if(PlayerStoned[i] > 1) SetPlayerDrunkLevel (i, 5000);
			if(IsSmoking[i] > 0) {
				if(IsSmoking[i] == 0) {
					format(string, sizeof(string), "* %s da hut xong dieu thuoc.", GetName(i));
					ProxDetector(30.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					new Float: PlayerHealth;
					GetPlayerHealthEx(i, PlayerHealth);
					if(PlayerHealth > 92) SetPlayerHealthEx(i, 99);
					else SetPlayerHealthEx(i, PlayerHealth+6);
				}
				IsSmoking[i] -= 1;
			}
			if(PlayerCuffed[i] == 1) {
				if(PlayerCuffedTime[i] <= 0) {
					TogglePlayerControllable(i, true);
					PlayerCuffed[i] = 0;
					PlayerCuffedTime[i] = 0;
					PlayerTazeTime[i] = 1;
				}
				else PlayerCuffedTime[i] -= 1;
			}
			else if(PlayerCuffed[i] == 2) {
				if(PlayerCuffedTime[i] <= 0) {
					GameTextForPlayer(i, "~r~~h~Ban da duoc tha!", 2500, 3);
					TogglePlayerControllable(i, true);
					PlayerCuffed[i] = 0;
					PlayerCuffedTime[i] = 0;
				}
				else PlayerCuffedTime[i] -= 1;
			}
		
			if(IsPlayerInAnyVehicle(i)) {
				new Float: hpv;
				GetVehicleHealth(GetPlayerVehicleID(i), hpv);
				if(hpv == 1000.0) {
					foreach(new h : Bizs) {
						if(IsPlayerInRangeOfPoint(i,10.0,BizzInfo[h][bEntranceX], BizzInfo[h][bEntranceY], BizzInfo[h][bEntranceZ])) {
							if(BizzInfo[h][bType] == 13) {
								GivePlayerCash(i,-BizzInfo[h][bEntranceCost]);
								BizzInfo[h][bTill] += BizzInfo[h][bEntranceCost];
								Update(i, pCashx);	
								for(new m; m < (PlayerInfo[i][pVip] + 3); m++) {
									if(PlayerInfo[i][pDailyMission][m] == 18) CheckMission(i, m);
								}
								format(string, sizeof(string), "~r~-$%d", BizzInfo[h][bEntranceCost]);
								GameTextForPlayer(i, string, 1000, 1);									
							}
						}
					}	
					SetVehicleHealth(GetPlayerVehicleID(i), 999);
				}
			} 
			if(SpecialWeek == 1)  {
				if(PlayerInfo[i][pBackpack] == 2 && CheckObjects(i) < 100) {
					new szTD[100];
					string = "";
					new objs;
					for(new sq = 0; sq < 100; sq++) {
						if(PlayerInfo[i][pSpecialQuest][sq] == 0) {			
							if(IsPlayerInRangeOfPoint(i, 45.0, QuestPos[sq][0], QuestPos[sq][1], QuestPos[sq][2])) {
								new Float: oPos[3];
								GetPlayerObjectRot(i, PlayerInfo[i][pObjectQuest][sq], oPos[0], oPos[1], oPos[2]);
								SetPlayerObjectRot(i, PlayerInfo[i][pObjectQuest][sq], oPos[0], oPos[1], oPos[2]+35);
								format(string, 25, "~g~Object %d gan day~n~", sq+1), strcat(szTD, string), objs++;
							}
							else if(IsPlayerInRangeOfPoint(i, 75.0, QuestPos[sq][0], QuestPos[sq][1], QuestPos[sq][2])) format(string, sizeof(string), "~y~Object %d gan day~n~", sq+1), strcat(szTD, string), objs++;
							else if(IsPlayerInRangeOfPoint(i, 150.0, QuestPos[sq][0], QuestPos[sq][1], QuestPos[sq][2])) format(string, sizeof(string), "~r~Object %d gan day~n~", sq+1), strcat(szTD, string), objs++;
							
							PlayerTextDrawSetString(i, QuestTD, szTD);
							PlayerTextDrawShow(i, QuestTD);
							
							if(IsPlayerInRangeOfPoint(i, 1.0, QuestPos[sq][0], QuestPos[sq][1], QuestPos[sq][2])) {
								if(GetPlayerVirtualWorld(i) != 0) return SendClientMessage(i, COLOR_LGREEN, "[ERROR] Ban khong the nhat manh ghep nay vi ban dang o trong mot the gioi ao!");
								if(QuestDeelay[i] > 0) {
									format(string, 60, "[ERROR] Ban chi co the lay mot manh ghep khac sau %d giay!", QuestDeelay[i]);
									SendClientMessage(i, COLOR_LGREEN, string);
								}				
								else {
									if(IsPlayerInAnyVehicle(i)) SendClientMessage(i, COLOR_LGREEN, "[ERROR] Ban dang o trong mot phuong tien!");
									else {
										DestroyPlayerObject(i, PlayerInfo[i][pObjectQuest][sq]);
										PlayerInfo[i][pSpecialQuest][sq] = 1;
										SaveQuest(i);
										format(string, 102, "Ban da nhat duoc ~y~%d/100~w~~h~ so manh ghep.~n~Tiep tuc cho den khi nhan duoc phan thuong dac biet!", CheckObjects(i));
										PlayerTextDrawSetString(i, InfosTD, string);	
										PlayerTextDrawShow(i, InfosTD);
										defer HideTextdraw(i);								
										if(CheckObjects(i) == 100) {
											format(string, 110, "["QUEST_NAME"] %s da hoan thanh viec thu thap cac manh ghep va gianh duoc phan thuong dac biet!", GetName(i));
											SCMTA(COLOR_YELLOW, string);
											SendClientMessage(i, COLOR_YELLOW, "Xin chuc mung! Ban da hoan thanh vien thu thap cac manh ghep bi an!");
											SendClientMessage(i, COLOR_YELLOW, "Ban nhan duoc: 500.000$, 10 rp, 20 diem cuop, 20 diem vuot nguc, 50 pp, 1 level up, 1 slot gara.");
											GivePlayerCash(i, 500000);
											PlayerInfo[i][pExp] += 10;
											PlayerInfo[i][pPremiumPoints] += 50;
											Update(i, pPremiumPointsx);			
											Update(i, pRP);	
											PlayerInfo[i][pRob] += 20;
											Update(i, pRobx);	
											PlayerInfo[i][pEscapePoints] += 20;
											
											PlayerInfo[i][pLevel]++;
											Update(i,pLevelx);
											SetPlayerScore(i, PlayerInfo[i][pLevel]);
											
											UpdateVar(i, "EscapePoints", PlayerInfo[i][pEscapePoints]);	
											PlayerTextDrawHide(i, QuestTD);	
											if(PlayerInfo[i][pSlot][0] == 0) PlayerInfo[i][pSlot][0] = 1;
											else if(PlayerInfo[i][pSlot][1] == 0) PlayerInfo[i][pSlot][1] = 1;
											else if(PlayerInfo[i][pSlot][2] == 0) PlayerInfo[i][pSlot][2] = 1;
											else if(PlayerInfo[i][pSlot][3] == 0) PlayerInfo[i][pSlot][3] = 1;
											else if(PlayerInfo[i][pSlot][4] == 0) PlayerInfo[i][pSlot][4] = 1;
											else SendClientMessage(i, COLOR_LGREEN, "Ban khong co cho cho xe vi ban co so luong xe toi da!");
											UpdateSlots(i);
										}
										QuestDeelay[i] = 600;	
											
									}	
								}
							}
						}
					}
					if(objs == 0) PlayerTextDrawHide(i, QuestTD);
				}	
				if(QuestDeelay[i] > 0) QuestDeelay[i] --;		
			}
		}					
	}
	for(new i = 0; i < 3; i++) {
		if(PaintTime[i] == 0) {
			PaintTime[i] = -1; PaintText[i] = 60;
		}	
	}
	/*new iswar;
	for(new w = 0; w < facs; w++) {
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
	}*/
	OtherTimer();
	return 1;
}
task MesajStaff[360000]() {
	new helpss, reports, string[180];
	foreach(new f: Player) {
	    if(IsPlayerLogged[f] == 1) {
			if(Helped[f] == 1) helpss++;
			if(GetPVarInt(f, "Reported") == 1) reports++;
		}
	}
	foreach(new i: PlayerAdmins) {
		if(IsPlayerLogged[i] == 1) {
			if(PlayerInfo[i][pAdmin]+PlayerInfo[i][pHelper] > 0) {
				if(helpss+reports > 0) {
					format(string, sizeof(string), "Hien tai co %d cau hoi va %d bao cao.", helpss, reports);
					SendClientMessage(i, COLOR_YELLOW, string);
				}
			}
		}
	}
	HideDeathMessage();
	return 1;
}
task HelperQuestions[10000]() {
	new helpers;
	foreach(new i: Player) {
		if(IsPlayerLogged[i] == 1) {
			if(PlayerInfo[i][pHelper] != 0 && Iter_Contains(HelpersDuty, i) && HaveHelp[i] == -1) {
				HaveHelper[helpers] = i;
				helpers ++;
			}
			if(IsPlayerInRangeOfPoint(i, 50.0, -2317.8091,-1637.5575,483.7031)) {
				for(new m; m < (PlayerInfo[i][pVip] + 3); m++) {
					if(PlayerInfo[i][pDailyMission][m] == 7) CheckMission(i, m);
				}		
			}
			else if(IsPlayerInRangeOfPoint(i, 50.0, 1962.4126,-2193.3279,13.5469)) {
				for(new m; m < (PlayerInfo[i][pVip] + 3); m++) {
					if(PlayerInfo[i][pDailyMission][m] == 8) CheckMission(i, m);
				}		
			}
			else if(IsPlayerInRangeOfPoint(i, 100.0, 1338.6273,2153.1045,11.0578)) {
				for(new m; m < (PlayerInfo[i][pVip] + 3); m++) {
					if(PlayerInfo[i][pDailyMission][m] == 9) CheckMission(i, m);
				}
			}			
		}
	}
	foreach(new i : PlayerHelped) {
		if(IsPlayerLogged[i] == 1) {
			if(OnHelper[i] == 0) {
				if(helpers > 0) {
					new userID = HaveHelper[random(helpers)], playerid = i;
					if(HaveHelp[userID] == -1) {
						new string[144];
						PlayerPlaySound(userID, 1056, 0.0, 0.0, 0.0);
						format(string, sizeof(string), "Cau hoi cua ban da duoc Helper %s (%d) chap nhan. Hay doi tra loi.", GetName(userID), userID);
						SendClientMessage(i, COLOR_YELLOW, string);
						SendClientMessage(userID, COLOR_YELLOW, "Cau hoi moi:");
						format(string, 512, "* %s (%d) hoi: %s", GetName(playerid), playerid, HelpText[i]);
						SendClientMessage(userID, 0x4FB021FF, string);
						HaveHelp[userID] = playerid;
						OnHelper[i] = 1;
					}	
				}	
			}
		}
	}
	return 1;
}
task Checkvehinfo[1000]() {
	foreach(new i: Player) {
		if((GetPlayerState(i) == PLAYER_STATE_DRIVER || GetPlayerState(i) == PLAYER_STATE_PASSENGER) && InWar[PlayerInfo[i][pMember]] == 0 && InDealer[i] == 0) {
			if(Iter_Contains(PlayerInRace, i) && RaceStarted == 0) return 1;
			new 
				str[14], benzina[10], str2[80],
				engine,lights,alarm,doors,bonnet,boot,objective,
				vehicle = GetPlayerVehicleID(i), carid = FindSpawnID(vehicle), spe = Carspeed(i);
			GetVehicleParamsEx(vehicle,engine,lights,alarm,doors,bonnet,boot,objective);
			#pragma unused lights
			#pragma unused alarm
			#pragma unused bonnet
			#pragma unused boot
			#pragma unused objective
			if(Gas[vehicle] > 20) format(benzina, sizeof(benzina), "%d", Gas[vehicle]);
			else format(benzina, sizeof(benzina), "~r~%d", Gas[vehicle]);
			
			if(CarInfo[carid][cID] != -2 && carid != 0 && !IsAPlane(vehicle)) {
				if(!IsABike(vehicle) && !IsAPlane(vehicle)) 
					format(str2, sizeof(str2), "Fuel: ~y~%s~w~~h~ (C: 2L)~n~Doors: %s~w~~h~~n~Odometer: %.2f", benzina, (doors) ? "~r~Khoa" : "~y~Khong khoa", CarInfo[carid][KM]);
				else format(str2, sizeof(str2), "Odometer: %.2f", CarInfo[carid][KM]);
		
				/*static Float:vel[3];
				GetVehicleVelocity(vehicle, vel[0], vel[1], vel[2]);
				va_SendClientMessage(i, -1, "%f, %d", vel[0] * vel[0] + vel[1] * vel[1], GetPlayerSpeed(i));
				if(vel[0] * vel[0] + vel[1] * vel[1] < 0.25) return 0;

		        Get the player keys (vx is used here because we don't need updown/leftright)
		        if(CarInfo[carid][cLevel] > 0) {
			        new Float:vx,keys;
			        GetPlayerKeys(i, keys, _:vx, _:vx);
					If KEY_VEHICLE_FORWARD is pressed, but not KEY_VEHICLE_BACKWARD or KEY_HANDBRAKE.				
					if ((keys & (KEY_VEHICLE_FORWARD | KEY_VEHICLE_BACKWARD | KEY_HANDBRAKE)) == KEY_VEHICLE_FORWARD) {
		                if (spe < spe + 15 * CarInfo[carid][cLevel]) // and lower than max speed, so vehicle speed cap can handle it.
		                {
							SetVehicleSpeed(vehicle, spe + 15 * CarInfo[carid][cLevel]);
							SendClientMessage(i, -1, "[Boost]");
						}
		        	}
		        }*/
			}
			else if(!IsABike(vehicle) && !IsAPlane(vehicle))
				format(str2, sizeof(str2), "Fuel: ~y~%s~w~~h~ (C: 2L)~n~Doors: %s", benzina, (doors) ? "~r~Khoa" : "~y~Khong khoa");
			else 
				format(str2, sizeof(str2), "Doors: %s", (doors) ? "~r~Khoa" : "~y~Khong khoa");
			if(spe < 70) FORMAT:str("~g~%d", spe);
			else if(spe < 120) FORMAT:str("~y~%d", spe);
			else FORMAT:str("~r~%d", spe);
			PlayerTextDrawSetString(i, Speedo[0], str);
			PlayerTextDrawSetString(i, Speedo[1], str2);
			PlayerTextDrawShow(i, Speedo[0]);
			PlayerTextDrawShow(i, Speedo[1]);		
			TextDrawShowForPlayer(i, Speedo4);		
		}		
	}
	return 1;
}
task CheckGas[RunOutTime]() {
	new engine,lights,alarm,doors,bonnet,boot,objective;
	foreach(new i: Player) {
   		if(GetPlayerState(i) == PLAYER_STATE_DRIVER) {
       		new vehicle = GetPlayerVehicleID(i), query[70];
			if(Gas[vehicle] > 0) {
	   			if(vehEngine[vehicle] == 1) {
					if(IsAPlane(vehicle) || IsABoat(vehicle) || IsABike2(vehicle) || JobVehicle[i] == vehicle) { Gas[vehicle]++; }
				  	if(!IsPlayerPaused(i)) Gas[vehicle]--;
				  	new carid = FindSpawnID(vehicle);
					if(CarInfo[carid][cID] != -2 && carid != 0) {
						new spe = Carspeed(i);
						if(spe > 5 && GetPlayerState(i) == PLAYER_STATE_DRIVER && GetPlayerVehicleID(i) == vehicle) {
							CarInfo[carid][KM] += (spe*0.27)/100;
							format(query, sizeof(query), "UPDATE `cars` SET `KM`='%f' WHERE `ID`='%d'", CarInfo[carid][KM], carid);
							mysql_pquery(SQL, query);
						}
					}
				}
	   		}
   			else if(!IsAFLYCar(vehicle)) {
			  	NoFuel[i] = 1;
			  	TogglePlayerControllable(i, false);
				GameTextForPlayer(i,"Het xang",1500,3);
				vehEngine[vehicle] = 0;
    			GetVehicleParamsEx(vehicle,engine,lights,alarm,doors,bonnet,boot,objective);
      			SetVehicleParamsEx(vehicle,VEHICLE_PARAMS_OFF,lights,alarm,doors,bonnet,boot,objective);
      			SetPVarInt(i, "Engine", 0);
			}
		}
	}
	return 1;
}
timer Fillup[10000](playerid) {
	new VID, FillUp;		
	VID = GetPlayerVehicleID(playerid);
	FillUp = GasMax - Gas[VID];
	new Incarcare = GasMax - Gas[VID];
	FillUp *= 200;
	if(Refueling[playerid] == 1) {
		if(GetPlayerCash(playerid) > FillUp) {
			Gas[VID] += Incarcare;
			va_SendClientMessage(playerid,COLOR_MONEY, "* Xe da duoc nap day xang! Gia: $%s.",FormatNumber(FillUp));
			TogglePlayerControllable(playerid, true);
			GivePlayerCash(playerid, - FillUp);
			BizzInfo[GetGasStationID(playerid)][bTill] += FillUp;
			Refueling[playerid] = 0;
			new str[70];
			Update(playerid, pCashx);
			format(str,sizeof(str),"UPDATE `bizz` SET `Till`='%d' WHERE `ID`='%d'",BizzInfo[GetGasStationID(playerid)][bTill], GetGasStationID(playerid));
			mysql_query(SQL, str, false);
		}
		else {
			TogglePlayerControllable(playerid, true);
			Refueling[playerid] = 0;
			va_SendClientMessage(playerid,COLOR_LGREEN,"Ban can $%d de do xang.",FillUp);
		}
	}
	return 1;
}
timer HideTDAchiv[10000](playerid) {
	PlayerTextDrawHide(playerid, AchivPTD[0]);
	TextDrawHideForPlayer(playerid, AchivTD[0]);
	TextDrawHideForPlayer(playerid, AchivTD[1]);
	return 1;
}
timer taxibaraclose[5000]()
{
	MoveObject(taxibar, 1811.57495, -1894.22595, 13.54720, 0.005, 0.00000, 90.02000, 90.00000);
	taxiBarTimer = Timer:0;
    return 1;
}
timer LVPDGates[5000](id) {
	switch(id) {
		case 1: MoveDynamicObject(gatelvpd[0], 2293.85132, 2497.67554, 4.53215, 5);
		case 2: MoveDynamicObject(gatelvpd[1], 2335.20093, 2443.69922, 7.23391, 5);
		case 3: MoveDynamicObject(gatelvpd[2], 2238.21460, 2450.26953, 10.69610,  1, 0.00000, 90.00000, 90.00000);		
	}
	return 1;
}
timer DealerShipGates[4000]() {
	gateds[0] = CreateDynamicObject(19325,1305.959,-1430.014,12.506,90.000,0.000,90.000,-1,-1,-1,300.000,300.000); // Door 1 (Opened coords 1305.959,-1430.014,12.506) If u want to make them open.
	gateds[1] = CreateDynamicObject(19325,1301.839,-1430.014,12.506,90.000,0.000,90.000,-1,-1,-1,300.000,300.000); // Door 2 (Opened coords 1301.839,-1430.014,12.506) If u want to make them open.
	return 1;
}
task WantedDecrease[60000](playerid) {
	foreach(new i: PlayerWanted) {
		if(PlayerInfo[i][pWantedLevel] > 0) {
			WantedTime[i]++;
			UpdateVar(i, "WantedTime", WantedTime[i]);
		}
	}
}
function ResetQuest() {
	new query[300];
	//update vip
	for(new i = 2; i < 7; i++)
	{
		format(query, sizeof(query), "UPDATE `users` SET `DailyMission`='-1', `Progress`='0', `DailyMission%d`='-1', `Progress%d`='0', `NeedProgress%d`='0'", i, i, i);
		mysql_query(SQL ,query, false);
	}

    foreach(new i: Player) {
		if(IsPlayerConnected(i) && IsPlayerLogged[i] == 1) {
			PlayerInfo[i][pDailyMission][0] = random(20);
			PlayerInfo[i][pDailyMission][1] = 1+random(19);
			PlayerInfo[i][pDailyMission][2] = 2+random(18);
			PlayerInfo[i][pDailyMission][3] = 3+random(17);
			PlayerInfo[i][pDailyMission][4] = 4+random(16);
			PlayerInfo[i][pDailyMission][5] = 5+random(15);
			//update vip
			// for(new index; index < PlayerInfo[i][pVip] + 3; index++)
			// 	PlayerInfo[i][pDailyMission][index] = SetMissionID(i, index);
			Update(i, pDailyMissionx);
			Update(i, pDailyMission2x);
			Update(i, pDailyMission3x);
			Update(i, pDailyMission4x);
			Update(i, pDailyMission5x);
			Update(i, pDailyMission6x);
			QuestProgress(i, PlayerInfo[i][pDailyMission][0], 0);
			QuestProgress(i, PlayerInfo[i][pDailyMission][1], 1);
			QuestProgress(i, PlayerInfo[i][pDailyMission][2], 2);
			QuestProgress(i, PlayerInfo[i][pDailyMission][3], 3);
			QuestProgress(i, PlayerInfo[i][pDailyMission][4], 4);
			QuestProgress(i, PlayerInfo[i][pDailyMission][5], 5);
			SendClientMessage(i, COLOR_YELLOW, "* Nhiem vu hang ngay da duoc reset. Su dung /nhiemvu de kiem tra ngay nao!");
		}
    }
	return 1;
}

task SyncUp[60000]() {
	new query[100], tmphour, tmpminute, tmpsecond, hour, minn, sec, Year, Month, Day;
	gettime(hour, minn, sec);
	gettime(tmphour, tmpminute, tmpsecond);
	getdate(Year, Month, Day);	
	
	// if(tmpminute == 30 || tmpminute == 0) Incendii();
	
	if(tmpminute == 0 || tmpminute == 10 || tmpminute == 20 || tmpminute == 30 || tmpminute == 40 || tmpminute == 50) OpenCells();
	else CloseCells();

	tmphour = FixHour(tmphour);

	
	if((tmphour > ghour) || (tmphour == 0 && ghour == 23)) {	
		ghour = tmphour;
		if(hour == 7 && tmpminute == 0) {
			ResetQuest();			
		}
		if(hour == 0 && tmpminute == 0) {
			SetTodayJob();
			if(hour == 0)
			{
				ServerSystem[22] = 1;
				SCMTA(COLOR_GOLD, "CUA HANG PIZZA: {FFFFFF}Chung toi da dong cua cho nen ban se khong the lam viec. Ban co the lam viec vao 7 gio sang hom nay.");
			}
			if(Battlepassday <= 0) Battlepassday = 0;
			else Battlepassday -= 1;
			format(query, sizeof(query), "UPDATE `stuff` SET `Battlepassday`='%d'", Battlepassday);
			mysql_pquery(SQL, query);	
			new dayz[180];
			format(dayz, sizeof(dayz), GetWeekDay(Day, Month, Year));
			if(strcmp(dayz,"Monday",true) == 0) {
				for(new sex; sex < 4; sex++) {
					if(bpweekstatus[sex] == 1 && bpweekstatus[sex+1] == 0) {
						bpweekstatus[sex+1] = 1;
						break;
					}
				}
			}
			// ResetDailyBonus();
			ResetQuest();
			if(Day == 1) {
				// format(query, sizeof(query), "DELETE FROM `trophy`");
				// mysql_query(SQL, query);				
				format(query, sizeof(query), "UPDATE `users` SET `HoursMonth`='0'");
				mysql_pquery(SQL, query);	
			
				/*new szResult[180], Cache: result, name[64], userid, x, hours;
				for(new i = 1; i < housess; i++) {
					if(strcmp(HouseInfo[i][hOwner], "The State", true) == 0) { }
					else {							
						format(query, sizeof(query), "SELECT * FROM `users` WHERE `name`='%s'", HouseInfo[i][hOwner]);
						result = mysql_query(SQL, query);
						cache_get_value_name(0, "id", szResult); userid = strval(szResult);
						cache_get_value_name(0, "HoursMonth", szResult); hours = strval(szResult);							
						cache_get_value_name(0, "name", szResult); format(name, 64, szResult);
						cache_delete(result);
						if(hours <= 5) {
							format(string, sizeof(string), "Ai pierdut casa #%d deoarece ai avut sub 5 ore jucate in aceasta luna.", i);
							InsertEmail(HouseInfo[i][hOwner], "AdmBot", string, 0);
							format(query, sizeof(query), "UPDATE `users` SET `House`='999' WHERE `ID`='%d'", userid);
							mysql_tquery(SQL, query, "", "");
							x++;
							HouseInfo[i][hOwned] = 1;
							HouseInfo[i][hValue] = 0;
							strmid(HouseInfo[i][hOwner], "The State", 0, strlen("The State"), 255);
							format(query, sizeof(query),"UPDATE `houses` SET `Hel`='0',`Arm`='0',`Lockk`='0',`Owned`='1',`Owner`='The State',`Value`='0' WHERE `ID`='%d'",BizzInfo[i][bID]);
							mysql_tquery(SQL, query, "", "");
							UpdateLabel(2, i);	
						}
					}
				}
				foreach(new i : Bizs) {
					if(strcmp(BizzInfo[i][bOwner], "The State", true) == 0) { }
					else {
						format(query, sizeof(query), "SELECT * FROM `users` WHERE `name`='%s'", BizzInfo[i][bOwner]);
						result = mysql_query(SQL, query);
						cache_get_value_name(0, "id", szResult); userid = strval(szResult);
						cache_get_value_name(0, "HoursMonth", szResult); hours = strval(szResult);							
						cache_get_value_name(0, "name", szResult); format(name, 64, szResult);
						cache_delete(result);
						if(hours <= 5) {
							format(string, sizeof(string), "Ai pierdut afacerea #%d deoarece ai avut sub 5 ore jucate in aceasta luna.", i);
							InsertEmail(BizzInfo[i][bOwner], "AdmBot", string, 0);
							format(query, sizeof(query), "UPDATE `users` SET `Bizz`='255' WHERE `ID`='%d'", userid);
							mysql_tquery(SQL, query, "", "");
							x++;
							BizzInfo[i][bLocked] = 0;
							BizzInfo[i][bOwned] = 1;
							BizzInfo[i][bBuyPrice] = 0;
							strmid(BizzInfo[i][bOwner], "The State", 0, strlen("The State"), 255);
							format(query, sizeof(query),"UPDATE `bizz` SET `Locked`='0',`Owned`='1',`Owner`='The State',`BuyPrice`='0' WHERE `ID`='%d'",BizzInfo[i][bID]);
							mysql_tquery(SQL, query, "", "");
							UpdateLabel(2, i);							
						}
					}
				}*/						
			} 
			// else if(Day == 7 || Day == 14 || Day == 21 || Day == 28) {
			// 	format(query, sizeof(query), "DELETE FROM `trophy` WHERE Type='3' OR Type='4' OR Type='5' OR Type='6'");
			// 	mysql_query(SQL, query);			
			// }
			for(new i = 0; i < MAX_CLANS; i++) {
				if(ClanInfo[i][clDays] > 0) {
					ClanInfo[i][clDays] --;
					format(query, sizeof(query), "UPDATE `clans` SET `Days`='%d' WHERE `ID`='%d'", ClanInfo[i][clDays], i);
					mysql_pquery(SQL, query);
					if(ClanInfo[i][clDays] == 0) RemoveClan(i);		
				}
			}
			
			format(query, sizeof(query), "UPDATE `users` SET `Days`=`Days`+1 WHERE `Member`>'0'");
			mysql_pquery(SQL, query);
			format(query, sizeof(query), "UPDATE `users` SET `ClanDays`=`ClanDays`+1 WHERE `Clan`>'0'");
			mysql_pquery(SQL, query);		
			format(query, sizeof(query), "UPDATE `users` SET `DayLogin`='0',`DayHours`='0',`DailyLogin`='0'");
			mysql_pquery(SQL, query);
			format(query, sizeof(query), "UPDATE `users` SET `HelpedPlayersToday`='0' WHERE `Helper`>='1'");
			mysql_pquery(SQL ,query);
			
			foreach(new i: Player) {
				if(IsPlayerLogged[i] == 1) {
					if(PlayerInfo[i][pDailyLogin] == 1) PlayerInfo[i][pDailyLogin] = 0;
					if(PlayerInfo[i][pMember] != 0) PlayerInfo[i][pDays] ++;
					
					PlayerInfo[i][pUsed] = 1;
					if(PlayerInfo[i][pHelper] != 0) PlayerInfo[i][pHelpedPlayersToday] = 0;
				}
			}	
		}
		if (hour == 7 ) ServerSystem[22] = 0;
		// if(realtime) SetWorldTimeEx(hour);
		if(hour == 19 || hour == 20) {
			SetWorldTime(23);
		}
		else if(hour == 21 || hour == 22 || hour == 23) {
			SetWorldTime(1+random(2));
		}
		else {
			SetWorldTime(hour);
		}
		new days[180];
		format(days, sizeof(days), GetWeekDay(Day, Month, Year));
		if(strcmp(days,"Sunday",true) == 0 || strcmp(days,"Monday",true) == 0 || strcmp(days,"Wednesday",true) == 0 || strcmp(days,"Friday",true) == 0) {
			if(hour == 13 || hour == 19) SCMTA(COLOR_GOLD, "INFO: {FFFFFF}Spray Clan Da Bat Dau, Da Toi Luc Anh Em Xuat Phat.");
			if(hour == 15 || hour == 21 && minn == 30) {
				SCMTA(COLOR_GOLD, "INFO: {FFFFFF}Spray Clan Da Ket Thuc, Anh Em Rut Lui Thoi.");
			}
			if(hour == 21 && minn == 40)
				for(new clansex = 0; clansex < clanss; clansex++) defer traoqua_spray[900000](clansex);
		}

	}
	if(hour == 20 && tmpminute == 5) {
		cauhoitrungthu();
	}
	if(hour == 20 && tmpminute == 7) {
		cauhoitrungthu();
	}
	if(hour == 20 && tmpminute == 9) {
		cauhoitrungthu();
	}
	if(hour == 20 && tmpminute == 11) {
		cauhoitrungthu();
	}
	if(hour == 20 && tmpminute == 13) {
		cauhoitrungthu();
	}
	if(hour == 20 && tmpminute == 15) {
		if(togtrungthu == 1)
		{
			cauhoixuathien = 0;
			new xxx;
			for(new s = 0; s < MAX_PLAYERS; s++) {
				if(InLeTrungThu[s] == 1) xxx++;
			}
			foreach(new i: Player) 
			{
				if(InLeTrungThu[i] == 1 && SoDapAnDung[i] >= 2) 
				{
					if(IsPlayerInRangeOfPoint(i, 20, 332.4916,-1798.3594,4.7045)) {
						if(xxx >= 10) PlayerInfo[i][pBanhTrungThu] += 100;
						else if(xxx >= 20) PlayerInfo[i][pBanhTrungThu] += 200;
						else if(xxx >= 30) PlayerInfo[i][pBanhTrungThu] += 300;
						else if(xxx >= 40) PlayerInfo[i][pBanhTrungThu] += 400;
						else if(xxx >= 50) PlayerInfo[i][pBanhTrungThu] += 500;
						else PlayerInfo[i][pBanhTrungThu] += 50;
						Update(i, pBanhTrungThux);
					}
					new rand = random(4);
					switch (rand) {
						case 0 : {
							SetPlayerPosEx(i,1087.3450,-1363.1055,13.7813);
						}
						case 1: {
							SetPlayerPosEx(i,1085.3999,-1363.2069,13.7813);
						}
						case 2: {
							SetPlayerPosEx(i,1083.7870,-1363.5781,13.7813);
						}
						case 3: {
							SetPlayerPosEx(i,1085.8542,-1358.6213,13.6622);
						}
					}
					SetPlayerVirtualWorld(i, 0);
					InLeTrungThu[i] = 0;
					SoDapAnDung[i] = 0;
					DaTraLoi[i] = 0;
				}
				else if(InLeTrungThu[i] == 1 && SoDapAnDung[i] < 2) {
					SendClientMessage(i, COLOR_YELLOW,"Ban Khong Nhan Duoc Banh Vi Tra Loi Dung Duoi 4 Cau");
					SoDapAnDung[i] = 0;
					InLeTrungThu[i] = 0;
					DaTraLoi[i] = 0;
					new rand = random(4);
					switch (rand) {
						case 0 : {
							SetPlayerPosEx(i,1087.3450,-1363.1055,13.7813);
						}
						case 1: {
							SetPlayerPosEx(i,1085.3999,-1363.2069,13.7813);
						}
						case 2: {
							SetPlayerPosEx(i,1083.7870,-1363.5781,13.7813);
						}
						case 3: {
							SetPlayerPosEx(i,1085.8542,-1358.6213,13.6622);
						}
					}
					SetPlayerVirtualWorld(i, 0);
				}
			}
			SCMTA(COLOR_CLIENT,"(( Tho Lam Banh: Le Trung Thu Da Ket Thuc Va Da Trao Thuong Cho Nhung Ai Tham Gia,Hay Quay Lai Vao Hom Sau ))");
		}
	}
	foreach(new i: Player) {
		if(AFKSeconds[i] < 30) SetPlayerHealthEx(i,Health[i]-1.0);
	}
	return 1;
}
timer ResetTEvent[600000]() {
	TEvent = 0;
	SCMTA(COLOR_CLIENT, "Event nho da duoc dong lai.");
}
task Production[300000]() {
	foreach(new i: Player) {
		if(IsPlayerConnected(i) && IsPlayerLogged[i] == 1) {
			if(PlayerDrunk[i] > 0) {
				PlayerDrunk[i] = 0;
			 	PlayerDrunkTime[i] = 0;
				SetPlayerDrunkLevel(i, 0);
			}
			if(PlayerInfo[i][pPayDay] < 6) PlayerInfo[i][pPayDay] += 1;
		}
	}
    if(tev < gtm && TEvent == 0)
    {
		switch(random(3))
		{
			case 0:
			{
				static const letters[65] = "qwertyuiopasdfghjklzxcvbnmmQWERTYUIOPASDFGHJKLZXCVBNNM0123456789";
				for(new i = 0; i < 5 + random(10); i++) FastEventText[i] = letters[random(sizeof(letters))];
				TEventReward = RandomEx(10000, 30000), TEvent = 1;
				SCMTA(0xADD63CFF, sprintf("Fast Event: Nguoi dau tien nhap ''{FFA200}%s{ADD63C}'' se chien thang %s$.", FastEventText, FormatNumber(TEventReward)));			
			}
			case 1: RandomMathEvent();
			// case 2: RandomTriviaEvent();
		}
		defer ResetTEvent();
		tev = gtm+1800;
    }
	return 1;
}
timer HidePaydayTD[10000](i) {
	TextDrawHideForPlayer(i, PPaydayTDS);
	PlayerTextDrawHide(i, PaydayTD);
	return 1;
}
timer ResetPD[60000]() {
	Paydaydat = 0;
}	
timer DecreaseLicenseHour[4000]() {
	foreach(new i: Player) {
		if(IsPlayerLogged[i] == 1) {
			if(PlayerInfo[i][pCarLicT] > 0) PlayerInfo[i][pCarLicT] -= 1;
			if(PlayerInfo[i][pFlyLicT] > 0) PlayerInfo[i][pFlyLicT] -= 1;
			if(PlayerInfo[i][pBoatLicT] > 0) PlayerInfo[i][pBoatLicT] -= 1;
			if(PlayerInfo[i][pFishLicT] > 0) PlayerInfo[i][pFishLicT] -= 1;
			if(PlayerInfo[i][pGunLicT] > 0) {
				PlayerInfo[i][pGunLicT] -= 1;
				if(PlayerInfo[i][pGunLicT] == 0) ResetWeapons(i);
			}
			if(PlayerInfo[i][pCarLic] == 1 && PlayerInfo[i][pCarLicT] == 0) PlayerInfo[i][pCarLic] = 0;
			if(PlayerInfo[i][pFlyLic] == 1 && PlayerInfo[i][pFlyLicT] == 0) PlayerInfo[i][pFlyLic] = 0;
			if(PlayerInfo[i][pBoatLic] == 1 && PlayerInfo[i][pBoatLicT] == 0) PlayerInfo[i][pBoatLic] = 0;
			if(PlayerInfo[i][pFishLic] == 1 && PlayerInfo[i][pFishLicT] == 0) PlayerInfo[i][pFishLic] = 0;
			if(PlayerInfo[i][pGunLic] == 1 && PlayerInfo[i][pGunLicT] == 0) PlayerInfo[i][pGunLic] = 0;
			
			if(PlayerInfo[i][pRob] < 20)  PlayerInfo[i][pRob]++;
			if(PlayerInfo[i][pFpunish] > 0) PlayerInfo[i][pFpunish]--;
			if(PlayerInfo[i][pCarLicS] > 0) PlayerInfo[i][pCarLicS] --;
			if(PlayerInfo[i][pGunLicS] > 0) PlayerInfo[i][pGunLicS] --;
			if(PlayerInfo[i][pFlyLicS] > 0) PlayerInfo[i][pFlyLicS] --;
			if(PlayerInfo[i][pBoatLicS] > 0) PlayerInfo[i][pBoatLicS] --;			
			if(IsACop(i)) {
				if(PlayerInfo[i][pLawyer] < 10) PlayerInfo[i][pLawyer] += 1;
			}
			if(PlayerInfo[i][pEscapePoints] < 20) {
				PlayerInfo[i][pEscapePoints] ++;
				UpdateVar(i, "EscapePoints", PlayerInfo[i][pEscapePoints]);			
			} 
			// else SendClientMessage(i, COLOR_GREEN, "Ban da co 20/20 diem robpoints nen khong nhan them duoc nua.");
		}
	}
	return 1;
}
task PayDay[10000]() {
	new hour,minn,sec;
	gettime(hour,minn,sec);
	#pragma unused sec
	if(Paydaydat == 0) {
		if(minn == 0) 
		{
			// loop through jobs, if job is fisherman, reset job attempt
			JobInfo[FISHING_LS_JOB_ID][jAttemptPerHour] = getFishAttemptPerHour(FISHING_LS_JOB_ID);
			JobInfo[FISHING_LV_JOB_ID][jAttemptPerHour] = getFishAttemptPerHour(FISHING_LV_JOB_ID);
			updateFishingTag(FISHING_LS_JOB_ID);
			updateFishingTag(FISHING_LV_JOB_ID);

			new string[128];
			new /*interest, */account;
			Paydaydat = 1;
			defer ResetPD[60000]();
			new rent[MAX_PLAYERS];
			defer DecreaseLicenseHour[4000]();
			GameTextForAll("~g~Payday", 5000, 1);
			foreach(new i: Player) {
				if(IsPlayerLogged[i] == 1) {
					// Exception{i} += 2;
					new key = PlayerInfo[i][pHouse];
					if(key != 999) {
						rent[i] = HouseInfo[key][hRent];
						HouseInfo[key][hTakings] += rent[i];
					}
					// new tmpintrate;
					SendClientMessage(i, COLOR_SERVER, "------------------------------------------------------------------------------------------------");
					// if(PlayerInfo[i][pVip] > 0){
					// 	tmpintrate = 2;
					// 	// PlayerInfo[i][pPayDayHad] += 1;
					// 	// if(PlayerInfo[i][pPayDayHad] >= 5) {
					// 	// 	PlayerInfo[i][pExp]++;
					// 	// 	PlayerInfo[i][pPayDayHad] = 0;
					// 	// }
					// 	new bonus = PlayerInfo[i][pPayCheck] / 2;
					// 	PlayerInfo[i][pPayCheck] += bonus;
					// }
					// else {
					// 	tmpintrate = 1;
					// }
					account = PlayerInfo[i][pAccount];
					Tax += TaxValue;
					
					// PlayerInfo[i][pAccount] -= TaxValue;
					new checks = PlayerInfo[i][pLevel]*4000+random(3000);
					if(PlayerInfo[i][pDailyLogin] == 0) checks = checks*2;			
					GivePlayerCash(i, checks);
					// interest = (PlayerInfo[i][pAccount]/1000)*(tmpintrate);
					// if(PlayerInfo[i][pDailyLogin] == 0 || ServerSystem[21] == 0) {
					// 	interest = interest*2;
					// 	// PlayerInfo[i][pExp] += 2;
					// }
					// else 
					PlayerInfo[i][pExp] += 1;
					UpdateProgress(i, 0);
					PlayerInfo[i][pAccount] += 6500;
				
					SendClientMessage(i, COLOR_WHITE, "Luong cua ban da den! Hay den ngan hang de kiem tra.");
					format(string, sizeof(string), "Ban nhan duoc %0.2f gio choi. (%.0f phut)", PlayerInfo[i][pSeconds]/3600, PlayerInfo[i][pSeconds]/60);
					SendClientMessage(i, COLOR_WHITE, string);
					format(string, sizeof(string), "Gio choi: %0.2f~n~PayCheck: $%s~n~So du cu: $%s~n~Thue: $%s~n~So du moi: $%s", PlayerInfo[i][pSeconds]/3600, 
						FormatNumber(checks), FormatNumber(account), FormatNumber(TaxValue), FormatNumber(PlayerInfo[i][pAccount]));
					PlayerTextDrawSetString(i, PaydayTD, string);
					TextDrawShowForPlayer(i, PPaydayTDS);
					PlayerTextDrawShow(i, PaydayTD);
					PlayerInfo[i][pExp]++;
					defer HidePaydayTD(i);
					PlayerInfo[i][pConnectTime] += PlayerInfo[i][pSeconds]/3600;
					if(PlayerInfo[i][pSeconds] >= 1800) {
						new query[70];
						format(query, sizeof(query), "UPDATE `users` SET `DayHours`=`DayHours`+1, `HoursMonth`=`HoursMonth`+1 WHERE `ID`='%d'", PlayerInfo[i][pSQLID]);
						mysql_pquery(SQL, query);
						
						if(PlayerInfo[i][pGiftPoints] < 5) {
							PlayerInfo[i][pGiftPoints] ++;
							UpdateVar(i, "GiftPoints", PlayerInfo[i][pGiftPoints]);
						}					
					}
					PlayerInfo[i][pSeconds] = 0;
					
					// if(PlayerInfo[i][pDailyLogin] == 0) {
					// 	PlayerInfo[i][pDailyLogin] = 1;
					// 	UpdateVar(i, "DailyLogin", 1);
					// 	SendClientMessage(i, COLOR_LIGHTBLUE, "Ban nhan duoc them hai diem rp va gap doi tien luong cho lan payday dau tien trong ngay.");
					// }
					
					if(PlayerInfo[i][pHouse] != 999) {
						format(string, sizeof(string), "Tien luong: $%s | Thue': -$%d | Thue nha: -$%d | So du cu: $%s", FormatNumber(checks), FormatNumber(TaxValue), HouseInfo[PlayerInfo[i][pHouse]][hRent], FormatNumber(account));
						SendClientMessage(i, COLOR_GREY, string);
						format(string, sizeof(string), "So du moi: $%s", FormatNumber(PlayerInfo[i][pAccount]));
						SendClientMessage(i, COLOR_GREY, string);
					}
					else {
						format(string, sizeof(string), "Tien luong: $%s | Thue': -$%d | Thue nha: -$0 | So du cu: $%s", FormatNumber(checks), FormatNumber(TaxValue), FormatNumber(account));
						SendClientMessage(i, COLOR_GREY, string);
						format(string, sizeof(string), "So du moi: $%s", FormatNumber(PlayerInfo[i][pAccount]));
						SendClientMessage(i, COLOR_GREY, string);
					}
					Update(i, pRP);
					PlayerInfo[i][pPayDay] = 0;
					PlayerInfo[i][pPayCheck] = 0;
					SendClientMessage(i, COLOR_SERVER, "------------------------------------------------------------------------------------------------");
					if(PlayerInfo[i][pExp] >= PlayerInfo[i][pLevel]*levelexp) SendClientMessage(i,COLOR_GOLD,"Ban da co du respect point yeu cau, ban co the su dung /muacapdo.");
				}
			}
			if(hour == 18) {
				lotowinner();
			}
			if(hour == 19) {
				new gold = 1 + random(10);
				new money = 10000 + random(20000);
				for(new h = 0; h < MAX_CLANS; h++) {
					if(strlen(ClanInfo[h][clName]) != 0) {
						if(GetClanTurfs(h) >= 10) {
							foreach(new i: Player) {
								if(PlayerInfo[i][pClan] == h && h != 0) {
									PlayerInfo[i][pPremiumPoints] += gold;
									Update(i, pPremiumPointsx);
									GivePlayerCash(i, money);
									format(string, sizeof(string), "[19h moi ngay] Ban nhan duoc %d XU va $%s vi clan cua ban co tren 10 dia ban.", gold, FormatNumber(money));
									SendClientMessage(i, COLOR_MONEY, string);
								}
							}				
						}
					}
				}
				// LoadLosSantosNightLight();		
			} 
			else if(hour == 18) {
				SpecialWeek = 0;
				SCMTA(COLOR_GOLD, "INFO: {FFFFFF}Server da tat tim object tu 16h-22h de giam lag.");
			} 
			else if(hour == 22) {
				SpecialWeek = 1;
				SCMTA(COLOR_GOLD, "INFO: {FFFFFF}Tim object da duoc mo lai, ban co the tiep tuc cuoc hanh trinh roi.");
			}
			if(hour == 13 || hour == 18) {
				CasinoOn = 1;
				SCMTA(COLOR_GOLD, "INFO: {FFFFFF}Tai xiu da duoc mo, nhanh tay dat cuoc nao cac dan choi!");
			}
			if(hour == 8 || hour == 16) {
				BidaOn = 1;
				SCMTA(COLOR_GOLD, "INFO: {FFFFFF}Bida da mo, nhanh tay lam vai co nao!");
			}
			if(hour == 16 || hour == 22) {
				CasinoOn=0;
				SCMTA(COLOR_GOLD, "INFO: {FFFFFF}Tai xiu da dong, se mo lai vao cac khung gio 13h-16h va 18h-22h.");
			}
			if(hour == 12 || hour == 3) {
				BidaOn=0;
				SCMTA(COLOR_GOLD, "INFO: {FFFFFF}Bida da dong, hay nghi ngoi thoi nao (Bida mo vao khung gio 8h-12h va 16h -> 3h ).");
			}
			if(hour == 15 || hour == 5) {
				XiDachOn=0;
				SCMTA(COLOR_GOLD, "INFO: {FFFFFF}Xi dach da dong, se mo lai cac khung gio 8-15h va 18h-5h.");
			}	
			if(hour == 8 || hour == 18) {
				XiDachOn=1;
				SCMTA(COLOR_GOLD, "INFO: {FFFFFF}Xi dach da mo, cac dan choi hay den CNN de choi thoi nao.");
			}	
			if(hour == 1)
			{
				RestartTime = 5*60;
				SCMTA(COLOR_GOLD, "INFO: {FFFFFF}Server chuan bi khoi dong lai sau 5 phut.");
				SCMTA(COLOR_GOLD, "INFO: {FFFFFF}Server se khoi dong lai cac khung gio 12 gio trua, 1 gio sang.");
				SCMTA(COLOR_GOLD, "INFO: {FFFFFF}Nguoi choi vui long khong choi tai xiu va chuan bi log out truoc.");
				SCMTA(COLOR_GOLD, "INFO: {FFFFFF}Tien cuoc, cac san pham, mon do bi rollback server se khong den bu!.");
				SCMTA(COLOR_GOLD, "INFO: {FFFFFF}Cam on ban da tham gia may chu GTAVLC.COM - hay gioi thieu may chu den ban be.");
			}
			if(RestartPayday == 2) {
				SCMTA(COLOR_CLIENT, "May chu sap duoc khoi dong lai! Xin vui long dang nhap lai sau 1 hoac 2 phut.");
				GameModeExit();
			}
		}
		else if(minn == 30) {			
			if(hour == 18) {
				Paydaydat = 1;
				defer ResetPD[60000]();				
				ImportSeedDaily();
			}
		}
	}



	return 1;
}

task OneTimer[300]() {

	foreach(new i : IsSpeed) 
		if(GetPlayerState(i) == PLAYER_STATE_DRIVER)
			GiveVehicleSpeed(i);
	return true;
}


// timer LoginAdmin[30000](playerid) {
// 	SendClientMessage(playerid, -1, "Het thoi gian");
// 	Kick(playerid);
// 	return 1;
// }
timer HideFriendTD[3000](playerid) {
	PlayerTextDrawHide(playerid, FriendTD);
	return 1;
}

task RentCar[20000]() {
	new carid, string[30], query[60], result[MAX_PLAYERS]; //chu y
	foreach(new i: Player) {
		if(GetPlayerState(i) == PLAYER_STATE_DRIVER) {
			carid = GetPlayerVehicleID(i);
			result[i] = 0;
			if(carid == rentls[1] || carid == rentls[2] || carid == rentls[3] || carid == rentls[4] || carid == rentls[5] || carid == rentls[6] || carid == rentls[7] || carid == rentls[8] || carid == rentls[9] || carid == rentls[10]) {		
				RentPrice[i] += BizzInfo[16][bEntranceCost];
				BizzInfo[98][bTill] += BizzInfo[98][bEntranceCost];
				format(query, sizeof(query),"UPDATE `bizz` SET `Till`='%d' WHERE `ID`='16'",BizzInfo[15][bTill]);
				mysql_pquery(SQL,query);				
				if(GetPlayerCash(i) < BizzInfo[98][bEntranceCost]) {
					RemovePlayerFromVehicleEx(i);
					PlayerTextDrawHide(i, FareTD);
					RentPrice[i] = 0;
					HireCar[i] = -1;
					SendClientMessage(i, COLOR_GREY, "Ban da bi da' ra khoi xe vi het tien!");
					result[i] = 1;
				}				
				GivePlayerCash(i, -BizzInfo[16][bEntranceCost]);
			}
			else if(carid == rentlv[1] || carid == rentlv[2] || carid == rentlv[3] || carid == rentlv[4] || carid == rentlv[5] || carid == rentlv[6] || carid == rentlv[7] || carid == rentlv[8] || carid == rentlv[9] || carid == rentlv[10]) {		
				RentPrice[i] += BizzInfo[98][bEntranceCost];
				BizzInfo[98][bTill] += BizzInfo[98][bEntranceCost];
				format(query, sizeof(query),"UPDATE `bizz` SET `Till`='%d' WHERE `ID`='30'",BizzInfo[15][bTill]);
				mysql_pquery(SQL,query);				
				if(GetPlayerCash(i) < BizzInfo[30][bEntranceCost]) {
					RemovePlayerFromVehicleEx(i);
					PlayerTextDrawHide(i, FareTD);
					RentPrice[i] = 0;
					HireCar[i] = -1;
					SendClientMessage(i, COLOR_GREY, "Ban da bi da' ra khoi xe vi het tien!");
					result[i] = 1;
				}				
				GivePlayerCash(i, -BizzInfo[30][bEntranceCost]);
			}			
			else if(carid == scooter[1] || carid == scooter[2] || carid == scooter[3] || carid == scooter[4] || carid == scooter[5]) {
				RentPrice[i] += BizzInfo[15][bEntranceCost];
				BizzInfo[15][bTill] += BizzInfo[15][bEntranceCost];
				format(query, sizeof(query),"UPDATE `bizz` SET `Till`='%d' WHERE `ID`='15'",BizzInfo[15][bTill]);
				mysql_pquery(SQL,query);						
				if(GetPlayerCash(i) < BizzInfo[15][bEntranceCost]) {
					RemovePlayerFromVehicleEx(i);
					PlayerTextDrawHide(i, FareTD);
					RentPrice[i] = 0;
					HireCar[i] = -1;
					SendClientMessage(i, COLOR_GREY, "Ban da bi duoi ra khoi xe vi het tien!");					
					result[i] = 1;
				}
				GivePlayerCash(i, -BizzInfo[15][bEntranceCost]);
			}
			else result[i] = 1;
			if(result[i] == 0) {
				format(string, sizeof(string), " Thue xe: ~g~$%s", FormatNumber(RentPrice[i]));
				PlayerTextDrawSetString(i, FareTD, string);
				PlayerTextDrawShow(i, FareTD);
			}	
		}
	}
	return 1;
}
// task OnFireUpdate[FIRE_UPDATE_TIMER_DELAY]()
// {
// 	new aim, piss;
// 	foreach(new playerid: Player) {
// 		piss = Pissing_at_Flame(playerid);
// 		aim = Aiming_at_Flame(playerid);
// 		if(GetPVarInt(playerid, "IsOnFire") && !CanPlayerBurn(playerid, 1)) TogglePlayerBurning(playerid, false);
// 		if(piss != -1 || aim != -1) {
// 			if(PlayerFireTimer[playerid][2] == -1 && ((aim != -1 && Pressing(playerid) & KEY_FIRE) || piss != -1)) {
// 				new value, time, Float:x, Float:y, Float:z;
// 				if(piss != -1) {
// 					value = piss;
// 					time = EXTINGUISH_TIME_PEEING;
// 				}
// 				else if(aim != -1)
// 				{
// 					value = aim;
// 					if(GetPlayerWeapon(playerid) == 41) {
// 						CreateExplosion(Flame[value][Flame_pos][0], Flame[value][Flame_pos][1], Flame[value][Flame_pos][2], 2, 5);
// 						return 1;
// 					}
// 					if(IsPlayerInAnyVehicle(playerid))
// 					{
// 						time = EXTINGUISH_TIME_VEHICLE;
// 					}
// 					else
// 					{
// 						time = EXTINGUISH_TIME_ONFOOT;
// 					}
// 				}
// 				if(value < -1) { time = EXTINGUISH_TIME_PLAYER; }
// 				time *= 5000;
// 				if(value >= -1) {
// 					x = Flame[value][Flame_pos][0];
// 					y = Flame[value][Flame_pos][1];
// 					z = Flame[value][Flame_pos][2];
// 					RemoveSmokeFromFire(value);
// 					Flame[value][Smoke][0] = CreateObject(18725, x, y, z, 0.0, 0.0, 0.0);
// 					Flame[value][Smoke][1] = CreateObject(18725, x+1, y, z, 0.0, 0.0, 0.0);
// 					Flame[value][Smoke][2] = CreateObject(18725, x-1, y, z, 0.0, 0.0, 0.0);
// 					Flame[value][Smoke][3] = CreateObject(18725, x, y+1, z, 0.0, 0.0, 0.0);
// 					Flame[value][Smoke][4] = CreateObject(18725, x, y-1, z, 0.0, 0.0, 0.0);
// 				}
// 				PlayerFireTimer[playerid][2] = SetTimerEx("ExtinguishTimer", time, 0, "dd", playerid, value);
// 			}
// 		}
// 		if(CanPlayerBurn(playerid) && IsAtFlame(playerid)) {
// 			TogglePlayerBurning(playerid, true);
// 		}		
// 	}

// 	#if defined BurnOthers
// 		new Float:x, Float:y, Float:z;
// 		foreach(new i: Player)
// 	  	{
// 	  		if(playerid != i)
// 		  	{
// 			  	if(CanPlayerBurn(i) && GetPVarInt(playerid, "IsOnFire") && !GetPVarInt(i, "IsOnFire"))
// 	  			{
// 				  	GetPlayerPos(i, x, y, z);
// 					if(IsPlayerInRangeOfPoint(playerid, BURNING_RADIUS, x, y, z))
// 					{
// 						TogglePlayerBurning(i, true);
// 					}
// 				}
// 			}
// 		}
// 	#endif
// 	return 1;
// }

task SaveImportantData[3600000]() {
    new query[300];
	
    foreach(new i: House) {
        format(query, sizeof(query),"UPDATE houses SET `Takings`='%d' WHERE `ID`='%d'", HouseInfo[i][hTakings], HouseInfo[i][hID]);
        mysql_query(SQL, query, false);
    }   
    foreach(new i: IterPlant) {
        format(query, sizeof(query), "UPDATE planting SET Time=%d WHERE ID=%i", Plant[i][PlantProgress], Plant[i][PlantOwnerSQLID]);
        mysql_query(SQL, query, false);
    }
    foreach(new i: CollectablePlant) {
        format(query, sizeof(query), "UPDATE planting SET Time=%d WHERE ID=%i", Plant[i][PlantProgress], Plant[i][PlantOwnerSQLID]);
        mysql_query(SQL, query, false);
    } 
    return 1;	
}