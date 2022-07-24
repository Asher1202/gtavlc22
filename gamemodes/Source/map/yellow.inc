#include <YSI_Coding\y_hooks>

hook OnGameModeInit() {
    print("[map] yellow.inc loaded.");

    new g_Object[304];
    g_Object[0] = CreateDynamicObject(19650, 1287.0416, -1678.5974, 56.0778, 270.0000, 90.0000, 180.0000, -1, -1, -1, 300.00, 300.00); //TubeFlat25x25m1
    SetDynamicObjectMaterialText(g_Object[0], 0, "MUSIC LIFE", 90, "Arial", 30, 1, 0xFF000000, 0x0, 0);
    g_Object[1] = CreateDynamicObject(19538, 1226.6860, -1671.3597, 12.5530, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //Plane62_5x125Conc1
    g_Object[2] = CreateDynamicObject(8500, 1280.5874, -1659.3277, 21.3278, 0.0000, 0.0000, 116.0000, -1, -1, -1, 300.00, 300.00); //excalibur01_lvS
    g_Object[3] = CreateDynamicObject(6873, 1247.0406, -1689.3160, -49.7745, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //vgn_corpbuild3
    SetDynamicObjectMaterialText(g_Object[3], 10, "RXN", 90, "Arial", 95, 1, 0xFF000000, 0x0, 1);
    SetDynamicObjectMaterial(g_Object[3], 13, 3979, "civic01_lan", "sl_laglasswall2", 0xFFFFFFFF);
    g_Object[4] = CreateDynamicObject(10379, 1250.5256, -1611.0050, 21.1012, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //cityhall2_SFS
    g_Object[5] = CreateDynamicObject(10379, 1224.1153, -1611.0050, 21.1012, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //cityhall2_SFS
    g_Object[6] = CreateDynamicObject(19538, 1226.6860, -1609.4907, 12.5530, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //Plane62_5x125Conc1
    g_Object[7] = CreateDynamicObject(19545, 1167.8537, -1630.3382, 12.5683, 0.0000, 2.7000, 0.0000, -1, -1, -1, 300.00, 300.00); //Plane62_5x15Conc1
    g_Object[8] = CreateDynamicObject(19650, 1207.2816, -1689.8277, 78.7778, 270.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //TubeFlat25x25m1
    SetDynamicObjectMaterialText(g_Object[8], 0, "MUSIC LIFE", 90, "Arial", 30, 1, 0xFF000000, 0x0, 0);
    g_Object[9] = CreateDynamicObject(19380, 1245.8474, -1671.0649, 73.1371, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall028
    SetDynamicObjectMaterial(g_Object[9], 0, 14668, "711c", "gun_ceiling1128", 0xFFFFFFFF);
    g_Object[10] = CreateDynamicObject(19380, 1266.6861, -1671.0909, 69.7674, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall028
    SetDynamicObjectMaterial(g_Object[10], 0, 14808, "lee_strip2", "Strip_Ceiling", 0xFFFFFFFF);
    g_Object[11] = CreateDynamicObject(19380, 1256.2270, -1677.9914, 69.7674, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall028
    SetDynamicObjectMaterial(g_Object[11], 0, 14808, "lee_strip2", "Strip_Ceiling", 0xFFFFFFFF);
    g_Object[12] = CreateDynamicObject(19380, 1266.6861, -1687.5393, 69.7674, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall028
    SetDynamicObjectMaterial(g_Object[12], 0, 14832, "lee_stripclub", "Strip_ceiling", 0xFFFFFFFF);
    g_Object[13] = CreateDynamicObject(19380, 1256.2270, -1687.5196, 69.7674, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall028
    SetDynamicObjectMaterial(g_Object[13], 0, 14808, "lee_strip2", "Strip_Ceiling", 0xFFFFFFFF);
    g_Object[14] = CreateDynamicObject(19380, 1266.6861, -1697.1394, 69.7674, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall028
    SetDynamicObjectMaterial(g_Object[14], 0, 14832, "lee_stripclub", "Strip_ceiling", 0xFFFFFFFF);
    g_Object[15] = CreateDynamicObject(19380, 1256.2270, -1671.0620, 69.7674, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall028
    SetDynamicObjectMaterial(g_Object[15], 0, 14832, "lee_stripclub", "Strip_ceiling", 0xFFFFFFFF);
    g_Object[16] = CreateDynamicObject(19380, 1266.6861, -1677.9802, 69.7674, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall028
    SetDynamicObjectMaterial(g_Object[16], 0, 14832, "lee_stripclub", "Strip_ceiling", 0xFFFFFFFF);
    g_Object[17] = CreateDynamicObject(19380, 1245.7977, -1679.5704, 69.7674, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall028
    SetDynamicObjectMaterial(g_Object[17], 0, 14808, "lee_strip2", "Strip_Ceiling", 0xFFFFFFFF);
    g_Object[18] = CreateDynamicObject(19380, 1235.4681, -1687.5030, 69.7674, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall028
    SetDynamicObjectMaterial(g_Object[18], 0, 14808, "lee_strip2", "Strip_Ceiling", 0xFFFFFFFF);
    g_Object[19] = CreateDynamicObject(19380, 1235.4681, -1697.1025, 69.7674, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall028
    SetDynamicObjectMaterial(g_Object[19], 0, 14808, "lee_strip2", "Strip_Ceiling", 0xFFFFFFFF);
    g_Object[20] = CreateDynamicObject(19380, 1245.8072, -1697.1025, 66.8871, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall028
    SetDynamicObjectMaterial(g_Object[20], 0, 14808, "lee_strip2", "Strip_Ceiling", 0xFFFFFFFF);
    g_Object[21] = CreateDynamicObject(19380, 1256.2270, -1697.1394, 69.7674, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall028
    SetDynamicObjectMaterial(g_Object[21], 0, 14832, "lee_stripclub", "Strip_ceiling", 0xFFFFFFFF);
    g_Object[22] = CreateDynamicObject(19380, 1245.7977, -1687.5002, 69.7674, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall028
    SetDynamicObjectMaterial(g_Object[22], 0, 14832, "lee_stripclub", "Strip_ceiling", 0xFFFFFFFF);
    g_Object[23] = CreateDynamicObject(19380, 1235.4681, -1677.9338, 69.7674, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall028
    SetDynamicObjectMaterial(g_Object[23], 0, 14808, "lee_strip2", "Strip_Ceiling", 0xFFFFFFFF);
    g_Object[24] = CreateDynamicObject(19380, 1235.4681, -1671.0649, 69.7674, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall028
    SetDynamicObjectMaterial(g_Object[24], 0, 14808, "lee_strip2", "Strip_Ceiling", 0xFFFFFFFF);
    g_Object[25] = CreateDynamicObject(18850, 1212.9532, -1637.5069, 0.3258, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //HeliPad1
    g_Object[26] = CreateDynamicObject(1569, 1251.1839, -1666.3680, 69.8159, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //ADAM_V_DOOR
    g_Object[27] = CreateDynamicObject(19943, 1250.8022, -1667.2972, 69.8125, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[27], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[27], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[28] = CreateDynamicObject(1569, 1254.1837, -1666.3680, 69.8159, 0.0000, 0.0000, 180.0000, -1, -1, -1, 300.00, 300.00); //ADAM_V_DOOR
    g_Object[29] = CreateDynamicObject(19943, 1254.4729, -1667.2972, 66.2229, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[29], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[29], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[30] = CreateDynamicObject(19943, 1250.8022, -1667.2972, 66.2229, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[30], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[30], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[31] = CreateDynamicObject(19943, 1254.4729, -1667.2972, 69.7629, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[31], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[31], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[32] = CreateDynamicObject(19943, 1254.4729, -1668.8077, 69.7629, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[32], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[32], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[33] = CreateDynamicObject(19943, 1254.4729, -1670.2989, 69.7629, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[33], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[33], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[34] = CreateDynamicObject(19943, 1254.4729, -1671.8194, 69.7629, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[34], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[34], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[35] = CreateDynamicObject(19943, 1254.4729, -1673.3208, 69.7629, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[35], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[35], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[36] = CreateDynamicObject(19943, 1254.4729, -1668.8072, 66.2229, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[36], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[36], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[37] = CreateDynamicObject(19943, 1254.4729, -1670.2983, 66.2229, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[37], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[37], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[38] = CreateDynamicObject(19943, 1254.4729, -1671.8292, 66.2229, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[38], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[38], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[39] = CreateDynamicObject(19943, 1254.4729, -1673.3397, 66.2229, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[39], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[39], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[40] = CreateDynamicObject(19943, 1250.8022, -1668.8072, 69.7729, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[40], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[40], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[41] = CreateDynamicObject(19943, 1250.8022, -1670.3081, 69.7729, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[41], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[41], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[42] = CreateDynamicObject(19943, 1250.8022, -1671.7983, 69.7729, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[42], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[42], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[43] = CreateDynamicObject(19943, 1250.8022, -1673.2995, 69.7729, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[43], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[43], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[44] = CreateDynamicObject(19943, 1250.8022, -1668.8077, 66.2229, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[44], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[44], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[45] = CreateDynamicObject(19943, 1250.8022, -1670.3089, 66.2229, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[45], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[45], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[46] = CreateDynamicObject(19943, 1250.8022, -1671.7995, 66.2229, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[46], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[46], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[47] = CreateDynamicObject(19943, 1250.8022, -1673.3006, 66.2229, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[47], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[47], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[48] = CreateDynamicObject(19446, 1257.4818, -1666.3304, 71.5625, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //wall086
    g_Object[49] = CreateDynamicObject(19446, 1267.0500, -1666.3304, 71.5625, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //wall086
    g_Object[50] = CreateDynamicObject(19446, 1247.8911, -1666.3304, 71.5625, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //wall086
    g_Object[51] = CreateDynamicObject(19325, 1233.5771, -1666.3238, 71.2974, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //lsmall_window01
    g_Object[52] = CreateDynamicObject(19325, 1240.2060, -1666.3238, 71.2974, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //lsmall_window01
    g_Object[53] = CreateDynamicObject(19325, 1230.2961, -1669.6440, 71.2974, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //lsmall_window01
    g_Object[54] = CreateDynamicObject(19325, 1230.2961, -1676.2738, 71.2974, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //lsmall_window01
    g_Object[55] = CreateDynamicObject(19446, 1230.3608, -1687.4914, 71.5625, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall086
    g_Object[56] = CreateDynamicObject(19446, 1230.3608, -1697.0909, 71.5625, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall086
    g_Object[57] = CreateDynamicObject(19446, 1230.3608, -1677.8924, 71.5625, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall086
    g_Object[58] = CreateDynamicObject(19427, 1230.3635, -1672.2646, 71.5622, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall067
    g_Object[59] = CreateDynamicObject(19427, 1230.3635, -1670.6849, 71.5622, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall067
    g_Object[60] = CreateDynamicObject(19427, 1230.3635, -1669.0953, 71.5622, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall067
    g_Object[61] = CreateDynamicObject(19427, 1230.3635, -1667.4958, 71.5622, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall067
    g_Object[62] = CreateDynamicObject(19446, 1267.0843, -1701.7722, 71.5625, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //wall086
    g_Object[63] = CreateDynamicObject(19446, 1257.5251, -1701.7722, 71.5625, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //wall086
    g_Object[64] = CreateDynamicObject(19446, 1248.0157, -1701.7722, 71.5625, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //wall086
    g_Object[65] = CreateDynamicObject(19446, 1238.3863, -1701.7722, 71.5625, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //wall086
    g_Object[66] = CreateDynamicObject(19325, 1233.5771, -1701.6955, 71.2974, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //lsmall_window01
    g_Object[67] = CreateDynamicObject(19446, 1271.7854, -1696.9018, 71.5625, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall086
    g_Object[68] = CreateDynamicObject(19446, 1271.7854, -1687.2823, 71.5625, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall086
    g_Object[69] = CreateDynamicObject(19446, 1271.7854, -1677.6623, 71.5625, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall086
    g_Object[70] = CreateDynamicObject(19427, 1271.7834, -1672.0445, 71.5622, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall067
    g_Object[71] = CreateDynamicObject(19427, 1271.7834, -1670.4552, 71.5622, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall067
    g_Object[72] = CreateDynamicObject(19427, 1271.7834, -1668.8548, 71.5622, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall067
    g_Object[73] = CreateDynamicObject(19427, 1271.7834, -1667.2552, 71.5622, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall067
    g_Object[74] = CreateDynamicObject(19786, 1236.5329, -1677.8409, 71.7601, 0.0000, 0.0000, 180.0000, -1, -1, -1, 300.00, 300.00); //LCDTVBig1
    SetDynamicObjectMaterialText(g_Object[74], 1, "RXN", 90, "Arial", 100, 1, 0xFFD78E10, 0xFF000000, 1);
    g_Object[75] = CreateDynamicObject(19446, 1244.4482, -1677.8924, 71.5625, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //wall086
    g_Object[76] = CreateDynamicObject(19446, 1250.0985, -1671.2502, 71.5625, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall086
    g_Object[77] = CreateDynamicObject(19380, 1235.4681, -1671.0649, 73.1371, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall028
    SetDynamicObjectMaterial(g_Object[77], 0, 14668, "711c", "gun_ceiling1128", 0xFFFFFFFF);
    g_Object[78] = CreateDynamicObject(19380, 1245.7977, -1671.0620, 69.7674, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall028
    SetDynamicObjectMaterial(g_Object[78], 0, 14808, "lee_strip2", "Strip_Ceiling", 0xFFFFFFFF);
    g_Object[79] = CreateDynamicObject(19380, 1256.2867, -1671.0649, 73.1371, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall028
    SetDynamicObjectMaterial(g_Object[79], 0, 14668, "711c", "gun_ceiling1128", 0xFFFFFFFF);
    g_Object[80] = CreateDynamicObject(19380, 1266.7065, -1671.0649, 73.1371, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall028
    SetDynamicObjectMaterial(g_Object[80], 0, 14668, "711c", "gun_ceiling1128", 0xFFFFFFFF);
    g_Object[81] = CreateDynamicObject(19380, 1266.7065, -1680.5539, 73.1371, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall028
    SetDynamicObjectMaterial(g_Object[81], 0, 14668, "711c", "gun_ceiling1128", 0xFFFFFFFF);
    g_Object[82] = CreateDynamicObject(19380, 1256.2768, -1680.5539, 73.1371, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall028
    SetDynamicObjectMaterial(g_Object[82], 0, 14668, "711c", "gun_ceiling1128", 0xFFFFFFFF);
    g_Object[83] = CreateDynamicObject(19380, 1245.8468, -1680.5539, 73.1371, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall028
    SetDynamicObjectMaterial(g_Object[83], 0, 14668, "711c", "gun_ceiling1128", 0xFFFFFFFF);
    g_Object[84] = CreateDynamicObject(19380, 1235.4969, -1680.5539, 73.1371, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall028
    SetDynamicObjectMaterial(g_Object[84], 0, 14668, "711c", "gun_ceiling1128", 0xFFFFFFFF);
    g_Object[85] = CreateDynamicObject(19380, 1235.4969, -1690.0533, 73.1371, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall028
    SetDynamicObjectMaterial(g_Object[85], 0, 14668, "711c", "gun_ceiling1128", 0xFFFFFFFF);
    g_Object[86] = CreateDynamicObject(19380, 1235.4969, -1697.0527, 73.1371, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall028
    SetDynamicObjectMaterial(g_Object[86], 0, 14668, "711c", "gun_ceiling1128", 0xFFFFFFFF);
    g_Object[87] = CreateDynamicObject(19380, 1245.8270, -1690.0533, 73.1371, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall028
    SetDynamicObjectMaterial(g_Object[87], 0, 14668, "711c", "gun_ceiling1128", 0xFFFFFFFF);
    g_Object[88] = CreateDynamicObject(19380, 1256.3065, -1690.0533, 73.1371, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall028
    SetDynamicObjectMaterial(g_Object[88], 0, 14668, "711c", "gun_ceiling1128", 0xFFFFFFFF);
    g_Object[89] = CreateDynamicObject(19380, 1266.6965, -1690.0533, 73.1371, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall028
    SetDynamicObjectMaterial(g_Object[89], 0, 14668, "711c", "gun_ceiling1128", 0xFFFFFFFF);
    g_Object[90] = CreateDynamicObject(19380, 1245.7468, -1697.0527, 73.1371, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall028
    SetDynamicObjectMaterial(g_Object[90], 0, 14668, "711c", "gun_ceiling1128", 0xFFFFFFFF);
    g_Object[91] = CreateDynamicObject(19380, 1256.2060, -1697.0527, 73.1371, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall028
    SetDynamicObjectMaterial(g_Object[91], 0, 14668, "711c", "gun_ceiling1128", 0xFFFFFFFF);
    g_Object[92] = CreateDynamicObject(19380, 1266.5965, -1697.0527, 73.1371, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall028
    SetDynamicObjectMaterial(g_Object[92], 0, 14668, "711c", "gun_ceiling1128", 0xFFFFFFFF);
    g_Object[93] = CreateDynamicObject(1764, 1235.9206, -1670.5954, 69.7481, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //LOW_COUCH_2
    SetDynamicObjectMaterial(g_Object[93], 0, 1746, "cj_sofa", "CJ_FAB4", 0xFFFFFFFF);
    g_Object[94] = CreateDynamicObject(1764, 1233.6510, -1670.5954, 69.7481, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //LOW_COUCH_2
    SetDynamicObjectMaterial(g_Object[94], 0, 1746, "cj_sofa", "CJ_FAB4", 0xFFFFFFFF);
    g_Object[95] = CreateDynamicObject(1764, 1238.1213, -1670.5954, 69.7481, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //LOW_COUCH_2
    SetDynamicObjectMaterial(g_Object[95], 0, 1746, "cj_sofa", "CJ_FAB4", 0xFFFFFFFF);
    g_Object[96] = CreateDynamicObject(1764, 1240.5113, -1671.1258, 69.7481, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //LOW_COUCH_2
    SetDynamicObjectMaterial(g_Object[96], 0, 1746, "cj_sofa", "CJ_FAB4", 0xFFFFFFFF);
    g_Object[97] = CreateDynamicObject(1764, 1240.5113, -1673.4056, 69.7481, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //LOW_COUCH_2
    SetDynamicObjectMaterial(g_Object[97], 0, 1746, "cj_sofa", "CJ_FAB4", 0xFFFFFFFF);
    g_Object[98] = CreateDynamicObject(1764, 1233.3502, -1673.1457, 69.7481, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //LOW_COUCH_2
    SetDynamicObjectMaterial(g_Object[98], 0, 1746, "cj_sofa", "CJ_FAB4", 0xFFFFFFFF);
    g_Object[99] = CreateDynamicObject(1764, 1233.3502, -1675.3957, 69.7481, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //LOW_COUCH_2
    SetDynamicObjectMaterial(g_Object[99], 0, 1746, "cj_sofa", "CJ_FAB4", 0xFFFFFFFF);
    g_Object[100] = CreateDynamicObject(19446, 1235.1206, -1677.8924, 71.5625, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //wall086
    g_Object[101] = CreateDynamicObject(19786, 1234.2425, -1677.8409, 71.7601, 0.0000, 0.0000, 180.0000, -1, -1, -1, 300.00, 300.00); //LCDTVBig1
    SetDynamicObjectMaterialText(g_Object[101], 1, "I Love My House And I Love Everyone Who Has Supp", 90, "Arial", 15, 1, 0xFFD78E10, 0xFF000000, 1);
    g_Object[102] = CreateDynamicObject(19786, 1255.1601, -1688.4217, 72.0295, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //LCDTVBig1
    SetDynamicObjectMaterialText(g_Object[102], 1, "GVLC.NET", 90, "Arial", 50, 1, 0xFFD78E10, 0xFF000000, 1);
    g_Object[103] = CreateDynamicObject(2315, 1234.8122, -1674.6295, 69.8197, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //CJ_TV_TABLE4
    g_Object[104] = CreateDynamicObject(2315, 1234.8122, -1672.2395, 69.8197, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //CJ_TV_TABLE4
    g_Object[105] = CreateDynamicObject(2315, 1237.1623, -1672.2395, 69.8197, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //CJ_TV_TABLE4
    g_Object[106] = CreateDynamicObject(2315, 1238.6335, -1674.6295, 69.8197, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //CJ_TV_TABLE4
    g_Object[107] = CreateDynamicObject(19474, 1247.0268, -1669.1673, 70.3961, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //pokertable01
    SetDynamicObjectMaterial(g_Object[107], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[107], 2, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[108] = CreateDynamicObject(19474, 1247.0268, -1673.4593, 70.3961, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //pokertable01
    SetDynamicObjectMaterial(g_Object[108], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[108], 2, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[109] = CreateDynamicObject(2123, 1246.5212, -1667.7113, 70.4757, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //SWANK_DIN_CHAIR_4
    g_Object[110] = CreateDynamicObject(2123, 1247.7325, -1667.7113, 70.4757, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //SWANK_DIN_CHAIR_4
    g_Object[111] = CreateDynamicObject(2123, 1247.7325, -1670.5008, 70.4757, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //SWANK_DIN_CHAIR_4
    g_Object[112] = CreateDynamicObject(2123, 1246.4426, -1670.5008, 70.4757, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //SWANK_DIN_CHAIR_4
    g_Object[113] = CreateDynamicObject(2123, 1246.4426, -1674.9106, 70.4757, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //SWANK_DIN_CHAIR_4
    g_Object[114] = CreateDynamicObject(2123, 1247.6324, -1674.9106, 70.4757, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //SWANK_DIN_CHAIR_4
    g_Object[115] = CreateDynamicObject(2123, 1247.6324, -1671.8696, 70.4757, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //SWANK_DIN_CHAIR_4
    g_Object[116] = CreateDynamicObject(2123, 1246.4018, -1671.8696, 70.4757, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //SWANK_DIN_CHAIR_4
    g_Object[117] = CreateDynamicObject(19446, 1250.0985, -1696.9211, 71.5625, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall086
    g_Object[118] = CreateDynamicObject(19446, 1250.0985, -1687.4018, 71.5625, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall086
    g_Object[119] = CreateDynamicObject(19446, 1245.1982, -1682.6815, 71.5625, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //wall086
    g_Object[120] = CreateDynamicObject(19943, 1250.3315, -1682.7004, 69.7629, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[120], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[120], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[121] = CreateDynamicObject(19943, 1250.3315, -1682.7004, 66.1026, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[121], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[121], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[122] = CreateDynamicObject(19943, 1250.3315, -1701.3310, 66.1026, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[122], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[122], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[123] = CreateDynamicObject(19943, 1250.3315, -1701.3310, 69.7729, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[123], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[123], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[124] = CreateDynamicObject(19427, 1239.5830, -1682.6748, 71.5606, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //wall067
    g_Object[125] = CreateDynamicObject(19427, 1237.9719, -1682.6748, 71.5606, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //wall067
    g_Object[126] = CreateDynamicObject(19427, 1236.4018, -1682.6748, 71.5606, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //wall067
    g_Object[127] = CreateDynamicObject(19427, 1234.8122, -1682.6748, 71.5606, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //wall067
    g_Object[128] = CreateDynamicObject(19427, 1233.1914, -1682.6748, 71.5606, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //wall067
    g_Object[129] = CreateDynamicObject(1502, 1271.8116, -1682.7342, 69.8327, 0.0000, 0.0000, 180.0000, -1, -1, -1, 300.00, 300.00); //Gen_doorINT04
    SetDynamicObjectMaterial(g_Object[129], 0, 0, "INVALID", "INVALID", 0xFFFFFFFF);
    g_Object[130] = CreateDynamicObject(19943, 1232.3812, -1682.7004, 69.7629, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[130], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[130], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[131] = CreateDynamicObject(19943, 1232.3812, -1682.7004, 66.0229, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[131], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[131], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[132] = CreateDynamicObject(19943, 1240.8111, -1701.3310, 66.1026, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[132], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[132], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[133] = CreateDynamicObject(19943, 1240.8111, -1701.3310, 69.6529, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[133], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[133], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[134] = CreateDynamicObject(19943, 1240.8111, -1692.5509, 69.6529, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[134], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[134], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[135] = CreateDynamicObject(19943, 1240.8111, -1692.5509, 66.0727, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[135], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[135], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[136] = CreateDynamicObject(19943, 1250.0826, -1692.5509, 66.0727, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[136], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[136], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[137] = CreateDynamicObject(19943, 1250.0826, -1692.5509, 69.7628, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[137], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[137], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[138] = CreateDynamicObject(19457, 1250.2519, -1697.1406, 69.7621, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall097
    SetDynamicObjectMaterial(g_Object[138], 0, 14808, "lee_strip2", "Strip_Ceiling", 0xFFFFFFFF);
    g_Object[139] = CreateDynamicObject(19457, 1245.4526, -1693.8497, 69.7825, 0.0000, 90.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //wall097
    SetDynamicObjectMaterial(g_Object[139], 0, 14808, "lee_strip2", "Strip_Ceiling", 0xFFFFFFFF);
    g_Object[140] = CreateDynamicObject(19457, 1245.4526, -1697.3193, 69.7825, 0.0000, 90.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //wall097
    SetDynamicObjectMaterial(g_Object[140], 0, 14808, "lee_strip2", "Strip_Ceiling", 0xFFFFFFFF);
    g_Object[141] = CreateDynamicObject(14877, 1247.7137, -1700.5190, 67.7561, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //michelle-stairs
    g_Object[142] = CreateDynamicObject(19457, 1243.5511, -1697.1406, 69.7621, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall097
    SetDynamicObjectMaterial(g_Object[142], 0, 14808, "lee_strip2", "Strip_Ceiling", 0xFFFFFFFF);
    g_Object[143] = CreateDynamicObject(19457, 1242.2198, -1697.1406, 69.7621, 0.0000, 90.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall097
    SetDynamicObjectMaterial(g_Object[143], 0, 14808, "lee_strip2", "Strip_Ceiling", 0xFFFFFFFF);
    g_Object[144] = CreateDynamicObject(11731, 1246.4941, -1698.1007, 69.8255, 0.0000, 0.0000, 180.0000, -1, -1, -1, 300.00, 300.00); //WHeartBed1
    g_Object[145] = CreateDynamicObject(2161, 1249.9582, -1699.4344, 69.8731, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //MED_OFFICE_UNIT_4
    g_Object[146] = CreateDynamicObject(2330, 1246.7296, -1698.9221, 69.8391, 0.0000, 0.0000, 180.0000, -1, -1, -1, 300.00, 300.00); //CJ_BEDROOM1_W
    SetDynamicObjectMaterial(g_Object[146], 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[147] = CreateDynamicObject(2330, 1243.7491, -1700.2032, 69.8391, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //CJ_BEDROOM1_W
    SetDynamicObjectMaterial(g_Object[147], 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[148] = CreateDynamicObject(2330, 1248.0804, -1698.9221, 69.8391, 0.0000, 0.0000, 180.0000, -1, -1, -1, 300.00, 300.00); //CJ_BEDROOM1_W
    SetDynamicObjectMaterial(g_Object[148], 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[149] = CreateDynamicObject(1502, 1248.4802, -1701.6903, 69.6921, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //Gen_doorINT04
    SetDynamicObjectMaterial(g_Object[149], 0, 0, "INVALID", "INVALID", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[149], 1, 11145, "carrierint_sfs", "ab_ACcarrierDoor", 0xFFFFFFFF);
    g_Object[150] = CreateDynamicObject(2161, 1249.9582, -1698.1042, 69.8731, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //MED_OFFICE_UNIT_4
    g_Object[151] = CreateDynamicObject(2161, 1249.9582, -1696.7746, 69.8731, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //MED_OFFICE_UNIT_4
    g_Object[152] = CreateDynamicObject(2161, 1249.9582, -1695.4543, 69.8731, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //MED_OFFICE_UNIT_4
    g_Object[153] = CreateDynamicObject(2161, 1249.9582, -1694.1440, 69.8731, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //MED_OFFICE_UNIT_4
    g_Object[154] = CreateDynamicObject(2161, 1249.9582, -1699.4045, 71.2132, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //MED_OFFICE_UNIT_4
    g_Object[155] = CreateDynamicObject(2161, 1249.9582, -1698.0943, 71.2132, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //MED_OFFICE_UNIT_4
    g_Object[156] = CreateDynamicObject(2161, 1249.9582, -1696.7644, 71.2132, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //MED_OFFICE_UNIT_4
    g_Object[157] = CreateDynamicObject(2161, 1249.9582, -1695.4538, 71.2132, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //MED_OFFICE_UNIT_4
    g_Object[158] = CreateDynamicObject(2161, 1249.9582, -1694.1529, 71.2132, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //MED_OFFICE_UNIT_4
    g_Object[159] = CreateDynamicObject(19354, 1240.7048, -1699.2165, 71.3684, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall002
    g_Object[160] = CreateDynamicObject(19354, 1240.7048, -1696.0666, 71.3684, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall002
    g_Object[161] = CreateDynamicObject(19354, 1240.7048, -1693.7353, 71.3684, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall002
    g_Object[162] = CreateDynamicObject(19354, 1248.3657, -1692.5450, 71.3684, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //wall002
    g_Object[163] = CreateDynamicObject(19354, 1245.2352, -1692.5450, 71.3684, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //wall002
    g_Object[164] = CreateDynamicObject(2161, 1240.7972, -1700.0743, 69.8731, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //MED_OFFICE_UNIT_4
    g_Object[165] = CreateDynamicObject(2161, 1240.7972, -1698.7435, 69.8731, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //MED_OFFICE_UNIT_4
    g_Object[166] = CreateDynamicObject(2161, 1240.7972, -1697.4322, 69.8731, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //MED_OFFICE_UNIT_4
    g_Object[167] = CreateDynamicObject(2161, 1240.7972, -1696.1019, 69.8731, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //MED_OFFICE_UNIT_4
    g_Object[168] = CreateDynamicObject(2161, 1240.7972, -1694.7718, 69.8731, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //MED_OFFICE_UNIT_4
    g_Object[169] = CreateDynamicObject(2161, 1240.7972, -1694.7718, 69.8731, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //MED_OFFICE_UNIT_4
    g_Object[170] = CreateDynamicObject(19786, 1246.5279, -1692.5981, 71.6298, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //LCDTVBig1
    SetDynamicObjectMaterialText(g_Object[170], 1, "XNXX.XXX", 90, "Arial", 50, 1, 0xFFD78E10, 0xFF000000, 1);
    g_Object[171] = CreateDynamicObject(1502, 1243.8684, -1692.5327, 69.7613, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //Gen_doorINT04
    g_Object[172] = CreateDynamicObject(19354, 1243.8238, -1689.4344, 71.3684, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall002
    g_Object[173] = CreateDynamicObject(2526, 1247.8475, -1683.4289, 69.7902, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //CJ_BATH4
    g_Object[174] = CreateDynamicObject(19354, 1243.8238, -1686.2342, 71.3684, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall002
    g_Object[175] = CreateDynamicObject(19354, 1243.8238, -1684.2131, 71.3684, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall002
    g_Object[176] = CreateDynamicObject(2526, 1246.9377, -1683.4289, 69.7902, 0.0000, 0.0000, 180.0000, -1, -1, -1, 300.00, 300.00); //CJ_BATH4
    g_Object[177] = CreateDynamicObject(2525, 1249.4029, -1685.9570, 69.8292, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //CJ_TOILET4
    g_Object[178] = CreateDynamicObject(2525, 1249.4029, -1686.8878, 69.8292, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //CJ_TOILET4
    g_Object[179] = CreateDynamicObject(2515, 1249.7561, -1684.7253, 70.7525, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //CJ_BS_SINK
    g_Object[180] = CreateDynamicObject(2527, 1245.6456, -1685.1993, 69.8200, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //CJ_SHOWER4
    g_Object[181] = CreateDynamicObject(1827, 1232.1037, -1700.7303, 69.8638, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //man_sdr_tables
    g_Object[182] = CreateDynamicObject(1670, 1232.0190, -1700.3048, 70.3018, 0.0000, 0.0000, -169.1999, -1, -1, -1, 300.00, 300.00); //propcollecttable
    g_Object[183] = CreateDynamicObject(2096, 1231.9897, -1699.5074, 69.8534, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //CJ_RockingChair
    SetDynamicObjectMaterial(g_Object[183], 0, 14581, "ab_mafiasuitea", "ab_wood01", 0xFFFFFFFF);
    g_Object[184] = CreateDynamicObject(19325, 1237.0908, -1692.4709, 71.2686, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //lsmall_window01
    g_Object[185] = CreateDynamicObject(2169, 1238.5605, -1697.3657, 69.8395, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //MED_OFFICE3_DESK_1
    SetDynamicObjectMaterial(g_Object[185], 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[186] = CreateDynamicObject(1714, 1239.4936, -1696.8662, 69.8143, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //kb_swivelchair1
    g_Object[187] = CreateDynamicObject(1671, 1237.3557, -1697.7230, 70.2611, 0.0000, 0.0000, 140.0000, -1, -1, -1, 300.00, 300.00); //swivelchair_A
    g_Object[188] = CreateDynamicObject(1671, 1237.3559, -1696.2939, 70.2611, 0.0000, 0.0000, 50.0000, -1, -1, -1, 300.00, 300.00); //swivelchair_A
    g_Object[189] = CreateDynamicObject(19893, 1238.5731, -1696.8697, 70.6156, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //LaptopSAMP1
    g_Object[190] = CreateDynamicObject(2253, 1238.4576, -1696.0257, 70.7890, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //Plant_Pot_22
    g_Object[191] = CreateDynamicObject(3657, 1235.6385, -1692.9282, 70.2575, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //airseata_LAS
    g_Object[192] = CreateDynamicObject(19446, 1255.1400, -1671.2502, 71.5625, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall086
    g_Object[193] = CreateDynamicObject(19446, 1266.9620, -1677.8918, 71.5625, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //wall086
    g_Object[194] = CreateDynamicObject(19446, 1260.6112, -1677.8918, 71.5625, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //wall086
    g_Object[195] = CreateDynamicObject(19611, 1258.9925, -1671.1756, 69.9086, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //MicrophoneStand1
    g_Object[196] = CreateDynamicObject(19608, 1257.4831, -1670.6533, 69.8491, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //WoodenStage1
    g_Object[197] = CreateDynamicObject(19610, 1258.9814, -1671.1715, 71.5456, 35.3997, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //Microphone1
    g_Object[198] = CreateDynamicObject(19609, 1257.9509, -1673.4027, 69.8513, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //DrumKit1
    g_Object[199] = CreateDynamicObject(2763, 1258.6755, -1668.9912, 70.2537, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //CJ_CHICK_TABLE_2
    SetDynamicObjectMaterial(g_Object[199], 3, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[200] = CreateDynamicObject(2763, 1258.6755, -1667.9404, 70.2537, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //CJ_CHICK_TABLE_2
    SetDynamicObjectMaterial(g_Object[200], 3, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[201] = CreateDynamicObject(19612, 1258.8127, -1669.0920, 70.6885, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //GuitarAmp1
    g_Object[202] = CreateDynamicObject(19612, 1258.8127, -1668.6616, 70.6885, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //GuitarAmp1
    g_Object[203] = CreateDynamicObject(19612, 1258.8127, -1668.2110, 70.6885, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //GuitarAmp1
    g_Object[204] = CreateDynamicObject(19612, 1258.8127, -1667.7607, 70.6885, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //GuitarAmp1
    g_Object[205] = CreateDynamicObject(14537, 1272.0345, -1672.1704, 71.5820, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //pdomesBar
    g_Object[206] = CreateDynamicObject(19446, 1255.1400, -1687.4908, 71.5625, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall086
    g_Object[207] = CreateDynamicObject(19446, 1255.1400, -1696.9337, 71.5625, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall086
    g_Object[208] = CreateDynamicObject(19446, 1259.9311, -1682.7806, 71.5625, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //wall086
    g_Object[209] = CreateDynamicObject(19446, 1265.3635, -1682.7806, 71.5625, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //wall086
    g_Object[210] = CreateDynamicObject(19943, 1269.7827, -1682.7004, 69.7629, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[210], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[210], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[211] = CreateDynamicObject(19943, 1269.7827, -1682.7004, 66.0929, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[211], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[211], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[212] = CreateDynamicObject(19943, 1255.3725, -1682.7004, 66.0929, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[212], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[212], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[213] = CreateDynamicObject(19943, 1255.3725, -1682.7004, 69.7229, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[213], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[213], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[214] = CreateDynamicObject(19943, 1255.3725, -1701.2419, 69.7229, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[214], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[214], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[215] = CreateDynamicObject(19943, 1255.3725, -1701.2419, 66.0929, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[215], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[215], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[216] = CreateDynamicObject(19943, 1255.3725, -1692.6809, 69.7229, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[216], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[216], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[217] = CreateDynamicObject(19943, 1255.3725, -1692.6809, 66.1828, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[217], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[217], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[218] = CreateDynamicObject(1502, 1231.9200, -1682.7313, 69.8327, 0.0000, 0.0000, 180.0000, -1, -1, -1, 300.00, 300.00); //Gen_doorINT04
    SetDynamicObjectMaterial(g_Object[218], 0, 0, "INVALID", "INVALID", 0xFFFFFFFF);
    g_Object[219] = CreateDynamicObject(2357, 1260.3236, -1688.2060, 70.2209, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //DUNC_DINNING
    g_Object[220] = CreateDynamicObject(2357, 1264.2440, -1688.2060, 70.2209, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //DUNC_DINNING
    g_Object[221] = CreateDynamicObject(1739, 1265.6823, -1687.1263, 70.7157, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //SWANK_DIN_CHAIR_5
    SetDynamicObjectMaterial(g_Object[221], 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[221], 1, 1355, "break_s_bins", "CJ_RED_LEATHER", 0xFFFFFFFF);
    g_Object[222] = CreateDynamicObject(1739, 1259.7689, -1689.3673, 70.7157, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //SWANK_DIN_CHAIR_5
    SetDynamicObjectMaterial(g_Object[222], 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[222], 1, 1355, "break_s_bins", "CJ_RED_LEATHER", 0xFFFFFFFF);
    g_Object[223] = CreateDynamicObject(1739, 1260.5594, -1689.3673, 70.7157, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //SWANK_DIN_CHAIR_5
    SetDynamicObjectMaterial(g_Object[223], 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[223], 1, 1355, "break_s_bins", "CJ_RED_LEATHER", 0xFFFFFFFF);
    g_Object[224] = CreateDynamicObject(1739, 1261.3302, -1689.3773, 70.7157, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //SWANK_DIN_CHAIR_5
    SetDynamicObjectMaterial(g_Object[224], 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[224], 1, 1355, "break_s_bins", "CJ_RED_LEATHER", 0xFFFFFFFF);
    g_Object[225] = CreateDynamicObject(1739, 1262.2209, -1689.3773, 70.7157, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //SWANK_DIN_CHAIR_5
    SetDynamicObjectMaterial(g_Object[225], 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[225], 1, 1355, "break_s_bins", "CJ_RED_LEATHER", 0xFFFFFFFF);
    g_Object[226] = CreateDynamicObject(1739, 1263.1115, -1689.3773, 70.7157, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //SWANK_DIN_CHAIR_5
    SetDynamicObjectMaterial(g_Object[226], 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[226], 1, 1355, "break_s_bins", "CJ_RED_LEATHER", 0xFFFFFFFF);
    g_Object[227] = CreateDynamicObject(1739, 1263.8924, -1689.3773, 70.7157, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //SWANK_DIN_CHAIR_5
    SetDynamicObjectMaterial(g_Object[227], 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[227], 1, 1355, "break_s_bins", "CJ_RED_LEATHER", 0xFFFFFFFF);
    g_Object[228] = CreateDynamicObject(1739, 1258.7479, -1689.3673, 70.7157, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //SWANK_DIN_CHAIR_5
    SetDynamicObjectMaterial(g_Object[228], 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[228], 1, 1355, "break_s_bins", "CJ_RED_LEATHER", 0xFFFFFFFF);
    g_Object[229] = CreateDynamicObject(1739, 1264.6831, -1689.3773, 70.7157, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //SWANK_DIN_CHAIR_5
    SetDynamicObjectMaterial(g_Object[229], 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[229], 1, 1355, "break_s_bins", "CJ_RED_LEATHER", 0xFFFFFFFF);
    g_Object[230] = CreateDynamicObject(1739, 1265.6439, -1689.3773, 70.7157, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //SWANK_DIN_CHAIR_5
    SetDynamicObjectMaterial(g_Object[230], 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[230], 1, 1355, "break_s_bins", "CJ_RED_LEATHER", 0xFFFFFFFF);
    g_Object[231] = CreateDynamicObject(19929, 1266.7135, -1695.7445, 69.8264, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[231], 0, 6404, "beafron1_law2", "Gen_Scaffold_Wood_Under", 0xFFFFFFFF);
    g_Object[232] = CreateDynamicObject(19929, 1266.7135, -1698.4632, 69.8264, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[232], 0, 6404, "beafron1_law2", "Gen_Scaffold_Wood_Under", 0xFFFFFFFF);
    g_Object[233] = CreateDynamicObject(19929, 1266.7135, -1693.7933, 69.8264, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[233], 0, 6404, "beafron1_law2", "Gen_Scaffold_Wood_Under", 0xFFFFFFFF);
    g_Object[234] = CreateDynamicObject(19929, 1266.6853, -1694.5322, 72.2164, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[234], 0, 6404, "beafron1_law2", "Gen_Scaffold_Wood_Under", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[234], 1, 7088, "casinoshops1", "fakestone1_LA", 0xFFFFFFFF);
    g_Object[235] = CreateDynamicObject(1739, 1264.7718, -1687.1263, 70.7157, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //SWANK_DIN_CHAIR_5
    SetDynamicObjectMaterial(g_Object[235], 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[235], 1, 1355, "break_s_bins", "CJ_RED_LEATHER", 0xFFFFFFFF);
    g_Object[236] = CreateDynamicObject(1739, 1263.9315, -1687.1263, 70.7157, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //SWANK_DIN_CHAIR_5
    SetDynamicObjectMaterial(g_Object[236], 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[236], 1, 1355, "break_s_bins", "CJ_RED_LEATHER", 0xFFFFFFFF);
    g_Object[237] = CreateDynamicObject(1739, 1263.0909, -1687.1263, 70.7157, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //SWANK_DIN_CHAIR_5
    SetDynamicObjectMaterial(g_Object[237], 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[237], 1, 1355, "break_s_bins", "CJ_RED_LEATHER", 0xFFFFFFFF);
    g_Object[238] = CreateDynamicObject(1739, 1262.2401, -1687.1263, 70.7157, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //SWANK_DIN_CHAIR_5
    SetDynamicObjectMaterial(g_Object[238], 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[238], 1, 1355, "break_s_bins", "CJ_RED_LEATHER", 0xFFFFFFFF);
    g_Object[239] = CreateDynamicObject(1739, 1261.3492, -1687.1263, 70.7157, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //SWANK_DIN_CHAIR_5
    SetDynamicObjectMaterial(g_Object[239], 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[239], 1, 1355, "break_s_bins", "CJ_RED_LEATHER", 0xFFFFFFFF);
    g_Object[240] = CreateDynamicObject(1739, 1260.5284, -1687.1263, 70.7157, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //SWANK_DIN_CHAIR_5
    SetDynamicObjectMaterial(g_Object[240], 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[240], 1, 1355, "break_s_bins", "CJ_RED_LEATHER", 0xFFFFFFFF);
    g_Object[241] = CreateDynamicObject(1739, 1259.7475, -1687.1263, 70.7157, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //SWANK_DIN_CHAIR_5
    SetDynamicObjectMaterial(g_Object[241], 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[241], 1, 1355, "break_s_bins", "CJ_RED_LEATHER", 0xFFFFFFFF);
    g_Object[242] = CreateDynamicObject(1739, 1258.8468, -1687.1263, 70.7157, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //SWANK_DIN_CHAIR_5
    SetDynamicObjectMaterial(g_Object[242], 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[242], 1, 1355, "break_s_bins", "CJ_RED_LEATHER", 0xFFFFFFFF);
    g_Object[243] = CreateDynamicObject(1739, 1257.6363, -1688.2065, 70.7157, 0.0000, 0.0000, 180.0000, -1, -1, -1, 300.00, 300.00); //SWANK_DIN_CHAIR_5
    SetDynamicObjectMaterial(g_Object[243], 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[243], 1, 1355, "break_s_bins", "CJ_RED_LEATHER", 0xFFFFFFFF);
    g_Object[244] = CreateDynamicObject(19929, 1260.1529, -1692.8127, 69.8264, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[244], 0, 6404, "beafron1_law2", "Gen_Scaffold_Wood_Under", 0xFFFFFFFF);
    g_Object[245] = CreateDynamicObject(19786, 1238.8724, -1677.8409, 71.7601, 0.0000, 0.0000, 180.0000, -1, -1, -1, 300.00, 300.00); //LCDTVBig1
    SetDynamicObjectMaterialText(g_Object[245], 1, "Although my group is small but GMH quality", 90, "Arial", 15, 1, 0xFFD78E10, 0xFF000000, 1);
    g_Object[246] = CreateDynamicObject(19929, 1257.3227, -1692.8127, 69.8264, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[246], 0, 6404, "beafron1_law2", "Gen_Scaffold_Wood_Under", 0xFFFFFFFF);
    g_Object[247] = CreateDynamicObject(19929, 1263.0035, -1692.8127, 69.8264, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[247], 0, 6404, "beafron1_law2", "Gen_Scaffold_Wood_Under", 0xFFFFFFFF);
    g_Object[248] = CreateDynamicObject(19929, 1265.7434, -1692.8127, 69.8264, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[248], 0, 6404, "beafron1_law2", "Gen_Scaffold_Wood_Under", 0xFFFFFFFF);
    g_Object[249] = CreateDynamicObject(19929, 1257.3215, -1692.8127, 72.2164, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[249], 0, 6404, "beafron1_law2", "Gen_Scaffold_Wood_Under", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[249], 1, 7088, "casinoshops1", "fakestone1_LA", 0xFFFFFFFF);
    g_Object[250] = CreateDynamicObject(19929, 1260.1534, -1692.8127, 72.2164, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[250], 0, 6404, "beafron1_law2", "Gen_Scaffold_Wood_Under", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[250], 1, 7088, "casinoshops1", "fakestone1_LA", 0xFFFFFFFF);
    g_Object[251] = CreateDynamicObject(19929, 1262.9038, -1692.8127, 72.2164, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[251], 0, 6404, "beafron1_law2", "Gen_Scaffold_Wood_Under", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[251], 1, 7088, "casinoshops1", "fakestone1_LA", 0xFFFFFFFF);
    g_Object[252] = CreateDynamicObject(19929, 1265.6743, -1692.8127, 72.2164, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[252], 0, 6404, "beafron1_law2", "Gen_Scaffold_Wood_Under", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[252], 1, 7088, "casinoshops1", "fakestone1_LA", 0xFFFFFFFF);
    g_Object[253] = CreateDynamicObject(19943, 1266.9619, -1692.7009, 69.7629, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[253], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[253], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[254] = CreateDynamicObject(19943, 1266.9619, -1692.7009, 66.1327, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[254], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[254], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[255] = CreateDynamicObject(19943, 1266.9619, -1701.5321, 66.1327, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[255], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[255], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[256] = CreateDynamicObject(19943, 1266.9619, -1701.5321, 69.7029, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[256], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[256], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[257] = CreateDynamicObject(19786, 1255.1053, -1670.9521, 71.6484, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //LCDTVBig1
    SetDynamicObjectMaterialText(g_Object[257], 1, "Thi Flower", 90, "Arial", 60, 1, 0xFFD78E10, 0xFF000000, 1);
    g_Object[258] = CreateDynamicObject(19943, 1255.3725, -1677.9798, 69.7229, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[258], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[258], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[259] = CreateDynamicObject(19943, 1255.3725, -1677.9798, 66.1628, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[259], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[259], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[260] = CreateDynamicObject(19943, 1249.8133, -1677.9798, 66.1628, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[260], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[260], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[261] = CreateDynamicObject(19943, 1249.8133, -1677.9798, 69.7426, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[261], 0, 3314, "ce_burbhouse", "sw_wallbrick_06", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[261], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[262] = CreateDynamicObject(19929, 1266.6853, -1697.3120, 72.2164, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[262], 0, 6404, "beafron1_law2", "Gen_Scaffold_Wood_Under", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[262], 1, 7088, "casinoshops1", "fakestone1_LA", 0xFFFFFFFF);
    g_Object[263] = CreateDynamicObject(19929, 1266.6853, -1700.1617, 72.2164, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[263], 0, 6404, "beafron1_law2", "Gen_Scaffold_Wood_Under", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[263], 1, 7088, "casinoshops1", "fakestone1_LA", 0xFFFFFFFF);
    g_Object[264] = CreateDynamicObject(1502, 1266.9536, -1701.3503, 68.1872, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //Gen_doorINT04
    SetDynamicObjectMaterial(g_Object[264], 1, 18065, "ab_sfammumain", "gun_door1", 0xFFFFFFFF);
    g_Object[265] = CreateDynamicObject(19927, 1255.6574, -1699.5449, 69.8492, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //MKWorkTop3
    g_Object[266] = CreateDynamicObject(19924, 1255.9448, -1697.8277, 72.8466, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //MKExtractionHood1
    g_Object[267] = CreateDynamicObject(19923, 1255.8072, -1697.7238, 69.7835, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //MKIslandCooker1
    g_Object[268] = CreateDynamicObject(19926, 1255.6477, -1694.1860, 69.8235, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //MKWorkTop2
    g_Object[269] = CreateDynamicObject(19926, 1255.6477, -1696.0866, 69.8235, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //MKWorkTop2
    g_Object[270] = CreateDynamicObject(19929, 1257.6085, -1701.2652, 69.8242, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //MKWorkTop5
    g_Object[271] = CreateDynamicObject(1847, 1261.5443, -1701.1510, 69.7468, 0.0000, 0.0000, 180.0000, -1, -1, -1, 300.00, 300.00); //shop_shelf06
    g_Object[272] = CreateDynamicObject(2427, 1258.5407, -1701.4687, 70.7072, 0.0000, 0.0000, 180.0000, -1, -1, -1, 300.00, 300.00); //CJ_FF_JUICE_L
    g_Object[273] = CreateDynamicObject(2427, 1257.6700, -1701.4687, 70.7072, 0.0000, 0.0000, 180.0000, -1, -1, -1, 300.00, 300.00); //CJ_FF_JUICE_L
    g_Object[274] = CreateDynamicObject(2427, 1256.8298, -1701.4687, 70.7072, 0.0000, 0.0000, 180.0000, -1, -1, -1, 300.00, 300.00); //CJ_FF_JUICE_L
    g_Object[275] = CreateDynamicObject(1661, 1259.9029, -1688.1512, 72.8235, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //htl_fan_rotate_dy
    g_Object[276] = CreateDynamicObject(19806, 1261.9641, -1688.1447, 72.7848, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //Chandelier1
    g_Object[277] = CreateDynamicObject(1661, 1263.8238, -1688.1612, 72.8235, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //htl_fan_rotate_dy
    g_Object[278] = CreateDynamicObject(1302, 1264.6147, -1701.3857, 69.8199, 0.0000, 0.0000, 180.0000, -1, -1, -1, 300.00, 300.00); //vendmachfd
    g_Object[279] = CreateDynamicObject(1566, 1249.1452, -1666.2105, 13.7429, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //CJ_WS_DOOR
    g_Object[280] = CreateDynamicObject(1566, 1252.2863, -1666.2105, 13.7429, 0.0000, 0.0000, 180.0000, -1, -1, -1, 300.00, 300.00); //CJ_WS_DOOR
    g_Object[281] = CreateDynamicObject(3383, 1243.1949, -1693.5988, 66.9621, 0.0000, 0.0000, 180.0000, -1, -1, -1, 300.00, 300.00); //a51_labtable1_
    g_Object[282] = CreateDynamicObject(19446, 1245.7250, -1701.8522, 68.1025, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //wall086
    SetDynamicObjectMaterial(g_Object[282], 0, 1738, "cjtemp", "CJ_BED_BASE", 0xFFFFFFFF);
    g_Object[283] = CreateDynamicObject(19446, 1245.9753, -1692.7021, 68.1025, 0.0000, 0.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //wall086
    SetDynamicObjectMaterial(g_Object[283], 0, 1738, "cjtemp", "CJ_BED_BASE", 0xFFFFFFFF);
    g_Object[284] = CreateDynamicObject(19446, 1240.6346, -1696.5925, 68.1025, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall086
    SetDynamicObjectMaterial(g_Object[284], 0, 1738, "cjtemp", "CJ_BED_BASE", 0xFFFFFFFF);
    g_Object[285] = CreateDynamicObject(19446, 1250.3051, -1696.5925, 68.1025, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //wall086
    SetDynamicObjectMaterial(g_Object[285], 0, 1738, "cjtemp", "CJ_BED_BASE", 0xFFFFFFFF);
    g_Object[286] = CreateDynamicObject(3383, 1247.2248, -1693.5988, 66.9621, 0.0000, 0.0000, 180.0000, -1, -1, -1, 300.00, 300.00); //a51_labtable1_
    g_Object[287] = CreateDynamicObject(3092, 1243.3300, -1693.7404, 68.1389, 90.0000, 90.0000, 180.0000, -1, -1, -1, 300.00, 300.00); //dead_tied_cop
    g_Object[288] = CreateDynamicObject(3092, 1247.4610, -1693.7404, 68.1389, 90.0000, 90.0000, 180.0000, -1, -1, -1, 300.00, 300.00); //dead_tied_cop
    g_Object[289] = CreateDynamicObject(335, 1242.0753, -1693.9006, 67.9827, 90.0000, 90.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //knifecur
    g_Object[290] = CreateDynamicObject(335, 1245.8560, -1693.9006, 67.9827, 90.0000, 90.0000, 90.0000, -1, -1, -1, 300.00, 300.00); //knifecur
    g_Object[291] = CreateDynamicObject(19836, 1242.6040, -1693.7576, 68.0298, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //BloodPool1
    g_Object[292] = CreateDynamicObject(19836, 1242.6040, -1693.9979, 68.0298, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //BloodPool1
    g_Object[293] = CreateDynamicObject(19836, 1242.4238, -1693.8778, 68.0298, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //BloodPool1
    g_Object[294] = CreateDynamicObject(1550, 1249.5375, -1701.1967, 67.3292, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //CJ_MONEY_BAG
    g_Object[295] = CreateDynamicObject(1550, 1249.0875, -1701.1967, 67.3292, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //CJ_MONEY_BAG
    g_Object[296] = CreateDynamicObject(1550, 1248.6273, -1701.1967, 67.3292, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //CJ_MONEY_BAG
    g_Object[297] = CreateDynamicObject(1550, 1248.1771, -1701.1967, 67.3292, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //CJ_MONEY_BAG
    g_Object[298] = CreateDynamicObject(1550, 1247.7368, -1701.1967, 67.3292, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //CJ_MONEY_BAG
    g_Object[299] = CreateDynamicObject(1550, 1247.3464, -1701.1967, 67.3292, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //CJ_MONEY_BAG
    g_Object[300] = CreateDynamicObject(1550, 1246.9560, -1701.1967, 67.3292, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //CJ_MONEY_BAG
    g_Object[301] = CreateDynamicObject(1550, 1246.5256, -1701.1967, 67.3292, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //CJ_MONEY_BAG
    g_Object[302] = CreateDynamicObject(1550, 1246.1152, -1701.1967, 67.3292, 0.0000, 0.0000, 0.0000, -1, -1, -1, 300.00, 300.00); //CJ_MONEY_BAG
    g_Object[303] = CreateDynamicObject(19825, 1250.1578, -1696.7264, 69.0952, 0.0000, 0.0000, 270.0000, -1, -1, -1, 300.00, 300.00); //SprunkClock1
}

hook OnPlayerConnect(playerid) {
    RemoveBuildingForPlayer(playerid, 6106, 1226.9531, -1656.1563, 24.7734, 0.25);
    RemoveBuildingForPlayer(playerid, 6196, 1225.3359, -1642.7500, 25.1016, 0.25);
    RemoveBuildingForPlayer(playerid, 1525, 1271.4844, -1662.3203, 20.2500, 0.25);
    RemoveBuildingForPlayer(playerid, 626, 1258.5781, -1675.5000, 14.6016, 0.25);
    RemoveBuildingForPlayer(playerid, 626, 1267.6719, -1675.5000, 14.6016, 0.25);
    RemoveBuildingForPlayer(playerid, 6102, 1226.9531, -1656.1563, 24.7734, 0.25);
    RemoveBuildingForPlayer(playerid, 626, 1258.5781, -1659.8750, 14.6016, 0.25);
    RemoveBuildingForPlayer(playerid, 626, 1267.6719, -1659.8750, 14.6016, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1237.5000, -1643.4297, 14.8516, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1233.4688, -1643.4297, 14.8516, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1245.5625, -1643.4297, 14.8516, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1241.5313, -1643.4297, 14.8516, 0.25);
    RemoveBuildingForPlayer(playerid, 626, 1258.5781, -1643.3672, 14.6016, 0.25);
    RemoveBuildingForPlayer(playerid, 626, 1267.6719, -1643.3672, 14.6016, 0.25);
    RemoveBuildingForPlayer(playerid, 626, 1243.5078, -1640.4609, 28.4219, 0.25);
    RemoveBuildingForPlayer(playerid, 626, 1255.7109, -1640.4609, 28.4219, 0.25);
    RemoveBuildingForPlayer(playerid, 626, 1282.8281, -1639.9609, 28.4219, 0.25);
    RemoveBuildingForPlayer(playerid, 626, 1243.5078, -1632.8672, 28.4219, 0.25);
    RemoveBuildingForPlayer(playerid, 626, 1255.7109, -1632.8672, 28.4219, 0.25);
    RemoveBuildingForPlayer(playerid, 626, 1282.8281, -1619.8516, 28.4219, 0.25);
    RemoveBuildingForPlayer(playerid, 626, 1282.8281, -1629.1094, 28.4219, 0.25);
    RemoveBuildingForPlayer(playerid, 626, 1258.5781, -1675.5000, 14.6016, 0.25);
    RemoveBuildingForPlayer(playerid, 626, 1267.6719, -1675.5000, 14.6016, 0.25);
    RemoveBuildingForPlayer(playerid, 626, 1208.2813, -1665.4688, 14.5000, 0.25);
    RemoveBuildingForPlayer(playerid, 626, 1258.5781, -1659.8750, 14.6016, 0.25);
    RemoveBuildingForPlayer(playerid, 626, 1267.6719, -1659.8750, 14.6016, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1237.5000, -1643.4297, 14.8516, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1233.4688, -1643.4297, 14.8516, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1245.5625, -1643.4297, 14.8516, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1241.5313, -1643.4297, 14.8516, 0.25);
    RemoveBuildingForPlayer(playerid, 626, 1258.5781, -1643.3672, 14.6016, 0.25);
    RemoveBuildingForPlayer(playerid, 626, 1267.6719, -1643.3672, 14.6016, 0.25);
    RemoveBuildingForPlayer(playerid, 626, 1219.1172, -1640.4609, 28.4219, 0.25);
    RemoveBuildingForPlayer(playerid, 626, 1231.3125, -1640.4609, 28.4219, 0.25);
    RemoveBuildingForPlayer(playerid, 626, 1243.5078, -1640.4609, 28.4219, 0.25);
    RemoveBuildingForPlayer(playerid, 626, 1255.7109, -1640.4609, 28.4219, 0.25);
    RemoveBuildingForPlayer(playerid, 626, 1282.8281, -1639.9609, 28.4219, 0.25);
    RemoveBuildingForPlayer(playerid, 626, 1211.6016, -1632.8672, 28.4219, 0.25);
    RemoveBuildingForPlayer(playerid, 626, 1219.1172, -1632.8672, 28.4219, 0.25);
    RemoveBuildingForPlayer(playerid, 626, 1231.3125, -1632.8672, 28.4219, 0.25);
    RemoveBuildingForPlayer(playerid, 626, 1243.5078, -1632.8672, 28.4219, 0.25);
    RemoveBuildingForPlayer(playerid, 626, 1255.7109, -1632.8672, 28.4219, 0.25);
    RemoveBuildingForPlayer(playerid, 626, 1282.8281, -1619.8516, 28.4219, 0.25);
    RemoveBuildingForPlayer(playerid, 626, 1282.8281, -1629.1094, 28.4219, 0.25);    
}