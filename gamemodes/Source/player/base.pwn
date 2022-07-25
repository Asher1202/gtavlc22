 #include <Pawn.CMD>

#include "Source/player/anim.pwn"
#include "Source/player/event.pwn"
#include "Source/player/leader.pwn"
#include "Source/player/hitman"

alias:exchange("traodoi")
alias:nduty("hduty")
alias:setstatus("tuyendung")
alias:unrentroom("traphong")
alias:frisk("lucsoat")
alias:friends("banbe","ketban")
alias:fill("doxang")
alias:rb("raidinh")
alias:clothes("trangphuc")
alias:findapartament("timho")
alias:paintleave("leavepaint")
alias:code("giftcode")
alias:lc("l")
alias:government("gov")
alias:megaphone("m")
alias:radio("r")
alias:departments("d")
alias:suspect("su")
alias:bizmenu("bmenu")
alias:fightstyle("buyfightstyle")
alias:housemenu("hmenu")
alias:fpk("auninvite")
alias:respawn("spawn")
alias:fvrespawn("fvr")
alias:checkvehicles("checkv","cv")
alias:closereport("cr")
alias:acceptreport("ar")
alias:newbie("n")
alias:setstat("set")
alias:fixveh("fv")
alias:locations("gps")
alias:pickup("p")
alias:hangup("h")
alias:unrentveh("unrent")
alias:ajail("jail")
alias:myblacklist("mybl")
alias:blacklist("bl")
alias:clanchat("c")
alias:startwork("work","getmats")
alias:time("playedtime","giochoi")
alias:s("shout","het")
alias:as("ashout")
alias:show("hud")
alias:tazer("ta")
alias:ticket("vephat")

alias:factions("tochuc")
alias:stats("thongtin")
alias:changepass("doimatkhau")
alias:licenses("giayphepcuatoi")
alias:buylevel("muacapdo")
alias:report("baocao")
alias:pay("tra")
alias:showlicenses("xemgiayphep")
alias:accept("chapnhan")
alias:cancel("tuchoi")
alias:service("dichvu")
alias:eject("moiraxe")
alias:whisper("w")
alias:ad("quangcao")
alias:balance("taikhoan")
alias:withdraw("ruttien")
alias:deposit("guitien")
alias:transfer("chuyentien")
alias:lock("khoa")
alias:park("dauxe")
alias:sellcarto("banxecho")
alias:findcar("timxe")
alias:sellhouseto("bannhacho")
alias:editfurniture("suanoithat")
alias:furniture("noithat")
alias:sellbizto("banbizcho")
alias:arrest("batgiu")
alias:cuff("congtay")
alias:untie("coitroi")
alias:uncuff("mocong")
alias:wanted("truyna")
alias:confiscate("tichthu")
alias:nearwanted("toiphamganday")
alias:mycontract("hopdongcuatoi")
alias:gethit("chapnhanhopdong")
alias:contracts("xemhopdong")
alias:undercover("caitrang")
alias:fare("gia")
alias:rentroom("thuephong")
alias:killcp("xoamuctieu")
alias:turfs("diaban")
alias:examen("thibanglai")
alias:tpevent("gotoevent")
// alias:achievements("thanhtuu")
alias:icecream("ankem")
alias:propose("kethon")
alias:divorce("lyhon")
alias:missions("nhiemvu","quests")
alias:contract("hopdong")
alias:jobs("timvieclam")
alias:sc("ha")
alias:findhouse("timnha")
alias:findbiz("timbiz")
alias:help("trogiup")
alias:trade("giaodich")
alias:myreferrals("gioithieubanbe")
// alias:bonus("nhanqua")
alias:fish("cauca")
alias:engine("khoidong")
alias:puthelmet("ph", "sb")

CMD:puthelmet(playerid, params[]) {
	new szMessage[180];
	if(!IsPlayerInAnyVehicle(playerid)) return 1;
	if(!IsABike2(GetPlayerVehicleID(playerid))) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the doi mu bao hiem trong chiec xe nay!");
	if(Helmet[playerid] == 1) {
		RemovePlayerAttachedObject(playerid, 3);
		Helmet[playerid] = 0;
		format(szMessage, sizeof(szMessage), "* %s thao mu bao hiem.", GetName(playerid));
		ProxDetector(30.0, playerid, szMessage, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
	}
	else {
		SetPlayerAttachedObject(playerid, 3, 18645, 2, 0.101, -0.0, 0.0, 5.50, 84.60, 83.7, 1, 1, 1);
		Helmet[playerid] = 1;
		format(szMessage, sizeof(szMessage), "* %s doi mu bao hiem.", GetName(playerid));
		ProxDetector(30.0, playerid, szMessage, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
	}
	return 1;
}
CMD:firework(playerid, params[])
{
    if(isnull(params)) return SendClientMessage(playerid, COLOR_LIGHTRED, "/firework [dat / ban]");
    if(strcmp(params, "dat", true) == 0)
    {
		if(PlayerInfo[playerid][pFire] <= 0) return SendClientMessage(playerid, COLOR_GOLD, "Ban khong co du phao hoa.");
		if(fireWork[playerid][0] == 5) return SendClientMessage(playerid, COLOR_GOLD, "Ban da dat so luong phao hoa toi da. (5/5)");
		if(fireWork[playerid][1] == 1) return SendClientMessage(playerid, COLOR_GOLD, "Doi cho den khi phao cua ban duoc khoi dong cho den khi tien hanh dat phao moi.");
		new Float:x, Float:y, Float:z, Float:a;
		new string[100];
		format(string, sizeof(string), "* %s vua dat mot cot phao khong lo.", GetName(playerid)), NearMessage(playerid, COLOR_PURPLE, string);
		GetPlayerPos(playerid, x, y, z), GetPlayerFacingAngle(playerid, a), x += (2 * floatsin(-a, degrees)), y += (2 * floatcos(-a, degrees));
		Rocket[playerid][fireWork[playerid][0]] = CreateObject(3786, x, y, z, 0, 90, 0), RocketLight[playerid][fireWork[playerid][0]] = CreateObject(354, x, y, z + 1, 0, 90, 0),
		RocketSmoke[playerid][fireWork[playerid][0]] = CreateObject(18716, x, y, z - 4, 0, 0, 0);
		Frx[playerid][fireWork[playerid][0]] = x, Fry[playerid][fireWork[playerid][0]] = y, Frz[playerid][fireWork[playerid][0]] = z, 
		RocketExplosions[playerid][fireWork[playerid][0]] = 0, fireWork[playerid][0]++, PlayerInfo[playerid][pFire]--;
		UpdateVar(playerid, "Firework", PlayerInfo[playerid][pFire]);
    }
    else if(strcmp(params, "ban", true) == 0)
    {
		if(fireWork[playerid][0] == 0) return SendClientMessage(playerid, COLOR_GOLD, "Ban khong dat bat ky phao hoa nao.");
		if(fireWork[playerid][1] == 1) return SendClientMessage(playerid, COLOR_GOLD, "Ban da khoi dong phao hoa.");
		for(new i = 0; i < fireWork[playerid][0]; i++)
		{
			CreateExplosion(Frx[playerid][i] ,Fry[playerid][i], Frz[playerid][i], 12, 5);
			new time = MoveObject(Rocket[playerid][i], Frx[playerid][i] ,Fry[playerid][i], Frz[playerid][i] + 73, 10);
			MoveObject(RocketLight[playerid][i], Frx[playerid][i] ,Fry[playerid][i], Frz[playerid][i] + 2 + 73, 10), MoveObject(RocketSmoke[playerid][i], Frx[playerid][i] ,Fry[playerid][i], Frz[playerid][i] + 73, 10);
			defer Firework[time](playerid, i);
		}
		fireWork[playerid][1] = 1;
    }
    return 1;
}
CMD:rainbowveh(playerid, params[]) {
 	if(PlayerInfo[playerid][pVip] == 0) return SendClientMessage(playerid, -1, "Ban khong phai la VIP");
    if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_WHITE, "{FF0000}[!]{FFFFFF} Ban khong o tren mot xe!"); // verifica daca esti intr-un vehicul
    if(IsPlayerInAnyVehicle(playerid) && GetPlayerVehicleSeat(playerid) != 0) return SendClientMessage(playerid, COLOR_WHITE, "{FF0000}[!]{FFFFFF} Ban phai lai xe. "); //verifica daca tu conduci
    if(DeelayCommand[playerid][0] > 0) return DeelayTime(playerid, 0); //delay khong lam dung
	new time;
	if(sscanf(params, "i", time)) return SendClientMessage(playerid, COLOR_GREEN, "Cu phap: {FFFFFF}/rainbowcar <time (miligiay)>");
	if(time < 0) return 1;
	stop TimerRainCar[playerid];
	TimerRainCar[playerid] = repeat RainbowChange[time](playerid);
    return 1;
}
CMD:rainbowvehoff(playerid, params[]) {
 	if(PlayerInfo[playerid][pVip] == 0) return SendClientMessage(playerid, -1, "Ban khong phai la VIP");
	if(DeelayCommand[playerid][0] > 0) return DeelayTime(playerid, 0); //deelay pentru a nu abuza
	DeelayCommand[playerid][0] = 60; //deelay pentru a nu abuza
    if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_WHITE, "{FF0000}[!]{FFFFFF} Ban khong o tren xe!"); //verifica daca esti intr-un vehicul
    if(IsPlayerInAnyVehicle(playerid) && GetPlayerVehicleSeat(playerid) != 0) return SendClientMessage(playerid, COLOR_WHITE, "{FF0000}[!]{FFFFFF} Ban khong lai xe. "); //verifica daca tu conduci masina
    stop TimerRainCar[playerid];
    SendClientMessage(playerid, COLOR_GREEN, "Ban da tat rainbow car!");
    return 1;
}
/*
CMD:bonus(playerid, params[]) {
	if(PlayerInfo[playerid][pLevel] >= 2) return SendClientMessage(playerid, COLOR_LIGHTRED, "Ban da nhan thuong newbie hoac ban da vuot qua cap do 2!");
	PlayerInfo[playerid][pLevel] = 2;
	Update(playerid, pLevelx);
	SetPlayerScore(playerid, PlayerInfo[playerid][pLevel]);
	GivePlayerCash(playerid, 300000);
	Update(playerid, pCashx);
	PlayerInfo[playerid][pPremiumPoints] += 10;
	Update(playerid, pPremiumPointsx);
	UpdateProgress(playerid, 0);
	Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "{00FF00}[!] {FFFFFF} PHAN THUONG TAN THU", "Premium Account 7 ngay\n+1 level up [level 2]\n+10 "#DIEMCAOCAP" [/shop]\n+$300.000\n\nChao mung ban den "SERVER_URL", hay di ket ban voi moi nguoi nhe!\nChuc ban online vui ve!\n\nGroup: "GROUP"\nFanpage: "FANPAGE"\n    {00ff00}Welcome to GTAVLC", "Close", "");
	return 1;
}*/
CMD:fish(playerid, params[]) {
	if(Inventory_Count(playerid, "Ca Thuong", 1) + Inventory_Count(playerid, "Ca Hiem", 1) + Inventory_Count(playerid, "Ca Vang", 1) + Inventory_Count(playerid, "Ca Map", 1) >= 1) return SendClientMessage(playerid, COLOR_GREY, "Ban da co 1 con ca trong tui roi, hay ban no tai 24/7 nhe");
	if(JobInfo[PlayerInfo[playerid][pJob]][jAttemptPerHour] <= 0) {
		return SendFailMessage(playerid, "Ho da het ca");
	}
	if(pFishing[playerid] != 0) return SendClientMessage(playerid, COLOR_YELLOW, "Ban dang cau ca roi, hay ban con ca trong balo cua minh truoc");
	TextDrawShowForPlayer(playerid, GUI_Box1);
	TextDrawShowForPlayer(playerid, GUI_LBox);
	TextDrawShowForPlayer(playerid, GUI_Logo);
	TextDrawShowForPlayer(playerid, GUI_Name);
	TextDrawShowForPlayer(playerid, GUI_Description);
	TextDrawShowForPlayer(playerid, GUI_IMG);
	PlayerTextDrawShow(playerid, GUI_Exit);
	PlayerTextDrawShow(playerid, GUI_Start);	
	SelectTextDraw(playerid, 0xFF0000FF);
	return 1;
}
CMD:hitxe(playerid, params[]) {
	if(IsACop(playerid))
	{
		ToggleVehicleSticky(GetPlayerVehicleID(playerid), true);
	}
	return 1;
}
// CMD:fish(playerid, params[]) {
// 	if(PlayerInfo[playerid][pJob] != 11 && PlayerInfo[playerid][pJob] != 15) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la Fisherman!");
// 	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Ban khong the tiep tuc neu ban khong xuong xe");
// 	if(VaildFishPlace(playerid) && !IsPlayerInAnyVehicle(playerid))
// 	{
// 		if(pFishess[playerid] > 0) return SendClientMessage(playerid,COLOR_WHITE,"Di den cua hang 24/7 de ban ca ma ban vua cau truoc khi cau ca lan nua.");
// 		if(StartFish[playerid] == 1) return SendClientMessage(playerid,-1,"Ban dang cau ca");
// 		GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~w~DANG CAU CA...",10000,3);
// 		if(IsPlayerInRangeOfPoint(playerid, 10,2000.5741,1563.2089,15.3672)) {
// 			FishTimer[playerid] = defer Fish[25000](playerid);
// 			SendClientMessage(playerid, COLOR_LIGHTRED, "Ca o khu vuc nay gan day bi khai thac qua muc, dan den mat can bang tu nhien.. ca it di...");
// 		}
// 		else FishTimer[playerid] = defer Fish[15000](playerid);
// 		TogglePlayerControllable(playerid, false);
// 		ApplyAnimation(playerid, "SAMP", "FishingIdle", 3.0,1,1,0,0,0);
// 		SetPlayerAttachedObject(playerid, 9, 18632,6,0.079376,0.037070,0.007706,181.482910,0.000000,0.000000,1.000000,1.000000,1.000000);
// 		StartFish[playerid] = 1;
// 		Freezed[playerid] = 1;
// 	}
// 	else return SendClientMessage(playerid, COLOR_WHITE, "Ban khong trong khu vuc cau ca. [/jobs > Fisherman]");
// 	return 1;
// }
CMD:catxe(playerid, params[]) return SendClientMessage(playerid, COLOR_LIGHTGREEN, "Lenh cat xe da duoc chuyen sang sang mot lenh khac, xin hay su dung /v -> chon xe -> cat xe");
CMD:topevent(playerid, params[]) {
	if(cadoumort == 0) return SendClientMessage(playerid, -1, "[GIFTBOX] Mon qua van chua bi pha huy!");
	SendClientMessage(playerid, COLOR_MONEY, "------Nguoi tham gia su kien------");
	foreach(new i: Player) if(dmgdat[i] >= 1) va_SendClientMessage(playerid, COLOR_MONEY, "%s (%d) - %s damage - [%s pp, %s rp, $%s]", GetName(i),i,FormatNumber(dmgdat[i]),FormatNumber(cadoupp[i]),FormatNumber(cadourp[i]),FormatNumber(cadoubani[i]));
	SendClientMessage(playerid, COLOR_MONEY, "---------------------------------------");
	return 1;
}
CMD:collectgift(playerid, params[]) {
	if(cadoumort == 0) return SendClientMessage(playerid, -1, "[GIFTBOX] Mon qua van chua bi pha huy!");
	if(cadoubani[playerid] <= 0) return SendClientMessage(playerid, -1, "Ban khong tham du su kien nay!");
	if(colectgf[playerid] == 1) return 1;
	new Float:pos[3];GetObjectPos(collectobject, pos[0],pos[1],pos[2]);
    if(!IsPlayerInRangeOfPoint(playerid, 10, pos[0],pos[1],pos[2])) return SendClientMessage(playerid, COLOR_WARNING, "[GIFTBOX] Ban phai o gan tui mau vang.");
	new string[100];
	format(string, sizeof(string), "%s (%d) - %s damage - [$%s, %s pp, %s rp]\n", GetName(playerid),playerid,FormatNumber(dmgdat[playerid]),FormatNumber(cadoubani[playerid]),FormatNumber(cadoupp[playerid]),FormatNumber(cadourp[playerid]));
	Dialog_Show(playerid, DIALOG_COLLECTCADOU, DIALOG_STYLE_LIST,"Gift Collect", string, "Collect", "");
	return 1;
}
CMD:swapcolors(playerid, params[])
{
	new color1,color2;
	if(GetVehicles(playerid) == 0) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Ban khong co phuong tien ca nhan!");
	if(GetPlayerCash(playerid) < 5000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co $5,000!");
	if(PersonalCar(playerid) == -1) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Ban khong o trong phuong tien ca nhan cua minh!");
	if(GetPlayerState(playerid) != 2) return SendClientMessage(playerid, COLOR_LGREEN, "* Ban phai lai xe de su dung lenh nay!");
	new idd = PersonalCar(playerid);
	color1 = CarInfo[idd][cColorOne];
	color2 = CarInfo[idd][cColorTwo];
	CarInfo[idd][cColorOne] = color2;
	CarInfo[idd][cColorTwo] = color1;
	ChangeVehicleColorEx(GetPlayerVehicleID(playerid), CarInfo[idd][cColorOne], CarInfo[idd][cColorTwo]);
	SendClientMessage(playerid, COLOR_WHITE, "Ban da thay doi 2 mau cua xe voi gia $5,000.");
	GivePlayerCash(playerid, -5000);
	// BizzInfo[InBussines[playerid]][bTill] += 5000;
	// mysql_format(SQL, string, sizeof(string), "UPDATE bizz SET Till = %d WHERE ID = %d",BizzInfo[InBussines[playerid]][bTill],5);
	// mysql_tquery(SQL, string, "", "");
    // mysql_format(SQL, string, sizeof(string), "UPDATE cars SET ColorOne='%d', ColorTwo='%d' WHERE ID=%d", color2, color1, idd);
	// mysql_tquery(SQL, string, "", "");	
	return 1;
}
CMD:carplate(playerid, params[]) {
	new string[128], plate[10];
	if(GetVehicles(playerid) == 0) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Ban khong co phuong tien ca nhan!");
	if(sscanf(params, "s[10]", plate)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/carplate <Car Plate>");
	if(PersonalCar(playerid) == -1) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Ban khong o trong phuong tien ca nhan cua minh!");
	new idd = PersonalCar(playerid);
	if(strfind(plate, "'", true) != -1 || strfind(plate, "Model", true) != -1 || strfind(plate, "`", true) != -1) return SendClientMessage(playerid, -1, "Ky tu khong hop le!");
	if(strlen(plate) > 10) return SendClientMessage(playerid, -1, "So dang ky xe khong vuot qua 10 ki tu!");
	if(idd == 0) return SendClientMessage(playerid, -1, "ERROR: {FFFFFF}Chiec xe nay khong phai cua ban!");
	if(CarInfo[idd][Spawned] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Xe cua ban chua duoc lay ra!");
	if(GetPlayerCash(playerid) < 5000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co $5,000!");
    SetVehicleNumberPlate(CarInfo[idd][Spawned], plate);
	GivePlayerCash(playerid, -5000);
	// BizzInfo[InBussines[playerid]][bTill] += 5000;
	format(string, sizeof(string), "So dang ky xe da duoc luu. No se hien thi vao lan tiep theo khi ban lay xe ra.");
	SendClientMessage(playerid, COLOR_LGREEN, string);
    format(string, sizeof(string), "%s", plate);
	if(PlayerInfo[playerid][pVip] > 0) format(CarInfo[idd][cLicense], 10, "{F0B548}%s", plate);
	else format(CarInfo[idd][cLicense], 10, "%s", plate);
    mysql_format(SQL, string, sizeof(string), "UPDATE cars SET License='%s' WHERE ID=%d", plate, idd);
	mysql_tquery(SQL, string, "", "");
	// mysql_format(SQL, string, sizeof(string), "UPDATE bizz SET Till = %d WHERE ID = %d",BizzInfo[InBussines[playerid]][bTill],5);
	// mysql_tquery(SQL, string, "", "");
	return 1;
}
CMD:lock(playerid, params[]) return LockCarFunction(playerid);

CMD:park(playerid, params[]) {
	new car = GetPlayerVehicleID(playerid);
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong xe cua ban.");
	if(GetVehicles(playerid) == 0) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co phuong tien ca nhan!");
	if(PersonalCar(playerid) == -1) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Ban khong o trong phuong tien ca nhan cua minh!");
	if(GetPlayerState(playerid) != 2) return SendClientMessage(playerid, COLOR_LGREEN, "* Ban phai lai xe de su dung lenh nay!");
	new idd = PersonalCar(playerid);
	new Float: vhp;
	GetVehicleHealth(car, vhp);
	if(vhp < 800) return SendClientMessage(playerid, COLOR_GREY, "Ban chi co the dau xe khi diem HP cua xe lon hon 800!");
	if(IsPlayerInRangeOfPoint(playerid, 50.0, SpawnPos[0], SpawnPos[1], SpawnPos[2])) return SendClientMessage(playerid, -1, "Ban khong the do xe o spawn civil.");
	new Float:x, Float:y, Float:z, Float:a;
	CheckVehicle(CarInfo[idd][Spawned]);
	saveTuning(playerid, CarInfo[idd][Spawned]);
	GetVehiclePos(car, x, y, z);
	GetVehicleZAngle(car, a);
	CarInfo[idd][cLocationx] = x;
	CarInfo[idd][cLocationy] = y;
	CarInfo[idd][cLocationz] = z;
	CarInfo[idd][cAngle] = a;
	VehicleOwned[CarInfo[idd][Spawned]] = 0;
	VehicleSQL[CarInfo[idd][Spawned]] = 0;
	
	DestroyVehicle(car);
	
	if(CarInfo[idd][cNeon] != INVALID_OBJECT_ID) {
		DestroyDynamicObject(neon[0][CarInfo[idd][Spawned]]);
		DestroyDynamicObject(neon[1][CarInfo[idd][Spawned]]);
		neon[0][CarInfo[idd][Spawned]] = INVALID_OBJECT_ID;
		neon[1][CarInfo[idd][Spawned]] = INVALID_OBJECT_ID;	
	}
	if(strlen(CarInfo[idd][cText]) >= 2) {
		DestroyDynamicObject(nameobject[CarInfo[idd][Spawned]]);
	}		
	CarInfo[idd][Spawned] = CreateVehicleEx(CarInfo[idd][cModel],CarInfo[idd][cLocationx],CarInfo[idd][cLocationy],CarInfo[idd][cLocationz],CarInfo[idd][cAngle],CarInfo[idd][cColorOne],CarInfo[idd][cColorTwo],-1);
	VehicleOwned[CarInfo[idd][Spawned]] = CarInfo[idd][Spawned];
	VehicleSQL[CarInfo[idd][Spawned]] = idd;	
	// if(CarInfo[idd][cNeon] != 0) {
	// 	new h = CarInfo[idd][Spawned];
	// 	if(CarInfo[idd][cNeon] == 1)
	// 	{
	// 		neon[0][h] = CreateDynamicObject(18648,0,0,0,0,0,0);
	// 		neon[1][h] = CreateDynamicObject(18648,0,0,0,0,0,0);
	// 	}
	// 	else if(CarInfo[idd][cNeon] == 2)
	// 	{
	// 		neon[0][h] = CreateDynamicObject(18649,0,0,0,0,0,0);
	// 		neon[1][h] = CreateDynamicObject(18649,0,0,0,0,0,0);
	// 	}
	// 	else if(CarInfo[idd][cNeon] == 3)
	// 	{
	// 		neon[0][h] = CreateDynamicObject(18650,0,0,0,0,0,0);
	// 		neon[1][h] = CreateDynamicObject(18650,0,0,0,0,0,0);
	// 	}
	// 	else if(CarInfo[idd][cNeon] == 4)
	// 	{
	// 		neon[0][h] = CreateDynamicObject(18652,0,0,0,0,0,0);
	// 		neon[1][h] = CreateDynamicObject(18652,0,0,0,0,0,0);
	// 	}
	// 	else if(CarInfo[idd][cNeon] == 5)
	// 	{
	// 		neon[0][h] = CreateDynamicObject(18651,0,0,0,0,0,0);
	// 		neon[1][h] = CreateDynamicObject(18651,0,0,0,0,0,0);
	// 	}
	// 	else if(CarInfo[idd][cNeon] == 6)
	// 	{
	// 		neon[0][h] = CreateDynamicObject(18647,0,0,0,0,0,0);
	// 		neon[1][h] = CreateDynamicObject(18647,0,0,0,0,0,0);
	// 	}
	// 	AttachDynamicObjectToVehicle(neon[0][h], h, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
	// 	AttachDynamicObjectToVehicle(neon[1][h], h, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
	// }									
	attach_vip_text(idd);
	
	SetTunning(idd);
	SetVehicleNumberPlate(CarInfo[idd][Spawned], CarInfo[idd][cLicense]);
	saveCar(idd);
	new Float: Pos[3];
	GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
	CarInfo[idd][cLastPos][0] = Pos[0];
	CarInfo[idd][cLastPos][1] = Pos[1];
	CarInfo[idd][cLastPos][2] = Pos[2];	
	return 1;
}
CMD:sellcarto(playerid, params[]) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: {FFFFFF} Lenh nay da duoc chuyen qua mot lenh khac la lenh /giaodich.");
CMD:changeneon(playerid, params[]) {
	// if(PlayerInfo[playerid][pAdmin] != 7) return 1;
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "ERROR: {FFFFFF}Ban khong o trong xe cua ban.");
	if(PersonalCar(playerid) == -1) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: {FFFFFF}Ban khong o trong phuong tien ca nhan cua minh!");
	if(GetPlayerState(playerid) != 2) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: {FFFFFF} Ban phai lai xe de su dung lenh nay!");
	new idd = PersonalCar(playerid);
	if(idd == 0) return SendClientMessage(playerid, COLOR_WHITE, "ERROR: {FFFFFF}Chiec xe nay khong phai cua ban!");
	if(CarInfo[idd][cNeon] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Ban khong co den neon cho chiec xe nay!");
	if(PlayerInfo[playerid][pPremiumPoints] < 25 && PlayerInfo[playerid][pVip] == 0) return Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Shop", "Ban khong co du "#DIEMCAOCAP" de mua san pham nay.", "Ok", "");
	Dialog_Show(playerid, DIALOG_CHANGENEON, DIALOG_STYLE_LIST, "Thay doi mau den neon (25 xu):","{1A28ED}Blue\n{00FF04}Green\n{FFFF00}Yellow\n{FFFFFF}White\n{FF00D0}Pink{FFFFFF}\n{FF0000}Red","Ok","Close");
	SendClientMessage(playerid, COLOR_LGREEN, "Thay doi mau sac cua neon se mat phi. Sau khi ban da chon mau cua minh, ban se phai tra 25 "#DIEMCAOCAP".");
	return 1;
}
CMD:neon(playerid, params[]) {
	new test[10];
	if(sscanf(params, "s[10]", test)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/neon <bat/tat>");
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong xe cua ban.");
	if(PersonalCar(playerid) == -1) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Ban khong o trong phuong tien ca nhan cua minh!");
	if(GetPlayerState(playerid) != 2) return SendClientMessage(playerid, COLOR_LGREEN, "* Ban phai lai xe de su dung lenh nay!");
	new idd = PersonalCar(playerid);
	if(idd == 0) return SendClientMessage(playerid, COLOR_WHITE, "ERROR: {FFFFFF}Chiec xe nay khong phai cua ban!");
	if(strfind(test, "tat", true) != -1) {
		if(neon[0][CarInfo[idd][Spawned]] != INVALID_OBJECT_ID) {
			DestroyDynamicObject(neon[0][CarInfo[idd][Spawned]]);
			DestroyDynamicObject(neon[1][CarInfo[idd][Spawned]]);
			neon[0][CarInfo[idd][Spawned]] = INVALID_OBJECT_ID;
			neon[1][CarInfo[idd][Spawned]] = INVALID_OBJECT_ID;
		} else SendClientMessage(playerid, -1, "Xe khong co gan den neon");
	} else {
		if(CarInfo[idd][cNeon] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Ban khong co den neon cho chiec xe nay!");		
		if(IsValidDynamicObject(neon[0][CarInfo[idd][Spawned]])) DestroyDynamicObject(neon[0][CarInfo[idd][Spawned]]);
		if(IsValidDynamicObject(neon[1][CarInfo[idd][Spawned]])) DestroyDynamicObject(neon[1][CarInfo[idd][Spawned]]);
		switch(CarInfo[idd][cNeon]) {
			case 1: {
				neon[0][CarInfo[idd][Spawned]] = CreateDynamicObject(18648,0,0,0,0,0,0);
				neon[1][CarInfo[idd][Spawned]] = CreateDynamicObject(18648,0,0,0,0,0,0);
			}
			case 2: {
				neon[0][CarInfo[idd][Spawned]] = CreateDynamicObject(18649,0,0,0,0,0,0);
				neon[1][CarInfo[idd][Spawned]] = CreateDynamicObject(18649,0,0,0,0,0,0);
			}
			case 3: {
				neon[0][CarInfo[idd][Spawned]] = CreateDynamicObject(18650,0,0,0,0,0,0);
				neon[1][CarInfo[idd][Spawned]] = CreateDynamicObject(18650,0,0,0,0,0,0);
			}
			case 4: {
				neon[0][CarInfo[idd][Spawned]] = CreateDynamicObject(18652,0,0,0,0,0,0);
				neon[1][CarInfo[idd][Spawned]] = CreateDynamicObject(18652,0,0,0,0,0,0);
			}
			case 5: {
				neon[0][CarInfo[idd][Spawned]] = CreateDynamicObject(18651,0,0,0,0,0,0);
				neon[1][CarInfo[idd][Spawned]] = CreateDynamicObject(18651,0,0,0,0,0,0);
			}
			case 6: {
				neon[0][CarInfo[idd][Spawned]] = CreateDynamicObject(18647,0,0,0,0,0,0);
				neon[1][CarInfo[idd][Spawned]] = CreateDynamicObject(18647,0,0,0,0,0,0);
			}
		}
		// CarInfo[idd][cNeon] = listitem+1;
		AttachDynamicObjectToVehicle(neon[0][CarInfo[idd][Spawned]], CarInfo[idd][Spawned], -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
		AttachDynamicObjectToVehicle(neon[1][CarInfo[idd][Spawned]], CarInfo[idd][Spawned], 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
		SendClientMessage(playerid, -1, "Thanh cong.");
	}
	return 1;
}

CMD:carcolor(playerid, params[])
{
	new string[128],part,color;
	if(GetVehicles(playerid) == 0) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Ban khong co phuong tien ca nhan!");
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong xe cua ban.");
	if(sscanf(params, "ii",part,color)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/carcolor <part (1/2)> <color>"), SendClientMessage(playerid, -1, "Su dung /colors de xem cac mau hien co.");
	if(GetPlayerCash(playerid) < 2500) return SendClientMessage(playerid, COLOR_WHITE, "Ban khong co $2,500!");
	new car = GetPlayerVehicleID(playerid);
	if(PersonalCar(playerid) == -1) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Ban khong o trong phuong tien ca nhan cua minh!");
	if(GetPlayerState(playerid) != 2) return SendClientMessage(playerid, COLOR_LGREEN, "* Ban phai lai xe de su dung lenh nay!");
	new idd = PersonalCar(playerid);
	if(part < 1 || part > 2) return 1;
	switch(part) {
		case 1: {
			if(color >= 127 && color <= 255 && CarInfo[idd][cColorOne] < 127) return SendClientMessage(playerid, -1, "De chon Hidden Color, hay su dung lenh /shop.");
			if(color < 0 || color > 255) return SendClientMessage(playerid, -1, "Mau khong hop le!");
			// if(CarInfo[idd][cColorOne] > 127) {
			// 	if(PlayerInfo[playerid][pPremiumPoints] < 100) return Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Shop", "Ban khong co du "#DIEMCAOCAP" de mua san pham nay.", "Ok", "");
			// 	PlayerInfo[playerid][pPremiumPoints] -= 100;
			// 	SendClientMessage(playerid, COLOR_GOLD, "Ban da thay doi mau an voi gia 100 "#DIEMCAOCAP"!");
			// 	Update(playerid, pPremiumPointsx);
			// }
			else SendClientMessage(playerid, COLOR_MONEY, "Ban da thay doi mau cua xe voi gia $2,500.");
			CarInfo[idd][cColorOne] = color;
			ChangeVehicleColorEx(car, color, CarInfo[idd][cColorTwo]);
			mysql_format(SQL, string, sizeof(string), "UPDATE cars SET ColorOne=%d WHERE ID=%d", color, idd);
			mysql_tquery(SQL, string, "", "");			
		}
		case 2: {
			if(color >= 127 && color <= 255 && CarInfo[idd][cColorTwo] < 127) return SendClientMessage(playerid, -1, "De chon Hidden Color, hay su dung lenh /shop.");
			if(color < 0 || color > 255) return SendClientMessage(playerid, -1, "Mau khong hop le!");
			// if(CarInfo[idd][cColorTwo] > 127) {
			// 	if(PlayerInfo[playerid][pPremiumPoints] < 100) return Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Shop", "Ban khong co du "#DIEMCAOCAP" de mua san pham nay.", "Ok", "");		
			// 	PlayerInfo[playerid][pPremiumPoints] -= 100;
			// 	SendClientMessage(playerid, COLOR_GOLD, "Ban da thay doi mau an voi gia 100 "#DIEMCAOCAP"!");
			// 	Update(playerid, pPremiumPointsx);
			// }
			else SendClientMessage(playerid, COLOR_MONEY, "Ban da thay doi mau cua xe voi gia $2,500.");
			CarInfo[idd][cColorTwo] = color;
			ChangeVehicleColorEx(car, CarInfo[idd][cColorOne], color);
			mysql_format(SQL, string, sizeof(string), "UPDATE cars SET ColorTwo=%d WHERE ID=%d", color, idd);
			mysql_tquery(SQL, string, "", "");						
		}
	}
	
	GivePlayerCash(playerid, -2500);
	// BizzInfo[10][bTill] += 2500;
	// mysql_format(SQL, string, sizeof(string), "UPDATE bizz SET Till=%d WHERE ID=19",BizzInfo[InBussines[playerid]][bTill]);
	// mysql_tquery(SQL, string, "", "");
	return 1;
}
CMD:givekey(playerid, params[]) {
	new id, keyid, string[180];
	if(GetVehicles(playerid) == 0) return SendClientMessage(playerid, -1, "Ban khong co phuong tien ca nhan!");
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong o trong xe!");
	new car = GetPlayerVehicleID(playerid);
	if(PersonalCar(playerid) == -1) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Ban khong o trong phuong tien ca nhan cua minh!");
	new idd = PersonalCar(playerid);
    if(sscanf(params, "u", id)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/givekey <playerid/name>");
	if(id == INVALID_PLAYER_ID) return SendClientMessage(playerid, -1, "Nguoi choi do khong dang nhap.");
	if(!ProxDetectorS(30.0, id, playerid)) return SendClientMessage(playerid, -1, "Ban khong o gan nguoi choi do!");
	if(id == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren chinh minh!");
	if(HireCar[id] != -1) return SendClientMessage(playerid, COLOR_WHITE, "Nguoi choi do da co mot chiec xe thue!");
	if(VehicleKey[id] != 0) return SendClientMessage(playerid, COLOR_WHITE, "Nguoi choi do da co chia khoa cua mot chiec xe khac!");
	VehicleKey[id] = car;
	format(string, sizeof(string), "* %s dua cho ban chia khoa xe %s (%d).", GetName(playerid), aVehicleNames[CarInfo[idd][cModel]-400], car);
	SendClientMessage(id, COLOR_LIGHTBLUE, string);
	format(string, sizeof(string), "* Ban da dua cho %s, chia khoa xe %s (slot %d).", GetName(id), aVehicleNames[CarInfo[idd][cModel]-400], keyid);
	SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
	return 1;
}

CMD:throwkey(playerid, params[]) {
	if(VehicleKey[playerid] == 0) return 1;
	VehicleKey[playerid] = 0;
	SendClientMessage(playerid, COLOR_LIGHTBLUE, "Ban da nem chia khoa di!");
	return 1;
}
CMD:enter(playerid, params[]) {
	if(IsPlayerInRangeOfPoint(playerid,2,gungamePos[0], gungamePos[1], gungamePos[2])) {
		Dialog_Show(playerid, DIALOG_CUSTOMGAME, DIALOG_STYLE_LIST, "Gun game hay dua xe?", "Gun game\nDua xe", "Ok", "Thoat");
		return 1;
	}
    foreach(new i : Bizs) {
		if(IsPlayerInRangeOfPoint(playerid,2,BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ]) && BizzInfo[i][bSbiz] == 1) {
			if(InWar[PlayerInfo[playerid][pMember]] == 1) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Ban khong the vao mot doanh nghiep trong khi dang war!");
			if(GetPlayerCash(playerid) < BizzInfo[i][bEntranceCost]) return GameTextForPlayer(playerid, "~r~~h~Ban khong co du tien", 1000, 1);
			if(OnDuty[playerid] == 1 || PlayerHit[playerid] != -1) { }
			else if(BizzInfo[i][bLocked] == 1) return GameTextForPlayer(playerid, "~r~~h~Khoa", 1000, 1);
			else return 1;
			new str1[64];
			format(str1, sizeof(str1), "~r~-$%d", BizzInfo[i][bEntranceCost]);		   
			GameTextForPlayer(playerid, str1, 1000, 1);	
			GivePlayerCash(playerid,-BizzInfo[i][bEntranceCost]);
			BizzInfo[i][bTill] += BizzInfo[i][bEntranceCost];	
			new query[128];
			format(query,sizeof(query),"UPDATE `bizz` SET `Till`='%d' WHERE `ID`='%d'", BizzInfo[i][bTill], i);
			mysql_query(SQL,query, false);		   
		}			   
	}				   
	return 1;
}

CMD:enterrc(playerid, params[]) {
	if(!IsPlayerInAnyVehicle(playerid)){
		new Float:x, Float:y, Float:z, car, idd;
		GetPlayerPos(playerid, x, y, z);
		car = GetClosestVehicle(playerid);
		if(!IsPlayerNearVehicle(playerid, car, 5)) {
			SendClientMessage(playerid, COLOR_GREY, "Ban khong so huu bat ky chiec xe RC nao hoac ban qua xa no.");
			return 1;
		}
		idd = FindSpawnID(car);
		if(IsVehicleRc(car) && CarInfo[idd][Userid] == PlayerInfo[playerid][pSQLID]) PutPlayerInVehicleEx(playerid, car, 0);
	}
	return 1;
}

/*CMD:exitrc(playerid, params[]) {
	new vehicleID = GetPlayerVehicleID(playerid);
	if(IsVehicleRc(vehicleID) || GetVehicleModel(vehicleID) == RC_CAM){
		if(GetVehicleModel(vehicleID) != D_TRAM){
			new Float:x, Float:y, Float:z;
			GetPlayerPos(playerid, x, y, z);
			SetPlayerPosEx(playerid, x+0.5, y, z+1.0);
			if(InDealer[playerid] == 1) {
				DestroyVehicle(DealerCar[playerid]);
				InDealer[playerid] = 0, DealerCarType[playerid] = -1, DealerCar[playerid] = 0;
				stop DSTimer[playerid];
				SendClientMessage(playerid, COLOR_WHITE, "Thu xe da bi tam ngung.");
				SetPlayerPosEx(playerid, DSPos[0],DSPos[1],DSPos[2]);
				SetPlayerInterior(playerid, 0);
				SetPlayerVirtualWorld(playerid, 0);
				TestingModel[playerid] = 0;
			}
		}
	}
	return 1;
}*/
CMD:findcar(playerid, params[]) {			
	if(CP[playerid] != 0) return Dialog_Show(playerid, DIALOG_CHECKPOINT, DIALOG_STYLE_MSGBOX, "Checkpoint", "Mot cham do dang hoat dong.\nBan co muon xoa no khong? Neu muon, hay chon 'Ok'.", "Ok", "Exit");
	new szTitle[180], szDialog[1300], szDialog2[1300], vstatus[1024];
	if(GetVehicles(playerid) == 0) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Ban khong co phuong tien ca nhan!");	
	format(szTitle, sizeof(szTitle), "Find Car - Vehicles (%d/%d)", GetVehicles(playerid), GetSlots(playerid));			
	for(new i = 0; i < 10; i++) {
		if(i < 5) {
			if(i < 3) {
				if(PlayerInfo[playerid][pCarKey][i] != 0) {
					new car =  PlayerInfo[playerid][pCarKey][i];
					if(IsVehicleOccupied(CarInfo[car][Spawned])) format(vstatus, sizeof(vstatus), "{FFFF00}(Dang ban){FFFFFF} %s", aVehicleNames[CarInfo[car][cModel]-400]);
					else if(CarInfo[car][Spawned] > 0) format(vstatus, sizeof(vstatus), "{26B309}(Ben ngoai){FFFFFF} %s", aVehicleNames[CarInfo[car][cModel]-400]);
					else format(vstatus, sizeof(vstatus), "{FF0000}(Trong kho){FFFFFF} %s", aVehicleNames[CarInfo[car][cModel]-400]);
					format(szDialog, sizeof(szDialog), "%s\n", vstatus);
					strcat(szDialog2, szDialog);
				}
				else strcat(szDialog2, "{FFD857}<slot trong>\n"), sVehicle[i][playerid] = 0;
			}
			else {
				if(PlayerInfo[playerid][pCarKey][i] != 0) {
					new car =  PlayerInfo[playerid][pCarKey][i];
					if(IsVehicleOccupied(CarInfo[car][Spawned])) format(vstatus, sizeof(vstatus), "{FFFF00}(Dang ban){FFFFFF} %s", aVehicleNames[CarInfo[car][cModel]-400]);
					else if(CarInfo[car][Spawned] > 0) format(vstatus, sizeof(vstatus), "{26B309}(Ben ngoai){FFFFFF} %s", aVehicleNames[CarInfo[car][cModel]-400]);
					else format(vstatus, sizeof(vstatus), "{FF0000}(Trong kho){FFFFFF} %s", aVehicleNames[CarInfo[car][cModel]-400]);
					format(szDialog, sizeof(szDialog), "%s\n", vstatus);
					strcat(szDialog2, szDialog);
				}
				else if(PlayerInfo[playerid][pVip] > 0) strcat(szDialog2, "{FFD857}<slot trong>\n"), sVehicle[i][playerid] = 0;
			}
		}
		else {
			if(PlayerInfo[playerid][pCarKey][i] != 0) {
				new car =  PlayerInfo[playerid][pCarKey][i];
				if(IsVehicleOccupied(CarInfo[car][Spawned])) format(vstatus, sizeof(vstatus), "{FFFF00}(Dang ban){FFFFFF} %s", aVehicleNames[CarInfo[car][cModel]-400]);
				else if(CarInfo[car][Spawned] > 0) format(vstatus, sizeof(vstatus), "{26B309}(Ben ngoai){FFFFFF} %s", aVehicleNames[CarInfo[car][cModel]-400]);
				else format(vstatus, sizeof(vstatus), "{FF0000}(Trong kho){FFFFFF} %s", aVehicleNames[CarInfo[car][cModel]-400]);
				format(szDialog, sizeof(szDialog), "%s\n", vstatus);
				strcat(szDialog2, szDialog);
			}
			else if(PlayerInfo[playerid][pSlot][i-5] == 1) strcat(szDialog2, "{FFD857}<slot trong>\n"), sVehicle[i][playerid] = 0;		
		}
	}
	Dialog_Show(playerid, DIALOG_FINDCAR, DIALOG_STYLE_LIST, szTitle, szDialog2, "Ok", "Exit");
	return 1;
}

CMD:so(playerid, params[]) {
	new userid, string[180], substring[11];
	if(!IsACop(playerid)) return SendClientMessage(playerid, -1, "ERROR: {FFFFFF} Ban khong o trong bo phan canh sat");
	if(OnDuty[playerid] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: {FFFFFF} Ban chua onduty lam viec nhu mot canh sat!");
	if(DeelayCommand[playerid][0] > 0) return DeelayTime(playerid, 0);
	if(PlayerInfo[userid][pWantedLevel] != 0) format(substring, 8, "truy na"); else format(substring, 10, "trieu tap");
	if(sscanf(params,"u",userid)) return SendClientMessage(playerid, COLOR_GREY, "Su dung:{FFFFFF} /so <ID nguoi choi/Ten>");
	if(!ProxDetectorS(30.0, playerid, userid)) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong o gan tam voi ban (30m)!");
	if(userid == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren chinh minh!");
	if(!IsPlayerInAnyVehicle(userid)) format(string, sizeof(string), "> %s: {4F90FF}%s{FFFF00}, anh dang bi canh sat %s, hay dau hang de duoc khoan hong! <", GetName(playerid), GetName(userid), substring);
	else format(string, sizeof(string), "> %s: {4F90FF}%s{FFFF00}, anh dang bi canh sat %s, tap xe vao le ngay truoc khi toi dung den vu luc! <", GetName(playerid), GetName(userid), substring);
	ProxDetector(30.0, playerid, string, COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
	DeelayCommand[playerid][0] = 3;
	return 1;
}
CMD:free(playerid, params[]) {
	if(!IsACop(playerid)) return 1;
	new id,moneyfree,string[100];
	if(OnDuty[playerid] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: {FFFFFF} Ban chua onduty lam viec nhu mot canh sat!");
	if(sscanf(params, "ui", id,moneyfree)) return SendClientMessage(playerid, 0xFFFFFFFF,"Su dung: /free <playerid/name> <amount>");
	if(PlayerInfo[id][pJailed] < 1) return SendClientMessage(playerid,COLOR_WHITE, "Nguoi choi nay khong ngoi tu.");
	if(playerid == id) return 1;
	if(PlayerInfo[playerid][pLawyer] < 1) return SendClientMessage(playerid,-1, "Ban khong co du diem bao lanh.");
	if(!ProxDetectorS(10.0, playerid, id)) return SendClientMessage(playerid,COLOR_GREY, "Nguoi choi do khong o gan tam voi ban!");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong dang nhap.");
	if(moneyfree < 100000 || moneyfree > 500000) return SendClientMessage(playerid, -1, "So tien khong hop le! ($100000-$500000)");
	FreeOffer[id] = playerid;
	FreePrice[id] = moneyfree;
	format(string, sizeof(string), "* Ban de nghi bao lanh %s voi gia %s$.",GetName(id),FormatNumber(moneyfree));
	SendClientMessage(playerid, COLOR_MONEY, string);
	format(string, sizeof(string), "* %s muon bao lanh ban voi gia %s$, (su dung /chapnhan free %d) de chap nhan.",GetName(playerid),FormatNumber(moneyfree),playerid);
	SendClientMessage(id, COLOR_MONEY, string);
	return 1;
}

CMD:escape(playerid, params[]) {
	if(PlayerInfo[playerid][pAJail] == 1) return 1;
	if(PlayerInfo[playerid][pEscapePoints] < 10) return SendClientMessage(playerid, -1, "Ban khong co 10 diem vuot nguc!");
	if(Escape[playerid] == 1) return SendClientMessage(playerid, -1, "Ban dang co gang tron thoat!");
	if(IsPlayerInRangeOfPoint(playerid, 5.0, 1812.8346,-1536.1892,13.2090) && PlayerInfo[playerid][pJailTime] >= 1 || IsPlayerInRangeOfPoint(playerid, 5.0, 1754.0898,-1582.2433,12.5121) && PlayerInfo[playerid][pJailTime] >= 1) {
		if(PlayerInfo[playerid][pJailTime] < 60*10) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong the tron thoat vi ban ngoi tu it hon 10 phut.");
		PlayerInfo[playerid][pEscapePoints] -= 10;
		UpdateVar(playerid, "EscapePoints", PlayerInfo[playerid][pEscapePoints]);
		Escape[playerid] = 1;
		EscapeProces[playerid] = 0;
		PlayerTextDrawSetString(playerid, InfosTD, "Su dung lenh ~y~/hit~w~~h~ de pha vo hang rao.");
		PlayerTextDrawShow(playerid, InfosTD);
	}
	else SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Ban khong the su dung lenh nay vi ban khong o gan cac hang rao.");
	return 1;
}

CMD:hit(playerid, params[]) {
	if(PlayerInfo[playerid][pAJail] == 1) return 1;
	if(GetPlayerVirtualWorld(playerid) == 0) return 1;
    if(Escape[playerid] == 0 || Escape2[playerid] == 1) return 1;
	if(!IsPlayerInRangeOfPoint(playerid, 5.0, 1812.8346,-1536.1892,13.2090) && !IsPlayerInRangeOfPoint(playerid, 5.0, 1754.0898,-1582.2433,12.5121)) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Ban khong the su dung lenh nay vi ban khong o gan cac hang rao.");
	ApplyAnimation(playerid, "SWORD", "sword_4", 4.0, 1, 1, 1, 0, 0);
	defer EscapePlayer[1000](playerid);
	Escape2[playerid] = 1;
	PlayerTextDrawHide(playerid, InfosTD);
	SetPlayerAttachedObject(playerid, 5, 19631, 6, 0.048, 0.029, 0.103, -80.0, 80.0, 0.0);
	return 1;
}
CMD:removead(playerid, params[]) {
	if(AdTimer[playerid] == Timer:0) return SendClientMessage(playerid,COLOR_GREY, "Ban khong co quang cao nao.");
	AdText[playerid] = "";
	AdTimer[playerid] = Timer:0;	
	SendClientMessage(playerid, COLOR_WHITE, "Quang cao da duoc xoa thanh cong.");
	return 1;
}

CMD:myad(playerid, params[]) {
	new string[184];
	if(AdTimer[playerid] == Timer:0) return SendClientMessage(playerid,COLOR_GREY, "Ban khong co quang cao nao.");
	format(string,256,"Noi dung: %s", AdText[playerid]);
	SendClientMessage(playerid, COLOR_MONEY, string);
	return 1;
}

CMD:showmotd(playerid, params[]) {
	if(PlayerInfo[playerid][pMember] == 0) return SendClientMessage(playerid,COLOR_GREY, "Ban khong o trong mot to chuc.");
	if(strlen(DynamicFactions[PlayerInfo[playerid][pMember]][fAnn]) == 0) return 1;
	new string[180];
	format(string,sizeof(string), "(FMOTD): %s",DynamicFactions[PlayerInfo[playerid][pMember]][fAnn]);
	MesajLung(playerid,COLOR_YELLOW,string);
	return 1;
}
CMD:cmotd(playerid, params[]) {
	if(PlayerInfo[playerid][pClan] == 0) return SendClientMessage(playerid, -1, "Ban khong o trong mot clan");
	new clanid = PlayerInfo[playerid][pClan], string[180];
	if(clanid != 0) {
		format(string, sizeof(string), "{%s}(CMOTD): %s.", ClanInfo[PlayerInfo[playerid][pClan]][clColor], ClanInfo[PlayerInfo[playerid][pClan]][clMotd]);
		MesajLung(playerid, -1, string);
	}	
	return 1;
}

CMD:fmotd(playerid, params[]) {
	if(PlayerInfo[playerid][pMember] == 0) return SendClientMessage(playerid,COLOR_GREY, "Ban khong o trong mot to chuc.");
	if(PlayerInfo[playerid][pRank] < 5) return SendClientMessage(playerid,COLOR_GREY, "Ban khong dat rank 5.");
	new string[180];
	if(sscanf(params, "s[180]",string)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/fmotd <noi dung>");
	strmid(DynamicFactions[PlayerInfo[playerid][pMember]][fAnn], string, 0, strlen(string), 180);
	format(string, sizeof(string), "(FMOTD): %s",DynamicFactions[PlayerInfo[playerid][pMember]][fAnn]);
	SendFactionMessage(PlayerInfo[playerid][pMember],COLOR_YELLOW,string);
	mysql_format(SQL, string, sizeof(string), "UPDATE `factions` SET `Anunt`='%e' WHERE `ID`='%d'",DynamicFactions[PlayerInfo[playerid][pMember]][fAnn], PlayerInfo[playerid][pMember]);
	mysql_query(SQL ,string, false);
	return 1;
}

CMD:leaders(playerid, params[]) {
	if(IsPlayerConnected(playerid)) {
		new count,sendername[25],string[184];
		format(string, sizeof(string), "---------------- Leader dang online ----------------");
		SendClientMessage(playerid, COLOR_WHITE, string);
		foreach(new i: Player) {
			if(PlayerInfo[i][pLeader] >= 1 && GetPVarInt(i, "Cover") == 0) {
				GetPlayerName(i, sendername, sizeof(sendername));
				if(PlayerInfo[i][pLeader] != 1) {
					format(string, sizeof(string), "%s: %s(%d)", FactionName(PlayerInfo[i][pLeader]), sendername,i);
					SendClientMessage(playerid, COLOR_WHITE, string);
					count++;
				}				
			}
		}
		if(count == 0) return SendClientMessage(playerid,COLOR_GREY, "Khong co lanh dao nao dang online.");
		SendClientMessage(playerid, COLOR_WHITE, "--------------------------------------------------------");
	}
	return 1;
}

CMD:top(playerid, params[]) {
	new p=0,t=0,s=0,r=0,k=0,string[60];
	for(new i = 1; i < turfsss; i++) {
		if(TurfInfo[i][zOwned] == 4) t++;
		if(TurfInfo[i][zOwned] == 5) p++;
		if(TurfInfo[i][zOwned] == 6) s++;
		if(TurfInfo[i][zOwned] == 10) r++;
		if(TurfInfo[i][zOwned] == 14) k++;
	}
	SendClientMessage(playerid,COLOR_WHITE,"---------- Top Gangs ----------");
	format(string, sizeof(string), "{63AE52}%s {FFFFFF}- %d dia ban",FactionName(4), t);
	SendClientMessage(playerid,COLOR_WHITE,string);
	format(string, sizeof(string), "{18EBD6}%s {FFFFFF}- %d dia ban",FactionName(5),p);
	SendClientMessage(playerid,COLOR_WHITE,string);
	format(string, sizeof(string), "{FFAE00}%s {FFFFFF}- %d dia ban",FactionName(6),s);
	SendClientMessage(playerid,COLOR_WHITE,string);
	format(string, sizeof(string), "{AB00FA}%s {FFFFFF}- %d dia ban",FactionName(10),r);
	SendClientMessage(playerid,COLOR_WHITE,string);
	format(string, sizeof(string), "{FF0000}%s {FFFFFF}- %d dia ban",FactionName(14),k);
	SendClientMessage(playerid,COLOR_WHITE,string);
	SendClientMessage(playerid,COLOR_WHITE,"-------------------------------------");
	return 1;
}
CMD:music(playerid, params[]) {
	if(IsPlayerInRangeOfPoint(playerid, 30.0, 184.3529,-1825.4983,8.7530)) {
		if(PlayerInfo[playerid][pAdmin] == 0) return 1;
		new link[64], string[63];
		if(sscanf(params, "s[64]", link)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/music <link>");
		format(beachlink, 64, link);
		foreach(new i: Player) {
			if(IsPlayerInRangeOfPoint(i, 30.0, 184.3529,-1825.4983,8.7530)) {			
				PlayAudioStreamForPlayer(i, beachlink, 184.3529,-1825.4983,8.7530, 30.0, 1);
				SetPVarInt(i, "Listening", 1);
				format(string, sizeof(string), "* Admin %s da thay doi am nhac.",GetName(playerid));
				SendClientMessage(i,COLOR_YELLOW,string);				
			}
		}
	}
	else {	
		if(!IsPlayerInRangeOfPoint(playerid,100.0,475.6506,-15.0195,1003.6953) && !IsPlayerInRangeOfPoint(playerid,100.0,2021.8,1913.32,12.3122) && !IsPlayerInRangeOfPoint(playerid,100.0,1204.6371,-13.1467,1000.9219)) 
			return SendClientMessage(playerid,COLOR_GREY, "Ban khong o tai Alahambra.");
		
		new link[100],string[69];
		if(sscanf(params, "s[100]",link)) return SendClientMessage(playerid,COLOR_GREY, "Su dung: {FFFFFF}/music <Link>");
		strmid(alhamusic, link, 0, strlen(link), 100);
		if(InBussines[playerid] == -1) return 1;
		foreach(new i: Player) {
			if(BizzInfo[InBussines[i]][bType] == 3 && InBussines[i] == InBussines[playerid]) {
				PlayAudioStreamForPlayer(i, link);
				format(string, sizeof(string), "* DJ %s da thay doi am nhac cho club.",GetName(playerid));
				SendClientMessage(i,COLOR_YELLOW,string);
			}
		}
	}	
	return 1;
}
CMD:hradio(playerid, params[]) return SendClientMessage(playerid, COLOR_LGREEN, "Cac lenh nay da duoc chuyen sang /housemenu!");	
CMD:bradio(playerid, params[]) return SendClientMessage(playerid, COLOR_LGREEN, "Cac lenh nay da duoc chuyen sang /bizmenu!");
CMD:forum(playerid, params[]) return SendClientMessage(playerid, COLOR_LGREEN, "Forum: "#SERVER_URL"/forum");
CMD:fanpage(playerid, params[]) return SendClientMessage(playerid, COLOR_LGREEN, "Forum: "#FANPAGE"");
CMD:group(playerid, params[]) return SendClientMessage(playerid, COLOR_LGREEN, "Forum: "#GROUP"");
CMD:panel(playerid, params[]) return SendClientMessage(playerid, COLOR_LGREEN, "Panel: "#SERVER_URL"/panel");
alias:panel("ucp")
CMD:fb(playerid, params[]) return SendClientMessage(playerid, COLOR_LGREEN, "Facebook: "#CHU_SERVER"");

CMD:carradio(playerid, params[]) {
	if(!IsPlayerInAnyVehicle(playerid)) return 1;
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return 1;
	new szDialog[1024], szDialog2[1024];
	strcat(szDialog2, "Ten\tSo nguoi dang nghe\n");
	for(new i = 0; i < sizeof(RadioNames); i++) {
		if(i == 0) format(szDialog, sizeof(szDialog), "%s\n", RadioNames[i]);
		else format(szDialog, sizeof(szDialog), "%s\t%d\n", RadioNames[i], ListenThisRadio(i));
		strcat(szDialog2, szDialog);
	}
	strcat(szDialog2, "Youtube custom URL");
	Dialog_Show(playerid, DIALOG_CARRADIO, DIALOG_STYLE_TABLIST_HEADERS, "Car Radio", szDialog2, "Ok", "Close");
	return 1;
}
CMD:fixcauca(playerid, params[]) {
	PlayerTextDrawHide(playerid, Key);
	TextDrawHideForPlayer(playerid, KhungKey);
	HidePlayerProgressBar(playerid, jProgress[playerid]);
	DestroyPlayerProgressBar(playerid, jProgress[playerid]);

	ClearAnimations(playerid);
	ApplyAnimation(playerid, "CARRY", "crry_prtial", 2.0, 0, 0, 0, 0, 0);
	TogglePlayerControllable(playerid, true);
	RemovePlayerAttachedObject(playerid, 9);
	Times[playerid] = 0;
	stop TimeOut[playerid];
	TimeOut[playerid] = Timer:0;
	return 1;
}


CMD:mp3(playerid, params[]) {
	if(PlayerInfo[playerid][pMP3] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Ban khong co mot may phat MP3!");
	new szDialog[1024], szDialog2[1024];
	strcat(szDialog2, "Ten\tSo nguoi dang nghe\n");
	for(new i = 0; i < sizeof(RadioNames); i++) {
		if(i == 0) format(szDialog, sizeof(szDialog), "%s\n", RadioNames[i]);
		else format(szDialog, sizeof(szDialog), "%s\t%d\n", RadioNames[i], ListenThisRadio(i));
		strcat(szDialog2, szDialog);
	}
	strcat(szDialog2, "Youtube custom URL");
	Dialog_Show(playerid, DIALOG_MP3, DIALOG_STYLE_TABLIST_HEADERS, "MP3 Player", szDialog2, "Ok", "Close");
	return 1;
}
CMD:findhouse(playerid, params[]) {
	if(CP[playerid] != 0) return Dialog_Show(playerid, DIALOG_CHECKPOINT, DIALOG_STYLE_MSGBOX, "Checkpoint", "Mot cham do dang hoat dong.\nBan co muon xoa no khong? Neu muon, hay chon 'Ok'.", "Ok", "Exit");
	new id;
	if(sscanf(params, "i",id)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/findhouse <id>");
	if(id < 1 || id > Iter_Count(House)) return SendClientMessage(playerid, -1, "ID khong hop le!");
	CP[playerid] = 43;
	SetPlayerCheckpointEx(playerid, HouseInfo[id][hEntrancex], HouseInfo[id][hEntrancey], HouseInfo[id][hEntrancez], 5.0);
	new string[70];
	format(string, sizeof(string), "House ID %d da duoc dinh vi tren ban do. Khoang cach: %0.2fm", id, GetPlayerDistanceFromPoint(playerid, HouseInfo[id][hEntrancex], HouseInfo[id][hEntrancey], HouseInfo[id][hEntrancez]));
	SendClientMessage(playerid, COLOR_YELLOW, string);
	return 1;
}

CMD:findbiz(playerid, params[]) {
	if(CP[playerid] != 0) return Dialog_Show(playerid, DIALOG_CHECKPOINT, DIALOG_STYLE_MSGBOX, "Checkpoint", "Mot cham do dang hoat dong.\nBan co muon xoa no khong? Neu muon, hay chon 'Ok'.", "Ok", "Exit");
	new id;
	if(sscanf(params, "i",id)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/findbiz <id>");
	// if(id < 1 || id > Iter_Count(Bizs)) return SendClientMessage(playerid, -1, "ID khong hop le!");
	CP[playerid] = 43;
	if(BizzInfo[id][bSbiz] == 0) SetPlayerCheckpointEx(playerid, BizzInfo[id][bEntranceX], BizzInfo[id][bEntranceY], BizzInfo[id][bEntranceZ], 5.0);
	else SetPlayerCheckpointEx(playerid,BizzInfo[id][bEntranceX],BizzInfo[id][bEntranceY],BizzInfo[id][bEntranceZ], 5.0);
	new string[70];
	format(string, sizeof(string), "Biz %d da duoc dinh vi tren ban do. Khoang cach: %0.2fm", id, GetPlayerDistanceFromPoint(playerid, BizzInfo[id][bEntranceX], BizzInfo[id][bEntranceY], BizzInfo[id][bEntranceZ]));
	SendClientMessage(playerid, COLOR_YELLOW, string);
	return 1;
}
CMD:stealers(playerid, params[]) {
	if(!IsAMember(playerid)) return SendClientMessage(playerid,COLOR_GREY, "Ban khong o trong mot to chuc mafia.");
	new string[128], x;
	foreach(new i: Player) {
		if(IsPlayerConnected(i) && PlayerInfo[i][pJob] == 4 && JobWorking[i] == 1 && IsAGangCar(GetPlayerVehicleID(i))) {
			format(string, sizeof(string), "%s (%d) danh cap mot xe to chuc.", GetName(i), i);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			x++;
		}
	}
	if(x == 0) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Khong tim thay ket qua nao!");
	return 1;
}
CMD:attack(playerid, params[]) {
	if(gettime() < GetPVarInt(playerid, "SpamAttack")) return 1;
	SetPVarInt(playerid, "SpamAttack", gettime() + 5);	
	if(PlayerInfo[playerid][pRank] < 5) return SendClientMessage(playerid,COLOR_LIGHTBLUE,"Ban khong dat rank 5.");
	if(!IsAMember(playerid)) return SendClientMessage(playerid,COLOR_GREY, "Ban khong o trong mot to chuc mafia.");	
	//if(UsingSampcac{playerid} == 0) return SendClientMessage(playerid, COLOR_GREY, "Ban khong attack vi chua cai SAMPCAC");
	new turf;
	for(new i = 1; i <= turfsss; i++) {
		if(IsPlayerInTurf(playerid, i) == 1) {
			turf = i;
			break;
		}
    }
	new hour,minute,second, year, month, day;
	gettime(hour,minute,second);
	getdate(year, month, day);
	new days[180], string[150];
	format(days, sizeof(days), GetWeekDay(day, month, year));
	if(PlayerInfo[playerid][pAdmin] < 7) {
		// if(strcmp(days,"Sunday",true) == 0 || strcmp(days,"Monday",true) == 0 || strcmp(days,"Wednesday",true) == 0 || strcmp(days,"Friday",true) == 0) {} else return SendClientMessage(playerid, COLOR_LIGHTRED, "Chi co the bat dau war vao cac ngay chan trong tuan (CN-2-4-6)!");
		// else return SendClientMessage(playerid, COLOR_LIGHTRED, "Gio war se nam trong khoang thoi gian 18:00 - 22:00!");
		// nếu giờ lớn hơn 19 và bé hơn 21
		if(!(19 < hour < 21))
			if(!(minute < 30)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Chua den gio war (19-21h30)");
		if(ServerSystem[20] == 1) {
			if(!(strcmp(days,"Monday",true) == 0 || strcmp(days,"Sunday",true) == 0 || strcmp(days,"Wednesday",true) == 0 || strcmp(days,"Friday",true) == 0)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Chi co the bat dau war vao cac ngay chan trong tuan (CN-2-4-6)!");			
		}
		if(FactionDeelay[PlayerInfo[playerid][pMember]] > gettime()) {
			new seconds = FactionDeelay[PlayerInfo[playerid][pMember]] - gettime();
			format(string, sizeof(string), "Ban chi co the su dung lenh nay sau %d giay (%0.2f phut)", seconds, float(seconds*60));
			SendClientMessage(playerid, COLOR_LGREEN, string);
			return 1;
		}
		if(FactionDeelay[ TurfInfo[turf][zOwned] ] - gettime() > 180) {
			new seconds = FactionDeelay[ TurfInfo[turf][zOwned] ] - gettime() - 180;
			format(string, sizeof(string), "Gang nay dang trong thoi gian nghi (toi thieu 3 phut), ban chi co the tan cong sau %d giay (%0.2f phut)", seconds, float(seconds*60));
			SendClientMessage(playerid, COLOR_LGREEN, string);
			return 1;
		}
		// new x = GetFactionMembersOn2(PlayerInfo[playerid][pMember]), y = GetFactionMembersOn2(TurfInfo[turf][zOwned]);
		// if(x < 5 || y < 5) return SendClientMessage(playerid, -1, "Mot trong 2 gang khong co du 5 nguoi choi cai dat sampcac de war.");
		// if(x >= 5 && y >= 5 && x - y >= 5)
		// 	return va_SendClientMessage(playerid, COLOR_LGREEN, "Ban khong the tan cong mot gang chenh lech voi gang cua ban den 5 thành viên (hien tai: %d) [cac thành viên da cai GTAVLC Anti Cheat]!", x-y);
	}
    if(turf == 0) return SendClientMessage(playerid, COLOR_WHITE, "Ban khong o tren mot dia ban!");
    new faction = PlayerInfo[playerid][pMember];
    if(TurfInfo[turf][zOwned] == faction) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the tan cong dia ban so huu boi to chuc cua ban.");
    //if(gettime() - TurfInfo[turf][zTurfDelay] < 0) return va_SendClientMessage(playerid, COLOR_GREY, "Dia ban nay vua bi tan cong, ban phai doi %d giay nua moi co the tan cong lai dia ban nay.", TurfInfo[turf][zTurfDelay]-gettime());
	if(WarInfo[turf][wAttacker] != 0) return SendClientMessage(playerid, COLOR_WHITE, "Dia ban nay dang trong mot cuoc chien khac.");
	if(InWar[faction] == 1) return SendClientMessage(playerid, COLOR_WHITE, "To chuc ban dang co mot cuon chien dia ban khac dang hoat dong.");
	if(InWar[TurfInfo[turf][zOwned]] == 1) return SendClientMessage(playerid, COLOR_WHITE, "To chuc giu dia ban nay dang co mot cuoc chien dia ban hoat dong.");
	format(string, sizeof(string), "[WAR] %s bat dau mot cuoc tranh gianh dia ban voi to chuc %s.",FactionName(PlayerInfo[playerid][pMember]), FactionName(TurfInfo[turf][zOwned]));
	SendClientMessageToAll(COLOR_GREY, string);
	format(string, sizeof(string), "[WAR] %s thuoc to chuc cua ban tan cong vao dia ban %d thuoc so huu cua to chuc %s.",GetName(playerid),turf,FactionName(TurfInfo[turf][zOwned]));
	SendFactionMessage(faction,COLOR_MONEY,string);
	format(string, sizeof(string), "[WAR] %s (%s) tan cong vao dia ban %d thuoc so huu cua to chuc cua ban.",FactionName(WarInfo[turf][wAttacker]),GetName(playerid),turf);
	SendFactionMessage(TurfInfo[turf][zOwned],COLOR_MONEY,string);
	new query[47];
	format(query,sizeof(query),"UPDATE `turfs` SET `Time`='24' WHERE `ID`='%d'",turf);
	mysql_pquery(SQL,query);
	
	TurfInfo[turf][zTime] = 24;
	if(PlayerInfo[playerid][pAdmin] == 7) WarInfo[turf][wTime] = 120;
	else WarInfo[turf][wTime] = 1200;
	WarInfo[turf][wAttacker] = faction;
	WarInfo[turf][wFaction] = TurfInfo[turf][zOwned];
	worstscoreat[turf] = 0;
	worstmemberat[turf] = 999;
	bestscoreat[turf] = 0;
	bestmemberat[turf] = 999;
	worstscoredf[turf] = 0;
	worstmemberdf[turf] = 999;
	bestscoredf[turf] = 0;
	bestmemberdf[turf] = 999;
	InWar[TurfInfo[turf][zOwned]] = 1;
	InWar[faction] = 1;
	
	InWarTurf[faction] = turf;
	InWarTurf[TurfInfo[turf][zOwned]] = turf;
	
	foreach(new i: Player) {
		if(IsPlayerLogged[i] == 1) {
			if(PlayerInfo[i][pMember] == faction || PlayerInfo[i][pMember] == TurfInfo[turf][zOwned]) {
				UpdateVar(i, "WarTurf", turf);
				SFID[i] = 0;
				PlayerTextDrawHide(i, SafeTD);
			}
		}
	}
	SetVehicle(faction, turf);
	SetVehicle(TurfInfo[turf][zOwned], turf);
	return 1;
}
CMD:turfs(playerid, params[]) {
	if(TurfsDisp[playerid] == 0) {
		TurfsDisp[playerid] = 1;
		for(new i = 1; i <= turfsss; i++) {
			if(TurfInfo[i][zOwned] == 0) ShowZoneForPlayer(playerid, Turfs[i], 0xFFFFFFAA); //None
			if(TurfInfo[i][zOwned] == 4) ShowZoneForPlayer(playerid, Turfs[i], 0x0CAB3C99); //Grove Street
			if(TurfInfo[i][zOwned] == 6) ShowZoneForPlayer(playerid, Turfs[i], 0xFFAE00C8); //Los Vagos
			if(TurfInfo[i][zOwned] == 10) ShowZoneForPlayer(playerid, Turfs[i], 0xAB00FA99); //Ballas
			if(TurfInfo[i][zOwned] == 5) ShowZoneForPlayer(playerid, Turfs[i], 0x18EBD699); //Los Aztecas
			if(TurfInfo[i][zOwned] == 14) ShowZoneForPlayer(playerid, Turfs[i], 0xFF000099); //Da Nang Boys
		}
		SendClientMessage(playerid, -1, "Ban da bat tuy chon xem dia ban.");
	}
	else {
		TurfsDisp[playerid] = 0;
		for(new i = 1; i < turfsss; i++) HideZoneForPlayer(playerid, Turfs[i]);
		SendClientMessage(playerid, -1, "Ban tat xem dia ban.");
	}
	return 1;
}

CMD:fdeposit(playerid, params[]) {
	for(new s = 0; s < sizeof(SafeInfo); s++) {
		if(IsPlayerInRangeOfPoint(playerid, 5.0, SafeInfo[s][sPosX], SafeInfo[s][sPosY], SafeInfo[s][sPosZ])) {
			if(PlayerInfo[playerid][pMember] == SafeInfo[s][sFactionID]) {
				SeifID[playerid] = PlayerInfo[playerid][pMember]-1;
				Dialog_Show(playerid, DIALOG_FDEPOSIT, DIALOG_STYLE_LIST, "Gui vao to chuc", "Money\nMaterials\nDrugs", "Ok", "Exit");
			}
		}
	}
	return 1;
}

CMD:fwithdraw(playerid, params[]) {
	for(new s = 0; s < sizeof(SafeInfo); s++) {
		if(IsPlayerInRangeOfPoint(playerid, 5.0, SafeInfo[s][sPosX], SafeInfo[s][sPosY], SafeInfo[s][sPosZ])) {
			if(PlayerInfo[playerid][pMember] == SafeInfo[s][sFactionID]) {
				if(PlayerInfo[playerid][pRank] >= 7) {
					SeifID[playerid] = PlayerInfo[playerid][pMember]-1;
					new string[180];
					format(string, sizeof(string), "Tuy chon\tKet qua\nMoney\t$%s\nMaterials\t%s\nDrugs\t%s\n", FormatNumber(SafeInfo[s-1][sMoney]), FormatNumber(SafeInfo[s-1][sMaterials]), FormatNumber(SafeInfo[s-1][sDrugs]));
					Dialog_Show(playerid, DIALOG_FWITHDRAW, DIALOG_STYLE_TABLIST_HEADERS, "Faction withdraw", string, "Ok", "Exit");
				}
			}
		}
	}
	return 1;
}

CMD:government(playerid, params[]) {
	if(IsACop(playerid) || PlayerInfo[playerid][pMember] == 13) {		
		if(PlayerInfo[playerid][pRank] < 5) return SendClientMessage(playerid, -1, "Ban can dat rank 5 de su dung lenh nay.");
		new hour,minute,second, year, month, day;
		gettime(hour,minute,second);
		getdate(year, month, day);
		if(hour >= 00 && hour < 8) return SendClientMessage(playerid, COLOR_LIGHTRED, "Ban khong the su dung lenh nay trong khoang thoi gian 00-08.");	
		new string[300],textgov[250],sendername[MAX_PLAYER_NAME];
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(sscanf(params, "s[250]", textgov)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/gov <noi dung>");
		if(FaceReclama(textgov)) return RemoveFunction(playerid, textgov);
		if(FaceReclama(textgov)) return Reclama(playerid, textgov);
		SCMTA(COLOR_WHITE, "-------------------------- Thong bao cua chinh phu --------------------------");
		if(PlayerInfo[playerid][pMember] == 1) format(string, sizeof(string), "%s %s: %s", GetRankName(playerid), sendername, textgov);
		if(PlayerInfo[playerid][pMember] == 2) format(string, sizeof(string), "%s %s: %s", GetRankName(playerid), sendername, textgov);
		if(PlayerInfo[playerid][pMember] == 3) format(string, sizeof(string), "%s %s: %s", GetRankName(playerid), sendername, textgov);	
		if(PlayerInfo[playerid][pMember] == 13) format(string, sizeof(string), "%s %s: %s", GetRankName(playerid), sendername, textgov);		
		if(PlayerInfo[playerid][pMember] == 15) format(string, sizeof(string), "%s %s: %s", GetRankName(playerid), sendername, textgov);		
		MesajLung2(0x5776FFFF, string);
	}
	else return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la thanh vien cua canh sat hoac thi truong.");
	return 1;
}

CMD:vinfo(playerid, params[]) {
    new carid, string[500];
	if(PlayerInfo[playerid][pAdmin] < 6) return 1;
	if(IsPlayerInAnyVehicle(playerid)) {
		carid = GetPlayerVehicleID(playerid);
		new dbid = GetVehicleID(carid);
		if(ServerVehicles[dbid][vID] == 0) return SendClientMessage(playerid, COLOR_GREY, "Chiec xe nay khong nam trong co so du lieu.");
		format(string, sizeof(string),
			"DBID: {FFFFFF}%d\nVehicle name: {FFFFFF}%s\n{B9C9BF}Vehicle model: {FFFFFF}%d\n{B9C9BF}Vehicle ID: {FFFFFF}%d\n{B9C9BF}LocationX: {FFFFFF}%f\n{B9C9BF}LocationY: {FFFFFF}%f\n{B9C9BF}LocationZ: {FFFFFF}%f\n{B9C9BF}\
			Color #1: {FFFFFF}%d\n{B9C9BF}Color #2: {FFFFFF}%d\n{B9C9BF}Faction: {FFFFFF}%d\n{B9C9BF}Rank: {FFFFFF}%d\n{B9C9BF}Clan: {FFFFFF}%s (%d)", dbid,
			aVehicleNames[GetVehicleModel(carid) - 400], ServerVehicles[dbid][vModel], dbid, ServerVehicles[dbid][vLocation][0], ServerVehicles[dbid][vLocation][1], ServerVehicles[dbid][vLocation][2],
			ServerVehicles[dbid][vColor][0], ServerVehicles[dbid][vColor][1], ServerVehicles[dbid][vFaction], ServerVehicles[dbid][vRank], ClanInfo[ServerVehicles[dbid][vClan]][clName], ServerVehicles[dbid][vClan]);
		Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Thong tin xe:", string, "Ok", "");
	}
	else {
		if(sscanf(params, "i", carid)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/vinfo <car id>");
		if(!IsValidVehicle(carid)) return SendClientMessage(playerid, COLOR_GREY, "Car ID khong hop le.");
		new dbid = GetVehicleID(carid);
		if(ServerVehicles[dbid][vID] == 0) return SendClientMessage(playerid, COLOR_GREY, "Chiec xe nay khong nam trong co so du lieu.");
		format(string, sizeof(string),
			"Vehicle name: {FFFFFF}%s\n{B9C9BF}Vehicle model: {FFFFFF}%d\n{B9C9BF}Vehicle ID: {FFFFFF}%d\n{B9C9BF}LocationX: {FFFFFF}%f\n{B9C9BF}LocationY: {FFFFFF}%f\n{B9C9BF}LocationZ: {FFFFFF}%f\n{B9C9BF}\
			Color #1: {FFFFFF}%d\n{B9C9BF}Color #2: {FFFFFF}%d\n{B9C9BF}Faction: {FFFFFF}%d\n{B9C9BF}Rank: {FFFFFF}%d\n{B9C9BF}Clan: {FFFFFF}%s (%d)",
			aVehicleNames[GetVehicleModel(carid) - 400], ServerVehicles[dbid][vModel], dbid, ServerVehicles[dbid][vLocation][0], ServerVehicles[dbid][vLocation][1], ServerVehicles[dbid][vLocation][2],
			ServerVehicles[dbid][vColor][0], ServerVehicles[dbid][vColor][1], ServerVehicles[dbid][vFaction], ServerVehicles[dbid][vRank], ClanInfo[ServerVehicles[dbid][vClan]][clName], ServerVehicles[dbid][vClan]);
		Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Thong tin xe:", string, "Ok", "");
	}
   	return 1;
}

CMD:setvrank(playerid, params[]) {
	if(PlayerInfo[playerid][pLeader] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong phai la lanh dao cua mot to chuc!");
	new id;
	if(!IsPlayerInAnyVehicle(playerid)) return 1;
	if(!FactionVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong mot chiec xe cua to chuc ban");
	if(sscanf(params, "i", id)) return SendClientMessage(playerid, -1, "Su dung: /setvrank <rank>");
	if(id < 1 || id > 6) return SendClientMessage(playerid, -1, "Rank invalid!");
	new vehicle = GetVehicleID(GetPlayerVehicleID(playerid));
	ServerVehicles[vehicle][vRank] = id;
	new query[256], string[256];
	format(query, 256, "UPDATE `svehicles` SET `Rank`='%d' WHERE `vID`='%d'", id, vehicle);
	mysql_query(SQL, query, false);
	format(string, sizeof(string), "Ban da chinh sua rank cua xe %d thanh cong.", id);
	SendClientMessage(playerid, COLOR_YELLOW, string);
	return 1;
}
stock SLog(sz_fileName[], sz_input[])
{
	new sz_logEntry[156], i_dateTime[2][3], File: fileHandle = fopen(sz_fileName, io_append);

	gettime(i_dateTime[0][0], i_dateTime[0][1], i_dateTime[0][2]);
	getdate(i_dateTime[1][0], i_dateTime[1][1], i_dateTime[1][2]);

	format(sz_logEntry, sizeof(sz_logEntry), "[%i/%i/%i - %i:%i:%i] %s\r\n", i_dateTime[1][0], i_dateTime[1][1], i_dateTime[1][2], i_dateTime[0][0], i_dateTime[0][1], i_dateTime[0][2], sz_input);
	fwrite(fileHandle, sz_logEntry);
	return fclose(fileHandle);
}
CMD:order(playerid, params[]) {
	new hour, minute, sec;
	gettime(hour,minute,sec);
	if(PlayerInfo[playerid][pMember] == 11 || PlayerInfo[playerid][pLeader] == 11)
	{
		new result[30], fid = PlayerInfo[playerid][pMember];
		if(!IsPlayerInRangeOfPoint(playerid, 100.0, DynamicFactions[fid][fcX], DynamicFactions[fid][fcY], DynamicFactions[fid][fcZ])) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o tai HQ!");
		if(PlayerHit[playerid] == -1) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Ban chi co the lay vu khi khi co hop dong!");
		if(sscanf(params, "s[30]", result)) {
			SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/order <id>");
			SendClientMessage(playerid, COLOR_WHITE, "1. Knife (10 $) | 2. SD-Pistol (100 $) | 3. Sniper (200 $)");
			return 1;
		}
		if(PlayerInfo[playerid][pGunLic] == 0) return SendClientMessage(playerid,-1,"Ban khong co giay phep su dung sung!");
		if(strcmp(result,"1",true) == 0) {
			if(GetPlayerCash(playerid) < 10) return 1;
			ServerWeapon(playerid, 4, 200);
			SendClientMessage(playerid, COLOR_MONEY, "Ban da mua mot Knife voi gia 10$.");
			GivePlayerCash(playerid, -10);
			PlayerInfo[playerid][pSungGang][0] = 4;
			return 1;
		}
		else if(strcmp(result,"2",true) == 0) {
			if(GetPlayerCash(playerid) < 100) return 1;
			ServerWeapon(playerid, 23, 200);
			SendClientMessage(playerid, COLOR_MONEY, "Ban da mua mot SD-Pistol voi gia 100$.");
			GivePlayerCash(playerid, -100);
			PlayerInfo[playerid][pSungGang][1] = 23;
			return 1;
		}
		else if(strcmp(result,"3",true) == 0) {
			if(GetPlayerCash(playerid) < 200) return 1;
			ServerWeapon(playerid, 34, 200);
			SendClientMessage(playerid, COLOR_MONEY, "Ban da mua mot Sniper voi gia 200$.");
			GivePlayerCash(playerid, -200);
			PlayerInfo[playerid][pSungGang][1] = 34;
			return 1;
		}
		else return SendClientMessage(playerid, COLOR_GREY, "Invalid id!");
	}	
	if(IsAMember(playerid))
	{	
		if(GetPVarInt(playerid, "NotAndroid") == 0)
		{
			if(PlayerInfo[playerid][pGunLic] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Ban khong co giay phep su dung sung. Hay tim mot giao vien de nho ho cap giay phep hoac mua o City Hall.");
			if(GetPlayerInterior(playerid) == 0) return SendClientMessage(playerid, COLOR_WHITE,"Ban khong o tai HQ.");
			new fid = PlayerInfo[playerid][pMember];
			if(!IsPlayerInRangeOfPoint(playerid, 100.0, DynamicFactions[fid][fcX], DynamicFactions[fid][fcY], DynamicFactions[fid][fcZ])) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o tai HQ!");
			//if(InWar[PlayerInfo[playerid][pMember]]) {} else return SendClientMessage(playerid, COLOR_LIGHTRED, "Ban khong the order sung khi Gang ban chua war, hay dong gop vat lieu de chuan bi nao!");
			new result[180];
			new x = PlayerInfo[playerid][pMember]-1;
			if(SafeInfo[x][sMaterials] < 1) return SendClientMessage(playerid, COLOR_CLIENT, "Khong co du vat lieu ben trong ket an toan!");
			if(SafeInfo[x][sMoney] < 1) return SendClientMessage(playerid, COLOR_CLIENT, "Khong co du tien ben trong ket an toan!");
			if(sscanf(params, "s[30]", result)) {
				SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/order <id>");
				SendClientMessage(playerid, COLOR_GRAD3, "1. Deagle - 200 ammo - 220$ - 200 vat lieu");
				if(InWar[PlayerInfo[playerid][pMember]] == 1) SendClientMessage(playerid, COLOR_GRAD3, "2. M4 - 600 ammo - 310$ - 400 vat lieu ( luc war ) - 320 vat lieu ( khong war )");
				//SendClientMessage(playerid, COLOR_GRAD3, "3. AK47 - 600 ammo - 300$ - 320 vat lieu");
				SendClientMessage(playerid, COLOR_GRAD3, "4. Rifle - 300 ammo - 535$ - 400 vat lieu");
				//SendClientMessage(playerid, COLOR_GRAD3, "5. TEC9 - 400 ammo - 450$ - 370 vat lieu");
				SendClientMessage(playerid, COLOR_GRAD3, "6. Combat Shotgun (rank 5) - 200 ammo - 530$ - 250 vat lieu");
				SendClientMessage(playerid, COLOR_GRAD3, "7. Sniper (rank 5) - 50 ammo - 530$ - 1k vat lieu");
				SendClientMessage(playerid, COLOR_GRAD3, "8. Shotgun - 600 ammo - 300$ - 320 vat lieu");
				SendClientMessage(playerid, COLOR_GRAD3, "9. MP5 - 600 ammo - 450$ - 350 vat lieu");
				SendClientMessage(playerid, COLOR_GRAD3, "Gun 2, 3, 5, 6, 7 tam khoa");
				return 1;
			}
			if(PlayerInfo[playerid][pGunLic] == 0) return SendClientMessage(playerid,-1,"Ban khong co giay phep su dung sung!");
			if(strcmp(result,"1",true) == 0) {
				ServerWeapon(playerid, 24, 200);
				SendClientMessage(playerid, COLOR_MONEY, "Ban da mua mot deagle voi gia 220$.");
				SafeInfo[x][sMaterials] -= 200;
				SafeInfo[x][sMoney] -= 220;
				PlayerInfo[playerid][pSungGang][0] = 24;
			}
			else if(strcmp(result,"2",true) == 0) {
				if(InWar[PlayerInfo[playerid][pMember]] != 1) SafeInfo[x][sMaterials] -= 80;
				ServerWeapon(playerid, 31, 600);
				SendClientMessage(playerid, COLOR_MONEY, "Ban da mua mot M4 voi gia 310$.");
				SafeInfo[x][sMaterials] -= 320;

				SafeInfo[x][sMoney] -= 310;
				PlayerInfo[playerid][pSungGang][1] = 31;
			}
			// else if(strcmp(result,"3",true) == 0) {
			// 	ServerWeapon(playerid, 30,600);
			// 	SendClientMessage(playerid, COLOR_MONEY, "Ban da mua mot AK47 voi gia 300$.");
			// 	SafeInfo[x][sMaterials] -= 320;
			// 	SafeInfo[x][sMoney] -= 300;
			// 	PlayerInfo[playerid][pSungGang][2] = 30;
			// }
			else if(strcmp(result,"4",true) == 0) {
				ServerWeapon(playerid, 33, 300);
				SendClientMessage(playerid, COLOR_MONEY, "Ban da mua mot Rifle voi gia 535$.");
				SafeInfo[x][sMaterials] -= 400;
				SafeInfo[x][sMoney] -= 535;
				PlayerInfo[playerid][pSungGang][3] = 33;
			}				
			// else if(strcmp(result,"5",true) == 0) {
			// 	if(PlayerInfo[playerid][pRank] < 3) return SendClientMessage(playerid, COLOR_LIGHTBLUE, "Ban can dat rank 3 de order Combat Shotgun.");
			// 	ServerWeapon(playerid, 32, 400);
			// 	SendClientMessage(playerid, COLOR_MONEY, "Ban da mua mot TEC9 voi gia 450$.");
			// 	SafeInfo[x][sMaterials] -= 370;
			// 	SafeInfo[x][sMoney] -= 450;
			// }
			else if(strcmp(result,"8",true) == 0) {
				ServerWeapon(playerid, 25, 300);
				SendClientMessage(playerid, COLOR_MONEY, "Ban da mua mot Shotgun voi gia 300$.");
				SafeInfo[x][sMaterials] -= 320;
				SafeInfo[x][sMoney] -= 300;
				PlayerInfo[playerid][pSungGang][4] = 25;
			}	
			else if(strcmp(result,"9",true) == 0) {
				ServerWeapon(playerid, 29, 300);
				SendClientMessage(playerid, COLOR_MONEY, "Ban da mua mot MP5 voi gia 450$.");
				SafeInfo[x][sMaterials] -= 350;
				SafeInfo[x][sMoney] -= 450;
				PlayerInfo[playerid][pSungGang][5] = 29;
			}					
			else return 1;
			// else if(strcmp(result,"6",true) == 0) {
			// 	if(PlayerInfo[playerid][pRank] < 5) return SendClientMessage(playerid, COLOR_LIGHTBLUE, "Ban can dat rank 5 de order Combat Shotgun.");
			// 	ServerWeapon(playerid, 27, 200);
			// 	SendClientMessage(playerid, COLOR_MONEY, "Ban da mua mot Combat Shotgun voi gia 530$.");
			// 	SafeInfo[x][sMaterials] -= 250;
			// 	SafeInfo[x][sMoney] -= 530;
			// }
			// else if(strcmp(result,"7",true) == 0) {
			// 	if(PlayerInfo[playerid][pRank] < 6) return SendClientMessage(playerid, COLOR_LIGHTBLUE, "Ban can dat rank 7 de order Sniper.");
			// 	if(GetPlayerCash(playerid) < 200) return 1;
			// 	ServerWeapon(playerid, 34, 20);
			// 	SendClientMessage(playerid, COLOR_MONEY, "Ban da mua mot Sniper voi gia 500 vat lieu va 530$.");
			// 	SafeInfo[x][sMaterials] -= 500;
			// 	SafeInfo[x][sMoney] -= 530;
			// 	return 1;
			// }
			new gunid, str[100], gunname[32];
			switch(strval(result))
			{
				case 1: gunid = 24;
				case 2: gunid = 31;
				case 3: gunid = 30;
				case 4: gunid = 33;
				// case 5: gunid = 32;
				// case 6: gunid = 27;
			}
			GetWeaponName(gunid, gunname, sizeof(gunname));
			format(str, sizeof(str), "{00FF00}[!] {FFFFFF} %s thuoc faction %s da order 1 %s.", GetName(playerid), DynamicFactions[PlayerInfo[playerid][pMember]][fName], gunname);
			SendFactionMessage(PlayerInfo[playerid][pMember], COLOR_PURPLE, str);
			// SLog("Logs/FactionOrder.txt",str);
		}
		else
		{
			//if(!CAC_GetStatus(playerid)) return SendClientMessage(playerid, COLOR_RED, "Ban khong the lay sung vi chua cai dat SAMPCAC");
			if(PlayerInfo[playerid][pGunLic] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Ban khong co giay phep su dung sung. Hay tim mot giao vien de nho ho cap giay phep hoac mua o City Hall.");
			if(GetPlayerInterior(playerid) == 0) return SendClientMessage(playerid, COLOR_WHITE,"Ban khong o tai HQ.");
			new fid = PlayerInfo[playerid][pMember];
			if(!IsPlayerInRangeOfPoint(playerid, 100.0, DynamicFactions[fid][fcX], DynamicFactions[fid][fcY], DynamicFactions[fid][fcZ])) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o tai HQ!");
			//if(InWar[PlayerInfo[playerid][pMember]]) {} else return SendClientMessage(playerid, COLOR_LIGHTRED, "Ban khong the order sung khi Gang ban chua war, hay dong gop vat lieu de chuan bi nao!");
			new result[180];
			new x = PlayerInfo[playerid][pMember]-1;
			if(SafeInfo[x][sMaterials] < 1) return SendClientMessage(playerid, COLOR_CLIENT, "Khong co du vat lieu ben trong ket an toan!");
			if(SafeInfo[x][sMoney] < 1) return SendClientMessage(playerid, COLOR_CLIENT, "Khong co du tien ben trong ket an toan!");
			if(sscanf(params, "s[30]", result)) {
				SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/order <id>");
				SendClientMessage(playerid, COLOR_GRAD3, "1. Deagle - 200 ammo - 220$ - 200 vat lieu");
				if(InWar[PlayerInfo[playerid][pMember]] == 1) SendClientMessage(playerid, COLOR_GRAD3, "2. M4 - 600 ammo - 310$ - 400 vat lieu ( luc war ) - 320 vat lieu ( khong war )");
				//SendClientMessage(playerid, COLOR_GRAD3, "3. AK47 - 600 ammo - 300$ - 320 vat lieu");
				SendClientMessage(playerid, COLOR_GRAD3, "4. Rifle - 300 ammo - 535$ - 400 vat lieu");
				//SendClientMessage(playerid, COLOR_GRAD3, "5. TEC9 - 400 ammo - 450$ - 370 vat lieu");
				SendClientMessage(playerid, COLOR_GRAD3, "6. Combat Shotgun (rank 5) - 200 ammo - 530$ - 250 vat lieu");
				SendClientMessage(playerid, COLOR_GRAD3, "7. Sniper (rank 5) - 50 ammo - 530$ - 1k vat lieu");
				SendClientMessage(playerid, COLOR_GRAD3, "8. Shotgun - 600 ammo - 300$ - 320 vat lieu");
				SendClientMessage(playerid, COLOR_GRAD3, "9. MP5 - 600 ammo - 450$ - 350 vat lieu");
				SendClientMessage(playerid, COLOR_GRAD3, "Gun 2, 3, 5, 6, 7 tam khoa");
				return 1;
			}
			if(PlayerInfo[playerid][pGunLic] == 0) return SendClientMessage(playerid,-1,"Ban khong co giay phep su dung sung!");
			if(strcmp(result,"1",true) == 0) {
				ServerWeapon(playerid, 24, 200);
				SendClientMessage(playerid, COLOR_MONEY, "Ban da mua mot deagle voi gia 220$.");
				SafeInfo[x][sMaterials] -= 200;
				SafeInfo[x][sMoney] -= 220;
				PlayerInfo[playerid][pSungGang][0] = 24;
			}
			else if(strcmp(result,"2",true) == 0) {
				if(InWar[PlayerInfo[playerid][pMember]] != 1) SafeInfo[x][sMaterials] -= 80;
				ServerWeapon(playerid, 31, 600);
				SendClientMessage(playerid, COLOR_MONEY, "Ban da mua mot M4 voi gia 310$.");
				SafeInfo[x][sMaterials] -= 320;

				SafeInfo[x][sMoney] -= 310;
				PlayerInfo[playerid][pSungGang][1] = 31;
			}
			// else if(strcmp(result,"3",true) == 0) {
			// 	ServerWeapon(playerid, 30,600);
			// 	SendClientMessage(playerid, COLOR_MONEY, "Ban da mua mot AK47 voi gia 300$.");
			// 	SafeInfo[x][sMaterials] -= 320;
			// 	SafeInfo[x][sMoney] -= 300;
			// 	PlayerInfo[playerid][pSungGang][2] = 30;
			// }
			else if(strcmp(result,"4",true) == 0) {
				ServerWeapon(playerid, 33, 300);
				SendClientMessage(playerid, COLOR_MONEY, "Ban da mua mot Rifle voi gia 535$.");
				SafeInfo[x][sMaterials] -= 400;
				SafeInfo[x][sMoney] -= 535;
				PlayerInfo[playerid][pSungGang][3] = 33;
			}				
			// else if(strcmp(result,"5",true) == 0) {
			// 	if(PlayerInfo[playerid][pRank] < 3) return SendClientMessage(playerid, COLOR_LIGHTBLUE, "Ban can dat rank 3 de order Combat Shotgun.");
			// 	ServerWeapon(playerid, 32, 400);
			// 	SendClientMessage(playerid, COLOR_MONEY, "Ban da mua mot TEC9 voi gia 450$.");
			// 	SafeInfo[x][sMaterials] -= 370;
			// 	SafeInfo[x][sMoney] -= 450;
			// }
			else if(strcmp(result,"8",true) == 0) {
				ServerWeapon(playerid, 25, 300);
				SendClientMessage(playerid, COLOR_MONEY, "Ban da mua mot Shotgun voi gia 300$.");
				SafeInfo[x][sMaterials] -= 320;
				SafeInfo[x][sMoney] -= 300;
				PlayerInfo[playerid][pSungGang][4] = 25;
			}	
			else if(strcmp(result,"9",true) == 0) {
				ServerWeapon(playerid, 29, 300);
				SendClientMessage(playerid, COLOR_MONEY, "Ban da mua mot MP5 voi gia 450$.");
				SafeInfo[x][sMaterials] -= 350;
				SafeInfo[x][sMoney] -= 450;
				PlayerInfo[playerid][pSungGang][5] = 29;
			}					
			else return 1;
			// else if(strcmp(result,"6",true) == 0) {
			// 	if(PlayerInfo[playerid][pRank] < 5) return SendClientMessage(playerid, COLOR_LIGHTBLUE, "Ban can dat rank 5 de order Combat Shotgun.");
			// 	ServerWeapon(playerid, 27, 200);
			// 	SendClientMessage(playerid, COLOR_MONEY, "Ban da mua mot Combat Shotgun voi gia 530$.");
			// 	SafeInfo[x][sMaterials] -= 250;
			// 	SafeInfo[x][sMoney] -= 530;
			// }
			// else if(strcmp(result,"7",true) == 0) {
			// 	if(PlayerInfo[playerid][pRank] < 6) return SendClientMessage(playerid, COLOR_LIGHTBLUE, "Ban can dat rank 7 de order Sniper.");
			// 	if(GetPlayerCash(playerid) < 200) return 1;
			// 	ServerWeapon(playerid, 34, 20);
			// 	SendClientMessage(playerid, COLOR_MONEY, "Ban da mua mot Sniper voi gia 500 vat lieu va 530$.");
			// 	SafeInfo[x][sMaterials] -= 500;
			// 	SafeInfo[x][sMoney] -= 530;
			// 	return 1;
			// }
			new gunid, str[100], gunname[32];
			switch(strval(result))
			{
				case 1: gunid = 24;
				case 2: gunid = 31;
				case 3: gunid = 30;
				case 4: gunid = 33;
				// case 5: gunid = 32;
				// case 6: gunid = 27;
			}
			GetWeaponName(gunid, gunname, sizeof(gunname));
			format(str, sizeof(str), "{00FF00}[!] {FFFFFF} %s thuoc faction %s da order 1 %s.", GetName(playerid), DynamicFactions[PlayerInfo[playerid][pMember]][fName], gunname);
			SendFactionMessage(PlayerInfo[playerid][pMember], COLOR_PURPLE, str);
			// SLog("Logs/FactionOrder.txt",str);
		}
	}
	else SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la thanh vien cua mot to chuc Mafia.");
    return 1;
}

CMD:wars(playerid, params[]) {
	new string[256], wars;
	SendClientMessage(playerid, COLOR_MONEY, "[WARS]:");
	for(new i = 1; i < turfsss; i++) {
		if(WarInfo[i][wAttacker] != 0) {
			format(string, sizeof(string), "%s [diem: %0.2f] - %s [diem: %0.2f] tren dia ban %d. Thoi gian con lai: %s", FactionName(WarInfo[i][wAttacker]), WarScoreF[WarInfo[i][wAttacker]][InWarTurf[WarInfo[i][wAttacker]]], FactionName(WarInfo[i][wFaction]), WarScoreF[WarInfo[i][wFaction]][InWarTurf[WarInfo[i][wAttacker]]], i, CalculeazaTimp2(WarInfo[i][wTime]));
			SendClientMessage(playerid, -1, string);
			wars ++;
		}
	}
	if(wars == 0) SendClientMessage(playerid, -1, "Khong co war!");
	return 1;
}

CMD:megaphone(playerid, params[]) {
	new tmpcar = GetPlayerVehicleID(playerid),textmeg[250],string[200];
	if(PlayerInfo[playerid][pMuted] == 1) {
		format(string, sizeof(string), "Ban khong the noi chuyen ngay bay gio! Ban bi cam chat. (%d giay)",PlayerInfo[playerid][pMuteTime]);
		SendClientMessage(playerid, COLOR_GREY, string);
		return 1;
	}
	if(sscanf(params, "s[250]", textmeg)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/m <noi dung>");
	if(!IsACop(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la thanh vien cua mot tru so canh sat.");
	if(OnDuty[playerid] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: {FFFFFF} Ban chua onduty lam viec nhu mot canh sat!");
	if(!Copcar2(tmpcar)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong mot xe cua to chuc.");
	if(PlayerInfo[playerid][pMember] == 1||PlayerInfo[playerid][pLeader] == 1||PlayerInfo[playerid][pMember] == 15||PlayerInfo[playerid][pLeader] == 15) format(string, sizeof(string), "> Si quan %s: %s <", GetName(playerid), textmeg);
	else if(PlayerInfo[playerid][pMember] == 2||PlayerInfo[playerid][pLeader] == 2) format(string, sizeof(string), "> Dac nhiem %s: %s <", GetName(playerid), textmeg);
	else if(PlayerInfo[playerid][pMember] == 3||PlayerInfo[playerid][pLeader] == 3) format(string, sizeof(string), "> Linh %s: %s <", GetName(playerid), textmeg);
	ProxDetector(60.0, playerid, string,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
	return 1;
}

CMD:radio(playerid, params[]) {
	new radiomsj[120],sendername[MAX_PLAYER_NAME],string[200];
	if(PlayerInfo[playerid][pMuted] == 1) {
		format(string, sizeof(string), "Ban khong the noi chuyen ngay bay gio! Ban bi cam chat. (%d giay)",PlayerInfo[playerid][pMuteTime]);
		SendClientMessage(playerid, COLOR_GREY, string);
		return 1;
	}
	GetPlayerName(playerid, sendername, sizeof(sendername));
	if(FactionChat[PlayerInfo[playerid][pMember]] == 1 && PlayerInfo[playerid][pRank] < 6) return SendClientMessage(playerid, COLOR_GREY, "Chat to chuc da bi tat!");
	if(sscanf(params, "s[120]", radiomsj)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/r <noi dung>");
	if(PlayerInfo[playerid][pMember] == 1 || PlayerInfo[playerid][pLeader] == 1) format(string, sizeof(string), "* %s %s: %s, over.", GetRankName(playerid), sendername, radiomsj);
	else if(PlayerInfo[playerid][pMember] == 2 || PlayerInfo[playerid][pLeader] == 2) format(string, sizeof(string), "* %s %s: %s, over.", GetRankName(playerid), sendername, radiomsj);
	else if(PlayerInfo[playerid][pMember] == 3 || PlayerInfo[playerid][pLeader] == 3) format(string, sizeof(string), "* %s %s: %s, over.", GetRankName(playerid), sendername, radiomsj);
	else if(PlayerInfo[playerid][pMember] == 13 || PlayerInfo[playerid][pLeader] == 13) format(string, sizeof(string), "* %s %s: %s, over.", GetRankName(playerid), sendername, radiomsj);
	else if(PlayerInfo[playerid][pMember] == 15 || PlayerInfo[playerid][pLeader] == 15) format(string, sizeof(string), "* %s %s: %s, over.", GetRankName(playerid), sendername, radiomsj);
	else return  SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la thanh vien cua mot tru so canh sat.");
	SendRadioMessage(PlayerInfo[playerid][pMember], 0x8D8DFFFF, string);
	return 1;
}

CMD:duty(playerid, params[]) {
	if(PlayerInfo[playerid][pGunLic] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Ban khong co giay phep su dung sung. Hay tim mot giao vien de nho ho cap giay phep hoac mua o City Hall.");
	new string[200],sendername[MAX_PLAYER_NAME];
	GetPlayerName(playerid, sendername, sizeof(sendername));
	if(!IsACop(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la canh sat.");
	if(PlayerInfo[playerid][pSleeping] == 1) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Khong the su dung lenh nay khi dang ngu!");
	if(InHouse[playerid] > 0 || IsPlayerInRangeOfPoint(playerid, 150.0, 245.8297,112.4436,1003.2188) || IsPlayerInRangeOfPoint(playerid, 150.0, 236.3031,162.9478,1003.0300)) {
		if(GetPlayerInterior(playerid) != 0) {
			if(OnDuty[playerid] == 0) {
				if(PlayerInfo[playerid][pWantedLevel] != 0 || PlayerInfo[playerid][pJailTime] != 0) return SendClientMessage(playerid, COLOR_LGREEN, "Khong the su dung lenh nay khi ban dang bi truy na hoac ngoi tu.");
				format(string, 85, "%s lay may cay sung va huy hieu tu tu do cua anh ta.", sendername);
				ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				ServerWeapon(playerid, 24, 500);
				ServerWeapon(playerid, 3, 0);
				ServerWeapon(playerid, 41, 500);
				ServerWeapon(playerid, 29, 1000);
				ServerWeapon(playerid, 31, 1000);
				SetPlayerArmourEx(playerid, 99);
				SetPlayerHealthEx(playerid, 99);
				OnDuty[playerid] = 1;
				SetPlayerSkinEx(playerid, PlayerInfo[playerid][pChar]);
				SendClientMessage(playerid, -1, "Ban dang onduty lam viec nhu mot canh sat!");
			}
			else if(OnDuty[playerid]==1) {
				SendClientMessage(playerid, -1, "Ban da offduty!");
				format(string, sizeof(string), "%s cat huy hieu va dong phuc vao lai tu do.", sendername);
				ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				OnDuty[playerid] = 0;
				SetPlayerArmourEx(playerid, 0);
				ResetWeapons(playerid);
				SetPlayerSkinEx(playerid, 305);
				NearWanted[playerid] = 0;
				PlayerTextDrawHide(playerid, NearTD);
				tazer[playerid] = 0;
				//SendClientMessage(playerid, COLOR_LGREEN, "Tuy chon cua ban da tat tinh nang nay!");				
			}
			SetPlayerToTeamColor(playerid);
		}
		else SendClientMessage(playerid, COLOR_GREY, "Ban chi co the su dung lenh nay trong House hoac trong Police HQ.");
	}
	else SendClientMessage(playerid, COLOR_GREY, "Ban chi co the su dung lenh nay trong House hoac trong Police HQ.");
	return 1;
}

CMD:cf(playerid, params[]) {
	if(!IsACop(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la canh sat.");	
	new id, string[256];	
	if(sscanf(params, "u", id)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/cf <playerid/name>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong dang nhap.");
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return 1;
	if(!IsPlayerInVehicle(id, GetPlayerVehicleID(playerid))) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Nguoi choi do khong o trong xe cua ban!");
	if(PlayerInfo[id][pWantedLevel] > 0) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Nguoi choi do dang bi truy na!"); 
	format(string, sizeof(string), "* %s %s: Toi da bat duoc %s, over.", GetRankName(playerid), GetName(playerid), GetName(id));
	SendTeamMessage(3, COLOR_DEPART2, string);
	SendTeamMessage(2, COLOR_DEPART2, string);
	SendTeamMessage(1, COLOR_DEPART2, string);
	SendTeamMessage(15, COLOR_DEPART2, string);
	SendTeamMessage(14, COLOR_DEPART2, string);
	SendAdmin(COLOR_DEPART2, string);
	TogglePlayerControllable(id, false);
	format(string, sizeof(string), "* %s da bi %s cong tay.", GetName(playerid),GetName(id));
	ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	PlayerCuffed2[id] = 1;
	SetPlayerAttachedObject(id, 1, 19418, 6, -0.011000, 0.028000, -0.022000, -15.600012, -33.699977, -81.700035, 0.891999, 1.000000, 1.168000);
	SetPlayerSpecialAction(id,SPECIAL_ACTION_CUFFED);	
	return 1;
}

CMD:departments(playerid, params[]) {
	new text[250],sendername[MAX_PLAYER_NAME],string[200];
	if(PlayerInfo[playerid][pMuted] == 1)
	{
		format(string, sizeof(string), "Ban khong the noi chuyen ngay bay gio! Ban bi cam chat. (%d giay)",PlayerInfo[playerid][pMuteTime]);
		SendClientMessage(playerid, COLOR_GREY, string);
		return 1;
	}
	GetPlayerName(playerid, sendername, sizeof(sendername));
	if(sscanf(params, "s[250]", text)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/d <noi dung>");
	if(FaceReclama(text)) return RemoveFunction(playerid, text), Reclama(playerid, text);
	if(PlayerInfo[playerid][pMember] == 1 || PlayerInfo[playerid][pLeader] == 1) format(string, sizeof(string), "> [LSPD] %s %s: %s, over.", GetRankName(playerid), sendername, text);
	else if(PlayerInfo[playerid][pMember] == 2 || PlayerInfo[playerid][pLeader] == 2) format(string, sizeof(string), "> [FBI]* %s %s: %s, over.", GetRankName(playerid), sendername, text);
	else if(PlayerInfo[playerid][pMember] == 3 || PlayerInfo[playerid][pLeader] == 3) format(string, sizeof(string), "> [NG] %s %s: %s, over.", GetRankName(playerid), sendername, text);
	else if(PlayerInfo[playerid][pMember] == 13 || PlayerInfo[playerid][pLeader] == 13) format(string, sizeof(string), "> [FD] %s %s: %s, over.", GetRankName(playerid), sendername, text);
	else if(PlayerInfo[playerid][pMember] == 15 || PlayerInfo[playerid][pLeader] == 15) format(string, sizeof(string), "> [LVPD] %s %s: %s, over.", GetRankName(playerid), sendername, text);
	else if(PlayerInfo[playerid][pAdmin] != 0) format(string, sizeof(string), "* Admin %s: %s, over.", sendername, text);	
	else return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la thanh vien cua mot tru so canh sat.");
	SendTeamMessage(3, COLOR_DEPART2, string);
	SendTeamMessage(2, COLOR_DEPART2, string);
	SendTeamMessage(1, COLOR_DEPART2, string);
	SendTeamMessage(13, COLOR_DEPART2, string);
	SendTeamMessage(15, COLOR_DEPART2, string);
	SendAdmin(COLOR_DEPART2, string);	
	return 1;
}
CMD:confiscate(playerid, params[]) {
    if(!IsACop(playerid)) return SendClientMessage(playerid,  COLOR_GREY, "Ban khong phai la thanh vien cua mot tru so canh sat.");
	if(OnDuty[playerid] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: {FFFFFF} Ban chua onduty lam viec nhu mot canh sat!");
	new item[15],id,string[180],query[180];
	if(sscanf(params, "us[15]",id,item)) {
		SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/confiscate <playerid/name> <item>");
		SendClientMessage(playerid, COLOR_WHITE, "Items: Driving, Weapons, Drugs.");
		return 1;
	}
	if(id == INVALID_PLAYER_ID || !IsPlayerConnected(id)) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong dang nhap.");
	if(!ProxDetectorS(8.0, playerid, id)) return SendClientMessage(playerid, -1, "Nguoi choi do khong o gan ban.");
	if(IsACop(id) && OnDuty[id] == 1) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the tich thu vat pham cua mot canh sat!");
	if(strcmp(item,"driving",true) == 0) {
		if(PlayerInfo[id][pCarLic] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Nguoi choi khong co giay phep lai xe!");
		format(string, sizeof(string), "* Si quan %s da tich thu giay phep lai xe cua ban.", GetName(playerid));
		SendClientMessage(id, COLOR_LIGHTBLUE, string);
		PlayerInfo[id][pCarLic] = 0;
		PlayerInfo[id][pCarLicS] = 2;
		format(query,sizeof(query),"UPDATE users SET `CarLic`='0',`CarLicT`='0',`CarLicS`='2' WHERE `ID`='%d'",PlayerInfo[id][pSQLID]);
		mysql_query(SQL,query,false);
		UpdateFactionRaport(playerid, 3);	
	}
	else if(strcmp(item,"weapons",true) == 0) {
		if(HaveWeapons(playerid) == 0) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Nguoi choi khong co vu khi!");	
		format(string, sizeof(string), "* Si quan %s da tich thu vu khi cua ban.", GetName(playerid));
		SendClientMessage(id, COLOR_LIGHTBLUE, string);
		ResetWeapons(id);
		ResetWeapons(id);
	}
	else if(strcmp(item,"drugs",true) == 0) {
		if(PlayerInfo[id][pMatuy1]==0&&PlayerInfo[id][pMatuy2]==0) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Nguoi choi khong co can sa!");
		format(string, sizeof(string), "* Si quan %s da tich thu %d gram Indica, %d gram Sativa cua ban.", GetName(playerid), PlayerInfo[id][pMatuy1], PlayerInfo[id][pMatuy2]);
		SendClientMessage(id, COLOR_LIGHTBLUE, string);
		PlayerInfo[id][pMatuy1] = 0;
		PlayerInfo[id][pMatuy2] = 0;
		Update(id, pMatuy1x);
		Update(id, pMatuy2x);
		UpdateFactionRaport(playerid, 4);
	}
	else return SendClientMessage(playerid, COLOR_GREY, "Item invalid!");	
	format(string, sizeof(string), "* Si quan %s da tich thu %s cua %s.", GetName(playerid), item, GetName(id));
	SendTeamMessage(3, 0x2e64feFF, string);
	SendTeamMessage(2, 0x2e64feFF, string);
	SendTeamMessage(1, 0x2e64feFF, string);
	SendTeamMessage(15, 0x2e64feFF, string);
    return 1;
}

CMD:mdc(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] == 0) {
		if(!IsACop(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la thanh vien cua mot tru so canh sat.");
		if(OnDuty[playerid] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: {FFFFFF} Ban chua onduty lam viec nhu mot canh sat!");
	}	
	new id;
	if(sscanf(params, "u", id)) return SendClientMessage(playerid,COLOR_GREY, "Su dung: {FFFFFF}/mdc <playerid/name>"); {
		if(IsPlayerConnected(id)) ShowMDC(playerid, id);
		else SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong dang nhap.");
	}
	return 1;
}
CMD:rb(playerid, params[])
{
    if(!IsACop(playerid)) return SendClientMessage(playerid, COLOR_DARKNICERED, "Ban khong phai la mot phan cua doi.");
    if(PlayerInfo[playerid][pRank] < 2) return SendClientMessage(playerid, COLOR_DARKNICERED, "Ban khong dat it nhat rank 2.");
    if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_DARKNICERED, "Ban khong the su dung lenh nay ben trong mot phuong tien.");
    if(sscanf(params, "s[10]", params)) return SendClientMessage(playerid, COLOR_CLIENT, "/rb [add / delete / deleteall]");
    if(!strcmp(params, "add", true)) ShowModelSelectionMenu(playerid, cobj, "Road Blocks");
    if(!strcmp(params, "delete", true)) DeleteClosestRb(playerid);
    if(!strcmp(params, "deleteall", true)) DeleteAllRb(playerid);
    return 1;
}
CMD:suspect(playerid, params[]) {
	if(!IsACop(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong phai la thanh vien cua mot tru so canh sat!");
	if(OnDuty[playerid] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: {FFFFFF} Ban chua onduty lam viec nhu mot canh sat!");
	new id;
	if(sscanf(params, "u", id)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/suspect <playerid/name>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong ket noi!");
	if(id == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren chinh minh!");
	if(OnDuty[playerid] == 0) return 1;
	if(IsACop(id) && OnDuty[id] == 1) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the tich thu vat pham cua mot canh sat!");
	new szDialog[1024], szDialog2[1024];
	strcat(szDialog, "Ten\tCap do truy na\tThem vao danh sach truy na\n");
	for(new i = 0; i < 18; i++) {
		format(szDialog2, sizeof(szDialog2), "%s\t%d\t%s\n", wantedName(i), wantedList[i][0], (wantedList[i][1] == 1) ? ("Khong") : ("Co"));
		strcat(szDialog, szDialog2);
	}
	new title[180];
	format(title, sizeof(title), "%s (%d)", GetName(id), id);
	Dialog_Show(playerid, DIALOG_SUSPECT, DIALOG_STYLE_TABLIST_HEADERS, title, szDialog, "Select", "Cancel");	
	SetPVarInt(playerid, "Userid", id);
	return 1;
}

CMD:freepoints(playerid, params[]) {
	if(!IsACop(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la thanh vien cua mot tru so canh sat!");
	new string[180];
	format(string, sizeof(string), "Diem bao lanh: %d/10", PlayerInfo[playerid][pLawyer]);
	SendClientMessage(playerid, COLOR_LGREEN, string);
	return 1;
}

CMD:wanted(playerid, params[]) {
	if(!IsACop(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la thanh vien cua mot tru so canh sat.");
	if(OnDuty[playerid] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: {FFFFFF} Ban chua onduty lam viec nhu mot canh sat!");
	new istring[1024],string[300],count = 0,online[50];
	strcat(istring, "Ten\tCap do truy na\tRuot duoi boi\n");
	if(IsPlayerConnected(playerid)) {
		foreach(new i: Player) {
			if(PlayerInfo[i][pWantedLevel] >= 1) {
				SelectedPlayers[playerid][count] = i;
				string[0] = 0;
				format(string, sizeof(string), "%s (%d)\tCap do truy na %d\t%d cops\n",GetName(i),i,PlayerInfo[i][pWantedLevel],ChasedBy(i));
				count++;
				strcat(istring,string);
			}
		}
		format(online, sizeof(online),"Wanted online: %d",count);
		if(count == 0) return SendClientMessage(playerid,COLOR_GREY, "Khong co toi pham online.");
		Dialog_Show(playerid, DIALOG_WANTED, DIALOG_STYLE_TABLIST_HEADERS, online, istring , "Ok", "Exit");
	}
	return 1;
}
CMD:nearwanted(playerid, params[]) {
	if(!IsACop(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la thanh vien cua mot tru so canh sat.");
	if(OnDuty[playerid] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: {FFFFFF} Ban chua onduty lam viec nhu mot canh sat!");
	if(NearWanted[playerid] == 0) {
		NearWanted[playerid] = 1;
		PlayerTextDrawSetString(playerid, NearTD, "Loading...");
		PlayerTextDrawShow(playerid, NearTD);		
		SendClientMessage(playerid, COLOR_LGREEN, "Nhung nguoi choi danng bi truy na va o gan ban se duoc hien len o ben trai.");
	}
	else {
		NearWanted[playerid] = 0;
		PlayerTextDrawHide(playerid, NearTD);
		SendClientMessage(playerid, COLOR_LGREEN, "Tuy chon cua ban da tat tinh nang nay!");
	}	
	return 1;
}

CMD:sellhouse(playerid, params[]) return SendClientMessage(playerid, COLOR_LGREEN, "Cac lenh nay da duoc chuyen sang /housemenu!");
CMD:buyhouse(playerid, params[]) {
	new id, szQuery[256], newmoneys, moneys, string[180];
	foreach(new h : House) {
		if(IsPlayerInRangeOfPoint(playerid, 2.0, HouseInfo[h][hEntrancex], HouseInfo[h][hEntrancey], HouseInfo[h][hEntrancez])) {
			if(HouseInfo[h][hValue] == 0) return 1;
			if(PlayerInfo[playerid][pLevel] < HouseInfo[h][hLevel]) {
				format(string, sizeof(string), "Ban khong dat Level %d de mua.", HouseInfo[h][hLevel]);
				SendClientMessage(playerid, COLOR_WHITE, string);
				return 1;
			}
			if(PlayerInfo[playerid][pHouse] != 999 && strcmp(GetName(playerid), HouseInfo[PlayerInfo[playerid][pHouse]][hOwner], true) == 0) return SendClientMessage(playerid, COLOR_WHITE, "Ban da so huu mot ngoi nha.");
			if(GetPlayerCash(playerid) < HouseInfo[h][hValue]) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du tien de mua nha.");
			id = GetPlayerID(HouseInfo[h][hOwner]);
			if(id != INVALID_PLAYER_ID) {
				PlayerInfo[id][pHouse] = 999;
				Update(id, pHousex);
				PlayerInfo[id][pAccount] += HouseInfo[h][hValue];
				format(string, sizeof(string), "* %s mua ngoi nha cua ban voi gia {19CF2E}$%s{239931}. Tien da duoc chuyen vao tai khoan ngan hang cua ban.", GetName(playerid), FormatNumber(HouseInfo[h][hValue]));
				SendClientMessage(id, 0x239931FF, string);
				format(szQuery,sizeof(szQuery),"UPDATE users SET `Bank`='%d' WHERE `ID`='%d'",PlayerInfo[id][pAccount],PlayerInfo[id][pSQLID]);
				mysql_query(SQL,szQuery,false);			
			}
			else {
				format(szQuery, sizeof(szQuery), "SELECT * FROM `users` WHERE `name` = '%s'", HouseInfo[h][hOwner]);
				new Cache: result = mysql_query(SQL, szQuery);
				if(cache_num_rows() != 0) {
					cache_get_value_name_int(0, "Bank", moneys);
					newmoneys = moneys + HouseInfo[h][hValue];
				}
				cache_delete(result);
				format(szQuery, sizeof(szQuery), "UPDATE `users` SET `Bank` = '%d', `House` = '999' WHERE `name` = '%s'", newmoneys, HouseInfo[h][hOwner]);
				mysql_tquery(SQL, szQuery, "", "");				
			}
			InHouse[playerid] = h;
			PlayerInfo[playerid][pHouse] = HouseInfo[h][hID];
			PlayerInfo[playerid][pRented] = -1;
			HouseInfo[h][hOwned] = 1;
			format(HouseInfo[h][hOwner], 256, GetName(playerid));
			GivePlayerCash(playerid,-HouseInfo[h][hValue]);
			SetPlayerInterior(playerid,HouseInfo[h][hInterior]);
			SetPlayerPosEx(playerid,HouseInfo[h][hExitx],HouseInfo[h][hExity],HouseInfo[h][hExitz]);
			SetPlayerVirtualWorld(playerid,HouseInfo[h][hVirtual]);
			PlayerInfo[playerid][pInt] = HouseInfo[h][hInterior];
			PlayerInfo[playerid][pLocal] = h;
			HouseInfo[h][hValue] = 0;
			SendClientMessage(playerid, COLOR_MONEY, "Chuc mung! Ban da mua ngoi nha nay.");
			Update(playerid,pCashx);
			Update(playerid,pHousex);
			format(szQuery,sizeof(szQuery),"UPDATE `houses` SET `Owned`='1',`Owner`='%s',`Value`='0' WHERE `ID`='%d'",GetName(playerid),HouseInfo[h][hID]);
			mysql_query(SQL,szQuery,false);
			OnPropTextdrawUpdate(1,h);
			finishAchievement(playerid, 3);	
		}
	}
	return 1;
}

CMD:renters(playerid, params[]) return SendClientMessage(playerid, COLOR_LGREEN, "Cac lenh nay da duoc chuyen sang /housemenu!");
CMD:nguoithuephong(playerid, params[]) {
	new string[45], str1[400], str2[MAX_PLAYER_NAME];
	if(have_apartament(playerid) == -1) return 1;
	format(string, sizeof(string), "SELECT * FROM `users` WHERE `ReAp` = %d", have_apartament(playerid));
	new Cache: ab = mysql_query(SQL, string);
	for(new i; i < cache_num_rows(); i++) {
		cache_get_value_name(0, "name", str2);
		strcat(str1, str2);
		strcat(str1, "\n");
	}
	Dialog_Show(playerid, 0, DIALOG_STYLE_LIST, "Nguoi thue phong", str1, "Ok", "Cancel");
	cache_delete(ab);
	return 1;
}
CMD:rentroom(playerid, params[]) {
	if(IsPlayerConnected(playerid)) {
		new Float:oldposx, Float:oldposy, Float:oldposz,playername[MAX_PLAYER_NAME];
		GetPlayerName(playerid, playername, sizeof(playername));
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		for(new i = 1; i < 25; i++) {
			if(IsPlayerInRangeOfPoint(playerid, 3.0, apartamentInfo[i][apPos][0], apartamentInfo[i][apPos][1], apartamentInfo[i][apPos][2])) {
				if(have_apartament(playerid) > -1 || PlayerInfo[playerid][pRentedApartment] != 0) return SendClientMessage(playerid, -1, "Ban da so huu hoac thue mot can ho!");
				va_SendClientMessage(playerid, COLOR_YELLOW, "Chuc mung ban da thue can ho so %d, ban co the su dung /spawnchange de thay doi noi hoi sinh!", i);
				PlayerInfo[playerid][pRentedApartment] = i;
				UpdateVar(playerid, "ReAp", i);
				return 1;
			}
		}
		foreach(new h : House) {
			if(IsPlayerInRangeOfPoint(playerid,2.0, HouseInfo[h][hEntrancex], HouseInfo[h][hEntrancey], HouseInfo[h][hEntrancez]) && HouseInfo[h][hOwned] == 1 &&  HouseInfo[h][hRentabil] == 1) {
				if(PlayerInfo[playerid][pHouse] != 999 && strcmp(GetName(playerid), HouseInfo[PlayerInfo[playerid][pHouse]][hOwner], true) == 0) return SendClientMessage(playerid, COLOR_WHITE, "Ban da so huu mot ngoi nha.");
				if(GetPlayerCash(playerid) > HouseInfo[h][hRent]) {
					PlayerInfo[playerid][pRented] = HouseInfo[h][hID];
					PlayerInfo[playerid][pHouse] = HouseInfo[h][hID];
					InHouse[playerid] = h;
					GivePlayerCash(playerid,-HouseInfo[h][hRent]);
					HouseInfo[h][hTakings] += HouseInfo[h][hRent];
					SetPlayerInterior(playerid,HouseInfo[h][hInterior]);
					SetPlayerPosEx(playerid,HouseInfo[h][hExitx],HouseInfo[h][hExity],HouseInfo[h][hExitz]);
					SetPlayerVirtualWorld(playerid,HouseInfo[h][hVirtual]);
					PlayerInfo[playerid][pInt] = HouseInfo[h][hInterior];
					PlayerInfo[playerid][pLocal] = h;
					Update(playerid,pCashx);
					new str[128];
					format(str,sizeof(str),"UPDATE users SET `Rented`='%d',`House`='%d' WHERE `ID`='%d'",PlayerInfo[playerid][pRented],PlayerInfo[playerid][pRented],PlayerInfo[playerid][pSQLID]);
					mysql_query(SQL,str,false);
					format(str, sizeof(str),"UPDATE `houses` SET `Takings`='%d' WHERE `ID`='%d'",HouseInfo[h][hTakings], HouseInfo[h][hID]);
					mysql_query(SQL, str, false);
				 	return 1;
				}
				else SendClientMessage(playerid, COLOR_GREY, "Ban khong co du so tien can thiet.");
			}
		}
	}
	return 1;
}

CMD:bizmenu(playerid, params[]) {
	if(strlen(PlayerInfo[playerid][pPin]) != 0 && PlayerInfo[playerid][pPinLogged] == 0) {
		 SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay vi ban chua dang nhap PIN.");
		 SendClientMessage(playerid, COLOR_GREY, "De xac thuc, su dung '/loginpin'!");
		 return 1;
	}	
	new biz = PlayerInfo[playerid][pBizz];
	if(biz == 255) return SendClientMessage(playerid, COLOR_GREY, "Ban khong so huu mot doanh nghiep!");
	new string[180], open[64];
	if(BizzInfo[biz][bLocked] == 0) open = "Dong cua";
	else open = "Mo cua";
	format(string, sizeof(string), "Thong tin\nKet an toan\n%s\nDat ten\nPhi vao cua\nBan doanh nghiep\nRadio", open);
	Dialog_Show(playerid, DIALOG_BMENU, DIALOG_STYLE_LIST, "Business menu", string, "Ok", "Exit");	
	return 1;
}

CMD:housemenu(playerid, params[]) {
	if(strlen(PlayerInfo[playerid][pPin]) != 0 && PlayerInfo[playerid][pPinLogged] == 0) {
		 SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay vi ban chua dang nhap PIN.");
		 SendClientMessage(playerid, COLOR_GREY, "De xac thuc, su dung '/loginpin'!");
		 return 1;
	}
	if(PlayerInfo[playerid][pHouse] != 999 && strcmp(GetName(playerid), HouseInfo[PlayerInfo[playerid][pHouse]][hOwner], true) == 0) {
		new string[180], open[64];
		if(HouseInfo[PlayerInfo[playerid][pHouse]][hLock] == 0) open = "Dong cua";
		else open = "Mo cua";
		format(string, sizeof(string), "Thong tin\nNguoi thue nha\nKet an toan\n%s\nHouse upgrade\nDat ten\nDat tien thue phong\nBan nha\nRadio", open);
		Dialog_Show(playerid, DIALOG_HMENU, DIALOG_STYLE_LIST, "House menu", string, "Ok", "Exit");
	}
	else SendClientMessage(playerid, COLOR_GREY, "Ban khong co nha!");
	return 1;
}
CMD:housename(playerid, params[]) return SendClientMessage(playerid, COLOR_LGREEN, "Cac lenh nay da duoc chuyen sang /housemenu!");


CMD:evict(playerid, params[]) return SendClientMessage(playerid, COLOR_LGREEN, "Cac lenh nay da duoc chuyen sang /housemenu!");
CMD:evictall(playerid, params[]) return SendClientMessage(playerid, COLOR_LGREEN, "Cac lenh nay da duoc chuyen sang /housemenu!");

CMD:sellhousetostate(playerid, params[]) {
	if(strlen(PlayerInfo[playerid][pPin]) != 0 && PlayerInfo[playerid][pPinLogged] == 0) {
		 SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay vi ban chua dang nhap PIN.");
		 SendClientMessage(playerid, COLOR_GREY, "De xac thuc, su dung '/loginpin'!");
		 return 1;
	}	
	if(TradeID[playerid] != -1) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Ban khong the su dung thao tac nay khi ban dang trong mot cuoc giao dich!");
	new playername[25];
	GetPlayerName(playerid, playername, sizeof(playername));
	if(PlayerInfo[playerid][pHouse] == 999) return SendClientMessage(playerid, COLOR_GREY, "Ban khong so huu mot ngoi nha.");
	if(PlayerInfo[playerid][pHouse] != 999 && strcmp(GetName(playerid), HouseInfo[PlayerInfo[playerid][pHouse]][hOwner], true) == 0) Dialog_Show(playerid, DIALOG_SELLHOUSE, DIALOG_STYLE_MSGBOX, "Server:", "Ban co muon ban House voi gia $50,000 cho tieu bang?\nNeu ban bam nut 'Co', khong co cach nao de tro lai nhu truoc!", "Yes", "No");
	else SendClientMessage(playerid, COLOR_GREY, "Ban khong so huu mot ngoi nha.");
	return 1;
}
CMD:sellhouseto(playerid, params[]) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: {FFFFFF} Lenh nay da duoc chuyen qua mot lenh khac la lenh /giaodich.");
CMD:setrent(playerid, params[]) return SendClientMessage(playerid, COLOR_LGREEN, "Cac lenh nay da duoc chuyen sang /housemenu!");
CMD:setrentable(playerid, params[]) return SendClientMessage(playerid, COLOR_LGREEN, "Cac lenh nay da duoc chuyen sang /housemenu!");
CMD:hu(playerid, params[]) return SendClientMessage(playerid, COLOR_LGREEN, "Cac lenh nay da duoc chuyen sang /housemenu!");
CMD:newbie(playerid, params[]) {
	new result[200], string[255];
	if(IsPlayerLogged[playerid] == 0) return SendClientMessage(playerid, COLOR_RED, "Ban chua dang nhap!");
	if(Iter_Contains(PlayerHelped, playerid)) return SendClientMessage(playerid, -1, "Gan day ban da gui mot cau hoi. Dang cho de duoc tra loi!");
	if(sscanf(params, "s[200]", result)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/newbie <noi dung>");
	if(PlayerInfo[playerid][pNewbieMute] >= 1) {
		format(string, 56, "Ban phai doi %d giay de co the su dung lenh /newbie!", PlayerInfo[playerid][pNewbieMute]);
		SendClientMessage(playerid, -1, string);
		return 1;
	}
	if(PlayerInfo[playerid][pHelper] >= 1 || PlayerInfo[playerid][pAdmin] >= 1) {
		if(GetPVarInt(playerid, "Cover") == 0)
		return SendClientMessage(playerid, COLOR_WHITE, "Ban dang cai trang, ban khong the su dung lenh nay!");
	} 
	format(string, sizeof(string), "Cau hoi cua ban da duoc gui den Helper thanh cong. Vui long doi tra loi!");
	SendClientMessage(playerid, COLOR_YELLOW, string);
	HelpText[playerid] = "";
	format(HelpText[playerid], 256, result);
	PlayerInfo[playerid][pNewbieMute] = 120;
	Iter_Add(PlayerHelped, playerid);
	OnHelper[playerid] = 0;
	return 1;
}

CMD:propose(playerid, params[]) {
	new id, string[256];
	if(!IsPlayerInRangeOfPoint(playerid, 30.0, 940.7791,-1085.5411,24.2962)) return SendClientMessage(playerid, -1, "Ban khong o gan nha tho!");
	if(sscanf(params, "u", id)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/kethon <playerid>");
	if(id == INVALID_PLAYER_ID || !IsPlayerConnected(id)) return 1;
	if(id == playerid) return 1;
	if(!ProxDetectorS(3.0, playerid, id)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o gan nguoi choi do!");
	if(GetPVarInt(id, "ProposeID") == playerid) return SendClientMessage(playerid, -1, "Ban da gui mot yeu cau den nguoi choi do!");
	if(strcmp(PlayerInfo[playerid][pPropose], "Khong ai", true) == 0) { }
	else return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Ban da ket hon roi");
	if(strcmp(PlayerInfo[id][pPropose], "Khong ai", true) == 0) { }
	else return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Nguoi choi do da ket hon!");	
	format(string, sizeof(string), "%s muon cau hon ban. De chap nhan loi to tinh, su dung /chapnhan propose %d.", GetName(playerid), playerid);
	SendClientMessage(id, COLOR_LIGHTBLUE, string);
	format(string, sizeof(string), "Ban da gui cho %s mot loi cau hon!", GetName(id));
	SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
	SetPVarInt(id, "ProposeID", playerid);
	return 1;
}	
		
CMD:divorce(playerid, params[]) {
	if(!IsPlayerInRangeOfPoint(playerid, 30.0, 362.0491,173.6508,1008.3828)) return SendClientMessage(playerid, -1, "Ban khong o City Hall!");
	if(strcmp(PlayerInfo[playerid][pPropose], "Khong ai", true) == 0) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Ban chua ket hon!");
	if(GetPlayerCash(playerid) < 10000) return SendClientMessage(playerid, COLOR_GREY, "Ai nevoie de $10,000 pentru a da divort!");
	GivePlayerCash(playerid, -10000);
	new string[100], query[80];
	format(string, sizeof(string), "Mot cuoc ly hon da dien ra giua %s va %s.", GetName(playerid), PlayerInfo[playerid][pPropose]);
	SCMTA(COLOR_WHITE, string);
	format(query, sizeof(query), "UPDATE `users` SET `Propose`='Khong ai' WHERE `ID`='%d'", PlayerInfo[playerid][pSQLID]);
	mysql_query(SQL, query,false);
	format(query, sizeof(query), "UPDATE `users` SET `Propose`='Khong ai' WHERE `Propose`='%s'", PlayerInfo[playerid][pPropose]);
	mysql_query(SQL, query,false);	
	foreach(new i: Player) {
		if(IsPlayerConnected(i)) {
			if(strcmp(PlayerInfo[i][pPropose], GetName(playerid), true) == 0) format(PlayerInfo[i][pPropose], 9, "Khong ai");
		}	
	}
	format(PlayerInfo[playerid][pPropose], 9, "Khong ai");
	return 1;
}
CMD:buyparachute(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid,5,-2231.2058,-1736.1578,480.8620)) return SendClientMessage(playerid,COLOR_WHITE,"{FFB870}Ban khong o trong noi ban co the lay Parachute.");
	if(GetPlayerCash(playerid) < 10000) return SendClientMessage(playerid,COLOR_WHITE,"{FFB870}Ban khong co tien.");
    ServerWeapon(playerid, 46, 1);
    GivePlayerCash(playerid,-10000);
    SendClientMessage(playerid,COLOR_WHITE,"Ban mua du voi gia 10,000$.");
	Update(playerid, pCashx);
	return 1;
}
CMD:getgift(playerid, params[]) {
	// if(SpecialWeek == 1) return SendClientMessage(playerid, COLOR_LGREEN, "Giftbox chua duoc kich hoat!");
	new string[180], won[256];
	if(PlayerInfo[playerid][pGiftPoints] > 1)
    {
		if(PlayerInfo[playerid][pConnectTime] < 5) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong co 5 gio choi de nhan mon qua nay!");
		if(IsPlayerInRangeOfPoint(playerid, 25.0, 192.0716,-1825.4077,7.2670))
		{
			new rand = random(310);
			PlayerInfo[playerid][pGiftPoints] = 0;
			Update(playerid, pGiftPointsx);
			if(rand < 275)
			{
				new randmoney = 50000 + random(50000);
				PlayerInfo[playerid][pCash] += randmoney;
				GivePlayerCash(playerid, randmoney);
				format(won, sizeof(won), "Ban chien thang $%s tu hop qua!", FormatNumber(randmoney));
				format(string, sizeof(string), "%s da chien thang $%s tu hop qua!.", GetName(playerid), FormatNumber(randmoney));
				//InsertLog(playerid, string, LOG_GIFTBOX);
				ProxDetector(30.0,playerid, string, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW);	
				GiftMoney += randmoney;
			}
			else if(rand >= 275 && rand < 280)
			{
				new randrp = 10 + random(40);
				PlayerInfo[playerid][pPremiumPoints] += randrp;
				Update(playerid, pPremiumPointsx);
				format(won, sizeof(won), "Ban da chien thang %d "#DIEMCAOCAP" tu hop qua!", randrp);
				format(string, sizeof(string), "%s da chien thang %d "#DIEMCAOCAP" tu hop qua!.", GetName(playerid), randrp);
				//InsertLog(playerid, string, LOG_GIFTBOX);	
				ProxDetector(30.0,playerid, string, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW);	
				GiftGold += randrp;
				format(string, sizeof(string), "(( AdmBot: %s da chien thang %d "#DIEMCAOCAP" tu hop qua!! ))", GetName(playerid), randrp);
				SCMTA(COLOR_CLIENT, string);				
			}			
			else if(rand >= 280 && rand < 297)
			{
				new randrp = 1 + random(4);
				PlayerInfo[playerid][pExp] += randrp;
				Update(playerid, pRP);
				format(won, sizeof(won), "Ban da chien thang %d diem kinh nghiem tu hop qua!", randrp);
				format(string, sizeof(string), "%s da chien thang %d diem kinh nghiem tu hop qua!.", GetName(playerid), randrp);
				//InsertLog(playerid, string, LOG_GIFTBOX);
				ProxDetector(30.0,playerid, string, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW);		
				GiftRP += randrp;
				UpdateProgress(playerid, 0);
			}			
			else if(rand >= 297 && rand <= 300) {
				if(GiftVehicle < 60) {
					if(GetSlots(playerid) == GetVehicles(playerid)) {
						new randmoney = 100000 + random(50000);
						PlayerInfo[playerid][pCash] += randmoney;
						GivePlayerCash(playerid, randmoney);
						format(won, sizeof(won), "Ban chien thang $%s tu hop qua!", FormatNumber(randmoney));
						format(string, sizeof(string), "%s da chien thang $%s tu hop qua!.", GetName(playerid), FormatNumber(randmoney));
						//InsertLog(playerid, string, LOG_GIFTBOX);
						ProxDetector(30.0,playerid, string, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW);	
						GiftMoney += randmoney;				
					}
					else {
						GiftVehicle++;
						format(won, sizeof(won), "Chuc mung! Ban da chien thang xe Stretch tu hop qua!.");
						GiveVehicle(playerid, 409);
						format(string, sizeof(string), "(( AdmBot: %s da chien thang xe Stretch tu hop qua!! ))", GetName(playerid));
						SCMTA(COLOR_CLIENT, string);
						format(string, sizeof(string), "(( AdmBot: Ngoai ra %d xe con lai trong hop qua. ))", 60-GiftVehicle);
						SCMTA(COLOR_CLIENT, string);
						format(string, sizeof(string), "%s da chien thang mot chiec Stretch tu hop qua!.", GetName(playerid));
						//InsertLog(playerid, string, LOG_GIFTBOX);
					}
				}								
			}
			else if(rand > 300 && rand < 305)
			{
				new str[128];
				PlayerInfo[playerid][pCarLic] = 1;
				PlayerInfo[playerid][pCarLicT] += 30;
				PlayerInfo[playerid][pCarLicS] = 0;
				PlayerInfo[playerid][pFlyLic] = 1;
				PlayerInfo[playerid][pFlyLicT] += 30;
				PlayerInfo[playerid][pFlyLicS] = 0;
				PlayerInfo[playerid][pBoatLic] = 1;
				PlayerInfo[playerid][pBoatLicT] += 30;
				PlayerInfo[playerid][pBoatLicS] = 0;
				PlayerInfo[playerid][pGunLic] = 1;
				PlayerInfo[playerid][pGunLicT] += 30;
				PlayerInfo[playerid][pGunLicS] = 0;		
				format(str,128,"UPDATE users SET `CarLic`='1',`CarLicT`='%d',`CarLicS`='0' WHERE `ID`='%d'",PlayerInfo[playerid][pCarLicT],PlayerInfo[playerid][pSQLID]);
				mysql_query(SQL,str,false);
				format(str,128,"UPDATE users SET `FlyLic`='1',`FlyLicT`='%d',`FlyLicS`='0' WHERE `ID`='%d'",PlayerInfo[playerid][pFlyLicT],PlayerInfo[playerid][pSQLID]);
				mysql_query(SQL,str,false);
				format(str,128,"UPDATE users SET `BoatLic`='1',`BoatLicT`='%d',`BoatLicS`='0' WHERE `ID`='%d'",PlayerInfo[playerid][pBoatLicT],PlayerInfo[playerid][pSQLID]);
				mysql_query(SQL,str,false);
				format(str,128,"UPDATE users SET `GunLic`='1',`GunLicT`='%d', `GunLicS`='0' WHERE `ID`='%d'",PlayerInfo[playerid][pGunLicT],PlayerInfo[playerid][pSQLID]);
				mysql_query(SQL,str,false);
				format(won, sizeof(won), "Ban da nhan duoc tat ca giay phep co thoi han 30 gio!");
				format(string, sizeof(string), "%s da nhan duoc tat ca giay phep co thoi han 30 gio.", GetName(playerid));
				//InsertLog(playerid, string, LOG_GIFTBOX);	
				ProxDetector(30.0,playerid, string, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW);	
			}
			else if(rand > 305 && rand < 306) {
				if(PlayerInfo[playerid][pFpunish] == 0) {
					new randmoney = 50000 + random(50000);
					PlayerInfo[playerid][pCash] += randmoney;
					GivePlayerCash(playerid, randmoney);
					format(won, sizeof(won), "Ban chien thang $%s tu hop qua!", FormatNumber(randmoney));
					format(string, sizeof(string), "%s da chien thang $%s tu hop qua!.", GetName(playerid), FormatNumber(randmoney));
					//InsertLog(playerid, string, LOG_GIFTBOX);
					ProxDetector(30.0,playerid, string, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW);	
					GiftMoney += randmoney;				
				}
				else {
					PlayerInfo[playerid][pFpunish] = 0;
					Update(playerid, pFpunishx);
					format(won, sizeof(won), "Chuc mung! Ban da nhan duoc xoa FP.");
					format(string, sizeof(string), "%s da nhan duoc xoa FP.", GetName(playerid));
					//InsertLog(playerid, string, LOG_GIFTBOX);
					ProxDetector(30.0,playerid, string, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW);		
				}
			}				
			else if(rand > 306) {
				if(PlayerInfo[playerid][pWarns] == 0) {
					new randmoney = 100000 + random(50000);
					PlayerInfo[playerid][pCash] += randmoney;
					GivePlayerCash(playerid, randmoney);
					format(won, sizeof(won), "Ban chien thang $%s tu hop qua!", FormatNumber(randmoney));
					format(string, sizeof(string), "%s da chien thang $%s tu hop qua!.", GetName(playerid), FormatNumber(randmoney));
					//InsertLog(playerid, string, LOG_GIFTBOX);
					ProxDetector(30.0,playerid, string, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW);	
					GiftMoney += randmoney;				
				}
				else {
					PlayerInfo[playerid][pWarns] = 0;
					Update(playerid, pWarnsx);
					format(won, sizeof(won), "Chuc mung! Ban da nhan duoc xoa warn.");
					format(string, sizeof(string), "%s da nhan duoc xoa warn.", GetName(playerid));
					//InsertLog(playerid, string, LOG_GIFTBOX);	
					ProxDetector(30.0,playerid, string, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW);		
				}
			}
			else {
				new randmoney = 100000 + random(100000);
				PlayerInfo[playerid][pCash] += randmoney;
				GivePlayerCash(playerid, randmoney);
				format(won, sizeof(won), "Ban chien thang $%s tu hop qua!", FormatNumber(randmoney));
				format(string, sizeof(string), "%s da chien thang $%s tu hop qua!.", GetName(playerid), FormatNumber(randmoney));
				//InsertLog(playerid, string, LOG_GIFTBOX);
				ProxDetector(30.0,playerid, string, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW);	
				GiftMoney += randmoney;			
			}
			UpdateGift();
			Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Giftbox", won, "Ok", "");
		}
		else return SendClientMessage(playerid, COLOR_GREY, "Ban khong o vi tri hop qua! (/locations)");
	}
	else {
		format(string, sizeof(string), "Ban co the nhan mon qua nay khi ban co %d gio choi.", 2-PlayerInfo[playerid][pGiftPoints]);
		SendClientMessage(playerid, COLOR_YELLOW, string);
		SendClientMessage(playerid, COLOR_YELLOW, "So gio duoc tinh chi khi ban choi it nhat 30 phut cho den Payday.");
	}
	return 1;
}
CMD:deletecar(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 6) return 1;
	new id;
	if(sscanf(params, "i", id)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/deletecar <{FFB3B3}database id{FFFFFF}>");
	if(id < 1 || id > 25000) return SendClientMessage(playerid, COLOR_GREY, "ID xe trong co so du lieu khong hop le!");
	if(CarInfo[id][cID] == 0) return SendClientMessage(playerid, COLOR_GREY, "Xe khong ton tai trong co so du lieu!");
	if(CarInfo[id][Spawned] != 0) DestroyVehicle(CarInfo[id][Spawned]);
	
	VehicleOwned[CarInfo[id][Spawned]] = 0;
	VehicleSQL[CarInfo[id][Spawned]] = 0;	
	
	foreach(new i: Player) {
		if(IsPlayerConnected(i) && GetVehicles(i) != 0) {
			if(PlayerInfo[i][pCarKey][0] == id) {
				PlayerInfo[i][pCarKey][0] = 0;
				UpdateVar(i, "CarKey1", 0);
			}
			if(PlayerInfo[i][pCarKey][1] == id) {
				PlayerInfo[i][pCarKey][1] = 0;
				UpdateVar(i, "CarKey2", 0);
			}
			if(PlayerInfo[i][pCarKey][2] == id) {
				PlayerInfo[i][pCarKey][2] = 0;
				UpdateVar(i, "CarKey3", 0);
			}
			if(PlayerInfo[i][pCarKey][3] == id) {
				PlayerInfo[i][pCarKey][3] = 0;
				UpdateVar(i, "CarKey4", 0);
			}
			if(PlayerInfo[i][pCarKey][4] == id) {
				PlayerInfo[i][pCarKey][4] = 0;
				UpdateVar(i, "CarKey5", 0);
			}
			if(PlayerInfo[i][pCarKey][5] == id) {
				PlayerInfo[i][pCarKey][5] = 0;
				UpdateVar(i, "CarKey6", 0);
			}
			if(PlayerInfo[i][pCarKey][6] == id) {
				PlayerInfo[i][pCarKey][6] = 0;
				UpdateVar(i, "CarKey7", 0);
			}
			if(PlayerInfo[i][pCarKey][7] == id) {
				PlayerInfo[i][pCarKey][7] = 0;
				UpdateVar(i, "CarKey8", 0);
			}
			if(PlayerInfo[i][pCarKey][8] == id) {
				PlayerInfo[i][pCarKey][8] = 0;
				UpdateVar(i, "CarKey9", 0);
			}
			if(PlayerInfo[i][pCarKey][9] == id) {
				PlayerInfo[i][pCarKey][9] = 0;
				UpdateVar(i, "CarKey10", 0);
			}			
		}
	}
	
	new query[256], string[180];
	format(query, sizeof(query), "DELETE FROM `cars` WHERE `ID`='%d'", id);
	mysql_query(SQL, query,false);	
	format(string, sizeof(string), "Warning: %s da xoa xe ID %d thuoc so huu cua %s.", GetName(playerid), id, CarInfo[id][cOwner]);
	SendAdminMessage(COLOR_WARNING, string, 5);
	return 1;
}
CMD:afklist(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;
	new x, string[180];
	SendClientMessage(playerid, -1, "AFK List:");
	foreach(new i: Player) {
		if(IsPlayerConnected(i) && AFKSeconds[i] >= 60) {
			format(string, sizeof(string), "%s (%d) trong %d giay.", GetName(i), i, AFKSeconds[i]);
			SendClientMessage(playerid, COLOR_WHITE, string);
			x++;
		}
	}
	if(x == 0) return SendClientMessage(playerid, -1, "Khong co nguoi choi AFK!");
	else {
		format(string, sizeof(string), "* Hien tai co %d nguoi choi AFK!", x);
		SendClientMessage(playerid, COLOR_LGREEN, string);
	}
	return 1;
}
CMD:admins(playerid, params[]) {
	if(PlayerInfo[playerid][pLevel] < 3) return SendClientMessage(playerid, -1, "Lenh se mo khoa khi ban dat cap 3.");
	new string[128], count;
	format(string, sizeof(string), "---------------- Admin dang online ----------------");
	SendClientMessage(playerid, COLOR_WHITE, string);
	if(PlayerInfo[playerid][pAdmin] < 5) {
		for(new j=1;j<=7;j++) {
			foreach(new i: PlayerAdmins) {
				if(PlayerInfo[i][pAdmin] == j && GetPVarInt(i, "Cover") == 0) {
					format(string, sizeof(string), "%s %s (%d)", GetAdminRank(i), GetName(i),i);
					SendClientMessage(playerid, COLOR_WHITE, string);
					count++;
				}
			}
		}
	}
	else {
		for(new j=1;j<=7;j++) {
			foreach(new i: PlayerAdmins) {
				if(PlayerInfo[i][pAdmin] == j) {
					if(GetPVarInt(i, "Cover") == 1) format(string, sizeof(string), "%s %s (%d) - AFK %d phut. (%d giay.) - Cover: %s", GetAdminRank(i), PlayerInfo[i][pUsername],i, AFKSeconds[i]/60, AFKSeconds[i], GetName(i));
					else if(Spectate[i] != 255) format(string, sizeof(string), "%s %s (%d) - dang theo doi %s (%d)", GetAdminRank(i), PlayerInfo[i][pUsername],i, GetName(Spectate[i]), Spectate[i]);
					else format(string, sizeof(string), "%s %s (%d) - AFK %d phut. (%d giay.)", GetAdminRank(i), PlayerInfo[i][pUsername],i, AFKSeconds[i]/60, AFKSeconds[i]);
					SendClientMessage(playerid, COLOR_WHITE, string);
					count++;
				}
			}
		}		
	}
	format(string, sizeof(string), "{ADFF5C}* Co %d admin dang online.", count);
	SendClientMessage(playerid, COLOR_WHITE, string);
	SendClientMessage(playerid, COLOR_WHITE, "--------------------------------------------------------");
	return 1;
}
CMD:helpers(playerid, params[]) {

	SendClientMessage(playerid, COLOR_WHITE, "---------------- Helper dang online ----------------"); 

	foreach(new i: PlayerHelpers) va_SendClientMessage(playerid, COLOR_WHITE, "{%s}%s {FFFFFF}(%d) - Helper %d", (Iter_Contains(HelpersDuty, i)) ? ("98FF5C") : ("FF5C5C"), GetName(i), i, PlayerInfo[i][pHelper]);

	va_SendClientMessage(playerid, COLOR_WHITE, "{ADFF5C}* Co %d %s dang online o thoi diem hien tai.", Iter_Count(PlayerHelpers), ((Iter_Count(PlayerHelpers) == 1) ? "helper" : "helpers"));
 
	if(Iter_Count(HelpersDuty) >= 1 ) va_SendClientMessage(playerid, COLOR_WHITE, "{ADFF5C}* Co %d %s dang online va %d cau hoi o thoi diem hien tai.", Iter_Count(HelpersDuty), ((Iter_Count(HelpersDuty) == 1) ? "helper" : "helpers"), Iter_Count(PlayerHelped));
	SendClientMessage(playerid, COLOR_WHITE, "--------------------------------------------------------");

	return true;
} 
CMD:youtubers(playerid, params[]) {
	new gstring[128];
 
	foreach(new i: PlayerYoutuber) {
		format(gstring, sizeof(gstring), "{FF6347}%s (%d){FFFFFF}", GetName(i), i);
		SendClientMessage(playerid, COLOR_GREY, gstring);
	}

	format(gstring, sizeof(gstring), "{ADFF5C}* Co %d Youtuber dang online.", Iter_Count(PlayerYoutuber));
	SendClientMessage(playerid, COLOR_GREY, gstring);

	return true;	
}
CMD:find(playerid, params[]) {
	if(JobWorking[playerid] == 1) return 1;
	if(CP[playerid] != 0 || targetfind[playerid] != -1) return Dialog_Show(playerid, DIALOG_CHECKPOINT, DIALOG_STYLE_MSGBOX, "Checkpoint", "Mot cham do dang hoat dong.\nBan co muon xoa no khong? Neu muon, hay chon 'Ok'.", "Ok", "Exit");
	new id,giveplayer[30],string[100];
	if(PlayerInfo[playerid][pJob] != 8 && PlayerInfo[playerid][pMember] != 11 && !IsACop(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Cong viec cua ban khong phai la Tham Tu.");
	if(sscanf(params, "u",id)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/find <playerid/name>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong dang nhap.");
	if(Spectate[id] != 255) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do dan ban!");
	if(id == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay tren chinh minh!");
	if(togfind[id] == 1) return SendClientMessage(playerid,COLOR_GREY, "Ban khong the tim kiem nguoi choi nay!");
	if(GetPVarInt(id, "Undercover") == 1) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do dan ban!");
	if(BizRobbed[playerid] != 0) return 1;
	if(togfind[id] == 1 && OnDuty[playerid] == 0 && PlayerHit[playerid] == -1) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Ban khong the tim kiem nguoi choi nay!"); 
	UsedFind[playerid] = 1;
	GetPlayerName(id, giveplayer, sizeof(giveplayer));
	new Float:X,Float:Y,Float:Z;
	GetPlayerPos(id, X,Y,Z);
	SetPlayerCheckpointEx(playerid, X,Y,Z, 3.5);
	targetfind[playerid] = id;
	CP[playerid] = 53;
	format(string, sizeof(string), "* Cham do duoc dat tai vi tri cua %s (ID %d), khu vuc %s.",giveplayer, id,GetPlayerZone(id));
	SendClientMessage(playerid,COLOR_YELLOW,string);
	
 	return 1;
}
CMD:id(playerid, params[]) {
	new names[64], giveplayer[25], x, sstring[180];
	if(sscanf(params, "s[64]", names)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/id <playerid/name>");
	if(strlen(names) > 24) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi khong ket noi.");
	if(IsNumeric(names)) {
		if(strval(names) >= 1000) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi khong ket noi.");
	}
	if(IsNumeric(names)) {
		if(x < 10) {
			if(strval(names) < 0 || strval(names) > 999) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi khong ket noi."); 
			new i = strval(names);
			if((-1 < i < MAX_PLAYERS) && IsPlayerLogged[i] == 0) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi khong ket noi.");
			GetPlayerName(i, giveplayer, sizeof(giveplayer));
			new szRankk[180];
			if(PlayerInfo[i][pMember] != 0) format(szRankk, sizeof(szRankk), " (rank %d)", PlayerInfo[i][pRank]);
			if(GetPVarInt(i, "Cover") == 1) {
				format(sstring, sizeof(sstring), "(ID %d) Ten: %s | Level: %d | To chuc: Civil | FPS: %d",i,giveplayer,GetPlayerScore(i), FPS2[i]);
				SendClientMessage(playerid, COLOR_WHITE, sstring);
				return 1;
			}
			new name[180];
			format(name, sizeof(name), "%s", GetName(i));
			new clan = PlayerInfo[i][pClan];					
			if(PlayerInfo[i][pSleeping] == 1 || AFKSeconds[i] >= 5) {
				if(clan != 0 && PlayerInfo[i][pTag] == 0) format(name, sizeof(name), "{%s}%s{AFAFAF}%s", ClanInfo[clan][clColor], ClanInfo[clan][clTag], GetName(i));
				else if(clan != 0 && PlayerInfo[i][pTag] == 1) format(name, sizeof(name), "%s{%s}%s{AFAFAF}", GetName(i), ClanInfo[clan][clColor], ClanInfo[clan][clTag]);								
			}
			else {
				if(clan != 0 && PlayerInfo[i][pTag] == 0) format(name, sizeof(name), "{%s}%s{FFFFFF}%s", ClanInfo[clan][clColor], ClanInfo[clan][clTag], GetName(i));
				else if(clan != 0 && PlayerInfo[i][pTag] == 1) format(name, sizeof(name), "%s{%s}%s{FFFFFF}", GetName(i), ClanInfo[clan][clColor], ClanInfo[clan][clTag]);									
			}
			format(sstring, sizeof(sstring), "(ID %d) %s | Level: %d | To chuc: %s%s | FPS: %d",i,name,PlayerInfo[i][pLevel],FactionName(PlayerInfo[i][pMember]),szRankk, FPS2[i]);
			SendClientMessage(playerid, COLOR_WHITE, sstring);
				
			x++;
			return 1;
		}
	}	
	foreach(new i: Player) {
		if(IsPlayerConnected(i) && IsPlayerLogged[i] == 1) {					
			if(strfind(GetNameEx(i), names, true) != -1) {
				if(x < 10) {
					if(i == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi khong ket noi."); 
					GetPlayerName(i, giveplayer, sizeof(giveplayer));
					new szRankk[180];
					if(PlayerInfo[i][pMember] != 0) format(szRankk, sizeof(szRankk), " (Rank %d)", PlayerInfo[i][pRank]);
					if(GetPVarInt(i, "Cover") == 1) {
						format(sstring, sizeof(sstring), "(ID %d) Ten: %s | Level: %d | To chuc: Civil | FPS: %d",i,giveplayer,GetPlayerScore(i), FPS2[i]);
						SendClientMessage(playerid, COLOR_WHITE, sstring);
						return 1;
					}
					new name[180];
					format(name, sizeof(name), "%s", GetName(i));
					new clan = PlayerInfo[i][pClan];
					if(PlayerInfo[i][pSleeping] == 1 || AFKSeconds[i] >= 5) {
						if(clan != 0 && PlayerInfo[i][pTag] == 0) format(name, sizeof(name), "{%s}%s{AFAFAF}%s", ClanInfo[clan][clColor], ClanInfo[clan][clTag], GetName(i));
						else if(clan != 0 && PlayerInfo[i][pTag] == 1) format(name, sizeof(name), "%s{%s}%s{AFAFAF}", GetName(i), ClanInfo[clan][clColor], ClanInfo[clan][clTag]);								
					}
					else {
						if(clan != 0 && PlayerInfo[i][pTag] == 0) format(name, sizeof(name), "{%s}%s{FFFFFF}%s", ClanInfo[clan][clColor], ClanInfo[clan][clTag], GetName(i));
						else if(clan != 0 && PlayerInfo[i][pTag] == 1) format(name, sizeof(name), "%s{%s}%s{FFFFFF}", GetName(i), ClanInfo[clan][clColor], ClanInfo[clan][clTag]);									
					}
					format(sstring, sizeof(sstring), "(ID %d) %s | Level: %d | To chuc: %s%s | FPS: %d",i,name,PlayerInfo[i][pLevel],FactionName(PlayerInfo[i][pMember]),szRankk, FPS2[i]);
					SendClientMessage(playerid, COLOR_WHITE, sstring);
		
					x++;
				}	
			}											
		}
	}
	if(x == 0) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi khong ket noi.");
	if(x == 10) SendClientMessage(playerid, COLOR_WHITE, "Chi co 10 ket qua duoc hien thi.");
	return 1;
}
CMD:sleep(playerid, params[]) {
	if(GetPlayerInterior(playerid) == 0) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o ben trong mot can nha.");
	if(InHouse[playerid] != PlayerInfo[playerid][pHouse]) return SendClientMessage(playerid, -1, "Ban khong thue nha nay!");
	if(PlayerInfo[playerid][pWantedLevel] != 0) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the ngu vi canh sat dang tim kiem ban.");
	if(PlayerInfo[playerid][pSleeping] == 0) {
		PlayerInfo[playerid][pSleeping] = 1;
		TogglePlayerControllable(playerid,false);
		SendClientMessage(playerid, COLOR_LGREEN, "Ban bat dau ngu!");
		SendClientMessage(playerid, COLOR_LGREEN, "[SLEEP] Neu ban muon thoat khoi tro choi an toan, chung toi khuyen ban nen nhan phim ESC truoc de tranh cac su co.");
		LoopingAnim(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
		SetPlayerHealthEx(playerid, 99);
		SetPlayerColor(playerid, COLOR_GREY);
		Freezed[playerid] = 1;
		UpdateVar(playerid, "Status", 2);
		if(OnDuty[playerid] == 1) SetPlayerSkinEx(playerid, 305);
		OnDuty[playerid] = 0;
		SetPlayerArmourEx(playerid, 0);
		ResetWeapons(playerid);
		
		NearWanted[playerid] = 0;
		PlayerTextDrawHide(playerid, NearTD);
		tazer[playerid] = 0;	
	}
	else if(PlayerInfo[playerid][pSleeping] == 1) {
		PlayerInfo[playerid][pSleeping] = 0;
		TogglePlayerControllable(playerid,true);
		ClearAnimations(playerid);
		SendClientMessage(playerid, COLOR_LGREEN, "Chao mung ban da tro lai!");
		SetPlayerToTeamColor(playerid);
		SetPlayerHealthEx(playerid, 99);
		Freezed[playerid] = 0;
		UpdateVar(playerid, "Status", 1);
	}
	return 1;
}
CMD:calls(playerid, params[]) {
	new fid = PlayerInfo[playerid][pMember];
	if(fid == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong phai la thanh vien cua mot to chuc!");
	if(fid != 12 && fid != 13 && fid != 8 && fid != 7) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Lenh nay khong ho tro cho to chuc cua ban!");
	//if(BizRobbed[playerid] != 0) return 1;
	new 
		szDialog[512], szDialog2[512], x,
		szZone[128], Float: Pos[3], Float:distance;
	
	strcat(szDialog2, "Nguoi choi\tDia diem\n");

	switch(fid) {
		case 12: {
			foreach(new i: Player) {
				if(IsPlayerConnected(i) && TaxiService[i] == 1 && AcceptedTaxiService[i] == 0) {
					SelectedPlayers[playerid][x] = i;
					distance = GetDistanceBetweenPlayers(playerid,i);
					GetPlayerPos(i, Pos[0], Pos[1], Pos[2]);
					GetPlayer3DZone2(Pos[0], Pos[1], Pos[2], szZone, sizeof(szZone));				
					format(szDialog, sizeof(szDialog), "%s (%d)\t%s - %0.1fm\n", GetName(i), i, szZone, distance);
					strcat(szDialog2, szDialog);
					x++;
				}
			}
		}
		case 13: {
			foreach(new i: Player) {
				if(MedicCall[i] == i) {
					SelectedPlayers[playerid][x] = i;
					distance = GetDistanceBetweenPlayers(playerid,i);
					GetPlayerPos(i, Pos[0], Pos[1], Pos[2]);
					GetPlayer3DZone2(Pos[0], Pos[1], Pos[2], szZone, sizeof(szZone));				
					format(szDialog, sizeof(szDialog), "%s (%d)\t%s - %0.1fm\n", GetName(i), i, szZone, distance);
					strcat(szDialog2, szDialog);
					x++;
				}
			}
		}
		case 8: {
			foreach(new i: Player) {
				if(MechanicCall[i] == i) {
					SelectedPlayers[playerid][x] = i;
					distance = GetDistanceBetweenPlayers(playerid,i);
					GetPlayerPos(i, Pos[0], Pos[1], Pos[2]);
					GetPlayer3DZone2(Pos[0], Pos[1], Pos[2], szZone, sizeof(szZone));				
					format(szDialog, sizeof(szDialog), "%s (%d)\t%s - %0.1fm\n", GetName(i), i, szZone, distance);
					strcat(szDialog2, szDialog);
					x++;
				}
			}
		}	
		case 7: {
			foreach(new i: Player) {
				if(InstructorCall[i] == 1) {
					SelectedPlayers[playerid][x] = i;
					distance = GetDistanceBetweenPlayers(playerid,i);
					GetPlayerPos(i, Pos[0], Pos[1], Pos[2]);
					GetPlayer3DZone2(Pos[0], Pos[1], Pos[2], szZone, sizeof(szZone));				
					format(szDialog, sizeof(szDialog), "%s (%d)\t%s - %0.1fm\n", GetName(i), i, szZone, distance);
					strcat(szDialog2, szDialog);
					x++;
				}
			}
		}			
	}
	if(x == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Chua co ai goi dich vu den to chuc cua ban vao luc nay!");
	
	new title[64];
	format(title, sizeof(title), "Cuoc goi cua %s: %d", FactionName(fid), x);
	Dialog_Show(playerid, DIALOG_CALLS, DIALOG_STYLE_TABLIST_HEADERS, title, szDialog2, "Select", "Cancel");
	return 1;
}
CMD:service(playerid, params[]) {
	new item[180],string[256];
	if(PlayerInfo[playerid][pJailTime] != 0) return 1;
	if(DeelayCommand[playerid][3] > 0) return DeelayTime(playerid, 3);
	if(sscanf(params, "s[180]",item)) {
		SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/service <name>");
		SendClientMessage(playerid, COLOR_WHITE, "Co san: Taxi, Medic, Mechanic, Instructor.");
		return 1;
	}
	new szZone[128], Float: Pos[3];
	GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
	GetPlayer3DZone2(Pos[0], Pos[1], Pos[2], szZone, sizeof(szZone));
				
	if(strcmp(item,"taxi",true) == 0) {
		if(PlayerInfo[playerid][pMember] == 12) return 1;
		if(IsInBlacklist(playerid, 12)) return SendClientMessage(playerid, -1, "Ban dang o trong danh sach den cua to chuc nay, ban khong the su dung cac dich vu cua ho!");
		if(TaxiService[playerid] == 1) return SendClientMessage(playerid, COLOR_GREY, "Ban da goi lai dich vu nay, xin doi phan hoi.");
		TaxiService[playerid] = 1;
		AcceptedTaxiService[playerid] = 0;
		format(string, sizeof(string), "**(( Taxi Dispatch: %s (%d) can mot chiec taxi den khu vuc %s. ))**", GetName(playerid), playerid, szZone);
		SendFactionMessage(12, 0x2C6CBFFF, string);		
		SendClientMessage(playerid, COLOR_WHITE, "Ban da goi dich vu taxi. Xin hay doi phan hoi!");
	}	
	else if(strcmp(item,"medic",true) == 0) {
		if(PlayerInfo[playerid][pMember] == 13) return 1;
		if(IsInBlacklist(playerid, 14)) return SendClientMessage(playerid, -1, "Ban dang o trong danh sach den cua to chuc nay, ban khong the su dung cac dich vu cua ho!");				
		if(MedicCall[playerid] == playerid) return SendClientMessage(playerid, -1, "Ban da goi lai dich vu nay, xin doi phan hoi.");
		format(string, sizeof(string), "**(( Paramedic Dispatch: %s (%d) dang can mot nhan vien y te den khu vuc %s. ))**", GetName(playerid),playerid, szZone);
		SendFactionMessage(13, COLOR_LIGHTBLUE, string);
		SendClientMessage(playerid, COLOR_WHITE, "* Ban da goi dich vu medic, xin doi phan hoi.");
		MedicCall[playerid] = playerid;
		return 1;
	}
	else if(strcmp(item,"mechanic",true) == 0) {
		if(PlayerInfo[playerid][pMember] == 8) return 1;
		if(IsInBlacklist(playerid, 8)) return SendClientMessage(playerid, -1, "Ban dang o trong danh sach den cua to chuc nay, ban khong the su dung cac dich vu cua ho!");	
		if(MechanicCall[playerid] == playerid) return SendClientMessage(playerid, -1, "Ban da goi lai dich vu nay, xin doi phan hoi.");
		format(string, sizeof(string), "**(( TTC Dispatch: %s (%d) dang can mot tho co khi den khu vuc %s. ))**", GetName(playerid),playerid, szZone);
		SendFactionMessage(8, COLOR_LIGHTBLUE, string);
		SendClientMessage(playerid, COLOR_WHITE, "* Ban da goi dich vu mechanic, xin doi phan hoi.");
		MechanicCall[playerid] = playerid;
		return 1;
	}	
	else if(strcmp(item,"instructor",true) == 0) {
		if(PlayerInfo[playerid][pMember] == 7) return 1;
		if(IsInBlacklist(playerid, 7)) return SendClientMessage(playerid, -1, "Ban dang o trong danh sach den cua to chuc nay, ban khong the su dung cac dich vu cua ho!");				
		if(InstructorCall[playerid] == 1) return SendClientMessage(playerid, -1, "Ban da goi lai dich vu nay, xin doi phan hoi.");
		format(string, sizeof(string), "**(( SI Dispatch: %s (%d) dang can mot giao vien den khu vuc %s. ))**", GetName(playerid),playerid, szZone);
		SendFactionMessage(7, COLOR_LIGHTBLUE, string);
		SendClientMessage(playerid, COLOR_WHITE, "* Ban da goi dich vu instructor, xin doi phan hoi.");
		InstructorCall[playerid] = 1;
		return 1;
	}			
	else return SendClientMessage(playerid, COLOR_WHITE, "Co san: Taxi, Medic, Mechanic, Instructor.");
	DeelayCommand[playerid][3] = 60*5;
	return 1;
}
CMD:cancel(playerid, params[]) {
	new item[180], string[180];
	if(sscanf(params, "s[180]",item)) {
		SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/cancel <name>");
		SendClientMessage(playerid, COLOR_WHITE, "Co san: Drugs, Repair, Live, House, Taxi, Medic, Mechanic, Ticket, Refill, Materials, Trade, Instructor, Requestevent, Command.");
		return 1;
	}
    if(strcmp(params,"event",true) == 0)
    {
		if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_LIGHTRED, AdminOnly);
		if(TEvent == 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Hien khong co su kien nao dang dien ra, admin luoi bieng vl.");
		switch(TEvent)
		{
			case 1: TEvent = 0, format(string, sizeof(string), "{C22124}(( {F2F2F2}AdmBot: Fast Event da duoc dong lai boi Admin %s {C22124}))", GetName(playerid)), SCMTA(COLOR_RED, string);
			case 2: TEvent = 0, format(string, sizeof(string), "{C22124}(( {F2F2F2}AdmBot: Scramble Event da duoc dong lai boi Admin %s {C22124}))", GetName(playerid)), SCMTA(COLOR_RED, string);
			case 3: TEvent = 0, format(string, sizeof(string), "{C22124}(( {F2F2F2}AdmBot: Math Event da duoc dong lai boi Admin %s {C22124}))", GetName(playerid)), SCMTA(COLOR_RED, string);
			case 4: TEvent = 0, format(string, sizeof(string), "{C22124}(( {F2F2F2}AdmBot: Trivia Event da duoc dong lai boi Admin %s {C22124}))", GetName(playerid)), SCMTA(COLOR_RED, string);
		}
    }	
	if(strcmp(item,"taxi",true) == 0) {
		if(TaxiService[playerid] == 0) return SendClientMessage(playerid, COLOR_GREY, "Ban chua goi dich vu nay");
		format(string, sizeof(string), "**(( Taxi Dispatch: %s (%d) khong con can taxi nua. ))**", GetName(playerid), playerid);
		SendFactionMessage(12, 0x2C6CBFFF, string);
		SendClientMessage(playerid, COLOR_WHITE, "Ban da huy dich vu nay.");
		TaxiService[playerid] = 0;
		AcceptedTaxiService[playerid] = 0;
		PlayerTextDrawHide(playerid, FindTD);
		foreach(new i: Player) {
			if(IsPlayerConnected(i) && AcceptedService[i] == playerid) {
				targetfind[i] = -1;
				CP[i] = 0;
				DisablePlayerCheckpointEx(i);
				AcceptedService[i] = -1;
				SendClientMessage(i, COLOR_YELLOW, "Nguoi choi goi dich vu ma ban vua chap nhan da huy dich vu.");
			}
		}
	}
	else if(strcmp(item,"command",true) == 0) {
		if(AcceptedService[playerid] == -1) return 1;
		AcceptedTaxiService[AcceptedService[playerid]] = 0;
		format(string, sizeof(string), "**(( Taxi Dispatch: Taxi Driver %s (%d) da huy yeu cau taxi cua %s (%d). Ban co the chap nhan yeu cau nay, su dung (/chapnhan taxi). ))**", GetName(playerid), playerid, GetName(AcceptedService[playerid]), AcceptedService[playerid]);
		SendFactionMessage(12, 0x2C6CBFFF, string);
		format(string, sizeof(string), "Ban da tu bo yeu cau taxi nay!");
		SendClientMessage(playerid, COLOR_WHITE, string);
		format(string, sizeof(string), "Taxi Driver %s da huy bo yeu cau taxi cua ban. Hay cho doi mot nguoi khac chap nhan yeu cau cua ban.", GetName(playerid));
		SendClientMessage(AcceptedService[playerid], COLOR_YELLOW, string);
		AcceptedService[playerid] = -1;
		targetfind[playerid] = -1;
		CP[playerid] = 0;
		DisablePlayerCheckpointEx(playerid);	
	}		
	else if(strcmp(item,"requestevent",true) == 0) {
		if(requestingevent[playerid] == 0) return SendClientMessage(playerid, 0xFFFFFFFF, "Ban khong duoc moi den mot su kien.");
		requestingevent[playerid] = 0;
		SendClientMessage(playerid, COLOR_LGREEN, "Yeu cau su kien da bi huy!");
	}		
	else if(strcmp(item,"mechanic",true) == 0) {
		if(MechanicCall[playerid] != playerid) return SendClientMessage(playerid, -1, "Nguoi choi do khong su dung dich vu nay!");
		MechanicCall[playerid] = -1;
		format(string, sizeof(string), "**(( TTC Dispatch: %s (%d) khong con can tho co khi nua. ))**", GetName(playerid), playerid);
		SendFactionMessage(8, COLOR_LIGHTBLUE, string);
		SendClientMessage(playerid, -1, "Ban da bo dich vu nay.");
	}
	else if(strcmp(item,"instructor",true) == 0) {
		if(InstructorCall[playerid] == 0) return SendClientMessage(playerid, -1, "Nguoi choi do khong su dung dich vu nay!");			
		InstructorCall[playerid] = 0;
		format(string, sizeof(string), "**(( SI Dispatch: %s (%d) khong con can mot giao vien nua. ))**", GetName(playerid), playerid);
		SendFactionMessage(7, COLOR_LIGHTBLUE, string);
		SendClientMessage(playerid, -1, "Ban da bo dich vu nay.");
	}		
	else if(strcmp(item,"trade",true) == 0) {
		if(TradePlayer[playerid] == -1) return SendClientMessage(playerid, -1, "Ban khong nhan duoc loi de nghi nao!");
		TradePlayer[playerid] = -1;
		SendClientMessage(playerid, -1, "Giao dich da duoc huy!");
	}		
	else if(strcmp(item,"drugs",true) == 0) {
		if(DrugOffer[playerid] == 999) return SendClientMessage(playerid,COLOR_WHITE, "Khong ai cung cap cho ban thuoc.");
		DrugType[playerid] = 0;
		DrugOffer[playerid] = 999;
		DrugPrice[playerid] = 0;
		DrugGram[playerid] = 0;
	}
	else if(strcmp(item,"checkpoint",true) == 0) {
		switch(CP[playerid])
		{
			case 50: return SendClientMessage(playerid,COLOR_WHITE, "Day la mot checkpoint rob.");
			case 100..123: return SendClientMessage(playerid,COLOR_WHITE,"Day la mot CP DMV.");
			case 9..20: return SendClientMessage(playerid,COLOR_WHITE, "Day la mot checkpoint thuoc ve dau truong dua xe.");
		}
		if(JobWorking[playerid] == 1) return SendClientMessage(playerid,COLOR_WHITE, "Su dung /stopwork de ngung lam viec.");
		if(CP[playerid] != 0) {
			DisablePlayerCheckpointEx(playerid);
			SendClientMessage(playerid,COLOR_WHITE,"Da xoa thanh cong cham do.");
			CP[playerid] = 0;
		}
	}
	else if(strcmp(item,"repair",true) == 0) {
		if(RepairOffer[playerid] == 999) return SendClientMessage(playerid,COLOR_WHITE, "Khong ai gui ban de nghi sua chua.");
		RepairOffer[playerid] = 999;
		RepairPrice[playerid] = 0;
		RepairCar[playerid] = 0;
	}
	else if(strcmp(item,"materials",true) == 0) {
		if(MatsOffer[playerid] == -1) return SendClientMessage(playerid,COLOR_WHITE, "Khong ai gui ban de nghi vat lieu.");
		MatsOffer[playerid] = -1;
		MatsPrice[playerid] = 0;
		MatsAmmo[playerid] = 0;
	}
	else if(strcmp(item,"gun",true) == 0) {
		if(SellgunOffer[playerid] == -1) return SendClientMessage(playerid,COLOR_WHITE, "Khong ai gui ban de nghi sung.");
		SellgunOffer[playerid] = -1;
		SellgunPrice[playerid] = 0;
		SellgunMats[playerid] = 0;
		SellgunAmmo[playerid] = 0;
		SellgunID[playerid] = 0;
	}
	else if(strcmp(item,"free",true) == 0) {
		if(FreeOffer[playerid] == -1) return SendClientMessage(playerid,COLOR_WHITE, "Khong ai gui ban de nghi bao lanh.");
		FreeOffer[playerid] = -1;
		FreePrice[playerid] = 0;
	}
	else if(strcmp(item,"live",true) == 0) {
		if(LiveOffer[playerid] == 999) return SendClientMessage(playerid,COLOR_WHITE, "Khong ai gui ban de nghi phong van truc tiep.");
		LiveOffer[playerid] = 999;
	}
	else if(strcmp(item,"refill",true) == 0) {
		if(RefillOffer[playerid] == 999) return SendClientMessage(playerid,COLOR_WHITE, "Khong ai gui ban de nghi do xang.");
		RefillOffer[playerid] = 999;
		RefillPrice[playerid] = 0;
	}
	else if(strcmp(item,"ticket",true) == 0) {
		if(TicketOffer[playerid] == 999) return SendClientMessage(playerid,COLOR_WHITE, "Khong ai gui ban de nghi tra tien ve phat.");
		TicketOffer[playerid] = 999;
		TicketMoney[playerid] = 0;
	}
	else if(strcmp(item,"medic",true) == 0) {
		if(MedicCall[playerid] != playerid) return SendClientMessage(playerid,COLOR_GREY, "Ban chua goi dich vu nay");
		MedicCall[playerid] = -1;
		
		format(string, sizeof(string), "**(( Paramedic Dispatch: %s (%d) khong con can mot bac si nua. ))**", GetName(playerid), playerid);
		SendFactionMessage(13, COLOR_LIGHTBLUE, string);
	}
	return 1;
}
CMD:startevent(playerid, params[]) {
	if(ActiveEvent == 1) return SendClientMessage(playerid, -1, "Da co mot su kien dang chay!");
	new event[7], string[180];
	if(sscanf(params, "s[180]i", event, EventMoney)) {
		SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/startevent <event> <so tien>");
		SendClientMessage(playerid, COLOR_GREY, "Co san: LMS, LCS, CS, Stunt, Zombie.");
		return 1;
	}
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;
	if(PlayerInfo[playerid][pAdmin] == 1 && EventMoney > 20000) return SendClientMessage(playerid, -1, "So tien khong hop le! (10,000-20,000)");
	if(EventMoney < 10000 || EventMoney > 200000) return SendClientMessage(playerid, -1, "So tien khong hop le! (10,000-200,000)");
	if(GetPlayerCash(playerid) < EventMoney) return SendClientMessage(playerid, -1, "Ban khong co du tien.");
	if(strcmp(event, "lms", true) == 0) {
		format(string, sizeof(string), "(( Admin %s: Event {FF9696}LMS (Giai thuong: $%s){A9C4E4}. De tham gia su kien nay, su dung '/joinevent'! ))", GetName(playerid), FormatNumber(EventMoney));
		SCMTA(COLOR_CLIENT, string);
		ActiveEvent = 1;
		EventType = 1;
	}
	else if(strcmp(event, "lcs", true) == 0) {
		format(string, sizeof(string), "(( Admin %s: Event {FF9696}LCS (Giai thuong: $%s){A9C4E4}. De tham gia su kien nay, su dung '/joinevent'! ))", GetName(playerid), FormatNumber(EventMoney));
		SCMTA(COLOR_CLIENT, string);
		ActiveEvent = 1;
		EventType = 2;
	}
	else if(strcmp(event, "cs", true) == 0) {
		format(string, sizeof(string), "(( Admin %s: Event {FF9696}Counter Strike (Giai thuong: $%s){A9C4E4}. De tham gia su kien nay, su dung '/joinevent'! ))", GetName(playerid), FormatNumber(EventMoney));
		SCMTA(COLOR_CLIENT, string);
		ActiveEvent = 1;
		EventType = 3;
	}
	else if(strcmp(event, "stunt", true) == 0) {
		format(string, sizeof(string), "(( Admin %s: Event {FF9696}Stunt cung NRG-500 (Giai thuong: $%s){A9C4E4}. Tai su kien nay, ban chi can tim ngoi sao la chien thang. ))", GetName(playerid), FormatNumber(EventMoney));
		SCMTA(COLOR_CLIENT, string);
		ActiveEvent = 1;
		EventType = 5;
		new rand = random(sizeof(StuntPos));
		StuntPickup = CreateDynamicPickup(1247, 23, StuntPos[rand][0], StuntPos[rand][1], StuntPos[rand][2], 0, -1, -1, 100.0);
		new szZone[128];
		GetPlayer3DZone2(StuntPos[rand][0], StuntPos[rand][1], StuntPos[rand][2], szZone, sizeof(szZone));		
		format(string, sizeof(string), "Goi y: Ngoi sao duoc giau trong khu vuc %s.", szZone);
		SCMTA(COLOR_WHITE, string);
		defer CheckStar();
	}	
	else if(strcmp(event, "zombie", true) == 0) {
		format(string, sizeof(string), "(( Admin %s: Event {FF9696}Zombie (Giai thuong: $%s){A9C4E4}. De tham gia su kien nay, su dung '/joinevent'! ))", GetName(playerid), FormatNumber(EventMoney));
		SCMTA(COLOR_CLIENT, string);
		ActiveEvent = 1;
		EventType = 6;
	}		
	else return SendClientMessage(playerid, COLOR_GREY, "Event invalid!");
    format(string, sizeof(string), "(( Admin %s: Tat ca moi nguoi co mot phut de tham gia. ))", GetName(playerid));
	if(EventType != 5) SCMTA(COLOR_CLIENT, string);
	EventTime = 1;
	if(EventType == 5) {}
	else defer StartEvent();
	GivePlayerCash(playerid, -EventMoney);
	Update(playerid, pCashx);
	EventBy = playerid;
	return 1;
}
CMD:joinevent(playerid, params[]) {
	if(ActiveEvent == 0) return SendClientMessage(playerid, COLOR_GREY, "Khong co mot su kien dang chay!");
	if(EventType == 5) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the su dung lenh nay cho loai su kien nay!");
	if(InEvent[playerid] == 1) return 1;
	if(JobWorking[playerid] == 1) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the tham du su kien vi ban dang lam viec!");
	if(OnDuty[playerid] == 1) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the tham du su kien vi ban dang OnDuty!");
	if(PlayerInfo[playerid][pJailTime] != 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the tham du su kien vi ban dang o trong tu!");
	if(PlayerInfo[playerid][pWantedLevel] != 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the tham du su kien vi ban dang bi canh sat theo doi!");	
	if(Iter_Contains(PlayerInRace, playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the tham du su kien vi ban dang o trong dau truong dua xe!");
	if(PlayerInfo[playerid][pSleeping] == 1) return 1;
	if(EventTime == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Su kien nay da ket thuc bao danh!");
	if(InWar[PlayerInfo[playerid][pMember]] == 1) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban dang war, ban khong the tham du su kien!");
	if(PaintType[playerid] != 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the tham du su kien vi ban dang o trong paintball. (/paintleave)");
	if(Escape[playerid] == 1) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the di den su kien vi ban dang vuot nguc!");
	
	switch(EventType) {
		case 1: {
			if(PlayerInfo[playerid][pGunLic] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban can giay phep su dung sung de tham gia su kien nay!");
			ResetWeapons(playerid);		
			new rand = random(sizeof(RandomPos));
			SetPlayerPosEx(playerid, RandomPos[rand][0], RandomPos[rand][1], RandomPos[rand][2]);
			ServerWeapon(playerid, 22, 9999);
			ServerWeapon(playerid, 31, 9999);
			ServerWeapon(playerid, 29, 9999);
			ServerWeapon(playerid, 1, 9999);
			ServerWeapon(playerid, 33, 9999);
			SetPlayerWorldBounds(playerid, -1296.244, -1704.97, 2849.402, 2464.032);
		}
		case 2: {
			if(GetPlayersOnEvent() >= 44) return SendClientMessage(playerid, -1, "Xin loi, so luong nguoi tham gia da dat muc toi da. Khong con xe o to nua!");
			ResetWeapons(playerid);	
			SetPlayerInterior(playerid, 15);
			SetPlayerVirtualWorld(playerid, 555);
			for(new v = 0; v < 44; v++) {
				if(!VehicleHaveDriver(LCS[v])) {
					PutPlayerInVehicleEx(playerid, LCS[v], 0), LastCar[playerid] = LCS[v];
					SetVehicleVirtualWorld(LCS[v], 555);
				}	
			}
		}
		case 3: {
			if(PlayerInfo[playerid][pGunLic] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban can giay phep su dung sung de tham gia su kien nay!");
			if(GetPlayersOnEvent() >= 40) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the tham gia su kien vi so luong nguoi tham gia bi gioi han.");
			new x = GetPlayersOnEvent();
			ResetWeapons(playerid);	
			if(GetTeamMembers(1) > GetTeamMembers(2)) {
				Team[playerid] = 2;
				SetPlayerColor(playerid, COLOR_LIGHTBLUE);
				ServerWeapon(playerid, 31, 9999);
				ServerWeapon(playerid, 24, 9999);
				ServerWeapon(playerid, 29, 9999);
				SetPlayerSkinEx(playerid, 285);
			
				SetPlayerPosEx(playerid, CTSpawn[x][0], CTSpawn[x][1], CTSpawn[x][2]);
				SetPlayerFacingAngle(playerid, 270);
			}
			else {
				Team[playerid] = 1;
				SetPlayerColor(playerid, COLOR_LIGHTRED);
				ServerWeapon(playerid, 31, 9999);
				ServerWeapon(playerid, 24, 9999);
				ServerWeapon(playerid, 28, 9999);
				SetPlayerSkinEx(playerid, 293);
	
				SetPlayerPosEx(playerid, TeroSpawn[x][0], TeroSpawn[x][1], TeroSpawn[x][2]);
				SetPlayerFacingAngle(playerid, 90);
			}
			SetPlayerArmourEx(playerid, 99);
		}
		case 6: {
			if(PlayerInfo[playerid][pGunLic] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban can giay phep su dung sung de tham gia su kien nay!");
			ResetWeapons(playerid);	
			if(GetTeamMembers(1) > GetTeamMembers(2)) {
				Team[playerid] = 2;
				SetPlayerColor(playerid, COLOR_WHITE);
				ServerWeapon(playerid, 24, 9999);
				ServerWeapon(playerid, 31, 9999);
				
				SetPlayerSkinEx(playerid, 7);
				new Float: test = -0.52*playerid;
				SetPlayerPosEx(playerid, -56.3909 + test, 1195.7850, 19.3669);
				SetPlayerFacingAngle(playerid, -103.8000);
			}
			else {
				Team[playerid] = 1;
				SetPlayerColor(playerid, 0xB366FFFF);
				ServerWeapon(playerid, 24, 9999);
				ServerWeapon(playerid, 31, 9999);
				SetPlayerSkinEx(playerid, 162);
				new Float: test = 0.58*playerid;
				SetPlayerPosEx(playerid, -93.0551 + test, 1100.8190, 19.7244);
				SetPlayerFacingAngle(playerid, 0);
			}
			SetPlayerWeather(playerid, 19);
			SetPlayerWorldBounds(playerid, 186.846, -408.7256, 1296.244, 910.8743);
			SetPlayerArmourEx(playerid, 99);
		}
		
	}
	new string[180];
	foreach(new i: Player) {
		if(IsPlayerLogged[i] == 1) {
			if(InEvent[i] && i != playerid) {
				format(string, sizeof(string), "%s da tham gia su kien.", GetName(playerid));
				SendClientMessage(i, 0xFFC77DFF, string);
			}
		}
	}	
	SendClientMessage(playerid, COLOR_RED, "Su kien se bat dau sau mot phut ke tu khi thong bao, xin ban hay nhan nai");	
	TogglePlayerControllable(playerid, false);
	GameTextForPlayer(playerid, "~y~Chao mung ban den voi su kien! :)", 2000, 4);
	SetPlayerInterior(playerid, 0);
	InHouse[playerid] = 0;
	Freezed[playerid] = 1;	
	InEvent[playerid] = 1;
	SetPlayerVirtualWorld(playerid, 555);
	SetPlayerHealthEx(playerid, 99);
	return 1;
}
CMD:accept(playerid, params[]) {
	new x_job[180],id,sendername[25],giveplayer[25],string[300];
	if(DeelayCommand[playerid][4] > 0) return DeelayTime(playerid, 4);
	if(sscanf(params, "s[180]u",x_job,id))
	{
		SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/chapnhan <item> <playerid/name>");
		SendClientMessage(playerid, COLOR_WHITE, "Trade, Dice, Drugs, Repair, Materials,");
		SendClientMessage(playerid, -1, "Live, Free, Ticket, Refill, Invite, Lesson, Cinvite, Clan, Propose, Taxi, Mechanic.");
		return 1;
	}
	if(id == INVALID_PLAYER_ID || !IsPlayerConnected(id)) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	DeelayCommand[playerid][4] = 5;	
	if(strcmp(x_job,"medic",true) == 0 || strcmp(x_job,"taxi",true) == 0 || strcmp(x_job,"mechanic",true) == 0 || strcmp(x_job,"instructor",true) == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Lenh nay khong con kha dung nua. Su dung /calls!");
	if(strcmp(x_job,"propose",true) == 0) {
		if(GetPVarInt(playerid, "proposeID") != id) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong cau hon ban!");
		if(strcmp(PlayerInfo[playerid][pPropose], "Khong ai", true) == 0) { }
		else return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban da ket hon!");			
		#if SEXUAL_ACCEPTION == 0
			if(PlayerInfo[playerid][pSex] == PlayerInfo[id][pSex]) return SendClientMessage(playerid, -1, "Chung toi khong chap nhan ket hon dong tinh.");
		#endif
		if(PlayerInfo[playerid][pSex] == PlayerInfo[id][pSex]) {
			if(PlayerInfo[playerid][pSex] == 1) format(string, sizeof(string), "Chung toi co mot cap dong tinh nam moi, %s va %s da tro thanh vo chong voi nhau.", GetName(id), GetName(playerid));
			else if(PlayerInfo[playerid][pSex] == 2) format(string, sizeof(string), "Chung toi co mot cap dong tinh nu moi, %s va %s da tro thanh vo chong voi nhau.", GetName(id), GetName(playerid));
		}
		else format(string, sizeof(string), "Chung ta co mot cap vo chong moi, %s va %s da ket hon.", GetName(id), GetName(playerid));
		SCMTA(COLOR_WHITE, string);
		
		format(PlayerInfo[playerid][pPropose], 256, GetName(id));
		format(PlayerInfo[id][pPropose], 256, GetName(playerid));
		new query[256];
		format(query, sizeof(query), "UPDATE `users` SET `Propose`='%s' WHERE `ID`='%d'", PlayerInfo[playerid][pPropose], PlayerInfo[playerid][pSQLID]);
		mysql_query(SQL, query,false);	
		format(query, sizeof(query), "UPDATE `users` SET `Propose`='%s' WHERE `ID`='%d'", PlayerInfo[id][pPropose], PlayerInfo[id][pSQLID]);
		mysql_query(SQL, query,false);
		finishAchievement(playerid, 17);
		finishAchievement(id, 17);		
		return 1;
	}
	else if(strcmp(x_job,"clan",true) == 0) {
		if(GetPVarInt(playerid, "OfferedClan") == -1 || GetPVarInt(playerid, "OfferedClan") != id) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong dua ra de nghi cho ban!");
		if(PlayerInfo[playerid][pClan] != 0) return SendClientMessage(playerid, COLOR_GREY, "Ban da la thanh vien cua mot clan. Su dung lenh /quitclan de roi khoi clan hien tai!");
		new 
			clan = GetPVarInt(playerid, "SellClan"),
			money = GetPVarInt(playerid, "ClanMoney");
		if(PlayerInfo[id][pClan] != clan || PlayerInfo[id][pClanRank] < 6) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi khong con so huu clan do da gui ban mot yeu cau!");
		if(GetPlayerCash(playerid) < money) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du tien de chap nhan!");
		format(string, sizeof(string), "%s chap nhan mua clan cua ban va ban nhan duoc $%s.", GetName(playerid), FormatNumber(money));
		SendClientMessage(id, COLOR_MONEY, string);
		format(string, sizeof(string), "Ban da mua clan tu %s voi gia $%s.", GetName(id), FormatNumber(money));
		SendClientMessage(playerid, COLOR_MONEY, string);
		GivePlayerCash(playerid, -money);
		GivePlayerCash(id, money);
		PlayerInfo[playerid][pClan] = clan;
		PlayerInfo[playerid][pClanRank] = 6;
		UpdateVar(playerid, "Clan", clan); UpdateVar(playerid, "ClanRank", 6); UpdateVar(playerid, "ClanDays", 0);
		PlayerInfo[id][pClan] = 0;
		PlayerInfo[id][pClanRank] = 0;
		UpdateVar(id, "Clan", 0); UpdateVar(id, "ClanRank", 0); UpdateVar(id, "ClanDays", 0);
		format(string, sizeof(string), "[CLAN] %s da tro thanh lanh dao moi cua clan!", GetName(playerid));
		SendClanMessage(clan, string);
		DeletePVar(playerid, "OfferedClan");
		DeletePVar(playerid, "ClanMoney");
		DeletePVar(playerid, "SellClan");
		new query[128];
		format(query, 128, "UPDATE `clans` SET `Owner`='%s', `OwnerSQL`='%d' WHERE `ID`='%d'", GetName(playerid), PlayerInfo[playerid][pSQLID], clan);
		mysql_query(SQL, query,false);
		
		new szName[180];
		SetPlayerName(id, PlayerInfo[id][pUsername]);
		PlayerInfo[playerid][pTag] = 0;
		format(szName, sizeof(szName), "%s%s", ClanInfo[clan][clTag], PlayerInfo[playerid][pUsername]);			
		SetPlayerName(playerid, szName);		
		return 1;
	}	
	if(strcmp(x_job,"lesson",true) == 0) {
		new x = GetPVarInt(playerid, "Lesson");
		if(x == -1 || x != id) return SendClientMessage(playerid, -1, "Nguoi choi do khong dua ra de nghi cho ban");
		if(GetPVarInt(id, "InLesson") == 1) return SendClientMessage(playerid, -1, "Nguoi huong dan dang trong mot bai hoc khac.");
		SetPVarInt(playerid, "InLesson", id);
		SetPVarInt(id, "InLesson", playerid);
		SetPVarInt(playerid, "Lesson", -1);
		format(string, sizeof(string), "**(( SI Dispatch: %s (%d) bat dau bai hoc moi voi %s (%d). ))**", GetName(id), id, GetName(playerid), playerid);
		SendFactionMessage(PlayerInfo[id][pMember], COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "Yeu cau cua ban da duoc chap nhan boi Instructor %s.", GetName(id));
		SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "%s chap nhan de bat dau bai hoc voi ban.", GetName(playerid));
		SendClientMessage(id, COLOR_LIGHTBLUE, string);			
		return 1;
	}
	if(strcmp(x_job, "license", true) == 0) {
		if(LicenseOffer[playerid] == -1) return SendClientMessage(playerid, -1, "Ban khong o trong mot cuoc giao dich!");
		if(LicenseOffer[playerid] != id) return SendClientMessage(playerid, -1, "Nguoi choi do khong dua ra de nghi cho ban!");
		if(PlayerInfo[id][pMember] != 7) return SendClientMessage(playerid, -1, "Ban khong thuoc to chuc School Instructors!");
		new money, str[180], days, date;
		days = LicenseDays[playerid];
		switch(License[playerid]) {
			case 1: {
				switch(days)
				{
					case 1: money = 300000, days = 168, date = 7;
					case 2: money = 600000, days = 360, date = 15;
					case 3: money = 1000000, days = 720, date = 30;
				}
				if(GetPlayerCash(playerid) < money) return SendClientMessage(playerid, -1, "Ban khong co du tien!");
				GivePlayerCash(playerid, -money);
				GivePlayerCash(id, money);
				
				PlayerInfo[playerid][pFlyLic] = 1;
				PlayerInfo[playerid][pFlyLicT] = days;
				format(str,70,"UPDATE users SET `FlyLic`='1',`FlyLicT`='%d' WHERE `ID`='%d'",days, PlayerInfo[playerid][pSQLID]);
				mysql_query(SQL,str,false);

				format(string, sizeof(string), "**(( SI Dispatch: %s (%d) cap cho %s (%d) mot giay phep su dung may bay voi gia %d$ %d ngay. ))**", GetName(id), id, GetName(playerid), playerid, money, date);
				SendFactionMessage(PlayerInfo[id][pMember], COLOR_LIGHTBLUE, string);
				finishAchievement(playerid, 9);	
			}
			case 2: {
				switch(days)
				{
					case 1: money = 300000, days = 168, date = 7;
					case 2: money = 600000, days = 360, date = 15;
					case 3: money = 1000000, days = 720, date = 30;
				}
				if(GetPlayerCash(playerid) < money) return SendClientMessage(playerid, -1, "Ban khong co du tien!");
				GivePlayerCash(playerid, -money);
				GivePlayerCash(id, money);	
				
				PlayerInfo[playerid][pBoatLic] = 1;
				PlayerInfo[playerid][pBoatLicT] = days;
				format(str,70,"UPDATE users SET `BoatLic`='1',`BoatLicT`='%d' WHERE `ID`='%d'",days,PlayerInfo[playerid][pSQLID]);
				mysql_query(SQL,str,false);		

				format(string, sizeof(string), "**(( SI Dispatch: %s (%d) cap cho %s (%d) mot giay phep su dung thuyen voi gia %d$ %d ngay. ))**", GetName(id), id, GetName(playerid), playerid, FormatNumber(money), days);
				SendFactionMessage(PlayerInfo[id][pMember], COLOR_LIGHTBLUE, string);	
				finishAchievement(playerid, 8);	
			}
		}
		UpdateFactionRaport(id, 0);				
		License[playerid] = 0;
		LicenseOffer[playerid] = -1;
		
		for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
			if(PlayerInfo[id][pDailyMission][m] == 15 || PlayerInfo[id][pDailyMission][m] == 16) CheckMission(id, m);
		}			
		format(string, sizeof(string), "Ban chap nhan yeu cau cua %s, va anh ta da nhan duoc giay phep trong vong %d.", GetName(id), date);
		SendClientMessage(playerid, COLOR_MONEY, string);
		format(string, sizeof(string), "%s mua giay phep cua ban voi gia $%s.", GetName(playerid), FormatNumber(money));
		SendClientMessage(id, COLOR_MONEY, string);	
		return 1;
	}
	if(strcmp(x_job, "gps", true) == 0) {
		if(LicenseOffer[playerid] == -1) return SendClientMessage(playerid, -1, "Ban khong o trong mot cuoc giao dich!");
		if(LicenseOffer[playerid] != id) return SendClientMessage(playerid, -1, "Nguoi choi do khong dua ra de nghi cho ban!");
		if(PlayerInfo[id][pLeader] != 1) return SendClientMessage(playerid, -1, "Nguoi choi do khong thuoc to chuc LSPD!");
		new money, str[180], days, date;
		days = LicenseDays[playerid];
		switch(License[playerid]) {
			case 1: {
				switch(days)
				{
					case 1: money = 450000, days = 168, date = 7;
					case 2: money = 1000000, days = 360, date = 15;
					case 3: money = 2000000, days = 720, date = 30;
				}
				if(GetPlayerCash(playerid) < money) return SendClientMessage(playerid, -1, "Ban khong co du tien!");
				GivePlayerCash(playerid, -money);
				GivePlayerCash(id, money);
				
				PlayerInfo[playerid][pGunLic] = 1;
				PlayerInfo[playerid][pGunLicT] = days;
				format(str,70,"UPDATE users SET `GunLic`='1',`GunLicT`='%d' WHERE `ID`='%d'",days, PlayerInfo[playerid][pSQLID]);
				mysql_query(SQL,str,false);

				format(string, sizeof(string), "**(( HQ Dispatch: %s (%d) cap cho %s (%d) mot giay phep su dung sung voi gia %d$ %d ngay. ))**", GetName(id), id, GetName(playerid), playerid, money, date);
				SendFactionMessage(PlayerInfo[id][pMember], COLOR_LIGHTBLUE, string);
				finishAchievement(playerid, 9);	
			}
		}
		format(string, sizeof(string), "Ban chap nhan yeu cau cua %s, va anh ta da nhan duoc giay phep.", GetName(id));
		SendClientMessage(playerid, COLOR_MONEY, string);
		format(string, sizeof(string), "%s mua giay phep cua ban voi gia $%s.", GetName(playerid), FormatNumber(money));
		SendClientMessage(id, COLOR_MONEY, string);	
		return 1;
	}
	if(strcmp(x_job, "traodoi", true) == 0) {
		// printf("2 %d [ %d ] ( %d )",BurgerAmount[playerid], BurgerOffer[playerid], BurgerMoney[playerid]);
		// printf("3 %d [ %d ] ( %d )",BurgerAmount[id], BurgerOffer[id], BurgerMoney[id]);
		if(BurgerOffer[playerid] == -1) return SendClientMessage(playerid, -1, "Ban khong o trong mot cuoc giao dich!");
		if(BurgerOffer[playerid] != id)	return SendClientMessage(playerid, -1, "Ban khong giao dich voi nguoi do!");
		BurgerMoney[playerid] = PayTax(playerid, BurgerMoney[playerid], e_TRAO_DOI);
		if(GetPlayerCash(playerid) < BurgerMoney[playerid]) return SendClientMessage(playerid, COLOR_YELLOW, "Bug nua ha ong noi");

		Inventory_Add(playerid,"Burger", 2703, BurgerAmount[playerid], 1);
		Inventory_Remove(BurgerOffer[playerid], "Burger", 1, BurgerAmount[playerid]);
		GivePlayerCash(playerid, -BurgerMoney[playerid]);
		GivePlayerCash(id, BurgerMoney[playerid]);
		Update(playerid, pCashx);
		Update(id, pCashx);
		BurgerOffer[playerid] = -1;
		format(string, sizeof(string), "%s da mua %d cai burger cua ban voi gia $%s.", GetName(playerid), BurgerAmount[playerid], FormatNumber(BurgerMoney[playerid]));
		SendClientMessage(id, COLOR_MONEY, string);	
		format(string, sizeof(string), "Ban da mua %d burger cua %s,voi gia $%s.", BurgerAmount[playerid], GetName(id), FormatNumber(BurgerMoney[playerid]));
		SendClientMessage(playerid, COLOR_MONEY, string);
		
		for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
			if(PlayerInfo[playerid][pDailyMission][m] == 12 || PlayerInfo[id][pDailyMission][m] == 12) CheckMission(playerid, m);
		}	
		return 1;
	}
	if(strcmp(x_job,"trade",true) == 0) {
		if(strlen(PlayerInfo[playerid][pPin]) != 0 && PlayerInfo[playerid][pPinLogged] == 0) {
			 SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay vi ban chua dang nhap PIN.");
			 SendClientMessage(playerid, COLOR_GREY, "De xac thuc, su dung '/loginpin'!");
			 return 1;
		}
		if(TradePlayer[playerid] == -1) return SendClientMessage(playerid, -1, "Ban khong nhan duoc mot loi de nghi.");
		if(TradePlayer[playerid] != id) return SendClientMessage(playerid, -1, "Nguoi choi do khong dua ra de nghi cho ban.");
		if(GetPlayerCash(id) < TradeMoney[playerid]) return SendClientMessage(playerid, -1, "Nguoi choi do khong co du tien.");
		if(GetPlayerInterior(playerid) != 0 || IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the lam dieu nay khi dang o trong Interior hoac tren mot phuong tien!");
		if(GetPlayerInterior(id) != 0 || IsPlayerInAnyVehicle(id)) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Nguoi choi do khong the lam dieu nay khi dang o trong Interior hoac tren mot phuong tien!");
		if(TradeID[playerid] != -1) return SendClientMessage(playerid, COLOR_WHITE, "Ban dang o trong mot cuoc giao dich!");
		if(TradeID[id] != -1) return SendClientMessage(playerid, COLOR_WHITE, "Nguoi choi dang o trong mot cuoc giao dich!");	
		TradePlayer[playerid] = -1;
		
		format(string, sizeof(string), "Hang cua %s", GetName(id));
		PlayerTextDrawSetString(playerid, TradePTD[0], string);
		PlayerTextDrawSetString(id, TradePTD[0], "Hang cua ban");
		PlayerTextDrawSetString(playerid, TradePTD[1], "Hang cua ban");
		format(string, sizeof(string), "Hang cua %s", GetName(playerid));
		PlayerTextDrawSetString(id, TradePTD[1], string);
		
		TradeItems[id] = 0;
		TradeItems[playerid] = 0;
		TradeReady[id] = 0;
		TradeReady[playerid] = 0;
		TradeID[id] = playerid;
		TradeID[playerid] = id;

		format(string, sizeof(string), "%s (%d) da chap nhan loi moi cua ban!", GetName(playerid), playerid);
		SendClientMessage(id, COLOR_LIGHTBLUE, string);	
		format(string, sizeof(string), "Ban da chap nhan loi moi cua %s (%d)!", GetName(id), id);
		SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
		
		ShowTradeTDs(id);
		ShowTradeTDs(playerid);

		TradeType[id] = 1;
		TradeType[playerid] = 0;
	
		TextDrawHideForPlayer(id, TradeTD[9]);
		TextDrawHideForPlayer(id, TradeTD[10]);
		PlayerTextDrawHide(playerid, TradePTD[2]);
		PlayerTextDrawHide(playerid, TradePTD[3]);

		SetPVarInt(playerid, "TradeAccepted", 1);
		SetPVarInt(id, "TradeAccepted", 0);
		SetPVarInt(id, "CarTrade", -1);
		SetPVarInt(playerid, "CarTrade", -1);
		return 1;
	}	
	if( strcmp ( x_job, "dice" , true ) == 0 )
	{
		if(DiceID[playerid] == -1) return SendClientMessage(playerid,COLOR_WHITE,"Khong ai moi ban choi dice.");
		if(id == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay len chinh minh!");
		if(!IsPlayerInRangeOfPoint(playerid, 100.0, 2016.1156,1017.1541,996.875)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o casino.");
		if(DeelayCommand[playerid][1] > 0) return DeelayTime(playerid, 1);
		if(DiceTimer[playerid] != Timer:0) return 1;
		DeelayCommand[playerid][1] = DICE_DELAY;
		new time = RandomEx(500, 750);
		DiceTimer[playerid] = defer PlayDice[time](playerid, id);
	}
	else if(strcmp(x_job, "invite", true) == 0)
	{
		if(GetPVarInt(playerid, "InvitedFaction") == 0) return SendClientMessage(playerid, -1, "Ban chua duoc ai do moi!"); 
		if(InvitedBy[playerid] == -1) return SendClientMessage(playerid, -1, "Ban chua duoc ai do moi!");
		if(id != InvitedBy[playerid]) return SendClientMessage(playerid, -1, "Nguoi choi do khong moi ban.");
		if(!IsPlayerConnected(InvitedBy[playerid])) return SendClientMessage(playerid, -1, "Nguoi choi do chua dang nhap!");
		if(PlayerInfo[id][pMember] != InvitedFaction[playerid]) return SendClientMessage(playerid, -1, "Nguoi choi do khong con la mot phan cua to chuc ma anh ay moi ban.");
		if(PlayerInfo[playerid][pFpunish] != 0) return SendClientMessage(playerid,-1, "Ban bi FP!");
		InvitedBy[playerid] = -1;
		SetPVarInt(playerid, "InvitedFaction", 0);
		GetPlayerName(playerid, giveplayer, sizeof(giveplayer));
		GetPlayerName(id, sendername, sizeof(sendername));
		
		PlayerInfo[playerid][pMember] = PlayerInfo[id][pMember];
		PlayerInfo[playerid][pRank] = 1;		
		format(string, sizeof(string), "%s da tham gia to chuc %s.", GetName(playerid), FactionName(PlayerInfo[playerid][pMember]));
		new query[256];
		mysql_format(SQL, query, sizeof(query), "INSERT INTO faction_logs (`text`, `player`,`leader`) VALUES ('%s','%d','%d')", string, PlayerInfo[playerid][pSQLID],PlayerInfo[id][pSQLID]);
		mysql_tquery(SQL,query,"","");			
		
		if(PlayerInfo[playerid][pMember] == 11) finishAchievement(playerid, 19);	
		else if(IsACop(playerid)) finishAchievement(playerid, 20);	
		else if(IsAMember(playerid)) finishAchievement(playerid, 21);	
		else finishAchievement(playerid, 18);	
		
		ShowModelSelectionMenu(playerid, fskins[PlayerInfo[playerid][pMember]-1], "Trang phuc");	
		SetPlayerToTeamColor(playerid);
		printf("AdmCmd: %s da moi %s vao to chuc %s.", sendername, giveplayer, FactionName(PlayerInfo[playerid][pMember]));
		format(string, sizeof(string), "(i) %s da tham gia to chuc qua loi moi cua %s.", giveplayer, sendername);
		SendFactionMessage(PlayerInfo[playerid][pMember], COLOR_LIGHTBLUE, string);
		FactionMembers[PlayerInfo[playerid][pMember]] ++;
		format(string, sizeof(string), "Ban da chap nhan loi moi cua %s vao %s.", sendername,FactionName(PlayerInfo[playerid][pMember]));
		SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "%s da chap nhan loi moi cua ban.", giveplayer);
		SendClientMessage(id, COLOR_LIGHTBLUE, string);
		SetPlayerInterior(playerid,0);
		ResetPlayerRaport(playerid);
		new str[128];
		format(str,sizeof(str),"UPDATE users SET `Team`='%d',`Member`='%d',`Rank`='1' WHERE `ID`='%d'",PlayerInfo[playerid][pTeam],PlayerInfo[playerid][pMember],PlayerInfo[playerid][pSQLID]);
		mysql_query(SQL,str,false);
		FactionLog(PlayerInfo[playerid][pMember],GetName(playerid),"Gia nhap to chuc.");

		if(IsAMember(playerid)) {
			Iter_Add(PlayerGangster, playerid);
			/*if(CAC_GetStatus(playerid) || GetPVarInt(playerid, "NotAndroid") == 0) 
			{
				SendClientMessage(playerid, COLOR_GOLD, "INFO: {FFFFFF}Ban dang su dung SAMPCAC phien ban moi nhat. Chuc vui ve.");
				UsingSampcac{playerid} = 1;
			}
			else SendClientMessage(playerid, COLOR_GOLD, "INFO: {FFFFFF}Ban chua cai dat SAMPCAC nen ban khong the tham gia war. Hay tai SAMPCAC o bai dang tren group.");*/
		}
	}
	else if(strcmp(x_job,"cinvite",true) == 0) {
		new query[256];
		new clanid = InvitedClan[playerid];
		if(clanid == 0) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co loi moi nao.");
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "Ban da chap nhan loi moi tham gia clan.");

		format(string, sizeof(string), "{%s}[CLAN] %s da chap nhan loi moi tham gia clan.", ClanInfo[InvitedClan[playerid]][clColor], GetName(playerid));
		SendClanMessage(clanid, string);
		PlayerInfo[playerid][pClan] = clanid;
		ClanMembers[clanid] ++;
		PlayerInfo[playerid][pClanRank] = 1;
		InvitedClan[playerid] = -1;
		InvitedBy[playerid] = -1;

		new
			szDate[180],
			Year, Month, Day, Hour, Minute, Second;

		getdate(Year, Month, Day);
		gettime(Hour, Minute, Second);

		format(szDate, sizeof(szDate), "%02d/%02d/%d - %02d:%02d:%02d", Day, Month, Year, Hour, Minute, Second);

		format(query, sizeof(query), "UPDATE `users` SET `Clan`='%d', `ClanRank`='%d' WHERE `Name`='%s'", PlayerInfo[playerid][pClan], PlayerInfo[playerid][pClanRank], PlayerInfo[playerid][pUsername]);
		mysql_query(SQL, query, false);

		new
			szName[180],
			clanid2 = PlayerInfo[playerid][pClan];

		PlayerInfo[playerid][pTag] = 0;
		UpdateVar(playerid, "Tag", 0);
		format(szName, sizeof(szName), "%s%s", ClanInfo[clanid2][clTag], PlayerInfo[playerid][pUsername]);
		SetPlayerName(playerid, szName);

		format(query, sizeof(query), "UPDATE `users` SET `Clan`='%d', `ClanRank`='%d' WHERE `Name`='%s'", PlayerInfo[playerid][pClan], PlayerInfo[playerid][pClanRank], GetName(playerid));
		mysql_query(SQL, query, false);
		return 1;
	}
	else if(strcmp(x_job,"lawyer",true) == 0)
	{
		if(AcceptOffer[playerid] == -1) return SendClientMessage(playerid, COLOR_GREY, "Ban khong nhan duoc loi de nghi nao!");
		if(AcceptOffer[playerid] != id) return SendClientMessage(playerid,-1, "Nguoi choi do khong gui ban de nghi bao lanh.");
		if(GetPlayerCash(playerid) < AcceptPrice[playerid]) return SendClientMessage(playerid,COLOR_GREY, "Ban khong co du tien.");
		PlayerInfo[playerid][pLawyer] += 15;
		PlayerInfo[AcceptOffer[playerid]][pLawyer] -= 15;
		GivePlayerCash(playerid, - AcceptPrice[playerid]);
		GivePlayerCash(AcceptOffer[playerid], AcceptPrice[playerid]);
		new str[356];
		format(str,356,"UPDATE users SET `Money`='%d',`Acceptpoints`='%d' WHERE `ID`='%d'",GetPlayerCash(playerid),PlayerInfo[playerid][pLawyer],PlayerInfo[playerid][pSQLID]);
		mysql_query(SQL,str,false);
		new str2[356];
		format(str2,sizeof(str2),"UPDATE users SET `Money`='%d',`Acceptpoints`='%d' WHERE `ID`='%d'",GetPlayerCash(AcceptOffer[playerid]),PlayerInfo[AcceptOffer[playerid]][pLawyer],PlayerInfo[AcceptOffer[playerid]][pSQLID]);
		mysql_query(SQL,str2);
		new wakaname[25];
		GetPlayerName(playerid,wakaname,25);
		new wakaname2[25];
		GetPlayerName(AcceptOffer[playerid],wakaname2,25);
		format(string, sizeof(string), "%s da chap nhan yeu cau bao lanh cua ban.",GetName(playerid));
		SendClientMessage(AcceptOffer[playerid],COLOR_MONEY,string);
		format(string, sizeof(string), "Ban da chap nhan yeu cau bao lanh cua %s.",wakaname2);
		SendClientMessage(playerid,COLOR_MONEY,string);
		AcceptOffer[playerid] = -1;
		AcceptPrice[playerid] = 0;

	}
	else if(strcmp(x_job,"materials",true) == 0)
	{
		if(MatsOffer[playerid] == -1) return SendClientMessage(playerid, COLOR_GREY, "Ban khong nhan duoc loi de nghi nao!");
		if(MatsOffer[playerid] != id) return SendClientMessage(playerid,-1, "Nguoi choi khong cung cap vat lieu cho ban.");
		if(GetPlayerCash(playerid) < MatsPrice[playerid]) return SendClientMessage(playerid,COLOR_GREY, "Ban khong co du tien.");
		if(MatsAmmo[playerid] > PlayerInfo[MatsOffer[playerid]][pMats]) {
			MatsOffer[playerid] = -1;
			MatsAmmo[playerid] = 0;
			MatsPrice[playerid] = 0;
			return 1;
		}
		PlayerInfo[playerid][pMats] += MatsAmmo[playerid];
		PlayerInfo[MatsOffer[playerid]][pMats] -= MatsAmmo[playerid];
		GivePlayerCash(playerid, - MatsPrice[playerid]);
		
		new moneyLeft = PayTax(playerid, MatsPrice[playerid], e_BAN_VAT_LIEU);
		
		GivePlayerCash(MatsOffer[playerid], moneyLeft);
		GetPlayerName(MatsOffer[playerid],giveplayer,sizeof(giveplayer));
		GetPlayerName(playerid,sendername,sizeof(sendername));
		format(string, sizeof(string), "Ban da mua %d vat lieu voi gia $%s tu %s.", MatsAmmo[playerid], FormatNumber(MatsPrice[playerid]),giveplayer);
		SendClientMessage(playerid,COLOR_MONEY,string);
		format(string, sizeof(string), "%s da mua %d vat lieu cua ban voi gia $%s.",sendername, MatsAmmo[playerid], FormatNumber(MatsPrice[playerid]));
		SendClientMessage(MatsOffer[playerid],COLOR_MONEY,string);
		format(string, sizeof(string), "%s da mua %d vat lieu cua %s voi gia $%s.", sendername, MatsAmmo[playerid], giveplayer, FormatNumber(MatsPrice[playerid]));
		//InsertLog(playerid, string, LOG_MONEY);	
		//InsertLog(MatsOffer[playerid], string, LOG_MONEY);	
		Log("logs/trade.log", string);
		if(MatsPrice[playerid] > 1000000) SendStaffMessage(0x00D900FF, string);
		Update(playerid,pMatsx);
		Update(MatsOffer[playerid],pMatsx);
		Update(MatsOffer[playerid],pCashx);
		Update(playerid,pCashx);
		MatsOffer[playerid] = -1;
		MatsAmmo[playerid] = 0;
		MatsPrice[playerid] = 0;
	}
	else if(strcmp(x_job,"gun",true) == 0)
	{
		if(SellgunOffer[playerid] == -1) return SendClientMessage(playerid, COLOR_GREY, "Ban khong nhan duoc loi de nghi nao!");
		if(SellgunOffer[playerid] != id) return SendClientMessage(playerid,-1, "Nguoi choi khong ban' sung' cho ban.");
		if(GetPlayerCash(playerid) < SellgunPrice[playerid]) return SendClientMessage(playerid,COLOR_GREY, "Ban khong co du tien.");
		if(DeelayCommand[playerid][8] > 0) return DeelayTime(playerid, 1);
		DeelayCommand[playerid][8] = 15;
		new weaponid,ammo,price,mats,gunname[60],idoffer;
		weaponid = SellgunID[playerid];
		ammo = SellgunAmmo[playerid];
		price = SellgunPrice[playerid];
		mats = SellgunMats[playerid];
		idoffer = SellgunOffer[playerid];
		ServerWeapon(playerid,weaponid,ammo);
		PlayerInfo[idoffer][pMats] -= mats;
		GivePlayerCash(playerid, -price);

		// Tax
		new moneyLeft = PayTax(playerid, price, e_SELL_GUN);
		GivePlayerCash(idoffer, moneyLeft);

		Update(playerid, pCashx);
		Update(idoffer,pMatsx);
		Update(idoffer, pCashx);
		PlayerInfo[id][pMatSkill] ++;
		UpdateVar(id, "MatSkill", PlayerInfo[id][pMatSkill]);
		GetPlayerName(idoffer,giveplayer,sizeof(giveplayer));
		GetPlayerName(playerid,sendername,sizeof(sendername));
		GetWeaponNameEx(weaponid,gunname,sizeof(gunname));
		format(string, sizeof(string), "Ban dua cho %s, mot em %s voi %d vien dan, chi phi la %d vat lieu.", sendername,gunname, ammo,mats);
		SendClientMessage(idoffer, COLOR_GRAD1, string);
		format(string, sizeof(string), "Ban nhan duoc mot em %s voi %d dan voi gia %s.", gunname, ammo, giveplayer);
		SendClientMessage(playerid, COLOR_GRAD1, string);
		format(string, sizeof(string), "* %s da tao mot vu khi tu %d vat lieu va dua no cho %s.", giveplayer, mats, sendername);
		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		SellgunOffer[playerid] = -1;
		SellgunPrice[playerid] = 0;
		SellgunMats[playerid] = 0;
		SellgunAmmo[playerid] = 0;
		SellgunID[playerid] = 0;

		if(GetPlayerState(playerid) == PLAYER_STATE_PASSENGER)
		{
			new gun2,tmp;
			GetPlayerWeaponData(playerid,5,gun2,tmp);
			#pragma unused tmp
			if(gun2)SetPlayerArmedWeapon(playerid,gun2);
			else SetPlayerArmedWeapon(playerid,0);
		}
		for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
			if(PlayerInfo[id][pDailyMission][m] == 6) CheckMission(id, m);
		}			
	}
	else if(strcmp(x_job,"free",true) == 0)
	{
		if(FreeOffer[playerid] == -1) return SendClientMessage(playerid, COLOR_GREY, "Ban khong nhan duoc loi de nghi nao!");
		if(FreeOffer[playerid] != id) return SendClientMessage(playerid,-1, "Nguoi choi do khong gui yeu cau bao lanh cho ban.");
		if(GetPlayerCash(playerid) < FreePrice[playerid]) return SendClientMessage(playerid,COLOR_GREY, "Ban khong co du tien.");
		if(PlayerInfo[id][pLawyer] < 1) return SendClientMessage(playerid,-1, "Nguoi choi do khong the bao lanh ban.");
		GetPlayerName(playerid, giveplayer, sizeof(giveplayer));
		GetPlayerName(FreeOffer[playerid], sendername, sizeof(sendername));
		format(string, sizeof(string), "* Ban da bao lanh %s ra khoi nha tu.", giveplayer);
		SendClientMessage(FreeOffer[playerid], COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "* Ban da duoc bao lanh boi %s ra khoi nha tu.", sendername);
		SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "[BAO LANH] Tu nhan %s [ID: %d] da duoc bao lanh boi %s [ID: %d].", sendername, FreeOffer[playerid], playerid, giveplayer);
        SendTeamMessage(3, COLOR_DEPART2, string);
        SendTeamMessage(2, COLOR_DEPART2, string);
        SendTeamMessage(1, COLOR_DEPART2, string);
        SendTeamMessage(15, COLOR_DEPART2, string);
		JailPrice[playerid] = 0;
		PlayerInfo[playerid][pJailTime] = 1;
		PlayerInfo[FreeOffer[playerid]][pLawyer] -= 1;
		PlayerInfo[FreeOffer[playerid]][pLawSkill] ++;
		GivePlayerCash(playerid, -FreePrice[playerid]);
		GivePlayerCash(FreeOffer[playerid],FreePrice[playerid]);
		PlayerInfo[playerid][pJailed] = 1;
		new str[356];
		mysql_format(SQL, str,sizeof(str),"UPDATE users SET `JailTime`='0',`Money`='%d',`Jailed`='0' WHERE `ID`='%d'",GetPlayerCash(playerid),PlayerInfo[playerid][pSQLID]);
		mysql_query(SQL,str,false);
		mysql_format(SQL, str,sizeof(str),"UPDATE users SET `Money`='%d',`Acceptpoints`='%d',`LawSkill`='%d' WHERE `ID`='%d'",GetPlayerCash(FreeOffer[playerid]),PlayerInfo[FreeOffer[playerid]][pLawyer],PlayerInfo[FreeOffer[playerid]][pLawSkill],PlayerInfo[FreeOffer[playerid]][pSQLID]);
		mysql_query(SQL,str,false);
		FreeOffer[playerid] = 0;
		FreePrice[playerid] = 0;

	}
	else if(strcmp(x_job,"ticket",true) == 0)
	{
		if(TicketOffer[playerid] == 999) return SendClientMessage(playerid, COLOR_GREY, "Ban khong nhan duoc loi de nghi nao!");
		if(TicketOffer[playerid] != id) return SendClientMessage(playerid,-1, "Nguoi choi do khong dua ve phat cho ban.");
		if(!ProxDetectorS(5.0, playerid, TicketOffer[playerid])) return SendClientMessage(playerid, -1, "Nguoi choi do khong o gan ban.");
		GetPlayerName(TicketOffer[playerid], giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(GetPlayerCash(playerid) < TicketMoney[playerid]) return SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Ban khong co du tien.");
		format(string, sizeof(string), "* Ban da tra tien phat $%d cho %s.", TicketMoney[playerid], giveplayer);
		SendClientMessage(playerid, COLOR_MONEY, string);
		format(string, sizeof(string), "* %s tra tien phat $%d.", sendername, TicketMoney[playerid]);
		SendClientMessage(TicketOffer[playerid], COLOR_MONEY, string);
		GivePlayerCash(playerid, - TicketMoney[playerid]);
		GivePlayerCash(TicketOffer[playerid], TicketMoney[playerid]);
		Update(playerid, pCashx);
		Update(TicketOffer[playerid], pCashx);
		TicketOffer[playerid] = 999;
		TicketMoney[playerid] = 0;
		UpdateFactionRaport(id, 1);						

	}
	else if(strcmp(x_job,"refill",true) == 0)
	{
		if(RefillOffer[playerid] == 999) return SendClientMessage(playerid, COLOR_GREY, "Ban khong nhan duoc loi de nghi nao!");
		if(RefillOffer[playerid] != id) return SendClientMessage(playerid,COLOR_WHITE, "Nguoi choi khong de nghi do xang cho ban.");
		if(GetPlayerCash(playerid) < RefillPrice[playerid]) return SendClientMessage(playerid, COLOR_WHITE, "Ban khong co du tien!");
		GetPlayerName(playerid, sendername, sizeof(sendername));
		new car = gLastCar[playerid];
		new fuel;
		fuel = 100;
		UpdateFactionRaport(id, 0);	
		DeelayCommand[id][6] = 30;	
		format(string, sizeof(string), "**(( TTC Dispatch: Tow Truck Member %s (%s) do xang cho xe cua %s (%d) voi gia %d$. ))**", GetName(id), id, GetName(playerid), playerid, RefillPrice[playerid]);
		SendFactionMessage(8, COLOR_LIGHTBLUE, string);		
		format(string, sizeof(string), "* Xe cua ban da duoc do day %d%s phan tram xang voi gia $%d boi tho co khi %s.",fuel,"%%",RefillPrice[playerid],GetName(id));
		SendClientMessage(playerid,COLOR_MONEY, string);
		format(string, sizeof(string), "* Ban da do day xang cho xe cua %s voi gia $%d.",sendername,RefillPrice[playerid]);
		SendClientMessage(RefillOffer[playerid], COLOR_MONEY, string);
		GivePlayerCash(id,RefillPrice[playerid]);
		GivePlayerCash(playerid, -RefillPrice[playerid]);
		if(Gas[car] < 110) { Gas[car] += fuel; }
		new str[180];
		format(str,sizeof(str),"UPDATE users SET `Money`='%d',`MechSkill`='%d' WHERE `ID`='%d'",GetPlayerCash(RefillOffer[playerid]),PlayerInfo[RefillOffer[playerid]][pMechSkill],PlayerInfo[RefillOffer[playerid]][pSQLID]);
		mysql_query(SQL,str,false);
		Update(playerid, pCashx);
		RefillOffer[playerid] = 999;
		RefillPrice[playerid] = 0;
		OnePlayAnim(id, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0);

	}
	else if(strcmp(x_job,"live",true) == 0) {
		if(LiveOffer[playerid] == 999) return SendClientMessage(playerid, COLOR_GREY, "Ban khong nhan duoc loi de nghi nao!");
		if(LiveOffer[playerid] != id) return SendClientMessage(playerid,COLOR_WHITE, "Nguoi choi nay khong de nghi phong van truc tiep voi ban.");
		if(!ProxDetectorS(5.0, playerid, LiveOffer[playerid])) return SendClientMessage(playerid, -1, "Nguoi choi do khong o gan ban.");
		SendClientMessage(playerid, COLOR_WHITE, "* Ban da bi dong bang cho den khi ket thuc phong van!");
		SendClientMessage(LiveOffer[playerid], COLOR_WHITE, "* Ban da bi dong bang cho den khi ket thuc phong van! De ket thuc phong van, hay su dung (/live) mot lan nua.");
		TogglePlayerControllable(playerid, false);
		TogglePlayerControllable(LiveOffer[playerid], false);
		TalkingLive[playerid] = LiveOffer[playerid];
		TalkingLive[LiveOffer[playerid]] = playerid;
		LiveOffer[playerid] = 999;

	}
	else if(strcmp(x_job,"drugs",true) == 0) {
		if(DrugOffer[playerid] == 999) return SendClientMessage(playerid, COLOR_GREY, "Ban khong nhan duoc loi de nghi nao!");
		if(DrugOffer[playerid] != id) return SendClientMessage(playerid,COLOR_WHITE, "Nguoi choi nay khong ban thuoc phien cho ban.");
		if(GetPlayerCash(playerid) < DrugPrice[playerid])  return SendClientMessage(playerid, COLOR_WHITE, "Ban khong co du tien!");
		GetPlayerName(DrugOffer[playerid], giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(DrugType[playerid]==1) {
			if(DrugGram[playerid]>PlayerInfo[DrugOffer[playerid]][pMatuy1]) {
				DrugType[playerid] = 0;
		        DrugOffer[playerid] = 999;
		        DrugPrice[playerid] = 0;
		        DrugGram[playerid] = 0;
				return SendClientMessage(playerid, COLOR_GREY, "Nguoi ban khong co du Indica.");
			}
			PlayerInfo[playerid][pMatuy1] += DrugGram[playerid];
			PlayerInfo[DrugOffer[playerid]][pMatuy1] -= DrugGram[playerid];
			Update(playerid, pMatuy1x);
			Update(DrugOffer[playerid], pMatuy1x);
		}
		if(DrugType[playerid]==2) {
			if(DrugGram[playerid]>PlayerInfo[DrugOffer[playerid]][pMatuy2]) {
				DrugType[playerid] = 0;
		        DrugOffer[playerid] = 999;
		        DrugPrice[playerid] = 0;
		        DrugGram[playerid] = 0;
				return SendClientMessage(playerid, COLOR_GREY, "Nguoi ban khong co du Sativa.");
			}
			PlayerInfo[playerid][pMatuy2] += DrugGram[playerid];
			PlayerInfo[DrugOffer[playerid]][pMatuy2] -= DrugGram[playerid];
			Update(playerid, pMatuy2x);
			Update(DrugOffer[playerid], pMatuy2x);
		}
		format(string, sizeof(string), "* Ban da mua %d gram %s voi gia $%d boi nha ke buon lau %s.",DrugGram[playerid], Seed[DrugType[playerid]][SeedName], DrugPrice[playerid],giveplayer);
		SendClientMessage(playerid, COLOR_MONEY, string);
		format(string, sizeof(string), "* %s da mua %d gram %s thuoc phien cua ban voi gia $%d.",sendername,DrugGram[playerid], Seed[DrugType[playerid]][SeedName], DrugPrice[playerid]);
		SendClientMessage(DrugOffer[playerid], COLOR_MONEY, string);
		new moneyLeft = PayTax(playerid, DrugPrice[playerid], e_BAN_MA_TUY);
		GivePlayerCash(DrugOffer[playerid],moneyLeft);
		PlayerInfo[DrugOffer[playerid]][pDrugsSkill] ++;
		GivePlayerCash(playerid, -DrugPrice[playerid]);
		new wakaname[25],str[456];
		GetPlayerName(playerid,wakaname,sizeof(wakaname));
		format(str,sizeof(str),"UPDATE users SET `Money`='%d' WHERE `ID`='%d'",GetPlayerCash(playerid),PlayerInfo[playerid][pSQLID]);
		mysql_query(SQL,str,false);
		format(str,sizeof(str),"UPDATE users SET `Money`='%d',`DrugsSkill`='%d' WHERE `ID`='%d'",GetPlayerCash(DrugOffer[playerid]),PlayerInfo[DrugOffer[playerid]][pDrugsSkill],PlayerInfo[DrugOffer[playerid]][pSQLID]);
		mysql_query(SQL,str,false);
		DrugType[playerid] = 0;
		DrugOffer[playerid] = 999;
		DrugPrice[playerid] = 0;
		DrugGram[playerid] = 0;

	}
	else if(strcmp(x_job,"repair",true) == 0) {
		if(RepairOffer[playerid] == 999) return SendClientMessage(playerid, COLOR_GREY, "Ban khong nhan duoc loi de nghi nao!");
		if(RepairOffer[playerid] != id) return SendClientMessage(playerid,COLOR_WHITE, "Nguoi choi nay khong gui loi moi sua chua phuong tien cho ban.");
		if(GetPlayerCash(playerid) < RepairPrice[playerid]) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co du tien sua xe!");
		if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_WHITE, "Xin hay len xe.");
		if(!IsPlayerConnected(RepairOffer[playerid])) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
		GetPlayerName(RepairOffer[playerid], giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		RepairCar[playerid] = GetPlayerVehicleID(playerid);		
		RepairVehicle(RepairCar[playerid]);
		SetVehicleHealth(RepairCar[playerid], 998.0);
		
		UpdateFactionRaport(id, 0);			
		DeelayCommand[id][5] = 30;
		format(string, sizeof(string), "**(( TTC Dispatch: Tow Truck Member %s (%s) sua xe cua %s (%d) voi gia %d$. ))**", GetName(id), id, GetName(playerid), playerid, RepairPrice[playerid]);
		SendFactionMessage(8, COLOR_LIGHTBLUE, string);
		
		format(string, sizeof(string), "* Phuong tien cua ban da duoc sua chua voi gia $%d boi tho co khi %s.",RepairPrice[playerid],giveplayer);
		SendClientMessage(playerid, COLOR_MONEY, string);
		format(string, sizeof(string), "* Ban da sua chua xe cua %s voi gia $%d.",sendername,RepairPrice[playerid]);
		SendClientMessage(RepairOffer[playerid], COLOR_MONEY, string);
		PlayerInfo[RepairOffer[playerid]][pMechSkill] ++;
		GivePlayerCash(RepairOffer[playerid],RepairPrice[playerid]);
		GivePlayerCash(playerid, -RepairPrice[playerid]);
		new str[184];
		Update(playerid, pCashx);
		Update(RepairOffer[playerid],pCashx);
		format(str,sizeof(str),"UPDATE users SET `MechSkill`='%d' WHERE `ID`='%d'",PlayerInfo[RepairOffer[playerid]][pMechSkill],PlayerInfo[RepairOffer[playerid]][pSQLID]);
		mysql_query(SQL,str,false);
		RepairOffer[playerid] = 999;
		RepairPrice[playerid] = 0;
		PlayerPlaySound(playerid,1133,0.0,0.0,0.0);		
		OnePlayAnim(id, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0);	
	}
	else {
		SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/chapnhan <item> <playerid/name>");
		SendClientMessage(playerid, COLOR_WHITE, "Trade, License, Dice, Drugs, Repair, Materials, Taxi,");
		SendClientMessage(playerid, -1, "Medic, Live, Free, Mecanic, Ticket, Refill, Invite, Lesson, Cinvite, Clan.");
	}
	return 1;
}

CMD:invite(playerid, params[]) {
	if(PlayerInfo[playerid][pRank] < 6) return SendClientMessage(playerid, -1, "Lenh nay chi danh cho lanh dao to chuc.");
	new id,string[100];
	if(sscanf(params, "u", id)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/invite <playerid/name>");
	if(PlayerInfo[id][pFpunish] != 0) return SendClientMessage(playerid,-1, "Nguoi choi da chon bi FP.");
	if(FactionMembers[PlayerInfo[playerid][pMember]] >= DynamicFactions[PlayerInfo[playerid][pMember]][fMaxSlot]) return SendClientMessage(playerid, COLOR_LIGHTRED, "To chuc cua ban da du nhan luc.");
	if(PlayerInfo[id][pLevel] < DynamicFactions[PlayerInfo[playerid][pMember]][fLevel]) return SendClientMessage(playerid, COLOR_LIGHTRED, "Nguoi choi khong dat cap do toi thieu de vao to chuc.");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	if(PlayerInfo[id][pMember] != 0 || PlayerInfo[id][pLeader] != 0) return SendClientMessage(playerid, -1, "Nguoi choi do da o trong mot to chuc khac!");
	if(IsInBlacklist(id, PlayerInfo[playerid][pMember])) return SendClientMessage(playerid, -1, "Nguoi choi do dang nam trong danh sach den cua to chuc!");
	/*if(PlayerInfo[playerid][pAdmin] < 7) {
		new szQuery[256];
		format(szQuery, sizeof(szQuery), "SELECT * FROM `app_factions` WHERE `UserID`='%d' AND `Status`='1' AND `Faction`='%d'", PlayerInfo[id][pSQLID], PlayerInfo[playerid][pLeader]);
		new Cache: result = mysql_query(SQL, szQuery);
		new test = cache_num_rows ();
		cache_delete(result);
		if(test == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the moi mot nguoi choi chua nop don tuyen dung vao to chuc!");
	}*/
	format(string, sizeof(string), "Leader %s moi ban vao to chuc %s. (/chapnhan invite %d)", GetName(playerid), FactionName(PlayerInfo[playerid][pMember]), playerid);
	SendClientMessage(id, COLOR_LIGHTBLUE, string);
	format(string, sizeof(string), "Ban da gui loi moi %s vao to chuc.", GetName(id));
	SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
	InvitedFaction[id] = PlayerInfo[playerid][pMember];
	InvitedBy[id] = playerid;
	SetPVarInt(id, "InvitedFaction", 1);
	return 1;
}

CMD:withdraw(playerid, params[]) {
    if(!IsAtBank(playerid) && !IsAtATM(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o ngan hang hoac o gan mot may ATM.");
	new money,string[100];
	if(sscanf(params, "i", money)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/ruttien <So tien>");
	if(money > PlayerInfo[playerid][pAccount] || money < 1) return SendClientMessage(playerid, COLOR_GRAD3, "Ban khong co du tien!");
	GivePlayerCash(playerid, money);
	PlayerInfo[playerid][pAccount]=PlayerInfo[playerid][pAccount]-money;
	format(string, sizeof(string), "Ban da rut $%s khoi tai khoan ngan hang. So con lai: $%s.", FormatNumber(money),FormatNumber(PlayerInfo[playerid][pAccount]));
	SendClientMessage(playerid, 0xFAAC25FF, string);
	new query[180];
	format(query,sizeof(query),"UPDATE users SET `Money`='%d',`Bank`='%d' WHERE `ID`='%d'",GetPlayerCash(playerid),PlayerInfo[playerid][pAccount],PlayerInfo[playerid][pSQLID]);
	mysql_query(SQL, query, false);
	ConsumingMoney[playerid] = 1;
	return 1;
}

CMD:deposit(playerid, params[]) {
    if(!IsAtBank(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong o tai ngan hang!");
    if(PlayerInfo[playerid][pLevel] < 5) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: De su dung lenh nay, ban can toi thieu Level 5.");
	new money,string[100];
	if(sscanf(params, "i", money)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/guitien <So tien>");
	if(money > GetPlayerCash(playerid) || money < 1) return SendClientMessage(playerid, COLOR_GRAD3, "Ban khong co du tien!");
	GivePlayerCash(playerid, -money);
	PlayerInfo[playerid][pAccount]=money+PlayerInfo[playerid][pAccount];
	format(string, sizeof(string), "Ban da gui $%s vao tai khoan ngan hang. So con lai: $%s.", FormatNumber(money),FormatNumber(PlayerInfo[playerid][pAccount]));
	SendClientMessage(playerid, 0xFAAC25FF, string);
	Update(playerid, pBank);
	Update(playerid, pCashx);
	return 1;
}

CMD:balance(playerid, params[]) {
	if(!IsAtBank(playerid) && !IsAtATM(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong o tai ngan hang!");
	new string[100];
	format(string, sizeof(string), "Ban co $%s trong tai khoan ngan hang.", FormatNumber(PlayerInfo[playerid][pAccount]));
	SendClientMessage(playerid, COLOR_WHITE, string);
	return 1;
}
/*CMD:kiemtrasampcac(playerid, params[]) {
	if(CAC_GetStatus(playerid) || GetPVarInt(playerid, "NotAndroid") == 0) 
	{
	 	SendClientMessage(playerid, COLOR_GOLD, "INFO: {FFFFFF}Ban dang su dung SAMPCAC phien ban moi nhat. Chuc vui ve.");
		UsingSampcac{playerid} = 1;
	}
	else SendClientMessage(playerid, COLOR_GOLD, "INFO: {FFFFFF}Ban chua cai dat SAMPCAC nen ban khong the tham gia war. Hay tai SAMPCAC o bai dang tren group.");
	return 1;
}*/
CMD:transfer(playerid, params[]) {
	if(strlen(PlayerInfo[playerid][pPin]) != 0 && PlayerInfo[playerid][pPinLogged] == 0) {
		 SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay vi ban chua dang nhap PIN.");
		 SendClientMessage(playerid, COLOR_GREY, "De xac thuc, su dung '/loginpin'!");
		 return 1;
	}	
	if(PlayerInfo[playerid][pLevel] < 5) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: De su dung lenh nay, ban can toi thieu Level 5.");
	if(!IsAtBank(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong o tai ngan hang!");   
	new id,moneytransfer,string[100],playermoney;
	if(TradeID[playerid] != -1) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the su dung lenh nay khi ban dang trong mot cuoc giao dich!");
	if(sscanf(params, "ui", id,moneytransfer)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/chuyentien <playerid/name> <So tien>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	if(PlayerInfo[id][pLevel] < 6) return SendClientMessage(playerid, -1, "Nguoi choi do can dat level 6 de nhan tien tu ban.");
	if(playerid == id) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the thuc hien lenh nay tren chinh minh!");
	//if(moneytransfer > 100000 && !ProxDetectorS(5.0, playerid, id)) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Pentru a transfera mai mult de $100.000, acel jucator trebuie sa fie langa tine!"); 
	playermoney = PlayerInfo[playerid][pAccount];
	if(moneytransfer < 10000 && moneytransfer > 500000000) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: So tien ban co the chuyen it nhat $10,000 va nhieu nhat $500,000,000!");
	if(moneytransfer > 0 && playermoney >= moneytransfer) {
		TransferOffer[playerid] = id;
		TransferMoney[playerid] = moneytransfer;	
		new cashbank = TransferMoney[playerid]/100;	
		
		format(string, sizeof(string), "Ban co chac chan muon chuyen $%s cho %s?\nPhi chuyen: $%s (chua bao gom thue, thue 15%%).",
			FormatNumber(moneytransfer), GetName(id), FormatNumber(cashbank));
		Dialog_Show(playerid, DIALOG_TRANSFER, DIALOG_STYLE_MSGBOX, "Chuyen khoan:", string, "Yes", "No");
	}
	else SendClientMessage(playerid, -1, "So tien khong hop le.");
	return 1;
}

CMD:staff(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;	
	Dialog_Show(playerid, DIALOG_STAFF, DIALOG_STYLE_LIST, "Staff", "Admins\nHelpers", "Ok", "Close");
	return 1;		
}
CMD:factions(playerid, params[]) {
	new szDialog[180], szDialog2[1024];
	strcat(szDialog2, "To chuc\tThanh vien\tTuyen dung\tLevel yeu cau\n");
	for(new i = 1; i <= facs; i++) {
		format(szDialog, sizeof(szDialog), "%d. %s\t%s/%d\t%s\t%d\n", i, DynamicFactions[i][fName], GetFactionMembers(i), DynamicFactions[i][fMaxSlot], GetFactionStatus(i), DynamicFactions[i][fLevel]);
		strcat(szDialog2, szDialog);
	}
	Dialog_Show(playerid, DIALOG_FACTIONS, DIALOG_STYLE_TABLIST_HEADERS, "To chuc:", szDialog2, "Ok", "Close");
	return 1;
}
//
CMD:finalpos(playerid, params[]) {
	new str[128];
	format(str, 128, "[DEBUG] %f, %f, %f", VipPos[0], VipPos[1], VipPos[2]);
	SendClientMessage(playerid, -1, str);
	print(str);
	VipText = 0;
	return 1;
}
		
CMD:xpos(playerid, params[]) {
	if(sscanf(params, "f", VipPos[0])) return 1;
	DestroyDynamicObject(VipText);
	VipText = CreateDynamicObject(1463, -2597.0762, -2638.4270, -5.3536, -87.6999, 90.4001, -87.1805);
	AttachDynamicObjectToVehicle(VipText, GetPlayerVehicleID(playerid), VipPos[0], VipPos[1], VipPos[2], 0.0, 0.0, 0.0);
	return 1;
}

CMD:ypos(playerid, params[]) {
	if(sscanf(params, "f", VipPos[1])) return 1;
	DestroyDynamicObject(VipText);
	VipText = CreateDynamicObject(1463, -2597.0762, -2638.4270, -5.3536, -87.6999, 90.4001, -87.1805);
	AttachDynamicObjectToVehicle(VipText, GetPlayerVehicleID(playerid), VipPos[0], VipPos[1], VipPos[2], 0.0, 0.0, 0.0);
	return 1;
}

CMD:zpos(playerid, params[]) {
	if(sscanf(params, "f", VipPos[2])) return 1;
	DestroyDynamicObject(VipText);
	VipText = CreateDynamicObject(1463, -2597.0762, -2638.4270, -5.3536, -87.6999, 90.4001, -87.1805);
	AttachDynamicObjectToVehicle(VipText, GetPlayerVehicleID(playerid), VipPos[0], VipPos[1], VipPos[2], 0.0, 0.0, 0.0);
	return 1;
}

CMD:flip(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1 && PlayerInfo[playerid][pVip] == 0) return 1;
	if(!IsPlayerInAnyVehicle(playerid)) return 1;
	if(PlayerInfo[playerid][pVip] == 1 && PlayerInfo[playerid][pWantedLevel] != 0) return  SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi ban bi truy na!");
	if(Iter_Contains(PlayerInRace, playerid) && PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong duoc phep su dung lenh nay khi ban dang o trong dau truong dua xe!");
    new Float:angle;
    GetVehicleZAngle(GetPlayerVehicleID(playerid), angle);
    SetVehicleZAngleEx(GetPlayerVehicleID(playerid), angle);

    RepairVehicle(GetPlayerVehicleID(playerid));
	SetVehicleHealth(GetPlayerVehicleID(playerid), 999);
	Gas[GetPlayerVehicleID(playerid)] = 100;
	return 1;
}
CMD:vnamecolor(playerid, params[]) {
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong o trong xe!");
	new car = GetPlayerVehicleID(playerid);
	if(GetVehicles(playerid) == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong co phuong tien ca nhan!");
	if(PersonalCar(playerid) == -1) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Day khong phai la xe ca nhan cua ban!");
	new idd = PersonalCar(playerid);
	if(strlen(CarInfo[idd][cText]) < 2) return SendClientMessage(playerid, -1, "Khong phai xe VIP!");
	if(CarInfo[idd][Spawned] != car) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong xe cua ban.");
	Dialog_Show(playerid, DIALOG_VIPCOLOR, DIALOG_STYLE_LIST, "VIP Name Colors:", 
	"{FFFFFF}White\n{0BA10B}Dark green\n{D1FF99}Light green\n{FF3D98}Pink\n{F9FF3D}Yellow\n{FFEF85}Light yellow\n{3DE5FF}Lightblue\n{FFAB3D}Orange\n{A13DFF}Mauve\n{FFC27D}Gold\n{FFA3A3}Light red\n{C5A3FF}Purple", "Ok", "Close");
	return 1;
}
CMD:vwheels(playerid, params[]) {
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong o trong xe!");
	new car = GetPlayerVehicleID(playerid);
	if(GetVehicles(playerid) == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong co phuong tien ca nhan!");
	if(PersonalCar(playerid) == -1) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Day khong phai la xe ca nhan cua ban!");
	new idd = PersonalCar(playerid);
	if(strlen(CarInfo[idd][cText]) < 2) return SendClientMessage(playerid, -1, "Khong phai xe VIP!");
	if(CarInfo[idd][Spawned] != car) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong xe cua ban.");
	Dialog_Show(playerid, DIALOG_WHEELS, DIALOG_STYLE_LIST, "Vip Wheels", "Shadow\nCutter\nSwitch\nDollar", "Ok", "Exit");
	return 1;
}

CMD:viplist(playerid, params[]) {
	new string[128], count=0;
	format(string, sizeof(string), "---------------------- Vip List ----------------------");
	SendClientMessage(playerid, COLOR_WHITE, string);
	foreach(new i: Player) {
		if(PlayerInfo[i][pVip] == 1) {
			format(string, sizeof(string), "%s (%d)", GetName(i),i);
			SendClientMessage(playerid, COLOR_WHITE, string);
			count++;
		}
	}
	format(string, sizeof(string), "{ADFF5C}* Co %d tai khoan VIP dang online.", count);
	SendClientMessage(playerid, COLOR_WHITE, string);
	SendClientMessage(playerid, COLOR_WHITE, "--------------------------------------------------------");		
	return 1;
}

CMD:vtext(playerid, params[]) {
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong xe cua ban!");
    new car = GetPlayerVehicleID(playerid);
	if(GetVehicles(playerid) == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong co phuong tien ca nhan!");
	if(PersonalCar(playerid) == -1) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Day khong phai la xe ca nhan cua ban!");
	new idd = PersonalCar(playerid);	
	if(CarInfo[idd][Spawned] != car) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong xe cua ban.");
	if(idd == 0) return SendClientMessage(playerid, COLOR_WHITE, "ERROR: {FFFFFF}Chiec xe nay khong phai cua ban!");
	if(strlen(CarInfo[idd][cText]) < 2) return SendClientMessage(playerid, -1, "Khong phai xe VIP!");
	if(PlayerInfo[playerid][pPremiumPoints] < 10) return SendClientMessage(playerid, -1, "Ban khong co 10 "#DIEMCAOCAP" de su dung lenh nay");
	new result[32];
	if(sscanf(params, "s[32]",result)) {
		SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/vtext <name>");
		SendClientMessage(playerid, COLOR_LGREEN, "Hay nho rang ban se mat 10 "#DIEMCAOCAP" sau khi thuc hien lenh nay!");
		return 1;
	}
	if(strfind(result, "'", true) != -1 || strfind(result, "Model", true) != -1 || strfind(result, "`", true) != -1) return SendClientMessage(playerid, -1, "Ky tu khong hop le!");
	switch(CarInfo[idd][cModel]) {
		case 560: if(strlen(result) < 3 || strlen(result) > 12) return SendClientMessage(playerid, COLOR_GREY, "Ban co the dat text it nhat la 3 ky tu va nhieu nhat la 12.");
		case 541: if(strlen(result) < 3 || strlen(result) > 11) return SendClientMessage(playerid, COLOR_GREY, "Ban co the dat text it nhat la 3 ky tu va nhieu nhat la 11.");
		case 429: if(strlen(result) < 3 || strlen(result) > 10) return SendClientMessage(playerid, COLOR_GREY, "Ban co the dat text it nhat la 3 ky tu va nhieu nhat la 10.");
		case 495: if(strlen(result) < 3 || strlen(result) > 14) return SendClientMessage(playerid, COLOR_GREY, "Ban co the dat text it nhat la 3 ky tu va nhieu nhat la 14.");
		case 579: if(strlen(result) < 3 || strlen(result) > 12) return SendClientMessage(playerid, COLOR_GREY, "Ban co the dat text it nhat la 3 ky tu va nhieu nhat la 12.");
		case 562: if(strlen(result) < 3 || strlen(result) > 10) return SendClientMessage(playerid, COLOR_GREY, "Ban co the dat text it nhat la 3 ky tu va nhieu nhat la 10.");
		case 451: if(strlen(result) < 3 || strlen(result) > 10) return SendClientMessage(playerid, COLOR_GREY, "Ban co the dat text it nhat la 3 ky tu va nhieu nhat la 10.");
		case 480: if(strlen(result) < 3 || strlen(result) > 14) return SendClientMessage(playerid, COLOR_GREY, "Ban co the dat text it nhat la 3 ky tu va nhieu nhat la 14.");
		case 411: if(strlen(result) < 3 || strlen(result) > 15) return SendClientMessage(playerid, COLOR_GREY, "Ban co the dat text it nhat la 3 ky tu va nhieu nhat la 15.");
	}
	if(strlen(CarInfo[idd][cText]) >= 2) DestroyDynamicObject(nameobject[CarInfo[idd][Spawned]]);
	format(CarInfo[idd][cText], 16, result);
	attach_vip_text(idd);
	new query[256], string[180];
	format(query, sizeof(query), "UPDATE `cars` SET `Text`='%s' WHERE `ID`='%d'", result, idd);
	mysql_query(SQL, query, false);
	PlayerInfo[playerid][pPremiumPoints] -= 10;
	Update(playerid, pPremiumPointsx);
	format(string, sizeof(string), "Ten o mat sau cua xe la '%s'. Ban da tra 10 "#DIEMCAOCAP"!", result);
	SendClientMessage(playerid, COLOR_MONEY, string);
	return 1;
}

CMD:nos(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1 && PlayerInfo[playerid][pVip] == 0) return 1;
	if(!IsPlayerInAnyVehicle(playerid)) return 1;
	if(Iter_Contains(PlayerInRace, playerid) && PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong duoc phep su dung lenh nay khi ban dang o trong dau truong dua xe!");
	if(PlayerInfo[playerid][pVip] == 1 && PlayerInfo[playerid][pWantedLevel] != 0) return  SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi ban bi truy na!");
    AddVehicleComponent(GetPlayerVehicleID(playerid),1010);
    SendClientMessage(playerid, COLOR_YELLOW, "Lenh da duoc them thanh cong.");
	return 1;
}
CMD:apark(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 6) return 1;
	new Float:x,Float:y,Float:z, Float:a;
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong xe.");
	new car = GetPlayerVehicleID(playerid);
	new carid = FindSpawnID(car);
	if(carid == 0) return 1;
	GetVehiclePos(car, x, y, z);
	GetVehicleZAngle(car, a);
	CarInfo[carid][cLocationx] = x;
	CarInfo[carid][cLocationy] = y;
	CarInfo[carid][cLocationz] = z;
	CarInfo[carid][cAngle] = a;
 	DestroyVehicle(car);
	VehicleOwned[CarInfo[carid][Spawned]] = 0;
	VehicleSQL[CarInfo[carid][Spawned]] = 0;
  	CarInfo[carid][Spawned] = CreateVehicleEx(CarInfo[carid][cModel],CarInfo[carid][cLocationx],CarInfo[carid][cLocationy],CarInfo[carid][cLocationz]+1.0,CarInfo[carid][cAngle],CarInfo[carid][cColorOne],CarInfo[carid][cColorTwo],-1);
	VehicleOwned[CarInfo[carid][Spawned]] = CarInfo[carid][Spawned];
	VehicleSQL[CarInfo[carid][Spawned]] = carid;	
	SetTunning(carid);
    saveCar(carid);
	return 1;
}

CMD:jobs(playerid, params[]) {
	if(Iter_Contains(PlayerInRace, playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong duoc phep su dung lenh nay khi ban dang o trong dau truong dua xe!");
	if(JobWorking[playerid] == 1) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong the su dung lenh nay ngay bay gio vi ban dang lam viec!");
	new szDialog[1024], szDialog2[1024], szTitle[50], jobBonus[30], jobStatus[30];
	strcat(szDialog2, "ID\tCong viec\tTrang thai\tKhoang cach\n");
	foreach(new j : Jobs) {
		if(strlen(JobInfo[j][jName]) > 0 ) {
			if(TodayJob == j && JobInfo[j][jBonus] > 0) format(jobBonus, sizeof(jobBonus), "+%d\%", JobInfo[j][jBonus]); 
			else jobBonus[0] = EOS;

			if(isJobDisabled(j)) {
				format(jobStatus, sizeof(jobStatus), "{FF0000}Tam dung hoat dong");
			}
			else {
				format(jobStatus, sizeof(jobStatus), "{00FF00}Hoat dong");
			}

			format(szDialog, sizeof(szDialog), "%d\t%s%s\t%s\t%0.2fm\n", j, JobInfo[j][jName], jobBonus, jobStatus, GetPlayerDistanceFromPoint(playerid, JobInfo[j][jPosX],JobInfo[j][jPosY],JobInfo[j][jPosZ]));
			strcat(szDialog2, szDialog);
		}
	}
	format(szTitle, sizeof(szTitle), "Danh sach cong viec: %d", Iter_Count(Jobs));
	Dialog_Show(playerid, DIALOG_JOBS, DIALOG_STYLE_TABLIST_HEADERS, szTitle, szDialog2, "Ok", "Cancel");
	return 1;
}
CMD:heal(playerid, params[]) {
	if(PaintType[playerid] != 0) return 1;
	new string[180];
	if(IsACop(playerid)) {
		if(InHouse[playerid] > 0) {
			SetPlayerHealthEx(playerid,99.0);
			if(HouseInfo[InHouse[playerid]][hHel] == 1 && OnDuty[playerid] == 1) {
				format(string, sizeof(string), "* %s da trang bi ao giap.", GetName(playerid));
				ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				SetPlayerArmourEx(playerid,99.0);
			}
		}
		else {
			if(IsPlayerInRangeOfPoint(playerid, 50.0, 245.8297,112.4436,1003.2188) || IsPlayerInRangeOfPoint(playerid, 50.0, 236.3031,162.9478,1003.0300) && IsACop(playerid)) {
				if(GetPlayerInterior(playerid) == 0) return SendClientMessage(playerid,COLOR_GREY, "Ban khong o trong HQ.");
				SetPlayerHealthEx(playerid,99.0);
				if(OnDuty[playerid] == 1) SetPlayerArmourEx(playerid,99.0);
			}
			else if(IsPlayerInRangeOfPoint(playerid, 50.0, 769.9825,-39.2081,1000.6865) || IsPlayerInRangeOfPoint(playerid, 50.0, 1719.3446,-1662.2314,20.2285) || IsPlayerInRangeOfPoint(playerid, 50.0,2324.3416,-1143.3370,1050.4922) || IsPlayerInRangeOfPoint(playerid, 50.0,616.0771,-11.4624,1000.9219)
			|| IsPlayerInRangeOfPoint(playerid, 50.0,960.9341,-51.0495,1001.1172) || IsPlayerInRangeOfPoint(playerid, 50.0,957.6353,2109.3533,1011.0234) || IsPlayerInRangeOfPoint(playerid, 50.0,1496.2422,1306.8334,1093.2891)) {
				SetPlayerHealthEx(playerid,99.0);
			}
		}
	}
	else {
		if(DeelayCommand[playerid][4] > 0) return DeelayTime(playerid, 4);
		DeelayCommand[playerid][4] = 30;
		if(InTraining[playerid] != 0) SetPlayerHealthEx(playerid,99.0); 
		if(InHouse[playerid] > 0) {
			if(HouseInfo[InHouse[playerid]][hHel] == 1) SetPlayerHealthEx(playerid,99.0);
		}
		if(InHQ[playerid] == PlayerInfo[playerid][pMember] && PlayerInfo[playerid][pMember] != 0) SetPlayerHealthEx(playerid,99.0), va_SendClientMessage(playerid, COLOR_PURPLE, "* %s vua an thuc an", GetName(playerid));
		new id,price;
		if(PlayerInfo[playerid][pMember] != 13) return 1;
		if(sscanf(params, "ui", id,price)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/heal <playerid/name> <price>");
		if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
		if(IsInBlacklist(id, 14)) return SendClientMessage(playerid, -1, "Nguoi choi do nam trong danh sach den cua to chuc!");	
		// if(price < 1 || price > 5000) return SendClientMessage(playerid, -1, "Gia phai tu $1 den $5,000.");
		if(price < 1 || price > 10) return SendClientMessage(playerid, -1, "Gia phai tu $1 den $10.");
		if(id == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay len chinh minh!"); 	
		if(GetPlayerCash(id) < price) return SendClientMessage(playerid,-1, "Nguoi choi khong co du tien.");
		new giveambu = GetPlayerVehicleID(id);
		new playambu = GetPlayerVehicleID(playerid);
		if(!IsAnAmbulance(playambu) || playambu != giveambu) return SendClientMessage(playerid, COLOR_WHITE, "Nguoi choi do khong o trong xe cuu thuong.");
		new Float:tempheal;
		GetPlayerHealthEx(id,tempheal);
		if(tempheal >= 98.0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Nguoi choi do khong can chua tri!");
		GivePlayerCash(playerid, price);
		GivePlayerCash(id, -price);
		SetPlayerHealthEx(id, 99);
		PlayerPlaySound(playerid, 1150, 0.0, 0.0, 0.0);
		
		format(string, sizeof(string), "**(( Paramedic Dispatch: Paramedic %s (%d) chua lanh cho %s (%d) voi gia %s$. ))**",GetName(playerid), playerid, GetName(id), id, FormatNumber(price));
		SendFactionMessage(13, COLOR_LIGHTBLUE,string);
		
		format(string, sizeof(string), "Ban da chua lanh cho nguoi nay voi gia %s$.",FormatNumber(price));
		SendClientMessage(id, COLOR_MONEY,string);
		format(string, sizeof(string), "Ban da duoc %s chua lanh vet thuong voi gia $%s.", GetName(id), FormatNumber(price));
		SendClientMessage(playerid, COLOR_MONEY, string);
		if(PlayerInfo[playerid][pMember] != PlayerInfo[id][pMember]) UpdateFactionRaport(playerid, 0);	
		Update(id, pCashx);
		Update(playerid, pCashx);	

		for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
			if(PlayerInfo[playerid][pDailyMission][m] == 15 || PlayerInfo[playerid][pDailyMission][m] == 16) CheckMission(playerid, m);
		}
	}
	return 1;
}

CMD:call(playerid, params[]) {
	new number,string[180],giveplayer[25];
	if(sscanf(params, "i",number)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/call <SDT>");
	if(PlayerInfo[playerid][pPhone] == 0) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co dien thoai.");
	if(PhoneOnline[playerid] > 0) return SendClientMessage(playerid, -1, "Dien thoai da tat nguon.");
	if(number == 112) {
		if(!policeHotline) return SendClientMessage(playerid, -1, "Call 112 tam khoa");
		if(OnDuty[playerid] == 1) return 1;
		if(WantedReason[playerid] != 999) {
			new killerid = GetPlayerID(WantedName[playerid]);
			if(killerid == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
			if(PlayerInfo[killerid][pWantedLevel] >= 6) return SendClientMessage(playerid, -1, "Nguoi choi bi truy na toi da!");
			PlayerInfo[killerid][pWantedLevel] += 1;
			
			format(string, sizeof(string), "Toi ac da duoc bao cao!",GetName(killerid));
			SendClientMessage(playerid,COLOR_CLIENT,string);
			
			SetPlayerCriminal(killerid,playerid, "giet nguoi muc do dau tien");
			ShowWanted[killerid] = 1;
			WantedReason[playerid] = 999;		
		}
		return 1;
	}
	if(number == PlayerInfo[playerid][pPhone]) return SendClientMessage(playerid, COLOR_GRAD2, "* May ban...");
	if(Mobile[playerid] != 255) return SendClientMessage(playerid, -1, "Ban dang o trong mot cuoc goi.");
	foreach(new i: Player) {
		if(IsPlayerConnected(i) && IsPlayerLogged[i] == 1) {
			if(PlayerInfo[i][pPhone] == number && number != 0) {
				new giveplayerid = i;
				if(!IsPlayerConnected(giveplayerid) && giveplayerid == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "So dien thoai khong hop le!");
				if(IsBlocked(giveplayerid, playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "Nguoi choi do da chan ban! Ban khong the lien lac voi ho.");
				if(IsBlocked(playerid, giveplayerid)) return SendClientMessage(playerid, COLOR_LGREEN, "Ban da chan nguoi choi do! Ban khong the lien lac voi ho.");
				if(Spectate[giveplayerid] != 255) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do dan ban!");
				if(PhoneOnline[giveplayerid] > 0) return SendClientMessage(playerid, -1, "Dien thoai cua ho da tat nguon.");
				if(Mobile[giveplayerid] != 255) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do dang trong mot cuoc goi voi mot nguoi khac.");
				Mobile[playerid] = giveplayerid;
				format(string, sizeof(string), "(!) %s (%s) dang goi cho ban. Su dung '/pickup' de nhac may.", GetName(playerid), DecimalNumber(playerid));
				SendClientMessage(giveplayerid, COLOR_YELLOW, string);
				new tel[180], tel2[180];
				format(tel, 256, "%d", PlayerInfo[playerid][pPhone]);
				format(tel2, 256, "%d", PlayerInfo[giveplayerid][pPhone]);								
				if(strlen(tel) == 4) format(string, sizeof(string), "%s lay iPhone ra va ghi mot so.", GetName(playerid));
				else format(string, sizeof(string), "%s lay dien thoai ra va bam mot so.", GetName(playerid));
				
				ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				GetPlayerName(giveplayerid,giveplayer,sizeof(giveplayer));
				if(PlayerInfo[playerid][pPhone] == 0) SetPlayerAttachedObject(playerid,4,330,6, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000 );
				else if(PlayerInfo[playerid][pPhone] == 1) SetPlayerAttachedObject( playerid, 4, 18865, 6, 0.086043, 0.027719, 0.003817, 95.232246, 178.651031, 1.691840, 1.002077, 1.000000, 1.000000 ); // MobilePhone1 - phone1
				else if(PlayerInfo[playerid][pPhone] == 2) SetPlayerAttachedObject( playerid,4, 18874, 6, 0.086043, 0.027719, 0.003817, 95.232246, 178.651031, 1.691840, 1.002077, 1.000000, 1.000000 ); // MobilePhone10 - phone10
				if(strlen(tel2) == 4) format(string, sizeof(string), "* iPhone cua %s dang keu ti tach ti tach, rung va giat len.", giveplayer);
				else format(string, sizeof(string), "* Tieng chuong dien thoai cat len tu tui quan cua %s.", giveplayer);
				ProxDetector(20.0, giveplayerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

				CellTime[playerid] = 1;
				Update(playerid, pCashx);
				SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
				if(PlayerInfo[playerid][pPhone] == 0) SetPlayerAttachedObject(playerid,4,330,6, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000 );
				else if(PlayerInfo[playerid][pPhone] == 1) SetPlayerAttachedObject( playerid, 4, 18865, 6, 0.086043, 0.027719, 0.003817, 95.232246, 178.651031, 1.691840, 1.002077, 1.000000, 1.000000 ); // MobilePhone1 - phone1
				else if(PlayerInfo[playerid][pPhone] == 2) SetPlayerAttachedObject( playerid,4, 18874, 6, 0.086043, 0.027719, 0.003817, 95.232246, 178.651031, 1.691840, 1.002077, 1.000000, 1.000000 ); // MobilePhone10 - phone10
				return 1;
			}
		}
	}
	SendClientMessage(playerid, COLOR_GREY, "So dien thoai khong hop le!");
	return 1;
}

CMD:sms(playerid, params[]) {
	new phonenumb,smstext[90],string[184],giveplayerid;
	if(PlayerInfo[playerid][pMuted] == 1) {
		format(string, 70, "Ban khong the tro chuyen ngay bay gio! Ban bi cam chat. (%d giay)",PlayerInfo[playerid][pMuteTime]);
		SendClientMessage(playerid, COLOR_GREY, string);
		return 1;
	}
	if(sscanf(params, "is[90]",phonenumb,smstext)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/sms <SDT> <noi dung>");
	if(FaceReclama(smstext)) return Reclama(playerid, smstext);
	if(DeelayCommand[playerid][4] > 0) return DeelayTime(playerid, 4);
	if(PlayerInfo[playerid][pPhone] == 0) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co dien thoai.");
	if(PhoneOnline[playerid] > 0) return SendClientMessage(playerid, -1, "Ban da tat dien thoai.");
	foreach(new i: Player) {
		if(PlayerInfo[i][pPhone] == phonenumb && phonenumb != 0) {
			giveplayerid = i;
			if(!IsPlayerConnected(giveplayerid) && giveplayerid == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "So dien thoai khong hop le!");
			if(IsBlocked(i, playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "Nguoi choi do da chan ban! Ban khong the lien lac voi ho.");
			if(IsBlocked(playerid, i)) return SendClientMessage(playerid, COLOR_LGREEN, "Ban da chan nguoi choi do! Ban khong the lien lac voi ho.");
			if(Spectate[i] != 255) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do dan ban!");
			if(PhoneOnline[giveplayerid] > 0) return SendClientMessage(playerid, -1, "Dien thoai cua nguoi do da tat nguon.");
			if(PlayerInfo[giveplayerid][pAdmin] >= 1) {
				format(string, sizeof(string), "SMS tu %s (%d): %s",GetName(playerid),playerid, smstext);
				SendClientMessage(giveplayerid, COLOR_YELLOW, string);
			}
			else {
				format(string, sizeof(string), "SMS tu %s (%s): %s",GetName(playerid),DecimalNumber(playerid), smstext);
				SendClientMessage(giveplayerid, COLOR_YELLOW, string);						
			}
			format(string, sizeof(string), "SMS gui cho %s (%s): %s",GetName(giveplayerid),DecimalNumber(giveplayerid),smstext);
			SendClientMessage(playerid, 0xC8E0DFFF, string);
			format(string, sizeof(string), "(sms) %s den %s: %s", GetName(playerid), GetName(giveplayerid), smstext);
			// ChatLog(playerid, string);	

			format(string, sizeof(string), "(SMS LOG) %s(%d) den %s(%d): %s", GetName(playerid), playerid, GetName(giveplayerid), giveplayerid, smstext);
			if(PlayerInfo[playerid][pAdmin] < 6) EarsMessage(0xFFC400FF, string);   
	
			//PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			PlayerPlaySound(giveplayerid, 1138, 0.0, 0.0, 0.0);
			Reply[giveplayerid] = playerid;
			DeelayCommand[playerid][4] = 5;
			return 1;
		}
	}
	SendClientMessage(playerid, COLOR_GREY, "So dien thoai khong hop le!");
	return 1;
}

CMD:re(playerid, params[])
{
	new id,message[128], string[256], sendername[25], giveplayer[25];
	if(PlayerInfo[playerid][pAdmin]+PlayerInfo[playerid][pHelper] != 0)
	{
		if(sscanf(params, "us[128]", id, message)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/re <playerid/name> <tin nhan>");
		{
			if(id != INVALID_PLAYER_ID)
			{
				GetPlayerName(playerid, sendername, sizeof(sendername));
				GetPlayerName(id, giveplayer, sizeof(giveplayer));
				format(string, sizeof(string), ">> %s: %s <<", sendername, message);
				SendClientMessage(id, COLOR_YELLOW, string);
				format(string, sizeof(string), "(/re)%s->%s: %s", sendername , giveplayer, message);
				SendStaffMessage(COLOR_YELLOW, string);
			}
			else return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
		}
	}
	else return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong the su dung lenh nay!");
	return 1;
}

CMD:reply(playerid, params[]) {
	new tel[180];
	format(tel, 256, "%d", PlayerInfo[playerid][pPhone]);
	if(strlen(tel) != 4) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co iPhone!");
	if(Reply[playerid] == -1) return 1;
	new phonenumb,smstext[90],sendername[30],string[184],giveplayerid;
	if(PlayerInfo[playerid][pMuted] == 1) {
		format(string, 70, "Ban khong the tro chuyen ngay bay gio! Ban bi cam chat. (%d giay)",PlayerInfo[playerid][pMuteTime]);
		SendClientMessage(playerid, COLOR_GREY, string);
		return 1;
	}
	if(sscanf(params, "s[90]",smstext)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/reply <noi dung>");
	if(FaceReclama(smstext)) return Reclama(playerid, smstext);
	if(PlayerInfo[playerid][pPhone] == 0) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co dien thoai.");
	if(PhoneOnline[playerid] > 0) return SendClientMessage(playerid, -1, "Ban da tat dien thoai.");
	phonenumb = PlayerInfo[Reply[playerid]][pPhone];
	foreach(new i: Player) {
		if(PlayerInfo[i][pPhone] == phonenumb && phonenumb != 0) {
			if(!IsPlayerConnected(giveplayerid) && giveplayerid == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "So dien thoai khong hop le!");
			if(IsBlocked(i, playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "Nguoi choi do da chan ban! Ban khong the lien lac voi ho.");
			if(IsBlocked(playerid, i)) return SendClientMessage(playerid, COLOR_LGREEN, "Ban da chan nguoi choi do! Ban khong the lien lac voi ho.");
			if(Spectate[i] != 255) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do dan ban!");
			giveplayerid = i;
			if(PhoneOnline[giveplayerid] > 0) return SendClientMessage(playerid, -1, "Dien thoai cua nguoi do da tat nguon.");
			GetPlayerName(playerid, sendername, sizeof(sendername));
			if(PlayerInfo[giveplayerid][pAdmin] >= 1) {
				format(string, sizeof(string), "SMS tu %s (%d): %s",GetName(playerid),playerid, smstext);
				SendClientMessage(giveplayerid, COLOR_YELLOW, string);
			}
			else {
				format(string, sizeof(string), "SMS tu %s (%s): %s",GetName(playerid),DecimalNumber(playerid), smstext);
				SendClientMessage(giveplayerid, COLOR_YELLOW, string);						
			}
			format(string, sizeof(string), "SMS gui den %s (%s): %s",GetName(giveplayerid),DecimalNumber(giveplayerid),smstext);
			SendClientMessage(playerid, 0xC8E0DFFF, string);
			format(string, sizeof(string), "(sms) %s gui den %s: %s", sendername, GetName(giveplayerid), smstext);
			// ChatLog(playerid, string);

			format(string, sizeof(string), "(SMS LOG) %s(%d) gui den %s(%d): %s", sendername, playerid, GetName(giveplayerid), giveplayerid, smstext);
			if(PlayerInfo[playerid][pAdmin] < 6) EarsMessage(0xFFC400FF, string);   

			//PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			PlayerPlaySound(giveplayerid, 1138, 0.0, 0.0, 0.0);
			return 1;
		}	
	}
	SendClientMessage(playerid, COLOR_GREY, "So dien thoai khong hop le!");
	return 1;
}

CMD:speaker(playerid, params[]) {
	if(PlayerInfo[playerid][pPhone] == 0) return SendClientMessage(playerid,COLOR_GREY, "Ban khong co dien thoai.");
	if(Mobile[playerid] == 255) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong mot cuoc goi.");
	if(PlayerInfo[playerid][pSpeaker] == 0) {
		SendClientMessage(playerid, -1, "* Da bat loa.");
		PlayerInfo[playerid][pSpeaker] = 1;
	}
	if(PlayerInfo[playerid][pSpeaker] == 1) {
		SendClientMessage(playerid, -1, "* Da tat loa.");
		PlayerInfo[playerid][pSpeaker] = 0;
	}
	return 1;
}

CMD:turn(playerid, params[]) {
	new result[50],string[128];
	if(sscanf(params, "s[50]",result)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/turn <Off/On>");
	if(strcmp(result,"off",true) == 0) {
		if(PhoneOnline[playerid] == 0) {
			PhoneOnline[playerid] = 1;
			UpdateVar(playerid, "PhoneOnline", PhoneOnline[playerid]);
			format(string, sizeof(string), "* %s da tat nguon dien thoai.", GetName(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		}
		else SendClientMessage(playerid, -1, "Dien thoai cua ban da duoc tat nguon!");
	}
	if(strcmp(result,"on",true) == 0) {
		if(PhoneOnline[playerid] == 1) {
			PhoneOnline[playerid] = 0;
			UpdateVar(playerid, "PhoneOnline", PhoneOnline[playerid]);
			format(string, sizeof(string), "* %s da mo nguon dien thoai.", GetName(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		}
		else SendClientMessage(playerid, -1, "Dien thoai cua ban dang sang den!");
	}
    return 1;
}

CMD:pickup(playerid, params[]) {
	new string[128];
	if(Mobile[playerid] != 255) return SendClientMessage(playerid, COLOR_GRAD2, "Ban dang o trong mot cuoc goi!");
	if(PhoneOnline[playerid] == 1) return SendClientMessage(playerid, COLOR_GREY, "Ban da tat dien thoai!");
	foreach(new i: Player) {
		if(IsPlayerConnected(i) && IsPlayerLogged[i] == 1) {
			if(Mobile[i] == playerid) {
				Mobile[playerid] = i;
				format(string, sizeof(string), "%s da tra loi dien thoai.", GetName(playerid));
				SendClientMessage(i, COLOR_YELLOW, string);
				format(string, sizeof(string), "* %s da tra loi dien thoai.", GetName(playerid));
				ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
				if(PlayerInfo[playerid][pPhone] == 0) SetPlayerAttachedObject(playerid,4,330,6, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000 );
				else if(PlayerInfo[playerid][pPhone] == 1) SetPlayerAttachedObject( playerid, 4, 18865, 6, 0.086043, 0.027719, 0.003817, 95.232246, 178.651031, 1.691840, 1.002077, 1.000000, 1.000000 ); // MobilePhone1 - phone1
				else if(PlayerInfo[playerid][pPhone] == 2) SetPlayerAttachedObject( playerid,4, 18874, 6, 0.086043, 0.027719, 0.003817, 95.232246, 178.651031, 1.691840, 1.002077, 1.000000, 1.000000 ); // MobilePhone10 - phone10
			}
		}
	}
	return 1;
}
CMD:vcolor(playerid, params[]) { // Day la /pcolor (OLD)
	if(PlayerInfo[playerid][pVip] == 0) return 1;
	Dialog_Show(playerid, DIALOG_PCOLOR, DIALOG_STYLE_LIST, "Colors:", 
	"{FFFFFF}Vo hieu hoa\n{0BA10B}Dark green\n{D1FF99}Light green\n{FF3D98}Pink\n{F9FF3D}Yellow\n{FFEF85}Light yellow\n{3DE5FF}Lightblue\n{FFAB3D}Orange\n{A13DFF}Mauve\n{FFC27D}Gold\n{FFA3A3}Light red\n{C5A3FF}Purple", "Ok", "Close");
	return 1;
}
CMD:hangup(playerid, params[]) {
	new caller = Mobile[playerid];
	if(!IsPlayerConnected(caller) && caller == INVALID_PLAYER_ID || caller == 255) return SendClientMessage(playerid,-1, "Ban khong o trong mot cuoc goi.");
	if(PhoneOnline[caller] == 0) {
		new string[180];
		format(string, sizeof(string), "%s da cup may.", GetName(playerid));
		SendClientMessage(caller, COLOR_YELLOW, string);
	}
	CellTime[caller] = 0;
	CellTime[playerid] = 0;
	SendClientMessage(playerid,COLOR_YELLOW,"Ban da cup may.");
	Mobile[caller] = 255;
	SetPlayerSpecialAction(caller,SPECIAL_ACTION_STOPUSECELLPHONE);

	RemovePlayerAttachedObject(caller,4);
	RemovePlayerAttachedObject(playerid,4);
	Mobile[playerid] = 255;
	PlayerInfo[playerid][pSpeaker] = 0;
	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
	return 1;
}

CMD:unrentveh(playerid, params[]) {
	if(HireCar[playerid] == -1) return SendClientMessage(playerid,COLOR_GREY, "Ban khong thue xe.");
	SetVehicleToRespawn(HireCar[playerid]);
	// gCarLock[HireCar[playerid]] = 0;
	new engine,lights,alarm,doors,bonnet,boot,objective;
	GetVehicleParamsEx(HireCar[playerid],engine,lights,alarm,doors,bonnet,boot,objective);
	SetVehicleParamsEx(HireCar[playerid],engine,lights,alarm,0,bonnet,boot,objective);
	vehEngine[HireCar[playerid]] = 0;
	GetVehicleParamsEx(HireCar[playerid],engine,lights,alarm,doors,bonnet,boot,objective);
	SetVehicleParamsEx(HireCar[playerid],VEHICLE_PARAMS_OFF,lights,alarm,doors,bonnet,boot,objective);
	HireCar[playerid] = -1;
	GameTextForPlayer(playerid, "~w~Ban khong con thue xe nua.", 5000, 3);
	TogglePlayerControllable(playerid, true);
	SetPVarInt(playerid, "Engine", 0);
	return 1;
}

CMD:lockrent(playerid, params[]) {
	if(HireCar[playerid] == -1) return SendClientMessage(playerid,COLOR_GREY, "Ban khong thue xe.");
	new string[64],engine,lights,alarm,doors,bonnet,boot,objective,car;
		
	if(IsPlayerInAnyVehicle(playerid)) car = GetPlayerVehicleID(playerid);
	else car = GetClosestVehicle(playerid);
	if(car == INVALID_VEHICLE_ID) return 1;
	GetVehicleParamsEx(car,engine,lights,alarm,doors,bonnet,boot,objective);

	if(doors == 0) {
		SetVehicleParamsEx(HireCar[playerid],engine,lights,alarm,1,bonnet,boot,objective);
		format(string, sizeof(string), "~w~%s~n~~r~KHOA",aVehicleNames[GetVehicleModel(HireCar[playerid])-400]);
		GameTextForPlayer(playerid, string, 5000, 4);
	}
	else if(doors == 1) {
		SetVehicleParamsEx(HireCar[playerid],engine,lights,alarm,0,bonnet,boot,objective);
		format(string, sizeof(string), "~w~%s~n~~g~KHONG KHOA",aVehicleNames[GetVehicleModel(HireCar[playerid])-400]);
		GameTextForPlayer(playerid, string, 5000, 4);
	}
	return 1;
}

CMD:drink(playerid, params[]) {
	if(IsAtBar(playerid) || IsPlayerInRangeOfPoint(playerid, 10.0,1768.3728,-1569.7539,1742.4792) || IsPlayerInRangeOfPoint(playerid, 15.0,835.1260,-2053.6489,12.8672) || IsPlayerInRangeOfPoint(playerid, 10.0,245.1689,-1828.3049,7.0547) || IsPlayerInRangeOfPoint(playerid, 10.0,209.9630,-1826.1757,7.0547)) {
		new Float:health;
		new x_nr[50],str[128];
		if(sscanf(params, "s[50]",x_nr)) {
			SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/drink <Drink name>");
			SendClientMessage(playerid, COLOR_WHITE, "Chat con: Beer (1,000$), Wine (1,500$), Vodka(3,000$), Whiskey(5,000$)");
			SendClientMessage(playerid, COLOR_WHITE, "Giai khat: Water (20$), Soda (50$), Sprunk(200$), Coffee (500$)");
			return 1;
		}
		if(strcmp(x_nr,"beer",true) == 0) {
			if(GetPlayerCash(playerid) < 1000) return SendClientMessage(playerid,COLOR_WHITE,"Ban khong co du tien.");
			GivePlayerCash(playerid, - 1000);
			PlayerDrunk[playerid] += 1;
			GetPlayerHealthEx(playerid, health);
			if(health <= 85) SetPlayerHealthEx(playerid, health + 14.0);
			BizzInfo[InBussines[playerid]][bTill] += 1000;
			SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DRINK_BEER);
			for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
				if(PlayerInfo[playerid][pDailyMission][m] == 10) CheckMission(playerid, m);
			}							
		}
		else if(strcmp(x_nr,"vodka",true) == 0) {
			if(GetPlayerCash(playerid) < 3000) return SendClientMessage(playerid,COLOR_WHITE,"Ban khong co du tien.");
			GivePlayerCash(playerid, - 3000);
			PlayerDrunk[playerid] += 2;			
			GetPlayerHealthEx(playerid, health);
			if(health <= 85) SetPlayerHealthEx(playerid, health + 14.0);
			SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DRINK_WINE);
			BizzInfo[InBussines[playerid]][bTill] += 3000;
			for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
				if(PlayerInfo[playerid][pDailyMission][m] == 10) CheckMission(playerid, m);
			}							
		}
		else if(strcmp(x_nr,"whiskey",true) == 0) {
			if(GetPlayerCash(playerid) < 5000) return SendClientMessage(playerid,COLOR_WHITE,"Ban khong co du tien.");
			GivePlayerCash(playerid, - 5000);
			PlayerDrunk[playerid] += 3;					
			GetPlayerHealthEx(playerid, health);
			if(health <= 85) SetPlayerHealthEx(playerid, health + 14.0);
			SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DRINK_WINE);
			BizzInfo[InBussines[playerid]][bTill] += 5000;
			for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
				if(PlayerInfo[playerid][pDailyMission][m] == 10) CheckMission(playerid, m);
			}							
		}
		else if(strcmp(x_nr,"wine",true) == 0) {
			if(GetPlayerCash(playerid) < 1500) return SendClientMessage(playerid,COLOR_WHITE,"Ban khong co du tien.");
			GivePlayerCash(playerid, - 1500);
			PlayerDrunk[playerid] += 3;					
			GetPlayerHealthEx(playerid, health);
			if(health <= 85) SetPlayerHealthEx(playerid, health + 14.0);
			SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DRINK_WINE);
			BizzInfo[InBussines[playerid]][bTill] += 1500;
			for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
				if(PlayerInfo[playerid][pDailyMission][m] == 10) CheckMission(playerid, m);
			}							
		}
		else if(strcmp(x_nr,"water",true) == 0) {
			if(GetPlayerCash(playerid) < 20) return SendClientMessage(playerid,COLOR_WHITE,"Ban khong co du tien.");
			GivePlayerCash(playerid, - 20);
			GetPlayerHealthEx(playerid, health);
			if(health <= 85) SetPlayerHealthEx(playerid, health + 14.0);
			SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DRINK_SPRUNK);
			BizzInfo[InBussines[playerid]][bTill] += 20;			
		}
		else if(strcmp(x_nr,"soda",true) == 0) {
			if(GetPlayerCash(playerid) < 50) return SendClientMessage(playerid,COLOR_WHITE,"Ban khong co du tien.");
			GivePlayerCash(playerid, - 50);
			GetPlayerHealthEx(playerid, health);
			if(health <= 85) SetPlayerHealthEx(playerid, health + 14.0);
			SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DRINK_SPRUNK);
			BizzInfo[InBussines[playerid]][bTill] += 50;
			for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
				if(PlayerInfo[playerid][pDailyMission][m] == 10) CheckMission(playerid, m);
			}				
		}
		else if(strcmp(x_nr,"sprunk",true) == 0) {
			if(GetPlayerCash(playerid) < 200) return SendClientMessage(playerid,COLOR_WHITE,"Ban khong co du tien.");
			GivePlayerCash(playerid, - 200);
			GetPlayerHealthEx(playerid, health);
			if(health <= 85)  SetPlayerHealthEx(playerid, health + 14.0);
			SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DRINK_SPRUNK);
			BizzInfo[InBussines[playerid]][bTill] += 200;
		}
		else if(strcmp(x_nr,"coffee",true) == 0) {
			if(GetPlayerCash(playerid) < 500) return SendClientMessage(playerid,COLOR_WHITE,"Ban khong co du tien.");
			GivePlayerCash(playerid, - 500);
			GetPlayerHealthEx(playerid, health);
			if(health <= 85) SetPlayerHealthEx(playerid, health + 14.0);
			SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DRINK_SPRUNK);
			SetPlayerDrunkLevel(playerid, 0);
			BizzInfo[InBussines[playerid]][bTill] += 500;
			for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
				if(PlayerInfo[playerid][pDailyMission][m] == 14) CheckMission(playerid, m);
			}
		}
		else return  SendClientMessage(playerid, COLOR_WHITE, "Bartender: Chung toi khong co thuc uong nay!");

		new string[70];
		format(string, sizeof(string), "* %s uong %s.", GetName(playerid) ,x_nr);
		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);	
		format(str,sizeof(str),"UPDATE `bizz` SET `Till`='%d' WHERE `ID`='%d'",BizzInfo[InBussines[playerid]][bTill],InBussines[playerid]);
		mysql_query(SQL,str,false);
    }
	else SendClientMessage(playerid, COLOR_GREY, "Ban khong o bar.");
    return 1;
}

CMD:clear(playerid, params[]) {
	if(!IsACop(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la thanh vien cua mot tru so canh sat.");
	new id,string[128],giveplayer[30],sendername[30];
	if(sscanf(params, "u", id)) return SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/clear <playerid/name>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	if(id == playerid) return SendClientMessage(playerid, COLOR_WHITE, "Ban khong the xoa toi cho chinh ban.");
	if(PlayerInfo[id][pWantedLevel] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Nguoi choi khong bi truy na!");
	GetPlayerName(id, giveplayer, sizeof(giveplayer));
	GetPlayerName(playerid, sendername, sizeof(sendername));
	format(string, sizeof(string), "%s da xoa tat ca diem truy na cho ban!", sendername);
	SendClientMessage(id, COLOR_LIGHTRED, string);
	format(string, sizeof(string), "Tru so: %s da xoa tat ca diem truy na cho %s.", sendername, giveplayer);
	SendTeamMessage(3, COLOR_LIGHTBLUE, string);
	SendTeamMessage(2, COLOR_LIGHTBLUE, string);
	SendTeamMessage(1, COLOR_LIGHTBLUE, string);
	SendTeamMessage(15, COLOR_LIGHTBLUE, string);
	PlayerInfo[id][pWantedLevel] = 0;
	SetPlayerWantedLevel(id, 0);
	ClearCrime(id);
	Update(id,pWantedLevelx);
	return 1;
}

CMD:showlicenses(playerid, params[]) {
	new id;
	if(DeelayCommand[playerid][0] > 0) return DeelayTime(playerid, 0); //delay khong lam dung
	if(sscanf(params, "u", id)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/xemgiayphep <playerid/name>");
	if(id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	if(!ProxDetectorS(8.0, playerid, id)) return SendClientMessage(playerid,COLOR_WHITE, "Nguoi choi do khong o gan ban.");
	if(Spectate[id] != 255) return SendClientMessage(playerid,COLOR_WHITE, "Nguoi choi do khong o gan ban.");
	new string[128];
	format(string, sizeof(string), "Ban cho %s xem giay phep.", GetName(id));
	SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
	format(string, sizeof(string), "%s cho ban xem giay phep.", GetName(playerid));
	SendClientMessage(id, COLOR_LIGHTBLUE, string);	
	DeelayCommand[playerid][0] = 20;
	ShowLicenses(id, playerid);
    return 1;
}
CMD:tog(playerid, params[]) {
	new szDialog[1024], szDialog2[1024];
	strcat(szDialog2, "He thong\tTrang thai\n");
	if(NewbieChat[playerid] == 0) format(szDialog, 1024, "Newbie chat\t{3BBF0B}Bat\n");
	else format(szDialog, 1024, "Newbie chat\t{FF0000}Tat\n");
	strcat(szDialog2, szDialog);
	if(toglc[playerid] == 0) format(szDialog, 1024, "Leader chat\t{3BBF0B}Bat\n");
	else format(szDialog, 1024, "Leader chat\t{FF0000}Tat\n");
	strcat(szDialog2, szDialog);
	if(gFam[playerid] == 0) format(szDialog, 1024, "Faction chat\t{3BBF0B}Bat\n");
	else format(szDialog, 1024, "Faction chat\t{FF0000}Tat\n");
	strcat(szDialog2, szDialog);
	if(WTToggle[playerid] == 0) format(szDialog, 1024, "Freq chat\t{3BBF0B}Bat\n");
	else format(szDialog, 1024, "Freq chat\t{FF0000}Tat\n");
	strcat(szDialog2, szDialog);
	if(HidePM[playerid] == 0) format(szDialog, 1024, "Whisper\t{3BBF0B}Bat\n");
	else format(szDialog, 1024, "Whisper\t{FF0000}Tat\n");
	strcat(szDialog2, szDialog);
	if(gOoc[playerid] == 0) format(szDialog, 1024, "OOC\t{3BBF0B}Bat\n");
	else format(szDialog, 1024, "OOC\t{FF0000}Tat\n");
	strcat(szDialog2, szDialog);
	if(gNews[playerid] == 0) format(szDialog, 1024, "News\t{3BBF0B}Bat\n");
	else format(szDialog, 1024, "News\t{FF0000}Tat\n");
	strcat(szDialog2, szDialog);
	if(toglicitatie[playerid] == 1) format(szDialog, 1024, "Auction\t{3BBF0B}Bat\n");
	else format(szDialog, 1024, "Auction\t{FF0000}Tat\n");
	strcat(szDialog2, szDialog);
	if(togclan[playerid] == 0) format(szDialog, 1024, "Clan chat\t{3BBF0B}Bat\n");
	else format(szDialog, 1024, "Clan chat\t{FF0000}Tat\n");
	strcat(szDialog2, szDialog);
	if(GetPVarInt(playerid, "Undercover") == 1) format(szDialog, 1024, "Name players\t{3BBF0B}Bat\n");
	else format(szDialog, 1024, "Name players\t{FF0000}Tat\n");
	strcat(szDialog2, szDialog);	
	if(togevent[playerid] == 0) format(szDialog, 1024, "Event chat\t{3BBF0B}Bat\n");
	else format(szDialog, 1024, "Event chat\t{FF0000}Tat\n");
	strcat(szDialog2, szDialog);
	if(togding[playerid] == 0) format(szDialog, 1024, "DMG Song (ding)\t{3BBF0B}Bat\n");
	else format(szDialog, 1024, "DMG Song (ding)\t{FF0000}Tat\n");
	strcat(szDialog2, szDialog);
	if(togsurf[playerid] == 0) format(szDialog, 1024, "Surf vehicle\t{3BBF0B}Bat\n");
	else format(szDialog, 1024, "Surf vehicle\t{FF0000}Tat\n");
	strcat(szDialog2, szDialog);	
	if(togfind[playerid] == 0) format(szDialog, 1024, "Find\t{3BBF0B}Bat\n");
	else format(szDialog, 1024, "Find\t{FF0000}Tat\n");
	strcat(szDialog2, szDialog);
	if(tograport[playerid] == 0) format(szDialog, 1024, "Raport\t{3BBF0B}Bat\n");
	else format(szDialog, 1024, "Raport\t{FF0000}Tat\n");
	strcat(szDialog2, szDialog);
	if(togjob[playerid] == 0) format(szDialog, 1024, "Job\t{3BBF0B}Bat\n");
	else format(szDialog, 1024, "Job\t{FF0000}Tat\n");
	strcat(szDialog2, szDialog);	
	if(PlayerInfo[playerid][pAdmin] == 1 || PlayerInfo[playerid][pVip] == 1) {
		if(togvip[playerid] == 0) format(szDialog, 1024, "VIP Chat\t{3BBF0B}Bat\n");
		else format(szDialog, 1024, "VIP Chat\t{FF0000}Tat\n");
		strcat(szDialog2, szDialog);	
	}
	if(togdice[playerid] == 0) format(szDialog, 1024, "Dice\t{3BBF0B}Bat\n");
	else format(szDialog, 1024, "Dice\t{FF0000}Tat\n");
	strcat(szDialog2, szDialog);
	Dialog_Show(playerid, DIALOG_TOG, DIALOG_STYLE_TABLIST_HEADERS, "Tog", szDialog2, "Select", "Close");
	return 1;
}

CMD:licenses(playerid, params[]) return ShowLicenses(playerid, playerid);
CMD:startlesson(playerid, params[]) {
	new id,string[180];
	if(PlayerInfo[playerid][pMember] != 7) return 1;
	if(sscanf(params, "u",id)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/startlesson <playerid/name>");
	if(IsInBlacklist(id, 7)) return SendClientMessage(playerid, -1, "Nguoi choi do nam trong danh sach den cua to chuc!");			
	if(GetPVarInt(playerid, "InLesson") != -1 || GetPVarInt(id, "InLesson") != -1) return SendClientMessage(playerid, -1, "Ban hoac nguoi choi do da o trong mot bai hoc.");
	if(id == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay len chinh minh!");
	if(id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	if(PlayerInfo[id][pLevel] < 3) return SendClientMessage(playerid, -1, "Ban khong the cap giay phep nay cho nguoi choi duoi Level 3.");
	if(!ProxDetectorS(9.0, playerid, id)) return SendClientMessage(playerid, -1, "Ban khong o gan nguoi choi do!");
	format(string, sizeof(string), "Instructor %s muon bat dau mot bai hoc de quyet dinh ban co the co giay phep hay khong. (/chapnhan lesson %d)", GetName(playerid), playerid);
	SendClientMessage(id, COLOR_LIGHTBLUE, string);
	format(string, sizeof(string), "Ban da gui loi moi den %s.", GetName(id));
	SendClientMessage(playerid, COLOR_LIGHTBLUE, string);	
	SetPVarInt(id, "Lesson", playerid);
	return 1;
}
CMD:givelicense(playerid, params[]) {
	if(PlayerInfo[playerid][pMember] < 7) return 1;
	new id,x_nr[10],string[128], days, money;
	if(sscanf(params, "us[10]i",id,x_nr,days)) {
		SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/givelicense <playerid/name> <License> <thoi gian (1-3) 1 = 7 ngay, 2 = 15 ngay, 3 = 30 ngay>");
		SendClientMessage(playerid, COLOR_WHITE, "Co san: Fly, Sailing.");
		return 1;
	}
	if(GetPVarInt(id, "InLesson") != playerid) return SendClientMessage(playerid, -1, "Nguoi choi nay khong o trong mot bai hoc.");
	if(days >= 3) return SendClientMessage(playerid, COLOR_RED, "Ngay khong hop le");
	if(id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	if(PlayerInfo[id][pLevel] < 3) return SendClientMessage(playerid, -1, "Ban khong the cap giay phep nay cho nguoi choi duoi Level 3.");
	if(!ProxDetectorS(9.0, playerid, id)) return SendClientMessage(playerid, -1, "Ban khong o gan nguoi choi do!");
	new date;
	if(strcmp(x_nr,"fly",true) == 0) {
		//new money = 500000;
		switch(days)
		{
			case 1: money = 300000, date = 7;
			case 2: money = 600000, date = 15;
			case 3: money = 1000000, date = 30;
		}	
		if(GetPlayerCash(id) < money) return SendClientMessage(playerid, -1, "Nguoi choi khong co du tien!");
		if(PlayerInfo[id][pFlyLicS] != 0) return SendClientMessage(playerid, -1, "Nguoi choi dang bi dinh chi giay phep!");
		if(PlayerInfo[id][pFlyLicT] >= 20) return SendClientMessage(playerid, -1, "Nguoi choi do da co giay phep nay!");
		format(string, sizeof(string), "* Ban de nghi cap giay phep su dung may bay cho %s voi gia $%s trong vong %d ngay.",GetName(id), FormatNumber(money), date);
		SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "* Instructor %s muon cap cho ban mot giay phep su dung may bay voi gia $%s trong vong %d ngay. (/chapnhan license %d)",GetName(playerid), FormatNumber(money), date, playerid);
		SendClientMessage(id, COLOR_LIGHTBLUE, string);
		License[id] = 1;
		LicenseOffer[id] = playerid;
		LicenseDays[id] = days;
	}
	else if(strcmp(x_nr,"sailing",true) == 0) {
		//new money = 500000;
		switch(days)
		{
			case 1: money = 300000, date = 7;
			case 2: money = 600000, date = 15;
			case 3: money = 1000000, date = 30;
		}
		if(GetPlayerCash(id) < money) return SendClientMessage(playerid, -1, "Nguoi choi khong co du tien!");
		if(PlayerInfo[id][pBoatLicS] != 0) return SendClientMessage(playerid, -1, "Nguoi choi dang bi dinh chi giay phep!");
		if(PlayerInfo[id][pBoatLicT] >= 20) return SendClientMessage(playerid, -1, "Nguoi choi do da co giay phep nay!");
		format(string, sizeof(string), "* Ban de nghi cap giay phep su dung thuyen cho %s voi gia $%s trong vong %d.",GetName(id), FormatNumber(money), date);
		SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "* Instructor %s muon cap cho ban mot giay phep su dung thuyen voi gia $%s trong vong %d ngay. (/chapnhan license %d)",GetName(playerid), FormatNumber(money), date,playerid);
		SendClientMessage(id, COLOR_LIGHTBLUE, string);
		License[id] = 2;
		LicenseOffer[id] = playerid;
		LicenseDays[id] = days;
	}
	// else if(strcmp(x_nr,"gun",true) == 0) {			
	// 	new money = 1000000;
	// 	if(GetPlayerCash(id) < money) return SendClientMessage(playerid, -1, "Nguoi choi khong co du tien!");
	// 	if(PlayerInfo[id][pGunLicS] != 0) return SendClientMessage(playerid, -1, "Nguoi choi dang bi dinh chi giay phep!");
	// 	if(PlayerInfo[id][pGunLicT] >= 20) return SendClientMessage(playerid, -1, "Nguoi choi do da co giay phep nay!");
	// 	format(string, sizeof(string), "* Ban de nghi cap giay phep sung cho %s voi gia $%s.",GetName(id), FormatNumber(money));
	// 	SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
	// 	format(string, sizeof(string), "* Instructor %s muon cap giay phep sung cho ban voi gia $%s. (/chapnhan license %d)",GetName(playerid), FormatNumber(money), playerid);
	// 	SendClientMessage(id, COLOR_LIGHTBLUE, string);
	// 	License[id] = 3;
	// 	LicenseOffer[id] = playerid;
	// }
    return 1;
}
CMD:capgiayphep(playerid, params[]) {
	if(PlayerInfo[playerid][pLeader] != 1) return SendClientMessage(playerid, COLOR_YELLOW, "Chi leader LSPD moi co the dung lenh nay");
	new id,string[128], days, money, date;
	if(sscanf(params, "ui",id,days)) {
		SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/capgiayphep <playerid/name> <thoi gian (1-3) 1 = 7 ngay, 2 = 15 ngay, 3 = 30 ngay>");
		SendClientMessage(playerid, COLOR_WHITE, "Co san: gun.");
		return 1;
	}
	//if(GetPVarInt(id, "InLesson") != playerid) return SendClientMessage(playerid, -1, "Nguoi choi nay khong o trong mot bai hoc.");
	if(days >= 3) return SendClientMessage(playerid, COLOR_RED, "Ngay khong hop le");
	if(id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	if(PlayerInfo[id][pLevel] < 3) return SendClientMessage(playerid, -1, "Ban khong the cap giay phep nay cho nguoi choi duoi Level 3.");
	if(!ProxDetectorS(9.0, playerid, id)) return SendClientMessage(playerid, -1, "Ban khong o gan nguoi choi do!");

	//new money = 500000;
	switch(days)
	{
		case 1: money = 450000, date = 7;
		case 2: money = 1000000, date = 15;
		case 3: money = 2000000, date = 30;
	}	
	if(GetPlayerCash(id) < money) return SendClientMessage(playerid, -1, "Nguoi choi khong co du tien!");
	if(PlayerInfo[id][pFlyLicS] != 0) return SendClientMessage(playerid, -1, "Nguoi choi dang bi dinh chi giay phep!");
	if(PlayerInfo[id][pFlyLicT] >= 20) return SendClientMessage(playerid, -1, "Nguoi choi do da co giay phep nay!");
	format(string, sizeof(string), "* Ban de nghi cap giay phep su dung sung cho %s voi gia $%s trong vong %d ngay.",GetName(id), FormatNumber(money), date);
	SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
	format(string, sizeof(string), "* Canh sat %s muon cap cho ban mot giay phep su dung sung voi gia $%s trong vong %d ngay. (/chapnhan gps %d)",GetName(playerid), FormatNumber(money), date, playerid);
	SendClientMessage(id, COLOR_LIGHTBLUE, string);
	License[id] = 1;
	LicenseOffer[id] = playerid;
	LicenseDays[id] = days;
    return 1;
}
CMD:stoplesson(playerid, params[]) {
	if(GetPVarInt(playerid, "InLesson") == -1) return SendClientMessage(playerid, -1, "Ban khong o trong mot bai hoc.");
	new id = GetPVarInt(playerid, "InLesson");
	if(!IsPlayerConnected(id)) return 1;
	SetPVarInt(playerid, "InLesson", -1);
	SetPVarInt(id, "InLesson", -1);
	SendClientMessage(id, COLOR_LIGHTBLUE, "Bai hoc ket thuc!");
	SendClientMessage(playerid, COLOR_LIGHTBLUE, "Bai hoc ket thuc!");
	return 1;
}

CMD:instructors(playerid, params[]) {
	SendClientMessage(playerid, -1, "---- Giao vien dang online ----");
	new string[128], x;
	foreach(new i: Player) {
		if(IsPlayerConnected(i) && PlayerInfo[i][pMember] == 7) {
			format(string, sizeof(string), "%s (%d) - Nr. %d", GetName(i), i, PlayerInfo[i][pPhone]);
			SendClientMessage(playerid, -1, string);
			x++;
		}
	}
	if(x == 0) return SendClientMessage(playerid, -1, "Khong co giao vien dang online.");
	else {
		format(string, sizeof(string), "Giao vien dang online: %d", x);
		SendClientMessage(playerid, COLOR_LGREEN, string);
	}	
	return 1;
}
CMD:wthelp(playerid, params[]) {
	if(PlayerInfo[playerid][pWTalkie] == 0) return SendClientMessage(playerid, 0xFFFFFFFF, "Ban khong co radio tan so.");
	SendClientMessage(playerid,COLOR_WHITE,"Walkie Talkie: /setfreq /wt /freqmembers");
	return 1;
}
CMD:vote(playerid, params[]) {
	if(SondajTime == 0) return SendClientMessage(playerid, COLOR_GREY, "Khong co cuoc tham do y kien nao hoat dong!");
	if(SondajVote[playerid] == 1) return SendClientMessage(playerid, COLOR_GREY, "Ban da bo phieu cho cuoc tham do y kien nay!");
	new string[180];
	format(string, sizeof(string), "Cau hoi la:\n%s", Sondaj);
	Dialog_Show(playerid, DIALOG_SONDAJ, DIALOG_STYLE_MSGBOX, "Sondaj", string, "Yes", "No");	
	return 1;
}
CMD:setfreq(playerid, params[]) {
	new string[23];
	if(PlayerInfo[playerid][pWTalkie] == 0) return SendClientMessage(playerid, 0xFFFFFFFF, "Ban khong co radio tan so radio.");
	new freqss2;
    if(sscanf(params, "i",freqss2)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/setfreq <Tan so>");
    if(freqss2 < 0 || freqss2 > 100 ) return SendClientMessage(playerid, COLOR_GREY, "Tan so co san: 1-100.");
	if(WTToggle[playerid] == 1) return SendClientMessage(playerid, 0xFFFFFFFF, "Radio tan so cua ban da bi tat. Su dung /tog de bat lai.");
	if(freqss2 == WTChannel[playerid]) return SendClientMessage(playerid, COLOR_GREY, "Ban dang o tan so nay.");
	new query[256];
	WTChannel[playerid] = freqss2;
	format(query, sizeof(query), "UPDATE `users` SET `WTChannel`='%d' WHERE `ID`='%d'", WTChannel[playerid], PlayerInfo[playerid][pSQLID]);
	mysql_query(SQL, query, false);	
	if(freqss2 == 0) {
		SendClientMessage(playerid, COLOR_YELLOW, "Ban da tat radio tan so!");
		return 1;
	}		
    format(string, sizeof(string), "Ban da chon tan so %d.",freqss2);
    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
	return 1;
}
CMD:wt(playerid, params[]) {
	if(PlayerInfo[playerid][pWTalkie] == 0) return SendClientMessage(playerid, 0xFFFFFFFF, "Ban khong co radio tan so radio.");
	new msg[128],sendername[25],string[180];
    if(PlayerInfo[playerid][pMuted] == 1) {
		format(string, 70, "Ban khong the tro chuyen ngay bay gio! Ban bi cam chat. (%d giay)",PlayerInfo[playerid][pMuteTime]);
		SendClientMessage(playerid, COLOR_GREY, string);
		return 1;
	}
	if(sscanf(params, "s[128]", msg)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/wt <noi dung>");
	if(WTToggle[playerid] == 1) return SendClientMessage(playerid, 0xFFFFFFFF, "Radio tan so cua ban da bi tat. Su dung /tog de bat lai.");
	if(WTChannel[playerid] == 0) return SendClientMessage(playerid,COLOR_GREY, "Ban khong co radio tan so!");
	GetPlayerName(playerid,sendername,sizeof(sendername));
	foreach(new i: Player) {
		if(WTChannel[i] == WTChannel[playerid] && WTToggle[i] == 0) {
			format(string, sizeof(string), "[FREQ %d] %s: %s",WTChannel[playerid],sendername, msg);
			SendClientMessage(i, 0xC8E0DFFF, string);
		}
	}
	return 1;
}
CMD:freqmembers(playerid, params[]) {
	if(PlayerInfo[playerid][pWTalkie] == 0) return SendClientMessage(playerid, 0xFFFFFFFF, "Ban khong co radio tan so radio.");
	if(WTChannel[playerid] == 0) return SendClientMessage(playerid,COLOR_GREY, "Ban khong co radio tan so!");
	new string[180], x;
	format(string, sizeof(string), "-- Nguoi choi dang o tan so %d --", WTChannel[playerid]);
	SendClientMessage(playerid, -1, string);
	foreach(new i: Player) {
		if(WTChannel[i] == WTChannel[playerid]) {	
			format(string, sizeof(string), "%s (%d)", GetName(i), i);
			SendClientMessage(playerid, -1, string);
			x++;
		}
	}
	if(x == 0) return SendClientMessage(playerid, -1, "Khong co nguoi choi nao tren tan so nay!");
	else {
		format(string, sizeof(string), "* Ban da tim thay %d nguoi choi tren tan so nay!", x);
		SendClientMessage(playerid, COLOR_LGREEN, string);
	}	
	return 1;
}

CMD:arrest(playerid, params[])  {
	if(!IsACop(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la thanh vien cua mot tru so canh sat.");
	if(OnDuty[playerid] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong onduty!");
	new id,string[186];
	if(sscanf(params, "u", id)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/arrest <playerid/name>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	if(IsPlayerInRangeOfPoint(playerid, 15.0, 1762.1947,-1578.4435,1742.5059) || IsPlayerInRangeOfPoint(playerid, 10.0, 1526.5613,-1677.7168,5.8906) || IsPlayerInRangeOfPoint(playerid, 10.0, 2281.6555,2429.8877,3.2734)) {	
		if(GetDistanceBetweenPlayers(playerid,id) > 10) return SendClientMessage(playerid,-1, "Nguoi choi do khong o gan ban.");
		if(PlayerInfo[id][pWantedLevel] < 1) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi khong bi truy na.");
		UpdateFactionRaport(playerid, 1);	
		ClearCrime(id);
		GivePlayerCash(id, -PlayerInfo[id][pWantedLevel]*2000);
		GivePlayerCash(playerid, PlayerInfo[id][pWantedLevel]*2000);
		ResetWeapons(id);
		JailPrice[id] = 1000;
		PlayerInfo[id][pJailTime] = PlayerInfo[id][pWantedLevel] * 250;
		SetPlayerWantedLevel(id, 0);					
		format(string, sizeof(string), "Ban da bi tom co boi %s trong %d giay, va tra tien phat $%d.", GetName(playerid), PlayerInfo[id][pJailTime],  PlayerInfo[id][pWantedLevel]*350);
		SendClientMessage(id, COLOR_LIGHTBLUE, string);
		PlayerInfo[id][pJailed] = 1;
		PlayerInfo[id][pArrested] += 1;					
		SetPlayerFree(id, playerid, "Bi tom co");
		arrestcop[id] = playerid;
		Update(id,pJailedx);
		Update(id,pJailTimex);
		Update(playerid,pCashx);
		Update(id,pCashx);
		
		PutPlayerInJail(id);
		if(PlayerCuffed2[id] == 1) {
			PlayerCuffed2[id] = 0;
			SetPlayerSpecialAction(id,SPECIAL_ACTION_NONE);
			RemovePlayerAttachedObject(id,1);
			TogglePlayerControllable(id, true);
		}
		format(string, sizeof(string), "%s da bat duoc nghi pham %s, nguoi nay tra tien phat $%d va ngoi tu trong %d giay.", GetName(playerid), GetName(id), PlayerInfo[id][pWantedLevel]*350, PlayerInfo[id][pJailTime]);
		SCMTA(COLOR_LIGHTRED, string);
		PlayerInfo[id][pWantedLevel] = 0;
		Update(id,pWantedLevelx);
		
		for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
			if(PlayerInfo[playerid][pDailyMission][m] == 15 || PlayerInfo[playerid][pDailyMission][m] == 16) CheckMission(playerid, m);
		}			
	}
	else SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong khu vuc nha tu.");
	return 1;
}

CMD:spawncar(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;
	new model,string[180], color1, color2;
	if(sscanf(params, "iii", model, color1, color2)) return SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/spawncar <Model> <color1> <color2>");
	if(model < 400 || model > 611) return SendClientMessage(playerid,COLOR_WHITE, "Invalid car ID.");
	new Float:X,Float:Y,Float:Z;
	GetPlayerPos(playerid, X,Y,Z);
	new carid = CreateVehicleEx(model, X,Y,Z, 0.0,  color1, color2, 300);
	Gas[carid] = 100;
	SetVehicleNumberPlate(carid, "AdmCar");
	Carspawn[carid] = carid;
	new vehicles = GetVehicleModel(carid) - 400;
	format(string, sizeof(string), "[{B81616}AdmWarning{FFFFFF}]: %s vua spawned mot chiec %s (%d) (tong so xe hien co - %d).",GetName(playerid),aVehicleNames[vehicles],carid, CountSpawnCars());
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(-1, string, 2);
	LinkVehicleToInterior(carid, GetPlayerInterior(playerid));
	SetVehicleVirtualWorld(carid, GetPlayerVirtualWorld(playerid));
	PutPlayerInVehicleEx(playerid, carid, 0);
	return 1;
}



CMD:rob(playerid, params[]) {
	if(InBussines[playerid] == -1) return SendClientMessage(playerid, -1, "Ban khong o trong mot bizz.");
	if(IsACop(playerid)) return 1;
	if(!NearSafe(playerid)) return SendClientMessage(playerid, -1, "Ban khong o gan ket an toan.");
	if(InRob[playerid] != 0) return 1;
	if(PlayerInfo[playerid][pRob] < 10) return SendClientMessage(playerid, -1, "Ban khong co 10 diem cuop.");
	if(PlayerInfo[playerid][pWantedLevel] != 0) return SendClientMessage(playerid, -1, "Ban khong the cuop khi bi truy na.");
	if(targetfind[playerid] != -1) return Dialog_Show(playerid, DIALOG_CHECKPOINT, DIALOG_STYLE_MSGBOX, "Checkpoint", "Mot cham do dang hoat dong.\nBan co muon xoa no khong? Neu muon, hay chon 'Ok'.", "Ok", "Exit");
	if(PlayerInfo[playerid][pLevel] < 5) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: De su dung lenh nay, ban can toi thieu level 5.");
	PlayerInfo[playerid][pRob] -= 10;
	Update(playerid, pRobx);
	new id = InBussines[playerid], string[180];
	format(string, sizeof(string), "Ban dang cuop doanh nghiep ID %d. Tai doanh nghiep nay, ban se phai lay %d tui tien.", id, GetBags(id));
	SendClientMessage(playerid, COLOR_YELLOW, string); 
	SendClientMessage(playerid, COLOR_YELLOW, "De gom tien vao tui, su dung lenh /steal.");	
	InRob[playerid] = 1;

	BizRobbed[playerid] = BizzInfo[id][bType];
	Bags[playerid] = 0;
	LastRVehicle[playerid] = 0;
	SafeRTime[playerid] = 0;
	SetPlayerWantedLevel(playerid, 6);
	PlayerInfo[playerid][pWantedLevel] = 6;
	SetPlayerCriminal(playerid,255, "cuop ngan hang co vu trang");
    WantedTime[playerid] = 0;
    Update(playerid,pWantedLevelx);
	ShowWanted[playerid] = 1;
	finishAchievement(playerid, 13);
	return 1;
}
	
CMD:steal(playerid, params[]) {
	if(InRob[playerid] == 0) return SendClientMessage(playerid, -1, "Ban khong cuop mot bizz.");
	if(InBussines[playerid] == -1) return SendClientMessage(playerid, -1, "Ban khong o trong mot bizz.");
	if(BizRobbed[playerid] != BizzInfo[InBussines[playerid]][bType]) return SendClientMessage(playerid, -1, "Ban khong o trong loai bizz ma ban da su dung lenh /rob.");
	if(HaveBag[playerid] == 1) return SendClientMessage(playerid, -1, "Ban da mang mot cai tui.");
	if(Bags[playerid] >= GetBags(BizRobbed[playerid])) return SendClientMessage(playerid, -1, "Ban da lay tat ca tui tien!");
	if(!NearSafe(playerid)) return SendClientMessage(playerid, -1, "Ban khong o gan ket an toan.");
	HaveBag[playerid] = 1;
	SafeRTime[playerid] = 5;
	TogglePlayerControllable(playerid,false);
	OnePlayAnim(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0);
	Freezed[playerid] = 1;
	return 1;
}
CMD:slap(playerid, params[]) {
	if(PlayerInfo[playerid][pHelper]+PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new string[180],id;
	if(sscanf(params, "u",id)) return SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/slap <playerid/name>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	new Float:shealth;
	if(PlayerInfo[id][pAdmin] > PlayerInfo[playerid][pAdmin]) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay len nguoi choi do!");
	new Float:slx, Float:sly, Float:slz;

	GetPlayerHealthEx(id, shealth);
	SetPlayerHealthEx(id, shealth-5);
	GetPlayerPos(id, slx, sly, slz);
	SetPlayerPosEx(id, slx, sly, slz+5);
	PlayerPlaySound(id, 1190, slx, sly, slz+5);
		
	format(string, sizeof(string), "[{B81616}AdmWarning{FFFFFF}]: %s vua slap %s.", GetName(playerid),GetName(id));
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(-1, string,1);
	return 1;
}
CMD:slapas(playerid, params[]) {
	if(PlayerInfo[playerid][pHelper]+PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new string[180],id;
	if(sscanf(params, "u",id)) return SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/slap <playerid/name>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	if(PlayerInfo[id][pAdmin] > PlayerInfo[playerid][pAdmin]) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay len nguoi choi do!");
	new Float:slx, Float:sly, Float:slz;

	GetPlayerPos(id, slx, sly, slz);
	SetPlayerPosEx(id, slx, sly, slz+10000);
	PlayerPlaySound(id, 1190, slx, sly, slz+10000);
		
	format(string, sizeof(string), "[{B81616}AdmWarning{FFFFFF}]: %s vua slap %s.", GetName(playerid),GetName(id));
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(-1, string,1);
	return 1;
}
/*
CMD:smoke(playerid, params[]) {

	return 1;
}*/
CMD:oldcar(playerid, params[]) {
	new string[64];
	format(string, sizeof(string), "Chiec xe cuoi cung: %d",gLastCar[playerid]);
	SendClientMessage(playerid, COLOR_WHITE, string);
    return 1;
}
CMD:eject(playerid, params[]) {
    if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong o trong bat ky phuong tien nao de su dung lenh nay.");
	new id,string[128],giveplayer[25];
	if(GetPlayerState(playerid)!=PLAYER_STATE_DRIVER) return SendClientMessage(playerid,-1, "Ban chi co the da' nguoi khac ra ngoai xe khi ban la tai xe.");
	if(sscanf(params, "u",id)) return SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/eject <playerid/name>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	new test = GetPlayerVehicleID(playerid);
	if(PlayerTied[id] > 0) return SendClientMessage(playerid, -1, "Nguoi choi dang bi troi.");
	if(id == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the tu da' minh.");
	if(IsPlayerInVehicle(id,test) || GetPlayerSurfingVehicleID(id) == test) {
		if(GetPlayerSurfingVehicleID(id) == test) SlapPlayer(id);
		new PName[MAX_PLAYER_NAME];
		GetPlayerName(playerid,PName,sizeof(PName));
		GetPlayerName(id, giveplayer, sizeof(giveplayer));
		format(string, sizeof(string), "* %s da' %s ra khoi xe.",GetName(playerid),GetName(id));				   
		ProxDetector(15.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		format(string, sizeof(string), "* Ban da da' %s ra khoi xe!", giveplayer);
		SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "* Ban da bi da' ra khoi xe boi %s !", PName);
		SendClientMessage(id, COLOR_LIGHTBLUE, string);
		
		RemovePlayerFromVehicleEx(id);
	}
	return 1;
}

CMD:tie(playerid, params[]) {
	if(!IsAMember(playerid)) return  SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la thanh vien cua team Mafia.");
	if(PlayerInfo[playerid][pRank] < 2) return SendClientMessage(playerid, -1, "Ban can dat rank 2+ de su dung lenh nay.");
	new id,string[128];
	if(sscanf(params, "u",id)) return SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/tie <playerid/name>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	if(PlayerTied[id] > 0) return SendClientMessage(playerid, -1, "Nguoi choi nay da bi troi.");
	if(!ProxDetectorS(8.0, playerid, id)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o gan nguoi choi do.");
	new car = GetPlayerVehicleID(playerid);
	if(id == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the lam dieu nay voi chinh ban.");
	if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == 2 && IsPlayerInVehicle(id, car)) {
		format(string, sizeof(string), "* Ban da bi troi boi %s.", GetName(playerid));
		SendClientMessage(id, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "* Ban da troi %s.", GetName(id));
		SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "* %s da troi %s.", GetName(playerid) ,GetName(id));
		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		TogglePlayerControllable(id, false);
		PlayerTied[id] = 1;
	}
	else SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong mot xe (va ngoi vi tri tai xe), hoac nguoi do khong o tren xe cua ban.");
	return 1;
}

CMD:untie(playerid, params[]) {
	if(!IsAMember(playerid) && !IsACop(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la Mafia/Cop.");
	if(PlayerInfo[playerid][pRank] < 2 && IsAMember(playerid)) return SendClientMessage(playerid, -1, "Ban khong dat rank 2.");
	new id,string[128];
	if(sscanf(params, "u",id)) return SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/untie <playerid/name>");			
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	if(!ProxDetectorS(8.0, playerid, id)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o gan nguoi choi do.");
	if(id == playerid) return SendClientMessage(playerid, -1, "Ban khong the tu coi troi cho chinh ban!");
	if(PlayerTied[id] == 0) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi khong bi troi.");
	format(string, sizeof(string), "* Ban da duoc coi troi boi %s.", GetName(playerid));
	SendClientMessage(id, COLOR_LIGHTBLUE, string);
	format(string, sizeof(string), "* Ban da coi troi %s.", GetName(id));
	SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
	format(string, sizeof(string), "* %s da coi troi cho %s.", GetName(playerid) ,GetName(id));
	ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	TogglePlayerControllable(id, true);
	PlayerTied[id] = 0;
	return 1;
}
CMD:guns(playerid, params[]) {
	if(PlayerInfo[playerid][pGunLic] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong co giay phep sung. Hay gap mot giao su/giao vien de duoc cap.");
	if(InTraining[playerid] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong o trong phong tap!");
	Dialog_Show(playerid, DIALOG_BUYGUN2, DIALOG_STYLE_LIST, "Training guns", "Deagle\nM4\nAK47\nMicro SMG\nShotgun\nBaseball Bat", "Buy", "Exit");
	return 1;
}
CMD:whisper(playerid, params[]) {
	new id, message[128], string[180];
	if(HidePM[playerid] == 1) return SendClientMessage(playerid, COLOR_LGREEN, "Ban dat tat lenh nay!");
	if(sscanf(params, "us[128]", id, message)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/whisper <playerid/name> <noi dung>");
	if(PlayerInfo[playerid][pMuted] == 1) {
		format(string, 70, "Ban khong the tro chuyen ngay bay gio! Ban bi cam chat. (%d giay)",PlayerInfo[playerid][pMuteTime]);
		SendClientMessage(playerid, COLOR_GREY, string);
		return 1;
	}
	if(PlayerInfo[playerid][pLevel] < 3) return SendClientMessage(playerid, COLOR_LGREEN, "De noi tham, ban can dat it nhat level 3!");
	if(!ProxDetectorS(5.0, playerid, id)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o gan nguoi choi do!");
	if(playerid == id) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong the tu noi voi ban than minh!");
	if(HidePM[id] == 1) return SendClientMessage(playerid, COLOR_LGREEN, "Nguoi choi da tat tinh nang nay!");
	format(string, sizeof(string), "(Whisper LOG) %s(%d) gui den %s(%d): %s", GetName(playerid), playerid, GetName(id), id, message);
	if(PlayerInfo[playerid][pAdmin] < 6) EarsMessage(0xFFC400FF, string);
	format(string, sizeof(string), "(Noi tham) tu %s (%d): %s", GetName(playerid), playerid, message);
	SendClientMessage(id, COLOR_YELLOW, string);
	format(string, sizeof(string), "(Noi tham) gui den %s (%d): %s", GetName(id), id, message);
	SendClientMessage(playerid, COLOR_YELLOW, string);
	PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	PlayerPlaySound(id, 1139, 0.0, 0.0, 0.0);
	return 1;
}		
CMD:tow(playerid, params[]) {
	if(PlayerInfo[playerid][pMember] == 8 || PlayerInfo[playerid][pLeader] == 8) TTCFunction(playerid);
	return 1;
}
CMD:spawnchange(playerid, params[]) return Dialog_Show(playerid, DIALOG_SPAWNCHANGE, DIALOG_STYLE_LIST, "Spawn change", "House\nSpawn mac dinh\nCan ho", "Ok", "Exit");
CMD:punish(playerid, params[]) {
	if(PlayerInfo[playerid][pMember] != 3) return SendClientMessage(playerid, COLOR_GREY, "* Ban khong the su dung lenh nay!");
	new id, time, string[180];
	if(sscanf(params, "ui",id, time)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/punish <playerid/name> <time>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	if(id == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay len chinh minh!");
	if(IsACop(id)) return 1;
	if(OnDuty[playerid] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong onduty!");
	if(time < 1 || time > 300) return SendClientMessage(playerid, COLOR_GREY, "Thoi gian khong hop le! (1-300 giay)");		
	if(PlayerInfo[id][pJailed] == 0) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi nay khong ngoi tu!");
	TogglePlayerControllable(id, false);
	Freezed[id] = 1;		
	FreezeTime[id] = time;
	PlayerInfo[id][pJailTime] += time;
	SpawnPlayer(id);
	format(string, sizeof(string), "Ban da trung phat 5s them %d giay ngoi tu.", GetName(playerid), time);
	SendClientMessage(id, COLOR_LIGHTBLUE, string);
	format(string, sizeof(string), "Ban da bi trung phat boi %s them %d giay ngoi tu.", GetName(id), time);
	SendClientMessage(playerid, COLOR_LIGHTBLUE, string);					
	return 1;
}
CMD:fill(playerid, params[]) {
	new idcar = GetPlayerVehicleID(playerid);
    if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return 1;
	if(GetPVarInt(playerid, "Engine") == 1) return SendClientMessage(playerid,COLOR_GREY,"* Dong co xe dang mo, xin hay tat di.");
	if(Gas[idcar] == 100) return 1;
	if(GetGasStationID(playerid) != -1) {
		TogglePlayerControllable(playerid, false);
		GameTextForPlayer(playerid,"~w~~n~~n~~n~~n~~n~~n~~n~~n~~n~Dang do xang...",RefuelWait,3);
		defer Fillup[RefuelWait](playerid);
		Refueling[playerid] = 1;
	}
	else {
		new veh = GetPlayerVehicleID(playerid);
		if(PlayerInfo[playerid][pGasCan] == 0) return SendClientMessage(playerid, -1, "Ban khong co thung xang.");
		if(PlayerInfo[playerid][pFuel] == 0) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co xang trong thung!");
		if(Gas[veh] > 80) return 1;
		SendClientMessage(playerid, COLOR_MONEY, "* Ban da nap 20%% xang");
		Gas[veh] += 20;
		PlayerInfo[playerid][pFuel] = 0;
		new str[128];
		format(str,sizeof(str),"UPDATE users SET `Fuel`='0' WHERE `ID`='%d'",PlayerInfo[playerid][pSQLID]);
		mysql_query(SQL,str,false);
		TogglePlayerControllable(playerid, true);				
	}
	return 1;
}

CMD:fillgascan(playerid, params[]) {
	if(GetGasStationID(playerid) == -1) return SendClientMessage(playerid,COLOR_GREY,"* Ban khong o tai o mot cay xang.");
	if(PlayerInfo[playerid][pFuel] != 0) return 1;		
	if(PlayerInfo[playerid][pGasCan] == 0) return SendClientMessage(playerid, -1, "Ban khong co thung xang.");
	new price = 20 * 50, string[64];
	format(string, sizeof(string), "* Ban da nap 20%s xang vao thung. Gia: $%s.","%",FormatNumber(price));
	SendClientMessage(playerid, COLOR_MONEY, string);
	PlayerInfo[playerid][pFuel] = 20;
	BizzInfo[GetGasStationID(playerid)][bTill] += price;
	GivePlayerCash(playerid, - price);
	new str[178];
	format(str,sizeof(str),"UPDATE users SET `Money`='%d',`Fuel`='20' WHERE `ID`='%d'",GetPlayerCash(playerid),PlayerInfo[playerid][pSQLID]);
	mysql_query(SQL,str,false);
	format(str,sizeof(str),"UPDATE `bizz` SET `Till`='%d' WHERE `ID`='%d'",BizzInfo[GetGasStationID(playerid)][bTill],GetGasStationID(playerid));
	mysql_query(SQL,str,false);
	return 1;
}
CMD:fare(playerid, params[]) {
	if(PlayerInfo[playerid][pMember] != 12) return 1;
	new string[180], price;
	if(!FactionVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong mot xe thuoc ve to chuc!");
	if(TaxiDuty[playerid] == 1) {
		Fare[playerid] = 0;
		TaxiDuty[playerid] = 0;
		foreach(new i: Player) {
			if(IsPlayerConnected(i) && TaxiDriver[i] == playerid) UpdateTaxiTextdraw(i);
		}
		format(string, sizeof(string), "Bay gio ban khong con lam nhiem vu va ban da nhan duoc $%s, day so tien ban kiem duoc.", FormatNumber(TaxiMoney[playerid]));
		SendClientMessage(playerid, COLOR_WHITE, string);
		GivePlayerCash(playerid, TaxiMoney[playerid]);
		TaxiMoney[playerid] = 0;
		PlayerTextDrawHide(playerid, FareTD);
		return 1;
	}
	if(sscanf(params, "i", price)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/fare <price>");
	if(price < 1 || price > 5000) return SendClientMessage(playerid, -1, "So tien khong hop le! ($1-$5,000)");	
	Fare[playerid] = price;
	TaxiDuty[playerid] = 1;
	TaxiMoney[playerid] = 0;
	UpdateTaxiTextdraw(playerid);
	foreach(new i: Player) {
		if(IsPlayerConnected(i) && IsPlayerLogged[i] == 1) {
			format(string, sizeof(string), "[/dichvu taxi] Taxi Driver %s dang lam viec. Phi: $%s", GetName(playerid), FormatNumber(price));
			SendClientMessage(i, 0x00C700FF, string);
		}
		if(GetPlayerState(i) == PLAYER_STATE_PASSENGER) {
			if(IsPlayerInVehicle(i, GetPlayerVehicleID(playerid))) {
				if(GetPlayerCash(i) < Fare[playerid]) {
					format(string, sizeof(string), "Ban khong co du $%d de vao xe taxi nay.", Fare[playerid]);
    		 		SendClientMessage(playerid, COLOR_GREY, string);
    		 		RemovePlayerFromVehicle(playerid);
				}
				else {
					TaxiDriver[i] = playerid;
					TaxiMoney[i] = 0;
					TaxiTimer[i] = repeat UpdateFare(i);
					UpdateTaxiTextdraw(i);
				}
			}
		}
	}
    return 1;
}
CMD:lights(playerid, params[]) {
	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
		new engine,lights,alarm,doors,bonnet,boot,objective;
		if(GetPVarInt(playerid, "Lights") == 0)
		{
			 GetVehicleParamsEx(GetPlayerVehicleID(playerid),engine,lights,alarm,doors,bonnet,boot,objective);
			 SetVehicleParamsEx(GetPlayerVehicleID(playerid),engine,VEHICLE_PARAMS_ON,alarm,doors,bonnet,boot,objective);
			 SetPVarInt(playerid, "Lights", 1);
		}
		else if(GetPVarInt(playerid, "Lights") == 1)
		{
			 GetVehicleParamsEx(GetPlayerVehicleID(playerid),engine,lights,alarm,doors,bonnet,boot,objective);
			 SetVehicleParamsEx(GetPlayerVehicleID(playerid),engine,VEHICLE_PARAMS_OFF,alarm,doors,bonnet,boot,objective);
			 SetPVarInt(playerid, "Lights", 0);
		}
	}
	return 1;
}

CMD:engine(playerid, params[]) {
    if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return 1;
    if(DeelayCommand[playerid][0] > 0) return DeelayTime(playerid, 0); //delay khong lam dung
	new idcar = GetPlayerVehicleID(playerid),string[128];
	new engine,lights,alarm,doors,bonnet,boot,objective;		
	if(Gas[idcar] == 0) return SendClientMessage(playerid,-1, "Chiec xe nay da het xang.");
	if(IsABike(idcar)) return SendClientMessage(playerid,COLOR_WHITE,"Ban khong the su dung lenh nay tren xe dap.");
	if(FindSpawnID(idcar) != 0) {
		if(CarInfo[FindSpawnID(idcar)][cPoints] == 0) return SendClientMessage(playerid, COLOR_GREY, "Chiec xe nay chua duoc thanh toan tien bao hiem!");
	}
	DeelayCommand[playerid][0] = 5;
	new vehicle = GetVehicleModel(idcar) - 400;
	if(Refueling[playerid] != 0) return SendClientMessage(playerid,COLOR_WHITE,"Xe dang duoc do day xang, xin hay cho doi.");
	if(vehEngine[idcar] == 0) {
		vehEngine[idcar] = 1;
		GetVehicleParamsEx(idcar,engine,lights,alarm,doors,bonnet,boot,objective);
		SetVehicleParamsEx(idcar,VEHICLE_PARAMS_ON,lights,alarm,doors,bonnet,boot,objective);
		SetPVarInt(playerid, "Engine", 1);
		if(GetPVarInt(playerid, "Undercover") == 1) format(string, 100, "*Mot ke la mat van chia khoa mot vong khoi dong xe %s.",aVehicleNames[vehicle]);
		else format(string, 100, "* %s van chia khoa mot vong khoi dong xe %s.",GetName(playerid),aVehicleNames[vehicle]);				   
		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	}
	else if(vehEngine[idcar] == 1) {
		vehEngine[idcar] = 0;
		GetVehicleParamsEx(idcar,engine,lights,alarm,doors,bonnet,boot,objective);
		SetVehicleParamsEx(idcar,VEHICLE_PARAMS_OFF,lights,alarm,doors,bonnet,boot,objective);
		SetPVarInt(playerid, "Engine", 0);
		if(GetPVarInt(playerid, "Undercover") == 1) format(string, sizeof(string), "* Mot ke la mat xoay nguoc chia khoa va rut ra khoi xe %s.",aVehicleNames[vehicle]);
		else format(string, sizeof(string), "* %s xoay nguoc chia khoa va rut ra khoi xe %s.",GetName(playerid),aVehicleNames[vehicle]);				   
		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	}
	return 1;
}

CMD:disarm(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;
	new id,string[128];
	if(sscanf(params, "u",id)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/disarm <playerid/name>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	ResetWeapons(id);
	format(string, sizeof(string), "[{B81616}AdmWarning{FFFFFF}]: %s tich thu vu khi cua %s.",GetName(playerid), GetName(id));
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(-1, string, 1);
	return 1;
}

CMD:suspend(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;
	new id,item[20],string[180], hours, query[256], reason[64];
	if(sscanf(params, "us[10]is[64]",id,item,hours,reason)) {
		SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/suspend <playerid/name> <license> <hours> <ly do>");
		SendClientMessage(playerid, COLOR_WHITE, "Driving, Sailing, Fly, Gun.");
		return 1;
	}
	if(id == playerid && PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay len chinh minh!");
	if(hours < 0 || hours > 100) return SendClientMessage(playerid, COLOR_GREY, "Gio khong hop le! (0-100)");
	if(PlayerInfo[id][pAdmin] != 0 && PlayerInfo[playerid][pAdmin] < 5) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay len admin!");
	if(strcmp(item,"driving",true) == 0) {
		PlayerInfo[id][pCarLicS] = hours;
		PlayerInfo[id][pCarLic] = 0;
		PlayerInfo[id][pCarLicT] = 0;
		format(string, sizeof(string), "AdmCmd: %s da tich thu giay phep lai xe cua %s trong %d gio, Li do: %s", GetName(playerid), GetName(id), hours, reason);
		SCMTA(COLOR_LIGHTRED, string);	
		format(string, sizeof(string), "Admin %s tich thu giay phep lai xe cua ban trong %d gio.", GetName(playerid), hours);
		SendClientMessage(id, COLOR_WARNING, string);
		format(query, sizeof(query), "UPDATE `users` SET `CarLic`='0', `CarLicT`='0', `CarLicS`='%d' WHERE `ID`='%d'", hours, PlayerInfo[id][pSQLID]);
		mysql_query(SQL, query, false);		
	}
	else if(strcmp(item,"sailing",true) == 0) {
		PlayerInfo[id][pBoatLicS] = hours;
		PlayerInfo[id][pBoatLic] = 0;
		PlayerInfo[id][pBoatLicT] = 0;
		format(string, sizeof(string), "AdmCmd: %s da tich thu giay phep thuyen cua %s trong %d gio, Li do: %s", GetName(playerid), GetName(id), hours, reason);
		SCMTA(COLOR_LIGHTRED, string);			
		format(string, sizeof(string), "Admin %s tich thu giay phep de thuyen cua ban trong %d gio.", GetName(playerid), hours);
		SendClientMessage(id, COLOR_WARNING, string);
		format(query, sizeof(query), "UPDATE `users` SET `BoatLic`='0', `BoatLicT`='0', `BoatLicS`='%d' WHERE `ID`='%d'", hours, PlayerInfo[id][pSQLID]);
		mysql_query(SQL, query, false);		
	}	
	else if(strcmp(item,"fly",true) == 0) {
		PlayerInfo[id][pFlyLicS] = hours;
		PlayerInfo[id][pFlyLic] = 0;
		PlayerInfo[id][pFlyLicT] = 0;
		format(string, sizeof(string), "AdmCmd: %s da tich thu giay phep de may bay cua %s trong %d gio, Li do: %s", GetName(playerid), GetName(id), hours, reason);
		SCMTA(COLOR_LIGHTRED, string);			
		format(string, sizeof(string), "Admin %s tich thu giay phep de may bay cua ban trong %d gio.", GetName(playerid), hours);
		SendClientMessage(id, COLOR_WARNING, string);
		format(query, sizeof(query), "UPDATE `users` SET `FlyLic`='0', `FlyLicT`='0', `FlyLicS`='%d' WHERE `ID`='%d'", hours, PlayerInfo[id][pSQLID]);
		mysql_query(SQL, query, false);		
	}	
	else if(strcmp(item,"gun",true) == 0) {
		PlayerInfo[id][pGunLicS] = hours;
		PlayerInfo[id][pGunLic] = 0;
		PlayerInfo[id][pGunLicT] = 0;
		ResetPlayerWeapons(id);
		format(string, sizeof(string), "Admin %s da tich thu giay phep sung cua %s trong %d gio.", GetName(playerid), GetName(id), hours);
		SendAdminMessage(COLOR_LIGHTRED, string, 1); 		
		format(string, sizeof(string), "Admin %s tich thu giay phep sung cua ban trong %d gio.", GetName(playerid), hours);
		SendClientMessage(id, COLOR_WARNING, string);
		format(query, sizeof(query), "UPDATE `users` SET `GunLic`='0', `GunLicT`='0', `GunLicS`='%d' WHERE `ID`='%d'", hours, PlayerInfo[id][pSQLID]);
		mysql_query(SQL, query, false);		
	}		
	else return SendClientMessage(playerid, COLOR_WHITE, "Driving, Sailing, Fly, Gun.");
	return 1;
}

CMD:suspendo(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;
	new id[32],item[20],string[180], hours, query[140], reason[64];
	if(sscanf(params, "s[32]s[10]is[64]",id,item,hours,reason)) {
		SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/suspendo <name> <license> <hours> <ly do>");
		SendClientMessage(playerid, COLOR_WHITE, "Driving, Sailing, Fly, Gun.");
		return 1;
	}
	new userID = GetPlayerID(id);
	if(userID != INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do da dang nhap!");
	new cont = MySQLCheckAccount(id);
	if(cont == 0) return SendClientMessage(playerid,COLOR_LGREEN, "ERROR: Khong the tim thay tai khoan nay trong co so du lieu!");
	if(hours < 0 || hours > 100) return SendClientMessage(playerid, COLOR_GREY, "Gio khong hop le! (0-100)");
	if(strcmp(item,"driving",true) == 0) {
		format(string, sizeof(string), "AdmCmd: %s da tich thu giay phep lai xe cua %s (offline) trong %d gio, Li do: %s", GetName(playerid), id, hours, reason);
		SCMTA(COLOR_LIGHTRED, string);	
		format(query, sizeof(query), "UPDATE `users` SET `CarLic`='0', `CarLicT`='0', `CarLicS`='%d' WHERE `name`='%s'", hours, id);
		mysql_query(SQL, query, false);		
	}
	else if(strcmp(item,"sailing",true) == 0) {
		format(string, sizeof(string), "AdmCmd: %s da tich thu %s (offline) giay phep dieu huong trong %d gio, Li do: %s", GetName(playerid), id, hours, reason);
		SCMTA(COLOR_LIGHTRED, string);			
		format(query, sizeof(query), "UPDATE `users` SET `BoatLic`='0', `BoatLicT`='0', `BoatLicS`='%d' WHERE `name`='%s'", hours, id);
		mysql_query(SQL, query, false);		
	}	
	else if(strcmp(item,"fly",true) == 0) {
		format(string, sizeof(string), "AdmCmd: %s da tich thu giay phep bay cua %s (offline) trong %d gio, Li do: %s", GetName(playerid), id, hours, reason);
		SCMTA(COLOR_LIGHTRED, string);			
		format(query, sizeof(query), "UPDATE `users` SET `FlyLic`='0', `FlyLicT`='0', `FlyLicS`='%d' WHERE `name`='%s'", hours, id);
		mysql_query(SQL, query, false);		
	}	
	else if(strcmp(item,"gun",true) == 0) {
		format(string, sizeof(string), "AdmCmd: %s da tich thu giay phep sung cua %s (offline) trong %d gio.", GetName(playerid), id, hours);
		SendAdminMessage(COLOR_LIGHTRED, string, 1); 		
		format(query, sizeof(query), "UPDATE `users` SET `GunLic`='0', `GunLicT`='0', `GunLicS`='%d' WHERE `name`='%s'", hours, id);
		mysql_query(SQL, query, false);		
	}		
	else return SendClientMessage(playerid, COLOR_WHITE, "Driving, Sailing, Fly, Gun.");
	return 1;
}
CMD:pay(playerid, params[]) {
	if(PlayerInfo[playerid][pLevel] < 5) return SendClientMessage(playerid, -1, "Ban can dat level 5 de pay tien.");
	if(DeelayCommand[playerid][7] > 0) return DeelayTime(playerid, 7);
	new id,moneys,sendername[25],giveplayer[25],string[180];
	if(sscanf(params, "ui",id,moneys)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/pay <playerid/name> <So tien>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	if(moneys > 1000 && PlayerInfo[playerid][pLevel] < 3) return SendClientMessage(playerid, -1, "Ban can dat level 3 de dua so tien hon $1000.");
	if(moneys < 1 || moneys > 100000) return SendClientMessage(playerid, -1, "Ban chi co the dua ra mot so tien giua 1$ va 100,000$.");
	if(id == playerid) return SendClientMessage(playerid,-1, "Ban khong the give tien cho chinh ban.");
	if(!ProxDetectorS(5.0, playerid, id)) return SendClientMessage(playerid, -1, "Nguoi choi do khong o gan ban.");
	if(Spectate[id] != 255) return SendClientMessage(playerid,-1, "Nguoi choi do khong o gan ban.");
	GetPlayerName(id, giveplayer, sizeof(giveplayer));
	GetPlayerName(playerid, sendername, sizeof(sendername));
	new playermoney;
	playermoney = GetPlayerCash(playerid);
	if(moneys > 0 && playermoney >= moneys) {
		if(TradeID[playerid] != -1) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the su dung lenh nay khi ban dang trong mot cuoc giao dich!");
		GivePlayerCash(playerid, -moneys);
		GivePlayerCash(id, moneys);
		PlayerPlaySound(id, 1052, 0.0, 0.0, 0.0);
		
		format(string, sizeof(string), "* %s moc $%s tu bop tien ra va dua no cho %s.", GetName(playerid), FormatNumber(moneys), GetName(id));
		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		format(string, sizeof(string), "Ban da gui den %s so tien $%s.", giveplayer, FormatNumber(moneys));
		SendClientMessage(playerid, COLOR_WHITE, string);
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
		format(string, sizeof(string), "Ban da nhan duoc $%s tu %s.", FormatNumber(moneys), GetName(playerid));
		SendClientMessage(id, COLOR_WHITE, string);
		DeelayCommand[playerid][7] = 30;
		Update(id, pCashx);
		Update(playerid, pCashx);
	}
	return 1;
}

CMD:number(playerid, params[]) {
	new id,string[55];
	if(sscanf(params, "u",id)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/number <playerid/name>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	
	if(PlayerInfo[id][pPhone] != 0) format(string, sizeof(string), "So dien thoai cua %s: %d",GetName(id),PlayerInfo[id][pPhone]);
	else format(string, sizeof(string), "So dien thoai cua %s: Khong",GetName(id),PlayerInfo[id][pPhone]);
	SendClientMessage(playerid, COLOR_WHITE, string);
	return 1;
}

CMD:changepass(playerid, params[]) {
	if(strlen(PlayerInfo[playerid][pPin]) != 0 && PlayerInfo[playerid][pPinLogged] == 0) {
	 SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay vi ban chua dang nhap PIN.");
	 SendClientMessage(playerid, COLOR_GREY, "De xac thuc, su dung '/loginpin'!");
	 return 1;
	}	
	Dialog_Show(playerid, DIALOG_NEWPASS,DIALOG_STYLE_INPUT, "Change password","Nhap mat khau hien tai cua ban.","Ok","Close");
	return 1;
}

CMD:ad(playerid, params[]) {
	if(AdTimer[playerid] != Timer:0) return SendClientMessage(playerid, COLOR_LGREEN, "Ban vua dat mot quang cao gan day. Su dung lenh /myad de xem.");
	new string[264],sendername[25],idx;
	if(PlayerInfo[playerid][pMuted] == 1) {
		format(string, 70, "Ban khong the tro chuyen ngay bay gio! Ban bi cam chat. (%d giay)",PlayerInfo[playerid][pMuteTime]);
		SendClientMessage(playerid, COLOR_GREY, string);
		return 1;
	}
	if(PlayerInfo[playerid][pLevel] < 5) return SendClientMessage(playerid, COLOR_GREY, "Ban can dat Level 5 de dat mot quang cao!");
	GetPlayerName(playerid, sendername, sizeof(sendername));
	new length = strlen(params);
	while ((idx < length) && (params[idx] <= ' ')) idx++;
	new offset = idx, result[264];
	while ((idx < length) && ((idx - offset) < (sizeof(result) - 1))) {
		result[idx - offset] = params[idx];
		idx++;
	}
	result[idx - offset] = EOS;
	new totalads = TotalAds()+1;
    new bizzID;
	foreach(new i : Bizs){
		if(IsPlayerInRangeOfPoint(playerid, 5.0, BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ]))
		{
			bizzID = i;
		}
	}
	if(BizzInfo[bizzID][bType] == 15){
		if(!strlen(result)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/ad <noi dung>");
		if(FaceReclama(result)) return Reclama(playerid, result);
		new payout = 500 * (idx*2);
		if(payout < 0) payout = 50000;
		if(GetPlayerCash(playerid) < payout) {
			format(string, sizeof(string), "* Ban vua dat mot quang cao voi %d ky tu, chi phi $%s, ban khong co du tien", offset, FormatNumber(payout));
			SendClientMessage(playerid, COLOR_WHITE, string);
			return 1;
		}
		GivePlayerCash(playerid, - payout);
		format(string, sizeof(string), "~r~Ban da thanh toan $%d~n~~w~Quang cao chua: %d ky tu", payout, idx);
		GameTextForPlayer(playerid, string, 5000, 5);
		format(AdText[playerid], 256, result);

		format(string, sizeof(string), "Quang cao boi %s ({FFFFFF}%d{00D900}): %s [/deletead %d de xoa]", GetName(playerid), playerid, result, playerid);
		SendStaffMessage(0x00D900FF, string);

		AdTimer[playerid] = defer Advertisment[totalads*60000](playerid);
		format(string, sizeof(string), "Quang cao cua ban se duoc hien thi sau %d phut (%d giay).", totalads, totalads*60);

		SendClientMessage(playerid, -1, string);
		BizzInfo[bizzID][bTill] += payout;
		
		new str[128];
		format(str,128,"UPDATE bizz SET `Till`='%d' WHERE `ID`='%d'",BizzInfo[bizzID][bTill],bizzID);
		mysql_query(SQL,str,false);
	} else SendClientMessage(playerid, -1, "Ban khong o tai CNN.");
	return 1;
}
CMD:b(playerid, params[]) {
	new string[144];
	if(DeelayCommand[playerid][2] > 0) return DeelayTime(playerid, 2);
	if(PlayerInfo[playerid][pMuted] == 1) {
		format(string, sizeof(string), "Ban dang bi chan chat. (%d giay)",PlayerInfo[playerid][pMuteTime]);
		SendClientMessage(playerid, COLOR_GREY, string);
		return 1;
	}
    if(sscanf(params, "s[144]", params)) return SendClientMessage(playerid, COLOR_RED, "/b [local ooc chat]");
  	params[0] = toupper(params[0]);
  	if(FaceReclama(params)) return Reclama(playerid, params);
    format(string, sizeof(string), "{%s}%s {FFFFFF}noi: (( %s ))", PlayerInfo[playerid][pVip] > 0 ? ("FFD700") : ("FFFFFF"), GetName(playerid), params);
    ProxDetector(30.0, playerid, string,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_FADE1,COLOR_FADE2);
    DeelayCommand[playerid][2] = 2;
    return 1;
}
CMD:as(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;
	new string[250],result[250];
	if(PlayerInfo[playerid][pMuted] == 1) {
		format(string, 70, "Ban khong the tro chuyen ngay bay gio! Ban bi cam chat. (%d giay)",PlayerInfo[playerid][pMuteTime]);
		SendClientMessage(playerid, COLOR_GREY, string);
		return 1;
	}
	if(sscanf(params, "s[250]",result)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/as(hout) <noi dung>");
	if(FaceReclama(result)) return Reclama(playerid, result);
	result[0] = toupper(result[0]);
	format(string, sizeof(string), "(( Admin %s het len: %s ))", GetName(playerid), result);
	ProxDetector(200.0, playerid, string,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
	return 1;
}

CMD:s(playerid, params[]) {
	if(DeelayCommand[playerid][2] > 0) return DeelayTime(playerid, 2);
	new string[250],result[250];
	if(PlayerInfo[playerid][pMuted] == 1) {
		format(string, 70, "Ban khong the tro chuyen ngay bay gio! Ban bi cam chat. (%d giay)",PlayerInfo[playerid][pMuteTime]);
		SendClientMessage(playerid, COLOR_GREY, string);
		return 1;
	}
	if(sscanf(params, "s[250]",result)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/s(hout) <noi dung>");
	if(FaceReclama(result)) return Reclama(playerid, result);
	result[0] = toupper(result[0]);
	format(string, sizeof(string), "%s het len: %s", GetName(playerid), result);
	ProxDetector(30.0, playerid, string,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_FADE1,COLOR_FADE2);
	DeelayCommand[playerid][2] = 2;
	return 1;
}
CMD:huythuephong(playerid, params[]) {
	if(!PlayerInfo[playerid][pRentedApartment]) return SendClientMessage(playerid, -1, "Ban khong thue mot can ho!");
	PlayerInfo[playerid][pRentedApartment] = 0;
	UpdateVar(playerid, "ReAp", 0);
	SendClientMessage(playerid, -1, "Huy thue can ho thanh cong");
	return 1;
}
CMD:unrentroom(playerid, params[]) {
	if(PlayerInfo[playerid][pHouse] != 999 && strcmp(GetName(playerid), HouseInfo[PlayerInfo[playerid][pHouse]][hOwner], true) == 0) return SendClientMessage(playerid, COLOR_WHITE, "Ban co mot ngoi nha.");
	if(PlayerInfo[playerid][pRented] == -1) return SendClientMessage(playerid, COLOR_GREY, "Ban khong thue mot phong.");
	PlayerInfo[playerid][pHouse] = 999;
	PlayerInfo[playerid][pRented] = -1;
	SendClientMessage(playerid, COLOR_WHITE, "Ban khong con thue phong nua.");
	Update(playerid,pCashx);
	Update(playerid,pHousex);
	Update(playerid,pRentedx);
	return 1;
}

CMD:time(playerid, params[]) {
	new sendername[25],string[80];
	format(string, sizeof(string), "Ban da dang nhap trong %.0f giay.", PlayerInfo[playerid][pSeconds]);
 	SendClientMessage(playerid,COLOR_WHITE,string);
	GetPlayerName(playerid, sendername, sizeof(sendername));
	format(string, sizeof(string), "* %s gio tay len cao va nhin cham cham vao dong ho.", sendername);
	ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	ApplyAnimation(playerid,"COP_AMBIENT","Coplook_watch",4.1,0,0,0,0,0);
	return 1;
}
CMD:open(playerid, params[]) return SendClientMessage(playerid, COLOR_LGREEN, "Lenh nay da duoc chuyen sang he thong /bizzmenu cung nhu /housemenu!");
CMD:usedrugs(playerid, params[]) {
	new str[100];
	format(str, sizeof(str), "Loai\tSo luong\n");
	format(str, sizeof(str), "%sIndica\t%d grams\nSativa\t%d grams", str, PlayerInfo[playerid][pMatuy1], PlayerInfo[playerid][pMatuy2]);
	Dialog_Show(playerid, DIALOG_USEDRUGS, DIALOG_STYLE_TABLIST_HEADERS, "Ma tuy", str, "Su dung", "Thoat");
	return 1;
}
CMD:bizstatus(playerid, params[]) return SendClientMessage(playerid, COLOR_LGREEN, "Lenh nay da duoc chuyen sang /bizmenu!");
CMD:buylevel(playerid, params[]) {
	new nxtlevel = PlayerInfo[playerid][pLevel], costlevel, expamount,string[128];
	expamount = nxtlevel*levelexp;
	costlevel = nxtlevel*levelcost;
	if(GetPlayerCash(playerid) < costlevel) return SendClientMessage(playerid,COLOR_GRAD1,"Ban khong co du tien.");
	if(PlayerInfo[playerid][pExp] < expamount) return SendClientMessage(playerid,COLOR_GRAD1,"Ban khong co du diem kinh nghiem.");
	GivePlayerCash(playerid, -costlevel);
	PlayerInfo[playerid][pLevel]++;
	PlayerInfo[playerid][pExp] -= expamount;
	format(string, 40, "Xin chuc mung! Ban da len Level %d.",PlayerInfo[playerid][pLevel]);
	SendClientMessage(playerid,COLOR_LIGHTBLUE,string);
	format(string, 50, "%s vua len level %d.", GetName(playerid), PlayerInfo[playerid][pLevel]);
	//InsertLog(playerid, string, LOG_LEVEL);				
		
	new rand = 1+random(9);
	if(rand != 0) {
		format(string, 43, "Ban da nhan duoc %d "#DIEMCAOCAP" (bonus).",rand);
		SendClientMessage(playerid,COLOR_MONEY,string);
	}
	PlayerInfo[playerid][pPremiumPoints] += rand;
	Update(playerid, pPremiumPointsx);

	new total = PlayerInfo[playerid][pExp];

	PlayerInfo[playerid][pExp] = total > 0 ? total : 0;
	
	// if(PlayerInfo[playerid][pReferral] != 0) {
	// 	new type, money, rp;			
	// 	if(PlayerInfo[playerid][pLevel] <= 3)  money = 5000*PlayerInfo[playerid][pLevel];
	// 	else if(PlayerInfo[playerid][pLevel] > 3 && PlayerInfo[playerid][pLevel] < 10)  money = 10000*PlayerInfo[playerid][pLevel], rp = PlayerInfo[playerid][pLevel]/2-1;
	// 	else money = 10000*PlayerInfo[playerid][pLevel], rp = PlayerInfo[playerid][pLevel]/2+2;
					
	// 	PlayerInfo[playerid][pReferralRP] += rp;
	// 	PlayerInfo[playerid][pReferralMoney] += money;
	// 	UpdateVar(playerid, "ReferralRP", PlayerInfo[playerid][pReferralRP]);
	// 	UpdateVar(playerid, "ReferralMoney", PlayerInfo[playerid][pReferralMoney]);
	
	// 	foreach(new i: Player) {
	// 		if(IsPlayerConnected(i) && PlayerInfo[i][pSQLID] == PlayerInfo[playerid][pReferral]) {
	// 			type = 1;
	// 			if(money != 0 && rp != 0) format(string, sizeof(string), "Ban da nhan duoc $%s va %d diem kinh nghiem tu %s(%d) vi ho da dat level %d.", FormatNumber(money), rp, GetName(playerid), playerid, PlayerInfo[playerid][pLevel]);
	// 			else format(string, sizeof(string), "Ban da nhan duoc $%s tu %s(%d) vi ho da dat level %d.", FormatNumber(money), GetName(playerid), playerid, PlayerInfo[playerid][pLevel]);
	// 			SendClientMessage(i, COLOR_MONEY, string);
	// 			PlayerInfo[i][pExp] += rp;	
	// 			PlayerInfo[i][pAccount] += money;				
	// 		}
	// 	}
		
	// 	if(type == 0) {
	// 		new szQuery[43], name[64];
	// 		format(szQuery, 43, "SELECT * FROM `users` WHERE `id`='%d'", PlayerInfo[playerid][pReferral]);
	// 		new Cache: result = mysql_query(SQL, szQuery);
	// 		if(cache_num_rows()){
	// 			cache_get_value_name(0, "name", name);				
	// 		}

	// 		cache_delete(result);

	// 		if(money != 0 && rp != 0) format(string, sizeof(string), "Ban da nhan duoc $%s va %d diem kinh nghiem tu %s vi ho da dat level %d.", FormatNumber(money), rp, GetName(playerid), PlayerInfo[playerid][pLevel]);
	// 		else format(string, sizeof(string), "Ban da nhan duoc $%s tu %s vi ho da dat level %d.", FormatNumber(money), GetName(playerid), PlayerInfo[playerid][pLevel]);				
	// 		InsertEmail(name, "AdmBot", string, 0);
	// 	}
	// 	new query[256];
	// 	if(money != 0 && rp != 0) format(query, sizeof(query), "UPDATE `users` SET `Bank`=`Bank`+'%d', `Respect`=`Respect`+'%d' WHERE `id`='%d'", money, rp, PlayerInfo[playerid][pReferral]);
	// 	else format(query, sizeof(query), "UPDATE `users` SET `Bank`=`Bank`+'%d' WHERE `id`='%d'", money, PlayerInfo[playerid][pReferral]);
	// 	mysql_query(SQL, query, false);
	// }
    //---------------------------------------------------------------------------------------------

	Update(playerid,pCashx);
	Update(playerid,pRP);
	Update(playerid,pLevelx);
	SetPlayerScore(playerid, PlayerInfo[playerid][pLevel]);
	UpdateProgress(playerid, 0);
	return 1;
}

CMD:myreferrals(playerid, params[]) {
	new szDialog[1200], szDialog2[256], szQuery[86], name[64], r, on;
	
	format(szQuery, sizeof(szQuery), "SELECT * FROM `users` WHERE `Referral`='%d' ORDER BY `users`.`Level` DESC LIMIT 20", PlayerInfo[playerid][pSQLID]);
	new Cache: result = mysql_query(SQL, szQuery);
	strcat(szDialog, "{FFB469}(+) Thong tin{FFFFFF}\n");
	for(new i, x = cache_num_rows (); i < x; i++) {
		cache_get_value_name(i, "name", name);

		new userID = GetPlayerID( name );
		if(userID != INVALID_PLAYER_ID) format(szDialog2, sizeof(szDialog2), "{1FA612}(Online){FFFFFF} %s (%d)\n", name, userID), on++;
		else format(szDialog2, sizeof(szDialog2), "{D60909}(Offline){FFFFFF} %s\n", name);
		strcat(szDialog, szDialog2);
		format(Selected[playerid][r], MAX_PLAYER_NAME, name);	
		r++;
	}	
	cache_delete(result);
	new title[64];
	format(title, sizeof(title), "Danh sach gioi thieu cua toi (%d/%d)", on, r);
	Dialog_Show(playerid, DIALOG_REFERRALS, DIALOG_STYLE_LIST, title, szDialog, "Ok", "Exit");
	return 1;
}
CMD:editclan(playerid, params[]) {
	new
		szName[180],
		message[180],
		string[180],
		szQuery[256],
		clanid, code;

	if(PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, COLOR_WHITE, "You are not authorized to use this command.");
	if(sscanf(params, "iis[128]", clanid, code, message)) {
		SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/editclan <clanid> <code> <result>");
		SendClientMessage(playerid, COLOR_GREY, "Co san: Name(0), Owner(1), Tag(2), Rank 1(4), Rank 2(5), Rank 3(6), [...]");
		SendClientMessage(playerid, COLOR_GREY, "Rank 4(7), Rank 5(8), Rank 6(9), Slots(11), Register Date(12), Days(13).");
		return 1;
	}
	switch(code) {
		case 0: {
			format(string, sizeof(string), "Ban da sua doi ten clan ID %d tro thanh %s.", clanid, message);
			format(ClanInfo[clanid][clName], 256, message);
			format(szQuery, sizeof(szQuery), "UPDATE `clans` SET `Name`='%s' WHERE `ID`='%d'", ClanInfo[clanid][clName], clanid);
			mysql_query(SQL, szQuery, false);
		}
		case 1: {
			format(string, sizeof(string), "Ban da thay doi chu so huu clan ID %d tro thanh %s.", clanid, message);
			format(ClanInfo[clanid][clOwner], 256, message);
			format(szQuery, sizeof(szQuery), "UPDATE `clans` SET `Owner`='%s' WHERE `ID`='%d'", ClanInfo[clanid][clOwner], clanid);
			mysql_query(SQL, szQuery, false);
		}
		case 2: {
			format(string, sizeof(string), "Ban da thay doi clan tag clan ID %d tro thanh %s.", clanid, message);
			format(ClanInfo[clanid][clTag], 32, message);
			format(szQuery, sizeof(szQuery), "UPDATE `clans` SET `Tag`='%s' WHERE `ID`='%d'", ClanInfo[clanid][clTag], clanid);
			mysql_query(SQL, szQuery, false);
			foreach(new i: Player) {
				if(IsPlayerConnected(i) && IsPlayerLogged[i] == 1) {
					if(PlayerInfo[i][pClan] == clanid && PlayerInfo[playerid][pTag] == 0) {
						format(szName, sizeof(szName), "%s%s", ClanInfo[clanid][clTag], PlayerInfo[i][pUsername]);
						SetPlayerName(i, szName);
					}
					else if(PlayerInfo[i][pClan] == clanid && PlayerInfo[playerid][pTag] == 1) {
						format(szName, sizeof(szName), "%s%s", PlayerInfo[i][pUsername], ClanInfo[clanid][clTag]);
						SetPlayerName(i, szName);
					}
				}
			}
			new tagname[180];
			for(new i = 0; i < MAX_CLANZONES; i++)
			{
				if(GraffitiInfo[i][gfOwned] == PlayerInfo[playerid][pClan]) {
					DestroyDynamicObject(GraffitiInfo[i][gfObject]);
					GraffitiInfo[i][gfObject] = CreateDynamicObject(19353, GraffitiInfo[i][gfX], GraffitiInfo[i][gfY], GraffitiInfo[i][gfZ], 0.0, 0.0, GraffitiInfo[i][gfRot]);
					format(tagname, sizeof(tagname), "{%s}%s\n%s", ClanInfo[GraffitiInfo[i][gfOwned]][clColor], ClanInfo[GraffitiInfo[i][gfOwned]][clName], ClanInfo[GraffitiInfo[i][gfOwned]][clTag]);
					SetDynamicObjectMaterialText(GraffitiInfo[i][gfObject], 0, tagname, OBJECT_MATERIAL_SIZE_512x256, "BankGothic Md BT", 60, 1, 0xfff0f0f0, 0, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
				}
			}
		}
		case 4: {
			format(string, sizeof(string), "Ban da chinh sua Rank Name cua Clan ID %d tro thanh %s.", clanid, message);
			format(ClanInfo[clanid][clRankName1], 30, message);
			format(szQuery, sizeof(szQuery), "UPDATE `clans` SET `RankName1`='%s' WHERE `ID`='%d'", ClanInfo[clanid][clRankName1], clanid);
			mysql_query(SQL, szQuery, false);
		}
		case 5: {
			format(string, sizeof(string), "Ban da chinh sua Rank Name 2 cua Clan ID %d tro thanh %s.", clanid, message);
			format(ClanInfo[clanid][clRankName2], 30, message);
			format(szQuery, sizeof(szQuery), "UPDATE `clans` SET `RankName2`='%s' WHERE `ID`='%d'", ClanInfo[clanid][clRankName2], clanid);
			mysql_query(SQL, szQuery, false);
		}
		case 6: {
			format(string, sizeof(string), "Ban da chinh sua Rank Name 3 cua Clan ID %d tro thanh %s.", clanid, message);
			format(ClanInfo[clanid][clRankName3], 30, message);
			format(szQuery, sizeof(szQuery), "UPDATE `clans` SET `RankName3`='%s' WHERE `ID`='%d'", ClanInfo[clanid][clRankName3], clanid);
			mysql_query(SQL, szQuery, false);
		}
		case 7: {
			format(string, sizeof(string), "Ban da chinh sua Rank Name 4 cua Clan ID %d tro thanh %s.", clanid, message);
			format(ClanInfo[clanid][clRankName4], 30, message);
			format(szQuery, sizeof(szQuery), "UPDATE `clans` SET `RankName4`='%s' WHERE `ID`='%d'", ClanInfo[clanid][clRankName4], clanid);
			mysql_query(SQL, szQuery, false);
		}
		case 8: {
			format(string, sizeof(string), "Ban da chinh sua Rank Name 5 cua Clan ID %d tro thanh %s.", clanid, message);
			format(ClanInfo[clanid][clRankName5], 30, message);
			format(szQuery, sizeof(szQuery), "UPDATE `clans` SET `RankName5`='%s' WHERE `ID`='%d'", ClanInfo[clanid][clRankName5], clanid);
			mysql_query(SQL, szQuery, false);
		}
		case 9: {
			format(string, sizeof(string), "Ban da chinh sua Rank Name 6 cua Clan ID %d tro thanh %s.", clanid, message);
			format(ClanInfo[clanid][clRankName6], 30, message);
			format(szQuery, sizeof(szQuery), "UPDATE `clans` SET `RankName6`='%s' WHERE `ID`='%d'", ClanInfo[clanid][clRankName6], clanid);
			mysql_query(SQL, szQuery, false);
		}
		case 10: {
			if(strval(message) < 5) return SendClientMessage(playerid, COLOR_GREY, "Clan slots khong hop le.");
			format(string, sizeof(string), "Ban da chinh sua thanh cong slot cua Clan ID %d tro thanh %d.", clanid, strval(message));
			ClanInfo[clanid][clSlots] = strval(message);
			format(szQuery, sizeof(szQuery), "UPDATE `clans` SET `Slots`='%d' WHERE `ID`='%d'", ClanInfo[clanid][clSlots], clanid);
			mysql_query(SQL, szQuery, false);
		}
		case 11: {
			format(string, sizeof(string), "Ban da chinh sua thanh cong ngay dang ky cua Clan ID %d tro thanh %s.", clanid, message);
			format(ClanInfo[clanid][clRegisterDate], 22, message);
			format(szQuery, sizeof(szQuery), "UPDATE `clans` SET `RegisterDate`='%d' WHERE `ID`='%d'", ClanInfo[clanid][clRegisterDate], clanid);
			mysql_query(SQL, szQuery, false);
		}
		case 12: {
			if(strval(message) < 5) return SendClientMessage(playerid, COLOR_GREY, "Clan slots khong hop le.");
			format(string, sizeof(string), "Ban da chinh sua thanh cong ngay cua Clan ID %d tro thanh %d.", clanid, strval(message));
			ClanInfo[clanid][clDays] = strval(message);
			format(szQuery, sizeof(szQuery), "UPDATE `clans` SET `Days`='%d' WHERE `ID`='%d'", ClanInfo[clanid][clDays], clanid);
			mysql_query(SQL, szQuery, false);
		}		
		default: SendClientMessage(playerid, COLOR_GREY, "Code id khong hop le.");
	}
	SendClientMessage(playerid, COLOR_YELLOW, string);
	return 1;
}
CMD:refill(playerid, params[]) {
	if(PlayerInfo[playerid][pMember] != 8) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la tho co khi!");
	new id,money,string[180];
	if(DeelayCommand[playerid][6] > 0) return DeelayTime(playerid, 6);
	if(sscanf(params, "ui",id,money)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/refill <playerid/name> <Price>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	new engine,lights,alarm,doors,bonnet,boot,objective;
	GetVehicleParamsEx(GetPlayerVehicleID(id),engine,lights,alarm,doors,bonnet,boot,objective);
	if(engine == VEHICLE_PARAMS_ON) return SendClientMessage(playerid, -1, "Nguoi choi do chua tat dong co xe!");
	if(money < 1 || money > 10000) return SendClientMessage(playerid, COLOR_WHITE, "Gia tien phai o giua $1 va $10,000!");	
	if(!ProxDetectorS(8.0, playerid, id)&& !IsPlayerInAnyVehicle(id)) return SendClientMessage(playerid, -1, "Nguoi choi do khong o trong ban kinh 8m cua ban hoac khong co trong xe.");
	if(id == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay len chinh minh!");
	format(string, sizeof(string), "* Ban da de xuat do xang cho xe cua %s voi gia $%d .",GetName(id),money);
	SendClientMessage(playerid, COLOR_MONEY, string);
	format(string, sizeof(string), "* Tho-sua-xe %s muon do xang cho xe cua ban voi gia $%d, (su dung /chapnhan refill %d) de chap nhan.",GetName(playerid),money,playerid);
	SendClientMessage(id, COLOR_MONEY, string);
	RefillOffer[id] = playerid;
	RefillPrice[id] = money;
	Refillx[playerid] = id;
	return 1;
}
CMD:repair(playerid, params[]) {
	if(PlayerInfo[playerid][pMember] != 8) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la tho co khi!");
	new id,money,string[180];
	if(DeelayCommand[playerid][5] > 0) return DeelayTime(playerid, 5);
	if(sscanf(params, "ui",id,money)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/repair <playerid/name> <Price>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	new engine,lights,alarm,doors,bonnet,boot,objective;
	GetVehicleParamsEx(GetPlayerVehicleID(id),engine,lights,alarm,doors,bonnet,boot,objective);
	if(engine == VEHICLE_PARAMS_ON) return SendClientMessage(playerid, -1, "Nguoi choi do chua tat dong co xe!");
	if(money < 1 || money > 20000) return SendClientMessage(playerid, COLOR_WHITE, "Gia tien phai o giua $1 va $20,000!");
	if(!ProxDetectorS(8.0, playerid, id)&& !IsPlayerInAnyVehicle(id)) return SendClientMessage(playerid, -1, "Nguoi choi do khong o trong ban kinh cua ban hoac khong co trong xe.");
	if(id == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay len chinh minh!");
	format(string, sizeof(string), "* Ban gui de xuat sua chua xe cua %s voi phi $%s.",GetName(id),FormatNumber(money));
	SendClientMessage(playerid, COLOR_MONEY, string);
	format(string, sizeof(string), "* Mechanic %s muon sua xe cua ban voi phi dich vu $%s, (su dung /chapnhan repair %d) de chap nhan.",GetName(playerid),FormatNumber(money),playerid);
	SendClientMessage(id, COLOR_MONEY, string);
	RepairOffer[id] = playerid;
	RepairPrice[id] = money;
	Rapairx[playerid] = id;
	return 1;
}
CMD:getdrugs(playerid, params[]) {
	// if(PlayerInfo[playerid][pJob] != 6) return SendClientMessage(playerid,COLOR_WHITE,"ERROR: {FFFFFF}Ban khong phai la {"#COLOR_GAMEGTA"}Drug Dealer{FFFFFF}.");
	// if(!IsPlayerInRangeOfPoint(playerid, 5.0, 322.1062,1119.2726,1083.8828)) return SendClientMessage(playerid, -1, "ERROR: {FFFFFF}Ban khong o noi ma ban co the lay thuoc phien.");
	// new cant;
	// if(sscanf(params, "i", cant)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/getdrugs <so luong>");
	// if(cant < 1 || cant > 100000) return SendClientMessage(playerid, COLOR_GREY, "ERROR: {FFFFFF}So luong khong hop le! (1-100,000)");
	// if(PlayerInfo[playerid][pDrugs] + cant > 100000) return SendClientMessage(playerid, COLOR_GREY, "ERROR: {FFFFFF}Ban khong the mang trong nguoi nhieu hon 100,000 thuoc phien!");
	// if(GetPlayerCash(playerid) < cant*1) return SendClientMessage(playerid, -1, "ERROR: {FFFFFF}Ban khong co du tien!");
	// new points = cant, money = cant*1;
	// if(GetPlayerCash(playerid) < money) return SendClientMessage(playerid,COLOR_GREY, "ERROR: {FFFFFF}Ban khong co du tien!");
	// PlayerInfo[playerid][pDrugs] += points;
	// GivePlayerCash(playerid,-money);
	// new string[64], query[128];
	// format(string, sizeof(string), "Ban da lay %d gram thuoc phien voi gia $%s.",points,FormatNumber(money));
	// SendClientMessage(playerid,COLOR_LIGHTBLUE,string);
	// format(query,sizeof(query),"UPDATE users SET `Money`='%d',`Drugs`='%d' WHERE `ID`='%d'",GetPlayerCash(playerid),PlayerInfo[playerid][pDrugs],PlayerInfo[playerid][pSQLID]);
	// mysql_query(SQL, query, false);
	// return 1;
	return SendClientMessage(playerid, X11_GREY_70, "[THUOC PHIEN] He thong dang duoc xay dung, hay thu lai sau.");
}
CMD:selldrugs(playerid, params[]) {
	if(PlayerInfo[playerid][pJob] != 6) return SendClientMessage(playerid, COLOR_GREY, "ERROR: {FFFFFF}Ban khong phai la {"#COLOR_GAMEGTA"}Drug Dealer{FFFFFF}.");
	new id,needed,string[128],money,type;
	if(sscanf(params, "uiii",id,type,needed,money)) return SendClientMessage(playerid, COLOR_RED, "Cu phap: {FFFFFF}/selldrugs <playerid/name> <1/2> <So luong> <Gia>");
	if(type<1||type>2) return SendClientMessage(playerid, -1, "Cu phap: {FFFFFF}/selldrugs <playerid/name> <1/2> <So luong> <Gia>\n1. Indica, 2.Sativa");
	if(needed < 1 || needed > 50) return SendClientMessage(playerid, -1, "ERROR: {FFFFFF}Cac gram thuoc phai nam giua 1 va 50 gram!");
	if(money < 1 || money > 50000) return SendClientMessage(playerid, -1, "ERROR: {FFFFFF}Gia tien phai o giua $1 va $50.000!");
	if(PlayerInfo[playerid][pJailTime] != 0) return SendClientMessage(playerid, COLOR_GREY, "ERROR: {FFFFFF}Ban dang ngoi tu!");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "ERROR: {FFFFFF}Nguoi choi khong ket noi.");
	if(!ProxDetectorS(8.0, playerid, id)) return SendClientMessage(playerid, -1, "ERROR: {FFFFFF}Ban khong o gan nguoi nay.");
	if(id == playerid) return SendClientMessage(playerid, COLOR_GREY, "ERROR: {FFFFFF}Ban khong the su dung lenh nay tren chinh minh!");
	if(type==1) {
		if(needed>PlayerInfo[playerid][pMatuy1]) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co du Indica.");
	}
	if(type==2) {
		if(needed>PlayerInfo[playerid][pMatuy2]) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co du Sativa.");
	}
	format(string, sizeof(string), "* Ban da de xuat cho %s, %d gram %s voi gia %s$.", GetName(id), needed, Seed[type][SeedName], FormatNumber(money));
	SendClientMessage(playerid, COLOR_MONEY, string);
	format(string, sizeof(string), "* %s da de xuat %d gram %s cho ban voi gia %s$, (su dung /chapnhan drugs %d) de chap nhan.", GetName(playerid), needed, Seed[type][SeedName],FormatNumber(money),playerid);
	SendClientMessage(id, COLOR_MONEY, string);
	DrugType[id] = type;
	DrugOffer[id] = playerid;
	DrugPrice[id] = money;
	DrugGram[id] = needed;
	return 1;
}
CMD:sellmats(playerid, params[]) {
	if(PlayerInfo[playerid][pJob] != 5) return SendClientMessage(playerid,COLOR_GREY, "ERROR: {FFFFFF}Ban khong phai la nguoi buon vat lieu.");
	if(PlayerInfo[playerid][pLevel] < 4) return SendClientMessage(playerid, COLOR_GREY, "ERROR: {FFFFFF}Ban can phai dat cap 4.");
	new id, mats, string[128], sendername[25], giveplayer[25], price;
	if(sscanf(params, "uii",id,mats,price)) return SendClientMessage(playerid, COLOR_RED, "Cu phap: {FFFFFF}/sellmats <playerid/name> <Materials> <price>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi khong ket noi.");
	if(price < 1 || price > 3000000) return SendClientMessage(playerid, -1, "ERROR: {FFFFFF}Gia tien phai o giua $1 va $3.000.000!");
	if(Iter_Count(PlayerAdmins)+Iter_Count(PlayerHelpers) == 0 && price > 1000000) return SendClientMessage(playerid, -1, "Mua ban vat lieu tren $1,000,000 can co admin (hoac helper) chung kien, ban chi co the giao dich khi co it nhat 1 staff online.");
	if(playerid == id) return SendClientMessage(playerid, COLOR_GREY, "ERROR: {FFFFFF}Ban khong the lam dieu nay len chinh minh!");   
	if(!ProxDetectorS(5.0, playerid, id)) return SendClientMessage(playerid, -1, "ERROR: {FFFFFF}Ban khong o gan nguoi nay.");
	if(mats < 1 || mats > 100000) return SendClientMessage(playerid, -1, "ERROR: {FFFFFF}Ban chi co the ban tu 1 den 100,000 vat lieu.");
	if(mats > PlayerInfo[playerid][pMats]) return SendClientMessage(playerid, COLOR_GREY, "ERROR: {FFFFFF}Ban khong co du vat lieu.");
	GetPlayerName(playerid, sendername, sizeof(sendername));
	GetPlayerName(id, giveplayer, sizeof(giveplayer));
	format(string, sizeof(string), "* Ban de nghi cung cap cho %s, %d vat lieu voi gia %s$.", giveplayer, mats, FormatNumber(price));
	SendClientMessage(playerid, COLOR_MONEY, string);
	format(string, sizeof(string), "* %s muon ban' cho ban %d vat lieu voi gia %s$, (su dung /chapnhan materials %d) de chap nhan.",sendername,mats,FormatNumber(price),playerid);
	SendClientMessage(id, COLOR_MONEY, string);
	MatsOffer[id] = playerid;
	MatsPrice[id] = price;
	MatsAmmo[id] = mats;
    return 1;
}
CMD:sellgun(playerid, params[]) {
	if(PlayerInfo[playerid][pJob] != 5) return SendClientMessage(playerid,-1,"Ban khong phai la "WHITE"Tho che sung{FFFFFF}.");
	new witem[10],weapon[MAX_PLAYERS],ammo[MAX_PLAYERS],price[MAX_PLAYERS],price2,id,string[128];
	if(sscanf(params, "us[10]d",id,witem,price2)) {
		SendClientMessage(playerid, X11_SPRING_GREEN,"Su dung:"WHITE" /sellgun <Player ID/Name> <weapon> <price>");
		SendClientMessage(playerid, COLOR_GREY, "Weapons: sdpistol(500), colt45(650)");
		SendClientMessage(playerid, COLOR_GREY, "Weapons: katana(500), basketball(500), tec9(1000)");
		return 1;
	}
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "ERROR: {FFFFFF}Nguoi choi da chon khong dang nhap.");
	if(playerid == id) return SendClientMessage(playerid,COLOR_WHITE,"ERROR: {FFFFFF}Ban khong the ban vu khi cho chinh minh.");
	if(PlayerInfo[playerid][pJailTime] != 0) return SendClientMessage(playerid, COLOR_GREY, "ERROR: {FFFFFF}Ban khong the su dung lenh nay trong tu!");
	if(IsPlayerInAnyVehicle(id)) return SendClientMessage(playerid, COLOR_GREY, "ERROR: {FFFFFF}Ban khong the su dung lenh nay tren xe.");
	if(IsPlayerInRangeOfPoint(playerid, 300.0, -1423.5153,935.8321,1036.4756)) return SendClientMessage(playerid, -1, "ERROR: {FFFFFF}Ban khong the su dung lenh nay o dau truong.");
	
	if(PlayerInfo[id][pGunLic] == 0) return SendClientMessage(playerid,COLOR_WHITE,"ERROR: {FFFFFF}Nguoi choi nay khong co {"#COLOR_GAMEGTA"} giay phep sung{FFFFFF}.");

	if(strmatch(witem,"sdpistol")) {
		if(PlayerInfo[playerid][pMats] < 500) return SendClientMessage(playerid,COLOR_ERROR,"Ban khong co du so vat lieu can thiet (500).");
		if(PlayerInfo[id][pGunLic] < 0) return SendClientMessage(playerid,COLOR_ERROR,"Nguoi choi do khong co giay phep su dung sung.");
		price[playerid] = 500; weapon[playerid] = 23; ammo[playerid] = 50;
	}
	// 	Colt45 - 650 VL
	else if(strmatch(witem, "colt45")) {
		if(PlayerInfo[playerid][pMats] < 650) return SendClientMessage(playerid,COLOR_ERROR,"Ban khong co du so vat lieu can thiet (650).");
		if(PlayerInfo[id][pGunLic] < 0) return SendClientMessage(playerid,COLOR_ERROR,"Nguoi choi do khong co giay phep su dung sung.");
		price[playerid] = 650; weapon[playerid] = 22; ammo[playerid] = 50;
	}
	// Katana - 500 VL
	else if(strmatch(witem, "katana")) {
		if(PlayerInfo[playerid][pMats] < 500) return SendClientMessage(playerid,COLOR_ERROR,"Ban khong co du so vat lieu can thiet (500).");
		if(PlayerInfo[id][pGunLic] < 0) return SendClientMessage(playerid,COLOR_ERROR,"Nguoi choi do khong co giay phep su dung sung.");
		price[playerid] = 500; weapon[playerid] = 8; ammo[playerid] = 50;
	}
	// Basketball - 500 VL
	else if(strmatch(witem, "basketball")) {
		if(PlayerInfo[playerid][pMats] < 500) return SendClientMessage(playerid,COLOR_ERROR,"Ban khong co du so vat lieu can thiet (500).");
		if(PlayerInfo[id][pGunLic] < 0) return SendClientMessage(playerid,COLOR_ERROR,"Nguoi choi do khong co giay phep su dung sung.");
		price[playerid] = 500; weapon[playerid] = 5; ammo[playerid] = 50;
	}
	// Tec9    - 1000 VL
	else if(strmatch(witem, "tec9")) {
		if(PlayerInfo[playerid][pMats] < 1000) return SendClientMessage(playerid,COLOR_ERROR,"Ban khong co du so vat lieu can thiet (1000).");
		if(PlayerInfo[id][pGunLic] < 0) return SendClientMessage(playerid,COLOR_ERROR,"Nguoi choi do khong co giay phep su dung sung.");
		price[playerid] = 1000; weapon[playerid] = 32; ammo[playerid] = 50;
	}
	else {
		SendClientMessage(playerid, X11_SPRING_GREEN,"Su dung:"WHITE" /sellgun <Player ID/Name> <weapon> <price>");
		SendClientMessage(playerid, COLOR_GREY, "Weapons: sdpistol(500), colt45(650)");
		SendClientMessage(playerid, COLOR_GREY, "Weapons: katana(500), basketball(500), tec9(1000)");

		return 1;
	}

	if(price2 < 1 || price2 > 1000000) return SendClientMessage(playerid,COLOR_WHITE,"ERROR: {FFFFFF}Gia phai tu $1 den $100000.");
	if(!ProxDetectorS(5.0, playerid, id)) return SendClientMessage(playerid, -1, "ERROR: {FFFFFF}Nguoi choi do khong o gan ban.");
	SellgunOffer[id] = playerid;
	SellgunPrice[id] = price2;
	SellgunMats[id] = price[playerid];
	SellgunAmmo[id] = ammo[playerid];
	SellgunID[id] = weapon[playerid];
	new gunname[50];
	GetWeaponNameEx(weapon[playerid],gunname,sizeof(gunname));
	format(string, sizeof(string), "* Ban de xuat ban' cho %s %s voi gia %s$.",GetName(id),gunname,FormatNumber(price2));
	SendClientMessage(playerid, COLOR_MONEY, string);
	format(string, sizeof(string), "* %s muon ban' cho ban mot %s voi gia %s$, (su dung /chapnhan gun %d) de chap nhan.",GetName(playerid),gunname,FormatNumber(price2),playerid);
	SendClientMessage(id, COLOR_MONEY, string);
	return 1;
}
// CMD:sellgun(playerid, params[]) {	
// 	new splayer[24],giveplayerid, weap[24], price;
// 	if(PlayerInfo[playerid][pJob] != 9) return va_SendClientMessage(playerid, X11_SPRING_GREEN, "[INFO]:"WHITE" Cong viec cua ban khong phai la %s de su dung lenh nay.", JobInfo[9][jName]);
// 	if(sscanf(params,"s[25]s[24]i", splayer,weap,price)) return SendClientMessage(playerid, X11_SPRING_GREEN,"Su dung:"WHITE" /sellgun <Player ID/Name> <weapon> <price>"), SendClientMessage(playerid, COLOR_GREY, "Weapons: sdpistol(100) deagle(100)"), SendClientMessage(playerid, COLOR_GREY, "Weapons: mp5(200) ak47(350) m4(350)"), SendClientMessage(playerid, COLOR_GREY, "Weapons: shotgun(300) rifle(400)");
// 	{
// 		if(!ProxDetectorS(5.0, playerid, giveplayerid)) return SendClientMessage(playerid, X11_SPRING_GREEN, "[ERROR]: "WHITE"Nguoi choi do khong o gan ban.");
// 		if(SellGunPice[giveplayerid][playerid] > 0) return SendClientMessage(playerid, X11_SPRING_GREEN, "[ERROR]: "WHITE"Ai oferit deja o arma.");
//         if(giveplayerid == playerid) return SendClientMessage(playerid, X11_SPRING_GREEN, "[ERROR]: "WHITE"Ban khong the ban' vu khi cho chinh minh.");
//         if(PlayerInfo[giveplayerid][pJailed] != 0) return SendClientMessage(playerid, X11_SPRING_GREEN, "[ERROR]: "WHITE"Ban khong the ban vu khi cho mot nguoi o trong tu.");
//         if(MoneyACheck(playerid, price, 1, 10000)) return 1;
// 		new mats, weapon, ammo;
// 		if(strmatch(weap,"sdpistol")) {
// 			if(PlayerInfo[playerid][pMats] < 500) return SendClientMessage(playerid,COLOR_ERROR,"Ban khong co du so vat lieu can thiet (500).");
// 			if(PlayerInfo[giveplayerid][pGunLic] < 0) return SendClientMessage(playerid,COLOR_ERROR,"Nguoi choi do khong co giay phep su dung sung.");
// 			mats = 500; weapon = 23; ammo = 50;
// 		}
// 		// 	Colt45 - 650 VL
// 		else if(strmatch(weap, 'colt45')) {
// 			if(PlayerInfo[playerid][pMats] < 650) return SendClientMessage(playerid,COLOR_ERROR,"Ban khong co du so vat lieu can thiet (650).");
// 			if(PlayerInfo[giveplayerid][pGunLic] < 0) return SendClientMessage(playerid,COLOR_ERROR,"Nguoi choi do khong co giay phep su dung sung.");
// 			mats = 650; weapon = 22; ammo = 50;
// 		}
// 		// Katana - 500 VL
// 		else if(strmatch(weap, 'katana')) {
// 			if(PlayerInfo[playerid][pMats] < 500) return SendClientMessage(playerid,COLOR_ERROR,"Ban khong co du so vat lieu can thiet (500).");
// 			if(PlayerInfo[giveplayerid][pGunLic] < 0) return SendClientMessage(playerid,COLOR_ERROR,"Nguoi choi do khong co giay phep su dung sung.");
// 			mats = 500; weapon = 8; ammo = 50;
// 		}
// 		// Basketball - 500 VL
// 		else if(strmatch(weap, 'basketball')) {
// 			if(PlayerInfo[playerid][pMats] < 500) return SendClientMessage(playerid,COLOR_ERROR,"Ban khong co du so vat lieu can thiet (500).");
// 			if(PlayerInfo[giveplayerid][pGunLic] < 0) return SendClientMessage(playerid,COLOR_ERROR,"Nguoi choi do khong co giay phep su dung sung.");
// 			mats = 500; weapon = 5; ammo = 50;
// 		}
// 		// Tec9    - 1000 VL
// 		else if(strmatch(weap, 'tec9')) {
// 			if(PlayerInfo[playerid][pMats] < 1000) return SendClientMessage(playerid,COLOR_ERROR,"Ban khong co du so vat lieu can thiet (1000).");
// 			if(PlayerInfo[giveplayerid][pGunLic] < 0) return SendClientMessage(playerid,COLOR_ERROR,"Nguoi choi do khong co giay phep su dung sung.");
// 			mats = 650; weapon = 32; ammo = 50;
// 		}

// 		// else if(strmatch(weap,"deagle")) {
// 		// 	if(PlayerInfo[playerid][pMats] < 100) return SendClientMessage(playerid,COLOR_ERROR,"Ban khong co du so vat lieu can thiet (100).");
// 		// 	if(PlayerInfo[giveplayerid][pGunLic] < 0) return SendClientMessage(playerid,COLOR_ERROR,"Nguoi choi do khong co giay phep su dung sung.");
// 		// 	mats = 100; weapon = 24; ammo = 50;
// 		// }
// 		// else if(strmatch(weap,"mp5")) {
// 		// 	if(PlayerInfo[playerid][pMats] < 200) return SendClientMessage(playerid,COLOR_ERROR,"Ban khong co du so vat lieu can thiet (200).");
// 		// 	if(PlayerInfo[giveplayerid][pGunLic] < 0) return SendClientMessage(playerid,COLOR_ERROR,"Nguoi choi do khong co giay phep su dung sung.");
// 		// 	mats = 200; weapon = 29; ammo = 100;
// 		// }
// 		// else if(strmatch(weap,"ak47")) {
// 		// 	if(PlayerInfo[playerid][pMats] < 350) return SendClientMessage(playerid,COLOR_ERROR,"Ban khong co du so vat lieu can thiet (350).");
// 		// 	if(PlayerInfo[giveplayerid][pGunLic] < 0) return SendClientMessage(playerid,COLOR_ERROR,"Nguoi choi do khong co giay phep su dung sung.");
// 		// 	mats = 350; weapon = 30; ammo = 120;
// 		// }
// 		// else if(strmatch(weap,"m4")) {
// 		// 	if(PlayerInfo[playerid][pMats] < 350) return SendClientMessage(playerid,COLOR_ERROR,"Ban khong co du so vat lieu can thiet (350).");
// 		// 	if(PlayerInfo[giveplayerid][pGunLic] < 0) return SendClientMessage(playerid,COLOR_ERROR,"Nguoi choi do khong co giay phep su dung sung.");
// 		// 	mats = 350; weapon = 31; ammo = 120;
// 		// }
// 		// else if(strmatch(weap,"shotgun")) {
// 		// 	if(PlayerInfo[playerid][pMats] < 300) return SendClientMessage(playerid,COLOR_ERROR,"Ban khong co du so vat lieu can thiet (300).");
// 		// 	if(PlayerInfo[giveplayerid][pGunLic] < 0) return SendClientMessage(playerid,COLOR_ERROR,"Nguoi choi do khong co giay phep su dung sung.");
// 		// 	mats = 300; weapon = 25; ammo = 25;
// 		// }
// 		// else if(strmatch(weap,"rifle")) {
// 		// 	if(PlayerInfo[playerid][pMats] < 400) return SendClientMessage(playerid,COLOR_ERROR,"Ban khong co du so vat lieu can thiet (400).");
// 		// 	if(PlayerInfo[giveplayerid][pGunLic] < 0) return SendClientMessage(playerid,COLOR_ERROR,"Nguoi choi do khong co giay phep su dung sung.");
// 		// 	mats = 400; weapon = 33; ammo = 25;
// 		// }
// 		else{
// 			return SendClientMessage(playerid, X11_SPRING_GREEN,"Su dung:"WHITE" /sellgun <Player ID/Name> <weapon> <price>"), 
// 				SendClientMessage(playerid, COLOR_GREY, "Weapons: sdpistol(500), colt45(650)");
// 				SendClientMessage(playerid, COLOR_GREY, "Weapons: katana(500), basketball(500), tec9(1000)");
// 		} 

// 		new gunname[32];
// 		GetWeaponName(weapon,gunname,32);
		
// 		va_SendClientMessage(playerid, X11_MISTY_ROSE_1, "Ban da offer cho %s, mot %s voi %d dan voi gia $%s.", GetName(giveplayerid), gunname, ammo, FormatNumber(price));
// 		va_SendClientMessage(giveplayerid, X11_MISTY_ROSE_1, "%s offer cho ban mot %s voi %d dam, gia $%s, su dung /accept gun %d de chap nhan.",GetName(playerid) ,gunname, ammo, FormatNumber(price), playerid);

// 		SellGunPice[giveplayerid][playerid] = price;
// 		SellGunWeapon[giveplayerid][playerid] = weapon;
// 		SellGunAmmo[giveplayerid][playerid] = ammo;
// 		SellGunMats[giveplayerid][playerid] = mats;
// 	}
// 	return 1;
// }
CMD:buymats(playerid, params[]) {
	if(PlayerInfo[playerid][pJob] != 5) return SendClientMessage(playerid,COLOR_GREY, "Ban khong phai la 'Tho che sung'.");
	new cant;
	if(sscanf(params, "i", cant)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/buymats <so vat lieu>");
	if(cant < 1 || cant > 100000) return SendClientMessage(playerid, COLOR_GREY, "So vat lieu can mua khong hop le! (1-100,000)");
	if(PlayerInfo[playerid][pMats] + cant > 100000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the so huu hon 100,000 vat lieu!");
	if(GetPlayerCash(playerid) < cant*200) return SendClientMessage(playerid, -1, "Ban khong co du tien!");
	new string[55];
	if(IsPlayerInRangeOfPoint(playerid, 3.0,GetMats[0][0],GetMats[0][1],GetMats[0][2])) {
		format(string, sizeof(string), "* Ban da mua %d vat lieu voi gia $%s.", cant, FormatNumber(cant*200));
		SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
		GivePlayerCash(playerid, - cant*200);
		Update(playerid, pCashx);
		PlayerInfo[playerid][pMats] += cant;
		new query[100];
		format(query, sizeof(query), "UPDATE `users` SET `Materials`='%d' WHERE `ID`='%d'", PlayerInfo[playerid][pMats], PlayerInfo[playerid][pSQLID]);
		mysql_query(SQL, query, false);
	}
	else {
		if(CP[playerid] != 0) return Dialog_Show(playerid, DIALOG_CHECKPOINT, DIALOG_STYLE_MSGBOX, "Checkpoint", "Mot cham do dang hoat dong.\nBan co muon xoa no khong? Neu muon, hay chon 'Ok'.", "Ok", "Exit");
		CP[playerid] = 53;
		SendClientMessage(playerid, COLOR_GREY, "Ban khong o noi ma ban co the mua vat lieu, hay di theo cham do de den do.");
		SetPlayerCheckpointEx(playerid, GetMats[0][0],GetMats[0][1],GetMats[0][2], 7.0);
	}
	return 1;
}
CMD:stopwork(playerid, params[]) {
	if(JobWorking[playerid] == 0) return SendClientMessage(playerid, COLOR_GREY, "Ban khong lam viec!");
	CP[playerid] = 0;
	DisablePlayerCheckpointEx(playerid);
	JobWorking[playerid] = 0;
	if(playerObject[playerid] != 0) DestroyPlayerObject(playerid, playerObject[playerid]), playerObject[playerid] = 0;
	if(playerObject2[playerid] != 0) DestroyObject(playerObject2[playerid]), playerObject2[playerid] = 0;
	SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Ban da ket thuc cong viec!");
	if(JobVehicle[playerid] != 0) { DestroyVehicle(JobVehicle[playerid]); JobVehicle[playerid] = 0; }
	if(Trailer[playerid] != 0) { DestroyVehicle(Trailer[playerid]); Trailer[playerid] = 0; }
	switch(PlayerInfo[playerid][pJob]) {
		case 7: {
		        for(new x = 0; x < sizeof TreeTD; x++) TextDrawHideForPlayer(playerid, TreeTD[x]);
		        CancelSelectTextDraw(playerid), FarmerTimer[playerid] = -1, FarmerTreeTaken[playerid] = -1, RemovePlayerAttachedObject(playerid, ATTACHMENT_ID_BALE), SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE), TogglePlayerControllable(playerid, 1);
		}
	}	
	PlayerTextDrawHide(playerid, JobTD);
	PlayerTextDrawHide(playerid, InfosTD);	
	JobVehicle[playerid] = 0;
	JobLeftTime[playerid] = 0;
	RemovePlayerAttachedObject(playerid, 6);
	SetPlayerSpecialAction(playerid, 0);	
	ResetPlayerWeapons(playerid);
	DestroyPlayerObject(playerid, DeerObj[playerid]);
	BagTime[playerid] = 0;
	DestroyWoodObject(playerid);
	if(PlayerInfo[playerid][pJob] == 3) ResetWeapons(playerid);
	return 1;
}
CMD:quitjob(playerid, params[]) {
	new str[180];
	if(PlayerInfo[playerid][pJob] == 0) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co mot cong viec.");
	SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Ban da tu chuc khoi cong viec.");
	PlayerInfo[playerid][pJob] = 0;
	UsedFind[playerid] = 0;
	DisablePlayerCheckpointEx(playerid);
	PlayerTextDrawHide(playerid, FindTD);
	targetfind[playerid] = -1;
	CP[playerid] = 0;
	TogglePlayerControllable(playerid, true);
	if(JobWorking[playerid]==2) {
		for(new x = 0; x < sizeof TreeTD; x++) TextDrawHideForPlayer(playerid, TreeTD[x]);
	    CancelSelectTextDraw(playerid), FarmerTimer[playerid] = -1, FarmerTreeTaken[playerid] = -1, RemovePlayerAttachedObject(playerid, ATTACHMENT_ID_BALE), SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE), TogglePlayerControllable(playerid, 1);
    }
	DisablePlayerCheckpointEx(playerid);
	RemovePlayerAttachedObject(playerid, 2);
	JobWorking[playerid] = 0;
	PlayerTextDrawHide(playerid, JobTD);
	if(JobVehicle[playerid] != 0) DestroyVehicle(JobVehicle[playerid]), JobVehicle[playerid] = 0;
	if(Trailer[playerid] != 0) { DestroyVehicle(Trailer[playerid]); Trailer[playerid] = 0;  }
	mysql_format(SQL, str,128,"UPDATE `users` SET `Job`='%d' WHERE `ID`='%d' LIMIT 1",PlayerInfo[playerid][pJob],PlayerInfo[playerid][pSQLID]);
	mysql_tquery(SQL, str, "", "");
	if(playerObject[playerid] != 0) DestroyPlayerObject(playerid, playerObject[playerid]), playerObject[playerid] = 0;
	if(playerObject2[playerid] != 0) DestroyObject(playerObject2[playerid]), playerObject2[playerid] = 0;
	DisablePlayerRaceCheckpointEx(playerid);
	DestroyProgress(playerid, 1);
	DestroyWoodObject(playerid);
	if(PlayerInfo[playerid][pJob] == 3) ResetWeapons(playerid);
	JobLeftTime[playerid] = 0;
	BagTime[playerid] = 0;
	return 1;
}
CMD:removeclan(playerid, params[]) {
	new membrii, szQuery[256], string[180];
	if(PlayerInfo[playerid][pClan] == 0 || PlayerInfo[playerid][pClanRank] != 6) return SendClientMessage(playerid,-1,"Nu ai un clan!");
	new clanid = PlayerInfo[playerid][pClan];
	for(new h = 0; h < MAX_CLANZONES; h++) {
		if(GraffitiInfo[h][gfOwned] == clanid && clanid != 0) {
			GraffitiInfo[h][gfOwned] = 0;
			DestroyDynamicObject(GraffitiInfo[h][gfObject]);
			GraffitiInfo[h][gfObject] = CreateDynamicObject(19373, GraffitiInfo[h][gfX], GraffitiInfo[h][gfY], GraffitiInfo[h][gfZ], 0.0, 0.0, GraffitiInfo[h][gfRot]);
			format(string, sizeof(string), "None", ClanInfo[GraffitiInfo[h][gfOwned]][clColor], ClanInfo[GraffitiInfo[h][gfOwned]][clTag]);
			SetDynamicObjectMaterialText(GraffitiInfo[h][gfObject], 0, string, OBJECT_MATERIAL_SIZE_256x128, "BankGothic Md BT", 60, 1, 0xfff0f0f0, 0, 1);
			GraffitiInfo[StartedSprayOn[playerid]][gfAttacked] = 0;
			new query[256];
			format(query, sizeof(query), "UPDATE `clanzone` SET `Owned`='0' WHERE `ID`='%d'", h);
			mysql_query(SQL, query, false);
		}
	}
	foreach(new i: Player) {
		if(IsPlayerLogged[i] == 1 && PlayerInfo[i][pClan] == clanid && i != playerid) {
			SendClientMessage(i, COLOR_YELLOW, "Ban da bi sa thai khoi clan nay! Li do: Nguoi lanh dao da roi khoi clan.");
			SendClientMessage(i, COLOR_YELLOW, "Server: Clan tag da duoc xoa. Ten cua ban khong bi anh huong.");
			PlayerInfo[i][pClan] = 0;
			PlayerInfo[i][pClanRank] = 0;
			SetPlayerName(i, PlayerInfo[i][pUsername]);
			format(szQuery, sizeof(szQuery), "UPDATE `users` SET `Clan`='0', `ClanRank`='0', `ClanDays`='0', `ClanWarns`='0' WHERE `Name`='%s'", GetName(i));
			mysql_query(SQL, szQuery, false);
			membrii++;
		}
	}
    format(szQuery, sizeof(szQuery), "SELECT * FROM `users` WHERE `Clan` = '%d'", clanid);
    new Cache: result = mysql_query(SQL, szQuery);
    new idwtf[180];
    for(new i, j = cache_num_rows (); i < j; i++)
    {
		cache_get_value_name(i, "id", idwtf);
 		membrii++;
 		new szQuery2[256];
		mysql_format(SQL, szQuery2, sizeof(szQuery2), "UPDATE `users` SET `Clan`='0', `ClanRank`='0', `ClanDays`='0', `ClanWarns`='0' WHERE `ID`='%d'", strval(idwtf));
		mysql_tquery(SQL,szQuery2, "", "");
    }
    cache_delete(result);

	format(string, sizeof(string), "Ban da xoa thanh cong Clan! Ban khong the phuc hoi lai. [%d thanh vien bi xoa]", membrii);
	SendClientMessage(playerid, COLOR_YELLOW, string);
	SetPlayerName(playerid, PlayerInfo[playerid][pUsername]);

	mysql_format(SQL, string,128,"DELETE FROM `clans` WHERE `ID`='%d'",clanid);
	mysql_query(SQL, string);

	PlayerInfo[playerid][pClan] = 0;
	PlayerInfo[playerid][pClanRank] = 0;
	return 1;
}
CMD:createhouse(playerid, params[])
{
    if(IsPlayerConnected(playerid))
    {
		if(PlayerInfo[playerid][pAdmin] < 7) return 1;
		new ivInt,Float:IntPos[3], inter,Float:pX,Float:pY,Float:pZ,string[128],query[500], text, sendername[25];
		if(sscanf(params, "i",text)) return SendClientMessage(playerid, COLOR_GREY, "Syntax: {FFFFFF}/createhouse <Size - 0/1/2> 0 = small, 1 = medium, 2 = big");
		if(text >= 3) return SendClientMessage(playerid, COLOR_RED, "Unknown Size");
		GetPlayerPos(playerid, pX, pY, pZ);
		SetPVarFloat(playerid, "pHeX", pX);
		SetPVarFloat(playerid, "pHeY", pY);
		SetPVarFloat(playerid, "pHeZ", pZ);
		if(text == 0)
		{
			ivInt = random(5);
			if(ivInt == 0)IntPos[0] = 223.20, IntPos[1] = 1287.08, IntPos[2] = 1082.14, inter = 1;
			else if(ivInt == 1)IntPos[0] = 2283.04, IntPos[1] = -1140.28, IntPos[2] = 1050.90, inter = 11;
			else if(ivInt == 2)IntPos[0] = 446.90, IntPos[1] = 506.35, IntPos[2] = 1001.42, inter = 12;
			else if(ivInt == 3)IntPos[0] = 328.05, IntPos[1] = 1477.73, IntPos[2] = 1084.44, inter = 15;
			else if(ivInt == 4)IntPos[0] = 223.20, IntPos[1] = 1287.08, IntPos[2] = 1082.14, inter = 1;
			else if(ivInt == 5)IntPos[0] = -42.59, IntPos[1] = 1405.47, IntPos[2] = 1084.43, inter = 8;
		}
		else if(text == 1)
		{
			ivInt = random(5)+6;
			if(ivInt == 6)IntPos[0] = 235.34, IntPos[1] = 1186.68, IntPos[2] = 1080.26, inter = 3;
			else if(ivInt == 7)IntPos[0] = 24.04, IntPos[1] = 1340.17, IntPos[2] = 1084.38, inter = 10;
			else if(ivInt == 8)IntPos[0] = -283.44, IntPos[1] = 1470.93, IntPos[2] = 1084.38, inter = 15;
			else if(ivInt == 9)IntPos[0] = -260.49, IntPos[1] = 1456.75, IntPos[2] = 1084.37, inter = 4;
			else if(ivInt == 10)IntPos[0] = 377.15, IntPos[1] = 1417.41, IntPos[2] = 1081.33, inter = 15;
		}
		else if(text == 2)
		{
			ivInt = random(5)+11;
			if(ivInt == 11)IntPos[0] = 2324.53, IntPos[1] = -1149.54, IntPos[2] = 1050.71, inter = 12;
			else if(ivInt == 12)IntPos[0] = 1260.64, IntPos[1] = -785.37, IntPos[2] = 1091.91, inter = 5;
			else if(ivInt == 13)IntPos[0] = 140.17, IntPos[1] = 1366.07, IntPos[2] = 1083.65, inter = 5;
			else if(ivInt == 14)IntPos[0] = 234.19, IntPos[1] = 1063.73, IntPos[2] = 1084.21, inter = 6;
			else if(ivInt == 15)IntPos[0] = 225.68, IntPos[1] = 1021.45, IntPos[2] = 1084.02, inter = 7;
			else if(ivInt == 16)IntPos[0] = 226.30, IntPos[1] = 1114.24, IntPos[2] = 1080.99, inter = 5;
		}

		new i = Iter_Count(House)+1;
		mysql_format(SQL, query, sizeof(query), "INSERT INTO houses (Owner, Lockk, Hel, Arm, Level, Rentabil, Rent, Owned, Discription, Value, Takings) VALUES('AdmBot', '0', '0', '0', '10', '1', '500', '0', 'House', '10000000', '0')");
		mysql_tquery(SQL, query, "", "");

		HouseInfo[i][hID]						   = i;
       	Iter_Add(House, i);		
		HouseInfo[i][hEntrancex]					= GetPVarFloat(playerid, "pHeX");
		HouseInfo[i][hEntrancey]					= GetPVarFloat(playerid, "pHeY");
		HouseInfo[i][hEntrancez]					= GetPVarFloat(playerid, "pHeZ");
		HouseInfo[i][hExitx]						= IntPos[0];
		HouseInfo[i][hExity]						= IntPos[1];
		HouseInfo[i][hExitz]						= IntPos[2];
		format(HouseInfo[i][hOwner], 64, "AdmBot");
		format(HouseInfo[i][hDiscription], 64, "House");
		HouseInfo[i][hValue]						= 100000000;
		HouseInfo[i][hHel]						  = 0;
		HouseInfo[i][hInterior]					 = inter;
		HouseInfo[i][hLock]						 = 0;
		HouseInfo[i][hOwned]						= 0;
		HouseInfo[i][hRent]						 = 500;
		HouseInfo[i][hRentabil]					 = 1;
		HouseInfo[i][hTakings]					  = 0;
		HouseInfo[i][hLevel]						= 10;
		HouseInfo[i][hVirtual]					  = Iter_Count(House)+1;

		mysql_format(SQL, query, sizeof(query), "UPDATE `houses` SET `Entrancex`='%f',`Entrancey`='%f',`Entrancez`='%f',`Exitx`='%f',`Exity`='%f',`Exitz`='%f',`Interior`='%d',`Virtual`='%d',`Value`='%d',`Level`='%d' WHERE `ID`='%d'",HouseInfo[i][hEntrancex],HouseInfo[i][hEntrancey],HouseInfo[i][hEntrancez],HouseInfo[i][hExitx],HouseInfo[i][hExity],HouseInfo[i][hExitz],HouseInfo[i][hInterior],HouseInfo[i][hVirtual],HouseInfo[i][hValue],HouseInfo[i][hLevel],i);
		mysql_tquery(SQL, query, "", "");
		mysql_format(SQL, query, sizeof(query), "UPDATE `houses` SET `Entrancex`='%f',`Entrancey`='%f',`Entrancez`='%f',`Exitx`='%f',`Exity`='%f',`Exitz`='%f',`Interior`='%d',`Virtual`='%d' WHERE `ID`='%d'", HouseInfo[i][hEntrancex], HouseInfo[i][hEntrancey], HouseInfo[i][hEntrancez], HouseInfo[i][hExitx], HouseInfo[i][hExity], HouseInfo[i][hExitz], HouseInfo[i][hInterior], HouseInfo[i][hVirtual], i);
		mysql_tquery(SQL, query, "", "");

		if(ivInt >= 0 && ivInt <=5)
		{
			mysql_format(SQL, query, sizeof(query), "UPDATE `houses` SET `InteriorType` = 0  WHERE `ID`='%d'",i);
			mysql_tquery(SQL,query,"","");
			HouseInfo[i][hInteriorType] = 0;
		}
		else if(ivInt >= 6 && ivInt <=10)
		{
			mysql_format(SQL, query, sizeof(query), "UPDATE `houses` SET `InteriorType` = 1  WHERE `ID`='%d'",i);
			mysql_tquery(SQL,query,"","");
			HouseInfo[i][hInteriorType] = 1;
		}
		else if(ivInt >= 11 && ivInt <=16)
		{
			mysql_format(SQL, query, sizeof(query), "UPDATE `houses` SET `InteriorType` = 2  WHERE `ID`='%d'",i);
			mysql_tquery(SQL,query,"","");
			HouseInfo[i][hInteriorType] = 2;
		}
		OnPropTextdrawUpdate(1,i);
		SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld(playerid, 0);
		SetPlayerPosEx(playerid, HouseInfo[i][hEntrancex], HouseInfo[i][hEntrancey], HouseInfo[i][hEntrancez]);
		format(string,sizeof(string),"[House] %d da duoc tao thanh cong!",i);
		SendClientMessage(playerid, COLOR_YELLOW, string);
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "[Admin] %s: da tao house ID %d", sendername, i);
		SendAdminMessage(COLOR_ADMCHAT, string, 1);
    }
    return 1;
}
CMD:removehouse(playerid, params[])
{
    new house;
    if(PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, COLOR_RED, "Your admin level is not high enough to use this command.");
    if(sscanf(params,"i",house)) return SendClientMessage(playerid, COLOR_GREY, "Syntax: {FFFFFF}/removehouse <houseid>");
    {
		if(!Iter_Contains(House, house)) return SendClientMessage(playerid, COLOR_RED, "ID house ban da nhap khong ton tai.");
		HouseInfo[house][hValue] = 0;
		HouseInfo[house][hHel] = 0;
		HouseInfo[house][hLock] = 0;
		HouseInfo[house][hOwned] = -1;
		HouseInfo[house][hRent] = 0;
		HouseInfo[house][hRentabil] = 0;
		HouseInfo[house][hTakings] = 0;
		HouseInfo[house][hLevel] = 0;
		HouseInfo[house][hVirtual] = 0;
		strmid(HouseInfo[house][hOwner], "Remove", 0, 60, 60);
		HouseInfo[house][hEntrancex] = 0;
		HouseInfo[house][hEntrancey] = 0;
		HouseInfo[house][hEntrancez] = 0;
		HouseInfo[house][hExitx] = 0;
		HouseInfo[house][hExity] = 0;
		HouseInfo[house][hExitz] = 0;
		
		if(IsValidDynamicMapIcon(HouseIcon[house])) DestroyDynamicMapIcon(HouseIcon[house]);
		DestroyDynamicPickup(HousePickup[house]);
		DestroyDynamic3DTextLabel(HouseLabel[house]);
		SendClientMessage(playerid, -1, "{DC0C0C}Thanh cong: {ffffff}Nha da duoc xoa !");
		Iter_Remove(House, house);
    }
    return 1;
}
CMD:fmembers(playerid, params[]) {
	if(PlayerInfo[playerid][pMember] == 0) return  SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la thanh vien cua mot to chuc!");
	new string[1024], x;
	SendClientMessage(playerid, COLOR_SERVER, "-- Nguoi choi online trong to chuc --");
	foreach(new i: Player) {
		if(IsPlayerConnected(i) && PlayerInfo[i][pMember] == PlayerInfo[playerid][pMember]) {
			format(string, sizeof(string), "%s %s (%d),", string, GetName(i), i);
			x++;
		}
	}
	MesajLung(playerid, -1, string);
	format(string, sizeof(string), "* Co %d nguoi choi online trong to chuc cua ban.", x);
	SendClientMessage(playerid, COLOR_LGREEN, string);
	return 1;
}	
CMD:cmembers(playerid, params[]) {
	if(PlayerInfo[playerid][pClan] == 0) return  SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong mot clan!");
	new string[1024], x;
	SendClientMessage(playerid, COLOR_SERVER, "-- Nguoi choi online trong clan --");
	foreach(new i: Player) {
		if(IsPlayerConnected(i) && PlayerInfo[i][pClan] == PlayerInfo[playerid][pClan]) {
			format(string, sizeof(string), "%s %s (%d),", string, GetName(i), i);
			x++;
		}
	}
	MesajLung(playerid, -1, string);
	format(string, sizeof(string), "* Co %d nguoi choi online trong clan.", x);
	SendClientMessage(playerid, COLOR_LGREEN, string);
	return 1;
}
CMD:clans(playerid, params[]) {
	//SendClientMessage(playerid, COLOR_LGREEN, "Comanda dezacitvata deoarece provoca lag!");
	new szDialog[1024], szDialog2[4048], x;
	strcat(szDialog2, "#. Clan\tSo huu\tThanh vien\tDia ban\n");
	for(new h = 0; h < MAX_CLANS; h++) {
		if(strlen(ClanInfo[h][clName]) > 0) {
			x++;
			format(szDialog, sizeof(szDialog), "%d. %s - %s{FFFFFF}\t%s\t%d/%d\t%d\n", x, ClanInfo[h][clName], ClanInfo[h][clTag], ClanInfo[h][clOwner], GetCMembers(h), ClanInfo[h][clSlots], GetClanTurfs(h));
			strcat(szDialog2, szDialog);
		}		
	}
	Dialog_Show(playerid, 0, DIALOG_STYLE_TABLIST_HEADERS, "Clans:", szDialog2, "Select", "Cancel");
	return 1;
}
CMD:quitclan(playerid, params[]) {
    new clanid = PlayerInfo[playerid][pClan];
    if(clanid == 0) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong mot clan!");
	if(PlayerInfo[playerid][pClanRank] == 6) return SendClientMessage(playerid, -1, "Ban khong the roi khoi clan vi ban la nguoi lanh dao!");
	Dialog_Show(playerid, DIALOG_QUITCLAN, DIALOG_STYLE_MSGBOX, "Server:", "Ban co muon roi khoi clan khong?", "Yes", "No");
	return 1;
}

CMD:clanduty(playerid, params[]) {
	// if(!CAC_GetStatus(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban chua cai dat SAMPCAC!");
	new clanid = PlayerInfo[playerid][pClan];
    if(clanid == 0) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong mot clan!");
	new hour,minute,second, year, month, day;
	gettime(hour,minute,second);
	getdate(year, month, day);	
	new days[180];
	format(days, sizeof(days), GetWeekDay(day, month, year));
	//if(strcmp(days,"Sunday",true) == 0 || strcmp(days,"Monday",true) == 0 || strcmp(days,"Wednesday",true) == 0 || strcmp(days,"Friday",true) == 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Chi co the bat dau war clan vao cac ngay le trong tuan (3-5-7)!");
	if(hour == 19|| hour == 20 || hour == 21) {} else return SendClientMessage(playerid, COLOR_LIGHTRED, "Gio war se nam trong khoang thoi gian 19h - 22h!");
	switch(ClanDuty[playerid]) {
		case 0: SendClientMessage(playerid, -1, "Ban da kich hoat clan duty thanh cong!"), ClanDuty[playerid] = 1;
		case 1: {
			if(StartedSpray[playerid] == 1 || ClanDuty[playerid] == 1) {
				SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong con onduty clan nua!");
				GraffitiInfo[StartedSpray2[playerid]][gfAttacked] = 0;
				StartedSpray[playerid] = 0;
				StartedSpray2[playerid] = 0;
				StartedSprayOn[playerid] = 0;
				ClanProces[playerid] = 0;
				ClanDuty[playerid] = 0;
			}
		}
	}
	return 1;
}

alias:clanzones("clanturfs","cturfs")
CMD:clanzones(playerid, params[]) {
	// new clanid = PlayerInfo[playerid][pClan];
    // if(clanid == 0) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong mot clan!");
	if(Iter_Contains(PlayerInRace, playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong duoc phep su dung lenh nay khi ban dang o trong dau truong dua xe!");
	new szDialog[1024], szDialog2[1524], szZone[180];
	strcat(szDialog2, "#\tDia diem\tSo huu boi\n");
	for(new j = 0; j < MAX_CLANZONES; j++) {
		if(j != 0) {
			GetPlayer3DZone2(GraffitiInfo[j][gfX], GraffitiInfo[j][gfY], GraffitiInfo[j][gfZ], szZone, sizeof(szZone));
			if(GraffitiInfo[j][gfOwned] == 0) format(szDialog, sizeof(szDialog), "%d.\t%s\tServer\n", j, szZone);
			else format(szDialog, sizeof(szDialog), "%d.\t%s\t{%s}%s{FFFFFF}\n", j, szZone, ClanInfo[GraffitiInfo[j][gfOwned]][clColor], ClanInfo[GraffitiInfo[j][gfOwned]][clName]);
			strcat(szDialog2, szDialog);
		}
	}
	Dialog_Show(playerid, DIALOG_CLANTURFS, DIALOG_STYLE_TABLIST_HEADERS, "Clan Turfs", szDialog2, "Select", "Cancel");
	return 1;
}

CMD:spray(playerid, params[]) {
	new clanid = PlayerInfo[playerid][pClan], string[180];
    if(clanid == 0) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong mot clan!");
    if(ClanDuty[playerid] == 0) return SendClientMessage(playerid,-1,"Ban khong onduty!");
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay tren xe");
    if(StartedSpray2[playerid] == 1) return 1;
	if(StartedSpray[playerid] == 0) ClanProces[playerid] = 0;	
	new hour,minute,second, year, month, day;
	gettime(hour,minute,second);
	getdate(year, month, day);
	new days[180];
	if(!(18 < hour < 22)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Chua den gio war (19-22h)");
	if(!(strcmp(days,"Tuesday",true) == 0 || strcmp(days,"Thursday",true) == 0 || strcmp(days,"Saturday",true) == 0)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Chi co the bat dau war clan vao cac ngay chan trong tuan (3-5-7)!");			
	if(hour >= 0 && hour < 8) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay trong khung gio 00-08.");		
	for(new h = 0; h < MAX_CLANZONES; h++) {
		if(IsPlayerInRangeOfPoint(playerid, 8.0, GraffitiInfo[h][gfX], GraffitiInfo[h][gfY], GraffitiInfo[h][gfZ])) {
			if(StartedSprayOn[playerid] != 0 && StartedSprayOn[playerid] != h) SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the phun len buc tuong nay!");
			else if(GraffitiInfo[h][gfOwned] == PlayerInfo[playerid][pClan]) SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Buc tuong nay thuoc so huu cua clan ban!");
			else if(CountWallSpray(h, playerid) == 1) SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Mot ai khac dang son buc tuong nay!");
			else {
				if(StartedSpray[playerid] == 0) {
					if(GraffitiInfo[h][gfOwned] == 0) format(string, sizeof(string), "Ban bat dau phun len buc tuong id %d, thuoc so huu cua clan: Server", h);
					else format(string, sizeof(string), "Ban bat dau phun len buc tuong id %d, thuoc so huu cua clan: %s", h, ClanInfo[GraffitiInfo[h][gfOwned]][clName]);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					GraffitiInfo[h][gfAttacked] = clanid;
					format(string, sizeof(string), "{%s}%s (thuoc clan %s) bat dau phun len buc tuong thuoc so huu cua clan ban (ID wall: %d).", ClanInfo[GraffitiInfo[h][gfOwned]][clColor], GetName(playerid), ClanInfo[PlayerInfo[playerid][pClan]][clName], h);
					SendClanMessage(GraffitiInfo[h][gfOwned], string);
				}
				ApplyAnimation(playerid,"SPRAYCAN","spraycan_full",4.0,0,0,0,0,0);
				PlayerPlaySound(playerid, 1134, 0.0, 0.0, 0.0);
				defer FinalProces[4000](playerid);
				StartedSpray[playerid] = 1;
				StartedSpray2[playerid] = 1;
				StartedSprayOn[playerid] = h;
			}
		}
	}
    return 1;
}
CMD:clan(playerid, params[]) {
	if(PlayerInfo[playerid][pClan] == 0) return  SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong mot clan!");
	Dialog_Show(playerid, DIALOG_CLAN_COMMAND, DIALOG_STYLE_LIST, "Clan:", "Thong tin clan\nLenh cho clan\nThanh vien trong clan\nCai dat\nTag\nXe clan", "Chon", "Dong");
	return 1;
}

CMD:sellclan(playerid, params[]) {
	if(PlayerInfo[playerid][pClan] == 0 || PlayerInfo[playerid][pClanRank] < 6) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la chu so huu clan!");
	new id, money;
	if(sscanf(params, "ui", id, money)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/sellclan <playerid/name> <money>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap!");
	if(id == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay len chinh minh!");
	if(money < 500000 || money > 10000000) return SendClientMessage(playerid, COLOR_GREY, "Mot clan co the duoc ban voi gia toi thieu la $500.000 va toi da $10,000,000.");
	if(PlayerInfo[id][pClan] != 0) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do da o trong clan!");
	if(GetPlayerCash(id) < money) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong co so tien do!");
	new string[180];
	format(string, sizeof(string), "Ban de nghi ban' cho %s (%d) clan (%s) voi gia $%s", GetName(id), id, ClanInfo[PlayerInfo[playerid][pClan]][clName], FormatNumber(money));
	MesajLung(playerid, COLOR_MONEY, string);
	new cid = PlayerInfo[playerid][pClan];
	format(string, sizeof(string), "%s (%d) muon ban' cho ban clan (%s) [%d slot, %d thanh vien, %d ngay, tag %s] voi gia' $%s", GetName(playerid), playerid, ClanInfo[PlayerInfo[playerid][pClan]][clName], ClanInfo[cid][clSlots], GetCMembers(PlayerInfo[playerid][pClan]), ClanInfo[cid][clDays], ClanInfo[cid][clTag], FormatNumber(money));
	MesajLung(id, COLOR_MONEY, string);	
	format(string, sizeof(string), "Su dung lenh (/chapnhan clan %d) de chap nhan loi de nghi.", playerid);
	SendClientMessage(id, COLOR_MONEY, string);
	SetPVarInt(id, "OfferedClan", playerid);
	SetPVarInt(id, "ClanMoney", money);
	SetPVarInt(id, "SellClan", PlayerInfo[playerid][pClan]);
	return 1;
}

CMD:clanchat(playerid, params[]) {
	new
		message[180],
		string[180],
		clanid = PlayerInfo[playerid][pClan];

	if(IsPlayerLogged[playerid] == 0) return 1;
	if(PlayerInfo[playerid][pMuted] == 1) {
		format(string, 70, "Ban khong the tro chuyen ngay bay gio! Ban bi cam chat. (%d giay)",PlayerInfo[playerid][pMuteTime]);
		SendClientMessage(playerid, COLOR_GREY, string);
		return 1;
	}	
	if(clanid == 0) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong mot clan!");
	if(sscanf(params, "s[160]", message)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/clanchat <noi dung>");
	if(togclan[playerid] == 1) return SendClientMessage(playerid, COLOR_GREY, "Ban da vo hieu hoa tro chuyen clan.");
	if(FaceReclama(message)) return Reclama(playerid, message);
	switch(PlayerInfo[playerid][pClanRank]) {
		case 1: format(string, sizeof(string), "{%s}[CLAN] %s %s: %s", ClanInfo[clanid][clColor], ClanInfo[clanid][clRankName1], GetName(playerid), message);
		case 2: format(string, sizeof(string), "{%s}[CLAN] %s %s: %s", ClanInfo[clanid][clColor], ClanInfo[clanid][clRankName2], GetName(playerid), message);
		case 3: format(string, sizeof(string), "{%s}[CLAN] %s %s: %s", ClanInfo[clanid][clColor], ClanInfo[clanid][clRankName3], GetName(playerid), message);
		case 4: format(string, sizeof(string), "{%s}[CLAN] %s %s: %s", ClanInfo[clanid][clColor], ClanInfo[clanid][clRankName4], GetName(playerid), message);
		case 5: format(string, sizeof(string), "{%s}[CLAN] %s %s: %s", ClanInfo[clanid][clColor], ClanInfo[clanid][clRankName5], GetName(playerid), message);
		case 6: format(string, sizeof(string), "{%s}[CLAN] %s %s: %s", ClanInfo[clanid][clColor], ClanInfo[clanid][clRankName6], GetName(playerid), message);
	}
	SendClanMessage(clanid, string);
	return 1;
}
CMD:cinvite(playerid, params[]) {
	new userID, string[180], clanid = PlayerInfo[playerid][pClan];
	if(IsPlayerLogged[playerid] == 0) return 1;
	if(sscanf(params, "u", userID)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/cinvite <playerid/name>");
	if(!ProxDetectorS(5.0, playerid, userID)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o gan nguoi choi do!");
	if(userID == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay len chinh minh!");
	if(!IsPlayerLogged[userID] && !IsPlayerConnected(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	if(PlayerInfo[playerid][pClan] == 0) return SendClientMessage(playerid, COLOR_WHITE, "Ban khong o trong mot clan.");
    if(PlayerInfo[playerid][pClanRank] < 5) return SendClientMessage(playerid, COLOR_WHITE, "Chi co rank 5 tro len moi co the su dung lenh nay.");
	if(PlayerInfo[userID][pClan] != 0) return SendClientMessage(playerid, COLOR_WHITE, "Nguoi choi do da o trong mot clan nao khac!");
	if(GetCMembers(PlayerInfo[playerid][pClan]) >= ClanInfo[clanid][clSlots]) return SendClientMessage(playerid, COLOR_GREY, "Clan cua ban da khong con slot.");
	if(PlayerInfo[userID][pLevel]< 2) return SendClientMessage(playerid, COLOR_WHITE, "Nguoi choi nay chua dat level 2");
	format(string, sizeof(string), "Ban da gui loi moi vao clan cho %s.", GetName(userID));
	SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
	format(string, sizeof(string), "Ban duoc moi vao clan %s voi tag %s boi %s.", ClanInfo[clanid][clName], ClanInfo[clanid][clTag], GetName(playerid));
	SendClientMessage(userID, COLOR_LIGHTBLUE, string);
	format(string, sizeof(string), "Su dung /chapnhan cinvite %d de chap nhan loi moi vao clan.", playerid);
	SendClientMessage(userID, COLOR_LIGHTBLUE, string);
	InvitedClan[userID] = clanid;
	InvitedBy[userID] = playerid;
	return 1;
}
CMD:blacklist(playerid, params[]) {
	if(PlayerInfo[playerid][pLeader] == 0) return 1;
	new szQuery[256], szstring[180], szDialog[1024], szDialog2[1024], onf, x, szTitle[180];
	format(szQuery, sizeof(szQuery), "SELECT * FROM `blacklist` WHERE `Faction`='%d'", PlayerInfo[playerid][pLeader]);
	new Cache: result = mysql_query(SQL, szQuery);
	strcat(szDialog2, "{FFB469}(+) Them nguoi choi{FFFFFF}\n");
	for(new i, j = cache_num_rows (); i != j; ++i) {
		cache_get_value_name(i, "Name", szstring);
		format(Selected[playerid][x], MAX_PLAYER_NAME, szstring);
		new userID = GetPlayerID(szstring);
		if(userID != INVALID_PLAYER_ID) {
			onf++;
			format(szDialog, sizeof(szDialog), "{13E300}%s (%d){FFFFFF}\n", szstring, userID);
			strcat(szDialog2, szDialog);
		}
		else {
			format(szDialog, sizeof(szDialog), "{FF0000}%s{FFFFFF}\n", szstring);
			strcat(szDialog2, szDialog);
		}
		x++;
	}
	cache_delete(result);
	format(szTitle, sizeof(szTitle), "Danh sach den: %d", x);
	Dialog_Show(playerid, DIALOG_BLACKLIST, DIALOG_STYLE_LIST, szTitle, szDialog2, "Select", "Back");
	return 1;
}

CMD:myblacklist(playerid, params[]) {
	new szQuery[256], szDialog[1024], szDialog2[1024], x;
	format(szQuery, sizeof(szQuery), "SELECT * FROM `blacklist` WHERE `Userid` = '%d'", PlayerInfo[playerid][pSQLID]);
	new Cache: result = mysql_query(SQL, szQuery);

	new faction, addby[180];
	strcat(szDialog2, "To chuc\tDuoc them boi\n");
	for(new i, j = cache_num_rows (); i != j; ++i)
	{
		cache_get_value_name_int(i, "Faction", faction);
		cache_get_value_name(i, "Added", addby);
		format(szDialog, 1024, "%d. %s\t%s\n", x+1, FactionName(faction), addby);
		strcat(szDialog2, szDialog);
		SelectedFaction2[playerid][x] = faction;
		x++;
	}
	cache_delete(result);
	if(x == 0) return SendClientMessage(playerid, -1, "Khong co ai nam trong danh sach den!");
	Dialog_Show(playerid, DIALOG_MYBL, DIALOG_STYLE_TABLIST_HEADERS, "My blacklist:", szDialog2, "Ok", "Iesi");
	return 1;
}
CMD:myraport(playerid, params[]) {
	if(PlayerInfo[playerid][pMember] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong phai la thanh vien cua mot to chuc!");
	new string[55], szDialog[1024];
	if(IsACop(playerid)) {
		format(string, sizeof(string), "Ruot duoi: %d\n", PlayerInfo[playerid][pCommands][0]);
		strcat(szDialog, string);	
		format(string, sizeof(string), "Bat giu: %d\n", PlayerInfo[playerid][pCommands][1]);
		strcat(szDialog, string);
		format(string, sizeof(string), "Phat tien: %d\n", PlayerInfo[playerid][pCommands][2]);
		strcat(szDialog, string);		
		format(string, sizeof(string), "Giay phep da tich thu: %d\n", PlayerInfo[playerid][pCommands][3]);
		strcat(szDialog, string);	
		format(string, sizeof(string), "Thuoc phien da tich thu: %d\n", PlayerInfo[playerid][pCommands][4]);
		strcat(szDialog, string);	
	}
	else {
		format(string, sizeof(string), "Da thuc hien cong viec: %d/%d\n", PlayerInfo[playerid][pCommands][0], GetNeedPointsR2(PlayerInfo[playerid][pRank], PlayerInfo[playerid][pMember]));
		strcat(szDialog, string);
		if(PlayerInfo[playerid][pMember] == 13) {
			format(string, sizeof(string), "Chua chay: %d\n", PlayerInfo[playerid][pFires], GetNeedPointsR2(PlayerInfo[playerid][pRank], PlayerInfo[playerid][pMember]));
			strcat(szDialog, string);		
		}
		format(string, sizeof(string), "Trang thai bao cao: %s", (GetNeedPointsR2(PlayerInfo[playerid][pRank], PlayerInfo[playerid][pMember])-PlayerInfo[playerid][pCommands] <= 0) ? ("{0DFF00}Hoan thanh{FFFFFF}") : ("{FF0000}Chua hoan thanh{FFFFFF}"));
		strcat(szDialog, string);
		if(IsAMember(playerid)) strcat(string, "Vi ban la gangster, moi lan ban tham gia war \ntren 300s ban se nhan duoc 1 diem.");
	}
	Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Bao cao", szDialog, "Ok", "");
	return 1;
}
CMD:furniture(playerid, params[]) {
	if(IsPlayerLogged[playerid] == 0) return SendClientMessage(playerid, COLOR_RED, "Ban chua dang nhap!");
	new house = PlayerInfo[playerid][pHouse];
	new bouse = PlayerInfo[playerid][pHouse];
	if(GetHouseObjects(house) == 50 && PlayerInfo[playerid][pVip] == 0) return SendClientMessage(playerid,-1,"Ban da dat toi da do noi that trong mot can nha (50/50).");
	else if(GetHouseObjects(house) == 100) return SendClientMessage(playerid,-1,"Ban da dat toi da do noi that trong mot can nha (100/100).");
	if(bouse != 999 && strcmp(GetName(playerid), HouseInfo[PlayerInfo[playerid][pHouse]][hOwner], true) == 0) {
		if(InHouse[playerid] != house) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong ngoi nha cua ban!");
		if(PlayerInfo[playerid][pWantedLevel] != 0) return SendClientMessage(playerid, -1, "Ban dang bi truy na nen khong the lam viec!");
		ShowModelSelectionMenu(playerid, furnitures, "Noi that");
	}
	return 1;
}
CMD:editfurniture(playerid, params[]) {
	new furnituress, house = PlayerInfo[playerid][pHouse],  bouse = PlayerInfo[playerid][pHouse];
	new szDialog[4000], string[180];
	if(PlayerInfo[playerid][pWantedLevel] > 0) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay vi ban dang bi truy na!");
	if(bouse != 999 && strcmp(GetName(playerid), HouseInfo[PlayerInfo[playerid][pHouse]][hOwner], true) == 0) {
        if(!IsPlayerInRangeOfPoint(playerid, 50.0, HouseInfo[bouse][hExitx], HouseInfo[bouse][hExity], HouseInfo[bouse][hExitz]) && GetPlayerVirtualWorld(playerid) != HouseInfo[bouse][hVirtual]) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong nha cua ban!");
		if(GetHouseObjects(PlayerInfo[playerid][pHouse]) == 0) return SendClientMessage(playerid, COLOR_GREY, "Khong co doi noi that trong nha!");
	    for(new i = 0; i != sizeof(FurnitureInfo); i++ ) {
	        if(FurnitureInfo[i][fiHouse] == house) {
				SelMobila[playerid][furnituress] = i;
				furnituress++;
				format(string, sizeof(string), "[#%d] %s\n", furnituress, FurnitureInfo[i][fiName]);
				strcat(szDialog, string);
	        }
	    }
	    Dialog_Show(playerid, DIALOG_EDITMOBILA, DIALOG_STYLE_LIST, "Chinh sua:", szDialog, "Chon", "Huy bo");
	}
	return 1;
}
CMD:deletefurniture(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 5) return 1;
	new houseid;
    if(sscanf(params, "i",houseid)) return SendClientMessage(playerid, COLOR_RED, "Cu phap: {FFFFFF}/deletefurniture <houseid>");
	new string[180];
    for(new i = 0; i != sizeof(FurnitureInfo); i++) {
        if(FurnitureInfo[i][fiHouse] == houseid) {
           	mysql_format(SQL, string,128,"DELETE FROM `fobjects` WHERE `ID`='%d'",i);
			mysql_query(SQL, string);
			DestroyDynamicObject(FurnitureInfo[i][fiObject]);
			FurnitureInfo[i][fiHouse] = 0;
        }
    }
    SendClientMessage(playerid, COLOR_YELLOW, "Da xoa mot mon noi that!");
	return 1;
}
CMD:fly(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;
	if(Iter_Contains(PlayerInRace, playerid) && PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong duoc phep su dung lenh nay khi ban dang o trong dau truong dua xe!");
	if(IsPlayerInAnyVehicle(playerid)) {
		new Float: x, Float:y, Float:z;
		GetVehicleVelocity(GetPlayerVehicleID(playerid), x, y, z);
		SetVehicleVelocity(GetPlayerVehicleID(playerid),x, y, z + 0.5);
		return 1;
	}
	new string[80];
	if(UsedFly[playerid] == 0) {
		StartFly(playerid);
		UsedFly[playerid] = 1;
		SetPlayerHealthEx(playerid, 100000000);
		format(string, sizeof(string), "[{B81616}AdmWarning{FFFFFF}]: %s chuyen sang fly mode.", GetName(playerid));
		SendAdminMessage(-1, string, 1);
	}
	else if(UsedFly[playerid] == 1) {
		StopFly(playerid);
		UsedFly[playerid] = 0;
		SetPlayerHealthEx(playerid, 99);
		SendClientMessage(playerid, 0xFFADADFF, "Fly mode da duoc tat.");
	}
	return 1;
}
CMD:alias(playerid, params[])
{
	new userID, playerip[36], playersip[36], count, szMessage[180], text[180];
	if(sscanf(params, "u", userID)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/alias <playerid/name>");
	if(PlayerInfo[playerid][pAdmin] < 3) return 1;
	GetPlayerIp(userID, playerip, sizeof(playerip));
	if(IsPlayerConnected(userID)) {
		foreach(new i: Player) {
			if(IsPlayerConnected(i) && IsPlayerLogged[i] == 1 && PlayerInfo[i][pAdmin] < 5) {
				GetPlayerIp(i, playersip, sizeof(playersip));
				if(!strcmp(playerip, playersip)) {
					format(text, sizeof(text), "%s %s", text, GetName(i));
					format(szMessage, 256, "* %s", text);
					count ++;
				}
			}
		}
		if(count == 1) return SendClientMessage(playerid, -1, "Nguoi choi nay khong co tai khoan truc tuyen!");
		new string[180];
		format(string, sizeof(string), "> %s, co %d nguoi choi dang ket noi tren IP nay. <", GetName(userID), count);
		SendClientMessage(playerid, COLOR_LGREEN, string);
		SendClientMessage(playerid, COLOR_LGREEN, szMessage);
		return 1;
	}
	return 1;
}
CMD:tpevent(playerid, params[]) {
	if(EventStatus == 0) return SendClientMessage(playerid, COLOR_GREY, "Khong co mot su kien hoat dong!");
	if(InEvent[playerid] == 1) return 1;
	if(JobWorking[playerid] == 1) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the tham gia su kien vi ban dang lam viec!");
	if(OnDuty[playerid] == 1) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban dang onduty!");
	if(PlayerInfo[playerid][pJailTime] != 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban dang ngoi tu!");
	if(PlayerInfo[playerid][pWantedLevel] != 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban dang bi truy na boi canh sat!");	
	if(Iter_Contains(PlayerInRace, playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban dang o trong truong dua!");
	if(PlayerInfo[playerid][pSleeping] == 1) return 1;
	if(InWar[PlayerInfo[playerid][pMember]] == 1) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban dang tham gia war!");
	if(PaintType[playerid] != 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban dang o trong paintball. (/paintleave)");
	if(Escape[playerid] == 1) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban dang vuot nguc!");
	SendClientMessage(playerid, COLOR_YELLOW, "Chao mung den voi su kien!");
	SetPlayerInterior(playerid, EventInt);
	SetPlayerVirtualWorld(playerid, EventVW);
	SetPlayerPosEx(playerid, etp[0], etp[1], etp[2]);
	SetPlayerArmourEx(playerid, 0);
	ResetWeapons(playerid);
	InHouse[playerid] = 0;
	SFID[playerid] = 0;
	return 1;
}
CMD:info(playerid, params[]) {
	if(Licitatie == 0) return SendClientMessage(playerid, -1, "Khong co mot phien dau gia dang hoat dong!");
	new id = IDLicitatie, string[180];
	switch(TipLicitatie) {
		case 1: format(string, sizeof(string), "Lan nay, chung toi se dau gia House ID %d. (/findhouse %d).", id, id);
		case 2: format(string, sizeof(string), "Lan nay, chung toi se dau gia Bizz ID %d. (/findbiz %d).", id, id);
	}
	SendClientMessage(playerid, COLOR_YELLOW, string);
	format(string, sizeof(string), "Thoi gian co san de ban co the ra gia: %s", CalculeazaTimp2(TimpLicitatie));
	SendClientMessage(playerid, COLOR_YELLOW, string);
	if(LastPlayer == INVALID_PLAYER_ID || LastPlayer == -1) format(string, sizeof(string), "Nguoi cuoi cung dat gia: Khong xac dinh | So tien: $%s", FormatNumber(TotalBani)); 
	else format(string, sizeof(string), "Nguoi cuoi cung dat gia: %s | So tien: $%s", GetName(LastPlayer), FormatNumber(TotalBani));			
	SendClientMessage(playerid, COLOR_YELLOW, string);	
	return 1;
}
CMD:auctions(playerid, params[]) {
	new szDialog[1024], szDialog2[1024];
	SendClientMessage(playerid, COLOR_LGREEN, "> Houses");
	foreach(new i: House) {
		if(strcmp(HouseInfo[i][hOwner],"The State",true) == 0 && HouseInfo[i][hOwned] == 1) {
			format(szDialog, sizeof(szDialog), "%d, ", i);
			strcat(szDialog2, szDialog);
		}
	}
	MesajLung(playerid, COLOR_LGREEN, szDialog2);
	SendClientMessage(playerid, COLOR_LGREEN, "");
	szDialog2 = "";
	
	SendClientMessage(playerid, COLOR_LGREEN, "> Businesses");
	foreach(new i : Bizs) {
		if(strcmp(BizzInfo[i][bOwner],"The State",true) == 0 && BizzInfo[i][bOwned] == 1) {
			format(szDialog, sizeof(szDialog), "%d, ", i);
			strcat(szDialog2, szDialog);
		}
	}
	MesajLung(playerid, COLOR_LGREEN, szDialog2);
	return 1;
}
CMD:bid(playerid, params[]) {
	new suma, string[180];
	if(Licitatie == 0) return SendClientMessage(playerid, -1, "Khong co mot phien dau gia dang hoat dong!");
	if(PlayerInfo[playerid][pLevel] < 3 && TipLicitatie == 1) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: De su dung lenh nay, ban can dat Level 3+!");
	if(PlayerInfo[playerid][pLevel] < 3 && TipLicitatie == 2) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: De su dung lenh nay, ban can dat Level 3+!");
	if(sscanf(params, "i", suma)) {
		SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/bid <So tien>");
		new id = IDLicitatie;
		switch(TipLicitatie) {
			case 1: format(string, sizeof(string), "Lan nay, chung toi se dau gia House ID %d. (/findhouse %d).", id, id);
			case 2: format(string, sizeof(string), "Lan nay, chung toi se dau gia Bizz ID %d. (/findbiz %d).", id, id);
		}
		SendClientMessage(playerid, COLOR_YELLOW, string);
		format(string, sizeof(string), "Thoi gian co san de ban co the ra gia: %s", CalculeazaTimp2(TimpLicitatie));
		SendClientMessage(playerid, COLOR_YELLOW, string);
		if(LastPlayer == INVALID_PLAYER_ID || LastPlayer == -1) format(string, sizeof(string), "Nguoi cuoi cung dat gia: Khong xac dinh | So tien: $%s", FormatNumber(TotalBani)); 
		else format(string, sizeof(string), "Nguoi cuoi cung dat gia: %s | So tien: $%s", GetName(LastPlayer), FormatNumber(TotalBani));			
		SendClientMessage(playerid, COLOR_YELLOW, string);	
		return 1;
	} 
	if(suma < 50000) return SendClientMessage(playerid, COLOR_GREY, "So tien it nhat la $50,000!");
	if(GetPlayerCash(playerid) < TotalBani) return SendClientMessage(playerid, -1, "Ban khong co du tien!");
	if(GetPlayerCash(playerid) < suma) return SendClientMessage(playerid, -1, "Ban khong co du tien!");
	if(suma < TotalBani+50000 && TotalBani != 0) {
		format(string, sizeof(string), "So tien khong hop le! Ban co the dat gia' it nhat $%s.", FormatNumber(TotalBani+50000));
		SendClientMessage(playerid, COLOR_GREY, string);
		return 1;
	}	
	if(TipLicitatie == 1) {
		if(PlayerInfo[playerid][pHouse] != 999 && strcmp(GetName(playerid), HouseInfo[PlayerInfo[playerid][pHouse]][hOwner], true) == 0) return SendClientMessage(playerid, COLOR_WHITE, "Ai deja o casa!");
	}
	else if(TipLicitatie == 2 && PlayerInfo[playerid][pBizz] != 255) return SendClientMessage(playerid, -1, "Ban khong the dat gia vi ban da so huu mot doanh nghiep.");
	format(string, sizeof(string), "Ban co chac chan muon dat $%s vao phien dau gia?", FormatNumber(suma));
	Dialog_Show(playerid, DIALOG_BID, DIALOG_STYLE_MSGBOX, "Server:", string, "Yes", "No");
	SelectedMoney[playerid] = suma;
	return 1;
}
CMD:acover(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;
	new name[180];
	if(sscanf(params, "s[25]",name)) return SendClientMessage(playerid, COLOR_GREY, "USAGE: {FFFFFF}/acover <name>");
	if(strlen(name) < 1 || strlen(name) > 25) return 1;
	SetPVarInt(playerid, "Cover", 1);
	SetPlayerColor(playerid, -1);
	SetPlayerScore(playerid, 3+random(2));
	SetPlayerSkinEx(playerid, 1+random(100));
	SetPlayerName(playerid, name);
    SendClientMessage(playerid, -1, "Ban dang cai trang!");
	return 1;
}
CMD:acoveroff(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;
	if(GetPVarInt(playerid, "Cover") == 0) return SendClientMessage(playerid, -1, "Ban khong cai trang!");
	SetPVarInt(playerid, "Cover", 0);
	new clanid = PlayerInfo[playerid][pClan];
	new string[35];
	SendClientMessage(playerid, -1, "Ban khong con cai trang nua!");
	if(PlayerInfo[playerid][pClan] != 0 && PlayerInfo[playerid][pTag] == 0) {
		format(string, sizeof(string), "%s%s", ClanInfo[clanid][clTag], PlayerInfo[playerid][pUsername]);
		SetPlayerName(playerid, string);
	}
	else if(PlayerInfo[playerid][pClan] != 0 && PlayerInfo[playerid][pTag] == 1) {
		format(string, sizeof(string), "%s%s", PlayerInfo[playerid][pUsername], ClanInfo[clanid][clTag]);
		SetPlayerName(playerid, string);
	}
	else SetPlayerName(playerid, PlayerInfo[playerid][pUsername]);
    SetPlayerToTeamColor(playerid);
	SetPlayerScore(playerid, PlayerInfo[playerid][pLevel]);
    if(PlayerInfo[playerid][pChar] > 0)
    {
		SetPlayerSkinEx(playerid, PlayerInfo[playerid][pChar]);
    }
    else
    {
		SetPlayerSkinEx(playerid, PlayerInfo[playerid][pModel]);
    }
	return 1;
}
CMD:colors(playerid, params[])
{
  	 new string[4000];
 	 format ( string, sizeof(string), "{FFFFFF}Mau sac:\n");
     strcat ( string, "{000000}000 {F5F5F5}001 {2A77A1}002 {840410}003 {263739}004 {86446E}005 {D78E10}006 {4C75B7}007 {BDBEC6}008 {5E7072}009");
     strcat ( string, " {46597A}010 {656A79}011 {5D7E8D}012 {58595A}013 {D6DAD6}014 {9CA1A3}015 {335F3F}016 {730E1A}017 {7B0A2A}018 {9F9D94}019");
     strcat ( string, " \n{3B4E78}020 {732E3E}021 {691E3B}022 {96918C}023 {515459}024 {3F3E45}025 {A5A9A7}026 {635C5A}027 {3D4A68}028 {979592}029");
     strcat ( string, " {421F21}030 {5F272B}031 {8494AB}032 {767B7C}033 {646464}034 {5A5752}035 {252527}036 {2D3A35}037 {93A396}038 {6D7A88}039");
     strcat ( string, " \n{221918}040 {6F675F}041 {7C1C2A}042 {5F0A15}043 {193826}044 {5D1B20}045 {9D9872}046 {7A7560}047 {989586}048 {ADB0B0}049");
     strcat ( string, " {848988}050 {304F45}051 {4D6268}052 {162248}053 {272F4B}054 {7D6256}055 {9EA4AB}056 {9C8D71}057 {6D1822}058 {4E6881}059");
     strcat ( string, " \n{9C9C98}060 {917347}061 {661C26}062 {949D9F}063 {A4A7A5}064 {8E8C46}065 {341A1E}066 {6A7A8C}067 {AAAD8E}068 {AB988F}069");
     strcat ( string, " {851F2E}070 {6F8297}071 {585853}072 {9AA790}073 {601A23}074 {20202C}075 {A4A096}076 {AA9D84}077 {78222B}078 {0E316D}079");
     strcat ( string, " \n{722A3F}080 {7B715E}081 {741D28}082 {1E2E32}083 {4D322F}084 {7C1B44}085 {2E5B20}086 {395A83}087 {6D2837}088 {A7A28F}089");
     strcat ( string, " {AFB1B1}090 {364155}091 {6D6C6E}092 {0F6A89}093 {204B6B}094 {2B3E57}095 {9B9F9D}096 {6C8495}097 {4D8495}098 {AE9B7F}099");
     strcat ( string, " \n{406C8F}100 {1F253B}101 {AB9276}102 {134573}103 {96816C}104 {64686A}105 {105082}106 {A19983}107 {385694}108 {525661}109");
     strcat ( string, " {7F6956}110 {8C929A}111 {596E87}112 {473532}113 {44624F}114 {730A27}115 {223457}116 {640D1B}117 {A3ADC6}118 {695853}119");
     strcat ( string, " \n{9B8B80}120 {620B1C}121 {5B5D5E}122 {624428}123 {731827}124 {1B376D}125 {EC6AAE}126 {000000}127");
     strcat ( string, " \n\n{FFFFFF}Mau an (dac biet):\n");
     strcat ( string, "{177517}128 {210606}129 {125478}130 {452A0D}131 {571E1E}132 {010701}133 {25225A}134 {2C89AA}135 {8A4DBD}136 {35963A}137");
     strcat ( string, " {B7B7B7}138 {464C8D}139 {84888C}140 {817867}141 {817A26}142 {6A506F}143 {583E6F}144 {8CB972}145 {824F78}146 {6D276A}147");
     strcat ( string, " \n{1E1D13}148 {1E1306}149 {1F2518}150 {2C4531}151 {1E4C99}152 {2E5F43}153 {1E9948}154 {1E9999}155 {999976}156 {7C8499}157");
     strcat ( string, " {992E1E}158 {2C1E08}159 {142407}160 {993E4D}161 {1E4C99}162 {198181}163 {1A292A}164 {16616F}165 {1B6687}166 {6C3F99}167");
     strcat ( string, " \n{481A0E}168 {7A7399}169 {746D99}170 {53387E}171 {222407}172 {3E190C}173 {46210E}174 {991E1E}175 {8D4C8D}176 {805B80}177");
     strcat ( string, " {7B3E7E}178 {3C1737}179 {733517}180 {781818}181 {83341A}182 {8E2F1C}183 {7E3E53}184 {7C6D7C}185 {020C02}186 {072407}187");
     strcat ( string, " \n{163012}188 {16301B}189 {642B4F}190 {368452}191 {999590}192 {818D96}193 {99991E}194 {7F994C}195 {839292}196 {788222}197");
     strcat ( string, " {2B3C99}198 {3A3A0B}199 {8A794E}200 {0E1F49}201 {15371C}202 {15273A}203 {375775}204 {060820}205 {071326}206 {20394B}207");
     strcat ( string, " \n{2C5089}208 {15426C}209 {103250}210 {241663}211 {692015}212 {8C8D94}213 {516013}214 {090F02}215 {8C573A}216 {52888E}217");
     strcat ( string, " {995C52}218 {99581E}219 {993A63}220 {998F4E}221 {99311E}222 {0D1842}223 {521E1E}224 {42420D}225 {4C991E}226 {082A1D}227");
     strcat ( string, " \n{96821D}228 {197F19}229 {3B141F}230 {745217}231 {893F8D}232 {7E1A6C}233 {0B370B}234 {27450D}235 {071F24}236 {784573}237");
     strcat ( string, " {8A653A}238 {732617}239 {319490}240 {56941D}241 {59163D}242 {1B8A2F}243 {38160B}244 {041804}245 {355D8E}246 {2E3F5B}247");
     strcat ( string, " \n{561A28}248 {4E0E27}249 {706C67}250 {3B3E42}251 {2E2D33}252 {7B7E7D}253 {4A4442}254 {28344E}255");
     Dialog_Show(playerid,0,DIALOG_STYLE_MSGBOX,"Vehicle Colors List", string,"Exit","");
	 return 1;
}
CMD:killcp(playerid, params[]) {
	if(CP[playerid] == 0) return SendClientMessage(playerid, -1, "Ban khong co checkpoint.");
	Dialog_Show(playerid, DIALOG_CHECKPOINT, DIALOG_STYLE_MSGBOX, "Checkpoint", "Mot cham do dang hoat dong.\nBan co muon xoa no khong? Neu muon, hay chon 'Ok'.", "Ok", "Exit");
	return 1;
}
CMD:y(playerid, params[])
{
	new string[250],result[250];
	if(PlayerInfo[playerid][pYT] == 0) return 1;
	if(sscanf(params, "s[250]",result)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/y <noi dung>");
	if(FaceReclama(result)) return Reclama(playerid, result);
	format(string, sizeof(string), "(/y) YouTuber %s: %s", GetName(playerid), result);
	foreach(new i: PlayerYoutuber) {
		if(IsPlayerConnected(i) && PlayerInfo[i][pYT] == 1) {
			MesajLung(i, 0x69C0FFFF, string);
		}
	}
	return 1;
}
CMD:vc(playerid, params[]) {
	new string[250],result[250];
	if(PlayerInfo[playerid][pVip] == 0 && PlayerInfo[playerid][pAdmin] == 0) return 1;
	if(togvip[playerid] == 1) return 1;
	if(sscanf(params, "s[250]",result)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/vc <noi dung>");
	if(FaceReclama(result)) return Reclama(playerid, result);
	if(PlayerInfo[playerid][pVip] == 1) format(string, sizeof(string), "VIP %s: %s", GetName(playerid), result);
	else format(string, sizeof(string), "Admin %s: %s", GetName(playerid), result);
	foreach(new i: Player) {
		if(IsPlayerConnected(i) && PlayerInfo[i][pVip] == 1 || PlayerInfo[i][pAdmin] > 0) {
			if(togvip[i] == 0) MesajLung(i, 0x6792A1FF, string);
		}
	}
	return 1;
}
CMD:friends(playerid, params[]) return ShowPlayerFriends(playerid);
CMD:block(playerid, params[]) {
	new id;
	if(sscanf(params, "u",id)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/block <playerid/name>");
	if(IsBlocked(playerid, id)) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi nay da bi block!");
	if(id == playerid) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong the su dung lenh nay len chinh minh!");
	format(Blocked[playerid][EmptyID(playerid)], 256, GetName(id));
	new string[180];
	format(string, sizeof(string), "Ban da chan %s (%d)! Nguoi choi nay khong the lien lac voi ban cho den lan dang nhap sau cua ban.", GetName(id), id);
	SendClientMessage(playerid, 0xFFBABAFF, string);
	return 1;
}
CMD:blocklist(playerid, params[]) {
	new x, string[180];
	SendClientMessage(playerid, -1, "-- Nguoi choi bi ban chan --");
	foreach(new i: Player) {
		if(IsPlayerConnected(i) && IsBlocked(playerid, i)) {
			format(string, sizeof(string), "%s (%d)", GetName(i), i);
			SendClientMessage(playerid, COLOR_WHITE, string);
			x++;
		}
	}
	if(x == 0) SendClientMessage(playerid, -1, "Ban khong chan nguoi choi nao!");
	else {
		format(string, sizeof(string), "Ban da chan %d nguoi.", x);
		SendClientMessage(playerid, COLOR_WHITE, string);
	}
	return 1;
}
CMD:unblock(playerid, params[]) {
	new id;
	if(sscanf(params, "u",id)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/unblock <playerid/name>");
	if(!IsBlocked(playerid, id)) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi nay khong bi chan!");
	if(id == playerid) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong the su dung lenh nay len chinh minh!");
	Blocked[playerid][IsBlocked2(playerid, id)] = "-1";
	new string[180];
	format(string, sizeof(string), "Ban da mo block cho %s (%d)! Nguoi choi nay hien da co the lien lac voi ban.", GetName(id), id);
	SendClientMessage(playerid, 0xFFBABAFF, string);
	return 1;
}
CMD:systems(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 6) return 1;
	#if defined _nex_ac_included
		SendClientMessage(playerid, X11_SPRING_GREEN, "</> "WHITE"Nex-ac dang chay nen TIN da tat mot vai muc [/anticheat].");
	#else
		SendClientMessage(playerid, -1, "Cac muc co dau (*) co nghia la AntiCheat 'luôn' duoc mo (bat/tat no de bat/tat auto kick).");
		SendClientMessage(playerid, -1, "Du la mo hay tat cac muc (*) thi anti cheat se luon kick hack khi khong co admin va helper online");
	#endif
	new szDialog[1024], string[170];
	strcat(szDialog, "Ten he thong\tTrang thai\n");
	for(new i = 0; i < MAX_SYSTEMS; i++) {
		format(string, sizeof(string), "%s\t%s\n", SystemName(i), (ServerSystem[i] == 0) ? ("{16DE00}Kich hoat") : ("{FF0000}Tat"));
		strcat(szDialog, string);	
	}
	Dialog_Show(playerid, DIALOG_SYSTEMS, DIALOG_STYLE_TABLIST_HEADERS, "Server Systems", szDialog, "Ok", "Exit");	
	return 1;
}
CMD:premium(playerid, params[]) {
	new szDialog[512];
	format(szDialog, sizeof(szDialog), 
	"Quyen loi cua tai khoan Premium:\n-Tien lai them 0,2 moi payday\n- 2 RP cu moi 5 gio online\n- So huu toi da 5 chiec xe\n\
	- So xe (/carplate) se co mau cam.\n- Quyen su dung lenh /pcolor.\n- Ban co the dat toi da 100 mon do noi that trong nha.");
	Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Quyen loi tai khoan Premium", szDialog, "Dong", "");
	return 1;
}
CMD:cw(playerid, params[]) {
    if(!IsPlayerInAnyVehicle(playerid)) return 1;
	new result[250],string[250];
	if(sscanf(params, "s[250]",result)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/cw <noi dung>");
	if(PlayerInfo[playerid][pMuted] == 1) {
		format(string, 70, "Ban khong the tro chuyen ngay bay gio! Ban bi cam chat. (%d giay)",PlayerInfo[playerid][pMuteTime]);
		SendClientMessage(playerid, COLOR_GREY, string);
		return 1;
	}
	if(FaceReclama(result)) return Reclama(playerid, result);
	format(string, sizeof(string), "(Thi tham trong xe) %s: %s", GetName(playerid), result);
	foreach(new i: Player) {
		if(IsPlayerConnected(i) && IsPlayerInVehicle(i, GetPlayerVehicleID(playerid))) SendClientMessage(i,COLOR_YELLOW, string);     
	}
	format(string, sizeof(string), "(noi tham trong xe) %s", result);
	// ChatLog(playerid, string);		
	format(string, sizeof(string), "(CW LOG) %s(%d) xe %d: %s", GetName(playerid), playerid, GetPlayerVehicleID(playerid), result);
	if(PlayerInfo[playerid][pAdmin] < 6) EarsMessage(0xFFC400FF, string);    		
    return 1;
}
CMD:endlive(playerid, params[]) {
	if(PlayerInfo[playerid][pMember] != 9) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la thanh vien cua to chuc News Reporters.");
	if(TalkingLive[playerid] == 255) return 1;
	SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Cuoc tro chuyen da ket thuc.");
	SendClientMessage(TalkingLive[playerid], COLOR_LIGHTBLUE, "* Cuoc tro chuyen da ket thuc.");
	TogglePlayerControllable(playerid, true);
	TogglePlayerControllable(TalkingLive[playerid], true);
	TalkingLive[TalkingLive[playerid]] = 255;
	TalkingLive[playerid] = 255;
	UpdateFactionRaport(playerid, 0);
	Questions = 0;
	foreach(new i: Player) {
		if(IsPlayerConnected(i) && Question[i] == 1) Question[i] = 0;
	}			
	return 1;
}
CMD:live(playerid, params[]) {
	if(PlayerInfo[playerid][pMember] != 9) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la thanh vien cua to chuc News Reporters.");
	if(TalkingLive[playerid] != 255) return SendClientMessage(playerid, COLOR_GREY, "Ban dang phat truc tiep.");
	if(PlayerInfo[playerid][pRank] < 3) return SendClientMessage(playerid, -1, "Ban can dat it nhat la rank 3 de phat truc tiep!");
	new id;
	if(sscanf(params, "u",id)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/live <playerid/name>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	if(!ProxDetectorS(5.0, playerid, id)) return SendClientMessage(playerid, -1, "Nguoi choi do khong o gan ban.");
	new hour,minute,second, year, month, day;
	gettime(hour,minute,second);
	getdate(year, month, day);	
	if(hour >= 00 && hour < 8) return SendClientMessage(playerid, COLOR_LIGHTRED, "Ban khong the su dung lenh nay trong khung gio 00-08.");				
	if(id == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay len chinh minh!");
	new sendername[25],giveplayer[25],string[128];
	GetPlayerName(id, giveplayer, sizeof(giveplayer));
	GetPlayerName(playerid, sendername, sizeof(sendername));
	format(string, sizeof(string), "**(( NR Dispatch: Reporter %s (%d) sap sua phong van voi %s (%d). ))**", GetName(playerid), playerid, GetName(id), id);
	SendClientMessage(playerid, COLOR_LIGHTBLUE, string);	
	format(string, sizeof(string), "* Ban gui loi moi phong van den %s.", giveplayer);
	SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
	format(string, sizeof(string), "* %s muon phong van truc tiep ban. (/chapnhan live %d) de chap nhan yeu cau.", sendername,playerid);
	SendClientMessage(id, COLOR_LIGHTBLUE, string);
	LiveOffer[id] = playerid;
	return 1;
}
CMD:ticket(playerid, params[]) {
	if(!IsACop(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la mot canh sat.");
	if(PlayerInfo[playerid][pMember] == 2 || PlayerInfo[playerid][pMember] == 3) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong phai la canh sat LS/LV de su dung lenh nay!");
	if(OnDuty[playerid] != 1) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong onduty!");
	new id,string[128];
	if(sscanf(params, "u",id)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/vephat <playerid/name>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	if(!ProxDetectorS(8.0, playerid, id)) return SendClientMessage(playerid, -1, "Nguoi choi do khong o gan ban.");
	if(IsACop(id)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the ghi ve phat cho mot canh sat!");	
	new szDialog[1000], title[100];
	format(title, 100, "Ticket > %s", GetName(id));
	for(new i = 0; i < 7; i++) {
		format(string, sizeof(string), "%s ($%d)\n", ticketName(i), ticketValue(i)); 
		strcat(szDialog, string);
	}
	Dialog_Show(playerid, DIALOG_TICKET, DIALOG_STYLE_LIST, title, szDialog, "Ok", "Cancel");					
	SetPVarInt(playerid, "userID", id);					
	return 1;
}
CMD:help(playerid, params[]) {
	return Dialog_Show(playerid, DIALOG_HELP, DIALOG_STYLE_LIST, "Help", 
	"Tai khoan\n\
	Lenh chung\n\
	Chat\n\
	Bank\n\
	Phuong tien\n\
	Nha\n\
	Bizz\n\
	To chuc\n\
	Lanh dao\n\
	Dien thoai\n\
	Cong viec\n\
	PIN (Coming soon)\n\
	Hanh dong (anim)\n\
	Weed/Pot\n\
	Toy\n\
	Growth Points\n\
	", "Ok", "Thoat");
}
Dialog:DIALOG_HELP(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	new szDialog[2000];
	switch(listitem) {
		case 0: {
			strcat(szDialog, "Lenh su dung thuong:\n");
			strcat(szDialog, "/thongtin - xem thong tin ca nhan cua ban.\n");
			strcat(szDialog, "/doimatkhau - thay doi mat khau.\n");
			strcat(szDialog, "/id - kiem tra id cua mot nguoi.\n");
			strcat(szDialog, "/giayphepcuatoi - xem thong tin giay phep cua ban.\n");
			strcat(szDialog, "/muacapdo - mua cap do (len cap khi ban dat du dieu kien).\n");
			strcat(szDialog, "/puthelmet (/ph) - doi/thao mu bao hiem.\n");			
			strcat(szDialog, "/hud - tuy chinh hud.\n");			
			strcat(szDialog, "/tog - tuy chinh trang thai chat.\n");			
			strcat(szDialog, "/paintleave - roi dau truong paint (tai CNN).\n");			
		}
		case 1: {
			strcat(szDialog, "Lenh chung:\n");
			strcat(szDialog, "/inv - mo tui do.\n");
			strcat(szDialog, "/baocao - bao cao su co cho admin.\n");
			strcat(szDialog, "/newbie (/n) - gui thac mac ve game cho doi ngu Helper.\n");
			strcat(szDialog, "/pay - tang tien cho nguoi choi gan ban.\n");
			strcat(szDialog, "/giochoi - kiem tra so phut ban da choi ke tu lan Payday cuoi cung.\n");
			strcat(szDialog, "/mua - mua vat pham o Shop 24/7.\n");
			strcat(szDialog, "/drink - uong mot thuc uong o quan bar.\n");
			strcat(szDialog, "/xemgiayphep - hien thi giay phep cua mot nguoi choi.\n");
			strcat(szDialog, "/chapnhan - chap nhan loi moi / giao keo.\n");
			strcat(szDialog, "/tuchoi - tu choi loi moi / giao keo.\n");
			strcat(szDialog, "/dichvu - goi mot dich vu.\n");
			strcat(szDialog, "/moiraxe - da' mot nguoi choi ra khoi xe.\n");
			strcat(szDialog, "/doxang - do xang cho xe, khi ban o gan mot cay xang.\n");
			strcat(szDialog, "/premium - de xem quyen loi cua VIP Account hoac Premium Account.\n");							
		}
		case 2: {
			strcat(szDialog, "Lenh chat:\n");
			strcat(szDialog, "/whisper (/w) - thi tham voi mot nguoi choi o gan ban.\n");
			strcat(szDialog, "/shout (/s) - het to len.\n");
			strcat(szDialog, "/ad - tao mot quang cao.\n");
			strcat(szDialog, "/f - kenh chat cua to chuc\n");
			strcat(szDialog, "/c - kenh chat cua clan.\n");
			strcat(szDialog, "/me - suy nghi cua chinh minh.\n");
			strcat(szDialog, "/do - mot hanh dong cua chinh minh.\n");
		}
		case 3: {
			strcat(szDialog, "Lenh ngan hang:\n");
			strcat(szDialog, "/taikhoan - xem thong tin tai khoan ngan hang.\n");
			strcat(szDialog, "/ruttien - rut tien tu tai khoan ngan hang cua ban.\n");
			strcat(szDialog, "/guitien - gui tien vao tai khoan ngan hang cua ban.\n");
		}
		case 4: {
			strcat(szDialog, "Lenh tuong tac voi xe:\n");
			strcat(szDialog, "/v - quan ly cac phuong tien ca nhan.\n");
			strcat(szDialog, "/swapcolors - thay doi cac mau sac voi nhau.\n");
			strcat(szDialog, "/carplate - thay doi bien so xe.\n");
			strcat(szDialog, "/dauxe - dau xe.\n");
			strcat(szDialog, "/carcolor - thay doi mau xe.\n");
			strcat(szDialog, "/khoa (hoac phim N) - khoa/mo khoa xe.\n");
			strcat(szDialog, "/sellcarto - ban xe cho mot nguoi choi khac.\n");
			strcat(szDialog, "/timxe - dinh vi xe tren ban do nho.\n");										
			strcat(szDialog, "/khoidong - khoi dong xe.\n");			
			strcat(szDialog, "/neon (bat/tat) - toggle trang thai neu xe cua ban co neon.\n");												
			strcat(szDialog, "/changeneon (25 xu neu khong co VIP) - thay mau cua neon.\n");												
			strcat(szDialog, "/vtext (25 xu, yeu cau xe VIP) - thay chu tren xe.\n");
		}
		case 5: {
			strcat(szDialog, "Lenh tuong tac voi House:\n");
			strcat(szDialog, "/housemenu - menu nha");
			strcat(szDialog, "/heal - hoi mau trong nha.\n");
			strcat(szDialog, "/noithat - xem noi that trong nha.\n");
			strcat(szDialog, "/suanoithat - chinh sua noi that trong nha.\n");			
			strcat(szDialog, "/sellhouseto - ban nha cho mot nguoi choi.\n");
			strcat(szDialog, "/sellhousetostate - ban nha cho tieu bang.\n");			
			strcat(szDialog, "/traphong - tra phong.\n");			
		}
		case 6: {
			strcat(szDialog, "Lenh tuong tac voi Doanh nghiep:\n");
			strcat(szDialog, "/bizmenu - menu doanh nghiep.");
			strcat(szDialog, "/sellbiztostate - ban doanh nghiep lai cho tieu bang.\n");		
			strcat(szDialog, "/sellbizto - ban doanh nghiep cho mot nguoi choi.\n");
		}
		case 7: {
			if(PlayerInfo[playerid][pMember] != 0)
			{
				if(IsACop(playerid))
				{
					strcat(szDialog, "Lenh cho cac tru so canh sat:\n");
					strcat(szDialog, "/duty - onduty lam viec hoac offduty.\n");
					strcat(szDialog, "/mdc - kiem tra thong tin cua nghi pham.\n");
					strcat(szDialog, "/su - truy na mot nguoi choi.\n");
					strcat(szDialog, "/so - trieu tap nghi pham o gan.\n");
					strcat(szDialog, "/batgiu - bat giu nghi pham.\n");
					strcat(szDialog, "/tazer - giat dien nghi pham.\n");
					strcat(szDialog, "/congtay - cong tay mot nghi pham.\n");
					strcat(szDialog, "/untie - coi troi cho mot nguoi choi.\n");
					strcat(szDialog, "/mocong - mo cong cho nghi pham.\n");
					strcat(szDialog, "/rb (/raidinh) - rai dinh cac kieu.\n");
					strcat(szDialog, "/lucsoat - kiem tra cac vat pham bat hop phap cua nghi pham.\n");
					strcat(szDialog, "/clear - xoa truy na cho mot nguoi choi.\n");
					strcat(szDialog, "/d - kenh chat giua cac tru so canh sat.\n");
					strcat(szDialog, "/r - chat voi cac thanh vien trong tru so.\n");
					strcat(szDialog, "/wanted - xem danh sach truy na.\n");
					strcat(szDialog, "/vephat - ghi ve phat cho mot nguoi choi pham luat.\n");
					strcat(szDialog, "/tichthu - tich thu cac vat pham bat hop phap cua nghi pham.\n");
					strcat(szDialog, "/nearwanted - xem danh sach nhung nguoi choi bi truy nao gan ban.\n");
					strcat(szDialog, "/punish - trung phat mot nguoi choi trong mot thoi gian\n");
				}
				else if(IsAMember(playerid))
				{
					strcat(szDialog, "Cac lenh trong Mafia:\n");
					strcat(szDialog, "/order - Che tao mot vu khi tu trong HQ.\n");
					strcat(szDialog, "/attack - tan cong mot dia ban.\n");
					strcat(szDialog, "/tie - troi mot nguoi choi.\n");
					strcat(szDialog, "/untie - coi troi cho mot nguoi choi.\n");
					strcat(szDialog, "/stealers - danh sach nhung nguoi an cap xe thuoc so huu cua to chuc ban\n");			
				}
				else if(IsATeacher(playerid))
				{
					strcat(szDialog, "Lenh su dung trong to chuc School Instructors:\n");
					strcat(szDialog, "/startlesson - bat dau bai hoc.\n");
					strcat(szDialog, "/stoplesson - ket thuc bai hoc.\n");	
					strcat(szDialog, "/givelicense - trao giay phep cho nguoi choi.\n");												
				}					
				else if(PlayerInfo[playerid][pMember] == 8)
				{
					strcat(szDialog, "Cac lenh su dung trong tap doan Tow Truck:\n");
					strcat(szDialog, "/tow - keo mot chiec xe.\n");
				}
				else if(PlayerInfo[playerid][pMember] == 9)
				{
					strcat(szDialog, "Cac lenh su dung trong nhom News Reporters:\n");
					strcat(szDialog, "/news - dang mot tin tuc/quang cao moi.\n");
					strcat(szDialog, "/live - phong van truc tiep mot nguoi choi.\n");
					strcat(szDialog, "/endlive - ket thuc phong van.\n");					
				}
				else if(PlayerInfo[playerid][pMember] == 11)
				{
					strcat(szDialog, "Cac lenh su dung trong hoi kin Hitman:\n");
					strcat(szDialog, "/mycontract - xem hop dong cua ban.\n");
					strcat(szDialog, "/order - che tao vu khi.\n");
					strcat(szDialog, "/gethit - nhan hop dong.\n");
					strcat(szDialog, "/leavehit - huy hop dong.\n");
					strcat(szDialog, "/contracts - xem tat ca hop dong co san.\n");
					strcat(szDialog, "/undercover - bat / tat cai trang.\n");
					
				}
				else if(PlayerInfo[playerid][pMember] == 12)
				{
					strcat(szDialog, "Lenh su dung trong to chuc Taxi:\n");
					strcat(szDialog, "/fare - set gia chay taxi.\n");
					strcat(szDialog, "/chapnhan taxi - chap nhan cuoc goi.\n");
				}
				else if(PlayerInfo[playerid][pMember] == 13)
				{
					strcat(szDialog, "Lenh su dung trong to chuc Paramedic:\n");
					strcat(szDialog, "/heal - hoi mau cho mot nguoi choi.\n");
					strcat(szDialog, "/d - kenh chat giua cac tru so canh sat.\n");
					strcat(szDialog, "/r - chat voi cac thanh vien trong tru so.\n");						
				}
				if(PlayerInfo[playerid][pMember] == 1 || PlayerInfo[playerid][pMember] == 2 || PlayerInfo[playerid][pMember] == 3) { }
				else {
					strcat(szDialog, "/f - kenh chat cua to chuc\n");			 			
				}
				strcat(szDialog, "/fdeposit - gui tien, vat lieu hoac thuoc phien vao trong ket an toan to chuc.\n");					
				strcat(szDialog, "/myraport - xem tien do cong viec to chuc.\n");					
			}
			else return SendClientMessage(playerid,COLOR_WHITE, "* Ban khong o trong mot to chuc.");
		}
		case 8: {
			if(PlayerInfo[playerid][pLeader] == 0) strcat(szDialog, "Lenh su dung cho lanh dao:\n");
			else {
				strcat(szDialog, "Lenh su dung cho lanh dao:\n");
				strcat(szDialog, "/invite - moi mot nguoi choi.\n");
				strcat(szDialog, "/members - xem cac thanh vien trong to chuc cung nhu xu ly vi pham.\n");
				strcat(szDialog, "/lc - tro chuyen giua cac nha lanh dao.\n");
				strcat(szDialog, "/setstatus - thay doi trang thai tuyen dung.\n");
				strcat(szDialog, "/blacklist (/bl) - them/xoa mot nguoi choi vao/khoi blacklist.\n");	
				strcat(szDialog, "/fwithdraw - rut tien, vat lieu, thuoc phien ra khoi ket sat.\n");	
				strcat(szDialog, "/blockfc - tat / mo kenh chat cua to chuc\n");	
				strcat(szDialog, "/lockhq - khoa / mo cua HQ\n");
			}
		}
		case 9: {
			strcat(szDialog, "Huong dan su dung dien thoai:\n");
			strcat(szDialog, "/call - goi dien cho mot nguoi choi.\n");
			strcat(szDialog, "/sms - gui tin nhan cho mot nguoi choi.\n");
			strcat(szDialog, "/p - nhac may.\n");
			strcat(szDialog, "/h - cup may.\n");
			strcat(szDialog, "/number - xem so dien thoai cua mot nguoi choi.\n");
		}
		case 10: {
			strcat(szDialog, "Cac lenh su dung trong cong viec:\n");
			strcat(szDialog, "/startwork - bat dau lam viec.\n");
			strcat(szDialog, "/stopwork - ket thuc cong viec.\n");
			strcat(szDialog, "/find - tim kiem mot nguoi choi.\n");
			strcat(szDialog, "/refill - do xang cho xe.\n");
			strcat(szDialog, "/repair - sua xe.\n");
			strcat(szDialog, "/sellmats - ban vat lieu.\n");
			strcat(szDialog, "/selldrugs - ban thuoc phien.\n");
			strcat(szDialog, "/sellgun - ban' sung'.\n");
			strcat(szDialog, "/picklock - pha' khoa' xe.\n");
		}
		case 11: {
			strcat(szDialog, "Kiem soat ma PIN:\n");
			strcat(szDialog, "/setpin - thiet lap ma pin.\n");
			strcat(szDialog, "/changepin - thay doi ma pin.\n");
			strcat(szDialog, "/loginpin - dang nhap ma pin.\n");
		}		
		case 12: {
			strcat(szDialog, "Hanh dong (update from v1.0)\n");
			strcat(szDialog, "/lifejump /robman /exhaust /carlock /rcarjack1 /lcarjack1 /rcarjack2 /lcarjack2 /hoodfrisked\n");
			strcat(szDialog, "/lightcig /tapcig /bat /lean /dancing /box /lowthrow /highthrow\n");
			strcat(szDialog, "/leftslap /handsup /fall /fallback /sup /rap /push /akick /lowbodypush\n");
			strcat(szDialog, "/spray /headbutt /pee /koface /kostomach /kiss /rollfall /lay2 /hitch\n");
			strcat(szDialog, "/beach /medic /scratch /sit /drunk /bomb /getarrested /laugh /lookout\n");
			strcat(szDialog, "/aim /crossarms /lay /hide /vomit /eating /wave /shouting /chant\n");
			strcat(szDialog, "/frisked /exhausted /injured /slapass /deal /dealstance /crack /wank /gro\n");
			strcat(szDialog, "/sit /chat /fucku /taichi /knife /basket /jumpwater\n");
			strcat(szDialog, "Hanh dong moi (theo ban cap nhat 1.1 gtavlc.com)\n");
			strcat(szDialog, "/dive /elbow /gkick /kickass /funnywalk /smokey /strip /reload /dance /walk /gwalk\n");
			strcat(szDialog, "Hoac ban co the /animlist de xem lenh de dang hon.");
		}
		case 13: {
			strcat(szDialog, "Weed/pot\n");
			strcat(szDialog, "/pickpackup /buyseeds /myseeds /mydrugs /plantseed /collectweed");
		}
		case 14: {
			strcat(szDialog, "/buytoys /selltoy /wat /dat /dt");			
		}
		case 15: {
			strcat(szDialog, "Growth Points la gi?\nLa diem dung de doi qua tren website GTAVLC.COM.\n");
			strcat(szDialog, "Growth Points lam sao de nhan duoc?\nBan hoan thanh 1 nhiem vu hang ngay se duoc 50 points Growth Points \n(toi da 3 nhiem vu hang ngay la 150 points) va diem danh hang ngay tren website GTAVLC.COM\n");
			strcat(szDialog, "Cac moc doi qua cua Growth Points gom co la gi ?\n");
			strcat(szDialog, "Se co cac moc, ban co the theo doi tai trang web GTAVLC.COM. \nMoc cang cao thi phan thuong cang lon\n");
			strcat(szDialog, "Cuoi cung chuc cac ban gianh het phan thuong\nnay va co mot ngay vui ve de tan huong server cua chung toi");
		}
	}
	Dialog_Show(playerid, DIALOG_BACK, DIALOG_STYLE_MSGBOX, "Help", szDialog, "Back", "Cancel");
	return 1;
}
Dialog:DIALOG_BACK(playerid, response, listitem, inputtext[]) 
{
	if(response) return callcmd::help(playerid, "");
	return 1;
}
CMD:stopanim(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return 1;
	if(HaveBag[playerid] == 1) return 1;
	if(InDealer[playerid] == 1) return 1;
	if(Freezed[playerid] == 1) return 1;
	if(IsPlayerFalling(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang roi!");
	ClearAnimations(playerid);
    return 1;
}
CMD:tazer(playerid, params[]) {
	if(!IsACop(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la mot canh sat.");
	if(OnDuty[playerid] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong onduty!");
	if(GetPlayerWeapon(playerid) != 24) return SendClientMessage(playerid,COLOR_GREY, "Ban can mot cay Deagle de su dung lenh nay!");
	switch(tazer[playerid]) {
		case 0: {
			tazer[playerid] = 1;
			new string[128];
			format(string, sizeof(string), "* %s trang bi sung dien.", GetName(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);				
		}
		case 1: {
			tazer[playerid] = 0;
			SendClientMessage(playerid, -1, "Tazer da duoc tat!");
		}
	}
	return 1;
}
CMD:cuff(playerid, params[]) {
    if(!IsACop(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la mot canh sat.");
	new id,string[180];
	if(sscanf(params, "u",id)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/congtay <playerid/name>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	if(IsACop(id)) return 1;
	if(OnDuty[playerid] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong onduty!");
	if(PlayerCuffed2[id] > 0) return 1;
	if(!ProxDetectorS(8.0, playerid, id)) return SendClientMessage(playerid, -1, "Nguoi choi do khong o gan ban.");
	if(id == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay len chinh minh!");
	// if(!IsPlayerInAnyVehicle(id)) return SendClientMessage(playerid, -1, "Nguoi choi do khong o tren xe, xin hay bao ho len xe.");
	// TogglePlayerControllable(id, 0);
	format(string, sizeof(string), "* %s da cong tay %s voi mot toc do ban tho.", GetName(playerid),GetName(id));
	ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	PlayerCuffed2[id] = 1;
	SetPlayerAttachedObject(id, 1, 19418, 6, -0.011000, 0.028000, -0.022000, -15.600012, -33.699977, -81.700035, 0.891999, 1.000000, 1.168000);
	SetPlayerSpecialAction(id,SPECIAL_ACTION_CUFFED);
	return 1;
}
CMD:uncuff(playerid, params[]) {
    if(!IsACop(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la mot canh sat.");
	if(OnDuty[playerid] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong onduty!");
	new giveplayerid,string[128];
	if(sscanf(params, "u",giveplayerid)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/mocong <playerid/name>");
	if(!IsPlayerConnected(giveplayerid) && giveplayerid == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	if(!ProxDetectorS(8.0, playerid, giveplayerid)) return SendClientMessage(playerid, -1, "Nguoi choi do khong o gan ban.");
	if(giveplayerid == playerid) return 1;
	if(PlayerCuffed2[giveplayerid] == 0) return 1;
	TogglePlayerControllable(giveplayerid, true);
	format(string, sizeof(string), "* %s dua chia khoa vao o va mo cong cho %s.", GetName(playerid),GetName(giveplayerid));
	ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	format(string, sizeof(string), "* Ban da duoc %s mo cong tay.", GetName(playerid));
	SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
	PlayerCuffed2[giveplayerid] = 0;
	SetPlayerSpecialAction(giveplayerid,SPECIAL_ACTION_NONE);
	RemovePlayerAttachedObject(giveplayerid,1);
	return 1;
}
CMD:skills(playerid, params[]) {
	new string[180], needp[10], skill;
	new szDialog[600];
    if(IsPlayerConnected(playerid))
    {
		// job 1
		skill = GetPlayerSkill2(playerid, 1);
		if(skill < 5) format(needp, 10, "%d", GetNeedPoints(playerid, 1));
		else needp = "-";
		format(string, sizeof(string), "* Farmer: %d (%d/%s)\n", GetPlayerSkill2(playerid, 1), PlayerInfo[playerid][pFarmerSkill], needp);
		strcat(szDialog, string);

		// job 2
		skill = GetPlayerSkill2(playerid, 2);
		if(skill < 5) format(needp, 10, "%d", GetNeedPoints(playerid, 2));
		else needp = "-";
		format(string, sizeof(string), "* Trucker: %d (%d/%s)\n", GetPlayerSkill2(playerid, 2), PlayerInfo[playerid][pTruckerSkill], needp);
		strcat(szDialog, string);

		// job 3
		skill = GetPlayerSkill2(playerid, 3);
		if(skill < 5) format(needp, 10, "%d", GetNeedPoints(playerid, 3));
		else needp = "-";
		format(string, sizeof(string), "* Grass Mower: %d (%d/%s)\n", GetPlayerSkill2(playerid, 3), PlayerInfo[playerid][pWoodSkill], needp);
		strcat(szDialog, string);

		// job 4
		skill = GetPlayerSkill2(playerid, 4);
		if(skill < 5) format(needp, 10, "%d", GetNeedPoints(playerid, 4));
		else needp = "-";
		format(string, sizeof(string), "* Car Jacker: %d (%d/%s)\n", GetPlayerSkill2(playerid, 4), PlayerInfo[playerid][pJackerSkill], needp);
		strcat(szDialog, string);

		// job 5
		skill = GetPlayerSkill2(playerid, 5);
		if(skill < 5) format(needp, 10, "%d", GetNeedPoints(playerid, 5));
		else needp = "-";
		format(string, sizeof(string), "* Arms Dealer: %d (%d/%s)\n", GetPlayerSkill2(playerid, 5), PlayerInfo[playerid][pMatSkill], needp);
		strcat(szDialog, string);
/*
		// job 6
		skill = GetPlayerSkill2(playerid, 6);
		if(skill == 1) format(needp, 10, "50");
		else if(skill == 2) format(needp, 10, "100");
		else if(skill == 3) format(needp, 10, "200");
		else if(skill == 4) format(needp, 10, "400");
		else if(skill == 5) format(needp, 10, "-");
		format(string, sizeof(string), "* Drugs Dealer: %d (%d/%s)\n", GetPlayerSkill2(playerid, 6), PlayerInfo[playerid][pDrugsSkill], needp);
		SendClientMessage(playerid, -1, string);*/

		// job 7
		skill = GetPlayerSkill2(playerid, 7);
		if(skill < 5) format(needp, 10, "%d", GetNeedPoints(playerid, 7));
		else needp = "-";
		format(string, sizeof(string), "* Mechanic: %d (%d/%s)\n", GetPlayerSkill2(playerid, 7), PlayerInfo[playerid][pMechSkill], needp);
		strcat(szDialog, string);

		// job 9
		skill = GetPlayerSkill2(playerid, 9);
		if(skill < 5) format(needp, 10, "%d", GetNeedPoints(playerid, 9));
		else needp = "-";
		format(string, sizeof(string), "* Pizza Boy: %d (%d/%s)\n", GetPlayerSkill2(playerid, 9), PlayerInfo[playerid][pPizzaSkill], needp);
		strcat(szDialog, string);
		// job 10
		skill = GetPlayerSkill2(playerid, 10);
		if(skill < 5) format(needp, 10, "%d", GetNeedPoints(playerid, 10));
		else needp = "-";
		format(string, sizeof(string), "* Chuyen phat nhanh: %d (%d/%s)\n", GetPlayerSkill2(playerid, 10), PlayerInfo[playerid][pCurierSkill], needp);
		strcat(szDialog, string);	
		
		// job 11
		skill = GetPlayerSkill2(playerid, 11);
		if(skill < 5) format(needp, 10, "%d", GetNeedPoints(playerid, 11));
		else needp = "-";
		format(string, sizeof(string), "* Cau ca: %d (%d/%s)\n", GetPlayerSkill2(playerid, 11), PlayerInfo[playerid][pFishSkill], needp);
		strcat(szDialog, string);
		
		// job 12
		/*
		skill = GetPlayerSkill2(playerid, 12);
		if(skill < 5) format(needp, 10, "%d", GetNeedPoints(playerid, 12));
		else needp = "-";
		format(string, sizeof(string), "* Phi cong: %d (%d/%s)\n", GetPlayerSkill2(playerid, 12), PlayerInfo[playerid][pPilotSkill], needp);
		strcat(szDialog, string);
		*/
		// job 13
		skill = GetPlayerSkill2(playerid, 13);
		if(skill < 5) format(needp, 10, "%d", GetNeedPoints(playerid, 13));
		else needp = "-";
		format(string, sizeof(string), "* Forklift: %d (%d/%s)\n", GetPlayerSkill2(playerid, 13), PlayerInfo[playerid][pStivuitorSkill], needp);
		strcat(szDialog, string);
		
		//job 15
		skill = GetPlayerSkill2(playerid, 14);
		if(skill < 5) format(needp, 10, "%d", GetNeedPoints(playerid, 14));
		else needp = "-";
		format(string, sizeof(string), "* Newspaper Boy: %d (%d/%s)\n", GetPlayerSkill2(playerid, 14), PlayerInfo[playerid][pNewsPaperSkill], needp);
		strcat(szDialog, string);
		
		Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Skills", szDialog, "Ok", "");
    }
    return 1;
}
CMD:creategun(playerid, params[]) {
	if(PlayerInfo[playerid][pJob] != 5) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong phai la Arms Dealer!");
	if(GetPlayerSkill(playerid) < 5) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong dat ky nang level 5!");	
	
	new result[64];
	if(sscanf(params, "s[64]", result)) {
		SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/creategun <gun name>");
		SendClientMessage(playerid, -1, "Deagle (1000), M4A4 (2000), AK47 (1500), Combat-Shotgun (5000), Rifle(3000).");
		return 1;
	}	
	if(strcmp(result,"deagle",true) == 0) {
		if(PlayerInfo[playerid][pMats] < 1000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co du vat lieu!");
		PlayerInfo[playerid][pMats] -= 1000;
		UpdateVar(playerid, "Materials", PlayerInfo[playerid][pMats]);
		ServerWeapon(playerid, 24, 50);
		SendClientMessage(playerid, COLOR_YELLOW, "Ban da tao mot Deagle voi 1000 vat lieu.");
	}
	else if(strcmp(result,"m4a4",true) == 0) {
		if(PlayerInfo[playerid][pMats] < 2000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co du vat lieu!");
		PlayerInfo[playerid][pMats] -= 2000;
		UpdateVar(playerid, "Materials", PlayerInfo[playerid][pMats]);
		ServerWeapon(playerid, 31, 120);
		SendClientMessage(playerid, COLOR_YELLOW, "Ban da tao mot M4A4 voi 2000 vat lieu.");
	}	
	else if(strcmp(result,"ak47",true) == 0) {
		if(PlayerInfo[playerid][pMats] < 1500) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co du vat lieu!");
		PlayerInfo[playerid][pMats] -= 1500;
		UpdateVar(playerid, "Materials", PlayerInfo[playerid][pMats]);
		ServerWeapon(playerid, 30, 120);
		SendClientMessage(playerid, COLOR_YELLOW, "Ban da tao mot AK47 voi 1500 vat lieu.");
	}		
	else if(strcmp(result,"combat-shotgun",true) == 0) {
		if(PlayerInfo[playerid][pMats] < 5000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co du vat lieu!");
		PlayerInfo[playerid][pMats] -= 5000;
		UpdateVar(playerid, "Materials", PlayerInfo[playerid][pMats]);
		ServerWeapon(playerid, 27, 20);
		SendClientMessage(playerid, COLOR_YELLOW, "Ban da tao mot Combat-Shotgun voi 1500 vat lieu.");
	}		
	else if(strcmp(result,"rifle",true) == 0) {
		if(PlayerInfo[playerid][pMats] < 3000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co du vat lieu!");
		PlayerInfo[playerid][pMats] -= 3000;
		UpdateVar(playerid, "Materials", PlayerInfo[playerid][pMats]);
		ServerWeapon(playerid, 33, 120);
		SendClientMessage(playerid, COLOR_YELLOW, "Ban da tao mot Rifle voi 1500 vat lieu.");
	}		
	else SendClientMessage(playerid, -1, "Deagle (1000), M4A4 (2000), AK47 (1500), Combat-Shotgun (5000), Rifle(3000).");
	return 1;
}
CMD:show(playerid, params[]) {
	new szDialog[1124], string[180];
	strcat(szDialog, "He thong\tTrang thai\n");
	// 1
	if(PlayerInfo[playerid][pShowJob] == 0) format(string, sizeof(string), "Thong tin job\t{FF0000}Tat{FFFFFF}\n");
	else format(string, sizeof(string), "Thong tin job\t{0AC917}Da kich hoat{FFFFFF}\n");
	strcat(szDialog, string);
	
	// 2
	if(PlayerInfo[playerid][pShowFP] == 0) format(string, sizeof(string), "FPS & Ping\t{FF0000}Tat{FFFFFF}\n");
	else format(string, sizeof(string), "FPS & Ping\t{0AC917}Da kich hoat{FFFFFF}\n");
	strcat(szDialog, string);
	
	// 3
	if(PlayerInfo[playerid][pShowCeas] == 0) format(string, sizeof(string), "Dong ho\t{FF0000}Tat{FFFFFF}\n");
	else format(string, sizeof(string), "Dong ho\t{0AC917}Da kich hoat{FFFFFF}\n");
	strcat(szDialog, string);	
	
	// 5
	if(PlayerInfo[playerid][pShowHP] == 0) format(string, sizeof(string), "Phan tram HP\t{FF0000}Tat{FFFFFF}\n");
	else format(string, sizeof(string), "Phan tram HP\t{0AC917}%s{FFFFFF}\n", HudName[PlayerInfo[playerid][pShowHP]]);	
	strcat(szDialog, string);
	
	// 6
	if(PlayerInfo[playerid][pShowAP] == 0) format(string, sizeof(string), "Phan tram giap\t{FF0000}Tat{FFFFFF}\n");
	else format(string, sizeof(string), "Phan tram giap\t{0AC917}%s{FFFFFF}\n", HudName[PlayerInfo[playerid][pShowAP]]);		
	strcat(szDialog, string);

	// 7
	if(PlayerInfo[playerid][pShowDMG] == 0) format(string, sizeof(string), "Damage Informer\t{FF0000}Tat{FFFFFF}\n");
	else format(string, sizeof(string), "Damage Informer\t{0AC917}Da kich hoat{FFFFFF}\n");		
	strcat(szDialog, string);			
			
	// 8
	if(togalert[playerid] == 0) format(string, sizeof(string), "DMG Alert\t{FF0000}Tat{FFFFFF}\n");
	else format(string, sizeof(string), "DMG Alert\t{0AC917}%s{FFFFFF}\n", HudName[togalert[playerid]]);		
	strcat(szDialog, string);
	
	// 9
	if(PlayerInfo[playerid][pShowCP] == 0) format(string, sizeof(string), "Khoang cach Checkpoint\t{FF0000}Tat{FFFFFF}\n");
	else format(string, sizeof(string), "Khoang cach Checkpoint\t{0AC917}Da kich hoat{FFFFFF}\n");
	strcat(szDialog, string);	
		
	// 10
	if(PlayerInfo[playerid][pShowProgress][0] == 0) format(string, sizeof(string), "Level Bar\t{FF0000}Tat{FFFFFF}\n");
	else format(string, sizeof(string), "Level Bar\t{0AC917}%s{FFFFFF}\n", HudName[PlayerInfo[playerid][pShowProgress][0]]);		
	strcat(szDialog, string);	

	/*// 11
	if(showgoal[playerid] == 0) format(string, sizeof(string), "Show Job Goal\t{FF0000}Tat{FFFFFF}\n");
	else format(string, sizeof(string), "Show Job Goal\t{0AC917}Da Bat{FFFFFF}\n");		
	strcat(szDialog, string);	*/
	
	Dialog_Show(playerid, DIALOG_SHOW, DIALOG_STYLE_TABLIST_HEADERS, "Show:", szDialog, "Ok", "Close");
	return 1;
}
CMD:questions(playerid, params[]) {
	if(PlayerInfo[playerid][pMember] != 9) return 1;
	switch(Questions) {
		case 0: {
			if(TalkingLive[playerid] == 255) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong phat truc tiep!");
			Questions = 1;
			SendClientMessage(playerid, COLOR_LGREEN, "Bay gio nguoi choi co the gui cau hoi!");
		}
		case 1: {
			Questions = 0;
			SendClientMessage(playerid, COLOR_LGREEN, "Bay gio nguoi choi khong con co the gui cau hoi!");
		}		
	}
	return 1;
}
CMD:question(playerid, params[]) {
	if(Question[playerid] == 1) return SendClientMessage(playerid, -1, "Ban khong the gui them cau hoi!");
	if(Questions == 0) return SendClientMessage(playerid, COLOR_GREY, "Hien khong co cau hoi nao!");
	if(PlayerInfo[playerid][pLevel] < 3) return SendClientMessage(playerid, COLOR_GREY, "De su dung lenh nay, ban can dat it nhat level 3!");
	new string[180], result[180];
	if(sscanf(params, "s[180]", result)) return SendClientMessage(playerid, COLOR_RED, "Cu phap: {FFFFFF}/question <text>");
	if(strlen(result) < 10) return SendClientMessage(playerid, -1, "Cau hoi qua ngan!");
	format(string, sizeof(string), "Cau hoi cua %s (%d): %s", GetName(playerid), playerid, result);
	SendFactionMessage(9, COLOR_YELLOW, string);
	Question[playerid] = 1;
	SendClientMessage(playerid, COLOR_YELLOW, "Da gui cau hoi!");
	format(QuestText[playerid], 256, result);
	return 1;
}
CMD:aq(playerid, params[]) {
	if(PlayerInfo[playerid][pMember] != 9) return 1;
	if(TalkingLive[playerid] == 255) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong o trong mot live!");
	if(Questions == 0) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the chap nhan cau hoi nao ngay bay gio!");
	new id;
	if(sscanf(params, "u", id)) return SendClientMessage(playerid, COLOR_RED, "Cu phap: {FFFFFF}/aq <playerid/name>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi khong ket noi!");
	if(Question[id] == 0) return SendClientMessage(playerid, -1, "Nguoi choi do khong dat cau hoi!");
	Question[id] = 0;
	new string[180];
	format(string, sizeof(string), "Cau hoi cua %s: %s", GetName(id), QuestText[id]);
	SCMTA(COLOR_LIGHTGREEN, string);
	return 1;
}
CMD:news(playerid, params[]) {
	if(PlayerInfo[playerid][pMember] != 9) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la thanh vien cua News Reporters.");
	new string[128];
	if(PlayerInfo[playerid][pMuted] == 1) {
		format(string, sizeof(string), "Ban dang bi chan chat. (%d giay)",PlayerInfo[playerid][pMuteTime]);
		SendClientMessage(playerid, COLOR_GREY, string);
		return 1;
	}
	new result[250];
	if(sscanf(params, "s[250]",result)) return SendClientMessage(playerid, COLOR_RED, "Cu phap: {FFFFFF}/news <text>");
	if(!FactionVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o trong mot phuong tien thuoc ve to chuc cua ban!");
	format(string, sizeof(string), "Phong vien %s: %s", GetName(playerid), result);
	OOCNews(COLOR_NEWS,string);
	UpdateFactionRaport(playerid, 0);	
	
	for(new m; m < (PlayerInfo[playerid][pVip] + 3); m++) {
		if(PlayerInfo[playerid][pDailyMission][m] == 15 || PlayerInfo[playerid][pDailyMission][m] == 16) CheckMission(playerid, m);
	}		
	return 1;
}
CMD:clothes(playerid, params[]) {
    if(!IsAtClothShop(playerid)) return SendClientMessage(playerid,COLOR_GREY, "Ban khong o trong Binco.");
	if(Escape[playerid] == 1) {
		if(PlayerInfo[playerid][pChar] > 0) SetPlayerSkinEx(playerid, PlayerInfo[playerid][pChar]);
		else SetPlayerSkinEx(playerid, PlayerInfo[playerid][pModel]);
		Escape[playerid] = 0;
		new string[130];
		format(string, sizeof(string), "Tru so: %s da tron thoat thanh cong, chung toi khong con tim thay bat cu dau vet nao ve anh ta.", GetName(playerid));
		SendTeamMessage(3, 0x2e64feFF, string);
		SendTeamMessage(2, 0x2e64feFF, string);
		SendTeamMessage(1, 0x2e64feFF, string);
		SendTeamMessage(15, 0x2e64feFF, string);
		SendClientMessage(playerid, COLOR_YELLOW, "Ban da thoat khoi truy na cua canh sat!");
		PlayerInfo[playerid][pWantedLevel] = 0;
		SetPlayerWantedLevel(playerid, 0);
		ClearCrime(playerid);
		Update(playerid,pWantedLevelx);	
		finishAchievement(playerid, 16);		
		return 1;
	}
	if(PlayerInfo[playerid][pMember] >= 1 || PlayerInfo[playerid][pLeader] >= 1)  {
		if(OnDuty[playerid] == 0 && IsACop(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong onduty!");
		ShowModelSelectionMenu (playerid, fskins[PlayerInfo[playerid][pMember]-1], "Trang phuc");	
	}
	else ShowModelSelectionMenu (playerid, skinlist, "Trang phuc");
    return 1;
}
CMD:frisk(playerid, params[]) {
	if(!IsACop(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la mot canh sat.");
	new id,string[128];
	if(sscanf(params, "u",id)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/frisk <playerid/name>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	if(!ProxDetectorS(8.0, playerid, id)) return SendClientMessage(playerid, -1, "Nguoi choi do khong o gan ban.");
	if(id == playerid) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay len chinh minh!");
	new text2[20], text4[22];
	// if(PlayerInfo[id][pDrugs] > 0) { text1 = "| Thuoc phien."; } else { text1 = "| Khong co gi."; }
	if(PlayerInfo[id][pMats] > 0) { text2 = "| Vat lieu."; } else { text2 = "| Khong co gi."; }
	if(PlayerInfo[id][pPhoneBook] > 0) { text4 = "| Danh ba dien thoai."; } else { text4 = "| Khong co gi."; }
	format(string, sizeof(string), "** Do cua %s{FFFFFF} **", GetName(id));
	SendClientMessage(playerid, COLOR_WHITE, string);
	format(string, sizeof(string), "%d gram Indica, %d gram Sativa", PlayerInfo[id][pMatuy1], PlayerInfo[id][pMatuy2]);
	//return SendClientMessage(playerid, X11_GREY_70, "[THUOC PHIEN] He thong dang duoc xay dung, hay thu lai sau.");
	SendClientMessage(playerid, 0xFFFFFFAA, string);
	format(string, sizeof(string), "%s, vat lieu: %d", text2,PlayerInfo[id][pMats]);
	SendClientMessage(playerid, 0xFFFFFFAA, string);
	format(string, sizeof(string), "%s.", text4);
	SendClientMessage(playerid, 0xFFFFFFAA, string);
	new Player_Weapons[13], Player_Ammos[13], i;
	for(i = 1;i <= 12;i++) {
		GetPlayerWeaponData(id,i,Player_Weapons[i],Player_Ammos[i]);
		if(Player_Weapons[i] != 0) {
			new weaponName[180];
			GetWeaponName(Player_Weapons[i],weaponName,255);
			format(string,255,"* %s, Vu khi:{FFFFFF} %s, Ammo:{FFFFFF} %d",GetName(id),weaponName,Player_Ammos[i]);
			SendClientMessage(playerid,0xFFFFFFAA,string);
		}
	}
	format(string, 134, "* %s da kiem tra hanh trang cua %s de tim kiem nhung vat pham bat hop phap.", GetName(playerid) ,GetName(id));
	ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    return 1;
}
CMD:bizwithdraw(playerid, params[]) return SendClientMessage(playerid, COLOR_LGREEN, "Lenh nay da duoc chuyen sang /bizmenu!");
CMD:bizfee(playerid, params[]) return SendClientMessage(playerid, COLOR_LGREEN, "Lenh nay da duoc chuyen sang /bizmenu!");
CMD:bizname(playerid, params[]) return SendClientMessage(playerid, COLOR_LGREEN, "Lenh nay da duoc chuyen sang /bizmenu!");
CMD:sellbiz(playerid, params[]) return SendClientMessage(playerid, COLOR_LGREEN, "Lenh nay da duoc chuyen sang /bizmenu!");
CMD:sellbizto(playerid, params[]) return SendClientMessage(playerid, COLOR_LGREEN, "Lenh nay da duoc chuyen sang mot lenh giao dich khac la /giaodich.");
CMD:sellbiztostate(playerid, params[]) {
	if(strlen(PlayerInfo[playerid][pPin]) != 0 && PlayerInfo[playerid][pPinLogged] == 0) {
		 SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay vi ban chua dang nhap PIN.");
		 SendClientMessage(playerid, COLOR_GREY, "De xac thuc, su dung '/loginpin'!");
		 return 1;
	}	
	if(TradeID[playerid] != -1) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the su dung lenh nay khi ban dang trong mot cuoc giao dich!");	
	new playername[25];
	GetPlayerName(playerid, playername, sizeof(playername));
	if(PlayerInfo[playerid][pBizz] == 255) return SendClientMessage(playerid, COLOR_GREY, "Ban khong so huu mot doanh nghiep.");
	Dialog_Show(playerid, DIALOG_SELLBIZ, DIALOG_STYLE_MSGBOX, "Server:", "Ban co chac muon ban' biz voi $100,000 cho nha nuoc?\nHay suy nghi ki roi bam nut 'Co', ban khong the thay doi quyet dinh nay!", "Co", "Khong");
	return 1;
}
CMD:buybiz(playerid, params[]) {
	new id, szQuery[256], newmoneys, moneys, string[256];
	if(PlayerInfo[playerid][pBizz] != 255) return SendClientMessage(playerid, COLOR_WHITE, "Ban da co mot biz! Su dung /sellbiztostate de ban' biz cu.");
	foreach(new b : Bizs) {
		if(IsPlayerInRangeOfPoint(playerid, 2.0, BizzInfo[b][bEntranceX], BizzInfo[b][bEntranceY], BizzInfo[b][bEntranceZ]) && BizzInfo[b][bBuyPrice] != 0) {
			if(PlayerInfo[playerid][pLevel] < BizzInfo[b][bLevelNeeded]) {
				format(string, sizeof(string), "Ban can dat Level %d de mua.",BizzInfo[b][bLevelNeeded]);
				SendClientMessage(playerid, COLOR_WHITE, string);
				return 1;
			}
			if(GetPlayerCash(playerid) < BizzInfo[b][bBuyPrice]) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co du tien.");
			id = GetPlayerID(BizzInfo[b][bOwner]);
			if(id != INVALID_PLAYER_ID) {
				PlayerInfo[id][pBizz] = 255;
				Update(id, pBizzx);
				PlayerInfo[id][pAccount] += BizzInfo[b][bBuyPrice];
				format(string, sizeof(string), "* %s da mua doanh nghiep cua ban voi gia {19CF2E}$%s{239931}. Tien da duoc chuyen vao tai khoan ngan hang cua ban.", GetName(playerid), FormatNumber(BizzInfo[b][bBuyPrice]));
				SendClientMessage(id, 0x239931FF, string);
				format(szQuery,sizeof(szQuery),"UPDATE users SET `Bank`='%d' WHERE `ID`='%d'",PlayerInfo[id][pAccount],PlayerInfo[id][pSQLID]);
				mysql_query(SQL,szQuery);					
			}
			else {
				format(szQuery, sizeof(szQuery), "SELECT * FROM `users` WHERE `name` = '%s'", BizzInfo[b][bOwner]);
				new Cache: result = mysql_query(SQL, szQuery);
				if(cache_num_rows() != 0) {
					cache_get_value_name_int(0, "Bank", moneys);
					newmoneys = moneys + BizzInfo[b][bBuyPrice];
				}
				cache_delete(result);
				format(szQuery, sizeof(szQuery), "UPDATE `users` SET `Bank` = '%d', `Bizz` = '255' WHERE `name` = '%s'", newmoneys, BizzInfo[b][bOwner]);
				mysql_tquery(SQL, szQuery, "", "");
			}				
			PlayerInfo[playerid][pBizz] = b;
			BizzInfo[b][bOwned] = 1;
			format(BizzInfo[b][bOwner], 256, GetName(playerid));			
			GivePlayerCash(playerid,-BizzInfo[b][bBuyPrice]);
			BizzInfo[b][bBuyPrice] = 0;
			format(szQuery,sizeof(szQuery),"UPDATE users SET `Money`='%d',`Bizz`='%d' WHERE `ID`='%d'",GetPlayerCash(playerid),PlayerInfo[playerid][pBizz],PlayerInfo[playerid][pSQLID]);
			mysql_query(SQL,szQuery);
			format(szQuery,sizeof(szQuery),"UPDATE `bizz` SET `Owned`='1',`Owner`='%s',`BuyPrice`='0' WHERE `ID`='%d'",BizzInfo[b][bOwner],b);
			mysql_query(SQL,szQuery);
			OnPropTextdrawUpdate(2,b);
			finishAchievement(playerid, 2);	
			SendClientMessage(playerid, COLOR_MONEY, "Xin chuc mung! Ban da so huu mot doanh nghiep.");
			format(string, sizeof(string), "%s da mua doanh nghiep %d voi gia $%s.", GetName(playerid), b, FormatNumber(BizzInfo[b][bBuyPrice]));
			//InsertLog(playerid, string, LOG_BIZ);
		}
	}
	return 1;
}
CMD:icecream(playerid, params[]) {
	if(InWar[PlayerInfo[playerid][pMember]] == 1) return SendClientMessage(playerid, -1, "Ban dang war nen khong the an kem.");
	if(IsAtIceStand(playerid)) {
		if(GetPlayerCash(playerid) < 100) return SendClientMessage(playerid,COLOR_GREY, "Ban khong co du tien. ($100)");
		new Float:health;
		GetPlayerHealthEx(playerid,health);
		if(health >= 75) {
			SetPlayerHealthEx(playerid, 99);
			ApplyAnimation(playerid,"FOOD","EAT_Burger", 3.0, 0, 0, 0, 0, 0);
			GivePlayerCash(playerid, -5000);
			if(PlayerInfo[playerid][pHunger] <= 95) Stamina_SetValue(playerid, 2);
		}
		else {
			SetPlayerHealthEx (playerid, health+24);
			ApplyAnimation(playerid,"FOOD","EAT_Burger", 3.0, 0, 0, 0, 0, 0);
			GivePlayerCash(playerid, -5000);
			if(PlayerInfo[playerid][pHunger] <= 95) Stamina_SetValue(playerid, 2);
		}
	}
	return 1;
}
CMD:eat(playerid, params[]) {
	if(IsPlayerInRangeOfPoint(playerid, 50.0, 377.8164,-119.4989,1001.4922) || IsPlayerInRangeOfPoint(playerid, 50.0, 371.5085,-6.9538,1001.8589) || IsPlayerInRangeOfPoint(playerid, 50.0, 377.7664,-68.4227,1001.5151)) {
		if(GetPlayerCash(playerid) < 1000) return SendClientMessage(playerid,COLOR_GREY, "Ban khong co du tien.");
		new Float:health, str[180];
		GetPlayerHealthEx(playerid,health);
		if(health >= 75) {
			SetPlayerHealthEx(playerid, 99);
			ApplyAnimation(playerid,"FOOD","EAT_Burger", 3.0, 0, 0, 0, 0, 0);
			GivePlayerCash(playerid, -1000);
			if(InBussines[playerid] != -1) {
				BizzInfo[InBussines[playerid]][bTill] += 100;
				format(str,sizeof(str),"UPDATE `bizz` SET `Till`='%d' WHERE `ID`='%d'",BizzInfo[InBussines[playerid]][bTill], InBussines[playerid]);
				mysql_query(SQL,str,false);
			}	
		}
		else {
			SetPlayerHealthEx (playerid, health+24);
			ApplyAnimation(playerid,"FOOD","EAT_Burger", 3.0, 0, 0, 0, 0, 0);
			GivePlayerCash(playerid, -1000);
			if(InBussines[playerid] != -1) {
				BizzInfo[InBussines[playerid]][bTill] += 100;
				format(str,sizeof(str),"UPDATE `bizz` SET `Till`='%d' WHERE `ID`='%d'",BizzInfo[InBussines[playerid]][bTill], InBussines[playerid]);
				mysql_query(SQL,str,false);
			}
		}
	}
	return 1;
}
CMD:goup(playerid, params[]) {
	if(!IsACop(playerid)) return SendClientMessage(playerid,COLOR_GREY, "Ban khong phai la mot canh sat.");
	if(IsPlayerInAnyVehicle(playerid)) return 1;
	if(IsPlayerInRangeOfPoint(playerid, 4.0, 1568.7828,-1690.9587,5.8906)) SetPlayerPosEx(playerid,1564.8662,-1666.4962,28.3956);
	return 1;
}
CMD:godown(playerid, params[]) {
	if(!IsACop(playerid)) return SendClientMessage(playerid,COLOR_GREY, "Ban khong phai la mot canh sat.");
	if(IsPlayerInAnyVehicle(playerid)) return 1;
	if(IsPlayerInRangeOfPoint(playerid, 4.0, 1564.8662,-1666.4962,28.3956)) SetPlayerPosEx(playerid,1568.7828,-1690.9587,5.8906);
	return 1;
}
CMD:picklock(playerid, params[]) {
    if(JobWorking[playerid] == 0 || PlayerInfo[playerid][pJob] != 4) return 1;
    if(GetPlayerSkill(playerid) != 4) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Ban can skill level 4 de su dung lenh nay!");
	if(IsPlayerInAnyVehicle(playerid)) return 1;
	new idd, car;
	car = GetClosestVehicle(playerid);
	idd = FindSpawnID(car);
	if(CarInfo[idd][Spawned] == 0) return SendClientMessage(playerid, COLOR_GREY, "Phuong tien khong hop le!");
	if(CarInfo[idd][cLock] == 0) return SendClientMessage(playerid, COLOR_GREY, "Chiec xe nay khong bi khoa!");
	if(CarInfo[idd][Userid] == PlayerInfo[playerid][pSQLID]) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Ban khong the an cap xe cua ban!");
	if(IsAFLYCar(car) || IsABOATCar(car)) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Ban khong the su dung lenh nay tren may bay/thuyen/may bay truc thang!");
	
	new engine,lights,alarm,doors,bonnet,boot,objective;
	CarInfo[idd][cLock] = 0;
	GetVehicleParamsEx(CarInfo[idd][Spawned],engine,lights,alarm,doors,bonnet,boot,objective);
	SetVehicleParamsEx(CarInfo[idd][Spawned],engine,lights,alarm,0,bonnet,boot,objective);
	new string[128];
	format(string, sizeof(string), "~w~%s~n~~g~Mo",aVehicleNames[CarInfo[idd][cModel]-400]);
	GameTextForPlayer(playerid, string, 5000, 4);
	mysql_format(SQL, string, sizeof(string), "UPDATE cars SET Lockk='%d' WHERE ID=%d", CarInfo[idd][cLock], idd);
	mysql_tquery(SQL, string, "", "");
	PlayerInfo[playerid][pWantedLevel] += 1;
	SetPlayerWantedLevel(playerid, PlayerInfo[playerid][pWantedLevel]);
	SetPlayerCriminal(playerid,255, "cuop xe");
    WantedTime[playerid] = 0;
    Update(playerid,pWantedLevelx);
	ShowWanted[playerid] = 1;	
	return 1;
}
CMD:backpack(playerid, params[]) {
	if(PlayerInfo[playerid][pBackpack] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000}[!]{FFFFFF} Ban khong co Balo!");
	if(PlayerInfo[playerid][pBackpack] == 1) {
		SetPlayerAttachedObject(playerid, 8, 3026, 1, -0.172813, -0.112569, -0.022387, 0.000000, 0.000000, 3.390071, 1.000000, 1.000000, 1.130721);
		PlayerInfo[playerid][pBackpack] = 2;
		SendClientMessage(playerid, -1, "Balo: {128C14}Da kich hoat");
	}
	else {
		RemovePlayerAttachedObject(playerid, 8);
		PlayerInfo[playerid][pBackpack] = 1;
		PlayerTextDrawHide(playerid, QuestTD);
		SendClientMessage(playerid, -1, "Balo: {D60F0F}Da huy kich hoat");
	}
	// UpdateVar(playerid, "Backpack", PlayerInfo[playerid][pBackpack]);
	return 1;
}
CMD:speed(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, COLOR_RED, "Ban khong du quyen han de su dung lenh nay");
	if(EnableBoast[playerid] == 0) {
		EnableBoast[playerid] = 1;
		SendClientMessage(playerid, -1, "Speed boost: {128C14}Mo");
	}
	else {
		EnableBoast[playerid] = 0;
		SendClientMessage(playerid, -1, "Speed boost: {D60F0F}Tat");
	}
	return 1;
}
CMD:lockhq(playerid, params[]) {
	if(PlayerInfo[playerid][pLeader] == 0) return 1;
	new i = PlayerInfo[playerid][pLeader];
	if(DynamicFactions[i][fLock] == 0) DynamicFactions[i][fLock] = 1;
	else DynamicFactions[i][fLock] = 0;
	SendClientMessage(playerid, 0xFFADADFF, "Cap nhat thanh cong!");
	Delete3DTextLabel(DynamicFactions[i][fLabel]);
	new query[128], label[128];
	format(query, sizeof(query), "UPDATE `factions` SET `Lock`='%d' WHERE `ID`='%d'", DynamicFactions[i][fLock], i);
	mysql_tquery(SQL, query, "", "");
	if(DynamicFactions[i][fLock] == 0) format(label, sizeof(label), "%s's HQ\n(da khoa)", DynamicFactions[i][fName]);
	else format(label, sizeof(label), "%s's HQ\n(khong khoa)", DynamicFactions[i][fName]);
	DynamicFactions[i][fLabel] = Create3DTextLabel(label,COLOR_WHITE,DynamicFactions[i][extX], DynamicFactions[i][extY], DynamicFactions[i][extZ],20.0, 0, 1);
	return 1;
}
CMD:minesweeper(playerid, params[]) {
	if(!IsPlayerInRangeOfPoint(playerid, 100.0, 2016.1156,1017.1541,996.875)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o casino.");
	if(GetPVarInt(playerid, "PlayMine") == 1) return 1;
	ShowCasinoTDs(playerid);
	SetPVarInt(playerid, "PlayMine", 1);
	return 1;
}
CMD:reloadstuffs(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 6) return 1;
	SendClientMessage(playerid, COLOR_YELLOW, "Loading...");
	CallRemoteFunction("LoadStuff", "");
	SendClientMessage(playerid, COLOR_YELLOW, "Successfully loaded");
	return 1;
}

CMD:spawnxe(playerid, params[]) {	
	if(!IsPlayerInRangeOfPoint(playerid, 5.0, 1796.6306,-1846.5983,13.5781)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o dia diem spawn xe.");
	if(GetPVarInt(playerid, "SpawnXe") != 0) return SendClientMessage(playerid, COLOR_GREY, "Ban da spawn mot chiec xe roi.");
	new carid = CreateVehicleEx(510, 1796.6306,-1846.5983,13.5781, 0.0,  126, 1, 300);
	XeNewbie[carid] = carid;
	PutPlayerInVehicleEx(playerid, XeNewbie[carid], 0);
	SetPVarInt(playerid, "SpawnXe", carid);
	return 1;
}

// Commands
CMD:gotoap(playerid, params[]) {
    if(PlayerInfo[playerid][pAdmin] < 1)
		return 1;
		
    new
		id;
		
    if(sscanf(params, "i", id))
		return SendClientMessage(playerid, -1, "/gotoap <apartament id>");
		
    if(id < 1 || id > 24)
		return SendClientMessage(playerid, -1, "Invalid apartament!");
    
    SetPlayerPosEx(playerid, apartamentInfo[id][apPos][0], apartamentInfo[id][apPos][1], apartamentInfo[id][apPos][2]);
    return 1;
}
CMD:asellapartament(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, COLOR_RED, "Ban khong du quyen han de su dung lenh nay");
	new i;
	if(sscanf(params, "i", i)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/asellapartament <id>");
	if(i < 1 || i > 24) return 1;

	apartamentInfo[i][apUser] = -1;
	format(apartamentInfo[i][apOwner], 32, "The State");
	apartamentInfo[i][apValue] = 10000000;
	
	update_apartament_int(i, "Value", 10000000);
    update_apartament_int(i, "UserID", -1);
    update_apartament_str(i, "Owner", "The State");
			
    refresh_label(i);

    new string[128];
    format(string, sizeof(string), "Warning: %s da ban can ho %d cho nha nuoc.", GetName(playerid), i);
    SendAdminMessage(COLOR_LIGHTRED, string, 1);
	return 1;
}
CMD:editapartament(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, COLOR_RED, "Ban khong du quyen han de su dung lenh nay");
	new result[32], code, id;
	if(sscanf(params, "iis[32]", id, code, result)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/editap(artament) <id> <code> <so luong>"), SendClientMessage(playerid, COLOR_GRAD2, "(1) User | (2) Value | (3) Lock | (4) Owner");
	if(code < 1 || code > 4) return 1;
	if(id < 1 || id > 24) return 1;
	new string[128];
	switch(code) {
		case 1: {	
			apartamentInfo[id][apUser] = strval(result);
			update_apartament_int(id, "UserID", strval(result));
			format(string, sizeof(string), "[Edit Apartament] Sua doi userID thanh %s.", result);
		}
		case 2: {	
			apartamentInfo[id][apValue] = strval(result);
			update_apartament_int(id, "Value", strval(result));
			format(string, sizeof(string), "[Edit Apartament] Gia tri duoc sua doi thanh $%s.", FormatNumber(strval(result)));
		}		
		case 3: {	
			apartamentInfo[id][apLock] = strval(result);
			update_apartament_int(id, "Lock", strval(result));
			format(string, sizeof(string), "[Edit Apartament] Trang thai mo cua/dong cua thanh %s.", result);
		}		
		case 4: {	
			format(apartamentInfo[id][apOwner], 32, result);
			update_apartament_str(id, "Owner", result);
			format(string, sizeof(string), "[Edit Apartament] Sua doi nguoi so huu thanh %s.", result);
		}						
	}
	SendClientMessage(playerid, COLOR_LGREEN, string);
	refresh_label(id);
	return 1;
}
CMD:muacanho(playerid, params[]) {
    new
		string[128];
		
    if(have_apartament(playerid) != -1)
		return SendClientMessage(playerid, -1, "Ban khong so huu mot can ho!");
				
    for(new i = 1; i < 25; i++) {
		if(IsPlayerInRangeOfPoint(playerid, 3.0, apartamentInfo[i][apPos][0], apartamentInfo[i][apPos][1], apartamentInfo[i][apPos][2])) {
			if(PlayerInfo[playerid][pLevel] < 7)
				return SendClientMessage(playerid, COLOR_GREY, "Ban can dat cap 7 de mua mot can ho.");

			if(apartamentInfo[i][apUser] != -1)
				return SendClientMessage(playerid, -1, "Can ho nay da duoc mua!");

			if(GetPlayerMoney(playerid) < apartamentInfo[i][apValue])
				return SendClientMessage(playerid, -1, "Ban khong co du tien!");
				
			apartamentInfo[i][apUser] = PlayerInfo[playerid][pSQLID];
			format(apartamentInfo[i][apOwner], 32, GetName(playerid));
			
			update_apartament_int(i, "Value", 0);
			update_apartament_int(i, "UserID", apartamentInfo[i][apUser]);
			update_apartament_str(i, "Owner", GetName(playerid));

			GivePlayerCash(playerid, -apartamentInfo[i][apValue]);
			Update(playerid, pCashx);
			format(string, sizeof(string), "Chuc mung! Ban da mua can ho nay voi gia $%s.", FormatNumber(apartamentInfo[i][apValue]));
			SendClientMessage(playerid, COLOR_YELLOW, string);
			
			apartamentInfo[i][apValue] = 0;
			refresh_label(i);
		}
    }
    return 1;
}
CMD:lockapartament(playerid, params[]) {
	if(have_apartament(playerid) == -1)
		return SendClientMessage(playerid, -1, "Ban khong so huu mot can ho!");

	new 
		id = have_apartament(playerid);

	switch(apartamentInfo[id][apLock]) {
		case 0: {
			apartamentInfo[id][apLock] = 1;
			SendClientMessage(playerid, -1, "Trang thai cua: {B30000}Da khoa");
		}
		case 1: {
			apartamentInfo[id][apLock] = 0;
			SendClientMessage(playerid, -1, "Trang thai cua: {178C03}khong khoa");
		}		
	}

	update_apartament_int(id, "Lock", apartamentInfo[id][apLock]);
	refresh_label(id);
	return 1;
}
CMD:sellapartamentto(playerid, params[]) {
    if(have_apartament(playerid) == -1)
		return SendClientMessage(playerid, -1, "Ban khong co mot can ho!");
		
    new
		id,
		money,
		i = have_apartament(playerid);

    if(sscanf(params, "ui", id, money))
		return SendClientMessage(playerid, -1, "/sellapartamentto <playerid/name> <money>");
		
    if(id == INVALID_PLAYER_ID || id == playerid)
		return SendClientMessage(playerid, -1, "Invalid player!");
		
    if(!ProxDetectorS(5.0, playerid, id))
		return SendClientMessage(playerid, -1, "Nguoi choi khong o gan ban!");
    
    if(have_apartament(id) != -1)
		return SendClientMessage(playerid, -1, "Nguoi choi do co mot can ho!");
		
    new
		string[128];
		
    format(string, sizeof(string), "* %s muon ban can ho %d voi gia $%s cho ban. (/acceptapartament %d)", GetName(playerid), i, FormatNumber(money), playerid);
    SendClientMessage(id, 0x4dad2bFF, string);
    format(string, sizeof(string), "* Loi moi da duoc gui cho %s mua can ho (%d) voi gia $%s.", GetName(id), i, FormatNumber(money));
    SendClientMessage(playerid, 0x4dad2bFF, string);
    
    SetPVarInt(id, "invitation", playerid);
    SetPVarInt(id, "money", money);
    return 1;
}
CMD:findapartament(playerid, params[]) {
	if(CP[playerid] != 0) 
		return Dialog_Show(playerid, DIALOG_CHECKPOINT, DIALOG_STYLE_MSGBOX, "Checkpoint", "Ban co mot diem mau do tren ban do kia. >_<\nBan co muon huy khong? Neu co hay chon 'Ok'.", "Ok", "Thoat");

	new 
		id;

	if(sscanf(params, "i",id)) 
		return SendClientMessage(playerid, COLOR_RED, "Cu phap: {FFFFFF}/findapartament) <id>");

	if(id < 1 || id > 24)
		return SendClientMessage(playerid, -1, "Can ho khong hop le!");

	CP[playerid] = 43;
	SetPlayerCheckpointEx(playerid, apartamentInfo[id][apPos][0], apartamentInfo[id][apPos][1], apartamentInfo[id][apPos][2], 1.0);

	new 
		string[180];
		
	format(string, sizeof(string), "Ban da dinh vi can ho (Apartment) ID %d. khoang cach: %0.2fm", id, GetPlayerDistanceFromPoint(playerid, apartamentInfo[id][apPos][0], apartamentInfo[id][apPos][1], apartamentInfo[id][apPos][2]));
	SendClientMessage(playerid, COLOR_YELLOW, string);
	return 1;
}
CMD:acceptapartament(playerid, params[]) {	
    if(GetPVarInt(playerid, "invitation") == -1)
		return SendClientMessage(playerid, -1, "Ban khong nhan duoc loi moi nao!");

    if(have_apartament(playerid) != -1)
		return SendClientMessage(playerid, -1, "Ban khong so huu mot can ho!");
		
    new
		id;
		
    if(sscanf(params, "u", id))
		return SendClientMessage(playerid, -1, "/acceptapartament <playerid/name>");

    if(id == INVALID_PLAYER_ID)
		return SendClientMessage(playerid, -1, "Invalid player!");

    if(GetPVarInt(playerid, "invitation") != id)
		return SendClientMessage(playerid, -1, "Invalid player!");

    if(!ProxDetectorS(5.0, playerid, id))
		return SendClientMessage(playerid, -1, "Nguoi choi khong o gan ban!");
		
    new
		string[128],
		i = have_apartament(id);

    if(have_apartament(id) == -1)
		return SendClientMessage(playerid, -1, "Nguoi choi do khong co mot can ho!");

    GivePlayerCash(playerid, -GetPVarInt(playerid, "money"));
    GivePlayerCash(id, GetPVarInt(playerid, "money"));
    Update(playerid, pCashx);
    Update(id, pCashx);
    apartamentInfo[i][apValue] = 0;
    apartamentInfo[i][apUser] = PlayerInfo[playerid][pSQLID];
    format(apartamentInfo[i][apOwner], 32, GetName(playerid));
    update_apartament_int(i, "Value", 0);
    update_apartament_int(i, "UserID", apartamentInfo[i][apUser]);
    update_apartament_str(i, "Owner", GetName(playerid));
			
    format(string, sizeof(string), "Chuc mung! Ban da ban can ho voi gia $%s cho %s.", FormatNumber(GetPVarInt(playerid, "money")), GetName(id));
    SendClientMessage(playerid, COLOR_YELLOW, string);
    
    format(string, sizeof(string), "Ban da mua can ho cua %s voi gia $%s.", GetName(playerid), FormatNumber(GetPVarInt(playerid, "money")));
    SendClientMessage(id, COLOR_YELLOW, string);
    
    refresh_label(i);
    
    SetPVarInt(playerid, "invitation", -1);
    return 1;
}
CMD:sellapartament(playerid, params[]) {
    if(have_apartament(playerid) == -1)
		return SendClientMessage(playerid, -1, "Ban khong co mot can ho!");
		
    new
		i = have_apartament(playerid);
		
    apartamentInfo[i][apUser] = -1;
    format(apartamentInfo[i][apOwner], 32, "The State");
    apartamentInfo[i][apValue] = 10000000;
    GivePlayerCash(playerid, 5000000);
    Update(playerid, pCashx);
    update_apartament_int(i, "Value", 10000000);
    update_apartament_int(i, "UserID", -1);
    update_apartament_str(i, "Owner", "The State");
			
    SendClientMessage(playerid, COLOR_YELLOW, "Ban da ban' can ho voi gia $5,000,000 cho nha nuoc!");
    refresh_label(i);
    return 1;
}
CMD:myapartament(playerid, params[]) {
    new
		string[128];

    if(have_apartament(playerid) == -1) SendClientMessage(playerid, -1, "Ban khong co mot can ho!");
    else {
		format(string, sizeof(string), "ID can ho cua ban la %d.", have_apartament(playerid));
		SendClientMessage(playerid, -1, string);
    }
    return 1;
}
CMD:restartmissions(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 6) return 1;
	ResetQuest();
	return 1;
}
CMD:vcar(playerid, params[])
{
	new string[128];
	if(PlayerInfo[playerid][pVip] < 1) return SendClientMessage(playerid, -1, "Ban can phai co VIP moi su dung duoc lenh");
	if(timeVCarSpawn[playerid] >= 1) {
		format(string, 56, "Ban phai doi %d giay de co the su dung lenh /vcar!", timeVCarSpawn[playerid]);
		SendClientMessage(playerid, -1, string);
		return 1;
	}
	if(lastVCarSpawn[playerid] != -1)
	{
		DestroyVehicle(lastVCarSpawn[playerid]);
		Carspawn[lastVCarSpawn[playerid]] = -1;
		lastVCarSpawn[playerid] = -1;
	}
	new
		Float:x,
		Float:y,
		Float:z,
		Float:a,
		carid;

	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, a);

	switch(PlayerInfo[playerid][pVip])
	{
		case 1 : {
			carid = CreateVehicle(461, x, y + 2, z, a, 0, 0, 0);
		}
		case 2:{
			carid = CreateVehicle(562, x, y + 2, z, a, 0, 0, 0);
		}
		case 3: {
			carid = CreateVehicle(560, x, y + 2, z, a, 0, 0, 0);
			
		}
	}
	Gas[carid] = 100;
	Carspawn[carid] = carid;
	lastVCarSpawn[playerid] = carid;

	if(GetPlayerInterior(playerid) != 0)
		LinkVehicleToInterior(carid, GetPlayerInterior(playerid));

	if(GetPlayerVirtualWorld(playerid) != 0)
		SetVehicleVirtualWorld(carid, GetPlayerVirtualWorld(playerid));
	timeVCarSpawn[playerid] = 5;
	return 1;
}



CMD:setjobcuangay(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 6) return 1;
	new jobid;
	if(sscanf(params, "i",jobid)) return SendClientMessage(playerid, COLOR_RED, "Cu phap: {FFFFFF}/setjobcuangay <Job ID>");
	if(jobid < 1 || jobid > jobss) return SendClientMessage(playerid, -1, "ID khong hop le! (1-15)");
	SetTodayJob(jobid);
	return 1;
}
CMD:noooc(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] > 1)
	{
		if (!noooc)
		{
			noooc = 1;
			SCMTA(COLOR_GAMEGTA, "Kenh chat OOC Da Tat!");
		}
		else
		{
			noooc = 0;
			SCMTA(COLOR_GAMEGTA, "Kenh chat OOC Chat Da Mo!");
			SCMTA(COLOR_GAMEGTA, "Su dung lenh '/o' de noi chuyen");
		}
	}
	else
	{
		SendClientMessage(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}
// CMD:resetdailybonus(playerid, params[]) {
// 	if(PlayerInfo[playerid][pAdmin] < 7) return 1;
// 	ResetDailyBonus();
// 	return 1;
// }
// CMD:missions(playerid, params[]) {
// 	showMissions(playerid, 0);
// 	return 1;
// }
// CMD:achievements(playerid, params[]) {
// 	new szDialog[100], szDialog2[2000];
// 	for(new i = 0; i < 32; i++) {
// 		format(szDialog, sizeof(szDialog), "{FFFFFF}%s: %s\n", achievementNames(i), (PlayerInfo[playerid][pAchievementStatus][i] == 1) ? ("{3DBF0A}xong{FFFFFF}") : ("{CC0E0E}chua xong{FFFFFF}"));
// 		strcat(szDialog2, szDialog);
// 	}
// 	Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Thanh tuu:", szDialog2, "Ok", "");
// 	return 1;
// }
CMD:code(playerid, params[]) return Dialog_Show(playerid, DIALOG_CODE, DIALOG_STYLE_INPUT, ""SERVER_NAME" SYSTEM: GiftCode", "Nhap vao khung duoi:", "Submit", "Huy bo");
CMD:leaverace(playerid, params[]) {
	if(!Iter_Contains(PlayerInRace, playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong o trong dau truong dua xe!");
	LeaveRaceArena(playerid);
	return 1;
}
CMD:me(playerid,params[])
{
    if(IsPlayerConnected(playerid))
    {
    	if(DeelayCommand[playerid][2] > 0) return DeelayTime(playerid, 2);
		new string[250],result[250],sendername[25];
		if(PlayerInfo[playerid][pMuted] == 1) {
			format(string, sizeof(string), "Ban dang bi chan chat. (%d giay)",PlayerInfo[playerid][pMuteTime]);
			SendClientMessage(playerid, COLOR_GREY, string);
			return 1;
		}
		DeelayCommand[playerid][2] = 2;
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(sscanf(params, "s[250]",result)) return SendClientMessage(playerid, COLOR_GREY, "Su dung{FFFFFF} /me [action]");
		format(string, sizeof(string), "* (/me) %s %s", sendername, result);
		ProxDetector(12.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		/*
		new var100[300],resulttt[300],strr[300];
		format(strr, sizeof(strr),"* %s %s", sendername, result);
		mysql_escape_string(strr, resulttt);
		mysql_format(SQL,var100, sizeof(var100), "INSERT INTO chat_logs (`playerid`,`text`,`where`) VALUES ('%d','%s','me')", PlayerInfo[playerid][pSQLID], resulttt);
		mysql_tquery(SQL,var100,"","");*/
	}
	return 1;
}
CMD:do(playerid,params[])
{
	if(IsPlayerConnected(playerid))
	{
		if(DeelayCommand[playerid][2] > 0) return DeelayTime(playerid, 2);
		new string[250],result[250],sendername[25];
		if(PlayerInfo[playerid][pMuted] == 1) {
			format(string, sizeof(string), "Ban dang bi chan chat. (%d giay)",PlayerInfo[playerid][pMuteTime]);
			SendClientMessage(playerid, COLOR_GREY, string);
			return 1;
		}
		DeelayCommand[playerid][2] = 2;
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(sscanf(params, "s[250]",result)) return SendClientMessage(playerid, COLOR_GREY, "Su dung{FFFFFF} /do [action]");
		format(string, sizeof(string), "* %s (( %s )) ", result, sendername);
		ProxDetector(12.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		// ChatLog(playerid, string);
		/*
		new var100[300],resulttt[300],strr[300];
		format(strr, sizeof(strr),"* %s (( %s ))", result, sendername);
		mysql_escape_string(strr, resulttt);
		mysql_format(SQL,var100, sizeof(var100), "INSERT INTO chat_logs (`playerid`,`text`,`where`) VALUES ('%d','%s','do')", PlayerInfo[playerid][pSQLID], resulttt);
		mysql_tquery(SQL,var100,"","");*/
	}
	return 1;
}
CMD:fillup(playerid, params[]) {
    if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return 1;
	if(GetPVarInt(playerid, "Engine") != 0) return SendClientMessage(playerid,-1, "Xin hay tat dong co.");
	if(GetGasStationID(playerid) == -1) return SendClientMessage(playerid,COLOR_GREY, "Ban khong o cay xang.");
	new idcar = GetPlayerVehicleID(playerid),fillgas,procent,fillupmon,string[100];
	if(sscanf(params, "i", fillgas)) return SendClientMessage(playerid,COLOR_GREY, "Su dung: {FFFFFF}/fillup <phan tram gas>");
	procent = fillgas + Gas[idcar];
	fillupmon = GasMax - Gas[idcar];
	fillupmon = fillupmon * 100;
	if(GetPlayerCash(playerid) < fillupmon) return SendClientMessage(playerid,COLOR_GREY, "Ban khong co du tien!");
	if(procent >= 100) return SendClientMessage(playerid,COLOR_LGREEN, "Binh xang da day!");
	TogglePlayerControllable(playerid, false);
	Gas[idcar] += fillgas;
	BizzInfo[GetGasStationID(playerid)][bTill] += fillupmon;
	GivePlayerCash(playerid, - fillupmon);
	format(string, sizeof(string), "Ban da do %d phan tram vao binh xang, va ban tra %s$.", fillgas, FormatNumber(fillupmon));
	SendClientMessage(playerid,COLOR_LIGHTBLUE,string);
	TogglePlayerControllable(playerid, true);
	Update(playerid, pCashx);
	new query[184];
	format(query,sizeof(query),"UPDATE `bizz` SET `Till`='%d' WHERE `ID`='%d'", BizzInfo[GetGasStationID(playerid)][bTill], GetGasStationID(playerid));
	mysql_query(SQL, query, false);
    return 1;
}
CMD:stats(playerid, params[]) return ShowStats(playerid,playerid);

// CMD:matxe(playerid, params[]) {
// 	new query[200], str[500];
// 	format(query, sizeof(query), "SELECT * FROM cars WHERE Owner='%s'", PlayerInfo[playerid][pUsername]);
// 	new Cache:x = mysql_query(SQL, query), rows = cache_num_rows(), i;
// 	if(rows == 0) {
// 		cache_delete(x);
// 		return 1;
// 	}
// 	strcat(str, "ID xe\tTen xe\tGia tri\n");
// 	while(i < rows) {
// 		new carSQLID, carModel, carValue;
// 		cache_get_value_name_int(i, "ID", carSQLID);
// 		cache_get_value_name_int(i, "Model", carModel);
// 		cache_get_value_name_int(i, "Value", carValue);

// 		format(str, sizeof(str), "%s%d\t%s\t%s\n", str, carSQLID, aVehicleNames[carModel-400], FormatNumber(carValue));
// 		i++;
// 	}
// 	Dialog_Show(playerid, MAT_XE, DIALOG_STYLE_TABLIST_HEADERS, "Refund xe da bi mat", str, "Ok", "Close");
// 	cache_delete(x);
// 	return 1;
// }
// Dialog:MAT_XE(playerid, response, listitem, inputtext[]) {
// 	if(!response) return 1;
// 	new carSQLID = strval(inputtext);
// 	if(carSQLID == 0) return 1;
// 	// Kiem tra
// 	for(new i = 0; i < 10; i++) {
// 		if(PlayerInfo[playerid][pCarKey][i] == carSQLID) return SendClientMessage(playerid, -1, "Ban khong bi mat xe nay.");
// 	}
// 	// Tim slot trong va load xe
// 	for(new i = 0; i < 10; i++) {
// 		if(PlayerInfo[playerid][pCarKey][i] == 0) {
// 			PlayerInfo[playerid][pCarKey][i] = carSQLID;
// 			new string[200];
// 			mysql_format(SQL, string, sizeof(string), "UPDATE users SET CarKey%d='%d' WHERE id=%d LIMIT 1", i+1, carSQLID, PlayerInfo[playerid][pSQLID]);
// 			mysql_query(SQL, string, false);
// 			LoadPlayerCars(playerid);
// 			SendStaffMessage(COLOR_GOLD, string);
// 			return 1;
// 		}
// 	}
// 	return 1;
// }
// CMD:denbubaotri(playerid, params[]) {
// 	new string[180],item[180],query[256];
// 		if(PlayerInfo[playerid][pGiftcode] == 1) return SendClientMessage(playerid, COLOR_WHITE, "Ban da kick hoat giftcode den bu bao tri");
// 		if(PlayerInfo[playerid][pGiftcode] == 0) 
// 		{
// 			GTAFUN[playerid] = 1;
// 			format(query, sizeof(query),"UPDATE `users` SET `GiftCode` = '1' WHERE `Name` = '%s'", GetName(playerid));
// 			mysql_tquery(SQL, query, "", "");
// 			format(string, sizeof(string), "{He Thong}: {FFFFFF}%s da nhan giftcode den bu", GetName(playerid));
// 			SendAdminMessage(COLOR_LIGHTRED, string,1);
// 			GivePlayerCash(playerid, 100000);
// 			PlayerInfo[playerid][pGiftcode] = 1;
// 			PlayerInfo[playerid][pLevel] += 2;
// 			PlayerInfo[playerid][pDiemUyTin] += 100;
// 			Update(playerid, pLevelx);
// 			Update(playerid, pDiemUyTinx);
// 			SetPlayerScore(playerid, PlayerInfo[playerid][pLevel]);
// 			ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "QUA TANG", "Ban da nhan giftcode 1 voi cac phan qua\n100,000$, 2 level, 100 diem uy tin DE KHOI NGHIEP CHUC BAN VUI VE", "OK", "KHONG HIEU"); 
// 		}
// 		return 1;	
// 	}
