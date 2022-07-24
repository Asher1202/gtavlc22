/*

	CÂY GÌ CŨNG TRỒNG ĐƯỢC

	CREDIT TO gtavlc.com
*/
static plantid;

LoadWeedData() {
    new query[200];
    format(query, sizeof(query), "SELECT * FROM plant_types");
    new Cache:x = mysql_query(SQL, query), loaded, rows = cache_num_rows();
    while (loaded < rows) {
        new id;
        cache_get_value_name_int(loaded, "ID", id);
        Seed[id][SeedID] = id;
        cache_get_value_name(loaded, "Name", Seed[id][SeedName]);
        cache_get_value_name_int(loaded, "Time", Seed[id][SeedTime]);
        cache_get_value_name_int(loaded, "ObjectID", Seed[id][SeedObjectID]);
        cache_get_value_name_int(loaded, "SeedAmount", Seed[id][SeedAmount]);
        Seed[id][SeedBuyingDelay] = 0;
        Iter_Add(IterSeed, id);
        loaded++;
    }
    cache_delete(x);

    format(query, sizeof(query), "SELECT * FROM planting");
    x = mysql_query(SQL, query);
    plantid = rows = cache_num_rows(),
        loaded = 0;

    while (loaded < rows) {
        Iter_Add(IterPlant, loaded);
        cache_get_value_name_int(loaded, "ID", Plant[loaded][PlantSQLID]);
        cache_get_value_name_int(loaded, "Type", Plant[loaded][PlantType]);
        cache_get_value_name_float(loaded, "PosX", Plant[loaded][PlantPosX]);
        cache_get_value_name_float(loaded, "PosY", Plant[loaded][PlantPosY]);
        cache_get_value_name_float(loaded, "PosZ", Plant[loaded][PlantPosZ]);
        cache_get_value_name_int(loaded, "Time", Plant[loaded][PlantProgress]);
        cache_get_value_name_int(loaded, "UserID", Plant[loaded][PlantOwnerSQLID]);
        cache_get_value_name(loaded, "NguoiTrong", Plant[loaded][NguoiTrong]);
        new title[90];
        if(Plant[loaded][PlantProgress] >= Seed[Plant[loaded][PlantType]][SeedTime]) {
            format(title, sizeof title, "{E1E858}[%s - ID: %d/%d]\nNguoi trong: " MEDIUM_TURQUOISE "%s\n" SPRING_GREEN_1 "[Co the thu hoach]", 
				Seed[Plant[loaded][PlantType]][SeedName], loaded, Plant[loaded][PlantSQLID], Plant[loaded][NguoiTrong]);

            Iter_Add(CollectablePlant, loaded);
            Iter_Remove(IterPlant, loaded);
        } else {
            format(title, sizeof title, "{E1E858}[%s - ID: %d/%d]\nNguoi trong: " MEDIUM_TURQUOISE "%s", 
                Seed[Plant[loaded][PlantType]][SeedName], 
                loaded, 
                Plant[loaded][PlantSQLID], 
                Plant[loaded][NguoiTrong]);
        }
        Plant[loaded][Plant3DText] = CreateDynamic3DTextLabel(title, -1, Plant[loaded][PlantPosX], Plant[loaded][PlantPosY], Plant[loaded][PlantPosZ], 15.0);
        Plant[loaded][PlantObject] = CreateDynamicObject(Seed[Plant[loaded][PlantType]][SeedObjectID], Plant[loaded][PlantPosX], Plant[loaded][PlantPosY], Plant[loaded][PlantPosZ] - 2.2100, 0, 0, 0);
        loaded++;
    }
    return 1;
}
CMD:muahatgiong(playerid, params[]) {
    if(!IsPlayerInRangeOfPoint(playerid, 5.0, 322.1062, 1119.2726, 1083.8828)) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Ban khong o noi ma ban co the mua hat giong.");
    new string[400], str[30];
    strcat(string, "ID hat\tTen hat\tSo luong hien co\tDelay\n");
    foreach(new i:IterSeed) {
        if(gettime() < Seed[i][SeedBuyingDelay]) {
            format(str, sizeof(str), "%d giay", Seed[i][SeedBuyingDelay] - gettime());
        }
        else {
            format(str, sizeof(str), SEA_GREEN_1 "Co san" WHITE);
        }
        format(string, sizeof(string), "%s%d\t%s\t%d hat\t%s\n", string, Seed[i][SeedID], Seed[i][SeedName], Seed[i][SeedAmount], str);
    }
    Dialog_Show(playerid, MUAHATGIONG, DIALOG_STYLE_TABLIST_HEADERS, "Drug house - Hat giong", string, "Mua", "Thoat");
    return 1;
}
SendJobMessage(const string[], jobid) {
    foreach(new i:Player) {
        if(IsPlayerLogged[i] == 1) {
            if(PlayerInfo[i][pJob] == jobid) SendClientMessage(i, X11_GOLD_1, string);
        }
    }
    return 1;
}
Dialog:MUAHATGIONG(playerid, response, listitem, inputtext[]) {
    if(!response) return 1;
    new id = strval(inputtext);
    if(Seed[id][SeedAmount] <= 0) return Dialog_Show(playerid, MUAHAT_RETURN, DIALOG_STYLE_MSGBOX, "Drug house - Het hat", "Hat da het, hay tro lai sau.", "Ok", "");
    if(Seed[id][SeedBuyingDelay] - gettime() > 0) return Dialog_Show(playerid, MUAHAT_RETURN, DIALOG_STYLE_MSGBOX, "Drug house - Delay", "Thoi gian delay da duoc sap, hay tro lai sau.", "Ok", "");
    Seed[id][SeedBuyingDelay] = gettime() + RandomEx(50, 70);
    new string[200], rand, maxtmp;
    do {
        rand = 1 + random(2);
        printf("[DEBUG] Dialog MUAHATGIONG, rand=%d", rand);
        maxtmp++;
        if(maxtmp == 20) break;
    }
    while (rand <= Seed[id][SeedAmount]);
    Seed[id][SeedAmount] -= rand;
    if(listitem == 0) {
        PlayerInfo[playerid][pSeed1] += rand;
        Update(playerid, pSeed1);
    }
    if(listitem == 1) {
        PlayerInfo[playerid][pSeed2] += rand;
        Update(playerid, pSeed2);
    }
    new query[200];
    format(query, sizeof(query), "UPDATE plant_types SET SeedAmount=%d WHERE ID=%d", Seed[id][SeedAmount], Seed[id][SeedID]);
    mysql_query(SQL, query, false);

    format(string, sizeof(string), "[DRUG DEALER]" WHITE " %s da mua %d hat %s tu Drug Dealer, hat con lai: %d, delay time da duoc set.", GetName(playerid), rand, Seed[id][SeedName], Seed[id][SeedAmount], Seed[id][SeedName]);
    SendJobMessage(string, PlayerInfo[playerid][pJob]);
    return 1;
}
Dialog:MUAHAT_RETURN(playerid, response, listitem, inputtext[]) {
    return callcmd::muahatgiong(playerid, "");
}
/*SaveSeed(playerid) {
	new query[200];
	format(query, sizeof(query), "UPDATE users SET Seeds='%d|%d|%d' WHERE ID=%d", PlayerInfo[playerid][Seeds][0], PlayerInfo[playerid][Seeds][1], PlayerInfo[playerid][Seeds][2], PlayerInfo[playerid][pSQLID]);
	mysql_pquery(SQL, query);
}*/
// CMD:gieohat(playerid, params[]) {
//     if(PlayerInfo[playerid][pJob] != 6) return SendClientMessage(playerid, COLOR_WHITE, "ERROR: {FFFFFF}Ban khong phai la {FF0000}Drug Dealer{FFFFFF}.");
//     if(GetPlayerVirtualWorld(playerid) != 0 || GetPlayerInterior(playerid) != 0) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the trong o the gioi ao hoac trong mot noi that.");
//     new string[400], str[200],
//         seed1 = PlayerInfo[playerid][pSeed1],
//         seed2 = PlayerInfo[playerid][pSeed2];
//     strcat(string, "ID hat\tTen hat\tThu hoach sau\tHien co\n");
//     format(str, sizeof(str), "1\tIndica\t60 phut\t%d hat\n", seed1);
//     strcat(string, str);
//     format(str, sizeof(str), "2\tSativa\t70 phut\t%d hat", seed2);
//     strcat(string, str);
//     Dialog_Show(playerid, GIEOHAT_CHONHAT, DIALOG_STYLE_TABLIST_HEADERS, "Hat giong cua ban", string, "Gieo", "Thoat");
//     return 1;
// }
NguoiChoiDaTrong(playerid) {
    new dem;
    foreach(new i:IterPlant) {
        if(Plant[i][PlantOwnerSQLID] == PlayerInfo[playerid][pSQLID]) dem++;
    }
    return dem;
}
Dialog:GIEOHAT_CHONHAT(playerid, response, listitem, inputtext[]) {
    if(!response) return 1;
    new id = strval(inputtext);
    plantid++;
    if(listitem == 0) {
        if(PlayerInfo[playerid][pSeed1] < 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: " WHITE "Ban da het hat giong, hay tim NPC Josh de nhan hat.");
    }
    if(listitem == 1) {
        if(PlayerInfo[playerid][pSeed2] < 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: " WHITE "Ban da het hat giong, hay tim NPC Josh de nhan hat.");
    }
    if(!CA_IsPlayerOnSurface(playerid)) return SendClientMessage(playerid, COLOR_GREY, "ERROR: "  WHITE "Ban khong the trong cay o duoi nuoc.");
    foreach(new i:IterPlant) {
        if(IsPlayerInRangeOfPoint(playerid, 2, Plant[i][PlantPosX], Plant[i][PlantPosY], Plant[i][PlantPosZ])) return SendClientMessage(playerid, X11_FIREBRICK_1, "[ERROR] " WHITE "Cac cay can phai trong cach nhau 2m.");
    }
    if(GetPlayerInterior(playerid) != 0 || GetPlayerVirtualWorld(playerid) != 0) return SendClientMessage(playerid, X11_FIREBRICK_1, "[ERROR] " WHITE "Ban khong duoc phep trong can trong nha.");
    if(strcmp("LS", GetCity(playerid), true) != 0) return SendClientMessage(playerid, X11_FIREBRICK_1, "[ERROR] " WHITE "Hien tai ban chi co the trong can trong khu vuc LS.");
    if(NguoiChoiDaTrong(playerid) >= 5) return SendClientMessage(playerid, X11_FIREBRICK_1, "[ERROR] " WHITE "Ban chi co the trong max 5 cay.");
    SendClientMessage(playerid, X11_SPRING_GREEN_1, "[GIEO HAT]" WHITE " Gieo hat thanh cong.");

    Iter_Add(IterPlant, plantid);
    GetPlayerPos(playerid, Plant[plantid][PlantPosX], Plant[plantid][PlantPosY], Plant[plantid][PlantPosZ]);
    Plant[plantid][PlantOPosZ] = Plant[plantid][PlantPosZ] - 2.2100;

    Plant[plantid][PlantOwnerSQLID] = PlayerInfo[playerid][pSQLID];
    if(listitem == 0) {
        PlayerInfo[playerid][pSeed1]--;
        Update(playerid, pSeed1);
    }
    if(listitem == 1) {
        PlayerInfo[playerid][pSeed2]--;
        Update(playerid, pSeed2);
    }
    new title[90];
    format(title, sizeof title, "{E1E858}[%s - 0%%]\nNguoi trong: " MEDIUM_TURQUOISE "%s", Seed[id][SeedName], PlayerInfo[playerid][pUsername]);
    Plant[plantid][Plant3DText] = CreateDynamic3DTextLabel(title, -1, Plant[plantid][PlantPosX], Plant[plantid][PlantPosY], Plant[plantid][PlantPosZ], 15.0);
    Plant[plantid][PlantObject] = CreateDynamicObject(Seed[id][SeedObjectID], Plant[plantid][PlantPosX], Plant[plantid][PlantPosY], Plant[plantid][PlantPosZ] - 2.2100, 0, 0, 0);
    Plant[plantid][PlantProgress] = 0;
    Plant[plantid][PlantType] = id;
    format(Plant[plantid][NguoiTrong], 30, "%s", GetName(playerid));
    new query[400];
    format(query, sizeof(query), "INSERT INTO `planting` (`UserID`, `Type`, `PosX`, `PosY`, `PosZ`, `NguoiTrong`) VALUES ('%d', '%d', '%f', '%f', '%f', '%s')", Plant[plantid][PlantOwnerSQLID], id, Plant[plantid][PlantPosX], Plant[plantid][PlantPosY], Plant[plantid][PlantPosZ], GetName(playerid));
    new Cache:x = mysql_query(SQL, query);
    Plant[plantid][PlantSQLID] = cache_insert_id();
    cache_delete(x);
    ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0, 1);
    return 1;
}
task PlantProgres[60000]() {
    new title[120], Float:fPercentage, percentage, Float:valIncr;
    foreach(new i:IterPlant) {
        Plant[i][PlantProgress] += 60;
        fPercentage = float(Plant[i][PlantProgress]) / float(Seed[Plant[i][PlantType]][SeedTime]) * 100.0;
        percentage = floatround(fPercentage, floatround_floor);
        valIncr = (percentage * 1.105) / 100;

        printf("Cay: ID %d - %s. Tien trinh: %d/%d", i, Seed[Plant[i][PlantType]][SeedName], Plant[i][PlantProgress], Seed[Plant[i][PlantType]][SeedTime]);

        if(Plant[i][PlantProgress] >= Seed[Plant[i][PlantType]][SeedTime]) {
            format(title, sizeof title, "{E1E858}[%s - ID: %d/%d]\nNguoi trong: " MEDIUM_TURQUOISE "%s\n" SPRING_GREEN_1 "[Co the thu hoach]", Seed[Plant[i][PlantType]][SeedName], i, Plant[i][PlantSQLID], Plant[i][NguoiTrong]);
            SetDynamicObjectPos(Plant[i][PlantObject], Plant[i][PlantPosX], Plant[i][PlantPosY], Plant[i][PlantOPosZ] + valIncr);
            UpdateDynamic3DTextLabelText(Plant[i][Plant3DText], -1, title);
            new query[200];
            format(query, sizeof(query), "UPDATE `planting` SET `Time`='%d' WHERE `ID`='%i'", Plant[i][PlantProgress], Plant[i][PlantSQLID]);
            mysql_tquery(SQL, query);
            Iter_Add(CollectablePlant, i);
            Iter_SafeRemove(IterPlant, i, i);
        } else {
            format(title, sizeof title, "{E1E858}[%s - ID: %d/%d - %i%%]\nNguoi trong: " MEDIUM_TURQUOISE "%s", Seed[Plant[i][PlantType]][SeedName], i, Plant[i][PlantSQLID], percentage, Plant[i][NguoiTrong]);
            SetDynamicObjectPos(Plant[i][PlantObject], Plant[i][PlantPosX], Plant[i][PlantPosY], Plant[i][PlantOPosZ] + valIncr);
            UpdateDynamic3DTextLabelText(Plant[i][Plant3DText], -1, title);
        }
    }
}
ImportSeedDaily() {
    new str[200];
    foreach(new i:IterSeed) {
        new rand = RandomEx(20, 35);
        format(str, sizeof(str), "[NHAP HAT GIONG]" WHITE " %d hat %s da duoc nhap ve", rand, Seed[i][SeedName]);
        SCMTA(COLOR_GREY, str);
        Seed[i][SeedAmount] += rand;
        format(str, sizeof(str), "UPDATE `plant_types` SET `SeedAmount`='%d' WHERE `ID`='%d'", Seed[i][SeedAmount], Seed[i][SeedID]);
        mysql_tquery(SQL, str);
    }
}
// CMD:test(playerid, params[]) {
// 	ImportSeedDaily();
// 	return 1;
// }
// CMD:test2(playerid, params[]) {
// 	new id = -1;
// 	foreach(new i:IterPlant) {
// 		if(IsPlayerInRangeOfPoint(playerid, 2, Plant[i][PlantPosX], Plant[i][PlantPosY], Plant[i][PlantPosZ])) {
// 			id = i;
// 			break;
// 		}
// 	}
// 	if(id == -1) return SendClientMessage(playerid, COLOR_GREY, "[THU HOACH] Ban khong o gan mot cay nao.");
// 	Plant[id][PlantProgress] = Seed[ Plant[id][PlantType] ][SeedTime] - 59;
// 	SendClientMessage(playerid, X11_SPRING_GREEN_1, "Success.");
// 	return 1;
// }
CMD:thuhoach(playerid, params[]) {
    new id = -1, i;
    foreach(i:CollectablePlant) {
        if(IsPlayerInRangeOfPoint(playerid, 5.0, Plant[i][PlantPosX], Plant[i][PlantPosY], Plant[i][PlantPosZ])) {
            id = i;
            break;
        }
    }
    if(id == -1) return SendClientMessage(playerid, COLOR_GREY, "[THU HOACH] Ban khong o gan mot cay truong thanh de co the thu hoach.");
    Iter_Remove(CollectablePlant, id);

    new got = RandomEx(3, 6);
    switch (Plant[id][PlantType]) {
        case 1:{
            PlayerInfo[playerid][pMatuy1] += got;
            Update(playerid, pMatuy1x);
        }
        case 2:{
            PlayerInfo[playerid][pMatuy2] += got;
            Update(playerid, pMatuy2x);
        }
    }
    //GiveInventory(playerid, inventoryType, got);

    va_SendClientMessage(playerid, X11_GOLD_1, "[TRONG TROT] " WHITE "Ban da thu hoach thanh cong %d grams %s.", got, Seed[Plant[id][PlantType]][SeedName]);
    ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0, 1);
    DestroyDynamicObject(Plant[id][PlantObject]);
    DestroyDynamic3DTextLabel(Plant[id][Plant3DText]);
    Plant[id][PlantProgress] = 0;
    Plant[id][PlantType] = 0;

    new query[200];
    format(query, sizeof(query), "DELETE FROM `planting` WHERE `ID`='%d'", Plant[id][PlantSQLID]);
    mysql_pquery(SQL, query);
    return 1;
}
CMD:reloadhatgiong(playerid, params[]) {
    if(PlayerInfo[playerid][pAdmin] < 7) return 1;
    new query[200];
    format(query, sizeof(query), "SELECT * FROM plant_types");
    new Cache:x = mysql_query(SQL, query), loaded, rows = cache_num_rows();
    while (loaded < rows) {
        new id;
        cache_get_value_name_int(loaded, "ID", id);
        Seed[id][SeedID] = id;
        cache_get_value_name(loaded, "Name", Seed[id][SeedName]);
        cache_get_value_name_int(loaded, "Time", Seed[id][SeedTime]);
        cache_get_value_name_int(loaded, "ObjectID", Seed[id][SeedObjectID]);
        cache_get_value_name_int(loaded, "SeedAmount", Seed[id][SeedAmount]);
        Seed[id][SeedBuyingDelay] = 0;
        Iter_Add(IterSeed, id);
        loaded++;
    }
    cache_delete(x);
    SendClientMessage(playerid, X11_SPRING_GREEN_1, "[DRUG HOUSE]" WHITE " Hat giong da duoc reload thanh cong.");
    return 1;
}
// CMD:test1234(playerid, params[]) {
// 	foreach(new i:CollectablePlant) {
// 		va_SendClientMessage(playerid, -1, "%d", i);
// 	}
// 	return 1;
// }
// CMD:goto1234(playerid, params[]) {
// 	new id = strval(params);
// 	SetPlayerPosEx(playerid, Plant[id][PlantPosX], Plant[id][PlantPosY], Plant[id][PlantPosZ]);
// 	return 1;
// }
CMD:dotcan(playerid, params) {
    if(!IsACop(playerid)) return SendClientMessage(playerid, -1, "ERROR: {FFFFFF} Ban khong o trong bo phan canh sat");
    if(OnDuty[playerid] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: {FFFFFF} Ban chua onduty lam viec nhu mot canh sat!");
    new id = -1, i;
    foreach(i:IterPlant) {
        if(IsPlayerInRangeOfPoint(playerid, 5.0, Plant[i][PlantPosX], Plant[i][PlantPosY], Plant[i][PlantPosZ])) {
            id = i;
            break;
        }
    }
    if(id == -1) return SendClientMessage(playerid, COLOR_GREY, "Ban khong dung gan cay can nao.");
    Iter_Remove(IterPlant, id);
    va_SendClientMessage(playerid, X11_GOLD_1, "[TRONG TROT] " WHITE "Cay can da bi tieu huy, ban nhan duoc $5,000.");
    ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0, 1);
    DestroyDynamicObject(Plant[id][PlantObject]);
    DestroyDynamic3DTextLabel(Plant[id][Plant3DText]);
    Plant[id][PlantProgress] = 0;
    Plant[id][PlantType] = 0;
    GivePlayerCash(playerid, 5000);
    Update(playerid, pCashx);
    UpdateFactionRaport(playerid, 1);

    new query[200], str[100];
    format(str, 100, "* Si quan %s da tieu huy mot cay can.", GetName(playerid));
    ProxDetector(30.0, playerid, str, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
    format(query, sizeof(query), "DELETE FROM `planting` WHERE `ID`='%d'", Plant[id][PlantSQLID]);
    mysql_pquery(SQL, query);
    return 1;
}