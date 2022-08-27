#include <YSI_Coding\y_hooks>
#include <YSI_Data\y_iterate>
#include <YSI_Players\y_android>

forward OnPlayerDeathEx(playerid, killerid, reason); 

Cache:va_mysql_query(const fmat[], va_args<>)
	return mysql_query( SQL, va_return( fmat, va_start<1> ), true);

function ResetVariables(playerid) {
	return 1;
}
function AfterDBLoad(playerid) {
	return 1;
}


public OnQueryError(errorid, const error[], const callback[], const query[], MySQL:handle) {
	if(errorid == 2003) {		
		foreach(new i: Player) {
			if(IsPlayerConnected(i) && IsPlayerLogged[i] == 1) {
				SendClientMessage(i, COLOR_CLIENT, "SERVER: Ban da bi kick vi mot loi ky thuat!");
				SendClientMessage(i, COLOR_CLIENT, "SERVER: Ban co the bao' cao' loi nay cho chung toi. Chung toi se tro lai cang som cang tot.");
				KickEx(i);
			}	
		}
		SendRconCommand("password baotri");
		SendRconCommand("hostname ["#SAMP_VERSION"] GGTA : Loi ky thuat!");	
		return 1;
	}
	print( "====================================================================" );
	printf( "Error ID: %d, Error: %s", errorid, error );
	printf( "Callback: %s", callback );
	printf( "gQuery: %s", query );
	print( "====================================================================" );
	return 1;
}

hook OnGameModeExit() {
	mysql_pquery(SQL, "UPDATE `users` SET `Status` = '0' WHERE `Status` = '1'");
    new query[300];
	
    foreach(new i: House) {
        format(query, sizeof(query),"UPDATE houses SET `Takings`='%d' WHERE `ID`='%d'", HouseInfo[i][hTakings], HouseInfo[i][hID]);
        mysql_pquery(SQL, query);
    }   
    foreach(new i: IterPlant) {
        format(query, sizeof(query), "UPDATE planting SET Time=%d WHERE ID=%i", Plant[i][PlantProgress], Plant[i][PlantOwnerSQLID]);
        mysql_pquery(SQL, query);
    }
    foreach(new i: CollectablePlant) {
        format(query, sizeof(query), "UPDATE planting SET Time=%d WHERE ID=%i", Plant[i][PlantProgress], Plant[i][PlantOwnerSQLID]);
        mysql_pquery(SQL, query);
    }
    
   // mysql_format(SQL, query, sizeof(query), "UPDATE `stuff` SET `ServerGoal`='%d'", ServerGoal);
	//mysql_query(SQL, query, false);

	DestroyDynamicActor(Actor1);
	DestroyDynamicActor(Actor2);
	DestroyDynamicActor(Actor3);
	DestroyDynamicActor(QuestActor);
    return 1;
}
public OnGameModeInit() {
	DisableCrashDetectLongCall();
	SetTimer("cadouzb", 7200000, false);
	
	AMXProtection();
	Streamer_SetVisibleItems(STREAMER_TYPE_OBJECT, 800); // increase object limit
	Iter_Init(LoginQueue);
	CA_Init();
	new Year, Month, Day, Hour, Minute, Second;
	getdate(Year, Month, Day);
	gettime(Hour, Minute, Second);
	format(StartDate, sizeof(StartDate), "%02d/%02d/%d %02d:%02d:%02d", Day, Month, Year, Hour, Minute, Second);
    new Cache: result = mysql_query(SQL, "SELECT * FROM `users`");
 	ServerAccounts = cache_num_rows();
    cache_delete(result);
    // Loop
    foreach(new x : Player) {
		// Check if the player is connected and not a NPC
		if (IsPlayerConnected(x) && !IsPlayerNPC(x))
		{
			// Remove the lamp post at the underground car park entrance
			RemoveBuildingForPlayer(x, 1226, 265.481, -1581.1, 32.9311, 5.0);
			
			// Remove the night lights object (must be removed to also remove any
			// occulsion zones inside the building)
			RemoveBuildingForPlayer(x, 6518, 280.297, -1606.2, 72.3984, 250.0);
		}
    }
    //end

	mysql_tquery(SQL, "SELECT * FROM `bizz` ORDER BY `bizz`.`ID` ASC", "LoadBizz", "");
	mysql_tquery(SQL, "SELECT * FROM `clanzone` ORDER BY `clanzone`.`ID` ASC", "LoadClanZone", "");
	mysql_tquery(SQL, "SELECT * FROM `clans` ORDER BY `clans`.`ID` ASC", "LoadClans", "");
	GClanMembers();
	GClanVehicles();

	mysql_tquery(SQL, "SELECT * FROM `turfs`", "LoadTurfs", "");
	mysql_tquery(SQL, "SELECT * FROM `houses` ORDER BY `houses`.`ID` ASC", "LoadProperty", "");

	mysql_tquery(SQL, "SELECT `jackpotactual`,`jackpotvechi` FROM `lotto` LIMIT 1","load_lotto","");

	mysql_tquery(SQL, "SELECT * FROM `safezones` ORDER BY `safezones`.`ID` ASC", "LoadSafeZones", "");
	LoadSVehicles();
	LoadVehicles();
	// LoadBlackMarket();
	
 	mysql_tquery(SQL, "SELECT * FROM `jobs` ORDER BY `jobs`.`ID` ASC", "LoadJobs", "");
 	mysql_tquery(SQL, "SELECT * FROM `factions`", "LoadFactions", "");
 	mysql_tquery(SQL, "SELECT * FROM dscars", "LoadDSCar", "");

	GetFMembers();
 	LoadWeedData();
 	LoadFurnitures();
 	#if defined BOXING_MAP
 	LoadBoxingMap();
 	#endif
	CallRemoteFunction("LoadStuff", "");
	// LoadGps();
	LoadMaps();
	LoadTDs();
	LoadIcons();
	LoadGates();
	LoadFood();
	load_ap_map();
	loadCityHall();
	load_dealership();
	t_map();		
	load_apartaments();
	loadpenhouse();
	LoadPickups(); 	
	mysql_tquery(SQL, "SELECT * FROM `seif`", "LoadSafes", "");	
	mysql_tquery(SQL, "SELECT * FROM `users`", "LoadUsers", "");
	cobj = LoadModelSelectionMenu("crb.txt");
	skinlist = LoadModelSelectionMenu("skins.txt");
	furnitures = LoadModelSelectionMenu("furnitures.txt");
	fskins[0] = LoadModelSelectionMenu("f1.txt");
	fskins[1] = LoadModelSelectionMenu("f2.txt");
	fskins[2] = LoadModelSelectionMenu("f3.txt");
	fskins[3] = LoadModelSelectionMenu("f4.txt");
	fskins[4] = LoadModelSelectionMenu("f5.txt");
	fskins[5] = LoadModelSelectionMenu("f6.txt");
	fskins[6] = LoadModelSelectionMenu("f7.txt");
	fskins[7] = LoadModelSelectionMenu("f8.txt");
	fskins[8] = LoadModelSelectionMenu("f9.txt");
	fskins[9] = LoadModelSelectionMenu("f10.txt");
	fskins[10] = LoadModelSelectionMenu("f11.txt");
	fskins[11] = LoadModelSelectionMenu("f12.txt");
	fskins[12] = LoadModelSelectionMenu("f13.txt");
	fskins[13] = LoadModelSelectionMenu("f14.txt");
	fskins[14] = LoadModelSelectionMenu("f15.txt");

	gtm = gettime();

	for(new i = 0; i <= sizeof(Peds)-1; i++) 
		AddPlayerClass(Peds[i][0],1958.3783,1343.1572,1100.3746,269.1425,-1,-1,-1,-1,-1,-1);  
	for(new c=0;c<CAR_AMOUNT;c++) Gas[c] = GasMax;

	if(realtime) {
		new tmphour, tmpminute, tmpsecond;
		gettime(tmphour, tmpminute, tmpsecond);
		// if(tmphour > 18) LoadLosSantosNightLight();
		if(17 < tmphour < 23) {
			SpecialWeek = 0;
			SCMTA(COLOR_GOLD, "INFO: {FFFFFF}Server da tat tim object tu 16h-22h de giam lag.");
		}
		if(tmphour<13||16<tmphour<18||22<tmphour) {
			CasinoOn=0;
			SCMTA(COLOR_GOLD, "INFO: {FFFFFF}Tai xiu da dong, se mo lai cac khung gio 13h-16h va 18h-22h.");
		}	
		tmphour = FixHour(tmphour);
		new worldt = tmphour+1;
		SetWorldTime(worldt);
	}
	SyncUp();
	g_SpeedThreshold = SPEED_THRESHOLD * SPEED_THRESHOLD;
	//for(new z; z < MAX_PLAYERS; z++) PlayerFireTimer[z][2] = -1;
	tev = gettime()+1800;
	gettime(ghour, gminute, gsecond);
	new string[30];
	format(string, sizeof(string), "GTAVLC v5.06, %02d/%02d", Day, Month);
	SetGameModeText(string);
	ghour = FixHour(ghour);
	if(!realtime) SetWorldTime(wotime);
    DisableInteriorEnterExits();
	AllowInteriorWeapons(1);
	UsePlayerPedAnims();
	EnableStuntBonusForAll(0);
	ShowPlayerMarkers(2);
	ManualVehicleEngineAndLights();
	
	CauCaZoneZ[0] = GangZoneCreate(398, -2769.5, 545, -2636.5);
	CauCaZoneZ[1] = GangZoneCreate(639, -2958, 786, -2825);
	CauCaZoneZ[2] = GangZoneCreate(717, -2727.9921875, 864, -2594.9921875);
	//CauCaZoneZ[3] = GangZoneCreate(959.98828125, -2888.484375, 1106.98828125, -2755.484375);
	//CauCaZoneZ[2] = GangZoneCreate(138.98828125, -2850.484375, 285.98828125, -2717.484375);
	// tholambanh
	tholambanhactor = CreateActor(168, 1091.3512,-1362.8875,14.2813,180.1804);
	ApplyActorAnimation(tholambanhactor, "DEALER","DEALER_IDLE",4.0,1,0,0,0,0);
	// 24/7 Actor
	Actor1 = CreateDynamicActor(224, -27.8746,-91.6354,1003.5469,6.7494);
	// SetActorVirtualWorld(Actor1, 46);
	// SetActorInvulnerable(Actor1, true);
	ApplyDynamicActorAnimation(Actor1, "DEALER","DEALER_IDLE",4.0,1,0,0,0,0);

	Actor2 = CreateDynamicActor(0, 308.1523,-143.0908,999.6016,358.4197);
	// SetActorVirtualWorld(Actor2, 81);
	// SetActorInvulnerable(Actor2, true);
	ApplyDynamicActorAnimation(Actor2, "DEALER","DEALER_IDLE",4.0,1,0,0,0,0);

	Actor3 = CreateDynamicActor(178, -103.9462,-24.2024,1000.7188,0.3414);
	// SetActorVirtualWorld(Actor3, 6);
	// SetActorInvulnerable(Actor3, true);
	ApplyDynamicActorAnimation(Actor3, "SMOKING","M_smk_tap",3.0,0,0,0,0,0);


	QuestActor = CreateDynamicActor(11, 1804.9772, -1847.8226, 13.5739, 180.0000);
	// SetActorVirtualWorld(Actor3, 6);
	// SetActorInvulnerable(Actor3, true);
	ApplyDynamicActorAnimation(Actor2, "DEALER","DEALER_IDLE",4.0,1,0,0,0,0);

	cadoumort = 1;
	if(ghour == 0) ServerSystem[22] = 1;
	ServerSystem[10] = 1; // đấu giá
	// ServerSystem[12] = 1; // tắt AUTOKICK cho nex-ac
	// ServerSystem[14] = 1; // tắt AUTOKICK anti fakekill
	ServerSystem[15] = 1; // tắt AUTOKICK anti godmode
	ServerSystem[16] = 1; // tắt AUTOKICK anti teleport/airbreak
	ServerSystem[11] = 1; // tắt AUTOKICK anti trollcar
	ServerSystem[20] = 1; // tắt war bù
	ServerSystem[21] = 1; // tắt x2 payday
	DISABLEREG = 0;
	return 1;
}
timer CheckAccount[3000](playerid) {
	new playername[MAX_PLAYER_NAME];
	GetPlayerName(playerid, playername, sizeof(playername));
	format(PlayerInfo[playerid][pUsername], 36, playername);
	gQuery[0] = EOS;
	TogglePlayerSpectating(playerid, false);
	format(gQuery,sizeof(gQuery),"SELECT * FROM users WHERE `name`='%s' LIMIT 1",GetName(playerid));
	mysql_tquery(SQL, gQuery, "CheckClassIP", "i", playerid);

	stop login[playerid];
	login[playerid] = defer LoginTimer(playerid);
	return true;
}
public OnPlayerConnect(playerid) {

	new GPCI[128];
	GetPlayerClientID(playerid, GPCI, 40);
    PlayerMobileInfo[playerid][isMobile] = false;

    if(strfind(GPCI, "5638413348335738345A4536524D4A524539334B") != -1 )
    {
		PlayerMobileInfo[playerid][isMobile] = true;
        PlayerMobileInfo[playerid][MobileVersion] = 1; // APK Chen
    }
    else if(strfind(GPCI, "ED40ED0E8089CC44C08EE9580F4C8C44EE8EE990") != -1 )
    {
    	PlayerMobileInfo[playerid][isMobile] = true;
        PlayerMobileInfo[playerid][MobileVersion] = 2; // CH Play
    }
	
	logotd = TextDrawCreate(637.174133, 430.333404, "gtavlc.com");
	TextDrawLetterSize(logotd, 0.400000, 1.600000);
	TextDrawAlignment(logotd, 3);
	TextDrawColor(logotd, -1);
	TextDrawSetShadow(logotd, 0);
	TextDrawSetOutline(logotd, 1);
	TextDrawBackgroundColor(logotd, 255);
	TextDrawFont(logotd, 3);
	TextDrawSetProportional(logotd, 1);
	TextDrawSetShadow(logotd, 0);

	logoptd = CreatePlayerTextDraw(playerid, 107.603614, 432.950347, "anhdu");
	PlayerTextDrawLetterSize(playerid, logoptd, 0.227115, 1.454166);
	PlayerTextDrawAlignment(playerid, logoptd, 3);
	PlayerTextDrawColor(playerid, logoptd, -1);
	PlayerTextDrawSetShadow(playerid, logoptd, 0);
	PlayerTextDrawSetOutline(playerid, logoptd, 1);
	PlayerTextDrawBackgroundColor(playerid, logoptd, 255);
	PlayerTextDrawFont(playerid, logoptd, 2);
	PlayerTextDrawSetProportional(playerid, logoptd, 1);
	PlayerTextDrawSetShadow(playerid, logoptd, 0);

	if(IsPlayerNPC(playerid)) return 1;
	EnablePlayerCameraTarget(playerid, 1);
	GameTextForPlayer(playerid, "~r~KIEM TRA TAI KHOAN", 20000, 3);
		
	SetPlayerColor(playerid, COLOR_GREY);
	SetPlayerScore(playerid, 0);

	defer Camera(playerid);
	GetPlayerName(playerid, PlayerInfo[playerid][pUsername], MAX_PLAYER_NAME);

	CallLocalFunction("ResetVariables", "i", playerid); 
	//if(GetPVarInt(playerid, "NotAndroid") == 0) ShowNameTags(1);
	// if(CountIP(GetIP(playerid)) >= MAX_CONNECTIONS_PER_IP) {
	// 	SendClientMessage(playerid, COLOR_WARNING, "Co hon "#MAX_CONNECTIONS_PER_IP" nguoi choi ket noi tren mot IP!");
	// 	KickEx(playerid);
	// 	return 1;
	// } 
	foreach(new i: Player) {
		if(i != playerid) {
			if(strcmp(GetName(playerid), GetName(i), true) == 0) KickEx(playerid);
		}
	}
	new szstring[140];
	for(new clanid; clanid < MAX_CLANS; clanid++) {
		if(strfind(PlayerInfo[playerid][pUsername],ClanInfo[clanid][clTag],true) != -1)
		{
			format(szstring,sizeof(szstring),"Ban khong the su dung ten %s, day la ten cua 1 CLAN.",ClanInfo[clanid][clTag]);
			SendClientMessage(playerid, COLOR_RED, szstring);
			KickEx(playerid);
			break;
		}
	}
	if(FaceReclama(PlayerInfo[playerid][pUsername])) {
		SendClientMessage(playerid, COLOR_WARNING, "Ban bi kick vi ten cua ban chua ten khong hop le!");
		Ban(playerid);	
		return 1;
	}
	/*if(GoIP(PlayerInfo[playerid][pUsername])) {
		SendClientMessage(playerid, COLOR_WARNING, "Ai primit kick deoarece numele tau contine un IP!");
		KickEx(playerid);	
	}*/
	// ResetPlayerDamages(playerid);
	RemoveMaps(playerid);
	PlayerTextdraws(playerid);
	LoadGuong(playerid);
	SetPlayerWorldBounds(playerid, 20000.0000, -20000.0000, 20000.0000, -20000.0000);  
	TimerAtuPlayer[playerid] = repeat UpdatePlayer(playerid);
	SetPlayerColor(playerid,COLOR_GRAD2);
	ClearWanted(playerid);
	DeletePVar(playerid, "ChoDoi");
	DeletePVar(playerid, "Ban2Ca");
	// Login
	GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~DANG TRONG HANG DOI...~n~~w~~h~Please wait!", 5000, 3);
	if(Iter_Count(LoginQueue[0]) >= MAX_LOGIN) {
		Logger_Log("LoginQueue", Logger_I("Count", Iter_Count(LoginQueue[0])));
		Iter_Add(LoginQueue[1], playerid);
		Camera(playerid);
		return true;
	}
	
	Iter_Add(LoginQueue[0], playerid);
	defer CheckAccount(playerid);
	return 1;
}

timer resetAntiCheatStatus[2000](playerid) {
	#if defined _nex_ac_included
		for(new i; i < 53; i++) if(IsAntiCheatEnabled(i)) EnableAntiCheatForPlayer(playerid, i, 1);
	#endif
}
public OnPlayerDisconnect(playerid, reason)
{
	if(IsPlayerNPC(playerid)) return 1;
	Update(playerid, pTutorialx);
	if(Iter_Contains(LoginQueue[1], playerid)) Iter_Remove(LoginQueue[1], playerid);
	if(Iter_Contains(LoginQueue[0], playerid)) {
		Iter_Remove(LoginQueue[0], playerid);
		if(Iter_Count(LoginQueue[1]) > 0 && Iter_Count(LoginQueue[0]) <= MAX_LOGIN) {
			new last = Iter_First(LoginQueue[1]);
			Iter_Remove(LoginQueue[1], last);
			Iter_Add(LoginQueue[0], last);
			GameTextForPlayer(last,"  ", 100, 3);
			gQuery[0] = EOS;
			TogglePlayerSpectating(last, false);
			mysql_format(SQL, gQuery, sizeof(gQuery), "SELECT * FROM `users` WHERE `name`='%s' LIMIT 1", GetName(last));
			mysql_tquery(SQL, gQuery, "CheckClassIP", "i", last);
		}
	}
	Update(playerid, pBanhTrungThux);
	DaTraLoi[playerid] = 0;
	SoDapAnDung[playerid] = 0;
	InLeTrungThu[playerid] = 0;
	if(DaThueThuyen[playerid] != 0) DestroyVehicle(ThuyenSpawn[DaThueThuyen[playerid]]);
	if(GetPVarType(playerid, "BoomboxObject")) {
		DestroyDynamicObject(GetPVarInt(playerid, "BoomboxObject"));
		DestroyDynamic3DTextLabel(Text3D:GetPVarInt(playerid, "BBLabel"));
		if(GetPVarType(playerid, "bboxareaid"))
		{
   			foreach(new i: Player)
			{
				if(IsPlayerInDynamicArea(i, GetPVarInt(playerid, "bboxareaid")))
				{
					StopAudioStreamForPlayer(i);
					SendClientMessage(i, COLOR_GREY, " Nguoi tao boombox da roi game.");
				}
			}
		}
	}	
	if(fireWork[playerid][0] > 0) for(new i = 0; i < 5; i++) DestroyObject(Rocket[playerid][i]), DestroyObject(RocketLight[playerid][i]), DestroyObject(RocketSmoke[playerid][i]);
	//sanhopqua
	if(dmgdat[playerid] > 0) {stop cadoutimer[playerid]; DestroyPlayerProgressBar(playerid, cadouBAR[playerid]);}
	Delete3DTextLabel(deathLabel[playerid]);
    Delete3DTextLabel(reputationLabel[playerid]);
	// UpdateVar(playerid, "Status", 0);
	DestroyPlayerProgressBar(playerid, HudProgress[0]);
	DestroyPlayerProgressBar(playerid, HudProgress[1]);
	DestroyPlayerProgressBar(playerid, jProgress[playerid]);
	Delete3DTextLabel(adminLabel[playerid]);
	if(IsValidDynamicPickup(PlayerInfo[playerid][pEscapeP])) DestroyDynamicPickup(PlayerInfo[playerid][pEscapeP]);
	if(playerObject[playerid] != 0) DestroyPlayerObject(playerid, playerObject[playerid]), playerObject[playerid] = 0;
	if(playerObject2[playerid] != 0) DestroyObject(playerObject2[playerid]), playerObject2[playerid] = 0;
	
	new string[180], query[400];
	for(new i = 0 ; i < sizeof(invTD[]); i++) {
            PlayerTextDrawDestroy(playerid, invTD[playerid][i]);
    }
	DMV_DestroyMap(playerid);
	if(lastVCarSpawn[playerid] != -1)
	{
		DestroyVehicle(lastVCarSpawn[playerid]);
		Carspawn[lastVCarSpawn[playerid]] = 0;
	}
	// new Float:X,Float:Y,Float:Z, Float:R;
	// GetPlayerFacingAngle(playerid, R);
	// GetPlayerPos(playerid,X,Y,Z);
	// mysql_format(SQL, query, sizeof(query), "UPDATE `users` SET `FacingAngle` = '%f',`Inter`='%d',`Local`='%d',`PosX`='%f',`PosY`='%f',`PosZ`='%f' WHERE `id` = '%d'", R, GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid) , X, Y, Z, PlayerInfo[playerid][pSQLID]);
	if(TradeID[playerid] != -1) {
		new id = TradeID[playerid];
		format(string, 66, "* %s da roi game. Giao dich da bi huy bo!", GetName(playerid));
		SendClientMessage(playerid, COLOR_GOLD, string);
		SendClientMessage(id, COLOR_GOLD, string);
		CancelSelectTextDraw(playerid);
		CancelSelectTextDraw(id);
		HideTradeItems(playerid);
		HideTradeTDs(id);
	}
	DeletePVar(playerid, "Santa");
	new count, names[180];
	if(PlayerInfo[playerid][pWantedLevel] != 0) {
		foreach(new i: Player) {
			if(OnDuty[i] == 1 && IsACop(i) && CrimInRange(50.0, playerid,i)) {
				count = 1;
				format(string, sizeof(string), "phan thuong anh hung!");
				GameTextForPlayer(i, string, 3000, 1);
				ConsumingMoney[i] = 1;
				GivePlayerCash(i, PlayerInfo[playerid][pWantedLevel] * 2000);
				Update(i, pCashx);
				UpdateFactionRaport(i, 0);		

				format(string, sizeof(string), "Ban nhan duoc $%d tien thuong vi da bat duoc %s.", PlayerInfo[playerid][pWantedLevel] * 2000, GetName(playerid));
				SendClientMessage(i, COLOR_DBLUE, string);
				format(names, sizeof(names), "%s %s", names, GetName(i));
			}	
			if(count == 1) {
				if(ProxDetectorS(30.0, i, playerid)) {
					format(string, sizeof(string), "* %s da vao tu, cam on den: %s", GetName(playerid), names);
					SendClientMessage(i, COLOR_PURPLE, string);
				}
			}				
		}
	}	
	if(count == 1) {	
		format(string, sizeof(string), "Dispatch: %s da chet va vao tu trong %d giay, over.", GetName(playerid), (PlayerInfo[playerid][pWantedLevel])*(150));
		SendTeamMessage(1, COLOR_LIGHTBLUE, string);
		SendTeamMessage(2, COLOR_LIGHTBLUE, string);
		SendTeamMessage(3, COLOR_LIGHTBLUE, string);			
		SendTeamMessage(15, COLOR_LIGHTBLUE, string);			
		
		GivePlayerCash(playerid, - PlayerInfo[playerid][pWantedLevel] * 2000);
		PlayerInfo[playerid][pWantedDeaths] += 1;
		PlayerInfo[playerid][pJailed] = 1;
		PlayerInfo[playerid][pJailTime] = (PlayerInfo[playerid][pWantedLevel])*(250);
		PlayCopSound();
		format(string, sizeof(string), "Boi vi ban da bi chet, ban mat $%d va ban vao tu. Ban khong con bi truy na nua.", PlayerInfo[playerid][pJailTime], PlayerInfo[playerid][pWantedLevel] * 2000);
		SendClientMessage(playerid, COLOR_LIGHTRED, string);
		TogglePlayerControllable(playerid, false);
		defer UnFreezeStation[1000](playerid);
		PlayerInfo[playerid][pWantedLevel] = 0;
		SetPlayerWantedLevel(playerid, 0);
		Update(playerid,pWantedLevelx);
		Update(playerid,pJailedx);
		Update(playerid,pJailTimex);
		ClearCrime(playerid);			
		checkbpquest(playerid, 1, 3);		
	}
	new playerID = GetPVarInt(playerid, "OfferBy");
	foreach(new i: Player) {
		if(IsPlayerLogged[i] == 1) {
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
			if(AcceptedReport[i] == playerid) {
				AcceptedReport[i] = -1;
				SendClientMessage(i, COLOR_YELLOW, "Cuoc tro chuyen ket thuc! (quit)");
			}		
		}	
		if(IsPlayerConnected(Mobile[playerid])) {
			if(Mobile[playerid] < 255) {
				CellTime[Mobile[playerid]] = 0;
				CellTime[playerid] = 0;
				Mobile[Mobile[playerid]] = 255;
				SetPlayerSpecialAction(Mobile[playerid],SPECIAL_ACTION_STOPUSECELLPHONE);
				Mobile[playerid] = 255;
				PlayerInfo[playerid][pSpeaker] = 0;
				SetPlayerSpecialAction(playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
			}
		}
		if(targetfind[i] == playerid) {
			MDCOn[i] = -1;
			targetfind[i] = -1;
			UsedFind[i] = 0;
			DisablePlayerCheckpointEx(i);
			PlayerTextDrawHide(i, FindTD);
		}
		if(TaxiAccepted[i] < 999) {
			if(TaxiAccepted[i] == playerid) {
				TaxiAccepted[i] = 999;
				TaxiCallTime[i] = 0;
				PlayerTextDrawHide(i, FindTD);
				DisablePlayerCheckpointEx(i);
			}
		}
		if(HaveHelp[i] == playerid && PlayerInfo[playerid][pHelper] == 0 && HaveHelp[i] != -1) {
			format(string, sizeof(string), "AdmCmd: Newbie %s da roi game trong khi nguoi dang tra loi cho anh ta la %s.", GetName(playerid), GetName(i));
			if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(COLOR_LIGHTRED, string, 1);
			SendClientMessage(i, COLOR_YELLOW, "Nguoi gui ban cau hoi cua ban da roi game.");
			HaveHelp[i] = -1;
		}
		if(HaveHelp[playerid] == i && PlayerInfo[playerid][pHelper] >= 1 && HaveHelp[playerid] != -1) {
			format(string, sizeof(string), "AdmCmd: Helper %s da roi game khi dang tra loi cau hoi cua %s.", GetName(playerid), GetName(i));
			if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(COLOR_LIGHTRED, string, 1);
			SendClientMessage(i, COLOR_YELLOW, "Helper chap nhan cau hoi cua ban da roi game. Hay doi mot helper khac tra loi.");
			OnHelper[i] = 0;
		}	
		if(playerID != -1 && i == playerID) {
			SetPVarInt(i, "OfferBy", -1);
			SendClientMessage(i, -1, "Giao dich da duoc huy bo!");
		}
		if(Spectate[i] == playerid) {
			TogglePlayerControllable(i, true);
			TogglePlayerSpectating(i, false);
			SetPlayerInterior(i,Unspec[i][sPint]);
			PlayerInfo[i][pInt] = Unspec[i][sPint];
			PlayerInfo[i][pLocal] = Unspec[i][sLocal];
			Unspec[i][sLocal] = 255;
			gTeam[i] = PlayerInfo[i][pTeam];
			SetPlayerToTeamColor(i);
			SendClientMessage(i, COLOR_LIGHTRED, "Ban khong con spec nua!");

			SpawnPlayer(i);
			Spectate[i] = 255;
			LastRecon[i] = 1;
			PlayerTextDrawHide(i, SpectatorTD);
		}			
	}
	if(Iter_Contains(PlayerInRace, playerid)) LeaveRaceArena(playerid);
    if(AcceptedService[playerid] != -1) {
		AcceptedTaxiService[AcceptedService[playerid]] = 0;
		format(string, sizeof(string), "* Member %s da roi game khi dang nhan cuoc goi taxi cua %s (%d). Cuoc goi nay khong con kha dung nua.", GetName(playerid), GetName(AcceptedService[playerid]), AcceptedService[playerid]);
		SendFactionMessage(12, 0x2C6CBFFF, string);
		format(string, sizeof(string), "Ban da tu bo cuoc goi nay!");
		SendClientMessage(playerid, COLOR_WHITE, string);
		format(string, sizeof(string), "Taxi %s da roi game. Xin vui long doi mot tai xe khac chap nhan cuoc goi cua ban.", GetName(playerid));
		SendClientMessage(AcceptedService[playerid], COLOR_YELLOW, string);
		AcceptedService[playerid] = -1;
		targetfind[playerid] = -1;
		CP[playerid] = 0;
		DisablePlayerCheckpointEx(playerid);
    }	
	if(TaxiDriver[playerid] != -1) {
		if(TaxiMoney[playerid] != 0) {
			UpdateFactionRaport(playerid, 0);					
			AcceptedService[TaxiDriver[playerid]] = -1;
			foreach(new i: Player) {
				if(IsNearPlayer(playerid, i)) {
					format(string, sizeof(string), "* %s tra tien di taxi cho tai xe %s so tien $%s.", GetName(playerid), GetName(TaxiDriver[playerid]), FormatNumber(TaxiMoney[playerid]));
					SendClientMessage(i, COLOR_PURPLE, string);
				}
			}
			TaxiMoney[playerid] = 0;
		}
		if(TaxiService[playerid] != 0)
		{ 
			format(string, sizeof(string), "**(( Taxi Dispatch: %s (%d) da (/q) va khong con can taxi nua. ))**", GetName(playerid), playerid);
			SendFactionMessage(12, 0x2C6CBFFF, string);
			SendClientMessage(playerid, COLOR_WHITE, "Ban da huy dich vu nay.");
			TaxiService[playerid] = 0;
			AcceptedTaxiService[playerid] = 0;
			PlayerTextDrawHide(playerid, FindTD);
			foreach(new i: Player) {
				if(IsPlayerConnected(TaxiDriver[playerid]) && AcceptedService[TaxiDriver[playerid]] == playerid) {
					targetfind[TaxiDriver[playerid]] = -1;
					CP[TaxiDriver[playerid]] = 0;
					DisablePlayerCheckpointEx(TaxiDriver[playerid]);
					AcceptedService[TaxiDriver[playerid]] = -1;
					SendClientMessage(TaxiDriver[playerid], COLOR_YELLOW, "Nguoi choi goi dich vu ma ban vua chap nhan da huy dich vu.");
				}
			}
		}
		TaxiDriver[playerid] = -1;
		PlayerTextDrawHide(playerid, FareTD);
		stop TaxiTimer[playerid];
	}
	if(GetPVarInt(playerid, "InLesson") != -1) {
		new id = GetPVarInt(playerid, "InLesson");
		format(string, sizeof(string), "Lesson da ket thuc boi vi %s roi game.", GetName(playerid));
		SendClientMessage(id, COLOR_LIGHTBLUE,string);
		SetPVarInt(id, "InLesson", -1);
		SetPVarInt(playerid, "InLesson", -1);		
	}
	if(IsPlayerLogged[playerid] == 1) {
		SetPlayerName(playerid, PlayerInfo[playerid][pUsername]);	
	}
	savePlayerInfo(playerid);
	stop ReportTimer[playerid];
	SetPVarInt(playerid,"KilledFlood",0);
	if(PlayerHit[playerid] != -1) {
		UsedContract[PlayerHit[playerid]] = 0;
		PlayerHit[playerid] = -1;
	}
    if(TradeTime[playerid] != 0) KillTimer(TradeTime[playerid]), TradeTime[playerid] = 0;   
	if(Contract[playerid] == 1) {
		foreach(new i: Player) {
			if(PlayerHit[i] == playerid) {
				PlayerHit[i] = -1;
				PlayerTextDrawHide(i, FindTD);
			}
		}
	}	
	if(JobWorking[playerid] == 1) {
		JobWorking[playerid] = 0;
		PlayerTextDrawHide(playerid, JobTD);
		if(JobVehicle[playerid] != 0) { DestroyVehicle(JobVehicle[playerid]); JobVehicle[playerid] = 0; }
		if(Trailer[playerid] != 0) { DestroyVehicle(Trailer[playerid]); Trailer[playerid] = 0;  }
		PlayerTextDrawHide(playerid, InfosTD);
		DisablePlayerCheckpointEx(playerid);
		CP[playerid] = 0;
		JobVehicle[playerid] = 0;
		RemovePlayerAttachedObject(playerid, 2);
		DestroyWoodObject(playerid);
	}
    if(EditHouse[playerid] > 0) {
    	EditHouse[playerid] = 0;
    	DestroyDynamicObject(ObjectEdited[playerid]);
    }
    if(IsPlayerLogged[playerid] != 0) {
		format(query, sizeof(query), "UPDATE users SET Muted=0,MuteTime=0,Status=0,Money=%d,Respect=%d,Bank=%d,Rob=%d,FPunish=%d,Acceptpoints=%d,ConnectedTime='%0.3f',Tow=%d,PayDayHad=%d,PayDay=%d,Paycheck=%d,JailTime=%d,Level=%d,PremiumPoints=%d,NewbieMute=%d,CarLicS=%d,GunLicS=%d,FlyLicS=%d,BoatLicS=%d,Seconds='%f' WHERE ID=%d", 
			GetPlayerCash(playerid), PlayerInfo[playerid][pExp],PlayerInfo[playerid][pAccount], PlayerInfo[playerid][pRob], PlayerInfo[playerid][pFpunish], PlayerInfo[playerid][pLawyer], 
			PlayerInfo[playerid][pConnectTime], PlayerInfo[playerid][pTow], PlayerInfo[playerid][pPayDayHad], PlayerInfo[playerid][pPayDay],
			PlayerInfo[playerid][pPayCheck], PlayerInfo[playerid][pJailTime], PlayerInfo[playerid][pLevel], PlayerInfo[playerid][pPremiumPoints],
			PlayerInfo[playerid][pNewbieMute], PlayerInfo[playerid][pCarLicS], PlayerInfo[playerid][pGunLicS], PlayerInfo[playerid][pFlyLicS], PlayerInfo[playerid][pBoatLicS], PlayerInfo[playerid][pSeconds], PlayerInfo[playerid][pSQLID]);
		mysql_pquery(SQL, query);
	}	
	if(StartedSpray[playerid] == 1 || ClanDuty[playerid] == 1) {
		GraffitiInfo[StartedSpray2[playerid]][gfAttacked] = 0;
		StartedSpray[playerid] = 0;
		StartedSpray2[playerid] = 0;
		GraffitiInfo[StartedSprayOn[playerid]][gfAttacked] = 0;
		StartedSprayOn[playerid] = 0;
		ClanProces[playerid] = 0;
		ClanDuty[playerid] = 0;
	}
	if(PlayerInfo[playerid][pAdmin] > 0) {
		switch(reason) {
			case 0: format(string, sizeof(string), "LoginBot: %s da roi game. (crash)", GetName(playerid));
			case 1: format(string, sizeof(string), "LoginBot: %s da roi game. (quit)", GetName(playerid));
			case 2: format(string, sizeof(string), "LoginBot: %s da roi game. (kicked/banned)", GetName(playerid));
		}
		SendAdminMessage(0xA37718FF, string, 1);
	}
    if(PlayerInfo[playerid][pMember] != 0 && PlayerInfo[playerid][pRank] > 0) {
		if(InWar[PlayerInfo[playerid][pMember]] == 1) {
			switch(reason) {
				case 0: format(string, sizeof(string), "[TO CHUC] %s da roi game. War score: %d (Crash).",GetName(playerid), WarKills[playerid]-WarDeaths[playerid]);
				case 1: format(string, sizeof(string), "[TO CHUC] %s da roi game. War score: %d (Quit).",GetName(playerid), WarKills[playerid]-WarDeaths[playerid]);
				case 2: format(string, sizeof(string), "[TO CHUC] %s da roi game. War score: %d (Kicked/Banned).",GetName(playerid), WarKills[playerid]-WarDeaths[playerid]);
			}		
		}
		else {
			switch(reason) {
				case 0: format(string, sizeof(string), "[TO CHUC] %s da roi game. (Crash).",GetName(playerid));
				case 1: format(string, sizeof(string), "[TO CHUC] %s da roi game. (Quit).",GetName(playerid));
				case 2: format(string, sizeof(string), "[TO CHUC] %s da roi game. (Kicked/Banned).",GetName(playerid));
			}
		}
		SendFactionMessage(PlayerInfo[playerid][pMember], COLOR_CLIENT, string);
	}	
	switch(reason) {
		case 0: {
			if(PaintType[playerid] == 0 && !Iter_Contains(PlayerInRace, playerid) && InEvent[playerid] == 0 && GetPlayerInterior(playerid) == 0) {
				format(string, sizeof(string), "%s da roi game (Crash).",GetNameEx(playerid));
				// // new Float:X,Float:Y,Float:Z, Float:R;
				// GetPlayerFacingAngle(playerid, R);
				// SavePlayerPosData(playerid, X,Y,Z,R);
				// GetPlayerPos(playerid,X,Y,Z);
				// mysql_format(SQL, query, sizeof(query), "UPDATE `users` SET `FacingAngle` = '%f',`Inter`='%d',`Local`='%d',`PosX`='%f',`PosY`='%f',`PosZ`='%f' WHERE `id` = '%d'", R, GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid) , X, Y, Z, PlayerInfo[playerid][pSQLID]);
				// mysql_query(SQL, query);	
				// UpdateVar(playerid, "Crash", 1);
				ProxDetector(20.0, playerid, string, COLOR_CLIENT,COLOR_CLIENT,COLOR_CLIENT,COLOR_CLIENT,COLOR_CLIENT);
			}	
		}	
		case 1: {
			format(string, sizeof(string), "%s da roi game (Quit).",GetNameEx(playerid));
			ProxDetector(20.0, playerid, string, COLOR_CLIENT,COLOR_CLIENT,COLOR_CLIENT,COLOR_CLIENT,COLOR_CLIENT);
			// // new Float:X,Float:Y,Float:Z, Float:R;
			// GetPlayerFacingAngle(playerid, R);
			// SavePlayerPosData(playerid, X,Y,Z,R);
			// GetPlayerPos(playerid,X,Y,Z);
			// mysql_format(SQL, query, sizeof(query), "UPDATE `users` SET `FacingAngle` = '%f',`Inter`='%d',`Local`='%d',`PosX`='%f',`PosY`='%f',`PosZ`='%f' WHERE `id` = '%d'", R, GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid) , X, Y, Z, PlayerInfo[playerid][pSQLID]);
			// mysql_query(SQL, query);	
		}	 
		case 2: {
			format(string, sizeof(string), "%s da roi game (Kicked/Banned).",GetNameEx(playerid));
			ProxDetector(20.0, playerid, string, COLOR_CLIENT,COLOR_CLIENT,COLOR_CLIENT,COLOR_CLIENT,COLOR_CLIENT); 
		}
    }
    if(FarmerTreeTaken[playerid]!=-1) FarmerTreeStatus[FarmerTreeTaken[playerid]] = -1;

	new y,m,d,h,mi;
	getdate(y,m,d);
	gettime(h,mi);
	format(query, sizeof(query), "UPDATE users SET `lastOn`='%02d.%02d.%d %02d:%02d', `QuestDeelay` = '%d' WHERE `ID`='%d'",d,m,y,h,mi, QuestDeelay[playerid],PlayerInfo[playerid][pSQLID]);
	mysql_pquery(SQL, query);
	// GetPlayerFacingAngle(playerid, R);
	// SavePlayerPosData(playerid, X,Y,Z,R);
	// GetPlayerPos(playerid,X,Y,Z);
	// mysql_format(SQL, query, sizeof(query), "UPDATE `users` SET `FacingAngle` = '%f',`Inter`='%d',`Local`='%d',`PosX`='%f',`PosY`='%f',`PosZ`='%f' WHERE `id` = '%d'", R, GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid) , X, Y, Z, PlayerInfo[playerid][pSQLID]);
	// mysql_query(SQL, query);	
	stop TimerAtuPlayer[playerid];
	stop login[playerid];
	defer resetAntiCheatStatus(playerid);
	for (new i = 0; i < MAX_INVENTORY; i ++) {
	    invData[playerid][i][invExists] = false;
	    invData[playerid][i][invModel] = 0;
	    invData[playerid][i][invQuantity] = 0;
		invData[playerid][i][invAttachSlot] = 0;
	    invData[playerid][i][invAttached] = 0;
		invData[playerid][i][invItem] = 0;
	}
	isInInven[playerid] = 0;
	SetPVarInt(playerid, "checkinv", 0);
	SetPVarInt(playerid, "checkinvid", 0);
	
	CallLocalFunction("ResetVariables", "i", playerid);
    return 1;
}


hook OnPlayerClickTextDraw(playerid, Text:clickedid) 
{
    new str[180];
    if(clickedid == Text:INVALID_TEXT_DRAW) {
    	if(FarmerTreeTaken[playerid]!=-1) FarmerTreeStatus[FarmerTreeTaken[playerid]] = -1;
    }
	else if(clickedid == PinTD[13]) {
		if(strlen(PinText[playerid]) < 4) return 1;
		new type = GetPVarInt(playerid, "PinCase"), query[180];
		switch(type) {
			case 1: {
				PlayerInfo[playerid][pPin] = strval(PinText[playerid]);
				format(query, sizeof(query), "UPDATE `users` SET `Pin`='%d' WHERE `name`='%s'", PlayerInfo[playerid][pPin], PlayerInfo[playerid][pUsername]);
				mysql_query(SQL, query);
				SendClientMessage(playerid, COLOR_MONEY, "Ban da set pass 2 cho tai khoan cua ban. Bay gio ban khong con so ai vao pha acc ban nua.");		
				HidePinTDs(playerid);
				PlayerInfo[playerid][pPinLogged] = 1;
				DeletePVar(playerid, "PinCase");
			}
			case 2: {
				if(PlayerInfo[playerid][pPin] == strval(PinText[playerid])) {
					PlayerInfo[playerid][pPinLogged] = 1;
					DeletePVar(playerid, "PinCase");
					HidePinTDs(playerid);
					SendClientMessage(playerid, COLOR_MONEY, "Tai khoan cua ban da duoc xac thuc thanh cong.");
					return 1;
				}
				else {
					SendClientMessage(playerid, COLOR_WARNING, "Pass 2 khong dung!");
					PinText[playerid] = "";
					UpdatePin(playerid);					
					PlayerPlaySound(playerid, 1085, 0.0, 0.0, 10.0);
					return 1;
				}			
			}
			case 3: {
				if(PlayerInfo[playerid][pPin] == strval(PinText[playerid])) {
					SendClientMessage(playerid, COLOR_MONEY, "Ban da nhap chinh xac Pass 2. Bay gio hay nhap pass moi de thay doi.");
					PinText[playerid] = "";
					UpdatePin(playerid);
					SetPVarInt(playerid, "PinCase", 4);					
					PlayerTextDrawSetString(playerid, PinPTD[0], "Set pin");
					return 1;
				}
				else {
					SendClientMessage(playerid, COLOR_WARNING, "Pass 2 khong hop le!");
					PinText[playerid] = "";
					UpdatePin(playerid);
					PlayerPlaySound(playerid, 1085, 0.0, 0.0, 10.0);
					return 1;
				}			
			}
			case 4: {
				PlayerInfo[playerid][pPin] = strval(PinText[playerid]);
				format(query, sizeof(query), "UPDATE `users` SET `Pin`='%d' WHERE `name`='%s'", PlayerInfo[playerid][pPin], PlayerInfo[playerid][pUsername]);
				mysql_query(SQL, query);
				SendClientMessage(playerid, COLOR_MONEY, "BAn da thay doi pass 2 thanh cong.");		
				HidePinTDs(playerid);
				PlayerInfo[playerid][pPinLogged] = 1;	
				DeletePVar(playerid, "PinTD");	
			}
		}
	}
	else if(clickedid == PinTD[14]) {
		if(strval(PinText[playerid]) < 4) PlayerPlaySound(playerid, 1083, 0.0, 0.0, 10.0);
		else PlayerPlaySound(playerid, 1085, 0.0, 0.0, 10.0);
		PinText[playerid] = "";
		UpdatePin(playerid);		
	}	    
	else if(isInInven[playerid]) {
		inventoryTextDraws(playerid, false);
		isInInven[playerid] = 0;
		CancelSelectTextDraw(playerid);
	}
	else if(GetPVarInt(playerid, "checkinv") != 0) {
		inventoryTextDraws(playerid, false);
		isInInven[playerid] = 0;
		CancelSelectTextDraw(playerid);
		SetPVarInt(playerid, "checkinv", 0);
		SetPVarInt(playerid, "checkinvid", 0);
	}
	if(GetPVarInt(playerid, "PlayMine") == 1 && GetPVarInt(playerid, "Loser") == 0) {
		if(clickedid == CasinoTD[4]) {
			if(GetPVarInt(playerid, "StartedGame") == 1 && GetPVarInt(playerid, "Mines") > 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: De dong tro choi, ban phai chon nut 'Rut tien'!");
			HideCasinoTDs(playerid);
		}	
		if(clickedid == CasinoTD[6] && GetPVarInt(playerid, "StartedGame") == 1 && GetPVarInt(playerid, "Mines") > 0) {
			GivePlayerCash(playerid, GetPVarInt(playerid, "MoneyEarned"));	
			format(str, sizeof(str), "* %s da chien thang $%s trong Mine Sweeper.", GetName(playerid), FormatNumber(GetPVarInt(playerid, "MoneyEarned")));
			ProxDetector(30.0,playerid, str, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);				
			format(str, sizeof(str), "~g~Chuc mung! Ban chien thang $%s.", FormatNumber(GetPVarInt(playerid, "MoneyEarned")));			
			ShowCasinoTDs(playerid);
			PlayerTextDrawSetString(playerid, CasinoPTD[30], str);
			PlayerTextDrawShow(playerid, CasinoPTD[30]);
			format(str, sizeof(str), "Lan choi: ~g~%d~w~~h~~n~Tien nhan duoc: ~g~$%s", GetPVarInt(playerid, "Mines"), FormatNumber(GetPVarInt(playerid, "MoneyEarned")));
			PlayerTextDrawSetString(playerid, CasinoPTD[31], str);
			PlayerTextDrawShow(playerid, CasinoPTD[31]);	
			return 1;
		}
		if(GetPVarInt(playerid, "StartedGame") == 1) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Tro choi da bat dau! Ban khong the thuc hien thay doi cho den khi ban chon nut Rut tien.");
		if(clickedid == CasinoTD[9] && GetPVarInt(playerid, "MineType") == 0) SetPVarInt(playerid, "MineType", 1), TextDrawColor(CasinoTD[9], 0x80FF00FF), TextDrawShowForPlayer(playerid, CasinoTD[9]);
		if(clickedid == CasinoTD[7] && GetPVarInt(playerid, "MineType") == 0) SetPVarInt(playerid, "MineType", 3), TextDrawColor(CasinoTD[7], 0x80FF00FF), TextDrawShowForPlayer(playerid, CasinoTD[7]);
		if(clickedid == CasinoTD[12] && GetPVarInt(playerid, "MineType") == 0) SetPVarInt(playerid, "MineType", 6), TextDrawColor(CasinoTD[12], 0x80FF00FF), TextDrawShowForPlayer(playerid, CasinoTD[12]);
		
		if(clickedid == CasinoTD[5]) {
			if(GetPVarInt(playerid, "MineType") == 0 || GetPVarInt(playerid, "BetAmount") == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Tro choi khong bat dau vi ban khong dat cuoc / ban khong chon so luong bom.");
			for(new i = 0; i < 30; i++) MineBomb[playerid][i] = 0;
			
			new 
				rand1 = random(30),
				rand2 = random(30),
				rand3 = random(30),
				rand4 = random(30),
				rand5 = random(30),
				rand6 = random(30);
			
			if(rand1 == rand2 || rand1 == rand3 || rand1 == rand4 || rand1 == rand5 || rand1 == rand6) rand1 = random(30);
			if(rand2 == rand1 || rand2 == rand3 || rand2 == rand4 || rand2 == rand5 || rand2 == rand6) rand2 = random(30);
			if(rand3 == rand1 || rand3 == rand2 || rand3 == rand4 || rand3 == rand5 || rand3 == rand6) rand3 = random(30);
			if(rand4 == rand1 || rand4 == rand2 || rand4 == rand3 || rand4 == rand5 || rand4 == rand6) rand4 = random(30);
			if(rand5 == rand1 || rand5 == rand2 || rand5 == rand3 || rand5 == rand4 || rand5 == rand6) rand5 = random(30);
			if(rand6 == rand1 || rand6 == rand2 || rand6 == rand3 || rand6 == rand4 || rand6 == rand5) rand6 = random(30);

			if(rand1 == rand2 || rand1 == rand3 || rand1 == rand4 || rand1 == rand5 || rand1 == rand6) rand1 = random(30);
			if(rand2 == rand1 || rand2 == rand3 || rand2 == rand4 || rand2 == rand5 || rand2 == rand6) rand2 = random(30);
			if(rand3 == rand1 || rand3 == rand2 || rand3 == rand4 || rand3 == rand5 || rand3 == rand6) rand3 = random(30);
			if(rand4 == rand1 || rand4 == rand2 || rand4 == rand3 || rand4 == rand5 || rand4 == rand6) rand4 = random(30);
			if(rand5 == rand1 || rand5 == rand2 || rand5 == rand3 || rand5 == rand4 || rand5 == rand6) rand5 = random(30);
			if(rand6 == rand1 || rand6 == rand2 || rand6 == rand3 || rand6 == rand4 || rand6 == rand5) rand6 = random(30);

			if(rand1 == rand2 || rand1 == rand3 || rand1 == rand4 || rand1 == rand5 || rand1 == rand6) rand1 = random(30);
			if(rand2 == rand1 || rand2 == rand3 || rand2 == rand4 || rand2 == rand5 || rand2 == rand6) rand2 = random(30);
			if(rand3 == rand1 || rand3 == rand2 || rand3 == rand4 || rand3 == rand5 || rand3 == rand6) rand3 = random(30);
			if(rand4 == rand1 || rand4 == rand2 || rand4 == rand3 || rand4 == rand5 || rand4 == rand6) rand4 = random(30);
			if(rand5 == rand1 || rand5 == rand2 || rand5 == rand3 || rand5 == rand4 || rand5 == rand6) rand5 = random(30);
			if(rand6 == rand1 || rand6 == rand2 || rand6 == rand3 || rand6 == rand4 || rand6 == rand5) rand6 = random(30);

			if(GetPVarInt(playerid, "MineType") >= 1) MineBomb[playerid][rand1] = 1;
			if(GetPVarInt(playerid, "MineType") >= 3) {
				MineBomb[playerid][rand2] = 1;
				MineBomb[playerid][rand3] = 1;
			}
			if(GetPVarInt(playerid, "MineType") == 6) {
				MineBomb[playerid][rand4] = 1;
				MineBomb[playerid][rand5] = 1;
				MineBomb[playerid][rand6] = 1;
			}
			
			SetPVarInt(playerid, "StartedGame", 1);	
			PlayerTextDrawSetString(playerid, CasinoPTD[30], "Tro choi bat dau!");
			PlayerTextDrawShow(playerid, CasinoPTD[30]);			
		}	
	}	
	if(clickedid == TradeTD[10]) {
		if(TradeItems[playerid] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong them bat ky thu vat pham nao vao lan giao dich nay!");
		if(TradeReady[playerid] == 1) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the xoa cac muc da them trong khi bo hen gio da duoc bat!");
		HideTradeItems(playerid);		
		new id = TradeID[playerid];
		format(str, sizeof(str), "%s da xoa mot vat pham da them.", GetName(playerid));
		SendClientMessage(playerid, COLOR_GOLD, str);
		SendClientMessage(id, COLOR_GOLD, str);		
	}	
	if(clickedid == TradeTD[9] && TradeReady[playerid] == 0) Dialog_Show(playerid, DIALOG_TRADE, DIALOG_STYLE_LIST, "Giao dich", "Money\nHouse\nBusiness\nVehicle", "Ok", "Cancel");
	else if(clickedid == RaceTD[10]) {
		if(Voted[playerid] == 1) return SendClientMessage(playerid, COLOR_LGREEN, "Ban da bo phieu cho ban do!");
		new maps[180];
		format(maps, 256, "%s\n%s\n%s\n%s\n%s", RaceMapName(0), RaceMapName(1), RaceMapName(2), RaceMapName(3), RaceMapName(4));
		Dialog_Show(playerid, DIALOG_VOTERMAP, DIALOG_STYLE_LIST, "Vote map", maps, "Ok", "Cancel");
	}
	else if(clickedid == RaceTD[9]) {
		if(Voted2[playerid] == 1) return SendClientMessage(playerid, COLOR_LGREEN, "Ban da chon va cham!");
		Dialog_Show(playerid, DIALOG_COLIZIUNI, DIALOG_STYLE_MSGBOX, "Va cham xe", "Ban co muon tat va cham khong?", "Yes", "No");
	}
	else if(clickedid == RaceTD[0]) {
		if(SelCar[playerid] == 0) return 1;
		SelCar[playerid] --;
		DestroyVehicle(RaceVehicle[playerid]);
		RaceVehicle[playerid] = CreateVehicleEx(RaceCars[SelCar[playerid]][0],   1091.8584, 1759.6836, 10.5870, -36.0600, 1, 1, 100);
		ChangeVehicleColorEx(GetPlayerVehicleID(playerid), RaceColor[playerid][0], RaceColor[playerid][1]);
		SetVehicleVirtualWorld(RaceVehicle[playerid], playerid+1);
		PutPlayerInVehicleEx(playerid, RaceVehicle[playerid], 0);
		SetPlayerVirtualWorld(playerid, playerid+1);
		SetPlayerCameraPos(playerid, 1096.7817, 1774.7838, 12.2794);
		SetPlayerCameraLookAt(playerid, 1096.4858, 1773.8246, 12.1340);	
		format(str, sizeof(str), "%s", aVehicleNames[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
		PlayerTextDrawSetString(playerid, RacePTD[0], str);		
	}
	else if(clickedid == RaceTD[1]) {
		if(SelCar[playerid] == sizeof(RaceCars)-1) {
			SelCar[playerid] = 0;
			DestroyVehicle(RaceVehicle[playerid]);
			RaceVehicle[playerid] = CreateVehicleEx(RaceCars[SelCar[playerid]][0],   1091.8584, 1759.6836, 10.5870, -36.0600, 1, 1, 100);
			ChangeVehicleColorEx(GetPlayerVehicleID(playerid), RaceColor[playerid][0], RaceColor[playerid][1]);
			SetVehicleVirtualWorld(RaceVehicle[playerid], playerid+1);
			PutPlayerInVehicleEx(playerid, RaceVehicle[playerid], 0);
			SetPlayerVirtualWorld(playerid, playerid+1);
			SetPlayerCameraPos(playerid, 1096.7817, 1774.7838, 12.2794);
			SetPlayerCameraLookAt(playerid, 1096.4858, 1773.8246, 12.1340);	
			format(str, sizeof(str), "%s", aVehicleNames[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
			PlayerTextDrawSetString(playerid, RacePTD[0], str);					
			return 1;
		}
		SelCar[playerid] ++;
		DestroyVehicle(RaceVehicle[playerid]);
		RaceVehicle[playerid] = CreateVehicleEx(RaceCars[SelCar[playerid]][0],   1091.8584, 1759.6836, 10.5870, -36.0600, 1, 1, 100);
		ChangeVehicleColorEx(GetPlayerVehicleID(playerid), RaceColor[playerid][0], RaceColor[playerid][1]);
		SetVehicleVirtualWorld(RaceVehicle[playerid], playerid+1);
		PutPlayerInVehicleEx(playerid, RaceVehicle[playerid], 0);
		SetPlayerVirtualWorld(playerid, playerid+1);		
		SetPlayerCameraPos(playerid, 1096.7817, 1774.7838, 12.2794);
		SetPlayerCameraLookAt(playerid, 1096.4858, 1773.8246, 12.1340);		
		format(str, sizeof(str), "%s", aVehicleNames[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
		PlayerTextDrawSetString(playerid, RacePTD[0], str);		
	}
	else if(clickedid == RaceTD[4]) {
		if(RaceColor[playerid][0] == 255) RaceColor[playerid][0] = -1;
		RaceColor[playerid][0] ++;
		ChangeVehicleColorEx(GetPlayerVehicleID(playerid), RaceColor[playerid][0], RaceColor[playerid][1]);
	}
	else if(clickedid == RaceTD[5]) {
		if(RaceColor[playerid][1] == 255) RaceColor[playerid][1] = -1;
		RaceColor[playerid][1] ++;
		ChangeVehicleColorEx(GetPlayerVehicleID(playerid), RaceColor[playerid][0], RaceColor[playerid][1]);
	}	
	else if(clickedid == RaceTD[6]) {
		if(RaceColor[playerid][0] == 0) RaceColor[playerid][0] = 256;
		RaceColor[playerid][0] --;
		ChangeVehicleColorEx(GetPlayerVehicleID(playerid), RaceColor[playerid][0], RaceColor[playerid][1]);
	}	
	else if(clickedid == RaceTD[7]) {
		if(RaceColor[playerid][1] == 0) RaceColor[playerid][1] = 256;
		RaceColor[playerid][1] --;
		ChangeVehicleColorEx(GetPlayerVehicleID(playerid), RaceColor[playerid][0], RaceColor[playerid][1]);
	}
	else if(clickedid == Text:INVALID_TEXT_DRAW) {
		if(GetPVarInt(playerid, "PlayMine") == 1 || GetPVarInt(playerid, "StartedGame") == 1) SelectTextDraw(playerid, 0x80FF00FF);
		if(isInInven[playerid] != 0) {
			inventoryTextDraws(playerid, false);
			isInInven[playerid] = 0;
			// Inventory_InitData(playerid);
			//Player_ShowInventoryTextraw(playerid);
		}
		if(GetPVarInt(playerid, "checkinv") != 0) {
			inventoryTextDraws(playerid, false);
			CancelSelectTextDraw(playerid);
			SetPVarInt(playerid, "checkinv", 0);
			SetPVarInt(playerid, "checkinvid", 0);
		}
		if(TradeID[playerid] != -1) {
			new id = TradeID[playerid];
			format(str, sizeof(str), "* %s da huy giao dich!", GetName(playerid));
			SendClientMessage(playerid, COLOR_GOLD, str);
			SendClientMessage(id, COLOR_GOLD, str);
			HideTradeItems(playerid);
			HideTradeItems(id);
			HideTradeTDs(id);
			HideTradeTDs(playerid);
			CancelSelectTextDraw(playerid);
			CancelSelectTextDraw(id);
			return 1;
		}
		if(Iter_Contains(PlayerInRace, playerid) && RaceStarted == 0) return LeaveRaceArena(playerid);

		TextDrawHideForPlayer(playerid, GUI_Box1);
		TextDrawHideForPlayer(playerid, GUI_LBox);
		TextDrawHideForPlayer(playerid, GUI_Logo); 
		TextDrawHideForPlayer(playerid, GUI_Name);
		TextDrawHideForPlayer(playerid, GUI_Description);
		TextDrawHideForPlayer(playerid, GUI_IMG);
		PlayerTextDrawHide(playerid, GUI_Exit);
		PlayerTextDrawHide(playerid, GUI_Start);		
		return 1;
	}
	// if(FarmerTreeTaken[playerid] >= 0 && JobWorking[playerid] == 2) {
	// 	for(new i = 1; i < sizeof TreeTD; i++) {
	// 		if(clickedid == TreeTD[i]) {
	// 			TextDrawHideForPlayer(playerid, TreeTD[i]);
	// 			if(++FarmerTreeApples[playerid] == 14) {
	// 				FarmerTreeStatus[FarmerTreeTaken[playerid]] = 300, FarmerTreeTaken[playerid] = -1;
	// 				for(new x = 0; x < sizeof TreeTD; x++) TextDrawHideForPlayer(playerid, TreeTD[x]);
	// 				CancelSelectTextDraw(playerid), TogglePlayerControllable(playerid, true), SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	// 				SetPlayerAttachedObject(playerid, ATTACHMENT_ID_BALE,19637,1,-0.00,0.50,-0.03,0.0,86.0,83.0,1.00,1.00,1.00), 
	// 				Info(playerid, "Ban da lay tao tu cay, hay den checkpoint de nhan luong.");
	// 				SetPlayerCheckpoint(playerid, -1080.3639,-1195.3372,129.6956, 2.5), 
	// 				CP[playerid] = 2018;
	// 				return 1;
	// 			}
	// 		}
	// 	}
	// }
	return 1;
}
public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
    if(PlayerInfo[playerid][pPhoneBook] == 1)
	{
		new string[100], sendername[25];
		GetPlayerName(clickedplayerid, sendername, sizeof(sendername));
		if(PlayerInfo[clickedplayerid][pPhone] == 0)
		{
			format(string, 100, "Ten: {CECECE}%s {FFFFFF}| SDT: {CECECE}Khong",sendername);
			SendClientMessage(playerid, COLOR_WHITE, string);
		}
		else
		{
			format(string, 100, "Ten: {CECECE}%s {FFFFFF}| SDT: {CECECE}%d",sendername,PlayerInfo[clickedplayerid][pPhone]);
			SendClientMessage(playerid, COLOR_WHITE, string);
		}
	}
	return 1;
}
public OnPlayerUpdate(playerid) 
{
	return 1;
}

hook OnPlayerClickPlayerTD(playerid, PlayerText:playertextid) {
	new string[180];
	for(new i = 7; i < 19; i++) {
		if(playertextid != invTD[playerid][i]) continue;
		new id; 

		if(isInInven[playerid] == 1)id = i-7;
		else if(isInInven[playerid] == 2) id = i+5;
		else if(isInInven[playerid] == 3) id = i+16;
		// printf("%d, %s", id,invData[playerid][id][invItemID] );
		if (invData[playerid][id][invExists] == isInInven[playerid]) {
			if(GetPVarInt(playerid, "checkinv") != 0) return SendClientMessage(playerid, COLOR_YELLOW, "Khong the thao tac");
			new name[64];
			format(name, sizeof name, "Vat Pham: %s", invData[playerid][id][invItem]);
			Dialog_Show(playerid, DIALOG_INVENTORY, DIALOG_STYLE_LIST, name, "Su dung\nVut Bo", "Chon", "Cancel");
			playerDialogID[playerid] = id;
			break;
		}
		else SendClientMessage(playerid, -1, "Ban khong co do trong slot nay.");
		break;
	}
	if(GetPVarInt(playerid, "PlayMine") == 1) {	
		if(GetPVarInt(playerid, "StartedGame") == 1 && GetPVarInt(playerid, "Loser") == 0) {
			for(new i = 0; i < 30; i++) {
				if(playertextid == CasinoPTD[i] && MineActive[playerid][i] == 0) {
					MineActive[playerid][i] = 1;
					SetPVarInt(playerid, "Mines", 1+GetPVarInt(playerid, "Mines"));
					if(MineBomb[playerid][i] == 0) {
						PlayerTextDrawBoxColor(playerid, CasinoPTD[i], 0x80FF00FF);
						PlayerTextDrawShow(playerid, CasinoPTD[i]);
						new money, bet = GetPVarInt(playerid, "BetAmount");
						if(GetPVarInt(playerid, "MineType") == 1) money += bet/8;
						else if(GetPVarInt(playerid, "MineType") == 3) money += bet/5;
						else if(GetPVarInt(playerid, "MineType") == 6) money += bet/3;
						SetPVarInt(playerid, "MoneyEarned", money+GetPVarInt(playerid, "MoneyEarned"));
						
						PlayerTextDrawSetString(playerid, CasinoPTD[30], "~g~Ban da thang! :)");
						for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
							if(PlayerInfo[playerid][pDailyMission][m] == 11) CheckMission(playerid, m);
						}								
						format(string, sizeof(string), "Lan choi: ~g~%d~w~~h~~n~Tien nhan duoc: ~g~$%s", GetPVarInt(playerid, "Mines"), FormatNumber(GetPVarInt(playerid, "MoneyEarned")));
						PlayerTextDrawSetString(playerid, CasinoPTD[31], string);					
					} else {
						PlayerTextDrawSetString(playerid, CasinoPTD[30], "~r~Ban thua!~n~Ban co the choi lai sau 5 giay");
						
						format(string, sizeof(string), "* %s da thua $%s trong Mine Sweeper.", GetName(playerid), FormatNumber(GetPVarInt(playerid, "BetAmount")));
						ProxDetector(30.0,playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
						
						for(new x = 0; x < 30; x++) {
							if(MineBomb[playerid][x] == 1) {
								PlayerTextDrawBoxColor(playerid, CasinoPTD[x], 0xFF0000FF);
								PlayerTextDrawShow(playerid, CasinoPTD[x]);
							}	
						}
						
						format(string, sizeof(string), "Lan choi: ~g~%d~w~~h~~n~Tien nhan duoc: ~g~$%s", GetPVarInt(playerid, "Mines"), FormatNumber(GetPVarInt(playerid, "MoneyEarned")));
						PlayerTextDrawSetString(playerid, CasinoPTD[31], string);	

						defer ShowMine(playerid);
						SetPVarInt(playerid, "Loser", 1);
					}
					PlayerTextDrawShow(playerid, CasinoPTD[30]);
					PlayerTextDrawShow(playerid, CasinoPTD[31]);
				}
			}
		}	
		if(playertextid == CasinoPTD[32] && GetPVarInt(playerid, "BetAmount") == 0) Dialog_Show(playerid, DIALOG_BETCASINO, DIALOG_STYLE_INPUT, "Bet amount", "Seteaza suma cu care vrei sa joci.\nPoti pune minim $1.000 si maxim $50,000.", "Select", "Close");
	}
	else if(playertextid == PlayerInfo[playerid][c_GUI_Elements][5]) {
		GUI_DestroyCurrentUI(playerid), CancelSelectTextDraw(playerid), DMV_Next(playerid, GetPVarInt(playerid, INT_pvarDmvNext));
	}
	else if(playertextid == PlayerInfo[playerid][c_GUI_Elements][6]) {
		GUI_DestroyCurrentUI(playerid), CancelSelectTextDraw(playerid), DMV_End(playerid, 1);
	}
	else if(playertextid == GUI_Start) {
		if(PlayerInfo[playerid][pJob] == 11 && !IsPlayerInRangeOfPoint(playerid, Float:5.0, 561.8745,-1972.2299,2.4359)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai Fisherman LS hoac khong dung tai diem cau ca LS!");
		if(PlayerInfo[playerid][pJob] == 15 && !IsPlayerInRangeOfPoint(playerid, Float:5.0, 2000.7100,1567.7600,15.3672)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai Fisherman LV hoac khong dung tai diem cau ca LV!");
		if(JobInfo[PlayerInfo[playerid][pJob]][jAttemptPerHour] == 0) return Info(playerid,"Dia diem nay da het ca.");
		
		if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the tiep tuc neu ban khong xuong xe");
		//if(pFishess[playerid] > 0) return ShowAlertDialog(playerid, "Thong bao", "Di den cua hang 24/7 de ban ca ma ban vua cau truoc khi cau ca lan nua.");
		if(/*VaildFishPlace(playerid) && */!IsPlayerInAnyVehicle(playerid) || pFishing[playerid] != 1) {
			TextDrawHideForPlayer(playerid, GUI_Box1);
			TextDrawHideForPlayer(playerid, GUI_LBox);
			TextDrawHideForPlayer(playerid, GUI_Logo);
			TextDrawHideForPlayer(playerid, GUI_Name);
			TextDrawHideForPlayer(playerid, GUI_Description);
			TextDrawHideForPlayer(playerid, GUI_IMG);
			PlayerTextDrawHide(playerid, GUI_Exit);
			PlayerTextDrawHide(playerid, GUI_Start);
			pFishing[playerid] = 1;
			CancelSelectTextDraw(playerid);
			BatDauCauCa(playerid);
			TogglePlayerControllable(playerid, false);
			ApplyAnimation(playerid, "SAMP", "FishingIdle", 3.0,1,1,0,0,0);
			SetPlayerAttachedObject(playerid, 9, 18632,6,0.079376,0.037070,0.007706,181.482910,0.000000,0.000000,1.000000,1.000000,1.000000);						
		} else return SendClientMessage(playerid, COLOR_WHITE, "Ban khong o cho cau ca");
	}
	else if(playertextid == GUI_Exit) {
		TextDrawHideForPlayer(playerid, GUI_Box1);
		TextDrawHideForPlayer(playerid, GUI_LBox);
		TextDrawHideForPlayer(playerid, GUI_Logo);
		TextDrawHideForPlayer(playerid, GUI_Name);
		TextDrawHideForPlayer(playerid, GUI_Description);
		TextDrawHideForPlayer(playerid, GUI_IMG);
		PlayerTextDrawHide(playerid, GUI_Exit);
		PlayerTextDrawHide(playerid, GUI_Start);
		CancelSelectTextDraw(playerid);
	}
	else if(playertextid == RacePTD[1] ) {
		if(RaceBet[playerid] != 0) return SendClientMessage(playerid, COLOR_LGREEN, "Ban da dat cuoc mot so tien!");
		Dialog_Show(playerid, DIALOG_BET, DIALOG_STYLE_INPUT, "Race bet", "Nhap so tien ma ban muon dat cuoc.\nBan khong the thay doi so tien dat cuoc sau do.\nIt nhat $1,000 - Nhieu nhat $10,000.", "Ok", "Exit");
	}	
	else if(playertextid == TradePTD[4]) {
		if(GetPVarInt(playerid, "TradeAccepted") == 0) {
			new id = TradeID[playerid];
			switch(TradeReady[playerid]) {
				case 0: {
					if(TradeItems[playerid] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban can them it nhat mot vat pham!");
					if(GetPVarInt(playerid, "MoneyTrade") <= 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Vui long khong bug");
					if(GetPVarInt(playerid, "MoneyTrade") > GetPlayerCash(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong co so tien ma ban vua dua vao giao dich!");
					PlayerTextDrawSetString(playerid, TradePTD[4], "~g~da khoa");
					PlayerTextDrawSetString(id, TradePTD[4], "~g~da khoa");
					PlayerTextDrawShow(playerid, TradePTD[4]);
					PlayerTextDrawShow(id, TradePTD[4]);					
					TradeReady[playerid] = 1;
					if(TradeReady[id] == 1) {
						if(GetPVarInt(playerid, "CarTrade") != -1 && GetPVarInt(id, "CarTrade") == -1 && GetSlots(id) == GetVehicles(id)) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban co so luong xe toi da! Ban chi co the trao doi tren san giao dich.");
						if(GetPVarInt(id, "CarTrade") != -1 && GetPVarInt(playerid, "CarTrade") == -1 && GetSlots(playerid) == GetVehicles(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Nguoi choi do co so luong xe ca nhan toi da! Ho chi co the trao doi tren san giao dich.");
						PlayerTextDrawSetString(playerid, TradePTD[6], "00:10");
						PlayerTextDrawSetString(id, TradePTD[6], "00:10");
						PlayerTextDrawShow(id, TradePTD[6]);
						PlayerTextDrawShow(playerid, TradePTD[6]);
						TradeTime[playerid] = 10;
						SendClientMessage(playerid, COLOR_GOLD, "Giao dich se hoan tat sau 10 giay neu nhu khong ai dung lai!");
						SendClientMessage(id, COLOR_GOLD, "Giao dich se hoan tat sau 10 giay neu nhu khong ai dung lai!");
					}					
				}
				case 1: {
					PlayerTextDrawSetString(playerid, TradePTD[4], "~r~Khoa");
					PlayerTextDrawSetString(id, TradePTD[4], "~r~Khoa");
					PlayerTextDrawShow(playerid, TradePTD[4]);
					PlayerTextDrawShow(id, TradePTD[4]);
					TradeReady[playerid] = 0;
					if(TradeTime[id] != 0 || TradeTime[playerid] != 0) {
						PlayerTextDrawHide(id, TradePTD[6]);
						PlayerTextDrawHide(playerid, TradePTD[6]);
						TradeTime[playerid] = 0;
						TradeTime[id] = 0;
						SendClientMessage(playerid, COLOR_GOLD, "Giao dich da duoc huy vi mot trong 2 ban khong san sang!");
						SendClientMessage(id, COLOR_GOLD, "Giao dich da duoc huy vi mot trong 2 ban khong san sang!");
					}					
				}				
			}
		}
	}
	
	else if(playertextid == TradePTD[5]) {
		if(GetPVarInt(playerid, "TradeAccepted") == 1) {
			new id = TradeID[playerid];
			switch(TradeReady[playerid]) {
				case 0: {
					if(TradeItems[playerid] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban can them it nhat mot vat pham!");
					if(GetPVarInt(playerid, "MoneyTrade") > GetPlayerCash(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong co so tien ma ban vua dua vao giao dich!");
					if(GetPVarInt(playerid, "MoneyTrade") <= 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Vui long khong bug");
					PlayerTextDrawSetString(playerid, TradePTD[5], "~g~da khoa");
					PlayerTextDrawSetString(id, TradePTD[5], "~g~da khoa");
					PlayerTextDrawShow(playerid, TradePTD[5]);
					PlayerTextDrawShow(id, TradePTD[5]);					
					TradeReady[playerid] = 1;
					if(TradeReady[id] == 1) {
						if(GetPVarInt(playerid, "CarTrade") != -1 && GetPVarInt(id, "CarTrade") == -1 && GetSlots(id) == GetVehicles(id)) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban co so luong xe toi da! Ban chi co the trao doi tren san giao dich.");
						if(GetPVarInt(id, "CarTrade") != -1 && GetPVarInt(playerid, "CarTrade") == -1 && GetSlots(playerid) == GetVehicles(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Nguoi choi do co so luong xe ca nhan toi da! Ho chi co the trao doi tren san giao dich.");
											
						PlayerTextDrawSetString(playerid, TradePTD[6], "00:10");
						PlayerTextDrawSetString(id, TradePTD[6], "00:10");
						PlayerTextDrawShow(id, TradePTD[6]);
						PlayerTextDrawShow(playerid, TradePTD[6]);
						TradeTime[playerid] = 10;
						SendClientMessage(playerid, COLOR_GOLD, "Giao dich se hoan tat sau 10 giay neu nhu khong ai dung lai!");
						SendClientMessage(id, COLOR_GOLD, "Giao dich se hoan tat sau 10 giay neu nhu khong ai dung lai!");				
					}
				}
				case 1: {
					PlayerTextDrawSetString(playerid, TradePTD[5], "~r~Khoa");
					PlayerTextDrawSetString(id, TradePTD[5], "~r~Khoa");
					PlayerTextDrawShow(playerid, TradePTD[5]);
					PlayerTextDrawShow(id, TradePTD[5]);
					TradeReady[playerid] = 0;
					if(TradeTime[id] != 0 || TradeTime[playerid] != 0) {
						PlayerTextDrawHide(id, TradePTD[6]);
						PlayerTextDrawHide(playerid, TradePTD[6]);
						TradeTime[playerid] = 0;
						TradeTime[id] = 0;
						SendClientMessage(playerid, COLOR_GOLD, "Giao dich da duoc huy vi mot trong 2 ban khong san sang!");
						SendClientMessage(id, COLOR_GOLD, "Giao dich da duoc huy vi mot trong 2 ban khong san sang!");
					}				
				}				
			}
		}
	}
	else if(playertextid == TradePTD[3]) {
		if(TradeItems[playerid] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong them bat ky thu gi vao lan giao dich nay!");
		if(TradeReady[playerid] == 1) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the xoa cac muc da them trong khi bo hen gio duoc bat!");
		HideTradeItems(playerid);
		new id = TradeID[playerid];
		format(string, sizeof(string), "%s da xoa mot vat pham da them.", GetName(playerid));
		SendClientMessage(playerid, COLOR_GOLD, string);
		SendClientMessage(id, COLOR_GOLD, string);		
	}	
	else if(playertextid == TradePTD[2] && TradeReady[playerid] == 0) Dialog_Show(playerid, DIALOG_TRADE, DIALOG_STYLE_LIST, "Giao dich", "Money\nHouse\nBusiness\nVehicle", "Ok", "Cancel");
	else if(playertextid == HiddTDs[1]) {
		if(GetPVarInt(playerid, "tholambanh") != 0)
		{
			if(PlayerInfo[playerid][pBanhTrungThu] < 200) return Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Tho Lam Banh", "Ban khong du banh", "Dong y", "Cancel");
			PlayerInfo[playerid][pBanhTrungThu] -= 200;	
			Update(playerid, pBanhTrungThux);	
			SetPVarInt(playerid, "tholambanh", 0);
			format(string ,sizeof string, "%s Da Nhan Hidden Color Tu Tho Lam Banh",GetName(playerid));
			SendAdminMessage(COLOR_YELLOW, string, 1);
		}
		else {
			if(PlayerInfo[playerid][pPremiumPoints] < 30) return SendClientMessage(playerid, COLOR_GREY, "Ban can 30 "#DIEMCAOCAP" de mua san pham nay.");
			PlayerInfo[playerid][pPremiumPoints] -= 30;
			Update(playerid, pPremiumPointsx);
		}
		va_SendClientMessage(playerid, COLOR_GOLD, "Chuc mung! Ban da mua mau sac (%d, %d) tu cua hang cho chiec xe ca nhan cua ban.", pColor1[playerid], pColor2[playerid]);
		format(string, sizeof(string), "%s (SQL-ID: %d) da mua mau sac (%d, %d) tu cua hang cho chiec xe ca nhan cua ban.", GetName(playerid), PlayerInfo[playerid][pSQLID], pColor1[playerid], pColor2[playerid]);
		////InsertLog(playerid, string, LOG_SHOP);
		Log("logs/shop.log", string);
		new idd = pCar[playerid];
		CarInfo[idd][cColorOne] = pColor1[playerid];
		CarInfo[idd][cColorTwo] = pColor2[playerid];
		ChangeVehicleColorEx(GetPlayerVehicleID(playerid), pColor1[playerid], pColor2[playerid]);
		va_mysql_query("UPDATE cars SET ColorOne = %d, ColorTwo = %d WHERE ID=%d", pColor1[playerid], pColor2[playerid], idd);
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
		PlayerTextDrawHide(playerid, HiddTDs[2]); //danh dau
		InShop[playerid] = 0;
		CancelSelectTextDraw(playerid);
	}
	else if(playertextid == invTD[playerid][4]) {
		inventoryTextDraws(playerid, false);
		isInInven[playerid] = 0;
		CancelSelectTextDraw(playerid);
		if(GetPVarInt(playerid, "checkinv") != 0) {
			SetPVarInt(playerid, "checkinv", 0);
			SetPVarInt(playerid, "checkinvid", 0);
		}
	}
	else if(playertextid == invTD[playerid][20]) {
		if(GetPVarInt(playerid, "checkinv") == 1) {
			showSpecPlayerInventory(playerid, 2, GetPVarInt(playerid, "checkinvid"));
			SetPVarInt(playerid, "checkinv", 2);
		}
		else if(isInInven[playerid] == 1) showPlayerInventory(playerid, 2);
	}
	else if(playertextid == invTD[playerid][21]) {
		if(GetPVarInt(playerid, "checkinv") == 2) {
			showSpecPlayerInventory(playerid, 1, GetPVarInt(playerid, "checkinvid"));
			SetPVarInt(playerid, "checkinv", 1);
		}
		else if(isInInven[playerid] == 2) showPlayerInventory(playerid, 1);
	}
	else if(playertextid == DSTds[3]) Dialog_Show(playerid, DIALOG_EDITVEHICLE, DIALOG_STYLE_LIST, "Edit vehicle", "Value\nMax. speed\nStock", "Ok", "Exit"), SetPVarInt(playerid, "VehicleID", DealerID[playerid]);

    return 1;
}
public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ) {
	if(Iter_Contains(PlayerInRace, playerid) && PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong duoc phep su dung lenh nay khi ban dang o trong dau truong dua xe!");
	if(JobWorking[playerid] == 1 && PlayerInfo[playerid][pAdmin] < 6 && PlayerInfo[playerid][pAdmin] != 0) return SendClientMessage(playerid, COLOR_WARNING, "Ban khong duoc phep lam dung quyen hanh!");
	if(PlayerInfo[playerid][pAdmin] > 0) {
		if(GetPlayerState(playerid) == 2) SetVehiclePosEx(playerid, GetPlayerVehicleID(playerid), fX, fY, fZ+5);
		else SetPlayerPosFindZ(playerid, fX, fY, fZ+5);
	}
    return 1;
}
public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart) {
	if(togalert[playerid] != 0) {
		PlayerTextDrawBoxColor(playerid, HPAlert, GetHudColor2(togalert[playerid]));
		PlayerTextDrawShow(playerid, HPAlert);
		defer HideHPAlert(playerid);
	}
	
	new Float:HP, Float:AP, Float:remainHP;
		//if(issuerid == INVALID_PLAYER_ID) return 1;
	
	if(issuerid != INVALID_PLAYER_ID) {
		new id;
		GetPlayerHealth(playerid, HP);
		GetPlayerArmour(playerid, AP);
		for(new i = 0; i < MAX_DAMAGES; i++)
		{
			if(!DamageInfo[playerid][i][dmgDamage])
			{
				id = i;
				break;
			}
		}
		new name[35];
		DamageInfo[playerid][id][dmgDamage] = floatround(amount, floatround_round);
		DamageInfo[playerid][id][dmgIssuerName] = GetPlayerName(playerid, name, sizeof(name));
		DamageInfo[playerid][id][dmgWeapon] = weaponid;
		DamageInfo[playerid][id][dmgBodypart] = bodypart;
		if(AP > 0) DamageInfo[playerid][id][dmgKevlarhit] = true;
		else if(AP < 1) DamageInfo[playerid][id][dmgKevlarhit] = false;
		DamageInfo[playerid][id][dmgSeconds] = gettime();
		new Float:disc = 0.0;
    	disc = GetDistanceBetweenPlayers(issuerid,playerid);
		{
			
			new string[195];
			new weaponname[24], part[24];
			GetWeaponName(weaponid, weaponname, sizeof (weaponname));
			if(weaponid == 0) weaponname = "Nam dam";
			if(bodypart == 9) part = "Dau";
			if(bodypart == 4) part = "Trym";
			if(bodypart == 5) part = "Tay trai";
			if(bodypart == 6) part = "Tay phai";
			if(bodypart == 7) part = "Chan trai";
			if(bodypart == 8) part = "Chan phai";
			if(bodypart == 3) part = "Nguc";
			if(weaponid == 0) weaponname = "Tay";
			format(string, sizeof(string), "[Chien Dau] Ban da bi {00fa2a}%s{ff0000} ban bang khau sung {00fa2a}%s{ff0000} lam ban mat {00fa2a}%.0fHP{ff0000} Khoang cach : {00fa2a}%0.1fm | Vi tri [%s].",GetName(issuerid), weaponname, amount, disc, part);
			SendClientMessage(playerid, COLOR_RED, string);
		}
		if(amount < 0) {
			new string[128],sendername[25];
			GetPlayerName(issuerid,sendername,sizeof(sendername));
			format(string, sizeof(string), "AdmWarning: %s(%d) co the hack global kill. (damage: %.2f)",sendername,issuerid,amount);
			if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(COLOR_WARNING, string,1);
			KickEx(issuerid);
			return 1;
		}
		if(weaponid == 54 && GetPlayerState(issuerid) != PLAYER_STATE_DRIVER) {
			if(playerDeath[issuerid] == 0) {				
			 	GetPlayerHealthEx(issuerid, HP);
			 	GetPlayerArmourEx(issuerid, AP);
				if(AP >= amount) {
					SetPlayerArmourEx( issuerid, AP - amount );
					SetPlayerHealthEx( issuerid, HP );
				}
				else if( AP <= 0 ) {
					remainHP = HP - amount;
					SetPlayerHealthEx( issuerid, remainHP );
					if( remainHP <= 0 && playerDeath[issuerid] == 0 ) {
						playerDeath[playerid] = 1;
						OnPlayerDeathEx( playerid, issuerid, weaponid );
					}
				}
				else {
					remainHP = HP + ( AP - amount );
					SetPlayerArmourEx( issuerid, 0.0 );
					SetPlayerHealthEx( issuerid, remainHP );
					if( remainHP <= 0 && playerDeath[issuerid] == 0 ) {
						playerDeath[issuerid] = 1;
						OnPlayerDeathEx( playerid, INVALID_PLAYER_ID, weaponid );
					}
				}
			}
		}
		if(weaponid == 49 || weaponid == 50 || weaponid == 51 || weaponid == 52 || weaponid == 53 || weaponid == 54 || GetPlayerState(issuerid) == PLAYER_STATE_DRIVER) {
			if(playerDeath[playerid] == 0) {
				if(SFID[playerid] != 0 && (weaponid == 51 || weaponid == 49)) {
					GetPlayerHealthEx(playerid, HP);
					SetPlayerHealthEx(playerid, HP);
					return 1;
				}	
				GetPlayerHealthEx(playerid,HP);
				GetPlayerArmourEx(playerid,AP);
				if(AP >= amount ) {
					SetPlayerArmourEx(playerid, AP - amount);
					SetPlayerHealthEx(playerid, HP);
					return 1;
				}
				else if(AP <= 0) {
					remainHP = HP - amount;
					SetPlayerHealthEx(playerid, remainHP);
					if(remainHP <= 0 && playerDeath[playerid] == 0) {
						playerDeath[playerid] = 1;
						OnPlayerDeathEx(playerid, issuerid, weaponid);
						return 1;
					}
				}
				else {
					remainHP = HP + (AP - amount);
					SetPlayerArmourEx(playerid, 0.0);
					SetPlayerHealthEx(playerid, remainHP);
					if( remainHP <= 0 && playerDeath[playerid] == 0) {
						playerDeath[playerid] = 1;
						OnPlayerDeathEx(playerid, issuerid, weaponid );
						return 1;
					}
				}			
			}			
		}
	}
	else {
		if(playerDeath[playerid] == 0) {
			GetPlayerHealthEx(playerid,HP);
			GetPlayerArmourEx(playerid,AP);
			if(AP >= amount ) {
				SetPlayerArmourEx(playerid, AP - amount);
				SetPlayerHealthEx(playerid, HP);
			}
			else if(AP <= 0) {
				remainHP = HP - amount;
				SetPlayerHealthEx(playerid, remainHP);
				if(remainHP <= 0 && playerDeath[playerid] == 0) {
					playerDeath[playerid] = 1;
					OnPlayerDeathEx(playerid, INVALID_PLAYER_ID, weaponid);
				}
			}
			else {
				remainHP = HP + (AP - amount);
				SetPlayerArmourEx(playerid, 0.0);
				SetPlayerHealthEx(playerid, remainHP);
				if( remainHP <= 0 && playerDeath[playerid] == 0) {
					playerDeath[playerid] = 1;					
					OnPlayerDeathEx(playerid, INVALID_PLAYER_ID, weaponid );
				}
			}
		}
	}	
	return 1;
}
public OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart) {
	// if(IsPlayerNPC(damagedid)) return SetPlayerHealthEx(damagedid,99);
	if(damagedid != INVALID_PLAYER_ID) {
		if(togding[playerid] == 0) PlayerPlaySound(playerid,17802,0.0,0.0,0.0);
	 	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) return 1;
		if(GetPlayerSurfingVehicleID(playerid) != INVALID_VEHICLE_ID) return 1;
 		/*if(playerDeath[playerid] == 1) {
			if(gettime() - GetPVarInt(playerid, "LagGodDelay") > 0) {
				new str[60];
				SendClientMessage(playerid, -1, "Ban dang gap lag god, tam thoi khong the gay damage, hay /baocao de admin respawn cho ban.");
				format(str, sizeof(str), "INFO: %s dang gap lag god.", GetName(playerid));
				SetPVarInt(playerid, "LagGodDelay", gettime() + 20);
			}
			return 1;
		} */
		new Float:disc = 0.0;
    	disc = GetDistanceBetweenPlayers(damagedid,playerid);
		{
			
			new string[195];
			new weaponname[24], part[24];
			GetWeaponName(weaponid, weaponname, sizeof (weaponname));
			if(weaponid == 0) weaponname = "Nam dam";
			if(bodypart == 9) part = "Dau";
			if(bodypart == 4) part = "Trym";
			if(bodypart == 5) part = "Tay trai";
			if(bodypart == 6) part = "Tay phai";
			if(bodypart == 7) part = "Chan trai";
			if(bodypart == 8) part = "Chan phai";
			if(bodypart == 3) part = "Nguc";
			if(weaponid == 0) weaponname = "Tay";
			format(string, sizeof(string), "[Chien Dau] Ban da bi {00fa2a}%s{ff0000} ban bang khau sung {00fa2a}%s{ff0000} lam ban mat {00fa2a}%.0fHP{ff0000} Khoang cach : {00fa2a}%0.1fm | Vi tri [%s].",GetName(playerid), weaponname, amount, disc, part);
			SendClientMessage(damagedid, COLOR_RED, string);
		}
		if(playerDeath[damagedid] == 0) {
			foreach(new i: PlayerHelpers) {
				if(Spectate[i] == damagedid || Spectate[i] == playerid) {
					if(IsPlayerLogged[i] == 1) {
						new victim[MAX_PLAYER_NAME], attacker[MAX_PLAYER_NAME];
						new weaponname[24];
						GetPlayerName(playerid, attacker, sizeof (attacker));
						GetPlayerName(damagedid, victim, sizeof (victim));
					 
						GetWeaponName(weaponid, weaponname, sizeof (weaponname));
						if(weaponid == 0) weaponname = "Nam dam";
						new string[180];
						format(string, sizeof(string), "[DMG] %s did %.0f damage to %s using weapon %s.", attacker, amount, victim, weaponname);
						SendClientMessage(i, 0xFFADADFF, string);						
					}
				}
			}
			foreach(new i: PlayerAdmins) {
				if(Spectate[i] == damagedid || Spectate[i] == playerid || Aduty[i] == 1) {
					if(IsPlayerLogged[i] == 1) {
						new victim[MAX_PLAYER_NAME], attacker[MAX_PLAYER_NAME];
						new weaponname[24];
						GetPlayerName(playerid, attacker, sizeof (attacker));
						GetPlayerName(damagedid, victim, sizeof (victim));
					 
						GetWeaponName(weaponid, weaponname, sizeof (weaponname));
						if(weaponid == 0) weaponname = "Nam dam";
						new string[180];
						format(string, sizeof(string), "[DMG] %s gay %.0f damage len %s bang %s.", attacker, amount, victim, weaponname);
						SendClientMessage(i, 0xFFADADFF, string);						
					}
				}
			}
			if(InWar[PlayerInfo[playerid][pMember]] == 1) {
				if(PlayerInfo[playerid][pMember] == PlayerInfo[damagedid][pMember]) {
					new Float: HP;
					GetPlayerHealthEx(damagedid, HP);
					SetPlayerHealthEx(damagedid, HP);
					return 1;
				}
			} 
			else {
				if(tazer[playerid] == 1 && IsACop(playerid) && weaponid == 24) {
					if(IsACop(damagedid)) return SendClientMessage(playerid, COLOR_WHITE, "Nguoi choi do dang o trong mot so canh sat..");
					if(PlayerCuffed[damagedid] == 1) return SendClientMessage(playerid, COLOR_WHITE, "Nguoi choi do dang bi dien giat.");
					if(PlayerInfo[damagedid][pSleeping] == 1) return SendClientMessage(playerid, COLOR_WHITE, "Nguoi choi do dang ngu.");
					if(GetDistanceBetweenPlayers(playerid, damagedid) < 15) {
						new string[180];
						format(string, sizeof(string), "* %s giat dien %s trong 8 giay.", GetName(playerid), GetNameEx(damagedid));
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						TogglePlayerControllable(damagedid, false);
						PlayerCuffed[damagedid] = 1;
						PlayerCuffedTime[damagedid] = 8;
						return 1;
					}
				}
				if(SFID[playerid] != 0) {
					if(weaponid == 51 || weaponid == 49) {
						new Float: HP;
						GetPlayerHealthEx(damagedid, HP);
						SetPlayerHealthEx(damagedid, HP);
						return 1;
					}
					// if(!IsPlayerInAnyVehicle(playerid) && !IsACop(playerid) && PlayerHit[playerid] != damagedid && PaintType[playerid] == 0) {
					// 	SendClientMessage(playerid, COLOR_LIGHTRED, "Ban bi dong bang trong 5 giay vi ban danh ai do trong mot khu vuc duoc bao ve.");
					// 	TogglePlayerControllable(playerid, false);
					// 	defer UnFreezeStation[5000](playerid);
					// 	SetPlayerArmedWeapon(playerid, 0);
					// }
				}				
				if(weaponid == 34 && PlayerInfo[playerid][pMember] == 11) {
					SetPlayerHealthEx(damagedid, 0.0);
					SetPlayerArmourEx(damagedid, 0.0);
					playerDeath[damagedid] = 1;					
					OnPlayerDeathEx(damagedid,playerid,weaponid);
					return 1;
				}
			}
			if(amount < 0) {
				new string[180];
				format(string, sizeof(string), "AdmWarning: %s(%d) co the hack global kill. (damage: %.2f)",GetName(playerid),playerid,amount);
				if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(COLOR_WARNING, string,1);
				KickEx(playerid);
				return 1;
			}
			if(weaponid == 0) 
				if(disc > 400.0) NightBot(playerid, "Nghi van hack #1");
			for(new sf = 0; sf < MAX_SAFEZONES; sf++) {
				if(SafeZone[sf][szRange] >= 15) {
					if(PlayerToPoint(SafeZone[sf][szRange], playerid, SafeZone[sf][szX], SafeZone[sf][szY], SafeZone[sf][szZ])) {
						if(!IsPlayerInAnyVehicle(playerid) && !IsACop(playerid) && PlayerHit[playerid] != damagedid && PaintType[playerid] == 0 && InWar[PlayerInfo[playerid][pMember]] == 0) {
							SendClientMessage(playerid, COLOR_LIGHTRED, "Ban bi dong bang trong 5 giay vi ban danh ai do trong mot khu vuc duoc bao ve.");
							TogglePlayerControllable(playerid, 0);
							defer UnFreezeStation[5000](playerid);
							SetPlayerArmedWeapon(playerid, 0);
						}
					}
				}   
			}   
			if(InLeTrungThu[playerid] == 1) {
				SendClientMessage(playerid, COLOR_LIGHTRED, "Ban bi dong bang trong 5 giay vi ban danh ai do khi ban dang tham gia le hoi.");
				TogglePlayerControllable(playerid, 0);
				defer UnFreezeStation[5000](playerid);
				SetPlayerArmedWeapon(playerid, 0);
			}
		 	new Float: HP, Float: AP ;
			GetPlayerHealthEx(damagedid,HP);
			GetPlayerArmourEx(damagedid,AP);
			if(AP >= amount) SetPlayerArmourEx(damagedid, AP - amount);
			else if(AP < 1) {
				new const Float: remainHP = HP - amount;
				if(remainHP <= 0) {
					// playerDeath[damagedid] = 1;
					// OnPlayerDeathEx(damagedid, playerid, weaponid);
					SetPlayerHealthEx(damagedid, 0);
					playerDeath[damagedid] = 1;
					OnPlayerDeathEx(damagedid, playerid, weaponid);
					/*if(SFID[playerid] != 0 && !IsACop(playerid) && InWar[PlayerInfo[playerid][pMember]] == 0) {
						if(PlayerInfo[playerid][pWantedLevel]+2 > 6) PlayerInfo[playerid][pWantedLevel] = 6;
						else PlayerInfo[playerid][pWantedLevel] += 2;
						SetPlayerCriminal(playerid, 255, "Giet nguoi trong SafeZone");
						ShowWanted[playerid] = 1;
					}*/
				}
				else SetPlayerHealthEx(damagedid, remainHP);
			}
			else {
				new const Float: remainHP = HP + (AP - amount);
				SetPlayerArmourEx(damagedid, 0.0);
				if(remainHP <= 0) {
					// OnPlayerDeathEx(damagedid, playerid, weaponid);
					SetPlayerHealthEx(damagedid, 0);
					playerDeath[damagedid] = 1;
					OnPlayerDeathEx(damagedid, playerid, weaponid);
					/*if(SFID[playerid] != 0 && !IsACop(playerid) && InWar[PlayerInfo[playerid][pMember]] == 0) {
						if(PlayerInfo[playerid][pWantedLevel]+2 > 6) PlayerInfo[playerid][pWantedLevel] = 6;
						else PlayerInfo[playerid][pWantedLevel] += 2;
						SetPlayerCriminal(playerid, 255, "Giet nguoi trong SafeZone");
						ShowWanted[playerid] = 1;						
					}*/
				}
				else SetPlayerHealthEx(damagedid, remainHP);
			}
			if(PlayerCuffed[damagedid] == 1) SetPlayerHealthEx(damagedid,99);
			if(PlayerInfo[damagedid][pSleeping] == 1) SetPlayerHealthEx(damagedid, 99);			
			if(DMGTimer[damagedid] != Timer:0) {
				Combo[playerid] ++;

				// if(Combo[playerid] == 10) {
				// 	// Send to admin
				// 	new string[180];
				// 	format(string, sizeof(string), "AdmWarning: %s(%d) co the hack aimbot, ban trung 10 phat lien tuc.",GetName(playerid),playerid);
				// 	SendAdminMessage(COLOR_WARNING, string,1);
				// }
				stop DMGTimer[damagedid];
				stop DMGTimer[playerid];
			} else Combo[playerid] = 0;
			new weapon[40];
			if(GetPlayerWeapon(playerid) == 0) weapon ="Nam dam";
			else GetWeaponName(weaponid, weapon, sizeof (weapon));
			if(PlayerInfo[damagedid][pShowDMG] == 1 && GetPVarInt(playerid, "Undercover") == 0) {
				new string[180];
				if(Combo[playerid] != 0) format(string, sizeof(string), "%s~n~-%0.1f HP voi %s (%dx)", GetName(playerid), amount, weapon, Combo[playerid]+1);
				else format(string, sizeof(string), "%s~n~-%0.1f HP voi %s", GetName(playerid), amount, weapon);
				PlayerTextDrawSetString(damagedid, DMGTD[0], string);
				PlayerTextDrawShow(damagedid, DMGTD[0]);
				if (Timer_IsRunning(DMGTimer[damagedid])) {
					stop DMGTimer[damagedid];
					DMGTimer[damagedid] = Timer:0;
				}
				DMGTimer[damagedid] = defer DamageInformer(damagedid);
			}
			if(PlayerInfo[playerid][pShowDMG] == 1) {
				new string[180];
				if(Combo[playerid] != 0) format(string, sizeof(string), "%s~n~+%0.1f HP voi %s (%dx)", GetName(damagedid), amount, weapon, Combo[playerid]+1);
				else format(string, sizeof(string), "%s~n~+%0.1f HP voi %s", GetName(damagedid), amount, weapon);
				PlayerTextDrawSetString(playerid, DMGTD[1], string);
				PlayerTextDrawShow(playerid, DMGTD[1]);
				
				if (Timer_IsRunning(DMGTimer[playerid])) { 
					stop DMGTimer[playerid];
					DMGTimer[playerid] = Timer:0;
				}
				DMGTimer[playerid] = defer DamageInformer(playerid);
			}
		}
	}
	else if(cadoumort == 0) {
		new Float:x,Float:y,Float:z;
		GetObjectPos(cadouzburator, x,y,z);
		if(IsPlayerInRangeOfPoint(playerid, 60.0, x,y,z)) {
			if(!IsPlayerInAnyVehicle(playerid) && PlayerHit[playerid] != damagedid && PaintType[playerid] == 0 && InWar[PlayerInfo[playerid][pMember]] == 0) {
				SendClientMessage(playerid, COLOR_LIGHTRED, "Ban da bi dong bang trong 5 giay vi ban' nguoi trong khu vuc duoc bao ve.");
				TogglePlayerControllable(playerid, false);
				defer UnFreezeStation[5000](playerid);
				new Float:hp = GetPlayerHealth(PlayerHit[playerid], hp);
				SetPlayerHealthEx(PlayerHit[playerid], hp+damagedid);
			}
		}
	}
	return 1;
}
public OnPlayerDeathEx(playerid, killerid, reason) {
	if(GetPVarInt(playerid, "AmIDead") > gettime()) return 1;
	SetPVarInt(playerid, "AmIDead", gettime() + 3);
    if(gPlayerUsingLoopingAnim[playerid]) gPlayerUsingLoopingAnim[playerid] = 0;
    new Float:disc = 0.0, string[180];
    if(killerid != INVALID_PLAYER_ID) {
    	disc = GetDistanceBetweenPlayers(killerid,playerid);
    	ADeathMessage(playerid, killerid, reason);
    }
	else ADeathMessage(INVALID_PLAYER_ID, playerid, 47);
	// Death 3DText
	// ResetPlayerDamages(playerid);
	Update3DTextLabelText(deathLabel[playerid], COLOR_LIGHTRED, "[dead]");
	Attach3DTextLabelToPlayer(deathLabel[playerid], playerid, 0.0, 0.0, 0.3);
	if(InRob[playerid] == 1) FailRob(playerid, "Ban da chet");
	SetPlayerWorldBounds(playerid, 20000.0000, -20000.0000, 20000.0000, -20000.0000);
	//if(GetPVarInt(playerid, "IsOnFire")) TogglePlayerBurning(playerid, false);

	/*if(pFishess[playerid] != 0) {
		pFishess[playerid] = 0;
		va_SendClientMessage(playerid, COLOR_WARNING, "Ban da danh mat con ca tri gia %d$.", FishPrice[playerid]);
		FishPrice[playerid] = 0;
	}*/
	if(PlayerInfo[playerid][pEscape] != 0) {
		if(IsValidDynamicPickup(PlayerInfo[playerid][pEscapeP])) DestroyDynamicPickup(PlayerInfo[playerid][pEscapeP]);
		if(IsValidDynamic3DTextLabel(PlayerInfo[playerid][pEscapeT])) DestroyDynamic3DTextLabel(PlayerInfo[playerid][pEscapeT]);
		if(PlayerInfo[playerid][pEscapeCar] != 0) DestroyVehicle(PlayerInfo[playerid][pEscapeCar]), PlayerInfo[playerid][pEscapeCar] = 0;
		// PlayerTextDrawHide(playerid, WantedTime); // but JailTD
		if(PlayerInfo[playerid][pEscape] == 2) {
			if(PlayerInfo[playerid][pWantedLevel]+5 > 6) PlayerInfo[playerid][pWantedLevel] = 6;
			else PlayerInfo[playerid][pWantedLevel] += 5;
			SetPlayerCriminal(playerid, 255, "Vuot nguc");
			ShowWanted[playerid] = 1;		
		}
		PlayerInfo[playerid][pEscape] = 0;
		SendClientMessage(playerid, 0xffc301ff, "Ban da roi khoi xe, vuot nguc that bai va ban bi truy na 5 sao.");
	}	
	if(PlayerInfo[playerid][pWantedLevel] != 0) {
		new count, names[180];	
		foreach(new i: Player) {
			if(OnDuty[i] == 1 && IsACop(i) && CrimInRange(75.0, playerid,i)) {
				count = 1;
				// SavePlayerPosData(playerid, 264.5794, 82.0395, 1001.2639);
				format(string, sizeof(string), "phan thuong anh hung!");
				GameTextForPlayer(i, string, 3000, 1);
				ConsumingMoney[i] = 1;
				GivePlayerCash(i, PlayerInfo[playerid][pWantedLevel] * 2000);
				Update(i, pCashx);
				UpdateFactionRaport(i, 0);			
				SpawnPlayer(playerid);
				format(string, sizeof(string), "Ban nhan duoc $%d tien thuong vi da bat duoc %s.", PlayerInfo[playerid][pWantedLevel] * 2000, GetName(playerid));
				SendClientMessage(i, COLOR_DBLUE, string);
				format(names, 256, "%s %s", names, GetName(i));
			}
			if(count == 1) {
				if(ProxDetectorS(30.0, i, playerid)) {
					format(string, sizeof(string), "* %s da vao tu, cam on den: %s", GetName(playerid), names);
					SendClientMessage(i, COLOR_PURPLE, string);
				}
			}				
		}	
		if(count == 1) {	
			if(killerid == INVALID_PLAYER_ID) format(string, sizeof(string), "Tru so: %s da chet va vao tu trong %d giay, over.", GetName(playerid), (PlayerInfo[playerid][pWantedLevel])*(150));
			else format(string, sizeof(string), "Tru so: %s vua bi giet boi %s va se vao tu trong %d giay, over.", GetName(playerid), GetName(killerid), (PlayerInfo[playerid][pWantedLevel])*(150));
			SendTeamMessage(1, 0x2e64feFF, string);
			SendTeamMessage(2, 0x2e64feFF, string);
			SendTeamMessage(3, 0x2e64feFF, string);		
			SendTeamMessage(15, 0x2e64feFF, string);		
			new price = PlayerInfo[playerid][pWantedLevel] * 2000 * PlayerInfo[playerid][pLevel];
			if(price > 200000) price = 200000;
			GivePlayerCash(playerid, - price);
			PlayerInfo[playerid][pWantedDeaths] += 1;
			PlayerInfo[playerid][pJailed] = 1;
			PlayerInfo[playerid][pJailTime] = (PlayerInfo[playerid][pWantedLevel])*(600);
			PlayCopSound();
			format(string, sizeof(string), "Boi vi ban da chet, ban mat $%s va ban vao tu trong %d giay. Ban khong con bi truy na nua.", FormatNumber(price), PlayerInfo[playerid][pJailTime]);
			SendClientMessage(playerid, COLOR_LIGHTRED, string);
			TogglePlayerControllable(playerid, false);
			defer UnFreezeStation[1000](playerid);
			PlayerInfo[playerid][pWantedLevel] = 0;
			SetPlayerWantedLevel(playerid, 0);
			Update(playerid,pWantedLevelx);
			Update(playerid,pJailedx);
			Update(playerid,pJailTimex);
			ClearCrime(playerid);				
			checkbpquest(playerid, 1, 3);	
		}
	}
	TextDrawHideForPlayer(playerid, EventCS);
	if(killerid != INVALID_PLAYER_ID) {	
		SetPVarInt(playerid,"KilledFlood", GetPVarInt(playerid,"KilledFlood") + 1);
		if(GetPVarInt(playerid,"KilledFlood") >= 3 && PlayerInfo[playerid][pAdmin] == 0) return KickEx(playerid);	
		if(disc > 100 && reason != 34) {
			new gunname[50];
		   	GetWeaponNameEx(reason,gunname,sizeof(gunname));
			format(string, sizeof(string), "AdmWarning: %s giet %s tu khoang cach %.0fm voi %s.",GetName(killerid), GetName(playerid), disc, gunname);
			if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(COLOR_WARNING, string,1);
		}		
		if(PaintType[killerid] != 0 && PaintType[playerid] != 0) {
			if(PaintText[PaintType[playerid]-1] > 1) return 1;
			if(PaintTime[PaintType[playerid]-1] < 1) return 1;		
			
			for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
				if(PlayerInfo[killerid][pDailyMission][m] == 0) CheckMission(killerid, m);
			}	
			
			PlayerInfo[killerid][pPaintKills][PaintType[killerid]-1] ++;
			switch(PaintType[killerid]-1) {
				case 0: UpdateVar(killerid, "PaintKills1", PlayerInfo[killerid][pPaintKills][PaintType[killerid]-1]);
				case 1: UpdateVar(killerid, "PaintKills2", PlayerInfo[killerid][pPaintKills][PaintType[killerid]-1]);
				case 2: UpdateVar(killerid, "PaintKills3", PlayerInfo[killerid][pPaintKills][PaintType[killerid]-1]);				
			}	
			
			PlayerInfo[playerid][pPaintDeaths][PaintType[playerid]-1] ++;		
			switch(PaintType[playerid]-1) {
				case 0: UpdateVar(playerid, "PaintDeaths1", PlayerInfo[playerid][pPaintDeaths][PaintType[playerid]-1]);
				case 1: UpdateVar(playerid, "PaintDeaths2", PlayerInfo[playerid][pPaintDeaths][PaintType[playerid]-1]);
				case 2:	UpdateVar(playerid, "PaintDeaths3", PlayerInfo[playerid][pPaintDeaths][PaintType[playerid]-1]);			
			}	
			PKills[killerid] ++;
			PlayerInfo[playerid][pTrungThuJob][7] += 1;
			save_ttj(playerid);
			PDeaths[playerid] ++;
			if(PaintType[killerid] == 3 && PaintType[playerid] == 3) {
				if(GetPaintLevel(playerid) == 8) {
					foreach(new i: Player) {
						if(IsPlayerLogged[i] == 1) {
							if(PaintType[i] == PaintType[killerid]) {
								new pp = PaintType[killerid]-1;
								for(new m = 0; m < 5; m++) SendDeathMessageToPlayer(i, 1001, 1001, 200);
								format(string, sizeof(string), "* %s chien thang vi da giet %s voi mot knife.", GetName(killerid), GetName(playerid));
								SendPaintMessage(PaintType[i]-1, COLOR_YELLOW, string);
								PaintTime[pp] = 300;
								PKills[i] = 0, PDeaths[i] = 0;
								PaintballWinner[pp] = i;
								PaintballWinnerScore[pp] = 0;
								SpawnPlayer(i);
							}
						}
					}
				}
				else GiveSkillWeapon(killerid);
			}
			foreach(new i: Player) if(PaintType[i] == PaintType[playerid] && PlayerInfo[i][pAdmin] == 0) SendDeathMessageToPlayer(i, killerid, playerid, reason);
			if(PKills[killerid] > PaintballWinnerScore[PaintType[playerid]-1]) {
				PaintballWinner[PaintType[playerid]-1]  = killerid;
				PaintballWinnerScore[PaintType[playerid]-1] = PKills[killerid];
			}
		}
		if(ClanDuty[playerid] == 1 && ClanDuty[killerid] == 1) {
			checkbpquest(killerid, 0,6);
		}
		if(OnDuty[playerid] == 1) {
			checkbpquest(killerid, 3,0);
		}
		if(PaintType[killerid] == 0 && PaintType[playerid] == 0 && InEvent[playerid] == 0 && InEvent[killerid] == 0) {
			if(OnDuty[playerid] == 1 && IsACop(playerid) && !IsACop(killerid) && killerid != INVALID_PLAYER_ID && GetPVarInt(playerid, "Undercover") == 0) {
				new wantedlevel = PlayerInfo[killerid][pWantedLevel];
				if(wantedlevel < 6)
				{
					// finishAchievement(killerid, 14);
					SetPlayerWantedLevel(killerid, wantedlevel+2);
					PlayerInfo[killerid][pWantedLevel] = wantedlevel+2;
					SetPlayerCriminal(killerid, 255, "Giet canh sat");
					WantedTime[killerid] = 0;
					ShowWanted[killerid] = 1;
					Update(killerid, pWantedLevelx);
				}
				else {
					
					format(string, sizeof(string), "%s (%d) Da dat toi pham giet canh sat cao nhat.", GetName(killerid), killerid);
					SendFactionMessage(1, COLOR_LIGHTBLUE, string);
					SendFactionMessage(2, COLOR_LIGHTBLUE, string);
					SendFactionMessage(3, COLOR_LIGHTBLUE, string);
					SendFactionMessage(15, COLOR_LIGHTBLUE, string);		
				}
			}
			if(PlayerInfo[killerid][pWantedLevel] < 6) {
				for(new sf = 0; sf < MAX_SAFEZONES; sf++) {
					if(!IsPlayerInAnyVehicle(killerid) && !IsACop(killerid) && PaintType[killerid] == 0 && InWar[PlayerInfo[killerid][pMember]] == 0) {
						if(IsPlayerInRangeOfPoint(killerid, SafeZone[sf][szRange], SafeZone[sf][szX], SafeZone[sf][szY], SafeZone[sf][szZ]) && SafeZone[sf][szRange] > 15) {
							SetPlayerWantedLevel(killerid, PlayerInfo[killerid][pWantedLevel]+3);
							PlayerInfo[killerid][pWantedLevel] += 3;
							SetPlayerCriminal(killerid, 255, "Giet nguoi trong khu an toan");
							WantedTime[killerid] = 0;
							ShowWanted[killerid] = 1;
							Update(killerid, pWantedLevelx);
						}
					}
				}
			}
			else {
				format(string, sizeof(string), "%s (%d) Da tro thanh ke thong tri khu an toan o canh gioi cao nhat.", GetName(killerid), killerid);
				SendFactionMessage(1, COLOR_LIGHTBLUE, string);
				SendFactionMessage(2, COLOR_LIGHTBLUE, string);
				SendFactionMessage(3, COLOR_LIGHTBLUE, string);
				SendFactionMessage(15, COLOR_LIGHTBLUE, string);		
			}
		}
		if(PlayerInfo[killerid][pJailTime] != 0 && PlayerInfo[playerid][pJailTime] != 0) {
			PlayerInfo[killerid][pJailTime] += 120;
			SendClientMessage(killerid, COLOR_WARNING, "Ban bi o tu them 2 phut vi giet nguoi choi.");
		}
		gPlayerUsingLoopingAnim[playerid] = 0;
		gPlayerSpawned[playerid] = 0;
		if(CP[playerid] == 50) {
			CP[playerid] = 0;
			RemovePlayerAttachedObject(playerid, 0);
			DisablePlayerCheckpointEx(playerid);
			RemovePlayerAttachedObject(playerid, 1);
		}
		if(PlayerCuffed2[playerid] == 1) {
			PlayerCuffed2[playerid] = 0;
			SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
			RemovePlayerAttachedObject(playerid,1);
		}
		if(gPlayerUsingLoopingAnim[playerid]) gPlayerUsingLoopingAnim[playerid] = 0;
		if(InWar[PlayerInfo[playerid][pMember]] == 1 && InWar[PlayerInfo[killerid][pMember]] == 1 && PlayerInfo[killerid][pMember] != PlayerInfo[playerid][pMember]) {
			for(new turf = 1; turf < turfsss; turf++) {
				if(IsPlayerInTurf(playerid, turf) && IsPlayerInTurf(killerid, turf)) { 
					if(WarInfo[turf][wFaction] == PlayerInfo[playerid][pMember] && WarInfo[turf][wAttacker] == PlayerInfo[killerid][pMember] || WarInfo[turf][wFaction] == PlayerInfo[killerid][pMember] && WarInfo[turf][wAttacker] == PlayerInfo[playerid][pMember]) {
						foreach(new i: PlayerGangster) {
							if(IsPlayerLogged[i] == 1) {
								if((PlayerInfo[i][pMember] == PlayerInfo[playerid][pMember] || PlayerInfo[i][pMember] == PlayerInfo[killerid][pMember]) && PlayerInfo[i][pAdmin] == 0) {
									SendDeathMessageToPlayer(i, killerid, playerid, reason);
								}
							}
						}
						if(PlayerInfo[killerid][pMember] == WarInfo[turf][wAttacker] || PlayerInfo[killerid][pMember] == WarInfo[turf][wFaction]) WarScoreF[PlayerInfo[killerid][pMember]][turf] += 1.0;
						ucideri[killerid][turf] ++; 
						decese[playerid][turf] ++;
						
						UpdateVar(killerid, "WarKills", ucideri[killerid][turf]);
						UpdateVar(playerid, "WarDeaths", decese[playerid][turf]);
						
						WarKills[killerid] = ucideri[killerid][turf];
						WarDeaths[playerid] = decese[playerid][turf];
						
					 	if(PlayerInfo[killerid][pMember] == WarInfo[turf][wAttacker])
					 	{
						 	if(ucideri[killerid][turf] > bestscoreat[turf])
						 	{
							 	bestscoreat[turf] = ucideri[killerid][turf];
							 	bestmemberat[turf] = killerid;
						 	}
					 	}
					 	if(PlayerInfo[killerid][pMember] == WarInfo[turf][wFaction])
					 	{
						 	if(ucideri[killerid][turf] > bestscoredf[turf])
						 	{
							 	bestscoredf[turf] = ucideri[killerid][turf];
							 	bestmemberdf[turf] = killerid;
						 	}
					 	}
					 	if(PlayerInfo[playerid][pMember] == WarInfo[turf][wAttacker])
					 	{
					 		if(decese[playerid][turf] > worstscoreat[turf])
							{
								worstscoreat[turf] = decese[playerid][turf];
								worstmemberat[turf] = playerid;
							}
						}
					 	if(PlayerInfo[playerid][pMember] == WarInfo[turf][wFaction])
					 	{
					 		if(decese[playerid][turf] > worstscoredf[turf])
							{
								worstscoredf[turf] = decese[playerid][turf];
								worstmemberdf[turf] = playerid;
							}
						}
						new wname[32];
						GetWeaponNameEx(GetPlayerWeapon(killerid), wname, sizeof(wname));
						format(string, sizeof(string), "War: Ban da giet %s voi %s tu khoang cach %0.1fm.", GetName(playerid), wname, disc);
						SendClientMessage(killerid, 0x00E5FFFF, string);
						new banhtrungthu = 1+random(2);
						format(string,sizeof string, "War: Ban Nhan Duoc %d Banh Trung Thu", banhtrungthu);
						SendClientMessage(killerid,0x00E5FFFF, string);
						PlayerInfo[killerid][pBanhTrungThu] += banhtrungthu;
						Update(killerid,pBanhTrungThux);
						checkbpquest(killerid,2,6);
						format(string, sizeof(string), "War: Ban da bi giet boi %s voi %s tu khoang cach %0.1fm.", GetName(killerid), wname, disc);
						SendClientMessage(playerid, 0x00E5FFFF, string);
						if(PaintType[playerid] == 0 && PaintType[killerid] == 0) {	
							new Float: Pos[3], sweapon, sammo, idd;
							GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
							for(new i = 0; i < 12; i++) {
								GetPlayerWeaponData(playerid, i, sweapon, sammo); 
								if(sweapon != 0) {
									idd = Iter_Alloc(iPickUp);
									Pickups[idd][psID] = CreateDynamicPickup(WeaponObject(sweapon), 23, Pos[0]+random(4), Pos[1]+random(4), Pos[2], GetPlayerVirtualWorld(playerid));
									Pickups[idd][psWar] = turf;
									Pickups[idd][psType] = 1;
									Pickups[idd][psWeapon] = sweapon;
									Pickups[idd][psAmmo] = sammo;
								}
							}
							idd = Iter_Alloc(iPickUp);
							Pickups[idd][psID] = CreateDynamicPickup(1240, 23, Pos[0]+random(4), Pos[1]+random(4), Pos[2], GetPlayerVirtualWorld(playerid));
							Pickups[idd][psType] = 0;
							Pickups[idd][psWar] = turf;
							Pickups[idd][psWeapon] = 0;
							Pickups[idd][psAmmo] = 0;
							Pickups[idd][psWar] = turf;
							idd = Iter_Alloc(iPickUp);
							Pickups[idd][psID] = CreateDynamicPickup(1212, 23, Pos[0]+random(4), Pos[1]+random(4), Pos[2], GetPlayerVirtualWorld(playerid));
							Pickups[idd][psType] = 2;
							Pickups[idd][psWar] = turf;
							Pickups[idd][psWeapon] = 0;
							Pickups[idd][psAmmo] = 0;
							Pickups[idd][psWar] = turf;	
							Pickups[idd][psAmount] = 10+random(50);	
							idd = Iter_Alloc(iPickUp);
							Pickups[idd][psID] = CreateDynamicPickup(1575, 23, Pos[0]+random(4), Pos[1]+random(4), Pos[2], GetPlayerVirtualWorld(playerid));
							Pickups[idd][psType] = 3;
							Pickups[idd][psWar] = turf;
							Pickups[idd][psWeapon] = 0;
							Pickups[idd][psAmmo] = 0;
							Pickups[idd][psWar] = turf;	
							Pickups[idd][psAmount] = 10+random(50);	
							if(random(100) > 97) {
								new rand = random(3);
								if(rand == 0) sweapon = 34, sammo = 5; // Sniper
								else if(rand == 1) sweapon = 35, sammo = 2; // RPG
								else if(rand == 2) sweapon = 36, sammo = 2; // HS Rocket
								else sweapon = 37, sammo = 200; // Flamethrower

								idd = Iter_Alloc(iPickUp);
								Pickups[idd][psID] = CreateDynamicPickup(WeaponObject(sweapon), 23, Pos[0]+random(4), Pos[1]+random(4), Pos[2], GetPlayerVirtualWorld(playerid));
								Pickups[idd][psWar] = turf;
								Pickups[idd][psType] = 1;
								Pickups[idd][psWeapon] = sweapon;
								Pickups[idd][psAmmo] = sammo;
							}
						}	
						return 1;
					}
				}
			}
		}	
		if(4 < gPlayerCheckpointStatus[playerid] < 11) {
			DisablePlayerCheckpointEx(playerid);
			gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
		}
		if(Mobile[playerid] != 255) {
			if(Mobile[playerid] < 255) {
				SendClientMessage(Mobile[playerid],  COLOR_GRAD2, "Tut tut tut...");
				CellTime[Mobile[playerid]] = 0;
				CellTime[playerid] = 0;
				Mobile[Mobile[playerid]] = 255;
			}
			Mobile[playerid] = 255;
			CellTime[playerid] = 0;
		}
		if(PlayerHit[killerid] == playerid) {
			PlayerPlaySound(killerid,17802,0.0,0.0,0.0);
			
			new wname[30];
			GetWeaponName(reason, wname, sizeof(wname));
			if(reason == 0) wname = "Nam dam";
			
			GivePlayerCash(killerid, HeadValue[playerid]);	
			UsedContract[playerid] = 0;
			PlayerHit[killerid] = -1;
			Contract[playerid] = 0;
			
			if(disc > 99 || reason == 4) {
				format(string, sizeof(string), "* Ban da hoan tat thanh cong hop dong cua minh tren %s(%d). Ban nhan duoc: $%s.", GetName(playerid), playerid, FormatNumber(HeadValue[playerid]));
				SendClientMessage(killerid, COLOR_MONEY, string);
				format(string, sizeof(string), "(!) %s[rank: %d] da khong hoan thanh hop dong %s [khoang cach: %0.1fm][vu khi: %s][that bai]", GetName(killerid), PlayerInfo[killerid][pRank], GetName(playerid), DistanceToPlayer(killerid, playerid), wname);
				if(PhoneOnline[killerid] == 0) FailRaport(killerid, 0);
				if(GetPVarInt(killerid, "Undercover") == 0) FailRaport(killerid, 1);
				if(PhoneOnline[killerid] == 1 && GetPVarInt(killerid, "Undercover") == 1) {
					UpdateFactionRaport(killerid, 0);
					format(string, sizeof(string), "(!) %s[rank: %d] da hoan thanh hop dong tren %s [khoang cach: %0.1fm][vu khi: %s][thanh cong]", GetName(killerid), PlayerInfo[killerid][pRank], GetName(playerid), DistanceToPlayer(killerid, playerid), wname);
					for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
						if(PlayerInfo[killerid][pDailyMission][m] == 15 || PlayerInfo[killerid][pDailyMission][m] == 16) CheckMission(killerid, m);
					}						
				}	
			}	
			else {
				FailRaport(killerid, 3);
				format(string, sizeof(string), "(!) %s[rank: %d] da khong hoan thanh hop dong tren %s [khoang cach: %0.1fm][vu khi: %s][that bai]", GetName(killerid), PlayerInfo[killerid][pRank], GetName(playerid), DistanceToPlayer(killerid, playerid), wname); 
			}	
			SendFactionMessage(11, COLOR_LIGHTBLUE, string);
			HeadValue[playerid] = 0;			
			return 1;
		}		
		if(PlayerInfo[playerid][pClan] != 0 && PlayerInfo[killerid][pClan] != 0) {
			for(new h = 0; h < MAX_CLANZONES; h++) {
				if(IsPlayerInRangeOfPoint(playerid, 20.0, GraffitiInfo[h][gfX], GraffitiInfo[h][gfY], GraffitiInfo[h][gfZ])) return 1;
			}
		}	
		if(InEvent[killerid] == 1 || InWar[PlayerInfo[playerid][pMember]] == 1 || !policeHotline) return 1;
		// printf("-> if(InEvent[killerid] == 1) return 1;");
		new h,m,s;
		gettime(h,m,s);
		if(PaintType[killerid] == 0 && PaintType[killerid] == 0 && InEvent[killerid] == 0 && PlayerInfo[killerid][pJailed] == 0 && !IsACop(killerid) && !IsACop(playerid)) {
			if(PlayerInfo[killerid][pMember] == 0 && PlayerInfo[playerid][pMember] == 0 || PlayerInfo[playerid][pMember] != PlayerInfo[killerid][pMember]) {
				if(ClanDuty[playerid]==1&&ClanDuty[killerid]==1&&19<h<22) {
					killerid = INVALID_PLAYER_ID;
					return 1;
				}
				format(WantedName[playerid], MAX_PLAYER_NAME+10, GetName(killerid));
				WantedReason[playerid] = reason;
				format(string, sizeof(string), "Ban vua bi giet boi %s, va ban co 60 giay de bao canh sat '/call 112'.", GetName(killerid));
				SendClientMessage(playerid,COLOR_WARNING, string);
				WantedTimer[playerid] = defer ClearWanted(playerid);
			}
		}
		killerid = INVALID_PLAYER_ID;
	}
	return 1;
}
public OnVehicleSirenStateChange(playerid, vehicleid, newstate)
{
	if(newstate) {
		FlashTime[vehicleid] = repeat OnLightFlash(vehicleid);
	}
	else {
		new panels, doors, lights, tires;

		stop FlashTime[vehicleid];
		
		GetVehicleDamageStatus(vehicleid, panels, doors, lights, tires);
		UpdateVehicleDamageStatus(vehicleid, panels, doors, 0, tires);
	}
	return 1;
}
public OnVehicleMod(playerid, vehicleid, componentid)
{
    if(GetPlayerInterior(playerid) == 0 && PlayerInfo[playerid][pAdmin] < 1) {
		RemoveVehicleComponent(vehicleid,componentid);
		NightBot(playerid, "Tuning Hack");
		return 1;
    }
 	// new modok = islegalcarmod(GetVehicleModel(vehicleid), componentid);
    // if(!modok) {
	// 	RemoveVehicleComponent(vehicleid,componentid);
	// 	NightBot(playerid, "Invalid components.");
	// 	return 1;
	// }
	if(FindSpawnID(vehicleid) != 0) saveTuning(playerid, vehicleid);
	SetVehicleHealth(vehicleid, 999);
	return 1;
}
public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	new idd = FindSpawnID(vehicleid);
	if(idd != 0) {
		new query[50];
		mysql_format(SQL, query, sizeof(query), "UPDATE cars SET paintjob=%d WHERE id=%d",paintjobid,idd);
		mysql_query(SQL, query, false);
		CarInfo[idd][paintjob] = paintjobid;
	}
	return 1;
}
public OnPlayerSpawn(playerid)
{	
	if(IsPlayerNPC(playerid)) return 1;
	if(IsPlayerLogged[playerid] == 0) { 
    	SendClientMessage(playerid, COLOR_WARNING, "* Xin hay dang nhap truoc.");
    	KickEx(playerid);
		return 1;
 	}
	if(PlayerInfo[playerid][pEscape] != 0) {
		if(IsValidDynamicPickup(PlayerInfo[playerid][pEscapeP])) DestroyDynamicPickup(PlayerInfo[playerid][pEscapeP]);
		if(IsValidDynamic3DTextLabel(PlayerInfo[playerid][pEscapeT])) DestroyDynamic3DTextLabel(PlayerInfo[playerid][pEscapeT]);
		if(PlayerInfo[playerid][pEscapeCar] != 0) DestroyVehicle(PlayerInfo[playerid][pEscapeCar]), PlayerInfo[playerid][pEscapeCar] = 0;
		// PlayerTextDrawHide(playerid, WantedTime); // but JailTD
		if(PlayerInfo[playerid][pEscape] == 2) {
			if(PlayerInfo[playerid][pWantedLevel]+5 > 6) PlayerInfo[playerid][pWantedLevel] = 6;
			else PlayerInfo[playerid][pWantedLevel] += 5;
			SetPlayerCriminal(playerid, 255, "Vuot nguc");
			ShowWanted[playerid] = 1;		
		}
		PlayerInfo[playerid][pEscape] = 0;
		PlayerInfo[playerid][pEscapeTime] = 0;
		SendClientMessage(playerid, 0xffc301ff, "Ban da roi khoi xe, vuot nguc that bai va ban bi truy na 5 sao.");
	} 	
	SendClientMessage(playerid, COLOR_NEUTRALGREEN, "Hien tai server dang co 2 event [/trungthu] va [/1thang]!");
	Iter_Remove(IsSpeed, playerid);	
	Team[playerid] = 0;
	SetPlayerHealthEx(playerid, 99);
    SetPlayerArmourEx(playerid, 0);	
    AttachPlayerReputation3DText(playerid);
	Update3DTextLabelText(adminLabel[playerid], -1, "");
	if(Escape[playerid] == 1) FailEscape(playerid);
	playerKills[playerid] = 0;
	PlayerTextDrawHide(playerid, Speedo[0]);
	PlayerTextDrawHide(playerid, Speedo[1]);
	TextDrawHideForPlayer(playerid, Speedo4);
	Update3DTextLabelText(deathLabel[playerid], -1, "");
	if(GetPVarInt(playerid, "PlayMine") == 1) HideCasinoTDs(playerid);
	SetPlayerWeather(playerid, ServerWeather);
	ResetWeapons(playerid);
	SetPlayerWorldBounds(playerid, 20000.0000, -20000.0000, 20000.0000, -20000.0000);
	StopAudioStreamForPlayer(playerid);
    SetPlayerWantedLevel(playerid, PlayerInfo[playerid][pWantedLevel]);
    SetPlayerScore(playerid, PlayerInfo[playerid][pLevel]);
	SetPlayerToTeamColor(playerid);	
	SetPlayerTeam(playerid,4);
	InTraining[playerid] = 0;
	DeletePVar(playerid, "ChoDoi");
	SetPVarInt(playerid,"KilledFlood",0);
	Armour[playerid] = 0;
	SetPVarInt(playerid, "Armour", 0);
	pFishing[playerid] = 0;
	DisableRemoteVehicleCollisions(playerid, 0);
	TurfTime[playerid] = 0;
    HaveBag[playerid] = 0;
    Freezed[playerid] = 0;	
	PlayRadio[playerid] = 0;
	InEvent[playerid] = 0;
	playerDeath[playerid] = 0;
	SetPlayerAttachedObject(playerid, 7, 3534, 6,  -0.139999, -0.049000, 0.504998,  0.000000, -89.199508, 49.200016,  0.246001, 0.304001, 0.269003); // 265
	SetPlayerAttachedObject(playerid, 8, 18632, 6,  0.085999, 0.034999, 0.042999,  0.000000, 155.999877, -46.100006,  0.998000, 1.000000, 0.339999); // 265

	for(new i = 0; i<= 6; i++)
	{
		PlayerInfo[playerid][pSungGang][i] = 0;
	}
	if(DrivingTest[playerid] == 1) {	
		DMV_End(playerid, 1);
		GUI_DestroyCurrentUI(playerid);
	}
	if(FreezeTime[playerid] != 0) TogglePlayerControllable(playerid, false);
	if(Iter_Contains(PlayerInRace, playerid)) LeaveRaceArena(playerid);
	if(GetPVarInt(playerid, "InLesson") != -1) {
		new id = GetPVarInt(playerid, "InLesson"), string[180];
		format(string, sizeof(string), "Bai hoc da bi huy vi %s da chet.", GetName(playerid));
		SendClientMessage(id, COLOR_LIGHTBLUE,string);
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "Da huy bai hoc!");
		SetPVarInt(id, "InLesson", -1);
		SetPVarInt(playerid, "InLesson", -1);		
	}
    foreach(new i: PlayerHelpers) {
		if(Spectate[i] == playerid) {
			TogglePlayerSpectating(i, true);
			SetPlayerInterior(i, GetPlayerInterior(playerid));
			SetPlayerVirtualWorld(i, GetPlayerVirtualWorld(playerid));
			PlayerSpectatePlayer(i, playerid);		
		}
	}
    foreach(new i: PlayerAdmins) {
		if(Spectate[i] == playerid) {
			TogglePlayerSpectating(i, true);
			SetPlayerInterior(i, GetPlayerInterior(playerid));
			SetPlayerVirtualWorld(i, GetPlayerVirtualWorld(playerid));
			PlayerSpectatePlayer(i, playerid);		
		}
	}
	if(gDice[playerid] == 1) SendClientMessage(playerid, -1, "Ban bi mat xuc xac."), gDice[playerid] = 0;
	if(InRob[playerid] == 1) FailRob(playerid, "Ban da chet");
	TextDrawHideForPlayer(playerid, EventCS);
	if(JobWorking[playerid] == 1) {
		JobWorking[playerid] = 0;
		PlayerTextDrawHide(playerid, JobTD);
		if(JobVehicle[playerid] != 0) { DestroyVehicle(JobVehicle[playerid]); JobVehicle[playerid] = 0; }
		if(Trailer[playerid] != 0) { DestroyVehicle(Trailer[playerid]); Trailer[playerid] = 0; }
		PlayerTextDrawHide(playerid, InfosTD);
		DisablePlayerCheckpointEx(playerid);
		CP[playerid] = 0;
		JobVehicle[playerid] = 0;
		DisablePlayerRaceCheckpointEx(playerid);
		RemovePlayerAttachedObject(playerid, 2);
	}
	if(CP[playerid] == 51) {
		SendClientMessage(playerid, -1, "Ban bi mat tui bot.");
		CP[playerid] = 0;
		KG[playerid] = 0;
		DisablePlayerCheckpointEx(playerid);
	}
	if(PlayerInfo[playerid][pShowHud] == 0) {
		TextDrawShowForPlayer(playerid, TimeTD[0]);
		TextDrawShowForPlayer(playerid, TimeTD[1]);
		TextDrawShowForPlayer(playerid, TimeTD[2]);
		// TextDrawShowForPlayer(playerid, Logo[3]);
		TextDrawShowForPlayer(playerid, HeartTD);
	}
    if(EditHouse[playerid] == 1) DestroyDynamicObject(ObjectEdited[playerid]), SendClientMessage(playerid, -1, "Chinh sua/tao do noi that da bi huy."), EditHouse[playerid] = 0;
    else if(EditHouse[playerid] == 2) SendClientMessage(playerid, -1, "Chinh sua/tao do noi that da bi huy."), EditHouse[playerid] = 0;   
	if(UsedFly[playerid] == 1) {
		StopFly(playerid);
		UsedFly[playerid] = 0;
	}
	if(InShop[playerid] == 1) {
		new carid = pCarID[playerid];
    	SetCameraBehindPlayer(playerid), SetPlayerInterior(playerid, pInteriorID[playerid]), SetVehiclePosEx(playerid, carid, pPos[playerid][0], pPos[playerid][1], pPos[playerid][2]);
		SetPlayerVirtualWorld(playerid, 0);
		SetVehicleVirtualWorld(carid, 0);
		TextDrawHideForPlayer(playerid, HiddTD[0]);
		TextDrawHideForPlayer(playerid, HiddTD[1]);
		TextDrawHideForPlayer(playerid, HiddTD[2]);
		TextDrawHideForPlayer(playerid, HiddTD[3]);
		TextDrawHideForPlayer(playerid, HiddTD[4]);
		PlayerTextDrawHide(playerid, HiddTDs[0]);
		PlayerTextDrawHide(playerid, HiddTDs[1]);
		PlayerTextDrawHide(playerid, HiddTDs[2]);
		CancelSelectTextDraw(playerid);
		InShop[playerid] = 0;
	}
	if(StartedSpray[playerid] == 1 || ClanDuty[playerid] == 1) {
		SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong con onduty clan nua!");
		GraffitiInfo[StartedSpray2[playerid]][gfAttacked] = 0;
		StartedSpray[playerid] = 0;
		StartedSpray2[playerid] = 0;
		StartedSprayOn[playerid] = 0;
		ClanProces[playerid] = 0;
		ClanDuty[playerid] = 0;
		GraffitiInfo[StartedSprayOn[playerid]][gfAttacked] = 0;
	}
	if(PlayerInfo[playerid][pShowCeas] == 1 && PlayerInfo[playerid][pReg] != 0) {
		TextDrawShowForPlayer(playerid, TimeTD[0]);
		TextDrawShowForPlayer(playerid, TimeTD[1]);
		TextDrawShowForPlayer(playerid, TimeTD[2]);
		// TextDrawShowForPlayer(playerid, Logo[3]);
	}
	gTeam[playerid] = PlayerInfo[playerid][pTeam];
	if(gTeam[playerid] == 4) gTeam[playerid] = 4;
	if(PlayerInfo[playerid][pMember] == 1 || PlayerInfo[playerid][pLeader] == 1 || PlayerInfo[playerid][pMember] == 2 || PlayerInfo[playerid][pLeader] == 2 || PlayerInfo[playerid][pMember] == 3 || PlayerInfo[playerid][pLeader] == 3) {
		gTeam[playerid] = 2;
		PlayerInfo[playerid][pTeam] = 2;
	}
	if(PaintType[playerid] != 0) return PaintSpawn(playerid);
	if(OnDuty[playerid] == 1 && IsACop(playerid)) {
		ServerWeapon(playerid, 24, 500);
		ServerWeapon(playerid, 3, 0);
		ServerWeapon(playerid, 41, 500);
		ServerWeapon(playerid, 29, 1000);
		ServerWeapon(playerid, 31, 1000);
		SetPlayerArmourEx(playerid, 99);
		SetPlayerHealthEx(playerid, 99);	
	}	
	if(PlayerInfo[playerid][pBackpack] == 2) SetPlayerAttachedObject( playerid, 8, 3026, 1, -0.172813, -0.112569, -0.022387, 0.000000, 0.000000, 3.390071, 1.000000, 1.000000, 1.130721);
	SetPlayerSpawn(playerid);
	
	if(GetPVarInt(playerid, "Cover") == 1) {
		SetPlayerColor(playerid, -1);
		SetPlayerColor(playerid, COLOR_WHITE);
		SetPlayerScore(playerid, 1+random(2));
		SetPlayerSkinEx(playerid, 1+random(100));
		SendClientMessage(playerid, COLOR_YELLOW, "Ban dang cai trang!");
	}		
	Resetnametag(playerid);
	return 1;
}
public OnPlayerEnterRaceCheckpoint(playerid)
{
	if(ServerSystem[10] == 0 && !IsPlayerInRangeOfPoint(playerid, 50, LastPos[playerid][0], LastPos[playerid][1], LastPos[playerid][2]) && UsedFind[playerid] == 0 && targetfind[playerid] == -1 && !Iter_Contains(PlayerInRace, playerid)) return NightBot(playerid, "Cheats (checkpoint-teleport)");
	if(Iter_Contains(PlayerInRace, playerid)) {
		RaceCP[playerid] ++;
		RacePlaces[RaceCP[playerid]] ++;
		playerRacePlace[playerid] = RacePlaces[RaceCP[playerid]];
		if(RaceCP[playerid] == RaceCheckpoints()) return FinishMap(playerid);
		SetRaceCP(playerid);
	}
	
	if(CP[playerid] == 99) {
	   DisablePlayerCheckpointEx(playerid);
	   CP[playerid] = 0;
	}
    switch(CP[playerid]) {
		case 159: {
			if(!IsPlayerInAnyVehicle(playerid)) return 1;
			CP[playerid] ++;
			SetPlayerRaceCheckpointEx(playerid, 4, 1337.7225,-2458.1738,52.1955,1068.9011,-1998.5757,110.3633, 5.0);
		}
		case 160: {
			if(!IsPlayerInAnyVehicle(playerid)) return 1;
			CP[playerid] ++;
			SetPlayerRaceCheckpointEx(playerid, 4, 1068.9011,-1998.5757,110.3633,1248.2017,-1089.9178,126.1693, 5.0);
		}	
		case 161: {
			if(!IsPlayerInAnyVehicle(playerid)) return 1;
			CP[playerid] ++;
			SetPlayerRaceCheckpointEx(playerid, 4, 1248.2017,-1089.9178,126.1693,1262.6804,-359.7021,125.8077, 5.0);
		}	
		case 162: {
			if(!IsPlayerInAnyVehicle(playerid)) return 1;
			CP[playerid] ++;
			SetPlayerRaceCheckpointEx(playerid, 4, 1262.6804,-359.7021,125.8077,1354.6277,185.5372,126.3102, 5.0);
		}	
		case 163: {
			if(!IsPlayerInAnyVehicle(playerid)) return 1;
			CP[playerid] ++;
			SetPlayerRaceCheckpointEx(playerid, 4, 1354.6277,185.5372,126.3102,1469.2338,856.8419,73.3954, 5.0);
		}	
		case 164: {
			if(!IsPlayerInAnyVehicle(playerid)) return 1;
			CP[playerid] ++;
			SetPlayerRaceCheckpointEx(playerid, 4, 1469.2338,856.8419,73.3954,1477.5388,1444.2805,11.7513, 5.0);
		}	

		case 165: {
			if(!IsPlayerInAnyVehicle(playerid)) return 1;
			CP[playerid] ++;
			SetPlayerRaceCheckpointEx(playerid, 4, 1477.5388,1444.2805,11.7513,1389.3634,1615.9071,11.7527, 5.0);
		}	
		case 166: {
			if(!IsPlayerInAnyVehicle(playerid)) return 1;
			CP[playerid] ++;
			SetPlayerRaceCheckpointEx(playerid, 4, 1389.3634,1615.9071,11.7527,1381.7755,1238.9287,35.4809, 5.0);
		}	
		case 167: {
			if(!IsPlayerInAnyVehicle(playerid)) return 1;
			CP[playerid] ++;
			SetPlayerRaceCheckpointEx(playerid, 4, 1381.7755,1238.9287,35.4809,1350.0398,829.1030,91.8478, 5.0);
		}	
		case 168: {
			if(!IsPlayerInAnyVehicle(playerid)) return 1;
			CP[playerid] ++;
			SetPlayerRaceCheckpointEx(playerid, 4, 1350.0398,829.1030,91.8478,1251.3011,235.3953,113.0084, 5.0);
		}	
		case 169: {
			if(!IsPlayerInAnyVehicle(playerid)) return 1;
			CP[playerid] ++;
			SetPlayerRaceCheckpointEx(playerid, 4, 1251.3011,235.3953,113.0084,1161.8298,-439.5165,142.3422, 5.0);
		}	

		case 170: {
			if(!IsPlayerInAnyVehicle(playerid)) return 1;
			CP[playerid] ++;
			SetPlayerRaceCheckpointEx(playerid, 4, 1161.8298,-439.5165,142.3422,1033.0001,-918.2105,146.7412, 5.0);
		}	
		case 171: {
			if(!IsPlayerInAnyVehicle(playerid)) return 1;
			CP[playerid] ++;
			SetPlayerRaceCheckpointEx(playerid, 4, 1033.0001,-918.2105,146.7412,817.0712,-1571.2627,105.0100, 5.0);
		}	
		case 172: {
			if(!IsPlayerInAnyVehicle(playerid)) return 1;
			CP[playerid] ++;
			SetPlayerRaceCheckpointEx(playerid, 4, 817.0712,-1571.2627,105.0100,854.5660,-2107.3997,73.8536, 5.0);
		}	
		case 173: {
			if(!IsPlayerInAnyVehicle(playerid)) return 1;
			CP[playerid] ++;
			SetPlayerRaceCheckpointEx(playerid, 4, 854.5660,-2107.3997,73.8536,1156.9110,-2464.0076,51.5708, 5.0);
		}	
		case 174: {
			if(!IsPlayerInAnyVehicle(playerid)) return 1;
			CP[playerid] ++;
			SetPlayerRaceCheckpointEx(playerid, 4, 1156.9110,-2464.0076,51.5708,1691.7114,-2592.8950,14.4685, 5.0);
		}	
		case 175: {
			if(!IsPlayerInAnyVehicle(playerid)) return 1;
			CP[playerid] ++;
			SetPlayerRaceCheckpointEx(playerid, 3,1691.7114,-2592.8950,14.4685,1691.7114,-2592.8950,14.4685, 5.0);
		}	
				
		case 176: {
			if(!IsPlayerInAnyVehicle(playerid)) return 1;
			DisablePlayerCheckpointEx(playerid);
			DisablePlayerRaceCheckpointEx(playerid);
			CP[playerid] = 0;
			if(toghuman == 1) givejobsalaryhuman(playerid);
			else GiveJobSalary(playerid);
			PlayerInfo[playerid][pPilotSkill] ++;
			Update(playerid, pPilotSkillx);
			DestroyVehicle(JobVehicle[playerid]);
			JobVehicle[playerid] = 0, JobWorking[playerid] = 0;
			PlayerTextDrawHide(playerid, JobTD);
		}
	}
	PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);	
	if(JobWorking[playerid] == 1 && PlayerInfo[playerid][pShowJob] == 1 && PlayerInfo[playerid][pShowHud] == 0) UpdateJobStats(playerid);  
    return 1;
}
public OnRconLoginAttempt(ip[], password[], success)
{
    if(!success)
    {
		new pip[16],string[256],name[25];
		foreach(new i: Player)
		{
			GetPlayerIp(i, pip, sizeof(pip));
			if(!strcmp(ip, pip, true))
		   	{
				GetPlayerName(i, name, sizeof(name));
				format(string,sizeof(string),"Notice: {FFFFFF}%s da nhap pass RCON sai (IP: %s).",name,ip);
				SendAdminMessage(COLOR_WARNING,string,3);
				KickEx(i);
				return 1;
			}
		}
    }
    // else
    // {
	// 	new pip[16],string[256],name[25];
	// 	foreach(new i: Player)
	// 	{
	// 		GetPlayerIp(i, pip, sizeof(pip));
	// 		if(!strcmp(ip, pip, true))
	// 	   	{
	// 			GetPlayerName(i, name, sizeof(name));
	// 			format(string,sizeof(string),"Notice: {FFFFFF}%s (%d) da dang nhap vao RCON (IP: %s).",name,i,ip);
	// 			SendAdminMessage(COLOR_WARNING,string,3);
	// 			return 1;
	// 		}
	// 	}
	// }
    return 1;
}
public OnPlayerEnterCheckpoint(playerid)
{
	if(ServerSystem[10] == 0){
		if(!IsPlayerInRangeOfPoint(playerid, 50, LastPos[playerid][0], LastPos[playerid][1], LastPos[playerid][2]) && 
			CP[playerid] != 43 && UsedFind[playerid] == 0 && targetfind[playerid] == -1) {
			if(JobWorking[playerid] == 1){
				if(PlayerInfo[playerid][pJob] == 10 || PlayerInfo[playerid][pJob] == 14) {}
					else return NightBot(playerid, "Cheats (checkpoint teleport)");
			}
		}
	}

	new string[256];
	if(TaxiCallTime[playerid] > 0 && TaxiAccepted[playerid] < 999) {
		TaxiAccepted[playerid] = 999;
		TaxiCallTime[playerid] = 0;
		DisablePlayerCheckpointEx(playerid);
	}
	else if(MedicCallTime[playerid] > 0) {
		MedicCallTime[playerid] = 0;
		DisablePlayerCheckpointEx(playerid);
	}
	else if(MechanicCallTime[playerid] > 0) {
		MechanicCallTime[playerid] = 0;
		DisablePlayerCheckpointEx(playerid);
	}
	else if(CP[playerid] == 34)  {
		if(!IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid))) return 1;
		DisablePlayerCheckpointEx(playerid);
		CP[playerid] = 0;
		new towedcar = GetVehicleTrailer(GetPlayerVehicleID(playerid));
		new idd = FindSpawnID(towedcar);
		//if(idd == 0) return 1;

		new Float: Pos[3];
		GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);		
		if(idd == 0) format(string, sizeof(string), "**(( TTC Dispatch: Tow Truck Member %s (%d) keo xe %d. [hp: %0.2f] ))**", GetName(playerid), playerid, towedcar, GetPVarFloat(playerid, "VehHP"));
		else format(string, sizeof(string), "**(( TTC Dispatch: Tow Truck Member %s (%d) keo xe %d. [veh: %d][hp: %0.2f] ))**", GetName(playerid), playerid, towedcar, idd, GetPVarFloat(playerid, "VehHP"));
		SendFactionMessage(TOWTRUCK_FACTION_ID, COLOR_LIGHTBLUE, string);
		
		if(idd != 0) {
			VehicleOwned[CarInfo[idd][Spawned]] = 0;
			VehicleSQL[CarInfo[idd][Spawned]] = 0;
		
			DestroyVehicle(CarInfo[idd][Spawned]);
			if(CarInfo[idd][cNeon] != 0) {
				DestroyDynamicObject(neon[0][CarInfo[idd][Spawned]]);
				DestroyDynamicObject(neon[1][CarInfo[idd][Spawned]]);
				neon[0][CarInfo[idd][Spawned]] = 0;
				neon[1][CarInfo[idd][Spawned]] = 0;	
			}	
			if(strlen(CarInfo[idd][cText]) >= 3) DestroyDynamicObject(nameobject[CarInfo[idd][Spawned]]);
			CarInfo[idd][Spawned] = 0;
			CarInfo[idd][Confiscated] = 1;
			new query[256];
			format(query, sizeof(query), "UPDATE `cars` SET `Confiscated`='1' WHERE `ID`='%d'", idd);
			mysql_query(SQL, query);
			foreach(new i: Player) {
				if(PlayerInfo[i][pSQLID] == CarInfo[idd][Userid]) SendClientMessage(i, COLOR_YELLOW, "SMS tu TTC: Mot trong nhung chiec xe cua ban vua bi keo di vi dau bat hop phap. Ban co the tra tien phat de lay xe minh ve /v - [vehicle] - Tra tien phat");
			}				
		}
		else SetVehicleToRespawn(towedcar);
		
		new money = 1000 + random(100);
		GivePlayerCash(playerid, money);
		format(string, sizeof(string), "Ban nhan duoc $%s cho cong suc keo xe!", FormatNumber(money));
		SendClientMessage(playerid,COLOR_MONEY,string);
		Update(playerid, pCashx);
		//UpdateJobGoal(money, MAXGOAL);
		
		UpdateFactionRaport(playerid, 0);
		
		for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
			if(PlayerInfo[playerid][pDailyMission][m] == 15 || PlayerInfo[playerid][pDailyMission][m] == 16) CheckMission(playerid, m);
		}			
	}
	else if(CP[playerid] == 43 || CP[playerid] == 53) {	
		CP[playerid] = 0;
		PlayerTextDrawHide(playerid, FindTD);
		targetfind[playerid] = -1;
		AcceptedService[playerid] = -1;
		DisablePlayerCheckpointEx(playerid);
	}
	else if(CP[playerid] == 50) {
    	new cashr = 100000 + random(100000);
		PlayerInfo[playerid][pRobSkill] += 1;
    	DisablePlayerCheckpointEx(playerid);
		GivePlayerCash(playerid, cashr);
		format(string, sizeof(string), "Ban nhan duoc $%s!", FormatNumber(cashr));
		SendClientMessage(playerid, COLOR_YELLOW, string);
		CP[playerid] = 0;
		Update(playerid, pCashx);
		Update(playerid, pRobSkillx);
		RemovePlayerAttachedObject(playerid,0);
		RemovePlayerAttachedObject(playerid,1);
	}
	else {
		switch (gPlayerCheckpointStatus[playerid]) {
			case CHECKPOINT_LOCATE: {
				DisablePlayerCheckpointEx(playerid);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
			}
		}
	}
	switch(CP[playerid]) {
		case 51: {
			DisablePlayerCheckpointEx(playerid);
			CP[playerid] = 0;
			new rand = KG[playerid] * 14 + 82 * GetPlayerSkill(playerid);
			format(string, sizeof(string), "Chuc mung! Ban nhan duoc $%s cho cong viec da hoan thanh.", FormatNumber(rand));
			SendClientMessage(playerid, COLOR_MONEY, string);
			GivePlayerCash(playerid, rand);
			PlayerInfo[playerid][pFarmerSkill] ++;
			Update(playerid, pFarmerSkillx);
			if(PlayerInfo[playerid][pFarmerSkill] == 50)
			{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cua ban tai cong viec Farmer bay gio la 2. Ban se nhan duoc nhieu tien hon."); }
			else if(PlayerInfo[playerid][pFarmerSkill] == 100)
			{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cua ban tai cong viec Farmer bay gio la 3. Ban se nhan duoc nhieu tien hon."); }
			else if(PlayerInfo[playerid][pFarmerSkill] == 200)
			{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cua ban tai cong viec Farmer bay gio la 4. Ban se nhan duoc nhieu tien hon."); }
			else if(PlayerInfo[playerid][pFarmerSkill] == 400)
			{ SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang cua ban tai cong viec Farmer bay gio la 5. Ban se nhan duoc nhieu tien hon."); }
			DestroyVehicle(JobVehicle[playerid]);
			JobVehicle[playerid] = 0, JobWorking[playerid] = 0;
			PlayerTextDrawHide(playerid, JobTD);
			KG[playerid] = 0;
			//UpdateJobGoal(rand, MAXGOAL);
			for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
				if(PlayerInfo[playerid][pDailyMission][m] == 4) CheckMission(playerid, m);
			}			
		}
		case 52: {
			if(!IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid))) return SendClientMessage(playerid, COLOR_GREY, "Ban khong mang theo xe hang.");
			DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
			Trailer[playerid] = 0;
			DisablePlayerCheckpointEx(playerid);
			new szDialog2[1024], string2[218];				
			strcat(szDialog2, "Danh muc\tThe loai\tKy nang\n");
			strcat(szDialog2, "Quan ao\t{35DE1F}Hop phap\t1+\n");
			strcat(szDialog2, "Thuc an\t{35DE1F}Hop phap\t1+\n");
			strcat(szDialog2, "Do noi that\t{35DE1F}Hop phap\t1+\n");
			strcat(szDialog2, "Chat no\t{35DE1F}Hop phap\t2+\n");
			strcat(szDialog2, "Sung\t{F31313}Bat hop phap\t3+\n");
			strcat(szDialog2, "Xe bi trom\t{F31313}Bat hop phap\t3+\n");
			strcat(szDialog2, "Banh Trung Thu\t{35DE1F}Hop phap\t1+\n");
			Dialog_Show(playerid, DIALOG_TRUCKER, DIALOG_STYLE_TABLIST_HEADERS, "Chon diem den", szDialog2, "Select", "Cancel");
			PlayerInfo[playerid][pTrungThuJob][2] += 1;
			save_ttj(playerid);
			CP[playerid] = 0;
			if(WorkingTime[playerid] > 20) {
				PlayerInfo[playerid][pTruckerSkill] ++;
				Update(playerid, pTruckerSkillx);
			}
			if(WorkingTime[playerid] < 60) {
				format(string2, sizeof(string2), "[A-ANTI]: %s[%d] co the dang AFK job trucker vui long check!", GetName(playerid),playerid);
                GuiDenAdminVaHelper(COLOR_YELLOW, string2, 1); 
			}
			else if(WorkingTime[playerid] > 120) {
				format(string2, sizeof(string2), "[A-ANTI]: %s[%d] co the dang treo de duoc nhieu tien job trucker vui long check!", GetName(playerid),playerid);
                GuiDenAdminVaHelper(COLOR_YELLOW, string2, 1); 
			}
			if(toghuman == 1) givejobsalaryhuman(playerid);
			else GiveJobSalary(playerid);
		}
		case 60: {
			PlayerInfo[playerid][pJackerSkill] ++;
			Update(playerid, pJackerSkillx);
			if(toghuman == 1) givejobsalaryhuman(playerid);
			else GiveJobSalary(playerid);
			DisablePlayerCheckpointEx(playerid);
			CP[playerid] = 0;
			JobWorking[playerid] = 0;			
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));	
			JobDeelay[playerid][PlayerInfo[playerid][pJob]] = 100;	
					
		}
		case 56: {
			DisablePlayerCheckpointEx(playerid);
			CP[playerid] = 0;
			new salar = 96*GetPlayerSkill(playerid);
			format(string, sizeof(string), "%s da nhan duoc $%s cho cong viec %s.", GetName(playerid), FormatNumber(salar), JobInfo[PlayerInfo[playerid][pJob]][jName]);
			Log("logs/jobmoney.log", string);			
			format(string, sizeof(string), "(+) Ban nhan duoc $%s cho cong viec do ban thuc hien.", FormatNumber(salar));
			SendClientMessage(playerid, COLOR_MONEY, string);
			format(string, sizeof(string), "~g~+$%s", FormatNumber(salar));
			GameTextForPlayer(playerid, string, 1000, 1);
			//UpdateJobGoal(salar, MAXGOAL);
			GivePlayerCash(playerid, salar);
			GunoiKG[playerid] = 0;
			PlayerInfo[playerid][pFarmerSkill] ++;
			Update(playerid, pFarmerSkillx);
			DestroyVehicle(JobVehicle[playerid]);
			JobVehicle[playerid] = 0, JobWorking[playerid] = 0;
			PlayerTextDrawHide(playerid, JobTD);
		}
		case 57: {
			PlayerTextDrawSetString(playerid, InfosTD, "Dang tai...");
			defer HideTextdraw[6500](playerid);
			PlayerTextDrawShow(playerid, InfosTD);	
			TogglePlayerControllable(playerid, false);
			defer UnFreezeStation2(playerid);
			DisablePlayerCheckpointEx(playerid);
			CurseFacute[playerid] = 0;
			MoneyEarned[playerid] = 0;	
			WorkingTime[playerid] = 0;
		}
		case 58: {
			if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the gui buu kien tu mot chiec xe!");
			if(GetPVarInt(playerid, "InHand") == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong co buu kien! De co duoc no, di phia sau chiec xe va nhan Y.");
			SetPVarInt(playerid, "InHand", 0);
			new j = Iter_Random(House);
			if(j == 0) j = 1;
			SetPlayerCheckpointEx(playerid, HouseInfo[j][hEntrancex],HouseInfo[j][hEntrancey],HouseInfo[j][hEntrancez], 7.0);
			CP[playerid] = 58;
			format(string, sizeof(string), "Di den diem mau ~r~~h~do~w~~h~ tren ban do de giao buu kien.~n~De lay buu kien, nhan phim Y phia sau xe!~n~Khoang cach: ~y~%0.1fm.", GetPlayerDistanceFromPoint(playerid, HouseInfo[j][hEntrancex],HouseInfo[j][hEntrancey],HouseInfo[j][hEntrancez]));
			PlayerTextDrawSetString(playerid, InfosTD, string);
			defer HideTextdraw(playerid);
			PlayerTextDrawShow(playerid, InfosTD);	
			PlayerInfo[playerid][pCurierSkill] ++;
			Update(playerid, pCurierSkillx);
			if(toghuman == 1) givejobsalaryhuman(playerid);
			else GiveJobSalary(playerid);
			RemovePlayerAttachedObject(playerid, 6);
			SetPlayerSpecialAction(playerid, 0);
			ClearAnimations(playerid);			
		}
		case 59: {
			SetPVarInt(playerid, "Pressed", 0);
			SetPVarInt(playerid, "Trees", 0);
			SetPVarInt(playerid, "JobStep", 0);				
			SetPVarInt(playerid, "InHand", 0);	
			
			DisablePlayerCheckpointEx(playerid);
			PlayerInfo[playerid][pWoodSkill] ++;
			UpdateVar(playerid, "MowerSkill", PlayerInfo[playerid][pWoodSkill]);
			if(toghuman == 1) givejobsalaryhuman(playerid);
			else GiveJobSalary(playerid);
			DestroyWoodObject(playerid);
			CP[playerid] = 53;
			SendClientMessage(playerid, COLOR_YELLOW, "Quay lai va lam viec tiep neu ban muon lam viec lai.");
			SetPlayerCheckpointEx(playerid, -1966.2852,-2442.2708,30.6250, 7.0);			
		}
		case 112: {
			if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the gui buu kien tu mot chiec xe!");
			if(GetPVarInt(playerid, "PaperHand") == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong co bao! De co duoc no, di bang xe dap va nhan Y.");
			SetPVarInt(playerid, "PaperHand", 0);
			new randcp = RandomEx(1, Iter_Count(House) + 1);
			while(GetCity1(HouseInfo[randcp][hEntrancex],HouseInfo[randcp][hEntrancey]) != 3 || GetPlayerDistanceFromPoint(playerid, HouseInfo[randcp][hEntrancex], HouseInfo[randcp][hEntrancey], HouseInfo[randcp][hEntrancez]) < 200.0) {
				randcp = RandomEx(1, Iter_Count(House) + 1);
			}
			JobCP[playerid] = randcp;
			SetPlayerCheckpointEx(playerid, HouseInfo[JobCP[playerid]][hEntrancex], HouseInfo[JobCP[playerid]][hEntrancey], HouseInfo[JobCP[playerid]][hEntrancez], 5.0);
			CP[playerid] = 112;
			format(string, sizeof(string), "Di den diem mau ~r~~h~do~w~~h~ tren ban do de cung cap bao.~n~De lay bao, nhan phim Y ben canh xe dap~n~Khoang cach: ~y~%0.1fm.", GetPlayerDistanceFromPoint(playerid, HouseInfo[JobCP[playerid]][hEntrancex], HouseInfo[JobCP[playerid]][hEntrancey], HouseInfo[JobCP[playerid]][hEntrancez]));
			PlayerTextDrawSetString(playerid, InfosTD, string);
			defer HideTextdraw(playerid);
			PlayerTextDrawShow(playerid, InfosTD);	
			PlayerInfo[playerid][pNewsPaperSkill] ++;
			Update(playerid, pNewsPaperSkillx);
			if(toghuman == 1) givejobsalaryhuman(playerid);
			else GiveJobSalary(playerid);
			RemovePlayerAttachedObject(playerid, 6);
			SetPlayerSpecialAction(playerid, 0);
			ClearAnimations(playerid);
		}
		case 113: {
			if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the gui buu kien tu mot chiec xe!");
			SetPlayerCheckpointEx(playerid, STOREHOUSE, 5.0);
			CP[playerid] = 53;
			format(string, sizeof(string), "Di den diem mau ~r~~h~do~w~~h~ tren ban do de giao tao.~n~Khoang cach: ~y~%0.1fm.", GetPlayerDistanceFromPoint(playerid, STOREHOUSE));
			PlayerTextDrawSetString(playerid, InfosTD, string);
			defer HideTextdraw(playerid);
			PlayerTextDrawShow(playerid, InfosTD);	
			PlayerInfo[playerid][pTrungThuJob][5] += 1;
			save_ttj(playerid);
			if(toghuman == 1) givejobsalaryhuman(playerid);
			else GiveJobSalary(playerid);
			RemovePlayerAttachedObject(playerid, 6);
			SetPlayerSpecialAction(playerid, 0);
			ClearAnimations(playerid);
		}
		case 169: {	
			DisablePlayerCheckpointEx(playerid);
			CP[playerid] = 0;
			if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return FailRob(playerid, "Ban khong lai xe.");
			if(!IsPlayerInAnyVehicle(playerid)) return FailRob(playerid, "Ban khong o trong xe.");
			if(LastRVehicle[playerid] != GetPlayerVehicleID(playerid)) return FailRob(playerid, "Xe khac voi xe ma ban dat tui tien len.");
			new cash = Bags[playerid] * 250000 + random(1000);
			GivePlayerCash(playerid, cash);
			format(string, sizeof(string), "* Rua tien thanh cong. Ban nhan duoc $%s.", FormatNumber(cash));
			SendClientMessage(playerid, COLOR_MONEY, string);
			InRob[playerid] = 0;
			BizRobbed[playerid] = 0;
			HaveBag[playerid] = 0;
			Bags[playerid] = 0;
			SafeRTime[playerid] = 0;
			RemovePlayerAttachedObject(playerid,0);
			RemovePlayerAttachedObject(playerid,1);	
			BagTime[playerid] = 0;			
		}	
		case 155: {
			if(ServerSystem[22] == 1) {
				SendClientMessage(playerid, COLOR_YELLOW, "Cua hang pizza da dong cua, hay tro lai vao luc 7 gio sang de lam viec");
				DisablePlayerCheckpointEx(playerid);
				CP[playerid] = 0;
				return 1;
			}
			SetPlayerCheckpointEx(playerid, 0,0,0, 0.0);
			TogglePlayerControllable(playerid, false);
			
			new car = GetClosestVehicle(playerid);
			new string2[128];
        	if(!IsPlayerNearVehicle(playerid, car, 30) || GetVehicleModel(car) != 448) {
                //SendClientMessage(playerid, -1, "Ban khong su dung xe pizzaboy de giao banh!");
                format(string2, sizeof(string2), "[A-ANTI]: %s[%d] co the dang su dung xe khac de giao pizza vui long check! (ModelID : %d) ", GetName(playerid),playerid, GetVehicleModel(car));
                Log("logs/jobmoney.log", string2);	
				GuiDenAdminVaHelper(COLOR_YELLOW, string2, 1); 
            }	
			new Float:x, Float:y, Float:z;
			GetPlayerPos(playerid, x, y, z);
			new j = RandomEx(1, Iter_Count(House) + 1);
			pizzamoney[playerid] = floatround(GetDistanceBetweenPoints(x,y,z,HouseInfo[j][hEntrancex], HouseInfo[j][hEntrancey], HouseInfo[j][hEntrancez]));
			SCMf(playerid, COLOR_YELLOW, "%d", pizzamoney[playerid]);
			PlayerInfo[playerid][pPizzaSkill] ++;
			Update(playerid, pPizzaSkillx);
			if(toghuman == 1) givejobsalaryhuman(playerid);
			else GiveJobSalary(playerid);
			if(WorkingTime[playerid] > 90) {
			format(string2, sizeof(string2), "[A-ANTI]: %s[%d] co the dang treo de duoc nhieu tien job pizza vui long check!", GetName(playerid),playerid);
			GuiDenAdminVaHelper(COLOR_YELLOW, string2, 1); 
			
			}
			for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
				if(PlayerInfo[playerid][pDailyMission][m] == 1) CheckMission(playerid, m);
			}	
			GameTextForPlayer(playerid, "Vui long cho de tiep tuc giao banh", 1000, 3);
			defer ComepleteJobWait(playerid, 10);
		}
		case 156: {
			defer ComepleteJobWait(playerid, 10);
			SetPlayerCheckpointEx(playerid, 0,0,0, 0.0);
			TogglePlayerControllable(playerid, false);
			DisablePlayerCheckpointEx(playerid);
			CP[playerid] = 0;
			GameTextForPlayer(playerid, "Vui long cho de hoan thanh cong viec", 1000, 3);
			
		}
		case 699: {
			DestroyVehicle(JobVehicle[playerid]);			
			JobVehicle[playerid] = 0;
			JobWorking[playerid] = 0;
			Iter_Remove(IsSpeed, playerid);		
			SendClientMessage(playerid,-1,"/work de tiep tuc lam viec");
		}
		case 170: {
			if(GetPlayerVehicleID(playerid) != JobVehicle[playerid]) return SendClientMessage(playerid, -1, "[KEO HANG]: Ban khong o tren xe co the tai hang.");
			if(playerObject[playerid] != 0) DestroyPlayerObject(playerid, playerObject[playerid]);
			Dialog_Show(playerid, LOAD_HANG, DIALOG_STYLE_TABLIST_HEADERS, "Confirm", "Bam xac nhan de tai hang\nXac nhan\nTu choi", "Ok", "");
		}
		case 171: {
			if(playerObject2[playerid] != 0) DestroyObject(playerObject2[playerid]), playerObject2[playerid] = 0;
			DisablePlayerCheckpointEx(playerid);
			CP[playerid] --;	
			PlayerTextDrawSetString(playerid, InfosTD, "Di toi ~r~~h~diem mau do~w~~h~ tren ban do de lay hang hoa!");
			defer HideTextdraw(playerid);
			PlayerTextDrawShow(playerid, InfosTD);			
			new rand = random(2);
			DisablePlayerCheckpointEx(playerid);
			switch(rand) {
				case 0: {
					playerObject[playerid] = CreatePlayerObject(playerid, 1271, 928.5678,2069.6194,10.8203,   0.00000, 0.00000, 45.00000);
					SetPlayerCheckpointEx(playerid, 928.5678,2069.6194,10.8203, 2.0);			
				}
				case 1: {
					playerObject[playerid] = CreatePlayerObject(playerid, 1271, 1054.8168,2134.0264,10.8203,   0.00000, 0.00000, 45.00000);
					SetPlayerCheckpointEx(playerid, 1054.8168,2134.0264,10.8203, 2.0);
				}
				case 2: {
					playerObject[playerid] = CreatePlayerObject(playerid, 1271, 928.5678,2069.6194,10.8203,   0.00000, 0.00000, 45.00000);	
					SetPlayerCheckpointEx(playerid, 928.5678,2069.6194,10.8203, 2.0);
				}
			}
			PlayerInfo[playerid][pStivuitorSkill] ++;
			UpdateVar(playerid, "StivuitorSkill", PlayerInfo[playerid][pStivuitorSkill]);
			if(toghuman == 1) givejobsalaryhuman(playerid);
			else GiveJobSalary(playerid);
		}
		case 172: {
			DisablePlayerCheckpointEx(playerid);
		}
		case 98: {
			PlayerInfo[playerid][pEscape]=0;
			new str[100], sql[300];
			DisablePlayerCheckpointEx(playerid);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Ban da vuot nguc thanh cong, canh sat khong the tim thay dau vet cua ban.");
			format(str, sizeof(str), "Tru so: %s da vuot nguc thanh cong va khong de lai dau vet.", GetName(playerid));
			SendTeamMessage(3, COLOR_DEPART2, str);
            SendTeamMessage(2, COLOR_DEPART2, str);
            SendTeamMessage(1, COLOR_DEPART2, str);
            SendTeamMessage(15, COLOR_DEPART2, str);
            PlayerInfo[playerid][pJailTime] = 1;
            PlayerInfo[playerid][pJailed] = 1;
            mysql_format(SQL, sql,sizeof(sql),"UPDATE users SET `JailTime`='0',`Jailed`='0' WHERE `ID`='%d'",PlayerInfo[playerid][pSQLID]);
		    mysql_query(SQL,sql,false);
		    if(IsValidDynamicPickup(PlayerInfo[playerid][pEscapeP])) DestroyDynamicPickup(PlayerInfo[playerid][pEscapeP]);
		    if(IsValidDynamic3DTextLabel(PlayerInfo[playerid][pEscapeT])) DestroyDynamic3DTextLabel(PlayerInfo[playerid][pEscapeT]);
		    if(PlayerInfo[playerid][pEscapeCar] != 0) DestroyVehicle(PlayerInfo[playerid][pEscapeCar]), PlayerInfo[playerid][pEscapeCar] = 0;
		    PlayerInfo[playerid][pWantedLevel] = 0;
	        SetPlayerWantedLevel(playerid, 0);
	        ClearCrime(playerid);
	        Update(playerid,pWantedLevelx);
	        // finishAchievement(playerid, 16);
			checkbpquest(playerid, 2, 3);
		}
		case 177: {
			DisablePlayerCheckpoint(playerid);
			CP[playerid] = 0;
			new money = 1000 + random(4000);
			GivePlayerCash(playerid, money);
			RemovePlayerAttachedObject(playerid, ATTACHMENT_ID_BALE);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			ApplyAnimation(playerid, #CARRY, #crry_prtial, 4.0, 0, 0, 0, 0, 0);
			new jailt = 10 + random(40), str[32];
			format(str, 32, "-%d giay tu", jailt);
			GameTextForPlayer(playerid, str, 2500, 4);
			if((PlayerInfo[playerid][pJailTime] - jailt) <= 1) PlayerInfo[playerid][pJailTime] = 1;
			else PlayerInfo[playerid][pJailTime] -= jailt;
			return 1;
		}
		case 178: {
			TogglePlayerControllable(playerid, false);
			DisablePlayerCheckpoint(playerid);
			CP[playerid] = 0;

			new Float: x, Float: y, Float: z;
			GetPlayerPos(playerid, x, y, z);
			plant[playerid] = CreatePlayerObject(playerid, 806, x, y, 12.08600,   0.00000, 0.00000, 0.00000, 300.00);
			MovePlayerObject(playerid, plant[playerid], x, y, 19.08600, 2.0, 0.00000, 0.00000, 0.00000);
			ApplyAnimation(playerid, "BOMBER", "BOM_Plant_Loop", 4.0, 1, 0, 0, 0, 0);
			defer WorkJail[4000](playerid);
			return 1;
		}
	}
	PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);	
	if(JobWorking[playerid] == 1 && PlayerInfo[playerid][pShowJob] == 1 && PlayerInfo[playerid][pShowHud] == 0) UpdateJobStats(playerid);
	CheckSeconds(playerid);
	JobTime[playerid] = GetTickCount();
	return 1;
}
public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	if(!ispassenger) {
		new const vehicle = GetVehicleID(vehicleid);
		if(ServerVehicles[vehicle][vID] != 0 && JobWorking[playerid] == 0) {
			// Kick out of a player when he try to enter not his faction car.
			if(ServerVehicles[vehicle][vFaction] != PlayerInfo[playerid][pMember] && ServerVehicles[vehicle][vFaction] != 0) {
				va_SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la thanh vien cua %s.", FactionName(ServerVehicles[vehicle][vFaction]));
				if(!IsACop(playerid)) StopEnterCar(playerid);
				return 1;
			}

			// Right of his/her faction vehicle, and btw he is a cop
			if(Copcar2(vehicle)) {
				if(ServerVehicles[vehicle][vRank] > PlayerInfo[playerid][pRank]) {
					va_SendClientMessage(playerid, COLOR_GREY, "Ban can dat rank %d de co the su dung phuong tien nay.", ServerVehicles[vehicle][vRank]);
					StopEnterCar(playerid);
				}
				else if(OnDuty[playerid] == 0) {
					SendClientMessage(playerid, COLOR_LGREEN, "Ban khong the su dung xe cua to chuc vi ban chua onduty!");
					StopEnterCar(playerid);
				}
				return 1;
			}

			if(ServerVehicles[vehicle][vClan] != 0) {
				if(PlayerInfo[playerid][pClan] == 0 || PlayerInfo[playerid][pClan] != ServerVehicles[vehicle][vClan]) {
					new str[100];
					format(str, sizeof(str), "Day la phuong tien cua clan %s", ClanInfo[ServerVehicles[vehicle][vClan]][clName]);
					Info(playerid, str);
					StopEnterCar(playerid);
			    }
			}
			return 1;
		}
		if(GetPVarInt(playerid, "InLesson") != -1) return 1;
		if(Iter_Contains(HelpersDuty, playerid)) return StopEnterCar(playerid);
		if(IsABoat(vehicleid)) {
			if(PlayerInfo[playerid][pBoatLic] < 1 && InDealer[playerid] == 0) {
				if(PlayerInfo[playerid][pJob] == 11 && JobVehicle[playerid] != 0) {} else
				{
					SendClientMessage(playerid,COLOR_GREY, "Ban khong co giay phep thuyen.");
					StopEnterCar(playerid);
				}
			}
		}
		else if(IsAPlane(vehicleid)) {
			if(PlayerInfo[playerid][pFlyLic] < 1 && InDealer[playerid] == 0) {
				SendClientMessage(playerid, COLOR_GREY, "Ban khong co giay phep may bay.");
				StopEnterCar(playerid);
			}
		}
		else { // is a car / bike / special vehicle
			if(PlayerInfo[playerid][pCarLic] < 1) {
				if(IsABike2(vehicleid) || DrivingTest[playerid] == 1 || GetVehicleModel(vehicleid) == 471 || InDealer[playerid] > 0) {}
				else {
				 	SendClientMessage(playerid,COLOR_GREY, "Ban khong co bang lai xe.");
					StopEnterCar(playerid);
				}
			}
		}
	}
	return 1;
}
public OnPlayerStateChange(playerid, newstate, oldstate)
{
	new string[128];
	new vehicleid = GetPlayerVehicleID(playerid);
	if(newstate == PLAYER_STATE_ONFOOT)
	{
		if(TaxiDriver[playerid] != -1) {
			if(TaxiMoney[playerid] != 0) {
				if(TaxiMoney[playerid] >= 100) {
					for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
						if(PlayerInfo[TaxiDriver[playerid]][pDailyMission][m] == 15 || PlayerInfo[TaxiDriver[playerid]][pDailyMission][m] == 16) CheckMission(TaxiDriver[playerid], m);
					}						
					UpdateFactionRaport(TaxiDriver[playerid], 0);				
				}	
				AcceptedService[TaxiDriver[playerid]] = -1;	
				foreach(new i: Player) {
					if(IsNearPlayer(playerid, i)) {
						format(string, sizeof(string), "* %s tra tien cho Taxi Driver %s so tien $%s.", GetName(playerid), GetName(TaxiDriver[playerid]), FormatNumber(TaxiMoney[playerid]));
						SendClientMessage(i, COLOR_PURPLE, string);
		
					}
				}
				TaxiMoney[playerid] = 0;
			}
			TaxiDriver[playerid] = -1;
			PlayerTextDrawHide(playerid, FareTD);
			stop TaxiTimer[playerid];
			PlayerTextDrawHide(playerid, FareTD);
			PlayerTextDrawHide(playerid, Speedo[0]);
			PlayerTextDrawHide(playerid, Speedo[1]);
			TextDrawHideForPlayer(playerid, Speedo4);			
		}
		
		if(TaxiDuty[playerid] == 1) {
			Fare[playerid] = 0;
			TaxiDriver[playerid] = -1;
			TaxiDuty[playerid] = 0;
			PlayerTextDrawHide(playerid, FareTD);
			foreach(new i: Player) {
				if(TaxiDriver[i] == playerid) {
					PlayerTextDrawHide(i, FareTD);
					TaxiDriver[i] = -1;
					TaxiMoney[i] = 0;
				}
			}
			format(string, sizeof(string), "Bay gio ban khong con lam nhiem vu taxi nua, ban nhan duoc $%s, do la so tien ban kiem duoc.", FormatNumber(TaxiMoney[playerid]));
			SendClientMessage(playerid, COLOR_WHITE, string);
			GivePlayerCash(playerid, TaxiMoney[playerid]);
			TaxiMoney[playerid] = 0;
		}		
		
		if(Helmet[playerid] == 1) {
			Helmet[playerid] = 0;
			format(string, sizeof(string), "* Mu bao hiem cua %s roi xuong dat.", GetName(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			RemovePlayerAttachedObject(playerid, 3);
		}	   
		if(oldstate == PLAYER_STATE_DRIVER) {
			if(IsPlayerInAnyVehicle(playerid) && InEvent[playerid] == 1 && EventType == 2) {
				SpawnPlayer(playerid);
				SendClientMessage(playerid, COLOR_WARNING, "Ban da bi loai khoi su kien vi ban da roi khoi xe!");
			}
			stop TimerRainCar[playerid];
		} 
		
		if(oldstate == PLAYER_STATE_DRIVER || oldstate == PLAYER_STATE_PASSENGER) {
			foreach(new i: Player) {
				if(Spectate[i] == playerid) {
					if(IsPlayerInAnyVehicle(playerid)) {
						new carid = GetPlayerVehicleID(playerid);
						PlayerSpectateVehicle(i, carid);
					}
					else PlayerSpectatePlayer(i, playerid);	
				}
			}
		 	if(CarRadio[GetPlayerVehicleID(playerid)]!=0) StopAudioStreamForPlayer(playerid);
			PlayerTextDrawHide(playerid, Speedo[0]);
			PlayerTextDrawHide(playerid, Speedo[1]);
			TextDrawHideForPlayer(playerid, Speedo4);
			PlayerTextDrawHide(playerid, FareTD);
		}
		if(JobWorking[playerid] == 1 && gLastCar[playerid] == JobVehicle[playerid]) {
			if(PlayerInfo[playerid][pJob] == 12 || PlayerInfo[playerid][pJob] == 1 || PlayerInfo[playerid][pJob] == 5) {
				SendClientMessage(playerid, COLOR_GREY, "Cong viec that bai! Ban roi khoi xe.");
				if(playerObject[playerid] != 0) DestroyPlayerObject(playerid, playerObject[playerid]), playerObject[playerid] = 0;
				if(playerObject2[playerid] != 0) DestroyObject(playerObject2[playerid]), playerObject2[playerid] = 0;
				JobWorking[playerid] = 0;
				PlayerTextDrawHide(playerid, JobTD);
				if(JobVehicle[playerid] != 0) { DestroyVehicle(JobVehicle[playerid]); JobVehicle[playerid] = 0; }
				if(Trailer[playerid] != 0) { DestroyVehicle(Trailer[playerid]); Trailer[playerid] = 0;  }
				PlayerTextDrawHide(playerid, InfosTD);
				DisablePlayerCheckpointEx(playerid);
				DisablePlayerRaceCheckpointEx(playerid);
				CP[playerid] = 0;
				JobVehicle[playerid] = 0;
				Iter_Remove(IsSpeed, playerid);		
				RemovePlayerAttachedObject(playerid, 2);
				RemovePlayerAttachedObject(playerid, 6);
				JobDeelay[playerid][PlayerInfo[playerid][pJob]] = 100;	
				DestroyWoodObject(playerid);			
				if(PlayerInfo[playerid][pJob] == 3) ResetWeapons(playerid);	
			}
			else {
				JobLeftTime[playerid] = 180;
				SendClientMessage(playerid, COLOR_YELLOW, "Ban co 3 phut de quay tro lai xe, neu khong cong viec se that bai.");
			}	
		}
	}
	else if(newstate == PLAYER_STATE_PASSENGER) {
		foreach(new i: Player) {
			if(TaxiDuty[i] == 1 && IsPlayerInVehicle(i, vehicleid) && GetPlayerState(i) == 2) {
				if(IsInBlacklist(playerid, 11) || IsInBlacklist(playerid, 12))
					return SendClientMessage(playerid, -1, "Ban dang o trong danh sach den cua to chuc nay, ban khong the su dung cac dich vu cua to chuc nay!"), RemovePlayerFromVehicleEx(playerid);
					
				if(GetPlayerCash(playerid) < Fare[i]) {
					format(string, sizeof(string), "Ban khong co $%d de vao taxi nay.", Fare[i]);
    		 		SendClientMessage(playerid, COLOR_GREY, string);
    		 		RemovePlayerFromVehicle(playerid);
				}
				else {
					TaxiDriver[playerid] = i;
					TaxiMoney[playerid] = 0;
					SetPVarInt(playerid, "TaxiVeh", vehicleid);
					TaxiTimer[playerid] = repeat UpdateFare(playerid);
					UpdateTaxiTextdraw(playerid);
				}
			}
		}
		
		if(OnDuty[playerid] == 0) SetPlayerArmedWeapon(playerid,0);
		if(InDealer[playerid] == 0 && CarRadio[GetPlayerVehicleID(playerid)] != 0) {
			PlayRadio[playerid] = CarRadio[GetPlayerVehicleID(playerid)];
			if(CarRadio[GetPlayerVehicleID(playerid)] == sizeof(RadioLink)) YoutubeStreamForPlayer(playerid, CarLink[GetPlayerVehicleID(playerid)]);
			else PlayAudioStreamForPlayer(playerid, RadioLink[CarRadio[GetPlayerVehicleID(playerid)]]);
		}	
		
		foreach(new i: PlayerHelpers) {
			if(Spectate[i] == playerid) {
				TogglePlayerSpectating(i, true);
				if(IsPlayerInAnyVehicle(playerid))
				{
					new carid = GetPlayerVehicleID(playerid);
					PlayerSpectateVehicle(i, carid);
				}
				else
				{
					PlayerSpectatePlayer(i, playerid);
				}		
			}
		}
		foreach(new i: PlayerAdmins) {
			if(Spectate[i] == playerid) {
				TogglePlayerSpectating(i, true);
				if(IsPlayerInAnyVehicle(playerid))
				{
					new carid = GetPlayerVehicleID(playerid);
					PlayerSpectateVehicle(i, carid);
				}
				else
				{
					PlayerSpectatePlayer(i, playerid);
				}		
			}
		}		
		new gun,tmp;
		GetPlayerWeaponData(playerid,5,gun,tmp);
		#pragma unused tmp
		if(gun)SetPlayerArmedWeapon(playerid,gun);
		else SetPlayerArmedWeapon(playerid,0);
		return 1;
	}
	else if(newstate == PLAYER_STATE_DRIVER) {	
		new const vehicle = GetVehicleID(GetPlayerVehicleID(playerid));
		new result;
		if(JobWorking[playerid] == 1 && JobVehicle[playerid] == GetPlayerVehicleID(playerid)) JobLeftTime[playerid] = 0;
		if(OnDuty[playerid] == 0) SetPlayerArmedWeapon(playerid, 0);
		if(CarRadio[GetPlayerVehicleID(playerid)] != 0) {
			PlayRadio[playerid] = CarRadio[GetPlayerVehicleID(playerid)];
			if(CarRadio[GetPlayerVehicleID(playerid)] == sizeof(RadioLink)) YoutubeStreamForPlayer(playerid, CarLink[GetPlayerVehicleID(playerid)]);
			else PlayAudioStreamForPlayer(playerid, RadioLink[CarRadio[GetPlayerVehicleID(playerid)]]);
		}	

		// Update spectating data
		// TODO: Make it dynamic
		foreach(new i: PlayerAdmins) {
			if(Spectate[i] == playerid) {
				TogglePlayerSpectating(i, true);
				if(IsPlayerInAnyVehicle(playerid)) PlayerSpectateVehicle(i, GetPlayerVehicleID(playerid));
				else PlayerSpectatePlayer(i, playerid);
			}
		}
		foreach(new i: PlayerHelpers) {
			if(Spectate[i] == playerid) {
				TogglePlayerSpectating(i, true);
				if(IsPlayerInAnyVehicle(playerid)) PlayerSpectateVehicle(i, GetPlayerVehicleID(playerid));
				else PlayerSpectatePlayer(i, playerid);
			}
		}		
		
		// Rent car
		if(rentls[1] <= vehicleid <= rentls[10] || rentlv[1] <= vehicleid <= rentlv[10]) {
			foreach(new i: Player) {
				if(HireCar[i] == vehicleid && i != playerid) HireCar[i] = -1, SendClientMessage(i, -1, "Chiec xe thue cua ban da bi mot nguoi choi khac lay di!");
			}
			HireCar[playerid] = vehicleid;
			RentPrice[playerid] = 0;
			PlayerTextDrawSetString(playerid, FareTD, "Thue xe: ~g~$0");
			PlayerTextDrawShow(playerid, FareTD);
		}	
		else if(scooter[1] <= vehicleid <= scooter[5]) {
			foreach(new i: Player) {
				if(HireCar[i] == vehicleid && i != playerid) HireCar[i] = -1, SendClientMessage(i, -1, "Chiec xe thue cua ban da bi mot nguoi choi khac lay di!");
			}		
			HireCar[playerid] = vehicleid;
			RentPrice[playerid] = 0;
			PlayerTextDrawSetString(playerid, FareTD, "Thue xe: ~g~$0");
			PlayerTextDrawShow(playerid, FareTD);
		}	
		
		new const carid = FindSpawnID(vehicleid);
		// Car jacker
		if(JobWorking[playerid] == 1 && PlayerInfo[playerid][pJob] == 4 && CP[playerid] == 0) {
			new x = GetPlayerSkill(playerid), newcar = GetPlayerVehicleID(playerid);
			if(x == 1 && CarInfo[carid][Spawned] == 0 && !IsAFLYCar(newcar) && !IsABOATCar(newcar)) {
				SetCheckpoint(playerid);
				PlayerTextDrawSetString(playerid, InfosTD, "~y~Car Jacker~w~~h~~n~Toi diem mau do de lay tien!");
				PlayerTextDrawShow(playerid, InfosTD);
				defer HideTextdraw(playerid);
				result = 0;
			}
			else if(x == 2 && CarInfo[carid][Spawned] != 0 && !IsAFLYCar(newcar) && !IsABOATCar(newcar)) {
				if(CarInfo[carid][Userid] == PlayerInfo[playerid][pSQLID]) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the an cap xe cua rieng ban!");
				else {
					SetCheckpoint(playerid);
					PlayerTextDrawSetString(playerid, InfosTD, "~y~Car Jacker~w~~h~~n~Toi diem mau do de lay tien!");
					PlayerTextDrawShow(playerid, InfosTD);
					defer HideTextdraw(playerid);
					result = 1;
					format(string, sizeof(string), "%s (%d) danh cap chiec xe ca nhan cua ban.", GetName(playerid), playerid);
					SendUserMessage(COLOR_LIGHTBLUE, string, CarInfo[carid][Userid]);
				}	
			}
			else if(x == 3 && IsAGangCar(newcar)) {
				SetCheckpoint(playerid);
				PlayerTextDrawSetString(playerid, InfosTD, "~y~Car Jacker~w~~h~~n~Toi diem mau do de lay tien!");
				PlayerTextDrawShow(playerid, InfosTD);
				defer HideTextdraw(playerid);
				result = 1;
				format(string, sizeof(string), "%s (%d) danh cap mot xe to chuc.", GetName(playerid), playerid);
				SendFactionMessage(4, COLOR_LIGHTBLUE, string);
				SendFactionMessage(5, COLOR_LIGHTBLUE, string);
				SendFactionMessage(6, COLOR_LIGHTBLUE, string);
				SendFactionMessage(10, COLOR_LIGHTBLUE, string);		
			}
			else if(x == 4) {
				SetCheckpoint(playerid);
				PlayerTextDrawSetString(playerid, InfosTD, "~y~Car Jacker~w~~h~~n~Toi diem mau do de lay tien!");
				defer HideTextdraw(playerid);
				PlayerTextDrawShow(playerid, InfosTD);
				result = 1;
				format(string, sizeof(string), "%s (%d) danh cap chiec xe ca nhan cua ban.", GetName(playerid), playerid);
				SendUserMessage(COLOR_LIGHTBLUE, string, CarInfo[carid][Userid]);				
			}
			else if(x == 5 && Copcar2(newcar)) {
				SetCheckpoint(playerid);
				PlayerTextDrawSetString(playerid, InfosTD, "~y~Car Jacker~w~~h~~n~Toi diem mau do de lay tien!");
				PlayerTextDrawShow(playerid, InfosTD);
				defer HideTextdraw(playerid);
				result = 1;
				PlayerInfo[playerid][pWantedLevel] += 3;
				SetPlayerWantedLevel(playerid, PlayerInfo[playerid][pWantedLevel]);
				SetPlayerCriminal(playerid,255, "danh cap xe canh sat");
				WantedTime[playerid] = 0;
				Update(playerid,pWantedLevelx);
				ShowWanted[playerid] = 1;	

				format(string, sizeof(string), "%s (%d) danh cap mot xe to chuc.", GetName(playerid), playerid);
				SendFactionMessage(1, COLOR_LIGHTBLUE, string);
				SendFactionMessage(2, COLOR_LIGHTBLUE, string);
				SendFactionMessage(3, COLOR_LIGHTBLUE, string);
				SendFactionMessage(15, COLOR_LIGHTBLUE, string);
			}
		}
		
		if(ServerVehicles[vehicle][vID] != 0 && result == 0 && JobWorking[playerid] == 0) {
			// Kick out of a player when he try to enter not his faction car.
			if(ServerVehicles[vehicle][vFaction] != PlayerInfo[playerid][pMember] && ServerVehicles[vehicle][vFaction] != 0) {
				va_SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la thanh vien cua %s.", FactionName(ServerVehicles[vehicle][vFaction]));
				StopEnterCar(playerid);
			}

			// Right of his/her faction vehicle, and btw he is a cop
			if(Copcar2(vehicle)) {
				if(ServerVehicles[vehicle][vRank] > PlayerInfo[playerid][pRank]) {
					va_SendClientMessage(playerid, COLOR_GREY, "Ban can dat rank %d de co the su dung phuong tien nay.", ServerVehicles[vehicle][vRank]);
					StopEnterCar(playerid);
				}
				else if(OnDuty[playerid] == 0) {
					SendClientMessage(playerid, COLOR_LGREEN, "Ban khong the su dung xe cua to chuc vi ban chua onduty!");
					StopEnterCar(playerid);
				}
			}

			if(ServerVehicles[vehicle][vClan] != 0) {
				if(PlayerInfo[playerid][pClan] == 0 || PlayerInfo[playerid][pClan] != ServerVehicles[vehicle][vClan]) {
					new str[100];
					format(str, sizeof(str), "Day la phuong tien cua clan %s", ClanInfo[ServerVehicles[vehicle][vClan]][clName]);
					Info(playerid, str);
					StopEnterCar(playerid);
			    }
			}
		}

		// Enter personal car
		if(CarInfo[carid][Userid] == PlayerInfo[playerid][pSQLID]) {
			format(string, sizeof(string), "* Xe %s so huu boi ban | Da chay: %.0f km | Bao hiem: $%s (%d diem).", aVehicleNames[CarInfo[carid][cModel]-400],CarInfo[carid][KM],FormatNumber(CarInfo[carid][cTax]),CarInfo[carid][cPoints]);
	 		SendClientMessage(playerid, COLOR_WHITE, string);
			if(CarInfo[carid][cPoints] == 0) {
				SendClientMessage(playerid, COLOR_GREY, "Ban da khong tra tien bao hiem! De thanh toan, hay su dung /cars > Phuong tien > Bao hiem.");
				new engine,lights,alarm,doors,bonnet,boot,objective;
    			GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
      			SetVehicleParamsEx(vehicleid,VEHICLE_PARAMS_OFF,lights,alarm,doors,bonnet,boot,objective);	
				vehEngine[vehicleid] = 0;				
			}			
		}
		else if(CarInfo[carid][cID] != -2 && carid != 0) {
			format(string, sizeof(string), "* Xe %s so huu boi %s | Da chay: %.0f km | Bao hiem: $%s (%d diem).", aVehicleNames[CarInfo[carid][cModel]-400],CarInfo[carid][cOwner],CarInfo[carid][KM],FormatNumber(CarInfo[carid][cTax]),CarInfo[carid][cPoints]);
			SendClientMessage(playerid, COLOR_WHITE, string);
			if(CarInfo[carid][cPoints] == 0) {
				SendClientMessage(playerid, COLOR_GREY, "Chiec xe nay chua tra tien bao hiem!");
				new engine,lights,alarm,doors,bonnet,boot,objective;
    			GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
      			SetVehicleParamsEx(vehicleid,VEHICLE_PARAMS_OFF,lights,alarm,doors,bonnet,boot,objective);		
				vehEngine[vehicleid] = 0;
			}
		}					
		
		new engine,lights,alarm,doors,bonnet,boot,objective;
		
		if(vehEngine[vehicleid] == 0) {
			GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
			SetVehicleParamsEx(vehicleid,VEHICLE_PARAMS_OFF,lights,alarm,doors,bonnet,boot,objective);
		}
		else if(vehEngine[vehicleid] == 1) {
			GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
			SetVehicleParamsEx(vehicleid,VEHICLE_PARAMS_ON,lights,alarm,doors,bonnet,boot,objective);
		}
		if(Gas[vehicleid] == 0) {
			TogglePlayerControllable(playerid, false);
			NoFuel[playerid] = 1;
		}
		if(IsABoat(vehicleid) && GetPVarInt(playerid, "InLesson") == -1) {
			if(PlayerInfo[playerid][pBoatLic] < 1 && InDealer[playerid] == 0) {
				SendClientMessage(playerid,COLOR_GREY, "Ban khong co giay phep thuyen.");
				StopEnterCar(playerid);
				TogglePlayerControllable(playerid, true);
			}
		}
		else if(IsAPlane(vehicleid) && GetPVarInt(playerid, "InLesson") == -1) {
			if(PlayerInfo[playerid][pFlyLic] < 1 && InDealer[playerid] == 0) {
				SendClientMessage(playerid, COLOR_GREY, "Ban khong co giay phep bay.");
				StopEnterCar(playerid);
				TogglePlayerControllable(playerid, true); 
			}
		}
		else {
			if(PlayerInfo[playerid][pCarLic] < 1) {
				if(IsABike2(vehicleid) || DrivingTest[playerid] == 1 || GetVehicleModel(vehicleid) == 471 || InDealer[playerid] > 0) { }
				else {
				 	SendClientMessage(playerid,COLOR_GREY, "Ban khong co bang lai xe.");
					StopEnterCar(playerid);
					TogglePlayerControllable(playerid, true);
					defer UnFreezeStation[500](playerid);
				}
			}
		}
		if(IsABike2(vehicleid)) {
			TogglePlayerControllable(playerid, true);
			vehEngine[vehicleid] = 1;
			GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
			SetVehicleParamsEx(vehicleid,VEHICLE_PARAMS_ON,lights,alarm,doors,bonnet,boot,objective);
		}
		gLastCar[playerid] = vehicleid;
	}
	else if(newstate == PLAYER_STATE_SPAWNED) { //idk what this block means?
		new Float: lwx, Float:lwy, Float:lwz;
		GetPlayerPos(playerid, lwx, lwy, lwz);
		if((lwz > 530.0 && PlayerInfo[playerid][pInt] == 0) || IsPlayerInRangeOfPoint(playerid, 1000.0, -1041.9,-1868.4,79.1)) SetPlayerSpawn(playerid);
		PlayerInfo[playerid][pWantedDeaths] += 1;
		if(PlayerInfo[playerid][pVip] > 0) SetPlayerHealthEx(playerid, 99.0);
		gPlayerSpawned[playerid] = 1;
	}
	return 1;
}
public OnPlayerExitVehicle(playerid, vehicleid)
{
	stop TimerRainCar[playerid];
	if(Iter_Contains(PlayerInRace, playerid)) LeaveRaceArena(playerid);
	PlayRadio[playerid] = 0;
    DisableRemoteVehicleCollisions(playerid, 0);
	LastCar[playerid] = 0;
	// stop SpeedBoostTimer[playerid];
	// SpeedBoostTimer[playerid] = Timer:0;
	if(InEvent[playerid] == 1 && LastCar[playerid] == vehicleid) SpawnPlayer(playerid);
	if(GetPVarInt(playerid, "SpawnXe") != 0) {
		//DeletePVar(playerid, "SpawnXe");
        DestroyVehicle(XeNewbie[GetPVarInt(playerid, "SpawnXe")]);
		DeletePVar(playerid, "SpawnXe");
    }
	// if(DaThueThuyen[playerid] != 0) {
	// 	DestroyVehicle(ThuyenSpawn[DaThueThuyen[playerid]]);
	// 	DaThueThuyen[playerid] = 0;
    // }
	if(PlayerInfo[playerid][pEscape] != 0) {
		if(IsValidDynamicPickup(PlayerInfo[playerid][pEscapeP])) DestroyDynamicPickup(PlayerInfo[playerid][pEscapeP]);
		if(IsValidDynamic3DTextLabel(PlayerInfo[playerid][pEscapeT])) DestroyDynamic3DTextLabel(PlayerInfo[playerid][pEscapeT]);
		if(PlayerInfo[playerid][pEscapeCar] != 0) DestroyVehicle(PlayerInfo[playerid][pEscapeCar]), PlayerInfo[playerid][pEscapeCar] = 0;
		// PlayerTextDrawHide(playerid, WantedTime); // but JailTD
		if(PlayerInfo[playerid][pEscape] == 2) {
			if(PlayerInfo[playerid][pWantedLevel]+5 > 6) PlayerInfo[playerid][pWantedLevel] = 6;
			else PlayerInfo[playerid][pWantedLevel] += 5;
			SetPlayerCriminal(playerid, 255, "Vuot nguc");
			ShowWanted[playerid] = 1;		
		}
		PlayerInfo[playerid][pEscape] = 0;
		SendClientMessage(playerid, 0xffc301ff, "Ban da roi khoi xe, vuot nguc that bai va ban bi truy na 5 sao.");
	}

	
    if(TakingLesson[playerid] == 1)
    {
		new engine,lights,alarm,doors,bonnet,boot,objective;	
		TakingLesson[playerid] = 0;
		DisablePlayerRaceCheckpointEx(playerid);
		SetVehicleToRespawn(GetPlayerVehicleID(playerid));
		SendClientMessage(playerid, COLOR_LIGHTRED, "Kiem tra that bai!");
		vehEngine[GetPlayerVehicleID(playerid)] = 0;
		GetVehicleParamsEx(GetPlayerVehicleID(playerid),engine,lights,alarm,doors,bonnet,boot,objective);
    	SetVehicleParamsEx(GetPlayerVehicleID(playerid),VEHICLE_PARAMS_OFF,lights,alarm,doors,bonnet,boot,objective);
    	SetPVarInt(playerid, "Engine", 0);
    }
	return 1;
}
public OnPlayerRequestSpawn(playerid)
{
    return 1;
}
public OnPlayerRequestClass(playerid, classid)
{
	SetSpawnInfo(playerid, PlayerInfo[playerid][pTeam], PlayerInfo[playerid][pModel], SpawnPos[0], SpawnPos[1], SpawnPos[2], 1.0, -1, -1, -1, -1, -1, -1);
	if(IsPlayerLogged[playerid] == 1) SpawnPlayer(playerid);
	return 1;
}
public OnEnterExitModShop(playerid, enterexit, interiorid) {
    if(enterexit == 0) {
		// EnterInModShop[playerid] = 1;
		return 1;		
    }
    return 1;
}
public OnPlayerEditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	new Float:oldX, Float:oldY, Float:oldZ, Float:oldRotX, Float:oldRotY, Float:oldRotZ;
	GetDynamicObjectPos(objectid, oldX, oldY, oldZ);
	GetDynamicObjectRot(objectid, oldRotX, oldRotY, oldRotZ);
	if(response == EDIT_RESPONSE_FINAL) {
		if(EditHouse[playerid] == 1) {
		    new szQuery[256];
			mysql_format(SQL, szQuery, sizeof(szQuery), "INSERT INTO `fobjects` (`House`) VALUES ('0')");
			new Cache: result = mysql_query(SQL, szQuery);
			new i = cache_insert_id();
			cache_delete(result);
			format(FurnitureInfo[i][fiName], 8, "No name");
			FurnitureInfo[i][fiModel] = EditModel[playerid];
			FurnitureInfo[i][fiX] = x;
			FurnitureInfo[i][fiY] = y;
			FurnitureInfo[i][fiZ] = z;
			FurnitureInfo[i][fiRotX] = rx;
			FurnitureInfo[i][fiRotY] = ry;
			FurnitureInfo[i][fiRotZ] = rz;
			FurnitureInfo[i][fiVirtual] = GetPlayerVirtualWorld(playerid);
			FurnitureInfo[i][fiHouse] = PlayerInfo[playerid][pHouse];
			SaveObject(i);
			DestroyDynamicObject(ObjectEdited[playerid]);
			FurnitureInfo[i][fiObject] = CreateDynamicObject(FurnitureInfo[i][fiModel], FurnitureInfo[i][fiX], FurnitureInfo[i][fiY], FurnitureInfo[i][fiZ], FurnitureInfo[i][fiRotX], FurnitureInfo[i][fiRotY], FurnitureInfo[i][fiRotZ], FurnitureInfo[i][fiVirtual], -1, -1, 200.0);
			SendClientMessage(playerid, COLOR_YELLOW, "Doi tuong da duoc tao! Chi phi $1,000.");
			BizzInfo[18][bTill] += 1000;
            if(PlayerInfo[playerid][pVip] == 0) format(szQuery, sizeof(szQuery), "Trang thai object: %d/50",  GetHouseObjects(PlayerInfo[playerid][pHouse]));
			else format(szQuery, sizeof(szQuery), "Trang thai object: %d/100", GetHouseObjects(PlayerInfo[playerid][pHouse]));
            SendClientMessage(playerid, COLOR_YELLOW, szQuery);
			GivePlayerCash(playerid, -1000);
			EditHouse[playerid] = 0;
		}
		else if(EditHouse[playerid] == 2) {
		    new i = EditedObjectID[playerid];
			FurnitureInfo[i][fiX] = x;
			FurnitureInfo[i][fiY] = y;
			FurnitureInfo[i][fiZ] = z;
			FurnitureInfo[i][fiRotX] = rx;
			FurnitureInfo[i][fiRotY] = ry;
			FurnitureInfo[i][fiRotZ] = rz;
			FurnitureInfo[i][fiVirtual] = GetPlayerVirtualWorld(playerid);
			FurnitureInfo[i][fiHouse] = PlayerInfo[playerid][pHouse];
			DestroyDynamicObject(FurnitureInfo[i][fiObject]);//
			FurnitureInfo[i][fiObject] = CreateDynamicObject(FurnitureInfo[i][fiModel], FurnitureInfo[i][fiX], FurnitureInfo[i][fiY], FurnitureInfo[i][fiZ], FurnitureInfo[i][fiRotX], FurnitureInfo[i][fiRotY], FurnitureInfo[i][fiRotZ], FurnitureInfo[i][fiVirtual], -1, -1, 200.0);
	        SaveObject(i);
	        SendClientMessage(playerid, COLOR_YELLOW, "Object da duoc chinh sua thanh cong!");
			EditHouse[playerid] = 0;
		}
	}
	if(response == EDIT_RESPONSE_CANCEL) {
	    if(EditHouse[playerid] == 1) DestroyDynamicObject(ObjectEdited[playerid]), SendClientMessage(playerid, -1, "Da huy!"), EditHouse[playerid] = 0;
	    if(EditHouse[playerid] == 2) SendClientMessage(playerid, -1, "Da huy!"), EditHouse[playerid] = 0;
	}
	return 1;
}
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    new string[180];
    new engine,lights,alarm,doors,bonnet,boot,objective;
	
    if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING) {
	    if(newkeys == KEY_SPRINT) {
			if(Spectate[playerid] != 255) {
				new players[200], totalplayers, giveplayer[MAX_PLAYER_NAME];
				foreach(new i: Player) {
					if(PlayerInfo[i][pAdmin] == 0 && i != Spectate[playerid] && IsPlayerLogged[i] == 1) {
						players[totalplayers] = i;
						totalplayers++;
					}
				}
				if(totalplayers == 0) return SendClientMessage(playerid, COLOR_GREY, "Khong co du nguoi choi!");	
				new rand = random(totalplayers);
				new id = players[rand];
				if(id == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren chinh minh!");
				if(PlayerInfo[id][pAdmin] > PlayerInfo[playerid][pAdmin]) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay len nguoi choi do.");
				Spectate[playerid] = id;
				SpecPlayers[playerid] ++;
				if(SpecPlayers[playerid] == 1) {
					GetPlayerPos(playerid, SpecPos[playerid][0], SpecPos[playerid][1], SpecPos[playerid][2]);
					IsPlayerSpec[playerid] = 1;
					pInteriorID[playerid] = GetPlayerInterior(playerid);
					pVirtual[playerid] = GetPlayerVirtualWorld(playerid);
				}
				new Float:health;
				GetPlayerHealthEx(Spectate[playerid], health);
				GetPlayerName(Spectate[playerid], giveplayer, sizeof(giveplayer));
				new rank[7];
				if(PlayerInfo[playerid][pAdmin] != 0) rank = "Admin";
				else rank = "Helper";

				format(string, sizeof(string), "[SPEC] (%d) %s | Level: %d | Health: %.2f | AFK Time: %d | Seconds: %.0f | Duty: %d | Ping: %d",id,GetName(id),PlayerInfo[id][pLevel], health, AFKSeconds[id], PlayerInfo[id][pSeconds], OnDuty[id], GetPlayerPing(id));
				SendClientMessage(playerid, 0xFFADADFF, string);
				
				new Player_Weapons[13], Player_Ammos[13], i, guns;
				string = "Weapons:";	
				for(i = 1;i <= 12;i++)
				{
					GetPlayerWeaponData(id,i,Player_Weapons[i],Player_Ammos[i]);
					if(Player_Weapons[i] != 0)
					{
						new weaponName[180];
						GetWeaponName(Player_Weapons[i],weaponName,255);
						format(string,255,"%s %s(%d)", string, weaponName,Player_Ammos[i]);
						guns ++;
					}
				}
				if(guns > 0) SendClientMessage(playerid, -1, string);


				TogglePlayerSpectating(playerid, true);
				SetPlayerInterior(playerid, GetPlayerInterior(id));
				SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(id));
				
				if(IsPlayerInAnyVehicle(Spectate[playerid])) {
					new carid = GetPlayerVehicleID(Spectate[playerid]);
					PlayerSpectateVehicle(playerid, carid);
				}
				else PlayerSpectatePlayer(playerid, Spectate[playerid]);

				PlayerTextDrawSetString(playerid, SpectatorTD, "Loading...");
				PlayerTextDrawShow(playerid, SpectatorTD);					
			}
	    }
	    if(newkeys & KEY_WALK) {
			if(IsPlayerSpec[playerid] != 0) {
				TogglePlayerControllable(playerid, true);
				TogglePlayerSpectating(playerid, false);
				SetPlayerInterior(playerid,Unspec[playerid][sPint]);
				PlayerInfo[playerid][pInt] = Unspec[playerid][sPint];
				PlayerInfo[playerid][pLocal] = Unspec[playerid][sLocal];
				Unspec[playerid][sLocal] = 255;
				gTeam[playerid] = PlayerInfo[playerid][pTeam];
				SetPlayerToTeamColor(playerid);
				SendClientMessage(playerid, -1, "Ban khong con spec nua!");
				SpecPlayers[playerid] = 0;
				SpawnPlayer(playerid);
				Spectate[playerid] = 255;
				LastRecon[playerid] = 1;
				PlayerTextDrawHide(playerid, SpectatorTD);
				// IsPlayerSpec[playerid] = 0;
			}
	    }
    } 
    else if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
	    if(newkeys & KEY_FIRE) {
			if(PlayerInfo[playerid][pMember] == 7 || PlayerInfo[playerid][pLeader] == 7) TTCFunction(playerid);
			if(EnableBoast[playerid] == 1) {
				new Float:vx,Float:vy,Float:vz;
				GetVehicleVelocity(GetPlayerVehicleID(playerid),vx,vy,vz);
				SetVehicleVelocity(GetPlayerVehicleID(playerid), vx * 1.8, vy *1.8, vz * 1.8);
			}		
	    }
	    if(newkeys & KEY_SECONDARY_ATTACK) {
	        if(GetPlayerVehicleID(playerid) == rentls[1] || GetPlayerVehicleID(playerid) == rentls[2] || GetPlayerVehicleID(playerid) == rentls[3] || GetPlayerVehicleID(playerid) == rentls[4] || GetPlayerVehicleID(playerid) == rentls[5] || 
		    GetPlayerVehicleID(playerid) == rentls[6] || GetPlayerVehicleID(playerid) == rentls[7] || GetPlayerVehicleID(playerid) == rentls[8] || GetPlayerVehicleID(playerid) == rentls[9] || GetPlayerVehicleID(playerid) == rentls[10] || 
		    GetPlayerVehicleID(playerid) == rentlv[1] || GetPlayerVehicleID(playerid) == rentlv[2] || GetPlayerVehicleID(playerid) == rentlv[3] || GetPlayerVehicleID(playerid) == rentlv[4] || GetPlayerVehicleID(playerid) == rentlv[5] || 
		    GetPlayerVehicleID(playerid) == rentlv[6] || GetPlayerVehicleID(playerid) == rentlv[7] || GetPlayerVehicleID(playerid) == rentlv[8] || GetPlayerVehicleID(playerid) == rentlv[9] || GetPlayerVehicleID(playerid) == rentlv[10]) {
			   TogglePlayerControllable(playerid, true);
			   RemovePlayerFromVehicleEx(playerid);
	        }
	        if(GetPlayerVehicleID(playerid) == scooter[1] || GetPlayerVehicleID(playerid) == scooter[2] || GetPlayerVehicleID(playerid) == scooter[3] || GetPlayerVehicleID(playerid) == scooter[4] || GetPlayerVehicleID(playerid) == scooter[5]) {
			   TogglePlayerControllable(playerid, true);
			   RemovePlayerFromVehicleEx(playerid);
	        }
		    if(NoFuel[playerid] == 1) {
			   RemovePlayerFromVehicleEx(playerid);
			   TogglePlayerControllable(playerid, true);
			   NoFuel[playerid] = 0;
		    }
	    }
	    if(newkeys == KEY_CTRL_BACK)
	    {
			new szDialog[1024], szDialog2[1024];
			strcat(szDialog2, "Ten\tSo nguoi dang nghe\n");
			for(new i = 0; i < sizeof(RadioNames); i++) {
				if(i == 0) format(szDialog, sizeof(szDialog), "%s\n", RadioNames[i]);
				else format(szDialog, sizeof(szDialog), "%s\t%d\n", RadioNames[i], ListenThisRadio(i));
				strcat(szDialog2, szDialog);
			}
			strcat(szDialog2, "Youtube custom URL");
			Dialog_Show(playerid, DIALOG_CARRADIO, DIALOG_STYLE_TABLIST_HEADERS, "Car Radio", szDialog2, "Ok", "Close");
	    }
	    if(newkeys & KEY_ANALOG_DOWN)
	    {
			new veh = GetPlayerVehicleID(playerid);
			if(GetPVarInt(playerid, "Boot") == 0) {
				 GetVehicleParamsEx(veh,engine,lights,alarm,doors,bonnet,boot,objective);
				 SetVehicleParamsEx(veh,engine,lights,alarm,doors,bonnet,VEHICLE_PARAMS_ON,objective);
				 SetPVarInt(playerid, "Boot", 1);
			}
			else if(GetPVarInt(playerid, "Boot") == 1) {
				 GetVehicleParamsEx(veh,engine,lights,alarm,doors,bonnet,boot,objective);
				 SetVehicleParamsEx(veh,engine,lights,alarm,doors,bonnet,VEHICLE_PARAMS_OFF,objective);
				 SetPVarInt(playerid, "Boot", 0);
			}
			return 1;
	    }	     
	    if(newkeys & KEY_ANALOG_UP)
	    {
			new veh = GetPlayerVehicleID(playerid);
			if(GetPVarInt(playerid, "Bonnet") == 0) {
				GetVehicleParamsEx(veh,engine,lights,alarm,doors,bonnet,boot,objective);
				SetVehicleParamsEx(veh,engine,lights,alarm,doors,VEHICLE_PARAMS_ON,boot,objective);
				SetPVarInt(playerid, "Bonnet", 1);
			}
			else if(GetPVarInt(playerid, "Bonnet") == 1) {
				GetVehicleParamsEx(veh,engine,lights,alarm,doors,bonnet,boot,objective);
				SetVehicleParamsEx(veh,engine,lights,alarm,doors,VEHICLE_PARAMS_OFF,boot,objective);
				SetPVarInt(playerid, "Bonnet", 0);
			}
			return 1;
	    }
	    if(newkeys == KEY_LOOK_BEHIND)
	    {
		   new idcar = GetPlayerVehicleID(playerid),sendername[25];
		   if(IsABike(idcar)) return 1;
		   new carid = FindSpawnID(idcar);
		   if(carid != 0) {
				if(CarInfo[carid][cPoints] == 0) return SendClientMessage(playerid, COLOR_GREY, "Chiec xe nay chua tra tien bao hiem!");
		   }
		   if(IsAPlane(idcar)) return 1;
		   if(Refueling[playerid] != 0) return SendClientMessage(playerid,COLOR_LGREEN,"* Xin vui long doi cho den khi xe do day xang!");
		   // if(gettime() < GetPVarInt(playerid, "EngineDeelay")) return va_SendClientMessage(playerid, COLOR_LGREEN, "*Vui long doi %d giay!", GetPVarInt(playerid, "EngineDeelay") - gettime());
		   new vehicle = GetVehicleModel(idcar) - 400;		   
		   if(DeelayCommand[playerid][0] > 0) return DeelayTime(playerid, 0);
		   if(vehEngine[idcar] == 0) {
			   vehEngine[idcar] = 1;
			   GetVehicleParamsEx(idcar,engine,lights,alarm,doors,bonnet,boot,objective);
			   SetVehicleParamsEx(idcar,VEHICLE_PARAMS_ON,lights,alarm,doors,bonnet,boot,objective);
			   // SetPVarInt(playerid, "EngineDeelay", gettime() + 5);
			   GetPlayerName(playerid, sendername, sizeof(sendername));
			   SetPVarInt(playerid, "Engine", 1);
			   if(GetPVarInt(playerid, "Undercover") == 1) format(string, sizeof(string), "* Mot ke la mat van chia khoa mot vong khoi dong xe %s.",aVehicleNames[vehicle]);
			   else format(string, sizeof(string), "* %s van chia khoa mot vong khoi dong xe %s.",sendername,aVehicleNames[vehicle]);				   
			   ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		   }
		   else if(vehEngine[idcar] == 1) {
			   vehEngine[idcar] = 0;
			   GetVehicleParamsEx(idcar,engine,lights,alarm,doors,bonnet,boot,objective);
			   SetVehicleParamsEx(idcar,VEHICLE_PARAMS_OFF,lights,alarm,doors,bonnet,boot,objective);
			   // SetPVarInt(playerid, "EngineDeelay", gettime() + 5);		   
			   GetPlayerName(playerid, sendername, sizeof(sendername));
			   SetPVarInt(playerid, "Engine", 0);
			   if(GetPVarInt(playerid, "Undercover") == 1) format(string, sizeof(string), "* Mot ke la mat van nguoc va rut chia khoa ra khoi xe %s.",aVehicleNames[vehicle]);
			   else format(string, sizeof(string), "* %s van nguoc va rut chia khoa ra khoi xe %s.",sendername,aVehicleNames[vehicle]);				   
			   ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		   }
		   DeelayCommand[playerid][0] = 5;
	    }
	    if(newkeys & KEY_ACTION)
	    {
			new veh = GetPlayerVehicleID(playerid);
			if(GetPVarInt(playerid, "Lights") == 0) {
				GetVehicleParamsEx(veh,engine,lights,alarm,doors,bonnet,boot,objective);
				SetVehicleParamsEx(veh,engine,VEHICLE_PARAMS_ON,alarm,doors,bonnet,boot,objective);
				SetPVarInt(playerid, "Lights", 1);
			}
			else if(GetPVarInt(playerid, "Lights") == 1) {
				GetVehicleParamsEx(veh,engine,lights,alarm,doors,bonnet,boot,objective);
				SetVehicleParamsEx(veh,engine,VEHICLE_PARAMS_OFF,alarm,doors,bonnet,boot,objective);
				SetPVarInt(playerid, "Lights", 0);
			}
			return 1;
		}	    
    } 
    else if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
	    if(newkeys & KEY_SECONDARY_ATTACK) {
			new car = GetClosestVehicle(playerid);
			if(car != INVALID_VEHICLE_ID && IsPlayerNearVehicle(playerid,car,5)) {
			   for(new i = 0; i < 10; i++) {
					if(PlayerInfo[playerid][pCarKey][i] != 0) {
						if(CarInfo[PlayerInfo[playerid][pCarKey][i]][Spawned] == car) SetVehicleParamsForPlayer(car, playerid, 0, 0);
					}
			    }
		    }
		    if(UsedFly[playerid] == 1) {
				StopFly(playerid);
				UsedFly[playerid] = 0;
				SetPlayerHealthEx(playerid, 99);
				SendClientMessage(playerid, 0xFFADADFF, "Tat fly.");
		    }
		    for(new i = 1; i <= facs; i++) {
				if(IsPlayerInRangeOfPoint(playerid, 2.0, DynamicFactions[i][extX], DynamicFactions[i][extY], DynamicFactions[i][extZ])) {
					if(PlayerInfo[playerid][pMember] == i || DynamicFactions[i][fLock] == 1 || OnDuty[playerid] == 1) return EnterFaction(playerid, i);
				}
		    }
		    for(new i = 1; i <= facs; i++) {
				if(IsPlayerInRangeOfPoint(playerid, 2.0, DynamicFactions[i][fcX], DynamicFactions[i][fcY], DynamicFactions[i][fcZ])) {
					if(DynamicFactions[i][fVW] == GetPlayerVirtualWorld(playerid) && DynamicFactions[i][fInterior] == GetPlayerInterior(playerid)) return ExitFaction(playerid, i);
				}	
		    }
		    if(GetPlayerInterior(playerid) == 0) {
			    foreach(new i : House) {
				   if(IsPlayerInRangeOfPoint(playerid,2,HouseInfo[i][hEntrancex], HouseInfo[i][hEntrancey], HouseInfo[i][hEntrancez]))
				   {
				   		if(GetPVarInt(playerid, "LocationEnter") > gettime()) return va_SendClientMessage(playerid, COLOR_LGREEN, "Vui long doi %d giay!", GetPVarInt(playerid, "LocationEnter") - gettime());
						if(InEvent[playerid] == 1) return 1;
						if(InWar[PlayerInfo[playerid][pMember]] == 1) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the vao nha trong khi dang war!");
						if(PlayerInfo[playerid][pHouse] == i || HouseInfo[i][hLock] == 0 || OnDuty[playerid] == 1 || PlayerHit[playerid] != -1) {
							SetPlayerInterior(playerid,HouseInfo[i][hInterior]);
							SetPlayerPosEx(playerid,HouseInfo[i][hExitx],HouseInfo[i][hExity],HouseInfo[i][hExitz]);
							PlayerInfo[playerid][pInt] = HouseInfo[i][hInterior];
							PlayerInfo[playerid][pLocal] = i;
						 	SetPlayerVirtualWorld(playerid,HouseInfo[i][hVirtual]);
							InHouse[playerid] = i;
							HouseRadio(playerid, i);
							SetPVarInt(playerid, "LocationEnter", gettime() + 10);
							return 1;
					    }
 					    else return GameTextForPlayer(playerid, "~r~~h~Khoa", 1000, 1);
				    }
			    }
				foreach(new i : Bizs) {
					if(IsPlayerInRangeOfPoint(playerid,2,BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ]) && BizzInfo[i][bSbiz] == 0) {
						return EnterBizz(playerid, i);
					}
				}				
		    }
	    	foreach(new i : Bizs) {
	    		if(IsPlayerInRangeOfPoint(playerid, 2,BizzInfo[i][bExitX], BizzInfo[i][bExitY], BizzInfo[i][bExitZ]) && BizzInfo[i][bVirtual]==GetPlayerVirtualWorld(playerid)) {
					return ExitBizz(playerid, i);
				}
	    	}	    		   
		    foreach(new i : House) {   
			   if(EditHouse[playerid] != 0) return 1;
			   if(PlayerInfo[playerid][pSleeping] == 1) return 1;		   
			   if(IsPlayerInRangeOfPoint(playerid, 2,HouseInfo[i][hExitx], HouseInfo[i][hExity], HouseInfo[i][hExitz]) && HouseInfo[i][hVirtual] == GetPlayerVirtualWorld(playerid)) {
				   SetPlayerVirtualWorld(playerid,0);
				   SetPlayerInterior(playerid,0);
				   SetPlayerPosEx(playerid,HouseInfo[i][hEntrancex],HouseInfo[i][hEntrancey],HouseInfo[i][hEntrancez]);
				   InHouse[playerid] = -1;
				   PlayRadio[playerid] = 0;
				   StopAudioStreamForPlayer(playerid);
				   return 1;
			   }
		    }		   
		    if(InWar[PlayerInfo[playerid][pMember]] == 0) {
			    for(new i; i < sizeof(Training); i++) {
					if(IsPlayerInRangeOfPoint(playerid, 2.0, Training[i][trainingX], Training[i][trainingY], Training[i][trainingZ]) && PlayerInfo[playerid][pMember] == i+1) {
						if(PlayerInfo[playerid][pWantedLevel] != 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the vao trong vi ban bi truy na!");
						SetPlayerPosEx(playerid, 1062.1185, 2077.5059, 10.8352);
						SetPlayerVirtualWorld(playerid, i+1);
						SetPlayerInterior(playerid, 0);
						SendClientMessage(playerid, COLOR_YELLOW, "Chao mung ban den phong tap! Neu ban muon lay vu khi, hay su dung lenh /guns.");
						InTraining[playerid] = 1;
						SetPVarInt(playerid, "Training", i);
						return 1;
					}
			    }
			}
		    if(IsPlayerInRangeOfPoint(playerid, 3.0, 2337.1826, 2458.7441, 14.9921) && GetPlayerVirtualWorld(playerid) == 0) {
				if(IsACop(playerid)) {
					SetPlayerPosEx(playerid, 2280.0898, 2458.7939, 38.6871); 
					SetPlayerInterior(playerid, 0);
					return 1;
				}
		    }
		    else if(IsPlayerInRangeOfPoint(playerid, 3.0, 2280.0898, 2458.7939, 38.6871) && GetPlayerVirtualWorld(playerid) == 0) {
				if(IsACop(playerid)) {
					SetPlayerPosEx(playerid, 2337.1826, 2458.7441, 14.9921);
					SetPlayerInterior(playerid, 0);
					return 1;
				}
		    }
		    else if(IsPlayerInRangeOfPoint( playerid, 3.0, 1630.2462, 1793.0410, 10.8156) && GetPlayerVirtualWorld(playerid) == 0) {
				if(PlayerInfo[playerid][pMember] == 13) {
					SetPlayerPosEx(playerid, 1606.6693, 1786.6062, 30.4599);
					SetPlayerInterior(playerid, 0);
					return 1;
				}
		    }
		    else if(IsPlayerInRangeOfPoint(playerid, 3.0, 1606.6693, 1786.6062, 30.4599) && GetPlayerVirtualWorld(playerid) == 0) {
				if(PlayerInfo[playerid][pMember] == 13) {
					SetPlayerPosEx(playerid, 1630.2462, 1793.0410, 10.8156); 
					SetPlayerInterior(playerid, 0);
					return 1;
				}
		    }
			else if(IsPlayerInRangeOfPoint(playerid, 1.0, 306,-141,1004)) { // GSLS
				SetPlayerInterior(playerid,7);
				SetPlayerPosEx(playerid,304,-141,1004);
				return 1;
			}
			else if(IsPlayerInRangeOfPoint(playerid, 1.0,301,-141,1004)) { // GSLS
				SetPlayerInterior(playerid,7);
				SetPlayerPosEx(playerid,299,-141,1004);
				return 1;
			}
			else if(IsPlayerInRangeOfPoint(playerid, 1.0, 304,-141,1004)) { // GSLS
				SetPlayerInterior(playerid,7);
				SetPlayerPosEx(playerid,306,-141,1004);
				return 1;
			}
			else if(IsPlayerInRangeOfPoint(playerid, 1.0, 299,-141,1004)) { // GSLS
				SetPlayerInterior(playerid,7);
				SetPlayerPosEx(playerid,301,-141,1004);
				return 1;
			}		    
			else if(IsPlayerInRangeOfPoint(playerid, 1.0, 834.2025,7.3810,1004.1870)) { // LOTTO
				SetPlayerInterior(playerid,0);
				SetPlayerPosEx(playerid,1119.2765,-1505.8556,13.6791);
				return 1;
			}	
			else if(IsPlayerInRangeOfPoint(playerid, 1.0, 1119.2765,-1505.8556,13.6791)) { // LOTTO
				SetPlayerInterior(playerid,3);
				SetPlayerPosEx(playerid,834.2025,7.3810,1004.1870);
				return 1;
			}		   
			else if(PlayerToPoint(2,playerid, 2232.7986,-1159.8341,25.8906)) { // lau xanh
				SetPlayerPosEx(playerid,2214.7830,-1150.4531,1025.7969);
				SetPlayerInterior(playerid,15);
				SetPlayerVirtualWorld(playerid, 0);
				return true;
			}
		    else if(PlayerToPoint(2,playerid, 2214.7830,-1150.4531,1025.7969)) { // lau xanh
				SetPlayerPosEx(playerid,2232.7986,-1159.8341,25.8906);
				SetPlayerInterior(playerid,0);
				SetPlayerVirtualWorld(playerid, 0);
				return true;
		    }
			else if(IsPlayerInRangeOfPoint(playerid, 2.0,23.5460,2505.8567,16.7321) && GetPlayerVirtualWorld(playerid) == VW_JAIL) { // jail anexa enter
				SetPlayerInterior(playerid,1);
				SetPlayerPosEx(playerid,187.0149,2475.8491,-17.7424);
				return 1;
			}
			else if(IsPlayerInRangeOfPoint(playerid, 2.0, 187.0149,2475.8491,-17.2424)) { // jail anexa exit
				SetPlayerInterior(playerid,0);
				SetPlayerPosEx(playerid,23.5460,2505.8567,16.7321);
				return 1;
			}
			else if(IsPlayerInRangeOfPoint(playerid, 2.0, 181.4308,2469.6050,-17.2424)) { // jail escape
				if(PlayerInfo[playerid][pEscapePoints] < 10) return va_Info(playerid, "Ban can 10 Escape Points");
				if(PlayerInfo[playerid][pJailed]==3) return SendClientMessage(playerid, COLOR_GREY, "Ban dang o tu OOC.");
				Dialog_Show(playerid, DIALOG_ESCAPE, DIALOG_STYLE_MSGBOX,  "Escape from jail", "Ban co chac chan muon hoi loi canh sat de vuot nguc voi 10 rob points khong?\nNeu ban dinh tron thoat, canh sat se ho tong ban den duong ham ben duoi nha tu.", "Co", "Khong");
				return 1;
			}
			else if(IsPlayerInRangeOfPoint(playerid, 2.0, 59.1325,2541.6426,-52.4940) && PlayerInfo[playerid][pEscapeExit] == 1) {
				if(IsValidDynamicPickup(PlayerInfo[playerid][pEscapeP])) DestroyDynamicPickup(PlayerInfo[playerid][pEscapeP]);
				if(IsValidDynamic3DTextLabel(PlayerInfo[playerid][pEscapeT])) DestroyDynamic3DTextLabel(PlayerInfo[playerid][pEscapeT]);
				SendClientMessage(playerid, -1, "{ddb49d}Buoc 2: Di toi checkpoint de tron tranh canh sat.");
				SendClientMessage(playerid, -1, "{ddb49d}Viec tron thoat that bai neu ban roi khoi xe.");
				
				PlayerInfo[playerid][pEscape] = 2;
				
				SetPlayerInterior(playerid, 0);
				SetPlayerVirtualWorld(playerid, 0);
				
				new spawncar = random(sizeof(SpawnCarEscape)), cp = random(sizeof(CheckPointEscape));
				PlayerInfo[playerid][pEscapeCar] = CreateVehicleEx(560 , SpawnCarEscape[spawncar][0],SpawnCarEscape[spawncar][1],SpawnCarEscape[spawncar][2],SpawnCarEscape[spawncar][3], -1, -1, -1);
			 	PutPlayerInVehicleEx(playerid, PlayerInfo[playerid][pEscapeCar], 0);
			 	SetVehicleHealth(PlayerInfo[playerid][pEscapeCar], 999.0);
				GetVehicleParamsEx(PlayerInfo[playerid][pEscapeCar], engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(PlayerInfo[playerid][pEscapeCar],VEHICLE_PARAMS_ON,VEHICLE_PARAMS_OFF,alarm,doors,bonnet,boot,objective);
				SetPlayerCheckpointEx(playerid, CheckPointEscape[cp][0], CheckPointEscape[cp][1], CheckPointEscape[cp][2], 4.0);
				CP[playerid]=98;
				if(PlayerInfo[playerid][pWantedLevel]+5 > 6) PlayerInfo[playerid][pWantedLevel] = 6;
			    else PlayerInfo[playerid][pWantedLevel] += 5;
			    SetPlayerCriminal(playerid, 255, "Vuot nguc");
			    ShowWanted[playerid] = 1;
				return 1;
			}
			else if(IsPlayerInRangeOfPoint(playerid, 2.0, -4.4659,2450.2810,-52.3575) && PlayerInfo[playerid][pEscapeExit] == 2) {
				if(IsValidDynamicPickup(PlayerInfo[playerid][pEscapeP])) DestroyDynamicPickup(PlayerInfo[playerid][pEscapeP]);
				if(IsValidDynamic3DTextLabel(PlayerInfo[playerid][pEscapeT])) DestroyDynamic3DTextLabel(PlayerInfo[playerid][pEscapeT]);
				
				SendClientMessage(playerid, -1, "{ddb49d}Buoc 2: Di toi checkpoint de tron tranh canh sat.");
				SendClientMessage(playerid, -1, "{ddb49d}Viec tron thoat that bai neu ban roi khoi xe.");
				
				PlayerInfo[playerid][pEscape] = 2;
				
				SetPlayerInterior(playerid, 0);
				SetPlayerVirtualWorld(playerid, 0);
				
				new spawncar = random(sizeof(SpawnCarEscape)), cp = random(sizeof(CheckPointEscape));
				PlayerInfo[playerid][pEscapeCar] = CreateVehicleEx(560 , SpawnCarEscape[spawncar][0],SpawnCarEscape[spawncar][1],SpawnCarEscape[spawncar][2],SpawnCarEscape[spawncar][3], -1, -1, -1);
			 	PutPlayerInVehicleEx(playerid, PlayerInfo[playerid][pEscapeCar], 0);
			 	SetVehicleHealth(PlayerInfo[playerid][pEscapeCar], 999.0);
				GetVehicleParamsEx(PlayerInfo[playerid][pEscapeCar], engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(PlayerInfo[playerid][pEscapeCar],VEHICLE_PARAMS_ON,VEHICLE_PARAMS_OFF,alarm,doors,bonnet,boot,objective);
				SetPlayerCheckpointEx(playerid, CheckPointEscape[cp][0], CheckPointEscape[cp][1], CheckPointEscape[cp][2], 4.0);
				CP[playerid]=98;
				if(PlayerInfo[playerid][pWantedLevel]+5 > 6) PlayerInfo[playerid][pWantedLevel] = 6;
			    else PlayerInfo[playerid][pWantedLevel] += 5;
			    SetPlayerCriminal(playerid, 255, "Vuot nguc");
			    ShowWanted[playerid] = 1;
				return 1;
			}			
		    if(IsPlayerInRangeOfPoint(playerid,2,1062.1185, 2077.5059, 10.8352)) { // chu y
				InTraining[playerid] = 0;
				FactionsSpawns(playerid);
				new i = GetPVarInt(playerid, "Training");
				SetPlayerPosEx(playerid, Training[i][trainingX], Training[i][trainingY], Training[i][trainingZ]);
				DeletePVar(playerid, "Training");
				ResetPlayerWeapons(playerid);
				SendClientMessage(playerid, COLOR_YELLOW, "Ban ra khoi phong tap.");
		    }
		    if(IsPlayerInRangeOfPoint(playerid,2,1918.2250,-1619.8477,1770.7469)) {
				if(IsACop(playerid)) Dialog_Show(playerid, DIALOG_TELEPORT, DIALOG_STYLE_LIST, "Teleport", "Enter Yard\nExit jail", "Select", "Cancel");
				else {
					SetPlayerVirtualWorld(playerid, 1339);
					SetPlayerPosEx(playerid, 1772.0298,-1548.0693,9.9068);
					SetPlayerInterior(playerid, 0);
				}	
		    }
		    if(IsPlayerInRangeOfPoint(playerid,2,1798.5109,-1578.3337,14.0848)) {
			    if(IsACop(playerid)) {
					SetPlayerVirtualWorld(playerid, 0);
					SetPlayerPosEx(playerid, 1918.2250,-1619.8477,1770.7469);
					SetPlayerInterior(playerid, 0);
					TogglePlayerControllable(playerid, false);
					defer UnFreezeStation[1000](playerid);
					return 1;
			    }
		    }
		    if(IsPlayerInRangeOfPoint(playerid,2,1771.7123,-1547.5963,9.9116)) {
				if(PlayerInfo[playerid][pJailTime] > 0 || IsACop(playerid)) {
					SetPlayerVirtualWorld(playerid, 0);
					SetPlayerPosEx(playerid, 1918.2250,-1619.8477,1770.7469);
					SetPlayerInterior(playerid, 0);
					TogglePlayerControllable(playerid, false);
					defer UnFreezeStation[1000](playerid);						
					return 1;
				}	
		    }
		    if(IsPlayerInRangeOfPoint(playerid,2,2050.3245,1218.4463,547.9710) && IsACop(playerid)) {
				SetPlayerVirtualWorld(playerid, 4);
				SetPlayerPosEx(playerid, 1798.5109,-1578.3337,14.0848);
				SetPlayerInterior(playerid, 0);
				return 1;
		    }
		    else if(IsPlayerInRangeOfPoint(playerid,2,693.6406,1967.6848,5.5391)) { //OUTSIDE DRUG HOUSE LV
			   SetPlayerInterior(playerid,5);
			   SetPlayerPosEx(playerid,318.5867,1115.4735,1083.8828); //InSIDE DRUG HOUSE LV
			   return 1;
		    }
		    else if(IsPlayerInRangeOfPoint(playerid,2,318.5867,1115.4735,1083.8828)) {
			   SetPlayerInterior(playerid,0);
			   SetPlayerPosEx(playerid,693.6406,1967.6848,5.5391); //Drug House LV
			   return 1;
		    }
		    else if(IsPlayerInRangeOfPoint(playerid,2,1130.5344,-1505.9506,13.6791)) { //Dilisach gi o CNN LS
			   SetPlayerInterior(playerid,14);
			   SetPlayerPosEx(playerid,204.2205,-168.3091,1000.5234); //ben ngoai sach
			   return 1;
		    }		   
		    else if(IsPlayerInRangeOfPoint(playerid,2,1481.1591,-1794.6198,18.7957)) { //CITY HALL OUTSIDE
			   SetPlayerInterior(playerid,3);
			   SetPlayerPosEx(playerid,387.7978,173.8582,1008.3828); //CITY HALL INSIDE
			   return 1;
		    }		   
		    else if(IsPlayerInRangeOfPoint(playerid,2,387.7978,173.8582,1008.3828)) { //InSIDE CITY HALL
			   SetPlayerPosEx(playerid,1481.1591,-1794.6198,18.7957); //OUTSIDE CITY HALL
			   SetPlayerInterior(playerid,0);
			   SetPlayerVirtualWorld(playerid,0);
			   GameTextForPlayer(playerid, string, 1000, 1);
			   return 1;
		    }
		    else if(IsPlayerInRangeOfPoint(playerid,2,1042.4895,1010.4610,11.0000))  {
			   	if(areape == 1) {
				   	SetPlayerInterior(playerid,15);
				   	SetPlayerPosEx(playerid,-1423.5153,935.8321,1036.4756);
				   	return 1;
			   	}
			   	else return SendClientMessage(playerid,COLOR_WHITE,"Nha thi dau su kien dang dong cua.");
		   	}
		    else if(IsPlayerInRangeOfPoint(playerid,2,204.2205,-168.3091,1000.5234)) {
			   SetPlayerInterior(playerid,0);
			   SetPlayerPosEx(playerid,1130.5344,-1505.9506,13.6791); //Sach
			   return 1;
		    }
		    else if(IsPlayerInRangeOfPoint(playerid,2,-1423.5153,935.8321,1036.4756)) {
			   if(areape == 1) {
				   SetPlayerInterior(playerid,0);
				   SetPlayerPosEx(playerid,1042.4895,1010.4610,11.0000);
				   return 1;
			   }
		    }
		    enter_apartament(playerid);
	    }
	    if(newkeys & KEY_YES) {
			if(PlayerInfo[playerid][pAdmin] > 0 && IsPlayerInRangeOfPoint(playerid, 6.0, 1305.959,-1430.014,12.506)) {
				DestroyDynamicObject(gateds[0]);
				DestroyDynamicObject(gateds[1]);			
				defer DealerShipGates[5000]();
				return 1;
			}	

			if(IsPlayerInRangeOfPoint(playerid,3.0, 1804.9772, -1847.8226, 13.5739))  
			{
				Dialog_Show(playerid, DIALOG_KIEMTRANHIEMVU, DIALOG_STYLE_LIST, "KIEM TRA NHIEM VU", "NHIEM VU HANG NGAY\nNHIEM VU MUA HE", "Co", "Da hieu");
			}

			if(InBussines[playerid] > 0)
			{
		    	if(IsPlayerInRangeOfPoint(playerid,2,-104.0142,-22.6778,1000.7188)) {
					Dialog_Show(playerid, DIALOG_DILDO, DIALOG_STYLE_LIST, "Buy dildo", "Double-ended Dildo ($500)\nDildo ($500)\nVibrator ($500)\nSilver Vibrator ($500)\nFlowers ($1,000)", "Ok", "Close");
				    return 1;
				}
		    	if(IsPlayerInRangeOfPoint(playerid,2.0,308.2256,-141.4633,999.6016))  {
					if(PlayerInfo[playerid][pGunLic] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "[ERROR] Ban khong co giay phep sung. Hay lien he voi giao vien de duoc cap."); 
					Dialog_Show(playerid, DIALOG_BUYGUN, DIALOG_STYLE_LIST, "Shop vu khi", "Deagle ($500,000)\nM4 ($1,400,000)\nAK47 ($1,000,000)\nMicro SMG ($700,000)\nShotgun ($400,000)\nBaseball Bat ($50,000)", "Buy", "Exit"); 
					return 1;
				}		

				if(BizzInfo[InBussines[playerid]][bType] == 6)
				{
					if(IsPlayerInRangeOfPoint(playerid,4.0,-27.5654,-89.9433,1003.5469) || IsPlayerInRangeOfPoint(playerid,4.0,-28.8578,-185.1236,1003.5469))
					{
						new szDialog2[1024];
						strcat(szDialog2, "Vat pham\tGia\n");
						strcat(szDialog2, "{FFFFFF}Dien thoai\t{25B336}$25,000\n");
						strcat(szDialog2, "{FFFFFF}Danh ba dien thoai\t{25B336}$10,000\n");
						strcat(szDialog2, "{FFFFFF}Radio tan so\t{25B336}$30,000\n");
						strcat(szDialog2, "{FFFFFF}Bat lua\t{25B336}$7,000\n");	
						strcat(szDialog2, "{FFFFFF}Thuoc la\t{25B336}$10,000\n");	
						strcat(szDialog2, "{FFFFFF}Can xang (gas can)\t{25B336}$20,000\n");
						strcat(szDialog2, "{FFFFFF}Camera\t{25B336}$70,000\n");
						strcat(szDialog2, "{FFFFFF}Backpack\t{25B336}$5,000\n");
						strcat(szDialog2, "{FFFFFF}Vat dung Fisherman\t{25B336}$---\n");
						Dialog_Show(playerid, DIALOG_STORE,DIALOG_STYLE_TABLIST_HEADERS,"Mua:",szDialog2,"Ok","Close");
					}
				}
			}    	
	    	if(PlayerInfo[playerid][pJob] == 0) {
				foreach(new j : Jobs) {
					if(!IsPlayerInRangeOfPoint(playerid, 3.0, JobInfo[j][jPosX], JobInfo[j][jPosY], JobInfo[j][jPosZ])) {
						continue;
					}

					if(isJobDisabled(j)) {
						SendFailMessage(playerid, "Job hien tam ngung hoat dong, cho nang cap");
						return 1;
					}
					if(PlayerInfo[playerid][pLevel] < JobInfo[j][jLevel]) {
						format(string, sizeof(string), "Ban can dat level %d de nhan cong viec %s.",  JobInfo[j][jLevel], JobInfo[j][jName]);
						SendClientMessage(playerid, COLOR_WHITE, string);
						return 1;
					}

					format(string, sizeof(string), "* Chuc mung! Cong viec moi cua ban la %s.", JobInfo[j][jName]);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, string);

					if(PlayerInfo[playerid][pTutorial] == 2) 
			   	   	{
				   	   PlayerInfo[playerid][pTutorial] = 3;
				   	   Tutorial(playerid);
			   	   	}
					if(j == 8) SendClientMessage(playerid, COLOR_LIGHTBLUE, "De dinh vi mot nguoi choi, hay su dung lenh /find.");
					else if(j == 11) SendClientMessage(playerid, COLOR_LIGHTBLUE, "De bat dau lam viec, ban co the su dung lenh /cauca.");
					
					PlayerInfo[playerid][pJob] = j;

					new str[60];
					mysql_format(SQL, str, 60, "UPDATE `users` SET `Job`='%d' WHERE `ID`='%d' LIMIT 1",PlayerInfo[playerid][pJob],PlayerInfo[playerid][pSQLID]);
					mysql_tquery(SQL, str, "", "");

					//if(PlayerInfo[playerid][pNewbieStep] > 0) defer FinishTutorial(playerid);
				}
	    	}
	    	if(Fishing[playerid] == 1) {
				if(FishingKey[playerid] == 0) {
					// va_SendClientMessage(playerid, -1, "Debug: Key: Y, Times: %d", Times[playerid]);
					stop TimeOut[playerid];
					Times[playerid]+=1;
					PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					SetPlayerProgressBarValue(playerid, jProgress[playerid], Times[playerid]*10);
					ShowRandomFishingKey(playerid);
				} 
				else {
					Times[playerid]-=1;
					SetPlayerProgressBarValue(playerid, jProgress[playerid], Times[playerid]*10);
				}
	    	}
			if(InRob[playerid] == 1 && HaveBag[playerid] == 1) { 
				new car = GetClosestVehicle(playerid);
				if(!IsPlayerNearVehicle(playerid, car, 5) && !IsABoat(car)) return 1;
				else if(!IsPlayerNearVehicle(playerid, car, 10) && IsABoat(car)) return 1;				
				if(LastRVehicle[playerid] != car && LastRVehicle[playerid] != 0) return SendClientMessage(playerid, -1, "Ban da khong bo tui tien da cuop vao xe nay.");
				if(IsABike2(car)) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the di an cuop voi mot chiec xe dap/moto!");
				LastRVehicle[playerid] = car;
				HaveBag[playerid] = 0;
				RemovePlayerAttachedObject(playerid,0);
				RemovePlayerAttachedObject(playerid,1);	
				BagTime[playerid] = 0;
				Bags[playerid] ++;
				if(Bags[playerid] >= GetBags(BizRobbed[playerid])) {
					new rand = random( sizeof(RobPos) );
					SetPlayerCheckpointEx(playerid, RobPos[rand][0], RobPos[rand][1], RobPos[rand][2], 8.0);
					format(string, sizeof(string), "* Di den cham do tren ban do de rua tien. Khoang cach: %0.1fm", GetPlayerDistanceFromPoint(playerid, RobPos[rand][0], RobPos[rand][1], RobPos[rand][2]));
					SendClientMessage(playerid, COLOR_YELLOW, string);
					SendClientMessage(playerid, COLOR_YELLOW, "Neu ban khong lai xe / ban khong o trong xe noi ban bo tui tien khi ban vao cham do, ban se that bai.");
					CP[playerid] = 169;
				}
				else {
					format(string, sizeof(string), "* Ban van phai lay them %d tui, quay lai bizz %d.", GetBags(BizRobbed[playerid])-Bags[playerid], BizRobbed[playerid]);
					SendClientMessage(playerid, COLOR_YELLOW, string);
				}
				BagTime[playerid] = 0;	
			}	
			if(JobWorking[playerid] == 1 && PlayerInfo[playerid][pJob] == 10) {
				new car = GetClosestVehicle(playerid);
				if(!IsPlayerNearVehicle(playerid, car, 5) && !IsABoat(car)) return 1;
				else if(!IsPlayerNearVehicle(playerid, car, 10) && IsABoat(car)) return 1;
				if(GetPVarInt(playerid, "InHand") == 1) return 1;
				if(JobVehicle[playerid] != car) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong o gan xe lam viec cua ban!");
				if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Vui long xuong xe!");
				if(!IsPlayerInRangeOfPoint(playerid, 15.0, CheckpointPos[playerid][0], CheckpointPos[playerid][1], CheckpointPos[playerid][2])) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong o gan checkpoint do trong 15m!");
				SetPVarInt(playerid, "InHand", 1);
				SendClientMessage(playerid, COLOR_LGREEN, "Goi hang da duoc lay ra!");
				SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
				SetPlayerAttachedObject( playerid, 6, 1220, 1, 0.299822, 0.663485, -0.036337, 184.311355, 90.004089, 0.000000, 1.000000, 1.000000, 1.000000 );
			}
			if(JobWorking[playerid] == 1 && PlayerInfo[playerid][pJob] == 14) {
				new car = GetClosestVehicle(playerid);
				if(!IsPlayerNearVehicle(playerid, car, 5) && !IsABoat(car)) return 1;
				else if(!IsPlayerNearVehicle(playerid, car, 10) && IsABoat(car)) return 1;							
				if(GetPVarInt(playerid, "PaperHand") == 1) return 1;
				if(JobVehicle[playerid] != car) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong o gan xe lam viec cua ban!");
				if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Vui long xuong xe!");
				if(!IsPlayerInRangeOfPoint(playerid, 15.0, CheckpointPos[playerid][0], CheckpointPos[playerid][1], CheckpointPos[playerid][2])) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong o gan checkpoint do trong 15m!");
				SetPVarInt(playerid, "PaperHand", 1);
				SendClientMessage(playerid, COLOR_LGREEN, "Bao da duoc giao!");
				SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
				SetPlayerAttachedObject(playerid, 6, 2855, 1, 0.299822, 0.663485, -0.036337, 184.311355, 90.004089, 0.000000, 1.000000, 1.000000, 1.000000);
			}
			if(JobWorking[playerid] == 1 && PlayerInfo[playerid][pJob] == 3) {
				new car = GetClosestVehicle(playerid);
				if(!IsPlayerNearVehicle(playerid, car, 5) && !IsABoat(car)) return 1;
				else if(!IsPlayerNearVehicle(playerid, car, 10) && IsABoat(car)) return 1;							
				if(GetPVarInt(playerid, "InHand") == 0) return 1;
				if(JobVehicle[playerid] != car) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong o gan xe lam viec cua ban!");
				SetPVarInt(playerid, "InHand", 0);
				SetPVarInt(playerid, "Pressed", 0);
				SetPlayerSpecialAction(playerid, 0);
				ClearAnimations(playerid);	
				RemovePlayerAttachedObject(playerid, 6);
				if(GetPVarInt(playerid, "Trees") == 7)  {
					SetPVarInt(playerid, "JobStep", 1);
					format(string, sizeof(string), "Di toi cham do tren ban do de giao go!");
					SendClientMessage(playerid, COLOR_YELLOW, string);
					CP[playerid] = 59;
					RemovePlayerAttachedObject(playerid, 6);
					SetPlayerCheckpointEx(playerid, -63.0576,-1121.6006,1.1694, 5.0);
				}	
				
				new object = CreateDynamicObject(1463, -2597.0762, -2638.4270, -5.3536, -87.6999, 90.4001, -87.1805);
				if(GetPVarInt(playerid, "Trees") == 1) AttachDynamicObjectToVehicle(object, JobVehicle[playerid], 0.000000, 1.500000, 0.000000, 0.0, 0.0, 0.0), WoodObject[playerid][0] = object;
				if(GetPVarInt(playerid, "Trees") == 2) AttachDynamicObjectToVehicle(object, JobVehicle[playerid], 0.000000, -0.200000, 0.000000, 0.0, 0.0, 0.0), WoodObject[playerid][1] = object;
				if(GetPVarInt(playerid, "Trees") == 3) AttachDynamicObjectToVehicle(object, JobVehicle[playerid], 0.000000, -1.899999, 0.000000, 0.0, 0.0, 0.0), WoodObject[playerid][2] = object;
				if(GetPVarInt(playerid, "Trees") == 4) AttachDynamicObjectToVehicle(object, JobVehicle[playerid], 0.000000, -3.599999, 0.000000, 0.0, 0.0, 0.0), WoodObject[playerid][3] = object;
				if(GetPVarInt(playerid, "Trees") == 5) AttachDynamicObjectToVehicle(object, JobVehicle[playerid], 0.000000, 0.600000, 0.500000, 0.0, 0.0, 0.0), WoodObject[playerid][4] = object;
				if(GetPVarInt(playerid, "Trees") == 6) AttachDynamicObjectToVehicle(object, JobVehicle[playerid], 0.000000, -1.000000, 0.500000, 0.0, 0.0, 0.0), WoodObject[playerid][5] = object;
				if(GetPVarInt(playerid, "Trees") == 7) AttachDynamicObjectToVehicle(object, JobVehicle[playerid], 0.000000, -2.599999, 0.500000, 0.0, 0.0, 0.0), WoodObject[playerid][6] = object;	
				BagTime[playerid] = 0;	
			}
	    }
	    if(newkeys == KEY_CTRL_BACK) {
	    	if(Fishing[playerid] == 1) {
				if(FishingKey[playerid] == 2) {
					// va_SendClientMessage(playerid, -1, "Debug: Key: H, Times: %d", Times[playerid]);
					stop TimeOut[playerid];
					TimeOut[playerid] = Timer:0;
					Times[playerid]+=1;
					PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					ShowRandomFishingKey(playerid);
					SetPlayerProgressBarValue(playerid, jProgress[playerid], Times[playerid]*10);
				}
				else {
					Times[playerid]-=1;
					SetPlayerProgressBarValue(playerid, jProgress[playerid], Times[playerid]*10);
				}
	    	}
	    }
		if(newkeys & KEY_WALK) {
			if(PlayerInfo[playerid][pJob] == 3 && JobWorking[playerid] == 1 && GetPVarInt(playerid, "JobStep") == 0 && GetPVarInt(playerid, "InHand") == 0) {
				if(GetPVarInt(playerid, "Pressed") == 1) return 1;
				for(new i = 0; i < sizeof(WoodPos); i++) {
					if(IsPlayerInRangeOfPoint(playerid, 3.0, WoodPos[i][0], WoodPos[i][1], WoodPos[i][2])) {
						SetPVarInt(playerid, "Pressed", 1);
						defer WoodCutter[10000](playerid);
						Freezed[playerid] = 1;
						ApplyAnimation(playerid, "SWORD", "sword_4", 4.0, 1, 1, 1, 0, 0);
						ServerWeapon(playerid, 9, 9999);		
						PlayerTextDrawSetString(playerid, InfosTD, "Xin doi...");
						PlayerTextDrawShow(playerid, InfosTD);					
					}
				}
			}
		}	  
		if(newkeys & KEY_NO) {
	    	if(Fishing[playerid] == 1) {
				if(FishingKey[playerid] == 1) {
					// va_SendClientMessage(playerid, -1, "Debug: Key: N, Times: %d", Times[playerid]);
					stop TimeOut[playerid];
					Times[playerid]+=1;
					PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					ShowRandomFishingKey(playerid);
					SetPlayerProgressBarValue(playerid, jProgress[playerid], Times[playerid]*10);
				} 
				else {
					Times[playerid]-=1;
					SetPlayerProgressBarValue(playerid, jProgress[playerid], Times[playerid]*10);
				}
				return 1;
	    	}
	    	if(PlayerInfo[playerid][pJob] != 0) {
	    		foreach(new j : Jobs) {
					if(IsPlayerInRangeOfPoint(playerid, 3.0, JobInfo[j][jPosX], JobInfo[j][jPosY], JobInfo[j][jPosZ])) {
						new str[128];
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Ban da tu bo cong viec cua minh.");
						PlayerInfo[playerid][pJob] = 0;
						UsedFind[playerid] = 0;
						DisablePlayerCheckpointEx(playerid);
						PlayerTextDrawHide(playerid, FindTD);
						targetfind[playerid] = -1;
						CP[playerid] = 0;
						DisablePlayerCheckpointEx(playerid);
						RemovePlayerAttachedObject(playerid, 2);
						JobWorking[playerid] = 0;
						PlayerTextDrawHide(playerid, JobTD);
						if(JobVehicle[playerid] != 0) DestroyVehicle(JobVehicle[playerid]), JobVehicle[playerid] = 0;
						if(Trailer[playerid] != 0) { DestroyVehicle(Trailer[playerid]); Trailer[playerid] = 0;  }
						mysql_format(SQL, str,128,"UPDATE `users` SET `Job`='%d' WHERE `ID`='%d' LIMIT 1",PlayerInfo[playerid][pJob],PlayerInfo[playerid][pSQLID]);
						mysql_tquery(SQL, str, "", "");
						if(playerObject[playerid] != 0) DestroyPlayerObject(playerid, playerObject[playerid]), playerObject[playerid] = 0;
						if(playerObject2[playerid] != 0) DestroyObject(playerObject2[playerid]), playerObject2[playerid] = 0;
						DisablePlayerRaceCheckpointEx(playerid);
						DestroyProgress(playerid, 1);
						DestroyWoodObject(playerid);
						if(PlayerInfo[playerid][pJob] == 3) ResetWeapons(playerid);
						JobLeftTime[playerid] = 0;
						BagTime[playerid] = 0;
						return 1;
					}
				}
			}	    	
		} 
	    if(newkeys & KEY_JUMP && !(oldkeys & KEY_JUMP) && GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_CUFFED) ApplyAnimation(playerid, "GYMNASIUM", "gym_jog_falloff",4.1,0,1,1,0,0);		
	    if(newkeys != KEY_FIRE && newkeys & KEY_CROUCH && (IsACBUGWeapon(playerid) && RELEASED(KEY_FIRE)))
	    {
	    	ApplyAnimation ( playerid , "PED" , "getup" , 4.1 , 0 , 0 , 0 , 0 , 0 ) ;
			SendClientMessage(playerid,COLOR_WARNING,"Server khong cho phep C-Bug, hay dung lai truoc khi ban bi duoi ra dao khi!");
			TogglePlayerControllable(playerid, false);
		    defer UnFreezeStation[7000](playerid);
	    }
	    if(newkeys & KEY_SPRINT) {
			if(gPlayerUsingLoopingAnim[playerid] == 1) StopLoopingAnim(playerid);
	    }	    
    } 	
    if(newkeys & KEY_NO) {   	
		LockCarFunction(playerid);
    }
    if(newkeys & KEY_HANDBRAKE)
    {
       if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_USEJETPACK && PlayerInfo[playerid][pAdmin] < 1) {
		   format(string, sizeof(string), "AdmWarning: %s(%d) da bi kick vi co mot jetpack.",GetName(playerid),playerid);
		   if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(COLOR_WARNING, string,1);
		   KickEx(playerid);
	   }
    }
    if(newkeys & KEY_CROUCH) {
		if(PlayerInfo[playerid][pMember] == 8) {
			if(IsPlayerInRangeOfPoint(playerid, 13.0, 2423.8899, -2090.3191, 12.5429)) {
				if(GateStatus == 0) {
					GateStatus = 1;
					MoveDynamicObject(ttcgate[0], 2423.8462, -2074.8150, 15.3476, 3.0);
					MoveDynamicObject(ttcgate[1], 2423.8462, -2103.9908, 15.3476, 3.0);
					SetTimer("ResetGates", 3000, false);
				}
			}
		}	
		else if(PlayerInfo[playerid][pMember] == 12 && taxiBarTimer == Timer:0 && IsPlayerInRangeOfPoint(playerid, 15.0, 1811.57495, -1894.22595, 13.54720)) {
			MoveObject(taxibar, 1811.57495, -1894.22595, 13.54720, 0.15, 0.0, 0.0, 90.0);
			taxiBarTimer = defer taxibaraclose[9000]();
			return 1;
		}	
		else if(IsACop(playerid)) {
			if(IsPlayerInRangeOfPoint(playerid, 15.0,1588.6552, -1637.9025, 15.0358)) {
				MoveObject(gatelspd,1596.7352,-1637.9025, 15.0358,2); //1588.6552, -1637.9025, 15.0358
				defer lspdgateclose();
				return 1;
			}
			if(IsPlayerInRangeOfPoint(playerid, 15.0,135.2833, 1941.3331, 21.6932)) {
				MoveObject(gateng,122.0023, 1941.4100, 21.6932,2);
				defer nggateclose();
				return 1;
			}
			if(IsPlayerInRangeOfPoint(playerid, 15.0,1544.7007, -1630.7527, 13.2983)) {
				MoveObject(lspdbar,1544.7007, -1630.7527, 13.2983,1,0.0000, 0.0000, 90.0000);
				defer lspdbarclose();
				return 1;
			}
			if(IsPlayerInRangeOfPoint(playerid, 15.0,2293.8513, 2497.67554, 4.53215)) {
				MoveDynamicObject(gatelvpd[0], 2293.8513, 2497.6755, -2, 5.0);
				defer LVPDGates[5000](1);
				return 1;
			}		   
			if(IsPlayerInRangeOfPoint(playerid, 15.0,2335.2009, 2443.6992, 1.8997)) {
				MoveDynamicObject(gatelvpd[1], 2335.2009, 2443.6992, 1.8997, 5.0);
				defer LVPDGates[5000](2);
				return 1;
			}	   
			if(IsPlayerInRangeOfPoint(playerid, 15.0,2238.2146, 2450.2695, 10.6961)) {
				MoveDynamicObject(gatelvpd[2], 2238.21460, 2450.26953, 10.69610, 1, 0.00000, 0.00000, 90.00000);
				defer LVPDGates[5000](3);
				return 1;
			}
		}	      
    }
    return 1;
}
public OnVehicleSpawn(vehicleid) {	
	CarRadio[vehicleid] = 0;	
	SetVehicleHealth(vehicleid, 999);
	if(FindSpawnID(vehicleid) != 0) {
		new carid = FindSpawnID(vehicleid);
		SetTunning(carid);
		CarInfo[carid][cTax] += 1500 + random(100);
		new query[256];
		format(query, sizeof(query), "UPDATE `cars` SET `Tax`='%d' WHERE `ID`='%d'", CarInfo[carid][cTax], carid);
		mysql_query(SQL, query);		
	}
	else Gas[vehicleid] = 100;
	SetVehicleColor(vehicleid);
	if(Carspawn[vehicleid] == vehicleid) {
		DestroyVehicle(vehicleid);
		Carspawn[vehicleid] = 0;
	}
	// if(ServerVehicles[vehicleid][vModel] == 596) {
	// 	SetVehicleHealth(vehicleid, 1650);
	// }
	return 1;
}
public OnPlayerPickUpDynamicPickup(playerid, pickupid)
{
	new str[180];
	for(new i = 0; i < MAX_COBJECTS; i++) {
		if(ObjectInfo[i][oID] != 0) {
			if(pickupid == ObjectInfo[i][oID]) {
				new id = GetObjects();
				if(PlayerInfo[playerid][pAdmin] != 0) return 1;
				GivePlayerCash(playerid, ObjectInfo[i][oMoney]);				
				if(id == 1) {
					format(str, 256, "NR AdmBot: Su kien vua ket thuc! %s tim thay hop qua va gianh chien thang $%s.", GetName(playerid), FormatNumber(ObjectInfo[i][oMoney]));
					SCMTA(COLOR_ORANGE, str);
				}
				else {
					format(str, 256, "NR AdmBot: %s tim thay hop qua va gianh chien thang  $%s.", GetName(playerid), FormatNumber(ObjectInfo[i][oMoney]));
					SCMTA(COLOR_ORANGE, str);				
					format(str, 256, "NR AdmBot: Hien tai, van con %d hop qua chua ai tim thay!", id-1);
					SCMTA(COLOR_ORANGE, str);				
				}
				RemoveObject(i);
			}
		}
	}

	foreach(new i: iPickUp) {		
		if(pickupid == Pickups[i][psID]) {
			if(Pickups[i][psWar] == 1337) return 1;
			if(Pickups[i][psType] == 0) {
				SendClientMessage(playerid, COLOR_LIGHTBLUE, "Ban nhat duoc mot First Aid Kit. (+10 HP)");
				new Float:HP;
				GetPlayerHealthEx(playerid,HP);
				if(HP < 89) SetPlayerHealthEx( playerid, HP+10);
				else SetPlayerHealthEx( playerid, 99);
			}
			else if(Pickups[i][psType] == 1) {
				new gunname[32];
				GetWeaponName(Pickups[i][psWeapon], gunname, sizeof(gunname));
				format(str, sizeof(str), "Ban da tim thay %s voi %d vien dan o duoi dat.", gunname, Pickups[i][psAmmo]);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, str);
				ServerWeapon(playerid, Pickups[i][psWeapon], Pickups[i][psAmmo]);
			}			
			else if(Pickups[i][psType] == 2) {
				format(str, sizeof(str), "Ban da tim thay $%d rot duoi dat.", Pickups[i][psAmount]);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, str);
				GivePlayerCash(playerid, Pickups[i][psAmount]);
			}
			else if(Pickups[i][psType] == 3) {
				format(str, sizeof(str), "Ban da tim thay %d vat lieu rot duoi dat.", Pickups[i][psAmount]);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, str);
				PlayerInfo[playerid][pMats] += Pickups[i][psAmount];
				Update(playerid, pMatsx);
			}
			DestroyDynamicPickup(Pickups[i][psID]);
			Pickups[i][psType] = 0;
			Pickups[i][psID] = 0;
			Pickups[i][psWar] = 0;
			Pickups[i][psAmount] = 0;
			PlayerPlaySound(playerid, 1150, 0.0, 0.0, 10.0);	
			Iter_SafeRemove(iPickUp, i, i);
		}	
	}

	if(pickupid == StuntPickup && ActiveEvent == 1) {
		if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong o trong xe!");
		if(GetVehicleModel(GetPlayerVehicleID(playerid)) != 522) return SendClientMessage(playerid, -1, "Ban khong o trong NRG-500!");		
		DestroyDynamicPickup(StuntPickup);
		StuntPickup = 0;
		ActiveEvent = 0;
		EventTime = 1;
		format(str, sizeof(str), "(( AdmBot: {FF9696}%s (%d){A9C4E4} da chien thang su kien va gianh duoc $%s. Chuc mung! ))", GetName(playerid), playerid, FormatNumber(EventMoney));
		SCMTA(COLOR_CLIENT, str);
		GivePlayerCash(playerid, EventMoney);		
	}	
    return 1;
}
public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
    foreach(new i: Player) {
		if(Spectate[i] == playerid) {
			TogglePlayerSpectating(i, true);
			SetPlayerInterior(i, newinteriorid);
			SetPlayerVirtualWorld(i, GetPlayerVirtualWorld(playerid));
			if(IsPlayerInAnyVehicle(playerid)) PlayerSpectateVehicle(i, GetPlayerVehicleID(playerid));
			else PlayerSpectatePlayer(i, playerid);	
		}
	}

    return 1; 
}

new LastChat[MAX_PLAYERS];
public OnPlayerText(playerid, text[]) {
	if(FaceReclama(text)) {
		Reclama(playerid, text);
		return 0;
	}
	static Text[MAX_PLAYERS][128]; 
	if(Text[playerid][0] != '\0' && !strcmp(text,Text[playerid],true)) return 0;

	// text[0] = toupper(text[0]);

	strcat((Text[playerid][0]='\0', Text[playerid]), text, 128);		

	if(GetTickCount() - LastChat[playerid] < 1500) {
		SendFailMessage(playerid, "Ban can doi 1.5 giay truoc khi chat lai!");
		return 0;
	}
	LastChat[playerid] = GetTickCount();

	new string[180];

    if(PlayerInfo[playerid][pMuted] == 1)  {
		format(string, sizeof(string), "Ban khong the noi chuyen ngay bay gio! Ban bi cam chat. (%d giay)",PlayerInfo[playerid][pMuteTime]);
		SendClientMessage(playerid, COLOR_GREY, string);
		return 0;
	}
	assert(AntiFlood_Check(playerid));

	if(Iter_Contains(AdminDuty, playerid)) {
		format(string, sizeof(string), "(( Admin %s: %s ))", GetName(playerid), text);
		ProxDetector(20.0, playerid, string,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);

		////InsertLog(playerid, string, LOG_CHAT);	

		return 0;
	}
	if(TalkingLive[playerid] != 255) {
		if(PlayerInfo[playerid][pLeader] == 9 || PlayerInfo[playerid][pMember] == 9) format(string, sizeof(string), "Reporter %s: %s", GetNameEx(playerid), text);
		else format(string, sizeof(string), "Player %s: %s", GetNameEx(playerid), text);
		OOCNews(COLOR_LIGHTGREEN, string);
		return 0;
	}
	if(Mobile[playerid] != 255) {
		new idx, tmp[180];
		tmp = strtok(text, idx);
		format(string, sizeof(string), "%s noi (dien thoai): %s", GetNameEx(playerid), text);
		ProxDetector(20.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
		if(IsPlayerConnected(Mobile[playerid])) {
			if(Mobile[Mobile[playerid]] == playerid) {
				if(PlayerInfo[Mobile[playerid]][pSpeaker] == 1) ProxDetector(20.0, Mobile[playerid], string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
				else  SendClientMessage(Mobile[playerid], COLOR_YELLOW,string);
			}
		}
		////InsertLog(playerid, string, LOG_CHAT);	
		return 0;
	}
	if(realchat) {
		if(IsPlayerLogged[playerid] == 0) return 0;
		if(PaintType[playerid] != 0) format(string, sizeof(string), "{5088BF}%s [%d kills]: {FFFFFF}%s", GetNameEx(playerid), PKills[playerid], text);
		else format(string, sizeof(string), "%s: {FFFFFF}%s", GetNameEx(playerid), text);
		if(PaintType[playerid] != 0) {
			SendPaintMessage(PaintType[playerid], -1, string);
			return 0;
		}
		else if(GetPVarInt(playerid, "Cover") == 1) ProxDetector(20.0, playerid, string,COLOR_GREY,COLOR_GREY,COLOR_GREY,COLOR_GREY,COLOR_GREY);
		else if(PlayerInfo[playerid][pColor] >= 1) {
			format(string, sizeof(string), "{%s}%s: {FFFFFF}%s", serverColors(PlayerInfo[playerid][pColor]), GetNameEx(playerid), text);
			ProxDetector(20.0, playerid, string,-1,-1,-1,-1,-1);
		}
		else if(PlayerInfo[playerid][pHelper] >= 1 || PlayerInfo[playerid][pAdmin] >= 1) ProxDetector(20.0, playerid, string,0xBA0404FF,0xBA0404FF,0xBA0404FF,0xBA0404FF,0xBA0404FF);
		else if(PlayerInfo[playerid][pYT] >= 1) ProxDetector(20.0, playerid, string,0x388BFFFF,0x388BFFFF,0x388BFFFF,0x388BFFFF,0x388BFFFF);
		else ProxDetector(20.0, playerid, string,COLOR_GREY,COLOR_GREY,COLOR_GREY,COLOR_GREY,COLOR_GREY);
		format(string, sizeof(string), "%s : (chat) %s", GetNameEx(playerid),text);
		Log("logs/Chat.log", string);	
		
		format(string, sizeof(string), "\"%s\"", text);
		SetPlayerChatBubble(playerid, text, COLOR_CHATBUBBLE, 10.0, 10000);

	    if(TEvent != 0)
	    {
			switch(TEvent)
			{
				case 1, 2:
				{
					if(!isnull(text) && strlen(FastEventText) != 0 && !strcmp(text, FastEventText, false)) 
					{
						format(string, 144, "Fast Event: {FFA200}%s {ADD63C}da chien thang %s event va nhan duoc %s$.", GetName(playerid), TEvent == 1 ? ("fast") : ("scramble"), FormatNumber(TEventReward));
						GivePlayerCash(playerid, TEventReward);
						SCMTA(0xADD63CFF, string);
						FastEventText[0] = '\0', TEventReward = 0, TEvent = 0;
						checkbpquest(playerid, 2, 5);
						checkbpquest(playerid, 3, 3);
					}
				}
				case 3:
				{
					if(!isnull(text) && MathEvent_Active && strval(text) == MathEvent_Result)
					{
						GivePlayerCash(playerid, TEventReward);
						format(string, sizeof(string), "Math Event: {FFA200}%s {ADD63C}da lam toan chinh xac va nhan duoc %s$, cau tra loi la ''{FFA200}%d{ADD63C}''.", GetName(playerid), FormatNumber(TEventReward), MathEvent_Result);
						SCMTA(0xADD63CFF, string);
						MathEvent_Active = false, MathEvent_Result = 0, FastEventText[0] = '\0', TEventReward = 0, TEvent = 0;
					}
				}
				case 4:
				{
					if(!isnull(text) && strlen(FastEventText) != 0 && !strcmp(text, FastEventText, true)) 
					{
						GivePlayerCash(playerid, TEventReward);
						format(string,sizeof(string),"Trivia Event: {FFA200}%s {ADD63C}da chien thang event cau hoi va nhan duoc %s$, cau tra loi la ''{FFA200}%s{ADD63C}''.", GetName(playerid), FormatNumber(TEventReward), FastEventText);
						SCMTA(0xADD63CFF, string);
						checkbpquest(playerid, 1, 4);
						TriviaText[0] = '\0', FastEventText[0] = '\0', TEventReward = 0, TEvent = 0;
					}
				}
			}
	    }	
	}
	return 0;
}
public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
    if(ServerVehicles[vehicleid][vFaction] != 0) SetVehicleColor(vehicleid);
	SetVehicleHealth(vehicleid, 999);
    // if(ServerVehicles[vehicleid][vModel] == 596) {
	// 	SetVehicleHealth(vehicleid, 1650);
	// }
	// if(ServerVehicles[vehicleid][vModel] == 596) {
	// 	SetVehicleHealth(vehicleid, 1650);
	// 	// new ThanhCops = CreateObject(3280, 0,0,0,   0.00000, 0.00000, 0.00000);
	// 	// AttachObjectToVehicle(ThanhCops, vehicleid, -0.13111, 2.79434, -0.29735, 0.000000, 0.000000, 0.000000);

	// }
	// if(ServerVehicles[vehicleid][vModel] == 599) {
	// 	SetVehicleHealth(vehicleid, 2150);
	// }
	// if(ServerVehicles[vehicleid][vModel] == 427) {
	// 	SetVehicleHealth(vehicleid, 6500);
	// }
    return 1;
}
public OnVehicleDeath(vehicleid, killerid)
{
	if(FindSpawnID(vehicleid) != 0) {
		new carid = FindSpawnID(vehicleid);
		CarInfo[carid][cLastPos][0] = CarInfo[carid][cLocationx];
		CarInfo[carid][cLastPos][1] = CarInfo[carid][cLocationy];
		CarInfo[carid][cLastPos][2] = CarInfo[carid][cLocationz];						
		if(CarInfo[carid][cPoints] >= 1) CarInfo[carid][cPoints] -= 1;
		CarInfo[carid][cTax] += 30 + random(10);
		new query[256];
		format(query, sizeof(query), "UPDATE `cars` SET `Points`='%d', `Tax`='%d' WHERE `ID`='%d'", CarInfo[carid][cPoints], CarInfo[carid][cTax], carid);
		mysql_query(SQL, query);
	}
	
	foreach(new i: Player) {
		if(IsPlayerLogged[i] == 1) {
			if(LastCar[i] == vehicleid && InEvent[i] == 1) SpawnPlayer(i), InEvent[i] = 0, LastCar[i] = 0;
			if(HireCar[i] == vehicleid) return SendClientMessage(i, -1, "Ban da bi mat chiec xe thue."), HireCar[i] = -1;
		}
	}
	// foreach(new i: Player) {
	// 	if(IsPlayerLogged[i] == 1) {
	// 		if(PlayerInfo[i][pWantedLevel] != 0 && IsACop(killerid))
	// 		{
	// 			new Float:hp;
	// 			GetVehicleHealth(vehicleid, hp);
	// 			if(hp < 255.0) {
	// 			new Float:slx, Float:sly, Float:slz;
	// 			SetPlayerHealthEx(i, 150);
	// 			GetPlayerPos(i, slx, sly, slz);
	// 			SetPlayerPosEx(i, slx, sly, slz+10);
	// 			}
	// 		}
	// 	}
	// }
 	new engine,lights,alarm,doors,bonnet,boot,objective;
 	vehEngine[vehicleid] = 0;
	GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
 	SetVehicleParamsEx(vehicleid,VEHICLE_PARAMS_OFF,lights,alarm,doors,bonnet,boot,objective);
	StopAudioStreamForPlayersInCar(vehicleid);
 	return 1;
}
public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{	
	// new targetplayer = GetPlayerTargetPlayer(playerid);
	// if(targetplayer != INVALID_PLAYER_ID) BGuard::AttackPlayer(playerid, targetplayer);
	if(hittype == BULLET_HIT_TYPE_OBJECT) //sanhopqua
    {
    	if(weaponid == 31 || weaponid == 24 || weaponid == 26 || weaponid == 29 || weaponid == 30 || weaponid == 33 || weaponid == 25)
    	{
    		if(azisceva == 1) return 1;
			if(hitid == cadouzburator)
			{
				new dmg = 5;
				cadouviata -= dmg,cadoubani[playerid] += 850,dmgdat[playerid] += dmg,cadoulabel();
				if(cadoutimeractiv[playerid] == 0) {
					if(cadoumesaj != 0) return 1;
					cadoutimer[playerid] = repeat updatecadoubar[100](playerid);
					cadoutimeractiv[playerid] = 1;
				}
				if(cadouviata <= 0) 
				{
					cadoumort = 1,cadoumsg = 0,cadoulbl = 0,cadoulevel = 0,azisceva = 1,cadoumesaj = 1;
					SetTimer("cadouzb", 7200000, false);
					new Float:pos[3];
					GetObjectPos(cadouzburator, pos[0],pos[1],pos[2]);
					collectobject = CreateObject(1577,  pos[0],pos[1],pos[2], 0,0,0, 100.0);UpdateDynamic3DTextLabelText(Cadolabel, COLOR_WHITE, "De lay phan thuong /collectgift!");
					foreach(new i: Player) {
					if(dmgdat[i] > 500) cadourp[i] = RandomMinMax(5, 10), cadoupp[i] = 1 + random(6);
					if(dmgdat[i] > 0) SendClientMessage(i,COLOR_MONEY, "[GIFTBOX] De lay phan thuong, hay su dung /collectgift!");
					SCMTA(COLOR_MONEY, "[GIFTBOX] De xem bang xep hang nguoi tham gia /topevent!");
					stop cadoutimer[i];
					PlayerTextDrawHide(i, cadouzburatorPTD[0]),DestroyPlayerProgressBar(i, cadouBAR[i]),DestroyObject(cadouzburator),DestroyObject(flamazburator);
				}
   			}	 
			}
   		} 
    }
    else
    {
		if(weaponid == 9 && JobWorking[playerid] == 1 && PlayerInfo[playerid][pJob] == 3) ResetWeapons(playerid), SendClientMessage(playerid, COLOR_WARNING, "Ban khong duoc phep lam dung vu khi trong cong viec!");
		if(GetPlayerAmmo(playerid) == 1) {
			SetPlayerArmedWeapon(playerid, 0);
			WeaponAmmo[playerid][GetWeaponSlot(weaponid)] = 0;
			Weapons[playerid][weaponid] = 0;
		}
		else WeaponAmmo[playerid][GetWeaponSlot(weaponid)] --;
    }
	
    if(weaponid == 24)
    {
		if((gettime() - shotTime[playerid]) < 1) shot[playerid] += 1;
		else shot[playerid] = 0;
		if(shot[playerid] > 10) {
			new string[184];
			format(string, sizeof(string), "AdmWarning: %s(%d) da bi kick vi su dung rapid fire.",GetName(playerid),playerid);
			SendAdminMessage(COLOR_WARNING, string,1);
			KickEx(playerid);
		}
		shotTime[playerid] = gettime();
    }	
    return 1;
}
public OnPlayerStreamIn(playerid, forplayerid) {
	
	/*if(!IsPCPlayer(forplayerid)) {
		ShowPlayerNameTagForPlayer(forplayerid, playerid, 1);
	}
	else {
		ShowPlayerNameTagForPlayer(forplayerid, playerid, 0);
	}*/
	if(PlayerMobileInfo[playerid][isMobile] == false) ShowPlayerNameTagForPlayer(playerid, forplayerid, 0);
	if(PlayerHit[playerid] != -1) ShowPlayerNameTagForPlayer(forplayerid, playerid, 0);
	SetHitStreamIn(playerid, forplayerid);

	return 1;
}

forward SetHitStreamIn(playerid, forplayerid);
public SetHitStreamIn(playerid, forplayerid) {
	new iswar = 0, attackers, defenders;
	/*if(!IsPCPlayer(forplayerid)) {
		ShowPlayerNameTagForPlayer(forplayerid, playerid, 1);
	}
	else {
		ShowPlayerNameTagForPlayer(forplayerid, playerid, 0);
	}*/
	if(PlayerHit[playerid] != -1) ShowPlayerNameTagForPlayer(forplayerid, playerid, 0);
    for(new i = 1; i < turfsss && iswar == 0; i++) {
		attackers = WarInfo[i][wAttacker];
		defenders = WarInfo[i][wFaction];
		if(WarInfo[i][wTime] > 1 && attackers != 0 && defenders != 0) {
			if( (PlayerInfo[playerid][pMember] == attackers || PlayerInfo[playerid][pMember] == defenders) && (PlayerInfo[forplayerid][pMember] == attackers || PlayerInfo[forplayerid][pMember] == defenders) ) iswar = 1;
		}
    }
	
	if(PaintType[playerid] == PaintType[forplayerid] && PaintType[playerid] != 0 )
	{
		SetPlayerMarkerForPlayer( playerid, forplayerid, COLOR_LIGHTRED );
		SetPlayerMarkerForPlayer( forplayerid, playerid, COLOR_LIGHTRED );
	}
	else if(InEvent[playerid] == 1 && InEvent[forplayerid] == 1) {
		SetPlayerMarkerForPlayer( playerid, forplayerid, GetPlayerColor( forplayerid ) );
		SetPlayerMarkerForPlayer( forplayerid, playerid, GetPlayerColor( playerid ) );
	}
	else if(Iter_Contains(PlayerInRace, playerid) && Iter_Contains(PlayerInRace, forplayerid)) {
		SetPlayerMarkerForPlayer( playerid, forplayerid, GetPlayerColor( forplayerid ) );
		SetPlayerMarkerForPlayer( forplayerid, playerid, GetPlayerColor( playerid ) );
	}
	else if(IsACop(playerid) && OnDuty[playerid] == 1 && PlayerInfo[forplayerid][pWantedLevel] != 0) {
		SetPlayerMarkerForPlayer( playerid, forplayerid, 0xe3336d00 );
	}	
	else if(iswar == 1) {
		if((PlayerInfo[playerid][pMember] == attackers || PlayerInfo[playerid][pMember] == defenders) && (PlayerInfo[forplayerid][pMember] == attackers || PlayerInfo[forplayerid][pMember] == defenders)) {
			SetPlayerMarkerForPlayer(playerid, forplayerid, GetPlayerColor( forplayerid ) );
			SetPlayerMarkerForPlayer(forplayerid, playerid, GetPlayerColor( playerid ) );
		}
		else {
			SetPlayerMarkerForPlayer(playerid, forplayerid, ( GetPlayerColor( forplayerid ) & 0xFFFFFF00));
			SetPlayerMarkerForPlayer(forplayerid, playerid, ( GetPlayerColor( playerid ) & 0xFFFFFF00));
		}
	}	
	else
	{
		SetPlayerMarkerForPlayer( playerid, forplayerid, ( GetPlayerColor( forplayerid ) & 0xFFFFFF00 ) );
		SetPlayerMarkerForPlayer( forplayerid, playerid, ( GetPlayerColor( playerid ) & 0xFFFFFF00 ) );
	}
	return 1;
}

forward SetHitStreamOut(playerid, forplayerid);
public SetHitStreamOut(playerid, forplayerid) {
	/*if(!IsPCPlayer(forplayerid)) {
		ShowPlayerNameTagForPlayer(forplayerid, playerid, 1);
	}
	else {
		ShowPlayerNameTagForPlayer(forplayerid, playerid, 0);
	}*/
	if(PlayerHit[playerid] != -1) ShowPlayerNameTagForPlayer(forplayerid, playerid, 0);
    SetPlayerMarkerForPlayer( playerid, forplayerid, ( GetPlayerColor( forplayerid ) & 0xFFFFFF00 ) );
	SetPlayerMarkerForPlayer( forplayerid, playerid, ( GetPlayerColor( playerid ) & 0xFFFFFF00 ) );
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid) {

	if(PlayerMobileInfo[playerid][isMobile] == false) ShowPlayerNameTagForPlayer(playerid, forplayerid, 0);
	SetHitStreamOut(playerid, forplayerid);	

	return 1;
}

public OnPlayerModelSelection(playerid, response, listid, modelid) {
    if(listid == cobj)
    {
		if(!response) return 1;
		new Float:ploca, Float: POSS[3];
		GetPlayerPos(playerid, POSS[0], POSS[1], POSS[2]);
		SetPlayerPosEx(playerid, POSS[0], POSS[1]+3.8, POSS[2]);
		GetPlayerFacingAngle(playerid,ploca), CreateRb(playerid,modelid,POSS[0], POSS[1], POSS[2]+1.0,ploca);
    }
	if(listid == furnitures) {
		if(response) {
			if(modelid == 19076) {
				if(CountHouseObject(PlayerInfo[playerid][pHouse], modelid) >= 1) return SendClientMessage(playerid, COLOR_LGREEN, "[ERROR] Ban da co mot cai cay trong nha!");
			}
			if(modelid == 19054 || modelid == 19055 || modelid == 19056) {
				new cadouri[3];
				cadouri[0] = CountHouseObject(PlayerInfo[playerid][pHouse], 19054);
				cadouri[1] = CountHouseObject(PlayerInfo[playerid][pHouse], 19055);
				cadouri[2] = CountHouseObject(PlayerInfo[playerid][pHouse], 19056);
				if(cadouri[0] + cadouri[1] + cadouri[2] >= 4) return SendClientMessage(playerid, COLOR_LGREEN, "[ERROR] Ban da co 5 mon qua trong nha! Ban khong the dat them.");		
			}	
			new Float: Pos[3];
			GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
			EditHouse[playerid] = 1;
			EditModel[playerid] = modelid;
			ObjectEdited[playerid] = CreateDynamicObject(modelid, Pos[0]+4, Pos[1], Pos[2], 0, 0, 0);
			SendClientMessage(playerid, COLOR_YELLOW, "Noi that da duoc tao!");
			SendClientMessage(playerid, COLOR_YELLOW, "De di chuyen camera, nhan phim SPACE va di chuyen doi tuong, nhap vao cac truc do (X,Y,Z)");
			SendClientMessage(playerid, COLOR_YELLOW, "Neu ban khong the duy chuyen cac truc, hay mo samp.exe bang quyen quan tri vien (Run As Administrator).");
			EditDynamicObject(playerid, ObjectEdited[playerid]);
		}
		return 1;
	}
    if(listid == skinlist)
    {
		if(response) {
			if(GetPlayerCash(playerid) < 1000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co du tien!");
			// if(Player_GetSkinSlot(playerid, modelid) != -1) return SendClientMessage(playerid, -1, "Ban da so huu skin nay.");
			// new const success = Player_AddItem(playerid, ItemType:item_type_skin, modelid, 100);
			// if(success == -1) {
			// 	return SendClientMessage(playerid,COLOR_LGREEN, "ERROR: Ban da su dung het inventory slot!");
			// }
			
			if(checkslotinv(playerid) == 24) return SendClientMessage(playerid, -1, "Tui do cua ban da day.");
			if(checkslotskin(playerid) == 10) return SendClientMessage(playerid, -1, "Ban da full slot skin.");
			if(checktrungskin(playerid,modelid) != 0) return SendClientMessage(playerid, -1, "Ban da so huu skin nay.");
			if(Inventory_GetFreeID(playerid, 1) == -1) Inventory_Add(playerid,"Skins", modelid, 1, 2);
			else Inventory_Add(playerid,"Skins", modelid, 1, 1);
			//if(total_skins(playerid) ==  10) return SendClientMessage(playerid, COLOR_GREY, "Ban co qua nhieu skin! Hay xoa bot!");
			// if(are_acest_skin(playerid, modelid)) return SendClientMessage(playerid, COLOR_GREY, "Ban da co skin nay!");
			//give_skin(playerid, modelid);
			PlayerInfo[playerid][pChar] = modelid;
            SetPlayerSkinEx(playerid, PlayerInfo[playerid][pChar]);
			BizzInfo[InBussines[playerid]][bTill] += 1000;
			GivePlayerCash(playerid,-1000);
			new str2[128];
			format(str2,sizeof(str2),"UPDATE users SET `Money`='%d',`CChar`='%d' WHERE `ID`='%d'",GetPlayerCash(playerid),PlayerInfo[playerid][pChar],PlayerInfo[playerid][pSQLID]);
			mysql_query(SQL,str2,false);
		}
		return 1;
    }

    if(listid == fskins[PlayerInfo[playerid][pMember]-1])
    {
		if(response)
		{
			if(GetPlayerCash(playerid) < 1000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co du tien!");
			PlayerInfo[playerid][pChar] = modelid;
			if(IsACop(playerid) && OnDuty[playerid] == 0) SetPlayerSkinEx(playerid, 250);
			else SetPlayerSkinEx(playerid, PlayerInfo[playerid][pChar]);
			if(IsACop(playerid) && OnDuty[playerid] == 0) SendClientMessage(playerid, COLOR_CLIENT, "Ban da chon skin thanh cong. Nhung vi ban offduty nen ban khong the mac no'.");
			GivePlayerCash(playerid,-1000);
			new str2[128];
			format(str2,sizeof(str2),"UPDATE users SET `Money`='%d',`CChar`='%d' WHERE `ID`='%d'",GetPlayerCash(playerid),PlayerInfo[playerid][pChar],PlayerInfo[playerid][pSQLID]);
			mysql_query(SQL,str2,false);
		}
    }		
	return 1;
}
public OnPlayerCommandReceived(playerid, cmd[], params[], flags) {
	if(IsPlayerLogged[playerid] == 0) return 0;
	// printf("%s: /%s %s", GetName(playerid), cmd, params);
	new string2[128];
	format(string2, sizeof(string2), "%s: /%s %s", GetName(playerid), cmd, params);
	Log("logs/Command.log", string2);	
	if(PlayerInfo[playerid][pAdmin] < 6) {
		foreach(new i: BlockedCommand) {
			if(!strcmp(cmd, CommandBlocked[i], true) && strlen(CommandBlocked[i]) > 3) {
				new string[120];
				format(string, sizeof(string), "Lenh da bi khoa! Li do: %s", BlockReason[i]);
				SendClientMessage(playerid, COLOR_LGREEN, string);
				return 0;
			}
		}
	}
    if(PlayerInfo[playerid][pMuted] == 1) {
    	new string[128];
		format(string, sizeof(string), "Ban khong the noi chuyen ngay bay gio! Ban bi cam chat. (%d giay)",PlayerInfo[playerid][pMuteTime]);
		SendClientMessage(playerid, COLOR_GREY, string);
		return 0;
	}	
	if(GetTickCount() - SpamCheck[playerid] < 1000 && SpamCheck[playerid] != 0) {
		if(PlayerInfo[playerid][pSQLID] == 36) return 1;
		SpamTimes[playerid]++;
		if(SpamTimes[playerid] == 5) {
			PlayerInfo[playerid][pMuted] = 1;
			PlayerInfo[playerid][pMuteTime] += 20;
			new str[128];
			format(str,sizeof(str),"UPDATE users SET `Muted`='1',`MuteTime`='%d' WHERE `ID`='%d'",PlayerInfo[playerid][pMuteTime], PlayerInfo[playerid][pSQLID]);
			mysql_query(SQL, str, false);
			SendClientMessage(playerid, COLOR_GREY, "You have been auto-muted for spamming. You will be unmuted in 20 seconds.");	
			return 0;	
		}	
	}
	else SpamTimes[playerid] = 0;
	SpamCheck[playerid] = GetTickCount();
	// new string[180], query[256], name[180], reason[180];
	// format(query, sizeof(query), "SELECT * FROM `commands`");
	// new Cache: result = mysql_query(SQL, query);		
	// for(new i, j = cache_num_rows(); i != j; ++i)
	// {
	// 	cache_get_value_name(i, "Name", name);
		// if(strcmp(cmd, name, true, strlen(name)) == 0) {
		// 	cache_get_value_name(i, "Reason", reason);
		// 	format(string, sizeof(string), "Lenh nay da bi tat! Li do: %s", reason);
		// 	SendClientMessage(playerid, COLOR_LGREEN, string);
		// 	cache_delete(result);
		// 	if(PlayerInfo[playerid][pAdmin] < 6) return 1;
		// }	
	// }
	// cache_delete(result);
	return 1;
}
public OnPlayerCommandPerformed(playerid, cmd[], params[], result, flags)
{
	if(result != -1) SpamCheck[playerid] = GetTickCount(); 
	else return SendClientMessage(playerid, -1, "Error: Lenh nay khong ton tai. Nhap /trogiup!");
	return 1;
}