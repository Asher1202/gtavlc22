EnterBizz(playerid, i) {
    if(GetPVarInt(playerid, "LocationEnter") > gettime()) return va_SendClientMessage(playerid, COLOR_LGREEN, "Vui long doi %d giay!", GetPVarInt(playerid, "LocationEnter") - gettime());
    if(InWar[PlayerInfo[playerid][pMember]] == 1) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the vao mot doanh nghiep trong khi dang war!");
    if(GetPlayerCash(playerid) < BizzInfo[i][bEntranceCost]) return GameTextForPlayer(playerid, "~r~~h~Ban khong co du tien", 1000, 1);
    if(OnDuty[playerid] == 1 || PlayerHit[playerid] != -1) {} else if(BizzInfo[i][bLocked] == 1) return GameTextForPlayer(playerid, "~r~~h~Khoa", 1000, 1);
    switch (BizzInfo[i][bType]) {
        case 2: SendClientMessage(playerid, COLOR_WHITE, "Chao ban den Ammulation, bam Y truoc NPC de tuong tac.");
        case 3: SendClientMessage(playerid, COLOR_WHITE, "Cac lenh co san: /drink.");
        case 6: {
            SendClientMessage(playerid, -1, "Chao mung den voi cua hang! Hay den truoc NPC va an Y de mua hang.");
            if(FishPrice[playerid] != 0) Dialog_Show(playerid, DIALOG_FISH, DIALOG_STYLE_MSGBOX, "Ban ca:", "Ban co muon' ban' con ca' ma minh vua cau cho cua hang?", "Yes", "No");
        }
        case 1:{
            SendClientMessage(playerid, COLOR_WHITE, "Cac lenh co san: /ruttien, /chuyentien, /guitien.");
        }
        case 7, 9:{
            SendClientMessage(playerid, COLOR_WHITE, "Cac lenh co san: /chetao hamburger, /muathucan hamburger, /banthucan hamburger.");
            if(KG[playerid] != 0) {
                SetPlayerCheckpoint(playerid, 378.6745,-58.1840,1001.5078, Float:3.0);
                SendClientMessage(playerid, COLOR_GREEN, "Den diem do de che tao banh Hamburger");
            }
        }
        case 4: SendClientMessage(playerid, COLOR_WHITE, "Chao ban den Sex Shop, den truoc NPC va bam Y de mua hang.");
        case 5:{
            SendClientMessage(playerid, COLOR_WHITE, "Cac lenh co san: /taixiu /traodoi /dice, /minesweeper.");
            // SendClientMessage(playerid, COLOR_WARNING, "1. Lua dao bi cam o may chu nay, cam admin lam chung dice so tien lon.");
            // SendClientMessage(playerid, COLOR_WARNING, "2. " SERVER_NAME " khong xu ly cac truong hop bi lua dao do co y giao keo dice voi so tien qua lon.");
            // SendClientMessage(playerid, COLOR_WARNING, "3. Nguoi scam tuy khong bi banned ,jail hay warn se bi tich thu toan bo tai san SAD.");
            // SendClientMessage(playerid, COLOR_WARNING, "Hay luu y truoc khi choi.");
            if(GetPVarInt(playerid, "LoadedCasinoTextdraws") != 1) {
                SetPVarInt(playerid, "LoadedCasinoTextdraws", 1);
                LoadCasinoPTextdraws(playerid);
                Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "THONG BAO", "Tu ngay 11/8, tai xiu truc thuoc casino, don vi tien te cua tai xiu se la Chip.", "Close", "");
            }
        }
        case 8: SendClientMessage(playerid, COLOR_WHITE, "Welcome! Cac lenh co san trong doanh nghiep nay la: /buyfightstyle");
        case 11: SendClientMessage(playerid, COLOR_WHITE, "Cac lenh co san: /trangphuc, /kinh, /non, /buytoys.");
    }
    SetPVarInt(playerid, "LocationEnter", gettime() + 10);
    GivePlayerCash(playerid, -BizzInfo[i][bEntranceCost]);
    BizzInfo[i][bTill] += BizzInfo[i][bEntranceCost];
    BizzRadio(playerid, i);
    if(BizzInfo[i][bSbiz] == 0) {
        SetPlayerInterior(playerid, BizzInfo[i][bInterior]);
        SetPlayerPosEx(playerid, BizzInfo[i][bExitX], BizzInfo[i][bExitY], BizzInfo[i][bExitZ]);
        PlayerInfo[playerid][pInt] = BizzInfo[i][bInterior];
        PlayerInfo[playerid][pLocal] = i + 99;
        SetPlayerVirtualWorld(playerid, BizzInfo[i][bVirtual]);
        InBussines[playerid] = i;
        Update(playerid, pCashx);
        new str1[184];
        format(str1, sizeof(str1), "UPDATE `bizz` SET `Till`='%d' WHERE `ID`='%d'", BizzInfo[i][bTill], i);
        mysql_query(SQL, str1);
        format(str1, sizeof(str1), "~r~-$%d", BizzInfo[i][bEntranceCost]);
        GameTextForPlayer(playerid, str1, 1000, 1);
    }
    return true;
}
ExitBizz(playerid, i) {
    SetPlayerInterior(playerid, 0);
    SetPlayerPosEx(playerid, BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ]);
    // if(i == 27) {
    // 	TogglePlayerControllable(playerid, 0);
    // 	defer UnFreezeStation[1000](playerid);
    // }
    PlayerInfo[playerid][pLocal] = 255;
    SetPlayerVirtualWorld(playerid, 0);
    InBussines[playerid] = -1;
    PlayRadio[playerid] = 0;
    StopAudioStreamForPlayer(playerid);

    return true;
}

function LoadBizz() {
    new Propertystring[256], locked[20], b, i;
    bussines = cache_num_rows();
    while (b < bussines) {
        cache_get_value_name_int(b, "ID", i);
        BizzInfo[i][bID] = i;
        cache_get_value_name_int(b, "Owned", BizzInfo[i][bOwned]);
        cache_get_value_name(b, "Owner", BizzInfo[i][bOwner]);
        cache_get_value_name(b, "Message", BizzInfo[i][bMessage]);
        cache_get_value_name_float(b, "EntranceX", BizzInfo[i][bEntranceX]);
        cache_get_value_name_float(b, "EntranceY", BizzInfo[i][bEntranceY]);
        cache_get_value_name_float(b, "EntranceZ", BizzInfo[i][bEntranceZ]);
        cache_get_value_name_float(b, "ExitX", BizzInfo[i][bExitX]);
        cache_get_value_name_float(b, "ExitY", BizzInfo[i][bExitY]);
        cache_get_value_name_float(b, "ExitZ", BizzInfo[i][bExitZ]);
        cache_get_value_name_int(b, "LevelNeeded", BizzInfo[i][bLevelNeeded]);
        cache_get_value_name_int(b, "BuyPrice", BizzInfo[i][bBuyPrice]);
        cache_get_value_name_int(b, "EntranceCost", BizzInfo[i][bEntranceCost]);
        cache_get_value_name_int(b, "Till", BizzInfo[i][bTill]);
        cache_get_value_name_int(b, "Locked", BizzInfo[i][bLocked]);
        cache_get_value_name_int(b, "Interior", BizzInfo[i][bInterior]);
        cache_get_value_name_int(b, "Virtual", BizzInfo[i][bVirtual]);
        cache_get_value_name_int(b, "Static", BizzInfo[i][bSbiz]);
        cache_get_value_name_int(b, "Type", BizzInfo[i][bType]);
        cache_get_value_name_int(b, "BuyPrice", BizzInfo[i][bBuyPrice]);
        
        if(BizzInfo[i][bLocked] == 1) format(locked, sizeof(locked), "\n(da khoa)");
        if(BizzInfo[i][bOwned] == 0) {
            DestroyDynamic3DTextLabel(BizzLabel[i]);
            format(Propertystring, sizeof(Propertystring), "{0068CF}%s \n{EEEEEE}Business {0068CF}#%d \n{0068CF}Doanh nghiep nay dang duoc ban (/buybiz) ! \n {EEEEEE}Gia {0068CF}%s \n{EEEEEE}Level: {0068CF}%d %s", BizzInfo[i][bMessage], i, FormatNumber(BizzInfo[i][bBuyPrice]), BizzInfo[i][bLevelNeeded], locked);
            BizzLabel[i] = CreateDynamic3DTextLabel(Propertystring, 0xFFFFFFFF, BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ], 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 100.0);
            CreateDynamicPickup(1239, 1, BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ]);
            pickups++;
        } else if(BizzInfo[i][bOwned] == 1) {
            DestroyDynamic3DTextLabel(BizzLabel[i]);
            if(BizzInfo[i][bBuyPrice] > 0) format(Propertystring, sizeof(Propertystring), "{0068CF}%s \n{EEEEEE}Business {0068CF}#%d \n{EEEEEE}Owner: {0068CF}%s \n{EEEEEE}Fee: {0068CF}$%s \n{EEEEEE}Gia {0068CF}$%s %s", BizzInfo[i][bMessage], i, BizzInfo[i][bOwner], FormatNumber(BizzInfo[i][bEntranceCost]), FormatNumber(BizzInfo[i][bBuyPrice]), locked);
            else format(Propertystring, sizeof(Propertystring), "{0068CF}%s \n{EEEEEE}Business {0068CF}#%d \n{EEEEEE}Owner: {0068CF}%s \n{EEEEEE}Fee: {0068CF}$%s %s", BizzInfo[i][bMessage], i, BizzInfo[i][bOwner], FormatNumber(BizzInfo[i][bEntranceCost]), locked);
            BizzLabel[i] = CreateDynamic3DTextLabel(Propertystring, 0xFFFFFFFF, BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ], 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 100.0);
            BizzPickup[i] = CreateDynamicPickup(1239, 1, BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ]);
            pickups++;
        }
        switch (BizzInfo[i][bType]) {
            case 1:                CreateDynamicMapIcon(BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ], 52, 0, -1, -1, -1, 750.0); //Bank
            case 2:                CreateDynamicMapIcon(BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ], 18, 0, -1, -1, -1, 750.0); //GunShop
            case 3:                CreateDynamicMapIcon(BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ], 49, 0, -1, -1, -1, 750.0); //ShowBarStats
            case 4:                CreateDynamicMapIcon(BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ], 38, 0, -1, -1, -1, 750.0); //Sex Shop
            case 5:                CreateDynamicMapIcon(BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ], 25, 0, -1, -1, -1, 750.0); //Casino
            case 6:                CreateDynamicMapIcon(BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ], 17, 0, -1, -1, -1, 750.0); //24/7
            case 7:                CreateDynamicMapIcon(BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ], 10, 0, -1, -1, -1, 750.0); //Burger Shot
            case 8:                CreateDynamicMapIcon(BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ], 54, 0, -1, -1, -1, 750.0); //Gym
            case 9:                CreateDynamicMapIcon(BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ], 29, 0, -1, -1, -1, 750.0); //Pizza
            case 10:                CreateDynamicMapIcon(BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ], 51, 0, -1, -1, -1, 750.0); //Rent Car
            case 11:                CreateDynamicMapIcon(BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ], 45, 0, -1, -1, -1, 750.0); //Clothes
            case 12:                CreateDynamicMapIcon(BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ], 27, 0, -1, -1, -1, 750.0); //Gas Station
            case 13:                CreateDynamicMapIcon(BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ], 63, 0, -1, -1, -1, 750.0); //PNS
            case 14:                CreateDynamicMapIcon(BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ], 14, 0, -1, -1, -1, 750.0); //Cluckin Bell
        }
        if(GetCity1(BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY]) == 3) {
            LSBizNumber[BizzInfo[i][bType]]++;
            Iter_Add(GpsBiz < 0 > , i);
        } else if(GetCity1(BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY]) == 2) {
            LVBizNumber[BizzInfo[i][bType]]++;
            Iter_Add(GpsBiz < 1 > , i);
        }
        Iter_Add(Bizs, BizzInfo[i][bID]);
        b++;
    }
    printf("[LoadBizz] %d businesses loaded.", bussines);
    
    return 1;
}