#include <YSI_Coding\y_hooks>

static const disabledJobIds[] = { 4, 10, 13, 12, 16, 3, 8, 14, 7 };

enum {
	e_Area_Job_Farm_Area = 1,
}
new DeerObj[MAX_PLAYERS];
hook OnGameModeInit() {
	new Float:zones_points_1[] = { -632.0,-1249.0,-634.0,-1587.0,-139.0,-1586.0,-131.0,-1240.0,-632.0,-1249.0 }, data[3];
	data[0] = e_Area_Job_Farm_Area;
	Streamer_SetArrayData(STREAMER_TYPE_AREA, CreateDynamicPolygon(zones_points_1, .interiorid = 0), E_STREAMER_EXTRA_ID, data, 1);
	#include "map/farmer_coords"
 	new tmpobjid = CreateDynamicObject(1439, 944.436828, 2127.660644, 1010.021179, 0.000000, 0.000000, -90.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 2803, "cj_meaty", "CJ_FLESH_2", 0x00000000);

	CreateDynamic3DTextLabel("{4790DE}Buon thuoc phien\n{FFFFFF}Nhap '/work' de bat dau cong viec", -1, 1761.1273,-2137.6575,14.4469, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 15.0);
	CreateDynamic3DTextLabel("{4790DE}Nguoi trong vuon\n{FFFFFF}Nhap '/work' de bat dau cong viec", -1, -1080.3639,-1195.3372,129.6956, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 15.0);

    CreateDynamic3DTextLabel("{4790DE}Tho San\n{FFFFFF}Nhap '/work' de bat dau cong viec", -1, -1649.4355,-2246.1865,31.0780, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 15.0);

	//Garduri Fish
	CreateDynamicObject(970, 382.19919, -2042.00671, 7.32180,   0.00000, 0.00000, 0.00000,-1,-1,-1,500.0);
	CreateDynamicObject(970, 378.70398, -2045.08789, 7.32180,   0.00000, 0.00000, -91.98001,-1,-1,-1,500.0);
	CreateDynamicObject(970, 378.51715, -2050.44434, 7.32180,   0.00000, 0.00000, -92.76000,-1,-1,-1,500.0);
	CreateDynamicObject(970, 352.48499, -2050.70313, 7.29520, 0.00000, 0.00000, 0.00000,-1,-1,-1,500.0);
	//Job drugs dealer
	CreateDynamicObject(3409,1756.3000000,-2143.7000000,12.5000000,0.0000000,0.0000000,0.0000000,-1,-1,-1, 100.0, 100.0); //object(grassplant)(1)
	CreateDynamicObject(3409,1752.3000000,-2143.8000000,12.5000000,0.0000000,0.0000000,0.0000000,-1,-1,-1, 100.0, 100.0); //object(grassplant)(2)
	CreateDynamicObject(3409,1748.3000000,-2143.8999000,12.5000000,0.0000000,0.0000000,0.0000000,-1,-1,-1, 100.0, 100.0); //object(grassplant)(3)
	CreateDynamicObject(3409,1744.6000000,-2143.8999000,12.5000000,0.0000000,0.0000000,0.0000000,-1,-1,-1, 100.0, 100.0); //object(grassplant)(4)
	CreateDynamicObject(3409,1756.4000000,-2148.3999000,12.5000000,0.0000000,0.0000000,0.0000000,-1,-1,-1, 100.0, 100.0); //object(grassplant)(5)
	CreateDynamicObject(3409,1752.3000000,-2148.5000000,12.5000000,0.0000000,0.0000000,0.0000000,-1,-1,-1, 100.0, 100.0); //object(grassplant)(6)
	CreateDynamicObject(3409,1748.2000000,-2148.6001000,12.5000000,0.0000000,0.0000000,0.0000000,-1,-1,-1, 100.0, 100.0); //object(grassplant)(7)
	CreateDynamicObject(3409,1744.6000000,-2148.6001000,12.5000000,0.0000000,0.0000000,0.0000000,-1,-1,-1, 100.0, 100.0); //object(grassplant)(8)
	CreateDynamicObject(3409,1767.7000000,-2151.2000000,12.5000000,0.0000000,0.0000000,0.0000000,-1,-1,-1, 100.0, 100.0); //object(grassplant)(9)
	CreateDynamicObject(3409,1763.8000000,-2151.3000000,12.5000000,0.0000000,0.0000000,0.0000000,-1,-1,-1, 100.0, 100.0); //object(grassplant)(10)
	CreateDynamicObject(3409,1759.8000000,-2151.3000000,12.5000000,0.0000000,0.0000000,0.0000000,-1,-1,-1, 100.0, 100.0); //object(grassplant)(11)
	CreateDynamicObject(3409,1744.8000000,-2153.5000000,12.5000000,0.0000000,0.0000000,0.0000000,-1,-1,-1, 100.0, 100.0); //object(grassplant)(12)
	CreateDynamicObject(3409,1748.7000000,-2153.6001000,12.5000000,0.0000000,0.0000000,0.0000000,-1,-1,-1, 100.0, 100.0); //object(grassplant)(13)
	CreateDynamicObject(3409,1752.9000000,-2153.5000000,12.5000000,0.0000000,0.0000000,0.0000000,-1,-1,-1, 100.0, 100.0); //object(grassplant)(14)
	CreateDynamicObject(3409,1757.1000000,-2153.3000000,12.5000000,0.0000000,0.0000000,0.0000000,-1,-1,-1, 100.0, 100.0); //object(grassplant)(15)
	CreateDynamicObject(3409,1761.1000000,-2152.8000000,12.5000000,0.0000000,0.0000000,0.0000000,-1,-1,-1, 100.0, 100.0); //object(grassplant)(16)
	CreateDynamicObject(3409,1761.1000000,-2154.2000000,12.5000000,0.0000000,0.0000000,0.0000000,-1,-1,-1, 100.0, 100.0); //object(grassplant)(17)
	CreateDynamicObject(3409,1765.1000000,-2154.2000000,12.5000000,0.0000000,0.0000000,0.0000000,-1,-1,-1, 100.0, 100.0); //object(grassplant)(18)
	
	CreateDynamic3DTextLabel("Tu lanh\nBam F hoac Enter de lay thuc an.", -1, 375.2184,-115.7927,1001.4922, 5.0);
	CreateDynamicPickup(19916, 23, 375.2184,-115.7927,1001.4922-1.0);
	
	new nrx = 0, nry = 0;
	for(new i = 0; i < sizeof(FarmerTree); i++) {
		FarmerTreeStatus[i] = -1;
		FarmerTree[i] = CreateDynamicObject(738, -(1138.6129 + (nrx * 10)),-(1216.6497 - nry),128.2188, 0.0000, 0.0000, 0.0000);
		FarmerStairTree[i] = CreateDynamicObject(1428, -(1138.0321 + (nrx * 10)), -(1216.6573 - nry), 129.2255, -8.5999, 1.3000, 95.0000);
		FarmerTreeLabel[i] = CreateDynamic3DTextLabel("{8DFF63}Da chin de co the thu hoach", -1, -(1138.0321 + (nrx * 10)), -(1216.6573 - nry), 131.0255, 5.0);
		nrx++;
		if(nrx == 8) {
			nry += 10;
			nrx = 0;
		}
	}
	/*for(new i = 0; i < sizeof(MechanicWheelObj); i++) { MechanicWheelObj[i] = -1; }
	for(new i = 0; i < sizeof(MechanicCar); i++) {
		MechanicGlassObj[i] = -1, MechanicLightObj[i] = -1, MechanicLightObj2[i] = -1, MechanicEngineObj[i] = -1;
		MechanicRearObj[i] = -1, MechanicExhaustObj[i] = -1, MechanicSeatObj[i] = -1, MechanicSpoilerObj[i] = -1, MechanicCarMove[i] = 0, MechanicCarColor[i][0] = -1, MechanicCarColor[i][1] = -1, MechanicCarColor[i][2] = -1, MechanicCarColor[i][3] = -1;
		MechanicTable[i] = CreateObject(19922, 2799.0295, -2417.8488-(i*38), 12.7272, 0.0000, 0.0000, -90.1999); //MKTable1
		CreateObject(1299, 2798.7763, -2415.6979-(i*38), 13.0536, 0.0000, 0.0000, 0.0000); //smashboxpile
		CreateObject(1299, 2798.6162, -2421.1416-(i*38), 13.0536, 0.0000, 0.0000, 0.0000); //smashboxpile
		CreateObject(1080, 2798.7028, -2414.9345-(i*38), 13.9050, -1.4999, -18.8000, 139.9998); //wheel_sr5
		CreateObject(1080, 2798.6774, -2420.1674-(i*38), 13.9081, -1.4999, -18.8000, 139.9998); //wheel_sr5
		CreateObject(19917, 2798.8513, -2417.7343-(i*38), 13.5111, 0.0000, 0.0000, -148.0000); //CutsceneEngine1
		CreateObject(18644, 2799.0168, -2418.5935-(i*38), 13.5723, 0.0000, -87.3999, 4.0000); //Screwdriver1
		CreateObject(18635, 2798.9218, -2416.6662-(i*38), 13.4829, 86.3999, -77.2999, 0.0000); //GTASAHammer1
		CreateObject(18634, 2798.7924, -2419.1062-(i*38), 13.5439, 3.5000, 82.5000, -71.6000); //GTASACrowbar1
		Create3DTextLabel("Bang voi cac cong cu\nBam phim {3C6AD6}F {FFFFFF} hoc {3C6AD6}Enter {FFFFFF}de lay cac cong cu ma ban can", -1, 2799.0295, -2417.8488-(i*38), 12.7272+1, 15,0);
		MechanicCar[i] = CreateObject(3593, 2785.8444, -2417.5979-(38*i), 13.3420, 0.0000, 0.0000, 92.2000);
		SetObjectMaterial(MechanicCar[i], 1, 3564, "dockcargo2_las", "lastrk1", 0xFF1B376D);
		MechanicCarLabel[i] = Create3DTextLabel("Xe dang duoc tao\n{3C6AD6}0%%\n{FFFFFF}Nhap [{3C6AD6}/stratwork{FFFFFF}] de bat dau lam viec", -1, 2785.8444, -2417.5979-(38*i), 13.3420+1.3, 15, 0);
		MechanicCarDone[i] = 0;
	}*/
	TreeTD[0] = TextDrawCreate(509.500000, 308.562500, "");
	TextDrawLetterSize(TreeTD[0], 0.000000, 0.000000);
	TextDrawTextSize(TreeTD[0], 134.000000, 106.000000);
	TextDrawAlignment(TreeTD[0], 1);
	TextDrawColor(TreeTD[0], -1);
	TextDrawSetShadow(TreeTD[0], 0);
	TextDrawSetOutline(TreeTD[0], 0);
	TextDrawBackgroundColor(TreeTD[0], 168430330);
	TextDrawFont(TreeTD[0], 5);
	TextDrawSetProportional(TreeTD[0], 0);
	TextDrawSetShadow(TreeTD[0], 0);
	TextDrawSetPreviewModel(TreeTD[0], 731);
	TextDrawSetPreviewRot(TreeTD[0], 0.000000, 0.000000, 0.000000, 1.000000);

	TreeTD[1] = TextDrawCreate(567.500000, 314.250000, "");
	TextDrawLetterSize(TreeTD[1], 0.000000, 0.000000);
	TextDrawTextSize(TreeTD[1], 34.000000, 26.000000);
	TextDrawAlignment(TreeTD[1], 1);
	TextDrawColor(TreeTD[1], -1);
	TextDrawSetShadow(TreeTD[1], 0);
	TextDrawSetOutline(TreeTD[1], 0);
	TextDrawBackgroundColor(TreeTD[1], 0);
	TextDrawFont(TreeTD[1], 5);
	TextDrawSetProportional(TreeTD[1], 0);
	TextDrawSetShadow(TreeTD[1], 0);
	TextDrawSetSelectable(TreeTD[1], true);
	TextDrawSetPreviewModel(TreeTD[1], 19576);
	TextDrawSetPreviewRot(TreeTD[1], 0.000000, 0.000000, 0.000000, 1.000000);

	TreeTD[2] = TextDrawCreate(578.000000, 327.375000, "");
	TextDrawLetterSize(TreeTD[2], 0.000000, 0.000000);
	TextDrawTextSize(TreeTD[2], 34.000000, 26.000000);
	TextDrawAlignment(TreeTD[2], 1);
	TextDrawColor(TreeTD[2], -1);
	TextDrawSetShadow(TreeTD[2], 0);
	TextDrawSetOutline(TreeTD[2], 0);
	TextDrawBackgroundColor(TreeTD[2], 0);
	TextDrawFont(TreeTD[2], 5);
	TextDrawSetProportional(TreeTD[2], 0);
	TextDrawSetShadow(TreeTD[2], 0);
	TextDrawSetSelectable(TreeTD[2], true);
	TextDrawSetPreviewModel(TreeTD[2], 19576);
	TextDrawSetPreviewRot(TreeTD[2], 0.000000, 0.000000, 0.000000, 1.000000);

	TreeTD[3] = TextDrawCreate(583.000000, 345.750000, "");
	TextDrawLetterSize(TreeTD[3], 0.000000, 0.000000);
	TextDrawTextSize(TreeTD[3], 34.000000, 26.000000);
	TextDrawAlignment(TreeTD[3], 1);
	TextDrawColor(TreeTD[3], -1);
	TextDrawSetShadow(TreeTD[3], 0);
	TextDrawSetOutline(TreeTD[3], 0);
	TextDrawBackgroundColor(TreeTD[3], 0);
	TextDrawFont(TreeTD[3], 5);
	TextDrawSetProportional(TreeTD[3], 0);
	TextDrawSetShadow(TreeTD[3], 0);
	TextDrawSetSelectable(TreeTD[3], true);
	TextDrawSetPreviewModel(TreeTD[3], 19576);
	TextDrawSetPreviewRot(TreeTD[3], 0.000000, 0.000000, 0.000000, 1.000000);

	TreeTD[4] = TextDrawCreate(580.500000, 361.937500, "");
	TextDrawLetterSize(TreeTD[4], 0.000000, 0.000000);
	TextDrawTextSize(TreeTD[4], 34.000000, 26.000000);
	TextDrawAlignment(TreeTD[4], 1);
	TextDrawColor(TreeTD[4], -1);
	TextDrawSetShadow(TreeTD[4], 0);
	TextDrawSetOutline(TreeTD[4], 0);
	TextDrawBackgroundColor(TreeTD[4], 0);
	TextDrawFont(TreeTD[4], 5);
	TextDrawSetProportional(TreeTD[4], 0);
	TextDrawSetShadow(TreeTD[4], 0);
	TextDrawSetSelectable(TreeTD[4], true);
	TextDrawSetPreviewModel(TreeTD[4], 19576);
	TextDrawSetPreviewRot(TreeTD[4], 0.000000, 0.000000, 0.000000, 1.000000);

	TreeTD[5] = TextDrawCreate(581.000000, 376.375000, "");
	TextDrawLetterSize(TreeTD[5], 0.000000, 0.000000);
	TextDrawTextSize(TreeTD[5], 34.000000, 26.000000);
	TextDrawAlignment(TreeTD[5], 1);
	TextDrawColor(TreeTD[5], -1);
	TextDrawSetShadow(TreeTD[5], 0);
	TextDrawSetOutline(TreeTD[5], 0);
	TextDrawBackgroundColor(TreeTD[5], 0);
	TextDrawFont(TreeTD[5], 5);
	TextDrawSetProportional(TreeTD[5], 0);
	TextDrawSetShadow(TreeTD[5], 0);
	TextDrawSetSelectable(TreeTD[5], true);
	TextDrawSetPreviewModel(TreeTD[5], 19576);
	TextDrawSetPreviewRot(TreeTD[5], 0.000000, 0.000000, 0.000000, 1.000000);

	TreeTD[6] = TextDrawCreate(544.000000, 376.812500, "");
	TextDrawLetterSize(TreeTD[6], 0.000000, 0.000000);
	TextDrawTextSize(TreeTD[6], 34.000000, 26.000000);
	TextDrawAlignment(TreeTD[6], 1);
	TextDrawColor(TreeTD[6], -1);
	TextDrawSetShadow(TreeTD[6], 0);
	TextDrawSetOutline(TreeTD[6], 0);
	TextDrawBackgroundColor(TreeTD[6], 0);
	TextDrawFont(TreeTD[6], 5);
	TextDrawSetProportional(TreeTD[6], 0);
	TextDrawSetShadow(TreeTD[6], 0);
	TextDrawSetSelectable(TreeTD[6], true);
	TextDrawSetPreviewModel(TreeTD[6], 19576);
	TextDrawSetPreviewRot(TreeTD[6], 0.000000, 0.000000, 0.000000, 1.000000);

	TreeTD[7] = TextDrawCreate(541.000000, 362.812500, "");
	TextDrawLetterSize(TreeTD[7], 0.000000, 0.000000);
	TextDrawTextSize(TreeTD[7], 34.000000, 26.000000);
	TextDrawAlignment(TreeTD[7], 1);
	TextDrawColor(TreeTD[7], -1);
	TextDrawSetShadow(TreeTD[7], 0);
	TextDrawSetOutline(TreeTD[7], 0);
	TextDrawBackgroundColor(TreeTD[7], 0);
	TextDrawFont(TreeTD[7], 5);
	TextDrawSetProportional(TreeTD[7], 0);
	TextDrawSetShadow(TreeTD[7], 0);
	TextDrawSetSelectable(TreeTD[7], true);
	TextDrawSetPreviewModel(TreeTD[7], 19576);
	TextDrawSetPreviewRot(TreeTD[7], 0.000000, 0.000000, 0.000000, 1.000000);

	TreeTD[8] = TextDrawCreate(538.500000, 347.937500, "");
	TextDrawLetterSize(TreeTD[8], 0.000000, 0.000000);
	TextDrawTextSize(TreeTD[8], 34.000000, 26.000000);
	TextDrawAlignment(TreeTD[8], 1);
	TextDrawColor(TreeTD[8], -1);
	TextDrawSetShadow(TreeTD[8], 0);
	TextDrawSetOutline(TreeTD[8], 0);
	TextDrawBackgroundColor(TreeTD[8], 0);
	TextDrawFont(TreeTD[8], 5);
	TextDrawSetProportional(TreeTD[8], 0);
	TextDrawSetShadow(TreeTD[8], 0);
	TextDrawSetSelectable(TreeTD[8], true);
	TextDrawSetPreviewModel(TreeTD[8], 19576);
	TextDrawSetPreviewRot(TreeTD[8], 0.000000, 0.000000, 0.000000, 1.000000);

	TreeTD[9] = TextDrawCreate(542.500000, 335.250000, "");
	TextDrawLetterSize(TreeTD[9], 0.000000, 0.000000);
	TextDrawTextSize(TreeTD[9], 34.000000, 26.000000);
	TextDrawAlignment(TreeTD[9], 1);
	TextDrawColor(TreeTD[9], -1);
	TextDrawSetShadow(TreeTD[9], 0);
	TextDrawSetOutline(TreeTD[9], 0);
	TextDrawBackgroundColor(TreeTD[9], 0);
	TextDrawFont(TreeTD[9], 5);
	TextDrawSetProportional(TreeTD[9], 0);
	TextDrawSetShadow(TreeTD[9], 0);
	TextDrawSetSelectable(TreeTD[9], true);
	TextDrawSetPreviewModel(TreeTD[9], 19576);
	TextDrawSetPreviewRot(TreeTD[9], 0.000000, 0.000000, 0.000000, 1.000000);

	TreeTD[10] = TextDrawCreate(550.500000, 321.250000, "");
	TextDrawLetterSize(TreeTD[10], 0.000000, 0.000000);
	TextDrawTextSize(TreeTD[10], 34.000000, 26.000000);
	TextDrawAlignment(TreeTD[10], 1);
	TextDrawColor(TreeTD[10], -1);
	TextDrawSetShadow(TreeTD[10], 0);
	TextDrawSetOutline(TreeTD[10], 0);
	TextDrawBackgroundColor(TreeTD[10], 0);
	TextDrawFont(TreeTD[10], 5);
	TextDrawSetProportional(TreeTD[10], 0);
	TextDrawSetShadow(TreeTD[10], 0);
	TextDrawSetSelectable(TreeTD[10], true);
	TextDrawSetPreviewModel(TreeTD[10], 19576);
	TextDrawSetPreviewRot(TreeTD[10], 0.000000, 0.000000, 0.000000, 1.000000);

	TreeTD[11] = TextDrawCreate(562.000000, 339.625000, "");
	TextDrawLetterSize(TreeTD[11], 0.000000, 0.000000);
	TextDrawTextSize(TreeTD[11], 34.000000, 26.000000);
	TextDrawAlignment(TreeTD[11], 1);
	TextDrawColor(TreeTD[11], -1);
	TextDrawSetShadow(TreeTD[11], 0);
	TextDrawSetOutline(TreeTD[11], 0);
	TextDrawBackgroundColor(TreeTD[11], 0);
	TextDrawFont(TreeTD[11], 5);
	TextDrawSetProportional(TreeTD[11], 0);
	TextDrawSetShadow(TreeTD[11], 0);
	TextDrawSetSelectable(TreeTD[11], true);
	TextDrawSetPreviewModel(TreeTD[11], 19576);
	TextDrawSetPreviewRot(TreeTD[11], 0.000000, 0.000000, 0.000000, 1.000000);

	TreeTD[12] = TextDrawCreate(553.000000, 356.687500, "");
	TextDrawLetterSize(TreeTD[12], 0.000000, 0.000000);
	TextDrawTextSize(TreeTD[12], 34.000000, 26.000000);
	TextDrawAlignment(TreeTD[12], 1);
	TextDrawColor(TreeTD[12], -1);
	TextDrawSetShadow(TreeTD[12], 0);
	TextDrawSetOutline(TreeTD[12], 0);
	TextDrawBackgroundColor(TreeTD[12], 0);
	TextDrawFont(TreeTD[12], 5);
	TextDrawSetProportional(TreeTD[12], 0);
	TextDrawSetShadow(TreeTD[12], 0);
	TextDrawSetSelectable(TreeTD[12], true);
	TextDrawSetPreviewModel(TreeTD[12], 19576);
	TextDrawSetPreviewRot(TreeTD[12], 0.000000, 0.000000, 0.000000, 1.000000);

	TreeTD[13] = TextDrawCreate(566.500000, 370.687500, "");
	TextDrawLetterSize(TreeTD[13], 0.000000, 0.000000);
	TextDrawTextSize(TreeTD[13], 34.000000, 26.000000);
	TextDrawAlignment(TreeTD[13], 1);
	TextDrawColor(TreeTD[13], -1);
	TextDrawSetShadow(TreeTD[13], 0);
	TextDrawSetOutline(TreeTD[13], 0);
	TextDrawBackgroundColor(TreeTD[13], 0);
	TextDrawFont(TreeTD[13], 5);
	TextDrawSetProportional(TreeTD[13], 0);
	TextDrawSetShadow(TreeTD[13], 0);
	TextDrawSetSelectable(TreeTD[13], true);
	TextDrawSetPreviewModel(TreeTD[13], 19576);
	TextDrawSetPreviewRot(TreeTD[13], 0.000000, 0.000000, 0.000000, 1.000000);

	TreeTD[14] = TextDrawCreate(568.500000, 353.187500, "");
	TextDrawLetterSize(TreeTD[14], 0.000000, 0.000000);
	TextDrawTextSize(TreeTD[14], 34.000000, 26.000000);
	TextDrawAlignment(TreeTD[14], 1);
	TextDrawColor(TreeTD[14], -1);
	TextDrawSetShadow(TreeTD[14], 0);
	TextDrawSetOutline(TreeTD[14], 0);
	TextDrawBackgroundColor(TreeTD[14], 0);
	TextDrawFont(TreeTD[14], 5);
	TextDrawSetProportional(TreeTD[14], 0);
	TextDrawSetShadow(TreeTD[14], 0);
	TextDrawSetSelectable(TreeTD[14], true);
	TextDrawSetPreviewModel(TreeTD[14], 19576);
	TextDrawSetPreviewRot(TreeTD[14], 0.000000, 0.000000, 0.000000, 1.000000);
	
	/*MechanicWheelTD[0] = TextDrawCreate(445.000000, 282.750000, "");
	TextDrawLetterSize(MechanicWheelTD[0], 0.000000, 0.000000);
	TextDrawTextSize(MechanicWheelTD[0], 202.000000, 132.000000);
	TextDrawAlignment(MechanicWheelTD[0], 1);
	TextDrawColor(MechanicWheelTD[0], -1);
	TextDrawSetShadow(MechanicWheelTD[0], 0);
	TextDrawSetOutline(MechanicWheelTD[0], 0);
	TextDrawBackgroundColor(MechanicWheelTD[0], 168430230);
	TextDrawFont(MechanicWheelTD[0], 5);
	TextDrawSetProportional(MechanicWheelTD[0], 0);
	TextDrawSetShadow(MechanicWheelTD[0], 0);
	TextDrawSetPreviewModel(MechanicWheelTD[0], 1080);
	TextDrawSetPreviewRot(MechanicWheelTD[0], 0.000000, 0.000000, 90.000000, 1.000000);

	MechanicWheelTD[1] = TextDrawCreate(534.299682, 339.625000, "LD_BEAT:CIRCLE");
	TextDrawLetterSize(MechanicWheelTD[1], 0.000000, 0.000000);
	TextDrawTextSize(MechanicWheelTD[1], 30.000000, 17.000000);
	TextDrawAlignment(MechanicWheelTD[1], 1);
	TextDrawColor(MechanicWheelTD[1], -1);
	TextDrawSetShadow(MechanicWheelTD[1], 0);
	TextDrawSetOutline(MechanicWheelTD[1], 0);
	TextDrawBackgroundColor(MechanicWheelTD[1], 255);
	TextDrawFont(MechanicWheelTD[1], 4);
	TextDrawSetProportional(MechanicWheelTD[1], 0);
	TextDrawSetShadow(MechanicWheelTD[1], 0);
	TextDrawSetSelectable(MechanicWheelTD[1], true);

	MechanicWheelTD[2] = TextDrawCreate(521.799682, 315.562500, "LD_BEAT:CIRCLE");
	TextDrawLetterSize(MechanicWheelTD[2], 0.000000, 0.000000);
	TextDrawTextSize(MechanicWheelTD[2], 24.000000, 15.000000);
	TextDrawAlignment(MechanicWheelTD[2], 1);
	TextDrawColor(MechanicWheelTD[2], -1);
	TextDrawSetShadow(MechanicWheelTD[2], 0);
	TextDrawSetOutline(MechanicWheelTD[2], 0);
	TextDrawBackgroundColor(MechanicWheelTD[2], 255);
	TextDrawFont(MechanicWheelTD[2], 4);
	TextDrawSetProportional(MechanicWheelTD[2], 0);
	TextDrawSetShadow(MechanicWheelTD[2], 0);
	TextDrawSetSelectable(MechanicWheelTD[2], true);

	MechanicWheelTD[3] = TextDrawCreate(552.399536, 316.887420, "LD_BEAT:CIRCLE");
	TextDrawLetterSize(MechanicWheelTD[3], 0.000000, 0.000000);
	TextDrawTextSize(MechanicWheelTD[3], 24.000000, 15.000000);
	TextDrawAlignment(MechanicWheelTD[3], 1);
	TextDrawColor(MechanicWheelTD[3], -1);
	TextDrawSetShadow(MechanicWheelTD[3], 0);
	TextDrawSetOutline(MechanicWheelTD[3], 0);
	TextDrawBackgroundColor(MechanicWheelTD[3], 255);
	TextDrawFont(MechanicWheelTD[3], 4);
	TextDrawSetProportional(MechanicWheelTD[3], 0);
	TextDrawSetShadow(MechanicWheelTD[3], 0);
	TextDrawSetSelectable(MechanicWheelTD[3], true);

	MechanicWheelTD[4] = TextDrawCreate(572.299682, 330.437500, "LD_BEAT:CIRCLE");
	TextDrawLetterSize(MechanicWheelTD[4], 0.000000, 0.000000);
	TextDrawTextSize(MechanicWheelTD[4], 24.000000, 15.000000);
	TextDrawAlignment(MechanicWheelTD[4], 1);
	TextDrawColor(MechanicWheelTD[4], -1);
	TextDrawSetShadow(MechanicWheelTD[4], 0);
	TextDrawSetOutline(MechanicWheelTD[4], 0);
	TextDrawBackgroundColor(MechanicWheelTD[4], 255);
	TextDrawFont(MechanicWheelTD[4], 4);
	TextDrawSetProportional(MechanicWheelTD[4], 0);
	TextDrawSetShadow(MechanicWheelTD[4], 0);
	TextDrawSetSelectable(MechanicWheelTD[4], true);

	MechanicWheelTD[5] = TextDrawCreate(572.299682, 350.125000, "LD_BEAT:CIRCLE");
	TextDrawLetterSize(MechanicWheelTD[5], 0.000000, 0.000000);
	TextDrawTextSize(MechanicWheelTD[5], 24.000000, 15.000000);
	TextDrawAlignment(MechanicWheelTD[5], 1);
	TextDrawColor(MechanicWheelTD[5], -1);
	TextDrawSetShadow(MechanicWheelTD[5], 0);
	TextDrawSetOutline(MechanicWheelTD[5], 0);
	TextDrawBackgroundColor(MechanicWheelTD[5], 255);
	TextDrawFont(MechanicWheelTD[5], 4);
	TextDrawSetProportional(MechanicWheelTD[5], 0);
	TextDrawSetShadow(MechanicWheelTD[5], 0);
	TextDrawSetSelectable(MechanicWheelTD[5], true);

	MechanicWheelTD[6] = TextDrawCreate(551.299682, 363.687500, "LD_BEAT:CIRCLE");
	TextDrawLetterSize(MechanicWheelTD[6], 0.000000, 0.000000);
	TextDrawTextSize(MechanicWheelTD[6], 24.000000, 15.000000);
	TextDrawAlignment(MechanicWheelTD[6], 1);
	TextDrawColor(MechanicWheelTD[6], -1);
	TextDrawSetShadow(MechanicWheelTD[6], 0);
	TextDrawSetOutline(MechanicWheelTD[6], 0);
	TextDrawBackgroundColor(MechanicWheelTD[6], 255);
	TextDrawFont(MechanicWheelTD[6], 4);
	TextDrawSetProportional(MechanicWheelTD[6], 0);
	TextDrawSetShadow(MechanicWheelTD[6], 0);
	TextDrawSetSelectable(MechanicWheelTD[6], true);

	MechanicWheelTD[7] = TextDrawCreate(522.799682, 362.812500, "LD_BEAT:CIRCLE");
	TextDrawLetterSize(MechanicWheelTD[7], 0.000000, 0.000000);
	TextDrawTextSize(MechanicWheelTD[7], 24.000000, 15.000000);
	TextDrawAlignment(MechanicWheelTD[7], 1);
	TextDrawColor(MechanicWheelTD[7], -1);
	TextDrawSetShadow(MechanicWheelTD[7], 0);
	TextDrawSetOutline(MechanicWheelTD[7], 0);
	TextDrawBackgroundColor(MechanicWheelTD[7], 255);
	TextDrawFont(MechanicWheelTD[7], 4);
	TextDrawSetProportional(MechanicWheelTD[7], 0);
	TextDrawSetShadow(MechanicWheelTD[7], 0);
	TextDrawSetSelectable(MechanicWheelTD[7], true);

	MechanicWheelTD[8] = TextDrawCreate(503.299682, 350.562500, "LD_BEAT:CIRCLE");
	TextDrawLetterSize(MechanicWheelTD[8], 0.000000, 0.000000);
	TextDrawTextSize(MechanicWheelTD[8], 22.000000, 14.000000);
	TextDrawAlignment(MechanicWheelTD[8], 1);
	TextDrawColor(MechanicWheelTD[8], -1);
	TextDrawSetShadow(MechanicWheelTD[8], 0);
	TextDrawSetOutline(MechanicWheelTD[8], 0);
	TextDrawBackgroundColor(MechanicWheelTD[8], 255);
	TextDrawFont(MechanicWheelTD[8], 4);
	TextDrawSetProportional(MechanicWheelTD[8], 0);
	TextDrawSetShadow(MechanicWheelTD[8], 0);
	TextDrawSetSelectable(MechanicWheelTD[8], true);

	MechanicWheelTD[9] = TextDrawCreate(501.799682, 330.437500, "LD_BEAT:CIRCLE");
	TextDrawLetterSize(MechanicWheelTD[9], 0.000000, 0.000000);
	TextDrawTextSize(MechanicWheelTD[9], 22.000000, 14.000000);
	TextDrawAlignment(MechanicWheelTD[9], 1);
	TextDrawColor(MechanicWheelTD[9], -1);
	TextDrawSetShadow(MechanicWheelTD[9], 0);
	TextDrawSetOutline(MechanicWheelTD[9], 0);
	TextDrawBackgroundColor(MechanicWheelTD[9], 255);
	TextDrawFont(MechanicWheelTD[9], 4);
	TextDrawSetProportional(MechanicWheelTD[9], 0);
	TextDrawSetShadow(MechanicWheelTD[9], 0);
	TextDrawSetSelectable(MechanicWheelTD[9], true);

	MechanicLightTD[0] = TextDrawCreate(513.500000, 298.062500, "LD_SPAC:white");
	TextDrawLetterSize(MechanicLightTD[0], 0.000000, 0.000000);
	TextDrawTextSize(MechanicLightTD[0], 129.000000, 117.000000);
	TextDrawAlignment(MechanicLightTD[0], 1);
	TextDrawColor(MechanicLightTD[0], 168430230);
	TextDrawSetShadow(MechanicLightTD[0], 0);
	TextDrawSetOutline(MechanicLightTD[0], 0);
	TextDrawBackgroundColor(MechanicLightTD[0], 255);
	TextDrawFont(MechanicLightTD[0], 4);
	TextDrawSetProportional(MechanicLightTD[0], 0);
	TextDrawSetShadow(MechanicLightTD[0], 0);

	MechanicLightTD[1] = TextDrawCreate(511.000000, 312.500000, "");
	TextDrawLetterSize(MechanicLightTD[1], 0.000000, 0.000000);
	TextDrawTextSize(MechanicLightTD[1], 70.000000, 53.000000);
	TextDrawAlignment(MechanicLightTD[1], 1);
	TextDrawColor(MechanicLightTD[1], -1);
	TextDrawSetShadow(MechanicLightTD[1], 0);
	TextDrawSetOutline(MechanicLightTD[1], 0);
	TextDrawBackgroundColor(MechanicLightTD[1], 0);
	TextDrawFont(MechanicLightTD[1], 5);
	TextDrawSetProportional(MechanicLightTD[1], 0);
	TextDrawSetShadow(MechanicLightTD[1], 0);
	TextDrawSetPreviewModel(MechanicLightTD[1], 18646);
	TextDrawSetPreviewRot(MechanicLightTD[1], 330.000000, 0.000000, 0.000000, 1.000000);

	MechanicLightTD[2] = TextDrawCreate(569.500000, 312.500000, "");
	TextDrawLetterSize(MechanicLightTD[2], 0.000000, 0.000000);
	TextDrawTextSize(MechanicLightTD[2], 70.000000, 53.000000);
	TextDrawAlignment(MechanicLightTD[2], 1);
	TextDrawColor(MechanicLightTD[2], -1);
	TextDrawSetShadow(MechanicLightTD[2], 0);
	TextDrawSetOutline(MechanicLightTD[2], 0);
	TextDrawBackgroundColor(MechanicLightTD[2], 0);
	TextDrawFont(MechanicLightTD[2], 5);
	TextDrawSetProportional(MechanicLightTD[2], 0);
	TextDrawSetShadow(MechanicLightTD[2], 0);
	TextDrawSetPreviewModel(MechanicLightTD[2], 18646);
	TextDrawSetPreviewRot(MechanicLightTD[2], 330.000000, 0.000000, 0.000000, 1.000000);

	MechanicLightTD[3] = TextDrawCreate(547.000000, 349.687500, "LD_SPAC:white");
	TextDrawLetterSize(MechanicLightTD[3], 0.000000, 0.000000);
	TextDrawTextSize(MechanicLightTD[3], 58.000000, 1.000000);
	TextDrawAlignment(MechanicLightTD[3], 1);
	TextDrawColor(MechanicLightTD[3], -1273094401);
	TextDrawSetShadow(MechanicLightTD[3], 0);
	TextDrawSetOutline(MechanicLightTD[3], 0);
	TextDrawBackgroundColor(MechanicLightTD[3], 255);
	TextDrawFont(MechanicLightTD[3], 4);
	TextDrawSetProportional(MechanicLightTD[3], 0);
	TextDrawSetShadow(MechanicLightTD[3], 0);

	MechanicLightTD[4] = TextDrawCreate(557.000000, 345.312500, "LD_SPAC:white");
	TextDrawLetterSize(MechanicLightTD[4], 0.000000, 0.000000);
	TextDrawTextSize(MechanicLightTD[4], 37.000000, 1.000000);
	TextDrawAlignment(MechanicLightTD[4], 1);
	TextDrawColor(MechanicLightTD[4], -1);
	TextDrawSetShadow(MechanicLightTD[4], 0);
	TextDrawSetOutline(MechanicLightTD[4], 0);
	TextDrawBackgroundColor(MechanicLightTD[4], 255);
	TextDrawFont(MechanicLightTD[4], 4);
	TextDrawSetProportional(MechanicLightTD[4], 0);
	TextDrawSetShadow(MechanicLightTD[4], 0);

	MechanicLightTD[5] = TextDrawCreate(568.000000, 326.937500, "LD_SPAC:white");
	TextDrawLetterSize(MechanicLightTD[5], 0.000000, 0.000000);
	TextDrawTextSize(MechanicLightTD[5], 13.000000, 44.000000);
	TextDrawAlignment(MechanicLightTD[5], 1);
	TextDrawColor(MechanicLightTD[5], 168430335);
	TextDrawSetShadow(MechanicLightTD[5], 0);
	TextDrawSetOutline(MechanicLightTD[5], 0);
	TextDrawBackgroundColor(MechanicLightTD[5], 255);
	TextDrawFont(MechanicLightTD[5], 4);
	TextDrawSetProportional(MechanicLightTD[5], 0);
	TextDrawSetShadow(MechanicLightTD[5], 0);
	TextDrawSetSelectable(MechanicLightTD[5], true);

	MechanicLightTD[6] = TextDrawCreate(530.000000, 301.562500, "IZOLEAZA_FIRELE");
	TextDrawLetterSize(MechanicLightTD[6], 0.294499, 0.799375);
	TextDrawAlignment(MechanicLightTD[6], 1);
	TextDrawColor(MechanicLightTD[6], -1);
	TextDrawSetShadow(MechanicLightTD[6], 0);
	TextDrawSetOutline(MechanicLightTD[6], 0);
	TextDrawBackgroundColor(MechanicLightTD[6], 255);
	TextDrawFont(MechanicLightTD[6], 2);
	TextDrawSetProportional(MechanicLightTD[6], 1);
	TextDrawSetShadow(MechanicLightTD[6], 0);*/
	
	/*WaiterTD[0] = TextDrawCreate(468.500000, 97.687500, "LD_SPAC:white");
	TextDrawLetterSize(WaiterTD[0], 0.000000, 0.000000);
	TextDrawTextSize(WaiterTD[0], 173.000000, 235.000000);
	TextDrawAlignment(WaiterTD[0], 1);
	TextDrawColor(WaiterTD[0], 168430335);
	TextDrawSetShadow(WaiterTD[0], 0);
	TextDrawSetOutline(WaiterTD[0], 0);
	TextDrawBackgroundColor(WaiterTD[0], 255);
	TextDrawFont(WaiterTD[0], 4);
	TextDrawSetProportional(WaiterTD[0], 0);
	TextDrawSetShadow(WaiterTD[0], 0);

	WaiterTD[1] = TextDrawCreate(464.000000, 112.125000, "");
	TextDrawLetterSize(WaiterTD[1], 0.000000, 0.000000);
	TextDrawTextSize(WaiterTD[1], 90.000000, 80.000000);
	TextDrawAlignment(WaiterTD[1], 1);
	TextDrawColor(WaiterTD[1], -1);
	TextDrawSetShadow(WaiterTD[1], 0);
	TextDrawSetOutline(WaiterTD[1], 0);
	TextDrawBackgroundColor(WaiterTD[1], 0);
	TextDrawFont(WaiterTD[1], 5);
	TextDrawSetProportional(WaiterTD[1], 0);
	TextDrawSetShadow(WaiterTD[1], 0);
	TextDrawSetSelectable(WaiterTD[1], true);
	TextDrawSetPreviewModel(WaiterTD[1], 19580);
	TextDrawSetPreviewRot(WaiterTD[1], 90.000000, 180.000000, 0.000000, 1.000000);

	WaiterTD[2] = TextDrawCreate(467.000000, 178.187500, "");
	TextDrawLetterSize(WaiterTD[2], 0.000000, 0.000000);
	TextDrawTextSize(WaiterTD[2], 90.000000, 80.000000);
	TextDrawAlignment(WaiterTD[2], 1);
	TextDrawColor(WaiterTD[2], -1);
	TextDrawSetShadow(WaiterTD[2], 0);
	TextDrawSetOutline(WaiterTD[2], 0);
	TextDrawBackgroundColor(WaiterTD[2], 0);
	TextDrawFont(WaiterTD[2], 5);
	TextDrawSetProportional(WaiterTD[2], 0);
	TextDrawSetShadow(WaiterTD[2], 0);
	TextDrawSetSelectable(WaiterTD[2], true);
	TextDrawSetPreviewModel(WaiterTD[2], 2703);
	TextDrawSetPreviewRot(WaiterTD[2], 90.000000, 180.000000, 170.000000, 1.000000);

	WaiterTD[3] = TextDrawCreate(465.500000, 249.937500, "");
	TextDrawLetterSize(WaiterTD[3], 0.000000, 0.000000);
	TextDrawTextSize(WaiterTD[3], 90.000000, 80.000000);
	TextDrawAlignment(WaiterTD[3], 1);
	TextDrawColor(WaiterTD[3], -1);
	TextDrawSetShadow(WaiterTD[3], 0);
	TextDrawSetOutline(WaiterTD[3], 0);
	TextDrawBackgroundColor(WaiterTD[3], 0);
	TextDrawFont(WaiterTD[3], 5);
	TextDrawSetProportional(WaiterTD[3], 0);
	TextDrawSetShadow(WaiterTD[3], 0);
	TextDrawSetSelectable(WaiterTD[3], true);
	TextDrawSetPreviewModel(WaiterTD[3], 2769);
	TextDrawSetPreviewRot(WaiterTD[3], 90.000000, 180.000000, 0.000000, 1.000000);

	WaiterTD[4] = TextDrawCreate(555.000000, 147.125000, "Pizza");
	TextDrawLetterSize(WaiterTD[4], 0.400000, 1.600000);
	TextDrawAlignment(WaiterTD[4], 1);
	TextDrawColor(WaiterTD[4], -1);
	TextDrawSetShadow(WaiterTD[4], 0);
	TextDrawSetOutline(WaiterTD[4], 0);
	TextDrawBackgroundColor(WaiterTD[4], 255);
	TextDrawFont(WaiterTD[4], 2);
	TextDrawSetProportional(WaiterTD[4], 1);
	TextDrawSetShadow(WaiterTD[4], 0);

	WaiterTD[5] = TextDrawCreate(547.000000, 224.562500, "Hamburger");
	TextDrawLetterSize(WaiterTD[5], 0.281500, 1.171249);
	TextDrawAlignment(WaiterTD[5], 1);
	TextDrawColor(WaiterTD[5], -1);
	TextDrawSetShadow(WaiterTD[5], 0);
	TextDrawSetOutline(WaiterTD[5], 0);
	TextDrawBackgroundColor(WaiterTD[5], 255);
	TextDrawFont(WaiterTD[5], 2);
	TextDrawSetProportional(WaiterTD[5], 1);
	TextDrawSetShadow(WaiterTD[5], 0);

	WaiterTD[6] = TextDrawCreate(552.000000, 284.500000, "Burrito");
	TextDrawLetterSize(WaiterTD[6], 0.400000, 1.600000);
	TextDrawAlignment(WaiterTD[6], 1);
	TextDrawColor(WaiterTD[6], -1);
	TextDrawSetShadow(WaiterTD[6], 0);
	TextDrawSetOutline(WaiterTD[6], 0);
	TextDrawBackgroundColor(WaiterTD[6], 255);
	TextDrawFont(WaiterTD[6], 2);
	TextDrawSetProportional(WaiterTD[6], 1);
	TextDrawSetShadow(WaiterTD[6], 0);

	WaiterTD[7] = TextDrawCreate(468.500000, 97.687500, "LD_SPAC:white");
	TextDrawLetterSize(WaiterTD[7], 0.000000, 0.000000);
	TextDrawTextSize(WaiterTD[7], 185.000000, 24.000000);
	TextDrawAlignment(WaiterTD[7], 1);
	TextDrawColor(WaiterTD[7], 513154815);
	TextDrawSetShadow(WaiterTD[7], 0);
	TextDrawSetOutline(WaiterTD[7], 0);
	TextDrawBackgroundColor(WaiterTD[7], 255);
	TextDrawFont(WaiterTD[7], 4);
	TextDrawSetProportional(WaiterTD[7], 0);
	TextDrawSetShadow(WaiterTD[7], 0);*/

	return 1;
}
hook OnPlayerKStateChange(playerid, newkeys, oldkeys) {
    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
	    if(newkeys & KEY_SECONDARY_ATTACK) {
		   	if(JobWorking[playerid] == 2) {
		   		new Float:x,Float:y,Float:z;
				for(new i = 0; i < sizeof(FarmerTree); i++) {
					GetDynamicObjectPos(FarmerStairTree[i], x,y,z);
					if(IsPlayerInRangeOfPoint(playerid, 2.0, x,y,z)) {
						if(FarmerTreeTaken[playerid] == -1) return 1;
						if(FarmerTreeStatus[i] > 0) return Info(playerid, "Cay da duoc thu hoach");
						if(FarmerTreeApples[playerid] > 0) return Info(playerid, "Ban da lay mot hop tao!");
						foreach(new p: Character) { if(FarmerTreeTaken[p] == i) return Info(playerid, "Cay nay da duoc mot nguoi choi khac thu hoach."); }
						SetPlayerFacingAngle(playerid, 90.0), 
						SetPlayerPosEx(playerid, x,y,z), 
						FarmerTreeTaken[playerid] = i;
						RemovePlayerAttachedObject(playerid, ATTACHMENT_ID_BALE), 
						SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE), 
						ApplyAnimation(playerid, "BOMBER", "BOM_Plant_Loop", 4.0, 1, 0, 0, 0, 0), 
						TogglePlayerControllable(playerid, false);
						for(new t = 0; t < sizeof TreeTD; t++) TextDrawShowForPlayer(playerid, TreeTD[t]);
						SelectTextDraw(playerid, 0xFF0000FF), 
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Thu hoach tat ca nhung qua tao ben duoi."), 
						Info(playerid, "De thu hoach tao, nhap chuot vao no");
						return 1;
					}
				}
		   	}
		}
	}
   	return 1;
}
hook OnPlayerEnterCheckpoint(playerid) {
	if(CP[playerid] == 2018) {
		callcmd::stopwork(playerid, "");
		GiveJobSalary(playerid);
	}
	if(CP[playerid] == 35624098) {
		if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,COLOR_GREY, "Xin hay xuong xe.");

		DisablePlayerCheckpoint(playerid);
		CP[playerid] = 0;
		SetTimerEx("SkiningDeer", 6000, false, "%d", playerid);
		TogglePlayerControllable(playerid, 0);
		GameTextForPlayer(playerid, "DANG LOT DA", 5000, 3);
		LoopingAnim(playerid,"BOMBER","BOM_Plant",4.0,1,1,1,1,0);
		//SetPlayerAttachedObject(playerid, 5,19583, 8, 0.088000, 0.029000, 0.000000, -98.200057, 0.000000, 168.599838, 1.000000, 1.000000, 1.000000);
    }
	return 1;
}
hook OnPlayerConnect(playerid) {
	FarmerTreeTaken[playerid] = -1;
	return 1;
}
hook OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ) {
	if(weaponid == 33)
    {
        if(hitid == DeerObj[playerid]) 
        { 
            new Float:X,Float:Y,Float:Z, Float:RotX, Float:RotY, Float:RotZ;
            GetPlayerObjectPos(playerid, DeerObj[playerid], X,Y,Z);
            GetPlayerObjectRot(playerid, DeerObj[playerid], RotX, RotY, RotZ);
            if(GetPlayerDistanceFromPoint(playerid, X,Y,Z) < 25) {
                SendClientMessage(playerid, COLOR_GOLD, "JOBS: {FFFFFF}Khoang cach qua gan nen nai da so hai va bo chay.");
                DestroyPlayerObject(playerid, DeerObj[playerid]);
                CP[playerid] = 0;
                DisablePlayerCheckpoint(playerid);
                SpawnDeer(playerid);
                return 1;
            } 
            va_SendClientMessage(playerid, COLOR_GOLD, "JOBS: {FFFFFF}Thanh cong! Ban da giet con nai tu khoang cach %0.1fm. Hay di lai va lot da no.",GetPlayerDistanceFromPoint(playerid, X, Y, Z));
            CP[playerid] = 35624098;
            SetPlayerObjectRot(playerid, DeerObj[playerid], RotX+90, RotY, RotZ);
            SetPlayerObjectPos(playerid, DeerObj[playerid], X, Y, Z-0.35);
        }
    }
    return 1;
}
function SpawnDeer(playerid) {
    new Float:X,Float:Y,Float:Z;
    new ran = random(5);
    switch(ran) {
        case 0: {
            if(IsPlayerInRangeOfPoint(playerid, 50, -1825.12744, -2637.87476, 55.03204)) return SpawnDeer(playerid);
            DeerObj[playerid] = CreatePlayerObject(playerid, 19315, -1825.12744, -2637.87476, 55.03204,   0.00000, 0.00000, 0.00000);
        }
        case 1: {
            if(IsPlayerInRangeOfPoint(playerid, 50, -1253.54834, -2836.04907, 62.01681)) return SpawnDeer(playerid);
            DeerObj[playerid] = CreatePlayerObject(playerid, 19315, -1253.54834, -2836.04907, 62.01681,   0.00000, 0.00000, 0.00000);
        }
        case 2: {
            if(IsPlayerInRangeOfPoint(playerid, 50, -1885.82239, -1931.40491, 81.77904)) return SpawnDeer(playerid);
            DeerObj[playerid] = CreatePlayerObject(playerid, 19315, -1885.82239, -1931.40491, 81.77904,   0.00000, 0.00000, 0.00000);
        }
        case 3: {
            if(IsPlayerInRangeOfPoint(playerid, 50, -2247.88281, -2276.83960, 29.48906)) return SpawnDeer(playerid);
            DeerObj[playerid] = CreatePlayerObject(playerid, 19315, -2247.88281, -2276.83960, 29.48906,   0.00000, 0.00000, 0.00000);
        }
        case 4: {
            if(IsPlayerInRangeOfPoint(playerid, 50, -2381.48608, -2632.85107, 61.31076)) return SpawnDeer(playerid);
            DeerObj[playerid] = CreatePlayerObject(playerid, 19315, -2381.48608, -2632.85107, 61.31076,   0.00000, 0.00000, 0.00000);
        }
        case 5: {
            if(IsPlayerInRangeOfPoint(playerid, 50, -1068.61182, -1971.86951, 57.84511)) return SpawnDeer(playerid);
            DeerObj[playerid] = CreatePlayerObject(playerid, 19315, -1068.61182, -1971.86951, 57.84511,   0.00000, 0.00000, 0.00000);
        }
    }
    GetPlayerObjectPos(playerid, DeerObj[playerid], X,Y,Z);
    va_SendClientMessage(playerid, COLOR_GOLD, "INFO: {FFFFFF}Hay Di Den Vi Tri Duoc Danh Dau Tren Ban Do. Khoang Cach: %0.1fm.",GetPlayerDistanceFromPoint(playerid, X,Y,Z));
    SendClientMessage(playerid, COLOR_GOLD, "INFO: {FFFFFF}De Nhan Duoc Tien Ban Phai Ban Con Nai Voi Khoang Cach it nhat 25m neu khong no se phat hien va bo chay.");
    SetPlayerCheckpointEx(playerid, X,Y-0.4,Z, 2);
    return 1;
}
function SkiningDeer(playerid) {
    new money = 10000 + random(5000);
    GivePlayerCash(playerid, money);
   	va_SendClientMessage(playerid, COLOR_GOLD, "INFO: {FFFFFF}Ban nhan duoc: $%d, vi da san thanh cong 1 con nai.", money);
   	//UpdateJobGoal(money, MAXGOAL);
    DestroyPlayerObject(playerid, DeerObj[playerid]);
    RemovePlayerAttachedObject(playerid, 8);
    TogglePlayerControllable(playerid, 1);
    SpawnDeer(playerid);
}
CMD:startwork(playerid, params[]) {
	new Float: Pos[3], Float: CarAngle, string[256];
	new hour,minn,sec;
	gettime(hour,minn,sec);
	#pragma unused sec
	#pragma unused minn
	//if(ServerSystem[19] == 0 && hour > -1 && hour < 6 && (!CAC_GetStatus(playerid) && GetPVarInt(playerid, "NotAndroid") == 1)) return SendClientMessage(playerid, -1, "Ban can cai dat Anti-Cheat (sampcac) de lam viec trong khoang thoi gian tu 24h-6h sang. Hay xem huong dan cai dat tren trang chu.");  
	if(PlayerInfo[playerid][pJob] == 0) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co mot cong viec, su dung /timvieclam de tim viec!");
	if(JobWorking[playerid] == 1) return SendClientMessage(playerid, COLOR_WHITE, "Ban dang lam viec.");
    GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
    if(targetfind[playerid] != -1) return Dialog_Show(playerid, DIALOG_CHECKPOINT, DIALOG_STYLE_MSGBOX, "Checkpoint", "Mot cham do dang hoat dong.\nBan co muon xoa no khong? Neu muon, hay chon 'Ok'.", "Ok", "Exit");
	if(GetPlayerVirtualWorld(playerid) != 0) return 1;
	if(Iter_Contains(HelpersDuty, playerid)) return SendClientMessage(playerid, COLOR_WHITE, "Ban dang lam viec nhu mot helper.");
	if(JobDeelay[playerid][PlayerInfo[playerid][pJob]] != 0) return JobTimeDeelay(playerid);
	switch(PlayerInfo[playerid][pJob]) {
		case 1: {
			if(IsPlayerInRangeOfPoint(playerid, 7.0, -372.6979, -1456.3641, 26.4046)) {
				if(PlayerInfo[playerid][pCarLic] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong co giay phep lai xe de nhan cong viec nay!");
				if(Inventory_Count(playerid, "Burger", 1) >= 60) return SendClientMessage(playerid, COLOR_RED,"Ban da co 60 cai burger nen khong the lam viec them, vui long su dung bot.");
				JobSeconds[playerid] = 80;
				CarAngle = -184.0199;
				DisablePlayerCheckpointEx(playerid);
				CP[playerid] = 53;
				if(PlayerInfo[playerid][pShowJob] == 0) GameTextForPlayer(playerid, "Vui long ~r~ (/hud -> Thong tin cong viec).", 7000, 3);
				SetPlayerCheckpointEx(playerid, -258.4948,-1376.7416,11.2800, 100.0);
				SendClientMessage(playerid, COLOR_GAMEGTA, "Den diem do va chat cac cay lua trong do");

			}
			else {
 				if(CP[playerid] != 0) return Dialog_Show(playerid, DIALOG_CHECKPOINT, DIALOG_STYLE_MSGBOX, "Checkpoint", "Mot cham do dang hoat dong.\nBan co muon xoa no khong? Neu muon, hay chon 'Ok'.", "Ok", "Exit");
			  	CP[playerid] = 53;
				SendClientMessage(playerid, COLOR_GREY, "Ban khong o noi ban co the bat dau lam viec. Hay den cham do tren ban do bat dau cong viec!");
				SetPlayerCheckpointEx(playerid, -372.6979, -1456.3641, 26.4046, 7.0);
				return 1;
			}			
		}
		case 2: {
			if(IsPlayerInRangeOfPoint(playerid, 7.0, -1017.3097,-638.8459,32.0078)) {
				if(PlayerInfo[playerid][pCarLic] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong co giay phep lai xe de nhan cong viec nay!");
				CarAngle = 74.1729;
				DisablePlayerCheckpointEx(playerid);
				new szDialog2[1024];				
				strcat(szDialog2, "Danh muc\tLoai\tKy nang\n");
				strcat(szDialog2, "Quan ao\t{35DE1F}Hop phap\t1+\n");
				strcat(szDialog2, "Thuc pham\t{35DE1F}Hop phap\t1+\n");
				strcat(szDialog2, "Do noi that\t{35DE1F}Hop phap\t1+\n");
				strcat(szDialog2, "Chat no\t{35DE1F}Hop phap\t2+\n");
				strcat(szDialog2, "Sung\t{F21313}Bat hop phap\t3+\n");
				strcat(szDialog2, "Xe bi trom\t{F21313}Bat hop phap\t3+\n");
				Dialog_Show(playerid, DIALOG_TRUCKER, DIALOG_STYLE_TABLIST_HEADERS, "Chon diem den", szDialog2, "Select", "Cancel");			
			}
			else {
 				if(CP[playerid] != 0) return Dialog_Show(playerid, DIALOG_CHECKPOINT, DIALOG_STYLE_MSGBOX, "Checkpoint", "Mot cham do dang hoat dong.\nBan co muon xoa no khong? Neu muon, hay chon 'Ok'.", "Ok", "Exit");
			  	CP[playerid] = 53;
				SendClientMessage(playerid, COLOR_GREY, "Ban khong o noi ban co the bat dau lam viec. Hay den cham do tren ban do bat dau cong viec!");
				SetPlayerCheckpointEx(playerid, -1017.3097,-638.8459,32.0078, 7.0);
				return 1;
			}
		}
		case 3: {
			if(IsPlayerInRangeOfPoint(playerid, 7.0, -1966.2852,-2442.2708,30.6250)) {
				if(PlayerInfo[playerid][pCarLic] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong co giay phep lai xe de nhan cong viec nay!");
				format(string, sizeof(string), "Den mot cay o gan do va bam ~b~~h~LALT~w~~h~ de chat go.");
				PlayerTextDrawSetString(playerid, InfosTD, string);
				defer HideTextdraw(playerid);
				PlayerTextDrawShow(playerid, InfosTD);	
				CarAngle = 222.7997;
			}
			else {
 				if(CP[playerid] != 0) return Dialog_Show(playerid, DIALOG_CHECKPOINT, DIALOG_STYLE_MSGBOX, "Checkpoint", "Mot cham do dang hoat dong.\nBan co muon xoa no khong? Neu muon, hay chon 'Ok'.", "Ok", "Exit");
			  	CP[playerid] = 53;
				SendClientMessage(playerid, COLOR_GREY, "Ban khong o noi ban co the bat dau lam viec. Hay den cham do tren ban do bat dau cong viec!");
				SetPlayerCheckpointEx(playerid, -1966.2852,-2442.2708,30.6250, 7.0);
				return 1;
			}		
		}
		case 4: {
			if(GetPlayerSkill(playerid) == 1) PlayerTextDrawSetString(playerid, InfosTD, "~y~Car Jacker~w~~h~~n~An cap mot xe cong cong!");
			else if(GetPlayerSkill(playerid) == 2) PlayerTextDrawSetString(playerid, InfosTD, "~y~Car Jacker~w~~h~~n~An cap mot xe ca nhan khong khoa!");
			else if(GetPlayerSkill(playerid) == 3) PlayerTextDrawSetString(playerid, InfosTD, "~y~Car Jacker~w~~h~~n~An cap mot xe trong to chuc mafia!");
			else if(GetPlayerSkill(playerid) == 4) PlayerTextDrawSetString(playerid, InfosTD, "~y~Car Jacker~w~~h~~n~An cap mot xe ca nhan bi khoa!");
			else if(GetPlayerSkill(playerid) == 5) PlayerTextDrawSetString(playerid, InfosTD, "~y~Car Jacker~w~~h~~n~An cap mot xe thuoc tru so canh sat!");
			PlayerTextDrawShow(playerid, InfosTD);
			JobWorking[playerid] = 1;
			defer HideTextdraw(playerid);
			return 1;
		}
		case 5: {
			if(PlayerInfo[playerid][pWantedLevel] != 0) return SendClientMessage(playerid, -1, "Ban dang bi truy na nen khong the lam viec!");
			if(!IsPlayerInRangeOfPoint(playerid, 10.0, 2770.2822,-1610.9043,11.0418)) {				
				SendClientMessage(playerid, COLOR_GREY, "Ban khong o noi ban co the bat dau lam viec. Hay den cham do tren ban do bat dau cong viec!");
				SetPlayerCheckpointEx(playerid, 2770.2822,-1610.9043,11.0418, 10.0);
				CP[playerid] = 53;
				return 1;
			}
			if(PlayerInfo[playerid][pCarLic] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong co giay phep lai xe de nhan cong viec nay!");
			CP[playerid] = 156;
			new rand = random(3);			
			switch(rand) {
				case 0: SetPlayerCheckpointEx(playerid, 2790.6213,-2523.6418,13.6704, 5.0);
				case 1: SetPlayerCheckpointEx(playerid, 2529.4214,-2009.4240,13.5798, 5.0);
				case 2: SetPlayerCheckpointEx(playerid, 2180.0774,-2317.1672,13.5703, 5.0); 
				case 3: SetPlayerCheckpointEx(playerid, 681.2267,-442.6591,16.3633, 5.0);
				case 4: SetPlayerCheckpointEx(playerid, 1835.9659,-1857.6173,13.4799, 5.0);
				case 5: SetPlayerCheckpointEx(playerid, 2449.9495,-1977.0129,13.6434, 5.0);
				case 6: SetPlayerCheckpointEx(playerid, 1770.2073,-2040.5172,13.6212, 5.0);
			}
			Iter_Add(IsSpeed, playerid);
			SetPVarInt(playerid, "JobCheck", 5);
			format(string, sizeof(string), "Den diem checkpoint tren ban do de lay vat lieu!");
			PlayerTextDrawSetString(playerid, InfosTD, string);
			defer HideTextdraw(playerid);
			PlayerTextDrawShow(playerid, InfosTD);
			CarAngle = 277.2561;
			CurseFacute[playerid] = 0;
			MoneyEarned[playerid] = 0;		
		}
		case 6: return 1;
		case 7: { // Nguoi lam vuon
			if(!IsPlayerInRangeOfPoint(playerid, 5.0, -1080.3639,-1195.3372,129.6956)) {
				SendClientMessage(playerid, COLOR_GREY, "Ban khong o noi ban co the bat dau lam viec. Hay den cham do tren ban do bat dau cong viec!");
				SetPlayerCheckpointEx(playerid, -1080.3639,-1195.3372,129.6956, 6.0);
				CP[playerid] = 53;
				return 1;
			}
			FarmerTreeApples[playerid] = 0, 
			FarmerTreeTaken[playerid] = 0, 
			FarmerTimer[playerid] = 120, Info(playerid, "Di vao vuon cay de thu hoach.");
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY), 
			SetPlayerAttachedObject(playerid, ATTACHMENT_ID_BALE,19639,1,-0.00,0.50,-0.03,0.0,86.0,83.0,1.00,1.00,1.00);
			JobWorking[playerid] = 2;
			// jobdeally[playerid] = 60; // -> job delay
			return 1;
		}
		case 8: return 1;
		case 9: {
			if(IsPlayerInRangeOfPoint(playerid, 7.0, Pizza[0], Pizza[1], Pizza[2])) {
				if(PlayerInfo[playerid][pCarLic] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong co giay phep lai xe de nhan cong viec nay!");
				CarAngle = 0;
				CP[playerid] = 155;
				new j = RandomEx(1, Iter_Count(House) + 1);

				while(GetCity1(HouseInfo[j][hEntrancex],HouseInfo[j][hEntrancey]) != 3 
					|| j == JobCP[playerid] 
					|| GetPlayerDistanceFromPoint(playerid, HouseInfo[j][hEntrancex], HouseInfo[j][hEntrancey], HouseInfo[j][hEntrancez]) < 200.0)
				{
					j = RandomEx(1, Iter_Count(House) + 1);
				}
				Iter_Add(IsSpeed, playerid);
				SetPVarInt(playerid, "JobCheck", 9);
				JobCP[playerid] = j;
				SetPlayerCheckpointEx(playerid, HouseInfo[j][hEntrancex],HouseInfo[j][hEntrancey],HouseInfo[j][hEntrancez], 7.0);
				format(string, sizeof(string), "Den diem ~r~~h~mau do~w~~h~ tren ban do de giao pizza.~n~Khoang cach: ~y~%0.1fm.", GetPlayerDistanceFromPoint(playerid, HouseInfo[j][hEntrancex],HouseInfo[j][hEntrancey],HouseInfo[j][hEntrancez]));
				PlayerTextDrawSetString(playerid, InfosTD, string);
				defer HideTextdraw(playerid);
				PlayerTextDrawShow(playerid, InfosTD);				
			}
			else {
 				if(CP[playerid] != 0) return Dialog_Show(playerid, DIALOG_CHECKPOINT, DIALOG_STYLE_MSGBOX, "Checkpoint", "Mot cham do dang hoat dong.\nBan co muon xoa no khong? Neu muon, hay chon 'Ok'.", "Ok", "Exit");
			  	CP[playerid] = 53;
				SendClientMessage(playerid, COLOR_GREY, "Ban khong o noi ban co the bat dau lam viec. Hay den cham do tren ban do bat dau cong viec!");
				SetPlayerCheckpointEx(playerid,Pizza[0], Pizza[1], Pizza[2], 8.0);
				return 1;
			}
		}	
		case 10: {
			if(!IsPlayerInRangeOfPoint(playerid, 6.0, CPNWork[1][0], CPNWork[1][1], CPNWork[1][2])) {
				SendClientMessage(playerid, COLOR_GREY, "Ban khong o noi ban co the bat dau lam viec. Hay den cham do tren ban do bat dau cong viec!");
				SetPlayerCheckpointEx(playerid, CPNWork[1][0], CPNWork[1][1], CPNWork[1][2], 6.0);
				CP[playerid] = 53;
				return 1;
			}
			if(PlayerInfo[playerid][pCarLic] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong co giay phep lai xe de nhan cong viec nay!");
			CarAngle = 0.7028;
			CP[playerid] = 57;
			
			new rand = random(3);
			if(rand == 1) SetPlayerCheckpointEx(playerid, 2843.3335,956.2863,10.7500, 5.0);
			else if(rand == 2) SetPlayerCheckpointEx(playerid, 2843.0227,972.9081,10.7500, 5.0);
			else if(rand == 3) SetPlayerCheckpointEx(playerid, 2841.9026,997.2687,10.7500, 5.0);
			else SetPlayerCheckpointEx(playerid, 2843.3335,956.2863,10.7500, 5.0);
			
			PlayerTextDrawSetString(playerid, InfosTD, "Di den diem mau ~r~do~w~~h~ de giao buu kien!");
			defer HideTextdraw(playerid);
			PlayerTextDrawShow(playerid, InfosTD);	
		}		
		case 11: {
			return 1;
			// if(!IsPlayerInRangeOfPoint(playerid, 8.0, 842.0929,-2131.5725,1.9931)) {
			// 	SendClientMessage(playerid, COLOR_GREY, "Ban khong o noi ma ban co the bat dau cong viec. Di den checkpoint tren ban do!");
			// 	SetPlayerCheckpointEx(playerid, 842.0929,-2131.5725,1.9931, 6.0);
			// 	CP[playerid] = 53;
			// 	return 1;
			// }		
			// // if(PlayerInfo[playerid][pBoatLic] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Ban khong co mot giay phep thuyen de lam cong viec nay!");
			// // if(Undita[playerid] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Ban khong co can cau!");
			// // if(Momeala[playerid] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Ban khong co moi cau!");
			// format(string, sizeof(string), "De cau ca, hay su dung lenh ~y~/cauca~w~~h~ khi o gan thuyen!~n~Neu ban muon dung cong viec, su dung ~y~/stopwork~w~~h~~n~nBan co the cau %d kg ca bay gio",15*GetPlayerSkill(playerid));
			// PlayerTextDrawSetString(playerid, InfosTD, string);	
			// SetTimerEx("HideTextdraw", 8000, 0, "%d", playerid);
			// PlayerTextDrawShow(playerid, InfosTD);				
		}
		case 12: {
			if(!IsPlayerInRangeOfPoint(playerid, 20.0, JobInfo[12][jPosX],JobInfo[12][jPosY],JobInfo[12][jPosZ])) {
				SendClientMessage(playerid, COLOR_GREY, "Ban khong o noi ban co the bat dau lam viec. Hay den cham do tren ban do bat dau cong viec!");
				SetPlayerCheckpointEx(playerid, JobInfo[12][jPosX],JobInfo[12][jPosY],JobInfo[12][jPosZ], 20.0);
				CP[playerid] = 53;
				return 1;
			}
			if(PlayerInfo[playerid][pFlyLic] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong co giay phep su dung may bay de lam cong viec nay!");
			if(PlayerInfo[playerid][pWantedLevel] != 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban dang bi truy na nen khong the lam viec!");			
			CP[playerid] = 159;
			SetPlayerRaceCheckpointEx(playerid, 3, 1897.3568,-2493.9583,14.4609,1337.7225,-2458.1738,52.1955, 5.0);
			CarAngle = 90.6909;
			CurseFacute[playerid] = 0;
			MoneyEarned[playerid] = 0;		
		}
		case 13: {
			if(!IsPlayerInRangeOfPoint(playerid, 5.0, 971.3381,2128.1516,10.8203)) {
				SendClientMessage(playerid, COLOR_GREY, "Ban khong o noi ban co the bat dau lam viec. Hay den cham do tren ban do bat dau cong viec!");
				SetPlayerCheckpointEx(playerid, 971.3381,2128.1516,10.8203, 5.0);
				CP[playerid] = 53;
				return 1;
			}	
			if(PlayerInfo[playerid][pCarLic] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong co giay phep lai xe de nhan cong viec nay!");
			PlayerTextDrawSetString(playerid, InfosTD, "Den ~r~~h~checkpoint~w~~h~ tren ban do de lay hang hoa!");
			defer HideTextdraw(playerid);
			PlayerTextDrawShow(playerid, InfosTD);			
			new rand = random(2);
			DisablePlayerCheckpointEx(playerid);
			switch(rand) {
				case 0: {
					playerObject[playerid] = CreatePlayerObject(playerid, 1271, 928.5678,2069.6194,10.8203,   0.00000, 0.00000, 45.00000);
					SetPlayerCheckpointEx(playerid, 928.5678,2069.6194,10.8203, 2.0);			
				}
				case 1: {
					playerObject[playerid] = CreatePlayerObject(playerid, 1271, 1054.8168,2134.0264,10.8203,   0.00000, 0.00000, 45.00000);
					SetPlayerCheckpointEx(playerid, 1054.8168,2134.0264,10.8203, 2.0);
				}
				case 2: {
					playerObject[playerid] = CreatePlayerObject(playerid, 1271, 928.5678,2069.6194,10.8203,   0.00000, 0.00000, 45.00000);	
					SetPlayerCheckpointEx(playerid, 928.5678,2069.6194,10.8203, 2.0);
				}
			}
			CP[playerid] = 170;
			UpdateJobStats(playerid);
		}
		case 14: {
			if(!IsPlayerInRangeOfPoint(playerid, 6.0, 1477.4081,-1741.8422,13.54690)) {
				SendClientMessage(playerid, COLOR_GREY, "Ban khong o noi ban co the bat dau lam viec. Hay den cham do tren ban do bat dau cong viec!");
				SetPlayerCheckpointEx(playerid, 1477.4081,-1741.8422,13.5469, 6.0);
				CP[playerid] = 53;
				return 1;
			}
			new randcp = RandomEx(1, Iter_Count(House) + 1);
			while(GetCity1(HouseInfo[randcp][hEntrancex],HouseInfo[randcp][hEntrancey]) != 3 || JobCP[playerid] == randcp) {
				randcp = RandomEx(1, Iter_Count(House) + 1);
			}
			JobCP[playerid] = randcp;
			SetPlayerCheckpointEx(playerid, HouseInfo[JobCP[playerid]][hEntrancex], HouseInfo[JobCP[playerid]][hEntrancey], HouseInfo[JobCP[playerid]][hEntrancez], 5.0);
			format(string, sizeof(string), "Di den diem mau ~r~~h~do~w~~h~ tren ban do de giao bao.~n~De lay bao, lai gan xe dap va bam Y~n~Khoang cach: ~y~%0.1fm.", GetPlayerDistanceFromPoint(playerid, HouseInfo[JobCP[playerid]][hEntrancex], HouseInfo[JobCP[playerid]][hEntrancey], HouseInfo[JobCP[playerid]][hEntrancez]));
			PlayerTextDrawSetString(playerid, InfosTD, string);
			defer HideTextdraw(playerid);
			PlayerTextDrawShow(playerid, InfosTD);
			SetPVarInt(playerid, "PaperHand", 0);
			CP[playerid] = 112;
		}
		case 15: return 1;
		case 16:
		{
            if(PlayerToPoint(7.0, playerid, -1649.4355,-2246.1865,31.0780)) {
                if(PlayerInfo[playerid][pCarLic] == 0 && PlayerInfo[playerid][pGunLic] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "Eroare: Ban Khong Co Giay Phep Sung Va Giay Phep Lai Xe.");
                SpawnDeer(playerid);
                GivePlayerWeapon(playerid, 33, 500);
                InDeer[playerid] = 1;
            }
            else {
                if(CP[playerid] != 0) return Dialog_Show(playerid, DIALOG_CHECKPOINT, DIALOG_STYLE_MSGBOX, "Checkpoint", "Mot cham do dang hoat dong.\nBan co muon xoa no khong? Neu muon, hay chon 'Ok'.", "Ok", "Exit");
                CP[playerid] = 53;
                SendClientMessage(playerid, COLOR_GREY, "Ban khong o khu vuc lam viec! Hay den cham do tren ban do de bat dau cong viec.");
                SetPlayerCheckpointEx(playerid, -1649.4355,-2246.1865,31.0780, 4.0);
                return 1;
            }
        }
	}
	SetPVarInt(playerid, "Pressed", 0);
	SetPVarInt(playerid, "Trees", 0);
	SetPVarInt(playerid, "JobStep", 0);				
	SetPVarInt(playerid, "InHand", 0);			
	
    MoneyEarned[playerid] = 0;
	CurseFacute[playerid] = 0;
	if(PlayerInfo[playerid][pShowJob] == 0 && PlayerInfo[playerid][pJob] != 5 && PlayerInfo[playerid][pLevel] < 5) SendClientMessage(playerid, COLOR_YELLOW, "Ban muon xem thong tin cong viec cua ban, ban co the lam dieu do bang cach su dung (/hud -> Thong tin cong viec).");
	new skill = GetPlayerSkill(playerid);
	if(JobVehicle[playerid] != 0) DestroyVehicle(JobVehicle[playerid]);
	/*if(PlayerInfo[playerid][pJob] == 16) {
		// Nguoi lam vuon
		return 1;
	}*/
	else if(PlayerInfo[playerid][pJob] == 11) {
		new rand = 1 + random(5);		
		if(rand == 1) { Pos[0] = 877.5832; Pos[1] = -2126.4685; Pos[2] = 0.3231; CarAngle = -89.2800; }
		if(rand == 2) { Pos[0] = 877.3463; Pos[1] = -2113.4219; Pos[2] = 0.3231; CarAngle = -89.2800; }
		if(rand == 3) { Pos[0] = 796.3821; Pos[1] = -2114.0200; Pos[2] = -0.0049; CarAngle = 89.7000; }
		if(rand == 4) { Pos[0] = 796.9351; Pos[1] = -2127.4446; Pos[2] = -0.0049; CarAngle = 89.7000; }
		if(rand == 5) { Pos[0] = 796.1244; Pos[1] = -2100.6455; Pos[2] = -0.0049; CarAngle = 89.7000; }
		if(rand == 6) { Pos[0] = 797.0450; Pos[1] = -2139.8650; Pos[2] = -0.0049; CarAngle = 89.7000; }
	}
	if(PlayerInfo[playerid][pJob] == 12) {
		if(skill == 1) JobVehicle[playerid] = CreateVehicleEx(JobInfo[PlayerInfo[playerid][pJob]][jSkill1Veh], 1982.5657,-2493.7964,14.4719, CarAngle, -1, -1, -1);
		else if(skill == 2) JobVehicle[playerid] = CreateVehicleEx(JobInfo[PlayerInfo[playerid][pJob]][jSkill2Veh], 1982.5657,-2493.7964,14.4719, CarAngle, -1, -1, -1);
		else if(skill == 3) JobVehicle[playerid] = CreateVehicleEx(JobInfo[PlayerInfo[playerid][pJob]][jSkill3Veh], 1982.5657,-2493.7964,14.4719, CarAngle, -1, -1, -1);
		else if(skill == 4) JobVehicle[playerid] = CreateVehicleEx(JobInfo[PlayerInfo[playerid][pJob]][jSkill4Veh], 1982.5657,-2493.7964,14.4719, CarAngle, -1, -1, -1);
		else if(skill == 5) JobVehicle[playerid] = CreateVehicleEx(JobInfo[PlayerInfo[playerid][pJob]][jSkill5Veh], 1982.5657,-2493.7964,14.4719, CarAngle, -1, -1, -1);	
	}
	else {
		if(PlayerInfo[playerid][pJob] == 3) {
			if(skill == 1) JobVehicle[playerid] = CreateVehicleEx(578, Pos[0], Pos[1], Pos[2], CarAngle, random(240), random(240), -1);
			else if(skill == 2) JobVehicle[playerid] = CreateVehicleEx(578, Pos[0], Pos[1], Pos[2], CarAngle, random(240), random(240), -1);
			else if(skill == 3) JobVehicle[playerid] = CreateVehicleEx(578, Pos[0], Pos[1], Pos[2], CarAngle, random(240), random(240), -1);
			else if(skill == 4) JobVehicle[playerid] = CreateVehicleEx(578, Pos[0], Pos[1], Pos[2], CarAngle, random(240), random(240), -1);
			else if(skill == 5) JobVehicle[playerid] = CreateVehicleEx(578, Pos[0], Pos[1], Pos[2], CarAngle, random(240), random(240), -1);		
		}
		else {
			if(skill == 1) JobVehicle[playerid] = CreateVehicleEx(JobInfo[PlayerInfo[playerid][pJob]][jSkill1Veh], Pos[0], Pos[1], Pos[2], CarAngle, -1, -1, -1);
			else if(skill == 2) JobVehicle[playerid] = CreateVehicleEx(JobInfo[PlayerInfo[playerid][pJob]][jSkill2Veh], Pos[0], Pos[1], Pos[2], CarAngle, -1, -1, -1);
			else if(skill == 3) JobVehicle[playerid] = CreateVehicleEx(JobInfo[PlayerInfo[playerid][pJob]][jSkill3Veh], Pos[0], Pos[1], Pos[2], CarAngle, -1, -1, -1);
			else if(skill == 4) JobVehicle[playerid] = CreateVehicleEx(JobInfo[PlayerInfo[playerid][pJob]][jSkill4Veh], Pos[0], Pos[1], Pos[2], CarAngle, -1, -1, -1);
			else if(skill == 5) JobVehicle[playerid] = CreateVehicleEx(JobInfo[PlayerInfo[playerid][pJob]][jSkill5Veh], Pos[0], Pos[1], Pos[2], CarAngle, -1, -1, -1);
		}	
	}
	if(PlayerInfo[playerid][pJob] == 16) {
		new rand = random(2) + 1;
		if(rand == 1) JobVehicle[playerid] = CreateVehicleEx(495, -1646.8311,-2212.6125,33.3878, 90, -1, -1, -1, 0);
		if(rand == 2) JobVehicle[playerid] = CreateVehicleEx(495, -1649.4355,-2246.1865,31.0780, 90, -1, -1, -1, 0);
	}
    PutPlayerInVehicleEx(playerid, JobVehicle[playerid], 0);
    JobWorking[playerid] = 1;
	if(PlayerInfo[playerid][pJob] != 2) UpdateJobStats(playerid);
    Gas[JobVehicle[playerid]] = 100;
	WorkingTime[playerid] = 0;
 	if(PlayerInfo[playerid][pJob] == 11) DisableRemoteVehicleCollisions(playerid, 1);
	SetPlayerVirtualWorld(playerid, 0);

	new engine,lights,alarm,doors,bonnet,boot,objective;
	vehEngine[JobVehicle[playerid]] = 1;
	GetVehicleParamsEx(JobVehicle[playerid],engine,lights,alarm,doors,bonnet,boot,objective);
	SetVehicleParamsEx(JobVehicle[playerid],VEHICLE_PARAMS_ON,lights,alarm,doors,bonnet,boot,objective);	
	return 1;
}
task JobTimer[60000]() {
	new gString[200];
	for(new i = 0; i < sizeof(FarmerTree); i++) {
		if(FarmerTreeStatus[i] > 0) {
			format(gString, sizeof(gString), "{B32020}Cay dang ra trai\n{FFFFFF}%s", CalculeazaTimp2(FarmerTreeStatus[i]));
			UpdateDynamic3DTextLabelText(FarmerTreeLabel[i], -1, gString);
			FarmerTreeStatus[i] -= 60;
		}
		else {
			UpdateDynamic3DTextLabelText(FarmerTreeLabel[i], -1, "{8DFF63}Thu hoach cay\n\n\n\n\n\n\n\n\n\n\n\n{FFFFFF}Bam phim {8DFF63}F {FFFFFF}hoac {8DFF63}Enter {FFFFFF}de thu hoach");
		}
	}
}

isJobDisabled(jobId) {
	for(new i = 0; i < sizeof(disabledJobIds); i++) {
		if(disabledJobIds[i] == jobId) return true;
	}
	return false;
}

// //jobid == 0, mean job will be randomly chosen
SetTodayJob(jobid = 0){
	if(jobid == 0) {
		new rand = disabledJobIds[random(sizeof(disabledJobIds))];

		while(isJobDisabled(rand)) {
			rand = TodayJobList[random(sizeof(TodayJobList))];
		}

		TodayJob = rand;
	}
	else {
		TodayJob = jobid;
	}
    new string[100];
    format(string, sizeof(string), "[BONUS JOB] Xin chao, cong viec cua ngay hom nay se la %s.", JobInfo[jobid][jName]);
    SCMTA(COLOR_GOLD, string);
    format(string, sizeof(string), "[BONUS JOB] Khi lam cong viec nay, ban se nhan them %d phan tram tien luong.", JobInfo[jobid][jBonus]);
    SCMTA(COLOR_GOLD, string);
    format(string, sizeof(string), "UPDATE `stuff` SET `TodayJob` = '%d'", jobid);
    mysql_query(SQL, string, false);	
}


CMD:thaluoi(playerid, params[])
 {
    if(PlayerInfo[playerid][pJob] != 11) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la FisherMan LS!");
	if(GetPlayerSkill(playerid) < 4 ) return SendClientMessage(playerid, COLOR_GREY, "Job skill level cua ban chua du 4 nen khong the su dung!");
    if(!DiaDiemCauCaO(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o diem cau ca.");
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[HE THONG] {FFFFFF}: Ban khong the tiep tuc neu ban khong xuong xe");
	if(ThuySan[playerid] != 0) return SendClientMessage(playerid, -1, "Ban da cau thuy san roi hay den 24/7 de ban no.");
	if(StartFish[playerid] == 1) return 1;
	new car = GetClosestVehicle(playerid);
	if(DiaDiemCauCaO(playerid)) 
	{
		if(DaThueThuyen[playerid] != 0 || LamViecChung[playerid] == 1)
		{
			if(IsPlayerNearVehicle(playerid, car, 30) && IsANguDanZ(car))
			{
				// biencauca[playerid] =1;
				
				// CauCaBar[playerid] = CreatePlayerProgressBar(playerid,246.00, 376.00, 178.50, 3.20, 0x00FFFFFF, 500.0);
				// SetPlayerProgressBarMaxValue(playerid, CauCaBar[playerid], 500.0);
				//ShowPlayerProgressBar(playerid,CauCaBar[playerid]);
				// SetPlayerProgressBarValue(playerid,CauCaBar[playerid], 10);
				// ShowPlayerProgressBar(playerid, CauCaBar[playerid]);
				// else return PlayerInfo[playerid][pCP] = 1, SendClientMessage(playerid, -1,""RED"[ERROR]: "WHITE"Ban khong o noi ban co the bat dau cong viec. Hay den "RED"checkpoint"WHITE" tren ban do."), SetPlayerCheckpoint(playerid, -1080.3639,-1195.3372,129.6956, 5.0);
				// ChauTimer[playerid] = SetTimerEx("CauCaOBien", 100, true, "i", playerid);
				TogglePlayerControllable(playerid, 0);
				OnePlayAnim(playerid,"RIOT","RIOT_CHANT",4.0,1,1,1,1,0);
				ShowProgressBar(playerid, "Dang Tha Luoi", PROGRESS_THALUOI, RandomMinMax(10000, 150000), 0xfcba03FF);
				StartFish[playerid] = 1;
				return 1;
			}
			else return SendClientMessage(playerid, -1, "Ban khong o tren mot chiec thuyen danh ca {FF0000}Reefer{FFFFFF}");	
		}
		else return SendClientMessage(playerid, -1, "Ban can co mot chiec thuyen ca nhan hoac co mot chu thuyen {FF0000}/lamviecchung{FFFFFF} moi co the tha luoi");
	}
	else return CP[playerid] = 1, SendClientMessage(playerid, -1,""RED"[ERROR]: "WHITE"Ban khong o noi ban co the bat dau cong viec. Hay den "RED"checkpoint"WHITE" tren ban do."), SetPlayerCheckpointEx(playerid, 472.8250,-2710.4888,0.1202, 50.0);
}

CMD:thuethuyen(playerid, params[])
 {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_YELLOW, "Lenh nay dang duoc test, chi admin moi duoc su dung");
    if(PlayerInfo[playerid][pJob] != 11) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la FisherMan LS!");
	if(GetPlayerSkill(playerid) < 4 ) return SendClientMessage(playerid, COLOR_GREY, "Job skill level cua ban chua du 4 nen khong the su dung!");
    if(!IsPlayerInRangeOfPoint(playerid, Float:5.0, 581.5700, -1958.3500, 2.0300)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o diem thue thuyen.");
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[HE THONG] {FFFFFF}: Ban khong the tiep tuc neu ban khong xuong xe");
	if(GetPlayerCash(playerid) < 100000) return SendClientMessage(playerid, -1, "Ban khong du 100.000$ de thue thuyen.");
	if(DaThueThuyen[playerid] != 0) return SendClientMessage(playerid, COLOR_YELLOW, "Ban da thue mot chiec thuyen roi hay /huythuyen neu muon thue lai");
	{
		new carid = CreateVehicleEx(453, 593.1933, -1957.2242, -0.0212, -180.0,  126, 1, 300);
		ThuyenSpawn[carid] = carid;
		DaThueThuyen[playerid] = carid;
		Gas[ThuyenSpawn[carid]] = 100;
		SendClientMessage(playerid, COLOR_YELLOW, "Ban da thue thuyen va mat 100.000$, chiec thuyen xe mat khi ban (/q) hoac /huythuyen");
		// DaThueThuyen[playerid] = 1;
		GivePlayerCash(playerid, -100000);
		PutPlayerInVehicleEx(playerid, ThuyenSpawn[DaThueThuyen[playerid]], 0);
	}
	return 1;
}
CMD:huythuyen(playerid, params[])
 {
	if(DaThueThuyen[playerid] == 0) return SendClientMessage(playerid, COLOR_YELLOW, "Ban chua thue chiec thuyen nao het hay thue thuyen truoc nhe");
	DestroyVehicle(ThuyenSpawn[DaThueThuyen[playerid]]);
	SendClientMessage(playerid, COLOR_YELLOW, "Ban da thue thanh cong chiec thuyen cua ban bay gio ban da co the thue lai");
	DaThueThuyen[playerid] = 0;
	return 1;
}
hook OnProgressCompleted(playerid, progressid, params)
{
    if (progressid == PROGRESS_THALUOI)
    {
        if(ThuySan[playerid] == 0) {
			new asher = RandomMinMax(1,9), rar = random(2000), string[300], x;
			x = 50000+random(45000)+ asher*100;
			
			if(rar >= 1 && rar < 20) {
				x = (42152 + random(44223) + asher*500);
				format(string, sizeof(string), "Ban da bat duoc {FF0000}%sKG TOM{FFFFFF}, {FF0000}%sKG Sua{FFFFFF}, {FF0000}%sKG MUC{FFFFFF} ban co the ban voi gia $%s ! ", FormatNumber(asher),FormatNumber(asher),FormatNumber(asher),FormatNumber(x));
				SendClientMessage(playerid, COLOR_YELLOW, string);
				SendClientMessage(playerid, -1, "Di den cua hang 24/7 de ban ca!. (/gps)");
				format(string, sizeof(string), "* %s da bat duoc {FF0000}%sKG TOM{FFFFFF}, {FF0000}%sKG Sua{FFFFFF}, {FF0000}%sKG MUC{FFFFFF} co gia tri $%s.", GetName(playerid),FormatNumber(asher),FormatNumber(asher),FormatNumber(asher), FormatNumber(x));
				NearMessage(playerid, COLOR_YELLOW, string);
			}
			else if(rar >= 20 && rar < 25) 
			{
				x = (32123 + random(35231) + asher*1000);
				format(string, sizeof(string), "Ban da bat duoc {FF0000}%sKG CA DAU VUONG{FFFFFF}, {FF0000}%sKG CA XEM SAO{FFFFFF}, {FF0000}%sKG MUC{FFFFFF} ban co the ban voi gia $%s ! ",FormatNumber(asher),FormatNumber(asher),FormatNumber(asher), FormatNumber(x));
				SendClientMessage(playerid, COLOR_YELLOW, string);
				SendClientMessage(playerid, -1, "Di den cua hang 24/7 de ban ca!. (/gps)");
				format(string, sizeof(string), "* %s da bat duoc {FF0000}%sKG CA DAU VUONG{FFFFFF}, {FF0000}%sKG CA XEM SAO{FFFFFF}, {FF0000}%sKG MUC{FFFFFF} co gia tri $%s.", GetName(playerid),FormatNumber(asher),FormatNumber(asher),FormatNumber(asher), FormatNumber(x));
				NearMessage(playerid, COLOR_YELLOW, string);

			}
			if(rar >= 25 && rar < 28) {
				x =  (45000 + random(19245) + asher*1500);
				format(string, sizeof(string), "Ban da bat duoc {FF0000}%sKG TOM{FFFFFF}, {FF0000}%sKG Sua{FFFFFF}, {FF0000}%sKG MUC{FFFFFF} ban co the ban voi gia $%s ! ", FormatNumber(asher),FormatNumber(asher),FormatNumber(asher),FormatNumber(x));
				SendClientMessage(playerid, COLOR_YELLOW, string);
				SendClientMessage(playerid, -1, "Di den cua hang 24/7 de ban ca!. (/gps)");
				format(string, sizeof(string), "* %s da bat duoc {FF0000}%sKG TOM{FFFFFF}, {FF0000}%sKG Sua{FFFFFF}, {FF0000}%sKG MUC{FFFFFF} co gia tri $%s.", GetName(playerid), FormatNumber(asher),FormatNumber(asher),FormatNumber(asher),FormatNumber(x));
				NearMessage(playerid, COLOR_YELLOW, string);
			}
			else if(rar >= 28 && rar < 31 ) 
			{
				x = (21342 + random(56000) + asher*2000);
				format(string, sizeof(string), "Ban da bat duoc {FF0000}1KG TOM{FFFFFF}, {FF0000}1KG Sua{FFFFFF} ban co the ban voi gia $%s ! ", FormatNumber(x));
				SendClientMessage(playerid, COLOR_YELLOW, string);
				SendClientMessage(playerid, -1, "Di den cua hang 24/7 de ban ca!. (/gps)");
				format(string, sizeof(string), "* %s da bat duoc {FF0000}1KG TOM{FFFFFF}, {FF0000}1KG Sua{FFFFFF}  co gia tri $%s.", GetName(playerid),FormatNumber(asher),FormatNumber(asher), FormatNumber(x));
				NearMessage(playerid, COLOR_YELLOW, string);

			}
			else if(rar >= 31 && rar < 36) 
			{
				x = (400000 + random(33000) + asher*2500);
				format(string, sizeof(string), "Ban da bat duoc {FF0000}%sKG TOM{FFFFFF} ban co the ban voi gia $%s ! ", FormatNumber(asher),FormatNumber(x));
				SendClientMessage(playerid, COLOR_YELLOW, string);
				SendClientMessage(playerid, -1, "Di den cua hang 24/7 de ban ca!. (/gps)");
				format(string, sizeof(string), "* %s da bat duoc {FF0000}%sKG TOM{FFFFFF} co gia tri $%s.", GetName(playerid),FormatNumber(asher), FormatNumber(x));
				NearMessage(playerid, COLOR_YELLOW, string);

			}
			else if(rar >= 36 && rar < 41) 
			{
				x = (45000 + random(12000) + asher*3000);
				format(string, sizeof(string), "Ban da bat duoc {FF0000}%sKG Sua{FFFFFF}, {FF0000}%sKG MUC{FFFFFF} ban co the ban voi gia $%s ! ", FormatNumber(asher),FormatNumber(x));
				SendClientMessage(playerid, COLOR_YELLOW, string);
				SendClientMessage(playerid, -1, "Di den cua hang 24/7 de ban ca!. (/gps)");
				format(string, sizeof(string), "* %s da bat duoc {FF0000}%sKG Sua{FFFFFF}, {FF0000}%sKG MUC{FFFFFF} co gia tri $%s.", GetName(playerid), FormatNumber(asher),FormatNumber(asher),FormatNumber(x));
				NearMessage(playerid, COLOR_YELLOW, string);

			}
			else if(rar >= 41 && rar < 48) 
			{
				x = (55632 + random(5000) + asher*3500);
				format(string, sizeof(string), "Ban da bat duoc {FF0000}%sKG MUC{FFFFFF} ban co the ban voi gia $%s ! ",FormatNumber(asher), FormatNumber(x));
				SendClientMessage(playerid, COLOR_YELLOW, string);
				SendClientMessage(playerid, -1, "Di den cua hang 24/7 de ban ca!. (/gps)");
				format(string, sizeof(string), "* %s da bat duoc {FF0000}%sKG MUC{FFFFFF} co gia tri $%s.", GetName(playerid),FormatNumber(asher), FormatNumber(x));
				NearMessage(playerid, COLOR_YELLOW, string);

			}
			else if(rar >= 48 && rar < 55) 
			{
				x = (63213 + random(23000) + asher*4000);
				format(string, sizeof(string), "Ban da bat duoc {FF0000}%sKG CA LUONG SAU{FFFFFF}, {FF0000}%sKG CA ASHER{FFFFFF}, {FF0000}%sKG CA KIEM{FFFFFF} ban co the ban voi gia $%s ! ", FormatNumber(asher),FormatNumber(asher),FormatNumber(asher),FormatNumber(x));
				SendClientMessage(playerid, COLOR_YELLOW, string);
				SendClientMessage(playerid, -1, "Di den cua hang 24/7 de ban ca!. (/gps)");
				format(string, sizeof(string), "* %s da bat duoc {FF0000}%sKG TOM{FFFFFF}, {FF0000}%sKG Sua{FFFFFF}, {FF0000}%sKG MUC{FFFFFF} co gia tri $%s.", GetName(playerid),FormatNumber(asher),FormatNumber(asher),FormatNumber(asher), FormatNumber(x));
				NearMessage(playerid, COLOR_YELLOW, string);

			}
			else if(rar >= 55 && rar < 62) 
			{
				x = (40000 + random(9000) + asher*4000);
				format(string, sizeof(string), "Ban da bat duoc {FF0000}%sKG TOM{FFFFFF}, {FF0000}%sKG Sua{FFFFFF}, {FF0000}%sKG MUC{FFFFFF} ban co the ban voi gia $%s ! ", FormatNumber(asher),FormatNumber(asher),FormatNumber(asher),FormatNumber(x));
				SendClientMessage(playerid, COLOR_YELLOW, string);
				SendClientMessage(playerid, -1, "Di den cua hang 24/7 de ban ca!. (/gps)");
				format(string, sizeof(string), "* %s da bat duoc {FF0000}%sKG TOM{FFFFFF}, {FF0000}%sKG Sua{FFFFFF}, {FF0000}%sKG MUC{FFFFFF} co gia tri $%s.", GetName(playerid),FormatNumber(asher),FormatNumber(asher),FormatNumber(asher), FormatNumber(x));
				NearMessage(playerid, COLOR_YELLOW, string);

			}
			else if(rar >= 62 && rar < 69) 
			{
				x = (45000 + random(16000) + asher*5000);
				format(string, sizeof(string), "Ban da bat duoc {FF0000}%sKG CA BOI 1 GAI{FFFFFF}, {FF0000}%sKG CA HO DAU RONG{FFFFFF}, {FF0000}%sKG CA DAU VUONG{FFFFFF} ban co the ban voi gia $%s ! ", FormatNumber(asher),FormatNumber(asher),FormatNumber(asher),FormatNumber(x));
				SendClientMessage(playerid, COLOR_YELLOW, string);
				SendClientMessage(playerid, -1, "Di den cua hang 24/7 de ban ca!. (/gps)");
				format(string, sizeof(string), "* %s da bat duoc {FF0000}%sKG TOM{FFFFFF}, {FF0000}%sKG Sua{FFFFFF}, {FF0000}%sKG MUC{FFFFFF} co gia tri $%s.", GetName(playerid),FormatNumber(asher),FormatNumber(asher),FormatNumber(asher), FormatNumber(x));
				NearMessage(playerid, COLOR_YELLOW, string);

			}
			else if(rar >= 69 && rar < 75) {
				x = (40000 + random(500000) + asher*5500);
				format(string, sizeof(string), "Ban da bat duoc {FF0000}%sKG MUC ONG{FFFFFF}, {FF0000}%sKG CA BAN CHAN{FFFFFF}, {FF0000}%sKG CA MOI HOA{FFFFFF} ban co the ban voi gia $%s ! ", FormatNumber(asher),FormatNumber(asher),FormatNumber(asher),FormatNumber(x));
				SendClientMessage(playerid, COLOR_YELLOW, string);
				SendClientMessage(playerid, -1, "Di den cua hang 24/7 de ban ca!. (/gps)");
				format(string, sizeof(string), "* %s da bat duoc {FF0000}%sKG MUC ONG{FFFFFF}, {FF0000}%sKG CA BAN CHAN{FFFFFF}, {FF0000}%sKG CA MOI HOA{FFFFFF} co gia tri $%s.", GetName(playerid),FormatNumber(asher),FormatNumber(asher),FormatNumber(asher), FormatNumber(x));
				NearMessage(playerid, COLOR_YELLOW, string);
			}
			else if(rar >= 75 && rar < 83) 
			{
				x = (48000 + random(55000) + asher*6000);
				format(string, sizeof(string), "Ban da bat duoc {FF0000}%sKG CA HO DAU RONG{FFFFFF}, {FF0000}%sKG CA RO BIEN{FFFFFF}, {FF0000}%sKG MUC{FFFFFF} ban co the ban voi gia $%s ! ", FormatNumber(asher),FormatNumber(asher),FormatNumber(asher),FormatNumber(x));
				SendClientMessage(playerid, COLOR_YELLOW, string);
				SendClientMessage(playerid, -1, "Di den cua hang 24/7 de ban ca!. (/gps)");
				format(string, sizeof(string), "* %s da bat duoc {FF0000}%sKG CA HO DAU RONG{FFFFFF}, {FF0000}%sKG CA RO BIEN{FFFFFF}, {FF0000}%sKG MUC{FFFFFF} co gia tri $%s.", GetName(playerid), FormatNumber(asher),FormatNumber(asher),FormatNumber(asher),FormatNumber(x));
				NearMessage(playerid, COLOR_YELLOW, string);

			}
			else if(rar >= 93 && rar < 120) 
			{
				x = (50000 + random(12000) + asher*6000);
				format(string, sizeof(string), "Ban da bat duoc {FF0000}%sKG CA MOI{FFFFFF}, {FF0000}%sKG CA CO XANH{FFFFFF}ban co the ban voi gia $%s ! ", FormatNumber(asher),FormatNumber(asher),FormatNumber(x));
				SendClientMessage(playerid, COLOR_YELLOW, string);
				SendClientMessage(playerid, -1, "Di den cua hang 24/7 de ban ca!. (/gps)");
				format(string, sizeof(string), "* %s da bat duoc {FF0000}%sKG CA MOI{FFFFFF}, {FF0000}%sKG CA CO XANH{FFFFFF} co gia tri $%s.", GetName(playerid),FormatNumber(asher),FormatNumber(asher), FormatNumber(x));
				NearMessage(playerid, COLOR_YELLOW, string);

			}
			else if(rar >= 120 && rar < 160) 
			{
				x = (45000 + random(37000) + asher*6000);
				format(string, sizeof(string), "Ban da bat duoc {FF0000}%sKG CA NGU VAY VANG{FFFFFF}ban co the ban voi gia $%s ! ", FormatNumber(x));
				SendClientMessage(playerid, COLOR_YELLOW, string);
				SendClientMessage(playerid, -1, "Di den cua hang 24/7 de ban ca!. (/gps)");
				format(string, sizeof(string), "* %s da bat duoc {FF0000}%sKG CA NGU VAY VANG{FFFFFF} co gia tri $%s.", GetName(playerid),FormatNumber(asher), FormatNumber(x));
				NearMessage(playerid, COLOR_YELLOW, string);

			}
			else if(rar >= 160 && rar < 220) 
			{
				x = (43250 + random(14000) + asher*6000);
				format(string, sizeof(string), "Ban da bat duoc {FF0000}%sKG CA NUC HEO{FFFFFF}, {FF0000}%sKG SUA{FFFFFF} ban co the ban voi gia $%s ! ", FormatNumber(asher),FormatNumber(asher),FormatNumber(x));
				SendClientMessage(playerid, COLOR_YELLOW, string);
				SendClientMessage(playerid, -1, "Di den cua hang 24/7 de ban ca!. (/gps)");
				format(string, sizeof(string), "* %s da bat duoc {FF0000}%SKG CA NUC HEO{FFFFFF}, {FF0000}%SKG SUA{FFFFFF} co gia tri $%s.", GetName(playerid),FormatNumber(asher),FormatNumber(asher), FormatNumber(x));
				NearMessage(playerid, COLOR_YELLOW, string);

			}
			else if(rar >= 220 && rar < 300) 
			{
				x = (46000 + random(10000) + asher*6000);
				format(string, sizeof(string), "Ban da bat duoc {FF0000}%sKG CA THU CHAM{FFFFFF}, {FF0000}%sKG CA GIA THU{FFFFFF}, {FF0000}%sKG CA CO LA{FFFFFF} ban co the ban voi gia $%s ! ",FormatNumber(asher),FormatNumber(asher),FormatNumber(asher), FormatNumber(x));
				SendClientMessage(playerid, COLOR_YELLOW, string);
				SendClientMessage(playerid, -1, "Di den cua hang 24/7 de ban ca!. (/gps)");
				format(string, sizeof(string), "* %s da bat duoc {FF0000}%sKG CA THU CHAM{FFFFFF}, {FF0000}%sKG CA GIA THU{FFFFFF}, {FF0000}%sKG CA CO LA{FFFFFF} co gia tri $%s.", GetName(playerid),FormatNumber(asher),FormatNumber(asher),FormatNumber(asher), FormatNumber(x));
				NearMessage(playerid, COLOR_YELLOW, string);

			}
			else if(rar >= 300 && rar < 301) 
			{
				x = 150000+random(550);
				format(string, sizeof(string), "Ban da bat duoc {FF0000}CON CA MAP{FFFFFF} ban co the ban voi gia $%s ! ", FormatNumber(x));
				SendClientMessage(playerid, COLOR_YELLOW, string);
				SendClientMessage(playerid, -1, "Di den cua hang 24/7 de ban ca!. (/gps)");
				format(string, sizeof(string), "* %s da bat duoc {FF0000}CON CA MAP{FFFFFF}  co gia tri $%s.", GetName(playerid), FormatNumber(x));
				NearMessage(playerid, COLOR_YELLOW, string);

			}
			else 
			{
				format(string, sizeof(string), "Ban da bat duoc %sKG thuy san gia tri $%s! ", FormatNumber(asher), FormatNumber(x));
				SendClientMessage(playerid, COLOR_YELLOW, string);
				SendClientMessage(playerid, -1, "Di den cua hang 24/7 de ban thuy san!. (/gps)");
				format(string, sizeof(string), "* %s da bat duoc %sKG thuy san co gia tri $%s .", GetName(playerid),FormatNumber(asher), FormatNumber(x));
				NearMessage(playerid, COLOR_YELLOW, string);
			}
			ThuySan[playerid] = x+ (5000 * PlayerInfo[playerid][pVip]);
            if(PlayerInfo[playerid][pVip] >= 1)
            {
                SCMf(playerid, COLOR_YELLOW, "Vi ban la nguoi choi vip nen duoc + tien job. {FF0000}Tong cong :{FFFF00}%d.", x+(5000 * PlayerInfo[playerid][pVip]));
            }
            StartFish[playerid] = 0;
            ClearAnimations(playerid);
            // DestroyPlayerProgressBar(playerid, CauCaBar[playerid]);
            TogglePlayerControllable(playerid, 1);
            Freezed[playerid] = 0;
            for(new m; m < 2; m++)
			{
			if(PlayerInfo[playerid][pDailyMission][m] == 21) CheckMission(playerid, m);
			}
        }
    }
    return 1;
}
CMD:khonglamviecchung(playerid, params[]) {
	if(LamViecChung[playerid] == 0) return SendClientMessage(playerid, -1, "Ban khong co dang lam viec chung");
	LamViecChung[playerid] = 0;
	SendClientMessage(playerid, COLOR_LIGHTBLUE, "Ban da khong lam viec chung voi ai nua!");
	return 1;
} 
CMD:lamviecchung(playerid, params[]) {
   
    if(DaThueThuyen[playerid] == 0) return SendClientMessage(playerid, COLOR_GREY, "Ban can phai co 1 chiec thuyen ca nhan moi co the cho farm chung (/thuethuyen)!");
	new id,string[128];

	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong o trong chiec thuyen cua ban!");
	if(LamViecChung[playerid] != 0) return SendClientMessage(playerid, COLOR_WHITE, "Nguoi choi do da lam viec chung voi nguoi khac!");
	if(sscanf(params, "u", id)) return SendClientMessage(playerid, 0xFFFFFFFF,"USAGE: /lamviecchung <{FFFF00}ID/Ten{FFFFFF}>");
	if(!ProxDetectorS(9.0, playerid, id)) return SendClientMessage(playerid, -1, "Ban khong o gan nguoi choi do!");
	if(id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi khong ket noi.");
    if(LamViecChung[playerid] == 1) return SendClientMessage(playerid, -1, "Nguoi choi nay da lam viec chung voi mot nguoi khac");
	
	format(string, sizeof(string), ">> Ban da cho %s farm chung.",GetName(id));
	SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
	LamViecChung[id] = 1;
	format(string, sizeof(string), ">> %s Da cho ban farm chung.",GetName(playerid));
	SendClientMessage(id, COLOR_LIGHTBLUE, string);
	defer telecauca(playerid);
    return 1;
}
