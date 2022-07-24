CheckPaintball() {
	foreach(new i: Player) {
		if(IsPlayerLogged[i] == 1 && GetPlayerScore(i) != 0) {
			for(new x = 3; x < 3; x++) {
				if(PaintTime[x] != -1 && PlayersOnPaint(x) < 2) {
					PaintTime[x] = -1;
					if(PaintType[i] == i+1) {
						new pp = PaintType[i]-1;
						ResetPlayerWeapons(i);
						SendClientMessage(i, COLOR_YELLOW, "ERROR: {FFFFFF} Round khong the bat dau vi thieu nguoi.");
						PlayerTextDrawHide(i, PaintTD);

						PKills[i] = 0, PDeaths[i] = 0;
						PKills[PaintballWinner[pp]] = 0; PDeaths[PaintballWinner[pp]] = 0;
						//SpawnPlayer(PaintballWinner[pp]);
						PaintballWinner[pp] = i;
						ResetWeapons(i);
						ResetWeapons(PaintballWinner[pp]);					
						PaintballWinnerScore[pp] = 0;
						
						for(new m = 0; m < 5; m++) SendDeathMessageToPlayer(i, 1001, 1001, 200);
					}
				}		
			}	
		}	
	}	
	return 1;
}
CMD:paintleave(playerid, params[]) {
	if(PaintType[playerid] == 0) return SendClientMessage(playerid, COLOR_GREY, "ERROR: {FFFFFF} Ban khong o trong paintball.");
	new string[180];
	format(string, sizeof(string), "%s da roi khoi paintball.", GetName(playerid));
	SendPaintMessage(PaintType[playerid], COLOR_YELLOW, string);
	PaintType[playerid] = 0;
	SetPlayerPosEx(playerid, gungamePos[0], gungamePos[1], gungamePos[2]);
	ResetWeapons(playerid);
	SetPlayerInterior(playerid, 0);
	SetPlayerVirtualWorld(playerid, 0);
	SetPlayerArmourEx(playerid, 0);
	if(IsACop(playerid) && OnDuty[playerid] == 0) SetPlayerSkinEx(playerid, 305);
    else if(PlayerInfo[playerid][pChar] > 0) SetPlayerSkinEx(playerid, PlayerInfo[playerid][pChar]);
    else SetPlayerSkinEx(playerid, PlayerInfo[playerid][pModel]);
	for(new m = 0; m < 5; m++) SendDeathMessageToPlayer(playerid, 1001, 1001, 200);
	CheckPaintball();
	SetPlayerWorldBounds(playerid, 20000.0000, -20000.0000, 20000.0000, -20000.0000);
	return 1;
}

CMD:paintstats(playerid, params[]) {
	SendClientMessage(playerid, -1, "----------------------------- Thong ke paintball -----------------------------");
	new string[180];
	format(string, sizeof(string), "[Clasic] %d kills, %d deaths. Rank: %s", PlayerInfo[playerid][pPaintKills][0], PlayerInfo[playerid][pPaintDeaths][0], PaintRank(playerid, 0));
	SendClientMessage(playerid, -1, string);
	format(string, sizeof(string), "[Clasic + giap] %d kills, %d deaths. Rank: %s", PlayerInfo[playerid][pPaintKills][1], PlayerInfo[playerid][pPaintDeaths][1], PaintRank(playerid, 1));
	SendClientMessage(playerid, -1, string);
	format(string, sizeof(string), "[Gun Game] %d kills, %d deaths. Rank: %s", PlayerInfo[playerid][pPaintKills][2], PlayerInfo[playerid][pPaintDeaths][2], PaintRank(playerid, 2));
	SendClientMessage(playerid, -1, string);			
	SendClientMessage(playerid, -1, "-----------------------------------------------------------------------------------");
	return 1;
}

CMD:racestats(playerid, params[]) {
	SendClientMessage(playerid, -1, "---------------- Thong ke Race Arena ----------------");
	new string[180];
	format(string, sizeof(string), "[Dia diem 1] %d lan cham dich", PlayerInfo[playerid][pRacePlace][0]);
	SendClientMessage(playerid, -1, string);		
	format(string, sizeof(string), "[Dia diem 2] %d lan cham dich", PlayerInfo[playerid][pRacePlace][1]);
	SendClientMessage(playerid, -1, string);			
	format(string, sizeof(string), "[Dia diem 3] %d lan cham dich", PlayerInfo[playerid][pRacePlace][2]);
	SendClientMessage(playerid, -1, string);				
	format(string, sizeof(string), "[Peste locul 3] %d lan cham dich", PlayerInfo[playerid][pRacePlace][3]);
	SendClientMessage(playerid, -1, string); 
	SendClientMessage(playerid, -1, "-------------------------------------------------------------");
	return 1;
}

stock PaintRank(playerid, paintid) {
	new kills = PlayerInfo[playerid][pPaintKills][paintid] -  PlayerInfo[playerid][pPaintDeaths][paintid];
	new rank[64];
	if(kills < 0) rank = "Rat te";
	if(kills >= 0 && kills < 25) rank = "Nguoi bat dau";	
	if(kills >= 25 && kills < 100) rank = "Tien tien";	
	if(kills >= 100) rank = "Cao thu";		
	return rank;
}

CMD:paint(playerid, params[]) return SendClientMessage(playerid, COLOR_LGREEN, "Lenh nay da bi vo hieu hoa vi Paintball da tro thanh mot biz!");
CMD:votemap(playerid, params[]) {
	if(PaintType[playerid] != 0) {
		if(Voted[playerid] == 1) return SendClientMessage(playerid, -1, "Ban khong the binh chon nhieu hon mot lan.");
		if(PaintVote[PaintType[playerid]-1] == 0) return SendClientMessage(playerid, -1, "Ban khong the bo phieu ngay bay gio.");
		Dialog_Show(playerid, DIALOG_VOTE, DIALOG_STYLE_LIST, "Binh chon ban do", "rc_arena\nfarm\nisland\ndesert\nbeach\nforest", "Ok", "Exit");
	}
	return 1;
}

PaintSpawn(playerid) {
	RemovePlayerAttachedObject(playerid, 8);
    SetPlayerArmourEx(playerid, 0);
    SetPlayerHealthEx(playerid, 99);	
    new rand = random(sizeof(PaintballSpawns));
	SetPlayerInterior(playerid, 0);
	switch(PaintMap[PaintType[playerid]-1]) {
		case 0: {
			SetPlayerPosEx(playerid, PaintballSpawns[rand][0], PaintballSpawns[rand][1], PaintballSpawns[rand][2]);
			SetPlayerInterior(playerid, 10);
			SetPlayerSkin(playerid, 291);
		}
		case 1: {
			SetPlayerPosEx(playerid, PaintballSpawns2[rand][0], PaintballSpawns2[rand][1], PaintballSpawns2[rand][2]);
			SetPlayerWorldBounds(playerid, 93.423, -245.2354, 186.846, -175.1681);
			SetPlayerSkin(playerid, 158);
		}	
		case 2: {
			SetPlayerPosEx(playerid, PaintballSpawns3[rand][0], PaintballSpawns3[rand][1], PaintballSpawns3[rand][2]);
			SetPlayerWorldBounds(playerid, 1400.3, 1099.627, 2854.154, 2711.035);	
			SetPlayerSkin(playerid, 154);	
		}	
		case 3: {
			SetPlayerPosEx(playerid, PaintballSpawns4[rand][0], PaintballSpawns4[rand][1], PaintballSpawns4[rand][2]);
			SetPlayerWorldBounds(playerid, -712.3504, -852.4849, 1611.547, 1424.701);
			SetPlayerSkin(playerid, 146);
		}	
		case 4: {
			SetPlayerPosEx(playerid, PaintballSpawns5[rand][0], PaintballSpawns5[rand][1], PaintballSpawns5[rand][2]);
			SetPlayerWorldBounds(playerid, 724.0283, 408.7256, -1775.037, -1915.172);
			SetPlayerSkin(playerid, 45);	
		}	
		case 5: {
			SetPlayerPosEx(playerid, PaintballSpawns6[rand][0], PaintballSpawns6[rand][1], PaintballSpawns6[rand][2]);
			SetPlayerWorldBounds(playerid, -420.4035, -595.5717, -35.03363, -198.5239);
			SetPlayerSkin(playerid, 27);	
		}			
	}
	SetPlayerVirtualWorld(playerid, PaintType[playerid]);
	if(PaintText[PaintType[playerid]-1] > 1) return 1;
	if(PaintTime[PaintType[playerid]-1] < 1) return 1;
	switch(PaintType[playerid]) {
		case 1: {
			ServerWeapon(playerid, 24, 999); ServerWeapon(playerid, 31, 999);
			ServerWeapon(playerid, 16, 1);
		}
		case 2: {
			SetPlayerArmourEx(playerid, 99);
			ServerWeapon(playerid, 24, 999); ServerWeapon(playerid, 31, 999);
			ServerWeapon(playerid, 16, 1);
		}
		case 3: {
			GiveSkillWeapon2(playerid);
		}
	}
	return 1;
}

GiveSkillWeapon(playerid) {
	switch(PKills[playerid]-PDeaths[playerid]) {
		case 0: ResetWeapons(playerid), ServerWeapon(playerid, 22, 999);
		case 3: ResetWeapons(playerid), ServerWeapon(playerid, 24, 999);
		case 6: ResetWeapons(playerid), ServerWeapon(playerid, 25, 999);
		case 9: ResetWeapons(playerid), ServerWeapon(playerid, 32, 999);
		case 12: ResetWeapons(playerid), ServerWeapon(playerid, 33, 999);
		case 15: ResetWeapons(playerid), ServerWeapon(playerid, 30, 999);
		case 18: ResetWeapons(playerid), ServerWeapon(playerid, 34, 999);
		case 21: ResetWeapons(playerid), ServerWeapon(playerid, 4, 999);
	}
	if(PKills[playerid]-PDeaths[playerid] < 0) ResetWeapons(playerid), ServerWeapon(playerid, 22, 999);
	return 1;
}

GiveSkillWeapon2(playerid) {
	switch(PKills[playerid]-PDeaths[playerid]) {
		case 0..2: ResetWeapons(playerid), ServerWeapon(playerid, 22, 999);
		case 3..5: ResetWeapons(playerid), ServerWeapon(playerid, 24, 999);
		case 6..8: ResetWeapons(playerid), ServerWeapon(playerid, 25, 999);
		case 9..11: ResetWeapons(playerid), ServerWeapon(playerid, 32, 999);
		case 12..14: ResetWeapons(playerid), ServerWeapon(playerid, 33, 999);
		case 15..17: ResetWeapons(playerid), ServerWeapon(playerid, 30, 999);
		case 18..20: ResetWeapons(playerid), ServerWeapon(playerid, 34, 999);
		case 21: ResetWeapons(playerid), ServerWeapon(playerid, 4, 999);
	}
	if(PKills[playerid]-PDeaths[playerid] < 0) ResetWeapons(playerid), ServerWeapon(playerid, 22, 999);
	return 1;
}

GetPaintLevel(playerid) {
	new level;
	switch(PKills[playerid]-PDeaths[playerid]) {
		case 0..2: level = 1;
		case 3..5: level = 2;
		case 6..8: level = 3;
		case 9..11: level = 4;
		case 12..14: level = 5;
		case 15..17: level = 6;
		case 18..20: level = 7;
		case 21..24: level = 8;
	}
	return level;
}

SendPaintMessage(paintid, color, text[]) {
	foreach(new i: Player) {
		if(PaintType[i] == paintid) {
			SendClientMessage(i, color, text);
		}
	}
	return 1;
}

PlayersOnPaint(paintid) {
	new x;
	foreach(new i: Player) {
		switch(paintid) {
			case 0: if(PaintType[i] == 1) x++; // classic
			case 1: if(PaintType[i] == 2) x++; // armour
			case 2: if(PaintType[i] == 3) x++; // gungame
		}
	}
	return x;
}