/* ** Definitions ** */
/* ** Variables ** */
/* ** Hooks ** */
/*hook OnPlayerLoginEx(playerid) {
 	new string[256];
 	mysql_format(SQL, string, sizeof string, "SELECT * FROM `inventory` WHERE `invOwnerID` = '%d'", PlayerInfo[playerid][pSQLID]);
 	mysql_tquery(SQL, string, "loadInventory", "i", playerid);
}*/
/* ** Functions ** */
stock Inventory_Update(playerid, td, id, amount, type) { // đây là hàm để thay đổi preview textdraw, bao gồm số lượng thức ăn, hiển thị thức ăn
	if(type == 1) {
		switch(id) {
			case 0: PlayerTextDrawSetPreviewRot(playerid, invTD[playerid][td+7], 0.0, 0.0, 0.0, 100);
			case 330: PlayerTextDrawSetPreviewRot(playerid, invTD[playerid][td+7], 0.0, 0.0, 0.0, 0.7); //cell phone
			case 340..360: PlayerTextDrawSetPreviewRot(playerid, invTD[playerid][td+7], 0.0, 0.0, 0.0, 1.7); //guns
			case 1600: PlayerTextDrawSetPreviewRot(playerid, invTD[playerid][td+7], 0.0, 0.0, 90.0, 1); //ca
			case 1604: PlayerTextDrawSetPreviewRot(playerid, invTD[playerid][td+7], 0.0, 0.0, 90.0, 1); //ca
			case 2103: PlayerTextDrawSetPreviewRot(playerid, invTD[playerid][td+7], 180.0, 180.0, 0.0, 1); //music box
			case 2703: PlayerTextDrawSetPreviewRot(playerid, invTD[playerid][td+7], 90.0, 180.0, 170.0, 0.9); // burger
			case 18875: PlayerTextDrawSetPreviewRot(playerid, invTD[playerid][td+7], -90.0, 0.0, 180.0, 1); //mp3
			case 19421..19424: PlayerTextDrawSetPreviewRot(playerid, invTD[playerid][td+7], 150.0, 0.0, 0.0, 1); //headphones
			case 19897: PlayerTextDrawSetPreviewRot(playerid, invTD[playerid][td+7], 90.0, 180.0, 0.0, 0.39); //ciga
			
			default: PlayerTextDrawSetPreviewRot(playerid, invTD[playerid][td+7], 0.0, 0.0, 0.0, 1);
		}
		PlayerTextDrawSetPreviewModel(playerid, invTD[playerid][td+7], id);
		PlayerTextDrawShow(playerid, invTD[playerid][td + 7]);
		if(amount > 0) playerTextDrawSetString(playerid, invTD[playerid][td + 22], "x%d", amount);
		else playerTextDrawSetString(playerid, invTD[playerid][td + 22], "");
		PlayerTextDrawShow(playerid, invTD[playerid][td + 22]);
	}
	if(type == 2) {// type 1 là các món đồ bình thường, type 2 là súng. Được sử dụng với showPlayerInventory(playerid, type);
		switch(id) {
			case 0: PlayerTextDrawSetPreviewRot(playerid, invTD[playerid][td+26], 0.0, 0.0, 0.0, 100);
			case 19421..19424: PlayerTextDrawSetPreviewRot(playerid, invTD[playerid][td+26], 150.0, 0.0, 0.0, 1);
			default: PlayerTextDrawSetPreviewRot(playerid, invTD[playerid][td+26], 0.0, 0.0, 0.0, 1);
		}
		PlayerTextDrawSetPreviewModel(playerid, invTD[playerid][td+26], id);
		PlayerTextDrawShow(playerid, invTD[playerid][td + 26]);
	}
	return 1;
}

stock Inventory_UpdateSpec(playerid, userid, td, id, amount, type) { //đây là hàm để /checktui nó sẽ fetch inventory của userid
	if(type == 1) {
		switch(id) {
			case 0: PlayerTextDrawSetPreviewRot(playerid, invTD[userid][td+7], 0.0, 0.0, 0.0, 100);
			case 330: PlayerTextDrawSetPreviewRot(playerid, invTD[userid][td+7], 0.0, 0.0, 0.0, 0.7); //cell phone
			case 340..360: PlayerTextDrawSetPreviewRot(playerid, invTD[userid][td+7], 0.0, 0.0, 0.0, 1.7); //guns
			case 1600: PlayerTextDrawSetPreviewRot(playerid, invTD[userid][td+7], 0.0, 0.0, 90.0, 1); //ca
			case 1604: PlayerTextDrawSetPreviewRot(playerid, invTD[userid][td+7], 0.0, 0.0, 90.0, 1); //ca
			case 2103: PlayerTextDrawSetPreviewRot(playerid, invTD[userid][td+7], 180.0, 180.0, 0.0, 1); //music box
			case 2703: PlayerTextDrawSetPreviewRot(playerid, invTD[userid][td+7], 90.0, 180.0, 170.0, 0.9); // burger
			case 18875: PlayerTextDrawSetPreviewRot(playerid, invTD[userid][td+7], -90.0, 0.0, 180.0, 1); //mp3
			case 19421..19424: PlayerTextDrawSetPreviewRot(playerid, invTD[userid][td+7], 150.0, 0.0, 0.0, 1); //headphones
			case 19897: PlayerTextDrawSetPreviewRot(playerid, invTD[userid][td+7], 90.0, 180.0, 0.0, 0.39); //ciga
			
			default: PlayerTextDrawSetPreviewRot(playerid, invTD[userid][td+7], 0.0, 0.0, 0.0, 1);
		}
		PlayerTextDrawSetPreviewModel(playerid, invTD[userid][td+7], id);
		PlayerTextDrawShow(playerid, invTD[userid][td + 7]);
		if(amount > 0) playerTextDrawSetString(playerid, invTD[userid][td + 22], "x%d", amount);
		else playerTextDrawSetString(playerid, invTD[userid][td + 22], "");
		PlayerTextDrawShow(playerid, invTD[userid][td + 22]);
	}
	if(type == 2) {
		switch(id) {
			case 0: PlayerTextDrawSetPreviewRot(playerid, invTD[playerid][td+26], 0.0, 0.0, 0.0, 100);
			case 19421..19424: PlayerTextDrawSetPreviewRot(playerid, invTD[playerid][td+26], 150.0, 0.0, 0.0, 1);
			default: PlayerTextDrawSetPreviewRot(playerid, invTD[playerid][td+26], 0.0, 0.0, 0.0, 1);
		}
		PlayerTextDrawSetPreviewModel(playerid, invTD[playerid][td+26], id);
		PlayerTextDrawShow(playerid, invTD[playerid][td + 26]);
	}
	return 1;
}


stock Inventory_GetAttachID(playerid) {
	if (Inventory_Items(playerid, 2) >= 4) return -1;
	for (new i = 36; i < 40; i++) { if (invData[playerid][i][invAttached] != 1) return i; }
	return -1; 
}

stock Inventory_Count(playerid, const item[], type) {
	new itemid = Inventory_GetItemID(playerid, item, type);
	if (itemid != -1) return invData[playerid][itemid][invQuantity];
	return 0;
}

stock Inventory_HasItem(playerid, const item[]) {
	return (Inventory_GetItemID(playerid, item, 1) != -1);
}

stock Inventory_IsAttached(playerid, const item[]) {
	return (Inventory_GetItemID(playerid, item, 2) != -1);
}

stock Inventory_GetItemID(playerid, const item[], type, quantity = 0) {
	if(type == 1) {
		for (new i = 0; i < MAX_INVENTORY; i ++) {
		    if (invData[playerid][i][invExists] == 0) continue;
		    if (invData[playerid][i][invExists] == 3) return -1;
		    if (!invData[playerid][i][invExists] && quantity == -1) return -1;
			if (!strcmp(invData[playerid][i][invItem], item)) return i;
		}
	}
	else if(type == 2) {
		for (new i = 36; i < 40; i ++) {
			if (invData[playerid][i][invAttached] == 0) continue;
			if (!invData[playerid][i][invAttached] && quantity == -1) return -1;
			if (!strcmp(invData[playerid][i][invItem], item)) return i;
		}
	}
	return -1;
}

stock Inventory_Items(playerid, imd, type = 1) {
    new count;
    if(imd == 1) {
    	switch(type) {
    		case 1: for (new i = 0; i != MAX_INVENTORY; i++) if (invData[playerid][i][invExists] != 0) { count++; }
    		case 2: for (new i = 12; i != MAX_INVENTORY; i++) if (invData[playerid][i][invExists] != 0) { count++; }
    		case 3: for (new i = 24; i != MAX_INVENTORY; i++) if (invData[playerid][i][invExists] != 0) { count++; }
    	}
	}
	else if(type == 2) for (new i = 36; i < 40; i++) if (invData[playerid][i][invAttached] != 0) { count++; }
	return count; 
}

stock Inventory_GetFreeID(playerid, type = 1) {
	if (Inventory_Items(playerid, 1, type) >= 12) return -1;
	switch(type) {
		case 1: for (new i = 0; i < MAX_INVENTORY; i++) { if (invData[playerid][i][invExists] != 1) return i; }
		case 2: for (new i = 12; i < MAX_INVENTORY; i++) { if (invData[playerid][i][invExists] != 2) return i; }
		case 3: for (new i = 24; i < MAX_INVENTORY; i++) { if (invData[playerid][i][invExists] != 3) return i; }
	}
	return -1; 
}

Inventory_Add(playerid, const item[], model, quantity, type) { // đây là add 
	new itemid = Inventory_GetItemID(playerid, item, 1, quantity), string[256]; // itemid sẽ bắt đầu từ id 0. Ví dụ burger id 0 thì cá sẽ auto là id 1 và cá hiếm sẽ là 2, đây là để không trùng
	if (itemid == -1) {
	    itemid = Inventory_GetFreeID(playerid, type);
	    if (itemid != -1) {
	        invData[playerid][itemid][invExists] = type;
	        invData[playerid][itemid][invModel] = model;
	        invData[playerid][itemid][invQuantity] = quantity;
	        invData[playerid][itemid][invAttachSlot] = 0;
	        invData[playerid][itemid][invAttached] = 0;
			if(isInInven[playerid] != 0) { // biến này check xem người chơi có đang mở inventory không
		    	if(type == 2) Inventory_Update(playerid, itemid-12, invData[playerid][itemid][invModel], invData[playerid][itemid][invQuantity], 1);
		    	else if(type == 3) Inventory_Update(playerid, itemid-24, invData[playerid][itemid][invModel], invData[playerid][itemid][invQuantity], 1);
		    	else Inventory_Update(playerid, itemid, invData[playerid][itemid][invModel], invData[playerid][itemid][invQuantity], 1);
		    }
	        format(invData[playerid][itemid][invItem], 32, item);
			
			new query[400];
			format(query, sizeof(query), "INSERT INTO `inventory` (`invOwnerID`,`invOwnerName`, `invItem`, `invModel`, `invQuantity`, `invType`) VALUES('%d', '%s','%s', '%d', '%d', '%d')",PlayerInfo[playerid][pSQLID], GetName(playerid),item, model, quantity, type);
			mysql_tquery(SQL, query, "OnQuerySaveFood", "ii", playerid, itemid);// trước kia thì anh dùng mysql_query nhưng có vẻ nó bi lỗi nên anh chuyển sang như này
			// new Cache:x = mysql_query(SQL, query);
				
			// invData[playerid][itemid][invID] = cache_insert_id();
			// format(string, sizeof(string), "SQLID : %d, So Huu : %s, Item : %s, So Luong %d, invID : %d", PlayerInfo[playerid][pSQLID], GetName(playerid),item, quantity, invData[playerid][itemid][invID]);
			// SendClientMessage(playerid, COLOR_PURPLE, "Neu SQLID hoac So Huu khong phai la cua ban vui long chup lai va gui cho Asher nhe!");
			// SendClientMessage(playerid, COLOR_PURPLE, string);

			// cache_delete(x);
	        // return itemid;
		}
		return -1;
	}
	else {
		format(string, sizeof(string), "UPDATE `inventory` SET `invQuantity` = `invQuantity` + %d WHERE `invOwnerID` = '%d' AND `invID` = '%d'", quantity,PlayerInfo[playerid][pSQLID], invData[playerid][itemid][invID]);
		mysql_tquery(SQL, string);
		invData[playerid][itemid][invQuantity] += quantity;
		// mysql_tquery(SQL, query, "OnQuerySaveFood", "ii", playerid, itemid);// cái này có thể xoá cũng được
		if(isInInven[playerid] != 0) {
			if(type == 2) Inventory_Update(playerid, itemid-12, invData[playerid][itemid][invModel], invData[playerid][itemid][invQuantity], 1);
			else if(type == 3) Inventory_Update(playerid, itemid-24, invData[playerid][itemid][invModel], invData[playerid][itemid][invQuantity], 1);
			else Inventory_Update(playerid, itemid, invData[playerid][itemid][invModel], invData[playerid][itemid][invQuantity], 1);
		}
	}
	return itemid;
}
function OnQuerySaveFood(playerid, itemid) {
    invData[playerid][itemid][invID] = cache_insert_id();

    new szQuery[128];
    format(szQuery, sizeof(szQuery), "UPDATE `inventory` SET `invQuantity` = '%d' WHERE `invID` = '%d'", invData[playerid][itemid][invQuantity], invData[playerid][itemid][invID]);

    mysql_tquery(SQL, szQuery, "SaveFood", "ii", playerid, itemid);
}
function SaveFood(playerid, itemid) {
    new szQuery[500];

    if(invData[playerid][itemid][invQuantity] >= 1) // Making sure the player actually has a burger so we won't save a empty row
    {// Khi thay đổi số lượng hay bất cứ gì đó trong inventory ở database thì trong game không cập nhật dẫn đến nó sẽ không check được. Ví dụ em delete 10 cái burger trong inventory -> trong game không cập nhật -> vẫn còn 1 cái và nó sẽ không gọi hàm này mà nó sẽ gọi UPDATE. UPDATE giá trị rỗng -> mất burger
        format(szQuery, sizeof(szQuery), "UPDATE `inventory` SET `invOwnerID` = '%d',`invOwnerName` = '%s', `invItem` = '%s', `invModel` = '%d', `invQuantity` = '%d', `invType` = '%d' WHERE `invID` = '%d'",
		PlayerInfo[playerid][pSQLID], 
		GetName(playerid),
		invData[playerid][itemid][invItem],
		invData[playerid][itemid][invModel], 
		invData[playerid][itemid][invQuantity], 
		invData[playerid][itemid][invExists],
		invData[playerid][itemid][invID]);
        mysql_query(SQL, szQuery, false);
		// printf("%s (%i) saving food %i | SQL : %d | Name : %s | Item : %s | Model : %d | Quantity : %d | Type : %d | InvID : %d", 
		// GetName(playerid), playerid, itemid, PlayerInfo[playerid][pSQLID],GetName(playerid),invData[playerid][itemid][invItem],
		// invData[playerid][itemid][invModel], 
		// invData[playerid][itemid][invQuantity], 
		// invData[playerid][itemid][invExists],
		// invData[playerid][itemid][invID] );
    }
	//else {if invQuantity < 1 -> INSERT INTO?}
}
Inventory_Remove(playerid, const item[], type, quantity = 1) {
	new itemid = Inventory_GetItemID(playerid, item, 1), string[128];
	if (itemid != -1) {
	    if (invData[playerid][itemid][invQuantity] > 0) {
	        invData[playerid][itemid][invQuantity] -= quantity;
		}
		if (quantity == -1 || invData[playerid][itemid][invQuantity] < 1) {
		    invData[playerid][itemid][invExists] = 0;
		    invData[playerid][itemid][invModel] = 0;
		    invData[playerid][itemid][invQuantity] = 0;
		    invData[playerid][itemid][invAttached] = 0;
		    if(isInInven[playerid] != 0) {
		    	if(type == 2) Inventory_Update(playerid, itemid-12, invData[playerid][itemid][invModel], invData[playerid][itemid][invQuantity], 1);
		    	else if(type == 3) Inventory_Update(playerid, itemid-24, invData[playerid][itemid][invModel], invData[playerid][itemid][invQuantity], 1);
		    	else Inventory_Update(playerid, itemid, invData[playerid][itemid][invModel], invData[playerid][itemid][invQuantity], 1);
		    }
		    format(string, sizeof(string), "DELETE FROM `inventory` WHERE `invOwnerID` = '%d' AND `invID` = '%d'",PlayerInfo[playerid][pSQLID], invData[playerid][itemid][invID]);
	        mysql_query(SQL, string,false);	
		}
		else if (quantity != -1 && invData[playerid][itemid][invQuantity] > 0) {
			format(string, sizeof(string), "UPDATE `inventory` SET `invQuantity` = `invQuantity` - %d WHERE `invOwnerID` = '%d' AND `invID` = '%d'", quantity,PlayerInfo[playerid][pSQLID], invData[playerid][itemid][invID]);
            mysql_tquery(SQL, string);
            if(isInInven[playerid] != 0) {
		    	if(type == 2) Inventory_Update(playerid, itemid-12, invData[playerid][itemid][invModel], invData[playerid][itemid][invQuantity], 1);
		    	else if(type == 3) Inventory_Update(playerid, itemid-24, invData[playerid][itemid][invModel], invData[playerid][itemid][invQuantity], 1);
		    	else Inventory_Update(playerid, itemid, invData[playerid][itemid][invModel], invData[playerid][itemid][invQuantity], 1);
		    }
		}
		return 1;
	}
	return 0; 
}

stock Inventory_Set(playerid, const item[], type, quantity) {
	new itemid = Inventory_GetItemID(playerid, item, 1);
	new string[256];
	if (itemid != -1) {
		gQuery[0] = EOS;
	    format(string, sizeof(string), "UPDATE `inventory` SET `invQuantity` = %d WHERE `invOwnerID` = '%d' AND `invID` = '%d'", quantity, PlayerInfo[playerid][pSQLID], invData[playerid][itemid][invID]);
	    mysql_tquery(SQL, string);
	    invData[playerid][itemid][invQuantity] = quantity;
	    if(isInInven[playerid] != 0) {
	    	if(type == 2) Inventory_Update(playerid, itemid-12, invData[playerid][itemid][invModel], invData[playerid][itemid][invQuantity], 1);
	    	else if(type == 2) Inventory_Update(playerid, itemid-24, invData[playerid][itemid][invModel], invData[playerid][itemid][invQuantity], 1);
	    	else Inventory_Update(playerid, itemid, invData[playerid][itemid][invModel], invData[playerid][itemid][invQuantity], 1);
	    }
	}
	return 1; 
}

alias:openinventory("tuido")
CMD:openinventory(playerid, params[]) {	
	inventoryTextDraws(playerid, true);
	showPlayerInventory(playerid, 1);
	return 1; 
}
CMD:checktui(playerid, params[]) {
	new id;
	if(sscanf(params, "u",id)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/checktui <playerid/name>");
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	inventoryTextDraws(playerid, false);
	isInInven[playerid] = 0;
	
	inventoryTextDraws(playerid, true);
	showSpecPlayerInventory(playerid, 1, id);
	return 1; 
}

