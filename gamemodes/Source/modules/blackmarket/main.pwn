/*
	* Objects By OTACON

*/
#define MAX_BLACKMARKETITEM 150

new Iterator:bmProduct<MAX_BLACKMARKETITEM>;

enum bmInfo {
	bmID,
	bmType,
	bmSQLID,
	bmSellerSQLID,
	bmAmount,
	bmSAD,
	bmGP
}
new BlackMarketInfo[MAX_BLACKMARKETITEM][bmInfo];

stock CreateBlackMarketObject(Float:x,Float:y,Float:z,Float:a){
	if(CountBm>=MAX_BM)return false;
    CountBm++;
	//otros
	BmObject[CountBm][0]=CreateObject(19300, 309.64999, 1827.71790, 16.63540,   0.00000, 0.00000, 0.00000);
	BmObject[CountBm][1]=CreateObject(841, 309.22369, 1831.88953, 16.69970,   0.00000, 0.00000, 0.00000);
	BmObject[CountBm][2]=CreateObject(841, 309.22369, 1831.88953, 16.69970,   0.00000, 0.00000, 76.00000);
	BmObject[CountBm][3]=CreateObject(841, 309.22369, 1831.88953, 16.69970,   0.00000, 0.00000, 149.00000);
	BmObject[CountBm][5]=CreateObject(18688, 309.12091, 1831.89697, 15.53580,   0.00000, 0.00000, 0.00000);
	BmObject[CountBm][6]=CreateObject(1281, 307.06400, 1825.51147, 17.43860,   0.00000, 0.00000, 90.00000);
	BmObject[CountBm][7]=CreateObject(3119, 306.98322, 1825.67725, 17.72950,   0.00000, 0.00000, -55.00000);
	BmObject[CountBm][8]=CreateObject(1370, 314.04535, 1824.03284, 17.20480,   0.00000, 0.00000, 0.00000);
	BmObject[CountBm][9]=CreateObject(1220, 313.99738, 1822.29041, 17.00860,   0.00000, 0.00000, 0.00000);
	BmObject[CountBm][10]=CreateObject(1220, 314.13629, 1823.18933, 17.00860,   0.00000, 0.00000, -11.00000);
	BmObject[CountBm][11]=CreateObject(1220, 314.00919, 1827.55420, 17.00860,   0.00000, 0.00000, 0.00000);
	BmObject[CountBm][12]=CreateObject(1220, 310.41464, 1827.40930, 17.00860,   0.00000, 0.00000, 0.00000);
	BmObject[CountBm][13]=CreateObject(3119, 314.37982, 1830.49329, 16.94750,   0.00000, 0.00000, -156.00000);
	BmObject[CountBm][14]=CreateObject(1220, 314.07486, 1828.73547, 17.00860,   0.00000, 0.00000, 40.00000);
	BmObject[CountBm][15]=CreateObject(349, 312.55099, 1826.56604, 17.19990,   69.00000, -4.00000, 86.00000);
	BmObject[CountBm][16]=CreateObject(347, 313.96811, 1827.36511, 17.34890,   69.00000, 33.00000, 86.00000);
	BmObject[CountBm][17]=CreateObject(347, 314.11807, 1827.25049, 17.34890,   69.00000, 33.00000, 86.00000);
	BmObject[CountBm][18]=CreateObject(1220, 309.07526, 1822.31531, 17.00860,   0.00000, 0.00000, 11.00000);
	BmObject[CountBm][19]=CreateObject(1220, 309.11325, 1823.18738, 17.00860,   0.00000, 0.00000, -2.00000);
	BmObject[CountBm][20]=CreateObject(2226, 307.81601, 1826.09961, 17.11780,   0.00000, 0.00000, 99.00000);
	BmObject[CountBm][21]=CreateObject(1265, 309.27954, 1828.07727, 17.07260,   0.00000, 0.00000, 0.00000);
	BmObject[CountBm][22]=CreateObject(2674, 308.82733, 1828.01672, 16.67070,   0.00000, 0.00000, 280.00000);
	BmObject[CountBm][23]=CreateObject(2674, 308.59909, 1822.75769, 16.67070,   0.00000, 0.00000, 280.00000);
	BmObject[CountBm][24]=CreateObject(2675, 314.76166, 1826.96948, 16.71070,   0.00000, 0.00000, 215.00000);
	BmObject[CountBm][25]=CreateObject(2674, 306.85934, 1831.50134, 16.67070,   0.00000, 0.00000, 280.00000);
	BmObject[CountBm][26]=CreateObject(2674, 311.39514, 1832.03796, 16.67070,   0.00000, 0.00000, 280.00000);
	BmObject[CountBm][27]=CreateObject(1544, 307.23172, 1830.62488, 17.20720,   0.00000, 0.00000, 0.00000);
	BmObject[CountBm][28]=CreateObject(1544, 311.27390, 1831.59717, 17.20720,   0.00000, 0.00000, 0.00000);
	BmObject[CountBm][29]=CreateObject(1544, 311.04810, 1832.66846, 16.64720,   0.00000, 0.00000, 0.00000);
	BmObject[CountBm][30]=CreateObject(1544, 311.44269, 1832.80554, 16.64720,   0.00000, 0.00000, 0.00000);
	BmObject[CountBm][31]=CreateObject(2114, 307.06149, 1826.76563, 16.75140,   0.00000, 0.00000, 0.00000);
	BmObject[CountBm][32]=CreateObject(2114, 306.64496, 1826.91589, 16.75140,   0.00000, 0.00000, 0.00000);
	BmObject[CountBm][33]=CreateObject(2805, 307.63596, 1833.62769, 17.18640,   0.00000, 0.00000, 0.00000);
	BmObject[CountBm][34]=CreateObject(2804, 309.65308, 1831.65540, 18.46040,   -90.00000, 0.00000, -32.00000);
	BmObject[CountBm][35]=CreateObject(2804, 309.31732, 1831.97778, 18.46040,   -90.00000, 0.00000, -32.00000);
	BmObject[CountBm][36]=CreateObject(2804, 308.98053, 1832.27246, 18.46040,   -90.00000, 0.00000, -32.00000);
	BmObject[CountBm][37]=CreateObject(18632, 306.55414, 1830.47681, 16.74740,   180.00000, 26.00000, 207.00000);
	BmObject[CountBm][38]=CreateObject(18632, 306.60620, 1830.36890, 16.74740,   180.00000, 26.00000, 207.00000);
	BmObject[CountBm][39]=CreateObject(18632, 306.64035, 1830.25195, 16.74740,   180.00000, 26.00000, 207.00000);
	BmObject[CountBm][40]=CreateObject(2864, 306.93115, 1825.70532, 17.45210,   0.00000, 0.00000, 0.00000);
	BmObject[CountBm][41]=CreateObject(2863, 306.76468, 1825.27625, 17.45210,   0.00000, 0.00000, 0.00000);
	BmObject[CountBm][42]=CreateObject(2852, 310.45197, 1827.41333, 17.35810,   0.00000, 0.00000, 0.00000);
	BmObject[CountBm][43]=CreateObject(2844, 312.00867, 1826.49011, 16.65310,   0.00000, 0.00000, 0.00000);
	BmObject[CountBm][44]=CreateObject(2843, 310.91702, 1826.76746, 16.65310,   0.00000, 0.00000, -178.00000);
	BmObject[CountBm][45]=CreateObject(323, 310.27969, 1823.99805, 16.94830,   0.00000, 90.00000, 76.00000);
	BmObject[CountBm][46]=CreateObject(321, 310.41483, 1824.22131, 16.94830,   0.00000, 90.00000, 76.00000);
	//bolsos carpa
	BmObject[CountBm][47]=CreateObject(1550, 310.25449, 1826.72754, 17.03370,   0.00000, 0.00000, 0.00000);
	BmObject[CountBm][48]=CreateObject(1550, 310.16809, 1826.17139, 16.82970,   0.00000, 90.00000, 265.00000);
	//sillas
	BmObject[CountBm][49]=CreateObject(2121, 310.02151, 1829.67651, 17.15670,   0.00000, 0.00000, 179.00000);
	BmObject[CountBm][50]=CreateObject(2121, 309.18134, 1829.70996, 17.15670,   0.00000, 0.00000, 200.00000);
	BmObject[CountBm][51]=CreateObject(2121, 311.36627, 1831.60779, 17.15670,   0.00000, 0.00000, -112.00000);
	BmObject[CountBm][52]=CreateObject(2121, 311.33826, 1832.58765, 17.15670,   0.00000, 0.00000, -91.00000);
	BmObject[CountBm][53]=CreateObject(2121, 307.19360, 1830.67285, 17.15670,   0.00000, 0.00000, 113.00000);
	BmObject[CountBm][54]=CreateObject(2121, 307.08627, 1831.59216, 17.15670,   0.00000, 0.00000, 76.00000);
	BmObject[CountBm][55]=CreateObject(2121, 312.73245, 1826.76624, 17.15670,   0.00000, 0.00000, -90.00000);
	for(new index=49; index<56; index++) SetObjectMaterial(BmObject[CountBm][index], 0, 1281, "benches", "pierdoor02_law", -1);
	//cuerdas
	BmObject[CountBm][56]=CreateObject(19087, 307.79419, 1833.44189, 18.78920,   0.00000, 90.00000, 135.00000);
	BmObject[CountBm][57]=CreateObject(19087, 308.87219, 1832.36987, 18.78920,   0.00000, 90.00000, 135.00000);
	BmObject[CountBm][58]=CreateObject(19089, 311.72137, 1828.64319, 19.62920,   0.00000, -42.00000, 90.00000);
	BmObject[CountBm][59]=CreateObject(19089, 311.72141, 1822.50464, 19.62920,   0.00000, 42.00000, 90.00000);
	BmObject[CountBm][60]=CreateObject(19089, 311.67493, 1823.13049, 19.86420,   0.00000, -53.00000, 0.00000);
	BmObject[CountBm][61]=CreateObject(19089, 311.67303, 1827.79321, 19.86420,   0.00000, -53.00000, 0.00000);
	BmObject[CountBm][62]=CreateObject(19089, 311.65009, 1827.76843, 19.86420,   0.00000, -53.00000, 180.00000);
	BmObject[CountBm][63]=CreateObject(19089, 311.63867, 1823.11316, 19.86420,   0.00000, -53.00000, 180.00000);
	for(new index=56; index<64; index++) SetObjectMaterial(BmObject[CountBm][index], 0, -1, "none", "none", 0xFF808484);
	//palos fogata
	BmObject[CountBm][64]=CreateObject(1251, 310.61270, 1830.58606, 15.53550,   90.00000, 0.00000, 0.00000);
	BmObject[CountBm][65]=CreateObject(1251, 307.87411, 1833.35156, 15.53550,   90.00000, 0.00000, 0.00000);
	for(new index=64; index<67; index++) SetObjectMaterial(BmObject[CountBm][index], 0, 841, "gta_brokentrees", "CJ_bark", -1);
	//camas carpa
	BmObject[CountBm][67]=CreateObject(1646, 310.20544, 1823.86487, 16.78320,   0.00000, 0.00000, 180.00000);
	BmObject[CountBm][68]=CreateObject(1646, 312.31110, 1824.50134, 16.78320,   0.00000, 0.00000, -90.00000);
	BmObject[CountBm][69]=CreateObject(1646, 312.31107, 1825.72351, 16.78320,   0.00000, 0.00000, -90.00000);
	BmObject[CountBm][70]=CreateObject(1646, 314.25800, 1830.57471, 16.78320,   0.00000, 0.00000, -154.00000);
	for(new index=67; index<71; index++) SetObjectMaterial(BmObject[CountBm][index], 25, -1, "none", "none", -1);
	for(new index=67; index<71; index++) SetObjectMaterial(BmObject[CountBm][index], 26, -1, "none", "none", -1);
	//carpa
	BmObject[CountBm][71]=CreateObject(19325, 312.76309, 1825.48145, 18.11690,   0.00000, -32.00000, 0.00000);
	BmObject[CountBm][72]=CreateObject(19325, 310.53009, 1825.48145, 18.11690,   0.00000, 34.00000, 0.00000);
	BmObject[CountBm][73]=CreateObject(19325, 311.59631, 1825.51514, 16.65890,   0.00000, 90.00000, 0.00000);
	for(new index=71; index<74; index++) SetObjectMaterial(BmObject[CountBm][index], 0, 3066, "ammotrx", "ammotrn92tarp128", -1);
	//entrada carpa
	BmObject[CountBm][74]=CreateObject(2068, 310.92621, 1829.37927, 14.26150,   138.00000, 105.00000, 78.00000);
	BmObject[CountBm][75]=CreateObject(2068, 312.47238, 1821.60352, 14.26150,   138.00000, 105.00000, 260.00000);
	BmObject[CountBm][76]=CreateObject(2068, 312.40381, 1828.17834, 14.26150,   138.00000, 105.00000, -99.00000);
	BmObject[CountBm][77]=CreateObject(2068, 311.01590, 1822.85583, 14.26150,   138.00000, 105.00000, 79.00000);
	for(new index=74; index<78; index++) SetObjectMaterial(BmObject[CountBm][index], 0, -1, "none", "none", 0xFF808484);
	//luces carpa
	BmObject[CountBm][78]=CreateObject(2074, 311.69241, 1824.52930, 19.50400,   0.00000, 0.00000, 0.00000);
	BmObject[CountBm][79]=CreateObject(2074, 311.71283, 1826.09229, 19.50400,   0.00000, 0.00000, 0.00000);
	
	for(new index=1; index<MAX_BMOBJ; index++){
		new Float:pos[2][6];
		GetObjectPos(BmObject[CountBm][0],pos[0][0],pos[0][1],pos[0][2]);
		GetObjectPos(BmObject[CountBm][index],pos[1][0],pos[1][1],pos[1][2]);
		GetObjectRot(BmObject[CountBm][index],pos[1][3],pos[1][4],pos[1][5]);
		AttachObjectToObject(BmObject[CountBm][index], BmObject[CountBm][0], floatsub(pos[1][0], pos[0][0]),floatsub(pos[1][1], pos[0][1]),floatsub(pos[1][2], pos[0][2]), pos[1][3],pos[1][4],pos[1][5], 1);
	}
	SetObjectPos(BmObject[CountBm][0],x,y,z-0.9);
	SetObjectRot(BmObject[CountBm][0],0.00000, 0.00000, a-180);
	return true;
}
stock DestroyBlackMarketObject(){
	if(CountBm<=0)return false;
	for(new i=0; i<MAX_BMOBJ; i++) DestroyObject(BmObject[CountBm][i]);
	CountBm--;
	return true;
}
CMD:setbm(playerid, params[]){
    new Float:pos[4];
    GetPlayerPos(playerid,pos[0],pos[1],pos[2]);
    GetPlayerFacingAngle(playerid,pos[3]);
    pos[0] = pos[0] + (2.0 * floatsin(-pos[3], degrees));
    pos[1] = pos[1] + (2.0 * floatcos(-pos[3], degrees));
    
    if(CreateBlackMarketObject(pos[0],pos[1],pos[2],pos[3])) return va_SendClientMessage(playerid, -1, "Blackmarket %d da duoc tao thanh cong", CountBm);
	else return va_SendClientMessage(playerid, COLOR_RED, "So luong Black Market da dat gioi han. (%d)", MAX_BM);    
}
CMD:delbm(playerid, params[]){
	if(DestroyBlackMarketObject()) SendClientMessage(playerid, COLOR_YELLOW, "Black Market da duoc xoa thanh cong.");
		else SendClientMessage(playerid, COLOR_RED, "Khong co blackmarket dang hoat dong.");
	return 1;
}

// AddProductToBlackMarket(playerid, slot, ) {
// 	return 1;
// }
stock GetNameBySQLID(id) {
	new query[100], name[MAX_PLAYER_NAME];
	FORMAT:query("SELECT name FROM `users` WHERE `id` = '%d'", id);
	new Cache: x = mysql_query(SQL, query);
	cache_get_value_name(0, "name", name);
	cache_delete(x);
	return name;
}
LoadBlackMarket() {
	new query[500];
	new Cache:x = mysql_query(SQL, "SELECT * FROM `blackmarket`");
	for(new i, j = cache_num_rows(); i < j; i++) {
		Iter_Add(bmProduct, i);

		cache_get_value_name_int(0, "ID", BlackMarketInfo[i][bmSQLID]);
		cache_get_value_name_int(0, "Type", BlackMarketInfo[i][bmType]);
		cache_get_value_name_int(0, "SAD", BlackMarketInfo[i][bmSAD]);
		cache_get_value_name_int(0, "GangPoints", BlackMarketInfo[i][bmGP]);
		cache_get_value_name_int(0, "SellerSQLID", BlackMarketInfo[i][bmSellerSQLID]);
		cache_get_value_name_int(0, "Amount", BlackMarketInfo[i][bmAmount]);

		printf("[LOAD BLACKMARKET ITEM] SQLID: %d, Item Name: %s", BlackMarketInfo[i][bmSQLID], ItemName[BlackMarketInfo[i][bmType]]);
	}
	cache_delete(x);
}
ShowBlackMarket(playerid) {
	new tit[50], str[500], str2[60], price[60];
	FORMAT:tit("{FFFFFF}"SERVER_NAME": {230140}Black Market");
	FORMAT:str("Ten vat pham\tSo luong\tNguoi ban\tGia\n");
	foreach(new i: bmProduct) {
		if(BlackMarketInfo[i][bmSAD] > 0) FORMAT:price("{FAD744}${FFFFFF}%s ", FormatNumber(BlackMarketInfo[i][bmSAD]));
		if(BlackMarketInfo[i][bmGP] > 0) FORMAT:price("%s%s {3CC194}GP", price, FormatNumber(BlackMarketInfo[i][bmGP])); 
		FORMAT:str2("%s\t%d\t%s\t%s\n", ItemName[BlackMarketInfo[i][bmType]], BlackMarketInfo[i][bmAmount], GetNameBySQLID(BlackMarketInfo[i][bmSellerSQLID]), price);
		strcat(str, str2);
	}
	Dialog_Show(playerid, BLACKMARKET+2, DIALOG_STYLE_TABLIST_HEADERS, tit, str, "OK", "Exit");
	return 1;
}
CMD:additem(playerid, params[]) {
	// Dialog_Show(playerid, ADD_BLACKMARKET_ITEM, DIALOG_STYLE_TABLIST_HEADERS, "");
	return 1;
}
CMD:blackmarket(playerid, params[]) {
	Dialog_Show(playerid, BLACKMARKET, DIALOG_STYLE_LIST, "Black Market - The Underground Market", "Xem vat pham\nBan vat pham\nVat pham cua toi", "Xem", "Thoat");
	return 1;
}
case BLACKMARKET: {
	if(!response) return 1;
	if(listitem == 1) {
		FORMAT:string("Chao mung ban den cho den. Da so hang o cho den la hang cam, hay can than khi su dung chung vi ban co the vao tu vi chung.");
		Dialog_Show(playerid, BLACKMARKET+1, DIALOG_STYLE_MSGBOX, string, "Tiep tuc", "Tro ve");
	} else if(listitem == 2) {

	} else if(listitem == 3) {

	}
}
case BLACKMARKET+1: {
	if(!response) return Dialog_Show(playerid, BLACKMARKET, DIALOG_STYLE_LIST, "Black Market - The Underground Market", "Xem vat pham\nBan vat pham\nVat pham cua toi", "Xem", "Thoat");
	ShowBlackMarket(playerid);
}
case BLACKMARKET+2: {
	// Mua hang
	if(!response) return ShowBlackMarket(playerid);
	Dialog_Show(playerid, BLACKMARKET+3, DIALOG_STYLE_LIST, "Chon", "Mua\nGui email cho nguoi ban hang", "Chon", "Tro ve");
	return 1;
}
case BLACKMARKET+3: {
	return 1;
}