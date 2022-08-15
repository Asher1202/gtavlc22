CMD:entercar(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new testcar,loc;
	if(sscanf(params, "ii",testcar,loc)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/entercar <vehicleid>> <Seat ID>");
	if(loc < 0 || loc > 4) return SendClientMessage(playerid, -1, "Invalid Seat ID(0-4).");
	PutPlayerInVehicleEx(playerid, testcar, loc);
	return 1;
}
CMD:fastevent(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessage(playerid, COLOR_GREY, AdminOnly);
    new reaction[64], reward;
    if(TEvent != 0) return SendClientMessage(playerid, COLOR_GREY, "Mot event dang hoat dong, su dung /canecel event de ket thuc no'.");
    if(sscanf(params, "is[64]", reward, reaction)) return SendClientMessage(playerid, COLOR_RED, "/fastevent [reward] [text(type random for random text)]");
    if(reward < 1 || reward > 30000) return SendClientMessage(playerid, COLOR_GREY, "Phan thuong khong the lon hon 30.000$.");
    if(!strcmp(reaction, "random", true))
    {
		static const letters[65] = "qwertyuiopasdfghjklzxcvbnmmQWERTYUIOPASDFGHJKLZXCVBNNM0123456789";
		for(new i = 0; i < 5 + random(10); i++) FastEventText[i] = letters[random (sizeof (letters))];
		TEventReward = reward, TEvent = 1;
		SCMTA(0xADD63CFF, sprintf("Fast Event: Nguoi dau tien nhap ''{FFA200}%s{ADD63C}'' se chien thang %s$.", FastEventText, FormatNumber(reward)));
    }
    else
    {
		format(FastEventText, sizeof(FastEventText), "%s", reaction), TEventReward = reward, TEvent = 1;
		SCMTA(0xADD63CFF, sprintf("Fast Event: Nguoi dau tien nhap ''{FFA200}%s{ADD63C}'' se chien thang %s$.", FastEventText, FormatNumber(reward)));
    }
    return 1;
}
CMD:jetpack(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessage(playerid, COLOR_GREY, AdminOnly);
	SetPlayerSpecialAction(playerid, 2);
	SendClientMessage(playerid, COLOR_WHITE, "Ban da nhan duoc mot Jetpack.");
	return 1;
}
CMD:unjail(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new id,string[128];
	if(sscanf(params, "u", id)) return SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/unjail <playerid/name>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	if(PlayerInfo[id][pJailTime] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "[ERROR] Nguoi choi nay khong ngoi tu!");
	ResetWeapons(id);
	ResetWeapons(id);
	PlayerInfo[id][pJailed] = 0;
	PlayerInfo[id][pJailTime] = 0;
	PlayerInfo[id][pWantedLevel] = 0;
	SetPlayerInterior(id, 0);
	JailPrice[id] = 0;
	Update(id,pJailedx);
	Update(id,pJailTimex);
	UpdateVar(id, "AJail", 0);
	PlayerInfo[id][pAJail] = 0;				
	Update(id,pWantedLevelx);
	SetPlayerPosEx(id, 1553.1921,-1675.7089,16.1953);
	format(string, sizeof(string), "Admin %s da tha tu do cho %s.",GetName(playerid),GetName(id));
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(COLOR_LOGS, string,3);
	if(PlayerInfo[id][pChar] > 0 && PlayerInfo[id][pMember] != 0) {
		if(OnDuty[id] == 0) {}
		else SetPlayerSkinEx(id, PlayerInfo[id][pChar]);
	}
	else SetPlayerSkinEx(id, PlayerInfo[id][pModel]);
	ClearCrime(id);
	PlayerTextDrawHide(id, Jailtime);
	return 1;
}

CMD:aclear(playerid, params[]) {
	new id,string[128];
	if(PlayerInfo[playerid][pAdmin] < 2) return 1;
	if(sscanf(params, "u", id)) return SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/aclear <playerid/name>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi da chon khong dang nhap.");
	if(PlayerInfo[id][pWantedLevel] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "[ERROR] Nguoi choi khong bi truy na!");
	format(string, sizeof(string), "Admin %s da xoa toan bo truy na cua ban!", GetName(playerid));
	SendClientMessage(id, COLOR_LIGHTRED, string);
	format(string, sizeof(string), "Tru so: Admin %s da xoa toan bo truy na cua %s.", GetName(playerid), GetName(id));
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
CMD:fixveh(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
    if(!IsPlayerInAnyVehicle(playerid)) return 1;
	RepairVehicle(GetPlayerVehicleID(playerid));
	SetVehicleHealth(GetPlayerVehicleID(playerid), 999);
	Gas[GetPlayerVehicleID(playerid)] = 100;
	return 1;
}
CMD:unjailo(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new id[25];
	if(sscanf(params, "s[25]", id)) return SendClientMessage(playerid,COLOR_GREY, "Cu phap: {FFFFFF}/unjailo <name>");
	new cont = MySQLCheckAccount(id);
	if(cont == 0) return SendClientMessage(playerid,COLOR_LGREEN, "[ERROR] Khong the tim thay tai khoan nay trong co so du lieu!");
	new str1[128], string[180];
	format(string, sizeof(string), "%s da duoc unjail tu co so du lieu.", id);
	SendClientMessage(playerid, COLOR_WHITE, string);
	format(str1,sizeof(str1),"UPDATE users SET `Jailed`='0',`JailTime`='0',`WantedLevel`='0' WHERE `name`='%s'",id);
	mysql_query(SQL,str1,false);
	return 1;
}
CMD:getip(playerid, params[]) {
	new id, playersip[16], string[180];
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	if(sscanf(params, "u", id)) return SendClientMessage(playerid,COLOR_GREY, "Su dung: {FFFFFF}/getip <playerid>"); 
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong dang nhap.");
	if(PlayerInfo[id][pAdmin] >= 1 && PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the lam dieu nay!");
	if(PlayerInfo[id][pAdmin] > PlayerInfo[playerid][pAdmin]) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay len nguoi choi do.");
	GetPlayerIp(id,playersip,sizeof(playersip));
	format(string, sizeof(string), "%s (%d) IP: %s",GetName(id),id,playersip);
	SendClientMessage(playerid,COLOR_WHITE,string);
	return 1;
}
CMD:nearskin(playerid, params[])
{
	new range, skin, Float:rPos[4], x, string[180];
	if(PlayerInfo[playerid][pAdmin] < 7) return 1;
	if(sscanf(params, "ii", skin, range)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/nearskin <skin> <range>");
    GetPlayerPos(playerid, rPos[0], rPos[1], rPos[2]);
	foreach(new i: Player) {
		if(IsPlayerInRangeOfPoint(i, range, rPos[0], rPos[1], rPos[2])) {
			SetPlayerSkinEx(i, skin);
			x++;
		}
	}
	format(string, sizeof(string), "AdmCmd: %s da set skin %d cho %d nguoi choi trong ban kinh %dm.", GetName(playerid), skin, x, range);
	SendAdminMessage(COLOR_LOGS, string, 1);
	return 1;
}
CMD:afvr(playerid, params[]) {
    if(PlayerInfo[playerid][pAdmin] < 2) return 1;
	new id;
	if(sscanf(params, "i", id)) return SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/afvr <faction id>");
	if(id < 1 || id > facs) return SendClientMessage(playerid, COLOR_GREY, "To chuc khong hop le!");
	for(new v = 0; v < MAX_SVEHICLES; v++) {
		if(ServerVehicles[v][vFaction] == id) {
			if(!IsVehicleOccupied(ServerVehicles[v][vSpawned])) SetVehicleToRespawn(ServerVehicles[v][vSpawned]), Gas[ServerVehicles[v][vSpawned]] = 100;
		}			
	}
	new string[180];
    format(string, sizeof(string), "AdmCmd: %s da respawn tat ca cac xe trong to chuc %s (%d)!", GetName(playerid), FactionName(id), id);
	SendAdminMessage(COLOR_LOGS, string, 2);	
    return 1;
}
CMD:banip(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new ip[16], reason[64], string[128];
	if(sscanf(params, "s[16]s[64]", ip, reason)) return SendClientMessage(playerid,COLOR_GREY, "Su dung: {FFFFFF}/banip <ip> <ly do>"); 
	if(strlen(ip) < 5) return SendClientMessage(playerid, COLOR_GREY, "IP Invalid!");

	format(string,sizeof(string),"banip %s",ip);
	SendRconCommand(string);
	SendRconCommand("reloadbans");
			
	format(string, sizeof(string), "Warning: %s da banned IP %s, Li do: %s.", GetName(playerid), ip, reason);
	SendAdminMessage(COLOR_WARNING, string, 3);		
	return 1;
}
CMD:xprip(playerid, params[]) {
	new string[60];
	KickEx(playerid);
	format(string, sizeof(string), "[Asher]: %s da bi auto kick, Li do: Phá.", GetName(playerid));
	SCMTA(COLOR_WARNING, string);			
	return 1;
}
CMD:rp(playerid, params[]) {
	new string[60];
	KickEx(playerid);
	format(string, sizeof(string), "[Asher]: %s da bi auto kick, Li do: Phá.", GetName(playerid));
	SCMTA(COLOR_WARNING, string);		
	return 1;
}
CMD:kenzo(playerid, params[]) {
	new string[60];
	KickEx(playerid);
	format(string, sizeof(string), "[Asher]: %s da bi auto kick, Li do: Phá.", GetName(playerid));
	SCMTA(COLOR_WARNING, string);			
	return 1;
}
CMD:setarmor(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly);
	new id,armor,string[100];
	if(sscanf(params, "ui", id, armor)) return SendClientMessage(playerid,COLOR_GREY, "Su dung: {FFFFFF}/setarmor <playerid/name> <armor>");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Nguoi choi do khong dang nhap.");		
	SetPlayerArmourEx(id, armor);
	
	format(string, sizeof(string), "AdmBot: Admin %s da set giap cua %s thanh %d.",  GetName(playerid),GetName(id),armor);
	if(GetPVarInt(playerid, "Cover") == 0) SendAdminMessage(COLOR_LOGS, string,2);
	return 1;
}
CMD:addobject(playerid, params[]) {
	new obj, money;
	if(PlayerInfo[playerid][pAdmin] < 2) return 1;
	if(sscanf(params, "ii", obj, money)) {
		SendClientMessage(playerid, COLOR_GREY, "Su dung: {FFFFFF}/addobject <object id> <money>");
		SendClientMessage(playerid, COLOR_WHITE, "Cadou (19054-19058), Glob (19059-19063), Oua (19341-19345), Dovleac (19320).");
		SendClientMessage(playerid, COLOR_WHITE, "De xem danh sach cac object, truy cap: gamerxserver.com/forum/showthread.php?21-Objects-by-Category");
		return 1;
	}	
	new id = GetObjects(), Float: Pos[3];
	if(id == MAX_COBJECTS) return SendClientMessage(playerid, COLOR_LGREEN, "So luong object da dat toi da!");
	if(obj < 1 || obj > 19500) return SendClientMessage(playerid, COLOR_GREY, "Object invalid!");
	if(money < 1 || money > 100000) return SendClientMessage(playerid, COLOR_GREY, "Invalid money! ($1-$100,000)");
	GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
	ObjectInfo[id][oID] = CreateDynamicPickup(obj, 23, Pos[0], Pos[1], Pos[2], 0, -1, -1, 100.0);
	ObjectInfo[id][oMoney] = money;
	new string[180];
	format(string, sizeof(string), "AdmCmd: %s da them mot object moi va hien tai da co %d object tong cong. [obj: %d, $%s]", GetName(playerid), id+1, obj, FormatNumber(money));
	SendAdminMessage(COLOR_LOGS, string, 2);
	return 1;
}	

CMD:removeobjects(playerid, params[]) {
	new id = GetObjects();
	if(PlayerInfo[playerid][pAdmin] < 2) return 1;
	if(id == 0) return SendClientMessage(playerid, COLOR_GREY, "Khong co object nao duoc tao ra!");
	new obj = GetObjects();	
	new string[180];
	format(string, sizeof(string), "AdmCmd: %s da xoa tat ca cac object (%d).", GetName(playerid), obj);
	SendAdminMessage(COLOR_LOGS, string, 2);
	RemoveObjects();
	return 1;
}