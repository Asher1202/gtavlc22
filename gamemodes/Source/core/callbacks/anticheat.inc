#if defined _nex_ac_included
    static Ac_Name[][] = {
        {"AirBreak [On-foot]"},
        {"AirBreak [In-vehicle]"},
        {"Teleport Hack [On-foot]"},
        {"Teleport Hack [In-vehicle]"},
        {"Teleport Hack #3"},
        {"Teleport Hack #4"},
        {"Teleport Hack #5"},
        {"Fly Hack [On-Foot]"},
        {"Fly Hack [In-vehicle]"},
        {"Speed Hack [On-foot]"},
        {"Speed Hack [In-vehicle]"},
        {"Health Hack #1"},
        {"Health Hack #2"},
        {"Armour Hack"},
        {"Money Hack"},
        {"Weapon Hack"},
        {"Ammo Hack [Them dan]"},
        {"Ammo Hack [Vo han dan]"},
        {"Special actions hack"},
        {"GodMode from bullets #1"},
        {"GodMode from bullets #2"},
        {"Invisible hack"},
        {"lagcomp-spoof"},
        {"Tuning hack"},
        {"Parkour mod"},
        {"Quick turn"},
        {"Rapid fire"},
        {"FakeSpawn"},
        {"FakeKill"},
        {"Pro Aim"},
        {"CJ run"},
        {"CarShot"},
        {"CarJack"},
        {"UnFreeze"},
        {"AFK Ghost"},
        {"Full Aiming"},
        {"Fake NPC"},
        {"Reconnect"},
        {"High ping"},
        {"Dialog hack"},
        {"Protection from the sandbox"},
        {"Protection against an invalid version"},
        {"Rcon hack"},
        {"Tuning crasher"},
        {"Invalid seat crasher"},
        {"Dialog crasher"},
        {"Attached object crasher"},
        {"Weapon Crasher"},
        {"Flood protection connects to one slot"},
        {"Flood callback functions"},
        {"Flood change seat"},
        {"Ddos"},
        {"NOP's"}
    };

    forward OnCheatDetected(playerid, ip_address[], type, code);
    public OnCheatDetected(playerid, ip_address[], type, code)  {
        if(IsPlayerLogged[playerid] == 0 || InDealer[playerid] > 0 || Exception{playerid} > 0 || PlayerInfo[playerid][pTut] == 0) return 1;
        if(!IsAntiCheatEnabled(code)) return 1;
        switch(code)  {
            case 0,1,2,3,4,5,6,7,8,9,10,29,35: {
                if(UsedFly[playerid] == 0 && Spectate[playerid] == 255) { // !IsPlayerPaused(playerid)
                    if(ServerSystem[12] == 0 || StaffOnline() == 0) {
                        va_SendClientMessageToAll(COLOR_LIGHTRED, "Kick: %s da bi kick boi AdmBot, ly do: %s.", GetName(playerid), Ac_Name[code]);
                        InsereazaSanctiune(playerid, playerid, KICK, Ac_Name[code]);
                        AntiCheatKickWithDesync(playerid, code);
                    }
                    else {
                        if(GetPVarInt(playerid, "NexACWarning") < gettime()) {
                            new string[148];
                            format(string, sizeof(string), "(N) %s (%d, level %d) used %s cheats.", GetName(playerid), playerid, PlayerInfo[playerid][pLevel], Ac_Name[code]);
                            SendStaffMessage(0xAA3333AA, string);
                            SetPVarInt(playerid, "NexACWarning", gettime() + 5);
                        }
                    }
                }
            }
            default: {
                va_SendClientMessageToAll(COLOR_LIGHTRED, "Kick: %s da bi kick boi AdmBot, ly do: %s.", GetName(playerid), Ac_Name[code]);

                if(PlayerInfo[playerid][pAdmin] < 5) {
                    InsereazaSanctiune(playerid, playerid, KICK, Ac_Name[code]);    
                    AntiCheatKickWithDesync(playerid, code);
                }
            }
        }
        return 1;
    }
    CMD:anticheat(playerid, params[])  {
        if(PlayerInfo[playerid][pAdmin] < 5) return SendClientMessage(playerid, COLOR_GREY, "Admin 5 required");
        new info[2000];
        strcat(info, "Name\tStatus\n");
        for(new i; i < sizeof(Ac_Name); i++) format(info, sizeof(info), "%s%s\t%s\n", info, Ac_Name[i], IsAntiCheatEnabled(i) ? "{33AA33}Bat" : "{FF0000}Tat");
        Dialog_Show(playerid, ANTI_CHEAT, DIALOG_STYLE_TABLIST_HEADERS, "Anticheats", info, "Toggle", "Exit");
        return 1;
    }
    CMD:onanti(playerid, params[]) {
        for(new i; i < 53; i++) EnableAntiCheatForPlayer(playerid, i, 1);
        SendClientMessage(playerid, -1, "Success");
        return 1;
    }
    Dialog:ANTI_CHEAT(playerid, response, listitem, inputtext[]) {
        if(!response) return 1;
        EnableAntiCheat(listitem, IsAntiCheatEnabled(listitem) ? 0 : 1);
        va_SendClientMessage(playerid, -1, "Ban vua %s %s.", IsAntiCheatEnabled(listitem) ? "bat" : "tat", Ac_Name[listitem]);
        foreach(new i: PlayerAdmins) {
            EnableAntiCheatForPlayer(i, listitem, !IsAntiCheatEnabled(listitem));
        }
        return 1;
    }
#else
    #if defined _AntiCarTroll_included
        public OnPlayerCarTroll(playerid, vehicleid, trolledid, trolltype) {
            if(InDealer[playerid] > 0 || IsPlayerLogged[playerid] == 0 || PlayerInfo[playerid][pAdmin] > 0) return 1;
            if(ServerSystem[11] == 0 || StaffOnline() == 0) NightBot(playerid, "Trollcar");
            else {
                new string[180];
                if(trolledid == INVALID_PLAYER_ID) 
                    format(string, sizeof(string), "Anti-Trollcar: {FFFFFF}%s (CID: %d) su dung trollcar len xe %d.", GetName(playerid), playerid, vehicleid);
                else format(string, sizeof(string), "Anti-Trollcar: {FFFFFF}%s (CID: %d) su dung trollcar len %s (CID: %d), by vehicle %d.", GetName(playerid), playerid, GetName(trolledid), trolledid, vehicleid);
                SendStaffMessage(0xAA3333AA, string);
            }
            return 1;
        }
    #endif
    #if defined _rAntiSpeed_Included
        public OnPlayerSpeedCheat(playerid, speedtype) {
            if(IsPlayerLogged[playerid] == 0 || PlayerInfo[playerid][pAdmin] > 0 || Spectate[playerid] != 255 || IsPlayerPaused(playerid) || Exception{playerid} > 0) return 1;
            new text[30];
            format(text, sizeof(text), (speedtype == 0) ? "Speed-Hack [Chay bo]" : (speedtype == 1) ? "Speed-Hack [Xe]" : "Speed-Hack [May bay]");
            if(ServerSystem[5] == 0 || StaffOnline() == 0) NightBot(playerid, text);
            else if(UsedFly[playerid] == 0 && Spectate[playerid] == 255 && !IsPlayerPaused(playerid)) {
                new string[180];
                format(string, sizeof(string), "Anti Speed-Cheat: {FFFFFF}%s (CID: %d) su dung %s.", GetName(playerid), playerid, text);
                SendStaffMessage(0xAA3333AA, string);
            }
            return 1;
        }
    #endif
    #if defined _rAGM_Included
        public OnPlayerGodmode(playerid, gmtype) {
            if(playerid == INVALID_PLAYER_ID || IsPlayerLogged[playerid] == 0 || PlayerInfo[playerid][pAdmin] > 0) return 1;
            if(UsedFly[playerid] == 0 && Spectate[playerid] == 255 && !IsPlayerPaused(playerid)) {
                if(ServerSystem[15] == 0 || StaffOnline() == 0) NightBot(playerid, "Godmode");
                else {
                    new string[180];
                    format(string, sizeof(string), "Anti God-Mode: {FFFFFF}%s (CID: %d) su dung GodMode.", GetName(playerid), playerid);
                    SendStaffMessage(0xAA3333AA, string);
                }
            }
            return 1;
        }
    #endif
    #if defined _rAntiFakeKill_Included 
        public OnPlayerFakeKill(playerid, spoofedid, spoofedreason, faketype) {
            if(spoofedid == 65535 || IsPlayerLogged[playerid] == 0 || PlayerInfo[playerid][pAdmin] > 0 || IsPlayerPaused(playerid) || spoofedreason == 255 || spoofedreason == 201 || spoofedreason == 200) return 1;
            new string[148], spoofedreasontext[30];
            GetWeaponName(spoofedreason, spoofedreasontext, sizeof(spoofedreasontext));
            format(string, sizeof(string), "{AA3333}Anti-Cheat: {FFFFFF}%s (CID: %d) su dung Fakekill, giet %s (ID: %d) voi vu khi %s, do nguy hiem: %s.", GetName(playerid), playerid, GetName(spoofedid), spoofedid, spoofedreasontext, (faketype == 1) ? "Normal Fakekill (kick ngay lan thu 2)":"Spammed Fakekill (ban ngay lap tuc)");
            if(ServerSystem[14] == 0 || StaffOnline() == 0) NightBot(playerid, "Fakekill");
            else SendStaffMessage(-1, string);
            return 1;
        }
    #endif
    #if defined r_BreakAir_ 
        static OpbaCheatName[][] = {
            {""},
            {"Air-Break [Chay bo]"},
            {"Air-Break [Lai xe]"},
            {"Air-Break [Hanh khach]"},
            {"Teleport [Chay bo]"},
            {"Teleport [Lai xe]"},
            {"Teleport [Hanh khach]"}
        };  
        public OnPlayerBreakAir(playerid, breaktype) {
            if(IsPlayerLogged[playerid] == 0 || PlayerInfo[playerid][pAdmin] > 0 || Spectate[playerid] != 255 || IsPlayerPaused(playerid) || Exception{playerid} > 0) return 1;
            if(ServerSystem[16] == 0 || StaffOnline() == 0) return NightBot(playerid, OpbaCheatName[breaktype]);
            else if(gettime() - GetPVarInt(playerid, "PlayerAirBreak") > 0){
                new string[148];
                SetPVarInt(playerid, "PlayerAirBreak", gettime()+3);
                format(string, sizeof(string), "Anti Break-Air: {FFFFFF}%s (CID: %d) su dung %s.", GetName(playerid), playerid, OpbaCheatName[breaktype]);
                SendStaffMessage(0xAA3333AA, string);
            }
            return 1;
        }
    #endif
    #if defined r_EAC_Included
        public OnPlayerCarSwing(playerid, vehicleid) {
            if(IsPlayerLogged[playerid] == 0 || PlayerInfo[playerid][pAdmin] > 0 || Spectate[playerid] != 255 || IsPlayerPaused(playerid)) return 1;
            if(ServerSystem[17] == 0 || StaffOnline() == 0) return NightBot(playerid, "Carswing");
            if(GetPVarInt(playerid, "CarSwing") < gettime()) {
                new string[148];
                format(string, sizeof(string), "Anti CarSwing: {FFFFFF}%s (CID: %d) su dung carswing (vehicle: %s).", GetName(playerid), playerid, aVehicleNames[GetVehicleModel(vehicleid)-400]);
                SendStaffMessage(0xAA3333AA, string);
                SetPVarInt(playerid, "CarSwing", gettime() + 10);
            }       
            return 1;
        }   
        public OnPlayerParticleSpam(playerid, vehicleid) {
            if(IsPlayerLogged[playerid] == 0 || PlayerInfo[playerid][pAdmin] > 0 || Spectate[playerid] != 255 || IsPlayerPaused(playerid)) return 1;
            if(ServerSystem[18] == 0 || StaffOnline() == 0) return NightBot(playerid, "ParticleSpam");
            if(GetPVarInt(playerid, "ParticleSpam") < gettime()) {
                new string[148];
                format(string, sizeof(string), "Anti ParticleSpam: {FFFFFF}%s (CID: %d) su dung ParticleSpam (vehicle: %s).", GetName(playerid), playerid, aVehicleNames[GetVehicleModel(vehicleid)-400]);
                SendStaffMessage(0xAA3333AA, string);
                SetPVarInt(playerid, "ParticleSpam", gettime() + 10);
            }
            return 1;       
        }
    #endif

#endif
#if defined _AntiCarTroll2_included
    public OnPlayerTroll(playerid) {
        if(InDealer[playerid] > 0 || IsPlayerLogged[playerid] == 0 || PlayerInfo[playerid][pAdmin] > 0 || Spectate[playerid] != 255 || IsPlayerPaused(playerid)) return 1;
        if(ServerSystem[11] == 0 || StaffOnline() == 0) NightBot(playerid, "Trollcar");
        else {
            if(GetPVarInt(playerid, "Trollcar") < gettime()) {
                new string[180];
                format(string, sizeof(string), "Anti-Trollcar: {FFFFFF}%s (CID: %d) co the su dung trollcar.", GetName(playerid), playerid);
                SendStaffMessage(0xAA3333AA, string);
                SetPVarInt(playerid, "Trollcar", gettime() + 10);
            }
        }
        return 1;
    }
#endif
#if defined _rAgc_Included_
    static GunCheatName[][] = {
        {""},
        {"weapon cheat"},
        {"ammo cheat"},
        {"freeze ammo cheat"},
        {"nghi van fakekill"}
        // {"Rapid fire (also super fast cbugging)"}
    };
    public OnPlayerGunCheat(playerid, weaponid, ammo, hacktype) {
        if(IsPlayerLogged[playerid] == 0 || PlayerInfo[playerid][pAdmin] > 0 || Exception{playerid} > 0) return 1;
        if(ServerSystem[1] == 0 || StaffOnline() == 0) return NightBot(playerid, GunCheatName[hacktype]);
        if(GetPVarInt(playerid, "GunCheat") < gettime()) {
            new string[148];
            format(string, sizeof(string), "Anti Gun-Cheat: {FFFFFF}%s (CID: %d) su dung hack %s, ammo: %d, weaponid: %d.", GetName(playerid), playerid, GunCheatName[hacktype], ammo, weaponid);
            SendStaffMessage(0xAA3333AA, string);
            SetPVarInt(playerid, "GunCheat", gettime() + 10);
        }
        return 1;
    }
#endif