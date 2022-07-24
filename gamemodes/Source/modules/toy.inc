#include "YSI_Coding\y_hooks"

//LIMIT
#define MAX_PLAYERTOYS 20
#define MAX_ITEMS 	   30

enum ShopItem {
    sItemPrice,
}
new ShopItems[MAX_ITEMS][ShopItem];
enum ptInfo {
    ptID,
    ptModelID,
    ptBone,
    ptTradable,
    ptSpecial,
    Float:ptPosX,
    Float:ptPosY,
    Float:ptPosZ,
    Float:ptRotX,
    Float:ptRotY,
    Float:ptRotZ,
    Float:ptScaleX,
    Float:ptScaleY,
    Float:ptScaleZ,
};
new PlayerToyInfo[MAX_PLAYERS][MAX_PLAYERTOYS][ptInfo];
// Tradable Toys
new InsideTradeToys[MAX_PLAYERS], PlayerText:ttBackground[MAX_PLAYERS], PlayerText:ttModel[MAX_PLAYERS], PlayerText:ttObjectInfo[MAX_PLAYERS], PlayerText:ttLogo[MAX_PLAYERS], PlayerText:ttPurchase[MAX_PLAYERS],
    PlayerText:ttDecline[MAX_PLAYERS], PlayerText:ttOffer[MAX_PLAYERS], PlayerText:ttNote[MAX_PLAYERS], PlayerText:ttYes[MAX_PLAYERS], PlayerText:ttNo[MAX_PLAYERS];

new PlayerHoldingObject[MAX_PLAYERS][11];
enum HoldingEnumAll {
    holdingmodelid,
    holdingprice,
    holdingmodelname[24]
}
new HoldingObjectsAll[][HoldingEnumAll] = {
    { 18642, 1000, "Taser1" },
    { 18643, 10000, "LaserPointer1" },
    { 19080, 10000, "LaserPointer2" },
    { 19081, 10000, "LaserPointer3" },
    { 19082, 10000, "LaserPointer4" },
    { 19083, 10000, "LaserPointer5" },
    { 19084, 10000, "LaserPointer6" },
    { 19086, 5000, "ChainsawDildo1" },
    { 18675, 10000, "SmokePuff" },
    { 19701, 10000, "SmallFlame" },
    { 18693, 10000, "LargeFlame" },
    { 18698, 10000, "Insects" },
    { 18708, 10000, "Bubbles" },
    { 19141, 2500, "SWATHelmet1" },
    { 19142, 2500, "SWATArmour1" },
    { 18636, 1000, "PoliceCap1" },
    { 19099, 1000, "PoliceCap2" },
    { 19100, 1000, "PoliceCap3" },
    { 18637, 1000, "PoliceShield1" },
    { 19161, 1000, "PoliceHat1" },
    { 19162, 1000, "PoliceHat2" },
    { 19200, 1000, "PoliceHelmet1" },
    { 19138, 1000, "PoliceGlasses1" },
    { 19139, 1000, "PoliceGlasses2" },
    { 19140, 1000, "PoliceGlasses3" },
    { 18632, 1000, "FishingRod" },
    { 18633, 1500, "Wrench" },
    { 18634, 1000, "Crowbar" },
    { 18635, 1000, "Hammer" },
    { 18638, 500, "HardHat" },
    { 19093, 500, "HardHat2" },
    { 19160, 500, "HardHat3" },
    { 18639, 500, "BlackHat" },
    { 19317, 1000, "Bass Guitar" },
    { 19318, 1000, "FlyingV Guitar" },
    { 19319, 1000, "Warlock Guitar" },
    { 18640, 700, "Hair" },
    { 18975, 700, "Hair2" },
    { 19136, 700, "Hair3" },
    { 19274, 700, "Hair4" },
    { 18641, 1000, "Flashlight" },
    { 18644, 5000, "Screwdriver" },
    { 18865, 500, "MobilePhone1" },
    { 18866, 500, "MobilePhone2" },
    { 18867, 500, "MobilePhone3" },
    { 18868, 500, "MobilePhone4" },
    { 18869, 500, "MobilePhone5" },
    { 18870, 1000, "MobilePhone6" },
    { 18871, 1000, "MobilePhone7" },
    { 18872, 1000, "MobilePhone8" },
    { 18873, 1000, "MobilePhone9" },
    { 18874, 1000, "MobilePhone10" },
    { 18875, 750, "Pager" },
    { 18890, 500, "Rake" },
    { 18891, 500, "Bandana1" },
    { 18892, 500, "Bandana2" },
    { 18893, 500, "Bandana3" },
    { 18894, 500, "Bandana4" },
    { 18895, 500, "Bandana5" },
    { 18896, 500, "Bandana6" },
    { 18897, 500, "Bandana7" },
    { 18898, 500, "Bandana8" },
    { 18899, 500, "Bandana9" },
    { 18900, 500, "Bandana10" },
    { 18901, 750, "Bandana11" },
    { 18902, 750, "Bandana12" },
    { 18903, 750, "Bandana13" },
    { 18904, 750, "Bandana14" },
    { 18905, 750, "Bandana15" },
    { 18906, 750, "Bandana16" },
    { 18907, 750, "Bandana17" },
    { 18908, 750, "Bandana18" },
    { 18909, 750, "Bandana19" },
    { 18910, 750, "Bandana20" },
    { 18911, 1000, "Mask1" },
    { 18912, 1000, "Mask2" },
    { 18913, 1000, "Mask3" },
    { 18914, 1000, "Mask4" },
    { 18915, 1000, "Mask5" },
    { 18916, 1000, "Mask6" },
    { 18917, 1000, "Mask7" },
    { 18918, 1000, "Mask8" },
    { 18919, 1000, "Mask9" },
    { 18920, 1000, "Mask10" },
    { 18921, 500, "Beret1" },
    { 18922, 500, "Beret2" },
    { 18923, 750, "Beret3" },
    { 18924, 1000, "Beret4" },
    { 18925, 1000, "Beret5" },
    { 18926, 500, "Hat1" },
    { 18927, 500, "Hat2" },
    { 18928, 500, "Hat3" },
    { 18929, 500, "Hat4" },
    { 18930, 500, "Hat5" },
    { 18931, 1000, "Hat6" },
    { 18932, 1000, "Hat7" },
    { 18933, 1000, "Hat8" },
    { 18934, 1000, "Hat9" },
    { 18935, 1000, "Hat10" },
    { 18936, 500, "Helmet1" },
    { 18937, 750, "Helmet2" },
    { 18938, 1000, "Helmet3" },
    { 18939, 750, "CapBack1" },
    { 18940, 750, "CapBack2" },
    { 18941, 750, "CapBack3" },
    { 18942, 1000, "CapBack4" },
    { 18943, 1000, "CapBack5" },
    { 18944, 1000, "HatBoater1" },
    { 18945, 1250, "HatBoater2" },
    { 18946, 1500, "HatBoater3" },
    { 18947, 1000, "HatBowler1" },
    { 18948, 1000, "HatBowler2" },
    { 18949, 1000, "HatBowler3" },
    { 18950, 1000, "HatBowler4" },
    { 18951, 1000, "HatBowler5" },
    { 18952, 1500, "BoxingHelmet" },
    { 18953, 500, "CapKnit1" },
    { 18954, 750, "CapKnit2" },
    { 18955, 750, "CapOverEye1" },
    { 18956, 750, "CapOverEye2" },
    { 18957, 750, "CapOverEye3" },
    { 18958, 750, "CapOverEye4" },
    { 18959, 750, "CapOverEye5" },
    { 18960, 1000, "CapRimUp1" },
    { 18961, 750, "CapTrucker1" },
    { 18962, 750, "CowboyHat2" },
    { 18964, 1000, "SkullyCap1" },
    { 18965, 1250, "SkullyCap2" },
    { 18966, 1500, "SkullyCap3" },
    { 18967, 1000, "HatMan1" },
    { 18968, 1000, "HatMan2" },
    { 18969, 1000, "HatMan3" },
    { 18970, 2000, "HatTiger" },
    { 18971, 1000, "HatCool1" },
    { 18972, 1250, "HatCool2" },
    { 18973, 1500, "HatCool3" },
    { 18974, 10000, "MaskZorro1" },
    { 18645, 1500, "MotorcycleHelmet" },
    { 18976, 1000, "MotorcycleHelmet2" },
    { 18977, 1000, "MotorcycleHelmet3" },
    { 18978, 1250, "MotorcycleHelmet4" },
    { 18979, 1500, "MotorcycleHelmet5" },
    { 19006, 500, "GlassesType1" },
    { 19007, 500, "GlassesType2" },
    { 19008, 500, "GlassesType3" },
    { 19009, 500, "GlassesType4" },
    { 19010, 500, "GlassesType5" },
    { 19011, 500, "GlassesType6" },
    { 19012, 500, "GlassesType7" },
    { 19013, 500, "GlassesType8" },
    { 19014, 500, "GlassesType9" },
    { 19015, 500, "GlassesType10" },
    { 19016, 1000, "GlassesType11" },
    { 19017, 1000, "GlassesType12" },
    { 19018, 1000, "GlassesType13" },
    { 19019, 1000, "GlassesType14" },
    { 19020, 1000, "GlassesType15" },
    { 19021, 1000, "GlassesType16" },
    { 19022, 1000, "GlassesType17" },
    { 19023, 1000, "GlassesType18" },
    { 19024, 1000, "GlassesType19" },
    { 19025, 1000, "GlassesType20" },
    { 19026, 1500, "GlassesType21" },
    { 19027, 1500, "GlassesType22" },
    { 19028, 1500, "GlassesType23" },
    { 19029, 1500, "GlassesType24" },
    { 19030, 1500, "GlassesType25" },
    { 19031, 1500, "GlassesType26" },
    { 19032, 1500, "GlassesType27" },
    { 19033, 1500, "GlassesType28" },
    { 19034, 1500, "GlassesType29" },
    { 19035, 1500, "GlassesType30" },
    { 19036, 2000, "HockeyMask1" },
    { 19037, 2000, "HockeyMask2" },
    { 19038, 2000, "HockeyMask3" },
    { 19039, 500, "WatchType1" },
    { 19040, 500, "WatchType2" },
    { 19041, 500, "WatchType3" },
    { 19042, 500, "WatchType4" },
    { 19043, 500, "WatchType5" },
    { 19044, 500, "WatchType6" },
    { 19045, 500, "WatchType7" },
    { 19046, 1000, "WatchType8" },
    { 19047, 1000, "WatchType9" },
    { 19048, 1000, "WatchType10" },
    { 19049, 1000, "WatchType11" },
    { 19050, 1000, "WatchType12" },
    { 19051, 1000, "WatchType13" },
    { 19052, 1000, "WatchType14" },
    { 19053, 1000, "WatchType15" },
    { 19064, 10000, "SantaHat1" },
    { 19065, 20000, "SantaHat2" },
    { 19066, 30000, "SantaHat3" },
    { 19067, 1000, "HoodyHat1" },
    { 19068, 1000, "HoodyHat2" },
    { 19069, 1000, "HoodyHat3" },
    { 19078, 7500, "TheParrot1" },
    { 19079, 7500, "TheParrot2" },
    { 19085, 5000, "EyePatch" },
    { 19090, 1500, "PomPomBlue" },
    { 19091, 1500, "PomPomRed" },
    { 19092, 1500, "PomPomGreen" },
    { 19094, 2000, "BurgerShotHat" },
    { 19095, 500, "CowboyHat1" },
    { 19096, 500, "CowboyHat3" },
    { 19097, 1000, "CowboyHat4" },
    { 19098, 1000, "CowboyHat5" },
    { 19101, 2000, "ArmyHelmet1" },
    { 19102, 2000, "ArmyHelmet2" },
    { 19103, 2000, "ArmyHelmet3" },
    { 19104, 2000, "ArmyHelmet4" },
    { 19105, 2000, "ArmyHelmet5" },
    { 19106, 2000, "ArmyHelmet6" },
    { 19107, 4000, "ArmyHelmet7" },
    { 19108, 4000, "ArmyHelmet8" },
    { 19109, 4000, "ArmyHelmet9" },
    { 19110, 4000, "ArmyHelmet10" },
    { 19111, 4000, "ArmyHelmet11" },
    { 19112, 4000, "ArmyHelmet12" },
    { 19113, 1000, "SillyHelmet1" },
    { 19114, 2000, "SillyHelmet2" },
    { 19115, 3000, "SillyHelmet3" },
    { 19116, 500, "PlainHelmet1" },
    { 19117, 500, "PlainHelmet2" },
    { 19118, 750, "PlainHelmet3" },
    { 19119, 1000, "PlainHelmet4" },
    { 19120, 1000, "PlainHelmet5" },
    { 19137, 5000, "CluckinBellHat" },
    { 19163, 1000, "GimpMask" },
    { 1210, 500, "Briefcase" },
    { 18647, 0, "RedNeonTube1" },
    { 18648, 0, "BlueNeonTube1" },
    { 18649, 0, "GreenNeonTube1" },
    { 18650, 0, "YellowNeonTube1" },
    { 18651, 0, "PinkNeonTube1" },
    { 18652, 0, "WhiteNeonTube1" },
    { 365, 0, "Spray Can" },
    { 373, 0, "Armour model" },
    { 371, 0, "Parachute" },
    { 1486, 0, "Beer Bottle" },
    { 1575, 0, "white sack of cocaine" },
    { 1212, 0, "money packet" },
    { 348, 0, "deagle toy" },
    { 349, 0, "shotgun toy" },
    { 352, 0, "uzi toy" },
    { 353, 0, "mp5 toy" },
    { 343, 0, "teargas grenade" },
    { 326, 0, "cane" },
    { 325, 0, "flowers" },
    { 355, 0, "AK47 toy" },
    { 371, 0, "parachute bag" },
    { 1484, 0, "beer bottle" },
    { 3028, 0, "sword" },
    { 1279, 0, "drug bundle" },
    { 19348, 0, "cane" },
    { 19349, 0, "monocle" },
    { 19350, 0, "moustache1" },
    { 19469, 0, "scarf" },
    { 19472, 0, "gasmask" },
    { 19352, 0, "Top hat 01" },
    { 19487, 0, "tophat02" },
    { 351, 0, "Combat Shotgun" },
    { 335, 0, "Combat Knife" },
    { 356, 0, "M4 Assault Rifle" },
    { 373, 0, "Armour Model" },
    { 1550, 0, "sack of money" },
    { 1212, 0, "money packet" },
    { 19347, 0, "Badge01" },
    { 19418, 0, "Handcuffs01" },
    { 19514, 0, "SWATHgrey" },
    { 19515, 0, "SWATAgrey" },
    { 19161, 0, "PoliceHat1" },
    { 19162, 0, "PoliceHat2" },
    { 18636, 0, "PoliceCap1" },
    { 19099, 0, "PoliceCap2" },
    { 19100, 0, "PoliceCap3" },
    { 18642, 0, "Taser1" },
    { 18637, 0, "Police Shield" },
    { 355, 0, "AK47" },
    { 358, 0, "Sniper Rifle" },
    { 366, 0, "Fire Extinguisher" },
    { 368, 0, "Nightvision Goggles" },
    { 1485, 0, "Weed" },
    { 2114, 0, "Basketball" },
    { 334, 0, "Nightstick" },
    { 3026, 0, "Purple Backpack" },
    { 19421, 0, "White Headphones" },
    { 19422, 0, "Black Headphones" },
    { 19423, 0, "Red Headphones" },
    { 19424, 0, "Blue Headphones" },
    { 11245, 0, "US Flag" },
    { 2404, 0, "Surfboard1" },
    { 2405, 0, "Surfboard2" },
    { 2406, 0, "Surfboard3" },
    { 1598, 0, "Beachball" },
    { 19331, 0, "Firefigher Helmet" },
    { 2045, 0, "Spiked Club" },
    { 19320, 0, "Pumpkin Toy" }
};
new HoldingObjects[206][HoldingEnumAll] = {
    { 18632, 10000, "FishingRod" },
    { 18633, 15000, "Wrench" },
    { 18634, 10000, "Crowbar" },
    { 18635, 10000, "Hammer" },
    { 18638, 5000, "HardHat" },
    { 19093, 5000, "HardHat2" },
    { 19160, 5000, "HardHat3" },
    { 18639, 5000, "BlackHat" },
    { 19317, 10000, "Bass Guitar" },
    { 19318, 10000, "FlyingV Guitar" },
    { 19319, 10000, "Warlock Guitar" },
    { 18640, 7000, "Hair" },
    { 18975, 7000, "Hair2" },
    { 19136, 7000, "Hair3" },
    { 19274, 7000, "Hair4" },
    { 18641, 10000, "Flashlight" },
    { 18644, 50000, "Screwdriver" },
    { 18865, 5000, "MobilePhone1" },
    { 18866, 5000, "MobilePhone2" },
    { 18867, 5000, "MobilePhone3" },
    { 18868, 5000, "MobilePhone4" },
    { 18869, 5000, "MobilePhone5" },
    { 18870, 10000, "MobilePhone6" },
    { 18871, 10000, "MobilePhone7" },
    { 18872, 10000, "MobilePhone8" },
    { 18873, 10000, "MobilePhone9" },
    { 18874, 10000, "MobilePhone10" },
    { 18875, 7500, "Pager" },
    { 18890, 5000, "Rake" },
    { 18891, 5000, "Bandana1" },
    { 18892, 5000, "Bandana2" },
    { 18893, 5000, "Bandana3" },
    { 18894, 5000, "Bandana4" },
    { 18895, 5000, "Bandana5" },
    { 18896, 5000, "Bandana6" },
    { 18897, 5000, "Bandana7" },
    { 18898, 5000, "Bandana8" },
    { 18899, 5000, "Bandana9" },
    { 18900, 5000, "Bandana10" },
    { 18901, 7500, "Bandana11" },
    { 18902, 7500, "Bandana12" },
    { 18903, 7500, "Bandana13" },
    { 18904, 7500, "Bandana14" },
    { 18905, 7500, "Bandana15" },
    { 18906, 7500, "Bandana16" },
    { 18907, 7500, "Bandana17" },
    { 18908, 7500, "Bandana18" },
    { 18909, 7500, "Bandana19" },
    { 18910, 7500, "Bandana20" },
    { 18911, 10000, "Mask1" },
    { 18912, 10000, "Mask2" },
    { 18913, 10000, "Mask3" },
    { 18914, 10000, "Mask4" },
    { 18915, 10000, "Mask5" },
    { 18916, 10000, "Mask6" },
    { 18917, 10000, "Mask7" },
    { 18918, 10000, "Mask8" },
    { 18919, 10000, "Mask9" },
    { 18920, 10000, "Mask10" },
    { 18921, 5000, "Beret1" },
    { 18922, 5000, "Beret2" },
    { 18923, 7500, "Beret3" },
    { 18924, 10000, "Beret4" },
    { 18925, 10000, "Beret5" },
    { 18926, 5000, "Hat1" },
    { 18927, 5000, "Hat2" },
    { 18928, 5000, "Hat3" },
    { 18929, 5000, "Hat4" },
    { 18930, 5000, "Hat5" },
    { 18931, 10000, "Hat6" },
    { 18932, 10000, "Hat7" },
    { 18933, 10000, "Hat8" },
    { 18934, 10000, "Hat9" },
    { 18935, 10000, "Hat10" },
    { 18936, 5000, "Helmet1" },
    { 18937, 7500, "Helmet2" },
    { 18938, 10000, "Helmet3" },
    { 18939, 7500, "CapBack1" },
    { 18940, 7500, "CapBack2" },
    { 18941, 7500, "CapBack3" },
    { 18942, 10000, "CapBack4" },
    { 18943, 10000, "CapBack5" },
    { 18944, 10000, "HatBoater1" },
    { 18945, 12500, "HatBoater2" },
    { 18946, 15000, "HatBoater3" },
    { 18947, 10000, "HatBowler1" },
    { 18948, 10000, "HatBowler2" },
    { 18949, 10000, "HatBowler3" },
    { 18950, 10000, "HatBowler4" },
    { 18951, 10000, "HatBowler5" },
    { 18952, 15000, "BoxingHelmet" },
    { 18953, 5000, "CapKnit1" },
    { 18954, 7500, "CapKnit2" },
    { 18955, 7500, "CapOverEye1" },
    { 18956, 7500, "CapOverEye2" },
    { 18957, 7500, "CapOverEye3" },
    { 18958, 7500, "CapOverEye4" },
    { 18959, 7500, "CapOverEye5" },
    { 18960, 10000, "CapRimUp1" },
    { 18961, 7500, "CapTrucker1" },
    { 18962, 7500, "CowboyHat2" },
    { 18964, 10000, "SkullyCap1" },
    { 18965, 12500, "SkullyCap2" },
    { 18966, 15000, "SkullyCap3" },
    { 18967, 10000, "HatMan1" },
    { 18968, 10000, "HatMan2" },
    { 18969, 10000, "HatMan3" },
    { 18970, 20000, "HatTiger" },
    { 18971, 10000, "HatCool1" },
    { 18972, 12500, "HatCool2" },
    { 18973, 15000, "HatCool3" },
    { 18974, 100000, "MaskZorro1" },
    { 18645, 15000, "MotorcycleHelmet" },
    { 18976, 10000, "MotorcycleHelmet2" },
    { 18977, 10000, "MotorcycleHelmet3" },
    { 18978, 12500, "MotorcycleHelmet4" },
    { 18979, 15000, "MotorcycleHelmet5" },
    { 19006, 5000, "GlassesType1" },
    { 19007, 5000, "GlassesType2" },
    { 19008, 5000, "GlassesType3" },
    { 19009, 5000, "GlassesType4" },
    { 19010, 5000, "GlassesType5" },
    { 19011, 5000, "GlassesType6" },
    { 19012, 5000, "GlassesType7" },
    { 19013, 5000, "GlassesType8" },
    { 19014, 5000, "GlassesType9" },
    { 19015, 5000, "GlassesType10" },
    { 19016, 10000, "GlassesType11" },
    { 19017, 10000, "GlassesType12" },
    { 19018, 10000, "GlassesType13" },
    { 19019, 10000, "GlassesType14" },
    { 19020, 10000, "GlassesType15" },
    { 19021, 10000, "GlassesType16" },
    { 19022, 10000, "GlassesType17" },
    { 19023, 10000, "GlassesType18" },
    { 19024, 10000, "GlassesType19" },
    { 19025, 10000, "GlassesType20" },
    { 19026, 15000, "GlassesType21" },
    { 19027, 15000, "GlassesType22" },
    { 19028, 15000, "GlassesType23" },
    { 19029, 15000, "GlassesType24" },
    { 19030, 15000, "GlassesType25" },
    { 19031, 15000, "GlassesType26" },
    { 19032, 15000, "GlassesType27" },
    { 19033, 15000, "GlassesType28" },
    { 19034, 15000, "GlassesType29" },
    { 19035, 15000, "GlassesType30" },
    { 19036, 20000, "HockeyMask1" },
    { 19037, 20000, "HockeyMask2" },
    { 19038, 20000, "HockeyMask3" },
    { 19039, 5000, "WatchType1" },
    { 19040, 5000, "WatchType2" },
    { 19041, 5000, "WatchType3" },
    { 19042, 5000, "WatchType4" },
    { 19043, 5000, "WatchType5" },
    { 19044, 5000, "WatchType6" },
    { 19045, 5000, "WatchType7" },
    { 19046, 10000, "WatchType8" },
    { 19047, 10000, "WatchType9" },
    { 19048, 10000, "WatchType10" },
    { 19049, 10000, "WatchType11" },
    { 19050, 10000, "WatchType12" },
    { 19051, 10000, "WatchType13" },
    { 19052, 10000, "WatchType14" },
    { 19053, 10000, "WatchType15" },
    { 19064, 100000, "SantaHat1" },
    { 19065, 200000, "SantaHat2" },
    { 19066, 300000, "SantaHat3" },
    { 19067, 10000, "HoodyHat1" },
    { 19068, 10000, "HoodyHat2" },
    { 19069, 10000, "HoodyHat3" },
    { 19078, 75000, "TheParrot1" },
    { 19079, 75000, "TheParrot2" },
    { 19085, 50000, "EyePatch" },
    { 19090, 15000, "PomPomBlue" },
    { 19091, 15000, "PomPomRed" },
    { 19092, 15000, "PomPomGreen" },
    { 19094, 20000, "BurgerShotHat" },
    { 19095, 5000, "CowboyHat1" },
    { 19096, 5000, "CowboyHat3" },
    { 19097, 10000, "CowboyHat4" },
    { 19098, 10000, "CowboyHat5" },
    { 19101, 20000, "ArmyHelmet1" },
    { 19102, 20000, "ArmyHelmet2" },
    { 19103, 20000, "ArmyHelmet3" },
    { 19104, 20000, "ArmyHelmet4" },
    { 19105, 20000, "ArmyHelmet5" },
    { 19106, 20000, "ArmyHelmet6" },
    { 19107, 40000, "ArmyHelmet7" },
    { 19108, 40000, "ArmyHelmet8" },
    { 19109, 40000, "ArmyHelmet9" },
    { 19110, 40000, "ArmyHelmet10" },
    { 19111, 40000, "ArmyHelmet11" },
    { 19112, 40000, "ArmyHelmet12" },
    { 19113, 10000, "SillyHelmet1" },
    { 19114, 20000, "SillyHelmet2" },
    { 19115, 30000, "SillyHelmet3" },
    { 19116, 5000, "PlainHelmet1" },
    { 19117, 5000, "PlainHelmet2" },
    { 19118, 7500, "PlainHelmet3" },
    { 19119, 10000, "PlainHelmet4" },
    { 19120, 10000, "PlainHelmet5" },
    { 19137, 50000, "CluckinBellHat" },
    { 19163, 10000, "GimpMask" },
    { 1210, 5000, "Briefcase" },
    { 3044, 5000, "Cigar" }
};

//Crowbar Hammer BlackHat Bass Guitar Hair, Hair2,Hair3 Screwdriver
//Banana1 ,Banana 14,Banana18 Mask1,Mask 4,Mask 7,Mask9 HatBowler1 CapKnit1
// CapKnit2 HatMan1, HatMan2 MaskZorro1 MotorcycleHelmet1,MotorcycleHelmet2, 
//MotorcycleHelmet 5 BoxingHelmet GlassesType7, GlassesType8, GlassesType 11 ,
//GlassesType25, GlassesType 28, GlassesType 30 HockeyMask1 SantaHat1, SantaHat2
// TheParrot1, TheParrot2.  EyePatch CowBoyHat1, CowBoyHat2,CowboyHat4, CowboyHat 
//5 SillyHelmet2, SillyHelmet3 PlainHelmet1 CluckinBellHat Briefcase Cigar
new BincoObjects[][HoldingEnumAll] = {
    { 18634, 60000, "Crowbar" },
    { 18635, 60000, "Hammer" },
    { 18639, 80000, "BlackHat" },
    { 19317, 150000, "Bass Guitar" },
    { 18640, 70000, "Hair" },
    { 18975, 70000, "Hair2" },
    { 19136, 70000, "Hair3" },
    { 18644, 60000, "Screwdriver" },
    { 18891, 100000, "Bandana1" },
    { 18904, 100000, "Bandana14" },
    { 18908, 100000, "Bandana18" },
    { 18911, 70000, "Mask1" },
    { 18914, 70000, "Mask4" },
    { 18917, 70000, "Mask7" },
    { 18919, 70000, "Mask9" },
    { 18944, 50000, "HatBoater1" },
    { 18953, 45000, "CapKnit1" },
    { 18954, 45000, "CapKnit2" },
    { 18967, 49999, "HatMan1" },
    { 18968, 49999, "HatMan2" },
    { 18974, 120000, "MaskZorro1" },
    { 18645, 199999, "MotorcycleHelmet" },
    { 18976, 199999, "MotorcycleHelmet2" },
    { 18979, 199999, "MotorcycleHelmet5" },
    { 18952, 149999, "BoxingHelmet" },
    { 19012, 45000, "GlassesType7" },
    { 19013, 45000, "GlassesType8" },
    { 19016, 45000, "GlassesType11" },
    { 19030, 45000, "GlassesType25" },
    { 19033, 45000, "GlassesType28" },
    { 19035, 45000, "GlassesType30" },
    { 19036, 130000, "HockeyMask1" },
    { 19064, 179999, "SantaHat1" },
    { 19065, 199999, "SantaHat2" },
    { 19078, 500000, "TheParrot1" },
    { 19079, 500000, "TheParrot2" },
    { 19085, 99999, "EyePatch" },
    { 19095, 100000, "CowboyHat1" },
    { 19096, 100000, "CowboyHat3" },
    { 19097, 100000, "CowboyHat4" },
    { 19098, 100000, "CowboyHat5" },
    { 19113, 65000, "SillyHelmet1" },
    { 19114, 65000, "SillyHelmet2" },
    { 19115, 65000, "SillyHelmet3" },
    { 19116, 55000, "PlainHelmet1" },
    { 19137, 200000, "CluckinBellHat" },
    { 1210, 100000, "Briefcase" },
    { 3044, 50000, "Cigar" }
};


new HoldingBones[][] = {
    "Khong co",
    "Cot song",
    "Dau",
    "Tren tay trai",
    "Canh tay phai",
    "Tay trai",
    "Tay phai",
    "Dui trai",
    "Dui phai",
    "Chan trai",
    "Chan phai",
    "Bap chan phai",
    "Bap chan trai",
    "Canh tay trai",
    "Canh tay phai",
    "Xuong don trai",
    "Xuong don phai",
    "Co",
    "Quay ham"
};
Dialog:SELLTOY(playerid, response, listitem, inputtext[]) {
    if(response) {
        new buyerid = GetPVarInt(playerid, "ttBuyer"),
            cost = GetPVarInt(playerid, "ttCost");
        if(PlayerToyInfo[playerid][listitem][ptModelID] == 0) {
            SetPVarInt(buyerid, "ttSeller", INVALID_PLAYER_ID);
            SetPVarInt(playerid, "ttCost", 0);
            SetPVarInt(playerid, "ttBuyer", INVALID_PLAYER_ID);
            Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Ban toys cua ban", "Woops! Ban khong co gi de ban o slot do.", "Dong y", "");
        }
        if(PlayerToyInfo[playerid][listitem][ptTradable] == 0) {
            SendClientMessage(playerid, COLOR_GREY, "Do choi nay khong the giao dich.");
            SetPVarInt(buyerid, "ttSeller", INVALID_PLAYER_ID);
            SetPVarInt(playerid, "ttCost", 0);
            return SetPVarInt(playerid, "ttBuyer", INVALID_PLAYER_ID);
        }
        if(!IsPlayerAttachedObjectSlotUsed(playerid, listitem)) {
            new szmessage[128], name[24],
                toyid = PlayerToyInfo[playerid][listitem][ptModelID];
            format(name, sizeof(name), "None");
            for (new i; i < sizeof(HoldingObjectsAll); i++) {
                if(HoldingObjectsAll[i][holdingmodelid] == toyid) {
                    format(name, sizeof(name), "(%s)", HoldingObjectsAll[i][holdingmodelname]);
                }
            }
            if(PlayerToyInfo[playerid][listitem][ptModelID] != 0 && (strcmp(name, "None", true) == 0)) {
                format(name, sizeof(name), "(ID: %d)", toyid);
            }
            format(szmessage, sizeof(szmessage), "Ban da de suat %s cua do choi cua ban. %s", GetNameEx(buyerid), name);
            SendClientMessage(playerid, COLOR_LIGHTBLUE, szmessage);
            SetPVarInt(playerid, "ttToy", toyid);
            SetPVarInt(playerid, "ttToySlot", listitem);
            PrepTradeToysGUI(buyerid, playerid, cost, toyid);
        } else {
            SendClientMessage(playerid, COLOR_GREY, "Hien tai do choi nay dang duoc su dung, vui long cat no vao tui va tiep tuc giao dich.");
            SetPVarInt(buyerid, "ttSeller", INVALID_PLAYER_ID);
            SetPVarInt(playerid, "ttCost", 0);
            SetPVarInt(playerid, "ttSeller", INVALID_PLAYER_ID);
        }
    }
    return 1;
}
Dialog:CONFIRMSELLTOY(playerid, response, listitem, inputtext[]) {
    if(response) {
        CompleteToyTrade(playerid);
    } else {
        new szstring[128];
        format(szstring, sizeof(szstring), "%s da tu choi loi de nghi mua do choi cua ban.", GetNameEx(playerid));
        SendClientMessage(GetPVarInt(playerid, "ttSeller"), COLOR_GREY, szstring);
        SendClientMessage(playerid, COLOR_GREY, "Ban da tu choi loi de nghi mua do choi.");
        SetPVarInt(GetPVarInt(playerid, "ttSeller"), "ttBuyer", INVALID_PLAYER_ID);
        SetPVarInt(GetPVarInt(playerid, "ttSeller"), "ttCost", 0);
        SetPVarInt(playerid, "ttSeller", INVALID_PLAYER_ID);

        HideTradeToysGUI(playerid);
    }
    return 1;
}
Dialog:BUYTOYS(playerid, response, listitem, inputtext[]) {
    if(response) {
        new stringg[4096], icount = GetPlayerToySlots(playerid);
        for (new x; x < icount; x++) {
            new name[24];
            format(name, sizeof(name), "None");

            for (new i; i < sizeof(BincoObjects); i++) {
                if(BincoObjects[i][holdingmodelid] == PlayerToyInfo[playerid][x][ptModelID]) {
                    format(name, sizeof(name), "%s", BincoObjects[i][holdingmodelname]);
                }
            }
            if(PlayerToyInfo[playerid][x][ptModelID] != 0 && (strcmp(name, "None", true) == 0)) {
                format(name, sizeof(name), "ID: %d", PlayerToyInfo[playerid][x][ptModelID]);
            }
            format(stringg, sizeof(stringg), "%s(%d) %s (Bone: %s)\n", stringg, x, name, HoldingBones[PlayerToyInfo[playerid][x][ptBone]]);
        }
        Dialog_Show(playerid, BUYTOYS2, DIALOG_STYLE_LIST, "Chon mot slot", stringg, "Lua chon", "Huy bo");
    }
    return 1;
}
Dialog:BUYTOYS2(playerid, response, listitem, inputtext[]) {
    if(response) {
        /*
	    if(listitem >= 5 + PlayerInfo[playerid][pToySlot] && PlayerInfo[playerid][pDonateRank] < 1 || listitem >= 5 + PlayerInfo[playerid][pToySlot] && PlayerInfo[playerid][pBuddyInvited] == 1) return SendClientMessage(playerid, COLOR_WHITE, "* You must be a Bronze VIP + to use that slot!");
	    if(listitem >= 8 + PlayerInfo[playerid][pToySlot] && PlayerInfo[playerid][pDonateRank] < 2) return SendClientMessage(playerid, COLOR_WHITE, "* You must be a Silver VIP + to use that slot!");
        if(listitem >= 9 + PlayerInfo[playerid][pToySlot] && PlayerInfo[playerid][pDonateRank] < 3) return SendClientMessage(playerid, COLOR_WHITE, "* You must be a Gold VIP + to use that slot!");
		if(listitem >= 10 + PlayerInfo[playerid][pToySlot] && PlayerInfo[playerid][pDonateRank] < 4) return SendClientMessage(playerid, COLOR_WHITE, "* You must be a Platinum VIP + to use that slot!");
		*/

        if(!toyCountCheck(playerid)) return SendClientMessage(playerid, COLOR_YELLOW, "* Ban khong the cam mon do choi nay duoc nua.");

        if(PlayerToyInfo[playerid][listitem][ptModelID] != 0) return SendClientMessage(playerid, COLOR_YELLOW, "* Slot nay cua ban da ton tai mot mon do choi. De xoa do choi su dung /toys");

        SetPVarInt(playerid, "ToySlot", listitem);

        new stringg[5000];
        for (new x; x < sizeof(HoldingObjects); x++) //HoldingObjects is default
        {
            format(stringg, sizeof(stringg), "%s%s ($%d)\n", stringg, HoldingObjects[x][holdingmodelname], HoldingObjects[x][holdingprice]);
        }
        Dialog_Show(playerid, BUYTOYS3, DIALOG_STYLE_LIST, "Chon mot slot", stringg, "Mua", "Huy bo");
    }
    return 1;
}
Dialog:BUYTOYS3(playerid, response, listitem, inputtext[]) {
    if(response) {
        if(GetPlayerCash(playerid) < HoldingObjects[listitem][holdingprice]) {
            SendClientMessage(playerid, COLOR_WHITE, "* Ban khong the mua!");
        } else {
            GivePlayerCash(playerid, -HoldingObjects[listitem][holdingprice]); //HoldingObjects is default
            Update(playerid, pCashx);
            PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptModelID] = HoldingObjects[listitem][holdingmodelid];

            new modelid = PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptModelID];
            if((modelid >= 19006 && modelid <= 19035) || (modelid >= 19138 && modelid <= 19140)) {
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptBone] = 2;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptPosX] = 0.9;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptPosY] = 0.0;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptPosZ] = 0.35;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptRotX] = 90.0;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptRotY] = 90.0;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptRotZ] = 0.0;
            } else if(modelid >= 18891 && modelid <= 18910) {
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptBone] = 2;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptPosX] = 0.15;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptPosY] = 0.0;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptPosZ] = 0.0;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptRotX] = 90.0;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptRotY] = 180.0;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptRotZ] = 90.0;
            } else if(modelid >= 18926 && modelid <= 18935) {
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptBone] = 2;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptPosX] = 0.1;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptPosY] = 0.0;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptPosZ] = 0.0;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptRotX] = 0.0;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptRotY] = 0.0;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptRotZ] = 0.0;
            } else if(modelid >= 18911 && modelid <= 18920) {
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptBone] = 2;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptPosX] = 0.1;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptPosY] = 0.035;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptPosZ] = 0.0;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptRotX] = 90.0;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptRotY] = 180.0;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptRotZ] = 90.0;
            } else if(modelid == 19078 || modelid == 19078) {
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptBone] = 16;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptPosX] = 0;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptPosY] = 0;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptPosZ] = 0;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptRotX] = 180.0;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptRotY] = 180.0;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptRotZ] = 0.0;
            } else if((modelid >= 18641 && modelid <= 18644) || (modelid >= 19080 && modelid <= 19084) || modelid == 18890) {
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptBone] = 6;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptPosX] = 0.0;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptPosY] = 0.0;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptPosZ] = 0.0;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptRotX] = 0.0;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptRotY] = 0.0;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptRotZ] = 0.0;
            } else {
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptBone] = 2;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptPosX] = 0.0;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptPosY] = 0.0;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptPosZ] = 0.0;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptRotX] = 0.0;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptRotY] = 0.0;
                PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptRotZ] = 0.0;
            }
            PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptScaleX] = 1.0;
            PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptScaleY] = 1.0;
            PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptScaleZ] = 1.0;
            PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptTradable] = 1;

            CreateANewToy(playerid, GetPVarInt(playerid, "ToySlot"));
            new string[200];
            format(string, sizeof(string), "* Ban da mua %s voi gia $%d (Slot: %d)", HoldingObjects[listitem][holdingmodelname], HoldingObjects[listitem][holdingprice], GetPVarInt(playerid, "ToySlot"));
            SendClientMessage(playerid, COLOR_RED, string);
            SendClientMessage(playerid, COLOR_WHITE, "HINT: Su dung /toys de chinh sua do choi");
        }
    }
    return 1;
}
Dialog:GIVETOY(playerid, response, listitem, inputtext[]) {
    if(response) {
        new giveplayerid = GetPVarInt(playerid, "giveplayeridtoy"),
            toyid = GetPVarInt(playerid, "toyid"),
            string[200];
        if(!toyCountCheck(giveplayerid)) return SendClientMessage(playerid, COLOR_YELLOW, "* Nguoi choi nay khong nhan duoc them do choi!");
        if(PlayerToyInfo[giveplayerid][listitem][ptModelID] != 0) return SendClientMessage(playerid, COLOR_YELLOW, "* Nguoi choi nay da co mot do choi o slot do!");

        PlayerToyInfo[giveplayerid][listitem][ptModelID] = toyid;
        PlayerToyInfo[giveplayerid][listitem][ptBone] = 1;
        PlayerToyInfo[giveplayerid][listitem][ptTradable] = 1;
        format(string, sizeof(string), "You have given %s object %d", GetNameEx(giveplayerid), toyid);
        SendClientMessage(playerid, COLOR_YELLOW, string);
        SendClientMessage(giveplayerid, COLOR_WHITE, "Ban da nhan duoc mot do choi mien phi tu Admin!");
        format(string, sizeof(string), "%s has given %s object %d", GetNameEx(playerid), GetNameEx(giveplayerid), toyid);
        // Log("logs/toys.log", string);
        DeletePVar(playerid, "giveplayeridtoy");
        DeletePVar(playerid, "toyid");
        new v = listitem; // lazy
        CreateANewToy(giveplayerid, v);
    }
    return 1;
}
Dialog:LISTTOYS_DELETETOY(playerid, response, listitem, inputtext[]) {
    if(response) {
        if(PlayerInfo[playerid][pAdmin] < 4) return SendClientMessage(playerid, COLOR_GRAD2, "Ban khong duoc phep lam");
        new giveplayerid = GetPVarInt(playerid, "listtoys_giveplayerid"), string[200];
        SetPVarInt(playerid, "listitem_toyslot", listitem);
        format(string, sizeof(string), "Ban co chac chan muon xoa %s's toy (Model ID: %d) tu slot %d?", GetNameEx(giveplayerid), PlayerToyInfo[giveplayerid][listitem][ptModelID], listitem);
        Dialog_Show(playerid, LISTTOYS_DELETETOYCF, DIALOG_STYLE_MSGBOX, "Xoa toys - Ban co chac chan muon?", string, "Dong y", "Khong");
    }
    return 1;
}
Dialog:LISTTOYS_DELETETOYCF(playerid, response, listitem, inputtext[]) {
    if(response) {
        new stringg[128], szQuery[128], giveplayerid = GetPVarInt(playerid, "listtoys_giveplayerid"), slot = GetPVarInt(playerid, "listitem_toyslot");
        new object = PlayerToyInfo[giveplayerid][slot][ptModelID];
        if(!IsPlayerConnected(giveplayerid) || giveplayerid == INVALID_PLAYER_ID) {
            Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Xoa toys - Player ID", "ERROR: Nguoi choi khong ket noi", "Dong y", "");
            return 1;
        }
        new toys = 99999;
        for (new i; i < 11; i++) {
            if(PlayerHoldingObject[giveplayerid][i] == slot + 1) {
                toys = i;
                if(IsPlayerAttachedObjectSlotUsed(giveplayerid, toys - 1)) {
                    PlayerHoldingObject[giveplayerid][i] = 0;
                    RemovePlayerAttachedObject(giveplayerid, toys - 1);
                }
                break;
            }
        }
        format(stringg, sizeof(stringg), "Ban da xoa %s's object %d trong slot %d", GetNameEx(giveplayerid), object, slot);
        Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Xoa toys - Thanh cong", stringg, "Dong y", "");
        format(stringg, sizeof(stringg), "Admin %s has deleted your toy (obj model: %d) from slot %d.", GetNameEx(playerid), object, slot);
        SendClientMessage(giveplayerid, COLOR_WHITE, stringg);
        format(stringg, sizeof(stringg), "[TOYDELETE] %s xoa %s's object %d trong slot %d", GetNameEx(playerid), GetNameEx(giveplayerid), object, slot);
        format(szQuery, sizeof(szQuery), "DELETE FROM `playertoys` WHERE `id` = %d", PlayerToyInfo[giveplayerid][slot][ptID]);
        mysql_query(SQL, szQuery, false);
        PlayerToyInfo[giveplayerid][slot][ptModelID] = 0;
        PlayerToyInfo[giveplayerid][slot][ptBone] = 0;
        // Log("logs/toydelete.log", stringg);
    }
    return 1;
}
Dialog:TOYS(playerid, response, listitem, inputtext[]) {
    if(response) {
        if(listitem == 0) {
            new stringg[4096], icount = GetPlayerToySlots(playerid);
            for (new x; x < icount; x++) {
                new name[24];
                format(name, sizeof(name), "None");

                for (new i; i < sizeof(HoldingObjectsAll); i++) {
                    if(HoldingObjectsAll[i][holdingmodelid] == PlayerToyInfo[playerid][x][ptModelID]) {
                        format(name, sizeof(name), "%s", HoldingObjectsAll[i][holdingmodelname]);
                    }
                }
                if(PlayerToyInfo[playerid][x][ptModelID] != 0 && (strcmp(name, "None", true) == 0)) {
                    format(name, sizeof(name), "ID: %d", PlayerToyInfo[playerid][x][ptModelID]);
                }
                format(stringg, sizeof(stringg), "%s(%d) %s (Bone: %s)\n", stringg, x, name, HoldingBones[PlayerToyInfo[playerid][x][ptBone]]);
            }
            format(stringg, sizeof(stringg), "%s\n{40FFFF}Them slot toys {FFD700}(Credits: %s){A9C4E4}", stringg, FormatNumber(ShopItems[0][sItemPrice]));
            Dialog_Show(playerid, WEARTOY, DIALOG_STYLE_LIST, "Chon mot toys", stringg, "Lua chon", "Huy bo");
        } else if(listitem == 1) {
            new stringg[4096], icount = GetPlayerToySlots(playerid);
            for (new x; x < icount; x++) {
                new name[24];
                format(name, sizeof(name), "None");

                for (new i; i < sizeof(HoldingObjectsAll); i++) {
                    if(HoldingObjectsAll[i][holdingmodelid] == PlayerToyInfo[playerid][x][ptModelID]) {
                        format(name, sizeof(name), "%s", HoldingObjectsAll[i][holdingmodelname]);
                    }
                }
                if(PlayerToyInfo[playerid][x][ptModelID] != 0 && (strcmp(name, "None", true) == 0)) {
                    format(name, sizeof(name), "ID: %d", PlayerToyInfo[playerid][x][ptModelID]);
                }
                format(stringg, sizeof(stringg), "%s(%d) %s (Bone: %s)\n", stringg, x, name, HoldingBones[PlayerToyInfo[playerid][x][ptBone]]);
            }
            format(stringg, sizeof(stringg), "%s\n{40FFFF}Them slot toys {FFD700}(Credits: %s){A9C4E4}", stringg, FormatNumber(ShopItems[0][sItemPrice]));
            Dialog_Show(playerid, EDITTOYS, DIALOG_STYLE_LIST, "Chon mot toys", stringg, "Lua chon", "Huy bo");
        } else if(listitem == 2) {
            new stringg[4096], icount = GetPlayerToySlots(playerid);
            for (new x; x < icount; x++) {
                new name[24];
                format(name, sizeof(name), "None");

                for (new i; i < sizeof(HoldingObjectsAll); i++) {
                    if(HoldingObjectsAll[i][holdingmodelid] == PlayerToyInfo[playerid][x][ptModelID]) {
                        format(name, sizeof(name), "%s", HoldingObjectsAll[i][holdingmodelname]);
                    }
                }
                if(PlayerToyInfo[playerid][x][ptModelID] != 0 && (strcmp(name, "None", true) == 0)) {
                    format(name, sizeof(name), "ID: %d", PlayerToyInfo[playerid][x][ptModelID]);
                }
                format(stringg, sizeof(stringg), "%s(%d) %s (Bone: %s)\n", stringg, x, name, HoldingBones[PlayerToyInfo[playerid][x][ptBone]]);
            }
            format(stringg, sizeof(stringg), "%s\n{40FFFF}Them slot toys {FFD700}(Credits: %s){A9C4E4}", stringg, FormatNumber(ShopItems[0][sItemPrice]));
            Dialog_Show(playerid, DELETETOY, DIALOG_STYLE_LIST, "Chon mot toys", stringg, "Xoa", "Huy bo");
        }
    }
    return 1;
}
Dialog:BUYTOYSLOT(playerid, response, listitem, inputtext[]) {
    if(response) {
        if(PlayerInfo[playerid][pPremiumPoints] < 50) return ShowAlertDialog(playerid, "Loi", "Ban khong du xu de thuc hien giao dich nay.");
        if(PlayerInfo[playerid][pToySlot] >= MAX_PLAYERTOYS) return ShowAlertDialog(playerid, "Loi", "Ban da dat so luong toy toi da co the so huu.");
        PlayerInfo[playerid][pToySlot] += 1;
        UpdateVar(playerid, "ToySlot", PlayerInfo[playerid][pToySlot]);
        new string[200];
        format(string, sizeof(string), "%s da mua thanh cong mot slot toy.");
        Log("logs/shop.log", string);
        SendClientMessage(playerid, COLOR_YELLOW, "Ban da mua thanh cong mot slot toy. Hay su dung /toys de kiem tra.");
    }
    return 1;
}
Dialog:EDITTOYS(playerid, response, listitem, inputtext[]) {
    if(response) {
        /*new toycount = GetFreeToySlot(playerid);
        if(toycount >= 10) return SendClientMessage(playerid, COLOR_GRAD1, "You currently have 10 objects attached, please deattach an object.");*/

        if(listitem >= GetPlayerToySlots(playerid)) {
            new szstring[128];
            SetPVarInt(playerid, "MiscShop", 8);
            format(szstring, sizeof(szstring), "Them slot toys\nCredits cua ban: %s\nChi phi: {FFD700}%s{A9C4E4}\nCredits con lai: %s", FormatNumber(PlayerInfo[playerid][pPremiumPoints]), FormatNumber(ShopItems[0][sItemPrice]), FormatNumber(PlayerInfo[playerid][pPremiumPoints] - ShopItems[0][sItemPrice]));
            return Dialog_Show(playerid, BUYTOYSLOT, DIALOG_STYLE_MSGBOX, "Them slot toys", szstring, "Mua", "Huy bo");
        } else if(PlayerToyInfo[playerid][listitem][ptModelID] == 0 && listitem < GetPlayerToySlots(playerid)) {
            Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Chinh sua do choi", "Woops! Ban khong co gi de chinh sua trong slot do.", "Dong y", "");
        } else {
            SendClientMessage(playerid, COLOR_WHITE, "{AA3333}HINT:{FFFF00} Dat vi tri quan sat cua ban o nhung cho khac nhau de chinh sua tot hon.");
            SetPVarInt(playerid, "ToySlot", listitem);
            ShowEditMenu(playerid);
        }
    }
    return 1;
}
Dialog:EDITTOYS2(playerid, response, listitem, inputtext[]) {
    if(response) switch (listitem) {
        case 0:            Dialog_Show(playerid, EDITTOYSBONE, DIALOG_STYLE_LIST, "Chon mot vi tri", "Cot song\nDau\nTren tay trai\nCanh tay phai\nTay trai\nTay phai\nDui trai\nDui phai\nChan trai\nChan phai\nBap chan phai\nBap chan trai\nCanh tay trai\nCanh tay phai\nXuong don trai\nXuong don phai\nCo\nQuay ham", "Lua chon", "Huy bo");
        case 1:{
            for (new i; i < 11; i++) {
                if(PlayerHoldingObject[playerid][i] == GetPVarInt(playerid, "ToySlot") + 1) {
                    EditAttachedObject(playerid, i - 1);
                    break;
                }
            }
            SendClientMessage(playerid, COLOR_WHITE, "HINT: Giu {8000FF}~k~~PED_SPRINT~ {FFFFAA}de di chuyen goc nhin cua ban, bam esc de thoat ra");
        }
    }
    else {
        new stringg[4096], icount = GetPlayerToySlots(playerid);
        for (new x; x < icount; x++) {
            new name[24];
            format(name, sizeof(name), "None");

            for (new i; i < sizeof(HoldingObjectsAll); i++) {
                if(HoldingObjectsAll[i][holdingmodelid] == PlayerToyInfo[playerid][x][ptModelID]) {
                    format(name, sizeof(name), "%s", HoldingObjectsAll[i][holdingmodelname]);
                }
            }
            if(PlayerToyInfo[playerid][x][ptModelID] != 0 && (strcmp(name, "None", true) == 0)) {
                format(name, sizeof(name), "ID: %d", PlayerToyInfo[playerid][x][ptModelID]);
            }
            format(stringg, sizeof(stringg), "%s(%d) %s (Bone: %s)\n", stringg, x, name, HoldingBones[PlayerToyInfo[playerid][x][ptBone]]);
        }
        format(stringg, sizeof(stringg), "%s\n{40FFFF}Them slot toys {FFD700}(Credits: %s){A9C4E4}", stringg, FormatNumber(ShopItems[0][sItemPrice]));
        Dialog_Show(playerid, EDITTOYS, DIALOG_STYLE_LIST, "Chon do choi", stringg, "Lua chon", "Thoat");
    }
    return 1;
}
Dialog:EDITTOYSBONE(playerid, response, listitem, inputtext[]) {
    if(response) {
        PlayerToyInfo[playerid][GetPVarInt(playerid, "ToySlot")][ptBone] = listitem + 1;

        SaveToys(playerid, GetPVarInt(playerid, "ToySlot"));
    }
    ShowEditMenu(playerid);
    return 1;
}
Dialog:WEARTOY(playerid, response, listitem, inputtext[]) {
    if(response) {
        //if(PlayerToyInfo[playerid][listitem][ptModelID] == 0)
        if(listitem >= GetPlayerToySlots(playerid)) {
            new szstring[128];
            SetPVarInt(playerid, "MiscShop", 8);
            format(szstring, sizeof(szstring), "Them slot toys\nCredits cua ban: %s\nChi phi: {FFD700}%s{A9C4E4}\nCredits con lai: %s", FormatNumber(PlayerInfo[playerid][pPremiumPoints]), FormatNumber(ShopItems[0][sItemPrice]), FormatNumber(PlayerInfo[playerid][pPremiumPoints] - ShopItems[0][sItemPrice]));
            return Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Them slot toys", szstring, "Mua", "Huy bo");
        } else if(PlayerToyInfo[playerid][listitem][ptModelID] == 0 && listitem < GetPlayerToySlots(playerid)) {
            Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Mac do choi cua ban", "Woops! Ban khong co do choi nao de mac tu slot do.", "Dong y", "");
        } else {
            new toys = 99999;
            for (new i; i < 11; i++) {
                if(PlayerHoldingObject[playerid][i] == listitem + 1) {
                    toys = i;
                    break;
                }
            }
            if(IsPlayerAttachedObjectSlotUsed(playerid, toys - 1)) {
                new name[24];
                format(name, sizeof(name), "None");

                for (new i; i < sizeof(HoldingObjectsAll); i++) {
                    if(HoldingObjectsAll[i][holdingmodelid] == PlayerToyInfo[playerid][listitem][ptModelID]) {
                        format(name, sizeof(name), "%s", HoldingObjectsAll[i][holdingmodelname]);
                    }
                }
                new string[200];
                format(string, sizeof(string), "Thao do choi %s thanh cong (Vi tri: %s) (Slot: %d)", name, HoldingBones[PlayerToyInfo[playerid][listitem][ptBone]], listitem);
                SendClientMessage(playerid, COLOR_RED, string);
                RemovePlayerAttachedObject(playerid, toys - 1);
                for (new i; i < 11; i++) {
                    if(PlayerHoldingObject[playerid][i] == listitem + 1) {
                        PlayerHoldingObject[playerid][i] = 0;
                        break;
                    }
                }
            } else {
                new toycount = GetFreeToySlot(playerid);
                if(toycount > 10 || toycount == -1) return SendClientMessage(playerid, COLOR_GRAD1, "Ban khong the them do choi duoc nua, da co 10 slot duoc su dung.");

                if(PlayerToyInfo[playerid][listitem][ptScaleX] == 0) {
                    PlayerToyInfo[playerid][listitem][ptScaleX] = 1.0;
                    PlayerToyInfo[playerid][listitem][ptScaleY] = 1.0;
                    PlayerToyInfo[playerid][listitem][ptScaleZ] = 1.0;
                }
                new name[24];
                format(name, sizeof(name), "None");

                for (new i; i < sizeof(HoldingObjectsAll); i++) {
                    if(HoldingObjectsAll[i][holdingmodelid] == PlayerToyInfo[playerid][listitem][ptModelID]) {
                        format(name, sizeof(name), "%s", HoldingObjectsAll[i][holdingmodelname]);
                    }
                }
                new string[200];
                format(string, sizeof(string), "Su dung do choi %s thanh cong (Vi tri: %s) (Slot: %d)", name, HoldingBones[PlayerToyInfo[playerid][listitem][ptBone]], listitem);
                SendClientMessage(playerid, COLOR_RED, string);
                PlayerHoldingObject[playerid][toycount] = listitem + 1;
                SetPlayerAttachedObject(playerid, toycount - 1, PlayerToyInfo[playerid][listitem][ptModelID], PlayerToyInfo[playerid][listitem][ptBone], PlayerToyInfo[playerid][listitem][ptPosX], PlayerToyInfo[playerid][listitem][ptPosY], PlayerToyInfo[playerid][listitem][ptPosZ],
                    PlayerToyInfo[playerid][listitem][ptRotX], PlayerToyInfo[playerid][listitem][ptRotY], PlayerToyInfo[playerid][listitem][ptRotZ], PlayerToyInfo[playerid][listitem][ptScaleX], PlayerToyInfo[playerid][listitem][ptScaleY], PlayerToyInfo[playerid][listitem][ptScaleZ]);
            }
        }
    }
    return 1;
}
Dialog:DELETETOY(playerid, response, listitem, inputtext[]) {
    new toys = 99999;
    for (new i; i < 11; i++) {
        if(PlayerHoldingObject[playerid][i] == listitem + 1) {
            toys = i;
            if(IsPlayerAttachedObjectSlotUsed(playerid, toys - 1)) {
                PlayerHoldingObject[playerid][i] = 0;
                RemovePlayerAttachedObject(playerid, toys - 1);
            }
            break;
        }
    }

    new szQuery[128];
    format(szQuery, sizeof(szQuery), "DELETE FROM `playertoys` WHERE `id` = '%d'", PlayerToyInfo[playerid][listitem][ptID]);
    mysql_query(SQL, szQuery, false);
    PlayerToyInfo[playerid][listitem][ptID] = 0;
    PlayerToyInfo[playerid][listitem][ptModelID] = 0;
    PlayerToyInfo[playerid][listitem][ptBone] = 0;
    if(PlayerToyInfo[playerid][listitem][ptSpecial] != 0) {
        PlayerToyInfo[playerid][listitem][ptSpecial] = 0;
    }

    format(szQuery, sizeof(szQuery), "Ban da xoa do choi trong slot %d.", listitem);
    Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Toy Menu", szQuery, "Dong y", "");
    return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {
    if(newkeys & KEY_NO) {
        if(InsideTradeToys[playerid] == 1) {
            if(IsPlayerConnected(GetPVarInt(playerid, "ttSeller"))) {
                new string[200];
                format(string, sizeof(string), "%s ban tu choi loi de nghi mua toy.", GetNameEx(playerid));
                SendClientMessage(GetPVarInt(playerid, "ttSeller"), COLOR_LIGHTBLUE, string);
                SendClientMessage(playerid, COLOR_LIGHTRED, "Ban tu choi loi de nghi mua toy.");

                SetPVarInt(GetPVarInt(playerid, "ttSeller"), "ttBuyer", INVALID_PLAYER_ID);
                SetPVarInt(GetPVarInt(playerid, "ttSeller"), "ttCost", 0);
                SetPVarInt(playerid, "ttSeller", INVALID_PLAYER_ID);

                HideTradeToysGUI(playerid);
                return 1;
            } else {
                SendClientMessage(playerid, COLOR_LIGHTRED, "Nguoi de nghi giao dich da thoat ket noi may chu.");
                SetPVarInt(playerid, "ttSeller", INVALID_PLAYER_ID);

                HideTradeToysGUI(playerid);
            }
        }
    }
    if(newkeys & KEY_YES) {
        if(InsideTradeToys[playerid] == 1) {
            if(IsPlayerConnected(GetPVarInt(playerid, "ttSeller"))) {
                Dialog_Show(playerid, CONFIRMSELLTOY, DIALOG_STYLE_MSGBOX, "Vui long xac nhan lua chon cua ban", "Ban co chac chan muon mua toy nay voi so tien quy dinh?", "Dong y", "Khong");
            } else {
                SendClientMessage(playerid, COLOR_LIGHTRED, "Nguoi de nghi giao dich da thoat ket noi may chu.");
                SetPVarInt(playerid, "ttSeller", INVALID_PLAYER_ID);

                HideTradeToysGUI(playerid);
            }
        }
    }
    return 1;
}
//FUNCTIONS
LoadPlayerToys(playerid) {
    new str[500];
    format(str, sizeof(str), "SELECT * FROM `playertoys` WHERE `player` = '%d'", PlayerInfo[playerid][pSQLID]);
    new Cache:db = mysql_query(SQL, str);
    if(cache_num_rows()) {
        for (new i, j = cache_num_rows(); i != j; i++) {
            if(i >= MAX_PLAYERTOYS) break;
            cache_get_value_name_int(i, "id", PlayerToyInfo[playerid][i][ptID]);
            cache_get_value_name_int(i, "modelid", PlayerToyInfo[playerid][i][ptModelID]);
            if(PlayerToyInfo[playerid][i][ptModelID] != 0) {
                cache_get_value_name_int(i, "bone", PlayerToyInfo[playerid][i][ptBone]);
                if(PlayerToyInfo[playerid][i][ptBone] > 18 || PlayerToyInfo[playerid][i][ptBone] < 1) PlayerToyInfo[playerid][i][ptBone] = 1;
                cache_get_value_name_int(i, "tradable", PlayerToyInfo[playerid][i][ptTradable]);
                cache_get_value_name_float(i, "posx", PlayerToyInfo[playerid][i][ptPosX]);
                cache_get_value_name_float(i, "posy", PlayerToyInfo[playerid][i][ptPosY]);
                cache_get_value_name_float(i, "posz", PlayerToyInfo[playerid][i][ptPosZ]);
                cache_get_value_name_float(i, "rotx", PlayerToyInfo[playerid][i][ptRotX]);
                cache_get_value_name_float(i, "roty", PlayerToyInfo[playerid][i][ptRotY]);
                cache_get_value_name_float(i, "rotz", PlayerToyInfo[playerid][i][ptRotZ]);
                cache_get_value_name_float(i, "scalex", PlayerToyInfo[playerid][i][ptScaleX]);
                cache_get_value_name_float(i, "scaley", PlayerToyInfo[playerid][i][ptScaleY]);
                cache_get_value_name_float(i, "scalez", PlayerToyInfo[playerid][i][ptScaleZ]);
                cache_get_value_name_int(i, "special", PlayerToyInfo[playerid][i][ptSpecial]);
            } else {
                new szQuery[128];
                format(szQuery, sizeof(szQuery), "DELETE FROM `playertoys` WHERE `id` = '%d'", PlayerToyInfo[playerid][i][ptID]);
                mysql_query(SQL, szQuery, false);
                printf("Deleting Toy ID %d for Player %s (%i)", PlayerToyInfo[playerid][i][ptID], GetNameEx(playerid), PlayerInfo[playerid][pSQLID]);
            }
        }
    }
    cache_delete(db);
    return 1;
}
ResetToyVariables(playerid) {
    for (new i = 0; i < 11; i++) {
        PlayerHoldingObject[playerid][i] = 0;
    }
    for (new v = 0; v < MAX_PLAYERTOYS; v++) {
        RemovePlayerAttachedObject(playerid, v);
        PlayerToyInfo[playerid][v][ptModelID] = 0;
        PlayerToyInfo[playerid][v][ptBone] = 0;
        PlayerToyInfo[playerid][v][ptTradable] = 0;
        PlayerToyInfo[playerid][v][ptPosX] = 0.0;
        PlayerToyInfo[playerid][v][ptPosY] = 0.0;
        PlayerToyInfo[playerid][v][ptPosZ] = 0.0;
        PlayerToyInfo[playerid][v][ptRotX] = 0.0;
        PlayerToyInfo[playerid][v][ptRotY] = 0.0;
        PlayerToyInfo[playerid][v][ptRotZ] = 0.0;
        PlayerToyInfo[playerid][v][ptScaleX] = 1.0;
        PlayerToyInfo[playerid][v][ptScaleY] = 1.0;
        PlayerToyInfo[playerid][v][ptScaleZ] = 1.0;
        PlayerToyInfo[playerid][v][ptSpecial] = 0;
    }
    return 1;
}
GetSpecialPlayerToyCount(playerid) {
    new toys = 0;
    for (new i = 0; i < MAX_PLAYERTOYS; i++)
        if(PlayerToyInfo[playerid][i][ptSpecial] == 1) ++toys;
    return toys;
}
GetPlayerToySlots(playerid) {
    new special = GetSpecialPlayerToyCount(playerid);
    return PlayerInfo[playerid][pToySlot] + 10 + special;
}
toyCountCheck(playerid) {
    new
    iCount = GetPlayerToyCount(playerid),
        special = GetSpecialPlayerToyCount(playerid);
    if(iCount >= 10 + PlayerInfo[playerid][pToySlot] + special) return 0;
    return 1;
}
GetPlayerToyCount(playerid) {
    new toys = 0;
    for (new i = 0; i < MAX_PLAYERTOYS; i++)
        if(PlayerToyInfo[playerid][i][ptModelID]) ++toys;
    return toys;
}
CreateANewToy(playerid, slotid) {
    new szQuery[2048];
    if(PlayerToyInfo[playerid][slotid][ptSpecial] != 1) { PlayerToyInfo[playerid][slotid][ptSpecial] = 0; }

    format(szQuery, sizeof(szQuery), "INSERT INTO `playertoys` (player, modelid, bone, posx, posy, posz, rotx, roty, rotz, scalex, scaley, scalez, tradable, special) VALUES ('%d', '%d', '%d', '%f', '%f', '%f', '%f', '%f', '%f', '%f', '%f', '%f', '%d', '%d')",
        PlayerInfo[playerid][pSQLID],
        PlayerToyInfo[playerid][slotid][ptModelID],
        PlayerToyInfo[playerid][slotid][ptBone],
        PlayerToyInfo[playerid][slotid][ptPosX],
        PlayerToyInfo[playerid][slotid][ptPosY],
        PlayerToyInfo[playerid][slotid][ptPosZ],
        PlayerToyInfo[playerid][slotid][ptRotX],
        PlayerToyInfo[playerid][slotid][ptRotY],
        PlayerToyInfo[playerid][slotid][ptRotZ],
        PlayerToyInfo[playerid][slotid][ptScaleX],
        PlayerToyInfo[playerid][slotid][ptScaleY],
        PlayerToyInfo[playerid][slotid][ptScaleZ],
        PlayerToyInfo[playerid][slotid][ptTradable],
        PlayerToyInfo[playerid][slotid][ptSpecial]);
    mysql_tquery(SQL, szQuery, "OnQueryCreateToy", "ii", playerid, slotid);
}

function OnQueryCreateToy(playerid, toyslot) {
    PlayerToyInfo[playerid][toyslot][ptID] = cache_insert_id();
    // printf("Toy ID: %d", PlayerToyInfo[playerid][toyslot][ptID]);

    new szQuery[128];
    format(szQuery, sizeof(szQuery), "UPDATE `playertoys` SET `modelid` = '%d' WHERE `id` = '%d'", PlayerToyInfo[playerid][toyslot][ptID], PlayerToyInfo[playerid][toyslot][ptModelID]);

    mysql_tquery(SQL, szQuery, "SaveToys", "ii", playerid, toyslot);
}

function SaveToys(playerid, slotid) {
    new szQuery[500];

    if(PlayerToyInfo[playerid][slotid][ptID] >= 1) // Making sure the player actually has a toy so we won't save a empty row
    {
        //printf("%s (%i) saving toy %i...", GetNameEx(playerid), playerid, slotid);

        format(szQuery, sizeof(szQuery), "UPDATE `playertoys` SET `modelid` = '%d', `bone` = '%d', `posx` = '%f', `posy` = '%f', `posz` = '%f', `rotx` = '%f', `roty` = '%f', `rotz` = '%f', `scalex` = '%f', `scaley` = '%f', `scalez` = '%f', `tradable` = '%d' WHERE `id` = '%d'",
            PlayerToyInfo[playerid][slotid][ptModelID],
            PlayerToyInfo[playerid][slotid][ptBone],
            PlayerToyInfo[playerid][slotid][ptPosX],
            PlayerToyInfo[playerid][slotid][ptPosY],
            PlayerToyInfo[playerid][slotid][ptPosZ],
            PlayerToyInfo[playerid][slotid][ptRotX],
            PlayerToyInfo[playerid][slotid][ptRotY],
            PlayerToyInfo[playerid][slotid][ptRotZ],
            PlayerToyInfo[playerid][slotid][ptScaleX],
            PlayerToyInfo[playerid][slotid][ptScaleY],
            PlayerToyInfo[playerid][slotid][ptScaleZ],
            PlayerToyInfo[playerid][slotid][ptTradable],
            PlayerToyInfo[playerid][slotid][ptID]);
        mysql_query(SQL, szQuery, false);
    }
}
GetFreeToySlot(playerid) {
    for (new i = 0; i < 11; i++) {
        if(i + 1 < 11) {
            if(PlayerHoldingObject[playerid][i + 1] == 0) {
                return i + 1;
            }
        } else {
            return -1;
        }
    }
    return -1;
}
PrepTradeToysGUI(playerid, sellerid, price, object) {
    new string[128];
    InsideTradeToys[playerid] = 1;

    // Background
    ttBackground[playerid] = CreatePlayerTextDraw(playerid, 21.000000, 120.000000, "Background"); // Leave the string there, it will fuck up the size of the background if not
    PlayerTextDrawBackgroundColor(playerid, ttBackground[playerid], 255);
    PlayerTextDrawFont(playerid, ttBackground[playerid], 0);
    PlayerTextDrawLetterSize(playerid, ttBackground[playerid], -0.019998, 34.600002);
    PlayerTextDrawColor(playerid, ttBackground[playerid], -256);
    PlayerTextDrawSetOutline(playerid, ttBackground[playerid], 0);
    PlayerTextDrawSetProportional(playerid, ttBackground[playerid], 0);
    PlayerTextDrawSetShadow(playerid, ttBackground[playerid], 1);
    PlayerTextDrawUseBox(playerid, ttBackground[playerid], 1);
    PlayerTextDrawBoxColor(playerid, ttBackground[playerid], 136);
    PlayerTextDrawTextSize(playerid, ttBackground[playerid], 618.000000, 164.000000);
    PlayerTextDrawSetSelectable(playerid, ttBackground[playerid], 0);

    // Model
    ttModel[playerid] = CreatePlayerTextDraw(playerid, 382.000000, 201.000000, "Model");
    PlayerTextDrawBackgroundColor(playerid, ttModel[playerid], 255);
    PlayerTextDrawFont(playerid, ttModel[playerid], 5);
    PlayerTextDrawLetterSize(playerid, ttModel[playerid], -0.679998, 15.999996);
    PlayerTextDrawColor(playerid, ttModel[playerid], -1);
    PlayerTextDrawSetOutline(playerid, ttModel[playerid], 0);
    PlayerTextDrawSetProportional(playerid, ttModel[playerid], 1);
    PlayerTextDrawSetShadow(playerid, ttModel[playerid], 1);
    PlayerTextDrawUseBox(playerid, ttModel[playerid], 1);
    PlayerTextDrawBoxColor(playerid, ttModel[playerid], 136);
    PlayerTextDrawTextSize(playerid, ttModel[playerid], 171.000000, 145.000000);
    PlayerTextDrawSetSelectable(playerid, ttModel[playerid], 0);
    PlayerTextDrawSetPreviewModel(playerid, ttModel[playerid], object);
    PlayerTextDrawSetPreviewRot(playerid, ttModel[playerid], 0.000000, 0.000000, -180.000000, 1.000000);

    // Object Info
    format(string, sizeof(string), "(Object ID %d)", object);
    ttObjectInfo[playerid] = CreatePlayerTextDraw(playerid, 400.000000, 182.000000, string);
    PlayerTextDrawBackgroundColor(playerid, ttObjectInfo[playerid], 255);
    PlayerTextDrawFont(playerid, ttObjectInfo[playerid], 1);
    PlayerTextDrawLetterSize(playerid, ttObjectInfo[playerid], 0.310000, 1.000000);
    PlayerTextDrawColor(playerid, ttObjectInfo[playerid], -1);
    PlayerTextDrawSetOutline(playerid, ttObjectInfo[playerid], 0);
    PlayerTextDrawSetProportional(playerid, ttObjectInfo[playerid], 1);
    PlayerTextDrawSetShadow(playerid, ttObjectInfo[playerid], 1);
    PlayerTextDrawSetSelectable(playerid, ttObjectInfo[playerid], 0);

    // Logo
    ttLogo[playerid] = CreatePlayerTextDraw(playerid, 264.000000, 121.000000, "Buon ban do choi");
    PlayerTextDrawBackgroundColor(playerid, ttLogo[playerid], 255);
    PlayerTextDrawFont(playerid, ttLogo[playerid], 2);
    PlayerTextDrawLetterSize(playerid, ttLogo[playerid], 0.379999, 1.500000);
    PlayerTextDrawColor(playerid, ttLogo[playerid], 542758143);
    PlayerTextDrawSetOutline(playerid, ttLogo[playerid], 0);
    PlayerTextDrawSetProportional(playerid, ttLogo[playerid], 1);
    PlayerTextDrawSetShadow(playerid, ttLogo[playerid], 1);
    PlayerTextDrawSetSelectable(playerid, ttLogo[playerid], 0);

    // Purchase
    ttPurchase[playerid] = CreatePlayerTextDraw(playerid, 91.000000, 295.000000, "Mua");
    PlayerTextDrawBackgroundColor(playerid, ttPurchase[playerid], 255);
    PlayerTextDrawFont(playerid, ttPurchase[playerid], 1);
    PlayerTextDrawLetterSize(playerid, ttPurchase[playerid], 0.500000, 1.700000);
    PlayerTextDrawColor(playerid, ttPurchase[playerid], 16711935);
    PlayerTextDrawSetOutline(playerid, ttPurchase[playerid], 1);
    PlayerTextDrawSetProportional(playerid, ttPurchase[playerid], 1);
    PlayerTextDrawUseBox(playerid, ttPurchase[playerid], 1);
    PlayerTextDrawBoxColor(playerid, ttPurchase[playerid], 1625166370);
    PlayerTextDrawTextSize(playerid, ttPurchase[playerid], 164.000000, 4.000000);
    PlayerTextDrawSetSelectable(playerid, ttPurchase[playerid], 1);

    // Decline
    ttDecline[playerid] = CreatePlayerTextDraw(playerid, 254.000000, 295.000000, "Tu choi");
    PlayerTextDrawBackgroundColor(playerid, ttDecline[playerid], 255);
    PlayerTextDrawFont(playerid, ttDecline[playerid], 1);
    PlayerTextDrawLetterSize(playerid, ttDecline[playerid], 0.500000, 1.799999);
    PlayerTextDrawColor(playerid, ttDecline[playerid], -16776961);
    PlayerTextDrawSetOutline(playerid, ttDecline[playerid], 0);
    PlayerTextDrawSetProportional(playerid, ttDecline[playerid], 1);
    PlayerTextDrawSetShadow(playerid, ttDecline[playerid], 1);
    PlayerTextDrawUseBox(playerid, ttDecline[playerid], 1);
    PlayerTextDrawBoxColor(playerid, ttDecline[playerid], -234414302);
    PlayerTextDrawTextSize(playerid, ttDecline[playerid], 310.000000, 0.000000);
    PlayerTextDrawSetSelectable(playerid, ttDecline[playerid], 0);

    // Offer
    format(string, sizeof(string), "%s da de nghi ban do choi nay voi gia $%s", GetNameEx(sellerid), FormatNumber(price));
    ttOffer[playerid] = CreatePlayerTextDraw(playerid, 71.000000, 174.000000, string);
    PlayerTextDrawBackgroundColor(playerid, ttOffer[playerid], 255);
    PlayerTextDrawFont(playerid, ttOffer[playerid], 1);
    PlayerTextDrawLetterSize(playerid, ttOffer[playerid], 0.310000, 1.000000);
    PlayerTextDrawColor(playerid, ttOffer[playerid], -1);
    PlayerTextDrawSetOutline(playerid, ttOffer[playerid], 0);
    PlayerTextDrawSetProportional(playerid, ttOffer[playerid], 1);
    PlayerTextDrawSetShadow(playerid, ttOffer[playerid], 1);
    PlayerTextDrawSetSelectable(playerid, ttOffer[playerid], 0);

    // Note
    ttNote[playerid] = CreatePlayerTextDraw(playerid, 74.000000, 221.000000, "Bam phim Y tu ban phim de dong y mua. Bam phim N tu ban phim de tu choi mua");
    PlayerTextDrawBackgroundColor(playerid, ttNote[playerid], 255);
    PlayerTextDrawFont(playerid, ttNote[playerid], 1);
    PlayerTextDrawLetterSize(playerid, ttNote[playerid], 0.150000, 1.000000);
    PlayerTextDrawColor(playerid, ttNote[playerid], -1);
    PlayerTextDrawSetOutline(playerid, ttNote[playerid], 0);
    PlayerTextDrawSetProportional(playerid, ttNote[playerid], 1);
    PlayerTextDrawSetShadow(playerid, ttNote[playerid], 1);
    PlayerTextDrawSetSelectable(playerid, ttNote[playerid], 0);

    // Yes
    ttYes[playerid] = CreatePlayerTextDraw(playerid, 117.000000, 275.000000, "'Y'");
    PlayerTextDrawBackgroundColor(playerid, ttYes[playerid], 255);
    PlayerTextDrawFont(playerid, ttYes[playerid], 1);
    PlayerTextDrawLetterSize(playerid, ttYes[playerid], 0.500000, 1.000000);
    PlayerTextDrawColor(playerid, ttYes[playerid], 16711935);
    PlayerTextDrawSetOutline(playerid, ttYes[playerid], 0);
    PlayerTextDrawSetProportional(playerid, ttYes[playerid], 1);
    PlayerTextDrawSetShadow(playerid, ttYes[playerid], 1);
    PlayerTextDrawSetSelectable(playerid, ttYes[playerid], 0);

    // No
    ttNo[playerid] = CreatePlayerTextDraw(playerid, 270.000000, 271.000000, "'N'");
    PlayerTextDrawBackgroundColor(playerid, ttNo[playerid], 255);
    PlayerTextDrawFont(playerid, ttNo[playerid], 1);
    PlayerTextDrawLetterSize(playerid, ttNo[playerid], 0.500000, 1.000000);
    PlayerTextDrawColor(playerid, ttNo[playerid], -16776961);
    PlayerTextDrawSetOutline(playerid, ttNo[playerid], 0);
    PlayerTextDrawSetProportional(playerid, ttNo[playerid], 1);
    PlayerTextDrawSetShadow(playerid, ttNo[playerid], 1);
    PlayerTextDrawSetSelectable(playerid, ttNo[playerid], 0);

    PlayerTextDrawShow(playerid, ttBackground[playerid]);
    PlayerTextDrawShow(playerid, ttModel[playerid]);
    PlayerTextDrawShow(playerid, ttObjectInfo[playerid]);
    PlayerTextDrawShow(playerid, ttLogo[playerid]);
    PlayerTextDrawShow(playerid, ttPurchase[playerid]);
    PlayerTextDrawShow(playerid, ttDecline[playerid]);
    PlayerTextDrawShow(playerid, ttOffer[playerid]);
    PlayerTextDrawShow(playerid, ttNote[playerid]);
    PlayerTextDrawShow(playerid, ttYes[playerid]);
    PlayerTextDrawShow(playerid, ttNo[playerid]);
    return 1;
}

HideTradeToysGUI(playerid) {
    InsideTradeToys[playerid] = 0;
    PlayerTextDrawHide(playerid, ttBackground[playerid]);
    PlayerTextDrawHide(playerid, ttModel[playerid]);
    PlayerTextDrawHide(playerid, ttObjectInfo[playerid]);
    PlayerTextDrawHide(playerid, ttLogo[playerid]);
    PlayerTextDrawHide(playerid, ttPurchase[playerid]);
    PlayerTextDrawHide(playerid, ttDecline[playerid]);
    PlayerTextDrawHide(playerid, ttOffer[playerid]);
    PlayerTextDrawHide(playerid, ttNote[playerid]);
    PlayerTextDrawHide(playerid, ttYes[playerid]);
    PlayerTextDrawHide(playerid, ttNo[playerid]);
    return 1;
}
CompleteToyTrade(playerid) {
    new string[156],
        sellerid = GetPVarInt(playerid, "ttSeller"),
        name[24],
        toyid = GetPVarInt(sellerid, "ttToy");

    for (new i; i < sizeof(HoldingObjectsAll); i++) {
        if(HoldingObjectsAll[i][holdingmodelid] == toyid) {
            format(name, sizeof(name), "(%s)", HoldingObjectsAll[i][holdingmodelname]);
        }
    }
    if(toyid != 0 && (strcmp(name, "None", true) == 0)) {
        format(name, sizeof(name), "(ID: %d)", toyid);
    }

    new icount = GetPlayerToySlots(playerid);

    if(!toyCountCheck(playerid)) {
        format(string, sizeof(string), "%s da tu choi mua do choi. (Da het slot toys)", GetNameEx(playerid));
        SendClientMessage(sellerid, COLOR_GREY, string);
        SendClientMessage(playerid, COLOR_GREY, "Ban khong con slot toys.");
        SetPVarInt(GetPVarInt(playerid, "ttSeller"), "ttBuyer", INVALID_PLAYER_ID);
        SetPVarInt(GetPVarInt(playerid, "ttSeller"), "ttCost", 0);
        SetPVarInt(playerid, "ttSeller", INVALID_PLAYER_ID);

        HideTradeToysGUI(playerid);
        return 1;
    }

    if(GetPlayerCash(playerid) < GetPVarInt(sellerid, "ttCost")) {
        format(string, sizeof(string), "%s da tu choi mua do choi. (Khong du tien)", GetNameEx(playerid));
        SendClientMessage(sellerid, COLOR_GREY, string);
        SendClientMessage(playerid, COLOR_GREY, "Ban khong co du tien mat.");
        SetPVarInt(GetPVarInt(playerid, "ttSeller"), "ttBuyer", INVALID_PLAYER_ID);
        SetPVarInt(GetPVarInt(playerid, "ttSeller"), "ttCost", 0);
        SetPVarInt(playerid, "ttSeller", INVALID_PLAYER_ID);

        HideTradeToysGUI(playerid);
        return 1;
    }

    GivePlayerCash(playerid, -GetPVarInt(sellerid, "ttCost"));
    GivePlayerCash(sellerid, GetPVarInt(sellerid, "ttCost"));
    PayTax(sellerid, GetPVarInt(sellerid, "ttCost"), e_SELL_TOY);
    for (new i = 0; i < icount; i++) {
        if(!PlayerToyInfo[playerid][i][ptModelID]) {
            PlayerToyInfo[playerid][i][ptModelID] = toyid;
            PlayerToyInfo[playerid][i][ptBone] = 1; // Doesn't need to be accurate, you can let the player choose.
            PlayerToyInfo[playerid][i][ptPosX] = 1.0;
            PlayerToyInfo[playerid][i][ptPosY] = 1.0;
            PlayerToyInfo[playerid][i][ptPosZ] = 1.0;
            PlayerToyInfo[playerid][i][ptRotX] = 0.0;
            PlayerToyInfo[playerid][i][ptRotY] = 0.0;
            PlayerToyInfo[playerid][i][ptRotZ] = 0.0;
            PlayerToyInfo[playerid][i][ptScaleX] = 1.0;
            PlayerToyInfo[playerid][i][ptScaleY] = 1.0;
            PlayerToyInfo[playerid][i][ptScaleZ] = 1.0;
            PlayerToyInfo[playerid][i][ptTradable] = 1;

            if(PlayerToyInfo[playerid][i][ptSpecial] == 1) {
                PlayerToyInfo[playerid][i][ptSpecial] = 0;
            }

            // Seller
            format(string, sizeof(string), "DELETE FROM `playertoys` WHERE `id` = '%d'", PlayerToyInfo[sellerid][GetPVarInt(sellerid, "ttToySlot")][ptID]);
            mysql_query(SQL, string, false);

            CreateANewToy(playerid, i);
            break;
        }
    }

    PlayerToyInfo[sellerid][GetPVarInt(sellerid, "ttToySlot")][ptID] = 0;
    PlayerToyInfo[sellerid][GetPVarInt(sellerid, "ttToySlot")][ptModelID] = 0;
    PlayerToyInfo[sellerid][GetPVarInt(sellerid, "ttToySlot")][ptBone] = 0;

    Update(playerid, pCashx);
    Update(sellerid, pCashx);

    format(string, sizeof(string), "%s da chap nhan de nghi mua do choi cua ban voi gia $%s. %s", GetNameEx(playerid), FormatNumber(GetPVarInt(sellerid, "ttCost")), name);
    SendClientMessage(sellerid, COLOR_LIGHTBLUE, string);
    format(string, sizeof(string), "Ban da chap nhan mua do choi cua %s's voi gia $%s. %s", GetNameEx(sellerid), FormatNumber(GetPVarInt(sellerid, "ttCost")), name);
    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
    new playersip[16], playersip1[16];
    GetPlayerIp(sellerid, playersip, sizeof(playersip));
    GetPlayerIp(playerid, playersip1, sizeof(playersip1));
    format(string, sizeof(string), "[S %s(%d)][IP %s][B %s(%d)][IP %s][P $%s][T: %s(%d)]", GetNameEx(sellerid), PlayerInfo[playerid][pSQLID], playersip,
        GetNameEx(playerid), PlayerInfo[playerid][pSQLID], playersip1, FormatNumber(GetPVarInt(sellerid, "ttCost")), name, toyid);
    Log("logs/toys.log", string);

    SetPVarInt(GetPVarInt(playerid, "ttSeller"), "ttSeller", INVALID_PLAYER_ID);
    SetPVarInt(GetPVarInt(playerid, "ttSeller"), "ttBuyer", INVALID_PLAYER_ID);
    SetPVarInt(GetPVarInt(playerid, "ttSeller"), "ttCost", 0);
    SetPVarInt(playerid, "ttSeller", INVALID_PLAYER_ID);

    HideTradeToysGUI(playerid);
    return 1;
}
ShowEditMenu(playerid) {
    new iIndex = GetPVarInt(playerid, "ToySlot");

    new toys = 99999;
    for (new i; i < 11; i++) {
        // printf("Toy%d %d", i, PlayerHoldingObject[playerid][i]);
        if(PlayerHoldingObject[playerid][i] == iIndex + 1) {
            toys = i;
            if(IsPlayerAttachedObjectSlotUsed(playerid, toys - 1)) {
                PlayerHoldingObject[playerid][i] = 0;
                RemovePlayerAttachedObject(playerid, toys - 1);
            }
            break;
        }
    }
    if(PlayerToyInfo[playerid][iIndex][ptScaleX] == 0) {
        PlayerToyInfo[playerid][iIndex][ptScaleX] = 1.0;
        PlayerToyInfo[playerid][iIndex][ptScaleY] = 1.0;
        PlayerToyInfo[playerid][iIndex][ptScaleZ] = 1.0;
    }
    new toycount = GetFreeToySlot(playerid);
    if(toycount > 10 || toycount == -1) return SendClientMessage(playerid, COLOR_GRAD1, "Ban da co 10 do choi trong slot, vui long xoa bot..");
    PlayerHoldingObject[playerid][toycount] = iIndex + 1;
    SetPlayerAttachedObject(playerid, toycount - 1, PlayerToyInfo[playerid][iIndex][ptModelID],
        PlayerToyInfo[playerid][iIndex][ptBone], PlayerToyInfo[playerid][iIndex][ptPosX],
        PlayerToyInfo[playerid][iIndex][ptPosY], PlayerToyInfo[playerid][iIndex][ptPosZ],
        PlayerToyInfo[playerid][iIndex][ptRotX], PlayerToyInfo[playerid][iIndex][ptRotY],
        PlayerToyInfo[playerid][iIndex][ptRotZ], PlayerToyInfo[playerid][iIndex][ptScaleX],
        PlayerToyInfo[playerid][iIndex][ptScaleY], PlayerToyInfo[playerid][iIndex][ptScaleZ]);

    new stringg[128];
    format(stringg, sizeof(stringg), "Vi tri dat (%s)\nSua chi tiet", HoldingBones[PlayerToyInfo[playerid][iIndex][ptBone]]);
    Dialog_Show(playerid, EDITTOYS2, DIALOG_STYLE_LIST, "Chinh sua do choi", stringg, "Lua chon", "Huy bo");
    return 1;
}
public OnPlayerEditAttachedObject(playerid, response, index, modelid, boneid,
    Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ, Float:fScaleX, Float:fScaleY, Float:fScaleZ) {
    if(response == EDIT_RESPONSE_FINAL) {
        if(fOffsetX > 1.4) {
            fOffsetX = 1.4;
            SendClientMessage(playerid, COLOR_WHITE, "Maximum X Offset exeeded, damped to maximum");
        }
        if(fOffsetY > 1.4) {
            fOffsetY = 1.4;
            SendClientMessage(playerid, COLOR_WHITE, "Maximum Y Offset exeeded, damped to maximum");
        }
        if(fOffsetZ > 1.4) {
            fOffsetZ = 1.4;
            SendClientMessage(playerid, COLOR_WHITE, "Maximum Z Offset exeeded, damped to maximum");
        }
        if(fOffsetX < -1.4) {
            fOffsetX = -1.4;
            SendClientMessage(playerid, COLOR_WHITE, "Maximum X Offset exeeded, damped to maximum");
        }
        if(fOffsetY < -1.4) {
            fOffsetY = -1.4;
            SendClientMessage(playerid, COLOR_WHITE, "Maximum Y Offset exeeded, damped to maximum");
        }
        if(fOffsetZ < -1.4) {
            fOffsetZ = -1.4;
            SendClientMessage(playerid, COLOR_WHITE, "Maximum Z Offset exeeded, damped to maximum");
        }
        if(fScaleX > 1.5) {
            fScaleX = 1.5;
            SendClientMessage(playerid, COLOR_WHITE, "Maximum X Scale exeeded, damped to maximum");
        }
        if(fScaleY > 1.5) {
            fScaleY = 1.5;
            SendClientMessage(playerid, COLOR_WHITE, "Maximum Y Scale exeeded, damped to maximum");
        }
        if(fScaleZ > 1.5) {
            fScaleZ = 1.5;
            SendClientMessage(playerid, COLOR_WHITE, "Maximum Z Scale exeeded, damped to maximum");
        }

        new slotid = GetPVarInt(playerid, "ToySlot");
        PlayerToyInfo[playerid][slotid][ptPosX] = fOffsetX;
        PlayerToyInfo[playerid][slotid][ptPosY] = fOffsetY;
        PlayerToyInfo[playerid][slotid][ptPosZ] = fOffsetZ;
        PlayerToyInfo[playerid][slotid][ptRotX] = fRotX;
        PlayerToyInfo[playerid][slotid][ptRotY] = fRotY;
        PlayerToyInfo[playerid][slotid][ptRotZ] = fRotZ;
        PlayerToyInfo[playerid][slotid][ptScaleX] = fScaleX;
        PlayerToyInfo[playerid][slotid][ptScaleY] = fScaleY;
        PlayerToyInfo[playerid][slotid][ptScaleZ] = fScaleZ;

        SaveToys(playerid, slotid);
        ShowEditMenu(playerid);
    } else {
        ShowEditMenu(playerid);
        SendClientMessage(playerid, COLOR_WHITE, "Ban da dung viec chinh sua toys.");
    }
    return 1;
}

//COMMANDS
CMD:giveobject(playerid, params[]) {
    if(PlayerInfo[playerid][pAdmin] >= 6) {
        new string[1024], giveplayerid, object;
        if(sscanf(params, "ud", giveplayerid, object)) return SendClientMessage(playerid, COLOR_GREY, "Su Dung: /giveobject [player] [object]");
        if(!IsPlayerConnected(giveplayerid)) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi khong hop le");

        SetPVarInt(playerid, "giveplayeridtoy", giveplayerid);
        SetPVarInt(playerid, "toyid", object);
        new icount = GetPlayerToySlots(giveplayerid);
        for (new x; x < icount; x++) {
            new name[24];
            format(name, sizeof(name), "None");

            for (new i; i < sizeof(HoldingObjectsAll); i++) {
                if(HoldingObjectsAll[i][holdingmodelid] == PlayerToyInfo[giveplayerid][x][ptModelID]) {
                    format(name, sizeof(name), "%s", HoldingObjectsAll[i][holdingmodelname]);
                }
            }
            if(PlayerToyInfo[giveplayerid][x][ptModelID] != 0 && (strcmp(name, "None", true) == 0)) {
                format(name, sizeof(name), "ID: %d", PlayerToyInfo[giveplayerid][x][ptModelID]);
            }
            format(string, sizeof(string), "%s(%d) %s (Bone: %s)\n", string, x, name, HoldingBones[PlayerToyInfo[giveplayerid][x][ptBone]]);
        }
        Dialog_Show(playerid, GIVETOY, DIALOG_STYLE_LIST, "Select a slot", string, "Lua chon", "Huy bo");
    } else return SendClientMessage(playerid, COLOR_GRAD1, "Ban khong the su dung lenh nay!");
    return 1;
}
CMD:listtoys(playerid, params[]) {
    if(PlayerInfo[playerid][pAdmin] >= 5) {

        new
        giveplayerid, stringg[4096], string[64];

        if(sscanf(params, "u", giveplayerid)) {
            SendClientMessage(playerid, COLOR_GREY, "Su Dung: /listtoys [player]");
        } else if(IsPlayerConnected(giveplayerid)) {
            new icount = GetPlayerToySlots(giveplayerid);
            for (new x; x < icount; x++) {
                new name[24] = "None";

                for (new i; i < sizeof(HoldingObjectsAll); i++) {
                    if(HoldingObjectsAll[i][holdingmodelid] == PlayerToyInfo[giveplayerid][x][ptModelID]) {
                        format(name, sizeof(name), "%s", HoldingObjectsAll[i][holdingmodelname]);
                        break;
                    }
                }
                if(PlayerToyInfo[giveplayerid][x][ptModelID] != 0 && (strcmp(name, "None", true) == 0)) {
                    format(name, sizeof(name), "ID: %d", PlayerToyInfo[giveplayerid][x][ptModelID]);
                }
                format(stringg, sizeof(stringg), "%s(%d) %s (Bone: %s)\n", stringg, x, name, HoldingBones[PlayerToyInfo[giveplayerid][x][ptBone]]);
            }
            format(string, sizeof(string), "Listing %s's Toys - Select a Slot", GetNameEx(giveplayerid));
            Dialog_Show(playerid, LISTTOYS_DELETETOY, DIALOG_STYLE_LIST, string, stringg, "Delete", "Cancel");
            SetPVarInt(playerid, "listtoys_giveplayerid", giveplayerid);
        } else SendClientMessage(playerid, COLOR_GRAD2, "Nguoi choi khong hop le.");
    }
    return 1;
}
CMD:buytoys(playerid, params[]) {
    if(!IsAtClothShop(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong Binco.");
	
	// Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Cua hang do choi", "We will right back!", "Exit", "");
    Dialog_Show(playerid, BUYTOYS, DIALOG_STYLE_MSGBOX, "Cua hang do choi", "Chao mung ban den cua hang do choi! O day ban co the mua phu kien de gan' vao nhan vat cua ban.\n\nDau tien, chung toi se chon mot slot toys de luu tru cac toys.", "Tiep tuc", "Cancel");
    return 1;
}
CMD:selltoy(playerid, params[]) {
    new string[1000], name[24], targetid, cost;
    if(PlayerCuffed[playerid] != 0) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the lam dieu nay khi bi cong tay.");
    if(PlayerInfo[playerid][pJailTime] > 0) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the lam dieu nay trong tu!");
    if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the lam dieu nay bay gio.");
    if(sscanf(params, "ud", targetid, cost)) return SendClientMessage(playerid, COLOR_GRAD1, "Su Dung: /selltoy [playerid] [Gia tien]");
    if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi khong hop le.");
    if(targetid == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay cho chinh minh.");
    if(!ProxDetectorS(5.0, playerid, targetid)) return SendClientMessage(playerid, COLOR_GREY, "Nguoi nay khong o gan ban.");
    if(InsideTradeToys[targetid] == 1) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi nay dang thuc hien giao dich, xin vui long thu lai sau.");
    if(cost < 1 || cost > 1000000000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the ban do choi it hon $1.");
    if(PlayerInfo[playerid][pLevel] < 4) return SendClientMessage(playerid, -1, "Ban can dat level 4 de thuc hien lenh nay.");
    SetPVarInt(targetid, "ttSeller", playerid);
    SetPVarInt(playerid, "ttBuyer", targetid);
    SetPVarInt(playerid, "ttCost", cost);

    new icount = GetPlayerToySlots(playerid);
    for (new x; x < icount; x++) {
        format(name, sizeof(name), "None");
        for (new i; i < sizeof(HoldingObjectsAll); i++) {
            if(HoldingObjectsAll[i][holdingmodelid] == PlayerToyInfo[playerid][x][ptModelID]) {
                format(name, sizeof(name), "%s", HoldingObjectsAll[i][holdingmodelname]);
            }
        }
        if(PlayerToyInfo[playerid][x][ptModelID] != 0 && (strcmp(name, "None", true) == 0)) {
            format(name, sizeof(name), "ID: %d", PlayerToyInfo[playerid][x][ptModelID]);
        }
        format(string, sizeof(string), "%s(%d) %s\n", string, x, name);
    }
    Dialog_Show(playerid, SELLTOY, DIALOG_STYLE_LIST, "Chon mot mon do choi de ban", string, "Ban", "Huy bo");
    return 1;
}
CMD:wat(playerid, params[]) {
    if(GetPVarInt(playerid, "EventToken") == 1) return SendClientMessage(playerid, COLOR_GRAD2, "Ban khong the su dung lenh nay trong su kien.");
    new count = 0;
    SendClientMessage(playerid, COLOR_WHITE, "* Attached all toys below slot 10.");
    for (new x; x < MAX_PLAYERTOYS; x++) {
        count++;
        if(PlayerToyInfo[playerid][x][ptScaleX] == 0) {
            PlayerToyInfo[playerid][x][ptScaleX] = 1.0;
            PlayerToyInfo[playerid][x][ptScaleY] = 1.0;
            PlayerToyInfo[playerid][x][ptScaleZ] = 1.0;
        }
        if(PlayerToyInfo[playerid][x][ptModelID] != 0) SetPlayerAttachedObject(playerid, x, PlayerToyInfo[playerid][x][ptModelID], PlayerToyInfo[playerid][x][ptBone], PlayerToyInfo[playerid][x][ptPosX], PlayerToyInfo[playerid][x][ptPosY], PlayerToyInfo[playerid][x][ptPosZ], PlayerToyInfo[playerid][x][ptRotX], PlayerToyInfo[playerid][x][ptRotY], PlayerToyInfo[playerid][x][ptRotZ], PlayerToyInfo[playerid][x][ptScaleX], PlayerToyInfo[playerid][x][ptScaleY], PlayerToyInfo[playerid][x][ptScaleZ]),
            PlayerHoldingObject[playerid][x + 1] = x + 1;
        if(count == 10)
            break;
    }
    return 1;
}
CMD:dat(playerid, params[]) {
    SendClientMessage(playerid, COLOR_WHITE, "* Deattached all toys.");
    for (new x; x < MAX_PLAYERTOYS; x++) {
        RemovePlayerAttachedObject(playerid, x);
    }
    for (new i; i < 11; i++) {
        PlayerHoldingObject[playerid][i] = 0;
    }
    return 1;
}
CMD:dt(playerid, params[]) {
    new toyslot;
    if(sscanf(params, "d", toyslot)) return SendClientMessage(playerid, COLOR_GREY, "Su Dung: /dt [toyslot]");

    if(toyslot < 1 || toyslot > 11 + PlayerInfo[playerid][pToySlot]) return SendClientMessage(playerid, COLOR_GREY, "Su Dung: /dt [toyslot]");

    for (new i; i < 11; i++) {
        if(PlayerHoldingObject[playerid][i] == toyslot) {
            if(IsPlayerAttachedObjectSlotUsed(playerid, i - 1)) {
                RemovePlayerAttachedObject(playerid, i - 1);
                PlayerHoldingObject[playerid][i] = 0;
                break;
            }
        }
    }
    return 1;
}
CMD:toys(playerid, params[]) {
    return Dialog_Show(playerid, TOYS, DIALOG_STYLE_LIST, "Giao dien do choi", "Su dung/Cat do choi\nSua do choi\nXoa do choi","Lua chon", "Huy bo" );
}