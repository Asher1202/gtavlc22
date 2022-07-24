#include <YSI_Coding\y_hooks>

hook OnGameModeInit() {
	CreateDynamicPickup(1239, 1, -50.1319,2464.9966,16.7326, VW_JAIL, -1, -1, 20.0);
	CreateDynamic3DTextLabel("{004483}Work Jail\n"WHITE"Su dung {004483}/jailwork"WHITE" de bat dau lao dong cong iche", -1, -50.1319,2464.9966,16.7326, 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, VW_JAIL, -1, -1, 20.0);
	
	CreateDynamicPickup(1239, 1, 23.5460,2505.8567,16.7321, VW_JAIL, -1, -1, 20.0);
	CreateDynamic3DTextLabel("{004483}Cladire Anexa\n"WHITE"Su dung {004483}F"WHITE" de su dung cua nay", -1, 23.5460,2505.8567,16.7321, 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, VW_JAIL, -1, -1, 20.0);
	
	CreateDynamicPickup(1239, 1, 187.0149,2475.8491,-17.2424, -1, 1, -1, 20.0);
	CreateDynamic3DTextLabel("{004483}Iesire Anexa\n"WHITE"Su dung {004483}F"WHITE" de su dung cua nay", -1, 187.0149,2475.8491,-17.2424, 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, 1, -1, 20.0);
	
	CreateDynamicPickup(1239, 1, 181.4308,2469.6050,-17.2424, -1, 1, -1, 20.0);
	CreateDynamic3DTextLabel("{004483}Prison Escape\n"WHITE"Su dung {004483}F"WHITE" de ra khoi nguc", -1, 181.4308,2469.6050,-17.2424, 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, 1, -1, 20.0);

	// exterior
	new tmpobjid;
	tmpobjid = CreateDynamicObject(19912, 14.159736, 2565.458740, 18.099275, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, 25.679721, 2565.458740, 18.099275, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, 37.189735, 2565.458740, 18.099275, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, 48.699729, 2565.458740, 18.089273, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, 60.159770, 2565.458740, 18.089273, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, 65.939773, 2565.458740, 18.089273, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, 65.939773, 2565.458740, 18.089273, 0.000000, 0.000000, 90.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, 65.939773, 2553.969238, 18.089273, 0.000000, 0.000000, 90.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, 65.939773, 2542.466064, 18.089273, 0.000000, 0.000000, 90.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, 65.939773, 2530.965087, 18.089273, 0.000000, 0.000000, 90.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, 65.939773, 2519.502441, 18.089273, 0.000000, 0.000000, 90.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, 65.939773, 2508.050537, 18.089273, 0.000000, 0.000000, 90.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, 65.939773, 2496.580322, 18.089273, 0.000000, 0.000000, 90.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, 65.939773, 2485.112792, 18.089273, 0.000000, 0.000000, 90.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, 65.939773, 2473.614257, 18.089273, 0.000000, 0.000000, 90.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, 65.939773, 2462.144287, 18.089273, 0.000000, 0.000000, 90.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, 65.939773, 2450.694335, 18.089273, 0.000000, 0.000000, 90.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, 65.939773, 2440.715576, 18.089273, 0.000000, 0.000000, 90.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, 54.449748, 2429.232421, 18.089273, 0.000000, 0.000000, 180.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, 42.979724, 2429.232421, 18.089273, 0.000000, 0.000000, 180.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, 31.509729, 2429.232421, 18.089273, 0.000000, 0.000000, 180.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, 20.059728, 2429.232421, 18.089273, 0.000000, 0.000000, 180.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, 8.569731, 2429.232421, 18.089273, 0.000000, 0.000000, 180.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, -2.930264, 2429.232421, 18.089273, 0.000000, 0.000000, 180.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, -14.400259, 2429.232421, 18.089273, 0.000000, 0.000000, 180.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, -25.880270, 2429.232421, 18.089273, 0.000000, 0.000000, 180.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, -37.340312, 2429.232421, 18.089273, 0.000000, 0.000000, 180.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, -48.810287, 2429.232421, 18.089273, 0.000000, 0.000000, 180.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, -59.060276, 2429.232421, 18.089273, 0.000000, 0.000000, 180.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, -59.060276, 2429.232421, 18.089273, 0.000000, 0.000000, 270.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, -59.060276, 2440.742675, 18.089273, 0.000000, 0.000000, 270.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, -59.060276, 2452.194335, 18.089273, 0.000000, 0.000000, 270.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, -59.060276, 2463.656494, 18.089273, 0.000000, 0.000000, 270.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, -59.060276, 2475.116943, 18.089273, 0.000000, 0.000000, 270.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, -59.060276, 2486.581787, 18.089273, 0.000000, 0.000000, 270.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, -59.060276, 2498.051757, 18.089273, 0.000000, 0.000000, 270.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, -59.060276, 2509.542968, 18.089273, 0.000000, 0.000000, 270.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, -47.550243, 2486.581787, 18.089273, 0.000000, 0.000000, 360.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, -36.100231, 2486.581787, 18.089273, 0.000000, 0.000000, 360.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(12922, -28.910474, 2486.657226, 18.871610, 0.000000, 0.000000, 180.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 7978, "vgssairport", "Industdoor9white", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, -10.160229, 2486.581787, 18.089273, 0.000000, 0.000000, 360.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, 1.319772, 2486.581787, 18.089273, 0.000000, 0.000000, 360.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, 12.789770, 2486.581787, 18.089273, 0.000000, 0.000000, 360.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, 24.259756, 2486.581787, 18.089273, 0.000000, 0.000000, 360.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, 35.709766, 2486.581787, 18.089273, 0.000000, 0.000000, 360.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, 47.169765, 2486.581787, 18.089273, 0.000000, 0.000000, 360.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	tmpobjid = CreateDynamicObject(19912, 58.629764, 2486.581787, 18.089273, 0.000000, 0.000000, 360.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);

	tmpobjid = CreateDynamicObject(4079, -26.822429, 2543.293212, 28.264553, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2957, -52.207256, 2516.445800, 16.912254, 0.000000, 0.000000, -45.399993, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2957, -50.444942, 2514.645751, 16.912254, 0.000000, 0.000000, -45.399993, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2957, -50.458984, 2514.659912, 20.122253, 0.000000, 0.000000, -45.399993, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2957, -52.165134, 2516.405029, 20.122253, 0.000000, 0.000000, -45.399993, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19529, 3.444571, 2553.828369, 15.701624, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19529, 3.444571, 2491.719482, 15.691626, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18766, -54.158370, 2518.312011, 13.481609, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18766, -54.158370, 2518.312011, 18.401607, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19912, 65.969741, 2486.581787, 18.089273, 0.000000, 0.000000, 360.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(3279, 61.512649, 2560.465087, 15.571621, 0.000000, 0.000000, 180.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(3279, 61.512649, 2490.752929, 15.571621, 0.000000, 0.000000, 180.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(700, -12.428980, 2523.813476, 15.701624, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(654, 14.938351, 2490.919433, 15.701624, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(700, -5.018974, 2536.455810, 15.701624, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(703, 11.221879, 2557.408935, 15.261631, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(700, 1.501023, 2545.615722, 15.701624, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(703, 28.781887, 2557.408935, 15.261631, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18981, 31.850301, 2528.105957, 15.241620, 180.000000, 90.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(703, 49.931884, 2557.408935, 15.261631, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1358, 34.836765, 2500.896972, 16.882272, 0.000000, 0.000000, 90.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(16070, 31.996604, 2503.591552, 21.271602, 0.000000, 0.000000, 270.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18766, 44.299575, 2507.548095, 15.292083, 90.000000, 90.000000, 90.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18766, 38.569557, 2507.578125, 15.232083, 90.000000, 90.000000, 90.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18766, 38.569557, 2502.581054, 15.232083, 90.000000, 90.000000, 90.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18766, 38.569557, 2497.591552, 15.232083, 90.000000, 90.000000, 90.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18766, 38.569557, 2494.589355, 15.212081, 90.000000, 90.000000, 90.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18766, 24.989532, 2506.847412, 15.232083, 90.000000, 90.000000, 90.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(703, 60.821899, 2548.096679, 15.261631, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(14781, 22.138050, 2536.352783, 16.721620, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(703, 60.821899, 2525.405273, 15.261631, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(14781, 40.378051, 2536.352783, 16.721620, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(703, 60.821899, 2502.183349, 15.261631, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18762, 40.265544, 2509.557128, 17.071622, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18762, 40.575542, 2509.557128, 17.071622, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(700, -17.358968, 2518.254150, 15.701624, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(700, -22.088962, 2513.761962, 15.701624, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(700, -30.108968, 2510.699707, 15.701624, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(700, -36.788967, 2510.699707, 15.701624, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(700, -45.708946, 2510.699707, 15.701624, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(700, -53.558921, 2510.699707, 15.701624, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(14781, 40.378051, 2518.550048, 16.721620, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(14781, 22.118024, 2518.550048, 16.721620, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2627, 38.502738, 2532.289306, 15.741619, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2628, 27.108581, 2521.302734, 15.741619, 0.000000, 0.000000, 90.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2630, 34.984645, 2538.186767, 15.741619, 0.000000, 0.000000, 90.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2630, 34.984645, 2535.376464, 15.741619, 0.000000, 0.000000, 90.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2630, 27.174646, 2535.376464, 15.741619, 0.000000, 0.000000, 270.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2630, 27.174646, 2537.876953, 15.741619, 0.000000, 0.000000, 270.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2628, 27.108581, 2516.720703, 15.741619, 0.000000, 0.000000, 90.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2628, 36.588558, 2516.720703, 15.741619, 0.000000, 0.000000, 270.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2628, 36.588558, 2521.431396, 15.741619, 0.000000, 0.000000, 270.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2627, 43.312732, 2532.289306, 15.741619, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2627, 43.312732, 2523.445556, 15.741619, 0.000000, 0.000000, 180.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2627, 38.302749, 2523.445556, 15.741619, 0.000000, 0.000000, 180.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(654, 6.308340, 2490.919433, 15.701624, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(654, -1.601659, 2490.919433, 15.701624, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(654, -10.151664, 2490.919433, 15.701624, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(654, -18.571680, 2490.919433, 15.701624, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(654, -38.161685, 2490.919433, 15.701624, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(654, -46.901672, 2490.919433, 15.701624, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(3279, -54.337360, 2490.752929, 15.571621, 0.000000, 0.000000, 180.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(654, -54.501667, 2500.572021, 15.701624, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(654, -54.501667, 2507.114257, 15.701624, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(16124, 57.099102, 2460.340332, 15.691626, 0.000000, 0.000000, 180.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(16124, 67.469093, 2460.340332, 22.291627, 0.000000, 0.000000, 180.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(16124, 63.090824, 2443.890869, 22.291627, 0.000000, 0.000000, -142.599929, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(16124, 60.611911, 2434.238769, 22.291627, 0.000000, 0.000000, -142.599929, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1304, 60.150951, 2472.973876, 21.871625, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(16124, 76.280082, 2466.073242, 22.291627, 0.000000, 0.000000, -142.599929, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(16124, 70.541053, 2463.334960, 22.291627, 0.000000, 0.000000, -164.199905, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1304, 59.020957, 2472.973876, 21.871625, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1304, 59.020957, 2472.973876, 21.871625, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19374, 53.301113, 2469.421630, 22.465379, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19374, 53.301113, 2470.910888, 21.595375, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19374, 53.301113, 2468.191650, 22.465379, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(8355, -59.120639, 2471.069335, 15.691626, 0.000000, 90.000000, 180.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(8355, 6.649360, 2428.559326, 15.691626, 0.000000, 90.000000, 270.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(8355, 66.129386, 2499.052734, 29.231639, 0.000000, 90.000000, 360.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(8355, 0.759375, 2566.423339, 29.231639, 0.000000, 90.000000, 450.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(16108, -39.370914, 2453.463134, 19.937822, 0.000006, 0.000000, -0.000006, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(11461, 25.995037, 2437.837890, 13.996993, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(3425, -0.224528, 2465.774169, 26.538938, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(726, 9.488780, 2441.891601, 15.087466, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(726, 21.088781, 2451.732421, 15.087466, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(726, 41.248767, 2446.982421, 15.087466, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(726, 44.928775, 2478.422851, 15.087466, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(726, 37.538784, 2465.891113, 15.087466, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(726, 20.298778, 2475.621826, 15.087466, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(726, 4.298775, 2472.391845, 15.087466, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(726, -8.941227, 2453.791503, 15.087466, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(726, -15.581227, 2442.121337, 15.087466, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(726, -38.201202, 2448.001220, 15.087466, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(726, -49.611198, 2450.080078, 15.087466, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(726, -49.611198, 2478.072021, 15.087466, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(726, -10.811201, 2475.611816, 15.087466, 0.000000, 0.000000, 0.000000, VW_JAIL, -1, -1, 300.00, 300.00);
	
	//hol
	tmpobjid = CreateDynamicObject(19458, 187.512496, 2472.379150, -18.328365, 0.000000, 90.000000, 180.000000, -1, 1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "carp02S", 0x00000000);
	tmpobjid = CreateDynamicObject(19458, 184.052398, 2472.379150, -18.328365, 0.000000, 90.000000, 180.000000, -1, 1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "carp02S", 0x00000000);
	tmpobjid = CreateDynamicObject(19458, 180.582427, 2472.379150, -18.328365, 0.000000, 90.000000, 180.000000, -1, 1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "carp02S", 0x00000000);
	tmpobjid = CreateDynamicObject(19379, 184.214996, 2472.285400, -14.872422, 0.000000, 90.000000, 0.000000, -1, 1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "dt_office_roof", 0x00000000);
	tmpobjid = CreateDynamicObject(2370, 189.351730, 2473.132568, -18.442430, 0.000000, 0.000000, 90.000000, -1, 1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	tmpobjid = CreateDynamicObject(19454, 189.247161, 2472.376953, -16.612430, 0.000000, 0.000000, 0.000000, -1, 1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19454, 184.537048, 2467.686767, -16.612430, 0.000000, 0.000000, 90.000000, -1, 1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19454, 180.936981, 2467.686767, -16.612430, 0.000000, 0.000000, 180.000000, -1, 1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19454, 185.527191, 2476.317871, -16.612430, 0.000000, 0.000000, 0.000000, -1, 1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19454, 186.327133, 2476.616943, -16.612430, 0.000000, 0.000000, 90.000000, -1, 1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19454, 180.797103, 2471.558105, -16.612430, 0.000000, 0.000000, 90.000000, -1, 1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1504, 185.620254, 2473.371093, -18.242427, 0.000000, 0.000000, 90.000000, -1, 1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1504, 188.710235, 2467.769775, -18.242427, 0.000000, 0.000000, 180.000000, -1, 1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1504, 180.990188, 2470.381835, -18.242427, 0.000000, 0.000000, 270.000000, -1, 1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1708, 188.599212, 2472.420410, -18.242427, 0.000000, 0.000000, 270.000000, -1, 1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1708, 188.599212, 2475.460693, -18.242427, 0.000000, 0.000000, 270.000000, -1, 1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1536, 186.132751, 2476.504882, -18.242427, 0.000000, 0.000000, 0.000000, -1, 1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2314, 185.196838, 2468.192138, -18.242427, 0.000000, 0.000000, 180.000000, -1, 1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19172, 189.162490, 2473.480468, -16.522409, 0.000000, 0.000000, 270.000000, -1, 1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19173, 189.142440, 2469.318847, -16.412414, 0.000000, 0.000000, 270.000000, -1, 1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19174, 183.012405, 2471.479248, -16.682432, 0.000000, 0.000000, 360.000000, -1, 1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19175, 184.412368, 2467.788330, -16.842414, 0.000000, 0.000000, 180.000000, -1, 1, -1, 300.00, 300.00);
	
	//tunel escape
	tmpobjid = CreateDynamicObject(18817, 57.306488, 2473.367187, -48.589725, 89.899871, -89.699935, -33.000000, -1, 1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 1, 3374, "ce_farmxref", "desertstones256", 0x00000000);
	tmpobjid = CreateDynamicObject(18823, 94.235595, 2462.118652, -48.248977, 85.399993, 89.499916, 8.299951, -1, 1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 1, 3374, "ce_farmxref", "desertstones256", 0x00000000);
	tmpobjid = CreateDynamicObject(18823, 66.311058, 2520.752441, -48.380832, 88.399940, 89.499916, 97.699928, -1, 1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 1, 3374, "ce_farmxref", "desertstones256", 0x00000000);
	tmpobjid = CreateDynamicObject(18823, 16.147890, 2448.815185, -48.147274, 85.399993, 89.499916, 8.299951, -1, 1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 1, 3374, "ce_farmxref", "desertstones256", 0x00000000);
	tmpobjid = CreateDynamicObject(18783, 58.430614, 2545.421875, -52.507324, 94.099998, 0.000000, 40.799995, -1, 1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 1, 3374, "ce_farmxref", "desertstones256", 0x00000000);
	tmpobjid = CreateDynamicObject(18783, -4.911019, 2454.449707, -52.872669, 94.099998, 0.000000, 40.799995, -1, 1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 1, 3374, "ce_farmxref", "desertstones256", 0x00000000);
	tmpobjid = CreateDynamicObject(18783, 104.091011, 2466.560058, -51.293025, 91.099937, 0.000000, -12.499947, -1, 1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 1, 3374, "ce_farmxref", "desertstones256", 0x00000000);
	return 1;
}
Dialog:DIALOG_ESCAPE(playerid, response, listitem, inputtext[]) {
	if(!response) return 1;
	PlayerInfo[playerid][pEscapePoints] -= 10;
	PlayerInfo[playerid][pEscape] = 1;
	SendClientMessage(playerid, -1, "{ddb49d}Nguoi canh sat tham nhung da ho tong ban xuong duong ham, nhung de khong bi nghi ngo, anh ta phai tro ve vi tri cua minh.");
	SendClientMessage(playerid, -1, "{ddb49d}De thoat ra khoi day, ban can phai nhanh chong tim duoc loi ra.");
	SendClientMessage(playerid, -1, "{ddb49d}Ban co 1 phut 30 giay de tim mot loi ra.");
	SetPlayerInterior(playerid, 1);
	SetPlayerVirtualWorld(playerid, playerid+1);
	SetPlayerPosEx(playerid, 105.1633,2460.4089,-51.0005);
	switch(random(2)) {
		case 0: {
			PlayerInfo[playerid][pEscapeExit] = 1;
			PlayerInfo[playerid][pEscapeT] = CreateDynamic3DTextLabel("{004483}Prison Escape\n"WHITE"Nhan phim {004483}F"WHITE" de ra khoi duong ham",0x0E9107FF,59.1325,2541.6426,-52.4940,15, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, GetPlayerVirtualWorld(playerid), 1, -1, 5.0);
			PlayerInfo[playerid][pEscapeP] = CreateDynamicPickup(1239, 1, 59.1325,2541.6426,-52.4940, GetPlayerVirtualWorld(playerid), 1, -1, 15.0);
		}
		case 1: {
			PlayerInfo[playerid][pEscapeExit] = 2;
			PlayerInfo[playerid][pEscapeT] = CreateDynamic3DTextLabel("{004483}Prison Escape\n"WHITE"Nhan phim {004483}F"WHITE" de ra khoi duong ham",0x0E9107FF,-4.4659,2450.2810,-52.3575,15, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, GetPlayerVirtualWorld(playerid), 1, -1, 5.0);
			PlayerInfo[playerid][pEscapeP] = CreateDynamicPickup(1239, 1, -4.4659,2450.2810,-52.3575, GetPlayerVirtualWorld(playerid), 1, -1, 15.0);
		}
	}
	return 1;
}
Dialog:DIALOG_JMENU(playerid, response, listitem, inputtext[]) {
	if(!response) return 1;
	switch(listitem) {
		case 0: {
			if(PlayerInfo[playerid][pJailed] == 2) return va_Info(playerid, "Tuy chon nay khong kha dung vi ban dang o trong mot nha tu tu do.");
			Dialog_Show(playerid, DIALOG_JMENU2, DIALOG_STYLE_MSGBOX, "Nha tu tu do", "Ban co chac chan muon hoi lo canh sat $15,000 de duoc chuyen sang nha tu tu do?", "Co", "Khong");
		}
		case 1: {
			if(FreePoints == 0) return va_Info(playerid, "Tuy chon nay khong kha dung vi ban khong co Free Point.");
			Dialog_Show(playerid, DIALOG_JMENU3, DIALOG_STYLE_MSGBOX, "Menu", "Ban co chac muon hoi lo canh sat $150,000 de duoc tha ra ngoai?", "Co", "Khong");
		}
	}
	return 1;
}
Dialog:DIALOG_JMENU2(playerid, response, listitem, inputtext[]) {
	if(!response) return 1;
	GivePlayerCash(playerid, -15000);
	PlayerInfo[playerid][pJailed] = 2;
	SetPlayerPosEx(playerid, -13.0627,2530.0303,17.1090);
	SetPlayerInterior(playerid, 0); SetPlayerVirtualWorld(playerid, VW_JAIL);
	SendClientMessage(playerid, -1, "{ddb49d} Ban da mua chuoc canh sat thanh cong, ban duoc chuyen ra khu tu do.");
	return 1;
}
Dialog:DIALOG_JMENU3(playerid, response, listitem, inputtext[]) {
	if(!response) return 1;
	GivePlayerCash(playerid, -150000);
	PlayerInfo[playerid][pJailTime] = 1;
	SendClientMessage(playerid, -1, "{ddb49d} Ban da mua chuoc canh sat thanh cong, ban duoc tha.");
	FreePoints --;
	new query[200];
	format(query, sizeof(query), "UPDATE `paint` SET `Kills`='%d' WHERE `ID`='4'", FreePoints);
	mysql_pquery(SQL, query);
	return 1;
}
CMD:jailwork(playerid, params[]) {
	if(PlayerInfo[playerid][pJailed] != 2) return 1;
	if(IsPlayerInRangeOfPoint(playerid, 5.0, -50.1319,2464.9966,16.7326)) {
		new randcp = random(sizeof(CHKWorkJail));
		SetPlayerCheckpointEx(playerid, CHKWorkJail[randcp][0],CHKWorkJail[randcp][1],CHKWorkJail[randcp][2], 2.0);
		SendClientMessage(playerid, X11_SPRING_GREEN, "[JAIL WORK] "WHITE"Checkpoint da duoc dat, hay den do de nho co.");
		CP[playerid] = 178;
	}
	else {
		if(CP[playerid] != 0) return Dialog_Show(playerid, DIALOG_CHECKPOINT, DIALOG_STYLE_MSGBOX, "Checkpoint", "Mot cham do dang hoat dong.\nBan co muon xoa no khong? Neu muon, hay chon 'Ok'.", "Ok", "Exit");
		
		SendClientMessage(playerid, -1,""RED"[ERROR]: "WHITE"Ban khong o diem bat dau lam Lao dong cong ich trong tu. Hay den diem "RED"checkpoint"WHITE" tren ban do.");
		SetPlayerCheckpointEx(playerid, -50.1319,2464.9966,16.7326, 5.0);
		CP[playerid] = 53;
		return 1;
	}
	return 1;
}
CMD:jailmenu(playerid, params[]) {
	if(PlayerInfo[playerid][pJailed] == 1||PlayerInfo[playerid][pJailed] == 2) {
	 	new checkjail[32], szDialog2[2048], szDialog[1024];
		if(FreePoints == 0) checkjail = "khong co san";
		else format(checkjail, 32, "%d free points co san", FreePoints);
		strcat(szDialog2, "Tuy chon co san\tGia\tco san\nFree Jail (sân tù)\t$15,000\tco san\n");
		format(szDialog, 1024, "Ra tù (khu tu do)\t$150,000\t%s\n",checkjail);
		strcat(szDialog2, szDialog);
		Dialog_Show(playerid, DIALOG_JMENU, DIALOG_STYLE_TABLIST_HEADERS, "Menu jail:", szDialog2, #Select, #Cancel);
	}
	return 1;
}
timer WorkJail[4000](playerid) {
	DestroyPlayerObject(playerid, plant[playerid]);
	ClearAnimations(playerid); 
	TogglePlayerControllable(playerid, true);
	SetPlayerAttachedObject(playerid, ATTACHMENT_ID_BALE, 2901, 4, 0.196271, -0.356000, 0.100500, 0.000000, 80.546043, 0.000000);
	ApplyAnimation(playerid, #CARRY, #crry_prtial, 4.0, 0, 0, 0, 0, 0);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	new randcp = random(sizeof(CHKWorkJail2));
	SetPlayerCheckpoint(playerid, CHKWorkJail2[randcp][0],CHKWorkJail2[randcp][1],CHKWorkJail2[randcp][2], 2.0);
	CP[playerid] = 177;
	return 1;
}
Dialog:DIALOG_FREEJ(playerid, response, listitem, inputtext[])
{
	if(!response) return 1;
	va_Info(playerid, "Ban da tra 10 rob point, ban nhan 1 free point va $150,000.");
	PlayerInfo[playerid][pRob] -= 10, FreePoints ++, GivePlayerCash(playerid, 150000);
	new query[200];
	format(query, sizeof(query), "UPDATE `paint` SET `Kills`='%d' WHERE `ID`='4'", FreePoints);
	mysql_pquery(SQL, query);	
	return 1;
}