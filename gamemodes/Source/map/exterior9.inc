#include <YSI_Coding\y_hooks>

hook OnPlayerConnect(playerid) {
    RemoveBuildingForPlayer(playerid, 1696, 2327.1719, 1519.1328, 42.8359, 0.25);
    RemoveBuildingForPlayer(playerid, 1696, 2320.9766, 1387.4141, 42.8359, 0.25);
    RemoveBuildingForPlayer(playerid, 1696, 2333.7031, 1387.4141, 42.8359, 0.25);
}
 
hook OnGameModeInit() {
    print("[map] exterior9.inc loaded.");

    new g_Object[203];
    g_Object[0] = CreateDynamicObject(19452, 2282.0075, 1397.9875, 42.8417, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall092
    g_Object[1] = CreateDynamicObject(19452, 2272.4162, 1384.9576, 42.8417, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall092
    g_Object[2] = CreateDynamicObject(19452, 2272.4162, 1388.4265, 42.8417, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall092
    g_Object[3] = CreateDynamicObject(19452, 2272.4162, 1391.8851, 42.8417, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall092
    g_Object[4] = CreateDynamicObject(19452, 2272.4162, 1395.3253, 42.8417, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall092
    g_Object[5] = CreateDynamicObject(19452, 2272.4162, 1398.7646, 42.8417, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall092
    g_Object[6] = CreateDynamicObject(19943, 2296.3190, 1402.5648, 42.8978, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[6], 0, 16136, "des_telescopestuff", "stoneclad1", 0xFFFFFFFF);
    g_Object[7] = CreateDynamicObject(19452, 2282.0075, 1401.4565, 42.8417, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall092
    g_Object[8] = CreateDynamicObject(19452, 2291.6069, 1401.4565, 42.8417, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall092
    g_Object[9] = CreateDynamicObject(19452, 2282.0075, 1394.5179, 42.8417, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall092
    g_Object[10] = CreateDynamicObject(19452, 2282.0075, 1391.0279, 42.8417, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall092
    g_Object[11] = CreateDynamicObject(19452, 2282.0075, 1387.5777, 42.8417, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall092
    g_Object[12] = CreateDynamicObject(19452, 2282.0075, 1384.9681, 42.8417, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall092
    g_Object[13] = CreateDynamicObject(19452, 2291.6281, 1384.9681, 42.8417, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall092
    g_Object[14] = CreateDynamicObject(19452, 2291.6281, 1388.4283, 42.8417, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall092
    g_Object[15] = CreateDynamicObject(19452, 2291.6281, 1391.8879, 42.8417, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall092
    g_Object[16] = CreateDynamicObject(19452, 2291.6281, 1395.3879, 42.8417, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall092
    g_Object[17] = CreateDynamicObject(19452, 2291.6281, 1398.3481, 42.8417, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall092
    g_Object[18] = CreateDynamicObject(19450, 2267.7219, 1388.0620, 44.6454, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //wall090
    g_Object[19] = CreateDynamicObject(19450, 2267.7219, 1397.6717, 44.6454, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //wall090
    g_Object[20] = CreateDynamicObject(19450, 2291.6064, 1383.3115, 44.6454, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall090
    g_Object[21] = CreateDynamicObject(19450, 2272.5227, 1383.3115, 44.6454, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall090
    g_Object[22] = CreateDynamicObject(19943, 2267.4709, 1402.7347, 42.8978, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[22], 0, 16136, "des_telescopestuff", "stoneclad1", 0xFFFFFFFF);
    g_Object[23] = CreateDynamicObject(19450, 2282.0659, 1383.3115, 44.6454, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall090
    g_Object[24] = CreateDynamicObject(19450, 2272.4741, 1403.1223, 48.1254, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall090
    SetDynamicObjectMaterial(g_Object[24], 0, 3850, "carshowglass_sfsx", "ws_carshowwin1", 0xFFFFFFFF);
    g_Object[25] = CreateDynamicObject(19452, 2272.4162, 1401.4565, 42.8417, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall092
    g_Object[26] = CreateDynamicObject(19943, 2296.3190, 1383.6141, 42.8978, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[26], 0, 16136, "des_telescopestuff", "stoneclad1", 0xFFFFFFFF);
    g_Object[27] = CreateDynamicObject(19943, 2267.7861, 1383.7541, 42.8978, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[27], 0, 16136, "des_telescopestuff", "stoneclad1", 0xFFFFFFFF);
    g_Object[28] = CreateDynamicObject(19450, 2267.7219, 1388.6317, 48.0754, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //wall090
    g_Object[29] = CreateDynamicObject(19450, 2282.1245, 1383.3115, 48.0853, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall090
    SetDynamicObjectMaterial(g_Object[29], 0, 3850, "carshowglass_sfsx", "ws_carshowwin1", 0xFFFFFFFF);
    g_Object[30] = CreateDynamicObject(19450, 2272.5227, 1383.3115, 48.0853, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall090
    SetDynamicObjectMaterial(g_Object[30], 0, 3850, "carshowglass_sfsx", "ws_carshowwin1", 0xFFFFFFFF);
    g_Object[31] = CreateDynamicObject(19450, 2291.7260, 1383.3115, 48.0853, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall090
    SetDynamicObjectMaterial(g_Object[31], 0, 3850, "carshowglass_sfsx", "ws_carshowwin1", 0xFFFFFFFF);
    g_Object[32] = CreateDynamicObject(19450, 2291.7260, 1403.1223, 44.6355, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall090
    SetDynamicObjectMaterial(g_Object[32], 0, 3850, "carshowglass_sfsx", "ws_carshowwin1", 0xFFFFFFFF);
    g_Object[33] = CreateDynamicObject(19450, 2282.1054, 1403.1223, 44.6355, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall090
    SetDynamicObjectMaterial(g_Object[33], 0, 3850, "carshowglass_sfsx", "ws_carshowwin1", 0xFFFFFFFF);
    g_Object[34] = CreateDynamicObject(19450, 2272.4741, 1403.1223, 44.6355, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall090
    SetDynamicObjectMaterial(g_Object[34], 0, 3850, "carshowglass_sfsx", "ws_carshowwin1", 0xFFFFFFFF);
    g_Object[35] = CreateDynamicObject(19450, 2267.7126, 1398.0830, 48.0555, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //wall090
    g_Object[36] = CreateDynamicObject(19450, 2282.1054, 1403.1223, 48.1254, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall090
    SetDynamicObjectMaterial(g_Object[36], 0, 3850, "carshowglass_sfsx", "ws_carshowwin1", 0xFFFFFFFF);
    g_Object[37] = CreateDynamicObject(19943, 2287.2580, 1383.7541, 42.8978, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[37], 0, 16136, "des_telescopestuff", "stoneclad1", 0xFFFFFFFF);
    g_Object[38] = CreateDynamicObject(19943, 2277.4541, 1383.7541, 42.8978, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[38], 0, 16136, "des_telescopestuff", "stoneclad1", 0xFFFFFFFF);
    g_Object[39] = CreateDynamicObject(19450, 2296.4753, 1388.0522, 44.6454, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //wall090
    g_Object[40] = CreateDynamicObject(19450, 2296.4753, 1397.6230, 44.6454, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //wall090
    g_Object[41] = CreateDynamicObject(1557, 2296.5253, 1391.7081, 42.8939, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //Gen_doorEXT19
    g_Object[42] = CreateDynamicObject(1557, 2296.5253, 1394.7192, 42.8939, 0.0000, 0.0000, 270.0000, -1, -1, -1, 100.00, 100.00); //Gen_doorEXT19
    g_Object[43] = CreateDynamicObject(1557, 2296.4252, 1391.7081, 42.8939, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //Gen_doorEXT19
    g_Object[44] = CreateDynamicObject(1557, 2296.4152, 1394.7192, 42.8939, 0.0000, 0.0000, 270.0000, -1, -1, -1, 100.00, 100.00); //Gen_doorEXT19
    g_Object[45] = CreateDynamicObject(19466, 2296.6308, 1393.1787, 45.0665, 0.0000, 0.0000, 180.0000, -1, -1, -1, 100.00, 100.00); //window001
    SetDynamicObjectMaterialText(g_Object[45], 0, "BLACK IS HERE", 90, "Arial", 40, 1, 0xFF000000, 0x0, 0);

    g_Object[46] = CreateDynamicObject(19376, 2272.5500, 1388.5572, 46.0522, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall024
    g_Object[47] = CreateDynamicObject(19376, 2272.5500, 1397.7783, 46.0522, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall024
    g_Object[48] = CreateDynamicObject(19376, 2282.1423, 1397.7783, 46.0522, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall024
    g_Object[49] = CreateDynamicObject(19452, 2282.1477, 1390.8082, 46.0415, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall092
    g_Object[50] = CreateDynamicObject(19452, 2282.1477, 1388.1186, 46.0415, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall092
    g_Object[51] = CreateDynamicObject(19452, 2275.5354, 1385.1583, 46.0415, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall092
    g_Object[52] = CreateDynamicObject(14877, 2281.0476, 1384.8939, 44.0298, 0.0000, 0.0000, 180.0000, -1, -1, -1, 100.00, 100.00); //michelle-stairs
    SetDynamicObjectMaterial(g_Object[52], 0, 8037, "vgssmulticarprk", "vgsSstonewall01", 0xFFFFFFFF);
    g_Object[53] = CreateDynamicObject(19943, 2287.2580, 1386.6849, 42.8978, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[53], 0, 16136, "des_telescopestuff", "stoneclad1", 0xFFFFFFFF);
    g_Object[54] = CreateDynamicObject(19943, 2277.4438, 1386.6849, 42.8978, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[54], 0, 16136, "des_telescopestuff", "stoneclad1", 0xFFFFFFFF);
    g_Object[55] = CreateDynamicObject(19450, 2282.1245, 1386.4725, 48.0955, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall090
    SetDynamicObjectMaterial(g_Object[55], 0, 3850, "carshowglass_sfsx", "ws_carshowwin1", 0xFFFFFFFF);
    g_Object[56] = CreateDynamicObject(19450, 2282.5930, 1386.4829, 44.3554, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall090
    g_Object[57] = CreateDynamicObject(19450, 2282.1245, 1386.4725, 44.5955, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall090
    SetDynamicObjectMaterial(g_Object[57], 0, 3850, "carshowglass_sfsx", "ws_carshowwin1", 0xFFFFFFFF);
    g_Object[58] = CreateDynamicObject(19450, 2282.5930, 1386.4626, 44.3554, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall090
    g_Object[59] = CreateDynamicObject(19376, 2272.4399, 1397.7882, 49.7621, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall024
    SetDynamicObjectMaterial(g_Object[59], 0, 14534, "ab_wooziea", "dt_office_roof", 0xFFFFFFFF);
    g_Object[60] = CreateDynamicObject(19466, 2277.2463, 1385.2291, 45.0065, 0.0000, 0.0000, 180.0000, -1, -1, -1, 100.00, 100.00); //window001
    SetDynamicObjectMaterial(g_Object[60], 0, 4811, "beach_las", "sandstonemixb", 0xFFFFFFFF);
    g_Object[61] = CreateDynamicObject(19376, 2272.4399, 1388.5572, 49.7621, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall024
    SetDynamicObjectMaterial(g_Object[61], 0, 14534, "ab_wooziea", "dt_office_roof", 0xFFFFFFFF);
    g_Object[62] = CreateDynamicObject(19376, 2282.0659, 1397.7882, 49.7621, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall024
    SetDynamicObjectMaterial(g_Object[62], 0, 14534, "ab_wooziea", "dt_office_roof", 0xFFFFFFFF);
    g_Object[63] = CreateDynamicObject(19376, 2282.0659, 1388.5581, 49.7621, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall024
    SetDynamicObjectMaterial(g_Object[63], 0, 14534, "ab_wooziea", "dt_office_roof", 0xFFFFFFFF);
    g_Object[64] = CreateDynamicObject(19452, 2291.6069, 1401.4565, 46.0517, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall092
    SetDynamicObjectMaterial(g_Object[64], 0, 4811, "beach_las", "sandstonemixb", 0xFFFFFFFF);
    g_Object[65] = CreateDynamicObject(19452, 2291.6069, 1397.9973, 46.0517, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall092
    SetDynamicObjectMaterial(g_Object[65], 0, 4811, "beach_las", "sandstonemixb", 0xFFFFFFFF);
    g_Object[66] = CreateDynamicObject(19452, 2291.6069, 1394.5477, 46.0517, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall092
    SetDynamicObjectMaterial(g_Object[66], 0, 4811, "beach_las", "sandstonemixb", 0xFFFFFFFF);
    g_Object[67] = CreateDynamicObject(19452, 2291.6069, 1391.0876, 46.0517, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall092
    SetDynamicObjectMaterial(g_Object[67], 0, 4811, "beach_las", "sandstonemixb", 0xFFFFFFFF);
    g_Object[68] = CreateDynamicObject(19452, 2291.6069, 1387.5975, 46.0517, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall092
    SetDynamicObjectMaterial(g_Object[68], 0, 4811, "beach_las", "sandstonemixb", 0xFFFFFFFF);
    g_Object[69] = CreateDynamicObject(19452, 2291.6069, 1385.0069, 46.0517, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall092
    SetDynamicObjectMaterial(g_Object[69], 0, 4811, "beach_las", "sandstonemixb", 0xFFFFFFFF);
    g_Object[70] = CreateDynamicObject(19466, 2286.9208, 1385.2291, 48.7663, 0.0000, 0.0000, 180.0000, -1, -1, -1, 100.00, 100.00); //window001
    SetDynamicObjectMaterial(g_Object[70], 0, 4811, "beach_las", "sandstonemixb", 0xFFFFFFFF);
    g_Object[71] = CreateDynamicObject(19466, 2286.9208, 1385.2291, 47.0363, 0.0000, 0.0000, 180.0000, -1, -1, -1, 100.00, 100.00); //window001
    SetDynamicObjectMaterial(g_Object[71], 0, 4811, "beach_las", "sandstonemixb", 0xFFFFFFFF);
    g_Object[72] = CreateDynamicObject(19806, 2281.1713, 1384.9786, 48.8777, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //Chandelier1
    g_Object[73] = CreateDynamicObject(19466, 2277.2463, 1385.2291, 43.0764, 0.0000, 0.0000, 180.0000, -1, -1, -1, 100.00, 100.00); //window001
    SetDynamicObjectMaterial(g_Object[73], 0, 4811, "beach_las", "sandstonemixb", 0xFFFFFFFF);
    g_Object[74] = CreateDynamicObject(19943, 2277.4438, 1393.2556, 42.8978, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[74], 0, 16136, "des_telescopestuff", "stoneclad1", 0xFFFFFFFF);
    g_Object[75] = CreateDynamicObject(1502, 2274.0163, 1393.2292, 42.8619, 0.0000, 0.0000, 180.0000, -1, -1, -1, 100.00, 100.00); //Gen_doorINT04
    SetDynamicObjectMaterial(g_Object[75], 1, 4829, "airport_las", "liftdoorsac256", 0xFFFFFFFF);
    g_Object[76] = CreateDynamicObject(19450, 2277.2624, 1388.0504, 44.3454, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //wall090
    SetDynamicObjectMaterial(g_Object[76], 0, 13691, "bevcunto2_lahills", "stonewall3_la", 0xFFFFFFFF);
    g_Object[77] = CreateDynamicObject(19943, 2267.7995, 1393.2556, 42.8978, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[77], 0, 16136, "des_telescopestuff", "stoneclad1", 0xFFFFFFFF);
    g_Object[78] = CreateDynamicObject(19431, 2274.7199, 1393.1871, 44.3622, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall071
    SetDynamicObjectMaterial(g_Object[78], 0, 13691, "bevcunto2_lahills", "stonewall3_la", 0xFFFFFFFF);
    g_Object[79] = CreateDynamicObject(19431, 2276.3110, 1393.1871, 44.3622, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall071
    SetDynamicObjectMaterial(g_Object[79], 0, 13691, "bevcunto2_lahills", "stonewall3_la", 0xFFFFFFFF);
    g_Object[80] = CreateDynamicObject(19431, 2268.8254, 1393.1871, 44.3622, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall071
    SetDynamicObjectMaterial(g_Object[80], 0, 13691, "bevcunto2_lahills", "stonewall3_la", 0xFFFFFFFF);
    g_Object[81] = CreateDynamicObject(19431, 2270.4157, 1393.1871, 44.3622, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall071
    SetDynamicObjectMaterial(g_Object[81], 0, 13691, "bevcunto2_lahills", "stonewall3_la", 0xFFFFFFFF);
    g_Object[82] = CreateDynamicObject(19431, 2277.4221, 1392.2556, 47.7022, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //wall071
    SetDynamicObjectMaterial(g_Object[82], 0, 13691, "bevcunto2_lahills", "stonewall3_la", 0xFFFFFFFF);
    g_Object[83] = CreateDynamicObject(1502, 2271.1838, 1393.2292, 42.8619, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //Gen_doorINT04
    SetDynamicObjectMaterial(g_Object[83], 1, 4829, "airport_las", "liftdoorsac256", 0xFFFFFFFF);
    g_Object[84] = CreateDynamicObject(19431, 2276.3110, 1393.1871, 47.7022, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall071
    SetDynamicObjectMaterial(g_Object[84], 0, 13691, "bevcunto2_lahills", "stonewall3_la", 0xFFFFFFFF);
    g_Object[85] = CreateDynamicObject(19431, 2274.6923, 1393.1871, 47.7022, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall071
    SetDynamicObjectMaterial(g_Object[85], 0, 13691, "bevcunto2_lahills", "stonewall3_la", 0xFFFFFFFF);
    g_Object[86] = CreateDynamicObject(1502, 2274.0163, 1393.2292, 46.0820, 0.0000, 0.0000, 180.0000, -1, -1, -1, 100.00, 100.00); //Gen_doorINT04
    SetDynamicObjectMaterial(g_Object[86], 1, 4829, "airport_las", "liftdoorsac256", 0xFFFFFFFF);
    g_Object[87] = CreateDynamicObject(1502, 2271.1638, 1393.2292, 46.0718, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //Gen_doorINT04
    SetDynamicObjectMaterial(g_Object[87], 1, 4829, "airport_las", "liftdoorsac256", 0xFFFFFFFF);
    g_Object[88] = CreateDynamicObject(19431, 2270.4157, 1393.1871, 47.7122, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall071
    SetDynamicObjectMaterial(g_Object[88], 0, 13691, "bevcunto2_lahills", "stonewall3_la", 0xFFFFFFFF);
    g_Object[89] = CreateDynamicObject(19431, 2268.8247, 1393.1871, 47.7122, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall071
    SetDynamicObjectMaterial(g_Object[89], 0, 13691, "bevcunto2_lahills", "stonewall3_la", 0xFFFFFFFF);
    g_Object[90] = CreateDynamicObject(19431, 2277.4221, 1390.6756, 47.7022, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //wall071
    SetDynamicObjectMaterial(g_Object[90], 0, 13691, "bevcunto2_lahills", "stonewall3_la", 0xFFFFFFFF);
    g_Object[91] = CreateDynamicObject(19431, 2277.4221, 1389.1053, 47.7022, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //wall071
    SetDynamicObjectMaterial(g_Object[91], 0, 13691, "bevcunto2_lahills", "stonewall3_la", 0xFFFFFFFF);
    g_Object[92] = CreateDynamicObject(19431, 2277.4221, 1387.5146, 47.7022, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //wall071
    SetDynamicObjectMaterial(g_Object[92], 0, 13691, "bevcunto2_lahills", "stonewall3_la", 0xFFFFFFFF);
    g_Object[93] = CreateDynamicObject(1502, 2277.6948, 1383.6976, 46.0718, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //Gen_doorINT04
    SetDynamicObjectMaterial(g_Object[93], 1, 4829, "airport_las", "liftdoorsac256", 0xFFFFFFFF);
    g_Object[94] = CreateDynamicObject(1502, 2277.6948, 1386.5478, 46.0718, 0.0000, 0.0000, 270.0000, -1, -1, -1, 100.00, 100.00); //Gen_doorINT04
    SetDynamicObjectMaterial(g_Object[94], 1, 4829, "airport_las", "liftdoorsac256", 0xFFFFFFFF);
    g_Object[95] = CreateDynamicObject(19450, 2286.8708, 1398.4233, 47.9654, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //wall090
    SetDynamicObjectMaterial(g_Object[95], 0, 13691, "bevcunto2_lahills", "stonewall3_la", 0xFFFFFFFF);
    g_Object[96] = CreateDynamicObject(1502, 2286.9462, 1386.7684, 46.0521, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //Gen_doorINT04
    SetDynamicObjectMaterial(g_Object[96], 1, 4829, "airport_las", "liftdoorsac256", 0xFFFFFFFF);
    g_Object[97] = CreateDynamicObject(19450, 2286.8708, 1394.3730, 47.9654, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //wall090
    SetDynamicObjectMaterial(g_Object[97], 0, 13691, "bevcunto2_lahills", "stonewall3_la", 0xFFFFFFFF);
    g_Object[98] = CreateDynamicObject(1502, 2286.9462, 1389.6300, 46.0521, 0.0000, 0.0000, 270.0000, -1, -1, -1, 100.00, 100.00); //Gen_doorINT04
    SetDynamicObjectMaterial(g_Object[98], 1, 4829, "airport_las", "liftdoorsac256", 0xFFFFFFFF);
    g_Object[99] = CreateDynamicObject(19450, 2291.7260, 1403.1330, 48.0853, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall090
    SetDynamicObjectMaterial(g_Object[99], 0, 3850, "carshowglass_sfsx", "ws_carshowwin1", 0xFFFFFFFF);
    g_Object[100] = CreateDynamicObject(14608, 2269.4267, 1388.6085, 47.6067, 0.0000, 0.0000, -129.0000, -1, -1, -1, 100.00, 100.00); //triad_buddha01
    g_Object[101] = CreateDynamicObject(3525, 2268.1342, 1386.2187, 48.2122, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //exbrtorch01
    g_Object[102] = CreateDynamicObject(3525, 2268.1342, 1390.3891, 48.2122, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //exbrtorch01
    g_Object[103] = CreateDynamicObject(19943, 2287.0996, 1389.9256, 42.8978, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //StonePillar1
    SetDynamicObjectMaterial(g_Object[103], 0, 16136, "des_telescopestuff", "stoneclad1", 0xFFFFFFFF);
    g_Object[104] = CreateDynamicObject(19431, 2287.2155, 1387.4969, 44.3622, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //wall071
    SetDynamicObjectMaterial(g_Object[104], 0, 13691, "bevcunto2_lahills", "stonewall3_la", 0xFFFFFFFF);
    g_Object[105] = CreateDynamicObject(19431, 2287.2155, 1389.1063, 44.3622, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //wall071
    SetDynamicObjectMaterial(g_Object[105], 0, 13691, "bevcunto2_lahills", "stonewall3_la", 0xFFFFFFFF);
    g_Object[106] = CreateDynamicObject(19431, 2285.9746, 1389.9371, 44.3622, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall071
    SetDynamicObjectMaterial(g_Object[106], 0, 13691, "bevcunto2_lahills", "stonewall3_la", 0xFFFFFFFF);
    g_Object[107] = CreateDynamicObject(19431, 2284.3935, 1389.9371, 44.3622, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall071
    SetDynamicObjectMaterial(g_Object[107], 0, 13691, "bevcunto2_lahills", "stonewall3_la", 0xFFFFFFFF);
    g_Object[108] = CreateDynamicObject(19431, 2282.8420, 1389.9371, 44.3622, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall071
    SetDynamicObjectMaterial(g_Object[108], 0, 13691, "bevcunto2_lahills", "stonewall3_la", 0xFFFFFFFF);
    g_Object[109] = CreateDynamicObject(19431, 2281.2509, 1389.9371, 44.3622, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall071
    SetDynamicObjectMaterial(g_Object[109], 0, 13691, "bevcunto2_lahills", "stonewall3_la", 0xFFFFFFFF);
    g_Object[110] = CreateDynamicObject(19431, 2279.6699, 1389.9371, 44.3622, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall071
    SetDynamicObjectMaterial(g_Object[110], 0, 13691, "bevcunto2_lahills", "stonewall3_la", 0xFFFFFFFF);
    g_Object[111] = CreateDynamicObject(1502, 2277.3735, 1389.9088, 42.8819, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //Gen_doorINT04
    SetDynamicObjectMaterial(g_Object[111], 1, 4829, "airport_las", "liftdoorsac256", 0xFFFFFFFF);
    g_Object[112] = CreateDynamicObject(1742, 2267.6811, 1385.0174, 42.9356, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //Med_BOOKSHELF
    g_Object[113] = CreateDynamicObject(11731, 2272.7653, 1385.0184, 42.9039, 0.0000, 0.0000, 180.0000, -1, -1, -1, 100.00, 100.00); //WHeartBed1
    g_Object[114] = CreateDynamicObject(1742, 2267.6811, 1386.5174, 42.9356, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //Med_BOOKSHELF
    g_Object[115] = CreateDynamicObject(1742, 2267.6811, 1387.9073, 42.9356, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //Med_BOOKSHELF
    g_Object[116] = CreateDynamicObject(1742, 2267.6811, 1389.3270, 42.9356, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //Med_BOOKSHELF
    g_Object[117] = CreateDynamicObject(1742, 2267.6811, 1390.7268, 42.9356, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //Med_BOOKSHELF
    g_Object[118] = CreateDynamicObject(1742, 2267.6811, 1392.1871, 42.9356, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //Med_BOOKSHELF
    g_Object[119] = CreateDynamicObject(1723, 2276.7001, 1389.7020, 42.8148, 0.0000, 0.0000, 270.0000, -1, -1, -1, 100.00, 100.00); //mrk_seating1
    g_Object[120] = CreateDynamicObject(1723, 2276.7001, 1392.5029, 42.8148, 0.0000, 0.0000, 270.0000, -1, -1, -1, 100.00, 100.00); //mrk_seating1
    g_Object[121] = CreateDynamicObject(2311, 2269.8405, 1397.7500, 42.9300, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //CJ_TV_TABLE2
    g_Object[122] = CreateDynamicObject(1828, 2272.4738, 1389.3646, 42.9291, 0.0000, 0.0000, 270.0000, -1, -1, -1, 100.00, 100.00); //man_sdr_rug
    g_Object[123] = CreateDynamicObject(19786, 2267.7998, 1398.2778, 44.9789, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //LCDTVBig1
    g_Object[124] = CreateDynamicObject(2311, 2269.8405, 1398.6507, 42.9300, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //CJ_TV_TABLE2
    g_Object[125] = CreateDynamicObject(2311, 2272.2307, 1398.6507, 42.9300, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //CJ_TV_TABLE2
    g_Object[126] = CreateDynamicObject(2311, 2272.2307, 1397.7801, 42.9300, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //CJ_TV_TABLE2
    g_Object[127] = CreateDynamicObject(1724, 2268.4296, 1397.5731, 42.8787, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //mrk_seating1b
    g_Object[128] = CreateDynamicObject(1724, 2269.6508, 1400.1341, 42.8787, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //mrk_seating1b
    g_Object[129] = CreateDynamicObject(1724, 2270.7719, 1400.1341, 42.8787, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //mrk_seating1b
    g_Object[130] = CreateDynamicObject(1724, 2271.8725, 1400.1341, 42.8787, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //mrk_seating1b
    g_Object[131] = CreateDynamicObject(1724, 2272.9633, 1400.1341, 42.8787, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //mrk_seating1b
    g_Object[132] = CreateDynamicObject(1724, 2270.5710, 1396.1728, 42.8787, 0.0000, 0.0000, 180.0000, -1, -1, -1, 100.00, 100.00); //mrk_seating1b
    g_Object[133] = CreateDynamicObject(1724, 2271.7121, 1396.1728, 42.8787, 0.0000, 0.0000, 180.0000, -1, -1, -1, 100.00, 100.00); //mrk_seating1b
    g_Object[134] = CreateDynamicObject(1724, 2271.7121, 1396.1728, 42.8787, 0.0000, 0.0000, 180.0000, -1, -1, -1, 100.00, 100.00); //mrk_seating1b
    g_Object[135] = CreateDynamicObject(1724, 2272.8630, 1396.1728, 42.8787, 0.0000, 0.0000, 180.0000, -1, -1, -1, 100.00, 100.00); //mrk_seating1b
    g_Object[136] = CreateDynamicObject(1724, 2273.9641, 1396.1728, 42.8787, 0.0000, 0.0000, 180.0000, -1, -1, -1, 100.00, 100.00); //mrk_seating1b
    g_Object[137] = CreateDynamicObject(3471, 2295.5046, 1395.3081, 44.1371, 0.0000, 0.0000, 180.0000, -1, -1, -1, 100.00, 100.00); //vgschinalion1
    g_Object[138] = CreateDynamicObject(3471, 2295.4846, 1391.1468, 44.1371, 0.0000, 0.0000, 180.0000, -1, -1, -1, 100.00, 100.00); //vgschinalion1
    g_Object[139] = CreateDynamicObject(14565, 2273.9921, 1402.0872, 48.1158, 0.0000, 0.0000, 270.0000, -1, -1, -1, 100.00, 100.00); //triad_bar_stuff
    g_Object[140] = CreateDynamicObject(19376, 2291.7287, 1397.7882, 49.7621, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall024
    SetDynamicObjectMaterial(g_Object[140], 0, 14534, "ab_wooziea", "dt_office_roof", 0xFFFFFFFF);
    g_Object[141] = CreateDynamicObject(19376, 2291.7287, 1388.5582, 49.7621, 0.0000, 90.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //wall024
    SetDynamicObjectMaterial(g_Object[141], 0, 14534, "ab_wooziea", "dt_office_roof", 0xFFFFFFFF);
    g_Object[142] = CreateDynamicObject(19929, 2269.2153, 1401.6563, 46.1152, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //MKWorkTop5
    g_Object[143] = CreateDynamicObject(19929, 2272.0761, 1401.6563, 46.1152, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //MKWorkTop5
    g_Object[144] = CreateDynamicObject(19929, 2274.9367, 1401.6563, 46.1152, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //MKWorkTop5
    g_Object[145] = CreateDynamicObject(19929, 2277.7780, 1401.6563, 46.1152, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //MKWorkTop5
    g_Object[146] = CreateDynamicObject(19929, 2280.6281, 1401.6563, 46.1152, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //MKWorkTop5
    g_Object[147] = CreateDynamicObject(19929, 2281.4489, 1401.6563, 46.1152, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //MKWorkTop5
    g_Object[148] = CreateDynamicObject(19929, 2278.5983, 1401.8165, 47.8452, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[148], 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[149] = CreateDynamicObject(19929, 2281.4489, 1401.8165, 47.8452, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[149], 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[150] = CreateDynamicObject(19929, 2275.7687, 1401.8165, 47.8452, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[150], 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[151] = CreateDynamicObject(19929, 2272.9160, 1401.8165, 47.8452, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[151], 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[152] = CreateDynamicObject(19929, 2270.0737, 1401.8165, 47.8452, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[152], 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[153] = CreateDynamicObject(19929, 2269.2629, 1401.8165, 47.8452, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[153], 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[154] = CreateDynamicObject(11687, 2268.6101, 1400.5976, 46.1533, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //CBarStool1
    g_Object[155] = CreateDynamicObject(11687, 2269.9108, 1400.5976, 46.1533, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //CBarStool1
    g_Object[156] = CreateDynamicObject(11687, 2271.3117, 1400.5976, 46.1533, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //CBarStool1
    g_Object[157] = CreateDynamicObject(11687, 2272.6530, 1400.5976, 46.1533, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //CBarStool1
    g_Object[158] = CreateDynamicObject(11687, 2274.0942, 1400.5976, 46.1533, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //CBarStool1
    g_Object[159] = CreateDynamicObject(11687, 2275.4450, 1400.5976, 46.1533, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //CBarStool1
    g_Object[160] = CreateDynamicObject(11687, 2276.8664, 1400.5976, 46.1533, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //CBarStool1
    g_Object[161] = CreateDynamicObject(11687, 2278.1577, 1400.5976, 46.1533, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //CBarStool1
    g_Object[162] = CreateDynamicObject(11687, 2279.6491, 1400.5976, 46.1533, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //CBarStool1
    g_Object[163] = CreateDynamicObject(11687, 2281.2104, 1400.5976, 46.1533, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //CBarStool1
    g_Object[164] = CreateDynamicObject(11687, 2282.6113, 1400.5976, 46.1533, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //CBarStool1
    g_Object[165] = CreateDynamicObject(970, 2296.4575, 1386.1401, 46.8117, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //fencesmallb
    g_Object[166] = CreateDynamicObject(970, 2296.4575, 1390.2701, 46.8117, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //fencesmallb
    g_Object[167] = CreateDynamicObject(970, 2296.4575, 1394.3901, 46.8117, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //fencesmallb
    g_Object[168] = CreateDynamicObject(970, 2296.4575, 1398.5106, 46.8117, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //fencesmallb
    g_Object[169] = CreateDynamicObject(970, 2296.4575, 1400.5709, 46.8117, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //fencesmallb
    g_Object[170] = CreateDynamicObject(19452, 2298.2102, 1397.7980, 42.3725, 0.0000, 105.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //wall092
    SetDynamicObjectMaterial(g_Object[170], 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[171] = CreateDynamicObject(3578, 2302.9948, 1402.7141, 42.5086, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //DockBarr1_LA
    g_Object[172] = CreateDynamicObject(19452, 2298.2102, 1388.2481, 42.3725, 0.0000, 105.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //wall092
    SetDynamicObjectMaterial(g_Object[172], 0, 3820, "boxhses_sfsx", "stonewall_la", 0xFFFFFFFF);
    g_Object[173] = CreateDynamicObject(3578, 2302.9948, 1407.3142, 42.5086, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //DockBarr1_LA
    g_Object[174] = CreateDynamicObject(3578, 2302.9948, 1411.1544, 42.5086, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //DockBarr1_LA
    g_Object[175] = CreateDynamicObject(3578, 2302.9948, 1414.6943, 42.5086, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //DockBarr1_LA
    g_Object[176] = CreateDynamicObject(3578, 2302.9948, 1418.4348, 42.5086, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //DockBarr1_LA
    g_Object[177] = CreateDynamicObject(3578, 2302.9948, 1421.8751, 42.5086, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //DockBarr1_LA
    g_Object[178] = CreateDynamicObject(3578, 2302.9948, 1425.5146, 42.5086, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //DockBarr1_LA
    g_Object[179] = CreateDynamicObject(3578, 2302.9948, 1429.0753, 42.5086, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //DockBarr1_LA
    g_Object[180] = CreateDynamicObject(3578, 2310.2697, 1389.3785, 42.5256, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //DockBarr1_LA
    g_Object[181] = CreateDynamicObject(3578, 2314.7211, 1389.3785, 42.5256, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //DockBarr1_LA
    g_Object[182] = CreateDynamicObject(3578, 2318.8737, 1389.3785, 42.5256, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //DockBarr1_LA
    g_Object[183] = CreateDynamicObject(3578, 2322.8056, 1389.3785, 42.5256, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //DockBarr1_LA
    g_Object[184] = CreateDynamicObject(3578, 2326.8991, 1389.3785, 42.5256, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //DockBarr1_LA
    g_Object[185] = CreateDynamicObject(3578, 2331.3530, 1389.3785, 42.5256, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //DockBarr1_LA
    g_Object[186] = CreateDynamicObject(3578, 2335.8842, 1389.3785, 42.5256, 0.0000, 0.0000, 90.0000, -1, -1, -1, 100.00, 100.00); //DockBarr1_LA
    g_Object[187] = CreateDynamicObject(3472, 2335.8432, 1394.8343, 42.0800, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //circuslampost03
    g_Object[188] = CreateDynamicObject(3472, 2347.1838, 1394.8343, 42.0800, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //circuslampost03
    g_Object[189] = CreateDynamicObject(3472, 2331.3029, 1394.8343, 42.0800, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //circuslampost03
    g_Object[190] = CreateDynamicObject(3472, 2326.8420, 1394.8343, 42.0800, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //circuslampost03
    g_Object[191] = CreateDynamicObject(3472, 2322.7602, 1394.8343, 42.0800, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //circuslampost03
    g_Object[192] = CreateDynamicObject(3472, 2318.8596, 1394.8343, 42.0800, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //circuslampost03
    g_Object[193] = CreateDynamicObject(3472, 2314.6779, 1394.8343, 42.0800, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //circuslampost03
    g_Object[194] = CreateDynamicObject(3472, 2310.2365, 1394.8343, 42.0800, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //circuslampost03
    g_Object[195] = CreateDynamicObject(3472, 2308.3964, 1402.7551, 42.0800, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //circuslampost03
    g_Object[196] = CreateDynamicObject(3472, 2308.3964, 1407.3358, 42.0800, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //circuslampost03
    g_Object[197] = CreateDynamicObject(3472, 2308.3964, 1411.1563, 42.0800, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //circuslampost03
    g_Object[198] = CreateDynamicObject(3472, 2308.3964, 1414.7364, 42.0800, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //circuslampost03
    g_Object[199] = CreateDynamicObject(3472, 2308.3964, 1418.4672, 42.0800, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //circuslampost03
    g_Object[200] = CreateDynamicObject(3472, 2308.3964, 1421.9074, 42.0800, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //circuslampost03
    g_Object[201] = CreateDynamicObject(3472, 2308.3964, 1425.5383, 42.0800, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //circuslampost03
    g_Object[202] = CreateDynamicObject(3472, 2308.3964, 1429.0684, 42.0800, 0.0000, 0.0000, 0.0000, -1, -1, -1, 100.00, 100.00); //circuslampost03
}