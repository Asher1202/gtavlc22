#include <YSI_Coding\y_hooks>

hook OnGameModeInit() {
    new g_Object[29];
    print("[map] grays2s.inc loaded.");
    g_Object[0] = CreateDynamicObject(9482, 1264.2513, -2046.2928, 64.5160, 0.0000, 0.0000, 87.0000); //chinagate
    g_Object[1] = CreateDynamicObject(987, 1246.6910, -2045.7218, 56.1767, 0.0000, 0.0000, 0.0000); //elecfence_BAR
    g_Object[2] = CreateDynamicObject(987, 1242.4405, -2033.8916, 56.1366, 0.0000, 0.0000, 270.0000); //elecfence_BAR
    g_Object[3] = CreateDynamicObject(987, 1242.4405, -2021.9510, 56.1366, 0.0000, 0.0000, 270.0000); //elecfence_BAR
    g_Object[4] = CreateDynamicObject(987, 1242.4405, -2010.0306, 56.1366, 0.0000, 0.0000, 270.0000); //elecfence_BAR
    g_Object[5] = CreateDynamicObject(987, 1254.0898, -2007.0703, 56.1366, 0.0000, 0.0000, 180.0000); //elecfence_BAR
    g_Object[6] = CreateDynamicObject(987, 1242.4405, -2006.9902, 56.1366, 0.0000, 0.0000, 270.0000); //elecfence_BAR
    g_Object[7] = CreateDynamicObject(987, 1266.0311, -2007.0703, 56.1366, 0.0000, 0.0000, 180.0000); //elecfence_BAR
    g_Object[8] = CreateDynamicObject(987, 1278.0012, -2007.0703, 56.1366, 0.0000, 0.0000, 180.0000); //elecfence_BAR
    g_Object[9] = CreateDynamicObject(987, 1280.9619, -2007.0703, 56.1366, 0.0000, 0.0000, 180.0000); //elecfence_BAR
    g_Object[10] = CreateDynamicObject(987, 1280.9619, -2018.7712, 56.1366, 0.0000, 0.0000, 90.0000); //elecfence_BAR
    g_Object[11] = CreateDynamicObject(987, 1280.9619, -2030.7220, 56.1366, 0.0000, 0.0000, 90.0000); //elecfence_BAR
    g_Object[12] = CreateDynamicObject(987, 1280.9619, -2042.6927, 56.1366, 0.0000, 0.0000, 90.0000); //elecfence_BAR
    g_Object[13] = CreateDynamicObject(987, 1280.9619, -2046.6131, 56.1366, 0.0000, 0.0000, 90.0000); //elecfence_BAR
    g_Object[14] = CreateDynamicObject(987, 1269.4903, -2046.6529, 56.1366, 0.0000, 0.0000, 0.0000); //elecfence_BAR
    g_Object[15] = CreateDynamicObject(987, 1242.3293, -2045.7218, 56.1767, 0.0000, 0.0000, 0.0000); //elecfence_BAR
    g_Object[16] = CreateDynamicObject(19458, 1264.3175, -2046.0656, 67.9283, 0.0000, 0.0000, 90.0000); //wall098
    SetDynamicObjectMaterial(g_Object[16], 0, 14668, "711c", "cj_white_wall2", 0xFFFFFFFF);
    g_Object[17] = CreateDynamicObject(19355, 1262.8083, -2046.1405, 67.5375, 0.0000, 0.0000, 90.0000); //wall003
    SetDynamicObjectMaterialText(g_Object[17], 0, "Hello House", 90, "Arial", 50, 1, 0xFF000000, 0x0, 1);
    g_Object[18] = CreateDynamicObject(3578, 1259.4923, -2012.6203, 59.0397, 0.0000, 0.0000, 90.0000); //DockBarr1_LA
    g_Object[19] = CreateDynamicObject(3578, 1267.8226, -2012.6203, 59.0397, 0.0000, 0.0000, 90.0000); //DockBarr1_LA
    g_Object[20] = CreateDynamicObject(19355, 1265.5987, -2046.1206, 67.5375, 0.0000, 0.0000, 90.0000); //wall003
    SetDynamicObjectMaterialText(g_Object[20], 0, "Is Grays", 90, "Arial", 50, 1, 0xFF000000, 0x0, 1);
    g_Object[21] = CreateDynamicObject(3578, 1248.0273, -2039.9973, 59.3149, 0.0000, 0.0000, 0.0000); //DockBarr1_LA
    g_Object[22] = CreateDynamicObject(3578, 1248.0273, -2034.6854, 59.3149, 0.0000, 0.0000, 0.0000); //DockBarr1_LA
    g_Object[23] = CreateDynamicObject(3578, 1248.0273, -2029.9842, 59.3149, 0.0000, 0.0000, 0.0000); //DockBarr1_LA
    g_Object[24] = CreateDynamicObject(3578, 1274.8482, -2029.9842, 58.6349, 0.0000, 0.0000, 0.0000); //DockBarr1_LA
    g_Object[25] = CreateDynamicObject(3578, 1274.8482, -2034.5548, 58.6349, 0.0000, 0.0000, 0.0000); //DockBarr1_LA
    g_Object[26] = CreateDynamicObject(3578, 1274.8482, -2039.7153, 58.6349, 0.0000, 0.0000, 0.0000); //DockBarr1_LA
    g_Object[27] = CreateDynamicObject(3472, 1253.6313, -2034.8266, 58.8903, 0.0000, 0.0000, 0.0000); //circuslampost03
    g_Object[28] = CreateDynamicObject(3472, 1269.4035, -2034.8266, 58.4202, 0.0000, 0.0000, 0.0000); //circuslampost03
}
