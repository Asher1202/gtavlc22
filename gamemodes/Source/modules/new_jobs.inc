#include <a_samp>
#include <YSI\y_iterate>
#include <YSI_Coding\y_hooks>

hook OnGameModeInit() {
	new Float:zones_points_1[] = { -632.0,-1249.0,-634.0,-1587.0,-139.0,-1586.0,-131.0,-1240.0,-632.0,-1249.0 }, data[3];
	data[0] = e_Area_Job_Farm_Area;
	Streamer_SetArrayData(STREAMER_TYPE_AREA, CreateDynamicPolygon(zones_points_1, .interiorid = 0), E_STREAMER_EXTRA_ID, data, 1);
	#include "map/farmer_coords"
 	new tmpobjid = CreateDynamicObject(1439, 944.436828, 2127.660644, 1010.021179, 0.000000, 0.000000, -90.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 2803, "cj_meaty", "CJ_FLESH_2", 0x00000000);

	CreateDynamic3DTextLabel("{4790DE}Buon thuoc phien\n{FFFFFF}Nhap '/work' de bat dau cong viec", -1, 1761.1273,-2137.6575,14.4469, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 15.0);
	CreateDynamic3DTextLabel("{4790DE}Nguoi trong vuon\n{FFFFFF}Nhap '/work' de bat dau cong viec", -1, -1080.3639,-1195.3372,129.6956, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 15.0);

	//Garduri Fish
	CreateDynamicObject(970, 382.19919, -2042.00671, 7.32180,   0.00000, 0.00000, 0.00000,-1,-1,-1,500.0);
	CreateDynamicObject(970, 378.70398, -2045.08789, 7.32180,   0.00000, 0.00000, -91.98001,-1,-1,-1,500.0);
	CreateDynamicObject(970, 378.51715, -2050.44434, 7.32180,   0.00000, 0.00000, -92.76000,-1,-1,-1,500.0);
	CreateDynamicObject(970, 352.48499, -2050.70313, 7.29520, 0.00000, 0.00000, 0.00000,-1,-1,-1,500.0);
	//Job drugs dealer
	CreateObject(3409,1756.3000000,-2143.7000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(grassplant) (1)
	CreateObject(3409,1752.3000000,-2143.8000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(grassplant) (2)
	CreateObject(3409,1748.3000000,-2143.8999000,12.5000000,0.0000000,0.0000000,0.0000000); //object(grassplant) (3)
	CreateObject(3409,1744.6000000,-2143.8999000,12.5000000,0.0000000,0.0000000,0.0000000); //object(grassplant) (4)
	CreateObject(3409,1756.4000000,-2148.3999000,12.5000000,0.0000000,0.0000000,0.0000000); //object(grassplant) (5)
	CreateObject(3409,1752.3000000,-2148.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(grassplant) (6)
	CreateObject(3409,1748.2000000,-2148.6001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(grassplant) (7)
	CreateObject(3409,1744.6000000,-2148.6001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(grassplant) (8)
	CreateObject(3409,1767.7000000,-2151.2000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(grassplant) (9)
	CreateObject(3409,1763.8000000,-2151.3000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(grassplant) (10)
	CreateObject(3409,1759.8000000,-2151.3000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(grassplant) (11)
	CreateObject(3409,1744.8000000,-2153.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(grassplant) (12)
	CreateObject(3409,1748.7000000,-2153.6001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(grassplant) (13)
	CreateObject(3409,1752.9000000,-2153.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(grassplant) (14)
	CreateObject(3409,1757.1000000,-2153.3000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(grassplant) (15)
	CreateObject(3409,1761.1000000,-2152.8000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(grassplant) (16)
	CreateObject(3409,1761.1000000,-2154.2000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(grassplant) (17)
	CreateObject(3409,1765.1000000,-2154.2000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(grassplant) (18)
	CreateObject(3409,1767.8000000,-2154.1001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(grassplant) (19)
	
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
	for(new i = 0; i < sizeof(MechanicWheelObj); i++) { MechanicWheelObj[i] = -1; }
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
	}
	// TreeTD[0] = TextDrawCreate(509.500000, 308.562500, "");
	// TextDrawLetterSize(TreeTD[0], 0.000000, 0.000000);
	// TextDrawTextSize(TreeTD[0], 134.000000, 106.000000);
	// TextDrawAlignment(TreeTD[0], 1);
	// TextDrawColor(TreeTD[0], -1);
	// TextDrawSetShadow(TreeTD[0], 0);
	// TextDrawSetOutline(TreeTD[0], 0);
	// TextDrawBackgroundColor(TreeTD[0], 168430330);
	// TextDrawFont(TreeTD[0], 5);
	// TextDrawSetProportional(TreeTD[0], 0);
	// TextDrawSetShadow(TreeTD[0], 0);
	// TextDrawSetPreviewModel(TreeTD[0], 731);
	// TextDrawSetPreviewRot(TreeTD[0], 0.000000, 0.000000, 0.000000, 1.000000);

	// TreeTD[1] = TextDrawCreate(567.500000, 314.250000, "");
	// TextDrawLetterSize(TreeTD[1], 0.000000, 0.000000);
	// TextDrawTextSize(TreeTD[1], 34.000000, 26.000000);
	// TextDrawAlignment(TreeTD[1], 1);
	// TextDrawColor(TreeTD[1], -1);
	// TextDrawSetShadow(TreeTD[1], 0);
	// TextDrawSetOutline(TreeTD[1], 0);
	// TextDrawBackgroundColor(TreeTD[1], 0);
	// TextDrawFont(TreeTD[1], 5);
	// TextDrawSetProportional(TreeTD[1], 0);
	// TextDrawSetShadow(TreeTD[1], 0);
	// TextDrawSetSelectable(TreeTD[1], true);
	// TextDrawSetPreviewModel(TreeTD[1], 19576);
	// TextDrawSetPreviewRot(TreeTD[1], 0.000000, 0.000000, 0.000000, 1.000000);

	// TreeTD[2] = TextDrawCreate(578.000000, 327.375000, "");
	// TextDrawLetterSize(TreeTD[2], 0.000000, 0.000000);
	// TextDrawTextSize(TreeTD[2], 34.000000, 26.000000);
	// TextDrawAlignment(TreeTD[2], 1);
	// TextDrawColor(TreeTD[2], -1);
	// TextDrawSetShadow(TreeTD[2], 0);
	// TextDrawSetOutline(TreeTD[2], 0);
	// TextDrawBackgroundColor(TreeTD[2], 0);
	// TextDrawFont(TreeTD[2], 5);
	// TextDrawSetProportional(TreeTD[2], 0);
	// TextDrawSetShadow(TreeTD[2], 0);
	// TextDrawSetSelectable(TreeTD[2], true);
	// TextDrawSetPreviewModel(TreeTD[2], 19576);
	// TextDrawSetPreviewRot(TreeTD[2], 0.000000, 0.000000, 0.000000, 1.000000);

	// TreeTD[3] = TextDrawCreate(583.000000, 345.750000, "");
	// TextDrawLetterSize(TreeTD[3], 0.000000, 0.000000);
	// TextDrawTextSize(TreeTD[3], 34.000000, 26.000000);
	// TextDrawAlignment(TreeTD[3], 1);
	// TextDrawColor(TreeTD[3], -1);
	// TextDrawSetShadow(TreeTD[3], 0);
	// TextDrawSetOutline(TreeTD[3], 0);
	// TextDrawBackgroundColor(TreeTD[3], 0);
	// TextDrawFont(TreeTD[3], 5);
	// TextDrawSetProportional(TreeTD[3], 0);
	// TextDrawSetShadow(TreeTD[3], 0);
	// TextDrawSetSelectable(TreeTD[3], true);
	// TextDrawSetPreviewModel(TreeTD[3], 19576);
	// TextDrawSetPreviewRot(TreeTD[3], 0.000000, 0.000000, 0.000000, 1.000000);

	// TreeTD[4] = TextDrawCreate(580.500000, 361.937500, "");
	// TextDrawLetterSize(TreeTD[4], 0.000000, 0.000000);
	// TextDrawTextSize(TreeTD[4], 34.000000, 26.000000);
	// TextDrawAlignment(TreeTD[4], 1);
	// TextDrawColor(TreeTD[4], -1);
	// TextDrawSetShadow(TreeTD[4], 0);
	// TextDrawSetOutline(TreeTD[4], 0);
	// TextDrawBackgroundColor(TreeTD[4], 0);
	// TextDrawFont(TreeTD[4], 5);
	// TextDrawSetProportional(TreeTD[4], 0);
	// TextDrawSetShadow(TreeTD[4], 0);
	// TextDrawSetSelectable(TreeTD[4], true);
	// TextDrawSetPreviewModel(TreeTD[4], 19576);
	// TextDrawSetPreviewRot(TreeTD[4], 0.000000, 0.000000, 0.000000, 1.000000);

	// TreeTD[5] = TextDrawCreate(581.000000, 376.375000, "");
	// TextDrawLetterSize(TreeTD[5], 0.000000, 0.000000);
	// TextDrawTextSize(TreeTD[5], 34.000000, 26.000000);
	// TextDrawAlignment(TreeTD[5], 1);
	// TextDrawColor(TreeTD[5], -1);
	// TextDrawSetShadow(TreeTD[5], 0);
	// TextDrawSetOutline(TreeTD[5], 0);
	// TextDrawBackgroundColor(TreeTD[5], 0);
	// TextDrawFont(TreeTD[5], 5);
	// TextDrawSetProportional(TreeTD[5], 0);
	// TextDrawSetShadow(TreeTD[5], 0);
	// TextDrawSetSelectable(TreeTD[5], true);
	// TextDrawSetPreviewModel(TreeTD[5], 19576);
	// TextDrawSetPreviewRot(TreeTD[5], 0.000000, 0.000000, 0.000000, 1.000000);

	// TreeTD[6] = TextDrawCreate(544.000000, 376.812500, "");
	// TextDrawLetterSize(TreeTD[6], 0.000000, 0.000000);
	// TextDrawTextSize(TreeTD[6], 34.000000, 26.000000);
	// TextDrawAlignment(TreeTD[6], 1);
	// TextDrawColor(TreeTD[6], -1);
	// TextDrawSetShadow(TreeTD[6], 0);
	// TextDrawSetOutline(TreeTD[6], 0);
	// TextDrawBackgroundColor(TreeTD[6], 0);
	// TextDrawFont(TreeTD[6], 5);
	// TextDrawSetProportional(TreeTD[6], 0);
	// TextDrawSetShadow(TreeTD[6], 0);
	// TextDrawSetSelectable(TreeTD[6], true);
	// TextDrawSetPreviewModel(TreeTD[6], 19576);
	// TextDrawSetPreviewRot(TreeTD[6], 0.000000, 0.000000, 0.000000, 1.000000);

	// TreeTD[7] = TextDrawCreate(541.000000, 362.812500, "");
	// TextDrawLetterSize(TreeTD[7], 0.000000, 0.000000);
	// TextDrawTextSize(TreeTD[7], 34.000000, 26.000000);
	// TextDrawAlignment(TreeTD[7], 1);
	// TextDrawColor(TreeTD[7], -1);
	// TextDrawSetShadow(TreeTD[7], 0);
	// TextDrawSetOutline(TreeTD[7], 0);
	// TextDrawBackgroundColor(TreeTD[7], 0);
	// TextDrawFont(TreeTD[7], 5);
	// TextDrawSetProportional(TreeTD[7], 0);
	// TextDrawSetShadow(TreeTD[7], 0);
	// TextDrawSetSelectable(TreeTD[7], true);
	// TextDrawSetPreviewModel(TreeTD[7], 19576);
	// TextDrawSetPreviewRot(TreeTD[7], 0.000000, 0.000000, 0.000000, 1.000000);

	// TreeTD[8] = TextDrawCreate(538.500000, 347.937500, "");
	// TextDrawLetterSize(TreeTD[8], 0.000000, 0.000000);
	// TextDrawTextSize(TreeTD[8], 34.000000, 26.000000);
	// TextDrawAlignment(TreeTD[8], 1);
	// TextDrawColor(TreeTD[8], -1);
	// TextDrawSetShadow(TreeTD[8], 0);
	// TextDrawSetOutline(TreeTD[8], 0);
	// TextDrawBackgroundColor(TreeTD[8], 0);
	// TextDrawFont(TreeTD[8], 5);
	// TextDrawSetProportional(TreeTD[8], 0);
	// TextDrawSetShadow(TreeTD[8], 0);
	// TextDrawSetSelectable(TreeTD[8], true);
	// TextDrawSetPreviewModel(TreeTD[8], 19576);
	// TextDrawSetPreviewRot(TreeTD[8], 0.000000, 0.000000, 0.000000, 1.000000);

	// TreeTD[9] = TextDrawCreate(542.500000, 335.250000, "");
	// TextDrawLetterSize(TreeTD[9], 0.000000, 0.000000);
	// TextDrawTextSize(TreeTD[9], 34.000000, 26.000000);
	// TextDrawAlignment(TreeTD[9], 1);
	// TextDrawColor(TreeTD[9], -1);
	// TextDrawSetShadow(TreeTD[9], 0);
	// TextDrawSetOutline(TreeTD[9], 0);
	// TextDrawBackgroundColor(TreeTD[9], 0);
	// TextDrawFont(TreeTD[9], 5);
	// TextDrawSetProportional(TreeTD[9], 0);
	// TextDrawSetShadow(TreeTD[9], 0);
	// TextDrawSetSelectable(TreeTD[9], true);
	// TextDrawSetPreviewModel(TreeTD[9], 19576);
	// TextDrawSetPreviewRot(TreeTD[9], 0.000000, 0.000000, 0.000000, 1.000000);

	// TreeTD[10] = TextDrawCreate(550.500000, 321.250000, "");
	// TextDrawLetterSize(TreeTD[10], 0.000000, 0.000000);
	// TextDrawTextSize(TreeTD[10], 34.000000, 26.000000);
	// TextDrawAlignment(TreeTD[10], 1);
	// TextDrawColor(TreeTD[10], -1);
	// TextDrawSetShadow(TreeTD[10], 0);
	// TextDrawSetOutline(TreeTD[10], 0);
	// TextDrawBackgroundColor(TreeTD[10], 0);
	// TextDrawFont(TreeTD[10], 5);
	// TextDrawSetProportional(TreeTD[10], 0);
	// TextDrawSetShadow(TreeTD[10], 0);
	// TextDrawSetSelectable(TreeTD[10], true);
	// TextDrawSetPreviewModel(TreeTD[10], 19576);
	// TextDrawSetPreviewRot(TreeTD[10], 0.000000, 0.000000, 0.000000, 1.000000);

	// TreeTD[11] = TextDrawCreate(562.000000, 339.625000, "");
	// TextDrawLetterSize(TreeTD[11], 0.000000, 0.000000);
	// TextDrawTextSize(TreeTD[11], 34.000000, 26.000000);
	// TextDrawAlignment(TreeTD[11], 1);
	// TextDrawColor(TreeTD[11], -1);
	// TextDrawSetShadow(TreeTD[11], 0);
	// TextDrawSetOutline(TreeTD[11], 0);
	// TextDrawBackgroundColor(TreeTD[11], 0);
	// TextDrawFont(TreeTD[11], 5);
	// TextDrawSetProportional(TreeTD[11], 0);
	// TextDrawSetShadow(TreeTD[11], 0);
	// TextDrawSetSelectable(TreeTD[11], true);
	// TextDrawSetPreviewModel(TreeTD[11], 19576);
	// TextDrawSetPreviewRot(TreeTD[11], 0.000000, 0.000000, 0.000000, 1.000000);

	// TreeTD[12] = TextDrawCreate(553.000000, 356.687500, "");
	// TextDrawLetterSize(TreeTD[12], 0.000000, 0.000000);
	// TextDrawTextSize(TreeTD[12], 34.000000, 26.000000);
	// TextDrawAlignment(TreeTD[12], 1);
	// TextDrawColor(TreeTD[12], -1);
	// TextDrawSetShadow(TreeTD[12], 0);
	// TextDrawSetOutline(TreeTD[12], 0);
	// TextDrawBackgroundColor(TreeTD[12], 0);
	// TextDrawFont(TreeTD[12], 5);
	// TextDrawSetProportional(TreeTD[12], 0);
	// TextDrawSetShadow(TreeTD[12], 0);
	// TextDrawSetSelectable(TreeTD[12], true);
	// TextDrawSetPreviewModel(TreeTD[12], 19576);
	// TextDrawSetPreviewRot(TreeTD[12], 0.000000, 0.000000, 0.000000, 1.000000);

	// TreeTD[13] = TextDrawCreate(566.500000, 370.687500, "");
	// TextDrawLetterSize(TreeTD[13], 0.000000, 0.000000);
	// TextDrawTextSize(TreeTD[13], 34.000000, 26.000000);
	// TextDrawAlignment(TreeTD[13], 1);
	// TextDrawColor(TreeTD[13], -1);
	// TextDrawSetShadow(TreeTD[13], 0);
	// TextDrawSetOutline(TreeTD[13], 0);
	// TextDrawBackgroundColor(TreeTD[13], 0);
	// TextDrawFont(TreeTD[13], 5);
	// TextDrawSetProportional(TreeTD[13], 0);
	// TextDrawSetShadow(TreeTD[13], 0);
	// TextDrawSetSelectable(TreeTD[13], true);
	// TextDrawSetPreviewModel(TreeTD[13], 19576);
	// TextDrawSetPreviewRot(TreeTD[13], 0.000000, 0.000000, 0.000000, 1.000000);

	// TreeTD[14] = TextDrawCreate(568.500000, 353.187500, "");
	// TextDrawLetterSize(TreeTD[14], 0.000000, 0.000000);
	// TextDrawTextSize(TreeTD[14], 34.000000, 26.000000);
	// TextDrawAlignment(TreeTD[14], 1);
	// TextDrawColor(TreeTD[14], -1);
	// TextDrawSetShadow(TreeTD[14], 0);
	// TextDrawSetOutline(TreeTD[14], 0);
	// TextDrawBackgroundColor(TreeTD[14], 0);
	// TextDrawFont(TreeTD[14], 5);
	// TextDrawSetProportional(TreeTD[14], 0);
	// TextDrawSetShadow(TreeTD[14], 0);
	// TextDrawSetSelectable(TreeTD[14], true);
	// TextDrawSetPreviewModel(TreeTD[14], 19576);
	// TextDrawSetPreviewRot(TreeTD[14], 0.000000, 0.000000, 0.000000, 1.000000);
	
	MechanicWheelTD[0] = TextDrawCreate(445.000000, 282.750000, "");
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
	TextDrawSetShadow(MechanicLightTD[6], 0);
	
	WaiterTD[0] = TextDrawCreate(468.500000, 97.687500, "LD_SPAC:white");
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
	TextDrawSetShadow(WaiterTD[7], 0);

	return 1;
}
hook OnPlayerConnect(playerid) {
	/*(PlayerInfo[playerid][pFishPrice] = 0*/, Bit_Vet(player_is_fishing, playerid), Bit_Vet(player_is_catching, playerid), JobWorking[playerid] = 0;
 	foreach(new i : Player) {
 	    SellGunPice[playerid][i] = 0;		SellGunWeapon[playerid][i] = 0;
		SellGunAmmo[playerid][i] = 0;		SellGunMats[playerid][i] = 0;
	 	RepairPrice[playerid][i] = 0;		RefillPrice[playerid][i] = 0;
	 	SellMatsPrice[playerid][i] = 0;		SellMatsAmount[playerid][i] = 0;
	 	SellDrugsPrice[playerid][i] = 0;	SellDrugsAmount[playerid][i] = 0;
 	}
 	return 1;
}
hook OnPlayerEnterDynRaceCP(playerid, checkpointid) {
	if(!IsValidDynamicRaceCP(checkpointid) || !IsPlayerConnected(playerid)) return 1;
	new data[3];
	Streamer_GetArrayData(STREAMER_TYPE_RACE_CP, checkpointid, E_STREAMER_EXTRA_ID, data);
	switch(data[1]) {
 		case e_CP_Job_Farmer: {
			if(JobWorking[playerid] == 6 && Iter_Count(BalesOnVehicle<PlayerInfo[playerid][pJobVehicle]>) == 10) {
				new amount = 0;
				switch(PlayerInfo[playerid][pFarmSkill]) {
				    case 1: amount = 8000 + random(10000);
				    case 2: amount = 10000 + random(10000);
				    case 3: amount = 12000 + random(10000);
				    case 4: amount = 14000 + random(10000);
				    case 5: amount = 16000 + random(10000);
				    case 6: amount = 17000 + random(10000);
				}
				GiveJobMoney(playerid, amount), va_SendClientMessage(playerid, X11_SPRING_GREEN, "[JOB]:"WHITE" Ban da nhan duoc $%s tien luong cho cong viec cua minh.", FormatNumber(amount));
				if(PlayerInfo[playerid][pQuest2] == 4) { if(PlayerInfo[playerid][pQuestNeed2] > PlayerInfo[playerid][pQuestProgress2]) PlayerInfo[playerid][pQuestProgress2]++, FinishQuest2(playerid, 4); }
				DestroyDynamicRaceCP(checkpointid), DestroyDynamicRaceCP(PlayerInfo[playerid][c_Bales_Cp]), StopWork(playerid);
 		 		PlayerInfo[playerid][pFarmRem]--, PlayerInfo[playerid][pFarmTimes] ++;
				if(PlayerInfo[playerid][pFarmSkill] <= 5) {
					if(PlayerInfo[playerid][pFarmRem] <= 0) {
						PlayerInfo[playerid][pFarmSkill]++;
						switch(PlayerInfo[playerid][pFarmSkill]) {
	 						case 2: PlayerInfo[playerid][pFarmRem] = 34;
				    		case 3: PlayerInfo[playerid][pFarmRem] = 49;
						    case 4: PlayerInfo[playerid][pFarmRem] = 89;
						    case 5: PlayerInfo[playerid][pFarmRem] = 99;
						}
						va_SendClientMessage(playerid, X11_SPRING_GREEN, "Nguoi nong dan: "WHITE"Chuc mung! Ky nang cong viec cua ban da dat level %d.",PlayerInfo[playerid][pFarmSkill]);
					}
   				}
				else {
					GiveReputation(playerid, 13);
				}	   				
   				savePlayerSkill(playerid);
   			}
		}
	}
	return 1;
}
hook OnPlayerKStateChange(playerid, newkeys, oldkeys) {
	if(PRESSED(KEY_SPRINT) && IsPlayerCatching(playerid)) {
		player_drag_power[playerid] += 2;
		if(GetPlayerAnimationIndex(playerid) != 295) {
			ClearAnimations(playerid, 1);
			ApplyAnimation(playerid, #CASINO, #DEALONE, 80.0, 0, 1, 1, 1, 1, 1);
			ApplyAnimation(playerid, #CASINO, #DEALONE, 80.0, 0, 1, 1, 1, 1, 1);
		}
	}
    if(newkeys & KEY_SECONDARY_ATTACK) {
    	if(PlayerInfo[playerid][pJob] == 11) {
			if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return 1;
			for(new i = 0; i < sizeof(MechanicTable); i++) {
				new Float:x,Float:y,Float:z;
				GetObjectPos(MechanicTable[i], x,y,z);
				if(IsPlayerInRangeOfPoint(playerid, 2.0, x,y,z)) {
					if(MechanicWorkAt[playerid] == -1) return Info(playerid, "Dau tien go lenh ~y~/work~w~ ben canh mot chiec xe dang duoc che tao");
					if(PlayerInfo[playerid][pCP] == 23) return 1;
					else if(MechanicWorkAt[playerid] < sizeof(MechanicWheelObj)) {
						switch(MechanicWorkAt[playerid]) {
							case 0,4,8: {
								GetObjectPos(MechanicCar[MechanicWorkAt[playerid] / 4], x, y, z), SetPlayerCheckpoint(playerid, x-2, y+1.5, z, 1.0), SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Den checkpoint de aceasta roata pe vehicul");
								SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY), SetPlayerAttachedObject(playerid, ATTACHMENT_ID_BALE,1080,1,0.00,0.70,-0.01,0.0,0.0,0.0,1.00,1.00,1.00), PlayerInfo[playerid][pCP] = 23;
								return 1;
							}
							case 1,5,9: {
								GetObjectPos(MechanicCar[MechanicWorkAt[playerid] / 4], x, y, z), SetPlayerCheckpoint(playerid, x-2, y-1.5, z, 1.0), SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Den checkpoint de aceasta roata pe vehicul");
								SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY), SetPlayerAttachedObject(playerid, ATTACHMENT_ID_BALE,1080,1,0.00,0.70,-0.01,0.0,0.0,0.0,1.00,1.00,1.00), PlayerInfo[playerid][pCP] = 23;
								return 1;
							}
							case 2,6,10: {
								GetObjectPos(MechanicCar[MechanicWorkAt[playerid] / 4], x, y, z), SetPlayerCheckpoint(playerid, x+2, y+1.5, z, 1.0), SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Den checkpoint de aceasta roata pe vehicul");
								SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY), SetPlayerAttachedObject(playerid, ATTACHMENT_ID_BALE,1080,1,0.00,0.70,-0.01,0.0,0.0,0.0,1.00,1.00,1.00), PlayerInfo[playerid][pCP] = 23;
								return 1;
							}
							case 3,7,11: {
								GetObjectPos(MechanicCar[MechanicWorkAt[playerid] / 4], x, y, z), SetPlayerCheckpoint(playerid, x+2, y-1.5, z, 1.0), SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Den checkpoint de aceasta roata pe vehicul");
								SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY), SetPlayerAttachedObject(playerid, ATTACHMENT_ID_BALE,1080,1,0.00,0.70,-0.01,0.0,0.0,0.0,1.00,1.00,1.00), PlayerInfo[playerid][pCP] = 23;
								return 1;
							}
						}
					}
					else if(MechanicWorkAt[playerid] < (sizeof(MechanicCar) * 4)+sizeof(MechanicCar)) {
						GetObjectPos(MechanicCar[MechanicWorkAt[playerid]-(sizeof(MechanicCar) * 4)], x, y, z), SetPlayerCheckpoint(playerid, x, y, z+1.0, 3.0), SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
						SetPlayerAttachedObject(playerid, ATTACHMENT_ID_BALE,2904,1,-0.03,1.53,0.03,0.0,-1.0,93.0,1.00,1.15,1.00), SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Den checkpoint de parbrizul pe vehicul"), PlayerInfo[playerid][pCP] = 23;
					} else if(MechanicWorkAt[playerid] < (sizeof(MechanicCar) * 4)+(sizeof(MechanicCar) * 2)) {
						GetObjectPos(MechanicCar[MechanicWorkAt[playerid]-((sizeof(MechanicCar) * 4)+sizeof(MechanicCar))], x, y, z), SetPlayerCheckpoint(playerid, x-3.5, y, z, 2.0);
						SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY), SetPlayerAttachedObject(playerid, ATTACHMENT_ID_BALE,19917,1,-0.21,0.50,-0.01,0.0,86.0,89.0,0.62,0.86,1.00), SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Den checkpoint de motorul pe vehicul"), PlayerInfo[playerid][pCP] = 23;
					} else if(MechanicWorkAt[playerid] < (sizeof(MechanicCar) * 4)+(sizeof(MechanicCar) * 3)) {
						GetObjectPos(MechanicCar[MechanicWorkAt[playerid]-((sizeof(MechanicCar) * 4)+(sizeof(MechanicCar) * 2))], x, y, z), SetPlayerCheckpoint(playerid, x+3.7, y, z, 2.0), PlayerInfo[playerid][pCP] = 23;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Den checkpoint de gan den phia sau xe"), SetPlayerAttachedObject(playerid, ATTACHMENT_ID_BALE,18646,1,-0.03,0.46,-0.18,0.0,64.0,147.0,1.00,1.00,1.00), SetPlayerAttachedObject(playerid, ATTACHMENT_ID_CUFF,18646,1,-0.02,0.43,0.07,0.0,123.0,11.0,1.00,1.00,1.00);
						SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
					} else if(MechanicWorkAt[playerid] < (sizeof(MechanicCar) * 4)+(sizeof(MechanicCar) * 4)) {
						GetObjectPos(MechanicCar[MechanicWorkAt[playerid]-((sizeof(MechanicCar) * 4)+(sizeof(MechanicCar) * 3))], x, y, z), SetPlayerCheckpoint(playerid, x+3.7, y, z, 2.0), PlayerInfo[playerid][pCP] = 23;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Den checkpoint de gan spoiler phia sau xe"), SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY), SetPlayerAttachedObject(playerid, ATTACHMENT_ID_BALE,1186,1,-0.02,0.50,0.85,0.0,90.0,0.0,1.00,1.00,1.00);
					} else if(MechanicWorkAt[playerid] < (sizeof(MechanicCar) * 4)+(sizeof(MechanicCar) * 5)) {
						GetObjectPos(MechanicCar[MechanicWorkAt[playerid]-((sizeof(MechanicCar) * 4)+(sizeof(MechanicCar) * 4))], x, y, z), SetPlayerCheckpoint(playerid, x+3.7, y, z, 2.0), PlayerInfo[playerid][pCP] = 23;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Den checkpoint de de gan ong xa khoi"), SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY), SetPlayerAttachedObject(playerid, ATTACHMENT_ID_BALE,1135,1,-0.05,0.37,0.29,0.0,86.0,102.0,1.00,1.00,1.00);
					} else if(MechanicWorkAt[playerid] < (sizeof(MechanicCar) * 4)+(sizeof(MechanicCar) * 6)) {
						GetObjectPos(MechanicCar[MechanicWorkAt[playerid]-((sizeof(MechanicCar) * 4)+(sizeof(MechanicCar) * 5))], x, y, z), SetPlayerCheckpoint(playerid, x, y, z, 2.0), PlayerInfo[playerid][pCP] = 23;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Den checkpoint de gan ghe truoc cho xe"), SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY), SetPlayerAttachedObject(playerid, ATTACHMENT_ID_BALE,2748,1,0.50,1.01,-0.02,0.0,87.0,179.0,1.00,1.00,1.00);
					} else if(MechanicWorkAt[playerid] < (sizeof(MechanicCar) * 4)+(sizeof(MechanicCar) * 7)) {
						GetObjectPos(MechanicCar[MechanicWorkAt[playerid]-((sizeof(MechanicCar) * 4)+(sizeof(MechanicCar) * 6))], x, y, z), SetPlayerCheckpoint(playerid, x+3.7, y, z, 2.0), PlayerInfo[playerid][pCP] = 23;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Den checkpoint de gan can gat xe"), SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY), SetPlayerAttachedObject(playerid, ATTACHMENT_ID_BALE,1163,1,-0.05,0.37,-0.02,0.0,89.0,0.0,1.00,1.00,1.00);
					} else if(MechanicWorkAt[playerid] >= 999) {
						GetObjectPos(MechanicCar[MechanicWorkAt[playerid]-999], x,y,z), PlayerInfo[playerid][pCP] = 23;
						switch(MechanicColorNumber[playerid]) {
							case 1: SetPlayerCheckpoint(playerid, x-5.0, y, z, 2.0), SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Den checkpoint de son phia truoc xe");
							case 2: SetPlayerCheckpoint(playerid, x, y+2, z, 2.0), SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Den checkpoint de son ben trai xe");
							case 3: SetPlayerCheckpoint(playerid, x+5.0, y, z, 2.0), SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Den checkpoint de son phia sau xe");
							case 4: SetPlayerCheckpoint(playerid, x, y-2, z, 2.0), SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Den checkpoint de son phia ben phai xe");
						}
					}
					return 1;
				}
			}
	   	}
	   	if(JobWorking[playerid] == 2) {
	   		if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return 1;
	   		new Float:x,Float:y,Float:z;
			for(new i = 0; i < sizeof(FarmerTree); i++) {
				GetDynamicObjectPos(FarmerStairTree[i], x,y,z);
				if(IsPlayerInRangeOfPoint(playerid, 2.0, x,y,z)) {
					if(FarmerTreeTaken[playerid] >= 0) return 1;
					if(FarmerTreeStatus[i] > 0) return Info(playerid, "Cay da duoc thu hoach");
					if(FarmerTreeApples[playerid] > 0) return Info(playerid, "Ban da lay mot hop tao!");
					foreach(new p: Character) { if(FarmerTreeTaken[p] == i) return Info(playerid, "Cay nay da duoc mot nguoi choi khac thu hoach."); }
					SetPlayerFacingAngle(playerid, 90.0), SetPlayerPosEx(playerid, x,y,z), FarmerTreeTaken[playerid] = i;
					RemovePlayerAttachedObject(playerid, ATTACHMENT_ID_BALE), SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE), ApplyAnimation(playerid, "BOMBER", "BOM_Plant_Loop", 4.0, 1, 0, 0, 0, 0), TogglePlayerControllable(playerid, false);
					for(new t = 0; t < sizeof TreeTD; t++) TextDrawShowForPlayer(playerid, TreeTD[t]);
					SelectTextDraw(playerid, 0xFF0000FF), SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Thu hoach tat ca nhung qua tao ben duoi."), Info(playerid, "De thu hoach tao, nhap chuot vao no");
					return 1;
				}
			}
	   	}
    	else if(JobWorking[playerid] == 12) {
			if(PlayerInfo[playerid][pJobStep] == 1) {
				new actorid = -1;
 				for(new i = 0; i < 15; i++) {
					if(IsPlayerInRangeOfPoint(playerid, 2.0, WaiterActorsPOS[i][0], WaiterActorsPOS[i][1], WaiterActorsPOS[i][2]) && PlayerInfo[playerid][pActorHungry][i] == 1) {
						actorid = i;
						break;
					}
				}
				if(actorid != -1) {
					if(PlayerInfo[playerid][pActorHungry][actorid] == 1) {
						PlayerInfo[playerid][pActorHungry][actorid] = 0, PlayerInfo[playerid][pActorTimer][actorid] = 60, DestroyDynamic3DTextLabel(PlayerInfo[playerid][pWaiterLabel][actorid]);
						new type = 1;
						switch(random(12)) {
						    case 1,5,9,12: SendClientMessage(playerid, -1,"Nguoi phuc vu: Thua ong ba, ong ba muon dat mon gi a?"), SendClientMessage(playerid, -1, "Khach: Xin chao! Toi muon mot cai pizza.");
						    case 2,4,8,10,0: SendClientMessage(playerid, -1, "Nguoi phuc vu: Thua ong ba, ong ba muon dat mon gi a?"), SendClientMessage(playerid, -1, "Khach: Xin chao! Toi muon mot cai hamburger."), type = 2;
						    case 3,6,7,11: SendClientMessage(playerid, -1, "Nguoi phuc vu: Thua ong ba, ong ba muon dat mon gi a?"), SendClientMessage(playerid, -1, "Khach: Xin chao! Toi muon mot cai burrito."), type = 3;
						    
						}
						// 1 - pizza 2 - hamburger 3 - burrito
						PlayerInfo[playerid][pJobStep] = type+1, SendClientMessage(playerid, 0xC981C5FF, "* Di den tu lanh de lay thuc an."), PlayerInfo[playerid][pJobTimer] = 30, PlayerInfo[playerid][pActorTaken] = actorid;
						return 1;
					}
				}
			}
			if(IsPlayerInRangeOfPoint(playerid, 3.0, 375.2184,-115.7927,1001.4922)) {
				if(PlayerInfo[playerid][pJobStep] > 1) {
					if(SelectTD[playerid] != 14) {
						if(IsPlayerAttachedObjectSlotUsed(playerid, ATTACHMENT_ID_BALE)) return Info(playerid, "Vui long hoan thanh order cua ban.");
						for(new i = 0; i < sizeof(WaiterTD); i++) TextDrawShowForPlayer(playerid, WaiterTD[i]);
						PlayerTextDrawSetString(playerid, WaiterTPTD, "Frigider"), SelectTextDraw(playerid, 0xFF0000FF), SelectTD[playerid] = 14;
					}
				}
				else return Info(playerid, "Ban khong co order tu khach han.");
			}
			if(PlayerInfo[playerid][pJobStep] > 1)
			{
				if(!IsPlayerAttachedObjectSlotUsed(playerid, ATTACHMENT_ID_BALE)) return Info(playerid, "Ban khong co lenh.");
				new i = PlayerInfo[playerid][pActorTaken];
				if(IsPlayerInRangeOfPoint(playerid, 2.0, WaiterActorsPOS[i][0], WaiterActorsPOS[i][1], WaiterActorsPOS[i][2])) {
					PlayerInfo[playerid][pJobTimer] = -1, PlayerInfo[playerid][pJobStep] = 1, SetPlayerSpecialAction(playerid, 0);
					PlayerTextDrawHide(playerid, WaiterTPTD), RemovePlayerAttachedObject(playerid, ATTACHMENT_ID_BALE),  RemovePlayerAttachedObject(playerid, ATTACHMENT_ID_CUFF);
					new amount = 1000 + random(1500);
					GiveJobMoney(playerid, amount);
					va_Info(playerid, "Ban_da_nhan_tu_khach_so_tien$%s_~n~cho_don_hang.", FormatNumber(amount));
				}
			}
		}
    }
    return 1;
}
hook OnPlayerUpdate(playerid) {
	if(IsPlayerFishing(playerid) && !IsPlayerCatching(playerid)) {
		new Float:NewPos[3];
		GetPlayerPos(playerid, NewPos[0], NewPos[1], NewPos[2]);
		if(LastPos[playerid][0] != NewPos[0] || LastPos[playerid][1] != NewPos[1] || LastPos[playerid][2] != NewPos[2]) {
			StopPlayerFishing(playerid), va_SendClientMessage(playerid, X11_MISTY_ROSE_1, "Neu ban chuyen dong ca se so ban. Hay thu cau ca lai ma khong di chuyen.");
		}
	}
    return 1;
}
hook OnPlayerDisconnect(playerid, reason) {
	if(JobWorking[playerid] != 0) StopWork(playerid);
 	foreach(new i : Player) {
		if(RepairPrice[i][playerid] != 0) RepairPrice[i][playerid] = 0;
		if(RepairPrice[playerid][i] != 0) RepairPrice[playerid][i] = 0;

		if(RefillPrice[i][playerid] != 0) RefillPrice[i][playerid] = 0;
		if(RefillPrice[playerid][i] != 0) RefillPrice[playerid][i] = 0;
		if(SellGunPice[i][playerid] != 0) {
			SellGunPice[i][playerid] = 0;
			SellGunWeapon[i][playerid] = 0;
			SellGunAmmo[i][playerid] = 0;
			SellGunMats[i][playerid] = 0;
		}
		if(SellGunPice[playerid][i] != 0) {
			SellGunPice[playerid][i] = 0;
			SellGunWeapon[playerid][i] = 0;
			SellGunAmmo[playerid][i] = 0;
			SellGunMats[playerid][i] = 0;
		}
		if(SellDrugsPrice[i][playerid] != 0) {
			SellDrugsPrice[i][playerid] = 0;
			SellDrugsAmount[i][playerid] = 0;
		}
		if(SellDrugsPrice[playerid][i] != 0) {
			SellDrugsPrice[playerid][i] = 0;
			SellDrugsAmount[playerid][i] = 0;
		}
		if(SellMatsPrice[i][playerid] != 0) {
			SellMatsPrice[i][playerid] = 0;
			SellMatsAmount[i][playerid] = 0;
		}
		if(SellMatsPrice[playerid][i] != 0) {
			SellMatsPrice[playerid][i] = 0;
			SellMatsAmount[playerid][i] = 0;
		}
 	}
    return 1;
}
function LoadJobs() {
	new results = cache_num_rows(), jobs = 0;
	if(results > 0) {
		for(new i = 0; i < results; i++) {
		    new  x = 0, string[256];
		    cache_get_value_int(i, "ID", x);
			if(x > 0) {
				jobs ++;
				
		    	cache_get_value_name(i, "Name", JobInfo[x][jName], 128);
				cache_get_value_name_float(i, "PosX", JobInfo[x][jPosX]);
				cache_get_value_name_float(i, "PosY", JobInfo[x][jPosY]);
				cache_get_value_name_float(i, "PosZ", JobInfo[x][jPosZ]);
				format(string, 256, ""WHITE"ID: {4ca2a9}%d\n"WHITE"Cong viec: {4ca2a9}%s{FFFFFF}\nSu dung {4ca2a9}/getjob{FFFFFF} de nhan viec", x, JobInfo[x][jName]);
				JobInfo[x][jLabel] = CreateDynamic3DTextLabel(string, 0xFFFFFFAA, JobInfo[x][jPosX], JobInfo[x][jPosY], JobInfo[x][jPosZ], 25, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, -1, -1, -1, 100.0);
				JobInfo[x][jPickup] = CreateDynamicPickup(1275, 23, JobInfo[x][jPosX], JobInfo[x][jPosY], JobInfo[x][jPosZ], -1, -1, -1, 100.0);
			}
		}
	}
	if(jobs > 0) printf("[JOB] %d jobs loaded.",jobs);
	return 1;
}
CMD:jobs(playerid, params[]) {
	new szDialog[1024], szDialog2[1024], szTitle[32], xx;
	for(new j = 0; j < MAX_JOBS; j++) {
		if(strlen(JobInfo[j][jName]) >= 1) {
			if(xx == 0) format(szDialog, 1024, "Ten\n%d.%s\n",j, JobInfo[j][jName]);
			else format(szDialog, 1024, "%d.%s\n",j, JobInfo[j][jName]);
			strcat(szDialog2, szDialog);
			xx++;
		}
	}
	format(szTitle, 32, ""WHITE"Tong so cong viec: %d", xx);
	Dialog_Show(playerid, DIALOG_JOBS, DIALOG_STYLE_TABLIST_HEADERS,  szTitle, szDialog2, #Select, #Cancel);
	return 1;
}
// CMD:getjob(playerid, params[]) {
// 	new job = 0;
// 	if(PlayerInfo[playerid][pJob] != 0) return Info(playerid, "Ban da co mot cong viec khac. Hay /quitjob de bo cong viec do.");
// 	for(new j = 1; j < MAX_JOBS; j++) {
// 		if(IsPlayerInRangeOfPoint(playerid,3.0, JobInfo[j][jPosX], JobInfo[j][jPosY], JobInfo[j][jPosZ])) {
// 		    if(PlayerInfo[playerid][pTutorial] == 2) {
// 		        if(j != 4) return Info(playerid, "Ban khong the nhan cong viec nay vi ban chua hoan thanh huong dan tan thu.");
// 		    }
// 			va_SendClientMessage(playerid, RED2S, "Xin chuc mung. Cong viec moi cua ban la %s", JobInfo[j][jName]);
// 			switch(j) {
// 			    case 1: va_SendClientMessage(playerid, RED2S, "Lenh cong viec %s:"WHITE" /find.", JobInfo[j][jName]);
// 			    case 4: {
// 			    	va_SendClientMessage(playerid, RED2S, "Lenh cong viec %s:"WHITE" /fish.", JobInfo[j][jName]);
// 		    	 	if(PlayerInfo[playerid][pTutorial] == 2) SendClientMessage(playerid, RED2S, "Su dung /fish de bat dau cau ca, sau khi cau duoc ca hay dem ban no o 24/7.");
// 				} 
// 				case 2,3,5,6,7, 12: va_SendClientMessage(playerid, RED2S, "Lenh cong viec %s:"WHITE" /work /stopwork.", JobInfo[j][jName]);
// 				case 8: va_SendClientMessage(playerid, RED2S, "Lenh cong viec %s:"WHITE" /pizza /stopwork.", JobInfo[j][jName]);
// 				case 9: va_SendClientMessage(playerid, RED2S, "Lenh cong viec %s:"WHITE" /getmats /sellmats /sellgun /creategun.", JobInfo[j][jName]);
// 				case 10: va_SendClientMessage(playerid, RED2S, "Lenh cong viec %s:"WHITE" /work /selldrugs.", JobInfo[j][jName]);
// 				case 11: va_SendClientMessage(playerid, RED2S, "Lenh cong viec %s:"WHITE" /repair /refill /tow /starwork.", JobInfo[j][jName]);
// 			}
// 			GiveAchievement(playerid, 1, "Nhan mot cong viec");
// 			PlayerInfo[playerid][pJob] = j;
// 			job = 1;
// 		}
// 	}
// 	if(job == 0) return SendClientMessage(playerid, COLOR_YELLOW2, "Ban khong o dia diem nhan viec.");
// 	return 1;
// }
CMD:quitjob(playerid, params[]) {
	if(PlayerInfo[playerid][pJob] == 0) return SendClientMessage(playerid, COLOR_ERROR, "You don't have a job.");
	if(JobWorking[playerid] != 0) StopWork(playerid);
	SendClientMessage(playerid, COLOR_WHITE, "{C90000}[INFO]: {FFFFFF}Ban da nghi viec, bay gio ban dang {FF0000}that nghiep{FFFFFF}.");
	PlayerInfo[playerid][pJob] = 0;
	return 1;
}
CMD:fish(playerid, params[]) {
	if(PlayerInfo[playerid][pJob] != 4) return Info(playerid, "Ban khong phai la Fisherman.");
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_WHITE, "Ban khong the su dung lenh nay khi o tren xe");
	if(VaildFishPlace(playerid) && !IsPlayerInAnyVehicle(playerid)) {
		//if(PlayerInfo[playerid][pFishPrice] > 0) return Info(playerid,"Hay den cua hang 24/7 de ban con ca ma ban vua cau duoc.");
		if(Bit_Get(player_is_fishing, playerid)) return Info(playerid,"You are already fishing.");

		StartPlayerFishing(playerid);
	}
	else return SendClientMessage(playerid, COLOR_WHITE, "Ban khong o diem cau ca. [/jobs > Cau ca]");
	return 1;
}
CMD:tow(playerid, params[]) {	
	if(PlayerInfo[playerid][pJob] != 11) return va_SendClientMessage(playerid, X11_SPRING_GREEN, "[INFO]:"WHITE" Cong viec cua ban khong phai la 'Mechanic'.");
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, X11_SPRING_GREEN, "[INFO]:"WHITE" Ban can phai lai xe de su dung lenh nay.");
	if(GetVehicleModel(GetPlayerVehicleID(playerid)) != 525) return SendClientMessage(playerid, X11_SPRING_GREEN, "[INFO]:"WHITE" Ban phai o trong mot chiec xe voi model tuong thich de su dung lenh nay");
 	if(TowAcc[playerid] == 1) return SendClientMessage(playerid, X11_SPRING_GREEN, "[INFO]:"WHITE" Ban khong the keo xe qua nhanh, hay thu lai sau 2 phut.");

	new Float:pX,Float:pY,Float:pZ, Float:vX,Float:vY,Float:vZ, Found=0, vid=0;
	GetPlayerPos(playerid,pX,pY,pZ);
	while((vid<MAX_VEHICLES)&&(!Found)) {
		vid++;
		GetVehiclePos(vid,vX,vY,vZ);
		if((floatabs(pX-vX)<7.0)&&(floatabs(pY-vY)<7.0)&&(floatabs(pZ-vZ)<7.0)&&(vid!=GetPlayerVehicleID(playerid))) {
			if(Vehicle_IsBike(vid) || GetVehicleModel(vid) == 448 || GetVehicleModel(vid) == 461 || GetVehicleModel(vid) == 462 || GetVehicleModel(vid) == 463 || GetVehicleModel(vid) == 468 || GetVehicleModel(vid) == 471 || GetVehicleModel(vid) == 521 || GetVehicleModel(vid) == 522 || GetVehicleModel(vid) == 523 || vehicleVariables[vid][vFaction] != 0) {
				SendClientMessage(playerid,X11_SPRING_GREEN,"[INFO]: "WHITE"Ban khong the keo chiec xe nay.");
    			return 1;
			}
			Found=1;
  			if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid))) {
    			DetachTrailerFromVehicle(GetPlayerVehicleID(playerid));
   				DisablePlayerCheckpoint(playerid);
       			PlayerInfo[playerid][pCP] = 0;
    		}
     		else {
				AttachTrailerToVehicle(vid,GetPlayerVehicleID(playerid));
				new randx = random(sizeof(TowCarCk));
    			SetPlayerCheckpoint(playerid, TowCarCk[randx][0],TowCarCk[randx][1],TowCarCk[randx][2], 6);
    			PlayerInfo[playerid][pCP] = 14;
    			CKTIMES[playerid] = 15;
			}
		}

	}
	if(!Found) return SendClientMessage(playerid,X11_SPRING_GREEN, "[INFO]: Khong co xe xung quanh ban de keo.");
	return 1;
}
CMD:startwork(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, X11_SPRING_GREEN, "[ERROR]: "WHITE"Ban can phai ra khoi xe!");
	if(UseFind[playerid] == 1) return SendClientMessage(playerid, X11_SPRING_GREEN,"[ERROR]: "WHITE"Ban khong the lam viec khi dang tim kiem ai do.");
	if(JobWorking[playerid] != 0) return SendClientMessage(playerid, X11_SPRING_GREEN,"[ERROR]: "WHITE"Ban dang lam viec.");
	if(jobdeally[playerid] != 0) return va_SendClientMessage(playerid, RED2S,"Ban co the su dung '/work' lan nua sau %d giay.", jobdeally[playerid]);
	if(PlayerInfo[playerid][pCP] != 0) return SendClientMessage(playerid, COLOR_GOLD, "Ban da co mot checkpoint dang hoat dong. Su dung '/killcp' de xoa muc tieu.");
	switch (PlayerInfo[playerid][pJob]) {
	    case 2: {
	    	if(IsPlayerInRangeOfPoint(playerid, 5.0, -1080.3639,-1195.3372,129.6956)) {
				FarmerTreeApples[playerid] = 0, FarmerTreeTaken[playerid] = -1, FarmerTimer[playerid] = 120, Info(playerid, "Di vao vuon cay de thu hoach.");
				SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY), SetPlayerAttachedObject(playerid, ATTACHMENT_ID_BALE,19639,1,-0.00,0.50,-0.03,0.0,86.0,83.0,1.00,1.00,1.00);
				JobWorking[playerid] = 2, jobdeally[playerid] = 60;
			}
			else return PlayerInfo[playerid][pCP] = 1, SendClientMessage(playerid, -1,""RED"[ERROR]: "WHITE"Ban khong o noi ban co the bat dau cong viec. Hay den "RED"checkpoint"WHITE" tren ban do."), SetPlayerCheckpoint(playerid, -1080.3639,-1195.3372,129.6956, 5.0);
	    }
		case 3: {
			if(IsPlayerInRangeOfPoint(playerid, 5.0, 1981.6396,-1991.1749,13.5469)) {
 				if(PlayerInfo[playerid][pDrivingLic] < 0) return SendClientMessage(playerid, X11_SPRING_GREEN, "[INFO]: "WHITE"Ban can co giay phep lai xe de lam cong viec nay.");
				new engine,lights,alarm,doors,bonnet,boot,objective;
				PlayerInfo[playerid][pJobVehicle] = CreateVehicle(574 , 1981.6396,-1991.1749,13.5469,90.000, 1, 1, -1);
	 			Fuel[PlayerInfo[playerid][pJobVehicle]] = 100, PutPlayerInVehicle(playerid, PlayerInfo[playerid][pJobVehicle], 0);
				GetVehicleParamsEx(PlayerInfo[playerid][pJobVehicle], engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(PlayerInfo[playerid][pJobVehicle],VEHICLE_PARAMS_ON,VEHICLE_PARAMS_OFF,alarm,doors,bonnet,boot,objective);
	 			JobWorking[playerid] = 3, JobClear[playerid] = 0, JobClearSet[playerid] = 20 + random(20);
		 		Job_StreetSweeperSpawnGarbage(playerid), Info(playerid, "Ban can phai don sach rac o cac diem duoc danh dau tren mini-map de nhan luong."), jobdeally[playerid] = 60;
			}
			else return PlayerInfo[playerid][pCP] = 1, SendClientMessage(playerid, -1,""RED"[ERROR]: "WHITE"Ban khong o noi ban co the bat dau cong viec. Hay den "RED"checkpoint"WHITE" tren ban do."), SetPlayerCheckpoint(playerid, 1981.6396,-1991.1749,13.5469, 5.0);
		}
 		case 5: {
 			if(IsPlayerInRangeOfPoint(playerid, 2.0, 2182.9495,-1364.9711,25.8293)) {
    			if(PlayerInfo[playerid][pDrivingLic] <= 0) {
					new mere = random(5)+2, apa = random(3)+2;
    				sendLongMessage(playerid, -1, ""RED"[NPC: LAO NONG DAN]:"WHITE" Thinh thoang, khong ai giup cho toi di mua sam o shop. Cau co the giup chung toi khong?");
					va_sendLongMessage(playerid, -1, ""RED"[NPC: LAO NONG DAN]:"WHITE" Chung toi can %d kg tao va %d chai nuoc. (cau co the mua no o 24/7)", mere, apa);
    				PlayerInfo[playerid][pLista] = 1, PlayerInfo[playerid][pMereLita] = mere, PlayerInfo[playerid][pMere] = 0, PlayerInfo[playerid][pApaLista] = apa, PlayerInfo[playerid][pApa] = 0;
    			} else {
    				switch(random(2)) {
    				    case 0: {
    				    	PlayerInfo[playerid][pJobStep] = 3, sendLongMessage(playerid, -1, ""RED"[NPC: ONG LAO]:"WHITE" Xe cua chung toi da bi hong vao hom qua. Toi khong the sua no, lam on, hay sua giup chung toi. (den "RED"Pay N Spray"WHITE" va sua xe giup ong lao)");
       						PlayerInfo[playerid][pJobVehicle] = CreateVehicle(543 , 2214.7407,-1357.5941,23.8041,181.5744, 1, 1, -1), Fuel[PlayerInfo[playerid][pJobVehicle]] = 100,PutPlayerInVehicle(playerid, PlayerInfo[playerid][pJobVehicle], 0);
	            			UpdateVehicleDamageStatus(PlayerInfo[playerid][pJobVehicle], 36896818, 33686019, 5, 0), SetVehicleHealth(PlayerInfo[playerid][pJobVehicle], 618.47);
   							new engine,lights,alarm,doors,bonnet,boot,objective;
							GetVehicleParamsEx(PlayerInfo[playerid][pJobVehicle], engine, lights, alarm, doors, bonnet, boot, objective);
							SetVehicleParamsEx(PlayerInfo[playerid][pJobVehicle],VEHICLE_PARAMS_OFF,VEHICLE_PARAMS_OFF,alarm,doors,bonnet,boot,objective);
    				    }
    				    case 1: {
  							new mere = random(5)+2, apa = random(3)+2;
    						sendLongMessage(playerid, -1, ""RED"[NPC: LAO NONG DAN]:"WHITE" Thinh thoang, khong ai giup cho toi di mua sam o shop. Cau co the giup chung toi khong?");
							va_sendLongMessage(playerid, -1, ""RED"[NPC: LAO NONG DAN]:"WHITE" Chung toi can %d kg tao va %d chai nuoc. (cau co the mua no o 24/7)", mere, apa);
    						PlayerInfo[playerid][pLista] = 1, PlayerInfo[playerid][pMereLita] = mere, PlayerInfo[playerid][pMere] = 0, PlayerInfo[playerid][pApaLista] = apa, PlayerInfo[playerid][pApa] = 0;
    				    }
    				}
    			}
				JobWorking[playerid] = 5, jobdeally[playerid] = 60;
   			}
     		else return PlayerInfo[playerid][pCP] = 1, SendClientMessage(playerid, -1,""RED"[ERROR]: "WHITE"Ban khong o noi ban co the bat dau cong viec. Hay den "RED"checkpoint"WHITE" tren ban do."), SetPlayerCheckpoint(playerid, 2182.9495,-1364.9711,25.8293, 2.0);
		}
 		case 6: {
 			if(IsPlayerInRangeOfPoint(playerid, 10.0, -368.8581,-1426.9391,25.7266)) {
 				if(PlayerInfo[playerid][pDrivingLic] <= 0) return SendClientMessage(playerid, X11_SPRING_GREEN, "[INFO]: "WHITE"Ban can co giay phep lai xe de lam cong viec nay.");
				new Float: Pos[3], engine,lights,alarm,doors,bonnet,boot,objective;
				GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
				PlayerInfo[playerid][pJobVehicle] = CreateVehicle(532 , Pos[0], Pos[1], Pos[2], 2.0 , -1, -1, -1), Fuel[PlayerInfo[playerid][pJobVehicle]] = 100,PutPlayerInVehicle(playerid, PlayerInfo[playerid][pJobVehicle], 0);
				GetVehicleParamsEx(PlayerInfo[playerid][pJobVehicle], engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(PlayerInfo[playerid][pJobVehicle],VEHICLE_PARAMS_ON,VEHICLE_PARAMS_OFF,alarm,doors,bonnet,boot,objective);
				JobWorking[playerid] = 6;
				PlayerInfo[playerid][pJobStep] = 1;
				PlayerInfo[playerid][c_Job_Farm_Timer] = repeat Timer_Farming[1000](playerid, PlayerInfo[playerid][pJobVehicle]);
				Info(playerid, "Ban can phai den canh dong de thu hoach giup cho nhung nguoi nong dan.");
				jobdeally[playerid] = 60;
  			}
  			else return PlayerInfo[playerid][pCP] = 1, SendClientMessage(playerid, -1,""RED"[ERROR]: "WHITE"Ban khong o noi ban co the bat dau cong viec. Hay den "RED"checkpoint"WHITE" tren ban do."), SetPlayerCheckpoint(playerid, -368.8581,-1426.9391,25.7266, 10.0);

		}
 		case 7: {
 			if(IsPlayerInRangeOfPoint(playerid, 10.0, -208.2688,-234.8615,1.4219)) {
 				if(PlayerInfo[playerid][pDrivingLic] < 0) return SendClientMessage(playerid, X11_SPRING_GREEN, "[INFO]: "WHITE"Ban can co giay phep lai xe de lam cong viec nay.");
				new Float: Pos[3], engine,lights,alarm,doors,bonnet,boot,objective, rot[2048];
				GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
				PlayerInfo[playerid][pJobVehicle] = CreateVehicle((PlayerInfo[playerid][pTrcukSkill] < 3) ? (515) : (514), Pos[0], Pos[1], Pos[2], 90 , -1, -1, -1);
				Fuel[PlayerInfo[playerid][pJobVehicle]] = 100,PutPlayerInVehicle(playerid, PlayerInfo[playerid][pJobVehicle], 0), JobWorking[playerid] = 7, jobdeally[playerid] = 60;
				GetVehicleParamsEx(PlayerInfo[playerid][pJobVehicle], engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(PlayerInfo[playerid][pJobVehicle],VEHICLE_PARAMS_OFF,VEHICLE_PARAMS_OFF,alarm,doors,bonnet,boot,objective);
				format(rot, 2048, "Khoang cach\tSkill\tTien cong\n");
				for(new i = 0; i < TruckerRoutes; i++) {
					new Float:dist = GetPlayerDistanceFromPoint(playerid, TruckerRoute[i][tPOS][0], TruckerRoute[i][tPOS][1],TruckerRoute[i][tPOS][2])/1000.0;
					format(rot, 2048, "%s%0.2fkm\t%d\t$%s-$%s\n",rot, dist, TruckerRoute[i][tSkill], FormatNumber(TruckerRoute[i][tEarnings][0]), FormatNumber(TruckerRoute[i][tEarnings][1]));
				}
				Dialog_Show(playerid, DIALOG_TRUCK, DIALOG_STYLE_TABLIST_HEADERS,  "Chon diem den:", rot, #Select, #Cancel);
  			}
   			else return PlayerInfo[playerid][pCP] = 1, SendClientMessage(playerid, -1,""RED"[ERROR]: "WHITE"Ban khong o noi ban co the bat dau cong viec. Hay den "RED"checkpoint"WHITE" tren ban do."), SetPlayerCheckpoint(playerid, -208.2688,-234.8615,1.4219, 10.0);
	   	}
	   	case 10: {
	   		if(IsPlayerInRangeOfPoint(playerid, 2.0, 1761.1273,-2137.6575,13.5469)) {
	    		SendClientMessage(playerid, COLOR_GRAD1, ""SYN"[KE BUON LAU]:"WHITE" Hay vao vuon va lay thuoc nhanh, tao khong co thoi gian de doi may dau."), SetPlayerCheckpoint(playerid, 1765.0531,-2154.0515,13.5478, 2.0);
				PlayerInfo[playerid][pCP] = 16, JobWorking[playerid] = 10, jobdeally[playerid] = 60;
	   		}
	   		else return PlayerInfo[playerid][pCP] = 1, SendClientMessage(playerid, -1,""RED"[ERROR]: "WHITE"Ban khong o noi ban co the bat dau cong viec. Hay den "RED"checkpoint"WHITE" tren ban do."), SetPlayerCheckpoint(playerid, 1761.1273,-2137.6575,13.5469, 5.0);
	   	}
	   	case 11: {
			if(MechanicWorkAt[playerid] != -1) return Info(playerid, "Ban da duoc giao mot nhiem vu");
			new near = -1;
			for(new i = 0; i < sizeof(MechanicCar); i++)
			{
				new Float:x,Float:y,Float:z;
				GetObjectPos(MechanicCar[i], x, y, z);
				if(IsPlayerInRangeOfPoint(playerid, 5.0, x,y,z))
				{
					near = i;
					break;
				}
			}
			if(near == -1) return Info(playerid, "Den mot garage ben canh mot chiec xe duoc che tao, sau do su dung /work.");
			if(MechanicCarDone[near] >= 100) return Info(playerid, "Chiec xe da hoan tat!");
			for(new i = near * 4; i < (near * 4) + 4; i ++)
			{
				if(MechanicWheelObj[i] == -1)
				{
					new player_already_work = -1;
					foreach(new x: Character)
					{
						if(PlayerInfo[x][pStatus] > 0)
						{
							if(MechanicWorkAt[x] == i)
							{
								player_already_work = x;
								break;
							}
						}
					}
					if(player_already_work == -1)
					{

						MechanicTime[playerid] = 30;
						MechanicWorkAt[playerid] = i;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Ban da duoc giao nhiem vu gan banh xe");
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Den cai ban dang kia, voi nhung dung cu va lay cong cu ma ban can");
						return 1;
					}
				}
			}
			if(MechanicGlassObj[near] == -1)
			{
				new player_already_work = -1;
				foreach(new x: Character)
				{
					if(PlayerInfo[x][pStatus] > 0)
					{
						if(MechanicWorkAt[x] == near + (sizeof(MechanicCar) * 4))
						{
							player_already_work = x;
							break;
						}
					}
				}
				if(player_already_work == -1)
				{

					MechanicTime[playerid] = 25;
					MechanicWorkAt[playerid] = near + (sizeof(MechanicCar) * 4);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Ban da duoc giao nhiem vu lap kinh chan gio");
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Den cai ban dang kia, voi nhung dung cu va lay cong cu ma ban can");
					return 1;
				}
			}
			if(MechanicEngineObj[near] == -1)
			{
				new player_already_work = -1;
				foreach(new x: Character)
				{
					if(PlayerInfo[x][pStatus] > 0)
					{
						if(MechanicWorkAt[x] == near + (sizeof(MechanicCar) * 4)+sizeof(MechanicCar))
						{
							player_already_work = x;
							break;
						}
					}
				}
				if(player_already_work == -1)
				{

					MechanicTime[playerid] = 25;
					MechanicWorkAt[playerid] = near + (sizeof(MechanicCar) * 4)+sizeof(MechanicCar);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Ban da duoc giao nhiem vu lap dong co");
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Den cai ban dang kia, voi nhung dung cu va lay cong cu ma ban can");
					return 1;
				}
			}
			if(MechanicLightObj[near] == -1)
			{
				new player_already_work = -1;
				foreach(new x: Character)
				{
					if(PlayerInfo[x][pStatus] > 0)
					{
						if(MechanicWorkAt[x] == near + (sizeof(MechanicCar) * 4)+(sizeof(MechanicCar) * 2))
						{
							player_already_work = x;
							break;
						}
					}
				}
				if(player_already_work == -1)
				{

					MechanicTime[playerid] = 25;
					MechanicWorkAt[playerid] = near + (sizeof(MechanicCar) * 4)+(sizeof(MechanicCar) * 2);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Ban da duoc giao nhiem vu lap den chieu hau");
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Den cai ban dang kia, voi nhung dung cu va lay cong cu ma ban can");
					return 1;
				}
			}
			if(MechanicRearObj[near] == -1)
			{
				new player_already_work = -1;
				foreach(new x: Character)
				{
					if(PlayerInfo[x][pStatus] > 0)
					{
						if(MechanicWorkAt[x] == near + (sizeof(MechanicCar) * 4)+(sizeof(MechanicCar) * 3))
						{
							player_already_work = x;
							break;
						}
					}
				}
				if(player_already_work == -1)
				{

					MechanicTime[playerid] = 25;
					MechanicWorkAt[playerid] = near + (sizeof(MechanicCar) * 4)+(sizeof(MechanicCar) * 3);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Ban da duoc giao nhiem vu lap spoiler");
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Den cai ban dang kia, voi nhung dung cu va lay cong cu ma ban can");
					return 1;
				}
			}
			if(MechanicExhaustObj[near] == -1)
			{
				new player_already_work = -1;
				foreach(new x: Character)
				{
					if(PlayerInfo[x][pStatus] > 0)
					{
						if(MechanicWorkAt[x] == near + (sizeof(MechanicCar) * 4)+(sizeof(MechanicCar) * 4))
						{
							player_already_work = x;
							break;
						}
					}
				}
				if(player_already_work == -1)
				{

					MechanicTime[playerid] = 25;
					MechanicWorkAt[playerid] = near + (sizeof(MechanicCar) * 4)+(sizeof(MechanicCar) * 4);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Ban da duoc giao nhiem vu lap ong xa khoi");
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Den cai ban dang kia, voi nhung dung cu va lay cong cu ma ban can");
					return 1;
				}
			}
			if(MechanicSeatObj[near] == -1)
			{
				new player_already_work = -1;
				foreach(new x: Character)
				{
					if(PlayerInfo[x][pStatus] > 0)
					{
						if(MechanicWorkAt[x] == near + (sizeof(MechanicCar) * 4)+(sizeof(MechanicCar) * 5))
						{
							player_already_work = x;
							break;
						}
					}
				}
				if(player_already_work == -1)
				{

					MechanicTime[playerid] = 25;
					MechanicWorkAt[playerid] = near + (sizeof(MechanicCar) * 4)+(sizeof(MechanicCar) * 5);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Ban da duoc giao nhiem vu lap ghe truoc cho xe");
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Den cai ban dang kia, voi nhung dung cu va lay cong cu ma ban can");
					return 1;
				}
			}
			if(MechanicSpoilerObj[near] == -1)
			{
				new player_already_work = -1;
				foreach(new x: Character)
				{
					if(PlayerInfo[x][pStatus] > 0)
					{
						if(MechanicWorkAt[x] == near + (sizeof(MechanicCar) * 4)+(sizeof(MechanicCar) * 6))
						{
							player_already_work = x;
							break;
						}
					}
				}
				if(player_already_work == -1)
				{

					MechanicTime[playerid] = 25;
					MechanicWorkAt[playerid] = near + (sizeof(MechanicCar) * 4)+(sizeof(MechanicCar) * 6);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Ban da duoc giao nhiem vu lap tay ga");
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Den cai ban dang kia, voi nhung dung cu va lay cong cu ma ban can");
					return 1;
				}
			}
			for(new i = 0; i < 4; i++)
			{
				if(MechanicCarColor[near][i] == -1)
				{
					new color = i+1;
					new player_already_work = -1;
					foreach(new x: Character)
					{
						if(PlayerInfo[x][pStatus] > 0)
						{
							if(MechanicWorkAt[x] == near+999 && MechanicColorNumber[x] == color)
							{
								player_already_work = x;
								break;
							}
						}
					}
					if(player_already_work == -1)
					{

						MechanicTime[playerid] = 25;
						MechanicWorkAt[playerid] = near + 999;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Ban da duoc giao nhiem vu son xe");
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Den cai ban dang kia, voi nhung dung cu va lay cong cu ma ban can");
						MechanicColorNumber[playerid] = color;
						return 1;
					}
				}
			}
			Info(playerid, "Nu a fost gasita o sarcina pentru tine, incearca la un alt vehicul sau mai tarziu.");
			return 1;
		}
	   	case 12: {
	   		if(IsPlayerInRangeOfPoint(playerid, 5.0, JobInfo[12][jPosX], JobInfo[12][jPosY], JobInfo[12][jPosZ])) {
	  			SetPlayerPos(playerid, 378.3134,-115.0533,1001.4922), SetPlayerInterior(playerid, 5), SetPlayerVirtualWorld(playerid,playerid+10), PlayerInfo[playerid][pJobStep] = 1;
	  			Info(playerid, "Giao thuc an cho cac khach hang da dat bang cach bam F hoac Enter"), JobWorking[playerid] = 12, jobdeally[playerid] = 60;
				for(new x = 0; x < 15; x++) {
					PlayerInfo[playerid][pActorHungry][x] = 1, PlayerInfo[playerid][pActorTimer][x] = -1;
					PlayerInfo[playerid][pWaiterActors][x] = CreateActor(random(300), WaiterActorsPOS[x][0], WaiterActorsPOS[x][1], WaiterActorsPOS[x][2], WaiterActorsPOS[x][3]);
					SetActorVirtualWorld(PlayerInfo[playerid][pWaiterActors][x], playerid+ 10);
					ApplyActorAnimation(PlayerInfo[playerid][pWaiterActors][x], "FOOD", "FF_Sit_Look", 3.1, 1, 0, 0, 1, 0);
					PlayerInfo[playerid][pWaiterLabel][x] = CreateDynamic3DTextLabel("{B52231}Doi bung", -1, WaiterActorsPOS[x][0], WaiterActorsPOS[x][1], WaiterActorsPOS[x][2]+0.5, 50.0, .playerid = playerid);
				}
			}
			else return PlayerInfo[playerid][pCP] = 1, SendClientMessage(playerid, -1,""RED"[ERROR]: "WHITE"Ban khong o noi ban co the bat dau cong viec. Hay den "RED"checkpoint"WHITE" tren ban do."), SetPlayerCheckpoint(playerid, JobInfo[12][jPosX], JobInfo[12][jPosY], JobInfo[12][jPosZ], 5.0);
	   	}
	   	default: SendClientMessage(playerid, COLOR_ERROR,"Cong viec cua ban khong ho tro lenh nay.");
   	}
	return 1;
}
CMD:stopwork(playerid, params[]) {
	if(JobWorking[playerid] == 0) return SendClientMessage(playerid, -1, "Ban khong lam viec!");
	StopWork(playerid);
	SendClientMessage(playerid, X11_SPRING_GREEN,"[SERVER]:"WHITE" Bay gio ban khong con lam viec nua.");
	return 1;
}
CMD:find(playerid, params[]) {	
	new giveplayerid, splayer[25];
	if(PlayerInfo[playerid][pJob] != 1 && !IsACop(playerid)) return SendClientMessage(playerid, COLOR_ERROR, "Ban khong phai la Tham tu.");
	if(sscanf(params,"s[25]", splayer)) return SendClientMessage(playerid, X11_SPRING_GREEN,"Su dung:{FFFFFF} /find <Player ID/Name>");
    if(GetPlayers(splayer) == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_ERROR, "ID/Username khong hop le.");
	else if(GetPlayers(splayer) == 1000) return SendClientMessage(playerid, COLOR_ERROR, "Co qua nhieu ket qua cho tim kiem nay.");
	else if(GetPlayers(splayer) == 1001) return ShowResults(playerid, splayer);
	else giveplayerid = GetPlayers(splayer);
	if(giveplayerid == playerid) return SendClientMessage(playerid, COLOR_ERROR, ""RED"[ERROR]: "WHITE"Ban khong the lam dieu nay.");
	UseFind[playerid] = 1;
	stop FindTimer[playerid];
	FindTimer[playerid] = repeat Find[1000](playerid, giveplayerid);

	va_SendClientMessage(playerid, X11_MISTY_ROSE_1, "Checkpoint da duoc dat tai nguoi choi %s. Khoang cach: %.0f.", GetName(giveplayerid),GetDistanceBetweenPlayers(playerid, giveplayerid));
	return 1;
}
timer Find[1000](playerid, findid) {
	if(UseFind[playerid] == 1) {
		new Float:X,Float:Y,Float:Z;

		new lock[256];
		if(IsPlayerInArea(findid, -2997.40, -1115.50, -1213.90, 1659.60)) {lock = "SF"; }
		else if(IsPlayerInArea(findid, 44.60, -2892.90, 2997.00, -768.00)) {lock = "LS"; }
		else if(IsPlayerInArea(findid, 869.40, 596.30, 2997.00, 2993.80)) {lock = "LV"; }

		if(!IsPlayerConnected(findid)) {
			PlayerInfo[playerid][pCP] = 0;
			DisablePlayerRaceCheckpoint(playerid);
			stop FindTimer[playerid];
			UseFind[playerid] = 0;
			return 1;
		}
		if(BizzEntered[findid] != 0) {
			new i = BizzEntered[findid];
			DisablePlayerRaceCheckpoint(playerid);
			SetPlayerRaceCheckpoint(playerid, 2, BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ], BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ], 3.0);
		}
		else if(HouseEntered[findid] != 0) {
			new i = HouseEntered[findid];
			DisablePlayerRaceCheckpoint(playerid);
			SetPlayerRaceCheckpoint(playerid, 2, HouseInfo[i][hEntranceX], HouseInfo[i][hEntranceY], HouseInfo[i][hEntranceZ],HouseInfo[i][hEntranceX], HouseInfo[i][hEntranceY], HouseInfo[i][hEntranceZ], 3.0);
		}
		else if(PlayerInfo[findid][pHQEnter] != 0) {
			new i = PlayerInfo[findid][pHQEnter];
			DisablePlayerRaceCheckpoint(playerid);
			SetPlayerRaceCheckpoint(playerid, 2, FactionInfo[i][fEntranceX], FactionInfo[i][fEntranceY], FactionInfo[i][fEntranceZ],FactionInfo[i][fEntranceX], FactionInfo[i][fEntranceY], FactionInfo[i][fEntranceZ], 3.0);
		}
		else {
			GetPlayerPos(findid, X,Y,Z);
			DisablePlayerRaceCheckpoint(playerid);
			SetPlayerRaceCheckpoint(playerid, 2, X, Y, Z, X, Y, Z, 3.0);
		}
	}
	else {
		stop FindTimer[playerid];
		UseFind[playerid] = 0;
		PlayerInfo[playerid][pCP] = 0;
		DisablePlayerRaceCheckpoint(playerid);
		return 1;
	}
	return 1;
}
IsPlayerInArea(playerid, Float:minx, Float:miny, Float:maxx, Float:maxy) {
   new Float:x, Float:y, Float:z;
   GetPlayerPos(playerid, x, y, z);
   if(x > minx && x < maxx && y > miny && y < maxy) return 1;
   return 0;
}
CMD:refill(playerid, params[]) {	
	if(PlayerInfo[playerid][pJob] != 11) return va_SendClientMessage(playerid, X11_SPRING_GREEN, "[INFO]:"WHITE" Cong viec cua ban khong phai la 'Mechanic'.");
	new giveplayerid, splayer[25], price;
	if(sscanf(params,"s[25]i", splayer,price)) return SendClientMessage(playerid, X11_SPRING_GREEN, "Su dung:{FFFFFF} /refill <Player ID/Name> <price>");
	{
	    if(GetPlayers(splayer) == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_ERROR, "ID/Username khong hop le.");
		else if(GetPlayers(splayer) == 1000) return SendClientMessage(playerid, COLOR_ERROR, "Co qua nhieu ket qua cho tim kiem nay.");
		else if(GetPlayers(splayer) == 1001) return ShowResults(playerid, splayer);
		else giveplayerid = GetPlayers(splayer);
		if(giveplayerid == playerid) return SendClientMessage(playerid, COLOR_ERROR, "You cannot refill yourself.");
		if(!ProxDetectorS(5.0, playerid, giveplayerid)) return SendClientMessage(playerid, COLOR_ERROR, "Nguoi choi khong o gan ban.");
		if(!IsPlayerInAnyVehicle(giveplayerid)) return SendClientMessage(playerid, COLOR_ERROR, "Nguoi choi do phai o tren xe.");
		if(MoneyACheck(playerid, price, 1, 10000)) return 1;
		if(RefillPrice[giveplayerid][playerid] > 0) return SendClientMessage(playerid, COLOR_ERROR,"Ban da gui offer do xang cho phuong tien nguoi nay.");
        if(MechanicWait[playerid] > gettime()) return va_SendClientMessage(playerid, -1, "Ban can phai doi %d giay.", MechanicWait[playerid]-gettime());

		RefillPrice[giveplayerid][playerid] = price;
  		MechanicWait[playerid] = gettime()+30;
  		va_SendClientMessage(playerid, X11_MISTY_ROSE_1, "You offered to refill %s's vehicle with 25 litres for $%s.", GetName(giveplayerid),FormatNumber(price));
  		va_SendClientMessage(giveplayerid, X11_MISTY_ROSE_1, "Mechanic %s wants to refill your vehicle with 25 litres for $%s, type (/accept refill %d) de chap nhan.", GetName(playerid),FormatNumber(price),playerid);

	}
	return 1;
}
CMD:repair(playerid, params[]) {	
	if(PlayerInfo[playerid][pJob] != 11) return va_SendClientMessage(playerid, X11_SPRING_GREEN, "[INFO]:"WHITE" Cong viec cua ban khong phai la 'Mechanic'.");
	new giveplayerid, splayer[25], price;
	if(sscanf(params,"s[25]i", splayer,price)) return SendClientMessage(playerid, X11_SPRING_GREEN, "Su dung:{FFFFFF} /repair <Player ID/Name> <price>");
	{
	    if(GetPlayers(splayer) == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_ERROR, "ID/Username khong hop le.");
		else if(GetPlayers(splayer) == 1000) return SendClientMessage(playerid, COLOR_ERROR, "Co qua nhieu ket qua cho tim kiem nay.");
		else if(GetPlayers(splayer) == 1001) return ShowResults(playerid, splayer);
		else giveplayerid = GetPlayers(splayer);
		if(giveplayerid == playerid) return SendClientMessage(playerid, COLOR_ERROR, "You cannot repair yourself.");
		if(!ProxDetectorS(5.0, playerid, giveplayerid)) return SendClientMessage(playerid, COLOR_ERROR, "Nguoi choi khong o gan ban.");
		if(!IsPlayerInAnyVehicle(giveplayerid)) return SendClientMessage(playerid, COLOR_ERROR, "Nguoi choi do phai o tren xe.");
		if(MoneyACheck(playerid, price, 1, 10000)) return 1;
		if(RepairPrice[giveplayerid][playerid] > 0) return SendClientMessage(playerid, COLOR_ERROR,"You already offered to fix his vehicle.");
		RepairPrice[giveplayerid][playerid] = price;
		va_SendClientMessage(playerid, X11_MISTY_ROSE_1, "You offered to fix %s's vehicle for $%s.", GetName(giveplayerid),FormatNumber(price));
  		va_SendClientMessage(giveplayerid, X11_MISTY_ROSE_1, "Mechanic %s wants to repair your vehicle for $%s, type (/accept repair %d) de chap nhan.", GetName(playerid),FormatNumber(price),playerid);
	}
	return 1;
}
CMD:selldrugs(playerid, params[]) {	
	new giveplayerid, splayer[25], amount, price;
	if(PlayerInfo[playerid][pJob] != 10) return SendClientMessage(playerid, X11_SPRING_GREEN, "[INFO]:"WHITE" Ai nevoie de jobul 'Buon thuoc phien' pentru a folosi acesta comanda.");
	if(sscanf(params,"s[25]ii", splayer,amount,price)) return SendClientMessage(playerid, X11_SPRING_GREEN,"Su dung:"WHITE" /selldrugs <Player ID/Name> <amount> <price>");
	{
		if(GetPlayers(splayer) == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_ERROR, "ID/Username khong hop le.");
		else if(GetPlayers(splayer) == 1000) return SendClientMessage(playerid, COLOR_ERROR, "Co qua nhieu ket qua cho tim kiem nay.");
		else if(GetPlayers(splayer) == 1001) return ShowResults(playerid, splayer);
		else giveplayerid = GetPlayers(splayer);
		if(!ProxDetectorS(5.0, playerid, giveplayerid)) return SendClientMessage(playerid, COLOR_ERROR, "Nguoi choi do khong o gan ban.");
		if(SellDrugsPrice[giveplayerid][playerid] > 0) return SendClientMessage(playerid, COLOR_ERROR,"Ai oferit deja droguri.");
        if(giveplayerid == playerid) return SendClientMessage(playerid, COLOR_ERROR, "Nu iti poti vinde singur droguri.");
        if(PlayerInfo[playerid][pDrugs] < amount) return SendClientMessage(playerid,COLOR_ERROR,"Nu ai drogurile necesare.");
        if(MoneyACheck(playerid, price, 1, 5000000)) return 1;
        if(AmountCheck(playerid, amount, 1, 10000)) return 1;
		
		va_SendClientMessage(playerid, X11_MISTY_ROSE_1, "Ban da de nghi ban' cho %s, %s gram thuoc phien voi gia $%s.", GetName(giveplayerid), FormatNumber(amount), FormatNumber(price));
  		va_SendClientMessage(giveplayerid, X11_MISTY_ROSE_1, "%s da offer cho ban %s grams thuoc phien voi gia $%s, su dung /accept drugs %d de chap nhan.", GetName(playerid), FormatNumber(amount), FormatNumber(price), playerid);

		SellDrugsPrice[giveplayerid][playerid] = price;
		SellDrugsAmount[giveplayerid][playerid] = amount;
	}
	return 1;
}
CMD:creategun(playerid, params[]) {	
	new weap[24];
	if(PlayerInfo[playerid][pJob] != 9) return va_SendClientMessage(playerid, X11_SPRING_GREEN, "[INFO]:"WHITE" Cong viec cua ban khong phai la %s de su dung lenh nay.", JobInfo[9][jName]);
	if(PlayerInfo[playerid][pGunLic] < 0) return SendClientMessage(playerid,COLOR_ERROR,"Ban khong co giay phep sung.");
	if(sscanf(params,"s[24]",weap)) return SendClientMessage(playerid, X11_SPRING_GREEN,"Su dung:"WHITE" /creategun <weapon>"), SendClientMessage(playerid, COLOR_GREY, "Weapons: deagle(100) m4(350)");
	{
     	new mats, weapon, ammo;
 		if(strmatch(weap,"deagle"))
		{
			if(PlayerInfo[playerid][pMats] < 100) return SendClientMessage(playerid,COLOR_ERROR,"Ban khong co du vat lieu can thiet.");
			mats = 100; weapon = 24; ammo = 50;
		}
		else if(strmatch(weap,"m4"))
		{
			if(PlayerInfo[playerid][pMats] < 3500) return SendClientMessage(playerid,COLOR_ERROR,"Ban khong co du vat lieu can thiet.");
			mats = 350; weapon = 31; ammo = 120;
		}
		else return SendClientMessage(playerid, X11_SPRING_GREEN,"Su dung:"WHITE" /creategun <weapon>"), SendClientMessage(playerid, COLOR_GREY, "Weapons: deagle(200) m4(600)");
 
		va_ProxDetector(30.0, playerid, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE, "* %s created for him a Gun from Materials.", GetName(playerid));
		GivePlayerWeapon(playerid, weapon, ammo);
		PlayerInfo[playerid][pMats] -= mats;
	}
	return 1;
}
CMD:sellgun(playerid, params[]) {	
	new splayer[24],giveplayerid, weap[24], price;
	if(PlayerInfo[playerid][pJob] != 9) return va_SendClientMessage(playerid, X11_SPRING_GREEN, "[INFO]:"WHITE" Cong viec cua ban khong phai la %s de su dung lenh nay.", JobInfo[9][jName]);
	if(sscanf(params,"s[25]s[24]i", splayer,weap,price)) return SendClientMessage(playerid, X11_SPRING_GREEN,"Su dung:"WHITE" /sellgun <Player ID/Name> <weapon> <price>"), SendClientMessage(playerid, COLOR_GREY, "Weapons: sdpistol(100) deagle(100)"), SendClientMessage(playerid, COLOR_GREY, "Weapons: mp5(200) ak47(350) m4(350)"), SendClientMessage(playerid, COLOR_GREY, "Weapons: shotgun(300) rifle(400)");
	{
		if(!ProxDetectorS(5.0, playerid, giveplayerid)) return SendClientMessage(playerid, X11_SPRING_GREEN, "[ERROR]: "WHITE"Nguoi choi do khong o gan ban.");
		if(SellGunPice[giveplayerid][playerid] > 0) return SendClientMessage(playerid, X11_SPRING_GREEN, "[ERROR]: "WHITE"Ai oferit deja o arma.");
        if(giveplayerid == playerid) return SendClientMessage(playerid, X11_SPRING_GREEN, "[ERROR]: "WHITE"Ban khong the ban' vu khi cho chinh minh.");
        if(PlayerInfo[giveplayerid][pJailed] != 0) return SendClientMessage(playerid, X11_SPRING_GREEN, "[ERROR]: "WHITE"Ban khong the ban vu khi cho mot nguoi o trong tu.");
        if(MoneyACheck(playerid, price, 1, 10000)) return 1;
		new mats, weapon, ammo;
		if(strmatch(weap,"sdpistol")) {
			if(PlayerInfo[playerid][pMats] < 500) return SendClientMessage(playerid,COLOR_ERROR,"Ban khong co du so vat lieu can thiet (500).");
			if(PlayerInfo[giveplayerid][pGunLic] < 0) return SendClientMessage(playerid,COLOR_ERROR,"Nguoi choi do khong co giay phep su dung sung.");
			mats = 500; weapon = 23; ammo = 50;
		}
		// 	Colt45 - 650 VL
		else if(strmatch(weap, 'colt45')) {
			if(PlayerInfo[playerid][pMats] < 650) return SendClientMessage(playerid,COLOR_ERROR,"Ban khong co du so vat lieu can thiet (650).");
			if(PlayerInfo[giveplayerid][pGunLic] < 0) return SendClientMessage(playerid,COLOR_ERROR,"Nguoi choi do khong co giay phep su dung sung.");
			mats = 650; weapon = 22; ammo = 50;
		}
		// Katana - 500 VL
		else if(strmatch(weap, 'katana')) {
			if(PlayerInfo[playerid][pMats] < 500) return SendClientMessage(playerid,COLOR_ERROR,"Ban khong co du so vat lieu can thiet (500).");
			if(PlayerInfo[giveplayerid][pGunLic] < 0) return SendClientMessage(playerid,COLOR_ERROR,"Nguoi choi do khong co giay phep su dung sung.");
			mats = 500; weapon = 8; ammo = 50;
		}
		// Basketball - 500 VL
		else if(strmatch(weap, 'basketball')) {
			if(PlayerInfo[playerid][pMats] < 500) return SendClientMessage(playerid,COLOR_ERROR,"Ban khong co du so vat lieu can thiet (500).");
			if(PlayerInfo[giveplayerid][pGunLic] < 0) return SendClientMessage(playerid,COLOR_ERROR,"Nguoi choi do khong co giay phep su dung sung.");
			mats = 500; weapon = 5; ammo = 50;
		}
		// Tec9    - 1000 VL
		else if(strmatch(weap, 'tec9')) {
			if(PlayerInfo[playerid][pMats] < 1000) return SendClientMessage(playerid,COLOR_ERROR,"Ban khong co du so vat lieu can thiet (1000).");
			if(PlayerInfo[giveplayerid][pGunLic] < 0) return SendClientMessage(playerid,COLOR_ERROR,"Nguoi choi do khong co giay phep su dung sung.");
			mats = 650; weapon = 32; ammo = 50;
		}

		// else if(strmatch(weap,"deagle")) {
		// 	if(PlayerInfo[playerid][pMats] < 100) return SendClientMessage(playerid,COLOR_ERROR,"Ban khong co du so vat lieu can thiet (100).");
		// 	if(PlayerInfo[giveplayerid][pGunLic] < 0) return SendClientMessage(playerid,COLOR_ERROR,"Nguoi choi do khong co giay phep su dung sung.");
		// 	mats = 100; weapon = 24; ammo = 50;
		// }
		// else if(strmatch(weap,"mp5")) {
		// 	if(PlayerInfo[playerid][pMats] < 200) return SendClientMessage(playerid,COLOR_ERROR,"Ban khong co du so vat lieu can thiet (200).");
		// 	if(PlayerInfo[giveplayerid][pGunLic] < 0) return SendClientMessage(playerid,COLOR_ERROR,"Nguoi choi do khong co giay phep su dung sung.");
		// 	mats = 200; weapon = 29; ammo = 100;
		// }
		// else if(strmatch(weap,"ak47")) {
		// 	if(PlayerInfo[playerid][pMats] < 350) return SendClientMessage(playerid,COLOR_ERROR,"Ban khong co du so vat lieu can thiet (350).");
		// 	if(PlayerInfo[giveplayerid][pGunLic] < 0) return SendClientMessage(playerid,COLOR_ERROR,"Nguoi choi do khong co giay phep su dung sung.");
		// 	mats = 350; weapon = 30; ammo = 120;
		// }
		// else if(strmatch(weap,"m4")) {
		// 	if(PlayerInfo[playerid][pMats] < 350) return SendClientMessage(playerid,COLOR_ERROR,"Ban khong co du so vat lieu can thiet (350).");
		// 	if(PlayerInfo[giveplayerid][pGunLic] < 0) return SendClientMessage(playerid,COLOR_ERROR,"Nguoi choi do khong co giay phep su dung sung.");
		// 	mats = 350; weapon = 31; ammo = 120;
		// }
		// else if(strmatch(weap,"shotgun")) {
		// 	if(PlayerInfo[playerid][pMats] < 300) return SendClientMessage(playerid,COLOR_ERROR,"Ban khong co du so vat lieu can thiet (300).");
		// 	if(PlayerInfo[giveplayerid][pGunLic] < 0) return SendClientMessage(playerid,COLOR_ERROR,"Nguoi choi do khong co giay phep su dung sung.");
		// 	mats = 300; weapon = 25; ammo = 25;
		// }
		// else if(strmatch(weap,"rifle")) {
		// 	if(PlayerInfo[playerid][pMats] < 400) return SendClientMessage(playerid,COLOR_ERROR,"Ban khong co du so vat lieu can thiet (400).");
		// 	if(PlayerInfo[giveplayerid][pGunLic] < 0) return SendClientMessage(playerid,COLOR_ERROR,"Nguoi choi do khong co giay phep su dung sung.");
		// 	mats = 400; weapon = 33; ammo = 25;
		// }
		else{
			return SendClientMessage(playerid, X11_SPRING_GREEN,"Su dung:"WHITE" /sellgun <Player ID/Name> <weapon> <price>"), 
				SendClientMessage(playerid, COLOR_GREY, "Weapons: sdpistol(500), colt45(650)");
				SendClientMessage(playerid, COLOR_GREY, "Weapons: katana(500), basketball(500), tec9(1000)");
		} 

		new gunname[32];
		GetWeaponName(weapon,gunname,32);
		
		va_SendClientMessage(playerid, X11_MISTY_ROSE_1, "Ban da offer cho %s, mot %s voi %d dan voi gia $%s.", GetName(giveplayerid), gunname, ammo, FormatNumber(price));
		va_SendClientMessage(giveplayerid, X11_MISTY_ROSE_1, "%s offer cho ban mot %s voi %d dam, gia $%s, su dung /accept gun %d de chap nhan.",GetName(playerid) ,gunname, ammo, FormatNumber(price), playerid);

		SellGunPice[giveplayerid][playerid] = price;
		SellGunWeapon[giveplayerid][playerid] = weapon;
		SellGunAmmo[giveplayerid][playerid] = ammo;
		SellGunMats[giveplayerid][playerid] = mats;
	}
	return 1;
}
CMD:sellmats(playerid, params[]) {	
	new giveplayerid, splayer[25], amount, price;
	if(PlayerInfo[playerid][pJob] != 9) return va_SendClientMessage(playerid, X11_SPRING_GREEN, "[INFO]:"WHITE" Cong viec cua ban khong phai la %s de su dung lenh nay.", JobInfo[9][jName]);
	if(sscanf(params,"s[25]ii", splayer,amount,price)) return SendClientMessage(playerid, X11_SPRING_GREEN,"Su dung:"WHITE" /sellmats <Player ID/Name> <amount> <price>");
	{
		if(GetPlayers(splayer) == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_ERROR, "ID/Username khong hop le.");
		else if(GetPlayers(splayer) == 1000) return SendClientMessage(playerid, COLOR_ERROR, "Co qua nhieu ket qua cho tim kiem nay.");
		else if(GetPlayers(splayer) == 1001) return ShowResults(playerid, splayer);
		else giveplayerid = GetPlayers(splayer);
		if(!ProxDetectorS(5.0, playerid, giveplayerid)) return SendClientMessage(playerid, X11_SPRING_GREEN, "[ERROR]: "WHITE"Nguoi choi do khong o gan ban.");
		if(SellMatsPrice[giveplayerid][playerid] > 0) return SendClientMessage(playerid, X11_SPRING_GREEN, "[ERROR]: "WHITE"Ban da gui offer roi.");
        if(giveplayerid == playerid) return SendClientMessage(playerid, X11_SPRING_GREEN, "[ERROR]: "WHITE" Ban khong the ban vat lieu cho chinh ban.");
        if(PlayerInfo[playerid][pMats] < amount) return SendClientMessage(playerid,X11_SPRING_GREEN, "[ERROR]: "WHITE" Ban khong co du so vat lieu can thiet.");
		if(PlayerInfo[playerid][pLevel] < 4 && PlayerInfo[giveplayerid][pLevel] < 4) return SendClientMessage(playerid, -1, "Ban hoac nguoi choi do khong du level 4.");
        if(MoneyACheck(playerid, price, 1, 5000000)) return 1;
        if(AmountCheck(playerid, amount, 1, 10000)) return 1;

		va_SendClientMessage(playerid, X11_MISTY_ROSE_1, "Ban da offer cho %s, %s vat lieu voi gia $%s.", GetName(giveplayerid), FormatNumber(amount), FormatNumber(price));
		va_SendClientMessage(giveplayerid, X11_MISTY_ROSE_1, "%s offer cho ban %s vat lieu voi gia $%s, su dung /accept materials %d de chap nhan.", GetName(playerid), FormatNumber(amount), FormatNumber(price), playerid);

		SellMatsPrice[giveplayerid][playerid] = price;
		SellMatsAmount[giveplayerid][playerid] = amount;
	}
	return 1;
}
CMD:getmats(playerid, params[]) {
	if(PlayerInfo[playerid][pCP] != 0) return SendClientMessage(playerid, COLOR_GOLD, "Ban da co mot checkpoint dang hoat dong. Su dung '/killcp' de xoa muc tieu.");
	if(PlayerInfo[playerid][pJob] != 9) return va_SendClientMessage(playerid, X11_SPRING_GREEN, "[INFO]:"WHITE" Cong viec cua ban khong phai la %s de su dung lenh nay.", JobInfo[9][jName]);
	if(IsPlayerInRangeOfPoint(playerid, 5.0, JobInfo[9][jPosX], JobInfo[9][jPosY], JobInfo[9][jPosZ])) {
	    if(GetPlayerCash(playerid) >= 500) {
	        SetPlayerCheckpoint(playerid, 1713.1602,916.2577,10.8203, 10.0);
	        SendClientMessage(playerid, X11_SPRING_GREEN, "[JOB]: "WHITE"Den checkpoint de nhap vat lieu.");
    		TimpMateriale[playerid] = 1;
	    	defer materialtime2[30000](playerid);
	    	GivePlayerCash(playerid,-500);
	    	PlayerInfo[playerid][pCP] = 13;
	    }
	    else return SendClientMessage(playerid, -1,""RED"[ERROR]: "WHITE"Ban khong co $500 de dat coc cho so vat lieu tren.");
	}
	else {
		PlayerInfo[playerid][pCP] = 1;
		SendClientMessage(playerid, -1,""RED"[ERROR]: "WHITE"Ban khong o noi ban co the bat dau cong viec. Hay den "RED"checkpoint"WHITE" tren ban do.");
		SetPlayerCheckpoint(playerid, JobInfo[9][jPosX], JobInfo[9][jPosY], JobInfo[9][jPosZ], 2.0);
		return 1;
	}
	return 1;
}
stock savePlayerSkill(const playerid) {
	if(PlayerInfo[playerid][pStatus] > 0) {
		switch(PlayerInfo[playerid][pJob]) {
			case 2: va_mysql_query("UPDATE players SET `ManipulatorSkill`='%d', `ManipulatorRem`='%d' WHERE `ID`= '%d'",  PlayerInfo[playerid][pManipulatorSkill], PlayerInfo[playerid][pManipulatorRem], PlayerInfo[playerid][pSQLID]);
			case 4: va_mysql_query("UPDATE players SET `FishSkill`='%d', `FishRem`='%d', `FishTimes` = '%d' WHERE `ID`= '%d'",  PlayerInfo[playerid][pFishSkill], PlayerInfo[playerid][pFishRem], PlayerInfo[playerid][pFishTimes], PlayerInfo[playerid][pSQLID]);
			case 6: va_mysql_query("UPDATE players SET `FarmRem` = '%d', `FarmSkill` = '%d', `FarmTimes` = '%d' WHERE `ID`= '%d'",  PlayerInfo[playerid][pFarmRem], PlayerInfo[playerid][pFarmSkill], PlayerInfo[playerid][pFarmTimes], PlayerInfo[playerid][pSQLID]);
			case 7: va_mysql_query("UPDATE players SET `TrcukSkill` = '%d', `TruckRem` = '%d', `TruckTimes` = '%d' WHERE `ID`= '%d'", PlayerInfo[playerid][pTrcukSkill], PlayerInfo[playerid][pTruckRem], PlayerInfo[playerid][pTruckTimes], PlayerInfo[playerid][pSQLID]);
			case 8: va_mysql_query("UPDATE players SET `PizzaSkill` = '%d', `PizzaRem` = '%d', `PizzaTimes` = '%d' WHERE `ID`= '%d'", PlayerInfo[playerid][pPizzaSkill], PlayerInfo[playerid][pPizzaRem], PlayerInfo[playerid][pPizzaTimes], PlayerInfo[playerid][pSQLID]);
			case 9: va_mysql_query("UPDATE players SET `ArmsSkill` = '%d', `ArmsRem` = '%d', `ArmsTimes` = '%d' WHERE `ID`= '%d'", PlayerInfo[playerid][pArmsSkill], PlayerInfo[playerid][pArmsRem], PlayerInfo[playerid][pArmsTimes], PlayerInfo[playerid][pSQLID]);
			case 10: va_mysql_query("UPDATE players SET `DrugSkill` = '%d', `DrugRem` = '%d', `DrugTimes` = '%d' WHERE `ID`= '%d'", PlayerInfo[playerid][pDrugSkill], PlayerInfo[playerid][pDrugRem], PlayerInfo[playerid][pDrugTimes], PlayerInfo[playerid][pSQLID]);
		}
	}
	else return false;
	return 1;
}
StopWork(playerid) {
	if(JobWorking[playerid] != 0) {
		switch(JobWorking[playerid]) {
		    case 2: {
		        for(new x = 0; x < sizeof TreeTD; x++) TextDrawHideForPlayer(playerid, TreeTD[x]);
		        CancelSelectTextDraw(playerid), FarmerTimer[playerid] = -1, FarmerTreeTaken[playerid] = -1, RemovePlayerAttachedObject(playerid, ATTACHMENT_ID_BALE), SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE), TogglePlayerControllable(playerid, true);
			}
			case 3: Job_StreetSweeperClearGarbage(playerid);
			case 5: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE), RemovePlayerAttachedObject(playerid, ATTACHMENT_ID_BALE), PlayerInfo[playerid][pLista] = 0;
			case 6: {
				stop PlayerInfo[playerid][c_Job_Farm_Timer];
				PlayerInfo[playerid][c_Job_Farm_Timer] = Timer:0;
				foreach(new i: CurBalles) {
					new data[5], obj = g_iCurBalles[i];
					if(obj > 0 && IsValidDynamicObject(obj) && !IsDynamicObjectMoving(obj)) {
						Streamer_GetArrayData(STREAMER_TYPE_OBJECT, obj, E_STREAMER_EXTRA_ID, data, 5);
	 					for(new j = 0; j < MAX_BALES_PER_PLAYER; j++) {
							if(PlayerInfo[playerid][c_Bales][j] == obj) {
								PlayerInfo[playerid][c_Bales][j] = 0;
								DestroyDynamicObject(obj);
								DestroyDynamic3DTextLabel(Text3D:data[0]);
								DestroyDynamicArea(data[3]);
								Job_FarmerRemoveBale(obj);
							}
						}
					}
				}
 				for(new j = 0; j < MAX_BALES_PER_PLAYER; j++) PlayerInfo[playerid][c_Bales][j] = 0;
			    if(PlayerInfo[playerid][pJobStep] == 2) AttachFarm[playerid] = 0, RemovePlayerAttachedObject(playerid, ATTACHMENT_ID_BALE);
		    	AttachFarm[playerid] = 0, RemovePlayerAttachedObject(playerid, ATTACHMENT_ID_BALE);
				SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE), ApplyAnimation(playerid, #CARRY, #crry_prtial, 4.0, 0, 0, 0, 0, 0);
			}
			case 7: TruckerRouteID[playerid] = -1, StopTruck[playerid] = 0;
			case 8: {
				DisablePlayerRaceCheckpoint(playerid);
				pizzaj[playerid] = 0;
				pizzatime[playerid] = 0;
				failpizza[playerid] = -1;
				PizzaCP[playerid] = 0;
				pizzaprize[playerid] = 0;
			}
			case 10: PlayerInfo[playerid][pTimeDrug] = 0,  PlayerTextDrawHide(playerid, WaiterTPTD);
			case 12: {
				for(new x = 0; x < 15; x++) {
					PlayerInfo[playerid][pActorHungry][x] = 1, PlayerInfo[playerid][pActorTimer][x] = -1;
					DestroyActor(PlayerInfo[playerid][pWaiterActors][x]), DestroyDynamic3DTextLabel(PlayerInfo[playerid][pWaiterLabel][x]);
				}
  				SetPlayerVirtualWorld(playerid,0), TogglePlayerControllable(playerid, true), SetCameraBehindPlayer(playerid);
        		SetPlayerPos(playerid,JobInfo[JobWorking[playerid]][jPosX], JobInfo[JobWorking[playerid]][jPosY], JobInfo[JobWorking[playerid]][jPosZ]), SetPlayerInterior(playerid,0), SetPlayerSpecialAction(playerid, 0), ClearAnimations(playerid);
        		RemovePlayerAttachedObject(playerid, ATTACHMENT_ID_BALE),  RemovePlayerAttachedObject(playerid, ATTACHMENT_ID_CUFF);
			}

		}
		JobWorking[playerid] = 0, PlayerInfo[playerid][pCP] = 0, DisablePlayerCheckpoint(playerid);
		PlayerInfo[playerid][pJobStep] = 0;
	}
	if(PlayerInfo[playerid][pTrailer] != -1) DestroyVehicle(PlayerInfo[playerid][pTrailer]), PlayerInfo[playerid][pTrailer] = -1;
	if(PlayerInfo[playerid][pJobVehicle] != 0) {
		switch(PlayerInfo[playerid][pJob]) {
			case 6: {
   				if(IsValidDynamicArea(FarmCarInfo[PlayerInfo[playerid][pJobVehicle]][varea_cp])) DestroyDynamicArea(FarmCarInfo[PlayerInfo[playerid][pJobVehicle]][varea_cp]), FarmCarInfo[PlayerInfo[playerid][pJobVehicle]][varea_cp] = 0;
			    if(IsValidDynamicObject(FarmCarInfo[PlayerInfo[playerid][pJobVehicle]][vobj_cp])) DestroyDynamicObject(FarmCarInfo[PlayerInfo[playerid][pJobVehicle]][vobj_cp]), FarmCarInfo[PlayerInfo[playerid][pJobVehicle]][vobj_cp] = 0;
				for(new obj = 0; obj < FarmCarInfo[PlayerInfo[playerid][pJobVehicle]][v_BalesT]; obj ++) {
					DestroyDynamicObject(FarmCarInfo[PlayerInfo[playerid][pJobVehicle]][v_Bales][obj]);
					FarmCarInfo[PlayerInfo[playerid][pJobVehicle]][v_Bales][obj] = 0;
				}
				FarmCarInfo[PlayerInfo[playerid][pJobVehicle]][v_BalesT] = 0, Iter_Clear(BalesOnVehicle<PlayerInfo[playerid][pJobVehicle]>);
			}
		}
		DestroyVehicle(PlayerInfo[playerid][pJobVehicle]), PlayerInfo[playerid][pJobVehicle] = 0;
	}
	return 1;
}
hook OnPlayerEnterMarker(playerid, markerid) {
	new data[2];
	GetMarkerExtraData(markerid, data);
	if(data[0] == e_Marker_Job_Sweeper) {
		Job_StreetSweeperRemoveTrush(playerid, data[1]);
		JobClear[playerid] ++;
		if(JobClearSet[playerid] == JobClear[playerid]) SendClientMessage(playerid, -RED2S, "Ban da don sach tat ca rac, bay gio la luc ban nhan duoc tien luong!"), PlayerInfo[playerid][pCP] = 15, SetPlayerCheckpoint(playerid, 1981.6396,-1991.1749,13.5469, 5.0);
	}
}
Job_StreetSweeperSpawnGarbage(playerid) {
	new j;
	do {
		j = Iter_RandomFree(idx_trush<playerid>);

		Job_StreetSweeperSpawnTrush(playerid, j);
	}
	while(Iter_Count(idx_trush<playerid>) == JobClearSet[playerid]);
	return true;
}
Job_StreetSweeperSpawnTrush(playerid, trashid) {
	new Float:x = StreetSweeperTrashes[trashid][0];
	new Float:y = StreetSweeperTrashes[trashid][1];
	new Float:z = StreetSweeperTrashes[trashid][2]+0.1;

	new Garbage[] = {2670, 2672, 2674, 2676 , 2677};

	g_iPlayerGarbage[playerid][trashid] = CreateDynamicObject(Garbage[random(sizeof(Garbage))], x, y, z, 0.0, 0.0, 0.0, _, _, playerid);

	new
		data[3],
		markerid = CreateMarker(x, y, z+2, MARKER_RED, playerid);

	data[0] = e_Obj_Trash;
	data[1] = markerid;
	data[2] = trashid;
	Streamer_SetArrayData(STREAMER_TYPE_OBJECT, g_iPlayerGarbage[playerid][trashid], E_STREAMER_EXTRA_ID, data);

	data[0] = e_Marker_Job_Sweeper;
	data[1] = trashid;
	SetMarkerExtraData(markerid, data, 2);

	Iter_Add(idx_trush<playerid>, trashid);
	return true;
}
Job_StreetSweeperRemoveTrush(playerid, trashid) {
	if(!Iter_Contains(idx_trush<playerid>, trashid)) return false;
	new data[3], obj = g_iPlayerGarbage[playerid][trashid];
	Streamer_GetArrayData(STREAMER_TYPE_OBJECT, obj, E_STREAMER_EXTRA_ID, data);
	DestroyDynamicObject(obj), DestroyMarker(data[1]), g_iPlayerGarbage[playerid][trashid] = 0;
	Iter_Remove(idx_trush<playerid>, trashid);
	return true;
}
Job_StreetSweeperClearGarbage(playerid) {
	foreach(new trashid: idx_trush<playerid>) {
		new data[3], obj = g_iPlayerGarbage[playerid][trashid];
		Streamer_GetArrayData(STREAMER_TYPE_OBJECT, obj, E_STREAMER_EXTRA_ID, data);
		DestroyDynamicObject(obj), DestroyMarker(data[1]), g_iPlayerGarbage[playerid][trashid] = 0;
		Iter_SafeRemove(idx_trush<playerid>, trashid, trashid);
	}
	return true;
}
IsPlayerFishing(playerid) {
	return (PlayerInfo[playerid][pStatus] == 1 && Bit_Get(player_is_fishing, playerid));
}
IsPlayerCatching(playerid) {
	return (PlayerInfo[playerid][pStatus] == 1 && Bit_Get(player_is_catching, playerid));
}
StartPlayerFishing(playerid) {
	if(Bit_Get(player_is_fishing, playerid) || PlayerInfo[playerid][pStatus] == 0) return false;
	Bit_Let(player_is_fishing, playerid), ClearAnimations(playerid, 1);
	ApplyAnimation(playerid, #SWORD, #SWORD_BLOCK, 4.0, 0, 1, 1, 1, 1, 1), ApplyAnimation(playerid, #SWORD, #SWORD_BLOCK, 4.0, 0, 1, 1, 1, 1, 1);
	player_fish_timer[playerid] = defer player_wait_fish[5000+random_num(1000, 3000)](playerid);
	SetPlayerAttachedObject(playerid, ATTACHMENT_ID_BALE, 18632, 6, 0.105342, 0.069072, -0.099702, -170.062591, 1.515998, -117.398666,1.263998, 1.406998, 2.480000, -1, -1);
	GetPlayerPos(playerid, LastPos[playerid][0], LastPos[playerid][1], LastPos[playerid][2]);
	return true;
}
StopPlayerFishing(playerid) {
	if(PlayerInfo[playerid][pStatus] == 0 || !Bit_Get(player_is_fishing, playerid)) return false;
	TDFishDestroy(playerid);
	stop player_fish_timer[playerid];
	player_fish_timer[playerid] = Timer:0;
	Bit_Vet(player_is_fishing, playerid);
	Bit_Vet(player_is_catching, playerid);
	RemovePlayerAttachedObject(playerid, ATTACHMENT_ID_BALE);
	ApplyAnimation(playerid, #CARRY, #crry_prtial, 4.0, 0, 0, 0, 0, 0);
	return true;
}
timer player_wait_fish[10000](playerid) {
	static const chance_fish[] = {0, 30, 50, 60, 70, 80, 90};
	if(chance_fish[PlayerInfo[playerid][pFishSkill]] > random(100)) 
	{
		TDFishShow(playerid), Bit_Let(player_is_catching, playerid);
		player_fish_timer[playerid] = repeat player_drag_fish[250](playerid);
		player_drag_power[playerid] = 50;
		SendClientMessage(playerid, -RED2S, "Bay gio ban khong lam viec nua...");
		Info(playerid, "Bam lien tuc ~y~SPACE~w~ de keo ca");
	}
	else StopPlayerFishing(playerid), Info(playerid, "Ca khong can cau, thu lai sau.");
}
timer player_drag_fish[250](playerid) {
	if(Bit_Get(player_is_catching, playerid)) {
		player_drag_power[playerid]--;
		switch(player_drag_power[playerid]) {
			case -999..0: SendClientMessage(playerid, -RED2S, "Con ca da chay thoat."), StopPlayerFishing(playerid);
			case 100..999: { 
				StopPlayerFishing(playerid);
				new money;
				switch(random(3)) {
				    case 0: {
				        //money = 15000 + random(20000), PlayerInfo[playerid][pFishPrice] = money;
				        va_SendClientMessage(playerid, X11_MISTY_ROSE_1, "Ban da cau duoc mot con ca BINH THUONG! Ca co gia tri $%s.", FormatNumber(money));
				        va_SendClientMessage(playerid, X11_YELLOW_1, "Ca da duoc them vao balo cua ban [/tuido hoac nut 'ALT'].");
						// Inventory_Add(playerid,"Ca Thuong", 19630, 1, 1);
				        if(PlayerInfo[playerid][pTutorial] == 2) va_SendClientMessage(playerid, -RED2S, "Mot checkpoint da duoc set, den do de ban ca."), SetPlayerCheckpoint(playerid, 1352.1604,-1758.4952,13.5078, 5.0), PlayerInfo[playerid][pCP] = 2;
				    }
				    case 1: {
        				//money = 15000 + random(35000), PlayerInfo[playerid][pFishPrice] = money;
				        va_SendClientMessage(playerid, X11_MISTY_ROSE_1, "Ban da cau duoc mot con ca HIEM! Ca co gia tri la $%s.", FormatNumber(money));
				        va_SendClientMessage(playerid, X11_YELLOW_1, "Ca da duoc them vao balo cua ban [/tuido hoac nut 'ALT'].");
						// Inventory_Add(playerid,"Ca Hiem", 1600, 1, 1);
				        if(PlayerInfo[playerid][pTutorial] == 2) va_SendClientMessage(playerid, -RED2S, "Mot checkpoint da duoc set, den do de ban ca."), SetPlayerCheckpoint(playerid, 1352.1604,-1758.4952,13.5078, 5.0), PlayerInfo[playerid][pCP] = 2;
				    }
				    case 2: {
    					//money = 20000 + random(45000), PlayerInfo[playerid][pFishPrice] = money;
				        va_SendClientMessage(playerid, X11_MISTY_ROSE_1, "Ban da cau duoc mot con ca CUC KY QUY HIEM!! Ca co gia tri la $%s.", FormatNumber(money));
				        va_SendClientMessage(playerid, X11_YELLOW_1, "Ca da duoc them vao balo cua ban [/tuido hoac nut 'ALT'].");
						// Inventory_Add(playerid,"Ca Vang", 1694, 1, 1);
				        if(PlayerInfo[playerid][pTutorial] == 2) va_SendClientMessage(playerid, -RED2S, "Mot checkpoint da duoc set, den do de ban ca."), SetPlayerCheckpoint(playerid, 1352.1604,-1758.4952,13.5078, 5.0), PlayerInfo[playerid][pCP] = 2;
		        		if(PlayerInfo[playerid][pQuest1] == 6 && PlayerInfo[playerid][pQuestProgress1] == 0) PlayerInfo[playerid][pQuestProgress1] = 1, FinishQuest1(playerid, 6), saveQuest(playerid);
				    }
				}
			}
			default: PlayerTextDrawTextSize(playerid, player_fish_bar[playerid], 196.000000 + ((253.000000 * float(player_drag_power[playerid])) / 100), 0.000000), PlayerTextDrawShow(playerid, player_fish_bar[playerid]);
		}
	}
	else {
		stop player_fish_timer[playerid];
		player_fish_timer[playerid] = Timer:0;

		
	}
}

// VaildFishPlace(playerid) {
// 	if(IsPlayerInRangeOfPoint(playerid, 4,403.8266,-2088.7598,7.8359) || IsPlayerInRangeOfPoint(playerid, 4,398.7553,-2088.7490,7.8359)) return 1;
// 	else if(IsPlayerInRangeOfPoint(playerid, 4,396.2197,-2088.6692,7.8359) || IsPlayerInRangeOfPoint(playerid, 4,391.1094,-2088.7976,7.8359)) return 1;
// 	else if(IsPlayerInRangeOfPoint(playerid, 4,383.4157,-2088.7849,7.8359) || IsPlayerInRangeOfPoint(playerid, 4,374.9598,-2088.7979,7.8359)) return 1;
// 	else if(IsPlayerInRangeOfPoint(playerid, 4,369.8107,-2088.7927,7.8359) || IsPlayerInRangeOfPoint(playerid, 4,367.3637,-2088.7925,7.8359)) return 1;
// 	else if(IsPlayerInRangeOfPoint(playerid, 4,362.2244,-2088.7981,7.8359) || IsPlayerInRangeOfPoint(playerid, 4,354.5382,-2088.7979,7.8359)) return 1;
// 	else if(IsPlayerInRangeOfPoint(playerid, 10,2000.5741,1563.2089,15.3672)) return 1;
// 	return 0;
// }
TDFishShow(playerid) {
	player_fish_bar[playerid] = CreatePlayerTextDraw(playerid, 196.000000, 365.062500, " ");
	PlayerTextDrawLetterSize(playerid, player_fish_bar[playerid], 0.000000, 0.934722);
	PlayerTextDrawTextSize(playerid, player_fish_bar[playerid], 322.5/*196.000000 + ((253.000000 * 50.0) / 100)*/, 0.000000);
	PlayerTextDrawAlignment(playerid, player_fish_bar[playerid], 1);
	PlayerTextDrawColor(playerid, player_fish_bar[playerid], 0);
	PlayerTextDrawUseBox(playerid, player_fish_bar[playerid], true);
	PlayerTextDrawBoxColor(playerid, player_fish_bar[playerid], -1378294017);
	PlayerTextDrawSetShadow(playerid, player_fish_bar[playerid], 0);
	PlayerTextDrawSetOutline(playerid, player_fish_bar[playerid], 0);
	PlayerTextDrawFont(playerid, player_fish_bar[playerid], 0);

	player_fish_back[playerid] = CreatePlayerTextDraw(playerid, 454.000000, 364.187500, " ");
	PlayerTextDrawLetterSize(playerid, player_fish_back[playerid], 0.000000, 1.093055);
	PlayerTextDrawTextSize(playerid, player_fish_back[playerid], 191.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, player_fish_back[playerid], 1);
	PlayerTextDrawColor(playerid, player_fish_back[playerid], 0);
	PlayerTextDrawUseBox(playerid, player_fish_back[playerid], true);
	PlayerTextDrawBoxColor(playerid, player_fish_back[playerid], 102);
	PlayerTextDrawSetShadow(playerid, player_fish_back[playerid], 0);
	PlayerTextDrawSetOutline(playerid, player_fish_back[playerid], 0);
	PlayerTextDrawFont(playerid, player_fish_back[playerid], 0);

	player_fish_title[playerid] = CreatePlayerTextDraw(playerid, 193.500000, 351.312500, "fishing...");
	PlayerTextDrawLetterSize(playerid, player_fish_title[playerid], 0.261000, 1.145001);
	PlayerTextDrawAlignment(playerid, player_fish_title[playerid], 1);
	PlayerTextDrawColor(playerid, player_fish_title[playerid], -1);
	PlayerTextDrawSetShadow(playerid, player_fish_title[playerid], 0);
	PlayerTextDrawSetOutline(playerid, player_fish_title[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, player_fish_title[playerid], 51);
	PlayerTextDrawFont(playerid, player_fish_title[playerid], 2);
	PlayerTextDrawSetProportional(playerid, player_fish_title[playerid], 1);
	
	PlayerTextDrawShow(playerid, player_fish_bar[playerid]);
	PlayerTextDrawShow(playerid, player_fish_back[playerid]);
	PlayerTextDrawShow(playerid, player_fish_title[playerid]);
	return 1;
}
TDFishDestroy(playerid) {
	PlayerTextDrawDestroy(playerid, player_fish_bar[playerid]);
	PlayerTextDrawDestroy(playerid, player_fish_back[playerid]);
	PlayerTextDrawDestroy(playerid, player_fish_title[playerid]);
	return 1;
}
timer Timer_Farming[1000](playerid, vehicleid) {
	vehicleid = PlayerInfo[playerid][pJobVehicle];
	if(JobWorking[playerid] == 6 && IsVehicleInArea(vehicleid, -312.6475,-1420.8507, -169.4142,-1317.5785) && PlayerInfo[playerid][pJobStep] == 1) {
		#define offX -1.2820
		#define offY -2.8343
		#define offZ 1.0670
		new Float:rot, Float:x, Float:y, Float:z;
		GetVehiclePos(vehicleid, x, y, z);
		if(GetDistanceBetweenPoints(x, y, z, FarmCarInfo[vehicleid][CarLastPos][0], FarmCarInfo[vehicleid][CarLastPos][1], FarmCarInfo[vehicleid][CarLastPos][2]) >= 10.0) {
			new iBale = -1;
			for(new i = 0; i < MAX_BALES_PER_PLAYER; i++) {
				if(PlayerInfo[playerid][c_Bales][i] == 0) {
					iBale = i;
					break;
				}
			}
			FarmCarInfo[vehicleid][CarLastPos][0] = x, FarmCarInfo[vehicleid][CarLastPos][1] = y, FarmCarInfo[vehicleid][CarLastPos][2] = z;
			if(iBale != -1) {
				GetVehicleZAngle(vehicleid, rot);
				rot = 360 - rot, x = floatsin(rot,degrees) * offY + floatcos(rot,degrees) * offX + x, y = floatcos(rot,degrees) * offY - floatsin(rot,degrees) * offX + y, z = offZ + z;
				new data[5];
				PlayerInfo[playerid][c_Bales][iBale] = CreateDynamicObject(2901, x, y, z, 0.00000, 0.00000, 0, 0, .playerid = playerid);
				Job_FarmerAddBale(PlayerInfo[playerid][c_Bales][iBale]);
				new areaid = CreateDynamicSphere(x, y, z, 3.0);
				data[0] = e_Area_Bale;
				data[1] = PlayerInfo[playerid][c_Bales][iBale];
				data[2] = playerid;
				Streamer_SetArrayData(STREAMER_TYPE_AREA, areaid, E_STREAMER_EXTRA_ID, data, 3);
				CA_FindZ_For2DCoord(x, y, z);
				z += 0.3;
				MoveDynamicObject(PlayerInfo[playerid][c_Bales][iBale], x, y, z, 4.0);
				data[0] = _:CreateDynamic3DTextLabel(GetName(playerid), 0xFFB370FF, x, y, z, 100.0, .playerid = playerid);
				data[1] = BALES_DIE_TIME;
				data[2] = playerid;
				data[3] = areaid;
				data[4] = 0;
				Streamer_SetArrayData(STREAMER_TYPE_OBJECT, PlayerInfo[playerid][c_Bales][iBale], E_STREAMER_EXTRA_ID, data, 5);
			} 
			else {
				SendClientMessage(playerid, RED2S, "Ban da cay toi da 10 bo lua, hay dua chung vao xe.");
				Info(playerid, "De lay hoac nang mot bo len xe, su dung phim ~y~Y");
				PlayerInfo[playerid][pJobStep] = 2;
				stop PlayerInfo[playerid][c_Job_Farm_Timer];
				PlayerInfo[playerid][c_Job_Farm_Timer] = Timer:0;
				DestroyVehicle(PlayerInfo[playerid][pJobVehicle]), PlayerInfo[playerid][pJobVehicle] = 0;
				new Float: Pos[3], engine,lights,alarm,doors,bonnet,boot,objective;
				GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
				PlayerInfo[playerid][pJobVehicle] = CreateVehicle(478 , Pos[0], Pos[1], Pos[2], 90 , -1, -1, -1), Fuel[PlayerInfo[playerid][pJobVehicle]] = 100;
				PutPlayerInVehicle(playerid, PlayerInfo[playerid][pJobVehicle], 0);
				GetVehicleParamsEx(PlayerInfo[playerid][pJobVehicle], engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(PlayerInfo[playerid][pJobVehicle],VEHICLE_PARAMS_OFF,VEHICLE_PARAMS_OFF,alarm,doors,bonnet,boot,objective);
				Job_SetVehicleFarmerCarry(PlayerInfo[playerid][pJobVehicle]);
			}
		}
	}
}
timer Timer_BalePickup[2000](playerid, obj) {
	if(!IsValidDynamicObject(obj)) return 1;
	for(new i = 0; i < MAX_BALES_PER_PLAYER; i++) {
		if(PlayerInfo[playerid][c_Bales][i] == obj) {
			PlayerInfo[playerid][c_Bales][i] = 0;
			break;
		}
	}
	SetPlayerAttachedObject(playerid, ATTACHMENT_ID_BALE, 2901, 4, 0.196271, -0.356000, 0.100500, 0.000000, 80.546043, 0.000000), AttachFarm[playerid] = 1;
	ApplyAnimation(playerid, #CARRY, #crry_prtial, 4.0, 0, 0, 0, 0, 0);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	new data[5];
	Streamer_GetArrayData(STREAMER_TYPE_OBJECT, obj, E_STREAMER_EXTRA_ID, data, 5);
	DestroyDynamic3DTextLabel(Text3D:data[0]);
	DestroyDynamicObject(obj);
	Job_FarmerRemoveBale(obj);
	return 1;
}
Job_FarmerAddBale(obj) {
	g_iCurBalles[Iter_Alloc(CurBalles)] = obj;
	return true;
}
Job_FarmerRemoveBale(obj) {
	foreach(new i: CurBalles) {
		if(g_iCurBalles[i] == obj) {
			g_iCurBalles[i] = 0;
			Iter_SafeRemove(CurBalles, i, i);
		}
	}
}

#define offsetcp_x -0.0568
#define offsetcp_y -3.2080
#define offsetcp_z -0.9178
Job_IsPlayerInVehicleCarryArea(playerid) {
	new areas[10], data[2], vehicleid;
	GetPlayerDynamicAreas(playerid, areas);
	for(new j = 0, end = GetPlayerNumberDynamicAreas(playerid); j < end && j < 10; j++) {
		if(!IsValidDynamicArea(areas[j])) continue;
		Streamer_GetArrayData(STREAMER_TYPE_AREA, areas[j], E_STREAMER_EXTRA_ID, data, 2);
		if(data[0] == e_Area_Job_Farmer) {
			new 
				Float:r, 
				Float:x, 
				Float:y, 
				Float:z;
			
			vehicleid = data[1];
			GetVehicleZAngle(vehicleid, r);
			GetVehiclePos(vehicleid, x, y, z);
			
			r = 360 - r;
			x = floatsin(r,degrees) * offsetcp_y + floatcos(r,degrees) * offsetcp_x + x;
			y = floatcos(r,degrees) * offsetcp_y - floatsin(r,degrees) * offsetcp_x + y;
			z = offsetcp_z + z;
			
			if(IsPlayerInRangeOfPoint(playerid, 1.5, x, y, z)) return vehicleid;
		}
	}
	return false;
} 
Job_SetVehicleFarmerCarry(vehicleid) {
	FarmCarInfo[vehicleid][v_BalesT] = 0;
	new obj_cp = CreateDynamicObject(1317, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, .streamdistance = 10.0);
	new area_cp = CreateDynamicSphere(0.0, 0.0, 0.0, 5.5);

	AttachDynamicAreaToVehicle(area_cp, vehicleid);
	SetDynamicObjectMaterial(obj_cp, 0, 18646, "matcolours", "yellow", 0x9900FFFF);
	AttachDynamicObjectToVehicle(obj_cp, vehicleid, offsetcp_x, offsetcp_y, offsetcp_z, 0.0, 0.0, 0.0);
	
	FarmCarInfo[vehicleid][vobj_cp] = obj_cp;
	FarmCarInfo[vehicleid][varea_cp] = area_cp;

	new data[2];
	data[0] = e_Area_Job_Farmer;
	data[1] = vehicleid;
	Streamer_SetArrayData(STREAMER_TYPE_AREA, area_cp, E_STREAMER_EXTRA_ID, data, 2);

	return true;
}
Timer_BaleDropOnVeh(playerid, i, vehicleid) {
	FarmCarInfo[vehicleid][v_Bales][i] = CreateDynamicObject(2901, 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 0.00000);
	for(new j = 0; j < MAX_BALES_PER_PLAYER; j++) { if(PlayerInfo[playerid][c_Bales][j] == 0) PlayerInfo[playerid][c_Bales][j] = FarmCarInfo[vehicleid][v_Bales][i]; }
	new data[5];
	data[0] = -1;
	data[1] = BALES_DIE_TIME;
	data[2] = playerid;
	data[3] = -1;
	data[4] = vehicleid;
	Streamer_SetArrayData(STREAMER_TYPE_OBJECT, FarmCarInfo[vehicleid][v_Bales][i], E_STREAMER_EXTRA_ID, data, 5);
	static Float:BalesToVehicle[][] = {
		{-0.84002, 	-1.77621, 0.18448, 2.82000, 1.80000, -92.75999},
		{-0.31965, 	-1.77917, 0.18448, 2.82000, 1.80000, -92.75999},
		{0.22159, 	-1.76304, 0.18448, 2.82000, 1.80000, -92.75999},
		{0.76283, 	-1.74691, 0.18448, 2.82000, 1.80000, -92.75999},
		{-0.60114, 	-1.80678, 0.47840, 2.82000, 1.80000, -92.75999},
		{-0.04080, 	-1.81151, 0.47840, 2.82000, 1.80000, -92.75999},
		{0.56038, 	-1.79803, 0.47840, 2.82000, 1.80000, -92.75999},
		{0.27977, 	-1.80565, 0.74320, 2.82000, 1.80000, -92.75999},
		{-0.30055, 	-1.80004, 0.74320, 2.82000, 1.80000, -92.75999},
		{0.00092, 	-1.77331, 1.03175, 2.82000, 1.80000, -92.75999}
	};
	AttachDynamicObjectToVehicle(FarmCarInfo[vehicleid][v_Bales][i], vehicleid, BalesToVehicle[i][0], BalesToVehicle[i][1], BalesToVehicle[i][2], BalesToVehicle[i][3], BalesToVehicle[i][4], BalesToVehicle[i][5]);
	AttachFarm[playerid] = 0, RemovePlayerAttachedObject(playerid, ATTACHMENT_ID_BALE);
	FarmCarInfo[vehicleid][v_BalesT] ++;

	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	ApplyAnimation(playerid, #CARRY, #crry_prtial, 4.0, 0, 0, 0, 0, 0);
	Iter_Add(BalesOnVehicle<PlayerInfo[playerid][pJobVehicle]>, i);
	DestroyDynamicRaceCP(PlayerInfo[playerid][c_Bales_Cp]);
	return 1;
}

CheckLista(playerid) {
	if(PlayerInfo[playerid][pLista] == 0) return 1;
	if(PlayerInfo[playerid][pMere] != PlayerInfo[playerid][pMereLita]) return 1;
	if(PlayerInfo[playerid][pApa] != PlayerInfo[playerid][pApaLista]) return 1;
	PlayerInfo[playerid][pLista] = 0;
	sendLongMessage(playerid, -1, ""RED"[JOB]:"WHITE" Ban da mua tat ca nhung gi ma ho da dan, bay gio hay den nha ho.");
	SetPlayerCheckpoint(playerid, 2182.8726,-1365.1215,25.8293, 2.0), PlayerInfo[playerid][pCP] = 8; CKTIMES[playerid] = 30;
	return 1;
}
hook OnObjectMoved(objectid) {
	for(new i = 0; i < sizeof(MechanicCar); i++) {
		if(objectid == MechanicCar[i]) {
			new Float:z;
			MechanicCarMove[i]++; GetObjectPos(objectid, z,z,z);
			switch(MechanicCarMove[i]) {
				case 2: MoveObject(MechanicCar[i], 2761.9749,-2507.4431, z, 5.0, 0.0, 0.0, 180.0);
				case 3: MoveObject(MechanicCar[i], 2800.3147,-2521.5186, z+0.2, 5.0, 0.0, 0.0, 270.0);
				case 4: {
					DestroyObject(objectid), DestroyObject(MechanicGlassObj[i]), DestroyObject(MechanicLightObj[i]), DestroyObject(MechanicLightObj2[i]), DestroyObject(MechanicEngineObj[i]);
					DestroyObject(MechanicRearObj[i]), DestroyObject(MechanicExhaustObj[i]), DestroyObject(MechanicSeatObj[i]), DestroyObject(MechanicSpoilerObj[i]);
					for(new x = i * 4; x < (i * 4) + 4; x++) DestroyObject(MechanicWheelObj[x]), MechanicWheelObj[x] = -1;
					for(new x = 0; x < 4; x++) MechanicCarColor[i][x] = -1;
					MechanicGlassObj[i] = -1, MechanicLightObj[i] = -1, MechanicLightObj2[i] = -1, MechanicEngineObj[i] = -1;
					MechanicRearObj[i] = -1, MechanicExhaustObj[i] = -1, MechanicSeatObj[i] = -1, MechanicSpoilerObj[i] = -1, MechanicCarMove[i] = 0;
					MechanicCar[i] = CreateObject(3593, 2785.8444, -2417.5979-(38*i), 13.3420, 0.0000, 0.0000, 92.2000);
					SetObjectMaterial(MechanicCar[i], 1, 3564, "dockcargo2_las", "lastrk1", 0xFF1B376D);
					MechanicCarDone[i] = 0;
				}
			}
			break;
		}
	}
	return 1;
}
