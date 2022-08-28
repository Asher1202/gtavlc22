#include <YSI_Coding\y_hooks>
#include <YSI_Data\y_bit>
#include <YSI_Coding\y_inline>
#include <mysql_prepared>
#include <logger>

#define 	MAX_W1_QUEST 	(7)
#define 	MAX_W2_QUEST 	(7)
#define 	MAX_W3_QUEST 	(7)
#define 	MAX_W4_QUEST 	(7)

#define MAX_BP_TIER_PAGE	(4)

new bpweekstatus[4];

enum e_BP {
	bpP_SQLID,
	bpWeek1[MAX_W1_QUEST],
	bpWeek2[MAX_W2_QUEST],
	bpWeek3[MAX_W3_QUEST],
	bpWeek4[MAX_W4_QUEST],
	bpExp,
	bpFreeTier,
	bpPaidTier,

	// because of this, player can per-items from down to top
	//this reduce much of data I have to save in database
	bpFreeTierGot[MAX_BP_TIER_PAGE*5],
	bpPaidTierGot[MAX_BP_TIER_PAGE*5]
}

new 
	BpUserData[MAX_PLAYERS][e_BP],
	BitArray:openingBp<MAX_PLAYERS>;

enum PRIZE_TYPE {
	PT_MONEY,
	PT_KIM_CUONG,
	PT_PLAYER_EXP,
	PT_RANDOM_CRATE,
	PT_PREMIUMPOINTS,
	PT_ROBPOINTS,
	PT_VEHICLESLOT,
	PT_FIREWORK,
	PT_MATERIAL,
	PT_EPICCAR_CRATE,
	PT_BOOMBOX,
	PT_CHIP,
	PT_SUPERCARFRAGMENT,
	PT_MEDEIUMCARFRAGMENT
}

enum e_BP_Prize {
	PRIZE_TYPE:bprize_type,
	bprize_amount,
	bprize_model //
}
new BP_QuestName[][4][] = {
	{"Hoan Thanh 50 Chuyen Pizza","Hoan Thanh 50 Chuyen Trucker","Hoan Thanh 40 Lan Farmer","Giet 30 Canh Sat"},
	{"Mo 10 Crate Random","Mo 5 Crate Car Legend","An Burger 100 Lan","Len 4 Cap"},
	{"Cau Ca 50 Lan","Cau Trung Ca Hiem 30 Lan","Cau Trung Ca Vang 30 Lan","Bo Vao Ket Sat Clan Tren $10.000.000 2 Lan"},
	{"Bo Vao Ket Sat Clan Tren $2.000.000 2 lan","Di Tu 20 Lan","Vuot Nguc Thanh Cong 10 Lan","Thang Event Viet Nhanh 40 Lan"},
	{"Thang Tai Xiu 30 Lan","Thang Event Cau Hoi 20 Lan","Len 2 Cap","Cau Ca 50 Lan"},
	{"Choi Dice 30 Lan","Thang 20 Tran Dua","Thang Event Viet Nhanh 30 Lan","Dat Tai Xiu 30 Lan"},
	{"Giet 20 Nguoi Khi War Clan [clanduty]","Spray Dia Ban 20 Lan","Giet 40 Nguoi Trong War Gang","Thang Dice 20 Lan"}
};

new BP_QuestProgress[7][5] = {
	{50,50,40,30, 12},
	{10,5,100,4,5},
	{50,30,30, 2,4},
	{2,20,10, 40,4},
	{30,20,2, 50,10},
	{30,20,30, 30,10},
	{20,20,40, 20,5}
};
new BP_NormalPrize[20][e_BP_Prize] = {
	{PT_MONEY,6000000, 1274 },
	{PT_PREMIUMPOINTS,25, 1247 },
	{PT_MATERIAL,10000, 1575 },
	{PT_CHIP,5000, 1880 },
	{PT_MEDEIUMCARFRAGMENT,1, 461 },
	{PT_PREMIUMPOINTS,25, 1247},
	{PT_PLAYER_EXP,5, 1314 },
	{PT_CHIP,5000, 1880 },
	{PT_FIREWORK,10, 1636 },
	{PT_MEDEIUMCARFRAGMENT,1, 461 },
	{PT_RANDOM_CRATE,2, 19060 },
	{PT_MONEY,6000000, 1274 },
	{PT_KIM_CUONG,10, 19602 },
	{PT_EPICCAR_CRATE,1, 19060 },
	{PT_MEDEIUMCARFRAGMENT,1, 461 },
	{PT_PLAYER_EXP,5, 1314 },
	{PT_RANDOM_CRATE,2, 19060 },
	{PT_MONEY,6000000, 1274 },
	{PT_PREMIUMPOINTS,20, 1247},
	{PT_MEDEIUMCARFRAGMENT,1, 461 }
};
new BP_PremiumPrize[20][e_BP_Prize] = {
	{PT_MONEY,12000000, 1274 },
	{PT_PREMIUMPOINTS,60, 1247 },
	{PT_KIM_CUONG,20, 19602 },
	{PT_MEDEIUMCARFRAGMENT,1, 461 },
	{PT_SUPERCARFRAGMENT,1, 522 },
	{PT_CHIP,10000, 1880 },
	{PT_KIM_CUONG,20, 19602 },
	{PT_RANDOM_CRATE,4, 19060 },
	{PT_MEDEIUMCARFRAGMENT,1, 461 },
	{PT_SUPERCARFRAGMENT,1, 522 },
	{PT_MONEY,12000000, 1274 },
	{PT_BOOMBOX,1, 2103 },
	{PT_EPICCAR_CRATE,2, 19060 },
	{PT_MEDEIUMCARFRAGMENT,1, 461 },
	{PT_SUPERCARFRAGMENT,1, 522 },
	{PT_PLAYER_EXP,10, 1314 },
	{PT_PREMIUMPOINTS,60, 1247 },
	{PT_KIM_CUONG,20, 19602 },
	{PT_MEDEIUMCARFRAGMENT,1, 461 },
	{PT_SUPERCARFRAGMENT,1, 522 }

};
new Battlepassday = 30;
hook ResetVariables(playerid) {
	for(new i; i < 7; i++) {
		BpUserData[playerid][bpWeek1][i] = 0;
		BpUserData[playerid][bpWeek2][i] = 0;
		BpUserData[playerid][bpWeek3][i] = 0;
		BpUserData[playerid][bpWeek4][i] = 0;
	}
	BpUserData[playerid][bpExp] = 0;
	BpUserData[playerid][bpPaidTier] = 0;
	Bit_Vet(openingBp, playerid);
}
checkbpquest(playerid, week, idquest) {
	if(Battlepassday <= 0) return 1;
	if(bpweekstatus[week] == 0) return 1;
	switch(week) {
		case 0: {
			if(BpUserData[playerid][bpWeek1][idquest] != -1) {
				BpUserData[playerid][bpWeek1][idquest] += 1;
				if(BpUserData[playerid][bpWeek1][idquest] >= BP_QuestProgress[idquest][week]) {
					BpUserData[playerid][bpWeek1][idquest] = -1;
					BpUserData[playerid][bpExp] += BP_QuestProgress[idquest][4];
				}
			}
		}
		case 1: {
			if(BpUserData[playerid][bpWeek2][idquest] != -1) {
				BpUserData[playerid][bpWeek2][idquest] += 1;
				if(BpUserData[playerid][bpWeek2][idquest] >= BP_QuestProgress[idquest][week]) {
					BpUserData[playerid][bpWeek2][idquest] = -1;
					BpUserData[playerid][bpExp] += BP_QuestProgress[idquest][4];
				}
			}
		}
		case 2: {
			if(BpUserData[playerid][bpWeek3][idquest] != -1) {
				BpUserData[playerid][bpWeek3][idquest] += 1;
				if(BpUserData[playerid][bpWeek3][idquest] >= BP_QuestProgress[idquest][week]) {
					BpUserData[playerid][bpWeek3][idquest] = -1;
					BpUserData[playerid][bpExp] += BP_QuestProgress[idquest][4];
				}
			}
		}
		case 3: {
			if(BpUserData[playerid][bpWeek4][idquest] != -1) {
				BpUserData[playerid][bpWeek4][idquest] += 1;
				if(BpUserData[playerid][bpWeek4][idquest] >= BP_QuestProgress[idquest][week]) {
					BpUserData[playerid][bpWeek4][idquest] = -1;
					BpUserData[playerid][bpExp] += BP_QuestProgress[idquest][4];
				}
			}
		}
	}
	save_bp(playerid);
	return true;
}
save_bp(playerid) {
	new szQuery[3500], items[60], items2[60];
	format(items, sizeof(items), 
		"%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d", 
		BpUserData[playerid][bpFreeTierGot][0], BpUserData[playerid][bpFreeTierGot][1], BpUserData[playerid][bpFreeTierGot][2], BpUserData[playerid][bpFreeTierGot][3], BpUserData[playerid][bpFreeTierGot][4],
		BpUserData[playerid][bpFreeTierGot][5], BpUserData[playerid][bpFreeTierGot][6], BpUserData[playerid][bpFreeTierGot][7], BpUserData[playerid][bpFreeTierGot][8], BpUserData[playerid][bpFreeTierGot][9],
		BpUserData[playerid][bpFreeTierGot][10], BpUserData[playerid][bpFreeTierGot][11], BpUserData[playerid][bpFreeTierGot][12], BpUserData[playerid][bpFreeTierGot][13], BpUserData[playerid][bpFreeTierGot][14],
		BpUserData[playerid][bpFreeTierGot][15],BpUserData[playerid][bpFreeTierGot][16],BpUserData[playerid][bpFreeTierGot][17],BpUserData[playerid][bpFreeTierGot][18],BpUserData[playerid][bpFreeTierGot][19]);			
	format(items2, sizeof(items2), 
		"%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d", 
		BpUserData[playerid][bpPaidTierGot][0], BpUserData[playerid][bpPaidTierGot][1], BpUserData[playerid][bpPaidTierGot][2], BpUserData[playerid][bpPaidTierGot][3], BpUserData[playerid][bpPaidTierGot][4],
		BpUserData[playerid][bpPaidTierGot][5], BpUserData[playerid][bpPaidTierGot][6], BpUserData[playerid][bpPaidTierGot][7], BpUserData[playerid][bpPaidTierGot][8], BpUserData[playerid][bpPaidTierGot][9],
		BpUserData[playerid][bpPaidTierGot][10], BpUserData[playerid][bpPaidTierGot][11], BpUserData[playerid][bpPaidTierGot][12], BpUserData[playerid][bpPaidTierGot][13], BpUserData[playerid][bpPaidTierGot][14],
		BpUserData[playerid][bpPaidTierGot][15],BpUserData[playerid][bpPaidTierGot][16],BpUserData[playerid][bpPaidTierGot][17],BpUserData[playerid][bpPaidTierGot][18],BpUserData[playerid][bpPaidTierGot][19]);				

	format(szQuery, sizeof(szQuery), "UPDATE `battlepass` SET `bpFreeTierGot`='%s',`bpPaidTierGot`='%s', `bpW1Q1` = '%d', `bpW1Q2`= '%d', `bpW1Q3`= '%d', `bpW1Q4`= '%d', `bpW1Q5`= '%d', `bpW1Q6`= '%d', `bpW2Q1` = '%d', `bpW2Q2` = '%d', `bpW2Q3`= '%d', `bpW2Q4`= '%d', `bpW2Q5`= '%d', `bpW2Q6`= '%d', `bpW3Q1` = '%d', `bpW3Q2`= '%d', `bpW3Q3`= '%d', `bpW3Q4`= '%d', `bpW3Q5`= '%d', `bpW3Q6`= '%d',`bpW4Q1` = '%d', `bpW4Q2`= '%d', `bpW4Q3`= '%d', `bpW4Q4`= '%d', `bpW4Q5`= '%d', `bpW4Q6`= '%d', `bpW1Q7`= '%d', `bpW2Q7`= '%d', `bpW3Q7`= '%d', `bpW4Q7`= '%d',`bpExp` = '%d' WHERE `player_sqlid`='%d'", items,items2,
		BpUserData[playerid][bpWeek1][0], BpUserData[playerid][bpWeek1][1], BpUserData[playerid][bpWeek1][2], BpUserData[playerid][bpWeek1][3], BpUserData[playerid][bpWeek1][4],
		BpUserData[playerid][bpWeek1][5],BpUserData[playerid][bpWeek2][0], BpUserData[playerid][bpWeek2][1], BpUserData[playerid][bpWeek2][2], BpUserData[playerid][bpWeek2][3], BpUserData[playerid][bpWeek2][4],
		BpUserData[playerid][bpWeek2][5],BpUserData[playerid][bpWeek3][0], BpUserData[playerid][bpWeek3][1], BpUserData[playerid][bpWeek3][2], BpUserData[playerid][bpWeek3][3], BpUserData[playerid][bpWeek3][4],
		BpUserData[playerid][bpWeek3][5],BpUserData[playerid][bpWeek4][0], BpUserData[playerid][bpWeek4][1], BpUserData[playerid][bpWeek4][2], BpUserData[playerid][bpWeek4][3], BpUserData[playerid][bpWeek4][4],
		BpUserData[playerid][bpWeek4][5],
		BpUserData[playerid][bpWeek1][6],BpUserData[playerid][bpWeek2][6],BpUserData[playerid][bpWeek3][6],BpUserData[playerid][bpWeek4][6],BpUserData[playerid][bpExp],PlayerInfo[playerid][pSQLID]);
	mysql_tquery(SQL, szQuery);
	return true;
}
LoadBattlePass(playerid) {
    new query[500];
    format(query, sizeof(query), "SELECT * FROM `battlepass` WHERE `player_sqlid` = '%d'", PlayerInfo[playerid][pSQLID]);
    new Cache:db = mysql_query(SQL, query);
	if(!cache_num_rows()) {	
		BpUserData[playerid][bpP_SQLID] = PlayerInfo[playerid][pSQLID];
		format(query, sizeof(query), "INSERT INTO `battlepass` (`player_sqlid`) VALUES('%d')",PlayerInfo[playerid][pSQLID]);
		mysql_query(SQL, query);
		printf("Tao battlepass cho %s (%i).", GetNameEx(playerid), PlayerInfo[playerid][pSQLID]);
	}
	else {
		cache_get_value_name_int(0 ,"player_sqlid", BpUserData[playerid][bpP_SQLID]);
        cache_get_value_name_int(0 ,"bpExp", BpUserData[playerid][bpExp]);
        cache_get_value_name_int(0 ,"bpFreeTier", BpUserData[playerid][bpFreeTier]);
        cache_get_value_name_int(0 ,"bpPaidTier", BpUserData[playerid][bpPaidTier]);
		cache_get_value_name_int(0 ,"bpW1Q1", BpUserData[playerid][bpWeek1][0]);
        cache_get_value_name_int(0 ,"bpW1Q2", BpUserData[playerid][bpWeek1][1]);
        cache_get_value_name_int(0 ,"bpW1Q3", BpUserData[playerid][bpWeek1][2]);
        cache_get_value_name_int(0 ,"bpW1Q4", BpUserData[playerid][bpWeek1][3]);
        cache_get_value_name_int(0 ,"bpW1Q5", BpUserData[playerid][bpWeek1][4]);
        cache_get_value_name_int(0 ,"bpW1Q6", BpUserData[playerid][bpWeek1][5]);
        cache_get_value_name_int(0 ,"bpW2Q1", BpUserData[playerid][bpWeek2][0]);
        cache_get_value_name_int(0 ,"bpW2Q2", BpUserData[playerid][bpWeek2][1]);
        cache_get_value_name_int(0 ,"bpW2Q3", BpUserData[playerid][bpWeek2][2]);
        cache_get_value_name_int(0 ,"bpW2Q4", BpUserData[playerid][bpWeek2][3]);
        cache_get_value_name_int(0 ,"bpW2Q5", BpUserData[playerid][bpWeek2][4]);
        cache_get_value_name_int(0 ,"bpW2Q6", BpUserData[playerid][bpWeek2][5]);
		cache_get_value_name_int(0 ,"bpW3Q1", BpUserData[playerid][bpWeek3][0]);
        cache_get_value_name_int(0 ,"bpW3Q2", BpUserData[playerid][bpWeek3][1]);
        cache_get_value_name_int(0 ,"bpW3Q3", BpUserData[playerid][bpWeek3][2]);
        cache_get_value_name_int(0 ,"bpW3Q4", BpUserData[playerid][bpWeek3][3]);
        cache_get_value_name_int(0 ,"bpW3Q5", BpUserData[playerid][bpWeek3][4]);
        cache_get_value_name_int(0 ,"bpW3Q6", BpUserData[playerid][bpWeek3][5]);
		cache_get_value_name_int(0 ,"bpW4Q1", BpUserData[playerid][bpWeek4][0]);
        cache_get_value_name_int(0 ,"bpW4Q2", BpUserData[playerid][bpWeek4][1]);
        cache_get_value_name_int(0 ,"bpW4Q3", BpUserData[playerid][bpWeek4][2]);
        cache_get_value_name_int(0 ,"bpW4Q4", BpUserData[playerid][bpWeek4][3]);
        cache_get_value_name_int(0 ,"bpW4Q5", BpUserData[playerid][bpWeek4][4]);
        cache_get_value_name_int(0 ,"bpW4Q6", BpUserData[playerid][bpWeek4][5]);


		cache_get_value_name_int(0 ,"bpW1Q7", BpUserData[playerid][bpWeek1][6]);
		cache_get_value_name_int(0 ,"bpW2Q7", BpUserData[playerid][bpWeek2][6]);
		cache_get_value_name_int(0 ,"bpW3Q7", BpUserData[playerid][bpWeek3][6]);
		cache_get_value_name_int(0 ,"bpW4Q7", BpUserData[playerid][bpWeek4][6]);

		new result[400];
		
		new bpfreetiergot[64];
		cache_get_value_name(0, "bpFreeTierGot", result); format(bpfreetiergot, 64, result);
	    sscanf(bpfreetiergot, "p<|>a<i>[20]", BpUserData[playerid][bpFreeTierGot]);

		new bppaidtiergot[64];
		cache_get_value_name(0, "bpPaidTierGot", result); format(bppaidtiergot, 64, result);
	    sscanf(bppaidtiergot, "p<|>a<i>[20]", BpUserData[playerid][bpPaidTierGot]);
	}
	
    cache_delete(db);
	return 1;
}
hook OnPlayerLogin(playerid) {
	LoadBattlePass(playerid);
	return 1;
}

hook OnPlayerClickTextDraw(playerid, Text:clickedid) {
	if(clickedid == BpTD[17]) { // Prev
		// Check if player can go prev page
		new page = GetPVarInt(playerid, "BpPage");
		if(page == 0) {
			// Initialize last page
			BP_InitForPlayer(playerid, 0);
			SetPVarInt(playerid, "BpPage", 0);
		}
		else {
			// Initialize prev page
			BP_InitForPlayer(playerid, page-1);
			SetPVarInt(playerid, "BpPage", page-1);
		}
		// Show
		BP_UpdateTD(playerid);
		return 0;
	}
	else if(clickedid == BpTD[18]) { // Next
		// Check if player can go next page
		new page = GetPVarInt(playerid, "BpPage");
		if(page == 3) {
			// Initialize first page
			BP_InitForPlayer(playerid, 3);
			SetPVarInt(playerid, "BpPage", 3);
		}
		else {
			// Initialize prev page
			BP_InitForPlayer(playerid, page+1);
			SetPVarInt(playerid, "BpPage", page+1);
		}
		// Show 
		BP_UpdateTD(playerid);
		return ~0;
	}
	else if(clickedid == BpTD[7]) {
		new szDialog2[100],szDialog[500],qf[4] = 0, qf2[50];
		format(szDialog2, sizeof szDialog2, "Week no\tStatus\tExTra\n");
		strcat(szDialog, szDialog2);
		for(new i; i < 7; i++) {
			if(BpUserData[playerid][bpWeek1][i] == -1) qf[0]++;
			if(BpUserData[playerid][bpWeek2][i] == -1) qf[1]++;
			if(BpUserData[playerid][bpWeek3][i] == -1) qf[2]++;
			if(BpUserData[playerid][bpWeek4][i] == -1) qf[3]++;
		}
		if(bpweekstatus[0] == 0) format(qf2, sizeof qf2,"chua mo");
		else if(qf[0] == 7) format(qf2, sizeof qf2,"{3BBF0B}completed");
		else format(qf2, sizeof qf2,"%d/6 quest da hoan thanh",qf[0]);
		format(szDialog2, sizeof szDialog2, "Week 1\t%s\t%s\n",bpweekstatus[0] != 1 ? "{FF0000}locked" : "{3BBF0B}unlocked", qf2);
		strcat(szDialog, szDialog2);

		if(bpweekstatus[1] == 0) format(qf2, sizeof qf2,"chua mo");
		else if(qf[1] == 7) format(qf2, sizeof qf2,"{3BBF0B}completed");
		else format(qf2, sizeof qf2,"%d/6 quest da hoan thanh",qf[1]);
		format(szDialog2, sizeof szDialog2, "Week 2\t%s\t%s\n",bpweekstatus[1] != 1 ? "{FF0000}locked" : "{3BBF0B}unlocked", qf2);
		strcat(szDialog, szDialog2);

		if(bpweekstatus[2] == 0) format(qf2, sizeof qf2,"chua mo");
		else if(qf[2] == 7) format(qf2, sizeof qf2,"{3BBF0B}completed");
		else format(qf2, sizeof qf2,"%d/6 quest da hoan thanh",qf[2]);
		format(szDialog2, sizeof szDialog2, "Week 3\t%s\t%s\n",bpweekstatus[2] != 1 ? "{FF0000}locked" : "{3BBF0B}unlocked", qf2);
		strcat(szDialog, szDialog2);

		if(bpweekstatus[3] == 0) format(qf2, sizeof qf2,"chua mo");
		else if(qf[3] == 7) format(qf2, sizeof qf2,"{3BBF0B}completed");
		else format(qf2, sizeof qf2,"%d/6 quest da hoan thanh",qf[2]);
		format(szDialog2, sizeof szDialog2, "Week 4\t%s\t%s",bpweekstatus[3] != 1 ? "{FF0000}locked" : "{3BBF0B}unlocked", qf2);
		strcat(szDialog, szDialog2);
		

		Dialog_Show(playerid, DIALOG_BPQUEST, DIALOG_STYLE_TABLIST_HEADERS, "Battlepass Quests", szDialog, "Chon", "Thoat");
		return 0;
	}
	else if(clickedid == Text:INVALID_TEXT_DRAW) {
		Bit_Vet(openingBp, playerid);

		BP_HideAllTD(playerid);		
		return ~0;
	}
	return 1;
}

hook OnPlayerClickPlayerTD(playerid, PlayerText:playertextid) {
	new string[64],idd,id, page = GetPVarInt(playerid, "BpPage");
	for(new i = 10; i < 20; i++) {
		if(playertextid == BpPTD[i]) {
			if(i >= 15) {
				if(BpUserData[playerid][bpPaidTier] != 1) break;
				switch(page) {
					case 0: {
						id = i-15;
					}
					case 1: {
						id = i-10;
					}
					case 2: {
						id = i-5;
					}
					case 3: {
						id = i;
					}
				}
				if(BpUserData[playerid][bpPaidTierGot][id]) {
					SendClientMessage(playerid, COLOR_WHITE, "Ban Da Nhan Roi");
					break;
				}
				if(page == 0) idd = (i+1-15)*10;
				else if(page == 1) idd = ((i+1-15)*10) + 50;
				else if(page == 2) idd = ((i+1-15)*10) + 100;
				else if(page == 3) idd = ((i+1-15)*10) + 150;
				if(BpUserData[playerid][bpExp] < idd) {
					format(string, sizeof string, "Ban Can %d Exp Moi Co The Nhan Qua Nay. Hien Tai Ban Co %d Exp",idd, BpUserData[playerid][bpExp]);
					SendClientMessage(playerid, COLOR_WHITE, string);
				}
				else {
					switch (BP_PremiumPrize[id][bprize_type]) {
						case PT_MONEY: {
							GivePlayerCash(playerid, BP_PremiumPrize[id][bprize_amount]);
						}
						case PT_KIM_CUONG: {
							PlayerInfo[playerid][pKC] += BP_PremiumPrize[id][bprize_amount];
							Update(playerid, pKCx);
						}
						case PT_PLAYER_EXP: {
							PlayerInfo[playerid][pExp] += BP_PremiumPrize[id][bprize_amount];
							Update(playerid, pRP);
						}
						case PT_RANDOM_CRATE: {
							PlayerInfo[playerid][pCrates][1] += BP_PremiumPrize[id][bprize_amount];
							save_crates(playerid);
						}
						case PT_VEHICLESLOT: {
							UpdateSlots(playerid);
						}
						case PT_MATERIAL: {
							PlayerInfo[playerid][pMats] += BP_PremiumPrize[id][bprize_amount];
							Update(playerid,pMatsx);
						}
						case PT_FIREWORK: {
							PlayerInfo[playerid][pFire] += BP_PremiumPrize[id][bprize_amount];
							UpdateVar(playerid, "Firework", PlayerInfo[playerid][pFire]);
						}
						case PT_BOOMBOX: {
							PlayerInfo[playerid][pBoombox] = 1;
							Update(playerid, pBoomboxx);
						}
						case PT_ROBPOINTS: {
							PlayerInfo[playerid][pRob] += BP_PremiumPrize[id][bprize_amount];
							Update(playerid, pRobx);
						}
						case PT_PREMIUMPOINTS: {
							PlayerInfo[playerid][pPremiumPoints] += BP_PremiumPrize[id][bprize_amount];
							Update(playerid, pPremiumPointsx);
						}
						case PT_EPICCAR_CRATE: {
							PlayerInfo[playerid][pCrates][3] += BP_PremiumPrize[id][bprize_amount];
							save_crates(playerid);
						}
						case PT_CHIP: {
							PlayerInfo[playerid][pCasinoChip] += BP_NormalPrize[id][bprize_amount];						
							UpdateVar(playerid, "CasinoChip", PlayerInfo[playerid][pCasinoChip]);
						}
						case PT_SUPERCARFRAGMENT: {
							PlayerInfo[playerid][pManhXeCC] += BP_PremiumPrize[id][bprize_amount];
							UpdateVar(playerid, "ManhXeCC", PlayerInfo[playerid][pManhXeCC]);
						}
						case PT_MEDEIUMCARFRAGMENT: {
							PlayerInfo[playerid][pManhXeTC] += BP_PremiumPrize[id][bprize_amount];
							UpdateVar(playerid, "ManhXeTC", PlayerInfo[playerid][pManhXeTC]);
						}
					}
					BpUserData[playerid][bpFreeTierGot][id] = 1;
					save_bp(playerid);
				}
			}
			else {
				if(BpUserData[playerid][bpPaidTier] == 1) break;
				switch(page) {
					case 0: {
						id = i-10;
					}
					case 1: {
						id = i-5;
					}
					case 2: {
						id = i;
					}
					case 3: {
						id = i+5;
					}
				}
				if(BpUserData[playerid][bpFreeTierGot][id]) {
					SendClientMessage(playerid, COLOR_WHITE, "Ban Da Nhan Roi");
					break;
				}
				if(page == 0) idd = (i+1-10)*10;
				else if(page == 1) idd = ((i+1-10)*10) + 50;
				else if(page == 2) idd  = ((i+1-10)*10) + 100;
				else if(page == 3) idd  = ((i+1-10)*10) + 150;
				if(BpUserData[playerid][bpExp] < idd) {
					format(string, sizeof string, "Ban Can %d Exp Moi Co The Nhan Qua Nay. Hien Tai Ban Co %d Exp",idd,BpUserData[playerid][bpExp]);
					SendClientMessage(playerid, COLOR_WHITE, string);
				}
				else {
					switch (BP_NormalPrize[i-10][bprize_type]) {
						case PT_MONEY: {
							GivePlayerCash(playerid, BP_NormalPrize[id][bprize_amount]);
						}
						case PT_KIM_CUONG: {
							PlayerInfo[playerid][pKC] += BP_NormalPrize[id][bprize_amount];
							Update(playerid, pKCx);
						}
						case PT_PLAYER_EXP: {
							PlayerInfo[playerid][pExp] += BP_NormalPrize[id][bprize_amount];
							Update(playerid, pRP);
						}
						case PT_RANDOM_CRATE: {
							PlayerInfo[playerid][pCrates][1] += BP_NormalPrize[id][bprize_amount];
							save_crates(playerid);
						}
						case PT_VEHICLESLOT: {
							UpdateSlots(playerid);
						}
						case PT_MATERIAL: {
							PlayerInfo[playerid][pMats] += BP_NormalPrize[id][bprize_amount];
							Update(playerid,pMatsx);
						}
						case PT_FIREWORK: {
							PlayerInfo[playerid][pFire] += BP_NormalPrize[id][bprize_amount];
							UpdateVar(playerid, "Firework", PlayerInfo[playerid][pFire]);
						}
						case PT_BOOMBOX: {
							PlayerInfo[playerid][pBoombox] = 1;
							Update(playerid, pBoomboxx);
						}
						case PT_ROBPOINTS: {
							PlayerInfo[playerid][pRob] += BP_NormalPrize[id][bprize_amount];
							Update(playerid, pRobx);
						}
						case PT_PREMIUMPOINTS: {
							PlayerInfo[playerid][pPremiumPoints] += BP_NormalPrize[id][bprize_amount];
							Update(playerid, pPremiumPointsx);
						}
						case PT_EPICCAR_CRATE: {
							PlayerInfo[playerid][pCrates][3] += BP_NormalPrize[id][bprize_amount];
							save_crates(playerid);
						}
						case PT_CHIP: {
							PlayerInfo[playerid][pCasinoChip] += BP_NormalPrize[id][bprize_amount];						
							UpdateVar(playerid, "CasinoChip", PlayerInfo[playerid][pCasinoChip]);
						}	
						case PT_SUPERCARFRAGMENT: {
							PlayerInfo[playerid][pManhXeCC] += BP_PremiumPrize[id][bprize_amount];
							UpdateVar(playerid, "ManhXeCC", PlayerInfo[playerid][pManhXeCC]);
						}
						case PT_MEDEIUMCARFRAGMENT: {
							PlayerInfo[playerid][pManhXeTC] += BP_PremiumPrize[id][bprize_amount];
							UpdateVar(playerid, "ManhXeTC", PlayerInfo[playerid][pManhXeTC]);
						}
					}
					SendClientMessage(playerid,COLOR_GREEN,"Nhan Thanh Cong");
					BpUserData[playerid][bpFreeTierGot][id] = 1;
					save_bp(playerid);
				}
			}

			//Dialog_Show(playerid, BPITEM_INFO, DIALOG_STYLE_TABLIST_HEADERS, "Battle pass tier item", "sth on top", "Get prize", "Cancel");
		}
	}
}
Dialog:DIALOG_BPQUEST(playerid, response, listitem, inputtext[])
{
	if(!response) return 1;
	new szDialog[512],szDialog2[126], progress[64], progressquestbp;
	if(bpweekstatus[listitem] != 1) return true;
	format(szDialog2, sizeof szDialog2, "No.\tQuest\tTien Do\n");
	strcat(szDialog,szDialog2);
	for(new i; i < 7; i++) {
		switch(listitem) {
			case 0: progressquestbp = BpUserData[playerid][bpWeek1][i];
			case 1: progressquestbp = BpUserData[playerid][bpWeek2][i];
			case 2: progressquestbp = BpUserData[playerid][bpWeek3][i];
			case 3: progressquestbp = BpUserData[playerid][bpWeek4][i];
		}
		if(progressquestbp == -1) format(progress, sizeof progress, "{3BBF0B}Da Hoan Thanh");
		else format(progress, sizeof progress, "{FF0000}%d/%d", progressquestbp,BP_QuestProgress[i][listitem]);
		format(szDialog2, sizeof szDialog2, "%d.\t%s\t%s\n",i+1,BP_QuestName[i][listitem], progress);
		strcat(szDialog,szDialog2);
	}
	Dialog_Show(playerid, 0, DIALOG_STYLE_TABLIST_HEADERS, "BattlePass Quest", szDialog,"OK","Exit");
	return 1;
}
Dialog:BPITEM_INFO(playerid, response, listitem, inputtext[]) {
	if(!response) return 1;
	// Check if player sufficiently acquire that tier (enough tier && have tier plan upgrade)

	// Give it to him and mark that they got that tier
	// I may use these:
	// bpFreeTierGot,
	// bpPaidTierGot

	// Save data, save as array (separated by |) is a good idea

	return 1;
}

BP_InitForPlayer(playerid, page) {
	if(page == 0) {
		for(new i; i < 10; i++) {
			if(i >= 5) PlayerTextDrawSetPreviewModel(playerid, BpPTD[i], BP_PremiumPrize[i-5][bprize_model]);
			else PlayerTextDrawSetPreviewModel(playerid, BpPTD[i], BP_NormalPrize[i][bprize_model]);
		}
		for(new i = 10; i  < sizeof(BpPTD); i++) {
			new string[64], nameprize[30];
			if(i >=15) {
				switch (BP_PremiumPrize[i-15][bprize_type]) {
					case PT_MONEY: format(nameprize, sizeof nameprize, "Money");
					case PT_KIM_CUONG: format(nameprize, sizeof nameprize, "Kim Cuong");
					case PT_PLAYER_EXP: format(nameprize, sizeof nameprize, "Exp");
					case PT_RANDOM_CRATE: format(nameprize, sizeof nameprize, "Random Crate");
					case PT_VEHICLESLOT: format(nameprize, sizeof nameprize, "Slot Xe");
					case PT_MATERIAL: format(nameprize, sizeof nameprize, "Vat Lieu");
					case PT_FIREWORK: format(nameprize, sizeof nameprize, "Phao Hoa");
					case PT_BOOMBOX: format(nameprize, sizeof nameprize, "BoomBox");
					case PT_ROBPOINTS: format(nameprize, sizeof nameprize, "Rob Points");
					case PT_PREMIUMPOINTS: format(nameprize, sizeof nameprize, "Xu");
					case PT_EPICCAR_CRATE: format(nameprize, sizeof nameprize, "Crate Epic Car");
					case PT_CHIP: format(nameprize, sizeof nameprize, "Chip");
					case PT_SUPERCARFRAGMENT: format(nameprize, sizeof nameprize, "Manh Cao Cap");
					case PT_MEDEIUMCARFRAGMENT: format(nameprize, sizeof nameprize, "Manh Trung Cap");
				}
				format(string, sizeof string, "%s~n~%s",FormatNumber(BP_PremiumPrize[i-15][bprize_amount]),nameprize);
				PlayerTextDrawSetString(playerid, BpPTD[i], string);
			}
			else {
				switch (BP_NormalPrize[i-10][bprize_type]) {
					case PT_MONEY: format(nameprize, sizeof nameprize, "Money");
					case PT_KIM_CUONG: format(nameprize, sizeof nameprize, "Kim Cuong");
					case PT_PLAYER_EXP: format(nameprize, sizeof nameprize, "Exp");
					case PT_RANDOM_CRATE: format(nameprize, sizeof nameprize, "Random Crate");
					case PT_VEHICLESLOT: format(nameprize, sizeof nameprize, "Slot Xe");
					case PT_MATERIAL: format(nameprize, sizeof nameprize, "Vat Lieu");
					case PT_FIREWORK: format(nameprize, sizeof nameprize, "Phao Hoa");
					case PT_BOOMBOX: format(nameprize, sizeof nameprize, "BoomBox");
					case PT_ROBPOINTS: format(nameprize, sizeof nameprize, "Rob Points");
					case PT_PREMIUMPOINTS: format(nameprize, sizeof nameprize, "Xu");
					case PT_EPICCAR_CRATE: format(nameprize, sizeof nameprize, "Crate Epic Car");
					case PT_CHIP: format(nameprize, sizeof nameprize, "Chip");
					case PT_SUPERCARFRAGMENT: format(nameprize, sizeof nameprize, "Manh Cao Cap");
					case PT_MEDEIUMCARFRAGMENT: format(nameprize, sizeof nameprize, "Manh Trung Cap");
				}
				format(string, sizeof string, "%s~n~%s",FormatNumber(BP_NormalPrize[i-10][bprize_amount]),nameprize);
				PlayerTextDrawSetString(playerid, BpPTD[i], string);
			}
			PlayerTextDrawShow(playerid, BpPTD[i]);       
		}
		TextDrawSetString(BpTD[10], "1");
		TextDrawSetString(BpTD[11], "2");
		TextDrawSetString(BpTD[12], "3");
		TextDrawSetString(BpTD[13], "4");
		TextDrawSetString(BpTD[14], "5");
	}
	else if(page == 1) {
		for(new i; i < 10; i++) 
		{
			if(i >= 5) PlayerTextDrawSetPreviewModel(playerid, BpPTD[i], BP_PremiumPrize[i][bprize_model]);
			else PlayerTextDrawSetPreviewModel(playerid, BpPTD[i], BP_NormalPrize[i+5][bprize_model]);
		}
		for(new i = 10; i  < sizeof(BpPTD); i++) {
			new string[64], nameprize[30];
			if(i >=15) {
				switch (BP_PremiumPrize[i-10][bprize_type]) {
					case PT_MONEY: format(nameprize, sizeof nameprize, "Money");
					case PT_KIM_CUONG: format(nameprize, sizeof nameprize, "Kim Cuong");
					case PT_PLAYER_EXP: format(nameprize, sizeof nameprize, "Exp");
					case PT_RANDOM_CRATE: format(nameprize, sizeof nameprize, "Random Crate");
					case PT_VEHICLESLOT: format(nameprize, sizeof nameprize, "Slot Xe");
					case PT_MATERIAL: format(nameprize, sizeof nameprize, "Vat Lieu");
					case PT_FIREWORK: format(nameprize, sizeof nameprize, "Phao Hoa");
					case PT_BOOMBOX: format(nameprize, sizeof nameprize, "BoomBox");
					case PT_ROBPOINTS: format(nameprize, sizeof nameprize, "Rob Points");
					case PT_PREMIUMPOINTS: format(nameprize, sizeof nameprize, "Xu");
					case PT_EPICCAR_CRATE: format(nameprize, sizeof nameprize, "Crate Epic Car");
					case PT_CHIP: format(nameprize, sizeof nameprize, "Chip");
					case PT_SUPERCARFRAGMENT: format(nameprize, sizeof nameprize, "Manh Cao Cap");
					case PT_MEDEIUMCARFRAGMENT: format(nameprize, sizeof nameprize, "Manh Trung Cap");
				}
				format(string, sizeof string, "%s~n~%s",FormatNumber(BP_PremiumPrize[i-10][bprize_amount]),nameprize);
				PlayerTextDrawSetString(playerid, BpPTD[i], string);
			}
			else {
				switch (BP_NormalPrize[i-5][bprize_type]) {
					case PT_MONEY: format(nameprize, sizeof nameprize, "Money");
					case PT_KIM_CUONG: format(nameprize, sizeof nameprize, "Kim Cuong");
					case PT_PLAYER_EXP: format(nameprize, sizeof nameprize, "Exp");
					case PT_RANDOM_CRATE: format(nameprize, sizeof nameprize, "Random Crate");
					case PT_VEHICLESLOT: format(nameprize, sizeof nameprize, "Slot Xe");
					case PT_MATERIAL: format(nameprize, sizeof nameprize, "Vat Lieu");
					case PT_FIREWORK: format(nameprize, sizeof nameprize, "Phao Hoa");
					case PT_BOOMBOX: format(nameprize, sizeof nameprize, "BoomBox");
					case PT_ROBPOINTS: format(nameprize, sizeof nameprize, "Rob Points");
					case PT_PREMIUMPOINTS: format(nameprize, sizeof nameprize, "Xu");
					case PT_EPICCAR_CRATE: format(nameprize, sizeof nameprize, "Crate Epic Car");
					case PT_CHIP: format(nameprize, sizeof nameprize, "Chip");
					case PT_SUPERCARFRAGMENT: format(nameprize, sizeof nameprize, "Manh Cao Cap");
					case PT_MEDEIUMCARFRAGMENT: format(nameprize, sizeof nameprize, "Manh Trung Cap");
				}
				format(string, sizeof string, "%s~n~%s",FormatNumber(BP_NormalPrize[i-5][bprize_amount]),nameprize);
				PlayerTextDrawSetString(playerid, BpPTD[i], string);
			}
		}
		TextDrawSetString(BpTD[10], "6");
		TextDrawSetString(BpTD[11], "7");
		TextDrawSetString(BpTD[12], "8");
		TextDrawSetString(BpTD[13], "9");
		TextDrawSetString(BpTD[14], "10");
	}
	else if(page == 2) {
		for(new i; i < 10; i++) 
		{
			if(i >= 5) PlayerTextDrawSetPreviewModel(playerid, BpPTD[i], BP_PremiumPrize[i+5][bprize_model]);
			else PlayerTextDrawSetPreviewModel(playerid, BpPTD[i], BP_NormalPrize[i+10][bprize_model]);
		}
		for(new i = 10; i  < sizeof(BpPTD); i++) {
			new string[64], nameprize[30];
			if(i >=15) {
				switch (BP_PremiumPrize[i-5][bprize_type]) {
					case PT_MONEY: format(nameprize, sizeof nameprize, "Money");
					case PT_KIM_CUONG: format(nameprize, sizeof nameprize, "Kim Cuong");
					case PT_PLAYER_EXP: format(nameprize, sizeof nameprize, "Exp");
					case PT_RANDOM_CRATE: format(nameprize, sizeof nameprize, "Random Crate");
					case PT_VEHICLESLOT: format(nameprize, sizeof nameprize, "Slot Xe");
					case PT_MATERIAL: format(nameprize, sizeof nameprize, "Vat Lieu");
					case PT_FIREWORK: format(nameprize, sizeof nameprize, "Phao Hoa");
					case PT_BOOMBOX: format(nameprize, sizeof nameprize, "BoomBox");
					case PT_ROBPOINTS: format(nameprize, sizeof nameprize, "Rob Points");
					case PT_PREMIUMPOINTS: format(nameprize, sizeof nameprize, "Xu");
					case PT_EPICCAR_CRATE: format(nameprize, sizeof nameprize, "Crate Epic Car");
					case PT_CHIP: format(nameprize, sizeof nameprize, "Chip");
					case PT_SUPERCARFRAGMENT: format(nameprize, sizeof nameprize, "Manh Cao Cap");
					case PT_MEDEIUMCARFRAGMENT: format(nameprize, sizeof nameprize, "Manh Trung Cap");
				}
				format(string, sizeof string, "%s~n~%s",FormatNumber(BP_PremiumPrize[i-5][bprize_amount]),nameprize);
				PlayerTextDrawSetString(playerid, BpPTD[i], string);
			}
			else {
				switch (BP_NormalPrize[i][bprize_type]) {
					case PT_MONEY: format(nameprize, sizeof nameprize, "Money");
					case PT_KIM_CUONG: format(nameprize, sizeof nameprize, "Kim Cuong");
					case PT_PLAYER_EXP: format(nameprize, sizeof nameprize, "Exp");
					case PT_RANDOM_CRATE: format(nameprize, sizeof nameprize, "Random Crate");
					case PT_VEHICLESLOT: format(nameprize, sizeof nameprize, "Slot Xe");
					case PT_MATERIAL: format(nameprize, sizeof nameprize, "Vat Lieu");
					case PT_FIREWORK: format(nameprize, sizeof nameprize, "Phao Hoa");
					case PT_BOOMBOX: format(nameprize, sizeof nameprize, "BoomBox");
					case PT_ROBPOINTS: format(nameprize, sizeof nameprize, "Rob Points");
					case PT_PREMIUMPOINTS: format(nameprize, sizeof nameprize, "Xu");
					case PT_EPICCAR_CRATE: format(nameprize, sizeof nameprize, "Crate Epic Car");
					case PT_CHIP: format(nameprize, sizeof nameprize, "Chip");
					case PT_SUPERCARFRAGMENT: format(nameprize, sizeof nameprize, "Manh Cao Cap");
					case PT_MEDEIUMCARFRAGMENT: format(nameprize, sizeof nameprize, "Manh Trung Cap");
				}
				format(string, sizeof string, "%s~n~%s",FormatNumber(BP_NormalPrize[i][bprize_amount]),nameprize);
				PlayerTextDrawSetString(playerid, BpPTD[i], string);
			}
		}
		TextDrawSetString(BpTD[10], "11");
		TextDrawSetString(BpTD[11], "12");
		TextDrawSetString(BpTD[12], "13");
		TextDrawSetString(BpTD[13], "14");
		TextDrawSetString(BpTD[14], "15");
	}
	else if(page == 3) {
		for(new i; i < 10; i++) 
		{
			if(i >= 5) PlayerTextDrawSetPreviewModel(playerid, BpPTD[i], BP_PremiumPrize[i+10][bprize_model]);
			else PlayerTextDrawSetPreviewModel(playerid, BpPTD[i], BP_NormalPrize[i+15][bprize_model]);
		}
		for(new i = 10; i  < sizeof(BpPTD); i++) {
			new string[64], nameprize[30];
			if(i >=15) {
				switch (BP_PremiumPrize[i][bprize_type]) {
					case PT_MONEY: format(nameprize, sizeof nameprize, "Money");
					case PT_KIM_CUONG: format(nameprize, sizeof nameprize, "Kim Cuong");
					case PT_PLAYER_EXP: format(nameprize, sizeof nameprize, "Exp");
					case PT_RANDOM_CRATE: format(nameprize, sizeof nameprize, "Random Crate");
					case PT_VEHICLESLOT: format(nameprize, sizeof nameprize, "Slot Xe");
					case PT_MATERIAL: format(nameprize, sizeof nameprize, "Vat Lieu");
					case PT_FIREWORK: format(nameprize, sizeof nameprize, "Phao Hoa");
					case PT_BOOMBOX: format(nameprize, sizeof nameprize, "BoomBox");
					case PT_ROBPOINTS: format(nameprize, sizeof nameprize, "Rob Points");
					case PT_PREMIUMPOINTS: format(nameprize, sizeof nameprize, "Xu");
					case PT_EPICCAR_CRATE: format(nameprize, sizeof nameprize, "Crate Epic Car");
					case PT_CHIP: format(nameprize, sizeof nameprize, "Chip");
					case PT_SUPERCARFRAGMENT: format(nameprize, sizeof nameprize, "Manh Cao Cap");
					case PT_MEDEIUMCARFRAGMENT: format(nameprize, sizeof nameprize, "Manh Trung Cap");
				}
				format(string, sizeof string, "%s~n~%s",FormatNumber(BP_PremiumPrize[i][bprize_amount]),nameprize);
				PlayerTextDrawSetString(playerid, BpPTD[i], string);
			}
			else {
				switch (BP_NormalPrize[i+5][bprize_type]) {
					case PT_MONEY: format(nameprize, sizeof nameprize, "Money");
					case PT_KIM_CUONG: format(nameprize, sizeof nameprize, "Kim Cuong");
					case PT_PLAYER_EXP: format(nameprize, sizeof nameprize, "Exp");
					case PT_RANDOM_CRATE: format(nameprize, sizeof nameprize, "Random Crate");
					case PT_VEHICLESLOT: format(nameprize, sizeof nameprize, "Slot Xe");
					case PT_MATERIAL: format(nameprize, sizeof nameprize, "Vat Lieu");
					case PT_FIREWORK: format(nameprize, sizeof nameprize, "Phao Hoa");
					case PT_BOOMBOX: format(nameprize, sizeof nameprize, "BoomBox");
					case PT_ROBPOINTS: format(nameprize, sizeof nameprize, "Rob Points");
					case PT_PREMIUMPOINTS: format(nameprize, sizeof nameprize, "Xu");
					case PT_EPICCAR_CRATE: format(nameprize, sizeof nameprize, "Crate Epic Car");
					case PT_CHIP: format(nameprize, sizeof nameprize, "Chip");
					case PT_SUPERCARFRAGMENT: format(nameprize, sizeof nameprize, "Manh Cao Cap");
					case PT_MEDEIUMCARFRAGMENT: format(nameprize, sizeof nameprize, "Manh Trung Cap");
				}
				format(string, sizeof string, "%s~n~%s",FormatNumber(BP_NormalPrize[i+5][bprize_amount]),nameprize);
				PlayerTextDrawSetString(playerid, BpPTD[i], string);
			}
		}
		TextDrawSetString(BpTD[10], "16");
		TextDrawSetString(BpTD[11], "17");
		TextDrawSetString(BpTD[12], "18");
		TextDrawSetString(BpTD[13], "19");
		TextDrawSetString(BpTD[14], "20");
	}
}

BP_HideAllTD(playerid) {
	for(new i; i  < sizeof(BpTD); i++) {
		TextDrawHideForPlayer(playerid, BpTD[i]);        
	}
	for(new i; i  < sizeof(BpPTD); i++) {
		PlayerTextDrawHide(playerid, BpPTD[i]);
	}
}

BP_UpdateTD(playerid) {
	for(new i; i < 10; i++) {
		// Update data
		// PlayerTextDrawSetString(playerid, PlayerText:text, const string[]);
		// PlayerTextDrawSetString(playerid, PlayerText:text, const string[]);g
		PlayerTextDrawShow(playerid, BpPTD[10 + i]); 
		PlayerTextDrawShow(playerid, BpPTD[i]); 
	}
}