
#include <YSI_Coding\y_timers>
#include <YSI_Coding\y_hooks>
#include <easyDialog>


#define MAX_CANABIS (26) // so luong can sa
#define MAX_MACHINE (3)


//variable
static Canabis[MAX_PLAYERS]; // so luong can sa (thay doi thanh gia tri du lieu cua nguoi dung server)
static PackCanabis[MAX_PLAYERS]; // goi ma tuy
static Timer:ccHarvesting[MAX_PLAYERS];
static Timer:mProcessing[MAX_PLAYERS];

enum C_ENUM
{
    cID, // id can sa
    cStats, // trang thai can sa (0: dang hai, 1: chua hai, 2: da hai)
    cObject, // object can sa
    Timer:cTime,
    cTimeReset, // reset sau 45 phut
    Text3D:cText, // text 3d can sa
    Float:cPostion[3], // x, y, z can sa
}

static g_cInfo[MAX_CANABIS][C_ENUM];

enum M_ENUM
{
	mID,
    mStats,
    mHP,
    Timer:mTime,
    Timer:mTimerRs,
    Text3D:mText,
	Float:mPos[3],
}

static mInfo[MAX_MACHINE][M_ENUM];
timer cRespawn[60000*45](i) 
{
    g_cInfo[i][cTimeReset] = 0;

    if(g_cInfo[i][cTimeReset] == 0) 
    {
        new string[129];

        g_cInfo[i][cID] = i;
        g_cInfo[i][cStats] = 1;
        g_cInfo[i][cObject] = CreateDynamicObject(19473, g_cInfo[i][cPostion][0] ,g_cInfo[i][cPostion][1] ,g_cInfo[i][cPostion][2], 0,0,0, .drawdistance = 27.0, .streamdistance = 27.0);
        format(string, sizeof(string), "Cay can sa [ID: %i]\n{00c220}Chua co nguoi hai", i);
        g_cInfo[i][cText] = CreateDynamic3DTextLabel(string, -1, g_cInfo[i][cPostion][0] ,g_cInfo[i][cPostion][1] ,g_cInfo[i][cPostion][2]+1, 27.0, .streamdistance = 27.0);
    }
}

// Timer 
timer HarvestDone[20000 + random(10000)](playerid, i)
{
    new string[129],
        rand = 1 + random(4);

    TogglePlayerControllable(playerid, true);
    ClearAnimations(playerid);
    SetPVarInt(playerid, "Harvesting", 0);
    
    g_cInfo[i][cStats] = 2;
    g_cInfo[i][cID] = 0;
    DestroyObject(g_cInfo[i][cObject]);
    Delete3DTextLabel(g_cInfo[i][cText]);

    Canabis[playerid] += rand;
    format(string, sizeof(string), "Ban da hai cay can sa thanh cong va nhan duoc {00c220}%d{ffffff} la can sa.", rand);
    SendSuccessMessage(playerid, string);

    g_cInfo[i][cTimeReset] = 1;
    g_cInfo[i][cTime] = defer cRespawn(i);
}


timer RecoveryTime[60000](i)
{
    new string[200];
	if(mInfo[i][mHP] < 100)
	{
		mInfo[i][mHP]++;
		format(string, sizeof(string),  "{d3c717}[May che bien (%d)]{ffffff}\nTrang thai hoat dong: {00c220}%d%%", i, mInfo[i][mHP]);
		UpdateDynamic3DTextLabelText(mInfo[i][mText], -1, string);
	}
	else if(mInfo[i][mHP] == 100)
	{
		mInfo[i][mHP] = 100;
	}
}

timer Reduce[20000 + random(10000)](playerid, i)
{
    new string [129];
	if(IsPlayerInRangeOfPoint(playerid, 2, mInfo[i][mPos][0], mInfo[i][mPos][1], mInfo[i][mPos][2]))
	{
		if(mInfo[i][mHP] < 5)
		{
			stop mProcessing[playerid];
			stop mInfo[i][mTime];
			SendFailMessage(playerid, "Qua trinh che bien cua ban that bai vi may che bien ngung hoat dong");
		}
		else {
			new rand = 1 + random(5);
			mInfo[i][mHP] -= rand;
			format(string, sizeof(string), "Trang thai hoat dong cua may che bien da giam di {e92f2f}%d%%.", rand);
			SendClientMessage(playerid, -1, string);

			format(string, sizeof(string),  "{d3c717}[May che bien (%d)]{ffffff}\nTrang thai hoat dong: {00c220}%d%%", i, mInfo[i][mHP]);
			UpdateDynamic3DTextLabelText(mInfo[i][mText], -1, string);
		}
	}
}

timer Processing[60000 + random(60000)](playerid, i)
{
	if(IsPlayerInRangeOfPoint(playerid, 2, mInfo[i][mPos][0], mInfo[i][mPos][1], mInfo[i][mPos][2])) {
    TogglePlayerControllable(playerid, true);
    ClearAnimations(playerid);
    
    Canabis[playerid] -= 10;
    PackCanabis[playerid]++;
    SendSuccessMessage(playerid, "Ban da ton 10 la can sa de che bien ra 1 goi ma tuy.");

    stop mInfo[i][mTime];
    mInfo[i][mStats] = 0;
	}
}

hook OnPlayerConnect(playerid)
{
    RemoveBuildingForPlayer(playerid, 3295, 1099.1172, -358.4766, 77.6172, 0.25);
    RemoveBuildingForPlayer(playerid, 3347, 1114.2969, -353.8203, 72.7969, 0.25);
    RemoveBuildingForPlayer(playerid, 3347, 1107.5938, -358.5156, 72.7969, 0.25);
    RemoveBuildingForPlayer(playerid, 935, 1550.5625, 11.1094, 23.6328, 0.25);
    RemoveBuildingForPlayer(playerid, 759, 1553.0000, -5.6875, 20.9141, 0.25);
    RemoveBuildingForPlayer(playerid, 935, 1551.5000, 10.7422, 23.5859, 0.25);
    RemoveBuildingForPlayer(playerid, 13002, 1554.0547, -0.3125, 26.8125, 0.25);
    RemoveBuildingForPlayer(playerid, 759, 1554.3906, 4.6250, 22.2813, 0.25);
    RemoveBuildingForPlayer(playerid, 1427, 1554.0625, 13.2969, 23.8516, 0.25);
    RemoveBuildingForPlayer(playerid, 13003, 1559.6250, 20.0156, 23.5469, 0.25);
    RemoveBuildingForPlayer(playerid, 759, 1562.1953, 36.9375, 22.8906, 0.25);
    RemoveBuildingForPlayer(playerid, 935, 1565.9141, 12.9766, 23.4688, 0.25);
    RemoveBuildingForPlayer(playerid, 935, 1566.7422, 16.3672, 23.6719, 0.25);
    RemoveBuildingForPlayer(playerid, 759, 1566.7266, 7.0156, 22.2031, 0.25);
    RemoveBuildingForPlayer(playerid, 935, 1566.6953, 13.8516, 23.4453, 0.25);
    RemoveBuildingForPlayer(playerid, 3286, 1099.1172, -358.4766, 77.6172, 0.25);
    RemoveBuildingForPlayer(playerid, 3175, 1107.5938, -358.5156, 72.7969, 0.25);
    RemoveBuildingForPlayer(playerid, 3175, 1114.2969, -353.8203, 72.7969, 0.25);
	return 1;
}


hook OnGameModeInit()
{
    new string[200], mstring[200];

    g_cInfo[1][cPostion][0] = -2800.240722, g_cInfo[1][cPostion][1] = -1572.937377,g_cInfo[1][cPostion][2] = 140.040451; // 1
    g_cInfo[2][cPostion][0]  = -2838.166503, g_cInfo[2][cPostion][1] = -1553.159179,g_cInfo[2][cPostion][2] = 138.939331; // 2
    g_cInfo[3][cPostion][0]  = -2838.039794, g_cInfo[3][cPostion][1] = -1501.849731,g_cInfo[3][cPostion][2] = 136.85284; // 3
    g_cInfo[4][cPostion][0]  = -2821.726562, g_cInfo[4][cPostion][1] = -1468.297851,g_cInfo[4][cPostion][2] = 135.369781; // 4
    g_cInfo[5][cPostion][0]  = -2858.982421, g_cInfo[5][cPostion][1] = -1482.526611,g_cInfo[5][cPostion][2] = 134.837326; // 5
    g_cInfo[6][cPostion][0]  = -2879.551757, g_cInfo[6][cPostion][1] = -1525.141479,g_cInfo[6][cPostion][2] = 136.332519; // 6
    g_cInfo[7][cPostion][0]  = -2853.195800, g_cInfo[7][cPostion][1] = -1574.632080,g_cInfo[7][cPostion][2] = 139.913436; // 7
    g_cInfo[8][cPostion][0]  = -2835.404052, g_cInfo[8][cPostion][1] = -1586.147338,g_cInfo[8][cPostion][2] = 139.830444; // 8
    g_cInfo[9][cPostion][0]  = -2785.197265, g_cInfo[9][cPostion][1] = -1421.089721,g_cInfo[9][cPostion][2] = 134.952850; // 9
    g_cInfo[10][cPostion][0] = -2808.551513, g_cInfo[10][cPostion][1] = -1415.062133,g_cInfo[10][cPostion][2] = 135.123596; // 10
    g_cInfo[11][cPostion][0]  = -2841.733886, g_cInfo[11][cPostion][1] = -1422.112304,g_cInfo[11][cPostion][2] = 134.443435; // 11
    g_cInfo[12][cPostion][0]  = -2855.140869, g_cInfo[12][cPostion][1] = -1442.041015,g_cInfo[12][cPostion][2] = 134.950592; // 12
    g_cInfo[13][cPostion][0]  = -2819.167968, g_cInfo[13][cPostion][1] = -1659.046752,g_cInfo[13][cPostion][2] = 139.933639; // 13
    g_cInfo[14][cPostion][0]  = -2797.138671, g_cInfo[14][cPostion][1] = -1634.496704,g_cInfo[14][cPostion][2] = 140.019653; // 14
    g_cInfo[15][cPostion][0]  = -2827.078125, g_cInfo[15][cPostion][1] = -1679.111694,g_cInfo[15][cPostion][2] = 140.133575; // 15
    g_cInfo[16][cPostion][0] = -2795.741455, g_cInfo[16][cPostion][1] = -1521.306884,g_cInfo[16][cPostion][2] = 137.784759; // 16
    g_cInfo[17][cPostion][0]  = -2792.385498, g_cInfo[17][cPostion][1] = -1499.153198,g_cInfo[17][cPostion][2] = 137.194549; // 17
    g_cInfo[18][cPostion][0]  = -2793.254882, g_cInfo[18][cPostion][1] = -1547.729003,g_cInfo[18][cPostion][2] = 138.580535; // 18
    g_cInfo[19][cPostion][0]  = -2769.465087, g_cInfo[19][cPostion][1] = -1375.894775,g_cInfo[19][cPostion][2] = 133.718032; // 19
    g_cInfo[20][cPostion][0]  = -2799.485595, g_cInfo[20][cPostion][1] = -1387.691162,g_cInfo[20][cPostion][2] = 133.540145; // 20
    g_cInfo[21][cPostion][0]  = -2819.041748, g_cInfo[21][cPostion][1] = -1367.512084,g_cInfo[21][cPostion][2] = 130.348937; // 21
    g_cInfo[22][cPostion][0]  = -2795.027343, g_cInfo[22][cPostion][1] = -1297.581909,g_cInfo[22][cPostion][2] = 121.856994; // 22
    g_cInfo[23][cPostion][0]  = -2823.654296, g_cInfo[23][cPostion][1] = -1328.027465,g_cInfo[23][cPostion][2] = 124.535018; // 23
    g_cInfo[24][cPostion][0]  = -2806.780761, g_cInfo[24][cPostion][1] = -1351.141479,g_cInfo[24][cPostion][2] = 129.525466; // 24
    g_cInfo[25][cPostion][0] = -2763.432861, g_cInfo[25][cPostion][1] = -1307.017211,g_cInfo[25][cPostion][2] = 126.953384; // 25
    
	mInfo[0][mPos][0] = 1584.6311, mInfo[0][mPos][1] = 27.9774,mInfo[0][mPos][2] = 24.1661;
	mInfo[1][mPos][0] = 1588.0009, mInfo[1][mPos][1] = 28.1993,mInfo[1][mPos][2] = 24.3247;

    // -2763.432861 -1307.017211 126.953384

    for(new i=1;i<26;i++)
    {
        g_cInfo[i][cID] = i;
        g_cInfo[i][cStats] = 1;
        g_cInfo[i][cObject] = CreateDynamicObject(19473, g_cInfo[i][cPostion][0] ,g_cInfo[i][cPostion][1] ,g_cInfo[i][cPostion][2], 0,0,0, .drawdistance = 45.0, .streamdistance = 45.0);
        format(string, sizeof(string), "Cay can sa [ID: %i]\n{00c220}Chua co nguoi hai", i);
        g_cInfo[i][cText] = CreateDynamic3DTextLabel(string, -1, g_cInfo[i][cPostion][0] ,g_cInfo[i][cPostion][1] ,g_cInfo[i][cPostion][2]+1, 27.0, .streamdistance = 27.0);
    }
	for(new i=0;i < MAX_MACHINE;i++) {
		mInfo[i][mID] = i;
		mInfo[i][mHP] = 100;
		mInfo[i][mTimerRs] = repeat RecoveryTime(i);
		format(mstring, sizeof(mstring), "{d3c717}[May che bien (%d)]{ffffff}\nTrang thai hoat dong: {00c220}%d%%", i, mInfo[i][mHP]);
		mInfo[i][mText] = CreateDynamic3DTextLabel(mstring, -1, mInfo[i][mPos][0] ,mInfo[i][mPos][1] ,mInfo[i][mPos][2], 27.0, .streamdistance = 27.0);
		if(mInfo[i][mHP] < 50) {
			format(string, sizeof(string),  "{d3c717}[May che bien (%d)]{ffffff}\nTrang thai hoat dong: {ebc105}%d%%", i, mInfo[i][mHP]);
			UpdateDynamic3DTextLabelText(mInfo[i][mText], -1, string);
		}
		else if(mInfo[i][mHP] < 10) {
			format(string, sizeof(string),  "{d3c717}[May che bien (%d)]{ffffff}\nTrang thai hoat dong: {cd0404}%d%%", i, mInfo[i][mHP]);
			UpdateDynamic3DTextLabelText(mInfo[i][mText], -1, string);
		}
	}

	CreateDynamicObject(3409, -1114.87634, -1089.63147, 128.09900,   0.00000, 0.00000, 360.01361, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(3409, -1120.86218, -1089.52112, 128.09900,   0.00000, 0.00000, 0.00000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(3409, -1126.89282, -1089.61255, 128.09900,   0.00000, 0.00000, 0.00000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(3409, -1132.88208, -1089.60266, 128.09900,   0.00000, 0.00000, 0.00000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(3409, -1138.98621, -1089.77258, 128.09900,   0.00000, 0.00000, 0.00000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(3409, -1091.53540, -1089.73608, 128.09900,   0.00000, 0.00000, 0.00000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(3409, -1086.10779, -1089.67346, 128.09900,   0.00000, 0.00000, 0.00000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(3409, -1080.42358, -1089.56226, 128.09900,   0.00000, 0.00000, 0.00000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(3409, -1074.71155, -1089.55994, 128.09900,   0.00000, 0.00000, 0.00000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(3409, -1068.98853, -1089.61597, 128.09900,   0.00000, 0.00000, 0.00000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(3409, -1163.80945, -1101.85315, 128.09900,   0.00000, 0.00000, 0.00000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(3409, -1169.93811, -1101.85229, 128.09900,   0.00000, 0.00000, 0.00000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(3409, -1175.87964, -1101.96240, 128.09900,   0.00000, 0.00000, 0.00000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(3409, -1181.32385, -1101.97620, 128.09900,   0.00000, 0.00000, 0.00000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(3409, -1181.49036, -1089.22827, 128.09900,   0.00000, 0.00000, 0.00000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(3409, -1175.41943, -1089.28528, 128.09900,   0.00000, 0.00000, 0.00000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(3409, -1169.69800, -1089.33435, 128.09900,   0.00000, 0.00000, 0.00000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(3409, -1164.35938, -1089.44824, 128.09900,   0.00000, 0.00000, 0.00000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(17324, -1169.09387, -1137.72375, 127.72191,   0.00000, 0.00000, 181.56209, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(19378, 1592.66577, 34.01650, 1592.66833,   0.00000, 0.00000, 13.06830, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(11502, 1585.87915, 31.25274, 22.90110,   0.00000, 0.00000, 275.70789, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(19378, 1590.24304, 30.94372, 21.45365,   0.00000, 0.00000, 5.94000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(11691, 1588.13354, 27.00120, 23.30440,   0.00000, 0.00000, 5.10710, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(11691, 1584.71509, 26.70191, 23.30440,   0.00000, 0.00000, 5.46000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(19473, 1582.76074, 35.33540, 22.84020,   0.00000, 0.00000, 0.00000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(19473, 1583.09741, 33.48360, 22.84020,   0.00000, 0.00000, 0.00000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(19473, 1584.62598, 33.68030, 22.84020,   -0.64000, 0.00000, 0.00000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(19473, 1584.32153, 35.62360, 22.84020,   0.00000, 0.00000, 0.00000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(19473, 1586.16357, 35.60340, 22.84020,   0.00000, 0.00000, 0.00000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(19473, 1586.48376, 33.82100, 22.84020,   0.00000, 0.00000, 0.00000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(19473, 1588.01709, 35.84910, 22.84020,   0.00000, 0.00000, 1.50030, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(19473, 1588.22021, 34.21370, 22.84020,   0.00000, 0.00000, 0.00000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(18728, 1577.41919, 32.80792, 23.97936,   0.00000, 0.00000, 0.00000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(18749, 1586.29761, 25.60930, 24.96170,   0.00000, 0.00000, 4.93090, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(1271, 1582.34033, 25.56433, 23.23740,   0.00000, 0.00000, 8.41043, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(1271, 1582.33008, 25.53820, 23.88190,   0.00000, 0.00000, 6.75960, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(1271, 1583.04492, 25.67943, 23.23740,   0.00000, 0.00000, 9.18000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(1271, 1583.04797, 25.62042, 23.90190,   0.02000, 0.00000, 8.33999, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(356, 1585.77185, 25.59320, 24.70280,   0.00000, 0.00000, 192.20850, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(353, 1586.76392, 25.62660, 24.60690,   0.00000, 0.00000, 12.60440, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(358, 1586.91650, 25.70380, 25.16940,   0.00000, 0.00000, 11.57370, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(362, 1586.10559, 25.75443, 25.30116,   0.00000, 0.00000, 183.74133, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(1575, 1587.30591, 27.16411, 24.02520,   0.00000, 0.00000, 4.25950, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(1576, 1588.44165, 27.15011, 24.02520,   0.00000, 0.00000, -41.82000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(1577, 1588.03687, 26.67557, 24.02520,   0.00000, 0.00000, 96.83971, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(1279, 1584.93481, 26.72030, 24.04520,   0.00000, 0.00000, 39.78000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(1550, 1583.60583, 26.14380, 24.40480,   0.00000, 0.00000, -45.24004, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(2061, 1585.87720, 26.51963, 24.32740,   0.00000, 0.00000, 6.48000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(3374, 1584.12134, 22.71518, 24.27547,   0.00000, 0.00000, 4.80000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(2068, 1586.22437, 30.17457, 26.39357,   0.00000, 0.00000, 6.33640, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(1227, 1580.53113, 34.13940, 24.13940,   0.00000, 0.00000, -82.14000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(706, 1544.62134, 16.69320, 22.91260,   0.00000, 0.00000, 0.00000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(9153, 1585.73584, 31.45977, 23.78053,   0.00000, 0.00000, 4.86000, .drawdistance = 300.0, .streamdistance = 300.0);
	CreateDynamicObject(11440, 1537.71265, 24.86387, 22.69380,   0.00000, 0.00000, -75.85120, .drawdistance = 300.0, .streamdistance = 300.0);

	return 1;
}



CMD:haican(playerid, params[])
{
    new check = 0;
    //if(!IsPlayerConnected) return SendClientMessage(playerid, -1, "{ff1a1a}[!]{ffffff} Ban can phai dang nhap.");
    if(GetPVarInt(playerid, "Harvesting") == 1) return SendFailMessage(playerid, "Ban dang thu hoach, vui long doi.");
    for(new i=1;i<26;i++)
    {
        if(g_cInfo[i][cStats] == 1)
        {
            if(IsPlayerInRangeOfPoint(playerid, 2, g_cInfo[i][cPostion][0] ,g_cInfo[i][cPostion][1] ,g_cInfo[i][cPostion][2]))
            {
                new string[129];

                GameTextForPlayer(playerid, "~r~DANG THU HOACH...", 22000, 3);
                TogglePlayerControllable(playerid, false);
                SetPVarInt(playerid, "Harvesting", 1);
                ApplyAnimation(playerid, "BOMBER", "BOM_Plant_Loop", 4.0, 1, 0, 0, 0, 0);
                ccHarvesting[playerid] = defer HarvestDone(playerid, i);
                g_cInfo[i][cStats] = 0;
                format(string, sizeof(string),  "Cay can sa [ID: %i]\n{d5d818}Dang co nguoi hai", i);
                UpdateDynamic3DTextLabelText(g_cInfo[i][cText], -1, string);
                SetPVarInt(playerid, "mHarvesting", i);
                check = 0;
                break;
            }
            else {
                check = 2;
            }
        }
    }
    if(check == 2)
    {
        SendFailMessage(playerid, "Ban khong o gan cay can sa nao.");
    }
    return 1;
}

CMD:huyhaican(playerid, params[])
{
    if(GetPVarInt(playerid, "Harvesting") == 1)
    {
        new string[129];

        TogglePlayerControllable(playerid, 1);
        stop ccHarvesting[playerid];
        DeletePVar(playerid, "Harvesting");
        g_cInfo[GetPVarInt(playerid, "mHarvesting")][cStats] = 1;

        format(string, sizeof(string), "Cay can sa [ID: %i]\n{00c220}Chua co nguoi hai", GetPVarInt(playerid, "mHarvesting"));
        UpdateDynamic3DTextLabelText(g_cInfo[GetPVarInt(playerid, "mHarvesting")][cText], -1, string);
        DeletePVar(playerid, "mHarvesting");

        SendSuccessMessage(playerid, "Ban da huy hai cay can sa thanh cong.");
    }
    else return SendFailMessage(playerid, "Ban khong dang hai can sa.");
    return 1;
}

//test
CMD:tuicansa(playerid, params[])
{
    new string[129];
    format(string, sizeof(string), "Tui can sa: %d la | %d goi ma tuy.", Canabis[playerid], PackCanabis[playerid]);
    SendClientMessage(playerid, -1, string);
    return 1;
}

/*CMD:canabistest(playerid, params[])
{
    Canabis[playerid] = 100;

    return 1;
}*/

CMD:maychebien(playerid, params[])
{
    new string[200];
	for(new i = 0; i < MAX_MACHINE; i++)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 1.0, mInfo[i][mPos][0], mInfo[i][mPos][1], mInfo[i][mPos][2]))
		{
			if(mInfo[i][mHP] < 5) return SendFailMessage(playerid, "May che bien dang phuc hoi, vui long doi.");
			if(mInfo[i][mStats] > 0) return SendFailMessage(playerid, "May che bien nay dang co nguoi khac su dung.");

			format(string, sizeof(string), 
				"{ffffff}Trang thai hoat dong hien tai: {00c220}%d%%{ffffff}\nThoi gian che bien trung binh: 1 - 2 phut\n\
				Yeu cau: 10 la can sa\n(Neu muon bat dau, hay nhan vao 'Bat dau' - huy bo thi nhan vao 'Thoat'", 
				mInfo[i][mHP]);
			Dialog_Show(playerid, DIALOG_M_DIALOG, DIALOG_STYLE_MSGBOX, "May che bien", string, "Bat dau", "Thoat");            
		}
	}
    return 1;
}



Dialog:DIALOG_M_DIALOG(playerid, response, listitem, inputtext[])
{
    if(!response) {
        SendClientMessage(playerid, -1, "Ban da tat may che bien.");

        return 1;
    }

    if(Canabis[playerid] < 10) return SendFailMessage(playerid, "Ban khong du la can sa de che bien.");
	for(new i = 0;i < MAX_MACHINE;i++)
	{
		if(IsPlayerInRangeOfPoint(playerid, 2, mInfo[i][mPos][0], mInfo[i][mPos][1], mInfo[i][mPos][2])) {
			TogglePlayerControllable(playerid, false);
			mInfo[i][mTime] = repeat Reduce(playerid, i);
			mProcessing[playerid] = defer Processing(playerid, i);
			ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.0, 1, 0, 0, 0, 0, 1);
			mInfo[i][mStats] = 1;
		}
	}
    return 0;
}
