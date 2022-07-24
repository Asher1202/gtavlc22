#include <YSI_Coding\y_hooks>
#include <YSI_Data\y_bit>
#include <YSI_Coding\y_inline>
#include <YSI_Server\y_colours>
#include <YSI_Coding\y_timers>
#include <mysql_prepared>
#include <logger>

enum E_INV_ACTION {
	STATE_DEFAULT,
	STATE_WAIT,
	STATE_MOVE,
	STATE_CHOOSE_OPTION
}
new E_INV_ACTION:Inventory_PlayerState[MAX_PLAYERS + 1];

enum e_INV_ACTION_DATA {
	itemStart,
	itemDestination,
};
new Inventory_ViewingItem[MAX_PLAYERS];
new Inventory_ActionData[MAX_PLAYERS + 1][e_INV_ACTION_DATA];

hook OnGameModeInit() {
	Iter_Init(iInv);
	Logger_ToggleDebug("inventory", false); // activate the "weapons" debug handler

	for(new i; i < INV_MAX_ITEMS; i++) {
		Items[INV_MAX_ITEMS][item_sqlid] = -1;
		Items[INV_MAX_ITEMS][item_type] = item_type_unknown;
		Items[INV_MAX_ITEMS][item_slot] = -1;
		Items[INV_MAX_ITEMS][item_modelid] = 4524; // very small
		Items[INV_MAX_ITEMS][item_value] = -1;
	}
	for(new i; i < INV_MAX_SLOT; i++) {
		Inv[MAX_PLAYERS][i] = -1;
	}
	for(new i; e_INV_ACTION_DATA:i < e_INV_ACTION_DATA; i++) {
		Inventory_ActionData[MAX_PLAYERS][e_INV_ACTION_DATA:i] = -1;
	}

	// defer Server_CreateInvTest();
}
timer step2[3000]() {
	Player_AddItem(MAX_PLAYERS, ItemType:item_type_skin, 90, 100);
	Player_AddItem(MAX_PLAYERS, ItemType:item_type_skin, 289, 100);
	Player_AddItem(MAX_PLAYERS, ItemType:item_type_skin, 290, 100);	
	Player_AddItem(MAX_PLAYERS, ItemType:item_type_skin, 90, 100);
	Player_AddItem(MAX_PLAYERS, ItemType:item_type_skin, 100, 100);
}
timer Server_CreateInvTest[4000]() {
	// Reset items when player disconnect
	foreach(new slotIdx: iInv[MAX_PLAYERS]) {
		Items[ Inv[MAX_PLAYERS][slotIdx] ] = Items[INV_MAX_ITEMS];
	}
	Iter_Clear(iInv[MAX_PLAYERS]);

	foreach(new i: iInv[MAX_PLAYERS]) {
		printf("%d", i);
	}
	// Inv[MAX_PLAYERS] = Inv[MAX_PLAYERS];
	
	PlayerInfo[MAX_PLAYERS][pSQLID] = 11375; // TIN's mysql id
	PlayerInfo[MAX_PLAYERS][pVip] = 1; // TIN's mysql id
	// LoadPlayerInventory(MAX_PLAYERS);

	defer step2();
}
hook OnPlayerClickTextDraw(playerid, Text:clickedid) {
	if(Player_IsOpenInventory(playerid)) {
		if(InventoryTD[4] == clickedid) { 		// show all
			Inventory_InitData(playerid);
		}
		else if(InventoryTD[5] == clickedid) { // TODO: skin filter
			// Inventory_InitData(playerid, InventoryInitState:inventory_state_skin);
			Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "GTAVLC Inventory", "He thong dang duoc xay dung..", "Ok", "");
		}
		else if(InventoryTD[6] == clickedid) { // TODO: accs
			// Inventory_InitData(playerid, InventoryInitState:inventory_state_skin);
			Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "GTAVLC Inventory", "He thong dang duoc xay dung..", "Ok", "");			
		}		
		else if(InventoryTD[7] == clickedid) { // TODO: misc
			// Inventory_InitData(playerid, InventoryInitState:inventory_state_skin);
			Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "GTAVLC Inventory", "He thong dang duoc xay dung..", "Ok", "");			
		}		
		else if(InventoryTD[2] == clickedid) {// next page
			Inventory_NextPage(playerid);
		}
		else if(InventoryTD[3] == clickedid) {// prev page
			Inventory_PrevPage(playerid);
		}	
		else if(Text:INVALID_TEXT_DRAW == clickedid) {
			Player_HideInventoryTextraw(playerid);
		}
		return ~0;
	}
	return 1;
}
hook OnPlayerClickPlayerTD(playerid, PlayerText:playertextid) {
	if(playertextid == InventoryPTD[18]) {
		CancelSelectTextDraw(playerid);
		return ~0;
	}
	for(new i; i < sizeof(InventoryPTD); i++) {
		if(playertextid == InventoryPTD[i]) {
			//TODO: First click and second click
			new E_INV_ACTION:_state = E_INV_ACTION:Inventory_PlayerState[playerid];

			switch(_state) {
				case STATE_DEFAULT: {
					// Logger_Dbg("inventory", "InventoryPTD STATE_DEFAULT",
					// 	Logger_I("i", i));

					Inventory_PlayerState[playerid] = STATE_WAIT;
					Inventory_ActionData[playerid][itemStart] = i + ((Player_GetInvPage(playerid) - 1) * 15);
					PlayerTextDrawBackgroundColor(playerid, InventoryPTD[i], X11_SEA_GREEN_1);
					PlayerTextDrawShow(playerid, InventoryPTD[i]);
				}
				case STATE_WAIT: {
					new const clickedSlot = i + ((Player_GetInvPage(playerid) - 1) * 15);

					Logger_Dbg("inventory", "InventoryPTD STATE_WAIT", 
						Logger_I("itemStart", Inventory_ActionData[playerid][itemStart]), 
						Logger_I("i", i),
						Logger_I("clickedSlot", clickedSlot)
						);

					if(Inventory_ActionData[playerid][itemStart] == clickedSlot) {
						Inventory_PlayerState[playerid] = STATE_DEFAULT;
						
						if(Inv[playerid][clickedSlot] == -1) { // empty slot
							Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "GTAVLC Inventory", "Slot trong", "Ok", "");
							
							Inventory_InitData(playerid, InventoryInitState:(_:Inventory_State[playerid]), Player_GetInvPage(playerid));
							return ~0;
						}
						else {	// Use item because that slot is not empty
							new const onSlot = Inventory_ActionData[playerid][itemStart];
							Logger_Dbg("inventory", "Use item", Logger_I("i", playerid), Logger_I("onSlot", onSlot));							

							Player_UseItem(playerid, onSlot);							
						}
					}
					else {	// swap items
						// TODO: check if des slot is available, 
						new const onSlot = Inventory_ActionData[playerid][itemStart];
						new const desSlot = i + ((Player_GetInvPage(playerid) - 1) * 15);

						if(Inv[playerid][onSlot] != -1) {
							Items[ Inv[playerid][onSlot] ][item_slot] 	=	desSlot;
						}
						else { // should be an empty slot
							if(Iter_Contains(iInv[playerid], desSlot)) { // desSlot is non-empty
								Iter_Remove(iInv[playerid], desSlot);
								Iter_Add(iInv[playerid], onSlot);
							}
						}

						if(Inv[playerid][desSlot] != -1) {
							Items[ Inv[playerid][desSlot] ][item_slot] 	= 	onSlot;
						}
						else {
							if(Iter_Contains(iInv[playerid], onSlot)) { // onSlot is non-empty
								Iter_Remove(iInv[playerid], onSlot);
								Iter_Add(iInv[playerid], desSlot);
							}
						}

						// TODO: swap them
						new tmp;						
						tmp = Inv[playerid][onSlot];
						Inv[playerid][onSlot] = Inv[playerid][desSlot];
						Inv[playerid][desSlot] = tmp;

						Inventory_InitData(playerid, InventoryInitState:(_:Inventory_State[playerid]), Player_GetInvPage(playerid));

						Inventory_PlayerState[playerid] = STATE_DEFAULT;

						Player_ShowInventoryTextraw(playerid);
					}
				}
			}

			return ~0;
		}
	}
	return 1;
}
hook ResetVariables(playerid) {
	// Reset items when player disconnect
	foreach(new slotIdx: iInv[playerid]) {
		Items[ Inv[playerid][slotIdx] ] = Items[INV_MAX_ITEMS];
	}
	Iter_Clear(iInv[playerid]);

	Inv[playerid] = Inv[MAX_PLAYERS];
	Inventory_PlayerState[playerid] = STATE_DEFAULT;
	Inventory_ActionData[playerid] = Inventory_ActionData[MAX_PLAYERS];
	Inventory_ViewingItem[playerid] = -1;

	Bit_Vet(Player_OpenInventory, playerid);
	return 1;
}
hook OnPlayerDisconnect(playerid) {
	if(IsPlayerLogged[playerid] == 1) {
		Player_SaveInventory(playerid);
	}
}
hook OnGameModeExit() {
	new query[128];

	foreach(new playerid: Player) {
		if(IsPlayerLogged[playerid] == 1) {
			foreach(new i: iInv[playerid]) {
				format(query, sizeof(query), "UPDATE inventory_items SET item_slot=%d WHERE id=%d", 
					Items[ Inv[playerid][i] ][item_slot], Items[ Inv[playerid][i] ][item_sqlid]);
				mysql_pquery(SQL, query);
			}		
		}
	}
}
stock Player_SaveInventory(playerid) {
	new query[128];
	
	foreach(new i: iInv[playerid]) {	
		format(query, sizeof(query), "UPDATE inventory_items SET item_slot=%d WHERE id=%d", 
			Items[ Inv[playerid][i] ][item_slot], Items[ Inv[playerid][i] ][item_sqlid]);
		mysql_pquery(SQL, query);
	}
}
stock Player_AddItem(playerid, ItemType:type, modelid, value = -1) {
	// TODO: check if a player is out of slot
	new const currentSlot = Iter_Count(iInv[playerid]);
	
	if(currentSlot >= Player_GetMaxInvSlot(playerid)) {
		Logger_Dbg("inventory", "exceed limit slot a player can have", Logger_I("playerid", playerid), 
			Logger_I("modelid", modelid), Logger_I("value", value));
		
		return -1;
	}
	new slot = Iter_Alloc(iInv[playerid]); 	// find the empty slot
	if(slot == -1) return -1;

	new Statement: stmt_insert = MySQL_PrepareStatement(SQL, "INSERT INTO inventory_items(player_sqlid, item_slot, item_type, item_modelid, item_value) VALUES (?,?,?,?,?)");

	new item_idx = Item_Create(type, modelid, value);
	// Link item to player's inventory
	Items[item_idx][item_slot] 	= slot;				// update item slot
	Inv[playerid][slot] 		= item_idx;

    MySQL_BindInt(stmt_insert, 0, PlayerInfo[playerid][pSQLID]);
    MySQL_BindInt(stmt_insert, 1, slot);
    MySQL_BindInt(stmt_insert, 2, _:type);
    MySQL_BindInt(stmt_insert, 3, modelid);
    MySQL_BindInt(stmt_insert, 4, value);
	
    MySQL_ExecuteParallel(stmt_insert);
    MySQL_StatementClose(stmt_insert);

	return item_idx;
}
stock Player_RemoveItem(playerid, onSlot) {
	// Remove client side, data will save when the destination player disconnect or server restart/closing with ctrl C
	if(Inv[playerid][onSlot] == -1) { // empty slot
		Logger_Dbg("inventory", "Cannot remove an item on an empty slot", Logger_I("playerid", playerid), Logger_I("onSlot", onSlot));
		return -1;
	}
	new query[200];
	format(query, sizeof(query), "DELETE FROM inventory_items WHERE id=%d", Items[ Inv[playerid][onSlot] ][item_sqlid]);	
	mysql_pquery(SQL, query);

	Items[ Inv[playerid][onSlot] ] 	= 	Items[INV_MAX_ITEMS];
	Inv[playerid][onSlot] 			= 	-1;

	Iter_Remove(iItems, Inv[playerid][onSlot]);
	Iter_Remove(iInv[playerid], onSlot);

	return 1;
}
stock Player_GetSkinSlot(playerid, model) {
	foreach(new i: iInv[playerid]) {
		if(Items[ Inv[playerid][i] ][item_modelid] == model && Items[ Inv[playerid][i] ][item_type] == item_type_skin) {
			return i;
		}
	}
	return -1;
}

//TODO: Use Item
stock Player_UseItem(playerid, onSlot) {
	new const item_idx = Inv[playerid][onSlot];

	switch(_:Items[item_idx][item_type]) {
		case item_type_skin: {
			Inventory_ViewingItem[playerid] = item_idx;

			new dataString[200];
			CancelSelectTextDraw(playerid);			// Hide inventory textdraw

			format(dataString, sizeof(dataString), 
				"\
				Chon tuy chon:\n\
				Loai: %s\n\
				Skin ID: %d\n\
				Pham chat: %s\n\
				Do ben: %d%%\n\
				--------\n\
				Su dung\n\
				Xoa", 
				
				Item_GetTypeName(Items[item_idx][item_type]), 
				Items[item_idx][item_modelid], 
				Skin_GetQuality(Items[item_idx][item_modelid]),
				Items[item_idx][item_value]
				);
			
			Dialog_Show(playerid, INV_SKIN, DIALOG_STYLE_TABLIST_HEADERS, "GTAVLC Inventory", dataString, "Choose", "Cancel");
		}
		default: {
			Dialog_Show(playerid, 0, DIALOG_STYLE_TABLIST_HEADERS, "GTAVLC Inventory", "Tinh nang dang duoc xay dung, xin hay cho doi...", "Choose", "Cancel");			
		}
	}
}
Dialog:INV_SKIN(playerid, response, listitem, inputtext[]) {
	if(!response) return callcmd::inv(playerid, "");
	new const item_idx = Inventory_ViewingItem[playerid];

	switch(listitem) {
		case 5: { // Use
			// if(PlayerInfo[playerid][pMember] != 0) {
			// 	va_SendClientMessage(playerid, colour, const fmat[], va_args<>);
			// 	return 1;
			// }
			SetPlayerSkinEx(playerid, Items[item_idx][item_modelid]);
			va_SendClientMessage(playerid, X11_TOMATO_1, "[Inventory] " WHITE "Ban da su dung skin %d.", Items[item_idx][item_modelid]);

			new query[128];
			format(query,sizeof(query),"UPDATE users SET `Model`='%d' WHERE `ID`='%d'",PlayerInfo[playerid][pModel],PlayerInfo[playerid][pSQLID]);
			mysql_query(SQL,query);

			callcmd::inv(playerid, "");
		}
		case 6: { // Delete
			new dataString[100];

			format(dataString, sizeof(dataString), "Ban co chac muon xoa skin %d tren slot %d.\nKhong\nCo", Items[item_idx][item_modelid], Items[item_idx][item_slot]);
			Dialog_Show(playerid, INV_ITEM_DELETE_CONFIRM, DIALOG_STYLE_TABLIST_HEADERS, "GTAVLC Inventory", dataString, "Choose", "Cancel");
		}
		default: {
			Player_UseItem(playerid, Items[item_idx][item_slot]);
		}
	}

	return 1;
}
Dialog:INV_ITEM_DELETE_CONFIRM(playerid, response, listitem, inputtext[]) {
	new const item_idx = Inventory_ViewingItem[playerid];
	new const onSlot = Items[item_idx][item_slot];
	if(!response) { Player_UseItem(playerid, onSlot); return 1; }

	if(listitem == 0) { // No
		Player_UseItem(playerid, onSlot);
	}
	else if(listitem == 1) { // Yes
		if(Player_RemoveItem(playerid, onSlot) == -1) {
			Logger_Dbg("inventory", "There be something wrong while remove item", Logger_I("playerid", playerid), Logger_I("onSlot", onSlot));

			SendClientMessage(playerid, -1, "Thao tac khong the thuc hien.");
			return 1;
		}
		else {
			SendClientMessage(playerid, -1, "Ban da xoa item.");
			return callcmd::inv(playerid, "");
		}
	}
	return 1;
}
//TODO: 
Item_Create(ItemType:type, modelid, value) {
	// always have slot for new items.
	new const idx = Iter_Alloc(iItems);

	Items[idx][item_type] = type;
	Items[idx][item_modelid] = modelid;
	Items[idx][item_slot] = -1;
	Items[idx][item_value] = value;

	return idx;
}
hook OnPlayerLogin(playerid) {
	new Statement:stmt_readloop = MySQL_PrepareStatement(SQL, "SELECT * FROM inventory_items WHERE player_sqlid = ?");
	// Run Threaded on statement
	inline OnInventoryLoaded() {
		new
			id, sqlid, slot, type, modelid, value;

		MySQL_BindResultInt(stmt_readloop, 0, id);
		MySQL_BindResultInt(stmt_readloop, 1, sqlid); // player sqlid
		MySQL_BindResultInt(stmt_readloop, 2, slot);
		MySQL_BindResultInt(stmt_readloop, 3, type);
		MySQL_BindResultInt(stmt_readloop, 4, modelid);
		MySQL_BindResultInt(stmt_readloop, 5, value);

		while(MySQL_Statement_FetchRow(stmt_readloop)) {
			new item_idx = Item_Create(ItemType:type, modelid, value);
			// Link item to player's inventory
			if(slot >= Player_GetMaxInvSlot(playerid)) {
				slot = Iter_Free(iInv[playerid]);
			}

			Items[item_idx][item_slot] 	= slot;				// update item slot
			Items[item_idx][item_sqlid] = id;

			Inv[playerid][slot] 		= item_idx;

			Iter_Add(iInv[playerid], slot);
		}
		MySQL_StatementClose(stmt_readloop);
	}
	MySQL_BindInt(stmt_readloop, 0, PlayerInfo[playerid][pSQLID]);
	MySQL_ExecuteThreaded_Inline(stmt_readloop, using inline OnInventoryLoaded);	
	return 1;
}

// Navigate
stock Inventory_NextPage(playerid) {
	return Inventory_InitData(playerid, InventoryInitState:(_:Inventory_State[playerid]), Player_GetInvPage(playerid) + 1);
}
stock Inventory_PrevPage(playerid) {
	return Inventory_InitData(playerid, InventoryInitState:(_:Inventory_State[playerid]), Player_GetInvPage(playerid) - 1);
}

// Data store
stock Inventory_InitData(playerid, InventoryInitState:_state = inventory_state_all, page = 1) {
	Logger_Dbg("inventory", "Inventory_InitData", Logger_I("_state", _:_state), 
		Logger_I("page", page), Logger_I("max inv slot", Player_GetMaxInvSlot(playerid)));

	if(page <= 0 || (Player_GetMaxInvSlot(playerid) / 15 + 1) < page) {
		PlayerPlaySound(playerid, 1085, 0.0, 0.0, 10.0);
		return 0;
	}

	Inventory_Page[playerid] = page;
	Inventory_State[playerid] = _state;
	PlayerPlaySound(playerid, 1083, 0.0, 0.0, 10.0);

	new str[50];
	GetPlayerName(playerid, str);
	PlayerTextDrawSetString(playerid, InventoryPTD[16], str);

	format(str, sizeof(str), "level: %d (%0.2f%%)~n~%0.2f played hours~n~bank: $%s", 
		PlayerInfo[playerid][pLevel], 
		float(PlayerInfo[playerid][pExp])/float(PlayerInfo[playerid][pLevel])/levelexp*100,
		PlayerInfo[playerid][pConnectTime],
		FormatNumber(PlayerInfo[playerid][pAccount])
	);
	PlayerTextDrawSetString(playerid, InventoryPTD[17], str);
	PlayerTextDrawSetPreviewModel(playerid, InventoryPTD[15], PlayerInfo[playerid][pModel]);

	switch(_:_state) {
		case inventory_state_all: {
			for(new i = 15 * (page - 1), j = 15 * page; i < j; i++) {
				new const item_idx = Inv[playerid][i];

				if(item_idx == -1) {
					// blank slot
					PlayerTextDrawBackgroundColor(playerid, InventoryPTD[i % 15], X11_GHOST_WHITE);
					PlayerTextDrawSetPreviewModel(playerid, InventoryPTD[i % 15], 4524);
					PlayerTextDrawSetPreviewRot(playerid, InventoryPTD[i % 15], -10.000000, 0.000000, -20.000000, 0.000000);
				}
				else {
					//TODO: check quality and set background color properly
					if(Items[item_idx][item_type] == item_type_skin) {
						PlayerTextDrawBackgroundColor(playerid, InventoryPTD[i % 15], GetSkinRareCMD(Items[item_idx][item_modelid]));
					}
					PlayerTextDrawSetPreviewModel(playerid, InventoryPTD[i % 15], Items[item_idx][item_modelid]);
					PlayerTextDrawSetPreviewRot(playerid, InventoryPTD[i % 15], -10.000000, 0.000000, -20.000000, 1.000000);
					
				}
			}
			Player_ShowInventoryTextraw(playerid);
		}
		case inventory_state_skin: {
		}	
		case inventory_state_accs: {
		}
		case inventory_state_misc: {
		}
	}
	return 1; // success
}

// Textdraws
stock Player_ShowInventoryTextraw(playerid) {
	for(new i = 0; i < sizeof(InventoryTD); i++) {
		TextDrawShowForPlayer(playerid, InventoryTD[i]);
	}
	for(new i = 0; i < sizeof(InventoryPTD); i++) {
		PlayerTextDrawShow(playerid, InventoryPTD[i]);
	}
	SelectTextDraw(playerid, 0xFF0000FF);
	
	Bit_Let(Player_OpenInventory, playerid);
}
stock Player_HideInventoryTextraw(playerid) {
	for(new i = 0; i < sizeof(InventoryTD); i++) {
		TextDrawHideForPlayer(playerid, InventoryTD[i]);
	}
	for(new i = 0; i < sizeof(InventoryPTD); i++) {
		PlayerTextDrawHide(playerid, InventoryPTD[i]);
	}
	
	Bit_Vet(Player_OpenInventory, playerid);
}

// Getters
stock Player_GetItemNumber(playerid) return Iter_Count(iInv[playerid]);
stock Player_GetInvPage(playerid) return Inventory_Page[playerid];
stock Player_GetMaxInvSlot(playerid) return INV_NORMAL_USER_SLOT + PlayerInfo[playerid][pVip] * 5;

// Util
stock GetSkinRareCMD(skin) {
    new x;
    switch (skin) {
        case 167, 170, 188, 159, 260:
            x = 0x87CCEEFF;
        case 228, 248, 264, 189, 185, 146:
            x = 0xC844B2FF;
        case 0, 104, 116, 164, 149, 306, 293, 285, 289, 294:
            x = 0xFFA31FFF;
        case 93, 108, 171, 177, 217, 271:
            x = 0xe7331eFF;
        case 124, 187, 181, 241, 242, 292, 309:
            x = 0x00ffdcFF;
        default:
            x = X11_GHOST_WHITE;
    }
    return x;
}
stock GetSkinRare(skin) {
    switch (skin) {
        case 167, 170, 188, 159, 260, 228, 248, 264, 189, 185, 146, 0, 104, 116, 164, 149, 306, 293, 285, 289, 294, 124, 187, 181, 241, 242, 292, 309, 93, 108, 171, 177, 217, 271:
            return true;
    }
    return false;
}
stock Item_GetTypeName(const ItemType:type) {
	new typename[40];
	format(typename, sizeof(typename), "%s", Inventory_TypeName[_:type]);

	return typename;
}
stock Skin_GetQuality(skin) {
    new string[20];
    switch (skin) {
        case 167, 170, 188, 159, 260:
            string = "RARE";
        case 228, 248, 264, 189, 185, 146:
            string = "SUPPER RARE";
        case 0, 104, 116, 164, 149, 293, 285, 289, 294:
            string = "EPIC";
        case 93, 108, 171, 177, 217, 271:
            string = "LEGEND";
        case 124, 187, 181, 241, 242, 292, 309:
            string = "LIMITED";
        default:
            string = "NORMAL";
    }
    return string;
}