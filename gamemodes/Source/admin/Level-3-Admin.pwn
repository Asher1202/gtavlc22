CMD:givegun(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 3) return SendClientMessage(playerid,COLOR_WHITE, AdminOnly);
	new id,gun,ammo,string[100],sendername[30],giveplayer[30];
	if(sscanf(params, "uii",id,gun,ammo)) return SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/givegun <Nume/ID> <Weapon ID> <Gloante>");
	if(gun < 1||gun > 46||gun==19||gun==20||gun==21||gun==45) return SendClientMessage(playerid,COLOR_WHITE,"Invalid weapond ID.");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	if(PlayerInfo[id][pGunLic] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "[ERROR] Nguoi choi do khong co giay phep sung.");
	ServerWeapon(id, gun, ammo);
	GetPlayerName(id, giveplayer, sizeof(giveplayer));
	GetPlayerName(playerid, sendername, sizeof(sendername));
	new gunname[32];
	GetWeaponName(gun, gunname, 32);
	format(string, sizeof(string), "AdmCmd: %s dua cho %s vu khi %s (%d ammo).",sendername,giveplayer,gunname, ammo);
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(COLOR_LOGS, string,3);
	if(GetPlayerState(id) == PLAYER_STATE_PASSENGER) {
		new gun2,tmp;
		GetPlayerWeaponData(id,5,gun2,tmp);
		#pragma unused tmp
		if(gun2)SetPlayerArmedWeapon(id,gun2);
		else SetPlayerArmedWeapon(id,0);
	}
	return 1;
}
CMD:disarmrange(playerid, params[]) {
    if(PlayerInfo[playerid][pAdmin] < 3) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new range,string[100], Float:x, Float:y, Float:z;
	if(sscanf(params, "i", range)) return SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/disarmrange <Range>");
	foreach(new i: Player)  {
		if(IsPlayerInRangeOfPoint(i,range*1000,x,y,z)) ResetWeapons(i);
	}
	format(string, sizeof(string), "AdmCmd: %s da tich thu vu khi cua tat ca nguoi choi trong ban kinh %dm.", GetName(playerid),range);
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(COLOR_LOGS, string,3);
	return 1;
}
CMD:getcar(playerid, params[]) {
    if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new plo;
	if(sscanf(params, "i",plo)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/getcar <vehicleid>>");
	new Float:plocx,Float:plocy,Float:plocz;
	GetPlayerPos(playerid, plocx, plocy, plocz);
	SetVehiclePosEx(playerid, plo,plocx,plocy+4, plocz);
	SetVehicleVirtualWorld(plo, GetPlayerVirtualWorld(playerid));
	new string[100];
	format(string, sizeof(string), "Ban da dich chuyen xe %d den ban.", plo);
	SendClientMessage(playerid, COLOR_GRAD1, string);
	return 1;
}
CMD:scrambleevent(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 3) return SendClientMessage(playerid, COLOR_GREY, AdminOnly);
    new reaction[64], reward, len;
    if(TEvent != 0) return SendClientMessage(playerid, COLOR_GREY, "Mot event dang hoat dong, su dung /canecel event de ket thuc no'.");
    if(sscanf(params, "is[64]", reward, reaction)) return SendClientMessage(playerid, COLOR_RED, "/scrambleevent [reward] [words]");
    if(reward < 1 || reward > 30000) return SendClientMessage(playerid, COLOR_GREY, "Phan thuong khong the lon hon 30.000$.");
    format(FastEventText, sizeof(FastEventText), "%s", reaction), len = strlen(FastEventText), strscramble(reaction, reaction, len, len);      
    TEventReward = reward, TEvent = 2;
    SCMTA(0xADD63CFF, sprintf("Scramble Event: The first one who will guess the scrambled words of ''{FFA200}%s{ADD63C}'' se chien thang %s$.", reaction, FormatNumber(reward)));
    return 1;
}
CMD:mathevent(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 3) return SendClientMessage(playerid, COLOR_GREY, AdminOnly);
    if(TEvent != 0) return SendClientMessage(playerid, COLOR_GREY, "Mot event dang hoat dong, su dung /canecel event de ket thuc no'.");
    RandomMathEvent();
    return 1;
}
CMD:trivia(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 3) return SendClientMessage(playerid, COLOR_GREY, AdminOnly);
    new question[80], answer[16], reward;
    if(TEvent != 0) return SendClientMessage(playerid, COLOR_GREY, "Mot event dang hoat dong, su dung /canecel event de ket thuc no'.");
    if(sscanf(params, "is[16]s[80]", reward, answer, question)) return SendClientMessage(playerid, COLOR_RED, "/trivia [reward] [answer] [question]");
    if(reward < 1 || reward > 30000) return SendClientMessage(playerid, COLOR_GREY, "Phan thuong khong the lon hon 30.000$.");
    format(TriviaText, sizeof(question), "%s", question), format(FastEventText, sizeof(answer), "%s", answer);
    TEventReward = reward, TEvent = 4;
    new string[250];
    format(string, sizeof(string), "Trivia Event: Question: ''{FFA200}%s{ADD63C}''. Tra loi bang cach bam T va nhap dap an, phan thuong: %s$.", question, FormatNumber(reward));
	foreach(new i: Player) {
		if(IsPlayerLogged[i] == 1) {
			MesajLung(i, 0xADD63CFF, string);
		}
	}
    return 1;
}
CMD:mark(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 3) return 1;
	GetPlayerPos(playerid, TeleportDest[playerid][0],TeleportDest[playerid][1],TeleportDest[playerid][2]);
	SendClientMessage(playerid, COLOR_LGREEN, "Vi tri da duoc danh dau.");
	return 1;
}
CMD:mar1(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;
	GetPlayerPos(playerid, TeleportDest[playerid][0],TeleportDest[playerid][1],TeleportDest[playerid][2]);
	SendClientMessage(playerid, COLOR_LGREEN, "Vi tri da duoc danh dau.");
	return 1;
}

CMD:gotomark(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 3) return 1;
	if(TeleportDest[playerid][0] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "Ban chua danh dau vi tri.");
	if(GetPlayerState(playerid) == 2) SetVehiclePosEx(playerid, GetPlayerVehicleID(playerid), TeleportDest[playerid][0],TeleportDest[playerid][1],TeleportDest[playerid][2]);
	else SetPlayerPosEx(playerid, TeleportDest[playerid][0],TeleportDest[playerid][1],TeleportDest[playerid][2]);
	SendClientMessage(playerid, COLOR_WHITE, "Ban da dich chuyen thanh cong.");
	SetPlayerInterior(playerid,0);
	return 1;
}
CMD:gotomar1(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return 1;
	if(TeleportDest[playerid][0] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "Ban chua danh dau vi tri.");
	if(GetPlayerState(playerid) == 2) SetVehiclePosEx(playerid, GetPlayerVehicleID(playerid), TeleportDest[playerid][0],TeleportDest[playerid][1],TeleportDest[playerid][2]);
	else SetPlayerPosEx(playerid, TeleportDest[playerid][0],TeleportDest[playerid][1],TeleportDest[playerid][2]);
	SendClientMessage(playerid, COLOR_WHITE, "Ban da dich chuyen thanh cong.");
	SetPlayerInterior(playerid,0);
	return 1;
}

CMD:gotocar(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 3) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new testcar,string[128];
	if(sscanf(params, "d",testcar)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/gotocar <Car ID>");
	new Float:cwx2,Float:cwy2,Float:cwz2;
	GetVehiclePos(testcar, cwx2, cwy2, cwz2);
	if(GetPlayerState(playerid) == 2) SetVehiclePosEx(playerid, GetPlayerVehicleID(playerid), cwx2, cwy2, cwz2);
	else SetPlayerPosEx(playerid, cwx2, cwy2, cwz2);
	SetPlayerInterior(playerid,0);
	SetPlayerVirtualWorld(playerid,0);
	format(string, sizeof(string), "Ban dich chuyen den {7BAABA}phuong tien %d{FFFFFF}.", testcar);
	SendClientMessage(playerid, COLOR_WHITE, string);
	InHQ[playerid] = -1;
	InHouse[playerid] = -1;
	InBussines[playerid] = -1;	
	return 1;
}
CMD:gotocar12(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new testcar,string[128];
	if(sscanf(params, "d",testcar)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/gotocar <Car ID>");
	new Float:cwx2,Float:cwy2,Float:cwz2;
	GetVehiclePos(testcar, cwx2, cwy2, cwz2);
	if(GetPlayerState(playerid) == 2) SetVehiclePosEx(playerid, GetPlayerVehicleID(playerid), cwx2, cwy2, cwz2);
	else SetPlayerPosEx(playerid, cwx2, cwy2, cwz2);
	SetPlayerInterior(playerid,0);
	SetPlayerVirtualWorld(playerid,0);
	format(string, sizeof(string), "Ban dich chuyen den {7BAABA}phuong tien %d{FFFFFF}.", testcar);
	SendClientMessage(playerid, COLOR_WHITE, string);
	InHQ[playerid] = -1;
	InHouse[playerid] = -1;
	InBussines[playerid] = -1;	
	return 1;
}
CMD:setyt(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 3) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new id,string[180], lvl;
	if(sscanf(params, "ui",id, lvl)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/setyt <playerid/name> <level (0/1)>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong dang nhap.");
	
	if(lvl > 0) {
		PlayerInfo[id][pYT] = 1;
		format(string, sizeof(string), "Ban da duoc thiet lap tro thanh Youtuber boi %s.", GetName(playerid));
		SendClientMessage(id, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "Ban da thiet lap %s tro thanh YouTuber.", GetName(id));
		SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
	}
	else {
		PlayerInfo[id][pYT] = 0;
		format(string, sizeof(string), "Ban da bi xoa khoi team Youtuber boi %s.", GetName(playerid));
		SendClientMessage(id, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "Ban da xoa %s khoi team Youtuber.", GetName(id));
		SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
	}
	
	Iter_Add(PlayerYoutuber, id);

	format(string, sizeof(string), "AdmCmd: %s thiet lap %s vao team YouTuber.", GetName(playerid),GetName(id));
	SendAdminMessage(COLOR_LOGS, string,4);
	
	new query[128];
	format(query,sizeof(query),"UPDATE users SET `Youtuber`='%d' WHERE `ID`='%d'",PlayerInfo[id][pYT],PlayerInfo[id][pSQLID]);
	mysql_query(SQL,query,false);
	return 1;
}
CMD:rac(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 3) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
 	new string[180];
 	SetTimer("RACtime", 10000, 0);
	format(string,sizeof(string),"{FFFFFF}Tat ca phuong tien khong duoc su dung se duoc respawn sau {009999}10 {FFFFFF}giay boi %s!", GetName(playerid));
	SCMTA(COLOR_WHITE,string);
	return 1;
}
CMD:unbanip(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 3) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new ip[16],string[128];
	if(sscanf(params, "s[16]", ip)) return SendClientMessage(playerid,COLOR_GREY, "Su dung: {FFFFFF}/unbanip <ip>"); 
	format(string, sizeof(string), "unbanip %s",ip);
	SendRconCommand(string);
	SendRconCommand("reloadbans");
	format(string, sizeof(string), "Warning: %s da unban IP %s", GetName(playerid), ip);
	SendAdminMessage(COLOR_WARNING, string, 3);		
	return 1;
}
CMD:unban(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 3) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new id[25], cont;
	if(sscanf(params, "s[25]", id)) return SendClientMessage(playerid,COLOR_GREY, "Su dung: {FFFFFF}/unban <account name>");
	cont = MySQLCheckAccount(id);
	if(cont == 0) return SendClientMessage(playerid,COLOR_LGREEN, "ERROR: Tai khoan khong duoc tim thay tren co so du lieu!");
	new string[180], query[128];
	format(query,sizeof(query),"UPDATE users SET `Banned`='0', `BTemp`='0', `BYear`='0', `BMonth`='0', `BDay`='0' WHERE `name`='%s'",id);
	mysql_query(SQL,query,false);
	format(query,sizeof(query),"DELETE FROM `ipbans` WHERE `Name`='%s'",id);
	mysql_query(SQL,query,false);	
	format(string, sizeof(string), "Warning: %s da unban %s", GetName(playerid), id);
	SendAdminMessage(COLOR_WARNING, string, 3);		
	return 1;
}
CMD:clearallwanted(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 3) return 1;
	new x, string[180];
	foreach(new i: Player) {
		if(PlayerInfo[i][pWantedLevel] != 0) {
			x++;
			PlayerInfo[i][pWantedLevel] = 0;
			SetPlayerWantedLevel(i, 0);
			Update(i, pWantedLevelx);
			ClearCrime(i);
			format(string, sizeof(string),  "Admin %s da xoa tat ca diem truy na cua ban!", GetName(playerid));
			SendClientMessage(i, COLOR_LIGHTRED, string);
		}
	}
	if(x == 0) return SendClientMessage(playerid, COLOR_GREY, "Khong co nguoi nao bi truy na.");
	format(string, sizeof(string), "AdmCmd: %s xoa tat ca truy na cua moi nguoi (%d nguoi)", GetName(playerid), x);
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(COLOR_LOGS, string, 1);
	return 1;
}