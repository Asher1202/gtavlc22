#include <YSI_Coding\y_hooks>

hook OnGameModeInit() {
    print("[map] grays3s.inc loaded.");
    new g_Object[240];
    g_Object[0] = CreateDynamicObject(19380, 1001.8226, -2134.0544, -4.0696, 0.0000, 90.0000, 0.0000); //wall028
    SetDynamicObjectMaterial(g_Object[0], 0, 14801, "lee_bdupsmain", "Bdup_KitchFloor", 0xFFFFFFFF);
    g_Object[1] = CreateDynamicObject(19380, 1001.8226, -2143.6665, -4.0696, 0.0000, 90.0000, 0.0000); //wall028
    SetDynamicObjectMaterial(g_Object[1], 0, 14801, "lee_bdupsmain", "Bdup_KitchFloor", 0xFFFFFFFF);
    g_Object[2] = CreateDynamicObject(19380, 1001.8226, -2153.2258, -4.0696, 0.0000, 90.0000, 0.0000); //wall028
    SetDynamicObjectMaterial(g_Object[2], 0, 14801, "lee_bdupsmain", "Bdup_KitchFloor", 0xFFFFFFFF);
    g_Object[3] = CreateDynamicObject(19380, 991.3427, -2153.2258, -4.0696, 0.0000, 90.0000, 0.0000); //wall028
    SetDynamicObjectMaterial(g_Object[3], 0, 14801, "lee_bdupsmain", "Bdup_KitchFloor", 0xFFFFFFFF);
    g_Object[4] = CreateDynamicObject(19380, 980.8822, -2153.2258, -4.0696, 0.0000, 90.0000, 0.0000); //wall028
    SetDynamicObjectMaterial(g_Object[4], 0, 14801, "lee_bdupsmain", "Bdup_KitchFloor", 0xFFFFFFFF);
    g_Object[5] = CreateDynamicObject(19380, 991.3427, -2143.6472, -4.0696, 0.0000, 90.0000, 0.0000); //wall028
    SetDynamicObjectMaterial(g_Object[5], 0, 14801, "lee_bdupsmain", "Bdup_KitchFloor", 0xFFFFFFFF);
    g_Object[6] = CreateDynamicObject(19380, 991.3427, -2134.0625, -4.0696, 0.0000, 90.0000, 0.0000); //wall028
    SetDynamicObjectMaterial(g_Object[6], 0, 14801, "lee_bdupsmain", "Bdup_KitchFloor", 0xFFFFFFFF);
    g_Object[7] = CreateDynamicObject(19380, 980.8822, -2143.6328, -4.0696, 0.0000, 90.0000, 0.0000); //wall028
    SetDynamicObjectMaterial(g_Object[7], 0, 14801, "lee_bdupsmain", "Bdup_KitchFloor", 0xFFFFFFFF);
    g_Object[8] = CreateDynamicObject(19380, 980.8822, -2134.0712, -4.0696, 0.0000, 90.0000, 0.0000); //wall028
    SetDynamicObjectMaterial(g_Object[8], 0, 14801, "lee_bdupsmain", "Bdup_KitchFloor", 0xFFFFFFFF);
    g_Object[9] = CreateDynamicObject(19451, 980.4724, -2129.2639, -2.2848, 0.0000, 0.0000, 90.0000); //wall091
    SetDynamicObjectMaterial(g_Object[9], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[10] = CreateDynamicObject(19451, 990.0924, -2129.2639, -2.2848, 0.0000, 0.0000, 90.0000); //wall091
    SetDynamicObjectMaterial(g_Object[10], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[11] = CreateDynamicObject(19451, 999.7022, -2129.2639, -2.2848, 0.0000, 0.0000, 90.0000); //wall091
    SetDynamicObjectMaterial(g_Object[11], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[12] = CreateDynamicObject(19451, 1009.3018, -2129.2639, -2.2848, 0.0000, 0.0000, 90.0000); //wall091
    SetDynamicObjectMaterial(g_Object[12], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[13] = CreateDynamicObject(19451, 1006.9807, -2134.0141, -2.2848, 0.0000, 0.0000, 0.0000); //wall091
    SetDynamicObjectMaterial(g_Object[13], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[14] = CreateDynamicObject(19451, 1006.9807, -2143.6330, -2.2848, 0.0000, 0.0000, 0.0000); //wall091
    SetDynamicObjectMaterial(g_Object[14], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[15] = CreateDynamicObject(19451, 1006.9807, -2153.2229, -2.2848, 0.0000, 0.0000, 0.0000); //wall091
    SetDynamicObjectMaterial(g_Object[15], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[16] = CreateDynamicObject(19451, 980.4498, -2157.9152, -2.2848, 0.0000, 0.0000, 90.0000); //wall091
    SetDynamicObjectMaterial(g_Object[16], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[17] = CreateDynamicObject(19451, 990.0498, -2157.9152, -2.2848, 0.0000, 0.0000, 90.0000); //wall091
    SetDynamicObjectMaterial(g_Object[17], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[18] = CreateDynamicObject(19451, 999.6693, -2157.9152, -2.2848, 0.0000, 0.0000, 90.0000); //wall091
    SetDynamicObjectMaterial(g_Object[18], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[19] = CreateDynamicObject(19451, 1009.2788, -2157.9152, -2.2848, 0.0000, 0.0000, 90.0000); //wall091
    SetDynamicObjectMaterial(g_Object[19], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[20] = CreateDynamicObject(19380, 980.8822, -2153.1857, -0.6496, 0.0000, 90.0000, 0.0000); //wall028
    SetDynamicObjectMaterial(g_Object[20], 0, 14801, "lee_bdupsmain", "Bdup_KitchFloor", 0xFFFFFFFF);
    g_Object[21] = CreateDynamicObject(19451, 975.9486, -2153.1623, -1.4649, 0.0000, 0.0000, 0.0000); //wall091
    SetDynamicObjectMaterial(g_Object[21], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[22] = CreateDynamicObject(19451, 975.9486, -2143.5505, -1.4649, 0.0000, 0.0000, 0.0000); //wall091
    SetDynamicObjectMaterial(g_Object[22], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[23] = CreateDynamicObject(19451, 975.9486, -2133.9389, -1.4649, 0.0000, 0.0000, 0.0000); //wall091
    SetDynamicObjectMaterial(g_Object[23], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[24] = CreateDynamicObject(19451, 975.9486, -2133.9389, -4.9348, 0.0000, 0.0000, 0.0000); //wall091
    SetDynamicObjectMaterial(g_Object[24], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[25] = CreateDynamicObject(19451, 975.9486, -2143.5402, -4.9348, 0.0000, 0.0000, 0.0000); //wall091
    SetDynamicObjectMaterial(g_Object[25], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[26] = CreateDynamicObject(19451, 975.9486, -2153.1601, -4.9348, 0.0000, 0.0000, 0.0000); //wall091
    SetDynamicObjectMaterial(g_Object[26], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[27] = CreateDynamicObject(19380, 980.8222, -2143.6254, -0.6496, 0.0000, 90.0000, 0.0000); //wall028
    SetDynamicObjectMaterial(g_Object[27], 0, 14801, "lee_bdupsmain", "Bdup_KitchFloor", 0xFFFFFFFF);
    g_Object[28] = CreateDynamicObject(19380, 980.8822, -2133.9899, -0.6496, 0.0000, 90.0000, 0.0000); //wall028
    SetDynamicObjectMaterial(g_Object[28], 0, 14801, "lee_bdupsmain", "Bdup_KitchFloor", 0xFFFFFFFF);
    g_Object[29] = CreateDynamicObject(19380, 991.2412, -2133.9899, -0.6496, 0.0000, 90.0000, 0.0000); //wall028
    SetDynamicObjectMaterial(g_Object[29], 0, 14801, "lee_bdupsmain", "Bdup_KitchFloor", 0xFFFFFFFF);
    g_Object[30] = CreateDynamicObject(19380, 1001.7111, -2133.9899, -0.6496, 0.0000, 90.0000, 0.0000); //wall028
    SetDynamicObjectMaterial(g_Object[30], 0, 14801, "lee_bdupsmain", "Bdup_KitchFloor", 0xFFFFFFFF);
    g_Object[31] = CreateDynamicObject(19380, 1001.7111, -2143.5734, -0.6496, 0.0000, 90.0000, 0.0000); //wall028
    SetDynamicObjectMaterial(g_Object[31], 0, 14801, "lee_bdupsmain", "Bdup_KitchFloor", 0xFFFFFFFF);
    g_Object[32] = CreateDynamicObject(19380, 1001.7111, -2153.1679, -0.6496, 0.0000, 90.0000, 0.0000); //wall028
    SetDynamicObjectMaterial(g_Object[32], 0, 14801, "lee_bdupsmain", "Bdup_KitchFloor", 0xFFFFFFFF);
    g_Object[33] = CreateDynamicObject(19380, 991.2517, -2153.1679, -0.6496, 0.0000, 90.0000, 0.0000); //wall028
    SetDynamicObjectMaterial(g_Object[33], 0, 14801, "lee_bdupsmain", "Bdup_KitchFloor", 0xFFFFFFFF);
    g_Object[34] = CreateDynamicObject(19325, 975.9552, -2154.6445, 2.2860, 0.0000, 0.0000, 0.0000); //lsmall_window01
    SetDynamicObjectMaterial(g_Object[34], 0, 6284, "bev_law2", "glass_fence_64hv", 0xFFFFFFFF);
    g_Object[35] = CreateDynamicObject(19325, 975.9552, -2148.0419, 2.2860, 0.0000, 0.0000, 0.0000); //lsmall_window01
    SetDynamicObjectMaterial(g_Object[35], 0, 6284, "bev_law2", "glass_fence_64hv", 0xFFFFFFFF);
    g_Object[36] = CreateDynamicObject(19325, 975.9552, -2141.4399, 2.2860, 0.0000, 0.0000, 0.0000); //lsmall_window01
    SetDynamicObjectMaterial(g_Object[36], 0, 6284, "bev_law2", "glass_fence_64hv", 0xFFFFFFFF);
    g_Object[37] = CreateDynamicObject(19325, 975.9552, -2134.8454, 2.2860, 0.0000, 0.0000, 0.0000); //lsmall_window01
    SetDynamicObjectMaterial(g_Object[37], 0, 6284, "bev_law2", "glass_fence_64hv", 0xFFFFFFFF);
    g_Object[38] = CreateDynamicObject(19325, 975.9552, -2128.2836, 2.2860, 0.0000, 0.0000, 0.0000); //lsmall_window01
    SetDynamicObjectMaterial(g_Object[38], 0, 6284, "bev_law2", "glass_fence_64hv", 0xFFFFFFFF);
    g_Object[39] = CreateDynamicObject(19451, 980.7390, -2157.9152, 1.1749, 0.0000, 0.0000, 90.0000); //wall091
    SetDynamicObjectMaterial(g_Object[39], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[40] = CreateDynamicObject(19451, 990.3590, -2157.9152, 1.1649, 0.0000, 0.0000, 90.0000); //wall091
    SetDynamicObjectMaterial(g_Object[40], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[41] = CreateDynamicObject(19451, 999.9495, -2157.9152, 1.1649, 0.0000, 0.0000, 90.0000); //wall091
    SetDynamicObjectMaterial(g_Object[41], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[42] = CreateDynamicObject(19451, 1009.2792, -2157.9152, 1.1649, 0.0000, 0.0000, 90.0000); //wall091
    SetDynamicObjectMaterial(g_Object[42], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[43] = CreateDynamicObject(19451, 1006.9887, -2153.0627, 1.1649, 0.0000, 0.0000, 0.0000); //wall091
    SetDynamicObjectMaterial(g_Object[43], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[44] = CreateDynamicObject(19451, 1006.9887, -2143.4284, 1.1749, 0.0000, 0.0000, 0.0000); //wall091
    SetDynamicObjectMaterial(g_Object[44], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[45] = CreateDynamicObject(19451, 1006.9887, -2133.8273, 1.1849, 0.0000, 0.0000, 0.0000); //wall091
    SetDynamicObjectMaterial(g_Object[45], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[46] = CreateDynamicObject(19451, 999.8388, -2129.3049, 1.1749, 0.0000, 0.0000, 90.0000); //wall091
    SetDynamicObjectMaterial(g_Object[46], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[47] = CreateDynamicObject(19451, 990.2883, -2129.3049, 1.1749, 0.0000, 0.0000, 90.0000); //wall091
    SetDynamicObjectMaterial(g_Object[47], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[48] = CreateDynamicObject(19451, 980.6881, -2129.3049, 1.1849, 0.0000, 0.0000, 90.0000); //wall091
    SetDynamicObjectMaterial(g_Object[48], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[49] = CreateDynamicObject(19451, 1009.4489, -2129.3049, 1.1749, 0.0000, 0.0000, 90.0000); //wall091
    SetDynamicObjectMaterial(g_Object[49], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[50] = CreateDynamicObject(19380, 1001.7111, -2143.5463, 2.8001, 0.0000, 90.0000, 0.0000); //wall028
    SetDynamicObjectMaterial(g_Object[50], 0, 14668, "711c", "gun_ceiling1128", 0xFFFFFFFF);
    g_Object[51] = CreateDynamicObject(19380, 1001.7111, -2133.9899, 2.8001, 0.0000, 90.0000, 0.0000); //wall028
    SetDynamicObjectMaterial(g_Object[51], 0, 14668, "711c", "gun_ceiling1128", 0xFFFFFFFF);
    g_Object[52] = CreateDynamicObject(19380, 1001.7111, -2153.1716, 2.8001, 0.0000, 90.0000, 0.0000); //wall028
    SetDynamicObjectMaterial(g_Object[52], 0, 14668, "711c", "gun_ceiling1128", 0xFFFFFFFF);
    g_Object[53] = CreateDynamicObject(19380, 991.3917, -2153.1716, 2.8001, 0.0000, 90.0000, 0.0000); //wall028
    SetDynamicObjectMaterial(g_Object[53], 0, 14668, "711c", "gun_ceiling1128", 0xFFFFFFFF);
    g_Object[54] = CreateDynamicObject(19380, 980.9918, -2153.1716, 2.8001, 0.0000, 90.0000, 0.0000); //wall028
    SetDynamicObjectMaterial(g_Object[54], 0, 14668, "711c", "gun_ceiling1128", 0xFFFFFFFF);
    g_Object[55] = CreateDynamicObject(19380, 980.9918, -2143.6196, 2.8001, 0.0000, 90.0000, 0.0000); //wall028
    SetDynamicObjectMaterial(g_Object[55], 0, 14668, "711c", "gun_ceiling1128", 0xFFFFFFFF);
    g_Object[56] = CreateDynamicObject(19380, 980.9918, -2134.0180, 2.8001, 0.0000, 90.0000, 0.0000); //wall028
    SetDynamicObjectMaterial(g_Object[56], 0, 14668, "711c", "gun_ceiling1128", 0xFFFFFFFF);
    g_Object[57] = CreateDynamicObject(19380, 991.4412, -2134.0180, 2.8001, 0.0000, 90.0000, 0.0000); //wall028
    SetDynamicObjectMaterial(g_Object[57], 0, 14668, "711c", "gun_ceiling1128", 0xFFFFFFFF);
    g_Object[58] = CreateDynamicObject(19380, 991.4412, -2143.5493, 2.8001, 0.0000, 90.0000, 0.0000); //wall028
    SetDynamicObjectMaterial(g_Object[58], 0, 14668, "711c", "gun_ceiling1128", 0xFFFFFFFF);
    g_Object[59] = CreateDynamicObject(1557, 1006.8873, -2145.5295, -3.9640, 0.0000, 0.0000, 90.0000); //Gen_doorEXT19
    g_Object[60] = CreateDynamicObject(1557, 1006.8873, -2142.5175, -3.9640, 0.0000, 0.0000, 270.0000); //Gen_doorEXT19
    g_Object[61] = CreateDynamicObject(14411, 988.8961, -2146.4497, -3.7560, 0.0000, 0.0000, 90.0000); //carter-stairs04
    SetDynamicObjectMaterial(g_Object[61], 0, 14801, "lee_bdupsmain", "Bdup_KitchFloor", 0xFFFFFFFF);
    g_Object[62] = CreateDynamicObject(14411, 988.8961, -2142.4589, -3.7560, 0.0000, 0.0000, 90.0000); //carter-stairs04
    SetDynamicObjectMaterial(g_Object[62], 0, 14801, "lee_bdupsmain", "Bdup_KitchFloor", 0xFFFFFFFF);
    g_Object[63] = CreateDynamicObject(14411, 988.8961, -2140.8774, -3.7560, 0.0000, 0.0000, 90.0000); //carter-stairs04
    SetDynamicObjectMaterial(g_Object[63], 0, 14801, "lee_bdupsmain", "Bdup_KitchFloor", 0xFFFFFFFF);
    g_Object[64] = CreateDynamicObject(19451, 990.8500, -2148.3112, -2.3348, 0.0000, 0.0000, 90.0000); //wall091
    SetDynamicObjectMaterial(g_Object[64], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[65] = CreateDynamicObject(19451, 990.8500, -2138.8862, -2.3348, 0.0000, 0.0000, 90.0000); //wall091
    SetDynamicObjectMaterial(g_Object[65], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[66] = CreateDynamicObject(16151, 1005.8336, -2134.3444, -0.2576, 0.0000, 0.0000, 0.0000); //ufo_bar
    g_Object[67] = CreateDynamicObject(14835, 1002.0996, -2139.6677, 0.9194, 0.0000, 0.0000, 0.0000); //LM_stripColumns
    g_Object[68] = CreateDynamicObject(14537, 1001.2813, -2153.5227, 1.3998, 0.0000, 0.0000, 0.0000); //pdomesBar
    g_Object[69] = CreateDynamicObject(18102, 999.9667, -2133.4914, 5.5279, 0.0000, 0.0000, 90.0000); //Light_box1
    g_Object[70] = CreateDynamicObject(18102, 999.9667, -2137.9221, 5.4878, 0.0000, 0.0000, 90.0000); //Light_box1
    g_Object[71] = CreateDynamicObject(11687, 1005.6843, -2148.0949, -0.5763, 0.0000, 0.0000, 0.0000); //CBarStool1
    g_Object[72] = CreateDynamicObject(11687, 1004.6243, -2148.0949, -0.5763, 0.0000, 0.0000, 0.0000); //CBarStool1
    g_Object[73] = CreateDynamicObject(11687, 1003.5745, -2148.0949, -0.5763, 0.0000, 0.0000, 0.0000); //CBarStool1
    g_Object[74] = CreateDynamicObject(11687, 999.2440, -2147.9748, -0.5763, 0.0000, 0.0000, 0.0000); //CBarStool1
    g_Object[75] = CreateDynamicObject(2311, 978.4188, -2131.8537, -0.5780, 0.0000, 0.0000, 90.0000); //CJ_TV_TABLE2
    g_Object[76] = CreateDynamicObject(11687, 998.1640, -2147.9748, -0.5763, 0.0000, 0.0000, 0.0000); //CBarStool1
    g_Object[77] = CreateDynamicObject(11687, 997.2442, -2147.9748, -0.5763, 0.0000, 0.0000, 0.0000); //CBarStool1
    g_Object[78] = CreateDynamicObject(11687, 995.8538, -2149.0959, -0.5763, 0.0000, 0.0000, 0.0000); //CBarStool1
    g_Object[79] = CreateDynamicObject(11687, 995.8538, -2150.0568, -0.5763, 0.0000, 0.0000, 0.0000); //CBarStool1
    g_Object[80] = CreateDynamicObject(11687, 995.8538, -2151.1379, -0.5763, 0.0000, 0.0000, 0.0000); //CBarStool1
    g_Object[81] = CreateDynamicObject(11687, 995.8538, -2152.0981, -0.5763, 0.0000, 0.0000, 0.0000); //CBarStool1
    g_Object[82] = CreateDynamicObject(11687, 995.8538, -2155.1999, -0.5763, 0.0000, 0.0000, 0.0000); //CBarStool1
    g_Object[83] = CreateDynamicObject(11687, 995.8538, -2156.0805, -0.5763, 0.0000, 0.0000, 0.0000); //CBarStool1
    g_Object[84] = CreateDynamicObject(11687, 995.8538, -2156.9414, -0.5763, 0.0000, 0.0000, 0.0000); //CBarStool1
    g_Object[85] = CreateDynamicObject(11687, 995.8538, -2157.7021, -0.5763, 0.0000, 0.0000, 0.0000); //CBarStool1
    g_Object[86] = CreateDynamicObject(2311, 987.1600, -2131.8437, -0.5979, 0.0000, 0.0000, 90.0000); //CJ_TV_TABLE2
    g_Object[87] = CreateDynamicObject(2311, 987.1600, -2138.0056, -0.5979, 0.0000, 0.0000, 90.0000); //CJ_TV_TABLE2
    g_Object[88] = CreateDynamicObject(2311, 983.0592, -2131.8437, -0.5979, 0.0000, 0.0000, 90.0000); //CJ_TV_TABLE2
    g_Object[89] = CreateDynamicObject(2311, 983.0592, -2138.1081, -0.6079, 0.0000, 0.0000, 90.0000); //CJ_TV_TABLE2
    g_Object[90] = CreateDynamicObject(2311, 991.6909, -2138.0056, -0.5979, 0.0000, 0.0000, 90.0000); //CJ_TV_TABLE2
    g_Object[91] = CreateDynamicObject(2311, 991.6909, -2131.8742, -0.5979, 0.0000, 0.0000, 90.0000); //CJ_TV_TABLE2
    g_Object[92] = CreateDynamicObject(2311, 978.4188, -2138.1794, -0.5780, 0.0000, 0.0000, 90.0000); //CJ_TV_TABLE2
    g_Object[93] = CreateDynamicObject(2311, 978.4188, -2144.1145, -0.5780, 0.0000, 0.0000, 90.0000); //CJ_TV_TABLE2
    g_Object[94] = CreateDynamicObject(2311, 978.4188, -2150.7795, -0.5780, 0.0000, 0.0000, 90.0000); //CJ_TV_TABLE2
    g_Object[95] = CreateDynamicObject(2311, 978.4188, -2156.8615, -0.5780, 0.0000, 0.0000, 90.0000); //CJ_TV_TABLE2
    g_Object[96] = CreateDynamicObject(1723, 979.8455, -2136.4685, -0.5904, 0.0000, 0.0000, 270.0000); //mrk_seating1
    g_Object[97] = CreateDynamicObject(1723, 979.8455, -2130.0454, -0.5904, 0.0000, 0.0000, 270.0000); //mrk_seating1
    g_Object[98] = CreateDynamicObject(1723, 984.3067, -2130.0454, -0.5904, 0.0000, 0.0000, 270.0000); //mrk_seating1
    g_Object[99] = CreateDynamicObject(1723, 988.4379, -2130.0454, -0.5904, 0.0000, 0.0000, 270.0000); //mrk_seating1
    g_Object[100] = CreateDynamicObject(1723, 993.0286, -2130.0454, -0.5904, 0.0000, 0.0000, 270.0000); //mrk_seating1
    g_Object[101] = CreateDynamicObject(1723, 993.0286, -2136.2675, -0.5904, 0.0000, 0.0000, 270.0000); //mrk_seating1
    g_Object[102] = CreateDynamicObject(1723, 988.3681, -2136.2675, -0.5904, 0.0000, 0.0000, 270.0000); //mrk_seating1
    g_Object[103] = CreateDynamicObject(1723, 984.2271, -2136.2675, -0.5904, 0.0000, 0.0000, 270.0000); //mrk_seating1
    g_Object[104] = CreateDynamicObject(1723, 979.8455, -2142.2993, -0.5904, 0.0000, 0.0000, 270.0000); //mrk_seating1
    g_Object[105] = CreateDynamicObject(1723, 979.8455, -2149.0551, -0.5904, 0.0000, 0.0000, 270.0000); //mrk_seating1
    g_Object[106] = CreateDynamicObject(1723, 979.8455, -2155.0803, -0.5904, 0.0000, 0.0000, 270.0000); //mrk_seating1
    g_Object[107] = CreateDynamicObject(3850, 994.8817, -2138.7817, -0.0865, 0.0000, 0.0000, 90.0000); //carshowbann_SFSX
    g_Object[108] = CreateDynamicObject(3850, 991.4221, -2138.7817, -0.0865, 0.0000, 0.0000, 90.0000); //carshowbann_SFSX
    g_Object[109] = CreateDynamicObject(3850, 988.0022, -2138.7817, -0.0865, 0.0000, 0.0000, 90.0000); //carshowbann_SFSX
    g_Object[110] = CreateDynamicObject(3850, 988.0022, -2148.3703, -0.0865, 0.0000, 0.0000, 90.0000); //carshowbann_SFSX
    g_Object[111] = CreateDynamicObject(3850, 991.4427, -2148.3703, -0.0865, 0.0000, 0.0000, 90.0000); //carshowbann_SFSX
    g_Object[112] = CreateDynamicObject(3850, 994.8535, -2148.3703, -0.0865, 0.0000, 0.0000, 90.0000); //carshowbann_SFSX
    g_Object[113] = CreateDynamicObject(3850, 996.5638, -2140.5080, -0.0865, 0.0000, 0.0000, 0.0000); //carshowbann_SFSX
    g_Object[114] = CreateDynamicObject(3850, 996.5638, -2143.9389, -0.0865, 0.0000, 0.0000, 0.0000); //carshowbann_SFSX
    g_Object[115] = CreateDynamicObject(3850, 996.5638, -2147.3708, -0.0865, 0.0000, 0.0000, 0.0000); //carshowbann_SFSX
    g_Object[116] = CreateDynamicObject(19451, 986.1388, -2143.6169, -2.3348, 0.0000, 0.0000, 0.0000); //wall091
    SetDynamicObjectMaterial(g_Object[116], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[117] = CreateDynamicObject(19430, 980.0157, -2148.2995, -2.3569, 0.0000, 0.0000, 90.0000); //wall070
    SetDynamicObjectMaterial(g_Object[117], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[118] = CreateDynamicObject(19393, 984.0184, -2148.2961, -2.3378, 0.0000, 0.0000, 90.0000); //wall041
    SetDynamicObjectMaterial(g_Object[118], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[119] = CreateDynamicObject(19430, 981.6149, -2148.2995, -2.3569, 0.0000, 0.0000, 90.0000); //wall070
    SetDynamicObjectMaterial(g_Object[119], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[120] = CreateDynamicObject(19430, 978.4252, -2148.2995, -2.3569, 0.0000, 0.0000, 90.0000); //wall070
    SetDynamicObjectMaterial(g_Object[120], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[121] = CreateDynamicObject(19430, 976.8451, -2148.2995, -2.3569, 0.0000, 0.0000, 90.0000); //wall070
    SetDynamicObjectMaterial(g_Object[121], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[122] = CreateDynamicObject(19430, 986.4349, -2148.2995, -2.3369, 0.0000, 0.0000, 90.0000); //wall070
    SetDynamicObjectMaterial(g_Object[122], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[123] = CreateDynamicObject(19430, 986.4349, -2138.8779, -2.3369, 0.0000, 0.0000, 90.0000); //wall070
    SetDynamicObjectMaterial(g_Object[123], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[124] = CreateDynamicObject(19393, 984.0184, -2138.9099, -2.3378, 0.0000, 0.0000, 90.0000); //wall041
    SetDynamicObjectMaterial(g_Object[124], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[125] = CreateDynamicObject(19430, 981.6149, -2138.9167, -2.3569, 0.0000, 0.0000, 90.0000); //wall070
    SetDynamicObjectMaterial(g_Object[125], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[126] = CreateDynamicObject(19430, 980.0352, -2138.9167, -2.3569, 0.0000, 0.0000, 90.0000); //wall070
    SetDynamicObjectMaterial(g_Object[126], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[127] = CreateDynamicObject(19430, 978.4243, -2138.9167, -2.3569, 0.0000, 0.0000, 90.0000); //wall070
    SetDynamicObjectMaterial(g_Object[127], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[128] = CreateDynamicObject(19430, 976.8242, -2138.9167, -2.3569, 0.0000, 0.0000, 90.0000); //wall070
    SetDynamicObjectMaterial(g_Object[128], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[129] = CreateDynamicObject(1502, 983.2440, -2138.9025, -4.0136, 0.0000, 0.0000, 0.0000); //Gen_doorINT04
    g_Object[130] = CreateDynamicObject(1502, 983.2437, -2148.3281, -4.0136, 0.0000, 0.0000, 0.0000); //Gen_doorINT04
    g_Object[131] = CreateDynamicObject(11731, 977.6271, -2153.1691, -3.9941, 0.0000, 0.0000, 90.0000); //WHeartBed1
    g_Object[132] = CreateDynamicObject(19922, 977.5439, -2157.1809, -4.0230, 0.0000, 0.0000, 0.0000); //MKTable1
    g_Object[133] = CreateDynamicObject(19893, 977.5375, -2157.0175, -3.2412, 0.0000, 0.0000, 180.0000); //LaptopSAMP1
    g_Object[134] = CreateDynamicObject(19808, 977.5245, -2156.7658, -3.2303, 0.0000, 0.0000, 180.0000); //Keyboard1
    g_Object[135] = CreateDynamicObject(19393, 986.1593, -2149.9777, -2.3378, 0.0000, 0.0000, 0.0000); //wall041
    SetDynamicObjectMaterial(g_Object[135], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[136] = CreateDynamicObject(2123, 977.5055, -2156.1318, -3.4049, 0.0000, 0.0000, 90.0000); //SWANK_DIN_CHAIR_4
    g_Object[137] = CreateDynamicObject(2253, 976.6733, -2157.1557, -2.9865, 0.0000, 0.0000, 0.0000); //Plant_Pot_22
    g_Object[138] = CreateDynamicObject(2253, 978.4032, -2157.1557, -2.9865, 0.0000, 0.0000, 0.0000); //Plant_Pot_22
    g_Object[139] = CreateDynamicObject(11705, 978.0353, -2156.8728, -3.2552, 0.0000, 0.0000, 180.0000); //BlackTelephone1
    g_Object[140] = CreateDynamicObject(11745, 976.3171, -2156.8303, -3.0758, 0.0000, 0.0000, 0.0000); //HoldAllEdited1
    g_Object[141] = CreateDynamicObject(19786, 986.0769, -2153.4548, -2.1855, 0.0000, 0.0000, 270.0000); //LCDTVBig1
    SetDynamicObjectMaterialText(g_Object[141], 1, "XNXX.XXX", 90, "Arial", 50, 1, 0xFF840410, 0xFF000000, 1);
    g_Object[142] = CreateDynamicObject(19451, 986.2196, -2156.3627, -2.3348, 0.0000, 0.0000, 0.0000); //wall091
    SetDynamicObjectMaterial(g_Object[142], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[143] = CreateDynamicObject(1502, 986.2537, -2150.7402, -4.0136, 0.0000, 0.0000, 90.0000); //Gen_doorINT04
    g_Object[144] = CreateDynamicObject(11665, 984.4413, -2153.4768, -3.4445, 0.0000, 0.0000, 0.0000); //kb_chair03ext
    g_Object[145] = CreateDynamicObject(19430, 983.7077, -2150.1186, -4.0369, 0.0000, 90.0000, 90.0000); //wall070
    SetDynamicObjectMaterial(g_Object[145], 0, 15041, "bigsfsave", "ah_greencarp", 0xFFFFFFFF);
    g_Object[146] = CreateDynamicObject(19430, 985.2875, -2150.1186, -4.0369, 0.0000, 90.0000, 90.0000); //wall070
    SetDynamicObjectMaterial(g_Object[146], 0, 15041, "bigsfsave", "ah_greencarp", 0xFFFFFFFF);
    g_Object[147] = CreateDynamicObject(19430, 982.1483, -2150.1186, -4.0369, 0.0000, 90.0000, 90.0000); //wall070
    SetDynamicObjectMaterial(g_Object[147], 0, 15041, "bigsfsave", "ah_greencarp", 0xFFFFFFFF);
    g_Object[148] = CreateDynamicObject(19430, 980.5583, -2150.1186, -4.0369, 0.0000, 90.0000, 90.0000); //wall070
    SetDynamicObjectMaterial(g_Object[148], 0, 15041, "bigsfsave", "ah_greencarp", 0xFFFFFFFF);
    g_Object[149] = CreateDynamicObject(19430, 978.9684, -2150.1186, -4.0369, 0.0000, 90.0000, 90.0000); //wall070
    SetDynamicObjectMaterial(g_Object[149], 0, 15041, "bigsfsave", "ah_greencarp", 0xFFFFFFFF);
    g_Object[150] = CreateDynamicObject(19430, 977.3684, -2150.1186, -4.0369, 0.0000, 90.0000, 90.0000); //wall070
    SetDynamicObjectMaterial(g_Object[150], 0, 15041, "bigsfsave", "ah_greencarp", 0xFFFFFFFF);
    g_Object[151] = CreateDynamicObject(19430, 975.7984, -2150.1186, -4.0369, 0.0000, 90.0000, 90.0000); //wall070
    SetDynamicObjectMaterial(g_Object[151], 0, 15041, "bigsfsave", "ah_greencarp", 0xFFFFFFFF);
    g_Object[152] = CreateDynamicObject(19430, 975.8485, -2156.1442, -4.0369, 0.0000, 90.0000, 90.0000); //wall070
    SetDynamicObjectMaterial(g_Object[152], 0, 15041, "bigsfsave", "ah_greencarp", 0xFFFFFFFF);
    g_Object[153] = CreateDynamicObject(19430, 977.4483, -2156.1442, -4.0369, 0.0000, 90.0000, 90.0000); //wall070
    SetDynamicObjectMaterial(g_Object[153], 0, 15041, "bigsfsave", "ah_greencarp", 0xFFFFFFFF);
    g_Object[154] = CreateDynamicObject(19430, 979.0579, -2156.1442, -4.0369, 0.0000, 90.0000, 90.0000); //wall070
    SetDynamicObjectMaterial(g_Object[154], 0, 15041, "bigsfsave", "ah_greencarp", 0xFFFFFFFF);
    g_Object[155] = CreateDynamicObject(19430, 980.6579, -2156.1442, -4.0369, 0.0000, 90.0000, 90.0000); //wall070
    SetDynamicObjectMaterial(g_Object[155], 0, 15041, "bigsfsave", "ah_greencarp", 0xFFFFFFFF);
    g_Object[156] = CreateDynamicObject(19430, 982.2481, -2156.1442, -4.0369, 0.0000, 90.0000, 90.0000); //wall070
    SetDynamicObjectMaterial(g_Object[156], 0, 15041, "bigsfsave", "ah_greencarp", 0xFFFFFFFF);
    g_Object[157] = CreateDynamicObject(19430, 983.8289, -2156.1442, -4.0369, 0.0000, 90.0000, 90.0000); //wall070
    SetDynamicObjectMaterial(g_Object[157], 0, 15041, "bigsfsave", "ah_greencarp", 0xFFFFFFFF);
    g_Object[158] = CreateDynamicObject(19430, 985.4187, -2156.1442, -4.0369, 0.0000, 90.0000, 90.0000); //wall070
    SetDynamicObjectMaterial(g_Object[158], 0, 15041, "bigsfsave", "ah_greencarp", 0xFFFFFFFF);
    g_Object[159] = CreateDynamicObject(19430, 985.4187, -2153.5717, -4.0369, 0.0000, 90.0000, 90.0000); //wall070
    SetDynamicObjectMaterial(g_Object[159], 0, 15041, "bigsfsave", "ah_greencarp", 0xFFFFFFFF);
    g_Object[160] = CreateDynamicObject(19430, 983.8290, -2153.5717, -4.0369, 0.0000, 90.0000, 90.0000); //wall070
    SetDynamicObjectMaterial(g_Object[160], 0, 15041, "bigsfsave", "ah_greencarp", 0xFFFFFFFF);
    g_Object[161] = CreateDynamicObject(19430, 982.2290, -2153.5717, -4.0369, 0.0000, 90.0000, 90.0000); //wall070
    SetDynamicObjectMaterial(g_Object[161], 0, 15041, "bigsfsave", "ah_greencarp", 0xFFFFFFFF);
    g_Object[162] = CreateDynamicObject(19430, 980.6185, -2153.5717, -4.0369, 0.0000, 90.0000, 90.0000); //wall070
    SetDynamicObjectMaterial(g_Object[162], 0, 15041, "bigsfsave", "ah_greencarp", 0xFFFFFFFF);
    g_Object[163] = CreateDynamicObject(19430, 979.0084, -2153.5717, -4.0369, 0.0000, 90.0000, 90.0000); //wall070
    SetDynamicObjectMaterial(g_Object[163], 0, 15041, "bigsfsave", "ah_greencarp", 0xFFFFFFFF);
    g_Object[164] = CreateDynamicObject(1742, 980.0746, -2157.9157, -3.9548, 0.0000, 0.0000, 180.0000); //Med_BOOKSHELF
    g_Object[165] = CreateDynamicObject(1742, 981.5250, -2157.9157, -3.9548, 0.0000, 0.0000, 180.0000); //Med_BOOKSHELF
    g_Object[166] = CreateDynamicObject(1742, 982.9354, -2157.9157, -3.9548, 0.0000, 0.0000, 180.0000); //Med_BOOKSHELF
    g_Object[167] = CreateDynamicObject(1828, 981.2165, -2153.2231, -3.9652, 0.0000, 0.0000, 0.0000); //man_sdr_rug
    g_Object[168] = CreateDynamicObject(19393, 995.5604, -2149.9777, -2.3378, 0.0000, 0.0000, 0.0000); //wall041
    SetDynamicObjectMaterial(g_Object[168], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[169] = CreateDynamicObject(1502, 995.5844, -2150.7402, -4.0136, 0.0000, 0.0000, 90.0000); //Gen_doorINT04
    g_Object[170] = CreateDynamicObject(19451, 995.5607, -2156.3627, -2.3348, 0.0000, 0.0000, 0.0000); //wall091
    SetDynamicObjectMaterial(g_Object[170], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[171] = CreateDynamicObject(19325, 992.1846, -2150.7453, -2.7439, 0.0000, 0.0000, 90.0000); //lsmall_window01
    g_Object[172] = CreateDynamicObject(2527, 994.9406, -2156.4028, -3.9859, 0.0000, 0.0000, 180.0000); //CJ_SHOWER4
    g_Object[173] = CreateDynamicObject(2526, 993.7456, -2151.2443, -4.0106, 0.0000, 0.0000, 0.0000); //CJ_BATH4
    g_Object[174] = CreateDynamicObject(2528, 993.8693, -2157.3876, -3.9828, 0.0000, 0.0000, 180.0000); //CJ_TOILET3
    g_Object[175] = CreateDynamicObject(2515, 995.2225, -2154.6181, -2.8076, 0.0000, 0.0000, 270.0000); //CJ_BS_SINK
    g_Object[176] = CreateDynamicObject(19393, 995.5696, -2137.1965, -2.3378, 0.0000, 0.0000, 0.0000); //wall041
    SetDynamicObjectMaterial(g_Object[176], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[177] = CreateDynamicObject(19451, 995.5794, -2131.5244, -2.3248, 0.0000, 0.0000, 0.0000); //wall091
    SetDynamicObjectMaterial(g_Object[177], 0, 13060, "ce_fact01", "puttywall1", 0xFFFFFFFF);
    g_Object[178] = CreateDynamicObject(1502, 995.5837, -2137.9111, -4.0136, 0.0000, 0.0000, 90.0000); //Gen_doorINT04
    g_Object[179] = CreateDynamicObject(1607, 1001.5073, -2130.7780, -2.2761, 0.0000, 0.0000, 90.0000); //dolphin
    g_Object[180] = CreateDynamicObject(19603, 998.2481, -2132.4194, -3.2362, 0.0000, 90.0000, 90.0000); //WaterPlane1
    g_Object[181] = CreateDynamicObject(19603, 1003.2279, -2132.4194, -3.2362, 0.0000, 90.0000, 90.0000); //WaterPlane1
    g_Object[182] = CreateDynamicObject(19603, 1008.1882, -2132.4194, -3.2362, 0.0000, 90.0000, 90.0000); //WaterPlane1
    g_Object[183] = CreateDynamicObject(19604, 998.1152, -2154.8347, -5.6214, 270.0000, 90.0000, 90.0000); //WaterPlane2
    g_Object[184] = CreateDynamicObject(19604, 1003.0654, -2154.8347, -5.6214, 270.0000, 90.0000, 90.0000); //WaterPlane2
    g_Object[185] = CreateDynamicObject(19604, 1008.0559, -2154.8347, -5.6214, 270.0000, 90.0000, 90.0000); //WaterPlane2
    g_Object[186] = CreateDynamicObject(19786, 986.1198, -2143.5273, -2.1133, 0.0000, 0.0000, 270.0000); //LCDTVBig1
    SetDynamicObjectMaterialText(g_Object[186], 1, "MARVER", 90, "Arial", 50, 1, 0xFF840410, 0xFF000000, 1);
    g_Object[187] = CreateDynamicObject(1723, 976.6772, -2146.3908, -4.0252, 0.0000, 0.0000, 90.0000); //mrk_seating1
    g_Object[188] = CreateDynamicObject(1723, 976.6772, -2142.5800, -4.0252, 0.0000, 0.0000, 90.0000); //mrk_seating1
    g_Object[189] = CreateDynamicObject(1723, 978.0873, -2139.5187, -4.0252, 0.0000, 0.0000, 0.0000); //mrk_seating1
    g_Object[190] = CreateDynamicObject(1723, 980.2077, -2147.7128, -4.0252, 0.0000, 0.0000, 180.0000); //mrk_seating1
    g_Object[191] = CreateDynamicObject(2232, 985.7864, -2145.0563, -3.3510, 0.0000, 0.0000, 270.0000); //MED_SPEAKER_4
    g_Object[192] = CreateDynamicObject(2232, 985.7864, -2145.0563, -2.1310, 0.0000, 0.0000, 270.0000); //MED_SPEAKER_4
    g_Object[193] = CreateDynamicObject(2232, 985.7864, -2142.0136, -3.3510, 0.0000, 0.0000, 270.0000); //MED_SPEAKER_4
    g_Object[194] = CreateDynamicObject(2232, 985.7864, -2142.0136, -2.1410, 0.0000, 0.0000, 270.0000); //MED_SPEAKER_4
    g_Object[195] = CreateDynamicObject(19929, 983.0121, -2134.3164, -4.0194, 0.0000, 0.0000, 0.0000); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[195], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[196] = CreateDynamicObject(19786, 995.5620, -2133.8039, -1.7724, 0.0000, 0.0000, 270.0000); //LCDTVBig1
    SetDynamicObjectMaterialText(g_Object[196], 1, "GTAVLC.COM", 90, "Arial", 50, 1, 0xFF840410, 0xFF000000, 1);
    g_Object[197] = CreateDynamicObject(19929, 983.0121, -2131.5244, -4.0194, 0.0000, 0.0000, 0.0000); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[197], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[198] = CreateDynamicObject(19929, 981.2423, -2135.3073, -4.0194, 0.0000, 0.0000, 90.0000); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[198], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[199] = CreateDynamicObject(19929, 983.0121, -2128.7026, -4.0194, 0.0000, 0.0000, 0.0000); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[199], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[200] = CreateDynamicObject(19929, 978.4624, -2135.3073, -4.0194, 0.0000, 0.0000, 90.0000); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[200], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[201] = CreateDynamicObject(19929, 981.9335, -2135.3073, -1.8694, 0.0000, 0.0000, 90.0000); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[201], 0, 0, "INVALID", "INVALID", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[201], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[202] = CreateDynamicObject(19929, 979.1035, -2135.3073, -1.8694, 0.0000, 0.0000, 90.0000); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[202], 0, 0, "INVALID", "INVALID", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[202], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[203] = CreateDynamicObject(19929, 976.3536, -2135.3073, -1.8694, 0.0000, 0.0000, 90.0000); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[203], 0, 0, "INVALID", "INVALID", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[203], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[204] = CreateDynamicObject(19929, 982.9843, -2131.4643, -1.8694, 0.0000, 0.0000, 0.0000); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[204], 0, 0, "INVALID", "INVALID", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[204], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[205] = CreateDynamicObject(19929, 982.9843, -2134.2170, -1.8694, 0.0000, 0.0000, 0.0000); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[205], 0, 0, "INVALID", "INVALID", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[205], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[206] = CreateDynamicObject(19929, 982.9843, -2128.6530, -1.8694, 0.0000, 0.0000, 0.0000); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[206], 0, 0, "INVALID", "INVALID", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[206], 1, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[207] = CreateDynamicObject(941, 989.6038, -2133.9628, -3.5094, 0.0000, 0.0000, 0.0000); //CJ_DF_WORKTOP_3
    SetDynamicObjectMaterial(g_Object[207], 0, 2127, "cj_kitchen", "CJ_RED", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[207], 1, 10041, "archybuild10", "whitedecosfe4", 0xFFFFFFFF);
    g_Object[208] = CreateDynamicObject(2123, 992.6322, -2134.9990, -3.3843, 0.0000, 0.0000, 270.0000); //SWANK_DIN_CHAIR_4
    SetDynamicObjectMaterial(g_Object[208], 1, 1355, "break_s_bins", "CJ_RED_LEATHER", 0xFFFFFFFF);
    g_Object[209] = CreateDynamicObject(19927, 976.9758, -2129.7644, -4.0167, 0.0000, 0.0000, 90.0000); //MKWorkTop3
    g_Object[210] = CreateDynamicObject(941, 991.9436, -2133.9628, -3.5094, 0.0000, 0.0000, 0.0000); //CJ_DF_WORKTOP_3
    SetDynamicObjectMaterial(g_Object[210], 0, 2127, "cj_kitchen", "CJ_RED", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[210], 1, 10041, "archybuild10", "whitedecosfe1", 0xFFFFFFFF);
    g_Object[211] = CreateDynamicObject(19923, 978.8408, -2129.5036, -4.0647, 0.0000, 0.0000, 0.0000); //MKIslandCooker1
    g_Object[212] = CreateDynamicObject(19926, 980.6867, -2129.7497, -4.0063, 0.0000, 0.0000, 90.0000); //MKWorkTop2
    g_Object[213] = CreateDynamicObject(2123, 991.5820, -2132.7368, -3.3843, 0.0000, 0.0000, 90.0000); //SWANK_DIN_CHAIR_4
    SetDynamicObjectMaterial(g_Object[213], 1, 1355, "break_s_bins", "CJ_RED_LEATHER", 0xFFFFFFFF);
    g_Object[214] = CreateDynamicObject(19926, 982.4766, -2129.7497, -4.0063, 0.0000, 0.0000, 90.0000); //MKWorkTop2
    g_Object[215] = CreateDynamicObject(2123, 992.6627, -2132.7368, -3.3843, 0.0000, 0.0000, 90.0000); //SWANK_DIN_CHAIR_4
    SetDynamicObjectMaterial(g_Object[215], 1, 1355, "break_s_bins", "CJ_RED_LEATHER", 0xFFFFFFFF);
    g_Object[216] = CreateDynamicObject(19916, 976.5161, -2131.9875, -4.0942, 0.0000, 0.0000, 90.0000); //CutsceneFridge1
    g_Object[217] = CreateDynamicObject(2123, 990.5110, -2132.7368, -3.3843, 0.0000, 0.0000, 90.0000); //SWANK_DIN_CHAIR_4
    SetDynamicObjectMaterial(g_Object[217], 1, 1355, "break_s_bins", "CJ_RED_LEATHER", 0xFFFFFFFF);
    g_Object[218] = CreateDynamicObject(2123, 989.4801, -2132.7368, -3.3843, 0.0000, 0.0000, 90.0000); //SWANK_DIN_CHAIR_4
    SetDynamicObjectMaterial(g_Object[218], 1, 1355, "break_s_bins", "CJ_RED_LEATHER", 0xFFFFFFFF);
    g_Object[219] = CreateDynamicObject(2123, 989.4801, -2134.9990, -3.3843, 0.0000, 0.0000, 270.0000); //SWANK_DIN_CHAIR_4
    SetDynamicObjectMaterial(g_Object[219], 1, 1355, "break_s_bins", "CJ_RED_LEATHER", 0xFFFFFFFF);
    g_Object[220] = CreateDynamicObject(2123, 988.1808, -2134.0280, -3.3643, 0.0000, 0.0000, 180.0000); //SWANK_DIN_CHAIR_4
    SetDynamicObjectMaterial(g_Object[220], 1, 1355, "break_s_bins", "CJ_RED_LEATHER", 0xFFFFFFFF);
    g_Object[221] = CreateDynamicObject(2123, 990.5310, -2134.9990, -3.3843, 0.0000, 0.0000, 270.0000); //SWANK_DIN_CHAIR_4
    SetDynamicObjectMaterial(g_Object[221], 1, 1355, "break_s_bins", "CJ_RED_LEATHER", 0xFFFFFFFF);
    g_Object[222] = CreateDynamicObject(2123, 991.6713, -2134.9990, -3.3843, 0.0000, 0.0000, 270.0000); //SWANK_DIN_CHAIR_4
    SetDynamicObjectMaterial(g_Object[222], 1, 1355, "break_s_bins", "CJ_RED_LEATHER", 0xFFFFFFFF);
    g_Object[223] = CreateDynamicObject(1502, 975.5340, -2135.5908, -5.6809, 0.0000, 0.0000, 0.0000); //Gen_doorINT04
    SetDynamicObjectMaterial(g_Object[223], 1, 2246, "plants_office", "cooker3", 0xFFFFFFFF);
    g_Object[224] = CreateDynamicObject(1723, 1002.4482, -2153.8471, -3.9308, 0.0000, 0.0000, 180.0000); //mrk_seating1
    g_Object[225] = CreateDynamicObject(2123, 993.8634, -2134.0280, -3.3643, 0.0000, 0.0000, 0.0000); //SWANK_DIN_CHAIR_4
    SetDynamicObjectMaterial(g_Object[225], 1, 1355, "break_s_bins", "CJ_RED_LEATHER", 0xFFFFFFFF);
    g_Object[226] = CreateDynamicObject(19862, 988.2785, -2157.8500, 2.0796, 0.0000, 0.0000, 180.0000); //MIHouse1GarageDoor2
    SetDynamicObjectMaterialText(g_Object[226], 0, "House", 90, "Arial", 90, 1, 0xFF5F0A15, 0x0, 0);
    g_Object[227] = CreateDynamicObject(19862, 982.6081, -2157.8500, 2.0796, 0.0000, 0.0000, 180.0000); //MIHouse1GarageDoor2
    SetDynamicObjectMaterialText(g_Object[227], 0, "Is", 90, "Arial", 90, 1, 0xFF5F0A15, 0x0, 0);
    g_Object[228] = CreateDynamicObject(19862, 992.7788, -2157.8500, 2.1396, 0.0000, 0.0000, 180.0000); //MIHouse1GarageDoor2
    SetDynamicObjectMaterialText(g_Object[228], 0, "Hello", 90, "Arial", 90, 1, 0xFF5F0A15, 0x0, 0);
    g_Object[229] = CreateDynamicObject(19862, 981.0083, -2157.8500, 2.0796, 0.0000, 0.0000, 180.0000); //MIHouse1GarageDoor2
    SetDynamicObjectMaterialText(g_Object[229], 0, "Grays", 90, "Arial", 90, 1, 0xFF5F0A15, 0x0, 0);
    g_Object[230] = CreateDynamicObject(1723, 999.3583, -2152.5759, -3.9308, 0.0000, 0.0000, 90.0000); //mrk_seating1
    g_Object[231] = CreateDynamicObject(1723, 1003.5576, -2150.5844, -3.9308, 0.0000, 0.0000, 270.0000); //mrk_seating1
    g_Object[232] = CreateDynamicObject(3462, 1005.8245, -2146.2329, -2.7341, 0.0000, 0.0000, 0.0000); //csrangel_lvs
    g_Object[233] = CreateDynamicObject(3462, 1005.8245, -2141.7695, -2.7341, 0.0000, 0.0000, 0.0000); //csrangel_lvs
    g_Object[234] = CreateDynamicObject(3462, 1007.2917, -2143.8588, -3.3237, 0.0000, 0.0000, 0.0000); //csrangel_lvs
    g_Object[235] = CreateDynamicObject(2311, 1000.5690, -2152.8115, -3.9679, 0.0000, 0.0000, 0.0000); //CJ_TV_TABLE2
    g_Object[236] = CreateDynamicObject(3525, 1005.8230, -2141.8193, -2.6406, 0.0000, 0.0000, 0.0000); //exbrtorch01
    g_Object[237] = CreateDynamicObject(2311, 1000.6094, -2152.8115, -3.9679, 0.0000, 0.0000, 90.0000); //CJ_TV_TABLE2
    g_Object[238] = CreateDynamicObject(2311, 1002.1102, -2152.8115, -3.9679, 0.0000, 0.0000, 90.0000); //CJ_TV_TABLE2
    g_Object[239] = CreateDynamicObject(3525, 1005.8030, -2146.2023, -2.6406, 0.0000, 0.0000, 0.0000); //exbrtorch01
    return 0;
}