CMD:quitfaction(playerid, params[]) {
	if(PlayerInfo[playerid][pMember] == 0 && PlayerInfo[playerid][pLeader] == 0) return 1;
	if(PlayerInfo[playerid][pLeader] != 0) return SendClientMessage(playerid, -1, "Ban la lanh dao!");
 	Dialog_Show(playerid, DIALOG_QUITFACTION, DIALOG_STYLE_MSGBOX, "Server:", "Ban co muon roi khoi to chuc khong?\nNeu ban khong bi leader/admin moi ra fac, ma ban tu roi thi ban se nhan 20 diem FP (han che to chuc)!", "Co", "Khong");
	return 1;
}

CMD:blockfc(playerid, params[]) {
	if(PlayerInfo[playerid][pRank] < 6) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong du quyen han de su dung lenh nay!");
	new string[62];
	switch(FactionChat[PlayerInfo[playerid][pMember]]) {
		case 0: {
			FactionChat[PlayerInfo[playerid][pMember]] = 1;
			format(string, sizeof(string), "%s da tat tro chuyen trong fac.", GetName(playerid));			
		}
		case 1: {
			FactionChat[PlayerInfo[playerid][pMember]] = 0;
			format(string, sizeof(string), "%s da mo tro chuyen trong fac.", GetName(playerid));				
		}
	}
	SendFactionMessage(PlayerInfo[playerid][pMember], 0x0080FFFF, string);
	return 1;
}

CMD:f(playerid, params[]) {
	new string[256];
	if(PlayerInfo[playerid][pMember] == 0 && PlayerInfo[playerid][pLeader] == 0) {
		if(SpecFaction[playerid] == 0) return 1;
	}
	if(PlayerInfo[playerid][pMuted] == 1) {
		format(string, 70, "Ban khong the tro chuyen ngay bay gio! Ban bi cam chat. (%d giay)",PlayerInfo[playerid][pMuteTime]);
		SendClientMessage(playerid, COLOR_GREY, string);
		return 1;
	}
	new result[250];
	if(FactionChat[PlayerInfo[playerid][pMember]] == 1 && PlayerInfo[playerid][pRank] < 6) return SendClientMessage(playerid, COLOR_GREY, "Chat trong to chuc da bi tat!");
	if(sscanf(params, "s[250]",result)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/f <noi dung>");
	if(FaceReclama(result)) return RemoveFunction(playerid, result), Reclama(playerid, result);
	// if(FaceReclama(result)) return ;
	if(SpecFaction[playerid] != 0) {
		format(string, sizeof(string), "* Admin %s: %s", GetName(playerid), result); 
		SendFactionMessage(SpecFaction[playerid], 0x0080FFFF, string);
		// ChatLog(playerid, string);			
		return 1;
	}		
	// new member = PlayerInfo[playerid][pMember];
	// new leader = PlayerInfo[playerid][pLeader];
	if(IsACop(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "De chat trong to chuc nay, hay su dung lenh /r.");
	// if(member == 3 || leader == 3) return SendClientMessage(playerid, COLOR_LGREEN, "De chat trong to chuc nay, hay su dung lenh /r.");
	if(PlayerInfo[playerid][pRank] >= 6) {
		format(string, sizeof(string), "(/f) %s %s: %s", GetRankName(playerid), GetName(playerid), result);
		SendFactionMessage(PlayerInfo[playerid][pMember], 0x00AAFFFF, string);
	}
	else {
		format(string, sizeof(string), "(/f) %s %s: %s", GetRankName(playerid), GetName(playerid), result); 
		SendFactionMessage(PlayerInfo[playerid][pMember], 0x00D5FFFF, string);
	}	
	// ChatLog(playerid, string);	
	return 1;
}

CMD:animlist(playerid, params[]) {
    SendClientMessage(playerid,COLOR_LGREEN,"Anim list:");
    SendClientMessage(playerid,COLOR_WHITE,"Lifejump, Robman, Exhaust, Carlock, Rcarjack1, Lcarjack1, Rcarjack2, Lcarjack2, Hoodfrisked;");
    SendClientMessage(playerid,COLOR_WHITE,"Lightcig, Tapcig, Bat, Lean, Clearanim, Dancing, Box, Lowthrow, Highthrow;");
    SendClientMessage(playerid,COLOR_WHITE,"Leftslap, Handsup, Fall, Fallback, Sup, Rap, Push, Akick, Lowbodypush;");
    SendClientMessage(playerid,COLOR_WHITE,"Spray, Headbutt, Pee, Koface, Kostomach, Kiss, Rollfall, Lay2, Hitch;");
    SendClientMessage(playerid,COLOR_WHITE,"Beach, Medic, Scratch, Sit, Drunk, Bomb, Getarrested, Laugh, Lookout;");
    SendClientMessage(playerid,COLOR_WHITE,"Aim, Crossarms, Lay, Hide, Vomit, Eating, Wave, Shouting, Chant;");
    SendClientMessage(playerid,COLOR_WHITE,"Frisked, Exhausted, Injured, Slapass, Deal, Dealstance, Crack, Wank, Gro;");
    SendClientMessage(playerid,COLOR_WHITE,"Sit, Chat, Fucku, Taichi, Knife, Basket, JumpWater.");
    SendClientMessage(playerid,COLOR_LGREEN,"New anim list (ver 1.1):");
    SendClientMessage(playerid, COLOR_WHITE, "Dive, Elbow, Gkick, Kickass, Funnywalk, Smokey, Strip, Reload, Dance, Walk, Gwalk");
    return 1;
}
/* New anim */
CMD:dive(playerid, params[])
{
    if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return 1;
    ApplyAnimation(playerid,"DAM_JUMP","DAM_Dive_Loop",4.1,1,0,0,0,0);
    return 1;
}
CMD:elbow(playerid, params[])
{
    if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return 1;
    ApplyAnimation(playerid,"FIGHT_D","FightD_3",4.0,0,1,1,0,0);
    return 1;
}
CMD:gkick(playerid, params[])
{
    if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return 1;
    ApplyAnimation(playerid,"FIGHT_D","FightD_G",4.0,0,0,0,0,0);
    return 1;
}
CMD:kickass(playerid, params[])
{
    if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return 1;
    ApplyAnimation(playerid,"FIGHT_E","Hit_fightkick",4.1,0,0,0,0,0);
    return 1;
}
CMD:funnywalk(playerid, params[])
{
    if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return 1;
    ApplyAnimation(playerid,"WUZI","Wuzi_Walk",4.1,0,0,0,0,0);
    return 1;
}

CMD:smokey(playerid, params[])
{
    if(GetPlayerState(playerid) != 1) return SendClientMessage(playerid, COLOR_GREY, "Ban chi co the su dung hanh dong nay khi dang di duoi dat.");
    new animid;
    if(sscanf(params,"d",animid)) return SendClientMessage(playerid, COLOR_RED, "/smoke [1-8]");
    switch(animid) {

		case 1: ApplyAnimation(playerid,"SMOKING", "M_smklean_loop", 4.0, 1, 0, 0, 0, 0);
		case 2: ApplyAnimation(playerid,"SMOKING", "F_smklean_loop", 4.0, 1, 0, 0, 0, 0);
		case 3: ApplyAnimation(playerid,"SMOKING", "M_smkstnd_loop", 4.0, 1, 0, 0, 0, 0);
		case 4: ApplyAnimation(playerid,"SMOKING", "M_smk_out", 4.0, 1, 0, 0, 0, 0);
		case 5: ApplyAnimation(playerid,"SMOKING", "M_smk_drag", 4.0, 1, 0, 0, 0, 0);
		case 6: ApplyAnimation(playerid,"SMOKING", "M_smk_in", 4.0, 1, 0, 0, 0, 0);
		case 7: ApplyAnimation(playerid,"SMOKING", "M_smk_loop", 4.0, 1, 0, 0, 0, 0);
		case 8: ApplyAnimation(playerid,"SMOKING", "M_smk_tap ", 4.0, 1, 0, 0, 0, 0);
		default: SendClientMessage(playerid, COLOR_RED, "/smoke [1-8]");
    }
    return 1;
}
CMD:strip(playerid, params[])
{
    if(GetPlayerState(playerid) != 1) return SendClientMessage(playerid, COLOR_GREY, "Ban chi co the su dung hanh dong nay khi dang di duoi dat.");
    new animid;
    if(sscanf(params,"d",animid)) return SendClientMessage(playerid, COLOR_RED, "/strip [1-16]");
    switch(animid) {

		case 1: ApplyAnimation(playerid,"STRIP", "PLY_CASH", 4.1,1,1,1,1,1);
		case 2: ApplyAnimation(playerid,"STRIP", "PUN_CASH", 4.1,1,1,1,1,1);
		case 3: ApplyAnimation(playerid,"STRIP", "PUN_HOLLER", 4.1,1,1,1,1,1);
		case 4: ApplyAnimation(playerid,"STRIP", "PUN_LOOP", 4.1,1,1,1,1,1);
		case 5: ApplyAnimation(playerid,"STRIP", "strip_A", 4.1,1,1,1,1,1);
		case 6: ApplyAnimation(playerid,"STRIP", "strip_B", 4.1,1,1,1,1,1);
		case 7: ApplyAnimation(playerid,"STRIP", "strip_C", 4.1,1,1,1,1,1);
		case 8: ApplyAnimation(playerid,"STRIP", "strip_D", 4.1,1,1,1,1,1);
		case 9: ApplyAnimation(playerid,"STRIP", "strip_E", 4.1,1,1,1,1,1);
		case 10: ApplyAnimation(playerid,"STRIP", "strip_F", 4.1,1,1,1,1,1);
		case 11: ApplyAnimation(playerid,"STRIP", "strip_G", 4.1,1,1,1,1,1);
		case 12: ApplyAnimation(playerid,"STRIP", "STR_A2B", 4.1,1,1,1,1,1);
		case 13: ApplyAnimation(playerid,"STRIP", "STR_B2C", 4.1,1,1,1,1,1);
		case 14: ApplyAnimation(playerid,"STRIP", "STR_C1", 4.1,1,1,1,1,1);
		case 15: ApplyAnimation(playerid,"STRIP", "STR_C2", 4.1,1,1,1,1,1);
		case 16: ApplyAnimation(playerid,"STRIP", "STR_Loop_A", 4.1,1,1,1,1,1);
		default: SendClientMessage(playerid, COLOR_RED, "/strip [1-16]");
    }
    return 1;
}

CMD:reload(playerid, params[])
{
    if(GetPlayerState(playerid) != 1) return SendClientMessage(playerid, COLOR_GREY, "Ban chi co the su dung hanh dong nay khi dang di duoi dat.");
    new animid;
    if(sscanf(params,"d",animid)) return SendClientMessage(playerid, COLOR_RED, "/reload - 1 (Desert Eagle), 2 (SPAS12), 3 (UZI/AK-47/M4A1)");
    switch(animid) {
		case 1: ApplyAnimation(playerid, "PYTHON", "python_reload", 4.0, 0, 0, 0, 0, 0);
		case 2: ApplyAnimation(playerid, "BUDDY", "buddy_reload", 4.0, 0, 0, 0, 0, 0);
		case 3: ApplyAnimation(playerid, "UZI", "UZI_reload", 4.0,0,0,0,0,0);
		default: SendClientMessage(playerid, COLOR_RED, "/reload - 1 (Desert Eagle), 2 (SPAS12), 3 (UZI/AK-47/M4A1)");
    }
    return 1;
}

CMD:dance(playerid, params[])
{
    if(PlayerInfo[playerid][pSleeping] == 1) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay, ban dang ngu.");
    if(GetPlayerState(playerid) != 1) return SendClientMessage(playerid, COLOR_GREY, "Ban chi co the su dung hanh dong nay khi dang di duoi dat.");
    new animid;
    if(sscanf(params,"d",animid)) return SendClientMessage(playerid, COLOR_RED, "/dance [1-17]");
    switch(animid) 
    {
		case 1: SetPlayerSpecialAction(playerid, 5);
		case 2: SetPlayerSpecialAction(playerid, 6);
		case 3: SetPlayerSpecialAction(playerid, 7);
		case 4: SetPlayerSpecialAction(playerid, 8);
		case 5: ApplyAnimation(playerid,"DANCING","bd_clap",4.1,1,1,1,1,1,1);
		case 6: ApplyAnimation(playerid,"DANCING","bd_clap1",4.1,1,1,1,1,1,1);
		case 7: ApplyAnimation(playerid,"DANCING","dance_loop",4.1,1,1,1,1,1,1);
		case 8: ApplyAnimation(playerid,"DANCING","DAN_Down_A",4.1,1,1,1,1,1,1);
		case 9: ApplyAnimation(playerid,"DANCING","DAN_Loop_A",4.1,1,1,1,1,1,1);
		case 10: ApplyAnimation(playerid,"DANCING","DAN_Right_A",4.1,1,1,1,1,1,1);
		case 11: ApplyAnimation(playerid,"DANCING","DAN_Up_A",4.1,1,1,1,1,1,1);
		case 12: ApplyAnimation(playerid,"DANCING","dnce_M_a",4.1,1,1,1,1,1,1);
		case 13: ApplyAnimation(playerid,"DANCING","dnce_M_b",4.1,1,1,1,1,1,1);
		case 14: ApplyAnimation(playerid,"DANCING","dnce_M_c",4.1,1,1,1,1,1,1);
		case 15: ApplyAnimation(playerid,"DANCING","dnce_M_d",4.1,1,1,1,1,1,1);
		case 16: ApplyAnimation(playerid,"DANCING","dnce_M_e",4.1,1,1,1,1,1,1);
		case 17: ApplyAnimation(playerid,"DANCING","DAN_Left_A",4.1,1,1,1,1,1,1);
		default: SendClientMessage(playerid, COLOR_RED, "/dance [1-17]");
    }
    return 1;
}

CMD:walk(playerid, params[])
{
    if(GetPlayerState(playerid) != 1) return SendClientMessage(playerid, COLOR_GREY, "Ban chi co the su dung hanh dong nay khi dang di duoi dat.");
    new animid;
    if(sscanf(params,"d",animid)) return SendClientMessage(playerid, COLOR_RED, "/walk [1-14]");
    switch(animid) {

		case 1: ApplyAnimation(playerid,"PED","WALK_gang1",4.1,1,1,1,1,1,1);
		case 2: ApplyAnimation(playerid,"PED","WALK_gang2",4.1,1,1,1,1,1,1);
		case 3: ApplyAnimation(playerid,"FAT","FatWalk",4.1,1,1,1,1,1,1);
		case 4: ApplyAnimation(playerid,"WUZI","CS_Wuzi_pt1",4.1,1,1,1,1,1,1);
		case 5: ApplyAnimation(playerid,"WUZI","Wuzi_walk",3.0,1,1,1,1,1,1);
		case 6: ApplyAnimation(playerid,"POOL","Pool_walk",3.0,1,1,1,1,1,1);
		case 7: ApplyAnimation(playerid,"PED","Walk_player",3.0,1,1,1,1,1,1);
		case 8: ApplyAnimation(playerid,"PED","Walk_old",3.0,1,1,1,1,1,1); 
		case 9: ApplyAnimation(playerid,"PED","Walk_fatold",3.0,1,1,1,1,1,1); 
		case 10: ApplyAnimation(playerid,"PED","woman_walkfatold",3.0,1,1,1,1,1,1);
		case 11: ApplyAnimation(playerid,"PED","woman_walknorm",3.0,1,1,1,1,1,1); 
		case 12: ApplyAnimation(playerid,"PED","woman_walkold",3.0,1,1,1,1,1,1); 
		case 13: ApplyAnimation(playerid,"PED","woman_walkpro",3.0,1,1,1,1,1,1);
		case 14: ApplyAnimation(playerid,"PED","woman_walkshop",3.0,1,1,1,1,1,1);
		default: SendClientMessage(playerid, COLOR_RED, "/walk [1-14]");
    }
    return 1;
}

CMD:gwalk(playerid, params[])
{
    if(GetPlayerState(playerid) != 1) return SendClientMessage(playerid, COLOR_GREY, "Ban chi co the su dung hanh dong nay khi dang di duoi dat.");
    new animid;
    if(sscanf(params,"d",animid)) return SendClientMessage(playerid, COLOR_RED, "/gwalk [1-2]");
    switch(animid) {

		case 1: ApplyAnimation(playerid,"PED","WALK_gang1",4.1,1,1,1,1,1);
		case 2: ApplyAnimation(playerid,"PED","WALK_gang2",4.1,1,1,1,1,1);
		default: SendClientMessage(playerid, COLOR_RED, "/gwalk [1-2]");
    }
    return 1;
}
//
CMD:carhand(playerid, params[]) {
    if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
    ApplyAnimation(playerid,"CAR","Tap_hand",4.1,0,1,1 ,1,1);
	return 1;
}

CMD:lifejump(playerid, params[]) {
    if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
	LoopingAnim(playerid,"PED","EV_dive",4.0,0,1,1,1,0);
	return 1;
}

CMD:robman(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
 	LoopingAnim(playerid, "SHOP", "ROB_Loop_Threat", 4.0, 1, 0, 0, 0, 0);
	return 1;
}

CMD:exhaust(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
	LoopingAnim(playerid,"PED","IDLE_tired",3.0,1,0,0,0,0);
	return 1;
}

CMD:rcarjack1(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
	OnePlayAnim(playerid,"PED","CAR_pulloutL_LHS",4.0,0,0,0,0,0);
	return 1;
}

CMD:lcarjack1(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
 	OnePlayAnim(playerid,"PED","CAR_pulloutL_RHS",4.0,0,0,0,0,0);
	return 1;
}

CMD:rcarjack2(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
 	OnePlayAnim(playerid,"PED","CAR_pullout_LHS",4.0,0,0,0,0,0);
	return 1;
}

CMD:lcarjack2(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
 	OnePlayAnim(playerid,"PED","CAR_pullout_RHS",4.0,0,0,0,0,0);
	return 1;
}

CMD:hoodfrisked(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
 	LoopingAnim(playerid,"POLICE","crm_drgbst_01",4.0,0,1,1,1,0);
	return 1;
}

CMD:lightcig(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
 	OnePlayAnim(playerid,"SMOKING","M_smk_in",3.0,0,0,0,0,0);
	return 1;
}

CMD:tapcig(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
 	OnePlayAnim(playerid,"SMOKING","M_smk_tap",3.0,0,0,0,0,0);
	return 1;
}

CMD:bat(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
 	LoopingAnim(playerid,"BASEBALL","Bat_IDLE",4.0,1,1,1,1,0);
	return 1;
}

CMD:lean(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
	new test;
    if(sscanf(params, "d",test)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/lean <1-2>");
    switch (test)
    {
		case 1: LoopingAnim(playerid,"GANGS","leanIDLE",4.0,0,1,1,1,0);
		case 2: LoopingAnim(playerid,"MISC","Plyrlean_loop",4.0,0,1,1,1,0);
		default: SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/lean <1-2>");
	}
	return 1;
}

CMD:dancing(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
	new test;
    if(sscanf(params, "d",test)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/dancing <1-7>");
	switch (test)
   	{
		case 1: LoopingAnim(playerid,"STRIP", "strip_A", 4.1, 1, 1, 1, 1, 1 );
		case 2: LoopingAnim(playerid,"STRIP", "strip_B", 4.1, 1, 1, 1, 1, 1 );
     	case 3: LoopingAnim(playerid,"STRIP", "strip_C", 4.1, 1, 1, 1, 1, 1 );
    	case 4: LoopingAnim(playerid,"STRIP", "strip_D", 4.1, 1, 1, 1, 1, 1 );
    	case 5: LoopingAnim(playerid,"STRIP", "strip_E", 4.1, 1, 1, 1, 1, 1 );
    	case 6: LoopingAnim(playerid,"STRIP", "strip_F", 4.1, 1, 1, 1, 1, 1 );
     	case 7: LoopingAnim(playerid,"STRIP", "strip_G", 4.1, 1, 1, 1, 1, 1 );
     	default: SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/dancing <1-7>");
	}
	return 1;
}

CMD:box(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
 	LoopingAnim(playerid,"GYMNASIUM","GYMshadowbox",4.0,1,1,1,1,0);
	return 1;
}

CMD:lowthrow(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
	OnePlayAnim(playerid,"GRENADE","WEAPON_throwu",3.0,0,0,0,0,0);
	return 1;
}

CMD:highthrow(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
 	OnePlayAnim(playerid,"GRENADE","WEAPON_throw",4.0,0,0,0,0,0);
	return 1;
}

CMD:leftslap(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
	OnePlayAnim(playerid,"PED","BIKE_elbowL",4.0,0,0,0,0,0);
	return 1;
}

CMD:handsup(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
	if(Freezed[playerid] == 1) return 1;
	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_HANDSUP);
	return 1;
}

CMD:fall(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
	LoopingAnim(playerid,"PED","KO_skid_front",4.1,0,1,1,1,0);
	return 1;
}

CMD:fallback(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
    LoopingAnim(playerid, "PED","FLOOR_hit_f", 4.0, 1, 0, 0, 0, 0);
    return 1;
}

CMD:laugh(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
 	OnePlayAnim(playerid, "RAPPING", "Laugh_01", 4.0, 0, 0, 0, 0, 0);
	return 1;
}

CMD:lookout(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
    OnePlayAnim(playerid, "SHOP", "ROB_Shifty", 4.0, 0, 0, 0, 0, 0);
	return 1;
}

CMD:aim(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
    LoopingAnim(playerid, "SHOP", "ROB_Loop_Threat", 4.0, 1, 0, 0, 0, 0);
	return 1;
}

CMD:crossarms(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
    LoopingAnim(playerid, "COP_AMBIENT", "Coplook_loop", 4.0, 0, 1, 1, 1, -1);
	return 1;
}

CMD:lay(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
 	LoopingAnim(playerid,"BEACH", "bather", 4.0, 1, 0, 0, 0, 0);
	return 1;
}

CMD:hide(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
 	LoopingAnim(playerid, "ped", "cower", 3.0, 1, 0, 0, 0, 0);
	return 1;
}

CMD:vomit(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
 	OnePlayAnim(playerid, "FOOD", "EAT_Vomit_P", 3.0, 0, 0, 0, 0, 0);
	return 1;
}

CMD:wave(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
    LoopingAnim(playerid, "ON_LOOKERS", "wave_loop", 4.0, 1, 0, 0, 0, 0);
	return 1;
}

CMD:shouting(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
    LoopingAnim(playerid,"RIOT","RIOT_shout",4.0,1,0,0,0,0);
	return 1;
}

CMD:chant(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
    LoopingAnim(playerid,"RIOT","RIOT_CHANT",4.0,1,1,1,1,0);
	return 1;
}

CMD:frisked(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
    LoopingAnim(playerid,"POLICE","crm_drgbst_01",4.0,0,1,1,1,0);
	return 1;
}

CMD:exhausted(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
    LoopingAnim(playerid,"PED","IDLE_tired",3.0,1,0,0,0,0);
	return 1;
}

CMD:injured(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
    LoopingAnim(playerid, "SWEET", "Sweet_injuredloop", 4.0, 1, 0, 0, 0, 0);
	return 1;
}

CMD:slapass(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
    OnePlayAnim(playerid, "SWEET", "sweet_ass_slap", 4.0, 0, 0, 0, 0, 0);
	return 1;
}

CMD:deal(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
    OnePlayAnim(playerid, "DEALER", "DEALER_DEAL", 4.0, 0, 0, 0, 0, 0);
	return 1;
}

CMD:dealstance(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
    LoopingAnim(playerid,"DEALER","DEALER_IDLE",4.0,1,0,0,0,0);
	return 1;
}

CMD:crack(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
    LoopingAnim(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
	return 1;
}

CMD:wank(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
    LoopingAnim(playerid,"PAULNMAC", "wank_loop", 1.800001, 1, 0, 0, 1, 600);
	return 1;
}

CMD:xinchao(playerid, params[]) {
    if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
    ApplyAnimation(playerid, "ON_LOOKERS", "Pointup_loop", 4.0, 1, 0, 0, 0, 0, 1);
    return 1;
}

CMD:gro(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
 	LoopingAnim(playerid,"BEACH", "ParkSit_M_loop", 4.0, 1, 0, 0, 0, 0);
	return 1;
}

CMD:sup(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
	new test;
    if(sscanf(params, "d",test)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/sup <1-3>");
	switch (test)
  	{
    	case 1: OnePlayAnim(playerid,"GANGS","hndshkba",4.0,0,0,0,0,0);
     	case 2: OnePlayAnim(playerid,"GANGS","hndshkda",4.0,0,0,0,0,0);
     	case 3: OnePlayAnim(playerid,"GANGS","hndshkfa_swt",4.0,0,0,0,0,0);
    	default: SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/sup <1-3>");
	}
    return 1;
}

CMD:rap(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
	new test;
    if(sscanf(params, "d",test)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/rap <1-4>");
	switch (test)
	{
		case 1: LoopingAnim(playerid,"RAPPING","RAP_A_Loop",4.0,1,0,0,0,0);
    	case 2: LoopingAnim(playerid,"RAPPING","RAP_C_Loop",4.0,1,0,0,0,0);
    	case 3: LoopingAnim(playerid,"GANGS","prtial_gngtlkD",4.0,1,0,0,0,0);
     	case 4: LoopingAnim(playerid,"GANGS","prtial_gngtlkH",4.0,1,0,0,1,1);
    	default: SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/rap <1-4>");
	}
    return 1;
}

CMD:push(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
 	OnePlayAnim(playerid,"GANGS","shake_cara",4.0,0,0,0,0,0);
	return 1;
}

CMD:akick(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
	OnePlayAnim(playerid,"POLICE","Door_Kick",4.0,0,0,0,0,0);
	return 1;
}

CMD:lowbodypush(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
	OnePlayAnim(playerid,"GANGS","shake_carSH",4.0,0,0,0,0,0);
	return 1;
}

CMD:headbutt(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
	OnePlayAnim(playerid,"WAYFARER","WF_Fwd",4.0,0,0,0,0,0);
	return 1;
}

CMD:pee(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
	if(Freezed[playerid] == 1) return 1;
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_PISSING);
	return 1;
}

CMD:koface(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
	LoopingAnim(playerid,"PED","KO_shot_face",4.0,0,1,1,1,0);
	return 1;
}

CMD:kostomach(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
	LoopingAnim(playerid,"PED","KO_shot_stom",4.0,0,1,1,1,0);
	return 1;
}

CMD:kiss(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
	LoopingAnim(playerid,"KISSING", "Grlfrd_Kiss_02", 1.800001, 1, 0, 0, 1, 600);
	return 1;
}

CMD:rollfall(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
	LoopingAnim(playerid,"PED","BIKE_fallR",4.0,0,1,1,1,0);
	return 1;
}

CMD:lay2(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
	LoopingAnim(playerid,"SUNBATHE","Lay_Bac_in",3.0,0,1,1,1,0);
	return 1;
}

CMD:hitch(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
	LoopingAnim(playerid,"MISC","Hiker_Pose", 4.0, 1, 0, 0, 0, 0);
	return 1;
}

CMD:beach(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
	LoopingAnim(playerid,"BEACH","SitnWait_loop_W",4.1,0,1,1,1,1);
	return 1;
}

CMD:medic(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
	LoopingAnim(playerid,"MEDIC","CPR",4.1,0,1,1,1,1);
	return 1;
}

CMD:scratch(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
	LoopingAnim(playerid,"MISC","Scratchballs_01", 4.0, 1, 0, 0, 0, 0);
	return 1;
}

CMD:sit(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
	LoopingAnim(playerid,"PED","SEAT_idle", 4.0, 1, 0, 0, 0, 0);
	return 1;
}

CMD:drunk(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
	LoopingAnim(playerid,"PED","WALK_DRUNK",4.0,1,1,1,1,0);
	return 1;
}

CMD:bomb(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
   	ClearAnimations(playerid);
   	OnePlayAnim(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0);
	return 1;
}

CMD:getarrested(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
    LoopingAnim(playerid,"ped", "ARRESTgun", 4.0, 0, 1, 1, 1, -1);
	return 1;
}

CMD:chat(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
    OnePlayAnim(playerid,"PED","IDLE_CHAT",4.0,0,0,0,0,0);
	return 1;
}

CMD:fucku(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
    OnePlayAnim(playerid,"PED","fucku",4.0,0,0,0,0,0);
	return 1;
}

CMD:taichi(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
    LoopingAnim(playerid,"PARK","Tai_Chi_Loop",4.0,1,0,0,0,0);
	return 1;
}

CMD:knife(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
	new test;
    if(sscanf(params, "d",test)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/knife <1-4>");
	switch (test)
	{
		case 1: LoopingAnim(playerid,"KNIFE","KILL_Knife_Ped_Damage",4.0,0,1,1,1,0);
     	case 2: LoopingAnim(playerid,"KNIFE","KILL_Knife_Ped_Die",4.0,0,1,1,1,0);
      	case 3: OnePlayAnim(playerid,"KNIFE","KILL_Knife_Player",4.0,0,0,0,0,0);
     	case 4: LoopingAnim(playerid,"KNIFE","KILL_Partial",4.0,0,1,1,1,1);
    	default: SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/knife <1-4>");
	}
	return 1;
}

CMD:basket(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
	new test;
    if(sscanf(params, "d",test)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/basket <1-6>");
	switch (test)
 	{
    	case 1: LoopingAnim(playerid,"BSKTBALL","BBALL_idleloop",4.0,1,0,0,0,0);
    	case 2: OnePlayAnim(playerid,"BSKTBALL","BBALL_Jump_Shot",4.0,0,0,0,0,0);
     	case 3: OnePlayAnim(playerid,"BSKTBALL","BBALL_pickup",4.0,0,0,0,0,0);
     	case 4: LoopingAnim(playerid,"BSKTBALL","BBALL_run",4.1,1,1,1,1,1);
    	case 5: LoopingAnim(playerid,"BSKTBALL","BBALL_def_loop",4.0,1,0,0,0,0);
       	case 6: LoopingAnim(playerid,"BSKTBALL","BBALL_Dnk",4.0,1,0,0,0,0);
    	default: SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/basket <1-6>");
	}
	return 1;
}
CMD:jumpwater(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren mot phuong tien.");
    ApplyAnimation(playerid,"DAM_JUMP","DAM_LAUNCH",2,0,1,1,0,0);
	return 1;
}