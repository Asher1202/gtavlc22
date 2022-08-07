new Iterator:Jobs<MAX_JOBS>, Iterator:Bizs<MAX_BIZ>, Iterator:House<MAX_HOUSES>,
	Iterator:PlayerAdmins<MAX_PLAYERS>,
	Iterator:PlayerHelpers<MAX_PLAYERS>,
	Iterator:HelpersDuty<MAX_PLAYERS>, Iterator:AdminDuty<MAX_PLAYERS>,
	Iterator:PlayerHelped<MAX_PLAYERS>, Iterator:PlayerWanted<MAX_PLAYERS>, 
	Iterator:PlayerYoutuber<MAX_PLAYERS>, Iterator:PlayerGangster<MAX_PLAYERS>,
	Iterator:PlayerInRace<MAX_PLAYERS>, Iterator:GpsBiz<2, MAX_BIZ>,
	Iterator:InTaixiu<MAX_PLAYERS>, Iterator:ChonTai<MAX_PLAYERS>,
	Iterator:ChonXiu<MAX_PLAYERS>,
	Iterator:SelectA<MAX_PLAYERS>,Iterator:SelectB<MAX_PLAYERS>,Iterator:SelectC<MAX_PLAYERS>,
	Iterator:ClanVehicle<MAX_VEHICLES>;
new UsingSampcac[MAX_PLAYERS char];
// #if defined _sampvoice_included
// new SV_SGSTREAM:sgstream[MAX_PLAYERS] = SV_NULL;
// new SV_SGROUP:stream_group;
// #endif
#define MAX_INVENTORY 50
forward Float:GetDistanceBetweenPoints(Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2);
// enum FlameInfo {
// 	Flame_id,
// 	Flame_Exists,
// 	Float:Flame_pos[3],
// 	Smoke[5],
// }
new noooc = 1;
new Text:LottoTD[6],Text:LottoChonSo[35];

new cadouzburator,azisceva,PlayerText:cadouzburatorPTD[1],PlayerBar:cadouBAR[MAX_PLAYERS],
    flamazburator,cadoulbl,Text3D:Cadolabel,cadoulqw[MAX_PLAYERS],dmgdat[MAX_PLAYERS],sfz,graff;
    
new Iterator:TextsOnClient<MAX_PLAYERS, 256>;
new helperChatColor[7];
#define MAX_COMMAND_BLOCKED 20
new 
	Iterator:BlockedCommand<MAX_COMMAND_BLOCKED>,
	BlockReason[MAX_COMMAND_BLOCKED][80],
	CommandBlocked[MAX_COMMAND_BLOCKED][80];
// Declare DMV System
new SelectTD[MAX_PLAYERS], DrivingTest[MAX_PLAYERS];
#define DMV_Next(%1,%2) DMV_BuildMap(%1,%2)
new timeVCarSpawn[MAX_PLAYERS];
new lastVCarSpawn[MAX_PLAYERS];
new const DmvNames[][] = {
	"",
	"The 360",
	"The 180",
	"Whip and terminate",
	"Pop and control",
	"Burn and lap"
};
new
	INT_pvarDmvWest[]			= "520",
	INT_pvarDmvEast[]			= "521",
	INT_pvarDmvLap[]			= "522",
	INT_pvarDmvNext[]			= "523",
	INT_pvarDmvTime[]			= "524",
	INT_pvarDmvVeh[]			= "525";
	
enum
{
	e_Dmv_None,
	e_Dmv_Circle,
	e_Dmv_180,
	e_Dmv_Whip,
	e_Dmv_Pop,
	e_Dmv_Lap,
	e_CP_Dmv,
	e_Area_Dmv
}
new const DmvTimes[] =
{
	"",
	20,
	20,
	15,
	16,
	59
};
// end declare
new cadoumort,cadoulevel,cadoumesaj,collectobject,colectgf[MAX_PLAYERS],cadoumsg,timewaitdead = 0, cadouviatai2,
    cadoubani[MAX_PLAYERS],cadoupp[MAX_PLAYERS],cadourp[MAX_PLAYERS],cadouviatai,Timer:cadoutimer[MAX_PLAYERS],
    parazburator,cadoutimeractiv[MAX_PLAYERS],cadouviata;
//new File:logfile;
new bool:policeHotline = true;
new Timer:DiceTimer[MAX_PLAYERS], Timer:DrivingTestTimer[MAX_PLAYERS];
new Timer:dutyTimer[MAX_PLAYERS];
//for inventory
enum invVariables { invExists, invID, invItem[32], invModel, invQuantity, invAttached, invAttachSlot, invOwnerName, invOwnerID
};
new invData[MAX_PLAYERS][MAX_INVENTORY][invVariables]; // inventory
// new Timer:SpeedBoostTimer[MAX_PLAYERS],
// 	g_fSpeedCap[MAX_PLAYERS];
new CauCaZoneZ[3];
new RandomMSG[][] = {
	"Neu ban can tro giup, dung ngan ngai su dung lenh (/n) va nguoi tro giup se giup ban trong thoi gian ngan nhat.",
	"Ban thay mot nguoi choi su dung hack/cheat, su dung (/report) va mot quan tri vien se xu ly (hoac ban co the bandicam).",
	"Ban la mot tay sung gioi? Hay chung minh dieu do o dau truong Paintball. (/gps)",
	// "Ban can duoc cap giay phep? Su dung (/dichvu giaovien) de goi mot giao vien",
	"Ban muon xem nhiem vu hang ngay cua ban? Hay di den NPC Asher o spawn",
	// "Ban muon gia nhap mot to chuc nao do? Su dung lenh (/tochuc) de xem danh sach to chuc.",
	"Ban can mot chiec xe de di cau ca? Su dung lenh (/muaxe) khi ban dang o Dealership.",
	"Su dung lenh (/gps) de dinh vi cac dia diem quan trong o San Andreas.",
	"Ai do lam ban cam thay kho chiu? Su dung lenh (/hopdong) de thue mot hitman pem sml no!",
	"Hay tham gia cac bang dan canh sat hoac toi pham de co mot cuoc choi cua rieng ban",
	// "Ban co du may man de chien thang? Hay den song bac, noi ban co the choi Dice hoac Go Mim",
	"Chi leader LSPD moi co the ban giay phep sung cho ban, hay tim den ho",
	"Trung tam CNN la noi tap trung cua ca server, ban co the den do de quang cao. Shop xe cung gan do",
	//"Hay hoan thanh cac thanh tuu (/thanhtuu) de nhan xu va tien.",
	"Cap treo se giup ban len/xuong dinh nui Chiliad de dang, tren nui con co nhay du do.",
	"Khi phat hien bug hay bao cao den admin Asher hoac muc bao-loi tai discord gtavlc.com nhe."
	// "Ban muon xem thong tin cua minh? Su dung lenh (/thongtin).",
	// "Ban co muon dong gop y kien cho chung toi khong? Dung ngan ngai dang mot chu de o muc 'Dong gop' tren dien dan cua chung toi. (/forum)",
	// "Ban bi lac duong? Ban khong biet di ve dau, hay su dung (/dichvu taxi).. biet dau se co mot chi taxi den don ban.",
};
new 
	RocketExplosions[MAX_PLAYERS][5], 
    Rocket[MAX_PLAYERS][5], 
    RocketLight[MAX_PLAYERS][5], 
    RocketSmoke[MAX_PLAYERS][5],
    Float:Frx[MAX_PLAYERS][5], 
    Float:Fry[MAX_PLAYERS][5], 
    Float:Frz[MAX_PLAYERS][5],
    fireWork[MAX_PLAYERS][2],
    TriviaText[80],
    FastEventText[64],
    TEvent, TEventReward,
    bool: MathEvent_Active = false, MathEvent_Result = 0, tev, Timer:TDCashTimer[MAX_PLAYERS];

new 
	Timer: FishTimer[MAX_PLAYERS],
	Timer: taxiBarTimer,
	#if defined _nex_ac_included
	Timer: SetSpawnTimer[MAX_PLAYERS],
	#endif
	Timer: countTimer,
	//pFishess[MAX_PLAYERS],
	pFishing[MAX_PLAYERS],
	FishPrice[MAX_PLAYERS],
	JobCP[MAX_PLAYERS],
	// Flame[MAX_FIRES][FlameInfo],
	// Iterator:iFlame<MAX_FIRES>,
	// PlayerFireTimer[MAX_PLAYERS][3], // Burn, StopBurn, Extinguish a fire
	// Float:PlayerOnFireHP[MAX_PLAYERS],
	// Timer:logina[MAX_PLAYERS],
	SpamTimes[MAX_PLAYERS],
	PlayerText: HPAlert,
	togjob[MAX_PLAYERS],
	//showgoal[MAX_PLAYERS],
	togalert[MAX_PLAYERS],
	WorkingTime[MAX_PLAYERS],
	Float: CheckpointPos[MAX_PLAYERS][3],
	PlayerText: CpTDD,
	PlayerText: HudTD[2],
	PlayerText: AchivPTD[1],
	Text: AchivTD[2],
	PlayerText: CasinoPTD[33],
	Text: CasinoTD[15],
	MineActive[MAX_PLAYERS][30],
	MineBomb[MAX_PLAYERS][30],
	Text3D:deathLabel[MAX_PLAYERS],
	Text3D:reputationLabel[MAX_PLAYERS],
	JobLeftTime[MAX_PLAYERS],
	PlayerBar:HudProgress[2],
	PlayerBar:jProgress[MAX_PLAYERS],
	Actor1,//24/7
	Actor2,//gunshop
	Actor3,//sexshop
	QuestActor,
	WoodObject[MAX_PLAYERS][7],
	EnableBoast[MAX_PLAYERS],
	Text: CSTD,
	playerKills[MAX_PLAYERS],
	beachlink[64] = "https://goo.gl/TW1aHi",
	gtm, Timer:TimerRainCar[MAX_PLAYERS],
	Flash[MAX_VEHICLES],
	Timer:FlashTime[MAX_VEHICLES],
	UsedFly[MAX_PLAYERS], 
	PlayerText: ShowMoneyPlus,
	Countnr, Float: VipPos[3], VipText;
	//PlayerText: GoalPTD,Text: GoalTD[4];

//
new Float: TeroSpawn[20][3] = {
{-1462.79749, 1494.47168, 8.31048},
{-1462.79749, 1491.72754, 8.31050},
{-1462.79749, 1488.62390, 8.31050},
{-1462.79749, 1485.20251, 8.31050},
{-1465.54187, 1494.47168, 8.31050},
{-1465.54187, 1491.72754, 8.31050},
{-1465.54187, 1488.62341, 8.31050},
{-1465.54187, 1485.20251, 8.31050},
{-1467.94128, 1494.47168, 8.31050},
{-1467.94177, 1491.72754, 8.31050},
{-1467.94177, 1488.62341, 8.31050},
{-1467.94177, 1485.20251, 8.31050},
{-1470.20227, 1494.47168, 8.31050},
{-1470.20227, 1491.72754, 8.31050},
{-1470.20227, 1488.62341, 8.31050},
{-1470.20227, 1485.20251, 8.31050},
{-1472.57214, 1494.47168, 8.31050},
{-1472.57214, 1491.72754, 8.31050},
{-1472.57214, 1488.62341, 8.31050},
{-1472.57166, 1485.20251, 8.31050}
};

new Float: CTSpawn[20][3] = {
{-1371.68713, 1484.32324, 11.05502},
{-1371.68713, 1486.77112, 11.05500},
{-1371.68713, 1489.25610, 11.05500},
{-1371.68713, 1491.74536, 11.05500},
{-1371.68713, 1494.24756, 11.05500},
{-1369.81812, 1484.32324, 11.05500},
{-1369.81812, 1486.77112, 11.05500},
{-1369.81812, 1489.25610, 11.05500},
{-1369.81812, 1491.74536, 11.05500},
{-1369.81812, 1494.24756, 11.05500},
{-1368.06531, 1484.32324, 11.05500},
{-1368.06531, 1486.77112, 11.05500},
{-1368.06531, 1489.25610, 11.05500},
{-1368.06531, 1491.74536, 11.05500},
{-1368.06531, 1494.24756, 11.05500},
{-1366.54346, 1484.82324, 11.05500},
{-1366.54346, 1486.77112, 11.05500},
{-1366.54346, 1489.25610, 11.05500},
{-1366.54346, 1491.74536, 11.05500},
{-1366.54346, 1494.24756, 11.05500}
};

#define TEAM_TERRORIST 	1
#define TEAM_CTERRORIST 2

#define LOG_SHOP 		1
#define LOG_SELLCAR 	2
#define LOG_TRADE 		3
#define LOG_MONEY 		4
#define LOG_CAR 		5
#define LOG_GIFTBOX 	6 
#define LOG_LEVEL 		7
#define LOG_SELL		8
#define LOG_CHAT		9
#define LOG_REFUND		10
#define LOG_TRANSFER    11
#define LOG_GIFTCODE    12
#define LOG_CASINO		13
#define LOG_DEPOSIT		14 // log nay ghi lai lich su gui thuoc phien/vatlieu/tien cua gangster
#define LOG_BIZ			15
#define LOG_JOB_HACK	16

#define MAX_MINIGAMES 	3	
#define MAX_MAPS 		6
#define MAX_PICKUPSW 	2000
#define MAX_FURNITURE 	80000
#define MAX_CLANS 		500	//500

#define RC_BANDIT     441
#define RC_BARON  	  464
#define RC_GOBLIN  	  501
#define RC_RAIDER     465
#define D_TRAM		  449
#define RC_MINITANK   564
#define RC_CAM		  594

#define AdmBot 		  -1
#define KICK 		  1
#define BAN 		  2
#define JAIL 		  3
#define WARN 		  4
#define MUTE 		  5



#define function%0(%1) forward %0(%1); public %0(%1) // Shortcut
#define		FORMAT:%0(%1)		format(%0, sizeof(%0), %1)
#define ResetMoneyBar    ResetPlayerMoney
#define UpdateMoneyBar   GivePlayerMoney

#define RATE_INC (500)
#define RATE_MAX (2500)
#define THRESOLD_ACTION 1
#define STR 100
// #define MAX_NPCS 20
#define AdminOnly "* Ban khong du quyen han de su dung lenh nay!"
#define SetPlayerHoldingObject(%1,%2,%3,%4,%5,%6,%7,%8,%9) SetPlayerAttachedObject(%1,MAX_PLAYER_ATTACHED_OBJECTS-1,%2,%3,%4,%5,%6,%7,%8,%9)
#define StopPlayerHoldingObject(%1) RemovePlayerAttachedObject(%1,MAX_PLAYER_ATTACHED_OBJECTS-1)
#define IsPlayerHoldingObject(%1) IsPlayerAttachedObjectSlotUsed(%1,MAX_PLAYER_ATTACHED_OBJECTS-1)
#define SpeedCheck(%0,%1,%2,%3,%4) floatround(floatsqroot(%4?(%0*%0+%1*%1+%2*%2):(%0*%0+%1*%1) ) *%3*1.8)
#define ATTACK_TYPE_PLAYERID 1
#define ATTACK_TYPE_IP 2
#define erase(%0)                           (%0[0]='\0')
// PRESSED(keys)
#define PRESSED(%0) \
	(((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
#define RELEASED(%0) \
	(((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))

function Kick_Ban ( playerid, bool: kickban ) return ( !kickban ) ? Kick ( playerid ) : Ban ( playerid );
#define KickEx(%1) 			SetTimerEx ( "Kick_Ban", 500, false, "ii", %1, false )
#define Ban(%1) 			SetTimerEx ( "Kick_Ban", 500, false, "ii", %1, true )
	
// COLOR
#define COLOR_DARKNICERED 	0x9D000096
#define TEAM_RADIO_COLOR 	0xF2D068FF
#define COLOR_LIGHTGREEN 	0x9ACD32AA
#define COLOR_CHATBUBBLE    0xFFFFFFCC
#define COLOR_LIGHTBLUE 	0x00C3FFFF
#define COLOR_LIGHTRED 		0xFF6347FF
#define COLOR_LGREEN 		0xD7FFB3FF
#define COLOR_ORANGE		0xFFA500FF
#define COLOR_GOLD		  	0xFFB95EFF
#define COLOR_MONEY 		0x4dad2bFF
#define COLOR_CLIENT		0xA9C4E4FF
#define COLOR_SERVER		0x5F9CC9FF
#define COLOR_WARNING 		0xDE1414FF
#define COLOR_ADMCHAT 		0xFFC266AA
#define COLOR_GRAD1 		0xB4B5B7FF
#define COLOR_GRAD2 		0xBFC0C2FF
#define COLOR_GRAD3 		0xCBCCCEFF
#define COLOR_GRAD4 		0xD8D8D8FF
#define COLOR_GRAD5 		0xE3E3E3FF
#define COLOR_GRAD6 		0xF0F0F0FF
#define COLOR_GREY 			0xAFAFAFAA
#define COLOR_GREEN 		0x33AA33AA
#define COLOR_RED 			0xFF0000FF
#define COLOR_NEWS 			0xFFA500AA
#define COLOR_LOGIN 		0x00D269FF
#define COLOR_DEPAR 		0x4646FFFF
#define COLOR_YELLOW 		0xFFFF00FF
#define COLOR_WHITE 		0xFFFFFFFF
#define COLOR_FADE1 		0xE6E6E6E6
#define COLOR_FADE2 		0xC8C8C8C8
#define COLOR_FADE3 		0xAAAAAAAA
#define COLOR_FADE4 		0x8C8C8C8C
#define COLOR_FADE5 		0x6E6E6E6E
#define COLOR_PURPLE 		0xC2A2DAAA
#define COLOR_DBLUE 		0x2641FEAA
#define COLOR_ALLDEPT 		0xFF8282AA
#define COLOR_NEWS 			0xFFA500AA
#define COLOR_DEPART 		0xFF8040FF
#define COLOR_DEPART2 		0xff3535FF
#define COLOR_LOGS 			0xE6833CFF
#define COLOR_GAMEGTA		0xFF3A3AFF
// WALKSTYLE
// #define WALK_DEFAULT    0
// #define WALK_NORMAL     1
// #define WALK_PED		2
// #define WALK_GANGSTA    3
// #define WALK_GANGSTA2   4
// #define WALK_OLD		5
// #define WALK_FAT_OLD    6
// #define WALK_FAT		7
// #define WALK_LADY      	8
// #define WALK_LADY2      9
// #define WALK_WHORE      10
// #define WALK_WHORE2     11
// #define WALK_DRUNK     	12
// #define WALK_BLIND     	13

#define maxobj 					50
#define Spam_MaxMsgs    		4
#define MAX_string 				255
#define CHECKPOINT_NONE 		0
#define CHECKPOINT_HOME 		12
#define CHECKPOINT_LOCATE   	53
#define KEY_HANDBRAKE 			(128)
#define SCMTA SendClientMessageToAll

const 
	KEY_VEHICLE_FORWARD  = 0b001000,
	KEY_VEHICLE_BACKWARD = 0b100000;

// End
new Float: QuestPos[100][3] = {
{1858.9993,-1870.6392,13.5131},
{1733.5684,-2149.5691,13.5546},
{1682.7852,-2281.0715,13.5076},
{1450.5886,-2286.6755,13.5469},
{1882.3801,-2543.3186,17.2344},
{2239.4392,-2276.4561,13.5469},
{2358.1301,-2291.3511,17.4219},
{2787.7764,-2418.1592,13.6337},
{2752.5803,-2227.2847,16.1875},
{2963.1028,-1877.7656,8.7813},
{2865.3794,-1587.2225,22.3410},
{2850.0391,-1138.6266,11.8295},
{2432.0115,-1001.2343,55.6010},
{2799.6687,-1086.7782,30.7188},
{2545.1606,-958.7502,82.3221},
{1997.2645,-981.4558,39.4063},
{1885.9611,-1113.7347,26.2758},
{1534.6138,-884.1191,55.5263},
{1277.0469,-805.6503,86.1230},
{1100.9272,-823.8790,114.4477},
{836.4918,-749.7053,87.5433},
{487.6459,-1158.8927,71.6316},
{299.9515,-1154.7875,81.1924},
{164.4293,-1313.9591,69.7402},
{-82.7017,-1577.4066,2.6107},
{-246.2803,-1377.1265,10.2336},
{-386.1671,-1438.7471,26.3203},
{59.2705,-1532.9180,8.7383},
{154.4872,-1959.3636,3.7734},
{364.9142,-2061.1208,15.3970},
{592.4697,-1937.3873,2.9978},
{837.7682,-2425.6772,12.8217},
{1058.2996,-2330.2188,12.9360},
{1026.8030,-2179.4893,40.4760},
{1547.1716,-1686.3011,13.9214},
{1580.3149,-1634.2443,13.5623},
{1479.8187,-1637.7991,14.1484},
{1523.8279,-1111.1625,20.8606},
{1460.6782,-1014.0048,61.1703},
{1204.6970,-1069.0800,29.2467},
{1000.1510,-1012.5242,41.4819},
{1047.2052,-902.6487,42.7112},
{2537.2168,-1663.0032,15.1620},
{2463.7036,-1712.7206,13.4999},
{2355.0764,-1553.1392,24.0131},
{2474.9810,-1460.3873,24.0083},
{1974.6108,-1199.1151,17.4603},
{1653.7598,-1074.6399,23.8984},
{1830.3889,-1149.7450,23.8565},
{1672.9972,1447.9708,10.7867},
{1323.9818,1536.6636,14.8724},
{1339.7915,1862.1827,10.8203},
{1556.1316,1861.2395,10.8203},
{1636.3840,1145.6176,10.8052},
{1088.4218,1077.7430,10.8382},
{1098.5370,1453.1056,5.8203},
{1061.6689,2203.1790,10.8130},
{956.7428,2271.4382,11.4688},
{1768.5604,2819.6274,8.3359},
{2008.8969,2915.2661,51.6622},
{2745.3914,2764.1375,10.8203},
{2807.2944,2579.2644,10.8203},
{2852.3193,2353.2422,10.8203},
{2781.7798,1969.0142,10.8203},
{2428.2439,1812.2778,38.8203},
{2633.2161,1824.1987,11.0234},
{2482.9937,1527.2271,11.2841},
{2865.2012,1500.9086,10.8203},
{2767.0400,587.9490,8.2898},
{2293.5903,529.8326,1.7944},
{1931.7574,702.7258,11.1328},
{1664.6989,719.2198,10.8203},
{1451.2321,751.2849,30.8748},
{1217.3845,1812.5787,13.9616},
{1053.2185,2191.1755,10.8203},
{766.4883,2060.5303,6.7109},
{833.8460,2475.6465,29.8350},
{1209.0503,2796.5740,10.8203},
{1490.0874,2773.5872,10.8203},
{2405.1934,2574.0334,21.8750},
{2283.4619,2449.9292,46.9775},
{1782.1017,679.3298,16.6271},
{2287.0813,713.3549,11.1006},
{2020.0272,1007.8423,10.8203},
{2167.6687,983.7078,10.7199},
{2183.1045,1285.8475,43.0419},
{2323.5796,1283.3020,97.5007},
{2435.3127,1662.5419,15.6387},
{2729.8181,2684.7236,59.0234},
{2080.5022,2175.9653,10.8203},
{1477.3824,1715.2936,10.8125},
{1905.1387,1521.4689,13.8994},
{1952.9078,1342.8202,15.3672},
{2263.4702,1398.9385,42.8203},
{2328.8755,1412.6538,42.8203},
{2820.6396,2269.3220,10.8203},
{2085.9971,2485.7451,11.0781},
{1096.5715,2234.0349,19.7628},
{1108.3436,1529.8019,52.4034},
{1580.9037,946.5978,10.8571}
};

new Float: WoodPos[25][3] = {
{-2080.6589,-2352.0583,30.6250},
{-2090.3813,-2359.2234,30.6250},
{-2080.6267,-2366.2263,30.6250},
{-2084.4617,-2395.8811,30.6250},
{-2079.1543,-2407.7314,30.6250},
{-2069.2598,-2416.7795,30.6250},
{-2056.5239,-2415.7183,30.6250},
{-2064.2280,-2424.7310,30.6250},
{-2044.4685,-2423.2820,30.6250},
{-2034.7296,-2416.2258,30.6250},
{-2035.5292,-2431.3301,30.6250},
{-2041.2988,-2447.1301,30.6318},
{-2045.4866,-2457.7549,30.6250},
{-2038.4133,-2457.7739,30.8676},
{-2039.0967,-2467.7046,30.8317},
{-2040.0582,-2479.5667,30.7769},
{-2029.5667,-2479.5552,31.5701},
{-2004.0968,-2464.2830,31.2278},
{-2000.3463,-2449.8284,30.5955},
{-1989.9965,-2460.7810,30.8249},
{-1920.5813,-2466.3823,30.9497},
{-1925.5699,-2486.3115,31.4246},
{-1912.6442,-2492.8213,32.4932},
{-1936.5726,-2418.2571,30.6250},
{-1949.2281,-2410.2532,30.6250}
};

// important
new StaffMotd[180], NearWanted[MAX_PLAYERS];

new 
	VehicleOwned[MAX_VEHICLES],
	VehicleSQL[MAX_VEHICLES],
	VehicleExist[MAX_VEHICLES];

// // fire
// new 
// 	playerFire[MAX_PLAYERS],
// 	ActiveFire,
// 	ActiveFires;

new
	// Local
	ServerAccounts, MaxPlayers, Float:g_SpeedThreshold,			MaxPlayersDate[22], Sondaj[180], SondajTime, Timer:SondajTimer,  SondajVotes[2], 
	StuntPickup, painttime, areape,			alhamusic[100], ServerWeather,				
	RestartPayday, Paydaydat, StartDate[256], 					FactionMembers[MAX_FACTIONS+1],	ClanMembers[MAX_CLANS], ClanVehicles[MAX_CLANS],
	bussines, sbiss, turfsss, facs, jobss,
		
	ActiveEvent, EventType, EventMoney, 	EventTime, InEvent[MAX_PLAYERS],			EventBy, GateStatus,
	furnitures = mS_INVALID_LISTID,			fskins[15] = mS_INVALID_LISTID,				cobj = mS_INVALID_LISTID, skinlist = mS_INVALID_LISTID,
	Licitatie, TimpLicitatie, 				TipLicitatie, TotalBani, IDLicitatie, 		LastPlayer, 
	QuestDeelay[MAX_PLAYERS],
	GiftMoney, GiftRP, GiftGold, 			GiftLevel, GiftFP, GiftVehicle, 			PhienTaiXiu,			RestartTime, //QuestPickup[30],
	PaintballWinnerScore[3], 				PaintballWinner[3], 
	PaintTime[3] = -1,						EventStatus, EventVW, EventInt,				gatelvpd[3],								TimpMateriale[MAX_PLAYERS],
	
	ghour = 0,   			gminute = 0, gsecond = 0, 					dollah = 100000, realtime = 1,
	wotime = 15, levelcost = 2000,			realchat = 1, 								levelexp = 3,
	FactionChat[16], Questions, 			Tax, TaxValue, cell2,gatelspd,gateds[2],				gateng,lspdbar, 	
	// Global	
	DISABLEREG,
	LamViecChung[MAX_PLAYERS],				DaThueThuyen[MAX_PLAYERS],
	NearPNS[MAX_PLAYERS],					pickups,									pizzamoney[MAX_PLAYERS],						
	WarKills[MAX_PLAYERS],  				WarDeaths[MAX_PLAYERS],						Aduty[MAX_PLAYERS],
	Exception[MAX_PLAYERS char],			ThuySan[MAX_PLAYERS],		
	playerObject[MAX_PLAYERS],				playerObject2[MAX_PLAYERS],					PinText[MAX_PLAYERS][30],
	TradeID[MAX_PLAYERS], 					TradeItems[MAX_PLAYERS], 					TradeReady[MAX_PLAYERS],
	Escape[MAX_PLAYERS], 					Escape2[MAX_PLAYERS], 						EscapeProces[MAX_PLAYERS],
	Question[MAX_PLAYERS], 					QuestText[MAX_PLAYERS][256], 				InTraining[MAX_PLAYERS], 
	SelectedFaction2[MAX_PLAYERS][20],		SFID[MAX_PLAYERS], Showed[MAX_PLAYERS],		SpecClan[MAX_PLAYERS], Refueling[MAX_PLAYERS],
	LastCP[MAX_PLAYERS],					Blocked[MAX_PLAYERS+1][MAX_BLOCKED_USER][MAX_PLAYER_NAME+30],				FreezeTime[MAX_PLAYERS], gPlayerSpawned[MAX_PLAYERS],
	MDCOn[MAX_PLAYERS],						FactionDeelay[MAX_FACTIONS],				CheatWarnings[MAX_PLAYERS], MedicCall[MAX_PLAYERS],
	TurfTime[MAX_PLAYERS],					eventorganizer[MAX_PLAYERS],				requestingevent[MAX_PLAYERS],
	requestingtitle[MAX_PLAYERS][50],		requestinglocation[MAX_PLAYERS][50],		requestingdescription[MAX_PLAYERS][100],
	requestingprize[MAX_PLAYERS],			requestingtime[MAX_PLAYERS][50],			activeevent, eventtitle[50], eventlocation[50],
	eventdescription[100], 					eventprize,	eventtime[50],					InstructorCall[MAX_PLAYERS], License[MAX_PLAYERS], 
	LicenseOffer[MAX_PLAYERS],				togclan[MAX_PLAYERS],						nameobject[MAX_VEHICLES], Contract[MAX_PLAYERS],
	gPlayerUsingLoopingAnim[MAX_PLAYERS],   gPlayerAnimLibsPreloaded[MAX_PLAYERS], 		UsedContract[MAX_PLAYERS], PlayerHit[MAX_PLAYERS],
	TradePlayer[MAX_PLAYERS], 				TradeMoney[MAX_PLAYERS], 					TradeType[MAX_PLAYERS], 
	SelectedHud[MAX_PLAYERS],				PlayRadio[MAX_PLAYERS], 					Helmet[MAX_PLAYERS],
	ShowWanted[MAX_PLAYERS], 				Timer: ReportTimer[MAX_PLAYERS],			DiceMoney[MAX_PLAYERS], DiceID[MAX_PLAYERS],
	WarSeconds[MAX_PLAYERS],				TradeTime[MAX_PLAYERS],						TotalMoney[MAX_PLAYERS],
	Reply[MAX_PLAYERS],						VehicleKey[MAX_PLAYERS],					LicenseDays[MAX_PLAYERS],
	Freezed[MAX_PLAYERS],					SpecFaction[MAX_PLAYERS],
	//WTimes[MAX_PLAYERS],		
	BurgerOffer[MAX_PLAYERS],			
	AFKSeconds[MAX_PLAYERS],				HeadValue[MAX_PLAYERS],						BurgerAmount[MAX_PLAYERS],	BurgerMoney[MAX_PLAYERS],
	AcceptedBy[MAX_PLAYERS],				DiceInvited[MAX_PLAYERS], 					InDice[MAX_PLAYERS], PlayWith[MAX_PLAYERS],
	InRob[MAX_PLAYERS], 					BizRobbed[MAX_PLAYERS], 					Bags[MAX_PLAYERS], SafeTime[MAX_PLAYERS], 
	SafeRTime[MAX_PLAYERS], 				HaveBag[MAX_PLAYERS], 						BagTime[MAX_PLAYERS],
	LastRVehicle[MAX_PLAYERS],				toglicitatie[MAX_PLAYERS],					InvitedFaction[MAX_PLAYERS], Invited[MAX_PLAYERS],
	Team[MAX_PLAYERS], 								
	SpecPlayers[MAX_PLAYERS], 				IsPlayerSpec[MAX_PLAYERS],
	PaintType[MAX_PLAYERS],  				PKills[MAX_PLAYERS], 						PDeaths[MAX_PLAYERS],  
	Timer:PaintTimer[MAX_MINIGAMES], 				PaintMap[MAX_MINIGAMES], 					MapVotes[MAX_MINIGAMES][MAX_MAPS], PaintVote[MAX_MINIGAMES], 
	Voted[MAX_PLAYERS], 					PaintText[MAX_MINIGAMES],					DutyAFK[MAX_PLAYERS], StartFish[MAX_PLAYERS],
	FishingKey[MAX_PLAYERS],	Fishing[MAX_PLAYERS], Timer:TimeOut[MAX_PLAYERS], Times[MAX_PLAYERS],
	KG[MAX_PLAYERS], 						JobSeconds[MAX_PLAYERS],					AdText[MAX_PLAYERS][180], Timer:AdTimer[MAX_PLAYERS],
	// SecondsQuestion[MAX_PLAYERS], 			
	HaveHelp[MAX_PLAYERS], 						HelperDuty[MAX_PLAYERS], NewbieChat[MAX_PLAYERS], HaveHelper[500], OnHelper[MAX_PLAYERS],
	HelpMuted[MAX_PLAYERS], 				Ajutor[MAX_PLAYERS],						Helped[MAX_PLAYERS], HelpText[MAX_PLAYERS][180],
	LastRecon[MAX_PLAYERS], 				//UsedFly[MAX_PLAYERS],						
	JobTime[MAX_PLAYERS], 					WantedTime[MAX_PLAYERS], LastCar[MAX_PLAYERS], 
	SlotSel[MAX_PLAYERS],					EditedObjectID[MAX_PLAYERS], 				SelMobila[MAX_PLAYERS][101],	 ObjectEdited[MAX_PLAYERS], EditHouse[MAX_PLAYERS], EditModel[MAX_PLAYERS],
	SelectedRank[MAX_PLAYERS],				pColor1[MAX_PLAYERS], pColor2[MAX_PLAYERS],
	pCar[MAX_PLAYERS], 						pCarID[MAX_PLAYERS],						togding[MAX_PLAYERS], togsurf[MAX_PLAYERS], 
	InShop[MAX_PLAYERS],					ClanDuty[MAX_PLAYERS], 						StartedSpray[MAX_PLAYERS], StartedSpray2[MAX_PLAYERS], StartedSprayOn[MAX_PLAYERS], ClanProces[MAX_PLAYERS],
	szRank[MAX_PLAYERS][180],				pName[MAX_PLAYERS][180],					Selected[MAX_PLAYERS][50][180], pInteriorID[MAX_PLAYERS], pVirtual[MAX_PLAYERS],
	pDrunkLevelLast[MAX_PLAYERS],			FPS2[MAX_PLAYERS],                          togdice[MAX_PLAYERS],
	MoneyEarned[MAX_PLAYERS],			 	CurseFacute[MAX_PLAYERS],					GunoiKG[MAX_PLAYERS],
	JobWorking[MAX_PLAYERS],				JobVehicle[MAX_PLAYERS], 					Trailer[MAX_PLAYERS], 
	// TruckerStep[MAX_PLAYERS],
	EditJob[MAX_PLAYERS],					EditJobID[MAX_PLAYERS],						togevent[MAX_PLAYERS],
	// Timer:DSTimer[MAX_PLAYERS], 			TestingModel[MAX_PLAYERS],					DealerCarType[MAX_PLAYERS], SelectedCar[MAX_PLAYERS][150], TotalDealerCars[MAX_PLAYERS], LastDealerCar[MAX_PLAYERS],
	// DealerCar[MAX_PLAYERS], 				DealerCategory[MAX_PLAYERS],				DealerCarColor1[MAX_PLAYERS], DealerCarColor2[MAX_PLAYERS], Float:DealerCarAngle[MAX_PLAYERS],
	DealerID[MAX_PLAYERS], 					isInInven[MAX_PLAYERS],				playerDialogID[MAX_PLAYERS],
	sVehicle[10][MAX_PLAYERS],				neon[2][MAX_VEHICLES], sSlot[MAX_PLAYERS],  InvitedClan[MAX_PLAYERS], InvitedBy[MAX_PLAYERS],
	CarRadio[MAX_VEHICLES],	CarLink[MAX_VEHICLES][180],
	SelectedFaction[MAX_PLAYERS],			SelectedMoney[MAX_PLAYERS],					PlayerSellCar[MAX_PLAYERS], SelectedItem[MAX_PLAYERS],
	AcceptedService[MAX_PLAYERS],			TaxiService[MAX_PLAYERS], 					tograport[MAX_PLAYERS],
	AcceptedTaxiService[MAX_PLAYERS],		Fare[MAX_PLAYERS],					  		TaxiDriver[MAX_PLAYERS], TaxiDuty[MAX_PLAYERS], TaxiMoney[MAX_PLAYERS],
	Timer:TaxiTimer[MAX_PLAYERS],			RentPrice[MAX_PLAYERS],						SeifID[MAX_PLAYERS], SelectedPlayers[MAX_PLAYERS][50],
	AcceptedReport[MAX_PLAYERS],			ServerSystem[MAX_SYSTEMS],
	Weapons[MAX_PLAYERS][47], 				WeaponAmmo[MAX_PLAYERS][47],				ThuyenSpawn[MAX_VEHICLES], XeNewbie[MAX_VEHICLES],
	SondajVote[MAX_PLAYERS], 				EmailID[MAX_PLAYERS][10], 					KillP[MAX_PLAYERS],DeathP[MAX_PLAYERS], tuningenter[MAX_PLAYERS],
	shotTime[MAX_PLAYERS], 					shot[MAX_PLAYERS], WantedName[MAX_PLAYERS][180], WantedReason[MAX_PLAYERS],
	Timer:WantedTimer[MAX_PLAYERS], 				Wartimeon[MAX_PLAYERS], 					taxim[MAX_PLAYERS], towcarm[MAX_PLAYERS], toglc[MAX_PLAYERS], Carspawn[MAX_VEHICLES], togvip[MAX_PLAYERS],
	Dicem[MAX_PLAYERS], 					balem[MAX_PLAYERS], 					 	SpamCheck[MAX_PLAYERS],
	radiop[MAX_PLAYERS], 					radio[MAX_PLAYERS], 						Timer:login[MAX_PLAYERS], Speedlimit[MAX_PLAYERS], togip[MAX_PLAYERS], tazer[MAX_PLAYERS], XDeaths[MAX_PLAYERS],
	LastDeath[MAX_PLAYERS], 				playerDeath[MAX_PLAYERS], 					Timer:drug[MAX_PLAYERS], bizid[MAX_PLAYERS], bizprice[MAX_PLAYERS], biztype[MAX_PLAYERS], bizoffer[MAX_PLAYERS],
	Timer:TimerAtuPlayer[MAX_PLAYERS], 			Cash[MAX_PLAYERS], 							SwitchKey[MAX_PLAYERS], togfind[MAX_PLAYERS], IsSmoking[MAX_PLAYERS], //WalkStyle[MAX_PLAYERS],
	targetfind[MAX_PLAYERS], 				InHouse[MAX_PLAYERS], 						InBussines[MAX_PLAYERS], InHQ[MAX_PLAYERS], WTToggle[MAX_PLAYERS], WTChannel[MAX_PLAYERS] = 0, arrestcop[MAX_PLAYERS] = -1,
	UsingDrugs[MAX_PLAYERS], 				vehEngine[MAX_VEHICLES], 					AcceptOffer[MAX_PLAYERS], AcceptPrice[MAX_PLAYERS], FreeOffer[MAX_PLAYERS], FreePrice[MAX_PLAYERS], MatsOffer[MAX_PLAYERS],
	MatsPrice[MAX_PLAYERS], 				MatsAmmo[MAX_PLAYERS], 						SellgunOffer[MAX_PLAYERS], SellgunPrice[MAX_PLAYERS], SellgunMats[MAX_PLAYERS], SellgunAmmo[MAX_PLAYERS], SellgunID[MAX_PLAYERS],
	HouseID[MAX_PLAYERS], 					HouseOffer[MAX_PLAYERS], 					HousePrice[MAX_PLAYERS], MedicCallTime[MAX_PLAYERS], MechanicCall[MAX_PLAYERS], MechanicCallTime[MAX_PLAYERS], TaxiCall[MAX_PLAYERS],
	TaxiCallTime[MAX_PLAYERS], 				TaxiAccepted[MAX_PLAYERS], 					MedicTime[MAX_PLAYERS], NeedMedicTime[MAX_PLAYERS], RegistrationStep[MAX_PLAYERS], TakingLesson[MAX_PLAYERS], UsedFind[MAX_PLAYERS],
	NoFuel[MAX_PLAYERS], 					MatsHolding[MAX_PLAYERS], 					TicketOffer[MAX_PLAYERS], TicketMoney[MAX_PLAYERS], PlayerStoned[MAX_PLAYERS], ConsumingMoney[MAX_PLAYERS], SpawnChange[MAX_PLAYERS],
	PlayerDrunk[MAX_PLAYERS], 					PlayerDrunkTime[MAX_PLAYERS], GotHit[MAX_PLAYERS], GoChase[MAX_PLAYERS], GetChased[MAX_PLAYERS], OrderReady[MAX_PLAYERS],  ConnectedToPC[MAX_PLAYERS],
	PlayerTied[MAX_PLAYERS], 				PlayerCuffed[MAX_PLAYERS], 					PlayerCuffed2[MAX_PLAYERS], PlayerCuffedTime[MAX_PLAYERS], PlayerTazeTime[MAX_PLAYERS], LiveOffer[MAX_PLAYERS], TalkingLive[MAX_PLAYERS],
	// PlacedNews[MAX_PLAYERS], 				SelectChar[MAX_PLAYERS], 					SelectCharID[MAX_PLAYERS], SelectCharPlace[MAX_PLAYERS], ChosenSkin[MAX_PLAYERS], 
	CP[MAX_PLAYERS],
	RepairOffer[MAX_PLAYERS],  				RepairPrice[MAX_PLAYERS], 					RefillOffer[MAX_PLAYERS], RefillPrice[MAX_PLAYERS], RepairCar[MAX_PLAYERS], Rapairx[MAX_PLAYERS], Refillx[MAX_PLAYERS], TransferOffer[MAX_PLAYERS],
	TransferMoney[MAX_PLAYERS], 			DrugOffer[MAX_PLAYERS], 					DrugPrice[MAX_PLAYERS], DrugGram[MAX_PLAYERS], DrugType[MAX_PLAYERS], JailPrice[MAX_PLAYERS], OnDuty[MAX_PLAYERS],
	gPlayerCheckpointStatus[MAX_PLAYERS],   IsPlayerLogged[MAX_PLAYERS], 				gPlayerLogTries[MAX_PLAYERS], gLastCar[MAX_VEHICLES], gOoc[MAX_PLAYERS], gNews[MAX_PLAYERS], gFam[MAX_PLAYERS],
	BigEar[MAX_PLAYERS], 					Spectate[MAX_PLAYERS],						CellTime[MAX_PLAYERS], HireCar[MAX_PLAYERS], HidePM[MAX_PLAYERS], PhoneOnline[MAX_PLAYERS], TurfsDisp[MAX_PLAYERS], gDice[MAX_PLAYERS],
	FirstSpawn[MAX_PLAYERS], 				Mobile[MAX_PLAYERS], 						PlayerAccount[MAX_PLAYERS],
	DeelayCommand[MAX_PLAYERS][9],			Combo[MAX_PLAYERS],			 				Timer:DMGTimer[MAX_PLAYERS], bool:WeaponData[MAX_PLAYERS][13],
	JobDeelay[MAX_PLAYERS][18],				//EnterInModShop[MAX_PLAYERS],				
	InDeer[MAX_PLAYERS],					Iterator:IsSpeed<MAX_PLAYERS>, 	
	// Textdraws		
	bool:isBoxingOn = false,
	PlayerText: Jailtime,					Text:CountTD2,								
	Text: TradeTD[21],						PlayerText: SpeedTD[4],                     PlayerText: logoptd,
	Text: logotd,							PlayerText:invTD[MAX_PLAYERS][64],
	Text: Logo[4],							Text: EventCS,
	Text: RestartTD,						Text: CountTD,				 			 	Text:HiddTD[7],
	Text: RuletaTD[24], 					Text: RaceTD[11],							Text: PPaydayTDS,					
	Text: ServerTD[3],						Text: HeartTD,								PlayerText:Speedo[2],
	Text: Speedo4,							Text: PinTD[15],							PlayerText:p_HelpBoxTD[MAX_PLAYERS],
	Text:KhungKey,
	Text:GUI_Box1,							Text:GUI_Logo,								Text:GUI_IMG,
	Text:GUI_Name, 							Text:GUI_LBox, 								Text:GUI_Description, 
	PlayerText:Key,							PlayerText:GUI_Exit, 						PlayerText:GUI_Start,

	PlayerText: QuestTD, 					Text: UndercoverTD, 						PlayerText: RacePTD[3], 
	PlayerText: CpTD, 						PlayerText: DMGTD[2],						PlayerText: TradePTD[7],
	PlayerText: TradeIcon[10], 				PlayerText: TradeTitle[10],					PlayerText: JobTD,
	PlayerText: InfosTD,  					PlayerText: ShowTD,
	PlayerText: PaintTD,  					
	
	/*	
	PlayerText: MainColor, 
	PlayerText: BackColorSec,				PlayerText: NextColorSec, 					PlayerText: AirCategory,
	PlayerText: SecColor, 					PlayerText: NextColorMain,					PlayerText: BackColorMain, 
	PlayerText: CarsCategory, 				PlayerText: BikesCategory, 					PlayerText: BoatsCategory, 
	PlayerText: SpecialCategory, 			PlayerText: RotLeft, 						PlayerText: RotRight,  
	PlayerText: BuyModel, 					PlayerText: TestModel,						PlayerText: InfoDS,	
	PlayerText: ExitDS, 					PlayerText: BackCar, 						PlayerText: NextCar,		*/
	PlayerText: FindTD, 					PlayerText: SpectatorTD, 					PlayerText: WantedTD[MAX_PLAYERS],
	PlayerText: CleoTD[2],					PlayerText: HiddTDs[3],
	PlayerText: FareTD, 					PlayerText: TestTD,							PlayerText: DSTds[5], 
	PlayerText: SafeTD,						PlayerText: NearTD,
	PlayerText: WarTime,					PlayerText: FriendTD,						PlayerText: PaydayTD,
	PlayerText: PinPTD[2],                  
	Text3D: GiftText,						
	Text3D:areap,
	//PlayerText: CrateTD,		
	// Vehicles
	ttcgate[2], LCS[45], taxibar,
	scooter[6], rentls[11], rentlv[11],
	// gLastDriver[600], gCarLock[600],
	Gas[MAX_VEHICLES],
	
	// Float
	Float: pPos[MAX_PLAYERS][3],			Float:etp[5], Float: SpecPos[MAX_PLAYERS][3],
	Float: TeleportDest[MAX_PLAYERS][3], 	Float: LastPos[MAX_PLAYERS][3],
	Float: Health[MAX_PLAYERS], 			Float: Armour[MAX_PLAYERS],				
	Float: SpawnPos[4] = {1800.7697,-1866.1295,13.9718,356.6134}, Float: FishPos[3],
	Float: ExamPos[3] = {1220.0709,-1814.4381,16.5938},
	Float: SpawnPos2[4] = {1791.6156,-1866.9568,13.5708,1.6267},
	Float: SpawnPos3[4] = {1808.5251,-1866.6414,13.5821,353.1432},
	TodayJob;
	// CrateTime[MAX_PLAYERS char];
	
new gTeam[MAX_PLAYERS];	
new PlayerText:MoGuong[MAX_PLAYERS][37];
// ENUMS

enum hInfo
{
	hID,
	Float:hEntrancex,
	Float:hEntrancey,
	Float:hEntrancez,
	Float:hExitx,
	Float:hExity,
	Float:hExitz,
	hOwner[25],
	hDiscription[64],
	hValue,
	hPrice,
	hHel,
	hMusic,
	hInterior,
	hInteriorType,
	hLock,
	hOwned,
	hRent,
	hRentabil,
	hTakings,
	hLevel,
	hVirtual
};
new HouseInfo[MAX_HOUSES][hInfo],
	Text3D:HouseLabel[sizeof(HouseInfo)],
	HousePickup[MAX_HOUSES],
	HouseIcon[MAX_HOUSES];

enum bInfo
{
	bID,
    bOwned,
	bOwner[25],
	bMessage[50],
	Float:bEntranceX,
	Float:bEntranceY,
	Float:bEntranceZ,
	Float:bExitX,
	Float:bExitY,
	Float:bExitZ,
	bLevelNeeded,
	bBuyPrice,
	bPrice,
	bEntranceCost,
	bTill,
	bLocked,
	bInterior,
	bVirtual,
	bSbiz,
	bType,
	bRadio,
	bProducts
};
new BizzInfo[MAX_BIZ][bInfo],
	Text3D:BizzLabel[sizeof(BizzInfo)],
	BizzPickup[sizeof(BizzInfo)],
	LSBizNumber[18],
	LVBizNumber[18],
	bizTypeName[][] = {
		"",
		"Bank",	
		"Gun Shop",	
		"Bar",	
		"Sex Shop",
		"Caino",	
		"24/7 Store",
		"Burger Shot",	
		"GYM",
		"Pizza Stack",
		"Rent car", // 10	
		"Clothing Store",
		"Gas Station",
		"Pay N Spray",
		"Clucking Bell", // 14
		"CNN",
		"Car Mod Shop"
	};

enum svInfo {
	vID, vModel,
	Float: vLocation[3],
	Float: vAngle,
	vColor[2],
	vClan,
	vFaction,
	vRank,
	vVirtual,
	vSpawned
}
new ServerVehicles[MAX_SVEHICLES][svInfo];

enum Factions {
	fID,
	fName[32],
	Float:fcX,
	Float:fcY,
	Float:fcZ,
	Float:extX,
	Float:extY,
	Float:extZ,
	fVW,
	fMaxSlot,
	fLevel,
	fInterior,	
	fMats,
	fDrugs,
	fBank,
	fAnn[144],
	fColor,
	fApp,
	fLock,
	Text3D: fLabel,
	fPickup
};
new DynamicFactions[MAX_FACTIONS+1][Factions], fRankNames[MAX_FACTIONS+1][7][17];

enum rbInfo
{
    rbCreated,
    Float:sX,
    Float:sY,
    Float:sZ,
    sObject,
};
new RbInfo[50][rbInfo];

enum ap_info {
    apID,
    Float: apPos[4],
    apOwner[32],
    apUser,
    apValue,
    apLock,
    Text3D:apLabel,
};

new
    apartamentInfo[25][ap_info],
    apartament_door[24],
    apartament_door_status[24];

enum LIST_ANTIFLOOD {
	lastCheck,
	floodRate
}
new AntiFlood_Data[MAX_PLAYERS][LIST_ANTIFLOOD];

enum zInfo
{
    zID,
    zName[35],
    zOwned,
    zTime,
    Float:zMinX,
    Float:zMinY,
    Float:zMaxX,
    Float:zMaxY,
    zTurfDelay
};
new TurfInfo[50][zInfo], Turfs[50];

enum wInfo
{
    wFaction,
	wAttacker,
	wTime,
};
new 
	WarInfo[sizeof(TurfInfo)][wInfo],
	Float: WarScoreF[MAX_FACTIONS+1][sizeof(TurfInfo)],
	ucideri[MAX_PLAYERS][sizeof(TurfInfo)],
	decese[MAX_PLAYERS][sizeof(TurfInfo)],
	worstscoreat[sizeof(TurfInfo)],
	worstmemberat[sizeof(TurfInfo)],
	worstscoredf[sizeof(TurfInfo)],
	worstmemberdf[sizeof(TurfInfo)],
	bestscoreat[sizeof(TurfInfo)],
	bestmemberat[sizeof(TurfInfo)],
	bestscoredf[sizeof(TurfInfo)],
	bestmemberdf[sizeof(TurfInfo)],
	InWarTurf[MAX_FACTIONS+1],
	InWar[MAX_FACTIONS+1];

enum pSpec
{
	Float:Coords[3],
	Float:sPx,
	Float:sPy,
	Float:sPz,
	sPint,
	sLocal,
	sCam,
};
new Unspec[MAX_PLAYERS][pSpec];

enum szInfo {
	szID,
	Float: szX,
	Float: szY,
	Float: szZ,
	szRange
}
new SafeZone[MAX_SAFEZONES][szInfo];

enum objInfo {
	oID,
	oMoney
}
new ObjectInfo[MAX_COBJECTS][objInfo];

enum sInfo {
	sID, 				
	sFactionID,
	Float: sPosX,
	Float: sPosY,		
	Float: sPosZ,
	sMoney,				
	sDrugs,				
	sMaterials,
	sVirtualID
}
new SafeInfo[MAX_FACTIONS+1][sInfo];

enum clInfo {
	clName[40],		 
	clOwner[MAX_PLAYER_NAME],			
	clMotd[180],
	clTag[32],	 
	clTagType, 
	clRankName1[30],		
	clRankName2[30],
	clRankName3[30], 
	clRankName4[30],
	clRankName5[30],	
	clRankName6[30],
 	clColor[7],		 
	clSlots, 
	clRegisterDate[22],		
	clTags, 
	clDays,
	clPoints,
	clVatLieu,
	clMaTuy,
	clMoney
}
new clanss;
enum vInfo {
	vColorOne,
	vColorTwo
};
new VehicleStats[MAX_VEHICLES][vInfo];

enum cInfo {
	cID, 			  
	cModel,
	Float:cLocationx,
	Float:cLocationy, 
	Float:cLocationz, 
	Float:cAngle, 	  
	Float:KM,		 
	Float:cLastPos[3],
	cColorOne,		
	cColorTwo,		
	cOwner[MAX_PLAYER_NAME], 
	cValue, 		  
	cLicense[14], 	
	cAlarm, 
	cLock, 			  
	Userid, 			
	Confiscated, 
	Spawned, 		  
	cSpecial, 	
	cPoints, 
	cTax,
	mod0, mod1, mod2, mod3, mod4, mod5, mod6, mod7, mod8, 
	mod9, mod10, mod11, mod12, mod13, paintjob,
	cFuel, 
	cNeon, 
	cText[16],
	cSlotSung[2], cSlotAmmo[2],
	cTextColor
};

enum pPick {
	psID,
	psType, 
	psWeapon, 
	psAmmo,
	psWar,
	psAmount
}

enum furInfo {
	fiID,      
	fiName[30],
	fiModel,
	Float: fiX,    
	Float: fiY,    
	Float: fiZ,
	Float: fiRotX, 
	Float: fiRotY, 
	Float: fiRotZ,
	fiVirtual,     
	fiHouse,       
	fiObject
}

enum ffInfo {
	fID, 
	fRank1, fRank2, fRank3, 
	fRank4, fRank5, fRank6
}

enum dInfo {
	dID,       dModel,  dPrice,
	// dDoors,    dType,   dStock,
	dType,   dStock,
	dMaxSpeed, dGold
};

enum gfInfo {
	gfID,
	Float:gfX,	 
	Float:gfY,	
	Float:gfZ,
	Float:gfRot, 
	gfOwned,
	gfObject,    
	gfAttacked
}

enum jInfo {
	jID,			
	jName[20],		
	jLevel,
	Float:jPosX, 	
	Float:jPosY, 	
	Float:jPosZ,
	jLegal, 		
	jSkill1Veh,		
	jSkill2Veh,
	jSkill3Veh,		
	jSkill4Veh,		
	jSkill5Veh,
	jSkill6Veh,		
	Text3D: jLabel,	
	jPickup,
	jBonus,
	jAttemptPerHour
}
enum gpInfo {
	gID,
	gName[40],
	Float:gPos[3],
	gCity
};
new
	GraffitiInfo[MAX_CLANZONES+1][gfInfo],
	JobInfo[MAX_JOBS][jInfo],
	FactionInfo[MAX_FACTIONS+1][ffInfo],	
	CarInfo[MAX_CARS][cInfo],
	Pickups[MAX_PICKUPSW][pPick],
	FurnitureInfo[MAX_FURNITURE][furInfo],
	// DSModels[MAX_DSMODEL][dInfo],
	ClanInfo[MAX_CLANS][clInfo];

new Iterator:iPickUp<MAX_PICKUPSW>;
 
 
// new Float: JailPos[3][3] = {
// 	{ 264.5794, 82.0395, 1001.2639 },
// 	{ 264.5510, 77.7887, 1001.2639 },
// 	{ 264.2016, 86.3500, 1001.2639 }
// };

//Default
// new Float: JailPos[6][3] = {
// 	{1913.2332,-1611.3098,1770.7469},{1914.0725,-1607.0884,1770.7469},{1913.9998,-1602.8716,1770.7469},
// 	{1940.0131,-1602.7235,1770.7469},{1939.2504,-1606.9781,1770.7469},{1939.9885,-1611.2113,1770.7469}
// }, 

new const Float:JailPos[3][3]= {
	{264.5794, 82.0395, 1001.2639},
	{264.5510, 77.7887, 1001.2639},
	{264.2016, 86.3500, 1001.2639}
};
new const Float:gRandomAJailSpawns[4][3] = {
	{215.5260,110.5124,1000.0156},
	{219.3602,109.9994,1000.0156},
	{223.3645,109.9972,1000.0156},
	{227.1875,110.2887,1000.0156}
};

new JailGate[12];
enum eTraining {
	factionID, 
	Float:trainingX,
	Float:trainingY,
	Float:trainingZ
}
new Float: Training[][eTraining] = {
	{1,246.4252,88.0092,1003.6406},
	{2,275.5803,188.2351,1007.1719},
	{3,275.5803,188.2351,1007.1719},
	{4,2561.1777,-1291.2654,1054.6406},
	{5,2561.1777,-1291.2654,1054.6406},
	{6,2561.1777,-1291.2654,1054.6406},
	{7,1495.6749,1309.5129,1093.2837},
	{8,613.4427,3.4193,1000.9219},
	{9,-2029.7333,-119.6239,1035.1719},
	{10,2561.1777,-1291.2654,1054.6406},
	{11,-2170.3540,635.3894,1052.3750},
	{12,1727.0537,-1637.8325,20.2229},
	{13,1495.6749,1309.5129,1093.2837},
	{14,2561.1777,-1291.2654,1054.6406},
	{15,246.4252,88.0092,1003.6406}
};
new TodayJobList[] = {1, 2, 3, 4, 5, 7, 9, 10, 11, 12, 13, 14};
new Float: GetMats[2][3] = {
	{1234.9523,-1608.3436,13.5469},
	{-89.1046,-1565.1581,3.0043}
};
new Float: Pizza[4] = {952.4071,-1361.2064,13.3502};
new Float: CPNWork[2][3] = {
	{1795.3198,-2041.5464,13.5369},
	{1766.2644,-2031.6758,13.9027}
};
new Float: gungamePos[3] = {1156.8213,-1475.9633,13.6791};

new 
	playerRacePlace[MAX_PLAYERS],
	RacePlaces[40],
	RacePlayers,
	playerRaceTime[MAX_PLAYERS],
	RaceTimer,
	Voted2[MAX_PLAYERS],
	RacePlace,
	RaceVotes[6],
	RaceTime,
	RaceMap,
	RaceStarted,
	RaceBet[MAX_PLAYERS],
	RaceVehicle[MAX_PLAYERS],
	SelCar[MAX_PLAYERS],
	RaceCP[MAX_PLAYERS],
	RaceColor[MAX_PLAYERS][2];
	
new Float: RaceMap1[][3] = {
	{340.2688, 2504.4858, 15.7024},
	{139.6978, 2505.4233, 15.7024},
	{-127.4715, 2465.9478, 13.7585},
	{-280.2813, 2520.3987, 33.2585},
	{-387.8318, 2437.2654, 40.7585},
	{-378.9966, 2374.3855, 31.7585},
	{-427.1025, 2291.2131, 43.3735},
	{-506.1109, 2327.9504, 66.8735},
	{-550.8829, 2361.4604, 74.8735},
	{-631.5215, 2433.7747, 100.8735},
	{-693.9317, 2468.6521, 117.3735},
	{-697.7969, 2349.0630, 126.8735},
	{-672.0438, 2306.3279, 134.3735},
	{-859.0703, 2308.7896, 157.8735},
	{-1098.3809, 2347.0405, 84.9721},
	{-1221.3303, 2669.7876, 45.4721},
	{-1284.2845, 2665.1584, 48.1771},
	{-1364.1296, 2669.7368, 50.6771},
	{-1577.5525, 2734.9365, 59.2401},
	{-1810.6927, 2686.9595, 55.3938},
	{-1942.9501, 2614.0776, 46.4581},
	{-2203.0330, 2680.4011, 53.5863},
	{-2658.2195, 2669.0698, 81.0986},
	{-2772.0115, 2428.5691, 89.6416},
	{-2740.1926, 2348.7725, 71.0622},
	{-2681.5854, 2435.5540, 48.4799},
	{-2538.0645, 2454.0085, 17.1981},
	{-2467.8931, 2325.5122, 3.8095},
	{-2465.8049, 2235.3926, 3.8095}
};
	
new Float: RaceMap1Pos[][3] = {
	{426.7231, 2517.9312, 15.7024},
	{426.7231, 2511.9312, 15.7024},
	{426.7231, 2505.9312, 15.7024},
	{426.7231, 2499.9312, 15.7024},
	{426.7231, 2493.9312, 15.7024},
	{417.2231, 2493.9312, 15.7024},
	{417.2231, 2499.9312, 15.7024},
	{417.2231, 2505.9312, 15.7024},
	{417.2231, 2511.9312, 15.7024},
	{417.2231, 2517.9312, 15.7024},
	{407.2231, 2517.9312, 15.7024},
	{407.2231, 2511.9312, 15.7024},
	{407.2231, 2505.9312, 15.7024},
	{407.2231, 2499.9312, 15.7024},
	{407.2231, 2493.9312, 15.7024},
	{397.7231, 2517.9312, 15.7024},
	{397.7231, 2511.9312, 15.7024},
	{397.7231, 2505.9312, 15.7024},
	{397.7231, 2499.9312, 15.7024},
	{397.7231, 2493.9312, 15.7024}
};

new Float: RaceMap2Pos[][3] = {
	{2820.5657, -1905.7772, 10.4260},
	{2825.5657, -1905.7772, 10.4260},
	{2820.5657, -1914.7772, 10.4260},
	{2825.5657, -1914.7772, 10.4260},
	{2825.5657, -1923.7772, 10.4260},
	{2820.5657, -1923.7772, 10.4260},
	{2820.5657, -1932.7772, 10.4260},
	{2825.5657, -1932.7772, 10.4260},
	{2820.5657, -1941.2772, 10.4260},
	{2825.5657, -1941.2772, 10.4260},
	{2835.5657, -1905.7772, 10.4260},
	{2840.5657, -1905.7772, 10.4260},
	{2835.5657, -1914.7772, 10.4260},
	{2840.5657, -1914.7772, 10.4260},
	{2835.5657, -1923.7772, 10.4260},
	{2840.5657, -1923.7772, 10.4260},
	{2835.5657, -1932.7772, 10.4260},
	{2840.5657, -1932.7772, 10.4260},
	{2835.5657, -1941.2772, 10.4260},
	{2840.5657, -1941.2772, 10.4260}		
};

new Float: RaceMap2[][3] = {
	{2849.4573, -1655.2480, 9.8644},
	{2738.0667, -1651.3435, 12.0662},
	{2639.7014, -1607.3906, 18.3492},
	{2316.3364, -1596.0756, 3.8855},
	{1973.1497, -1499.4795, 2.3384},
	{1709.0582, -1485.0819, 20.7738},
	{1611.7294, -1363.7391, 27.7558},
	{1646.2709, -1121.6166, 57.7709},
	{1698.7644, -780.2987, 53.1332},
	{1710.2134, -504.2160, 32.8576},
	{1677.7567, -281.0523, 43.3754},
	{1615.7065, 78.5365, 36.5123},
	{1683.4839, 337.4199, 29.0987},
	{1805.5477, 790.3873, 10.4180},
	{1806.6897, 976.6317, 5.9930},
	{1806.7137, 1150.9738, 5.7176},
	{1806.4889, 1391.2388, 5.7226},
	{1806.4852, 1692.4807, 5.7220},
	{1806.4225, 1958.5782, 4.5753},
	{1806.2123, 2250.3750, 3.9902},
	{1820.2491, 2463.8604, 12.4680},
	{1688.7343, 2542.8496, 9.2887},
	{1481.7131, 2472.4302, 5.7298},
	{1291.8828, 2429.6521, 5.7226},
	{1208.4423, 2165.0171, 5.7210},
	{1208.3383, 1849.4913, 5.7243},
	{1208.4106, 1210.5864, 5.8012},
	{1230.1195, 952.0754, 5.7928},
	{1519.0286, 834.2174, 5.7917},
	{1932.9969, 834.4163, 5.8618}
};

new Float: RaceMap3Pos[][3] = {
	{-2212.1592, -2271.3477, 30.4688},
	{-2209.2112, -2268.1394, 30.4688},
	{-2206.2061, -2276.0076, 30.4688},
	{-2203.2209, -2272.5771, 30.4688},
	{-2199.6726, -2281.0322, 30.4688},
	{-2196.4983, -2277.4536, 30.4688},
	{-2193.6338, -2285.8101, 30.4688},
	{-2190.4768, -2282.1904, 30.4688},
	{-2188.0254, -2290.4194, 30.4688},
	{-2184.9233, -2286.7063, 30.4688},
	{-2182.1768, -2295.0659, 30.4688},
	{-2179.2480, -2291.3301, 30.4688},
	{-2176.5298, -2299.6697, 30.4688},
	{-2173.5613, -2295.6887, 30.4688},
	{-2171.0991, -2303.9954, 30.4688},
	{-2168.0383, -2300.0908, 30.4688},
	{-2165.5447, -2308.3225, 30.4688},
	{-2162.6089, -2304.2878, 30.4688},
	{-2165.5447, -2308.3225, 30.4688},
	{-2162.6089, -2304.2878, 30.4688},
	{-2159.9368, -2312.8677, 30.4688},
	{-2156.6294, -2308.8413, 30.4688}
};

new Float: RaceMap3[][3] = {
	{-2280.4429, -2200.7266, 29.4030},
	{-2312.6096, -2168.0078, 39.2723},
	{-2211.3247, -2094.4619, 75.1754},
	{-2156.6458, -2030.6233, 92.0524},
	{-2119.3982, -1955.1771, 98.4899},
	{-2101.5613, -1900.0840, 107.4964},
	{-2133.2295, -1921.5350, 115.4552},
	{-2175.2507, -1997.9937, 118.0141},
	{-2276.6372, -2081.3564, 117.5501},
	{-2369.6035, -2103.7571, 113.6657},
	{-2541.6851, -2071.9475, 127.4102},
	{-2624.2322, -2032.8951, 126.4384},
	{-2750.1426, -1871.4226, 140.1309},
	{-2777.6377, -1696.1256, 140.5578},
	{-2752.4590, -1404.1738, 140.4640},
	{-2524.8188, -1111.0625, 176.3085},
	{-2552.3857, -1156.5629, 181.8456},
	{-2646.1196, -1309.7151, 236.3749},
	{-2537.3892, -1308.2124, 268.6166},
	{-2346.5747, -1285.5764, 307.6740},
	{-2400.6487, -1342.0956, 332.7801},
	{-2557.3250, -1448.1174, 354.5396},
	{-2494.7156, -1448.0438, 361.1491},
	{-2381.4377, -1395.5154, 358.6822},
	{-2258.2542, -1445.3749, 355.0145},
	{-2191.0662, -1634.1403, 364.0389},
	{-2214.0378, -1668.9744, 377.1979},
	{-2237.8157, -1539.0244, 378.0751},
	{-2285.7917, -1469.3781, 378.8902},
	{-2462.5063, -1467.6741, 388.6681},
	{-2528.3530, -1646.9766, 399.3887},
	{-2476.8501, -1793.4990, 404.3138},
	{-2459.8821, -1732.5663, 426.7306},
	{-2373.5803, -1809.9304, 430.7098},
	{-2284.8599, -1753.6194, 457.9684},
	{-2293.8843, -1685.0022, 481.3014},
	{-2342.9243, -1627.9645, 482.6758}
};


new Float: RaceMap4Pos[][3] = {
	{35.7011, -206.9079, 1.4703},
	{35.2795, -212.0108, 1.4703},
	{27.9834, -206.5206, 1.4703},
	{27.3696, -211.7672, 1.4703},
	{19.3512, -211.1562, 1.4703},
	{19.4268, -205.8921, 1.4703},
	{11.8821, -205.4078, 1.4703},
	{5.0329, -205.0228, 1.4703},
	{11.5723, -210.9191, 1.4703},
	{4.8128, -210.7194, 1.4703},
	{-2.8953, -209.7213, 1.4703},
	{-3.0416, -203.9758, 1.4703},
	{-9.6687, -203.5572, 1.4703},
	{-16.4782, -203.1655, 1.4703},
	{-23.6328, -202.3385, 1.4703},
	{-30.2326, -201.7310, 1.4703},
	{-10.5481, -209.4519, 1.4703},
	{-17.4430, -208.6835, 1.4703},
	{-24.6212, -208.0148, 1.4703},
	{-30.9352, -207.3893, 1.4703}
};

new Float: RaceMap4[][3] = {
	{82.0830, -211.7011, 0.4175},
	{180.6423, -219.8610, 0.4127},
	{206.1823, -290.3993, 0.4170},
	{274.0276, -377.0178, 7.8516},
	{490.4974, -413.9150, 27.3789},
	{637.6203, -417.6471, 15.1759},
	{681.4666, -562.8429, 15.1606},
	{683.7351, -772.5587, 26.0355},
	{788.1790, -921.9422, 42.2229},
	{796.0115, -1077.6595, 23.1820},
	{763.0729, -1157.9493, 21.3509},
	{663.9651, -1306.5985, 12.4468},
	{627.6392, -1379.1667, 12.5075},
	{630.6572, -1582.2216, 14.5145},
	{746.8585, -1586.6390, 13.0685},
	{861.1802, -1590.4771, 12.3678},
	{1091.0464, -1572.5398, 12.3682},
	{1286.2515, -1572.5878, 12.3715},
	{1297.1913, -1660.5925, 12.3604},
	{1312.2854, -1844.5570, 12.3750},
	{1312.7128, -1609.2629, 12.3725},
	{1365.0156, -1406.2012, 12.4118},
	{1401.1720, -1444.6259, 12.3786},
	{1374.9427, -1546.7389, 7.6552},
	{1359.3159, -1656.6761, 7.6067},
	{1408.3214, -1717.5504, 5.9797},
	{1609.5181, -1760.7252, 2.9417},
	{1939.7952, -1840.3857, 2.9761},
	{1993.4034, -1881.3436, 6.1066},
	{2175.7383, -2064.9592, 6.9750},
	{2280.0042, -2176.6841, 5.0574},
	{2207.1826, -2247.0962, 12.5392}
};


new Float: RaceMap5Pos[][3] = {
	{1652.0438, -2672.2874, 5.3614},
	{1652.2061, -2667.5493, 5.3614},
	{1662.8458, -2672.2749, 5.3614},
	{1663.1708, -2667.4746, 5.3614},
	{1672.8080, -2672.3235, 5.3614},
	{1672.7399, -2667.4241, 5.3614},
	{1681.8500, -2672.2239, 5.3614},
	{1681.8445, -2667.3838, 5.3614},
	{1691.4436, -2667.2290, 5.3614},
	{1691.3409, -2672.4197, 5.3614},
	{1652.2084, -2682.2549, 5.3614},
	{1662.4620, -2682.4253, 5.3614},
	{1672.5691, -2682.1824, 5.3614},
	{1681.3719, -2682.0732, 5.3614},
	{1691.1178, -2682.2930, 5.3614},
	{1691.0172, -2687.3311, 5.3614},
	{1681.3533, -2687.4338, 5.3614},
	{1672.4904, -2687.4814, 5.3614},
	{1662.6156, -2687.4275, 5.3614},
	{1652.1919, -2687.1084, 5.3614}
};

new Float: RaceMap5[][3] = {
	{1395.4542, -2657.3530, 12.3676},
	{1321.5227, -2520.0310, 12.3621},
	{1160.3162, -2403.3569, 9.6477},
	{1032.0725, -2177.6667, 11.9354},
	{1059.4745, -1853.0907, 12.3826},
	{779.3511, -1768.2186, 12.0196},
	{409.7559, -1702.4261, 8.0801},
	{11.7718, -1523.6058, 2.8738},
	{-123.4745, -1629.1859, 2.3603},
	{-268.2890, -1815.9911, 14.6785},
	{-268.3738, -1984.3412, 28.5978},
	{-322.6152, -2123.6731, 40.6559},
	{-534.8954, -2163.6692, 47.5686},
	{-695.7719, -2290.2891, 21.7723},
	{-801.2261, -2481.8293, 78.7791},
	{-1081.3123, -2599.3506, 75.0208},
	{-1184.9790, -2425.9233, 51.2264},
	{-1060.3175, -2079.7305, 49.0096},
	{-998.9854, -1907.9608, 78.2843},
	{-1185.9652, -1861.7158, 70.1814},
	{-1366.8409, -1661.6312, 44.3119},
	{-1548.0675, -1604.4030, 36.7113},
	{-1634.1260, -1506.2949, 35.9501},
	{-1910.3840, -1373.0791, 39.1734},
	{-1897.0319, -1185.5826, 38.4719},
	{-1897.1289, -635.1464, 38.3569},
	{-1896.7539, -134.1476, 37.2095},
	{-1859.1863, 252.4012, 37.5744},
	{-1678.7336, 523.4146, 37.2290},
	{-1442.9624, 768.8562, 45.7788},
	{-1174.9115, 1050.7545, 39.8899},
	{-1025.7900, 1256.9124, 38.6020},
	{-989.3610, 1260.9307, 32.1343},
	{-1106.0360, 1572.6038, 26.2373},
	{-1397.6847, 1739.1304, 15.9508}
};

new Float:RandomPos[7][3] = {
{-1519.3262,2687.2212,55.8403},
{-1521.2642,2640.6646,55.8359},
{-1476.3295,2654.0730,55.8359},
{-1451.3969,2634.3992,55.8359},
{-1394.5946,2646.3127,55.8754},
{-1412.1129,2630.7585,55.6875},
{-1483.0519,2646.0801,58.7281}
};

new Float: StuntPos[8][4] = {
{2186.5271,2234.5166,24.9944},
{2004.8956,1229.9484,23.1546},
{1830.4230,-1434.0691,36.0101},
{2043.1456,-1438.7621,37.2628},
{1778.3119,889.2041,26.8828},
{2500.4360,1340.3817,16.6940},
{2104.1724,955.9264,15.8000},
{2468.8318,1215.2079,18.2121}
};

new Float: SafePos[8][3] = {
{302.92111, -142.86078, 999.06842},
{503.12457, -10.13973, 1000.07971},
{-222.43982, 1400.58081, 27.18424},
{1210.80481, 5.24004, 1000.36121},
{-778.80103, 497.09222, 1371.14819},
{-99.10441, -23.19045, 1000.12872},
{-31.15454, -186.73994, 1002.97852},
{2314.28271, -0.10613, 26.13725}
};

new Float: RobPos[4][3] = {
{184.3517, -319.0276, 1.6316},
{376.3061, -1886.5225, 2.2223},
{365.3175, -1328.5284, 14.5018},
{2336.5144, -1247.0845, 22.5699}
};

new Float: BoatVehPos[7][4] = {
{179.0296, -1916.2565, -0.0159},
{187.7530, -1916.3357, -0.0159},
{202.3899, -1916.0319, -0.0159},
{209.8458, -1915.7878, -0.0159},
{227.6768, -1916.4446, -0.0159},
{253.8787, -1915.4661, -0.0159},
{279.1484, -1941.1598, -0.0159}
};

new Float: HeliVehPos[7][4] = {
{-1256.2849, -41.0140, 14.6912},
{-1281.7654, -9.5575, 14.6912},
{-1295.4089, -22.2600, 14.6912},
{-1304.4703, 24.8014, 14.6912},
{-1321.0928, 9.4536, 14.6912},
{-1310.6278, 62.2550, 14.6912},
{-1330.3777, 41.6995, 14.6912}
};

// rc_arena
new Float:PaintballSpawns[7][3] = {
{-973.6214,1025.1903,1345.0475},
{-973.1999,1095.4812,1344.9856},
{-1032.6256,1078.1367,1343.2416},
{-1054.3453,1025.1804,1343.1748},
{-1088.7957,1038.0369,1343.3666},
{-1131.7955,1023.3311,1345.7217},
{-1132.3667,1093.1659,1345.7927}
};

// farm
new Float:PaintballSpawns2[7][3] = {
{-136.8825, -70.0581, 3.2065},
{-98.5009, -31.0434, 3.2065},
{-82.4544, 24.8792, 3.2957},
{43.7600, 35.2099, 2.5184},
{-6.8738, 91.7253, 3.1657},
{-57.5785, 117.1301, 3.2078},
{-217.7475, -25.7134, 3.3158}
};

// island
new Float:PaintballSpawns3[7][3] = {
{1394.5992, 2784.1523, 11.1936},
{1317.0734, 2852.8516, 10.8923},
{1280.4998, 2738.1919, 10.9092},
{1147.8285, 2788.3435, 11.0812},
{1143.5356, 2751.1782, 11.2707},
{1259.3728, 2786.4995, 10.9397},
{1354.5094, 2738.2000, 10.8767}
};

// desert
new Float:PaintballSpawns4[7][3] = {
{-745.0526, 1580.3075, 27.0509},
{-774.2742, 1530.0056, 27.1533},
{-805.3869, 1436.9856, 13.9201},
{-725.0034, 1542.5139, 39.4333},
{-766.1290, 1625.1650, 27.2306},
{-885.7818, 1476.7595, 24.8592},
{-797.1280, 1557.1274, 27.2289}
};

// beach
new Float:PaintballSpawns5[7][3] = {
{507.8840, -1887.1956, 3.3077},
{571.3418, -1871.5217, 4.4363},
{609.7338, -1837.2462, 5.9157},
{681.5817, -1863.5522, 5.3781},
{611.6556, -1881.2391, 4.0900},
{470.7314, -1821.2793, 5.6802},
{585.5042, -1800.3372, 6.2130}
};

new Float:PaintballSpawns6[7][3] = {
{-527.5182,-98.1491,63.2969},
{-442.8741,-59.8322,59.1411},
{-465.7904,-178.1876,78.0874},
{-534.7496,-177.6923,78.4047},
{-593.2002,-110.6649,67.4507},
{-485.6090,-87.7349,60.8669},
{-573.0599,-89.7404,64.4440}
};
/*
achievementNames(id) {
	new string[44];
	switch(id) {
		case 0: string = "Ky nang cao nhat trong mot cong viec";
		case 1: string = "So huu mot xe";
		case 2: string = "So huu mot doanh nghiep";
		case 3: string = "So huu mot ngoi nha";
		case 4: string = "Mua mot cai kinh (tam khoa)";
		case 5: string = "Mua mot cai non (tam khoa)";
		case 6: string = "Dat duoc giay phep lai xe";
		case 7: string = "Dat duoc giay phep su dung sung";
		case 8: string = "Dat duoc giay phep su dung thuyen";
		case 9: string = "Dat duoc giay phep su dung may bay";
		case 10: string = "Them mot nguoi ban";
		case 11: string = "Tham gia mot cuoc dua";
		case 12: string = "Chien thang trong dau truong CS";
		case 13: string = "Cuop mot doanh nghiep";
		case 14: string = "Giet mot canh sat";
		case 15: string = "Khong con bi truy na";
		case 16: string = "Vuot nguc";
		case 17: string = "Ket hon";
		case 18: string = "Gia nhap mot to chuc hoa binh";
		case 19: string = "Gia nhap mot to chuc ca nhan";
		case 20: string = "Gia nhap so canh sat";
		case 21: string = "Gia nhap bang dang MAFIA";
		case 22: string = "O trong to chuc hoa binh trong 30 ngay";
		case 23: string = "O trong mot to chuc ca nhan trong 30 ngay";
		case 24: string = "Lam canh sat 30 ngay";
		case 25: string = "30 Ngay lam MAFIA";
		case 26: string = "Tro thanh helper";
		case 27: string = "Tro thanh admin";
		case 28: string = "Tro thanh lanh dao cua mot to chuc hoa binh";
		case 29: string = "Tro thanh lanh dao cua mot to chuc ca nhan";
		case 30: string = "Tro thanh lanh dao cua mot so canh sat";
		case 31: string = "Tro thanh lanh dao cua mot bang Mafia";
	}	
	return string;
}	
*/
// TOW CAR CHECKPOINT
new Float:TowCarCk[3][3] = {
{2508.5374,-2120.8293,13.5469},
{2483.7014,-2120.2810,13.5469},
{2461.2185,-2120.2971,13.5530}
};

new RaceCars[][2] = {
	{401, 0},
	{496, 5},
	{445, 10},
	{439, 25},
	{439, 25},	
	{477, 30},
	{426, 40},
	{405, 45},
	{405, 45},
	{535, 55},
	{536, 55},
	{555, 60},
	{567, 70},
	{561, 70},	
	{602, 75},
	{565, 80},
	{506, 80},
	{415, 95},
	{558, 95},
	{560, 100},
	{562, 100},
	{559, 100},
	{402, 100},
	{429, 100},
	{451, 115},
	{541, 125},
	{480, 125},
	{411, 150},
	{502, 200}			
};

// new Float: HQPos[][3] = {
// 	{1553.1854,-1675.8188,16.1953},
// 	{1374.12,404.955,19.9555},
// 	{213.8154,1866.6807,13.1406},
// 	{2495.3691,-1689.9727,14.7656},
// 	{725.6746,-1450.1976,17.6953},
// 	{1454.2269,751.6389,11.0234},
// 	{476.6148,-1498.9614,20.4836},
// 	{2448.5317,-2120.4065,13.5469},
// 	{-329.5237,1536.6777,76.6117},
// 	{1458.3151,2773.4265,10.8203},
// 	{1051.7865,-346.0753,73.9922},
// 	{940.4329,1733.4216,8.8516},
// 	{937.078,1733.19,8.8516},
// 	{1607.3521,1817.3278,10.8203},
// 	{2287.2034,2431.5264,10.8203}
// };
stock ticketName(id) {
	new string[43];
	switch(id) {
		case 0: string = "- Dau xe trai phep";
		case 1: string = "- Lang lach, danh vong";
		case 2: string = "- Gay ket xe, can tro giao thong";
		case 3: string = "- Su dung Thuy Luc";
		case 4: string = "- Su dung NOS (Nitro)";
		case 5: string = "- Xe chua bat den pha";
		case 6: string = "- Ban vu khi trai phep";
		case 7: string = "- Di bo tren lan duong, can tro giao thong";	
		case 8: string = "- Khong doi mu bao hiem";	
	}
	return string;
}
stock ticketValue(id) {
	new x;
	switch(id) {
		case 0: x = 9500;
		case 1: x = 9500;
		case 2: x = 9000;
		case 3: x = 3600;
		case 4: x = 7200;
		case 5: x = 10000;
		case 6: x = 5400;
		case 7: x = 5400;
		case 8: x = 8000;
	}
	return x;
}
new wantedList[][2] = {
	{1, 0},
	{1, 0},
	{2, 0},
	{2, 0},
	{2, 0},
	{3, 0},
	{3, 0},
	{3, 1},
	{3, 0},
	{4, 0},
	{4, 0},
	{4, 0},
	{5, 0},
	{5, 1},
	{3, 1}, // default is 6
	{6, 1},
	{2, 0},
	{2, 0}
};
stock wantedName(id) {
	new string[31];
	switch(id) {
		case 0: string = "Cuop xe";
		case 1: string = "Cuoc goi 112";
		case 2: string = "Giet dan thuong";
		case 3: string = "Don hang bat hop phap";
		case 4: string = "Xam nhap vao dat chinh phu";
		case 5: string = "Bat coc Civilian";
		case 6: string = "Tan tru/Van chuyen thuoc phien";
		case 7: string = "Tan cong canh sat";
		case 8: string = "Khong tra tien phat";
		case 9: string = "Drive-By";
		case 10: string = "Hoi lo Canh sat";
		case 11: string = "Bat coc dan thuong";
		case 12: string = "Bat coc canh sat";
		case 13: string = "Giet canh sat (onduty)";
		case 14: string = "Tron tranh canh sat";
		case 15: string = "Dong loa";
		case 16: string = "Suc pham canh sat";
		case 17: string = "Chong nguoi thi hanh cong vu";
	}
	return string;
}
stock SCMf(playerid, colour, const fmat[], va_args<>) {
	new UsageString[256]; va_format(UsageString, 128, fmat, va_start<3>);
	return SendClientMessage(playerid, colour, UsageString);
}
new const HudName[13][22] = {
	{"{FFFFFF}Huy kich hoat"},
	{"{B8BFC2}Grey"},
	{"{FF0000}Red"},
	{"{00FF2F}Green"},
	{"{0E8C19}Dark Green"},	
	{"{0022FF}Blue"},
	{"{00AAFF}Lightblue"},
	{"{00FFD0}Cyan"},	
	{"{FFFB00}Yellow"},
	{"{FF8800}Orange"},	
	{"{FFB957}Gold"},
	{"{8000FF}Purple"},
	{"{FF0077}Pink"}	
};

new RadioNames[][] = {
	{"{FF0000}Tat radio"},
	{"Son Tung - MTP Radio"},
	{"Avril Lavigne Radio"},
	{"US/UK GGTA"},
	{"ZFM - Non-Stop"},
	{"Nhac Cach Mang"}
};

new RadioLink[][55] = {
	{""},
	{"https://goo.gl/TW1aHi"},
	{"https://goo.gl/Z3eEE2"},
	{"https://goo.gl/pV4jcQ"},
	{"http://188.165.232.7:8545/listen.pls"},
	{"https://goo.gl/GbVVVi"}
};

new aVehicleNames[][] =
{
    "Landstalker", "Bravura", "Buffalo", "Linerunner", "Perrenial", "Sentinel",
	"Dumper", "Firetruck", "Trashmaster", "Stretch", "Manana", "Infernus",
	"Voodoo", "Pony", "Mule", "Cheetah", "Ambulance", "Leviathan", "Moonbeam",
    "Esperanto", "Taxi", "Washington", "Bobcat", "Whoopee", "BF Injection",
	"Hunter", "Premier", "Enforcer", "Securicar", "Banshee", "Predator", "Bus",
	"Rhino", "Barracks", "Hotknife", "Trailer", "Previon", "Coach", "Cabbie",
	"Stallion", "Rumpo", "RC Bandit", "Romero", "Packer", "Monster", "Admiral",
	"Squalo", "Seasparrow", "Pizzaboy", "Tram", "Trailer", "Turismo", "Speeder",
	"Reefer", "Tropic", "Flatbed", "Yankee", "Caddy", "Solair", "Berkley's RC Van",
	"Skimmer", "PCJ-600", "Faggio", "Freeway", "RC Baron", "RC Raider", "Glendale",
	"Oceanic","Sanchez", "Sparrow", "Patriot", "Quad", "Coastguard", "Dinghy",
	"Hermes", "Sabre", "Rustler", "ZR-350", "Walton", "Regina", "Comet", "BMX",
	"Burrito", "Camper", "Marquis", "Baggage", "Dozer", "Maverick", "News Chopper",
	"Rancher", "FBI Rancher", "Virgo", "Greenwood", "Jetmax", "Hotring", "Sandking",
	"Blista Compact", "Police Maverick", "Boxville", "Benson", "Mesa", "RC Goblin",
	"Hotring Racer A", "Hotring Racer B", "Bloodring Banger", "Rancher", "Super GT",
	"Elegant", "Journey", "Bike", "Mountain Bike", "Beagle", "Cropduster", "Stunt",
 	"Tanker", "Roadtrain", "Nebula", "Majestic", "Buccaneer", "Shamal", "Hydra",
 	"FCR-900", "NRG-500", "HPV1000", "Cement Truck", "Tow Truck", "Fortune",
 	"Cadrona", "FBI Truck", "Willard", "Forklift", "Tractor", "Combine", "Feltzer",
 	"Remington", "Slamvan", "Blade", "Freight", "Streak", "Vortex", "Vincent",
    "Bullet", "Clover", "Sadler", "Firetruck", "Hustler", "Intruder", "Primo",
	"Cargobob", "Tampa", "Sunrise", "Merit", "Utility", "Nevada", "Yosemite",
	"Windsor", "Monster", "Monster", "Uranus", "Jester", "Sultan", "Stratum",
	"Elegy", "Raindance", "RC Tiger", "Flash", "Tahoma", "Savanna", "Bandito",
    "Freight Flat", "Streak Carriage", "Kart", "Mower", "Dune", "Sweeper",
	"Broadway", "Tornado", "AT-400", "DFT-30", "Huntley", "Stafford", "BF-400",
	"News Van", "Tug", "Trailer", "Emperor", "Wayfarer", "Euros", "Hotdog", "Club",
	"Freight Box", "Trailer", "Andromada", "Dodo", "RC Cam", "Launch", "Police Car",
 	"Police Car", "Police Car", "Police Ranger", "Picador", "S.W.A.T", "Alpha",
 	"Phoenix", "Glendale", "Sadler", "Luggage", "Luggage", "Stairs", "Boxville",
 	"Tiller", "Utility Trailer"
};

new Peds[115][1] = {
{1},{2},{6},{7},{9},{10},{14},{15},{16},{18},{19},{20},{21},{22},{23},{24},{25},{26},{27},{28},
{29},{30},{31},{32},{33},{34},{35},{36},{37},{38},{39},{41},{43},{44},{45},{47},{48},{49},{51},
{52},{53},{54},{63},{64},{66},{67},{68},{69},{73},{75},{77},{78},{79},{80},{81},{82},{83},{84},
{87},{88},{89},{94},{95},{96},{97},{99},{100},{101},{128},{129},{130},{131},{132},{133},{134},
{135},{136},{137},{138},{139},{140},{142},{143},{144},{145},{146},{154},{162},{170},{180},{177},
{176},{181},{182},{183},{184},{193},{201},{202},{203},{204},{221},{230},{234},{237},{241},{242},
{247},{248},{249},{250},{252},{254},{299},{293}
};

new Float:TruckClothesPos[][] = {
	{456.1087,-1501.3405,31.0429},
	{2246.9468,-1658.5454,15.2856},
	{2062.6563,2251.4827,10.1718},
	{1387.6379,1038.9611,10.8203},
	{2572.0181,1891.6405,10.8280}
};
new Float:TruckFoodPos[][] = {
	{2627.4238,1670.3981,10.9104},
	{1426.4849,1029.8025,10.1870},
	{2546.5735,1968.1238,10.8203}, 
	{786.4791,-1617.8722,13.3828},
	{1193.0499,-882.8945,43.0620}
};
new Float:TruckFurniturePos[][] = {
	{1529.4952,17.8272,24.1406},
	{167.7361,-22.3520,1.6817},
	{1200.6061,144.7607,20.6738},
	{2415.6680,89.8848,26.5133},
	{1665.9354,731.1528,10.8203}
};
new Float:TruckExplosePos[][] = {
	{646.4252,1249.9377,11.6735},
	{2634.4856,1072.2454,10.8203},
	{1922.2708,-1791.1569,13.3828},
	{-81.8883,-1193.4836,1.8445},
	{2182.7463,2489.1960,10.8203}
};
new Float:TruckGunPos[][] = {
	{2183.0911,915.0748,10.8746},
	{2583.5859,2072.9514,10.8662},
	{1426.4296,-1328.1350,13.5710},
	{2490.5774,-2485.4587,13.7320},
	{1042.9701,-907.7836,42.6147}
};
new Float:TruckStolenCar[][] = {
	{2831.0107,915.2982,10.9302},
	{2327.8936,-2072.9585,13.5873},
	{2386.1792,-1474.1869,23.8195},
	{2717.3513,-2224.1147,13.6100},
	{1073.0592,1269.8995,10.8659}		
};

// SAVE
#define pCashx				1
#define pRP  				2
#define pBank  				3
#define pCarLicTx 			4
#define pFlyLicTx 			5
#define pBoatLicTx 			6
#define pFishLicTx 			7
#define pGunLicTx 			8
#define pRobx 				9
#define pFpunishx           10
#define pLawyerx            11
#define pConnectTimex       12
#define pTowx      			13
#define pPayDayHadx      	14
#define pPayDayx      		15
#define pPayCheckx      	16
#define pHousex      		17
#define pJailedx      		18
#define pJailTimex     		19
#define pRadiox     		20
#define pWantedLevelx       21
#define pPhonex             22
#define pMatsx              23
// #define pFishesx            24
#define pFishSkillx         25
#define pRobSkillx          26
#define pReferralx          27
#define pLevelx             28
#define pReferralPx         29
#define pBizzx           	31
#define pRegx               33
#define pRegistredDatex     34
#define pRentedx            39
#define pCrimesx            40
#define pLaptopx			41
#define pCrime1x            42
#define pCrime2x            43
#define pCrime3x            44
#define pVictimx            45
#define pAccusedx           46
#define pEmailx             47
#define	pBTempx             48
#define pBYearx             49
#define pBMonthx            50
#define pBDayx         		51
#define pBByx             	52
#define pBReasonx           53
#define pWarnsx             54
#define pTruckerSkillx      55
#define pGarbageSkillx      56
#define pShowJobx           57
#define pShowFPx            58
#define pShowLogox          59
#define pShowCeasx          60
#define pFarmerSkillx       61
#define pPremiumPointsx   	63
#define pShowFactionx       66
#define pGiftPointsx        67
#define pNewbieMutex        68
#define pDailyMissionx      69
#define pDailyMission2x     70
#define pProgressx      	71
#define pProgress2x      	72
#define pReportTimex        73
#define pPizzaSkillx		75
#define pGoldCastigatx      76
#define pCurierSkillx  		77 
#define pPilotSkillx  		78
#define pShowHPx			79
#define pShowAPx			80
#define pVipx 				81
#define pCarLicSx 			82
#define pGunLicSx 			83
#define pFlyLicSx 			84
#define pBoatLicSx 			85
#define pJackerSkillx  		86
#define pNewsPaperSkillx	88
#define pDailyBonusx		89
#define pDailyMission3x     90
#define pProgress3x   		91
#define pMatuy1x 	  		92
#define pMatuy2x   			93
#define pHungerx   			94
#define pDailyMission4x     95//update vip
#define pDailyMission5x     96
#define pDailyMission6x     97
#define pProgress4x   		98
#define pProgress5x   		99
#define pProgress6x   		100
#define pKCx   				101
#define pTutorialx			102

//HOUSE
#define hExitxx             1
#define hExityx             2
#define hExitzx             3
#define hInteriorx          4

//SBUSSINES
#define sbTillx         1
#define sbProductsx		2

// GUN NAME
new const GunNames[][] =
{
	"Nothink",
	"Brass Knuckles",
	"Golf Club",
	"Nitestick",
	"Knife",
	"Baseball Bat",
	"Showel",
	"Pool Cue",
	"Katana",
	"Chainsaw",
	"Purple Dildo",
	"Small White Dildo",
	"Long White Dildo",
	"Vibrator",
	"Flowers",
	"Cane",
	"Grenade",
	"Tear Gas",
	"Molotov",
	"Vehicle Missile",
	"Hydra Flare",
	"Jetpack",
	"Glock",
	"Silenced Colt",
	"Desert Eagle",
	"Shotgun",
	"Sawn Off",
	"Combat Shotgun",
	"Micro UZI",
	"MP5",
	"AK47",
	"M4",
	"Tec9",
	"Rifle",
	"Sniper Rifle",
	"Rocket Launcher",
	"HS Rocket Launcher",
	"Flamethrower",
	"Minigun",
	"Satchel Charge",
	"Detonator",
	"Spraycan",
	"Fire Extinguisher",
	"Camera",
	"Nightvision",
	"Infrared Vision",
	"Parachute",
	"Fake Pistol",
	"Vehicle",
	"Helicopter blades",
	"Explosion",
	"Drowned",
	"Collision"
};



// new legalmods[48][22] = {
//         {400, 1024,1021,1020,1019,1018,1013,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
//         {401, 1145,1144,1143,1142,1020,1019,1017,1013,1007,1006,1005,1004,1003,1001,0000,0000,0000,0000},
//         {404, 1021,1020,1019,1017,1016,1013,1007,1002,1000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
//         {405, 1023,1021,1020,1019,1018,1014,1001,1000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
//         {410, 1024,1023,1021,1020,1019,1017,1013,1007,1003,1001,0000,0000,0000,0000,0000,0000,0000,0000},
// 		{415, 1023,1019,1018,1017,1007,1003,1001,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
//         {418, 1021,1020,1016,1006,1002,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
//         {420, 1021,1019,1005,1004,1003,1001,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
//         {421, 1023,1021,1020,1019,1018,1016,1014,1000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
//         {422, 1021,1020,1019,1017,1013,1007,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
//         {426, 1021,1019,1006,1005,1004,1003,1001,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
//         {436, 1022,1021,1020,1019,1017,1013,1007,1006,1003,1001,0000,0000,0000,0000,0000,0000,0000,0000},
//         {439, 1145,1144,1143,1142,1023,1017,1013,1007,1003,1001,0000,0000,0000,0000,0000,0000,0000,0000},
//         {477, 1021,1020,1019,1018,1017,1007,1006,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
//         {478, 1024,1022,1021,1020,1013,1012,1005,1004,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
//         {489, 1024,1020,1019,1018,1016,1013,1006,1005,1004,1002,1000,0000,0000,0000,0000,0000,0000,0000},
//         {491, 1145,1144,1143,1142,1023,1021,1020,1019,1018,1017,1014,1007,1003,0000,0000,0000,0000,0000},
//         {492, 1016,1006,1005,1004,1000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
//         {496, 1143,1142,1023,1020,1019,1017,1011,1007,1006,1003,1002,1001,0000,0000,0000,0000,0000,0000},
//         {500, 1024,1021,1020,1019,1013,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
//         {516, 1021,1020,1019,1018,1017,1016,1015,1007,1004,1002,1000,0000,0000,0000,0000,0000,0000,0000},
//         {517, 1145,1144,1143,1142,1023,1020,1019,1018,1017,1016,1007,1003,1002,0000,0000,0000,0000,0000},
//         {518, 1145,1144,1143,1142,1023,1020,1018,1017,1013,1007,1006,1005,1003,1001,0000,0000,0000,0000},
//         {527, 1021,1020,1018,1017,1015,1014,1007,1001,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
//         {529, 1023,1020,1019,1018,1017,1012,1011,1007,1006,1003,1001,0000,0000,0000,0000,0000,0000,0000},
//         {534, 1185,1180,1179,1178,1127,1126,1125,1124,1123,1122,1106,1101,1100,0000,0000,0000,0000,0000},
//         {535, 1121,1120,1119,1118,1117,1116,1115,1114,1113,1110,1109,0000,0000,0000,0000,0000,0000,0000},
//         {536, 1184,1183,1182,1181,1128,1108,1107,1105,1104,1103,0000,0000,0000,0000,0000,0000,0000,0000},
//         {540, 1145,1144,1143,1142,1024,1023,1020,1019,1018,1017,1007,1006,1004,1001,0000,0000,0000,0000},
//         {542, 1145,1144,1021,1020,1019,1018,1015,1014,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
//         {546, 1145,1144,1143,1142,1024,1023,1019,1018,1017,1007,1006,1004,1002,1001,0000,0000,0000,0000},
//         {547, 1143,1142,1021,1020,1019,1018,1016,1003,1000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
//         {549, 1145,1144,1143,1142,1023,1020,1019,1018,1017,1012,1011,1007,1003,1001,0000,0000,0000,0000},
//         {550, 1145,1144,1143,1142,1023,1020,1019,1018,1006,1005,1004,1003,1001,0000,0000,0000,0000,0000},
//         {551, 1023,1021,1020,1019,1018,1016,1006,1005,1003,1002,0000,0000,0000,0000,0000,0000,0000,0000},
//         {558, 1168,1167,1166,1165,1164,1163,1095,1094,1093,1092,1091,1090,1089,1088,0000,0000,0000,0000},
//         {559, 1173,1162,1161,1160,1159,1158,1072,1071,1070,1069,1068,1067,1066,1065,0000,0000,0000,0000},
//         {560, 1170,1169,1141,1140,1139,1138,1033,1032,1031,1030,1029,1028,1027,1026,0000,0000,0000,0000},
//         {561, 1157,1156,1155,1154,1064,1063,1062,1061,1060,1059,1058,1057,1056,1055,1031,1030,1027,1026},
//         {562, 1172,1171,1149,1148,1147,1146,1041,1040,1039,1038,1037,1036,1035,1034,0000,0000,0000,0000},
//         {565, 1153,1152,1151,1150,1054,1053,1052,1051,1050,1049,1048,1047,1046,1045,0000,0000,0000,0000},
//         {567, 1189,1188,1187,1186,1133,1132,1131,1130,1129,1102,0000,0000,0000,0000,0000,0000,0000,0000},
//         {575, 1177,1176,1175,1174,1099,1044,1043,1042,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
//         {576, 1193,1192,1191,1190,1137,1136,1135,1134,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
//         {580, 1023,1020,1018,1017,1007,1006,1001,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
//         {589, 1145,1144,1024,1020,1018,1017,1016,1013,1007,1006,1005,1004,1000,0000,0000,0000,0000,0000},
//         {600, 1022,1020,1018,1017,1013,1007,1006,1005,1004,0000,0000,0000,0000,0000,0000,0000,0000,0000},
//         {603, 1145,1144,1143,1142,1024,1023,1020,1019,1018,1017,1007,1006,1001,0000,0000,0000,0000,0000}
// };

#define RC_BANDIT     441
#define RC_BARON  	  464
#define RC_GOBLIN  	  501
#define RC_RAIDER     465
#define D_TRAM        449
#define RC_MINITANK   564
#define RC_CAM        594

#include "Source/modules/dealership/header"
#include "Source/modules/weed/enum"
#include "Source/modules/jobs/enum"

new const Float:CHKWorkJail[6][3] = {
{29.8176,2475.0803,16.6916},
{34.1375,2447.8044,16.6916},
{16.0439,2439.5859,16.6916},
{5.2715,2454.0825,16.6916},
{7.6496,2477.8972,16.6916},
{43.1478,2457.3511,16.6916}
};

new const Float:CHKWorkJail2[4][3] = {
{-26.5273,2451.5068,16.6916},
{-26.5448,2443.6780,16.7334},
{-32.6855,2438.7705,16.7334},
{-41.6559,2437.3601,16.7334}
};

new const Float:SpawnCarEscape[4][4] = {
{2027.7395,-1143.3979,24.3792,270.0756},
{2217.3711,-1161.3195,25.3833,262.4290},
{115.5698,-1528.3243,7.2239,249.4040},
{1062.5553,-1764.0177,13.0427,266.8030}
};

new const Float:CheckPointEscape[6][3] = {
{2579.8604,2283.5549,10.8203},
{-272.4512,2586.5173,63.5703},
{-2293.8440,2231.5215,4.9822},
{-2247.9373,-1717.3673,480.2234},
{-2196.2263,-2262.3699,30.6379},
{-2756.2324,375.4040,4.3353}
};
#define ATTACHMENT_ID_BALE 7
new plant[MAX_PLAYERS], FreePoints;
new ClanVehicle[MAX_CLANS][10];
new Iterator:LoginQueue[2]<MAX_PLAYERS>;

new gQuery[300];

//new ServerGoal,TerminatJobGoal = 0, MAXGOAL = 20000000;
enum pMobileInfo
{
    bool:isMobile,
	MobileVersion
}
new PlayerMobileInfo[MAX_PLAYERS][pMobileInfo];