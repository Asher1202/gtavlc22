
#include <YSI_Coding\y_hooks>


#define MAX_BAN 		(34)
#define MAX_BAI_RUT 		(5)
#define MAX_NGUOI_THAM_GIA 		(3)
#define THOIGIANCHOCUACAI 		(500)
#define THOIGIANCHOCUANGUOICHOI 		(10)

#define TRANG_THAI_NONE 		(0)
#define TRANG_THAI_TIEP 		(1)
#define TRANG_THAI_THUA 		(2)
#define TRANG_THAI_DAN 		(3)
#define TRANG_THAI_THANG 		(4)

stock const g_cardTextdrawData[52][] = {
    "LD_CARD:cd1c", // A Clubs - 0
    "LD_CARD:cd2c", // 2 Clubs - 1
    "LD_CARD:cd3c", // 3 Clubs - 2
    "LD_CARD:cd4c", // 4 Clubs - 3
    "LD_CARD:cd5c", // 5 Clubs - 4
    "LD_CARD:cd6c", // 6 Clubs - 5
    "LD_CARD:cd7c", // 7 Clubs - 6
    "LD_CARD:cd8c", // 8 Clubs - 7
    "LD_CARD:cd9c", // 9 Clubs - 8
    "LD_CARD:cd10c", // 10 Clubs - 9
    "LD_CARD:cd11c", // J Clubs - 10
    "LD_CARD:cd12c", // Q Clubs - 11
    "LD_CARD:cd13c", // K Clubs - 12
    "LD_CARD:cd1d", // A Diamonds - 13
    "LD_CARD:cd2d", // 2 Diamonds - 14
    "LD_CARD:cd3d", // 3 Diamonds - 15
    "LD_CARD:cd4d", // 4 Diamonds - 16
    "LD_CARD:cd5d", // 5 Diamonds - 17
    "LD_CARD:cd6d", // 6 Diamonds - 18
    "LD_CARD:cd7d", // 7 Diamonds - 19
    "LD_CARD:cd8d", // 8 Diamonds - 20
    "LD_CARD:cd9d", // 9 Diamonds - 21
    "LD_CARD:cd10d", // 10 Diamonds - 22
    "LD_CARD:cd11d", // J Diamonds - 23
    "LD_CARD:cd12d", // Q Diamonds - 24
    "LD_CARD:cd13d", // K Diamonds - 25
    "LD_CARD:cd1h", // A Heats - 26
    "LD_CARD:cd2h", // 2 Heats - 27
    "LD_CARD:cd3h", // 3 Heats - 28
    "LD_CARD:cd4h", // 4 Heats - 29
    "LD_CARD:cd5h", // 5 Heats - 30
    "LD_CARD:cd6h", // 6 Heats - 31
    "LD_CARD:cd7h", // 7 Heats - 32
    "LD_CARD:cd8h", // 8 Heats - 33
    "LD_CARD:cd9h", // 9 Heats - 34
    "LD_CARD:cd10h", // 10 Heats - 35
    "LD_CARD:cd11h", // J Heats - 36
    "LD_CARD:cd12h", // Q Heats - 37
    "LD_CARD:cd13h", // K Heats - 38
    "LD_CARD:cd1s", // A Spades - 39
    "LD_CARD:cd2s", // 2 Spades - 40
    "LD_CARD:cd3s", // 3 Spades - 41
    "LD_CARD:cd4s", // 4 Spades - 42
    "LD_CARD:cd5s", // 5 Spades - 43
    "LD_CARD:cd6s", // 6 Spades - 44
    "LD_CARD:cd7s", // 7 Spades - 45
    "LD_CARD:cd8s", // 8 Spades - 46
    "LD_CARD:cd9s", // 9 Spades - 47
    "LD_CARD:cd10s", // 10 Spades - 48
    "LD_CARD:cd11s", // J Spades - 49
    "LD_CARD:cd12s", // Q Spades - 50
    "LD_CARD:cd13s" // K Spades - 51
};

enum E_THONGTIN_XIDACH
{
    bool: E_GAMEBD,   E_SOBAIDARUT,          E_GAME_TIMER,
    E_TIEN,               E_WORLD,                E_RESET_TIMER,
    E_THOIGIANRUT,

    E_OBJECT,               E_ACTOR,

    Float: E_X,             Float: E_Y,             Float: E_Z,
    Float: E_ROTATION,

    Text3D: E_LABEL_CAI, Text3D: E_LABEL_NC[MAX_NGUOI_THAM_GIA]
};

new
    g_xidachthongtin 				[MAX_BAN][E_THONGTIN_XIDACH],
    Text: g_xidachluottd			[MAX_BAN] = { Text: INVALID_TEXT_DRAW, ... },
    Text: g_xidachbaiNguoiChoi	[MAX_BAN][MAX_BAI_RUT][MAX_NGUOI_THAM_GIA],
    Text: g_xidachbaiCai	[MAX_BAN][MAX_BAI_RUT],
    g_xidachSoCC		[MAX_BAN][MAX_BAI_RUT],
    g_xidachSoNC		[MAX_BAN][MAX_BAI_RUT][MAX_NGUOI_THAM_GIA],
    g_xidachtrangthai			[MAX_BAN][MAX_NGUOI_THAM_GIA],
    g_xidachThongTinBan				[MAX_BAN][MAX_NGUOI_THAM_GIA],
    p_banxidach				[MAX_PLAYERS] = { -1, ... },
    p_socardrut             [MAX_BAN][MAX_NGUOI_THAM_GIA],
    Iterator: banxidach 		< MAX_BAN >
;   
    // new bar o day ne bro



hook OnScriptInit()
{
	TaoXiDach(250, 1108.30652, -1448.37500, 13.63670, 90.00000, 0);
    TaoXiDach(250, 1108.28137, -1451.81897, 13.63670, 90.00000, 0);
    TaoXiDach(500, 1123.57629, -1451.82800, 13.63670, -90.00000, 0);
    TaoXiDach(500, 1123.59253, -1448.35718, 13.63670, -90.00000, 0);
    TaoXiDach(1000, 1119.46619, -1447.25916, 13.63670, 180.00000, 0);
    TaoXiDach(1000, 1115.02527, -1447.20496, 13.63670, 180.00000, 0);
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	DuoiNguoiChoiKhoiBan(playerid);
	return 1;
}

#if defined AC_INCLUDED
hook OnPlayerDeathEx(playerid, killerid, reason, Float: damage, bodypart)
#else
hook OnPlayerDeath(playerid, killerid, reason)
#endif
{
	DuoiNguoiChoiKhoiBan(playerid);
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	    static
		Float: X, Float: Y, Float: Z;

        new blackjack_table = p_banxidach[playerid];

  
        if (blackjack_table != -1)
        {
            new
                player_index = KiemTraBanCuaNguoiChoi(blackjack_table, playerid);

            if (player_index == -1)
                return SendClientMessage(playerid, -1, "Ban khong dang tham gia ban xi dach nao.");

		    if (PRESSED(KEY_SPRINT)) {

	            if (! g_xidachthongtin[blackjack_table][E_SOBAIDARUT] && g_xidachthongtin[blackjack_table][E_GAME_TIMER] == -1)
	                return (g_xidachthongtin[blackjack_table][E_GAME_TIMER] = SetTimerEx("BatDauXiDach", THOIGIANCHOCUACAI, false, "d", blackjack_table)), 1;

	            if (g_xidachtrangthai[blackjack_table][player_index] == TRANG_THAI_TIEP) {
                    if(TinhDiemNguoiChoi(blackjack_table, player_index) >= 16)
                    {
    	                g_xidachtrangthai[blackjack_table][player_index] = TRANG_THAI_DAN;
    	                SendClientMessageToXiD(blackjack_table, COLOR_GREY, "[XI DACH]"COL_WHITE" %s(%d) khong rut.", GetName(playerid), playerid);
                    }
                    else SendClientMessage(playerid, COLOR_YELLOW, "[Xi Dach] > Ban khong the dan vi chua du 16");
	                return 1;
	            }
		        return 1;
		    }

		    if (PRESSED(KEY_CTRL_BACK))
		    {
	            if (g_xidachtrangthai[blackjack_table][player_index] != TRANG_THAI_TIEP)
	                return SendError(playerid, "Chua den luot ban de rut bai!");

	            RutBai(blackjack_table, player_index);
	            KiemTraXiDach(blackjack_table);
	            return 1;
		    }
        }

		if (PRESSED(KEY_SECONDARY_ATTACK))
		{
			if (p_banxidach[playerid] != -1) {
                if (g_xidachthongtin[blackjack_table][E_SOBAIDARUT]) return SendError(playerid, "Ban khong the thoat khi dang trong ban xi dach.");
				return DuoiNguoiChoiKhoiBan(playerid, .reset_cam = 1);
            }

			foreach(new id : banxidach) if (GetPlayerVirtualWorld(playerid) == g_xidachthongtin[id][E_WORLD])
	        {
	            if (IsPlayerInRangeOfPoint(playerid, 3.0, g_xidachthongtin[id][E_X], g_xidachthongtin[id][E_Y], g_xidachthongtin[id][E_Z])) {

	                new
	                    player_index;

	                for (; player_index < MAX_NGUOI_THAM_GIA; player_index ++)
	                    if (g_xidachThongTinBan[id][player_index] == -1)
	                        break;

	                if (player_index >= MAX_NGUOI_THAM_GIA || g_xidachThongTinBan[id][player_index] != -1)
	                    return SendError(playerid, "Khong con cho trong trong ban nay.");
        
	                if (PlayerInfo[playerid][pCasinoChip] < g_xidachthongtin[id][E_TIEN])
	                    return SendError(playerid, "Ban khong co du chip de choi.");
                    if (XiDachOn == 0){
                        return SendError(playerid, "Song bac da dong, hay tro lai vao luc (8-15h) va (18h-5h)");
                    }
                    if (PlayerInfo[playerid][pDelayXiDach] != 0){
                        return SendError(playerid, "Hay nghi ngoi va quay lai sau 10 phut");
                    }
                    if(g_xidachthongtin[id][E_TIEN] >= 1000 && PlayerInfo[playerid][pVip] == 0) return SendError(playerid, "Ban nay chi danh cho nguoi choi V.I.P");
	                new
	                    Float: lookatX, Float: lookatY, Float: lookatZ,
	                    Float: tmpX, Float: tmpY, Float: tmpZ
	                ;

	                GetPlayerCameraPos(playerid, X, Y, Z);
	                GetPlayerCameraFrontVector(playerid, lookatX, lookatY, lookatZ);

	                tmpX = g_xidachthongtin[id][E_X] - 1.3 * floatcos(g_xidachthongtin[id][E_ROTATION] + 90.0, degrees);
	                tmpY = g_xidachthongtin[id][E_Y] - 1.3 * floatsin(g_xidachthongtin[id][E_ROTATION] + 90.0, degrees);
	                tmpZ = g_xidachthongtin[id][E_Z] + 1.7;

	                InterpolateCameraPos(playerid, X, Y, Z, tmpX, tmpY, tmpZ, 1000, CAMERA_MOVE);

	                X += floatmul(lookatX, 20.0);
	                Y += floatmul(lookatY, 20.0);
	                Z += floatmul(lookatZ, 20.0);

	                InterpolateCameraLookAt(playerid, X, Y, Z, g_xidachthongtin[id][E_X], g_xidachthongtin[id][E_Y], g_xidachthongtin[id][E_Z] - 1.0, 1000, CAMERA_MOVE);

	                p_banxidach[playerid] = id;
	                g_xidachThongTinBan[id][player_index] = playerid;

	                // reset bai`
	                for (new c = 0; c < MAX_BAI_RUT; c ++)
	                    g_xidachSoNC[id][c][player_index] = -1;

                    // set gia tri bai`
                    SetGiaTriXiDach(id, player_index, 0);

	                // Hien thi bai`
	                for (new player = 0; player < MAX_NGUOI_THAM_GIA; player ++)
	                {
	                    new
	                        gamerid = g_xidachThongTinBan[id][player];

	                    // Dan khi chi co 2 la
	                    for (new c = 0; c < MAX_BAI_RUT; c ++)
	                    {
	                        TextDrawShowForPlayer(gamerid, g_xidachbaiCai[id][c]);

	                        // Chi hien 2 nguoi
	                        if (c >= 2)
	                            continue;

	                        for (new p = 0; p < DemSoNguoiChoiTrongBan(id); p ++) {
	                            TextDrawShowForPlayer(gamerid, g_xidachbaiNguoiChoi[id][c][p]);
	                        }
	                    }
	                }

					szBigString = "~y~~k~~PED_SPRINT~~w~ - Bat dau game/Dan~n~~y~~k~~GROUP_CONTROL_BWD~~w~ - Rut bai~n~~y~~k~~VEHICLE_ENTER_EXIT~~w~ - Thoat";
					ShowPlayerHelpDialog(playerid, 0, szBigString);

	                SCMf(playerid, -1, ">> Da vao ban xi dach voi muc cuoc %s.", FormatNumber(g_xidachthongtin[id][E_TIEN]));
	                ApplyAnimation(playerid, "DEALER", "DEALER_IDLE", 4.1, 1, 1, 1, 1, 0, 1);
	                return 1;
	            }
	        }
		}

        return 1;
}

stock TaoXiDach(payout, Float: X, Float: Y, Float: Z, Float: Angle, world)
{
    new
        id = Iter_Free(banxidach);

    if (id != ITER_NONE)
    {
        g_xidachthongtin[id][E_X] = X;
        g_xidachthongtin[id][E_Y] = Y;
        g_xidachthongtin[id][E_Z] = Z;
        g_xidachthongtin[id][E_ROTATION] = Angle;
        g_xidachthongtin[id][E_WORLD] = world;

        g_xidachthongtin[id][E_THOIGIANRUT] = -1;
        g_xidachthongtin[id][E_RESET_TIMER] = -1;
        g_xidachthongtin[id][E_GAME_TIMER] = -1;
        g_xidachthongtin[id][E_TIEN] = payout;
        g_xidachthongtin[id][E_OBJECT] = CreateDynamicObject(2188, X, Y, Z, 0.00000, 0.00000, Angle, .worldid = world, .priority = 9999);
        g_xidachthongtin[id][E_ACTOR] = CreateDynamicActor(171, X - 0.4 * floatcos(Angle - 90.0, degrees), Y - 0.4 * floatsin(Angle - 90.0, degrees), Z, Angle + 180.0, .worldid = world);
        g_xidachthongtin[id][E_LABEL_CAI] = CreateDynamic3DTextLabel(sprintf(""COL_PLATINUM"XI DACH\nBam nut 'F' de tham gia\n"COL_WHITE"Muc cuoc : "COL_RED"%s ", FormatNumber(payout)), COLOR_GREY, X, Y, Z + 0.25, 15.0, .testlos = 0, .worldid = world);

        g_xidachthongtin[id][E_LABEL_NC][0] = CreateDynamic3DTextLabel("Nguoi choi 1", 0, X + 0.7 * floatcos(Angle - 90.0, degrees), Y + 0.7 * floatsin(Angle - 90.0, degrees), Z + 0.05, 15.0, .testlos = 0, .worldid = world);
        g_xidachthongtin[id][E_LABEL_NC][1] = CreateDynamic3DTextLabel("Nguoi choi 2", 0, X + 0.7 * floatcos(Angle - 90.0 - 22.5, degrees), Y + 0.7 * floatsin(Angle - 90.0 - 22.5, degrees), Z + 0.05, 15.0, .testlos = 0, .worldid = world);
        g_xidachthongtin[id][E_LABEL_NC][2] = CreateDynamic3DTextLabel("Nguoi choi 3", 0, X + 0.7 * floatcos(Angle - 90.0 + 22.5, degrees), Y + 0.7 * floatsin(Angle - 90.0 + 22.5, degrees), Z + 0.05, 15.0, .testlos = 0, .worldid = world);

		SetDynamicActorInvulnerable(g_xidachthongtin[id][E_ACTOR], true);
		SetDynamicActorVirtualWorld(g_xidachthongtin[id][E_ACTOR], world);
        ApplyDynamicActorAnimation(g_xidachthongtin [id][E_ACTOR], "DEALER","DEALER_IDLE",4.0,1,0,0,0,0);
        // ApplyDynamicActorAnimation(STREAMER_TAG_ACTOR actorid, animlib[], animname[], Float:fdelta, loop, lockx, locky, freeze, time)
        // reset td
        for (new x = 0; x < MAX_BAI_RUT; x ++) {
            g_xidachbaiCai[id][x] = Text: INVALID_TEXT_DRAW;

            for (new p = 0; p < MAX_NGUOI_THAM_GIA; p ++) {
                g_xidachbaiNguoiChoi[id][x][p] = Text: INVALID_TEXT_DRAW;
                g_xidachThongTinBan[id][p] = -1;
            }
        }

        // tao xi dach td
        TaoTDXiDach(id);

        // reset ban` va it
        ResetXiDach(id);
        Iter_Add(banxidach, id);
    }
    else
    {
        static overflow;
        printf("[BAN BLACKJACK] Da tao %d khong the tao nua hay them %d.", MAX_BAN, MAX_BAN + (++ overflow));
    }
    return 1;
}

function RutBai(tableid, player_index)
{
    new
        randomCard = random(sizeof(g_xidachbaiCai));

    for (new cardid = 0; cardid < MAX_BAI_RUT; cardid ++) if (g_xidachSoNC[tableid][cardid][player_index] == -1) {
        TextDrawSetString(g_xidachbaiNguoiChoi[tableid][cardid][player_index], g_cardTextdrawData[randomCard]);
        foreach (new gamerid : Player) if (p_banxidach[gamerid] == tableid) {
        	TextDrawShowForPlayer(gamerid, g_xidachbaiNguoiChoi[tableid][cardid][player_index]);
    		PlayerPlaySound(gamerid, 1145, 0.0, 0.0, 0.0);
            // SendClientMessagef(player_index, -1, "Da Rut %d", p_socardrut[tableid][player_index]);
            
        }
        p_socardrut[tableid][player_index]++;
        g_xidachSoNC[tableid][cardid][player_index] = randomCard;
        SetGiaTriXiDach(tableid, player_index, TinhDiemNguoiChoi(tableid, player_index));
        // SendClientMessagef(player_index, -1, "Da Rut %d", p_socardrut[tableid][player_index]);
        break;
    }
    return randomCard;
}

function BatDauXiDach(tableid)
{
    new
        cardid = g_xidachthongtin[tableid][E_SOBAIDARUT] ++;

    if (cardid >= MAX_BAI_RUT) {
        ResetXiDach(tableid);
        return;
    }

    new
        randomCard = random(sizeof(g_xidachbaiCai));

    // Bai` cua cai'
    ApplyDynamicActorAnimation(g_xidachthongtin[tableid][E_ACTOR], "CASINO", "dealone", 4.1, 0, 0, 0, 0, 0);
    ApplyDynamicActorAnimation(g_xidachthongtin[tableid][E_ACTOR], "CASINO", "dealone", 4.1, 0, 0, 0, 0, 0);
    TextDrawSetString(g_xidachbaiCai[tableid][cardid], g_cardTextdrawData[randomCard]);
    g_xidachSoCC[tableid][cardid] = randomCard;
    SetGiaTriXiDachChoCai(tableid, TinhDiemCai(tableid));

    // Am thanh chia bai
    foreach (new gamerid : Player) if (p_banxidach[gamerid] != -1) {
    	PlayerPlaySound(gamerid, 1145, 0.0, 0.0, 0.0);
        Update(gamerid, pCashx);
    }

    // Dan la bai dau
    if (cardid == 0)
    {
        new blackjack_players = DemSoNguoiChoiTrongBan(tableid);
    	new bet_amount = 0;

        for (new player_index = 0; player_index < MAX_NGUOI_THAM_GIA; player_index ++) if (g_xidachThongTinBan[tableid][player_index] != -1)
        {
            new
                gamerid = g_xidachThongTinBan[tableid][player_index];

            if (PlayerInfo[gamerid][pCasinoChip] < g_xidachthongtin[tableid][E_TIEN]) {
                SendError(gamerid, "Ban khong chip de choi.");
                DuoiNguoiChoiKhoiBan(gamerid, .reset_cam = 1);
                if (blackjack_players - 1 <= 0) return; // neu chi co mot nguoi thi reset ban
                continue;
            }
            if(PlayerInfo[gamerid][pCountXiDach] >= 20)
            {
                SendError(gamerid, "Ban da rut 20 luot xi dach, ban co the choi lai sau 10 phut.");
                DuoiNguoiChoiKhoiBan(gamerid, .reset_cam = 1);
                PlayerInfo[gamerid][pDelayXiDach] = 600;
                CheckXiDach [gamerid] = 1;
                if (blackjack_players - 1 <= 0) return; // Neu k co ai thi reset ban
                continue;
            }
            bet_amount += g_xidachthongtin[tableid][E_TIEN];
            PlayerInfo[gamerid][pCasinoChip] -= g_xidachthongtin[tableid][E_TIEN];
            PayTax(gamerid, g_xidachthongtin[tableid][E_TIEN], e_XI_DACH);
            UpdateVar(gamerid, "CasinoChip", PlayerInfo[gamerid][pCasinoChip]);
            RutBai(tableid, player_index);
            PlayerInfo[gamerid][pCountXiDach]++;
            if (cardid < 1) { // cho nguoi choi card dau tien
                g_xidachthongtin[tableid][E_THOIGIANRUT] = SetTimerEx("RutBai", THOIGIANCHOCUACAI, false, "dd", tableid, player_index);
            }
        }


        //Bat dau 
        new
            first_player = KiemTraLuotChoi(tableid),
            first_player_index = KiemTraBanCuaNguoiChoi(tableid, first_player)
        ;

        if (first_player_index != -1)
        	g_xidachtrangthai[tableid][first_player_index] = TRANG_THAI_TIEP;

        g_xidachthongtin[tableid][E_GAME_TIMER] = SetTimerEx("LuotChoi", THOIGIANCHOCUACAI + 500, false, "ddd", tableid, first_player, THOIGIANCHOCUANGUOICHOI);
    }

    // Kiem tra neu da du 21 diem chua
    new
        dealer_score = KiemTraXiDach(tableid);

    // Rut them bai
    if (cardid >= 1 && dealer_score < 17)
        g_xidachthongtin[tableid][E_GAME_TIMER] = SetTimerEx("BatDauXiDach", THOIGIANCHOCUACAI, false, "d", tableid);

    if (dealer_score >= 17) {
        SendClientMessageToXiD(tableid, COLOR_GREY, "[XI DACH] > >"COL_WHITE" Ban se reset sau 5 giay.");
        g_xidachthongtin[tableid][E_RESET_TIMER] =  SetTimerEx("ResetXiDach", 5000, false, "d", tableid);
    }
}

stock KiemTraLuotChoi(tableid, exclude = INVALID_PLAYER_ID)
{
    new
        playerid = INVALID_PLAYER_ID;

    for (new player_index = 0; player_index < MAX_NGUOI_THAM_GIA; player_index ++) if (g_xidachThongTinBan[tableid][player_index] != -1 && g_xidachtrangthai[tableid][player_index] == TRANG_THAI_NONE && exclude != g_xidachThongTinBan[tableid][player_index] && g_xidachSoNC[tableid][0][player_index] != -1) {
        playerid = g_xidachThongTinBan[tableid][player_index];
        break;
    }
    return playerid;
}

function LuotChoi(tableid, playerid, seconds_left)
{
    new
        player_index = KiemTraBanCuaNguoiChoi(tableid, playerid);

    if (IsPlayerConnected(playerid) && player_index != -1 && seconds_left >= 0 && g_xidachtrangthai[tableid][player_index] == TRANG_THAI_TIEP)
    {
        foreach (new gamerid : Player) if (p_banxidach[gamerid] == tableid) {
            TextDrawSetString(g_xidachluottd[tableid], sprintf("%s con %d giay", GetName(playerid), seconds_left));
            TextDrawShowForPlayer(gamerid, g_xidachluottd[tableid]);
        }
        g_xidachthongtin[tableid][E_GAME_TIMER] = SetTimerEx("LuotChoi", 960, false, "ddd", tableid, playerid, seconds_left - 1);
    }
    else
    {
        new
            next_player = KiemTraLuotChoi(tableid, playerid);

        if (next_player == INVALID_PLAYER_ID)
        {
            TextDrawHideForAll(g_xidachluottd[tableid]);
            g_xidachthongtin[tableid][E_GAME_TIMER] = SetTimerEx("BatDauXiDach", THOIGIANCHOCUACAI, false, "d", tableid);
        }
        else
        {
            new
                next_player_index  = KiemTraBanCuaNguoiChoi(tableid, next_player);

            if (player_index != -1 && g_xidachtrangthai[tableid][player_index] != TRANG_THAI_THANG && g_xidachtrangthai[tableid][player_index] != TRANG_THAI_THUA)
            	g_xidachtrangthai[tableid][player_index] = TRANG_THAI_DAN;

            g_xidachtrangthai[tableid][next_player_index] = TRANG_THAI_TIEP;
            g_xidachthongtin[tableid][E_GAME_TIMER] = SetTimerEx("LuotChoi", 960, false, "ddd", tableid, next_player, THOIGIANCHOCUANGUOICHOI);
        }
    }
}

function ResetXiDach(tableid)
{
	if (tableid == -1)
		return;
    ApplyDynamicActorAnimation(g_xidachthongtin [tableid][E_ACTOR], "DEALER","DEALER_IDLE",4.0,1,0,0,0,0);
    // bien'
    SetGiaTriXiDachChoCai(tableid, -1);
    KillTimer(g_xidachthongtin[tableid][E_RESET_TIMER]), g_xidachthongtin[tableid][E_RESET_TIMER] = -1;
    KillTimer(g_xidachthongtin[tableid][E_GAME_TIMER]), g_xidachthongtin[tableid][E_GAME_TIMER] = -1;
    KillTimer(g_xidachthongtin[tableid][E_THOIGIANRUT]), g_xidachthongtin[tableid][E_THOIGIANRUT] = -1;
    g_xidachthongtin[tableid][E_SOBAIDARUT] = 0;

    // thong tin bai`
    for (new c = 0; c < MAX_BAI_RUT; c ++) {
        g_xidachSoCC[tableid][c] = -1;
        TextDrawSetString(g_xidachbaiCai[tableid][c], "ld_card:cdback");

        for (new p = 0; p < MAX_NGUOI_THAM_GIA; p ++) {
            g_xidachtrangthai[tableid][p] = TRANG_THAI_NONE;
            g_xidachSoNC[tableid][c][p] = -1;
            TextDrawSetString(g_xidachbaiNguoiChoi[tableid][c][p], "ld_card:cdback");
            if (c > 1) TextDrawHideForAll(g_xidachbaiNguoiChoi[tableid][c][p]);
        }
    }

    // Hien lai bai` cho nguoi choi
    for (new player_index = 0; player_index < MAX_NGUOI_THAM_GIA; player_index ++)
    {
        if (g_xidachThongTinBan[tableid][player_index] != -1)
        {
            new
                gamerid = g_xidachThongTinBan[tableid][player_index];

            // Reset lai  bai
            SetGiaTriXiDach(tableid, player_index, 0);
            p_socardrut[tableid][player_index] = 0;
            // Dan khi chi co 2 la
            for (new c = 0; c < MAX_BAI_RUT; c ++)
            {
                TextDrawShowForPlayer(gamerid, g_xidachbaiCai[tableid][c]);

                // Hien bai cua 2 nguoi
                if (c >= 2)
                    continue;

                for (new p = 0; p < DemSoNguoiChoiTrongBan(tableid); p ++) {
                    TextDrawShowForPlayer(gamerid, g_xidachbaiNguoiChoi[tableid][c][p]);
                }
            }
        }
        else SetGiaTriXiDach(tableid, player_index, -1);
    }
}

stock KiemTraXiDach(tableid)
{
    new
        dealer_score = TinhDiemCai(tableid);

    //if (g_xidachthongtin[tableid][E_SOBAIDARUT] <= 1)
    //    return dealer_score;
        //debug
    //printf("Bai cua cai la %d", dealer_score);
    SetGiaTriXiDachChoCai(tableid, dealer_score);

    // tinh diem
    for (new player_index = 0; player_index < MAX_NGUOI_THAM_GIA; player_index ++) if (g_xidachThongTinBan[tableid][player_index] != -1 && g_xidachSoNC[tableid][0][player_index] != -1)
    {
        new playerid = g_xidachThongTinBan[tableid][player_index];
        new player_score = TinhDiemNguoiChoi(tableid, player_index);

        SetGiaTriXiDach(tableid, player_index, player_score);

        if (g_xidachtrangthai[tableid][player_index] != TRANG_THAI_THUA && g_xidachtrangthai[tableid][player_index] != TRANG_THAI_THANG )
        {
            new
                payout = floatround(float(g_xidachthongtin[tableid][E_TIEN]) * 2.0);

            // kiem tra win
       		if (dealer_score == player_score && dealer_score >= 17) {
       			payout = g_xidachthongtin[ tableid ] [ E_TIEN ];
                g_xidachtrangthai[tableid][player_index] = TRANG_THAI_THANG;
                SendClientMessageToXiD(tableid, COLOR_GREY, "[XI DACH] >"COL_WHITE" %s(%d) da duoc hoan %s vi bang diem cai.", GetName(playerid), playerid, FormatNumber(payout));
                PlayerInfo[playerid][pCasinoChip] += payout;
                UpdateVar(playerid, "CasinoChip", PlayerInfo[playerid][pCasinoChip]);
                GameTextForPlayer(playerid, sprintf("~n~~n~~y~CHAY $%s !", FormatNumber(payout)), 4000, 3);
            }
            else if (p_socardrut[tableid][player_index] == 5 && player_score <= 21)
            {
                g_xidachtrangthai[tableid][player_index] = TRANG_THAI_THANG;
                if (KiemTraXemCo21Khong(tableid, player_index, player_score)) {
                    payout = floatround( float( g_xidachthongtin[ tableid ] [ E_TIEN ] ) * 2.5 );
                    SendClientMessageToXiD(tableid, COLOR_GREY, "[XI DACH] >"COL_WHITE" NGU LINH! %s(%d) da thang %s!", GetName(playerid), playerid, FormatNumber(payout));
                } else {
                    SendClientMessageToXiD(tableid, COLOR_GREY, "[XI DACH] >"COL_WHITE" %s(%d) da thang %s vi duoc ngu linh!", GetName(playerid), playerid, FormatNumber(payout));
                }
                PlayerInfo[playerid][pCasinoChip] += payout;
                UpdateVar(playerid, "CasinoChip", PlayerInfo[playerid][pCasinoChip]);
                GameTextForPlayer(playerid, sprintf("~n~~n~~g~NGU LINH $%s!", FormatNumber(payout)), 4000, 3);
            }
            else if (player_score == 21) {
                g_xidachtrangthai[tableid][player_index] = TRANG_THAI_THANG;
                if (KiemTraXemCo21Khong(tableid, player_index, player_score)) {
	                payout = floatround( float( g_xidachthongtin[ tableid ] [ E_TIEN ] ) * 2.5 );
	                SendClientMessageToXiD(tableid, COLOR_GREY, "[XI DACH] >"COL_WHITE" Xi dach! %s(%d) da thang %s!", GetName(playerid), playerid, FormatNumber(payout));
                } else {
	                SendClientMessageToXiD(tableid, COLOR_GREY, "[XI DACH] >"COL_WHITE" %s(%d) da thang %s vi duoc 21 diem!", GetName(playerid), playerid, FormatNumber(payout));
                }
		 		GameTextForPlayer(playerid, sprintf("~n~~n~~g~THANG $%s!", FormatNumber(payout)), 4000, 3);
                PlayerInfo[playerid][pCasinoChip] += payout;
                UpdateVar(playerid, "CasinoChip", PlayerInfo[playerid][pCasinoChip]);
            }
            else if (dealer_score == 21) {
                g_xidachtrangthai[tableid][player_index] = TRANG_THAI_THUA;
                SendClientMessageToXiD(tableid, COLOR_GREY, "[XI DACH] >"COL_WHITE" %s(%d) da thua %s vi cai duoc %s diem.", GetName(playerid), playerid, FormatNumber(g_xidachthongtin[tableid][E_TIEN]), KiemTraXemCaiCo21Khong(tableid, dealer_score) ? ("blackjack") : ("21"));
		 		GameTextForPlayer(playerid, "~n~~n~~r~THUA!", 4000, 3);
            }
            else if (player_score > 21) {
                g_xidachtrangthai[tableid][player_index] = TRANG_THAI_THUA;
                SendClientMessageToXiD(tableid, COLOR_GREY, "[XI DACH] >"COL_WHITE" %s(%d) da thua %s vi quac.", GetName(playerid), playerid, FormatNumber(g_xidachthongtin[tableid][E_TIEN]));
		 		GameTextForPlayer(playerid, "~n~~n~~r~THUA!", 4000, 3);
            }
            else if (dealer_score > 21) {
                g_xidachtrangthai[tableid][player_index] = TRANG_THAI_THANG;
                SendClientMessageToXiD(tableid, COLOR_GREY, "[XI DACH] >"COL_WHITE" %s(%d) da thang %s vi cai quac.", GetName(playerid), playerid, FormatNumber(payout));
		 		GameTextForPlayer(playerid, sprintf("~n~~n~~g~THANG $%s!", FormatNumber(payout)), 4000, 3);
                PlayerInfo[playerid][pCasinoChip] += payout;
                UpdateVar(playerid, "CasinoChip", PlayerInfo[playerid][pCasinoChip]);
            }
            else if (player_score < dealer_score && dealer_score >= 17) {
                g_xidachtrangthai[tableid][player_index] = TRANG_THAI_THUA;
                SendClientMessageToXiD(tableid, COLOR_GREY, "[XI DACH] >"COL_WHITE" %s(%d) da thua %s vi cai nhieu diem hon.", GetName(playerid), playerid, FormatNumber(g_xidachthongtin[tableid][E_TIEN]));
		 		GameTextForPlayer(playerid, "~n~~n~~r~THUA!", 4000, 3);
            }
            else if (player_score > dealer_score && dealer_score >= 17) {
                g_xidachtrangthai[tableid][player_index] = TRANG_THAI_THANG;
                SendClientMessageToXiD(tableid, COLOR_GREY, "[XI DACH] >"COL_WHITE" %s(%d) da thang %s vi cai it diem hon.", GetName(playerid), playerid, FormatNumber(g_xidachthongtin[tableid][E_TIEN]));
		 		GameTextForPlayer(playerid, sprintf("~n~~n~~g~THANG $%s!", FormatNumber(payout)), 4000, 3);
                PlayerInfo[playerid][pCasinoChip] += payout;
                UpdateVar(playerid, "CasinoChip", PlayerInfo[playerid][pCasinoChip]);
            }
        }
    }
    return dealer_score;
}

stock DuoiNguoiChoiKhoiBan(playerid, reset_cam = 0)
{
    if (! (0 <= playerid < MAX_PLAYERS))
        return 0;

    new
        blackjack_table = p_banxidach[playerid];

    if (blackjack_table == -1)
        return 0;

    for (new c = 0; c < MAX_BAI_RUT; c ++) {
        TextDrawHideForPlayer(playerid, g_xidachbaiCai[blackjack_table][c]);

        for (new p = 0; p < MAX_NGUOI_THAM_GIA; p ++) {
            TextDrawHideForPlayer(playerid, g_xidachbaiNguoiChoi[blackjack_table][c][p]);
        }
    }
  	TextDrawHideForPlayer(playerid, g_xidachluottd[blackjack_table]);

    new
        player_index = KiemTraBanCuaNguoiChoi(blackjack_table, playerid);

    if (player_index != -1)
    {
        foreach (new i : Player) if (p_banxidach[i] == blackjack_table) {
            for (new c = 0; c < MAX_BAI_RUT; c ++) {
                g_xidachSoNC[blackjack_table][c][player_index] = -1;
                g_xidachtrangthai[blackjack_table][player_index] = TRANG_THAI_NONE;
                TextDrawSetString(g_xidachbaiNguoiChoi[blackjack_table][c][player_index], "ld_card:cdback");
                TextDrawHideForPlayer(i, g_xidachbaiNguoiChoi[blackjack_table][c][player_index]);
            }
        }
        g_xidachThongTinBan[blackjack_table][player_index] = -1;
        SetGiaTriXiDach(blackjack_table, player_index, -1);
    }

    if (reset_cam) {
        TogglePlayerControllable(playerid, 1);
        ClearAnimations(playerid);
        SetCameraBehindPlayer(playerid);
        HidePlayerHelpDialog(playerid);
    }

    p_banxidach[playerid] = -1;

    if (DemSoNguoiChoiTrongBan(blackjack_table) <= 0)
		ResetXiDach(blackjack_table);

    return 1;
}

stock SendClientMessageToXiD(tableid, colour, format[], va_args<>)
{
    static
        out[144];

    va_format(out, sizeof(out), format, va_start<3>);

    for(new i = 0; i < 10; i++) if (p_banxidach[i] == tableid) {
        SendClientMessage(i, colour, out);
    }
    return 1;
}

stock TaoTDXiDach(id)
{
    g_xidachluottd[id] = TextDrawCreate(330.000000, 204.000000, "dude");
    TextDrawAlignment(g_xidachluottd[id], 2);
    TextDrawBackgroundColor(g_xidachluottd[id], 255);
    TextDrawFont(g_xidachluottd[id], 1);
    TextDrawLetterSize(g_xidachluottd[id], 0.260000, 1.200000);
    TextDrawColor(g_xidachluottd[id], 16711935);
    TextDrawSetOutline(g_xidachluottd[id], 1);
    TextDrawSetProportional(g_xidachluottd[id], 1);

    for (new c = 0; c < MAX_BAI_RUT; c ++)
    {
        g_xidachbaiCai[id][c] = TextDrawCreate(243.000000 + 35.0 * float(c), 138.000000, "ld_card:cdback");
        TextDrawBackgroundColor(g_xidachbaiCai[id][c], 255);
        TextDrawFont(g_xidachbaiCai[id][c], 4);
        TextDrawLetterSize(g_xidachbaiCai[id][c], 0.500000, 1.000000);
        TextDrawUseBox(g_xidachbaiCai[id][c], 1);
        TextDrawBoxColor(g_xidachbaiCai[id][c], 255);
        TextDrawTextSize(g_xidachbaiCai[id][c], 30.000000, 51.000000);
    }

    new
        Float: g_blackjackPlayerPosition[MAX_NGUOI_THAM_GIA][2] = { { 295.0, 334.0 }, { 205.0, 319.0 }, { 390.0, 329.0 } };

    for (new c = 0; c < MAX_BAI_RUT; c ++)
    {
        for (new p = 0; p < MAX_NGUOI_THAM_GIA; p ++)
        {
            g_xidachbaiNguoiChoi[id][c][p] = TextDrawCreate(g_blackjackPlayerPosition[p][0] + 10.0 * float(c), g_blackjackPlayerPosition[p][1] - 16.0 * float(c), "ld_card:cdback");
            TextDrawBackgroundColor(g_xidachbaiNguoiChoi[id][c][p], 255);
            TextDrawFont(g_xidachbaiNguoiChoi[id][c][p], 4);
            TextDrawLetterSize(g_xidachbaiNguoiChoi[id][c][p], 0.5, 0.7);
            TextDrawUseBox(g_xidachbaiNguoiChoi[id][c][p], 1);
            TextDrawBoxColor(g_xidachbaiNguoiChoi[id][c][p], 255);
            TextDrawTextSize(g_xidachbaiNguoiChoi[id][c][p], 22.000000, 37.000000);
        }
    }

}

stock KiemTraXemCo21Khong(tableid, player_index, card_count)
{
	if (card_count == 21 && (g_xidachSoNC[tableid][0][player_index] == 0 || g_xidachSoNC[tableid][0][player_index] == 13 || g_xidachSoNC[tableid][0][player_index] == 26 || g_xidachSoNC[tableid][0][player_index] == 39))
		return true;

	if (card_count == 21 && (g_xidachSoNC[tableid][1][player_index] == 0 || g_xidachSoNC[tableid][1][player_index] == 13 || g_xidachSoNC[tableid][1][player_index] == 26 || g_xidachSoNC[tableid][1][player_index] == 39))
		return true;

	return false;
}

stock KiemTraXemCaiCo21Khong(tableid, card_count)
{
	if (card_count == 21 && (g_xidachSoCC[tableid][0] == 0 || g_xidachSoCC[tableid][0] == 13 || g_xidachSoCC[tableid][0] == 26 || g_xidachSoCC[tableid][0] == 39))
		return true;

	if (card_count == 21 && (g_xidachSoCC[tableid][1] == 0 || g_xidachSoCC[tableid][1] == 13 || g_xidachSoCC[tableid][1] == 26 || g_xidachSoCC[tableid][1] == 39))
		return true;

	return false;
}

stock DemDiemQuaBai(card_index)
{
    new
        card_value = 0;

    switch (card_index)
    {
        case 0, 13, 26, 39: card_value = 1;
        case 1, 14, 27, 40: card_value = 2;
        case 2, 15, 28, 41: card_value = 3;
        case 3, 16, 29, 42: card_value = 4;
        case 4, 17, 30, 43: card_value = 5;
        case 5, 18, 31, 44: card_value = 6;
        case 6, 19, 32, 45: card_value = 7;
        case 7, 20, 33, 46: card_value = 8;
        case 8, 21, 34, 47: card_value = 9;
        case 9, 22, 35, 48, 10, 23, 36, 49, 11, 24, 37, 50, 12, 25, 38, 51: card_value = 10;
    }
    return card_value;
}

stock KiemTraBanCuaNguoiChoi(tableid, playerid)
{
    for (new player_index = 0; player_index < MAX_NGUOI_THAM_GIA; player_index ++) if (playerid == g_xidachThongTinBan[tableid][player_index]) {
        return player_index;
    }
    return -1;
}

stock DemSoNguoiChoiTrongBan(tableid) {
    new
        count = 0;

    for (new p = 0; p < MAX_NGUOI_THAM_GIA; p ++) if (g_xidachThongTinBan[tableid][p] != -1)
        count ++;

    return count;
}

stock SetGiaTriXiDach(tableid, player_index, score) {
    if (score != -1) {
        new playerid = g_xidachThongTinBan[tableid][player_index];
        UpdateDynamic3DTextLabelText(g_xidachthongtin[tableid][E_LABEL_NC][player_index], COLOR_GOLD, sprintf("%s\n"COL_GREY"Diem:"COL_LRED" %d", GetName(playerid), score));
    } else {
        UpdateDynamic3DTextLabelText(g_xidachthongtin[tableid][E_LABEL_NC][player_index], 0, sprintf("Nguoi choi %d", player_index));
    }
}

stock SetGiaTriXiDachChoCai(tableid, score) {
    if (score != -1) {
        UpdateDynamic3DTextLabelText(g_xidachthongtin[tableid][E_LABEL_CAI], COLOR_GREY, sprintf(""COL_GREEN"Cái\nDiem:"COL_RED" %d", score));
    } else {
        UpdateDynamic3DTextLabelText(g_xidachthongtin[tableid][E_LABEL_CAI], COLOR_WHITE, sprintf(""COL_PLATINUM"XI DACH\nBam nut 'F' de tham gia\n"COL_WHITE"Muc cuoc : "COL_RED"%s ", FormatNumber(g_xidachthongtin[tableid][E_TIEN])));
    }
}

stock TinhDiemNguoiChoi(tableid, player_index)
{
    new
        player_score = 0;

    // them bai
    for (new c = 0; c < MAX_BAI_RUT; c ++) if (g_xidachSoNC[tableid][c][player_index] != -1) {
        player_score += DemDiemQuaBai(g_xidachSoNC[tableid][c][player_index]); // 
    }

    // kiem tra xi dach
    for (new a = 0; a < MAX_BAI_RUT; a ++) if (DemDiemQuaBai(g_xidachSoNC[tableid][a][player_index]) == 1) {
        if (player_score + 10 <= 21) player_score += 10; // neu nhu co mot la 1 thi dem la 11 
        break;
    }
    return player_score;
}

stock TinhDiemCai(tableid)
{
    new
        dealer_score = 0;

    // them bai cho cai'
    for (new c = 0; c < MAX_BAI_RUT; c ++) if (g_xidachSoCC[tableid][c] != -1) {
        dealer_score += DemDiemQuaBai(g_xidachSoCC[tableid][c]); //
    }

    // kiem tra bai cua cai
    for (new a = 0; a < MAX_BAI_RUT; a ++) if (DemDiemQuaBai(g_xidachSoCC[tableid][a]) == 1) {
        // neu nhu co mot la 1 thi dem la 11 
        if (dealer_score + 10 <= 21) dealer_score += 10;
        break;
    }
    return dealer_score;
}
