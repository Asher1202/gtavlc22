#include <a_samp>
#define OBJ_SLOT_POOL (0)
enum poolBall
{
    bObject,
    bExisting
}
enum pool2Ball
{
    bObject,
    bExisting
}
new sosicon, sosicon2, sosicon3, sosicon4, skee, skeee, toppool, Pool2Dir, Float:Pool2Power, Pool2LastShooter = -1, Float:Aim2Angle[MAX_PLAYERS][2], Aim2Object, Text:Pool2TD0, Text:Pool2TDs1, Text:Pool2TD2, Text:Pool2TD3, Pool2Aimer = -1, Pool2Ball[16][pool2Ball], StakePol2, PoolPlin2, PoolGol2, PoolStarted2, Text3D:Pool2TD1, pool21ob, pool22ob2;
new Float:sos41, Float:sos42, Float:sos43, Float:sos31, Float:sos32, Float:sos33, Float:sos21, Float:sos22, Float:sos23, Float:sos1, Float:sos2, Float:sos3, Float:poolrott2, Text:Pool2s1, Text:Pool2s0, Text:Pool2s2, Text:Pool2s3, Text:Pool2s4, Text:Pool2s5, Text:Pool2s6, Text:Pool2s7, Text:Pool2s8, Text:Pool2s9,
sflog[200], s1n[24], s2n[24], s3n[24], s4n[24], sgt1, sgt2, sgt3, sgt4, Text:Pool2s10, Text:Pool2s11, Text:Pool2s12, Text:Pool2s13, Text:Pool2s14, Text:Pool2s15, Text:Pool2s16, Text:Pool2s17, Text:Pool2s18, Text:Pool2s19;
new mkol[MAX_PLAYERS], jsrt[150], PlayerText:JT0[MAX_PLAYERS], PlayerText:JT1[MAX_PLAYERS], PlayerText:JT2[MAX_PLAYERS], PlayerText:JT3[MAX_PLAYERS], PlayerText:JT4[MAX_PLAYERS], PlayerText:JT5[MAX_PLAYERS];
new plas1, plas2, Float:moveangle, Float:dvx, Float:dvy, Float:mag, Float:tmpvx, Float:tmpvy, Float:newvy1, Float:angleww, Float:speedwr, Float:y2rr, Float:z2rr, Float:x1ql,
Float:newvy2, Float:newvx1, Float:newvx2w, Float:xclosest, Float:yclosest, Float:x2w, Float:distwe, Float:dykj, Float:dxkhd, Float:y1vv,
Float:xoos, Float:yoos, Float:PoolPower, Float:zoos, aydsd, pydas = -1, Float:LiveMX, Float:LiveMY, PlayerText:ProB1[MAX_PLAYERS], PlayerText:ProB2[MAX_PLAYERS], PlayerText:ProB3[MAX_PLAYERS];
new PoolRand[MAX_PLAYERS], PoolIDP[MAX_PLAYERS], StakePol1, Text:Pool1s1, Text:Pool1s0, Text:Pool1s2, Text:Pool1s3, Text:Pool1s4, Text:Pool1s5, Text:Pool1s6, Text:Pool1s7, Text:Pool1s8, Text:Pool1s9,
PoolPlin, PoolGol, Text:Pool1s10, Text:Pool1s11, Text:Pool1s12, Text:Pool1s13, Text:Pool1s14, Text:Pool1s15, Text:Pool1s16, Text:Pool1s17, Text:Pool1s18, Text:Pool1s19;
new Float:Xq, Float:Yq, Float:Zq, Float:xws, Float:yws, Float:distsd, Float:newrotsd, Float:Zavw, Float:Xfs, Float:Yfs, Float:Zfs, Float:Xab, Float:Yab, Float:xqqq, Float:yqr, holep, Float:xbs, Float:ybs, Float:zbs, Text3D:PoolTD1, pool1ob, pool2ob2;
new Float:poolrotx, Float:speedp2, Float:poolrott, Float:Xa2, Float:Ya2, Float:Za2, Float:x22, Float:y22, Float:speedp, Float:vxp, Float:vyp, Float:vzp, keysp, udp, lrp, Float:zpp, Float:xpi, Float:ypi, Float:x1sw, Float:y1sw, Float:z1sw, Float:tmpdisw;
new Float:Xayu, Float:Yayu, Float:Zayu, PlayingPool[MAX_PLAYERS], PoolCamera[MAX_PLAYERS], PoolScore[MAX_PLAYERS], Float:AimAngle[MAX_PLAYERS][2], stmsgo[210],
gunnameb[32], gunnameb2[32], vC, Float:hPr[MAX_PLAYERS], vvtaxx, AimObject, rTIM = -1, PoolStarted, PoolAimer = -1, PoolLastShooter = -1, PoolBall[16][poolBall], Text:PoolTD0, Text:PoolTDs1, Text:PoolTD2, Text:PoolTD3, PoolDir;

hook OnGameModeInit()
{
	LoadPool();

	pool1ob = CreateDynamicObject(338, 510.26770, -83.64490, 998.26721,   4.00000, 0.00000, 0.00000);
    pool2ob2 = CreateDynamicObject(338, 509.84470, -83.64490, 998.26721,   4.00000, 0.00000, 0.00000);
    plas1 = CreateDynamicObject(2965, 510.18771, -85.37160, 998.86182,   0.00000, 0.00000, -213.00000);
    PoolTD1 = CreateDynamic3DTextLabel("Pool Table #1\nStatus: {00BA19}Available\n{FFFFFF}Type {33C494}/pool {FFFFFF}to play billiards.",-1,510.06921,-78.4267,998.9609, 4.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 11, -1);

    pool21ob = CreateDynamicObject(338, 506.64871, -83.64490, 998.26721,   4.00000, 0.00000, 0.00000);
    pool22ob2 = CreateDynamicObject(338, 506.22571, -83.64490, 998.26721,   4.00000, 0.00000, 0.00000);
    plas2 = CreateDynamicObject(2965, 506.55569, -85.37160, 998.86182,   0.00000, 0.00000, -210.00000);
    Pool2TD1 = CreateDynamic3DTextLabel("Pool Table #2\nStatus: {00BA19}Available\n{FFFFFF}Type {33C494}/pool {FFFFFF}to play billiards.",-1,506.46960,-78.4267,998.9609, 4.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 11, -1);

    //Pool Ten Green Bottles Bar
    CreateDynamicObject(2693, 512.58820, -72.95940, 999.99792,   10.00000, 0.00000, -90.00000);
    CreateDynamicObject(2965, 509.76636, -69.98229, 998.62201,   0.00000, 0.00000, 84.00000);
    CreateDynamicObject(1541, 504.36050, -76.74920, 999.92499,   0.00000, 0.00000, 90.00000);

    Pool1s1 = TextDrawCreate(159.000000, 241.000000, "_");
    TextDrawBackgroundColor(Pool1s1, 0);
    TextDrawFont(Pool1s1, 1);
    TextDrawLetterSize(Pool1s1, 0.500000, 6.099999);
    TextDrawColor(Pool1s1, -1);
    TextDrawSetOutline(Pool1s1, 0);
    TextDrawSetProportional(Pool1s1, 1);
    TextDrawSetShadow(Pool1s1, 1);
    TextDrawUseBox(Pool1s1, 1);
    TextDrawBoxColor(Pool1s1, 150);
    TextDrawTextSize(Pool1s1, 20.000000, 50.000000);
    TextDrawSetSelectable(Pool1s1, 0);

    Pool1s0 = TextDrawCreate(22.000000, 227.000000, "pool table 1");
    TextDrawBackgroundColor(Pool1s0, 200);
    TextDrawFont(Pool1s0, 2);
    TextDrawLetterSize(Pool1s0, 0.180000, 1.100000);
    TextDrawColor(Pool1s0, -1);
    TextDrawSetOutline(Pool1s0, 0);
    TextDrawSetProportional(Pool1s0, 1);
    TextDrawSetShadow(Pool1s0, 1);
    TextDrawSetSelectable(Pool1s0, 0);

    Pool1s2 = TextDrawCreate(23.000000, 240.000000, "~y~spoker ~w~~h~- 3/8");
    TextDrawBackgroundColor(Pool1s2, 0);
    TextDrawFont(Pool1s2, 2);
    TextDrawLetterSize(Pool1s2, 0.180000, 1.200000);
    TextDrawColor(Pool1s2, -1);
    TextDrawSetOutline(Pool1s2, 0);
    TextDrawSetProportional(Pool1s2, 1);
    TextDrawSetShadow(Pool1s2, 1);
    TextDrawSetSelectable(Pool1s2, 0);

    Pool1s3 = TextDrawCreate(19.000000, 247.000000, "_");
    TextDrawBackgroundColor(Pool1s3, 0);
    TextDrawFont(Pool1s3, 5);
    TextDrawLetterSize(Pool1s3, 0.500000, 1.000000);
    TextDrawColor(Pool1s3, -1);
    TextDrawSetOutline(Pool1s3, 0);
    TextDrawSetProportional(Pool1s3, 1);
    TextDrawSetShadow(Pool1s3, 1);
    TextDrawUseBox(Pool1s3, 1);
    TextDrawBoxColor(Pool1s3, 0);
    TextDrawTextSize(Pool1s3, 20.000000, 22.000000);
    TextDrawSetPreviewModel(Pool1s3, 2998);
    TextDrawSetPreviewRot(Pool1s3, 0.000000, 0.000000, -55.000000, 1.000000);
    TextDrawSetSelectable(Pool1s3, 0);

    Pool1s4 = TextDrawCreate(30.000000, 247.000000, "_");
    TextDrawBackgroundColor(Pool1s4, 0);
    TextDrawFont(Pool1s4, 5);
    TextDrawLetterSize(Pool1s4, 0.500000, 1.000000);
    TextDrawColor(Pool1s4, -1);
    TextDrawSetOutline(Pool1s4, 0);
    TextDrawSetProportional(Pool1s4, 1);
    TextDrawSetShadow(Pool1s4, 1);
    TextDrawUseBox(Pool1s4, 1);
    TextDrawBoxColor(Pool1s4, 0);
    TextDrawTextSize(Pool1s4, 20.000000, 22.000000);
    TextDrawSetPreviewModel(Pool1s4, 3001);
    TextDrawSetPreviewRot(Pool1s4, -16.000000, 0.000000, -55.000000, 1.000000);
    TextDrawSetSelectable(Pool1s4, 0);

    Pool1s5 = TextDrawCreate(41.000000, 247.000000, "_");
    TextDrawBackgroundColor(Pool1s5, 0);
    TextDrawFont(Pool1s5, 5);
    TextDrawLetterSize(Pool1s5, 0.500000, 1.000000);
    TextDrawColor(Pool1s5, -1);
    TextDrawSetOutline(Pool1s5, 0);
    TextDrawSetProportional(Pool1s5, 1);
    TextDrawSetShadow(Pool1s5, 1);
    TextDrawUseBox(Pool1s5, 1);
    TextDrawBoxColor(Pool1s5, 0);
    TextDrawTextSize(Pool1s5, 20.000000, 22.000000);
    TextDrawSetPreviewModel(Pool1s5, 3000);
    TextDrawSetPreviewRot(Pool1s5, -16.000000, 0.000000, -55.000000, 1.000000);
    TextDrawSetSelectable(Pool1s5, 0);

    Pool1s6 = TextDrawCreate(52.000000, 247.000000, "_");
    TextDrawBackgroundColor(Pool1s6, 0);
    TextDrawFont(Pool1s6, 5);
    TextDrawLetterSize(Pool1s6, 0.500000, 1.000000);
    TextDrawColor(Pool1s6, -1);
    TextDrawSetOutline(Pool1s6, 0);
    TextDrawSetProportional(Pool1s6, 1);
    TextDrawSetShadow(Pool1s6, 1);
    TextDrawUseBox(Pool1s6, 1);
    TextDrawBoxColor(Pool1s6, 0);
    TextDrawTextSize(Pool1s6, 20.000000, 22.000000);
    TextDrawSetPreviewModel(Pool1s6, 2999);
    TextDrawSetPreviewRot(Pool1s6, -16.000000, 0.000000, -55.000000, 1.000000);
    TextDrawSetSelectable(Pool1s6, 0);

    Pool1s7 = TextDrawCreate(63.000000, 247.000000, "_");
    TextDrawBackgroundColor(Pool1s7, 0);
    TextDrawFont(Pool1s7, 5);
    TextDrawLetterSize(Pool1s7, 0.500000, 1.000000);
    TextDrawColor(Pool1s7, -1);
    TextDrawSetOutline(Pool1s7, 0);
    TextDrawSetProportional(Pool1s7, 1);
    TextDrawSetShadow(Pool1s7, 1);
    TextDrawUseBox(Pool1s7, 1);
    TextDrawBoxColor(Pool1s7, 0);
    TextDrawTextSize(Pool1s7, 20.000000, 22.000000);
    TextDrawSetPreviewModel(Pool1s7, 2997);
    TextDrawSetPreviewRot(Pool1s7, -16.000000, 0.000000, -55.000000, 1.000000);
    TextDrawSetSelectable(Pool1s7, 0);

    Pool1s8 = TextDrawCreate(74.000000, 247.000000, "_");
    TextDrawBackgroundColor(Pool1s8, 0);
    TextDrawFont(Pool1s8, 5);
    TextDrawLetterSize(Pool1s8, 0.500000, 1.000000);
    TextDrawColor(Pool1s8, -1);
    TextDrawSetOutline(Pool1s8, 0);
    TextDrawSetProportional(Pool1s8, 1);
    TextDrawSetShadow(Pool1s8, 1);
    TextDrawUseBox(Pool1s8, 1);
    TextDrawBoxColor(Pool1s8, 0);
    TextDrawTextSize(Pool1s8, 20.000000, 22.000000);
    TextDrawSetPreviewModel(Pool1s8, 2996);
    TextDrawSetPreviewRot(Pool1s8, -16.000000, 0.000000, -55.000000, 1.000000);
    TextDrawSetSelectable(Pool1s8, 0);

    Pool1s9 = TextDrawCreate(85.000000, 247.000000, "_");
    TextDrawBackgroundColor(Pool1s9, 0);
    TextDrawFont(Pool1s9, 5);
    TextDrawLetterSize(Pool1s9, 0.500000, 1.000000);
    TextDrawColor(Pool1s9, -1);
    TextDrawSetOutline(Pool1s9, 0);
    TextDrawSetProportional(Pool1s9, 1);
    TextDrawSetShadow(Pool1s9, 1);
    TextDrawUseBox(Pool1s9, 1);
    TextDrawBoxColor(Pool1s9, 0);
    TextDrawTextSize(Pool1s9, 20.000000, 22.000000);
    TextDrawSetPreviewModel(Pool1s9, 2995);
    TextDrawSetPreviewRot(Pool1s9, -16.000000, 0.000000, -55.000000, 1.000000);
    TextDrawSetSelectable(Pool1s9, 0);

    Pool1s10 = TextDrawCreate(23.000000, 272.000000, "~y~Marinica ~w~~h~- 0/8");
    TextDrawBackgroundColor(Pool1s10, 0);
    TextDrawFont(Pool1s10, 2);
    TextDrawLetterSize(Pool1s10, 0.180000, 1.200000);
    TextDrawColor(Pool1s10, -1);
    TextDrawSetOutline(Pool1s10, 0);
    TextDrawSetProportional(Pool1s10, 1);
    TextDrawSetShadow(Pool1s10, 1);
    TextDrawSetSelectable(Pool1s10, 0);

    Pool1s11 = TextDrawCreate(19.000000, 279.000000, "_");
    TextDrawBackgroundColor(Pool1s11, 0);
    TextDrawFont(Pool1s11, 5);
    TextDrawLetterSize(Pool1s11, 0.500000, 1.000000);
    TextDrawColor(Pool1s11, -1);
    TextDrawSetOutline(Pool1s11, 0);
    TextDrawSetProportional(Pool1s11, 1);
    TextDrawSetShadow(Pool1s11, 1);
    TextDrawUseBox(Pool1s11, 1);
    TextDrawBoxColor(Pool1s11, 0);
    TextDrawTextSize(Pool1s11, 20.000000, 22.000000);
    TextDrawSetPreviewModel(Pool1s11, 3100);
    TextDrawSetPreviewRot(Pool1s11, -16.000000, 0.000000, -55.000000, 1.000000);
    TextDrawSetSelectable(Pool1s11, 0);

    Pool1s12 = TextDrawCreate(30.000000, 279.000000, "_");
    TextDrawBackgroundColor(Pool1s12, 0);
    TextDrawFont(Pool1s12, 5);
    TextDrawLetterSize(Pool1s12, 0.500000, 1.000000);
    TextDrawColor(Pool1s12, -1);
    TextDrawSetOutline(Pool1s12, 0);
    TextDrawSetProportional(Pool1s12, 1);
    TextDrawSetShadow(Pool1s12, 1);
    TextDrawUseBox(Pool1s12, 1);
    TextDrawBoxColor(Pool1s12, 0);
    TextDrawTextSize(Pool1s12, 20.000000, 22.000000);
    TextDrawSetPreviewModel(Pool1s12, 3105);
    TextDrawSetPreviewRot(Pool1s12, -16.000000, 0.000000, -55.000000, 1.000000);
    TextDrawSetSelectable(Pool1s12, 0);

    Pool1s13 = TextDrawCreate(41.000000, 279.000000, "_");
    TextDrawBackgroundColor(Pool1s13, 0);
    TextDrawFont(Pool1s13, 5);
    TextDrawLetterSize(Pool1s13, 0.500000, 1.000000);
    TextDrawColor(Pool1s13, -1);
    TextDrawSetOutline(Pool1s13, 0);
    TextDrawSetProportional(Pool1s13, 1);
    TextDrawSetShadow(Pool1s13, 1);
    TextDrawUseBox(Pool1s13, 1);
    TextDrawBoxColor(Pool1s13, 0);
    TextDrawTextSize(Pool1s13, 20.000000, 22.000000);
    TextDrawSetPreviewModel(Pool1s13, 3104);
    TextDrawSetPreviewRot(Pool1s13, -16.000000, 0.000000, -55.000000, 1.000000);
    TextDrawSetSelectable(Pool1s13, 0);

    Pool1s14 = TextDrawCreate(52.000000, 279.000000, "_");
    TextDrawBackgroundColor(Pool1s14, 0);
    TextDrawFont(Pool1s14, 5);
    TextDrawLetterSize(Pool1s14, 0.500000, 1.000000);
    TextDrawColor(Pool1s14, -1);
    TextDrawSetOutline(Pool1s14, 0);
    TextDrawSetProportional(Pool1s14, 1);
    TextDrawSetShadow(Pool1s14, 1);
    TextDrawUseBox(Pool1s14, 1);
    TextDrawBoxColor(Pool1s14, 0);
    TextDrawTextSize(Pool1s14, 20.000000, 22.000000);
    TextDrawSetPreviewModel(Pool1s14, 3103);
    TextDrawSetPreviewRot(Pool1s14, -16.000000, 0.000000, -55.000000, 1.000000);
    TextDrawSetSelectable(Pool1s14, 0);

    Pool1s15 = TextDrawCreate(62.000000, 279.000000, "_");
    TextDrawBackgroundColor(Pool1s15, 0);
    TextDrawFont(Pool1s15, 5);
    TextDrawLetterSize(Pool1s15, 0.500000, 1.000000);
    TextDrawColor(Pool1s15, -1);
    TextDrawSetOutline(Pool1s15, 0);
    TextDrawSetProportional(Pool1s15, 1);
    TextDrawSetShadow(Pool1s15, 1);
    TextDrawUseBox(Pool1s15, 1);
    TextDrawBoxColor(Pool1s15, 0);
    TextDrawTextSize(Pool1s15, 20.000000, 22.000000);
    TextDrawSetPreviewModel(Pool1s15, 3102);
    TextDrawSetPreviewRot(Pool1s15, -16.000000, 0.000000, -55.000000, 1.000000);
    TextDrawSetSelectable(Pool1s15, 0);

    Pool1s16 = TextDrawCreate(73.000000, 279.000000, "_");
    TextDrawBackgroundColor(Pool1s16, 0);
    TextDrawFont(Pool1s16, 5);
    TextDrawLetterSize(Pool1s16, 0.500000, 1.000000);
    TextDrawColor(Pool1s16, -1);
    TextDrawSetOutline(Pool1s16, 0);
    TextDrawSetProportional(Pool1s16, 1);
    TextDrawSetShadow(Pool1s16, 1);
    TextDrawUseBox(Pool1s16, 1);
    TextDrawBoxColor(Pool1s16, 0);
    TextDrawTextSize(Pool1s16, 20.000000, 22.000000);
    TextDrawSetPreviewModel(Pool1s16, 3101);
    TextDrawSetPreviewRot(Pool1s16, 0.000000, 0.000000, -55.000000, 1.000000);
    TextDrawSetSelectable(Pool1s16, 0);

    Pool1s17 = TextDrawCreate(84.000000, 279.000000, "_");
    TextDrawBackgroundColor(Pool1s17, 0);
    TextDrawFont(Pool1s17, 5);
    TextDrawLetterSize(Pool1s17, 0.500000, 1.000000);
    TextDrawColor(Pool1s17, -1);
    TextDrawSetOutline(Pool1s17, 0);
    TextDrawSetProportional(Pool1s17, 1);
    TextDrawSetShadow(Pool1s17, 1);
    TextDrawUseBox(Pool1s17, 1);
    TextDrawBoxColor(Pool1s17, 0);
    TextDrawTextSize(Pool1s17, 20.000000, 22.000000);
    TextDrawSetPreviewModel(Pool1s17, 3002);
    TextDrawSetPreviewRot(Pool1s17, -16.000000, 0.000000, -55.000000, 1.000000);
    TextDrawSetSelectable(Pool1s17, 0);

    Pool1s18 = TextDrawCreate(13.000000, 211.000000, "_");
    TextDrawBackgroundColor(Pool1s18, 0);
    TextDrawFont(Pool1s18, 5);
    TextDrawLetterSize(Pool1s18, 0.500000, 1.000000);
    TextDrawColor(Pool1s18, -1);
    TextDrawSetOutline(Pool1s18, 0);
    TextDrawSetProportional(Pool1s18, 1);
    TextDrawSetShadow(Pool1s18, 1);
    TextDrawUseBox(Pool1s18, 1);
    TextDrawBoxColor(Pool1s18, 0);
    TextDrawTextSize(Pool1s18, 30.000000, 37.000000);
    TextDrawSetPreviewModel(Pool1s18, 2965);
    TextDrawSetPreviewRot(Pool1s18, 60.000000, 0.000000, -55.000000, 1.000000);
    TextDrawSetSelectable(Pool1s18, 0);

    Pool1s19 = TextDrawCreate(22.000000, 299.000000, "Este randul lui ~y~spoker~w~~h~.");
    TextDrawBackgroundColor(Pool1s19, 200);
    TextDrawFont(Pool1s19, 2);
    TextDrawLetterSize(Pool1s19, 0.180000, 1.100000);
    TextDrawColor(Pool1s19, -1);
    TextDrawSetOutline(Pool1s19, 0);
    TextDrawSetProportional(Pool1s19, 1);
    TextDrawSetShadow(Pool1s19, 1);
    TextDrawSetSelectable(Pool1s19, 0);

    Pool2s1 = TextDrawCreate(159.000000, 241.000000, "_");
    TextDrawBackgroundColor(Pool2s1, 0);
    TextDrawFont(Pool2s1, 1);
    TextDrawLetterSize(Pool2s1, 0.500000, 6.099999);
    TextDrawColor(Pool2s1, -1);
    TextDrawSetOutline(Pool2s1, 0);
    TextDrawSetProportional(Pool2s1, 1);
    TextDrawSetShadow(Pool2s1, 1);
    TextDrawUseBox(Pool2s1, 1);
    TextDrawBoxColor(Pool2s1, 150);
    TextDrawTextSize(Pool2s1, 20.000000, 50.000000);
    TextDrawSetSelectable(Pool2s1, 0);

    Pool2s0 = TextDrawCreate(22.000000, 227.000000, "pool table 2");
    TextDrawBackgroundColor(Pool2s0, 200);
    TextDrawFont(Pool2s0, 2);
    TextDrawLetterSize(Pool2s0, 0.180000, 1.100000);
    TextDrawColor(Pool2s0, -1);
    TextDrawSetOutline(Pool2s0, 0);
    TextDrawSetProportional(Pool2s0, 1);
    TextDrawSetShadow(Pool2s0, 1);
    TextDrawSetSelectable(Pool2s0, 0);

    Pool2s2 = TextDrawCreate(23.000000, 240.000000, "~y~spoker ~w~~h~- 3/8");
    TextDrawBackgroundColor(Pool2s2, 0);
    TextDrawFont(Pool2s2, 2);
    TextDrawLetterSize(Pool2s2, 0.180000, 1.200000);
    TextDrawColor(Pool2s2, -1);
    TextDrawSetOutline(Pool2s2, 0);
    TextDrawSetProportional(Pool2s2, 1);
    TextDrawSetShadow(Pool2s2, 1);
    TextDrawSetSelectable(Pool2s2, 0);

    Pool2s3 = TextDrawCreate(19.000000, 247.000000, "_");
    TextDrawBackgroundColor(Pool2s3, 0);
    TextDrawFont(Pool2s3, 5);
    TextDrawLetterSize(Pool2s3, 0.500000, 1.000000);
    TextDrawColor(Pool2s3, -1);
    TextDrawSetOutline(Pool2s3, 0);
    TextDrawSetProportional(Pool2s3, 1);
    TextDrawSetShadow(Pool2s3, 1);
    TextDrawUseBox(Pool2s3, 1);
    TextDrawBoxColor(Pool2s3, 0);
    TextDrawTextSize(Pool2s3, 20.000000, 22.000000);
    TextDrawSetPreviewModel(Pool2s3, 2998);
    TextDrawSetPreviewRot(Pool2s3, 0.000000, 0.000000, -55.000000, 1.000000);
    TextDrawSetSelectable(Pool2s3, 0);

    Pool2s4 = TextDrawCreate(30.000000, 247.000000, "_");
    TextDrawBackgroundColor(Pool2s4, 0);
    TextDrawFont(Pool2s4, 5);
    TextDrawLetterSize(Pool2s4, 0.500000, 1.000000);
    TextDrawColor(Pool2s4, -1);
    TextDrawSetOutline(Pool2s4, 0);
    TextDrawSetProportional(Pool2s4, 1);
    TextDrawSetShadow(Pool2s4, 1);
    TextDrawUseBox(Pool2s4, 1);
    TextDrawBoxColor(Pool2s4, 0);
    TextDrawTextSize(Pool2s4, 20.000000, 22.000000);
    TextDrawSetPreviewModel(Pool2s4, 3001);
    TextDrawSetPreviewRot(Pool2s4, -16.000000, 0.000000, -55.000000, 1.000000);
    TextDrawSetSelectable(Pool2s4, 0);

    Pool2s5 = TextDrawCreate(41.000000, 247.000000, "_");
    TextDrawBackgroundColor(Pool2s5, 0);
    TextDrawFont(Pool2s5, 5);
    TextDrawLetterSize(Pool2s5, 0.500000, 1.000000);
    TextDrawColor(Pool2s5, -1);
    TextDrawSetOutline(Pool2s5, 0);
    TextDrawSetProportional(Pool2s5, 1);
    TextDrawSetShadow(Pool2s5, 1);
    TextDrawUseBox(Pool2s5, 1);
    TextDrawBoxColor(Pool2s5, 0);
    TextDrawTextSize(Pool2s5, 20.000000, 22.000000);
    TextDrawSetPreviewModel(Pool2s5, 3000);
    TextDrawSetPreviewRot(Pool2s5, -16.000000, 0.000000, -55.000000, 1.000000);
    TextDrawSetSelectable(Pool2s5, 0);

    Pool2s6 = TextDrawCreate(52.000000, 247.000000, "_");
    TextDrawBackgroundColor(Pool2s6, 0);
    TextDrawFont(Pool2s6, 5);
    TextDrawLetterSize(Pool2s6, 0.500000, 1.000000);
    TextDrawColor(Pool2s6, -1);
    TextDrawSetOutline(Pool2s6, 0);
    TextDrawSetProportional(Pool2s6, 1);
    TextDrawSetShadow(Pool2s6, 1);
    TextDrawUseBox(Pool2s6, 1);
    TextDrawBoxColor(Pool2s6, 0);
    TextDrawTextSize(Pool2s6, 20.000000, 22.000000);
    TextDrawSetPreviewModel(Pool2s6, 2999);
    TextDrawSetPreviewRot(Pool2s6, -16.000000, 0.000000, -55.000000, 1.000000);
    TextDrawSetSelectable(Pool2s6, 0);

    Pool2s7 = TextDrawCreate(63.000000, 247.000000, "_");
    TextDrawBackgroundColor(Pool2s7, 0);
    TextDrawFont(Pool2s7, 5);
    TextDrawLetterSize(Pool2s7, 0.500000, 1.000000);
    TextDrawColor(Pool2s7, -1);
    TextDrawSetOutline(Pool2s7, 0);
    TextDrawSetProportional(Pool2s7, 1);
    TextDrawSetShadow(Pool2s7, 1);
    TextDrawUseBox(Pool2s7, 1);
    TextDrawBoxColor(Pool2s7, 0);
    TextDrawTextSize(Pool2s7, 20.000000, 22.000000);
    TextDrawSetPreviewModel(Pool2s7, 2997);
    TextDrawSetPreviewRot(Pool2s7, -16.000000, 0.000000, -55.000000, 1.000000);
    TextDrawSetSelectable(Pool2s7, 0);

    Pool2s8 = TextDrawCreate(74.000000, 247.000000, "_");
    TextDrawBackgroundColor(Pool2s8, 0);
    TextDrawFont(Pool2s8, 5);
    TextDrawLetterSize(Pool2s8, 0.500000, 1.000000);
    TextDrawColor(Pool2s8, -1);
    TextDrawSetOutline(Pool2s8, 0);
    TextDrawSetProportional(Pool2s8, 1);
    TextDrawSetShadow(Pool2s8, 1);
    TextDrawUseBox(Pool2s8, 1);
    TextDrawBoxColor(Pool2s8, 0);
    TextDrawTextSize(Pool2s8, 20.000000, 22.000000);
    TextDrawSetPreviewModel(Pool2s8, 2996);
    TextDrawSetPreviewRot(Pool2s8, -16.000000, 0.000000, -55.000000, 1.000000);
    TextDrawSetSelectable(Pool2s8, 0);

    Pool2s9 = TextDrawCreate(85.000000, 247.000000, "_");
    TextDrawBackgroundColor(Pool2s9, 0);
    TextDrawFont(Pool2s9, 5);
    TextDrawLetterSize(Pool2s9, 0.500000, 1.000000);
    TextDrawColor(Pool2s9, -1);
    TextDrawSetOutline(Pool2s9, 0);
    TextDrawSetProportional(Pool2s9, 1);
    TextDrawSetShadow(Pool2s9, 1);
    TextDrawUseBox(Pool2s9, 1);
    TextDrawBoxColor(Pool2s9, 0);
    TextDrawTextSize(Pool2s9, 20.000000, 22.000000);
    TextDrawSetPreviewModel(Pool2s9, 2995);
    TextDrawSetPreviewRot(Pool2s9, -16.000000, 0.000000, -55.000000, 1.000000);
    TextDrawSetSelectable(Pool2s9, 0);

    Pool2s10 = TextDrawCreate(23.000000, 272.000000, "~y~Marinica ~w~~h~- 0/8");
    TextDrawBackgroundColor(Pool2s10, 0);
    TextDrawFont(Pool2s10, 2);
    TextDrawLetterSize(Pool2s10, 0.180000, 1.200000);
    TextDrawColor(Pool2s10, -1);
    TextDrawSetOutline(Pool2s10, 0);
    TextDrawSetProportional(Pool2s10, 1);
    TextDrawSetShadow(Pool2s10, 1);
    TextDrawSetSelectable(Pool2s10, 0);

    Pool2s11 = TextDrawCreate(19.000000, 279.000000, "_");
    TextDrawBackgroundColor(Pool2s11, 0);
    TextDrawFont(Pool2s11, 5);
    TextDrawLetterSize(Pool2s11, 0.500000, 1.000000);
    TextDrawColor(Pool2s11, -1);
    TextDrawSetOutline(Pool2s11, 0);
    TextDrawSetProportional(Pool2s11, 1);
    TextDrawSetShadow(Pool2s11, 1);
    TextDrawUseBox(Pool2s11, 1);
    TextDrawBoxColor(Pool2s11, 0);
    TextDrawTextSize(Pool2s11, 20.000000, 22.000000);
    TextDrawSetPreviewModel(Pool2s11, 3100);
    TextDrawSetPreviewRot(Pool2s11, -16.000000, 0.000000, -55.000000, 1.000000);
    TextDrawSetSelectable(Pool2s11, 0);

    Pool2s12 = TextDrawCreate(30.000000, 279.000000, "_");
    TextDrawBackgroundColor(Pool2s12, 0);
    TextDrawFont(Pool2s12, 5);
    TextDrawLetterSize(Pool2s12, 0.500000, 1.000000);
    TextDrawColor(Pool2s12, -1);
    TextDrawSetOutline(Pool2s12, 0);
    TextDrawSetProportional(Pool2s12, 1);
    TextDrawSetShadow(Pool2s12, 1);
    TextDrawUseBox(Pool2s12, 1);
    TextDrawBoxColor(Pool2s12, 0);
    TextDrawTextSize(Pool2s12, 20.000000, 22.000000);
    TextDrawSetPreviewModel(Pool2s12, 3105);
    TextDrawSetPreviewRot(Pool2s12, -16.000000, 0.000000, -55.000000, 1.000000);
    TextDrawSetSelectable(Pool2s12, 0);

    Pool2s13 = TextDrawCreate(41.000000, 279.000000, "_");
    TextDrawBackgroundColor(Pool2s13, 0);
    TextDrawFont(Pool2s13, 5);
    TextDrawLetterSize(Pool2s13, 0.500000, 1.000000);
    TextDrawColor(Pool2s13, -1);
    TextDrawSetOutline(Pool2s13, 0);
    TextDrawSetProportional(Pool2s13, 1);
    TextDrawSetShadow(Pool2s13, 1);
    TextDrawUseBox(Pool2s13, 1);
    TextDrawBoxColor(Pool2s13, 0);
    TextDrawTextSize(Pool2s13, 20.000000, 22.000000);
    TextDrawSetPreviewModel(Pool2s13, 3104);
    TextDrawSetPreviewRot(Pool2s13, -16.000000, 0.000000, -55.000000, 1.000000);
    TextDrawSetSelectable(Pool2s13, 0);

    Pool2s14 = TextDrawCreate(52.000000, 279.000000, "_");
    TextDrawBackgroundColor(Pool2s14, 0);
    TextDrawFont(Pool2s14, 5);
    TextDrawLetterSize(Pool2s14, 0.500000, 1.000000);
    TextDrawColor(Pool2s14, -1);
    TextDrawSetOutline(Pool2s14, 0);
    TextDrawSetProportional(Pool2s14, 1);
    TextDrawSetShadow(Pool2s14, 1);
    TextDrawUseBox(Pool2s14, 1);
    TextDrawBoxColor(Pool2s14, 0);
    TextDrawTextSize(Pool2s14, 20.000000, 22.000000);
    TextDrawSetPreviewModel(Pool2s14, 3103);
    TextDrawSetPreviewRot(Pool2s14, -16.000000, 0.000000, -55.000000, 1.000000);
    TextDrawSetSelectable(Pool2s14, 0);

    Pool2s15 = TextDrawCreate(62.000000, 279.000000, "_");
    TextDrawBackgroundColor(Pool2s15, 0);
    TextDrawFont(Pool2s15, 5);
    TextDrawLetterSize(Pool2s15, 0.500000, 1.000000);
    TextDrawColor(Pool2s15, -1);
    TextDrawSetOutline(Pool2s15, 0);
    TextDrawSetProportional(Pool2s15, 1);
    TextDrawSetShadow(Pool2s15, 1);
    TextDrawUseBox(Pool2s15, 1);
    TextDrawBoxColor(Pool2s15, 0);
    TextDrawTextSize(Pool2s15, 20.000000, 22.000000);
    TextDrawSetPreviewModel(Pool2s15, 3102);
    TextDrawSetPreviewRot(Pool2s15, -16.000000, 0.000000, -55.000000, 1.000000);
    TextDrawSetSelectable(Pool2s15, 0);

    Pool2s16 = TextDrawCreate(73.000000, 279.000000, "_");
    TextDrawBackgroundColor(Pool2s16, 0);
    TextDrawFont(Pool2s16, 5);
    TextDrawLetterSize(Pool2s16, 0.500000, 1.000000);
    TextDrawColor(Pool2s16, -1);
    TextDrawSetOutline(Pool2s16, 0);
    TextDrawSetProportional(Pool2s16, 1);
    TextDrawSetShadow(Pool2s16, 1);
    TextDrawUseBox(Pool2s16, 1);
    TextDrawBoxColor(Pool2s16, 0);
    TextDrawTextSize(Pool2s16, 20.000000, 22.000000);
    TextDrawSetPreviewModel(Pool2s16, 3101);
    TextDrawSetPreviewRot(Pool2s16, 0.000000, 0.000000, -55.000000, 1.000000);
    TextDrawSetSelectable(Pool2s16, 0);

    Pool2s17 = TextDrawCreate(84.000000, 279.000000, "_");
    TextDrawBackgroundColor(Pool2s17, 0);
    TextDrawFont(Pool2s17, 5);
    TextDrawLetterSize(Pool2s17, 0.500000, 1.000000);
    TextDrawColor(Pool2s17, -1);
    TextDrawSetOutline(Pool2s17, 0);
    TextDrawSetProportional(Pool2s17, 1);
    TextDrawSetShadow(Pool2s17, 1);
    TextDrawUseBox(Pool2s17, 1);
    TextDrawBoxColor(Pool2s17, 0);
    TextDrawTextSize(Pool2s17, 20.000000, 22.000000);
    TextDrawSetPreviewModel(Pool2s17, 3002);
    TextDrawSetPreviewRot(Pool2s17, -16.000000, 0.000000, -55.000000, 1.000000);
    TextDrawSetSelectable(Pool2s17, 0);

    Pool2s18 = TextDrawCreate(13.000000, 211.000000, "_");
    TextDrawBackgroundColor(Pool2s18, 0);
    TextDrawFont(Pool2s18, 5);
    TextDrawLetterSize(Pool2s18, 0.500000, 1.000000);
    TextDrawColor(Pool2s18, -1);
    TextDrawSetOutline(Pool2s18, 0);
    TextDrawSetProportional(Pool2s18, 1);
    TextDrawSetShadow(Pool2s18, 1);
    TextDrawUseBox(Pool2s18, 1);
    TextDrawBoxColor(Pool2s18, 0);
    TextDrawTextSize(Pool2s18, 30.000000, 37.000000);
    TextDrawSetPreviewModel(Pool2s18, 2965);
    TextDrawSetPreviewRot(Pool2s18, 60.000000, 0.000000, -55.000000, 1.000000);
    TextDrawSetSelectable(Pool2s18, 0);

    Pool2s19 = TextDrawCreate(22.000000, 299.000000, "Este randul lui ~y~spoker~w~~h~.");
    TextDrawBackgroundColor(Pool2s19, 200);
    TextDrawFont(Pool2s19, 2);
    TextDrawLetterSize(Pool2s19, 0.180000, 1.100000);
    TextDrawColor(Pool2s19, -1);
    TextDrawSetOutline(Pool2s19, 0);
    TextDrawSetProportional(Pool2s19, 1);
    TextDrawSetShadow(Pool2s19, 1);
    TextDrawSetSelectable(Pool2s19, 0);
    return 1;
}
hook OnPlayerDisconnect(playerid, reason) 
{
	if(PlayingPool[playerid])
        {
            SetPlayerHealth(PlayerInfo[playerid][pPoolIn], hPr[PlayerInfo[playerid][pPoolIn]]), SetPlayerPos(PlayerInfo[playerid][pPoolIn], 502.1467,-68.7983,998.7578);
            if(PoolIDP[playerid] == 1)
            {
                DestroyObject(AimObject), ClearAnimations(PoolAimer), PoolAimer = -1, AimObject = 0;
                TogglePlayerControllable(PlayerInfo[playerid][pPoolIn], 1), SetCameraBehindPlayer(PlayerInfo[playerid][pPoolIn]), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], PoolTD0), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], PoolTDs1), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], PoolTD2), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], PoolTD3);
                format(poolst, 150, "* %s a parasit masa jocului, ai primit jumatate din miza. (+%s$)", nm[playerid], FormatNumber(StakePol1/2)), SendClientMessage(PlayerInfo[playerid][pPoolIn], COLOR_LIGHTBLUE, poolst);
                TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s0), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s1), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s2), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s3);
                TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s4), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s5), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s6), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s7);
                TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s8), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s9), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s10), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s11);
                TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s12), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s13), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s14), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s15);
                TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s16), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s17), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s18), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s19);
                StakePol1 = StakePol1/2, GiveMoney(PlayerInfo[playerid][pPoolIn], StakePol1), PlayerInfo[playerid][pMoney] -= StakePol1, PlayingPool[PlayerInfo[playerid][pPoolIn]] = 0, pool1ob = CreateDynamicObject(338, 510.26770, -83.64490, 998.26721,   4.00000, 0.00000, 0.00000), pool2ob2 = CreateDynamicObject(338, 509.84470, -83.64490, 998.26721,   4.00000, 0.00000, 0.00000), plas1 = CreateDynamicObject(2965, 510.18771, -85.37160, 998.86182,   0.00000, 0.00000, -213.00000),
                UpdateDynamic3DTextLabelText(PoolTD1, -1, "Pool Table #1\nStatus: {00BA19}Available\n{FFFFFF}Type {33C494}/pool {FFFFFF}to play billiards."), RemovePlayerWeapon(PlayerInfo[playerid][pPoolIn], 7), PlayingPool[playerid] = 0, PoolStarted = 0, RespawnPoolBalls();
                if(!(PoolStarted || PoolStarted2)) KillTimer(pydas), pydas = -1;
            }
            else
            {
                DestroyObject(Aim2Object), ClearAnimations(Pool2Aimer), Pool2Aimer = -1, Aim2Object = 0;
                TogglePlayerControllable(PlayerInfo[playerid][pPoolIn], 1), SetCameraBehindPlayer(PlayerInfo[playerid][pPoolIn]), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2TD0), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2TDs1), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2TD2), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2TD3);
                format(poolst, 150, "* %s a parasit masa jocului, ai primit jumatate din miza. (+%s$)", nm[playerid], FormatNumber(StakePol2/2)), SendClientMessage(PlayerInfo[playerid][pPoolIn], COLOR_LIGHTBLUE, poolst);
                TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s0), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s1), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s2), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s3);
                TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s4), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s5), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s6), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s7);
                TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s8), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s9), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s10), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s11);
                TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s12), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s13), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s14), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s15);
                TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s16), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s17), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s18), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s19);
                StakePol2 = StakePol2/2, GiveMoney(PlayerInfo[playerid][pPoolIn], StakePol2), PlayerInfo[playerid][pMoney] -= StakePol2, PlayingPool[PlayerInfo[playerid][pPoolIn]] = 0, pool21ob = CreateDynamicObject(338, 506.64871, -83.64490, 998.26721,   4.00000, 0.00000, 0.00000), pool22ob2 = CreateDynamicObject(338, 506.22571, -83.64490, 998.26721,   4.00000, 0.00000, 0.00000), plas2 = CreateDynamicObject(2965, 506.55569, -85.37160, 998.86182,   0.00000, 0.00000, -210.00000),
                UpdateDynamic3DTextLabelText(Pool2TD1, -1, "Pool Table #2\nStatus: {00BA19}Available\n{FFFFFF}Type {33C494}/pool {FFFFFF}to play billiards."), RemovePlayerWeapon(PlayerInfo[playerid][pPoolIn], 7), PlayingPool[playerid] = 0, PoolStarted2 = 0, RespawnPool2Balls();
                if(!(PoolStarted || PoolStarted2)) KillTimer(pydas), pydas = -1;
            }
        }
   	}
   	return 1;
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(PlayingPool[playerid])
    {
        if(PoolIDP[playerid] == 1)
        {
            if(PoolRand[playerid] && IsKeyJustUp(KEY_JUMP, newkeys, oldkeys) && PoolAimer == playerid)
            {
                if(PoolCamera[playerid] < 2 ? (PoolCamera[playerid]++) : (PoolCamera[playerid] = 0))
                poolrott = AimAngle[playerid][0], GetObjectPos(PoolBall[0][bObject], Xa2, Ya2, Za2);
                switch(PoolCamera[playerid])
                {
                    case 0: GetXYBehindObjectInAngle(PoolBall[0][bObject], poolrott, x22, y22, 0.675), SetPlayerCameraPos(playerid, x22, y22, 998.86785888672+0.28), SetPlayerCameraLookAt(playerid, Xa2, Ya2, Za2+0.170);
                    case 1: SetPlayerCameraPos(playerid, 511.84469604492, -84.831642150879, 1001.4904174805), SetPlayerCameraLookAt(playerid,510.11267089844, -84.831642150879, 998.86785888672);
                    case 2: SetPlayerCameraPos(playerid, 508.7971496582, -84.831642150879, 1001.4904174805), SetPlayerCameraLookAt(playerid,510.11267089844, -84.831642150879, 998.86785888672);
                }
            }
            if(PoolRand[playerid] && IsKeyJustUp(KEY_HANDBRAKE, newkeys, oldkeys) && AreAllBallsStopped())
            {
                if((PoolAimer != playerid) && PoolAimer == -1 && PoolBall[0][bExisting])
                {
                    GetPlayerPos(playerid, Xq, Yq, Zq), GetObjectPos(PoolBall[0][bObject], Xayu, Yayu, Zayu);
                    if(Is2DPointInRangeOfPoint(Xq, Yq, Xayu, Yayu, 1.5) && Zq < 999.5)
                    {
                        skee = 1, TogglePlayerControllable(playerid, 0), GetAngleToXY(Xayu, Yayu, Xq, Yq, poolrotx), SetPlayerFacingAngle(playerid, poolrotx);
                        AimAngle[playerid][0] = poolrotx, AimAngle[playerid][1] = poolrotx, SetPlayerArmedWeapon(playerid, 0);
                        GetXYInFrontOfPos(Xayu, Yayu, poolrotx+180, xws, yws, 0.085), AimObject = CreateObject(3004, xws, yws, Zayu, 7.0, 0, poolrotx+180);
                        switch(PoolCamera[playerid])
                        {
                            case 0: GetXYBehindObjectInAngle(PoolBall[0][bObject], poolrotx, xws, yws, 0.675), SetPlayerCameraPos(playerid, xws, yws, 998.86785888672+0.28), SetPlayerCameraLookAt(playerid, Xayu, Yayu, Zayu+0.170);
                            case 1: SetPlayerCameraPos(playerid, 511.84469604492, -84.831642150879, 1001.4904174805), SetPlayerCameraLookAt(playerid,510.11267089844, -84.831642150879, 998.86785888672);
                            case 2: SetPlayerCameraPos(playerid, 508.7971496582, -84.831642150879, 1001.4904174805), SetPlayerCameraLookAt(playerid,510.11267089844, -84.831642150879, 998.86785888672);
                        }
                        ApplyAnimation(playerid, "POOL", "POOL_Med_Start",50.0,0,0,0,1,1,1), PoolAimer = playerid;
                        TextDrawShowForPlayer(playerid, PoolTD0), TextDrawShowForPlayer(playerid, PoolTDs1), TextDrawTextSize(PoolTD2, 501.0, 0.0);
                        TextDrawShowForPlayer(playerid, PoolTD2), TextDrawShowForPlayer(playerid, PoolTD3), PoolPower = 1.0, PoolDir = 0;
                    }
                }
                else
                {
                    TogglePlayerControllable(playerid, 1), ApplyAnimation(playerid, "CARRY", "crry_prtial", 1.0, 0, 0, 0, 0, 0, 1);
                    SetCameraBehindPlayer(playerid), PoolAimer = -1, DestroyObject(AimObject), AimObject = 0;
                    TextDrawHideForPlayer(playerid, PoolTD0), TextDrawHideForPlayer(playerid, PoolTDs1), TextDrawHideForPlayer(playerid, PoolTD2), TextDrawHideForPlayer(playerid, PoolTD3);
                }
            }
            if(PoolRand[playerid] && IsKeyJustUp(KEY_FIRE, newkeys, oldkeys) && PoolAimer == playerid)
            {
                ApplyAnimation(playerid, "POOL", "POOL_Med_Shot",3.0,0,0,0,0,0,1), speedp2 = 0.4 + (PoolPower * 2.0) / 100.0, PHY_SetObjectVelocity(PoolBall[0][bObject], speedp2 * floatsin(-AimAngle[playerid][0], degrees), speedp2 * floatcos(-AimAngle[playerid][0], degrees));
                if(PoolCamera[playerid] == 0)
                {
                    switch(random(3))
                    {
                        case 0: SetPlayerCameraPos(playerid, 511.84469604492, -84.831642150879, 1001.4904174805);
                        case 1: SetPlayerCameraPos(playerid, 508.7971496582, -84.831642150879, 1001.4904174805);
                        default: SetPlayerCameraPos(playerid, 509.0545, -83.4064, 1000.6133);
                    }
                    SetPlayerCameraLookAt(playerid,510.11267089844, -84.831642150879, 998.86785888672);
                }
                PoolAimer = -1, DestroyObject(AimObject), AimObject = 0, PoolLastShooter = playerid;
            }
            return 1;
        }
        else
        {
            if(PoolRand[playerid] && IsKeyJustUp(KEY_JUMP, newkeys, oldkeys) && Pool2Aimer == playerid)
            {
                if(PoolCamera[playerid] < 2 ? (PoolCamera[playerid]++) : (PoolCamera[playerid] = 0))
                poolrott2 = Aim2Angle[playerid][0], GetObjectPos(Pool2Ball[0][bObject], Xa2, Ya2, Za2);
                switch(PoolCamera[playerid])
                {
                    case 0: GetXYBehindObjectInAngle(Pool2Ball[0][bObject], poolrott2, x22, y22, 0.675), SetPlayerCameraPos(playerid, x22, y22, 998.86785888672+0.28), SetPlayerCameraLookAt(playerid, Xa2, Ya2, Za2+0.170);
                    case 1: SetPlayerCameraPos(playerid, 507.9283, -84.8733, 1000.7607), SetPlayerCameraLookAt(playerid, 506.9373, -84.9959, 999.3845);
                    case 2: SetPlayerCameraPos(playerid, 505.1312, -84.6223, 1000.8639), SetPlayerCameraLookAt(playerid, 506.1287, -84.6670, 999.2877);
                }
            }
            if(PoolRand[playerid] && IsKeyJustUp(KEY_HANDBRAKE, newkeys, oldkeys) && AreAllBalls2Stopped())
            {
                if((Pool2Aimer != playerid) && Pool2Aimer == -1 && Pool2Ball[0][bExisting])
                {
                    GetPlayerPos(playerid, Xq, Yq, Zq), GetObjectPos(Pool2Ball[0][bObject], Xayu, Yayu, Zayu);
                    if(Is2DPointInRangeOfPoint(Xq, Yq, Xayu, Yayu, 1.5) && Zq < 999.5)
                    {
                        skeee = 1, TogglePlayerControllable(playerid, 0), GetAngleToXY(Xayu, Yayu, Xq, Yq, poolrotx), SetPlayerFacingAngle(playerid, poolrotx);
                        Aim2Angle[playerid][0] = poolrotx, Aim2Angle[playerid][1] = poolrotx, SetPlayerArmedWeapon(playerid, 0);
                        GetXYInFrontOfPos(Xayu, Yayu, poolrotx+180, xws, yws, 0.085), Aim2Object = CreateObject(3004, xws, yws, Zayu, 7.0, 0, poolrotx+180);
                        switch(PoolCamera[playerid])
                        {
                            case 0: GetXYBehindObjectInAngle(Pool2Ball[0][bObject], poolrotx, xws, yws, 0.675), SetPlayerCameraPos(playerid, xws, yws, 998.86785888672+0.28), SetPlayerCameraLookAt(playerid, Xayu, Yayu, Zayu+0.170);
                            case 1: SetPlayerCameraPos(playerid, 507.9283, -84.8733, 1000.7607), SetPlayerCameraLookAt(playerid, 506.9373, -84.9959, 999.3845);
                            case 2: SetPlayerCameraPos(playerid, 505.1312, -84.6223, 1000.8639), SetPlayerCameraLookAt(playerid, 506.1287, -84.6670, 999.2877);
                        }
                        ApplyAnimation(playerid, "POOL", "POOL_Med_Start",50.0,0,0,0,1,1,1), Pool2Aimer = playerid;
                        TextDrawShowForPlayer(playerid, Pool2TD0), TextDrawShowForPlayer(playerid, Pool2TDs1), TextDrawTextSize(Pool2TD2, 501.0, 0.0);
                        TextDrawShowForPlayer(playerid, Pool2TD2), TextDrawShowForPlayer(playerid, Pool2TD3), Pool2Power = 1.0, Pool2Dir = 0;
                    }
                }
                else
                {
                    TogglePlayerControllable(playerid, 1), ApplyAnimation(playerid, "CARRY", "crry_prtial", 1.0, 0, 0, 0, 0, 0, 1);
                    SetCameraBehindPlayer(playerid), Pool2Aimer = -1, DestroyObject(Aim2Object), Aim2Object = 0;
                    TextDrawHideForPlayer(playerid, Pool2TD0), TextDrawHideForPlayer(playerid, Pool2TDs1), TextDrawHideForPlayer(playerid, Pool2TD2), TextDrawHideForPlayer(playerid, Pool2TD3);
                }
            }
            if(PoolRand[playerid] && IsKeyJustUp(KEY_FIRE, newkeys, oldkeys) && Pool2Aimer == playerid)
            {
                ApplyAnimation(playerid, "POOL", "POOL_Med_Shot",3.0,0,0,0,0,0,1), speedp2 = 0.4 + (Pool2Power * 2.0) / 100.0, PHY_SetObjectVelocity(Pool2Ball[0][bObject], speedp2 * floatsin(-Aim2Angle[playerid][0], degrees), speedp2 * floatcos(-Aim2Angle[playerid][0], degrees));
                if(PoolCamera[playerid] == 0)
                {
                    switch(random(3))
                    {
                        case 0: SetPlayerCameraPos(playerid, 507.9283, -84.8733, 1000.7607), SetPlayerCameraLookAt(playerid, 506.9373, -84.9959, 999.3845);
                        case 1: SetPlayerCameraPos(playerid, 505.1312, -84.6223, 1000.8639), SetPlayerCameraLookAt(playerid, 506.1287, -84.6670, 999.2877);
                        default: SetPlayerCameraPos(playerid, 505.6517, -86.2489, 1000.8670), SetPlayerCameraLookAt(playerid, 505.9407, -85.2931, 999.3307);
                    }
                }
                Pool2Aimer = -1, DestroyObject(Aim2Object), Aim2Object = 0, Pool2LastShooter = playerid;
            }
            return 1;
        }
    }
}
hook OnPlayerDeathEx(playerid, killerid, reason) 
{
	if(PlayingPool[playerid])
        {
            SetPlayerHealth(PlayerInfo[playerid][pPoolIn], hPr[PlayerInfo[playerid][pPoolIn]]), PlayingPool[PlayerInfo[playerid][pPoolIn]] = 0, SetPlayerPos(PlayerInfo[playerid][pPoolIn], 502.1467,-68.7983,998.7578);
            if(PoolIDP[playerid] == 1)
            {
                DestroyObject(AimObject), ClearAnimations(PoolAimer), PoolAimer = -1, AimObject = 0;
                TogglePlayerControllable(playerid, 1), SetCameraBehindPlayer(playerid), TextDrawHideForPlayer(playerid, PoolTD0), TextDrawHideForPlayer(playerid, PoolTDs1), TextDrawHideForPlayer(playerid, PoolTD2), TextDrawHideForPlayer(playerid, PoolTD3);
                TogglePlayerControllable(PlayerInfo[playerid][pPoolIn], 1), SetCameraBehindPlayer(PlayerInfo[playerid][pPoolIn]), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], PoolTD0), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], PoolTDs1), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], PoolTD2), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], PoolTD3);

                format(poolst, 150, "* %s a parasit masa jocului, ai primit jumatate din miza. (+%s$)", nm[playerid], FormatNumber(StakePol1/2)), SendClientMessage(PlayerInfo[playerid][pPoolIn], COLOR_LIGHTBLUE, poolst);
                format(poolst, 150, "* Ai parasit masa jocului, ai pierdut jumatate din miza. (-%s$)", FormatNumber(StakePol1/2)), SendClientMessage(playerid, COLOR_LIGHTBLUE, poolst);
                TextDrawHideForPlayer(playerid, Pool1s0), TextDrawHideForPlayer(playerid, Pool1s1), TextDrawHideForPlayer(playerid, Pool1s2), TextDrawHideForPlayer(playerid, Pool1s3);
                TextDrawHideForPlayer(playerid, Pool1s4), TextDrawHideForPlayer(playerid, Pool1s5), TextDrawHideForPlayer(playerid, Pool1s6), TextDrawHideForPlayer(playerid, Pool1s7);
                TextDrawHideForPlayer(playerid, Pool1s8), TextDrawHideForPlayer(playerid, Pool1s9), TextDrawHideForPlayer(playerid, Pool1s10), TextDrawHideForPlayer(playerid, Pool1s11);
                TextDrawHideForPlayer(playerid, Pool1s12), TextDrawHideForPlayer(playerid, Pool1s13), TextDrawHideForPlayer(playerid, Pool1s14), TextDrawHideForPlayer(playerid, Pool1s15);
                TextDrawHideForPlayer(playerid, Pool1s16), TextDrawHideForPlayer(playerid, Pool1s17), TextDrawHideForPlayer(playerid, Pool1s18), TextDrawHideForPlayer(playerid, Pool1s19);

                TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s0), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s1), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s2), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s3);
                TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s4), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s5), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s6), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s7);
                TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s8), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s9), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s10), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s11);
                TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s12), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s13), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s14), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s15);
                TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s16), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s17), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s18), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s19);
                StakePol1 = StakePol1/2, GiveMoney(PlayerInfo[playerid][pPoolIn], StakePol1), GiveMoney(playerid, -StakePol1), pool1ob = CreateDynamicObject(338, 510.26770, -83.64490, 998.26721,   4.00000, 0.00000, 0.00000), pool2ob2 = CreateDynamicObject(338, 509.84470, -83.64490, 998.26721,   4.00000, 0.00000, 0.00000), plas1 = CreateDynamicObject(2965, 510.18771, -85.37160, 998.86182,   0.00000, 0.00000, -213.00000),
                UpdateDynamic3DTextLabelText(PoolTD1, -1, "Pool Table #1\nStatus: {00BA19}Available\n{FFFFFF}Type {33C494}/pool {FFFFFF}to play billiards."), RemovePlayerWeapon(PlayerInfo[playerid][pPoolIn], 7), RemovePlayerWeapon(playerid, 7), PlayingPool[playerid] = 0, PoolStarted = 0, RespawnPoolBalls();
                if(!(PoolStarted || PoolStarted2)) KillTimer(pydas), pydas = -1;
            }
            else
            {
                DestroyObject(Aim2Object), ClearAnimations(Pool2Aimer), Pool2Aimer = -1, Aim2Object = 0;
                TogglePlayerControllable(playerid, 1), SetCameraBehindPlayer(playerid), TextDrawHideForPlayer(playerid, Pool2TD0), TextDrawHideForPlayer(playerid, Pool2TDs1), TextDrawHideForPlayer(playerid, Pool2TD2), TextDrawHideForPlayer(playerid, Pool2TD3);
                TogglePlayerControllable(PlayerInfo[playerid][pPoolIn], 1), SetCameraBehindPlayer(PlayerInfo[playerid][pPoolIn]), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2TD0), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2TDs1), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2TD2), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2TD3);

                format(poolst, 150, "* %s a parasit masa jocului, ai primit jumatate din miza. (+%s$)", nm[playerid], FormatNumber(StakePol2/2)), SendClientMessage(PlayerInfo[playerid][pPoolIn], COLOR_LIGHTBLUE, poolst);
                format(poolst, 150, "* Ai parasit masa jocului, ai pierdut jumatate din miza. (-%s$)", FormatNumber(StakePol2/2)), SendClientMessage(playerid, COLOR_LIGHTBLUE, poolst);
                TextDrawHideForPlayer(playerid, Pool2s0), TextDrawHideForPlayer(playerid, Pool2s1), TextDrawHideForPlayer(playerid, Pool2s2), TextDrawHideForPlayer(playerid, Pool2s3);
                TextDrawHideForPlayer(playerid, Pool2s4), TextDrawHideForPlayer(playerid, Pool2s5), TextDrawHideForPlayer(playerid, Pool2s6), TextDrawHideForPlayer(playerid, Pool2s7);
                TextDrawHideForPlayer(playerid, Pool2s8), TextDrawHideForPlayer(playerid, Pool2s9), TextDrawHideForPlayer(playerid, Pool2s10), TextDrawHideForPlayer(playerid, Pool2s11);
                TextDrawHideForPlayer(playerid, Pool2s12), TextDrawHideForPlayer(playerid, Pool2s13), TextDrawHideForPlayer(playerid, Pool2s14), TextDrawHideForPlayer(playerid, Pool2s15);
                TextDrawHideForPlayer(playerid, Pool2s16), TextDrawHideForPlayer(playerid, Pool2s17), TextDrawHideForPlayer(playerid, Pool2s18), TextDrawHideForPlayer(playerid, Pool2s19);

                TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s0), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s1), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s2), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s3);
                TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s4), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s5), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s6), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s7);
                TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s8), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s9), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s10), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s11);
                TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s12), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s13), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s14), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s15);
                TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s16), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s17), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s18), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s19);
                StakePol2 = StakePol2/2, GiveMoney(PlayerInfo[playerid][pPoolIn], StakePol2), GiveMoney(playerid, -StakePol2), PlayingPool[PlayerInfo[playerid][pPoolIn]] = 0, pool21ob = CreateDynamicObject(338, 506.64871, -83.64490, 998.26721,   4.00000, 0.00000, 0.00000), pool22ob2 = CreateDynamicObject(338, 506.22571, -83.64490, 998.26721,   4.00000, 0.00000, 0.00000), plas2 = CreateDynamicObject(2965, 506.55569, -85.37160, 998.86182,   0.00000, 0.00000, -210.00000),
                UpdateDynamic3DTextLabelText(Pool2TD1, -1, "Pool Table #2\nStatus: {00BA19}Available\n{FFFFFF}Type {33C494}/pool {FFFFFF}to play billiards."), RemovePlayerWeapon(PlayerInfo[playerid][pPoolIn], 7), RemovePlayerWeapon(playerid, 7), PlayingPool[playerid] = 0, PoolStarted2 = 0, RespawnPool2Balls();
                if(!(PoolStarted || PoolStarted2)) KillTimer(pydas), pydas = -1;
            }
        }
   	}
    return 1;
}
CMD:pool(playerid, params[])
{
    if(PlayingPool[playerid])
    {
        SetPlayerHealth(playerid, hPr[playerid]), SetPlayerHealth(PlayerInfo[playerid][pPoolIn], hPr[PlayerInfo[playerid][pPoolIn]]), SetPlayerPos(playerid, 502.1467,-68.7983,998.7578), SetPlayerPos(PlayerInfo[playerid][pPoolIn], 502.1467,-68.7983,998.7578);
        if(PoolIDP[playerid] == 1)
        {
            DestroyObject(AimObject), ClearAnimations(PoolAimer), PoolAimer = -1, AimObject = 0;
            TogglePlayerControllable(playerid, 1), SetCameraBehindPlayer(playerid), TextDrawHideForPlayer(playerid, PoolTD0), TextDrawHideForPlayer(playerid, PoolTDs1), TextDrawHideForPlayer(playerid, PoolTD2), TextDrawHideForPlayer(playerid, PoolTD3);
            TogglePlayerControllable(PlayerInfo[playerid][pPoolIn], 1), SetCameraBehindPlayer(PlayerInfo[playerid][pPoolIn]), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], PoolTD0), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], PoolTDs1), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], PoolTD2), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], PoolTD3);

            format(poolst, 150, "* %s a parasit masa jocului, ai primit jumatate din miza. (+%s$)", nm[playerid], FormatNumber(StakePol1/2)), SendClientMessage(PlayerInfo[playerid][pPoolIn], COLOR_LIGHTBLUE, poolst);
            format(poolst, 150, "* Ai parasit masa jocului, ai pierdut jumatate din miza. (-%s$)", FormatNumber(StakePol1/2)), SendClientMessage(playerid, COLOR_LIGHTBLUE, poolst);
            TextDrawHideForPlayer(playerid, Pool1s0), TextDrawHideForPlayer(playerid, Pool1s1), TextDrawHideForPlayer(playerid, Pool1s2), TextDrawHideForPlayer(playerid, Pool1s3);
            TextDrawHideForPlayer(playerid, Pool1s4), TextDrawHideForPlayer(playerid, Pool1s5), TextDrawHideForPlayer(playerid, Pool1s6), TextDrawHideForPlayer(playerid, Pool1s7);
            TextDrawHideForPlayer(playerid, Pool1s8), TextDrawHideForPlayer(playerid, Pool1s9), TextDrawHideForPlayer(playerid, Pool1s10), TextDrawHideForPlayer(playerid, Pool1s11);
            TextDrawHideForPlayer(playerid, Pool1s12), TextDrawHideForPlayer(playerid, Pool1s13), TextDrawHideForPlayer(playerid, Pool1s14), TextDrawHideForPlayer(playerid, Pool1s15);
            TextDrawHideForPlayer(playerid, Pool1s16), TextDrawHideForPlayer(playerid, Pool1s17), TextDrawHideForPlayer(playerid, Pool1s18), TextDrawHideForPlayer(playerid, Pool1s19);

            TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s0), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s1), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s2), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s3);
            TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s4), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s5), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s6), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s7);
            TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s8), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s9), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s10), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s11);
            TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s12), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s13), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s14), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s15);
            TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s16), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s17), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s18), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool1s19);
            StakePol1 = StakePol1/2, GiveMoney(PlayerInfo[playerid][pPoolIn], StakePol1), GiveMoney(playerid, -StakePol1), PlayingPool[PlayerInfo[playerid][pPoolIn]] = 0, pool1ob = CreateDynamicObject(338, 510.26770, -83.64490, 998.26721,   4.00000, 0.00000, 0.00000), pool2ob2 = CreateDynamicObject(338, 509.84470, -83.64490, 998.26721,   4.00000, 0.00000, 0.00000), plas1 = CreateDynamicObject(2965, 510.18771, -85.37160, 998.86182,   0.00000, 0.00000, -213.00000),
            UpdateDynamic3DTextLabelText(PoolTD1, -1, "Pool Table #1\nStatus: {00BA19}Available\n{FFFFFF}Type {33C494}/pool {FFFFFF}to play billiards."), RemovePlayerWeapon(PlayerInfo[playerid][pPoolIn], 7), RemovePlayerWeapon(playerid, 7), PlayingPool[playerid] = 0, PoolStarted = 0, RespawnPoolBalls();
            if(!(PoolStarted || PoolStarted2)) KillTimer(pydas), pydas = -1;
        }
        else
        {
            DestroyObject(Aim2Object), ClearAnimations(Pool2Aimer), Pool2Aimer = -1, Aim2Object = 0;
            TogglePlayerControllable(playerid, 1), SetCameraBehindPlayer(playerid), TextDrawHideForPlayer(playerid, Pool2TD0), TextDrawHideForPlayer(playerid, Pool2TDs1), TextDrawHideForPlayer(playerid, Pool2TD2), TextDrawHideForPlayer(playerid, Pool2TD3);
            TogglePlayerControllable(PlayerInfo[playerid][pPoolIn], 1), SetCameraBehindPlayer(PlayerInfo[playerid][pPoolIn]), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2TD0), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2TDs1), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2TD2), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2TD3);

            format(poolst, 150, "* %s a parasit masa jocului, ai primit jumatate din miza. (+%s$)", nm[playerid], FormatNumber(StakePol2/2)), SendClientMessage(PlayerInfo[playerid][pPoolIn], COLOR_LIGHTBLUE, poolst);
            format(poolst, 150, "* Ai parasit masa jocului, ai pierdut jumatate din miza. (-%s$)", FormatNumber(StakePol2/2)), SendClientMessage(playerid, COLOR_LIGHTBLUE, poolst);
            TextDrawHideForPlayer(playerid, Pool2s0), TextDrawHideForPlayer(playerid, Pool2s1), TextDrawHideForPlayer(playerid, Pool2s2), TextDrawHideForPlayer(playerid, Pool2s3);
            TextDrawHideForPlayer(playerid, Pool2s4), TextDrawHideForPlayer(playerid, Pool2s5), TextDrawHideForPlayer(playerid, Pool2s6), TextDrawHideForPlayer(playerid, Pool2s7);
            TextDrawHideForPlayer(playerid, Pool2s8), TextDrawHideForPlayer(playerid, Pool2s9), TextDrawHideForPlayer(playerid, Pool2s10), TextDrawHideForPlayer(playerid, Pool2s11);
            TextDrawHideForPlayer(playerid, Pool2s12), TextDrawHideForPlayer(playerid, Pool2s13), TextDrawHideForPlayer(playerid, Pool2s14), TextDrawHideForPlayer(playerid, Pool2s15);
            TextDrawHideForPlayer(playerid, Pool2s16), TextDrawHideForPlayer(playerid, Pool2s17), TextDrawHideForPlayer(playerid, Pool2s18), TextDrawHideForPlayer(playerid, Pool2s19);

            TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s0), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s1), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s2), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s3);
            TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s4), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s5), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s6), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s7);
            TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s8), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s9), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s10), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s11);
            TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s12), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s13), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s14), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s15);
            TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s16), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s17), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s18), TextDrawHideForPlayer(PlayerInfo[playerid][pPoolIn], Pool2s19);
            StakePol2 = StakePol2/2, GiveMoney(PlayerInfo[playerid][pPoolIn], StakePol2), GiveMoney(playerid, -StakePol2), PlayingPool[PlayerInfo[playerid][pPoolIn]] = 0, pool21ob = CreateDynamicObject(338, 506.64871, -83.64490, 998.26721,   4.00000, 0.00000, 0.00000), pool22ob2 = CreateDynamicObject(338, 506.22571, -83.64490, 998.26721,   4.00000, 0.00000, 0.00000), plas2 = CreateDynamicObject(2965, 506.55569, -85.37160, 998.86182,   0.00000, 0.00000, -210.00000),
            UpdateDynamic3DTextLabelText(Pool2TD1, -1, "Pool Table #2\nStatus: {00BA19}Available\n{FFFFFF}Type {33C494}/pool {FFFFFF}to play billiards."), RemovePlayerWeapon(PlayerInfo[playerid][pPoolIn], 7), RemovePlayerWeapon(playerid, 7), PlayingPool[playerid] = 0, PoolStarted2 = 0, RespawnPool2Balls();
            if(!(PoolStarted || PoolStarted2)) KillTimer(pydas), pydas = -1;
        }
        return 1;
    }
    if(vwp[playerid] != 11) return SendClientMessage(playerid, COLOR_DARKGRAY, "You are not at the Pool Table in bar Ten Green Bottles.");
    if(IsPlayerInRangeOfPoint(playerid, 2.0, 510.06921,-78.4267,998.9609))
    {
        if(PoolStarted) return SendClientMessage(playerid, COLOR_DARKGRAY, "La masa #1 este deja un meci de biliard in desfasurare...");
        if(PlayerInfo[playerid][pScore] < 3) return SendClientMessage(playerid, COLOR_DARKGRAY, "You need at least level 3.");
        new playerto, bmonys;
        if(sscanf(params, "ud", playerto, bmonys)) return SendClientMessage(playerid, 0x8EC7DCFF, "Syntax: {FFFFFF}/pool [playerid/name] [bet money]");
        if(playerto == INVALID_PLAYER_ID || playerto == playerid || pInfo[playerto][pStatus] != 1) return SendClientMessage(playerid, COLOR_DARKGRAY,"Player not connected.");
        if(PlayingPool[playerto]) return SendClientMessage(playerid, COLOR_DARKGRAY, "Player already playing billiards.");
        if(!ProxDetectorS(8.0, playerid, playerto)) return SendClientMessage(playerid, COLOR_DARKGRAY, "Player not near you.");
        if(pInfo[playerto][pScore] < 3) return SendClientMessage(playerid, COLOR_DARKGRAY, "Player need at least level 3.");
        if(bmonys < 5000 || bmonys > 100000000) return SendClientMessage(playerid, COLOR_DARKGRAY, "Bet can't be below 5.000$ or higher than 100.000.000$.");
        if(PlayerInfo[playerid][pMoney] < bmonys) return SendClientMessage(playerid, COLOR_DARKGRAY, "You don't have enough money.");
        if(pInfo[playerto][pMoney] < bmonys) return SendClientMessage(playerid, COLOR_DARKGRAY, "Player don't have enough money.");
        format(ocstrr, 150, "* Ai trimis o invitatie la biliard catre %s. (Bet: %s$)", nm[playerto], FormatNumber(bmonys)), SendClientMessage(playerid, COLOR_PRODS, ocstrr);
        format(stmcmtod, 150, "* %s te-a invitat la un joc de biliard. (Bet: %s$) (/accept 11)", nm[playerid], FormatNumber(bmonys)), SendClientMessage(playerto, COLOR_PRODS, stmcmtod);
        PoolIDP[playerid] = 1, pProdOffer[playerto] = playerid, pInfo[playerto][pDPrice] = bmonys, pProdType[playerto] = 90;
        return 1;
    }
    if(IsPlayerInRangeOfPoint(playerid, 2.0, 506.46960,-78.4267,998.9609))
    {
        if(PoolStarted2) return SendClientMessage(playerid, COLOR_DARKGRAY, "La masa #2 este deja un meci de biliard in desfasurare...");
        if(PlayerInfo[playerid][pScore] < 3) return SendClientMessage(playerid, COLOR_DARKGRAY, "You need at least level 3.");
        new playerto, bmonys;
        if(sscanf(params, "ud", playerto, bmonys)) return SendClientMessage(playerid, 0x8EC7DCFF, "Syntax: {FFFFFF}/pool [playerid/name] [bet money]");
        if(playerto == INVALID_PLAYER_ID || playerto == playerid || pInfo[playerto][pStatus] != 1) return SendClientMessage(playerid, COLOR_DARKGRAY,"Player not connected.");
        if(PlayingPool[playerto]) return SendClientMessage(playerid, COLOR_DARKGRAY, "Player already playing billiards.");
        if(!ProxDetectorS(8.0, playerid, playerto)) return SendClientMessage(playerid, COLOR_DARKGRAY, "Player not near you.");
        if(pInfo[playerto][pScore] < 3) return SendClientMessage(playerid, COLOR_DARKGRAY, "Player need at least level 3.");
        if(bmonys < 5000 || bmonys > 100000000) return SendClientMessage(playerid, COLOR_DARKGRAY, "Bet can't be below 5.000$ or higher than 100.000.000$.");
        if(PlayerInfo[playerid][pMoney] < bmonys) return SendClientMessage(playerid, COLOR_DARKGRAY, "You don't have enough money.");
        if(pInfo[playerto][pMoney] < bmonys) return SendClientMessage(playerid, COLOR_DARKGRAY, "Player don't have enough money.");
        format(ocstrr, 150, "* Ai trimis o invitatie la biliard catre %s. (Bet: %s$)", nm[playerto], FormatNumber(bmonys)), SendClientMessage(playerid, COLOR_PRODS, ocstrr);
        format(stmcmtod, 150, "* %s te-a invitat la un joc de biliard. (Bet: %s$) (/accept 11)", nm[playerid], FormatNumber(bmonys)), SendClientMessage(playerto, COLOR_PRODS, stmcmtod);
        PoolIDP[playerid] = 2, pProdOffer[playerto] = playerid, pInfo[playerto][pDPrice] = bmonys, pProdType[playerto] = 90;
        return 1;
    }
    return SendClientMessage(playerid, COLOR_DARKGRAY, "You are not at the Pool Table in bar Ten Green Bottles."), 1;
}
forward PHY_OnObjectUpdate(objectid);
public PHY_OnObjectUpdate(objectid)
{
    if(PoolStarted)
    {
        for(new i; i < 16; i++) if(objectid == PoolBall[i][bObject] && PHY_IsObjectMoving(PoolBall[i][bObject]))
        {
            holep = IsBallInHole(i);
            if(holep)
            {
                PHY_GetObjectVelocity(PoolBall[i][bObject], vxp, vyp, vzp), speedp = floatsqroot(vxp * vxp + vyp * vyp) + 0.2, PoolBall[i][bExisting] = 0, PHY_DeleteObject(PoolBall[i][bObject]), Iter_SafeRemove(ITER_Object, objectid, objectid);
                switch(holep)
                {
                    case 1: MoveObject(PoolBall[i][bObject], 509.61123657,-85.79737091,998.86785889-0.25, speedp);
                    case 2: MoveObject(PoolBall[i][bObject], 510.67373657,-84.84423065,998.86785889-0.25, speedp);
                    case 3: MoveObject(PoolBall[i][bObject], 510.61914062,-83.88769531,998.86785889-0.25, speedp);
                    case 4: MoveObject(PoolBall[i][bObject], 509.61077881,-83.89227295,998.86785889-0.25, speedp);
                    case 5: MoveObject(PoolBall[i][bObject], 510.61825562,-85.80107880,998.86785889-0.25, speedp);
                    case 6: MoveObject(PoolBall[i][bObject], 509.55642700,-84.84602356,998.86785889-0.25, speedp);
                }
                switch(i)
                {
                    case 0:
                    {
                        skee = 2, PoolRand[PoolLastShooter] = 0, PoolRand[pInfo[PoolLastShooter][pPoolIn]] = 1,
                        format(poolst, 150, "Este randul lui ~y~%s~w~~h~.~n~Miza: ~g~%s$", nm[pInfo[PoolLastShooter][pPoolIn]], FormatNumber(StakePol1)), TextDrawSetString(Pool1s19, poolst);
                    }
                    case 1:
                    {
                        skee = 2, TextDrawHideForPlayer(PoolLastShooter, Pool1s17), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s17);
                        PoolScore[PoolPlin]++, format(poolst, 150, "~y~%s ~w~~h~- %d/7", nm[PoolPlin], PoolScore[PoolPlin]), TextDrawSetString(Pool1s10, poolst), PlayerPlaySound(PoolLastShooter, 1250, 0.0, 0.0, 0.0);
                        if(PoolLastShooter != PoolPlin) PoolRand[PoolLastShooter] = 0, PoolRand[pInfo[PoolLastShooter][pPoolIn]] = 1,
                            format(poolst, 150, "Este randul lui ~y~%s~w~~h~.~n~Miza: ~g~%s$", nm[pInfo[PoolLastShooter][pPoolIn]], FormatNumber(StakePol1)), TextDrawSetString(Pool1s19, poolst);
                    }
                    case 2:
                    {
                        skee = 2, TextDrawHideForPlayer(PoolLastShooter, Pool1s16), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s16);
                        PoolScore[PoolPlin]++, format(poolst, 150, "~y~%s ~w~~h~- %d/7", nm[PoolPlin], PoolScore[PoolPlin]), TextDrawSetString(Pool1s10, poolst), PlayerPlaySound(PoolLastShooter, 1250, 0.0, 0.0, 0.0);
                        if(PoolLastShooter != PoolPlin) PoolRand[PoolLastShooter] = 0, PoolRand[pInfo[PoolLastShooter][pPoolIn]] = 1,
                            format(poolst, 150, "Este randul lui ~y~%s~w~~h~.~n~Miza: ~g~%s$", nm[pInfo[PoolLastShooter][pPoolIn]], FormatNumber(StakePol1)), TextDrawSetString(Pool1s19, poolst);
                    }
                    case 3:
                    {
                        skee = 2, TextDrawHideForPlayer(PoolLastShooter, Pool1s9), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s9);
                        PoolScore[PoolGol]++, format(poolst, 150, "~y~%s ~w~~h~- %d/7", nm[PoolGol], PoolScore[PoolGol]), TextDrawSetString(Pool1s2, poolst), PlayerPlaySound(PoolLastShooter, 1250, 0.0, 0.0, 0.0);
                        if(PoolLastShooter != PoolGol) PoolRand[PoolLastShooter] = 0, PoolRand[pInfo[PoolLastShooter][pPoolIn]] = 1,
                            format(poolst, 150, "Este randul lui ~y~%s~w~~h~.~n~Miza: ~g~%s$", nm[pInfo[PoolLastShooter][pPoolIn]], FormatNumber(StakePol1)), TextDrawSetString(Pool1s19, poolst);
                    }
                    case 4:
                    {
                        skee = 2, TextDrawHideForPlayer(PoolLastShooter, Pool1s8), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s8);
                        PoolScore[PoolGol]++, format(poolst, 150, "~y~%s ~w~~h~- %d/7", nm[PoolGol], PoolScore[PoolGol]), TextDrawSetString(Pool1s2, poolst), PlayerPlaySound(PoolLastShooter, 1250, 0.0, 0.0, 0.0);
                        if(PoolLastShooter != PoolGol) PoolRand[PoolLastShooter] = 0, PoolRand[pInfo[PoolLastShooter][pPoolIn]] = 1,
                            format(poolst, 150, "Este randul lui ~y~%s~w~~h~.~n~Miza: ~g~%s$", nm[pInfo[PoolLastShooter][pPoolIn]], FormatNumber(StakePol1)), TextDrawSetString(Pool1s19, poolst);
                    }
                    case 5:
                    {
                        skee = 2, SetPlayerHealth(PoolLastShooter, hPr[PoolLastShooter]), SetPlayerHealth(pInfo[PoolLastShooter][pPoolIn], hPr[pInfo[PoolLastShooter][pPoolIn]]), SetPlayerPos(PoolLastShooter, 502.1467,-68.7983,998.7578), SetPlayerPos(pInfo[PoolLastShooter][pPoolIn], 502.1467,-68.7983,998.7578);
                        if(PoolScore[PoolLastShooter] < 7)
                        {
                            DestroyObject(AimObject), ClearAnimations(PoolAimer), PoolAimer = -1, AimObject = 0;
                            TogglePlayerControllable(PoolLastShooter, 1), SetCameraBehindPlayer(PoolLastShooter), TextDrawHideForPlayer(PoolLastShooter, PoolTD0), TextDrawHideForPlayer(PoolLastShooter, PoolTDs1), TextDrawHideForPlayer(PoolLastShooter, PoolTD2), TextDrawHideForPlayer(PoolLastShooter, PoolTD3);
                            TogglePlayerControllable(pInfo[PoolLastShooter][pPoolIn], 1), SetCameraBehindPlayer(pInfo[PoolLastShooter][pPoolIn]), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], PoolTD0), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], PoolTDs1), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], PoolTD2), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], PoolTD3);
                            mysql_format(MySQLCon, quMYSQL, 150, "UPDATE `players` SET `Pool`=`Pool`+1 WHERE `ID`=%d", pInfo[pInfo[PoolLastShooter][pPoolIn]][pID]), mysql_tquery(MySQLCon, quMYSQL);
                            format(poolst, 150, "* %s a pierdut meciul, a introdus bila neagra in gaura. (+%s$)", nm[PoolLastShooter], FormatNumber(StakePol1)), SendClientMessage(pInfo[PoolLastShooter][pPoolIn], COLOR_LIGHTBLUE, poolst);
                            format(poolst, 150, "* Ai pierdut meciul, ai introdus bila neagra in gaura. (-%s$)", FormatNumber(StakePol1)), SendClientMessage(PoolLastShooter, COLOR_LIGHTBLUE, poolst);
                            TextDrawHideForPlayer(PoolLastShooter, Pool1s0), TextDrawHideForPlayer(PoolLastShooter, Pool1s1), TextDrawHideForPlayer(PoolLastShooter, Pool1s2), TextDrawHideForPlayer(PoolLastShooter, Pool1s3);
                            TextDrawHideForPlayer(PoolLastShooter, Pool1s4), TextDrawHideForPlayer(PoolLastShooter, Pool1s5), TextDrawHideForPlayer(PoolLastShooter, Pool1s6), TextDrawHideForPlayer(PoolLastShooter, Pool1s7);
                            TextDrawHideForPlayer(PoolLastShooter, Pool1s8), TextDrawHideForPlayer(PoolLastShooter, Pool1s9), TextDrawHideForPlayer(PoolLastShooter, Pool1s10), TextDrawHideForPlayer(PoolLastShooter, Pool1s11);
                            TextDrawHideForPlayer(PoolLastShooter, Pool1s12), TextDrawHideForPlayer(PoolLastShooter, Pool1s13), TextDrawHideForPlayer(PoolLastShooter, Pool1s14), TextDrawHideForPlayer(PoolLastShooter, Pool1s15);
                            TextDrawHideForPlayer(PoolLastShooter, Pool1s16), TextDrawHideForPlayer(PoolLastShooter, Pool1s17), TextDrawHideForPlayer(PoolLastShooter, Pool1s18), TextDrawHideForPlayer(PoolLastShooter, Pool1s19);

                            TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s0), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s1), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s2), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s3);
                            TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s4), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s5), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s6), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s7);
                            TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s8), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s9), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s10), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s11);
                            TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s12), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s13), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s14), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s15);
                            TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s16), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s17), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s18), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s19);
                            GiveMoney(pInfo[PoolLastShooter][pPoolIn], StakePol1), GiveMoney(PoolLastShooter, -StakePol1), PlayingPool[pInfo[PoolLastShooter][pPoolIn]] = 0, pool1ob = CreateDynamicObject(338, 510.26770, -83.64490, 998.26721,   4.00000, 0.00000, 0.00000), pool2ob2 = CreateDynamicObject(338, 509.84470, -83.64490, 998.26721,   4.00000, 0.00000, 0.00000), plas1 = CreateDynamicObject(2965, 510.18771, -85.37160, 998.86182,   0.00000, 0.00000, -213.00000),
                            UpdateDynamic3DTextLabelText(PoolTD1, -1, "Pool Table #1\nStatus: {00BA19}Available\n{FFFFFF}Type {33C494}/pool {FFFFFF}to play billiards."), RemovePlayerWeapon(pInfo[PoolLastShooter][pPoolIn], 7), RemovePlayerWeapon(PoolLastShooter, 7), PlayingPool[PoolLastShooter] = 0, PoolStarted = 0, RespawnPoolBalls();
                            if(!(PoolStarted || PoolStarted2)) KillTimer(pydas), pydas = -1;
                        }
                        else
                        {
                            DestroyObject(AimObject), ClearAnimations(PoolAimer), PoolAimer = -1, AimObject = 0;
                            TogglePlayerControllable(PoolLastShooter, 1), SetCameraBehindPlayer(PoolLastShooter), TextDrawHideForPlayer(PoolLastShooter, PoolTD0), TextDrawHideForPlayer(PoolLastShooter, PoolTDs1), TextDrawHideForPlayer(PoolLastShooter, PoolTD2), TextDrawHideForPlayer(PoolLastShooter, PoolTD3);
                            TogglePlayerControllable(pInfo[PoolLastShooter][pPoolIn], 1), SetCameraBehindPlayer(pInfo[PoolLastShooter][pPoolIn]), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], PoolTD0), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], PoolTDs1), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], PoolTD2), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], PoolTD3);
                            mysql_format(MySQLCon, quMYSQL, 150, "UPDATE `players` SET `Pool`=`Pool`+1 WHERE `ID`=%d", pInfo[PoolLastShooter][pID]), mysql_tquery(MySQLCon, quMYSQL);
                            format(poolst, 150, "* Felicitari, ai castigat acest meci de biliard. (+%s$)", FormatNumber(StakePol1)), SendClientMessage(PoolLastShooter, COLOR_LIGHTBLUE, poolst);
                            format(poolst, 150, "* Ai pierdut acest meci de biliard. (-%s$)", FormatNumber(StakePol1)), SendClientMessage(pInfo[PoolLastShooter][pPoolIn], COLOR_LIGHTBLUE, poolst);
                            TextDrawHideForPlayer(PoolLastShooter, Pool1s0), TextDrawHideForPlayer(PoolLastShooter, Pool1s1), TextDrawHideForPlayer(PoolLastShooter, Pool1s2), TextDrawHideForPlayer(PoolLastShooter, Pool1s3);
                            TextDrawHideForPlayer(PoolLastShooter, Pool1s4), TextDrawHideForPlayer(PoolLastShooter, Pool1s5), TextDrawHideForPlayer(PoolLastShooter, Pool1s6), TextDrawHideForPlayer(PoolLastShooter, Pool1s7);
                            TextDrawHideForPlayer(PoolLastShooter, Pool1s8), TextDrawHideForPlayer(PoolLastShooter, Pool1s9), TextDrawHideForPlayer(PoolLastShooter, Pool1s10), TextDrawHideForPlayer(PoolLastShooter, Pool1s11);
                            TextDrawHideForPlayer(PoolLastShooter, Pool1s12), TextDrawHideForPlayer(PoolLastShooter, Pool1s13), TextDrawHideForPlayer(PoolLastShooter, Pool1s14), TextDrawHideForPlayer(PoolLastShooter, Pool1s15);
                            TextDrawHideForPlayer(PoolLastShooter, Pool1s16), TextDrawHideForPlayer(PoolLastShooter, Pool1s17), TextDrawHideForPlayer(PoolLastShooter, Pool1s18), TextDrawHideForPlayer(PoolLastShooter, Pool1s19);

                            TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s0), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s1), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s2), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s3);
                            TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s4), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s5), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s6), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s7);
                            TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s8), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s9), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s10), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s11);
                            TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s12), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s13), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s14), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s15);
                            TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s16), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s17), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s18), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s19);
                            GiveMoney(PoolLastShooter, StakePol1), GiveMoney(pInfo[PoolLastShooter][pPoolIn], -StakePol1), PlayingPool[pInfo[PoolLastShooter][pPoolIn]] = 0, pool1ob = CreateDynamicObject(338, 510.26770, -83.64490, 998.26721,   4.00000, 0.00000, 0.00000), pool2ob2 = CreateDynamicObject(338, 509.84470, -83.64490, 998.26721,   4.00000, 0.00000, 0.00000), plas1 = CreateDynamicObject(2965, 510.18771, -85.37160, 998.86182,   0.00000, 0.00000, -213.00000),
                            UpdateDynamic3DTextLabelText(PoolTD1, -1, "Pool Table #1\nStatus: {00BA19}Available\n{FFFFFF}Type {33C494}/pool {FFFFFF}to play billiards."), RemovePlayerWeapon(pInfo[PoolLastShooter][pPoolIn], 7), RemovePlayerWeapon(PoolLastShooter, 7), PlayingPool[PoolLastShooter] = 0, PoolStarted = 0, RespawnPoolBalls();
                            if(!(PoolStarted || PoolStarted2)) KillTimer(pydas), pydas = -1;
                        }
                    }
                    case 6:
                    {
                        skee = 2, TextDrawHideForPlayer(PoolLastShooter, Pool1s12), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s12);
                        PoolScore[PoolPlin]++, format(poolst, 150, "~y~%s ~w~~h~- %d/7", nm[PoolPlin], PoolScore[PoolPlin]), TextDrawSetString(Pool1s10, poolst), PlayerPlaySound(PoolLastShooter, 1250, 0.0, 0.0, 0.0);
                        if(PoolLastShooter != PoolPlin) PoolRand[PoolLastShooter] = 0, PoolRand[pInfo[PoolLastShooter][pPoolIn]] = 1,
                            format(poolst, 150, "Este randul lui ~y~%s~w~~h~.~n~Miza: ~g~%s$", nm[pInfo[PoolLastShooter][pPoolIn]], FormatNumber(StakePol1)), TextDrawSetString(Pool1s19, poolst);
                    }
                    case 7:
                    {
                        skee = 2, TextDrawHideForPlayer(PoolLastShooter, Pool1s14), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s14);
                        PoolScore[PoolPlin]++, format(poolst, 150, "~y~%s ~w~~h~- %d/7", nm[PoolPlin], PoolScore[PoolPlin]), TextDrawSetString(Pool1s10, poolst), PlayerPlaySound(PoolLastShooter, 1250, 0.0, 0.0, 0.0);
                        if(PoolLastShooter != PoolPlin) PoolRand[PoolLastShooter] = 0, PoolRand[pInfo[PoolLastShooter][pPoolIn]] = 1,
                            format(poolst, 150, "Este randul lui ~y~%s~w~~h~.~n~Miza: ~g~%s$", nm[pInfo[PoolLastShooter][pPoolIn]], FormatNumber(StakePol1)), TextDrawSetString(Pool1s19, poolst);
                    }
                    case 8:
                    {
                        skee = 2, TextDrawHideForPlayer(PoolLastShooter, Pool1s4), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s4);
                        PoolScore[PoolGol]++, format(poolst, 150, "~y~%s ~w~~h~- %d/7", nm[PoolGol], PoolScore[PoolGol]), TextDrawSetString(Pool1s2, poolst), PlayerPlaySound(PoolLastShooter, 1250, 0.0, 0.0, 0.0);
                        if(PoolLastShooter != PoolGol) PoolRand[PoolLastShooter] = 0, PoolRand[pInfo[PoolLastShooter][pPoolIn]] = 1,
                            format(poolst, 150, "Este randul lui ~y~%s~w~~h~.~n~Miza: ~g~%s$", nm[pInfo[PoolLastShooter][pPoolIn]], FormatNumber(StakePol1)), TextDrawSetString(Pool1s19, poolst);
                    }
                    case 9:
                    {
                        skee = 2, TextDrawHideForPlayer(PoolLastShooter, Pool1s11), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s11);
                        PoolScore[PoolPlin]++, format(poolst, 150, "~y~%s ~w~~h~- %d/7", nm[PoolPlin], PoolScore[PoolPlin]), TextDrawSetString(Pool1s10, poolst), PlayerPlaySound(PoolLastShooter, 1250, 0.0, 0.0, 0.0);
                        if(PoolLastShooter != PoolPlin) PoolRand[PoolLastShooter] = 0, PoolRand[pInfo[PoolLastShooter][pPoolIn]] = 1,
                            format(poolst, 150, "Este randul lui ~y~%s~w~~h~.~n~Miza: ~g~%s$", nm[pInfo[PoolLastShooter][pPoolIn]], FormatNumber(StakePol1)), TextDrawSetString(Pool1s19, poolst);
                    }
                    case 10:
                    {
                        skee = 2, TextDrawHideForPlayer(PoolLastShooter, Pool1s7), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s7);
                        PoolScore[PoolGol]++, format(poolst, 150, "~y~%s ~w~~h~- %d/7", nm[PoolGol], PoolScore[PoolGol]), TextDrawSetString(Pool1s2, poolst), PlayerPlaySound(PoolLastShooter, 1250, 0.0, 0.0, 0.0);
                        if(PoolLastShooter != PoolGol) PoolRand[PoolLastShooter] = 0, PoolRand[pInfo[PoolLastShooter][pPoolIn]] = 1,
                            format(poolst, 150, "Este randul lui ~y~%s~w~~h~.~n~Miza: ~g~%s$", nm[pInfo[PoolLastShooter][pPoolIn]], FormatNumber(StakePol1)), TextDrawSetString(Pool1s19, poolst);
                    }
                    case 11:
                    {
                        skee = 2, TextDrawHideForPlayer(PoolLastShooter, Pool1s5), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s5);
                        PoolScore[PoolGol]++, format(poolst, 150, "~y~%s ~w~~h~- %d/7", nm[PoolGol], PoolScore[PoolGol]), TextDrawSetString(Pool1s2, poolst), PlayerPlaySound(PoolLastShooter, 1250, 0.0, 0.0, 0.0);
                        if(PoolLastShooter != PoolGol) PoolRand[PoolLastShooter] = 0, PoolRand[pInfo[PoolLastShooter][pPoolIn]] = 1,
                            format(poolst, 150, "Este randul lui ~y~%s~w~~h~.~n~Miza: ~g~%s$", nm[pInfo[PoolLastShooter][pPoolIn]], FormatNumber(StakePol1)), TextDrawSetString(Pool1s19, poolst);
                    }
                    case 12:
                    {
                        skee = 2, TextDrawHideForPlayer(PoolLastShooter, Pool1s15), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s15);
                        PoolScore[PoolPlin]++, format(poolst, 150, "~y~%s ~w~~h~- %d/7", nm[PoolPlin], PoolScore[PoolPlin]), TextDrawSetString(Pool1s10, poolst), PlayerPlaySound(PoolLastShooter, 1250, 0.0, 0.0, 0.0);
                        if(PoolLastShooter != PoolPlin) PoolRand[PoolLastShooter] = 0, PoolRand[pInfo[PoolLastShooter][pPoolIn]] = 1,
                            format(poolst, 150, "Este randul lui ~y~%s~w~~h~.~n~Miza: ~g~%s$", nm[pInfo[PoolLastShooter][pPoolIn]], FormatNumber(StakePol1)), TextDrawSetString(Pool1s19, poolst);
                    }
                    case 13:
                    {
                        skee = 2, TextDrawHideForPlayer(PoolLastShooter, Pool1s6), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s6);
                        PoolScore[PoolGol]++, format(poolst, 150, "~y~%s ~w~~h~- %d/7", nm[PoolGol], PoolScore[PoolGol]), TextDrawSetString(Pool1s2, poolst), PlayerPlaySound(PoolLastShooter, 1250, 0.0, 0.0, 0.0);
                        if(PoolLastShooter != PoolGol) PoolRand[PoolLastShooter] = 0, PoolRand[pInfo[PoolLastShooter][pPoolIn]] = 1,
                            format(poolst, 150, "Este randul lui ~y~%s~w~~h~.~n~Miza: ~g~%s$", nm[pInfo[PoolLastShooter][pPoolIn]], FormatNumber(StakePol1)), TextDrawSetString(Pool1s19, poolst);
                    }
                    case 14:
                    {
                        skee = 2, TextDrawHideForPlayer(PoolLastShooter, Pool1s3), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s3);
                        PoolScore[PoolGol]++, format(poolst, 150, "~y~%s ~w~~h~- %d/7", nm[PoolGol], PoolScore[PoolGol]), TextDrawSetString(Pool1s2, poolst), PlayerPlaySound(PoolLastShooter, 1250, 0.0, 0.0, 0.0);
                        if(PoolLastShooter != PoolGol) PoolRand[PoolLastShooter] = 0, PoolRand[pInfo[PoolLastShooter][pPoolIn]] = 1,
                            format(poolst, 150, "Este randul lui ~y~%s~w~~h~.~n~Miza: ~g~%s$", nm[pInfo[PoolLastShooter][pPoolIn]], FormatNumber(StakePol1)), TextDrawSetString(Pool1s19, poolst);
                    }
                    case 15:
                    {
                        skee = 2, TextDrawHideForPlayer(PoolLastShooter, Pool1s13), TextDrawHideForPlayer(pInfo[PoolLastShooter][pPoolIn], Pool1s13);
                        PoolScore[PoolPlin]++, format(poolst, 150, "~y~%s ~w~~h~- %d/7", nm[PoolPlin], PoolScore[PoolPlin]), TextDrawSetString(Pool1s10, poolst), PlayerPlaySound(PoolLastShooter, 1250, 0.0, 0.0, 0.0);
                        if(PoolLastShooter != PoolPlin) PoolRand[PoolLastShooter] = 0, PoolRand[pInfo[PoolLastShooter][pPoolIn]] = 1,
                            format(poolst, 150, "Este randul lui ~y~%s~w~~h~.~n~Miza: ~g~%s$", nm[pInfo[PoolLastShooter][pPoolIn]], FormatNumber(StakePol1)), TextDrawSetString(Pool1s19, poolst);
                    }
                }
            }
        }
    }
    if(PoolStarted2)
    {
        for(new i; i < 16; i++) if(objectid == Pool2Ball[i][bObject] && PHY_IsObjectMoving(Pool2Ball[i][bObject]))
        {
            holep = IsBall2InHole(i);
            if(holep)
            {
                PHY_GetObjectVelocity(Pool2Ball[i][bObject], vxp, vyp, vzp), speedp = floatsqroot(vxp * vxp + vyp * vyp) + 0.2, Pool2Ball[i][bExisting] = 0, PHY_DeleteObject(Pool2Ball[i][bObject]), Iter_SafeRemove(ITER_Object, objectid, objectid);
                switch(holep)
                {
                    case 1: MoveObject(Pool2Ball[i][bObject], 505.99399,-85.79737091,998.86785889-0.25, speedp);
                    case 2: MoveObject(Pool2Ball[i][bObject], 507.05653657,-84.84423065,998.86785889-0.25, speedp);
                    case 3: MoveObject(Pool2Ball[i][bObject], 507.00194062,-83.88769531,998.86785889-0.25, speedp);
                    case 4: MoveObject(Pool2Ball[i][bObject], 505.99357881,-83.89227295,998.86785889-0.25, speedp);
                    case 5: MoveObject(Pool2Ball[i][bObject], 507.00105562,-85.80107880,998.86785889-0.25, speedp);
                    case 6: MoveObject(Pool2Ball[i][bObject], 505.939227,-84.84602356,998.86785889-0.25, speedp);
                }
                switch(i)
                {
                    case 0:
                    {
                        skeee = 2, PoolRand[Pool2LastShooter] = 0, PoolRand[pInfo[Pool2LastShooter][pPoolIn]] = 1,
                        format(poolsts, 150, "Este randul lui ~y~%s~w~~h~.~n~Miza: ~g~%s$", nm[pInfo[Pool2LastShooter][pPoolIn]], FormatNumber(StakePol2)), TextDrawSetString(Pool2s19, poolsts);
                    }
                    case 1:
                    {
                        skeee = 2, TextDrawHideForPlayer(Pool2LastShooter, Pool2s17), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s17);
                        PoolScore[PoolPlin2]++, format(poolsts, 150, "~y~%s ~w~~h~- %d/7", nm[PoolPlin2], PoolScore[PoolPlin2]), TextDrawSetString(Pool2s10, poolsts), PlayerPlaySound(Pool2LastShooter, 1250, 0.0, 0.0, 0.0);
                        if(Pool2LastShooter != PoolPlin2) PoolRand[Pool2LastShooter] = 0, PoolRand[pInfo[Pool2LastShooter][pPoolIn]] = 1,
                            format(poolsts, 150, "Este randul lui ~y~%s~w~~h~.~n~Miza: ~g~%s$", nm[pInfo[Pool2LastShooter][pPoolIn]], FormatNumber(StakePol2)), TextDrawSetString(Pool2s19, poolsts);
                    }
                    case 2:
                    {
                        skeee = 2, TextDrawHideForPlayer(Pool2LastShooter, Pool2s16), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s16);
                        PoolScore[PoolPlin2]++, format(poolsts, 150, "~y~%s ~w~~h~- %d/7", nm[PoolPlin2], PoolScore[PoolPlin2]), TextDrawSetString(Pool2s10, poolsts), PlayerPlaySound(Pool2LastShooter, 1250, 0.0, 0.0, 0.0);
                        if(Pool2LastShooter != PoolPlin2) PoolRand[Pool2LastShooter] = 0, PoolRand[pInfo[Pool2LastShooter][pPoolIn]] = 1,
                            format(poolsts, 150, "Este randul lui ~y~%s~w~~h~.~n~Miza: ~g~%s$", nm[pInfo[Pool2LastShooter][pPoolIn]], FormatNumber(StakePol2)), TextDrawSetString(Pool2s19, poolsts);
                    }
                    case 3:
                    {
                        skeee = 2, TextDrawHideForPlayer(Pool2LastShooter, Pool2s9), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s9);
                        PoolScore[PoolGol2]++, format(poolsts, 150, "~y~%s ~w~~h~- %d/7", nm[PoolGol2], PoolScore[PoolGol2]), TextDrawSetString(Pool2s2, poolsts), PlayerPlaySound(Pool2LastShooter, 1250, 0.0, 0.0, 0.0);
                        if(Pool2LastShooter != PoolGol2) PoolRand[Pool2LastShooter] = 0, PoolRand[pInfo[Pool2LastShooter][pPoolIn]] = 1,
                            format(poolsts, 150, "Este randul lui ~y~%s~w~~h~.~n~Miza: ~g~%s$", nm[pInfo[Pool2LastShooter][pPoolIn]], FormatNumber(StakePol2)), TextDrawSetString(Pool2s19, poolsts);
                    }
                    case 4:
                    {
                        skeee = 2, TextDrawHideForPlayer(Pool2LastShooter, Pool2s8), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s8);
                        PoolScore[PoolGol2]++, format(poolsts, 150, "~y~%s ~w~~h~- %d/7", nm[PoolGol2], PoolScore[PoolGol2]), TextDrawSetString(Pool2s2, poolsts), PlayerPlaySound(Pool2LastShooter, 1250, 0.0, 0.0, 0.0);
                        if(Pool2LastShooter != PoolGol2) PoolRand[Pool2LastShooter] = 0, PoolRand[pInfo[Pool2LastShooter][pPoolIn]] = 1,
                            format(poolsts, 150, "Este randul lui ~y~%s~w~~h~.~n~Miza: ~g~%s$", nm[pInfo[Pool2LastShooter][pPoolIn]], FormatNumber(StakePol2)), TextDrawSetString(Pool2s19, poolsts);
                    }
                    case 5:
                    {
                        skeee = 2, SetPlayerHealth(Pool2LastShooter, hPr[Pool2LastShooter]), SetPlayerHealth(pInfo[Pool2LastShooter][pPoolIn], hPr[pInfo[Pool2LastShooter][pPoolIn]]), SetPlayerPos(Pool2LastShooter, 502.1467,-68.7983,998.7578), SetPlayerPos(pInfo[Pool2LastShooter][pPoolIn], 502.1467,-68.7983,998.7578);
                        if(PoolScore[Pool2LastShooter] < 7)
                        {
                            DestroyObject(Aim2Object), ClearAnimations(Pool2Aimer), Pool2Aimer = -1, Aim2Object = 0;
                            TogglePlayerControllable(Pool2LastShooter, 1), SetCameraBehindPlayer(Pool2LastShooter), TextDrawHideForPlayer(Pool2LastShooter, PoolTD0), TextDrawHideForPlayer(Pool2LastShooter, PoolTDs1), TextDrawHideForPlayer(Pool2LastShooter, PoolTD2), TextDrawHideForPlayer(Pool2LastShooter, PoolTD3);
                            TogglePlayerControllable(pInfo[Pool2LastShooter][pPoolIn], 1), SetCameraBehindPlayer(pInfo[Pool2LastShooter][pPoolIn]), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], PoolTD0), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], PoolTDs1), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], PoolTD2), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], PoolTD3);
                            mysql_format(MySQLCon, quMYSQL, 150, "UPDATE `players` SET `Pool`=`Pool`+1 WHERE `ID`=%d", pInfo[pInfo[Pool2LastShooter][pPoolIn]][pID]), mysql_tquery(MySQLCon, quMYSQL);
                            format(poolsts, 150, "* %s a pierdut meciul, a introdus bila neagra in gaura. (+%s$)", nm[Pool2LastShooter], FormatNumber(StakePol2)), SendClientMessage(pInfo[Pool2LastShooter][pPoolIn], COLOR_LIGHTBLUE, poolsts);
                            format(poolsts, 150, "* Ai pierdut meciul, ai introdus bila neagra in gaura. (-%s$)", FormatNumber(StakePol2)), SendClientMessage(Pool2LastShooter, COLOR_LIGHTBLUE, poolsts);
                            TextDrawHideForPlayer(Pool2LastShooter, Pool2s0), TextDrawHideForPlayer(Pool2LastShooter, Pool2s1), TextDrawHideForPlayer(Pool2LastShooter, Pool2s2), TextDrawHideForPlayer(Pool2LastShooter, Pool2s3);
                            TextDrawHideForPlayer(Pool2LastShooter, Pool2s4), TextDrawHideForPlayer(Pool2LastShooter, Pool2s5), TextDrawHideForPlayer(Pool2LastShooter, Pool2s6), TextDrawHideForPlayer(Pool2LastShooter, Pool2s7);
                            TextDrawHideForPlayer(Pool2LastShooter, Pool2s8), TextDrawHideForPlayer(Pool2LastShooter, Pool2s9), TextDrawHideForPlayer(Pool2LastShooter, Pool2s10), TextDrawHideForPlayer(Pool2LastShooter, Pool2s11);
                            TextDrawHideForPlayer(Pool2LastShooter, Pool2s12), TextDrawHideForPlayer(Pool2LastShooter, Pool2s13), TextDrawHideForPlayer(Pool2LastShooter, Pool2s14), TextDrawHideForPlayer(Pool2LastShooter, Pool2s15);
                            TextDrawHideForPlayer(Pool2LastShooter, Pool2s16), TextDrawHideForPlayer(Pool2LastShooter, Pool2s17), TextDrawHideForPlayer(Pool2LastShooter, Pool2s18), TextDrawHideForPlayer(Pool2LastShooter, Pool2s19);

                            TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s0), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s1), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s2), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s3);
                            TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s4), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s5), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s6), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s7);
                            TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s8), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s9), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s10), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s11);
                            TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s12), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s13), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s14), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s15);
                            TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s16), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s17), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s18), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s19);
                            GiveMoney(pInfo[Pool2LastShooter][pPoolIn], StakePol2), GiveMoney(Pool2LastShooter, -StakePol2), PlayingPool[pInfo[Pool2LastShooter][pPoolIn]] = 0, pool21ob = CreateDynamicObject(338, 506.64871, -83.64490, 998.26721,   4.00000, 0.00000, 0.00000), pool22ob2 = CreateDynamicObject(338, 506.22571, -83.64490, 998.26721,   4.00000, 0.00000, 0.00000), plas2 = CreateDynamicObject(2965, 506.55569, -85.37160, 998.86182,   0.00000, 0.00000, -210.00000),
                            UpdateDynamic3DTextLabelText(Pool2TD1, -1, "Pool Table #2\nStatus: {00BA19}Available\n{FFFFFF}Type {33C494}/pool {FFFFFF}to play billiards."), RemovePlayerWeapon(pInfo[Pool2LastShooter][pPoolIn], 7), RemovePlayerWeapon(Pool2LastShooter, 7), PlayingPool[Pool2LastShooter] = 0, PoolStarted2 = 0, RespawnPool2Balls();
                            if(!(PoolStarted || PoolStarted2)) KillTimer(pydas), pydas = -1;
                        }
                        else
                        {
                            DestroyObject(Aim2Object), ClearAnimations(Pool2Aimer), Pool2Aimer = -1, Aim2Object = 0;
                            TogglePlayerControllable(Pool2LastShooter, 1), SetCameraBehindPlayer(Pool2LastShooter), TextDrawHideForPlayer(Pool2LastShooter, PoolTD0), TextDrawHideForPlayer(Pool2LastShooter, PoolTDs1), TextDrawHideForPlayer(Pool2LastShooter, PoolTD2), TextDrawHideForPlayer(Pool2LastShooter, PoolTD3);
                            TogglePlayerControllable(pInfo[Pool2LastShooter][pPoolIn], 1), SetCameraBehindPlayer(pInfo[Pool2LastShooter][pPoolIn]), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], PoolTD0), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], PoolTDs1), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], PoolTD2), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], PoolTD3);
                            mysql_format(MySQLCon, quMYSQL, 150, "UPDATE `players` SET `Pool`=`Pool`+1 WHERE `ID`=%d", pInfo[Pool2LastShooter][pID]), mysql_tquery(MySQLCon, quMYSQL);
                            format(poolsts, 150, "* Felicitari, ai castigat acest meci de biliard. (+%s$)", FormatNumber(StakePol2)), SendClientMessage(Pool2LastShooter, COLOR_LIGHTBLUE, poolsts);
                            format(poolsts, 150, "* Ai pierdut acest meci de biliard. (-%s$)", FormatNumber(StakePol2)), SendClientMessage(pInfo[Pool2LastShooter][pPoolIn], COLOR_LIGHTBLUE, poolsts);
                            TextDrawHideForPlayer(Pool2LastShooter, Pool2s0), TextDrawHideForPlayer(Pool2LastShooter, Pool2s1), TextDrawHideForPlayer(Pool2LastShooter, Pool2s2), TextDrawHideForPlayer(Pool2LastShooter, Pool2s3);
                            TextDrawHideForPlayer(Pool2LastShooter, Pool2s4), TextDrawHideForPlayer(Pool2LastShooter, Pool2s5), TextDrawHideForPlayer(Pool2LastShooter, Pool2s6), TextDrawHideForPlayer(Pool2LastShooter, Pool2s7);
                            TextDrawHideForPlayer(Pool2LastShooter, Pool2s8), TextDrawHideForPlayer(Pool2LastShooter, Pool2s9), TextDrawHideForPlayer(Pool2LastShooter, Pool2s10), TextDrawHideForPlayer(Pool2LastShooter, Pool2s11);
                            TextDrawHideForPlayer(Pool2LastShooter, Pool2s12), TextDrawHideForPlayer(Pool2LastShooter, Pool2s13), TextDrawHideForPlayer(Pool2LastShooter, Pool2s14), TextDrawHideForPlayer(Pool2LastShooter, Pool2s15);
                            TextDrawHideForPlayer(Pool2LastShooter, Pool2s16), TextDrawHideForPlayer(Pool2LastShooter, Pool2s17), TextDrawHideForPlayer(Pool2LastShooter, Pool2s18), TextDrawHideForPlayer(Pool2LastShooter, Pool2s19);

                            TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s0), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s1), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s2), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s3);
                            TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s4), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s5), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s6), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s7);
                            TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s8), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s9), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s10), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s11);
                            TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s12), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s13), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s14), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s15);
                            TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s16), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s17), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s18), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s19);
                            GiveMoney(Pool2LastShooter, StakePol2), GiveMoney(pInfo[Pool2LastShooter][pPoolIn], -StakePol2), PlayingPool[pInfo[Pool2LastShooter][pPoolIn]] = 0, pool21ob = CreateDynamicObject(338, 506.64871, -83.64490, 998.26721,   4.00000, 0.00000, 0.00000), pool22ob2 = CreateDynamicObject(338, 506.22571, -83.64490, 998.26721,   4.00000, 0.00000, 0.00000), plas2 = CreateDynamicObject(2965, 506.55569, -85.37160, 998.86182,   0.00000, 0.00000, -210.00000),
                            UpdateDynamic3DTextLabelText(Pool2TD1, -1, "Pool Table #2\nStatus: {00BA19}Available\n{FFFFFF}Type {33C494}/pool {FFFFFF}to play billiards."), RemovePlayerWeapon(pInfo[Pool2LastShooter][pPoolIn], 7), RemovePlayerWeapon(Pool2LastShooter, 7), PlayingPool[Pool2LastShooter] = 0, PoolStarted2 = 0, RespawnPool2Balls();
                            if(!(PoolStarted || PoolStarted2)) KillTimer(pydas), pydas = -1;
                        }
                    }
                    case 6:
                    {
                        skeee = 2, TextDrawHideForPlayer(Pool2LastShooter, Pool2s12), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s12);
                        PoolScore[PoolPlin2]++, format(poolsts, 150, "~y~%s ~w~~h~- %d/7", nm[PoolPlin2], PoolScore[PoolPlin2]), TextDrawSetString(Pool2s10, poolsts), PlayerPlaySound(Pool2LastShooter, 1250, 0.0, 0.0, 0.0);
                        if(Pool2LastShooter != PoolPlin2) PoolRand[Pool2LastShooter] = 0, PoolRand[pInfo[Pool2LastShooter][pPoolIn]] = 1,
                            format(poolsts, 150, "Este randul lui ~y~%s~w~~h~.~n~Miza: ~g~%s$", nm[pInfo[Pool2LastShooter][pPoolIn]], FormatNumber(StakePol2)), TextDrawSetString(Pool2s19, poolsts);
                    }
                    case 7:
                    {
                        skeee = 2, TextDrawHideForPlayer(Pool2LastShooter, Pool2s14), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s14);
                        PoolScore[PoolPlin2]++, format(poolsts, 150, "~y~%s ~w~~h~- %d/7", nm[PoolPlin2], PoolScore[PoolPlin2]), TextDrawSetString(Pool2s10, poolsts), PlayerPlaySound(Pool2LastShooter, 1250, 0.0, 0.0, 0.0);
                        if(Pool2LastShooter != PoolPlin2) PoolRand[Pool2LastShooter] = 0, PoolRand[pInfo[Pool2LastShooter][pPoolIn]] = 1,
                            format(poolsts, 150, "Este randul lui ~y~%s~w~~h~.~n~Miza: ~g~%s$", nm[pInfo[Pool2LastShooter][pPoolIn]], FormatNumber(StakePol2)), TextDrawSetString(Pool2s19, poolsts);
                    }
                    case 8:
                    {
                        skeee = 2, TextDrawHideForPlayer(Pool2LastShooter, Pool2s4), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s4);
                        PoolScore[PoolGol2]++, format(poolsts, 150, "~y~%s ~w~~h~- %d/7", nm[PoolGol2], PoolScore[PoolGol2]), TextDrawSetString(Pool2s2, poolsts), PlayerPlaySound(Pool2LastShooter, 1250, 0.0, 0.0, 0.0);
                        if(Pool2LastShooter != PoolGol2) PoolRand[Pool2LastShooter] = 0, PoolRand[pInfo[Pool2LastShooter][pPoolIn]] = 1,
                            format(poolsts, 150, "Este randul lui ~y~%s~w~~h~.~n~Miza: ~g~%s$", nm[pInfo[Pool2LastShooter][pPoolIn]], FormatNumber(StakePol2)), TextDrawSetString(Pool2s19, poolsts);
                    }
                    case 9:
                    {
                        skeee = 2, TextDrawHideForPlayer(Pool2LastShooter, Pool2s11), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s11);
                        PoolScore[PoolPlin2]++, format(poolsts, 150, "~y~%s ~w~~h~- %d/7", nm[PoolPlin2], PoolScore[PoolPlin2]), TextDrawSetString(Pool2s10, poolsts), PlayerPlaySound(Pool2LastShooter, 1250, 0.0, 0.0, 0.0);
                        if(Pool2LastShooter != PoolPlin2) PoolRand[Pool2LastShooter] = 0, PoolRand[pInfo[Pool2LastShooter][pPoolIn]] = 1,
                            format(poolsts, 150, "Este randul lui ~y~%s~w~~h~.~n~Miza: ~g~%s$", nm[pInfo[Pool2LastShooter][pPoolIn]], FormatNumber(StakePol2)), TextDrawSetString(Pool2s19, poolsts);
                    }
                    case 10:
                    {
                        skeee = 2, TextDrawHideForPlayer(Pool2LastShooter, Pool2s7), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s7);
                        PoolScore[PoolGol2]++, format(poolsts, 150, "~y~%s ~w~~h~- %d/7", nm[PoolGol2], PoolScore[PoolGol2]), TextDrawSetString(Pool2s2, poolsts), PlayerPlaySound(Pool2LastShooter, 1250, 0.0, 0.0, 0.0);
                        if(Pool2LastShooter != PoolGol2) PoolRand[Pool2LastShooter] = 0, PoolRand[pInfo[Pool2LastShooter][pPoolIn]] = 1,
                            format(poolsts, 150, "Este randul lui ~y~%s~w~~h~.~n~Miza: ~g~%s$", nm[pInfo[Pool2LastShooter][pPoolIn]], FormatNumber(StakePol2)), TextDrawSetString(Pool2s19, poolsts);
                    }
                    case 11:
                    {
                        skeee = 2, TextDrawHideForPlayer(Pool2LastShooter, Pool2s5), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s5);
                        PoolScore[PoolGol2]++, format(poolsts, 150, "~y~%s ~w~~h~- %d/7", nm[PoolGol2], PoolScore[PoolGol2]), TextDrawSetString(Pool2s2, poolsts), PlayerPlaySound(Pool2LastShooter, 1250, 0.0, 0.0, 0.0);
                        if(Pool2LastShooter != PoolGol2) PoolRand[Pool2LastShooter] = 0, PoolRand[pInfo[Pool2LastShooter][pPoolIn]] = 1,
                            format(poolsts, 150, "Este randul lui ~y~%s~w~~h~.~n~Miza: ~g~%s$", nm[pInfo[Pool2LastShooter][pPoolIn]], FormatNumber(StakePol2)), TextDrawSetString(Pool2s19, poolsts);
                    }
                    case 12:
                    {
                        skeee = 2, TextDrawHideForPlayer(Pool2LastShooter, Pool2s15), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s15);
                        PoolScore[PoolPlin2]++, format(poolsts, 150, "~y~%s ~w~~h~- %d/7", nm[PoolPlin2], PoolScore[PoolPlin2]), TextDrawSetString(Pool2s10, poolsts), PlayerPlaySound(Pool2LastShooter, 1250, 0.0, 0.0, 0.0);
                        if(Pool2LastShooter != PoolPlin2) PoolRand[Pool2LastShooter] = 0, PoolRand[pInfo[Pool2LastShooter][pPoolIn]] = 1,
                            format(poolsts, 150, "Este randul lui ~y~%s~w~~h~.~n~Miza: ~g~%s$", nm[pInfo[Pool2LastShooter][pPoolIn]], FormatNumber(StakePol2)), TextDrawSetString(Pool2s19, poolsts);
                    }
                    case 13:
                    {
                        skeee = 2, TextDrawHideForPlayer(Pool2LastShooter, Pool2s6), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s6);
                        PoolScore[PoolGol2]++, format(poolsts, 150, "~y~%s ~w~~h~- %d/7", nm[PoolGol2], PoolScore[PoolGol2]), TextDrawSetString(Pool2s2, poolsts), PlayerPlaySound(Pool2LastShooter, 1250, 0.0, 0.0, 0.0);
                        if(Pool2LastShooter != PoolGol2) PoolRand[Pool2LastShooter] = 0, PoolRand[pInfo[Pool2LastShooter][pPoolIn]] = 1,
                            format(poolsts, 150, "Este randul lui ~y~%s~w~~h~.~n~Miza: ~g~%s$", nm[pInfo[Pool2LastShooter][pPoolIn]], FormatNumber(StakePol2)), TextDrawSetString(Pool2s19, poolsts);
                    }
                    case 14:
                    {
                        skeee = 2, TextDrawHideForPlayer(Pool2LastShooter, Pool2s3), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s3);
                        PoolScore[PoolGol2]++, format(poolsts, 150, "~y~%s ~w~~h~- %d/7", nm[PoolGol2], PoolScore[PoolGol2]), TextDrawSetString(Pool2s2, poolsts), PlayerPlaySound(Pool2LastShooter, 1250, 0.0, 0.0, 0.0);
                        if(Pool2LastShooter != PoolGol2) PoolRand[Pool2LastShooter] = 0, PoolRand[pInfo[Pool2LastShooter][pPoolIn]] = 1,
                            format(poolsts, 150, "Este randul lui ~y~%s~w~~h~.~n~Miza: ~g~%s$", nm[pInfo[Pool2LastShooter][pPoolIn]], FormatNumber(StakePol2)), TextDrawSetString(Pool2s19, poolsts);
                    }
                    case 15:
                    {
                        skeee = 2, TextDrawHideForPlayer(Pool2LastShooter, Pool2s13), TextDrawHideForPlayer(pInfo[Pool2LastShooter][pPoolIn], Pool2s13);
                        PoolScore[PoolPlin2]++, format(poolsts, 150, "~y~%s ~w~~h~- %d/7", nm[PoolPlin2], PoolScore[PoolPlin2]), TextDrawSetString(Pool2s10, poolsts), PlayerPlaySound(Pool2LastShooter, 1250, 0.0, 0.0, 0.0);
                        if(Pool2LastShooter != PoolPlin2) PoolRand[Pool2LastShooter] = 0, PoolRand[pInfo[Pool2LastShooter][pPoolIn]] = 1,
                            format(poolsts, 150, "Este randul lui ~y~%s~w~~h~.~n~Miza: ~g~%s$", nm[pInfo[Pool2LastShooter][pPoolIn]], FormatNumber(StakePol2)), TextDrawSetString(Pool2s19, poolsts);
                    }
                }
            }
            return 1;
        }
    }
    return 1;
}

stock GetAngleToXY(Float:X, Float:Y, Float:CurrX, Float:CurrY, &Float:angle)
{
    angle = atan2(Y-CurrY, X-CurrX), angle = floatsub(angle, 90.0);
    if(angle < 0.0) angle = floatadd(angle, 360.0);
}

stock GetXYInFrontOfPos(Float:xxc,Float:yyc,Float:acc, &Float:x2v, &Float:y2, Float:distance)
{
    if(acc>360) acc=acc-360;
    xxc += (distance * floatsin(-acc, degrees)), yyc += (distance * floatcos(-acc, degrees)), x2v=xxc, y2=yyc;
}

stock IsPointFacingPoint(Float:dOffset, Float:X, Float:Y, Float:pA, Float:pX, Float:pY)
{
    new Float:ang;
    if( Y > pY ) ang = (-acos((X - pX) / floatsqroot((X - pX)*(X - pX) + (Y - pY)*(Y - pY))) - 90.0);
    else if( Y < pY && X < pX ) ang = (acos((X - pX) / floatsqroot((X - pX)*(X - pX) + (Y - pY)*(Y - pY))) - 450.0);
    else if( Y < pY ) ang = (acos((X - pX) / floatsqroot((X - pX)*(X - pX) + (Y - pY)*(Y - pY))) - 90.0);
    if(AngleInRangeOfAngle(-ang, pA, dOffset)) return true;
    return false;

}

stock Is2DPointInRangeOfPoint(Float:xwe, Float:ywe, Float:x2ws, Float:y2w, Float:range)
{
    x2ws -= xwe, y2w -= ywe;
    return ((x2ws * x2ws) + (y2w * y2w)) < (range * range);
}
stock IsObjectInSphere(objectid,Float:xve,Float:yve,Float:zve,Float:radius2)
{
    GetObjectPos(objectid,x1sw,y1sw,z1sw), tmpdisw = floatsqroot(floatpower(floatabs(floatsub(xve,x1sw)),2)+ floatpower(floatabs(floatsub(yve,y1sw)),2)+ floatpower(floatabs(floatsub(zve,z1sw)),2));
    if(tmpdisw < radius2) return 1;
    return 0;
}

stock AreAllBallsStopped()
{
    for(new i; i < 16; i++) if(PoolBall[i][bExisting])
    {
        PHY_GetObjectVelocity(PoolBall[i][bObject], xbs, ybs, zbs);
        if(xbs != 0.0 || ybs != 0.0) return 0;
    }
    return 1;
}

stock AreAllBalls2Stopped()
{
    for(new i; i < 16; i++) if(Pool2Ball[i][bExisting])
    {
        PHY_GetObjectVelocity(Pool2Ball[i][bObject], xbs, ybs, zbs);
        if(xbs != 0.0 || ybs != 0.0) return 0;
    }
    return 1;
}

stock RespawnPoolBalls(init = 0)
{
    for(new i; i < 16; i++)
    {
        DestroyObject(PoolBall[i][bObject]);
        if(PoolBall[i][bExisting]) PHY_DeleteObject(PoolBall[i][bObject]), PoolBall[i][bExisting] = 0;
    }
    if(PoolAimer != -1)
    {
        TogglePlayerControllable(PoolAimer, 1), ClearAnimations(PoolAimer), ApplyAnimation(PoolAimer, "CARRY", "crry_prtial", 1.0, 0, 0, 0, 0, 0);
        SetCameraBehindPlayer(PoolAimer), PoolAimer = -1, DestroyObject(AimObject), AimObject = 0;
        TextDrawHideForPlayer(PoolAimer, PoolTD0), TextDrawHideForPlayer(PoolAimer, PoolTDs1), TextDrawHideForPlayer(PoolAimer, PoolTD2), TextDrawHideForPlayer(PoolAimer, PoolTD3);
    }
    CreateBalls();
    if(init)
    {
        for(new i; i < 16; i++)
            InitBall(i);
    }
    return 1;
}

stock RespawnPool2Balls(init = 0)
{
    for(new i; i < 16; i++)
    {
        DestroyObject(Pool2Ball[i][bObject]);
        if(Pool2Ball[i][bExisting]) PHY_DeleteObject(Pool2Ball[i][bObject]), Pool2Ball[i][bExisting] = 0;
    }
    if(Pool2Aimer != -1)
    {
        TogglePlayerControllable(Pool2Aimer, 1), ClearAnimations(Pool2Aimer), ApplyAnimation(Pool2Aimer, "CARRY", "crry_prtial", 1.0, 0, 0, 0, 0, 0);
        SetCameraBehindPlayer(Pool2Aimer), Pool2Aimer = -1, DestroyObject(Aim2Object), Aim2Object = 0;
        TextDrawHideForPlayer(Pool2Aimer, Pool2TD0), TextDrawHideForPlayer(Pool2Aimer, Pool2TDs1), TextDrawHideForPlayer(Pool2Aimer, Pool2TD2), TextDrawHideForPlayer(Pool2Aimer, Pool2TD3);
    }
    Create2Balls();
    if(init)
    {
        for(new i; i < 16; i++)
            Init2Ball(i);
    }
    return 1;
}

stock Create2Balls()
{
    Pool2Ball[0][bObject] = CreateObject(3003, 506.47821, -84.40770, 998.86792,   0.00000, 0.00000, 0.00000);
    Pool2Ball[1][bObject] = CreateObject(3002, 506.47681, -85.16640, 998.86749,   0.00000, 0.00000, 0.00000);
    Pool2Ball[2][bObject] = CreateObject(3101, 506.51071, -85.23260, 998.86749,   0.00000, 0.00000, 0.00000);
    Pool2Ball[3][bObject] = CreateObject(2995, 506.43570, -85.23220, 998.86749,   0.00000, 0.00000, 0.00000);
    Pool2Ball[4][bObject] = CreateObject(2996, 506.55399, -85.29530, 998.86749,   0.00000, 0.00000, 0.00000);
    Pool2Ball[5][bObject] = CreateObject(3106, 506.48041, -85.29730, 998.86749,   0.00000, 0.00000, 0.00000);
    Pool2Ball[6][bObject] = CreateObject(3105, 506.40469, -85.29920, 998.86749,   0.00000, 0.00000, 0.00000);
    Pool2Ball[7][bObject] = CreateObject(3103, 506.59109, -85.36230, 998.86749,   0.00000, 0.00000, 0.00000);
    Pool2Ball[8][bObject] = CreateObject(3001, 506.51630, -85.36600, 998.86749,   0.00000, 0.00000, 0.00000);
    Pool2Ball[9][bObject] = CreateObject(3100, 506.44260, -85.36520, 998.86749,   0.00000, 0.00000, 0.00000);
    Pool2Ball[10][bObject] = CreateObject(2997, 506.36850, -85.36360, 998.86749,   0.00000, 0.00000, 0.00000);
    Pool2Ball[11][bObject] = CreateObject(3000, 506.62720, -85.43110, 998.86749,   0.00000, 0.00000, 0.00000);
    Pool2Ball[12][bObject] = CreateObject(3102, 506.55200, -85.43050, 998.86749,   0.00000, 0.00000, 0.00000);
    Pool2Ball[13][bObject] = CreateObject(2999, 506.47699, -85.43200, 998.86749,   0.00000, 0.00000, 0.00000);
    Pool2Ball[14][bObject] = CreateObject(2998, 506.40369, -85.43260, 998.86749,   0.00000, 0.00000, 0.00000);
    Pool2Ball[15][bObject] = CreateObject(3104, 506.32999, -85.42740, 998.86749,   0.00000, 0.00000, 0.00000);
}

stock CreateBalls()
{
    PoolBall[0][bObject] = CreateObject(3003, 510.11218261719, -84.40771484375, 998.86785888672, 0, 0, 0);
    PoolBall[1][bObject] = CreateObject(3002, 510.10882568359, -85.166389465332, 998.86749267578, 0, 0, 0);
    PoolBall[2][bObject] = CreateObject(3101, 510.14270019531, -85.232612609863, 998.86749267578, 0, 0, 0);
    PoolBall[3][bObject] = CreateObject(2995, 510.0676574707, -85.232200622559, 998.86749267578, 0, 0, 0);
    PoolBall[4][bObject] = CreateObject(2996, 510.18600463867, -85.295257568359, 998.86749267578, 0, 0, 0);
    PoolBall[5][bObject] = CreateObject(3106, 510.11242675781, -85.297294616699, 998.86749267578, 0, 0, 0);
    PoolBall[6][bObject] = CreateObject(3105, 510.03665161133, -85.299163818359, 998.86749267578, 0, 0, 0);
    PoolBall[7][bObject] = CreateObject(3103, 510.22308349609, -85.362342834473, 998.86749267578, 0, 0, 0);
    PoolBall[8][bObject] = CreateObject(3001, 510.14828491211, -85.365989685059, 998.86749267578, 0, 0, 0);
    PoolBall[9][bObject] = CreateObject(3100, 510.07455444336, -85.365234375, 998.86749267578, 0, 0, 0);
    PoolBall[10][bObject] = CreateObject(2997, 510.00054931641, -85.363563537598, 998.86749267578, 0, 0, 0);
    PoolBall[11][bObject] = CreateObject(3000, 510.25915527344, -85.431137084961, 998.86749267578, 0, 0, 0);
    PoolBall[12][bObject] = CreateObject(3102, 510.18399047852, -85.430549621582, 998.86749267578, 0, 0, 0);
    PoolBall[13][bObject] = CreateObject(2999, 510.10900878906, -85.43196105957, 998.86749267578, 0, 0, 0);
    PoolBall[14][bObject] = CreateObject(2998, 510.03570556641, -85.432624816895, 998.86749267578, 0, 0, 0);
    PoolBall[15][bObject] = CreateObject(3104, 509.96197509766, -85.427406311035, 998.86749267578, 0, 0, 0);
}

stock InitBall(i)
{
    PHY_InitObject(PoolBall[i][bObject], 3003, _, _, PHY_MODE_2D), PHY_SetObjectFriction(PoolBall[i][bObject], 0.40);
    PHY_RollObject(PoolBall[i][bObject]), PoolBall[i][bExisting] = 1;
}

stock Init2Ball(i)
{
    PHY_InitObject(Pool2Ball[i][bObject], 3003, _, _, PHY_MODE_2D), PHY_SetObjectFriction(Pool2Ball[i][bObject], 0.40);
    PHY_RollObject(Pool2Ball[i][bObject]), Pool2Ball[i][bExisting] = 1;
}

stock LoadPool()
{
    CreateBalls(), Create2Balls();

    PHY_CreateWall(509.589, -85.818, 510.636, -85.818);
    PHY_CreateWall(510.636, -85.818, 510.636, -83.869);
    PHY_CreateWall(510.636, -83.869, 509.589, -83.869);
    PHY_CreateWall(509.589, -83.869, 509.589, -85.818);

    PHY_CreateWall(505.9718, -85.818, 507.0188, -85.818);
    PHY_CreateWall(507.0188, -85.818, 507.0188, -83.869);
    PHY_CreateWall(507.0188, -83.869, 505.9718, -83.869);
    PHY_CreateWall(505.9718, -83.869, 505.9718, -85.818);


    PoolTD0 = TextDrawCreate(505.000000, 260.000000, "~n~~n~");
    TextDrawBackgroundColor(PoolTD0, 255);
    TextDrawFont(PoolTD0, 1);
    TextDrawLetterSize(PoolTD0, 0.500000, 0.239999);
    TextDrawColor(PoolTD0, -1);
    TextDrawSetOutline(PoolTD0, 0);
    TextDrawSetProportional(PoolTD0, 1);
    TextDrawSetShadow(PoolTD0, 1);
    TextDrawUseBox(PoolTD0, 1);
    TextDrawBoxColor(PoolTD0, 255);
    TextDrawTextSize(PoolTD0, 569.000000, -10.000000);

    PoolTDs1 = TextDrawCreate(506.000000, 261.000000, "~n~~n~");
    TextDrawBackgroundColor(PoolTDs1, 255);
    TextDrawFont(PoolTDs1, 1);
    TextDrawLetterSize(PoolTDs1, 0.500000, 0.100000);
    TextDrawColor(PoolTDs1, -1);
    TextDrawSetOutline(PoolTDs1, 0);
    TextDrawSetProportional(PoolTDs1, 1);
    TextDrawSetShadow(PoolTDs1, 1);
    TextDrawUseBox(PoolTDs1, 1);
    TextDrawBoxColor(PoolTDs1, 911303167);
    TextDrawTextSize(PoolTDs1, 568.000000, 0.000000);

    PoolTD2 = TextDrawCreate(506.000000, 261.000000, "~n~~n~");
    TextDrawBackgroundColor(PoolTD2, 255);
    TextDrawFont(PoolTD2, 1);
    TextDrawLetterSize(PoolTD2, 0.500000, 0.100000);
    TextDrawColor(PoolTD2, -1);
    TextDrawSetOutline(PoolTD2, 0);
    TextDrawSetProportional(PoolTD2, 1);
    TextDrawSetShadow(PoolTD2, 1);
    TextDrawUseBox(PoolTD2, 1);
    TextDrawBoxColor(PoolTD2, 0x00B2EDFF);
    TextDrawTextSize(PoolTD2, 501.000000, 0.000000);

    PoolTD3 = TextDrawCreate(503.000000, 267.000000, "SPEED");
    TextDrawBackgroundColor(PoolTD3, 255);
    TextDrawFont(PoolTD3, 2);
    TextDrawLetterSize(PoolTD3, 0.219999, 1.100000);
    TextDrawColor(PoolTD3, -1);
    TextDrawSetOutline(PoolTD3, 1);
    TextDrawSetProportional(PoolTD3, 1);
    TextDrawSetSelectable(PoolTD3, 0);

    Pool2TD0 = TextDrawCreate(505.000000, 260.000000, "~n~~n~");
    TextDrawBackgroundColor(Pool2TD0, 255);
    TextDrawFont(Pool2TD0, 1);
    TextDrawLetterSize(Pool2TD0, 0.500000, 0.239999);
    TextDrawColor(Pool2TD0, -1);
    TextDrawSetOutline(Pool2TD0, 0);
    TextDrawSetProportional(Pool2TD0, 1);
    TextDrawSetShadow(Pool2TD0, 1);
    TextDrawUseBox(Pool2TD0, 1);
    TextDrawBoxColor(Pool2TD0, 255);
    TextDrawTextSize(Pool2TD0, 569.000000, -10.000000);

    Pool2TDs1 = TextDrawCreate(506.000000, 261.000000, "~n~~n~");
    TextDrawBackgroundColor(Pool2TDs1, 255);
    TextDrawFont(Pool2TDs1, 1);
    TextDrawLetterSize(Pool2TDs1, 0.500000, 0.100000);
    TextDrawColor(Pool2TDs1, -1);
    TextDrawSetOutline(Pool2TDs1, 0);
    TextDrawSetProportional(Pool2TDs1, 1);
    TextDrawSetShadow(Pool2TDs1, 1);
    TextDrawUseBox(Pool2TDs1, 1);
    TextDrawBoxColor(Pool2TDs1, 911303167);
    TextDrawTextSize(Pool2TDs1, 568.000000, 0.000000);

    Pool2TD2 = TextDrawCreate(506.000000, 261.000000, "~n~~n~");
    TextDrawBackgroundColor(Pool2TD2, 255);
    TextDrawFont(Pool2TD2, 1);
    TextDrawLetterSize(Pool2TD2, 0.500000, 0.100000);
    TextDrawColor(Pool2TD2, -1);
    TextDrawSetOutline(Pool2TD2, 0);
    TextDrawSetProportional(Pool2TD2, 1);
    TextDrawSetShadow(Pool2TD2, 1);
    TextDrawUseBox(Pool2TD2, 1);
    TextDrawBoxColor(Pool2TD2, 0x00B2EDFF);
    TextDrawTextSize(Pool2TD2, 501.000000, 0.000000);

    Pool2TD3 = TextDrawCreate(503.000000, 267.000000, "SPEED");
    TextDrawBackgroundColor(Pool2TD3, 255);
    TextDrawFont(Pool2TD3, 2);
    TextDrawLetterSize(Pool2TD3, 0.219999, 1.100000);
    TextDrawColor(Pool2TD3, -1);
    TextDrawSetOutline(Pool2TD3, 1);
    TextDrawSetProportional(Pool2TD3, 1);
    TextDrawSetSelectable(Pool2TD3, 0);
}

forward Poo();
public Poo()
{
    foreach(new a : ITER_Object) if(phy[a][px] != 0 || phy[a][py] != 0)
    {
        GetObjectPos(a, xoos, yoos, zoos), x1ql = xoos + phy[a][px] * 0.04, y1vv = yoos + phy[a][py] * 0.04;
        foreach(new b : ITER_Object) if(a != b)
        {
            GetObjectPos(b, x2w, y2rr, z2rr), dxkhd = x1ql - x2w, dykj = y1vv - y2rr, distwe = (dxkhd * dxkhd) + (dykj * dykj);
            if(distwe < 0.0058366544)
            {
                dvx = phy[a][px] - phy[b][px], dvy = phy[a][py] - phy[b][py], mag = dvx * dxkhd + dvy * dykj + 0 * 0.0;
                if(mag < 0.0)
                {
                    newvx1 = phy[a][px], newvy1 = phy[a][py], newvx2w = phy[b][px], newvy2 = phy[b][py], projectVonU(phy[a][px], phy[a][py], dxkhd, dykj, tmpvx, tmpvy);
                    newvx1 -= tmpvx, newvy1 -= tmpvy, projectVonU(phy[b][px], phy[b][py], -dxkhd, -dykj, tmpvx, tmpvy), tmpvx = (0 * phy[a][px] + 2 * 1.0 * tmpvx) / 2, tmpvy = (0 * phy[a][py] + 2 * 1.0 * tmpvy) / 2;
                    newvx1 += tmpvx, newvy1 += tmpvy, projectVonU(phy[b][px], phy[b][py], dxkhd, dykj, tmpvx, tmpvy), newvx2w -= tmpvx, newvy2 -= tmpvy;
                    projectVonU(phy[a][px], phy[a][py], -dxkhd, -dykj, tmpvx, tmpvy), tmpvx = (0 * phy[b][px] + 2 * 1.0 * tmpvx) / 2, tmpvy = (0 * phy[b][py] + 2 * 1.0 * tmpvy) / 2;
                    newvx2w += tmpvx, newvy2 += tmpvy, phy[a][px] = newvx1, phy[a][py] = newvy1, phy[b][px] = newvx2w, phy[b][py] = newvy2;
                }
            }
        }
        for(new w = 0; w < 8; w++)
        {
            if(check_segment_intersection(PHY_Wall[w][PHY_X1], PHY_Wall[w][PHY_Y1], PHY_Wall[w][PHY_X2], PHY_Wall[w][PHY_Y2], x1ql, y1vv, 0.038199, xclosest, yclosest) || check_segment_intersection(PHY_Wall[w][PHY_X1], PHY_Wall[w][PHY_Y1], PHY_Wall[w][PHY_X2], PHY_Wall[w][PHY_Y2], (xoos + x1ql)/2, (yoos + y1vv)/2, 0.038199, xclosest, yclosest))
            {
                angleww = PHY_Wall[w][PHY_ANG], newvx1 = PHY_Wall[w][PHY_BounceConst] * (phy[a][px] * floatcos(angleww, degrees) - phy[a][py] * floatsin(angleww, degrees));
                newvy1 = -PHY_Wall[w][PHY_BounceConst] * (phy[a][px] * floatsin(angleww, degrees) + phy[a][py] * floatcos(angleww, degrees));
                angleww = -angleww, phy[a][px] = newvx1 * floatcos(angleww, degrees) - newvy1 * floatsin(angleww, degrees), phy[a][py] = newvx1 * floatsin(angleww, degrees) + newvy1 * floatcos(angleww, degrees);
                angleww = angleww + (newvy1 > 0 ? 90.0 : -90.0), x1ql = xclosest + 0.039199 * floatcos(angleww, degrees), y1vv = yclosest + 0.039199 * floatsin(angleww, degrees);
            }
        }
        moveangle = atan2(phy[a][py], phy[a][px]) - 90.0, speedwr = floatsqroot(phy[a][px] * phy[a][px] + phy[a][py] * phy[a][py]), speedwr -= 0.016;
        if(speedwr < 0.001) speedwr = 0;
        phy[a][px] = speedwr * floatsin(-moveangle, degrees), phy[a][py] = speedwr * floatcos(-moveangle, degrees);
        if(speedwr > 0.0) { GetObjectRot(a, rxj, ryj, rzj), rxj -= speedwr * 0.04 * 57.2958279 / 0.038199; if(rxj < 0.0) rxj += 360.0; rzj = moveangle, SetObjectRot(a, rxj, ryj, rzj); }
        phy[a][px] += phy[a][PHY_AX], phy[a][py] += phy[a][PHY_AY], SetObjectPos(a, x1ql, y1vv, 998.867858), PHY_OnObjectUpdate(a);
    }
    if(PoolStarted)
    {
        if(PoolAimer != -1)
        {
            GetPlayerKeys(PoolAimer, keysp, udp, lrp);
            if(!(keysp & KEY_FIRE))
            {
                if(lrp)
                {
                    GetPlayerPos(PoolAimer, Xfs, Yfs, Zfs), GetObjectPos(PoolBall[0][bObject], Xab, Yab, Zavw), newrotsd = AimAngle[PoolAimer][0] + (lrp > 0 ? 0.9 : -0.9), distsd = GetPointDistanceToPoint(Xfs, Yfs, Xab, Yab);
                    if(AngleInRangeOfAngle(AimAngle[PoolAimer][1], newrotsd, 30.0))
                    {
                        AimAngle[PoolAimer][0] = newrotsd;
                        switch(PoolCamera[PoolAimer])
                        {
                            case 0: GetXYBehindObjectInAngle(PoolBall[0][bObject], newrotsd, xqqq, yqr, 0.675), SetPlayerCameraPos(PoolAimer, xqqq, yqr, 998.86785888672+0.28), SetPlayerCameraLookAt(PoolAimer, Xab, Yab, Zavw+0.170);
                            case 1: SetPlayerCameraPos(PoolAimer, 511.84469604492, -84.831642150879, 1001.4904174805), SetPlayerCameraLookAt(PoolAimer,510.11267089844, -84.831642150879, 998.86785888672);
                            case 2: SetPlayerCameraPos(PoolAimer, 508.7971496582, -84.831642150879, 1001.4904174805), SetPlayerCameraLookAt(PoolAimer,510.11267089844, -84.831642150879, 998.86785888672);
                        }
                        GetXYInFrontOfPos(Xab, Yab, newrotsd+180, xqqq, yqr, 0.085), SetObjectPos(AimObject, xqqq, yqr, Zavw), SetObjectRot(AimObject, 7.0, 0, AimAngle[PoolAimer][0]+180), GetXYInFrontOfPos(Xab, Yab, newrotsd+180, Xfs, Yfs, distsd), SetPlayerPos(PoolAimer, Xfs, Yfs, Zfs), SetPlayerFacingAngle(PoolAimer, newrotsd);
                    }
                }
            }
            else
            {
                if(PoolDir ? (PoolPower -= 4.0) : (PoolPower += 4.0))
                if(PoolPower < 1) PoolDir = 0, PoolPower = 2.0;
                else if(PoolPower > 100.0) PoolDir = 1, PoolPower = 98.0;
                TextDrawTextSize(PoolTD2, 501.0 + ((67.0 * PoolPower)/100.0), 0.0), TextDrawShowForPlayer(PoolAimer, PoolTD2);
            }
        }
        if(PoolLastShooter != -1 && AreAllBallsStopped()) SetTimerEx("RestoreCamera", 800, 0, "d", PoolLastShooter), PoolLastShooter = -1;
    }
    if(PoolStarted2)
    {
        if(Pool2Aimer != -1)
        {
            GetPlayerKeys(Pool2Aimer, keysp, udp, lrp);
            if(!(keysp & KEY_FIRE))
            {
                if(lrp)
                {
                    GetPlayerPos(Pool2Aimer, Xfs, Yfs, Zfs), GetObjectPos(Pool2Ball[0][bObject], Xab, Yab, Zavw), newrotsd = Aim2Angle[Pool2Aimer][0] + (lrp > 0 ? 0.9 : -0.9), distsd = GetPointDistanceToPoint(Xfs, Yfs, Xab, Yab);
                    if(AngleInRangeOfAngle(Aim2Angle[Pool2Aimer][1], newrotsd, 30.0))
                    {
                        Aim2Angle[Pool2Aimer][0] = newrotsd;
                        switch(PoolCamera[Pool2Aimer])
                        {
                            case 0: GetXYBehindObjectInAngle(Pool2Ball[0][bObject], newrotsd, xqqq, yqr, 0.675), SetPlayerCameraPos(Pool2Aimer, xqqq, yqr, 998.86785888672+0.28), SetPlayerCameraLookAt(Pool2Aimer, Xab, Yab, Zavw+0.170);
                            case 1: SetPlayerCameraPos(Pool2Aimer, 507.9283, -84.8733, 1000.7607), SetPlayerCameraLookAt(Pool2Aimer, 506.9373, -84.9959, 999.3845);
                            case 2: SetPlayerCameraPos(Pool2Aimer, 505.1312, -84.6223, 1000.8639), SetPlayerCameraLookAt(Pool2Aimer, 506.1287, -84.6670, 999.2877);
                        }
                        GetXYInFrontOfPos(Xab, Yab, newrotsd+180, xqqq, yqr, 0.085), SetObjectPos(Aim2Object, xqqq, yqr, Zavw), SetObjectRot(Aim2Object, 7.0, 0, Aim2Angle[Pool2Aimer][0]+180), GetXYInFrontOfPos(Xab, Yab, newrotsd+180, Xfs, Yfs, distsd), SetPlayerPos(Pool2Aimer, Xfs, Yfs, Zfs), SetPlayerFacingAngle(Pool2Aimer, newrotsd);
                    }
                }
            }
            else
            {
                if(Pool2Dir ? (Pool2Power -= 4.0) : (Pool2Power += 4.0))
                if(Pool2Power < 1) Pool2Dir = 0, Pool2Power = 2.0;
                else if(Pool2Power > 100.0) Pool2Dir = 1, Pool2Power = 98.0;
                TextDrawTextSize(Pool2TD2, 501.0 + ((67.0 * Pool2Power)/100.0), 0.0), TextDrawShowForPlayer(Pool2Aimer, Pool2TD2);
            }
        }
        if(Pool2LastShooter != -1 && AreAllBalls2Stopped()) SetTimerEx("RestoreCamera2", 800, 0, "d", Pool2LastShooter), Pool2LastShooter = -1;
    }
    return 1;
}

forward RestoreCamera(playerid);
public RestoreCamera(playerid)
{
    if(!PoolBall[0][bExisting]) DestroyObject(PoolBall[0][bObject]), PoolBall[0][bObject] = CreateObject(3003 ,510.11218261719, -84.40771484375, 998.86785888672, 0, 0, 0),
        InitBall(0);
    if(skee == 1) format(poolst, 150, "Este randul lui ~y~%s~w~~h~.~n~Miza: ~g~%s$", nm[PlayerInfo[playerid][pPoolIn]], FormatNumber(StakePol1)), TextDrawSetString(Pool1s19, poolst), PoolRand[playerid] = 0, PoolRand[PlayerInfo[playerid][pPoolIn]] = 1;
    if(PoolAimer == playerid) return 0;
    return TogglePlayerControllable(playerid, 1), TextDrawHideForPlayer(playerid, PoolTD0), TextDrawHideForPlayer(playerid, PoolTDs1), TextDrawHideForPlayer(playerid, PoolTD2), TextDrawHideForPlayer(playerid, PoolTD3), SetCameraBehindPlayer(playerid), 1;
}

forward RestoreCamera2(playerid);
public RestoreCamera2(playerid)
{
    if(!Pool2Ball[0][bExisting]) DestroyObject(Pool2Ball[0][bObject]), Pool2Ball[0][bObject] = CreateObject(3003, 506.47821, -84.40770, 998.86792,   0.00000, 0.00000, 0.00000),
        Init2Ball(0);
    if(skeee == 1) format(poolsts, 150, "Este randul lui ~y~%s~w~~h~.~n~Miza: ~g~%s$", nm[PlayerInfo[playerid][pPoolIn]], FormatNumber(StakePol2)), TextDrawSetString(Pool2s19, poolsts), PoolRand[playerid] = 0, PoolRand[PlayerInfo[playerid][pPoolIn]] = 1;
    if(Pool2Aimer == playerid) return 0;
    return TogglePlayerControllable(playerid, 1), TextDrawHideForPlayer(playerid, Pool2TD0), TextDrawHideForPlayer(playerid, Pool2TDs1), TextDrawHideForPlayer(playerid, Pool2TD2), TextDrawHideForPlayer(playerid, Pool2TD3), SetCameraBehindPlayer(playerid), 1;
}

stock IsBallInHole(i)
{
    if(IsObjectInSphere(PoolBall[i][bObject],509.61123657,-85.79737091,998.86785889,0.0825)) return 1;
    else if(IsObjectInSphere(PoolBall[i][bObject],510.67373657,-84.84423065,998.86785889,0.0825)) return 2;
    else if(IsObjectInSphere(PoolBall[i][bObject],510.61914062,-83.88769531,998.86785889,0.0825)) return 3;
    else if(IsObjectInSphere(PoolBall[i][bObject],509.61077881,-83.89227295,998.86785889,0.0825)) return 4;
    else if(IsObjectInSphere(PoolBall[i][bObject],510.61825562,-85.80107880,998.86785889,0.0825)) return 5;
    else if(IsObjectInSphere(PoolBall[i][bObject],509.55642700,-84.84602356,998.86785889,0.0825)) return 6;
    else return 0;
}

stock IsBall2InHole(i)
{
    if(IsObjectInSphere(Pool2Ball[i][bObject],505.99399,-85.79737091,998.86785889,0.0825)) return 1;
    else if(IsObjectInSphere(Pool2Ball[i][bObject],507.05653657,-84.84423065,998.86785889,0.0825)) return 2;
    else if(IsObjectInSphere(Pool2Ball[i][bObject],507.00194062,-83.88769531,998.86785889,0.0825)) return 3;
    else if(IsObjectInSphere(Pool2Ball[i][bObject],505.99357881,-83.89227295,998.86785889,0.0825)) return 4;
    else if(IsObjectInSphere(Pool2Ball[i][bObject],507.00105562,-85.80107880,998.86785889,0.0825)) return 5;
    else if(IsObjectInSphere(Pool2Ball[i][bObject],505.939227,-84.84602356,998.86785889,0.0825)) return 6;
    else return 0;
}

stock GetXYBehindObjectInAngle(objectid, Float:ay, &Float:x2y, &Float:y2y, Float:distance) GetObjectPos(objectid, x2y, y2y, zpp), x2y += (distance * floatsin(-ay+180, degrees)), y2y += (distance * floatcos(-ay+180, degrees));

stock IsKeyJustDown(key, newkeys, oldkeys)
{
    if((newkeys & key) && !(oldkeys & key)) return 1;
    return 0;
}

stock IsKeyJustUp(key, newkeys, oldkeys)
{
    if(!(newkeys & key) && (oldkeys & key)) return 1;
    return 0;
}

stock AngleInRangeOfAngle(Float:a1, Float:a2, Float:range)
{
    a1 -= a2;
    if((a1 < range) && (a1 > -range)) return true;
    return false;
}