#include <YSI_Coding\y_hooks>

hook OnGameModeInit() {
    print("[map] islandevent.inc loaded.");
    new g_Object[335];
    g_Object[0] = CreateDynamicObject(11695, 976.4409, -3189.6359, -29.2819, 0.0000, 0.0000, 0.0000); //Hill250x250Rocky2
    SetDynamicObjectMaterial(g_Object[0], 0, 3374, "ce_farmxref", "forestfloor256", 0x00000000);
    SetDynamicObjectMaterial(g_Object[0], 2, 10166, "p69_rocks", "sfe_rock2", 0x00000000);
    g_Object[1] = CreateDynamicObject(11525, 952.6810, -3187.5061, -2.9019, 0.0000, 0.0000, 270.0000); //nw_bit_23
    SetDynamicObjectMaterial(g_Object[1], 0, 3374, "ce_farmxref", "forestfloor256", 0x00000000);
    SetDynamicObjectMaterial(g_Object[1], 1, 10368, "cathedral_sfs", "dirt64b2", 0x00000000);
    SetDynamicObjectMaterial(g_Object[1], 2, 10368, "cathedral_sfs", "dirt64b2", 0x00000000);
    SetDynamicObjectMaterial(g_Object[1], 5, 17075, "cuntwlandwest", "cw2_mounttrailblank", 0x00000000);
    SetDynamicObjectMaterial(g_Object[1], 8, 3374, "ce_farmxref", "forestfloor256", 0x00000000);
    SetDynamicObjectMaterial(g_Object[1], 9, 3374, "ce_farmxref", "forestfloor256", 0x00000000);
    SetDynamicObjectMaterial(g_Object[1], 10, 10368, "cathedral_sfs", "dirt64b2", 0x00000000);
    SetDynamicObjectMaterial(g_Object[1], 11, 17075, "cuntwlandwest", "cw2_mounttrailblank", 0x00000000);
    g_Object[2] = CreateDynamicObject(11088, 987.9478, -3173.6389, 16.0729, 0.0000, 0.0000, -180.0000); //CF_ext_dem_SFS
    SetDynamicObjectMaterial(g_Object[2], 0, 915, "airconext", "cj_sheet2", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[2], 1, 17005, "farmhouse", "sjmbigold6", 0x00000000);
    SetDynamicObjectMaterial(g_Object[2], 2, 16395, "desn2_minestuff", "cw2_mountboards1", 0x00000000);
    SetDynamicObjectMaterial(g_Object[2], 3, 9902, "coastground", "coasty_fencet_sfe", 0x00000000);
    SetDynamicObjectMaterial(g_Object[2], 4, 18038, "vegas_munation", "mp_gun_range", 0x00000000);
    SetDynamicObjectMaterial(g_Object[2], 6, 8487, "ballyswater", "waterclear256", 0x00000000);
    SetDynamicObjectMaterial(g_Object[2], 8, 6284, "bev_law2", "beachwalkway", 0x00000000);
    SetDynamicObjectMaterial(g_Object[2], 9, 5149, "lasground2_las2", "driveway4_128", 0x00000000);
    g_Object[3] = CreateDynamicObject(16258, 1066.1490, -3207.8029, -6.4239, 0.0000, 0.0000, -80.4000); //cen_bit_21
    SetDynamicObjectMaterial(g_Object[3], 2, 3374, "ce_farmxref", "forestfloor256", 0x00000000);
    SetDynamicObjectMaterial(g_Object[3], 5, 12871, "ce_ground01", "rocktbrn128", 0x00000000);
    g_Object[4] = CreateDynamicObject(16258, 1011.7050, -3094.1550, -25.1040, 0.0000, 0.0000, -10.3999); //cen_bit_21
    SetDynamicObjectMaterial(g_Object[4], 2, 3374, "ce_farmxref", "forestfloor256", 0x00000000);
    SetDynamicObjectMaterial(g_Object[4], 5, 12871, "ce_ground01", "rocktbrn128", 0x00000000);
    g_Object[5] = CreateDynamicObject(16258, 956.7009, -3297.9370, -13.5438, 0.0000, 0.0000, 9.6000); //cen_bit_21
    SetDynamicObjectMaterial(g_Object[5], 2, 3374, "ce_farmxref", "forestfloor256", 0x00000000);
    SetDynamicObjectMaterial(g_Object[5], 5, 12871, "ce_ground01", "rocktbrn128", 0x00000000);
    g_Object[6] = CreateDynamicObject(18228, 950.0858, -3303.4938, 5.9359, 0.0000, 0.0000, -38.9000); //cunt_rockgp2_21
    SetDynamicObjectMaterial(g_Object[6], 0, 10166, "p69_rocks", "sfe_rock2", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[6], 1, 10166, "p69_rocks", "sfe_rock2", 0x00000000);
    g_Object[7] = CreateDynamicObject(18228, 984.2399, -3305.9460, 5.9359, 0.0000, 0.0000, -38.9000); //cunt_rockgp2_21
    SetDynamicObjectMaterial(g_Object[7], 0, 10166, "p69_rocks", "sfe_rock2", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[7], 1, 10166, "p69_rocks", "sfe_rock2", 0x00000000);
    g_Object[8] = CreateDynamicObject(18228, 968.0579, -3326.0009, -8.9840, 0.0000, 0.0000, -38.9000); //cunt_rockgp2_21
    SetDynamicObjectMaterial(g_Object[8], 0, 10166, "p69_rocks", "sfe_rock2", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[8], 1, 10166, "p69_rocks", "sfe_rock2", 0x00000000);
    g_Object[9] = CreateDynamicObject(18228, 845.6680, -3294.9780, -3.1040, 0.0000, 0.0000, 55.4000); //cunt_rockgp2_21
    SetDynamicObjectMaterial(g_Object[9], 0, 10166, "p69_rocks", "sfe_rock2", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[9], 1, 10166, "p69_rocks", "sfe_rock2", 0x00000000);
    g_Object[10] = CreateDynamicObject(18228, 853.1760, -3277.4350, -7.0138, 0.0000, 0.0000, -107.0998); //cunt_rockgp2_21
    SetDynamicObjectMaterial(g_Object[10], 0, 10166, "p69_rocks", "sfe_rock2", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[10], 1, 10166, "p69_rocks", "sfe_rock2", 0x00000000);
    g_Object[11] = CreateDynamicObject(19539, 923.4080, -3168.8798, 3.0060, 0.0000, 0.0000, 180.0000); //Edge62_5x62_5Grass1
    SetDynamicObjectMaterial(g_Object[11], 0, 16093, "a51_ext", "des_dirt1", 0x00000000);
    SetDynamicObjectMaterial(g_Object[11], 1, 16093, "a51_ext", "des_dirt1", 0x00000000);
    SetDynamicObjectMaterial(g_Object[11], 2, 16093, "a51_ext", "des_dirt1", 0x00000000);
    SetDynamicObjectMaterial(g_Object[11], 3, 16093, "a51_ext", "des_dirt1", 0x00000000);
    g_Object[12] = CreateDynamicObject(19539, 923.4080, -3231.3798, 3.0060, 0.0000, 0.0000, 180.0000); //Edge62_5x62_5Grass1
    SetDynamicObjectMaterial(g_Object[12], 0, 16093, "a51_ext", "des_dirt1", 0x00000000);
    SetDynamicObjectMaterial(g_Object[12], 1, 16093, "a51_ext", "des_dirt1", 0x00000000);
    SetDynamicObjectMaterial(g_Object[12], 2, 16093, "a51_ext", "des_dirt1", 0x00000000);
    SetDynamicObjectMaterial(g_Object[12], 3, 16093, "a51_ext", "des_dirt1", 0x00000000);
    g_Object[13] = CreateDynamicObject(18228, 893.1198, -3131.2109, -7.0138, 0.0000, 0.0000, -160.3999); //cunt_rockgp2_21
    SetDynamicObjectMaterial(g_Object[13], 0, 10166, "p69_rocks", "sfe_rock2", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[13], 1, 10166, "p69_rocks", "sfe_rock2", 0x00000000);
    g_Object[14] = CreateDynamicObject(18228, 937.7730, -3094.8068, -6.4239, 0.0000, 0.0000, -164.1000); //cunt_rockgp2_21
    SetDynamicObjectMaterial(g_Object[14], 0, 10166, "p69_rocks", "sfe_rock2", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[14], 1, 10166, "p69_rocks", "sfe_rock2", 0x00000000);
    g_Object[15] = CreateDynamicObject(18228, 1049.9620, -3098.6101, -6.4239, 0.0000, 0.0000, 73.0000); //cunt_rockgp2_21
    SetDynamicObjectMaterial(g_Object[15], 0, 10166, "p69_rocks", "sfe_rock2", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[15], 1, 10166, "p69_rocks", "sfe_rock2", 0x00000000);
    g_Object[16] = CreateDynamicObject(18228, 996.5789, -3103.4609, -9.4139, 0.0000, 0.0000, -31.2999); //cunt_rockgp2_21
    SetDynamicObjectMaterial(g_Object[16], 0, 10166, "p69_rocks", "sfe_rock2", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[16], 1, 10166, "p69_rocks", "sfe_rock2", 0x00000000);
    g_Object[17] = CreateDynamicObject(6959, 959.3350, -3160.3459, -9.9358, -270.0000, 90.0000, 0.0000); //vegasNbball1
    SetDynamicObjectMaterial(g_Object[17], 0, 18038, "vegas_munation", "mp_gun_range", 0xFFFFFFFF);
    g_Object[18] = CreateDynamicObject(6959, 979.9650, -3139.6970, -9.9358, -270.0000, 90.0000, -90.0000); //vegasNbball1
    SetDynamicObjectMaterial(g_Object[18], 0, 18038, "vegas_munation", "mp_gun_range", 0xFFFFFFFF);
    g_Object[19] = CreateDynamicObject(6959, 1011.7039, -3184.8989, -10.4160, -270.0000, 90.0000, -180.0000); //vegasNbball1
    SetDynamicObjectMaterial(g_Object[19], 0, 18038, "vegas_munation", "mp_gun_range", 0xFFFFFFFF);
    g_Object[20] = CreateDynamicObject(6959, 986.7550, -3149.7070, 9.5690, -180.0000, 180.0000, -90.0000); //vegasNbball1
    g_Object[21] = CreateDynamicObject(6959, 991.3048, -3129.0690, -10.4160, -270.0000, 90.0000, -90.0000); //vegasNbball1
    SetDynamicObjectMaterial(g_Object[21], 0, 18038, "vegas_munation", "mp_gun_range", 0xFFFFFFFF);
    g_Object[22] = CreateDynamicObject(6959, 987.4240, -3129.0791, -10.4160, -270.0000, 90.0000, -90.0000); //vegasNbball1
    SetDynamicObjectMaterial(g_Object[22], 0, 18038, "vegas_munation", "mp_gun_range", 0xFFFFFFFF);
    g_Object[23] = CreateDynamicObject(6959, 966.7838, -3149.7189, -10.4160, -270.0000, 90.0000, 0.0000); //vegasNbball1
    SetDynamicObjectMaterial(g_Object[23], 0, 18038, "vegas_munation", "mp_gun_range", 0xFFFFFFFF);
    g_Object[24] = CreateDynamicObject(6959, 1012.0050, -3149.7189, -10.4160, -270.0000, 90.0000, 0.0000); //vegasNbball1
    SetDynamicObjectMaterial(g_Object[24], 0, 18038, "vegas_munation", "mp_gun_range", 0xFFFFFFFF);
    g_Object[25] = CreateDynamicObject(3330, 951.5808, -3178.8649, 11.2980, 0.0000, 0.0000, 90.0000); //cxrf_brigleg
    SetDynamicObjectMaterial(g_Object[25], 0, 1220, "boxes", "crate128", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[25], 1, 5109, "docks_las2", "sjmndukwal3", 0x00000000);
    g_Object[26] = CreateDynamicObject(3749, 951.6840, -3198.7080, 18.6940, 0.0000, 0.0000, 90.0000); //ClubGate01_LAx
    SetDynamicObjectMaterial(g_Object[26], 0, 1220, "boxes", "crate128", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[26], 1, 3193, "cxref_desert", "sw_woodslat01", 0x00000000);
    SetDynamicObjectMaterial(g_Object[26], 2, 1220, "boxes", "crate128", 0x00000000);
    SetDynamicObjectMaterial(g_Object[26], 3, 5109, "docks_las2", "sjmndukwal3", 0x00000000);
    g_Object[27] = CreateDynamicObject(3749, 951.6840, -3198.7080, 6.9840, 180.0000, 0.0000, 90.0000); //ClubGate01_LAx
    SetDynamicObjectMaterial(g_Object[27], 0, 1220, "boxes", "crate128", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[27], 1, 3193, "cxref_desert", "sw_woodslat01", 0x00000000);
    SetDynamicObjectMaterial(g_Object[27], 2, 1220, "boxes", "crate128", 0x00000000);
    SetDynamicObjectMaterial(g_Object[27], 3, 5109, "docks_las2", "sjmndukwal3", 0x00000000);
    g_Object[28] = CreateDynamicObject(3330, 951.5808, -3218.7829, 11.2980, 0.0000, 0.0000, 90.0000); //cxrf_brigleg
    SetDynamicObjectMaterial(g_Object[28], 0, 1220, "boxes", "crate128", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[28], 1, 5109, "docks_las2", "sjmndukwal3", 0x00000000);
    g_Object[29] = CreateDynamicObject(3330, 951.4600, -3160.1750, 11.3030, 0.0000, 0.0000, 90.0000); //cxrf_brigleg
    SetDynamicObjectMaterial(g_Object[29], 0, 1220, "boxes", "crate128", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[29], 1, 5109, "docks_las2", "sjmndukwal3", 0x00000000);
    g_Object[30] = CreateDynamicObject(3330, 951.3499, -3141.3811, 11.3079, 0.0000, 0.0000, 90.0000); //cxrf_brigleg
    SetDynamicObjectMaterial(g_Object[30], 0, 1220, "boxes", "crate128", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[30], 1, 5109, "docks_las2", "sjmndukwal3", 0x00000000);
    g_Object[31] = CreateDynamicObject(3330, 959.0759, -3128.7500, 11.3128, 0.0000, 0.0000, 25.0000); //cxrf_brigleg
    SetDynamicObjectMaterial(g_Object[31], 0, 1220, "boxes", "crate128", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[31], 1, 5109, "docks_las2", "sjmndukwal3", 0x00000000);
    g_Object[32] = CreateDynamicObject(3330, 976.2700, -3124.8310, 11.3079, 0.0000, 0.0000, 180.0000); //cxrf_brigleg
    SetDynamicObjectMaterial(g_Object[32], 0, 1220, "boxes", "crate128", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[32], 1, 5109, "docks_las2", "sjmndukwal3", 0x00000000);
    g_Object[33] = CreateDynamicObject(3330, 995.0399, -3124.6999, 11.3128, 0.0000, 0.0000, 180.0000); //cxrf_brigleg
    SetDynamicObjectMaterial(g_Object[33], 0, 1220, "boxes", "crate128", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[33], 1, 5109, "docks_las2", "sjmndukwal3", 0x00000000);
    g_Object[34] = CreateDynamicObject(3330, 1013.8200, -3124.5900, 11.3178, 0.0000, 0.0000, 180.0000); //cxrf_brigleg
    SetDynamicObjectMaterial(g_Object[34], 0, 1220, "boxes", "crate128", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[34], 1, 5109, "docks_las2", "sjmndukwal3", 0x00000000);
    g_Object[35] = CreateDynamicObject(3330, 1022.7600, -3133.4108, 11.3228, 0.0000, 0.0000, 270.0000); //cxrf_brigleg
    SetDynamicObjectMaterial(g_Object[35], 0, 1220, "boxes", "crate128", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[35], 1, 5109, "docks_las2", "sjmndukwal3", 0x00000000);
    g_Object[36] = CreateDynamicObject(3330, 1022.8698, -3152.2080, 11.3280, 0.0000, 0.0000, 270.0000); //cxrf_brigleg
    SetDynamicObjectMaterial(g_Object[36], 0, 1220, "boxes", "crate128", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[36], 1, 5109, "docks_las2", "sjmndukwal3", 0x00000000);
    g_Object[37] = CreateDynamicObject(3330, 1023.0000, -3171.0190, 11.3330, 0.0000, 0.0000, 270.0000); //cxrf_brigleg
    SetDynamicObjectMaterial(g_Object[37], 0, 1220, "boxes", "crate128", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[37], 1, 5109, "docks_las2", "sjmndukwal3", 0x00000000);
    g_Object[38] = CreateDynamicObject(3330, 1023.1198, -3189.8081, 11.3380, 0.0000, 0.0000, 270.0000); //cxrf_brigleg
    SetDynamicObjectMaterial(g_Object[38], 0, 1220, "boxes", "crate128", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[38], 1, 5109, "docks_las2", "sjmndukwal3", 0x00000000);
    g_Object[39] = CreateDynamicObject(3330, 1018.9298, -3206.2160, 11.3430, 0.0000, 0.0000, 240.0000); //cxrf_brigleg
    SetDynamicObjectMaterial(g_Object[39], 0, 1220, "boxes", "crate128", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[39], 1, 5109, "docks_las2", "sjmndukwal3", 0x00000000);
    g_Object[40] = CreateDynamicObject(16327, 951.5150, -3178.7009, 16.5060, 0.0000, 0.0000, 0.0000); //des_bycontowr
    SetDynamicObjectMaterial(g_Object[40], 0, 6284, "bev_law2", "beachwalkway", 0x00000000);
    SetDynamicObjectMaterial(g_Object[40], 4, 17036, "cuntwbt", "des_woodslats2", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[40], 7, 5154, "dkcargoshp_las2", "jettyfloor02", 0x00000000);
    g_Object[41] = CreateDynamicObject(16327, 951.5150, -3141.7670, 16.5060, 0.0000, 0.0000, 0.0000); //des_bycontowr
    SetDynamicObjectMaterial(g_Object[41], 0, 6284, "bev_law2", "beachwalkway", 0x00000000);
    SetDynamicObjectMaterial(g_Object[41], 4, 17036, "cuntwbt", "des_woodslats2", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[41], 7, 5154, "dkcargoshp_las2", "jettyfloor02", 0x00000000);
    g_Object[42] = CreateDynamicObject(16327, 976.5949, -3124.7971, 16.5060, 0.0000, 0.0000, 0.0000); //des_bycontowr
    SetDynamicObjectMaterial(g_Object[42], 0, 6284, "bev_law2", "beachwalkway", 0x00000000);
    SetDynamicObjectMaterial(g_Object[42], 4, 17036, "cuntwbt", "des_woodslats2", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[42], 7, 5154, "dkcargoshp_las2", "jettyfloor02", 0x00000000);
    g_Object[43] = CreateDynamicObject(16327, 1013.6538, -3124.7971, 16.5060, 0.0000, 0.0000, 0.0000); //des_bycontowr
    SetDynamicObjectMaterial(g_Object[43], 0, 6284, "bev_law2", "beachwalkway", 0x00000000);
    SetDynamicObjectMaterial(g_Object[43], 4, 17036, "cuntwbt", "des_woodslats2", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[43], 7, 5154, "dkcargoshp_las2", "jettyfloor02", 0x00000000);
    g_Object[44] = CreateDynamicObject(16327, 1022.8350, -3152.3769, 16.5060, 0.0000, 0.0000, 0.0000); //des_bycontowr
    SetDynamicObjectMaterial(g_Object[44], 0, 6284, "bev_law2", "beachwalkway", 0x00000000);
    SetDynamicObjectMaterial(g_Object[44], 4, 17036, "cuntwbt", "des_woodslats2", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[44], 7, 5154, "dkcargoshp_las2", "jettyfloor02", 0x00000000);
    g_Object[45] = CreateDynamicObject(16327, 1022.8350, -3189.6279, 16.5060, 0.0000, 0.0000, 0.0000); //des_bycontowr
    SetDynamicObjectMaterial(g_Object[45], 0, 6284, "bev_law2", "beachwalkway", 0x00000000);
    SetDynamicObjectMaterial(g_Object[45], 4, 17036, "cuntwbt", "des_woodslats2", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[45], 7, 5154, "dkcargoshp_las2", "jettyfloor02", 0x00000000);
    g_Object[46] = CreateDynamicObject(16327, 951.5150, -3218.7500, 16.5060, 0.0000, 0.0000, 0.0000); //des_bycontowr
    SetDynamicObjectMaterial(g_Object[46], 0, 6284, "bev_law2", "beachwalkway", 0x00000000);
    SetDynamicObjectMaterial(g_Object[46], 4, 17036, "cuntwbt", "des_woodslats2", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[46], 7, 5154, "dkcargoshp_las2", "jettyfloor02", 0x00000000);
    g_Object[47] = CreateDynamicObject(3330, 1009.6320, -3222.5529, 11.3479, 0.0000, 0.0000, 240.0000); //cxrf_brigleg
    SetDynamicObjectMaterial(g_Object[47], 0, 1220, "boxes", "crate128", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[47], 1, 5109, "docks_las2", "sjmndukwal3", 0x00000000);
    g_Object[48] = CreateDynamicObject(3330, 950.9030, -3236.5620, 11.3030, 0.0000, 0.0000, 85.0000); //cxrf_brigleg
    SetDynamicObjectMaterial(g_Object[48], 0, 1220, "boxes", "crate128", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[48], 1, 5109, "docks_las2", "sjmndukwal3", 0x00000000);
    g_Object[49] = CreateDynamicObject(3330, 952.6439, -3254.5319, 11.3079, 0.0000, 0.0000, 105.0000); //cxrf_brigleg
    SetDynamicObjectMaterial(g_Object[49], 0, 1220, "boxes", "crate128", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[49], 1, 5109, "docks_las2", "sjmndukwal3", 0x00000000);
    g_Object[50] = CreateDynamicObject(3330, 1000.3488, -3238.8100, 11.3528, 0.0000, 0.0000, 240.0000); //cxrf_brigleg
    SetDynamicObjectMaterial(g_Object[50], 0, 1220, "boxes", "crate128", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[50], 1, 5109, "docks_las2", "sjmndukwal3", 0x00000000);
    g_Object[51] = CreateDynamicObject(3330, 991.0808, -3255.1149, 11.3578, 0.0000, 0.0000, 240.0000); //cxrf_brigleg
    SetDynamicObjectMaterial(g_Object[51], 0, 1220, "boxes", "crate128", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[51], 1, 5109, "docks_las2", "sjmndukwal3", 0x00000000);
    g_Object[52] = CreateDynamicObject(3330, 978.8930, -3267.5629, 11.3628, 0.0000, 0.0000, -149.3999); //cxrf_brigleg
    SetDynamicObjectMaterial(g_Object[52], 0, 1220, "boxes", "crate128", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[52], 1, 5109, "docks_las2", "sjmndukwal3", 0x00000000);
    g_Object[53] = CreateDynamicObject(3330, 962.2589, -3268.0090, 11.3128, 0.0000, 0.0000, 145.0000); //cxrf_brigleg
    SetDynamicObjectMaterial(g_Object[53], 0, 1220, "boxes", "crate128", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[53], 1, 5109, "docks_las2", "sjmndukwal3", 0x00000000);
    g_Object[54] = CreateDynamicObject(16327, 952.4569, -3253.8410, 16.5060, 0.0000, 0.0000, 16.0000); //des_bycontowr
    SetDynamicObjectMaterial(g_Object[54], 0, 6284, "bev_law2", "beachwalkway", 0x00000000);
    SetDynamicObjectMaterial(g_Object[54], 4, 17036, "cuntwbt", "des_woodslats2", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[54], 7, 5154, "dkcargoshp_las2", "jettyfloor02", 0x00000000);
    g_Object[55] = CreateDynamicObject(16327, 1009.6149, -3222.5249, 16.5060, 0.0000, 0.0000, -30.0000); //des_bycontowr
    SetDynamicObjectMaterial(g_Object[55], 0, 6284, "bev_law2", "beachwalkway", 0x00000000);
    SetDynamicObjectMaterial(g_Object[55], 4, 17036, "cuntwbt", "des_woodslats2", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[55], 7, 5154, "dkcargoshp_las2", "jettyfloor02", 0x00000000);
    g_Object[56] = CreateDynamicObject(16327, 991.1718, -3254.7250, 16.5060, 0.0000, 0.0000, -30.0000); //des_bycontowr
    SetDynamicObjectMaterial(g_Object[56], 0, 6284, "bev_law2", "beachwalkway", 0x00000000);
    SetDynamicObjectMaterial(g_Object[56], 4, 17036, "cuntwbt", "des_woodslats2", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[56], 7, 5154, "dkcargoshp_las2", "jettyfloor02", 0x00000000);
    g_Object[57] = CreateDynamicObject(18228, 1045.9638, -3220.1379, -2.1440, 0.0000, 0.0000, 51.0998); //cunt_rockgp2_21
    SetDynamicObjectMaterial(g_Object[57], 0, 10166, "p69_rocks", "sfe_rock2", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[57], 1, 10166, "p69_rocks", "sfe_rock2", 0x00000000);
    g_Object[58] = CreateDynamicObject(18228, 1059.0688, -3192.6840, -2.5239, 0.0000, 0.0000, 35.2999); //cunt_rockgp2_21
    SetDynamicObjectMaterial(g_Object[58], 0, 10166, "p69_rocks", "sfe_rock2", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[58], 1, 10166, "p69_rocks", "sfe_rock2", 0x00000000);
    g_Object[59] = CreateDynamicObject(18228, 1060.3918, -3210.7939, -3.5638, 0.0000, 0.0000, 76.0000); //cunt_rockgp2_21
    SetDynamicObjectMaterial(g_Object[59], 0, 10166, "p69_rocks", "sfe_rock2", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[59], 1, 10166, "p69_rocks", "sfe_rock2", 0x00000000);
    g_Object[60] = CreateDynamicObject(18228, 1041.3409, -3190.7829, -3.5638, 0.0000, 0.0000, 128.0000); //cunt_rockgp2_21
    SetDynamicObjectMaterial(g_Object[60], 0, 10166, "p69_rocks", "sfe_rock2", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[60], 1, 10166, "p69_rocks", "sfe_rock2", 0x00000000);
    g_Object[61] = CreateDynamicObject(624, 918.0520, -3164.7648, 2.2739, 0.0000, 0.0000, -90.0000); //veg_palwee02
    g_Object[62] = CreateDynamicObject(624, 913.5620, -3148.0349, 1.4140, 5.0000, 0.0000, -90.0000); //veg_palwee02
    g_Object[63] = CreateDynamicObject(624, 933.7420, -3233.7749, 9.3140, 3.0000, 0.0000, 0.0000); //veg_palwee02
    g_Object[64] = CreateDynamicObject(623, 923.8729, -3214.3110, 6.5019, 0.0000, 0.0000, 90.0000); //veg_palwee01
    g_Object[65] = CreateDynamicObject(634, 924.7420, -3238.6350, 7.7779, 0.0000, 0.0000, 0.0000); //veg_palmkbb11
    g_Object[66] = CreateDynamicObject(634, 935.7180, -3259.3029, 12.1250, 5.0000, 0.0000, 180.0000); //veg_palmkbb11
    g_Object[67] = CreateDynamicObject(634, 905.6380, -3161.9260, 3.0789, 5.0000, 0.0000, 90.0000); //veg_palmkbb11
    g_Object[68] = CreateDynamicObject(710, 924.2990, -3181.1599, 18.4139, 0.0000, 0.0000, 0.0000); //vgs_palm01
    g_Object[69] = CreateDynamicObject(710, 928.2990, -3149.4079, 15.4238, 3.0000, 0.0000, 180.0000); //vgs_palm01
    g_Object[70] = CreateDynamicObject(710, 894.9050, -3149.5419, 17.9668, 3.0000, 3.0000, 270.0000); //vgs_palm01
    g_Object[71] = CreateDynamicObject(711, 924.7448, -3128.0659, 8.8830, 0.0000, 0.0000, 0.0000); //vgs_palm02
    g_Object[72] = CreateDynamicObject(711, 934.7810, -3188.2219, 11.4580, 5.0000, 3.0000, 90.0000); //vgs_palm02
    g_Object[73] = CreateDynamicObject(711, 945.3300, -3280.2661, 18.2779, 0.0000, 0.0000, 0.0000); //vgs_palm02
    g_Object[74] = CreateDynamicObject(711, 898.4619, -3258.4550, 8.8978, 5.0000, 0.0000, 180.0000); //vgs_palm02
    g_Object[75] = CreateDynamicObject(624, 970.8120, -3280.9399, 10.0958, 3.0000, 0.0000, 90.0000); //veg_palwee02
    g_Object[76] = CreateDynamicObject(767, 909.0330, -3138.1240, 2.8159, 0.0000, 0.0000, 0.0000); //Elmtreegrn_hi
    g_Object[77] = CreateDynamicObject(767, 946.5369, -3117.5200, 2.4360, 0.0000, 0.0000, 90.0000); //Elmtreegrn_hi
    g_Object[78] = CreateDynamicObject(767, 1014.2249, -3256.1730, 12.4288, 0.0000, 0.0000, 180.0000); //Elmtreegrn_hi
    g_Object[79] = CreateDynamicObject(13637, 966.1829, -3250.0849, 14.5830, 0.0000, 0.0000, 90.0000); //tuberamp
    SetDynamicObjectMaterial(g_Object[79], 0, 10386, "mountainsfs", "ws_stonewall", 0x00000000);
    g_Object[80] = CreateDynamicObject(16305, 967.8530, -3250.7480, 14.7010, 0.0000, 0.0000, 57.7999); //des_gravelpile06
    SetDynamicObjectMaterial(g_Object[80], 0, 10984, "demolished1_sfse", "ws_rubble1b", 0xFFFFFFFF);
    g_Object[81] = CreateDynamicObject(16305, 958.7199, -3251.0830, 13.6110, 0.0000, 0.0000, 57.7999); //des_gravelpile06
    SetDynamicObjectMaterial(g_Object[81], 0, 10984, "demolished1_sfse", "ws_rubble1b", 0xFFFFFFFF);
    g_Object[82] = CreateDynamicObject(16305, 975.1190, -3255.4069, 14.1309, 0.0000, 0.0000, 57.7999); //des_gravelpile06
    SetDynamicObjectMaterial(g_Object[82], 0, 10984, "demolished1_sfse", "ws_rubble1b", 0xFFFFFFFF);
    g_Object[83] = CreateDynamicObject(16305, 969.8679, -3243.0849, 13.6908, 0.0000, 0.0000, 57.7999); //des_gravelpile06
    SetDynamicObjectMaterial(g_Object[83], 0, 10984, "demolished1_sfse", "ws_rubble1b", 0xFFFFFFFF);
    g_Object[84] = CreateDynamicObject(3498, 970.7039, -3256.1508, 16.5410, 0.0000, 0.0000, 0.0000); //wdpillar01_lvs
    SetDynamicObjectMaterial(g_Object[84], 1, 8869, "buildingsitevge", "telepole2128", 0xFFFFFFFF);
    g_Object[85] = CreateDynamicObject(3498, 965.1939, -3257.9431, 21.0680, 5.0000, 0.0000, 0.0000); //wdpillar01_lvs
    SetDynamicObjectMaterial(g_Object[85], 1, 8869, "buildingsitevge", "telepole2128", 0xFFFFFFFF);
    g_Object[86] = CreateDynamicObject(3498, 968.6640, -3244.5778, 13.5410, 0.0000, 0.0000, 0.0000); //wdpillar01_lvs
    SetDynamicObjectMaterial(g_Object[86], 1, 8869, "buildingsitevge", "telepole2128", 0xFFFFFFFF);
    g_Object[87] = CreateDynamicObject(3498, 968.6640, -3250.3679, 13.5410, 64.1998, -64.3000, -39.7999); //wdpillar01_lvs
    SetDynamicObjectMaterial(g_Object[87], 1, 8869, "buildingsitevge", "telepole2128", 0xFFFFFFFF);
    g_Object[88] = CreateDynamicObject(3498, 963.6550, -3242.8391, 13.3050, 75.1998, -21.5000, 0.0000); //wdpillar01_lvs
    SetDynamicObjectMaterial(g_Object[88], 1, 8869, "buildingsitevge", "telepole2128", 0xFFFFFFFF);
    g_Object[89] = CreateDynamicObject(2937, 969.4428, -3251.9199, 14.0810, 22.7999, 57.2000, -35.9000); //kmb_plank
    SetDynamicObjectMaterial(g_Object[89], 0, 17036, "cuntwbt", "des_woodslats2", 0xFFFFFFFF);
    g_Object[90] = CreateDynamicObject(2937, 962.2290, -3248.8479, 13.2629, 3.2000, 167.6999, -35.9000); //kmb_plank
    SetDynamicObjectMaterial(g_Object[90], 0, 17036, "cuntwbt", "des_woodslats2", 0xFFFFFFFF);
    g_Object[91] = CreateDynamicObject(2937, 973.7550, -3250.3278, 16.7070, 0.0000, 0.0000, 20.7999); //kmb_plank
    SetDynamicObjectMaterial(g_Object[91], 0, 17036, "cuntwbt", "des_woodslats2", 0xFFFFFFFF);
    g_Object[92] = CreateDynamicObject(2937, 961.1439, -3240.3391, 12.7068, 0.0000, 0.0000, 124.3000); //kmb_plank
    SetDynamicObjectMaterial(g_Object[92], 0, 17036, "cuntwbt", "des_woodslats2", 0xFFFFFFFF);
    g_Object[93] = CreateDynamicObject(11359, 949.5839, -3218.7509, 19.3530, 0.0000, 0.0000, -90.0000); //oldgrgedoor3_sfse
    SetDynamicObjectMaterial(g_Object[93], 0, 16076, "des_quarrybits", "sm_quarry_Rusty", 0xFFFFFFFF);
    g_Object[94] = CreateDynamicObject(11359, 948.9439, -3218.7509, 14.3730, 0.0000, 0.0000, -89.5998); //oldgrgedoor3_sfse
    SetDynamicObjectMaterial(g_Object[94], 0, 5069, "ctscene_las", "ruffroadlas", 0xFFFFFFFF);
    g_Object[95] = CreateDynamicObject(11359, 949.5640, -3207.1640, 11.4930, 0.0000, -90.0000, -89.5998); //oldgrgedoor3_sfse
    SetDynamicObjectMaterial(g_Object[95], 0, 5069, "ctscene_las", "ruffroadlas", 0xFFFFFFFF);
    g_Object[96] = CreateDynamicObject(11359, 949.6989, -3253.3029, 13.4930, 180.0000, -90.0000, -75.0000); //oldgrgedoor3_sfse
    SetDynamicObjectMaterial(g_Object[96], 0, 5069, "ctscene_las", "ruffroadlas", 0xFFFFFFFF);
    g_Object[97] = CreateDynamicObject(11359, 950.5650, -3256.6130, 14.7930, 180.0000, 180.0000, -75.0000); //oldgrgedoor3_sfse
    SetDynamicObjectMaterial(g_Object[97], 0, 5069, "ctscene_las", "ruffroadlas", 0xFFFFFFFF);
    g_Object[98] = CreateDynamicObject(11359, 948.9589, -3182.1250, 11.4930, 0.0000, 135.0000, -89.5998); //oldgrgedoor3_sfse
    SetDynamicObjectMaterial(g_Object[98], 0, 5069, "ctscene_las", "ruffroadlas", 0xFFFFFFFF);
    g_Object[99] = CreateDynamicObject(11359, 948.9260, -3180.2980, 11.0038, 0.0000, 165.0000, -89.5998); //oldgrgedoor3_sfse
    SetDynamicObjectMaterial(g_Object[99], 0, 5069, "ctscene_las", "ruffroadlas", 0xFFFFFFFF);
    g_Object[100] = CreateDynamicObject(11359, 948.7700, -3157.8588, 7.5068, 0.0000, 345.0000, -89.5998); //oldgrgedoor3_sfse
    SetDynamicObjectMaterial(g_Object[100], 0, 5069, "ctscene_las", "ruffroadlas", 0xFFFFFFFF);
    g_Object[101] = CreateDynamicObject(11359, 948.6668, -3144.4179, 13.2650, 0.0000, 300.0000, -89.5998); //oldgrgedoor3_sfse
    SetDynamicObjectMaterial(g_Object[101], 0, 5069, "ctscene_las", "ruffroadlas", 0xFFFFFFFF);
    g_Object[102] = CreateDynamicObject(11359, 948.6430, -3143.9499, 9.7840, 0.0000, 450.0000, -89.5998); //oldgrgedoor3_sfse
    SetDynamicObjectMaterial(g_Object[102], 0, 5069, "ctscene_las", "ruffroadlas", 0xFFFFFFFF);
    g_Object[103] = CreateDynamicObject(11359, 948.6350, -3142.7910, 6.2238, 0.0000, 540.0000, -89.5998); //oldgrgedoor3_sfse
    SetDynamicObjectMaterial(g_Object[103], 0, 5069, "ctscene_las", "ruffroadlas", 0xFFFFFFFF);
    g_Object[104] = CreateDynamicObject(11359, 959.2448, -3178.6179, 14.2638, 0.0000, 540.0000, -89.5998); //oldgrgedoor3_sfse
    SetDynamicObjectMaterial(g_Object[104], 0, 5069, "ctscene_las", "ruffroadlas", 0xFFFFFFFF);
    g_Object[105] = CreateDynamicObject(11359, 962.1480, -3184.6760, 11.3540, 0.0000, 630.0000, 0.2000); //oldgrgedoor3_sfse
    SetDynamicObjectMaterial(g_Object[105], 0, 5069, "ctscene_las", "ruffroadlas", 0xFFFFFFFF);
    g_Object[106] = CreateDynamicObject(11359, 999.4180, -3184.5371, 11.3540, 180.0000, 630.0000, 0.2000); //oldgrgedoor3_sfse
    SetDynamicObjectMaterial(g_Object[106], 0, 5069, "ctscene_las", "ruffroadlas", 0xFFFFFFFF);
    g_Object[107] = CreateDynamicObject(11359, 1001.3070, -3186.7929, 12.1040, 180.0000, 720.0000, 90.1998); //oldgrgedoor3_sfse
    SetDynamicObjectMaterial(g_Object[107], 0, 5069, "ctscene_las", "ruffroadlas", 0xFFFFFFFF);
    g_Object[108] = CreateDynamicObject(639, 948.8820, -3212.4309, 13.8479, 180.0000, 0.0000, 0.0000); //veg_ivy_balcny_kb3
    g_Object[109] = CreateDynamicObject(639, 948.8820, -3216.4719, 12.6180, 180.0000, 0.0000, 0.0000); //veg_ivy_balcny_kb3
    g_Object[110] = CreateDynamicObject(639, 948.9320, -3224.9340, 14.8479, 360.0000, 0.0000, 0.0000); //veg_ivy_balcny_kb3
    g_Object[111] = CreateDynamicObject(639, 948.7020, -3230.7590, 14.8479, 360.0000, 0.0000, -4.4000); //veg_ivy_balcny_kb3
    g_Object[112] = CreateDynamicObject(639, 948.5640, -3232.5539, 14.2278, 540.0000, 0.0000, -4.4000); //veg_ivy_balcny_kb3
    g_Object[113] = CreateDynamicObject(639, 948.2650, -3236.4489, 12.7080, 540.0000, 0.0000, -4.4000); //veg_ivy_balcny_kb3
    g_Object[114] = CreateDynamicObject(639, 948.4010, -3249.0419, 13.6078, 540.0000, 0.0000, 14.5000); //veg_ivy_balcny_kb3
    g_Object[115] = CreateDynamicObject(639, 952.7009, -3258.9589, 19.5179, 720.0000, 0.0000, 14.5000); //veg_ivy_balcny_kb3
    g_Object[116] = CreateDynamicObject(639, 948.3308, -3202.6311, 19.7280, 360.0000, 0.0000, 0.0000); //veg_ivy_balcny_kb3
    g_Object[117] = CreateDynamicObject(639, 949.5808, -3189.8010, 9.8079, 540.0000, 0.0000, 0.0000); //veg_ivy_balcny_kb3
    g_Object[118] = CreateDynamicObject(639, 948.9920, -3185.1110, 9.8079, 540.0000, 0.0000, 0.0000); //veg_ivy_balcny_kb3
    g_Object[119] = CreateDynamicObject(639, 950.4420, -3183.3601, 19.4179, 720.0000, 0.0000, 0.0000); //veg_ivy_balcny_kb3
    g_Object[120] = CreateDynamicObject(639, 950.4420, -3173.9399, 19.4179, 720.0000, 0.0000, 0.0000); //veg_ivy_balcny_kb3
    g_Object[121] = CreateDynamicObject(639, 948.9010, -3169.7700, 14.8879, 720.0000, 0.0000, 0.0000); //veg_ivy_balcny_kb3
    g_Object[122] = CreateDynamicObject(639, 948.8010, -3159.4389, 14.8879, 720.0000, 0.0000, 0.6000); //veg_ivy_balcny_kb3
    g_Object[123] = CreateDynamicObject(639, 948.7290, -3152.5668, 7.1680, 900.0000, 0.0000, 0.6000); //veg_ivy_balcny_kb3
    g_Object[124] = CreateDynamicObject(639, 948.6749, -3147.3469, 6.0980, 900.0000, 0.0000, 0.6000); //veg_ivy_balcny_kb3
    g_Object[125] = CreateDynamicObject(639, 948.5750, -3134.8969, 4.6079, 900.0000, 0.0000, 0.6000); //veg_ivy_balcny_kb3
    g_Object[126] = CreateDynamicObject(639, 948.6209, -3139.3059, 4.6079, 900.0000, 0.0000, 0.6000); //veg_ivy_balcny_kb3
    g_Object[127] = CreateDynamicObject(639, 950.1798, -3139.2890, 19.3780, 1080.0000, 0.0000, 0.6000); //veg_ivy_balcny_kb3
    g_Object[128] = CreateDynamicObject(639, 968.1859, -3184.6140, 10.4680, 1260.0000, 0.0000, 90.5998); //veg_ivy_balcny_kb3
    g_Object[129] = CreateDynamicObject(639, 974.8779, -3184.6831, 18.3880, 1080.0000, 0.0000, 90.5998); //veg_ivy_balcny_kb3
    g_Object[130] = CreateDynamicObject(639, 978.7479, -3184.7141, 11.5380, 1260.0000, 0.0000, 90.5998); //veg_ivy_balcny_kb3
    g_Object[131] = CreateDynamicObject(639, 989.5089, -3184.6379, 10.6780, 1260.0000, 0.0000, 90.5998); //veg_ivy_balcny_kb3
    g_Object[132] = CreateDynamicObject(639, 997.6890, -3184.6760, 18.4080, 1440.0000, 0.0000, 90.5998); //veg_ivy_balcny_kb3
    g_Object[133] = CreateDynamicObject(639, 1002.9589, -3184.6201, 18.4080, 1440.0000, 0.0000, 90.5998); //veg_ivy_balcny_kb3
    g_Object[134] = CreateDynamicObject(639, 1000.4990, -3184.6459, 17.5580, 1440.0000, 0.0000, 90.5998); //veg_ivy_balcny_kb3
    g_Object[135] = CreateDynamicObject(639, 999.8339, -3186.0109, 16.2779, 1440.0000, -270.0000, 90.5998); //veg_ivy_balcny_kb3
    g_Object[136] = CreateDynamicObject(639, 999.8220, -3184.9221, 18.1380, 1440.0000, -540.0000, 90.5998); //veg_ivy_balcny_kb3
    g_Object[137] = CreateDynamicObject(639, 999.8220, -3184.8520, 10.7180, 1440.0000, -540.0000, 90.5998); //veg_ivy_balcny_kb3
    g_Object[138] = CreateDynamicObject(639, 996.7609, -3187.7360, 14.2778, 1620.0000, -540.0000, 180.6000); //veg_ivy_balcny_kb3
    g_Object[139] = CreateDynamicObject(639, 996.8228, -3193.6359, 14.2778, 1620.0000, -540.0000, 180.6000); //veg_ivy_balcny_kb3
    g_Object[140] = CreateDynamicObject(639, 996.8070, -3198.8339, 14.2778, 1620.0000, -540.0000, 180.6000); //veg_ivy_balcny_kb3
    g_Object[141] = CreateDynamicObject(639, 996.7780, -3196.0249, 13.4478, 1620.0000, -540.0000, 180.6000); //veg_ivy_balcny_kb3
    g_Object[142] = CreateDynamicObject(639, 1003.7689, -3205.5839, 10.7679, 1800.0000, -540.0000, 270.6000); //veg_ivy_balcny_kb3
    g_Object[143] = CreateDynamicObject(639, 1008.3698, -3205.6369, 9.9580, 1800.0000, -540.0000, 270.6000); //veg_ivy_balcny_kb3
    g_Object[144] = CreateDynamicObject(639, 1011.0430, -3202.1569, 12.4878, 1800.0000, -540.0000, 180.6000); //veg_ivy_balcny_kb3
    g_Object[145] = CreateDynamicObject(639, 1008.9630, -3218.2800, 11.2679, 1800.0000, -540.0000, 151.6000); //veg_ivy_balcny_kb3
    g_Object[146] = CreateDynamicObject(639, 1004.9619, -3225.4360, 14.9078, 1980.0000, -540.0000, 149.6999); //veg_ivy_balcny_kb3
    g_Object[147] = CreateDynamicObject(639, 1002.4790, -3229.6840, 14.9078, 1980.0000, -540.0000, 149.6999); //veg_ivy_balcny_kb3
    g_Object[148] = CreateDynamicObject(639, 996.1668, -3243.7160, 19.5979, 1980.0000, -540.0000, 149.6999); //veg_ivy_balcny_kb3
    g_Object[149] = CreateDynamicObject(639, 988.5418, -3254.2470, 13.3280, 2160.0000, -540.0000, 149.6999); //veg_ivy_balcny_kb3
    g_Object[150] = CreateDynamicObject(639, 973.2730, -3267.8559, 13.3280, 2160.0000, -540.0000, 120.9000); //veg_ivy_balcny_kb3
    g_Object[151] = CreateDynamicObject(639, 976.4140, -3265.9780, 12.4478, 2160.0000, -540.0000, 120.9000); //veg_ivy_balcny_kb3
    g_Object[152] = CreateDynamicObject(639, 977.4439, -3267.0339, 19.3379, 2340.0000, -540.0000, 120.9000); //veg_ivy_balcny_kb3
    g_Object[153] = CreateDynamicObject(639, 961.5139, -3264.2758, 14.8680, 2340.0000, -540.0000, 54.9000); //veg_ivy_balcny_kb3
    g_Object[154] = CreateDynamicObject(639, 959.4450, -3262.8220, 13.4280, 2520.0000, -540.0000, 54.9000); //veg_ivy_balcny_kb3
    g_Object[155] = CreateDynamicObject(639, 956.6400, -3259.0439, 14.4180, 2520.0000, -540.0000, 14.8999); //veg_ivy_balcny_kb3
    g_Object[156] = CreateDynamicObject(639, 952.9060, -3245.0129, 14.4180, 2520.0000, -540.0000, 14.8999); //veg_ivy_balcny_kb3
    g_Object[157] = CreateDynamicObject(639, 953.6420, -3235.5229, 14.8178, 2700.0000, -540.0000, -4.1999); //veg_ivy_balcny_kb3
    g_Object[158] = CreateDynamicObject(639, 952.7838, -3223.4499, 19.4680, 2700.0000, -540.0000, -0.8999); //veg_ivy_balcny_kb3
    g_Object[159] = CreateDynamicObject(639, 955.1250, -3206.6979, 19.6480, 2700.0000, -540.0000, -0.1000); //veg_ivy_balcny_kb3
    g_Object[160] = CreateDynamicObject(639, 954.1599, -3192.3850, 20.3180, 2700.0000, -540.0000, -0.1000); //veg_ivy_balcny_kb3
    g_Object[161] = CreateDynamicObject(639, 953.7520, -3189.9750, 11.6478, 2880.0000, -540.0000, 1.2999); //veg_ivy_balcny_kb3
    g_Object[162] = CreateDynamicObject(624, 951.7238, -3275.1110, 11.6978, 0.0000, 0.0000, 0.0000); //veg_palwee02
    g_Object[163] = CreateDynamicObject(624, 917.6978, -3260.0810, 8.3479, 3.0000, 0.0000, 180.0000); //veg_palwee02
    g_Object[164] = CreateDynamicObject(624, 1026.4570, -3112.0180, 5.6669, 0.0000, 0.0000, 0.0000); //veg_palwee02
    g_Object[165] = CreateDynamicObject(624, 1026.4570, -3104.1169, 1.9370, 2.0000, 3.0000, 180.0000); //veg_palwee02
    g_Object[166] = CreateDynamicObject(624, 1013.2269, -3112.0180, 1.7970, 0.0000, -3.0000, -90.0000); //veg_palwee02
    g_Object[167] = CreateDynamicObject(624, 1030.4128, -3171.7270, 8.9778, 0.0000, 0.0000, 0.0000); //veg_palwee02
    g_Object[168] = CreateDynamicObject(624, 1032.0998, -3222.7009, 7.9930, 0.0000, 0.0000, 90.0000); //veg_palwee02
    g_Object[169] = CreateDynamicObject(624, 1023.0999, -3236.3911, 7.9930, 5.0000, 3.0000, 180.0000); //veg_palwee02
    g_Object[170] = CreateDynamicObject(624, 1018.0819, -3225.6298, 6.0419, 5.0000, 3.0000, 360.0000); //veg_palwee02
    g_Object[171] = CreateDynamicObject(624, 991.1149, -3273.8989, 6.4239, 5.0000, -7.0000, 315.0000); //veg_palwee02
    g_Object[172] = CreateDynamicObject(624, 984.1458, -3223.5729, 9.5979, 0.0000, 0.0000, 0.0000); //veg_palwee02
    g_Object[173] = CreateDynamicObject(624, 996.2260, -3215.6721, 8.3680, 3.0000, 3.0000, 180.0000); //veg_palwee02
    g_Object[174] = CreateDynamicObject(624, 986.3419, -3247.4260, 8.1478, 3.0000, 3.0000, 270.0000); //veg_palwee02
    g_Object[175] = CreateDynamicObject(759, 907.4080, -3211.9289, 2.8849, 0.0000, 0.0000, 0.0000); //sm_bush_large_1
    g_Object[176] = CreateDynamicObject(11496, 882.5430, -3250.0048, 3.0320, 0.0000, 0.0000, 70.0000); //des_wjetty
    SetDynamicObjectMaterial(g_Object[176], 0, 6284, "bev_law2", "beachwalkway", 0x00000000);
    g_Object[177] = CreateDynamicObject(11496, 867.5170, -3244.5390, 3.0320, 0.0000, 0.0000, 70.0000); //des_wjetty
    SetDynamicObjectMaterial(g_Object[177], 0, 6284, "bev_law2", "beachwalkway", 0x00000000);
    g_Object[178] = CreateDynamicObject(11496, 882.6400, -3261.1999, 3.0320, 0.0000, 0.0000, -20.0000); //des_wjetty
    SetDynamicObjectMaterial(g_Object[178], 0, 6284, "bev_law2", "beachwalkway", 0x00000000);
    g_Object[179] = CreateDynamicObject(3576, 884.6040, -3261.8669, 4.7220, 0.0000, 0.0000, -20.8999); //DockCrates2_LA
    SetDynamicObjectMaterial(g_Object[179], 3, 3066, "ammotrx", "ammotrn92crate64", 0x00000000);
    g_Object[180] = CreateDynamicObject(2062, 884.9229, -3259.3439, 3.8090, 0.0000, 0.0000, -127.5998); //CJ_OilDrum2
    g_Object[181] = CreateDynamicObject(2062, 885.7940, -3261.5549, 5.0890, -90.0000, 0.0000, -17.7000); //CJ_OilDrum2
    g_Object[182] = CreateDynamicObject(2062, 880.9630, -3251.1440, 3.8090, 0.0000, 0.0000, 173.8000); //CJ_OilDrum2
    g_Object[183] = CreateDynamicObject(2062, 880.0468, -3250.8750, 3.8090, 0.0000, 0.0000, 145.5000); //CJ_OilDrum2
    g_Object[184] = CreateDynamicObject(2062, 880.5590, -3250.0458, 3.5889, 90.0000, 0.0000, -156.3999); //CJ_OilDrum2
    g_Object[185] = CreateDynamicObject(8493, 850.0570, -3229.3168, 10.9659, 0.0000, -20.7000, -290.0000); //pirtshp01_lvs
    SetDynamicObjectMaterial(g_Object[185], 0, 17036, "cuntwbt", "des_woodslats2", 0x00000000);
    SetDynamicObjectMaterial(g_Object[185], 3, 10350, "oc_flats_gnd_sfs", "ws_woodfence1", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[185], 4, 16395, "desn2_minestuff", "cw2_mountboards1", 0x00000000);
    SetDynamicObjectMaterial(g_Object[185], 5, 3374, "ce_farmxref", "sw_barnwood5", 0x00000000);
    g_Object[186] = CreateDynamicObject(9159, 850.0570, -3229.3168, 10.9659, 0.0000, -20.7000, -290.0000); //pirtshp02_lvs
    SetDynamicObjectMaterial(g_Object[186], 1, 2558, "hospital", "CJ_H_CURTAIN1", 0x00000000);
    g_Object[187] = CreateDynamicObject(639, 869.0130, -3238.7919, 5.3000, -22.2999, 0.0000, 158.1999); //veg_ivy_balcny_kb3
    g_Object[188] = CreateDynamicObject(639, 856.3488, -3235.4108, 18.3519, -22.2999, 0.0000, 154.1999); //veg_ivy_balcny_kb3
    g_Object[189] = CreateDynamicObject(639, 873.1580, -3228.1459, 1.2359, -0.2000, 28.7999, -106.0998); //veg_ivy_balcny_kb3
    g_Object[190] = CreateDynamicObject(3066, 1009.4608, -3193.2009, 11.7378, 0.0000, 0.0000, 0.0000); //ammotrn_obj
    SetDynamicObjectMaterial(g_Object[190], 2, 1736, "cj_ammo", "CJ_CANVAS2", 0xFFFFFFFF);
    g_Object[191] = CreateDynamicObject(3630, 999.1760, -3171.5229, 12.1610, 0.0000, 0.0000, 180.0000); //crdboxes2_LAs
    g_Object[192] = CreateDynamicObject(1482, 951.5369, -3201.8620, 17.5769, 0.0000, 90.0000, 180.0000); //DYN_GARRAGE1
    SetDynamicObjectMaterial(g_Object[192], 0, 13295, "ce_terminal", "Gen_Metal", 0x00000000);
    g_Object[193] = CreateDynamicObject(1482, 951.5369, -3195.1621, 17.5769, 0.0000, 90.0000, 180.0000); //DYN_GARRAGE1
    SetDynamicObjectMaterial(g_Object[193], 0, 13295, "ce_terminal", "Gen_Metal", 0x00000000);
    g_Object[194] = CreateDynamicObject(13367, 988.0260, -3216.1650, 19.9790, -15.6000, -5.5000, 0.0000); //sw_watertower01
    SetDynamicObjectMaterial(g_Object[194], 0, 1220, "boxes", "crate128", 0x00000000);
    SetDynamicObjectMaterial(g_Object[194], 1, 16395, "desn2_minestuff", "cw2_mountboards1", 0x00000000);
    SetDynamicObjectMaterial(g_Object[194], 2, 3374, "ce_farmxref", "sw_barnwood5", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[194], 3, 17067, "cw2_logcabins", "sw_cabinroof", 0x00000000);
    g_Object[195] = CreateDynamicObject(16500, 957.7020, -3201.8479, 12.3660, -4.4000, -90.0000, -28.6000); //cn2_savgardr1_
    SetDynamicObjectMaterial(g_Object[195], 0, 2988, "kcomp_gx", "kmwood_gate", 0xFFFFFFFF);
    g_Object[196] = CreateDynamicObject(16500, 961.1959, -3203.7529, 12.3660, -4.4000, -90.0000, -28.6000); //cn2_savgardr1_
    SetDynamicObjectMaterial(g_Object[196], 0, 2988, "kcomp_gx", "kmwood_gate", 0xFFFFFFFF);
    g_Object[197] = CreateDynamicObject(16500, 953.8790, -3194.4020, 12.1250, 0.0000, 0.0000, 590.0000); //cn2_savgardr1_
    SetDynamicObjectMaterial(g_Object[197], 0, 2988, "kcomp_gx", "kmwood_gate", 0xFFFFFFFF);
    g_Object[198] = CreateDynamicObject(16500, 953.8790, -3194.4020, 16.1250, 0.0000, 0.0000, 590.0000); //cn2_savgardr1_
    SetDynamicObjectMaterial(g_Object[198], 0, 2988, "kcomp_gx", "kmwood_gate", 0xFFFFFFFF);
    g_Object[199] = CreateDynamicObject(624, 1039.7390, -3160.5590, 39.4319, 0.0000, 0.0000, 0.0000); //veg_palwee02
    g_Object[200] = CreateDynamicObject(624, 1049.7390, -3146.7810, 39.6160, 5.0000, 0.0000, 180.0000); //veg_palwee02
    g_Object[201] = CreateDynamicObject(624, 1054.3790, -3149.5019, 41.9958, 0.0000, 0.0000, -90.0000); //veg_palwee02
    g_Object[202] = CreateDynamicObject(624, 1037.9168, -3258.8898, 42.2350, 0.0000, 0.0000, 0.0000); //veg_palwee02
    g_Object[203] = CreateDynamicObject(624, 1040.2070, -3258.8898, 42.2350, 5.0000, -5.0000, 180.0000); //veg_palwee02
    g_Object[204] = CreateDynamicObject(624, 1050.7928, -3286.3969, 44.8030, 0.0000, -5.3000, 0.0000); //veg_palwee02
    g_Object[205] = CreateDynamicObject(624, 1034.8149, -3306.4829, 40.5250, 0.0000, 0.0000, 180.0000); //veg_palwee02
    g_Object[206] = CreateDynamicObject(624, 1004.2100, -3299.1970, 35.3348, 0.0000, 4.0998, 39.0998); //veg_palwee02
    g_Object[207] = CreateDynamicObject(624, 996.4229, -3305.5249, 33.9140, 0.0000, 4.0998, 219.1000); //veg_palwee02
    g_Object[208] = CreateDynamicObject(624, 915.6530, -3291.7919, 35.2238, -5.0000, 0.0000, -90.0000); //veg_palwee02
    g_Object[209] = CreateDynamicObject(624, 915.6530, -3303.4729, 35.2238, 0.0000, 0.0000, 0.0000); //veg_palwee02
    g_Object[210] = CreateDynamicObject(624, 895.6928, -3292.0300, 32.4888, -5.0000, 10.0000, 0.0000); //veg_palwee02
    g_Object[211] = CreateDynamicObject(6959, 991.9849, -3149.7080, 9.6040, -180.0000, 180.0000, -90.0000); //vegasNbball1
    g_Object[212] = CreateDynamicObject(829, 934.1630, -3214.7770, 10.5830, -11.6000, -14.8000, 0.0000); //DEAD_TREE_3
    g_Object[213] = CreateDynamicObject(830, 910.7999, -3160.5659, 3.6150, 0.0000, 0.0000, 0.0000); //DEAD_TREE_2
    g_Object[214] = CreateDynamicObject(839, 933.7130, -3141.5290, 4.6318, 0.0000, 0.0000, -82.0998); //DEAD_TREE_11
    g_Object[215] = CreateDynamicObject(840, 930.0999, -3247.7199, 12.0740, -6.5000, -9.6998, 0.0000); //DEAD_TREE_12
    g_Object[216] = CreateDynamicObject(848, 904.9550, -3250.6101, 4.8020, 0.0000, 0.0000, -100.4000); //DEAD_TREE_20
    g_Object[217] = CreateDynamicObject(887, 913.2750, -3220.5639, 3.0950, 0.0000, 0.0000, 125.0000); //Elmtreegrn2_PO
    g_Object[218] = CreateDynamicObject(887, 935.7329, -3219.6210, 10.5240, 0.0000, 0.0000, 0.0000); //Elmtreegrn2_PO
    g_Object[219] = CreateDynamicObject(891, 971.1328, -3114.5329, 3.1719, 0.0000, 0.0000, 0.0000); //Elmdead_PO
    g_Object[220] = CreateDynamicObject(891, 1032.0080, -3182.0720, 8.6858, 0.0000, 0.0000, 180.0000); //Elmdead_PO
    g_Object[221] = CreateDynamicObject(647, 926.5219, -3224.8869, 9.3858, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[222] = CreateDynamicObject(647, 944.4699, -3241.6430, 12.3079, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[223] = CreateDynamicObject(647, 929.6729, -3259.5109, 12.1388, 0.0000, 0.0000, 180.0000); //new_bushsm
    g_Object[224] = CreateDynamicObject(647, 937.3599, -3274.8310, 12.8009, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[225] = CreateDynamicObject(647, 939.7000, -3274.8310, 13.8108, 0.0000, 0.0000, 180.0000); //new_bushsm
    g_Object[226] = CreateDynamicObject(647, 951.2999, -3268.6000, 13.1408, 0.0000, 0.0000, 93.9000); //new_bushsm
    g_Object[227] = CreateDynamicObject(647, 913.5390, -3239.7729, 5.6230, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[228] = CreateDynamicObject(647, 916.0490, -3239.7729, 7.2430, 0.0000, 0.0000, 90.0000); //new_bushsm
    g_Object[229] = CreateDynamicObject(647, 912.1170, -3228.8068, 3.3570, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[230] = CreateDynamicObject(647, 922.8308, -3206.8081, 5.3680, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[231] = CreateDynamicObject(647, 924.3060, -3214.5791, 7.3109, 0.0000, 0.0000, 180.0000); //new_bushsm
    g_Object[232] = CreateDynamicObject(647, 947.6870, -3190.1660, 8.7600, 0.0000, 0.0000, -89.4000); //new_bushsm
    g_Object[233] = CreateDynamicObject(647, 928.3579, -3182.9709, 4.2579, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[234] = CreateDynamicObject(647, 912.6229, -3186.3020, 3.3800, 0.0000, 0.0000, -133.1000); //new_bushsm
    g_Object[235] = CreateDynamicObject(647, 914.6309, -3188.1809, 4.1399, 0.0000, 0.0000, 104.4000); //new_bushsm
    g_Object[236] = CreateDynamicObject(647, 913.1190, -3202.7810, 3.4340, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[237] = CreateDynamicObject(647, 933.8989, -3188.8349, 5.8189, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[238] = CreateDynamicObject(647, 918.0700, -3156.5849, 3.5209, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[239] = CreateDynamicObject(647, 918.0700, -3153.6560, 4.2399, 0.0000, 0.0000, 180.0000); //new_bushsm
    g_Object[240] = CreateDynamicObject(647, 896.4818, -3143.7770, 3.4040, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[241] = CreateDynamicObject(647, 897.7880, -3157.1010, 3.8210, 0.0000, 0.0000, 180.0000); //new_bushsm
    g_Object[242] = CreateDynamicObject(647, 919.2589, -3134.4050, 3.5680, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[243] = CreateDynamicObject(647, 919.2589, -3138.2958, 3.5680, 0.0000, 0.0000, 225.0000); //new_bushsm
    g_Object[244] = CreateDynamicObject(647, 921.8779, -3136.5949, 2.8480, 0.0000, 0.0000, 255.0000); //new_bushsm
    g_Object[245] = CreateDynamicObject(647, 942.1030, -3132.3630, 3.3598, 0.0000, 0.0000, -67.1998); //new_bushsm
    g_Object[246] = CreateDynamicObject(647, 932.0930, -3121.3010, 3.2550, 0.0000, 0.0000, -22.3999); //new_bushsm
    g_Object[247] = CreateDynamicObject(647, 955.7260, -3114.2141, 3.7560, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[248] = CreateDynamicObject(647, 989.4860, -3117.5000, 4.5879, 0.0000, 0.0000, 180.0000); //new_bushsm
    g_Object[249] = CreateDynamicObject(647, 1021.0808, -3106.8820, 3.5130, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[250] = CreateDynamicObject(647, 1021.0808, -3110.3520, 5.1830, 0.0000, 0.0000, 180.0000); //new_bushsm
    g_Object[251] = CreateDynamicObject(647, 1038.3470, -3110.9020, 9.9840, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[252] = CreateDynamicObject(647, 1027.6978, -3129.4418, 11.6718, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[253] = CreateDynamicObject(647, 1027.9919, -3160.8601, 12.0200, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[254] = CreateDynamicObject(647, 1034.0400, -3185.1870, 9.4498, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[255] = CreateDynamicObject(647, 1034.7209, -3194.5048, 9.3870, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[256] = CreateDynamicObject(647, 1030.9848, -3209.2709, 9.6198, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[257] = CreateDynamicObject(647, 1027.7950, -3209.2709, 10.2898, 0.0000, 0.0000, 180.0000); //new_bushsm
    g_Object[258] = CreateDynamicObject(647, 1027.0920, -3224.4560, 11.1858, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[259] = CreateDynamicObject(647, 1024.3669, -3235.0471, 11.1630, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[260] = CreateDynamicObject(647, 1027.7910, -3248.1350, 12.5710, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[261] = CreateDynamicObject(647, 1027.5699, -3252.5100, 13.7889, 0.0000, 0.0000, 180.0000); //new_bushsm
    g_Object[262] = CreateDynamicObject(647, 1012.5499, -3258.1269, 13.1598, 0.0000, 0.0000, -165.6000); //new_bushsm
    g_Object[263] = CreateDynamicObject(647, 994.0520, -3264.0358, 12.8158, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[264] = CreateDynamicObject(647, 997.7650, -3294.9899, 11.2489, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[265] = CreateDynamicObject(647, 1001.9829, -3288.4899, 11.6180, 0.0000, 0.0000, 90.0000); //new_bushsm
    g_Object[266] = CreateDynamicObject(647, 983.8499, -3287.2309, 10.9750, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[267] = CreateDynamicObject(647, 972.5598, -3279.2890, 11.8158, 0.0000, 0.0000, -90.0000); //new_bushsm
    g_Object[268] = CreateDynamicObject(647, 949.8048, -3292.4479, 12.7629, 0.0000, 0.0000, 180.0000); //new_bushsm
    g_Object[269] = CreateDynamicObject(647, 922.0390, -3276.6350, 12.1440, 0.0000, 0.0000, 180.0000); //new_bushsm
    g_Object[270] = CreateDynamicObject(647, 918.9790, -3276.6350, 12.6338, 0.0000, 0.0000, 270.0000); //new_bushsm
    g_Object[271] = CreateDynamicObject(647, 903.3220, -3259.1699, 3.4470, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[272] = CreateDynamicObject(647, 910.3308, -3257.5859, 5.8829, 0.0000, 0.0000, 180.0000); //new_bushsm
    g_Object[273] = CreateDynamicObject(647, 899.5889, -3271.7719, 4.3350, 0.0000, 0.0000, -90.0000); //new_bushsm
    g_Object[274] = CreateDynamicObject(647, 907.2030, -3208.8769, 3.4010, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[275] = CreateDynamicObject(647, 906.1840, -3147.0249, 3.5169, 0.0000, 0.0000, 90.0000); //new_bushsm
    g_Object[276] = CreateDynamicObject(647, 946.4910, -3165.9299, 6.6609, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[277] = CreateDynamicObject(647, 948.2009, -3161.7680, 7.6050, 0.0000, 0.0000, 180.0000); //new_bushsm
    g_Object[278] = CreateDynamicObject(647, 954.7139, -3205.0720, 12.7278, 0.0000, 0.0000, -90.0000); //new_bushsm
    g_Object[279] = CreateDynamicObject(647, 954.7139, -3208.0510, 12.1379, 0.0000, 0.0000, -172.3999); //new_bushsm
    g_Object[280] = CreateDynamicObject(647, 971.3200, -3216.7661, 12.6230, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[281] = CreateDynamicObject(647, 980.8629, -3206.2529, 10.9919, 0.0000, 0.0000, 180.0000); //new_bushsm
    g_Object[282] = CreateDynamicObject(647, 1013.1970, -3206.3339, 9.7068, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[283] = CreateDynamicObject(647, 1015.0678, -3200.2180, 9.6309, 0.0000, 0.0000, 180.0000); //new_bushsm
    g_Object[284] = CreateDynamicObject(647, 1002.9899, -3217.5520, 10.0649, 0.0000, 0.0000, -90.0000); //new_bushsm
    g_Object[285] = CreateDynamicObject(647, 1001.0100, -3215.5720, 10.0649, 0.0000, 0.0000, -45.0000); //new_bushsm
    g_Object[286] = CreateDynamicObject(647, 1002.2968, -3212.1210, 9.4849, 0.0000, 0.0000, 135.0000); //new_bushsm
    g_Object[287] = CreateDynamicObject(647, 996.9639, -3203.1140, 9.5068, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[288] = CreateDynamicObject(647, 984.6309, -3222.9318, 10.6140, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[289] = CreateDynamicObject(647, 991.6519, -3237.2829, 10.2679, 0.0000, 0.0000, -90.0000); //new_bushsm
    g_Object[290] = CreateDynamicObject(647, 997.6530, -3236.5549, 10.7810, 0.0000, 0.0000, 90.0000); //new_bushsm
    g_Object[291] = CreateDynamicObject(647, 982.8779, -3247.5800, 12.3198, 0.0000, 0.0000, -90.0000); //new_bushsm
    g_Object[292] = CreateDynamicObject(647, 986.1480, -3247.5800, 11.4098, 0.0000, 0.0000, 90.0000); //new_bushsm
    g_Object[293] = CreateDynamicObject(647, 971.1469, -3263.2290, 12.2188, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[294] = CreateDynamicObject(647, 973.8150, -3234.3168, 13.4270, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[295] = CreateDynamicObject(647, 957.4439, -3170.0649, 9.8888, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[296] = CreateDynamicObject(647, 958.8438, -3162.8029, 9.8888, 0.0000, 0.0000, 180.0000); //new_bushsm
    g_Object[297] = CreateDynamicObject(647, 955.9818, -3149.9470, 8.7889, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[298] = CreateDynamicObject(647, 964.5808, -3137.0559, 7.1500, 0.0000, 0.0000, 0.0000); //new_bushsm
    g_Object[299] = CreateDynamicObject(761, 898.2760, -3203.7270, 2.1080, 0.0000, -7.1999, 0.0000); //sm_drybrush_sm1
    g_Object[300] = CreateDynamicObject(761, 903.1359, -3185.5249, 2.5580, 0.0000, 0.0000, -90.0000); //sm_drybrush_sm1
    g_Object[301] = CreateDynamicObject(761, 903.1359, -3183.5358, 2.8780, 0.0000, 0.0000, 90.0000); //sm_drybrush_sm1
    g_Object[302] = CreateDynamicObject(761, 891.1320, -3164.2949, 0.9860, 0.0000, 0.0000, -90.0000); //sm_drybrush_sm1
    g_Object[303] = CreateDynamicObject(761, 901.5349, -3218.2670, 2.8919, 0.0000, 0.0000, 0.0000); //sm_drybrush_sm1
    g_Object[304] = CreateDynamicObject(805, 917.0070, -3124.6909, 3.6540, 0.0000, 0.0000, 0.0000); //genVEG_bush11
    g_Object[305] = CreateDynamicObject(800, 937.3140, -3246.0039, 11.8950, 0.0000, 0.0000, 0.0000); //genVEG_bush07
    g_Object[306] = CreateDynamicObject(800, 901.1790, -3149.0839, 3.4549, 0.0000, 0.0000, 0.0000); //genVEG_bush07
    g_Object[307] = CreateDynamicObject(800, 903.8729, -3127.9440, 4.0700, 0.0000, 0.0000, 180.0000); //genVEG_bush07
    g_Object[308] = CreateDynamicObject(800, 943.6220, -3126.2019, 4.7420, 0.0000, 0.0000, 270.0000); //genVEG_bush07
    g_Object[309] = CreateDynamicObject(800, 965.3939, -3120.6250, 3.8529, 0.0000, 0.0000, 0.0000); //genVEG_bush07
    g_Object[310] = CreateDynamicObject(800, 933.4119, -3147.8400, 3.2999, 0.0000, 0.0000, -31.7999); //genVEG_bush07
    g_Object[311] = CreateDynamicObject(800, 932.6510, -3220.1750, 9.8149, 0.0000, 0.0000, -131.5000); //genVEG_bush07
    g_Object[312] = CreateDynamicObject(1431, 886.4868, -3259.2629, 3.7490, 0.0000, 0.0000, 0.0000); //DYN_BOX_PILE
    g_Object[313] = CreateDynamicObject(8981, 855.9149, -3231.9650, 10.7819, 0.0000, -20.7000, -290.0000); //prtwires_lvs
    g_Object[314] = CreateDynamicObject(1219, 971.6610, -3161.0480, 10.9568, 0.0000, 0.0000, 45.0000); //palette
    g_Object[315] = CreateDynamicObject(1219, 1001.4370, -3145.5659, 10.9280, 0.0000, 0.0000, -80.0000); //palette
    g_Object[316] = CreateDynamicObject(1458, 979.1400, -3195.4890, 10.5120, 0.0000, 90.0000, 100.1998); //DYN_CART
    g_Object[317] = CreateDynamicObject(1453, 978.4650, -3194.3210, 10.0050, 90.0000, 0.0000, -121.9000); //DYN_H_BALE1
    g_Object[318] = CreateDynamicObject(1453, 978.0720, -3195.0100, 10.0050, 90.0000, 0.0000, -52.4000); //DYN_H_BALE1
    g_Object[319] = CreateDynamicObject(1453, 977.9569, -3194.6220, 10.0938, 66.9000, 0.0000, 85.4000); //DYN_H_BALE1
    g_Object[320] = CreateDynamicObject(1453, 977.0728, -3193.4550, 9.7950, 90.0000, 0.0000, -31.8999); //DYN_H_BALE1
    g_Object[321] = CreateDynamicObject(806, 976.8989, -3194.6110, 9.2200, 0.0000, 0.0000, 0.0000); //genVEG_tallgrass
    g_Object[322] = CreateDynamicObject(806, 977.9340, -3193.0739, 8.4799, 0.0000, 0.0000, 158.6000); //genVEG_tallgrass
    g_Object[323] = CreateDynamicObject(3525, 965.2954, -3292.8056, 17.3012, -97.5998, 0.0000, -7.5998); //exbrtorch01
    g_Object[324] = CreateDynamicObject(3525, 969.3275, -3293.2495, 17.0785, -94.0998, 4.0999, -0.9998); //exbrtorch01
    g_Object[325] = CreateDynamicObject(3279, 896.2595, -3263.3320, 3.2442, 0.0000, 0.0000, 72.3999); //a51_spottower
    SetDynamicObjectMaterial(g_Object[325], 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0xFFFFFFFF);
    g_Object[326] = CreateDynamicObject(8483, 897.3491, -3131.3493, 8.1546, -0.5999, -2.2999, -49.2000); //pirateland02_lvS
    SetDynamicObjectMaterial(g_Object[326], 0, 10166, "p69_rocks", "sfe_rock2", 0xFFFFFFFF);
    g_Object[327] = CreateDynamicObject(18848, 896.4061, -3263.5158, 14.8121, 0.0000, 0.0000, 50.0000); //SamSiteNonDynamic
    g_Object[328] = CreateDynamicObject(18694, 967.1279, -3296.9641, 10.9287, 0.0000, 0.0000, 0.0000); //flamethrower
    g_Object[329] = CreateDynamicObject(8483, 965.0498, -3299.2895, 15.8241, 0.1000, -1.8999, 79.3996); //pirateland02_lvS
    SetDynamicObjectMaterial(g_Object[329], 0, 10166, "p69_rocks", "sfe_rock2", 0xFFFFFFFF);
    g_Object[330] = CreateDynamicObject(19355, 950.1386, -3199.8596, 17.1912, 0.0000, 0.0000, 0.0000); //wall003
    SetDynamicObjectMaterialText(g_Object[330], 0, "BEOO", 90, "Arial", 50, 1, 0xFF840410, 0x0, 1);
    g_Object[331] = CreateDynamicObject(19355, 950.1386, -3198.8283, 17.1912, 0.0000, 0.0000, 0.0000); //wall003
    SetDynamicObjectMaterialText(g_Object[331], 0, "X", 90, "Arial", 100, 1, 0xFF840410, 0x0, 1);
    g_Object[332] = CreateDynamicObject(3524, 950.8233, -3190.9123, 14.1274, 36.4000, -7.1999, -77.8999); //skullpillar01_lvs
    g_Object[333] = CreateDynamicObject(3524, 950.8494, -3206.1018, 14.6696, 36.4000, -7.1999, -77.8999); //skullpillar01_lvs
    g_Object[334] = CreateDynamicObject(19355, 950.1386, -3197.5473, 17.1912, 0.0000, 0.0000, 0.0000); //wall003
    SetDynamicObjectMaterialText(g_Object[334], 0, "MASEW", 90, "Arial", 50, 1, 0xFF840410, 0x0, 1);
}