#include <YSI_Coding\y_hooks>
#include <YSI_Coding\y_timers>
/* ** Definitions ** */
#define FOOD_TYPE 					(3)
    
/* ** Variables ** */
enum F_DATA
{
		F_model,    Text3D: F_label,    F_soLuong,      F_gia,  

};

static stock
	f_foodData					[FOOD_TYPE] [F_DATA],

    ftimeCT [] = {6000}; // 0 hamburger 1 pizza 2 drink


/* ** Hooks ** */
hook OnProgressCompleted(playerid, progressid, params)
{
    if (progressid == PROGRESS_CHEBOT)
    {
        if(KG[playerid] != 0) {
            if(IsPlayerInRangeOfPoint(playerid, 3.0, 378.6745,-58.1840,1001.5078)) {
                GiveJobSalary(playerid);
                if(Inventory_GetFreeID(playerid, 1) == -1) Inventory_Add(playerid,"Burger", 2703, KG[playerid], 2);
			    else Inventory_Add(playerid,"Burger", 2703, KG[playerid], 1);
                SCMf(playerid, COLOR_GREEN, "Ban da che tao thanh cong burger va nhan duoc %d cai burger", KG[playerid]);
                //DisablePlayerCheckpointEx(playerid);
                CP[playerid] = 0;
                GunoiKG[playerid] = 0;
                KG[playerid] = 0;
                PlayerInfo[playerid][pFarmerSkill]++;
                Update(playerid, pFarmerSkillx);
                for (new m; m < 2; m++) {
                    if(PlayerInfo[playerid][pDailyMission][m] == 4) CheckMission(playerid, m);
                }
                DestroyVehicle(JobVehicle[playerid]);
                JobVehicle[playerid] = 0, JobWorking[playerid] = 0;
                PlayerTextDrawHide(playerid, JobTD);
            }
            else {
                SendClientMessage(playerid, COLOR_GREEN, "Che tao bot that bai vi ban da di chuyen khi dang che tao bot, ban se mat tui bot cua minh");
                CP[playerid] = 0;
                GunoiKG[playerid] = 0;
                KG[playerid] = 0;
            }
        }
    }
    if (progressid == PROGRESS_CHEBANHTRUNGTHU)
    {
        if(KG[playerid] != 0) {
            if(IsPlayerInRangeOfPoint(playerid, 3.0, 378.6745,-58.1840,1001.5078)) {
                GiveJobSalary(playerid);
                if(Inventory_GetFreeID(playerid, 1) == -1) Inventory_Add(playerid,"Banh Trung Thu", 2766, 1, 2);
			    else Inventory_Add(playerid,"Banh Trung Thu", 2766, 1, 2);
                SendClientMessage(playerid, COLOR_GREEN, "Ban da che tao thanh cong 1 cai banh trung thu");
                Inventory_Remove(playerid, "Sailor Moon");
                if(pFishing[playerid] == 1) pFishing[playerid] = 0;
                PlayerInfo[playerid][pTrungThuJob][8] += 1;
		        save_ttj(playerid);
                //DisablePlayerCheckpointEx(playerid);
                CP[playerid] = 0;
                // GunoiKG[playerid] = 0;
                // KG[playerid] = 0;
                // PlayerInfo[playerid][pFarmerSkill]++;
                // Update(playerid, pFarmerSkillx);
                // for (new m; m < 2; m++) {
                //     if(PlayerInfo[playerid][pDailyMission][m] == 4) CheckMission(playerid, m);
                // }
                // DestroyVehicle(JobVehicle[playerid]);
                // JobVehicle[playerid] = 0, JobWorking[playerid] = 0;
                // PlayerTextDrawHide(playerid, JobTD);
            }
            else {
                SendClientMessage(playerid, COLOR_GREEN, "Che tao bot that bai vi ban da di chuyen khi dang che tao bot, ban se mat tui bot cua minh");
                CP[playerid] = 0;
                GunoiKG[playerid] = 0;
                KG[playerid] = 0;
            }
        }
    }
    if (progressid == PROGRESS_STUFF)
    {
        SendClientMessage(playerid, COLOR_GREEN, "Cong viec cua ban da hoan thanh");
        if(IsPlayerInRangeOfPoint(playerid, 4.0, 377.5813,-65.4023,1001.5078) && (GetPVarInt(playerid, "MuaThucAn") == 2))
        {
            SCMf(playerid, COLOR_GREEN, "Ban vua ban duoc 10 chiec hamburger voi gia %s", FormatNumber(f_foodData[0][F_gia]));
            GivePlayerCash(playerid, f_foodData[0][F_gia]);
            f_foodData[0][F_soLuong] += 10;
            UpdateFood(0);
            Inventory_Remove(playerid, "Burger", 10);
            DeletePVar(playerid, "MuaThucAn");
            new string[100];
            format(string, sizeof(string), "%s da ban 10 cai banh burger voi gia %s.", GetName(playerid), FormatNumber(f_foodData[0][F_gia]));
            ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

            for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
                if(PlayerInfo[playerid][pDailyMission][m] == 19) CheckMission(playerid, m);
            }
        }
        else if(IsPlayerInRangeOfPoint(playerid, 4.0, 377.5813,-65.4023,1001.5078) && (GetPVarInt(playerid, "MuaThucAn") == 1))
        {
            SCMf(playerid, COLOR_GREEN, "Ban vua mua duoc 10 chiec hamburger voi gia %s", FormatNumber(f_foodData[0][F_gia]+500));
            Inventory_Add(playerid,"Burger", 2703, 10, 1);
            if(Inventory_GetFreeID(playerid, 1) == -1) Inventory_Add(playerid,"Burger", 2703, 10, 2);
			else Inventory_Add(playerid,"Burger", 2703, 10, 1);
            f_foodData[0][F_soLuong] -= 10;
            UpdateFood(0);
            new string[100];
            format(string, sizeof(string), "%s da mua 10 cai banh burger voi gia %s.", GetName(playerid), FormatNumber(f_foodData[0][F_gia]+500));
            ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
            GivePlayerCash(playerid, -f_foodData[0][F_gia]+500);
            DeletePVar(playerid, "MuaThucAn");
        }
    }
    return 1;
}


/* ** Functions ** */
function LoadFood() {
	new Cache: test = mysql_query(SQL,"SELECT * FROM `ngankho`");
	if(cache_num_rows()){

		cache_get_value_int(0, "SLBurger", f_foodData[0] [F_soLuong]);
		cache_get_value_int(0, "TienBurger", f_foodData[0] [F_gia]);
	}
    cache_delete(test);
	printf("Da load thuc an");
}


stock getFoodName(id)
{
	static
		Fname[15];

	switch(id)
	{
		case 0: Fname = "Hamburger";
		default: Fname = "n/a";
	}
	return Fname;
}

stock f_taoLabel(f_model, f_number, f_color, Float: X, Float: Y, Float: Z)
{
    new string[180];
    format(string, sizeof(string), "%s\nDang co : {40ff00}%d{E6A615}\nGia Mua: {006eff}%s{E6A615}\nGia Ban: {ff0000}%s{E6A615}\n{34cceb}(/banthucan) de ban\n{e100ff}(/muathucan) de mua", getFoodName(f_number),  f_foodData[f_number][F_soLuong], FormatNumber(f_foodData[f_number][F_gia]), FormatNumber(f_foodData[f_number][F_gia]+500));
    f_foodData[f_number][F_label] = CreateDynamic3DTextLabel(string, f_color, X, Y, Z, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);
    AddStaticPickup(f_model, 2, Float: X, Float: Y, Float: Z);
}

UpdateFood(f_number) {
    if(f_number == 0)
	{
        if(f_foodData[f_number] [F_soLuong] <= 0) f_foodData[f_number] [F_soLuong] = 0;
        static string[180];
        format(string, sizeof(string), "%s\nDang co : {40ff00}%d{E6A615}\nGia Mua: {006eff}%s{E6A615}\nGia Ban: {ff0000}%s{E6A615}\n{34cceb}(/banthucan) de ban\n{e100ff}(/muathucan) de mua", getFoodName(f_number),  f_foodData[f_number][F_soLuong], FormatNumber(f_foodData[f_number][F_gia]), FormatNumber(f_foodData[f_number][F_gia]+500));
        UpdateDynamic3DTextLabelText(f_foodData[f_number][F_label], -1, string);
        new query[256];
        format(query, sizeof(query), "UPDATE `ngankho` SET `SLBurger`='%d', `TienBurger`='%d'", f_foodData[f_number] [F_soLuong], f_foodData[f_number] [F_gia]);
        mysql_pquery(SQL, query);
        return 1;
    }
    return f_number;
}
//if player not on vehicle check and decrease hunger
ptask DecreaseHunger[240000](playerid)
{
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT && Aduty[playerid] != 1 && InWar[PlayerInfo[playerid][pMember]] == 0) GivePlayerStamina(playerid, -1);
	return 0;
}

task resetFoodMoney[60000]()
{
    new hour,minn,sec;
	gettime(hour,minn,sec);
    if(hour == 15 || hour == 18 || hour == 21 || hour == 00 || hour == 3 || hour == 6 || hour == 9 || hour == 12) 
    {
        if(minn <= 1)
        {
            new string[128], newmoney = RandomMinMax(1000, 11000);
            format(string, sizeof(string), "Tien banh burger da duoc cap nhat gia ({ffffff}Gia cu :{32a852} %s {ffffff}| Gia moi : {32a852}%s{0099ff} | {ffffff}%s)", FormatNumber(f_foodData[0][F_gia]), FormatNumber(newmoney), f_foodData[0][F_gia] > newmoney ? "GIAM" : "TANG");
            SCMTA(0x0099ffff, string);
            f_foodData[0][F_gia] = newmoney;
            UpdateFood(0); 
            new amount, string1[128];
            amount = RandomMinMax(40,250);
            f_foodData[0][F_soLuong] += amount;
            UpdateFood(0);
            format(string1, sizeof(string1), "[CUA HANG BURGER SHOT] : Chung toi vua nhap them %d banh ve cua hang, hay den mua burger thoi nao", amount);
            SendClientMessageToAll(COLOR_LIGHTBLUE, string1);
        }
    }
    return 1;
}
/* ** Commands ** */

CMD:chetao(playerid, params[]) {
	new item[50];
	if(sscanf(params, "s[15]", item)) {
		SendClientMessage(playerid, COLOR_WHITE, "Loai thuc pham : {32a852}hamburger, banhtrungthu.");
		return 1;
	}	

	if(strcmp(item, "hamburger", true) == 0) {
        if(PlayerInfo[playerid][pJob] != 1) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la nong dan!");
        if(KG[playerid] == 0) return  SendClientMessage(playerid, COLOR_RED, "Ban khong co kilogram bot nao het, hay lam job nong dan de co");
        if(!IsPlayerInRangeOfPoint(playerid, 3.0, 378.6745,-58.1840,1001.5078)) return SendClientMessage(playerid , COLOR_GREY, "Ban khong dung o noi che tao bot.");
        DisablePlayerCheckpointEx(playerid);
        LoopingAnim(playerid,"BD_FIRE", "wash_up", 4.0, 1, 0, 0, 0, 0);
        ShowProgressBar(playerid, "Dang Che Tao Hamburger", PROGRESS_CHEBOT, RandomMinMax(ftimeCT[0], 100000), 0xfcba03FF);
        
	}		
	if(strcmp(item, "banhtrungthu", true) == 0) {
        if(PlayerInfo[playerid][pJob] != 1) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la nong dan!");
        if(Inventory_Count(playerid, "Sailor Moon") <= 0) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co ca Sailor Moon de che tao banh trung thu, hay cau ca de co Sailor Moon");
        if(!IsPlayerInRangeOfPoint(playerid, 3.0, 378.6745,-58.1840,1001.5078)) return SendClientMessage(playerid , COLOR_GREY, "Ban khong dung o noi che tao bot.");
        DisablePlayerCheckpointEx(playerid);
        LoopingAnim(playerid,"BD_FIRE", "wash_up", 4.0, 1, 0, 0, 0, 0);
        ShowProgressBar(playerid, "Dang Che Tao Banh Trung Thu", PROGRESS_CHEBANHTRUNGTHU, RandomMinMax(ftimeCT[0]+2000, 150000), 0xfcba03FF);
        
	}		
	else {
		SendClientMessage(playerid, COLOR_WHITE, "Loai thuc pham : {34cceb} hamburger, banhtrungthu.");
		return 1;
	}
	return 1;
}	

CMD:muathucan(playerid, params[]) {
	new item[50];
    if(GetPVarInt(playerid, "MuaThucAn") == 1) return SendClientMessage(playerid, COLOR_GREY, "Ban dang mua thuc an, hay cho hoan thanh");
    if(GetPlayerCash(playerid) < f_foodData[0][F_gia]+500 ) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du tien de mua burger");
	if(sscanf(params, "s[10]", item)) {
		SendClientMessage(playerid, COLOR_WHITE, "Loai thuc pham : {32a852}hamburger.");
		return 1;
	}	

	if(strcmp(item, "hamburger", true) == 0) {
        if(Inventory_Count(playerid, "Burger") >= 80) return SendClientMessage(playerid, COLOR_GREY, "Ban da co nhieu hon 80 cai hamburger nen khong the mua nua");
        if(f_foodData[0][F_soLuong] <= 0) return SendClientMessage(playerid, COLOR_GREY, "Cua hang khong con hamburger nua. Hay lam job nong dan de mua them hamburger");
        
        if(!IsPlayerInRangeOfPoint(playerid, 3.0,377.5813,-65.4023,1001.5078)) return SendClientMessage(playerid , COLOR_GREY, "Ban khong dung o noi de ban thuc an.");
        DisablePlayerCheckpointEx(playerid);
        SetPVarInt(playerid, "MuaThucAn", 1);
        LoopingAnim(playerid,"BD_FIRE", "wash_up", 4.0, 1, 0, 0, 0, 0);
        ShowProgressBar(playerid, "Dang mua hamburger", PROGRESS_STUFF, 6000, 0xFFFFFFFF);
        
	}		
	else {
		SendClientMessage(playerid, COLOR_WHITE, "Loai thuc pham : {34cceb} hamburger.");
		return 1;
	}
	return 1;
}	

CMD:banthucan(playerid, params[]) {
	new item[50];
    if(GetPVarInt(playerid, "MuaThucAn") == 2) return SendClientMessage(playerid, COLOR_GREY, "Ban dang ban thuc an, hay cho hoan thanh");
	if(sscanf(params, "s[10]", item)) {
		SendClientMessage(playerid, COLOR_WHITE, "Loai thuc pham : {32a852}hamburger.");
		return 1;
	}	
    
	if(strcmp(item, "hamburger", true) == 0) {
        if(Inventory_Count(playerid, "Burger") < 11) return SendClientMessage(playerid, COLOR_GREY, "Ban co it hon 10 cai hamburger nen khong the ban");
        if(!IsPlayerInRangeOfPoint(playerid, 3.0,377.5813,-65.4023,1001.5078)) return SendClientMessage(playerid , COLOR_GREY, "Ban khong dung o noi de ban thuc an.");
        DisablePlayerCheckpointEx(playerid);
        SetPVarInt(playerid, "MuaThucAn", 2);
        LoopingAnim(playerid,"BD_FIRE", "wash_up", 4.0, 1, 0, 0, 0, 0);
        ShowProgressBar(playerid, "Dang ban", PROGRESS_STUFF, 10000, 0xFFFFFFFF);
        
	}		
	else {
		SendClientMessage(playerid, COLOR_WHITE, "Loai thuc pham : {34cceb} hamburger.");
		return 1;
	}
	return 1;
}	


CMD:traodoi(playerid, params[]) {
    new valoare, item[50], id, string[180], money;
    
	if(sscanf(params, "us[50]ii", id, item, valoare, money)) {
		SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/traodoi <ten day du> <item> <so luong> <so tien>");
		SendClientMessage(playerid, COLOR_WHITE, "Lenh kha dung : hamburger, banhtrungthu.");
		return 1;
	}	
    if(id == playerid) return SendClientMessage(playerid,-1, "Ban khong tu trao doi cho chinh ban.");
    if(PlayerInfo[playerid][pLevel] < 4 && PlayerInfo[id][pLevel] < 4) return SendClientMessage(playerid, -1, "Ban hoac nguoi choi do khong du level 4.");

	//if(GetPVarInt(id, "InLesson") != playerid) return SendClientMessage(playerid, -1, "Nguoi choi nay khong o trong mot bai hoc.");
	if(id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
    if(valoare <= 0) return SendClientMessage(playerid, COLOR_GREY, "[ASHER] : Bug nua ha may ong noi");
    if(money <= 0) return SendClientMessage(playerid, COLOR_GREY, "[ASHER] : Bug nua ha may ong noi");
	if(!ProxDetectorS(9.0, playerid, id)) return SendClientMessage(playerid, -1, "Ban khong o gan nguoi choi do!");
    if(GetPlayerCash(id) < money) return SendClientMessage(playerid, COLOR_YELLOW, "Nguoi choi do khong du tien de thuc hien trao doi");
    if(isInInven[playerid] != 0) return SendClientMessage(playerid, COLOR_YELLOW, "Vui long tat tui do de thuc hien lenh nay");
	if(strcmp(item,"hamburger",true) == 0) {
        if(Inventory_Count(id, "Burger") >= 100) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi kia co nhieu hon 100 cai burger nen khong the trao doi");
        if(Inventory_Count(playerid, "Burger") < valoare) return SCMf(playerid, COLOR_GREY, "Ban khong co du %d cai hamburger nen khong the ban", valoare);
        if(Inventory_Count(playerid, "Burger") < valoare) return SCMf(playerid, -1, "Ban khong co du %d burger de dua cho nguoi khac.", valoare);
		format(string, sizeof(string), "* Ban da de nghi trao doi burger voi %s so luong %d voi gia $%s.",GetName(id), valoare, FormatNumber(money));
		SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "* Nguoi choi %s muon trao doi %d cai burger cho ban voi gia $%s (/chapnhan traodoi %d)",GetName(playerid),valoare, FormatNumber(money), playerid);
		SendClientMessage(id, COLOR_LIGHTBLUE, string);
		BurgerAmount[id] = valoare;
        BurgerOffer[id] = playerid;
        BurgerMoney[id] = money;
        SetPVarInt(id, "TDBurger", 1);
        SetPVarInt(playerid, "TDBurger", 1);
        //printf("1 %d [ %d ] ( %d )",BurgerAmount[id], BurgerOffer[id], BurgerMoney[id]);
	}
	if(strcmp(item,"banhtrungthu",true) == 0) {
        if(Inventory_Count(id, "banhtrungthu") >= 25) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi kia co nhieu hon 25 banh trung thu nen khong the trao doi");
        if(Inventory_Count(playerid, "banhtrungthu") < valoare) return SCMf(playerid, COLOR_GREY, "Ban khong co du %d cai banh trung thu nen khong the ban", valoare);
        if(Inventory_Count(playerid, "banhtrungthu") < valoare) return SCMf(playerid, -1, "Ban khong co du %d banh trung thu de dua cho nguoi khac.", valoare);
		format(string, sizeof(string), "* Ban da de nghi trao doi banh trung thu voi %s so luong %d voi gia $%s.",GetName(id), valoare, FormatNumber(money));
		SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "* Nguoi choi %s muon trao doi %d cai banh trung thu cho ban voi gia $%s (/chapnhan traodoi %d)",GetName(playerid),valoare, FormatNumber(money), playerid);
		SendClientMessage(id, COLOR_LIGHTBLUE, string);
		BurgerAmount[id] = valoare;
        BurgerOffer[id] = playerid;
        BurgerMoney[id] = money;
        SetPVarInt(id, "TDBanhTrungThu", 1);
        SetPVarInt(playerid, "TDBanhTrungThu", 1);
        //printf("1 %d [ %d ] ( %d )",BurgerAmount[id], BurgerOffer[id], BurgerMoney[id]);
	}
    else {
        SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/traodoi <ten day du> <item> <so luong> <so tien>");
		SendClientMessage(playerid, COLOR_WHITE, "Lenh kha dung : hamburger, banhtrungthu.");
    }
    return 1;
}

CMD:updatefoodnow(playerid, params[]) {
	new string[128], newmoney = RandomMinMax(1000, 11000);
    
    format(string, sizeof(string), "Tien banh burger da duoc cap nhat gia ({ffffff}Gia cu :{32a852} %s {ffffff}| Gia moi : {32a852}%s{0099ff} | {ffffff}%s)", FormatNumber(f_foodData[0][F_gia]), FormatNumber(newmoney), f_foodData[0][F_gia] > newmoney ? "GIAM" : "TANG");
	SCMTA(0x0099ffff, string);
    f_foodData[0][F_gia] = newmoney;
    UpdateFood(0);
	return 1;
}

CMD:nhapburger(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new money,string[120];
	if(sscanf(params, "i",money)) return SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/nhapburger <So banh>");
	if(money < 1) return SendClientMessage(playerid, -1, "So banh khong duoc it hon 1.");
	f_foodData[0][F_soLuong] += money;
    UpdateFood(0);
	
	format(string, sizeof(string), "[CUA HANG BURGER SHOT] : Chung toi vua nhap them %s banh ve cua hang, hay den mua burger thoi nao", FormatNumber(money));
	SendClientMessageToAll(COLOR_LIGHTBLUE, string);
	format(string, sizeof(string), "%s da nhap %s banh", GetName(playerid), FormatNumber(money));
	Log("logs/burger.log", string);
	return 1;
}