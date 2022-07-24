#include <YSI_Data\y_bit>

/* 
	Inventory system written by Tin

 */
new
	BitArray:Player_OpenInventory<MAX_PLAYERS>;

#define 	INV_NORMAL_USER_SLOT 		10
#define 	INV_MAX_SLOT 				(INV_NORMAL_USER_SLOT + 5 * VIP_MAX_RANK)
#define 	INV_MAX_ITEMS 				(MAX_PLAYERS * INV_MAX_SLOT)

enum ItemType {
	item_type_unknown,
	item_type_skin,
	item_type_vehs,
	item_type_accs,
	item_type_misc
	//TODO: item-type-weapon?
}
new const Inventory_TypeName[][] = {
	"Khong ro",
	"Skin",
	"Vehicle",
	"Accessory",
	"Linh tinh"	
};
enum pI {
	item_sqlid,
	ItemType:item_type,
	item_slot,
	item_modelid,
	// item_modelid can be skin id, vehicle id, object id (for accs, misc), or special indexes (misc)
	item_value 
	/* 
		item_value can be 
			stability (độ bền/for skin, accs)
			-1 (if item is vehicle)
			amount (for misc)
	*/
}
enum InventoryInitState {
	inventory_state_all,
	inventory_state_skin,
	inventory_state_accs,
	inventory_state_misc	
}

new Items[INV_MAX_ITEMS + 1][pI];
new Iterator:iItems<INV_MAX_ITEMS>; 		// dynamicially alloc/unalloc items
new Inv[MAX_PLAYERS + 1][INV_MAX_SLOT];
new Iterator:iInv[MAX_PLAYERS + 1]<INV_MAX_SLOT>;	// preresent player inventory slot, Inv[x] returns Items_index

new Inventory_Page[MAX_PLAYERS + 1];
new InventoryInitState:Inventory_State[MAX_PLAYERS + 1];


#include <inventory_textdraw>
#include <inventory_impl>

CMD:inv(playerid, params[]) {
	// if(Player_IsOpenInventory(playerid)) return 1;
	Inventory_InitData(playerid);
	Player_ShowInventoryTextraw(playerid);
	return 1;
}
stock Player_IsOpenInventory(playerid) {
	return Bit_Get(Player_OpenInventory, playerid);
}

#include <YSI_Coding\y_hooks>
hook OnPlayerLogin(playerid) {
	// Temparately refund skin for player
    for (new i = 0; i < 10; i++) {
        if(PlayerInfo[playerid][pSkins][i] != -1) {
			Player_AddItem(playerid, ItemType:item_type_skin, PlayerInfo[playerid][pSkins][i], 100);
			PlayerInfo[playerid][pSkins][i] = -1;
        }
    }

	new string[128];
	mysql_format(SQL, string, sizeof(string), "UPDATE `users` SET `Skin`='%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|' WHERE `ID`='%d'",
	PlayerInfo[playerid][pSkins][0], PlayerInfo[playerid][pSkins][1], PlayerInfo[playerid][pSkins][2], PlayerInfo[playerid][pSkins][3], PlayerInfo[playerid][pSkins][4],
	PlayerInfo[playerid][pSkins][5], PlayerInfo[playerid][pSkins][6], PlayerInfo[playerid][pSkins][7], PlayerInfo[playerid][pSkins][8], PlayerInfo[playerid][pSkins][9],
	PlayerInfo[playerid][pSQLID]);

	mysql_pquery(SQL, string);
}