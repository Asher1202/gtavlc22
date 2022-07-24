#include <streamer>
#include <YSI_Coding\y_hooks>

static Float:g_Npc1_Pos[] = {358.7344,173.8170,1008.3893};
static Float:g_Npc2_Pos[] = {375.1587,185.5932,1008.3893};
static Float:g_Npc3_Pos[] = {-2809.8577,-1516.7120,140.8438,266.8546};

static g_Npc1; // NPC Nhiem vu hang ngay / nhiem vu cap do
static g_Npc2; // NPC nhiem vu tuan
static g_Npc3; // NPC nhiem vu den

#pragma unused g_Npc1
#pragma unused g_Npc2
#pragma unused g_Npc3

enum e_MISSION {
    mission_FishRequired,
    mission_PizzaRequired,
    mission_TruckerRequired,
    mission_FarmerRequired,
    mission_BuyCoffee,
    mission_visitLS,
    mission_visitChillad,
    mission_times,
    mission_reset,
    mission_LevelRequired
}

static g_LevelMission[3][MAX_PLAYERS + 1][e_MISSION];
static Text3D:g_npcLabel[3 + 1];

#define MISSION_1_FISH_COUNT 20
#define MISSION_1_PIZZA_COUNT 15
#define MISSION_1_LEVEL_COUNT 3
#define MISSION_1_TRUCKER_COUNT 10

#define MISSION_2_FISH_COUNT 200
#define MISSION_2_PIZZA_COUNT 100
#define MISSION_2_LEVEL_COUNT 6
#define MISSION_2_TRUCKER_COUNT 100

#define MISSION_3_FISH_COUNT 100
#define MISSION_3_PIZZA_COUNT 120
#define MISSION_3_TRUCKER_COUNT 50
#define MISSION_3_LEVEL_COUNT 12

// static Migrate_DB() {
//     new query[300];
//     strcat(query, "\
    // ALTER TABLE `users`
    //     ADD COLUMN `MissionLevel1` VARCHAR(50) NOT NULL DEFAULT '0|0' COMMENT 'Nhiệm vụ cấp độ loại 1, format: fish|pizza' AFTER `Hunger`,
    //     ADD COLUMN `MissionLevel2` VARCHAR(50) NOT NULL DEFAULT '0|0' AFTER `MissionLevel1`,
    //     ADD COLUMN `MissionLevel3` VARCHAR(50) NOT NULL DEFAULT '0|0' AFTER `MissionLevel2`
        // ");

//     mysql_query(SQL, query, false);

//     printf("Migrate database successfully");
// }

hook OnGameModeInit() {
	g_Npc1 = CreateDynamicActor(17, g_Npc1_Pos[0], g_Npc1_Pos[1], g_Npc1_Pos[2], -90);
    g_Npc2 = CreateDynamicActor(37, g_Npc2_Pos[0], g_Npc2_Pos[1], g_Npc2_Pos[2], 90);
    g_Npc3 = CreateDynamicActor(33, g_Npc3_Pos[0], g_Npc3_Pos[1], g_Npc3_Pos[2], 270);
    g_npcLabel[0] = CreateDynamic3DTextLabel("{FFFFFF}Bam {AB0000}Y{FFFFFF} de nhan nhiem vu Daily/Level.", 0xFFFFFFFF, g_Npc1_Pos[0], g_Npc1_Pos[1], g_Npc1_Pos[2] + 1.0, 20.0, .streamdistance = 100.0);
    g_npcLabel[1] = CreateDynamic3DTextLabel("{FFFFFF}Bam {AB0000}Y{FFFFFF} de nhan nhiem vu Weekly.", 0xFFFFFFFF, g_Npc2_Pos[0], g_Npc2_Pos[1], g_Npc2_Pos[2] + 1.0, 20.0, .streamdistance = 100.0);
    g_npcLabel[2] = CreateDynamic3DTextLabel("{FFFFFF}Bam {AB0000}Y{FFFFFF} de nhan nhiem vu Bat hop phap.", 0xFFFFFFFF, g_Npc3_Pos[0], g_Npc3_Pos[1], g_Npc3_Pos[2] + 1.0, 20.0, .streamdistance = 100.0);
    /*
    for(new i; i < 3; i++) {
        g_LevelMission[i][MAX_PLAYERS][mission_FishRequired] = 0;
        g_LevelMission[i][MAX_PLAYERS][mission_PizzaRequired] = 0;
        g_LevelMission[i][MAX_PLAYERS][mission_FarmerRequired] = 0;
        g_LevelMission[i][MAX_PLAYERS][mission_TruckerRequired] = 0;
        g_LevelMission[i][MAX_PLAYERS][mission_BuyCoffee] = 0;
        g_LevelMission[i][MAX_PLAYERS][mission_visitChillad] = 0;
        g_LevelMission[i][MAX_PLAYERS][mission_visitLS] = 0;
        g_LevelMission[i][MAX_PLAYERS][mission_FarmerRequired] = 0;
    }*/
    g_LevelMission[1][MAX_PLAYERS][mission_reset] = 7;
    new d, m, y;
    getdate(y, m, d);
    if(d != g_LevelMission[0][MAX_PLAYERS][mission_reset])
    {
        g_LevelMission[0][MAX_PLAYERS][mission_FishRequired] = 0;
        g_LevelMission[0][MAX_PLAYERS][mission_PizzaRequired] = 0;
        g_LevelMission[0][MAX_PLAYERS][mission_FarmerRequired] = 0;
        g_LevelMission[0][MAX_PLAYERS][mission_TruckerRequired] = 0;
        g_LevelMission[0][MAX_PLAYERS][mission_BuyCoffee] = 0;
        g_LevelMission[0][MAX_PLAYERS][mission_visitChillad] = 0;
        g_LevelMission[0][MAX_PLAYERS][mission_visitLS] = 0;
        g_LevelMission[0][MAX_PLAYERS][mission_FarmerRequired] = 0;
        g_LevelMission[0][MAX_PLAYERS][mission_reset] = d;
        g_LevelMission[1][MAX_PLAYERS][mission_reset]--;
    }
    if(g_LevelMission[1][MAX_PLAYERS][mission_reset] == 0)
    {
        g_LevelMission[1][MAX_PLAYERS][mission_FishRequired] = 0;
        g_LevelMission[1][MAX_PLAYERS][mission_PizzaRequired] = 0;
        g_LevelMission[1][MAX_PLAYERS][mission_FarmerRequired] = 0;
        g_LevelMission[1][MAX_PLAYERS][mission_TruckerRequired] = 0;
        g_LevelMission[1][MAX_PLAYERS][mission_reset] = 7;
    }


    return 1;
}

static showQuest(playerid) {
    
    Dialog_Show(playerid, DIALOG_NPC_DAILY_MISSION, DIALOG_STYLE_LIST, "NPC: Nhiem vu", "Nhiem vu hang ngay\nNhiem vu tuan", "Xem nhiem vu", "Huy bo");

    return 1;
}

hook OnPlayerUpdate(playerid) {
    if(IsPlayerInRangeOfPoint(playerid, 70.0, 1948.4727,-2472.5562,13.5391))
    {
        g_LevelMission[0][playerid][mission_visitLS] = 1;
    }
    if(IsPlayerInRangeOfPoint(playerid, 70.0, -2813.5808,-1594.6831,141.3372))
    {
        g_LevelMission[0][playerid][mission_visitChillad] = 1;
    }

    return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {
	if(newkeys & KEY_YES) {	
        //check if player is in the npc range
        if(IsPlayerInRangeOfPoint(playerid, 3.5, g_Npc1_Pos[0], g_Npc1_Pos[1], g_Npc1_Pos[2])) {
            showQuest(playerid);
            return ~0;
        }

        else if(IsPlayerInRangeOfPoint(playerid, 3.5, g_Npc2_Pos[0], g_Npc2_Pos[1], g_Npc2_Pos[2])) {
            Dialog_Show(playerid, DIALOG_NPC_WEEKLY_MISSION, DIALOG_STYLE_MSGBOX, "NPC: Nhiem vu tuan", "Dang duoc phat trien...", "Xem nhiem vu", "Huy bo");
            return ~0;
        }
        
        else if(IsPlayerInRangeOfPoint(playerid, 3.5, g_Npc3_Pos[0], g_Npc3_Pos[1], g_Npc3_Pos[2])) {
            Dialog_Show(playerid, DIALOG_NPC_BHPHAP, DIALOG_STYLE_MSGBOX, "NPC: Nhiem vu den", "Dang duoc phat trien...", "Xem nhiem vu", "Huy bo");
            return ~0;
        }
    }
    return 1;
}

Dialog:DIALOG_NPC_DAILY_MISSION(playerid, response, listitem, inputtext[]) {
    if(!response) {
        return 1;
    }


    switch(listitem) {
        // case 0: {
        //     showQuestDaily(playerid);
        // }
        case 0: {
            showQuestWeek(playerid);
        }
    }

    return 1;
}
// g_LevelMission[0][playerid][mission_FarmerRequired]++; o phan ban hamburger thanh cong.
// g_LevelMission[0][playerid][mission_BuyCoffee] = 1; o phan mua coffee

showQuestWeek(playerid) {
    new info[300];
    strcat(info, "Ten nhiem vu\tTien do\n");
    format(info, sizeof(info), "%sBan 200 con ca\t%d/200\nGiao 100 chuyen truck\t%d/100\nGiao 100 pizza\t%d/100\nBan 3000 cai hamburger\t%d/3000", info, g_LevelMission[1][playerid][mission_FishRequired],
                                g_LevelMission[1][playerid][mission_TruckerRequired], g_LevelMission[1][playerid][mission_PizzaRequired], g_LevelMission[1][playerid][mission_FarmerRequired]);
    
    Dialog_Show(playerid, DIALOG_WEEK_QUEST, DIALOG_STYLE_TABLIST_HEADERS, "NPC: Nhiem vu tuan", info, "Nhan thuong", "Dong");
}


// showQuestDaily(playerid) {
//     new info[200];
//     strcat(info, "Ten nhiem vu\tTien do\n");
//     format(info, sizeof(info), "%sBan 20 con ca\t%d/20\nGiao 10 chuyen truck\t%d/10\nGiao 15 pizza\t%d/15\nBan 50 cai hamburger\t%d/50\n\
//                                 Mua Coffee\t%d/1\nDen san bay LS\t%d/1\nDen nui Chillad\t%d/1", info, g_LevelMission[0][playerid][mission_FishRequired],
//                                 g_LevelMission[0][playerid][mission_TruckerRequired], g_LevelMission[0][playerid][mission_PizzaRequired], g_LevelMission[0][playerid][mission_FarmerRequired],
//                                 g_LevelMission[0][playerid][mission_BuyCoffee], g_LevelMission[0][playerid][mission_visitLS], g_LevelMission[0][playerid][mission_visitChillad]);
//     Dialog_Show(playerid, DIALOG_DAILY_QUEST, DIALOG_STYLE_TABLIST_HEADERS, "NPC: Nhiem vu hang ngay", info, "Nhan thuong", "Dong");
//     return 1;
// }

Dialog:DIALOG_DAILY_QUEST(playerid, response, listitem, inputtext[]) {
    if(response)
    {
        if(g_LevelMission[0][playerid][mission_times] == 2) return SendFailMessage(playerid, "Ban da hoan thanh toi da nhiem vu hom nay.");
        switch(listitem)
        {
            case 0: {
                if(g_LevelMission[0][playerid][mission_FishRequired] < 20) return SendFailMessage(playerid, "Nhiem vu nay ban chua hoan thanh.");
                GivePlayerCash(playerid, 20000);
                PlayerInfo[playerid][pExp] += 1;
                SendSuccessMessage(playerid, "Ban da hoan thanh nhiem vu, nhan duoc 1 RP va 20.000$.");
                g_LevelMission[0][playerid][mission_times]++;
            }
            case 1: {
                if(g_LevelMission[0][playerid][mission_TruckerRequired] < 10) return SendFailMessage(playerid, "Nhiem vu nay ban chua hoan thanh.");
                GivePlayerCash(playerid, 30000);
                PlayerInfo[playerid][pPremiumPoints] += 3;
                SendSuccessMessage(playerid, "Ban da hoan thanh nhiem vu, nhan duoc 3 Coin va 20.000$.");
                g_LevelMission[0][playerid][mission_times]++;
            }
            case 2: {
                if(g_LevelMission[0][playerid][mission_PizzaRequired] < 20) return SendFailMessage(playerid, "Nhiem vu nay ban chua hoan thanh.");
                GivePlayerCash(playerid, 20000);
                PlayerInfo[playerid][pExp] += 1;
                SendSuccessMessage(playerid, "Ban da hoan thanh nhiem vu, nhan duoc 1 RP va 20.000$.");
                g_LevelMission[0][playerid][mission_times]++;
            }
            case 3: {
                if(g_LevelMission[0][playerid][mission_FarmerRequired] < 20) return SendFailMessage(playerid, "Nhiem vu nay ban chua hoan thanh.");
                GivePlayerCash(playerid, 50000);
                PlayerInfo[playerid][pExp] += 2;
                SendSuccessMessage(playerid, "Ban da hoan thanh nhiem vu, nhan duoc 2 RP va 50.000$.");
                g_LevelMission[0][playerid][mission_times]++;
            }
            case 4: {
                if(g_LevelMission[0][playerid][mission_BuyCoffee] < 1) return SendFailMessage(playerid, "Nhiem vu nay ban chua hoan thanh.");
                GivePlayerCash(playerid, 20000);
                SendSuccessMessage(playerid, "Ban da hoan thanh nhiem vu, nhan duoc 20.000$");
                g_LevelMission[0][playerid][mission_times]++;
            }
            case 5: {
                if(g_LevelMission[0][playerid][mission_visitLS] < 1) return SendFailMessage(playerid, "Nhiem vu nay ban chua hoan thanh.");
                GivePlayerCash(playerid, 30000);
                PlayerInfo[playerid][pExp] += 1;
                SendSuccessMessage(playerid, "Ban da hoan thanh nhiem vu, nhan duoc 1 RP va 30.000$.");
                g_LevelMission[0][playerid][mission_times]++;
            }
            case 6: {
                if(g_LevelMission[0][playerid][mission_FishRequired] < 20) return SendFailMessage(playerid, "Nhiem vu nay ban chua hoan thanh.");
                GivePlayerCash(playerid, 50000);
                PlayerInfo[playerid][pExp] += 2;
                SendSuccessMessage(playerid, "Ban da hoan thanh nhiem vu, nhan duoc 1 RP va 50.000$.");
                g_LevelMission[0][playerid][mission_times]++;
            }
        }
        new query[1000];
        format(query, sizeof(query), "UPDATE users SET Money=%d,Respect=%d,PremiumPoints=%d WHERE ID=%d", 
            GetPlayerCash(playerid), PlayerInfo[playerid][pExp], PlayerInfo[playerid][pPremiumPoints], PlayerInfo[playerid][pSQLID]);
        mysql_query(SQL, query, false);
    }
    return 1;
}

Dialog:DIALOG_WEEK_QUEST(playerid, response, listitem, inputtext[]) {
    if(response)
    {
        switch(listitem)
        {
            case 0: {
                if(g_LevelMission[1][playerid][mission_FishRequired] < 200) return SendFailMessage(playerid, "Nhiem vu nay ban chua hoan thanh.");
            }
            case 1: {
                if(g_LevelMission[1][playerid][mission_TruckerRequired] < 100) return SendFailMessage(playerid, "Nhiem vu nay ban chua hoan thanh.");
            }
            case 2: {
                if(g_LevelMission[1][playerid][mission_PizzaRequired] < 100) return SendFailMessage(playerid, "Nhiem vu nay ban chua hoan thanh.");
            }
            case 3: {
                if(g_LevelMission[1][playerid][mission_FarmerRequired] < 3000) return SendFailMessage(playerid, "Nhiem vu nay ban chua hoan thanh.");
            }
        }
        if(g_LevelMission[1][playerid][mission_TruckerRequired] >= 100 && g_LevelMission[1][playerid][mission_FishRequired] >= 200 
        && g_LevelMission[1][playerid][mission_PizzaRequired] >= 100 && g_LevelMission[1][playerid][mission_FarmerRequired] >= 3000) {
            GivePlayerCash(playerid, 200000);
            PlayerInfo[playerid][pExp] += 3;
            PlayerInfo[playerid][pPremiumPoints] += 15;
            PlayerInfo[playerid][pMats] += 500;
            PlayerInfo[playerid][pRob] += 2;
            SendSuccessMessage(playerid, "Ban da hoan thanh nhiem vu tuan xuat sac, ban nhan duoc 3 RP, 15 Coin, 500 vat lieu va 2 diem Rob.");
            g_LevelMission[1][playerid][mission_reset] = 7;
        }
    }
    return 1;
}
/*
Dialog:DIALOG_NPC_DMISSION2(playerid, response, listitem, inputtext[]) {
    if(!response) {
        showQuestDaily(playerid);
        return 1;
    }

    new fishCount, pizzaCount, truckerCount, level;

    switch(GetPVarInt(playerid, "ChooseMission")) {
        case 0: {
            fishCount = MISSION_1_FISH_COUNT;
            pizzaCount = MISSION_1_PIZZA_COUNT;
            truckerCount = MISSION_1_TRUCKER_COUNT;
            level = MISSION_1_LEVEL_COUNT;
        }
        case 1: {
            fishCount = MISSION_2_FISH_COUNT;
            pizzaCount = MISSION_2_PIZZA_COUNT;
            truckerCount = MISSION_2_TRUCKER_COUNT;
            level = MISSION_2_LEVEL_COUNT;
        }
        case 2: {
            fishCount = MISSION_3_FISH_COUNT;
            pizzaCount = MISSION_3_PIZZA_COUNT;
            truckerCount = MISSION_3_TRUCKER_COUNT;
            level = MISSION_3_LEVEL_COUNT;
        }
    }

    new chooseMission = GetPVarInt(playerid, "ChooseMission");

    // check complete
    if(g_LevelMission[chooseMission][playerid][mission_FishRequired] >= fishCount 
        && g_LevelMission[chooseMission][playerid][mission_PizzaRequired] >= pizzaCount
        && g_LevelMission[chooseMission][playerid][mission_TruckerRequired] >= truckerCount
        && PlayerInfo[playerid][pLevel] >= level) {
        
        SendSuccessMessage(playerid, "Nhiem vu hoan thanh");

        GrantMissionReward(playerid, chooseMission);
        return 1;
    }

    else {
        Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Nhiem vu cap do", "Nhiem vu chua hoan thanh", "Ok", "");
    }

    return 1;
}*/

CMD:gotonpc(playerid, params[]) {
	new id;
	if(sscanf(params, "i",id)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/gotonpc <1,2,3>");	
    if(!(id >= 1 && id <= 3)) return SendFailMessage(playerid, "NPC Nhiem vu khong ton tai");

    switch(id) {
        case 1: {
            SetPlayerPosEx(playerid, g_Npc1_Pos[0], g_Npc1_Pos[1], g_Npc1_Pos[2]);
        }
        case 2: {
            SetPlayerPosEx(playerid, g_Npc2_Pos[0], g_Npc2_Pos[1], g_Npc2_Pos[2]);
        }
        case 3: {
            SetPlayerPosEx(playerid, g_Npc3_Pos[0], g_Npc3_Pos[1], g_Npc3_Pos[2]);
        }
    }   

    SetPlayerInterior(playerid, 3);

    SendSuccessMessage(playerid, "Ban da dich chuyen den NPC");
    return 1;
}

static Mission_LoadFromDB(playerid) {
    new query[300];
    format(query, sizeof(query), "SELECT MissionLevel1, MissionLevel2, MissionLevel3 FROM `users` WHERE id = '%d'", PlayerInfo[playerid][pSQLID]);

    printf(query);
    new Cache:cache = mysql_query(SQL, query);

    if(!cache_num_rows()) {
        return 1;
    }

    new tmp[50], converted[8];
    cache_get_value_name(0, "MissionLevel1", tmp);

    printf("Before: %s", tmp);
    sscanf(tmp, "p<|>iiiiiiii", converted[0], converted[1], converted[2], converted[3], converted[4], converted[5] , converted[6], converted[7]);
    printf("Converted: %d %d\n", converted[0], converted[1]);
    g_LevelMission[0][playerid][mission_FishRequired] = converted[0];
    g_LevelMission[0][playerid][mission_PizzaRequired] = converted[1];
    g_LevelMission[0][playerid][mission_TruckerRequired] = converted[2];
    g_LevelMission[0][playerid][mission_BuyCoffee] = converted[3];
    g_LevelMission[0][playerid][mission_visitChillad] = converted[4];
    g_LevelMission[0][playerid][mission_visitChillad] = converted[5];
    g_LevelMission[0][playerid][mission_FarmerRequired] = converted[6];
    g_LevelMission[0][playerid][mission_times] = converted[7];
    
    cache_get_value_name(0, "MissionLevel2", tmp);
    sscanf(tmp, "p<|>iiii", converted[0], converted[1], converted[2], converted[3]);
    g_LevelMission[1][playerid][mission_FishRequired] = converted[0];
    g_LevelMission[1][playerid][mission_PizzaRequired] = converted[1];
    g_LevelMission[1][playerid][mission_TruckerRequired] = converted[2];
    g_LevelMission[1][playerid][mission_FarmerRequired] = converted[3];
    /*
    cache_get_value_name(0, "MissionLevel3", tmp);
    sscanf(tmp, "p<|>ii", converted[0], converted[1]);
    g_LevelMission[2][playerid][mission_FishRequired] = converted[0];
    g_LevelMission[2][playerid][mission_PizzaRequired] = converted[1];*/

    cache_delete(cache);

    return 1;
}
/*
static ShowMissionNotify() {
    SendSuccessMessage(playerid, "Cap nhat tien do nhiem vu");
}
*/
static Mission_SaveToDB(playerid, missionId) {
    // mission id must be between 1 and 3
    if(!(missionId >= 1 && missionId <= 3)) {
        printf("Mission id must be between 1 and 3");    
        return 1;
    }

    new query[300];
    new missionData[50];

    format(missionData, sizeof(missionData), "%d|%d", g_LevelMission[1][playerid][mission_FishRequired], g_LevelMission[1][playerid][mission_PizzaRequired]);
    format(query, sizeof(query), "UPDATE `users` SET MissionLevel2 = '%s' WHERE id = '%d'", missionData, PlayerInfo[playerid][pSQLID]);
    mysql_query(SQL, query, false);

    return 1;
}

getOnGoingMissionId(playerid) {
    // get mission that is not completed
    new missionId;

    new fish_count[] = {MISSION_1_FISH_COUNT, MISSION_2_FISH_COUNT, MISSION_3_FISH_COUNT};
    new pizza_count[] = {MISSION_1_PIZZA_COUNT, MISSION_2_PIZZA_COUNT, MISSION_3_PIZZA_COUNT};    
    new level_count[] = {MISSION_1_LEVEL_COUNT, MISSION_2_LEVEL_COUNT, MISSION_3_LEVEL_COUNT};
    new truck_count[] = {MISSION_1_TRUCKER_COUNT, MISSION_2_TRUCKER_COUNT, MISSION_3_TRUCKER_COUNT};

    for(missionId = 0; missionId < 3; missionId++) {
        if(g_LevelMission[missionId][playerid][mission_FishRequired] < fish_count[missionId] 
        || g_LevelMission[missionId][playerid][mission_PizzaRequired] < pizza_count[missionId]
        || g_LevelMission[missionId][playerid][mission_TruckerRequired] < truck_count[missionId]
        || PlayerInfo[playerid][pLevel] < level_count[missionId]) {
            return missionId;
        }
    }

    return -1;
}

// Update progress when complete
function Mission_UpdatePizza(playerid) {
    new missionId = getOnGoingMissionId(playerid);

    printf("Mission id: %d\n", missionId);

    if(missionId == -1) {
        return 1;
    }

    g_LevelMission[missionId][playerid][mission_PizzaRequired]++;
    Mission_SaveToDB(playerid, missionId);

    return 1;
}
// Update progress when complete
function Mission_UpdateFish(playerid) {
    new missionId = getOnGoingMissionId(playerid);

    if(missionId == -1) {
        return 1;
    }

    g_LevelMission[missionId][playerid][mission_FishRequired]++;  
    Mission_SaveToDB(playerid, missionId);

    return 1;
}

function Mission_UpdateTrucker(playerid) {
    new missionId = getOnGoingMissionId(playerid);
    
    if(missionId == -1) {
        return 1;
    }

    g_LevelMission[missionId][playerid][mission_TruckerRequired]++;
    Mission_SaveToDB(playerid, missionId);

    return 1;
}

hook ResetVariables(playerid) {
    for(new i = 0; i < 3; i++) {
        g_LevelMission[i][playerid] = g_LevelMission[i][MAX_PLAYERS];
    }
}

hook AfterDBLoad(playerid) {
    Mission_LoadFromDB(playerid);
}
/*
static GrantMissionReward(playerid, id) {
    switch(id) {
        case 1: {
            SendSuccessMessage(playerid, "Ban nhan duoc: 10 Coin, 2x RP, 50.000$ & MANH GHEP VLC");

            GivePlayerCash(playerid, 50000);
            PlayerInfo[playerid][pExp] += 2;
            PlayerInfo[playerid][pPremiumPoints] += 10;

        }
        case 2: {
            SendSuccessMessage(playerid, "15 Coin, 2x RP, 100.000$ & MANH GHEP VLC");

            GivePlayerCash(playerid, 100000);
            PlayerInfo[playerid][pExp] += 2;
            PlayerInfo[playerid][pPremiumPoints] += 15;

        }
        case 3: {
            SendSuccessMessage(playerid, "20 Coin, 2x RP, 150.000$ & MANH GHEP VLC");
            
            GivePlayerCash(playerid, 150000);
            PlayerInfo[playerid][pExp] += 2;
            PlayerInfo[playerid][pPremiumPoints] += 20;

        }
    }

    new query[1000];
    format(query, sizeof(query), "UPDATE users SET Money=%d,Respect=%d,PremiumPoints=%d WHERE ID=%d", 
        GetPlayerCash(playerid), PlayerInfo[playerid][pExp], PlayerInfo[playerid][pPremiumPoints], PlayerInfo[playerid][pSQLID]);
    mysql_query(SQL, query, false);

    new str[400];
    format(str, sizeof(str), "[MISSION] %s(%d) da hoan thanh nhiem vu loai %d\n", ret_GetPlayerName(playerid), playerid, id);
    SendClientMessageToAll(COLOR_LOGS, str);
    
	//InsertLog(playerid, str, LOG_MONEY);
}*/

function CheckNhiemVuCapDo(playerid) {
	switch(PlayerInfo[playerid][pJob]) {
		case PIZZA_JOB_ID: {

			Mission_UpdatePizza(playerid);
		}
		case FISHING_LS_JOB_ID, FISHING_LV_JOB_ID: {

			Mission_UpdateFish(playerid);
		}
		case TRUCKER_JOB_ID: {

			Mission_UpdateTrucker(playerid);
		}
	}


}