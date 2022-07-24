#include <YSI_Coding\y_hooks>
#include <YSI_Data\y_bit>
#include <YSI_Coding\y_inline>
#include <mysql_prepared>
#include <logger>

#define 	MAX_W1_QUEST 	(6)
#define 	MAX_W2_QUEST 	(6)

#define MAX_BP_TIER_PAGE	(5)

enum e_BP {
	bpP_SQLID,
	bpWeek1[MAX_W1_QUEST],
	bpWeek2[MAX_W2_QUEST],
	bpExp,
	bpFreeTier,
	bpPaidTier,

	// because of this, player can per-items from down to top
	//this reduce much of data I have to save in database
	bpFreeTierGot,
	bpPaidTierGot
}

new 
	BpUserData[MAX_PLAYERS + 1][e_BP],
	BitArray:openingBp<MAX_PLAYERS>;

enum PRIZE_TYPE {
	PT_MONEY,
	PT_VEHICLE_FRAGMENT,
	PT_PLAYER_EXP,
	PT_NEON_UPGRADE,
	PT_JOB_BOOST,
	PT_RANDOM_TOY,
	PT_PREMIUMPOINTS,
	PT_ROBPOINTS,
	PT_VEHICLESLOT,
	PT_FIREWORK,
	PT_MATERIAL
}

enum e_BP_Prize {
	PRIZE_TYPE:bprize_type,
	bprize_amount,
	bprize_model // -1 if it is money
}
new BP_NormalPrize[MAX_BP_TIER_PAGE * 10][e_BP_Prize] = {
	{  }
};
new BP_PremiumPrize[MAX_BP_TIER_PAGE * 10][e_BP_Prize] = {
	{  }
};
hook OnGameModeInit() {
	for(new i; e_BP:i < e_BP; i++) {
		BpUserData[MAX_PLAYERS][e_BP:i] = 0;
	}
}
hook ResetVariables(playerid) {
	BpUserData[playerid] = BpUserData[MAX_PLAYERS];
	Bit_Vet(openingBp, playerid);
}

hook OnPlayerLogin(playerid) {
	new Statement:stmt_readonce = MySQL_PrepareStatement(SQL, 
        "SELECT \
        (`player_sqlid`, `bpExp`, `bpFreeTier`, `bpPaidTier`, \
        `bpW1Q1`, `bpW1Q2`, `bpW1Q3`, `bpW1Q4`, `bpW1Q5`, `bpW1Q6`) \
        `bpW2Q1`, `bpW2Q2`, `bpW2Q3`, `bpW2Q4`, `bpW2Q5`, `bpW2Q6`) \
        FROM `battlepass` WHERE `ID`=?"
    );

	// Run Parallel on statement
	inline OnPlayerBpInfoLoaded() {
		new tmp[e_BP];

		// Storing player progress on database
		MySQL_BindResultInt(stmt_readonce, 0, tmp[bpP_SQLID]);
		MySQL_BindResultInt(stmt_readonce, 1, tmp[bpExp]); // player sqlid
		MySQL_BindResultInt(stmt_readonce, 2, tmp[bpFreeTier]);
		MySQL_BindResultInt(stmt_readonce, 3, tmp[bpPaidTier]);

		const nextCol = 4;
		for(new i = 0; i < MAX_W1_QUEST; ++i) {
			MySQL_BindResultInt(stmt_readonce, nextCol + i, tmp[bpWeek1][i]);
		}

		for(new i = 0; i < MAX_W2_QUEST; ++i) {
			MySQL_BindResultInt(stmt_readonce, nextCol + MAX_W1_QUEST + i, tmp[bpWeek2][i]);
		}

		if(MySQL_Statement_FetchRow(stmt_readonce)) {
			BpUserData[playerid] = tmp;
		}
		else { // Create new
			new query[100];
			mysql_format(SQL, query, sizeof(query), "INSERT INTO `battlepass`(`player_sqlid`) VALUES ('%d')", PlayerInfo[playerid][pSQLID]);
			mysql_query(SQL, query, false);		
		}
		MySQL_StatementClose(stmt_readonce);
	}
	MySQL_BindInt(stmt_readonce, 0, PlayerInfo[playerid][pSQLID]);
	MySQL_ExecuteParallel_Inline(stmt_readonce, using inline OnPlayerBpInfoLoaded);	
	return 1;
}

hook OnPlayerClickTextDraw(playerid, Text:clickedid) {
	if(clickedid == BpTD[17]) { // Prev
		// Check if player can go prev page
		new page = GetPVarInt(playerid, "BpPage") % MAX_BP_TIER_PAGE + 1;
		if(--page == 0) {
			// Initialize last page
			BP_InitForPlayer(playerid, MAX_BP_TIER_PAGE);
			SetPVarInt(playerid, "BpPage", MAX_BP_TIER_PAGE);
		}
		else {
			// Initialize prev page
			BP_InitForPlayer(playerid, page);
			SetPVarInt(playerid, "BpPage", page);
		}
		// Show
		BP_UpdateTD(playerid);
		return ~0;
	}
	else if(clickedid == BpTD[18]) { // Next
		// Check if player can go next page
		new page = GetPVarInt(playerid, "BpPage") % MAX_BP_TIER_PAGE + 1;
		if(++page > MAX_BP_TIER_PAGE) {
			// Initialize first page
			BP_InitForPlayer(playerid, 1);
			SetPVarInt(playerid, "BpPage", 1);
		}
		else {
			// Initialize prev page
			BP_InitForPlayer(playerid, page);
			SetPVarInt(playerid, "BpPage", page);
		}
		// Show 
		BP_UpdateTD(playerid);
		return ~0;
	}
	else if(clickedid == Text:INVALID_TEXT_DRAW) {
		Bit_Vet(openingBp, playerid);

		BP_HideAllTD(playerid);		
		return ~0;
	}
	return 1;
}

hook OnPlayerClickPlayerTD(playerid, PlayerText:playertextid) {
	for(new i; i < 10; i++) {
		if(playertextid == BpPTD[10 + i]) {
			//Show dialog with these infomation: 
			//premium/non premium prize, tier number, 
			//type prize (bank money, vehicle fragment, player exp, 
			//neon upgrade, job boost, random toy, crystal, payday x2 12 hours, 30 rob points
			//random crate, vehicle slot, 30x firework, 60 rob points, ), 50k/75k material)

			// Dialog_Show(playerid, BPITEM_INFO, DIALOG_STYLE_TABLIST_HEADERS, "Battle pass tier item", "sth on top", "Get prize", "Cancel");
		}
	}
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

BP_InitForPlayer(playerid, page = 1) {
	if(0 < page < MAX_BP_TIER_PAGE) {
		// PlayerTextDrawSetString(playerid, PlayerText:text, const string[]);
		// PlayerTextDrawSetString(playerid, PlayerText:text, const string[]);	
		// PlayerTextDrawSetString(playerid, PlayerText:text, const string[]);
	}
	else {
		SendClientMessage(playerid, -1, "Something went wrong, go make a ticket on gtavlc ucp.");
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
	}
}