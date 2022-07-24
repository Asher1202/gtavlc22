#include <YSI_Coding\y_hooks>

enum {
	TS_DEFAULT,
	TS_TAIWIN,
	TS_XIUWIN
}

static ts_win = TS_DEFAULT;

new
	cuoctai[MAX_PLAYERS],                   cuocxiu[MAX_PLAYERS],                       tongcuoctai,
	tongcuocxiu,                            tongtai,                                    tongxiu,
    taixiutimeremain=240,                   taiwin,                                     xiuwin;

hook OnPlayerConnect(playerid) {
	cuoctai[playerid] = 0;
    cuocxiu[playerid] = 0;
}
CMD:taixiu(playerid, params[]) {
	if(!IsPlayerInRangeOfPoint(playerid, 30.0, 1949.3138, 1041.4014, 992.8594) 
	&& !IsPlayerInRangeOfPoint(playerid, 30.0, JobInfo[11][jPosX], JobInfo[11][jPosY], JobInfo[11][jPosZ])
	) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o casino / truoc khu cau ca.");
	
	if(CasinoOn==0) return SendClientMessage(playerid, COLOR_GREY, "INFO: {FFFFFF}Casino da dong, se mo tai cac khung gio 13h-16h va 18h-22h.");
	Dialog_Show(playerid, DIALOG_TAIXIU, DIALOG_STYLE_LIST, "Tai xiu", "Thong tin\nCuoc tai\nCuoc xiu", "Chon", "Tro ve");
    return 1;
}
Dialog:DIALOG_TAIXIU(playerid, response, listitem, inputtext[]) {
	if(!response) return 1;
	switch(listitem) {
		case 0: {
			new string[1500],str[100],name[30];
			format(string, 100, 
				"%d {FF0000}Tai {FFFFFF}(%s chip)\t%d {29F013}Xiu {FFFFFF}(%s chip)\t%d giay\n",
			
				tongtai,FormatNumber(tongcuoctai),tongxiu,FormatNumber(tongcuocxiu),taixiutimeremain
			);
			
			foreach(new i: InTaixiu) {
				if(cuoctai[i]>0) {
					GetPlayerName(i, name, sizeof(name));
					format(str, sizeof(str), "%s\t{FF0000}Tai\t{FFFFFF}%s " COLOR_CHIP "chip" WHITE "\n",name,FormatNumber(cuoctai[i]));
					strcat(string, str);
				}
				else if(cuocxiu[i]>0) {
					GetPlayerName(i, name, sizeof(name));
					format(str, sizeof(str), "%s\t" GREY_100 "Xiu\t{FFFFFF}%s " COLOR_CHIP "chip" WHITE "\n",name,FormatNumber(cuocxiu[i]));
					strcat(string, str);
				}
			}
			Dialog_Show(playerid, THONGTINTAIXIU, DIALOG_STYLE_TABLIST_HEADERS, "Thong tin", string, "Dong", "");
		}
        case 1: {
			Dialog_Show(playerid, DIALOG_CUOCTAI, DIALOG_STYLE_INPUT, "Cuoc tai", "Nhap so " COLOR_CHIP "chip" WHITE " muon dat cuoc", "Dat cuoc", "Huy");
		}
		case 2: {
			Dialog_Show(playerid, DIALOG_CUOCXIU, DIALOG_STYLE_INPUT, "Cuoc xiu", "Nhap so " COLOR_CHIP "chip" WHITE " muon dat cuoc", "Dat cuoc", "Huy");
		}
	}
	return 1;
}
Dialog:DIALOG_CUOCTAI(playerid, response, listitem, inputtext[]) {
	if(response) {
		if(PlayerInfo[playerid][pLevel]<5) return SendClientMessage(playerid,COLOR_GREY,"Ban chua dat level 5.");
	    if(taixiutimeremain<30) return SendClientMessage(playerid,COLOR_GREY, "Tai xiu: Phien sap ket thuc, hay quay lai sau.");
	    if(Iter_Contains(InTaixiu,playerid)) return SendClientMessage(playerid,COLOR_GREY, "Ban dang tham gia tai xiu.");
        new chipcuoc = strval(inputtext),string[100];
		
		format(string, sizeof(string), "Cuoc toi thieu la %d chip, toi da %d chip!", CHIP_TX_MIN, CHIP_TX_MAX);
        if (chipcuoc < CHIP_TX_MIN || chipcuoc > CHIP_TX_MAX) return SendClientMessage(playerid,COLOR_GREY, string);

        if (PlayerInfo[playerid][pCasinoChip] < chipcuoc) return SendClientMessage(playerid,COLOR_GREY,"Ban khong co du chip de cuoc!");
        PlayerInfo[playerid][pCasinoChip] -= chipcuoc;
        UpdateVar(playerid, "CasinoChip", PlayerInfo[playerid][pCasinoChip]);
        cuoctai[playerid]=chipcuoc;
        format(string, sizeof(string), "Ban da dat cuoc %s chip vao {FF0000}Tai!", FormatNumber(chipcuoc));
        SendClientMessage(playerid, COLOR_WHITE, string);
        Iter_Add(InTaixiu, playerid);
        Iter_Add(ChonTai, playerid);
        tongtai++;
        tongcuoctai+=chipcuoc;
    }
    return 1;
}
Dialog:DIALOG_CUOCXIU(playerid, response, listitem, inputtext[]) {
	if(response) {
		if(PlayerInfo[playerid][pLevel]<5) return SendClientMessage(playerid,COLOR_GREY,"Ban chua dat level 5.");
	    if(taixiutimeremain<30) return SendClientMessage(playerid,COLOR_GREY, "Tai xiu: Phien sap ket thuc, hay quay lai sau.");
	    if(Iter_Contains(InTaixiu,playerid)) return SendClientMessage(playerid,COLOR_GREY, "Ban dang tham gia tai xiu.");
        new chipcuoc = strval(inputtext),string[100];

		format(string, sizeof(string), "Cuoc toi thieu la %d chip, toi da %d chip!", CHIP_TX_MIN, CHIP_TX_MAX);
        if (chipcuoc < CHIP_TX_MIN || chipcuoc > CHIP_TX_MAX) return SendClientMessage(playerid,COLOR_GREY, string);		

        if (PlayerInfo[playerid][pCasinoChip] < chipcuoc) return SendClientMessage(playerid,COLOR_GREY,"Ban khong co du chip de cuoc!");
        PlayerInfo[playerid][pCasinoChip] -= chipcuoc;
        UpdateVar(playerid, "CasinoChip", PlayerInfo[playerid][pCasinoChip]);
        cuocxiu[playerid]=chipcuoc;
        format(string, sizeof(string), "Ban da dat cuoc %s chip vao {FF0000}Xiu!", FormatNumber(chipcuoc));
        SendClientMessage(playerid, COLOR_WHITE, string);
        Iter_Add(InTaixiu, playerid);
        Iter_Add(ChonXiu, playerid);
        tongxiu++;
        tongcuocxiu+=chipcuoc;
    }
    return 1;
}
TaixiuTime() {
	new ran1, ran2, ran3,string[120],i,tong;

	for(new x = 0; x <= random(15); x++) {
		ran1 = 1+random(6), ran2 = 1+random(6), ran3 = 1+random(6);
	}

	tong = ran1 + ran2 + ran3;

	if(ts_win != TS_DEFAULT) {
		if(ts_win == TS_TAIWIN) {
			while((4 <= tong && tong <= 10) || tong == 3 || tong == 18) {
				ran1 = 1 + random(6);
				ran2 = 1 + random(6);
				ran3 = 1 + random(6);
				tong = ran1 + ran2 + ran3;
			}
			taiwin = 1;
		}
		else {
			while((10 < tong && tong <= 17) || tong == 3 || tong == 18) {
				ran1 = 1 + random(6);
				ran2 = 1 + random(6);
				ran3 = 1 + random(6);
				tong = ran1 + ran2 + ran3;
			}			
			xiuwin = 1;
		}
	}
	else { // The result can be draw
		if(4<=tong<=10) xiuwin=1;
		if(10<tong<=17) taiwin=1;
		if(tong==3 || tong==18) {
			format(string, sizeof(string), "Tai xiu: Xuc xac do ra %d %d %d. Khong ben nao thang!", ran1, ran2, ran3);
			SendClientMessageToAll(COLOR_WHITE, string);
		}
	}

	/*if(tongcuoctai-tongcuocxiu>3000000||tongcuocxiu-tongcuoctai>3000000) {
		taiwin=0,xiuwin=0;
		if(tongcuoctai-tongcuocxiu>3000000) xiuwin=1;
		if(tongcuocxiu-tongcuoctai>3000000) taiwin=1;
	}*/
	if(taiwin==1) {
		format(string, sizeof(string), "Tai xiu: Xuc xac do ra %d %d %d. {FF0000}Tai {FFFFFF}thang voi %d nguoi choi, tong giai thuong %s chip!",ran1, ran2, ran3, tongtai, FormatNumber(tongcuoctai));
        SendClientMessageToAll(COLOR_WHITE, string);
        foreach(i: ChonTai) {
        	format(string,sizeof(string),"Tai xiu: Ban da chien thang, nhan duoc %s chip!",FormatNumber(cuoctai[i]*2));
		    SendClientMessage(i, COLOR_LIGHTBLUE, string);
		
			new chipLeft = payTaxTaiXiu(i, cuoctai[i] * 2);
			PlayerInfo[i][pCasinoChip] += chipLeft;
			UpdateVar(i, "CasinoChip", PlayerInfo[i][pCasinoChip]);
        }
	}
	else if(xiuwin==1) {
		format(string, sizeof(string), "Tai xiu: Xuc xac do ra %d %d %d. {29F013}Xiu {FFFFFF}thang voi %d nguoi choi, tong giai thuong %s chip!",ran1, ran2, ran3, tongxiu, FormatNumber(tongcuocxiu));
        SendClientMessageToAll(COLOR_WHITE, string);
        foreach(i: ChonXiu) {
        	format(string,sizeof(string),"Tai xiu: Ban da chien thang, nhan duoc %s " COLOR_CHIP "chip" WHITE "!",FormatNumber(cuocxiu[i]*2));
		    SendClientMessage(i, COLOR_LIGHTBLUE, string);

			new chipLeft = payTaxTaiXiu(i, cuocxiu[i] * 2);
			PlayerInfo[i][pCasinoChip] += chipLeft;
			UpdateVar(i, "CasinoChip", PlayerInfo[i][pCasinoChip]);			
        }
	}
	foreach(i : InTaixiu) { cuoctai[i]=0, cuocxiu[i]=0; }
	Iter_Clear(InTaixiu);
	Iter_Clear(ChonTai);
	Iter_Clear(ChonXiu);
	tongtai=0, tongxiu=0, tongcuoctai=0, tongcuocxiu=0,taiwin=0,xiuwin=0,ts_win=TS_DEFAULT;
	SendClientMessageToAll(COLOR_ORANGE, "Tai xiu: Phien moi da bat dau, hay nhanh tay dat cuoc!");
}

// TODO: Make timer not to decrease when unused
task TaixiuTimeRemain[1000]() {
	taixiutimeremain--;
	if(taixiutimeremain == 0) {
		if(CasinoOn == 1 || (tongtai+tongxiu) > 0) TaixiuTime();
		taixiutimeremain = 240;
	}
}
CMD:edittaixiu(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du quyen han de su dung lenh nay");
	if(CasinoOn == 0) return SendClientMessage(playerid, COLOR_GREY, "INFO: {FFFFFF}Casino da dong, se mo tai cac khung gio 13h-16h va 18h-22h.");
	
	Dialog_Show(playerid, DIALOG_SETTS, DIALOG_STYLE_LIST, "setts", "Tai\nXiu", "Chon", "Tro ve");
	return 1;
}
Dialog:DIALOG_SETTS(playerid, response, listitem, inputtext[]) {
	if(!response) return 1;
	if(CasinoOn == 0) return SendClientMessage(playerid, COLOR_GREY, "INFO: {FFFFFF}Casino da dong, se mo tai cac khung gio 13h-16h va 18h-22h.");

	if(listitem == 0) {
		SendClientMessage(playerid, COLOR_ORANGE, "[setts] Da set tai");
		ts_win = TS_TAIWIN;
	}
	else {
		SendClientMessage(playerid, COLOR_ORANGE, "[setts] Da set xiu");
		ts_win = TS_XIUWIN;
	}
	return 1;
}

