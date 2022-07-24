new cauhoi=0,timeevent=0,playevent[MAX_PLAYERS];
CMD:thamgiasukien(playerid, params[]) {
	if(cauhoi>0) return Info(playerid, "Su kien dang dien ra.");
	else SendClientMessage(playerid, COLOR_ORANGE, "Tham gia su kien thanh cong, su kien se dien ra vao luc 19h30!");
	playevent[playerid]=1;
	return 1;
}
CMD:chondapan(playerid, params[]) {
	new select[2];
	if (sscanf(params, "s[2]", select)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/chondapan <A/B/C>");
	if(playevent[playerid]==0) return Info(playerid, "Ban khong tham gia su kien.");
    if(cauhoi<1||cauhoi>5) return Info(playerid, "Su kien chua dien ra.");
	if(Iter_Contains(SelectA, playerid)||Iter_Contains(SelectB, playerid)||Iter_Contains(SelectC, playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban da chon dap an.");
	if(strcmp(select, "A", true) == 0) {
		Iter_Add(SelectA, playerid);
		return SendClientMessage(playerid, COLOR_LIGHTGREEN, "Event: Ban da chon dap an A.");
	}
	if(strcmp(select, "B", true) == 0) {
		Iter_Add(SelectB, playerid);
		return SendClientMessage(playerid, COLOR_LIGHTGREEN, "Event: Ban da chon dap an B.");
	}
	if(strcmp(select, "C", true) == 0) {
		Iter_Add(SelectC, playerid);
		return SendClientMessage(playerid, COLOR_LIGHTGREEN, "Event: Ban da chon dap an C.");
	}
    return 1;
}
CMD:batdau(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin]<7) return SendClientMessage(playerid, COLOR_GREY, AdminOnly);
	if(timeevent>0) Info(playerid, "Su kien dang dien ra.");
	if(sscanf(params, "i",cauhoi)) return SendClientMessage(playerid, COLOR_GREY, "Cu phap: {FFFFFF}/batdau <cau hoi>");
	timeevent=15;
	if(cauhoi==0) {
		foreach(new i:Player) playevent[i]=0;
	    Iter_Clear(SelectA);
	    Iter_Clear(SelectB);
	    Iter_Clear(SelectC);
		timeevent=0;
	}
	if(0<cauhoi<6) {
	    TextDrawShowForAll(CountTD);
	    Countnr = 16;
	    countTimer = repeat Count[1000]();
	}
	EventStart();
	return 1;
}
task PlayTime[1000]() {
	timeevent--;
	if(timeevent==0) EventEnd();
}
EventStart() {
	if(cauhoi==1) {
		SCMTA(COLOR_LIGHTGREEN,"--------------------Cau hoi so 1--------------------");
		SCMTA(COLOR_LIGHTGREEN,"Ngay nao sau day la 'Ngay thuong binh liet si Viet Nam'?");
		SCMTA(COLOR_LIGHTGREEN,"A. 27/6     B. 27/7     C. 27/8");
		SCMTA(COLOR_LIGHTGREEN,"/chondapan <A/B/C> de tra loi. Thoi gian tra loi la 15 giay!");
	}
	if(cauhoi==2) {
		SCMTA(COLOR_LIGHTGREEN,"--------------------Cau hoi so 2--------------------");
		SCMTA(COLOR_LIGHTGREEN,"Cach mang thang 8 dien ra vao nam nao?");
		SCMTA(COLOR_LIGHTGREEN,"A. 1945     B. 1954     C. 1975");
		SCMTA(COLOR_LIGHTGREEN,"/chondapan <A/B/C> de tra loi. Thoi gian tra loi la 15 giay!");
	}
	if(cauhoi==3) {
		SCMTA(COLOR_LIGHTGREEN,"--------------------Cau hoi so 3--------------------");
		SCMTA(COLOR_LIGHTGREEN,"'Ngay thuong binh liet si Viet Nam' lan dau tien duoc to chuc vao ngay nao?");
		SCMTA(COLOR_LIGHTGREEN,"A. 27/7/1945     B. 27/7/1946     C. 27/7/1947");
		SCMTA(COLOR_LIGHTGREEN,"/chondapan <A/B/C> de tra loi. Thoi gian tra loi la 15 giay!");
	}
	if(cauhoi==4) {
		SCMTA(COLOR_LIGHTGREEN,"--------------------Cau hoi so 4--------------------");
		SCMTA(COLOR_LIGHTGREEN,"Hien tai ai la Bo truong Bo Lao dong, Thuong binh va Xa hoi?");
		SCMTA(COLOR_LIGHTGREEN," A. Tran Dinh Hoang     B. Nguyen Thi Kim Ngan     C. Dao Ngoc Dung");
		SCMTA(COLOR_LIGHTGREEN,"/chondapan <A/B/C> de tra loi. Thoi gian tra loi la 15 giay!");
	}
	if(cauhoi==5) {
		SCMTA(COLOR_LIGHTGREEN,"--------------------Cau hoi so 5 (Cau hoi quyet dinh)--------------------");
		SCMTA(COLOR_LIGHTGREEN,"Hien nay, nuoc ta co bao nhieu Bo (vd: Bo Quoc phong, Bo Cong an,...)?");
		SCMTA(COLOR_LIGHTGREEN," A. 17     B. 18     C. 19");
		SCMTA(COLOR_LIGHTGREEN,"/chondapan <A/B/C> de tra loi. Thoi gian tra loi la 15 giay!");
	}
}
EventEnd() {
	new str[100];
	if(cauhoi==1) {		
		SCMTA(COLOR_LIGHTGREEN, "--------------------Thoi gian tra loi da het--------------------");
		SCMTA(COLOR_LIGHTGREEN, "Dap an dung la B. 27/7");
	    format(str, sizeof(str), "Xin chuc mung %d mam non cua Dang da tra loi dung!",Iter_Count(SelectB));
	    SCMTA(COLOR_ORANGE, str);
	    foreach(new i: SelectA) { playevent[i]=0, SendClientMessage(i, COLOR_ORANGE, "Ban da tra loi sai, tiec qua :("); }
	    foreach(new i: SelectB) SendClientMessage(i, COLOR_ORANGE, "Ban da tra loi dung, chuc mung !!!");
	    foreach(new i: SelectC) { playevent[i]=0, SendClientMessage(i, COLOR_ORANGE, "Ban da tra loi sai, tiec qua :("); }
	    Iter_Clear(SelectA);
	    Iter_Clear(SelectB);
	    Iter_Clear(SelectC);
	}
	if(cauhoi==2) {		
		SCMTA(COLOR_LIGHTGREEN,"--------------------Thoi gian tra loi da het--------------------");
		SCMTA(COLOR_LIGHTGREEN,"Dap an dung la A.1945");
	    format(str, sizeof(str), "Xin chuc mung %d mam non cua Dang da tra loi dung!", Iter_Count(SelectA));
	    SCMTA(COLOR_ORANGE, str);
	    foreach(new i: SelectA) SendClientMessage(i, COLOR_ORANGE, "Ban da tra loi dung, chuc mung !!!");
	    foreach(new i: SelectB) { playevent[i]=0, SendClientMessage(i, COLOR_ORANGE, "Ban da tra loi sai, tiec qua :("); }
	    foreach(new i: SelectC) { playevent[i]=0, SendClientMessage(i, COLOR_ORANGE, "Ban da tra loi sai, tiec qua :("); }
	    Iter_Clear(SelectA);
	    Iter_Clear(SelectB);
	    Iter_Clear(SelectC);
	}
	if(cauhoi == 3) {
		SCMTA(COLOR_LIGHTGREEN,"--------------------Thoi gian tra loi da het--------------------");
		SCMTA(COLOR_LIGHTGREEN,"Dap an dung la C.27/7/1947");
	    format(str,sizeof(str),"Xin chuc mung %d mam non cua Dang da tra loi dung!",Iter_Count(SelectC));
	    SCMTA(COLOR_ORANGE, str);
	    foreach(new i: SelectA) {playevent[i]=0,SendClientMessage(i, COLOR_ORANGE, "Ban da tra loi sai, tiec qua :(");}
	    foreach(new i: SelectB) {playevent[i]=0,SendClientMessage(i, COLOR_ORANGE, "Ban da tra loi sai, tiec qua :(");}
	    foreach(new i: SelectC) SendClientMessage(i, COLOR_ORANGE, "Ban da tra loi dung, chuc mung !!!");
	    Iter_Clear(SelectA);
	    Iter_Clear(SelectB);
	    Iter_Clear(SelectC);
	}
	if(cauhoi==4) {
		SCMTA(COLOR_LIGHTGREEN,"--------------------Thoi gian tra loi da het--------------------");
		SCMTA(COLOR_LIGHTGREEN,"Dap an dung la C. Dao Ngoc Dung");
	    format(str,sizeof(str),"Xin chuc mung %d mam non cua Dang da tra loi dung!",Iter_Count(SelectC));
	    SCMTA(COLOR_ORANGE, str);
	    foreach(new i: SelectA) {playevent[i]=0,SendClientMessage(i, COLOR_ORANGE, "Ban da tra loi sai, tiec qua :(");}
	    foreach(new i: SelectB) {playevent[i]=0,SendClientMessage(i, COLOR_ORANGE, "Ban da tra loi sai, tiec qua :(");}
	    foreach(new i: SelectC) SendClientMessage(i, COLOR_ORANGE, "Ban da tra loi dung, chuc mung !!!");
	    Iter_Clear(SelectA);
	    Iter_Clear(SelectB);
	    Iter_Clear(SelectC);
	}
	if(cauhoi==5) {
		new gift,win=Iter_Count(SelectB),string[1000],name[30],dem=1;
		gift=10000000/win;
		format(string, sizeof(string),"----------Danh sach nguoi chien thang----------");
		SCMTA(COLOR_LIGHTGREEN,"--------------------Thoi gian tra loi da het--------------------");
		SCMTA(COLOR_LIGHTGREEN,"Dap an dung la B. 18");
	    format(str,sizeof(str),"Xin chuc mung %d mam non cua Dang da tra loi dung!\nMoi~ nguoi se nhan duoc $%s\n", Iter_Count(SelectB), FormatNumber(gift));
	    SCMTA(COLOR_ORANGE, str);
	    foreach(new i: SelectA) { playevent[i]=0, SendClientMessage(i, COLOR_ORANGE, "Ban da tra loi sai, tiec qua :("); }
	    format(str, sizeof(str), "Ban da tra loi dung cau hoi quyet dinh, nhan duoc $%s",FormatNumber(gift));
	    foreach(new i: SelectB) {
	    	format(name, sizeof(name),"\n%d. %s", dem, GetName(i));
	    	dem++;
	    	strcat(string, name);
	    	playevent[i]=0;
	    	SendClientMessage(i, COLOR_ORANGE, str);
	    	GivePlayerMoney(i, gift);
	    	Update(i, pCashx);
	    }
	    foreach(new i: SelectC) {playevent[i]=0,SendClientMessage(i, COLOR_ORANGE, "Ban da tra loi sai, tiec qua :(");}
	    Iter_Clear(SelectA);
	    Iter_Clear(SelectB);
	    Iter_Clear(SelectC);
	    SCMTA(COLOR_LIGHTGREEN, string);
	}
}