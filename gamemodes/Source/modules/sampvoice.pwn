#include <sampvoice>
#include <YSI_Coding\y_hooks>

// new SV_GSTREAM:gstream = SV_NULL;
new SV_LSTREAM:lstream[MAX_PLAYERS] = { SV_NULL, ... };
new Text3D:sampvoice_Label[MAX_PLAYERS];
new Iterator:SVPlayer<MAX_PLAYERS>;

new bool:PlayerVoice[MAX_PLAYERS];
new bool:FactionVoice[MAX_PLAYERS];

// faction stream
new SV_LSTREAM:fstream[MAX_FACTIONS] = { SV_NULL, ... };

/*
    The public OnPlayerActivationKeyPress and OnPlayerActivationKeyRelease
    are needed in order to redirect the player's audio traffic to the
    corresponding streams when the corresponding keys are pressed.
*/

public SV_VOID:OnPlayerActivationKeyPress(SV_UINT:playerid, SV_UINT:keyid) 
{
    // Attach player to local stream as speaker if 'B' key is pressed
    if (keyid == 0x42 && lstream[playerid]) SvAttachSpeakerToStream(lstream[playerid], playerid);
    // Attach the player to the global stream as a speaker if the 'Z' key is pressed
    
    new facId = PlayerInfo[playerid][pMember];
    if (keyid == 0x5A && facId != 0 && fstream[facId]) SvAttachSpeakerToStream(fstream[facId], playerid);
}

public SV_VOID:OnPlayerActivationKeyRelease(SV_UINT:playerid, SV_UINT:keyid)
{
    // Detach the player from the local stream if the 'B' key is released
    if (keyid == 0x42 && lstream[playerid]) SvDetachSpeakerFromStream(lstream[playerid], playerid);
    // Detach the player from the global stream if the 'Z' key is released

    new facId = PlayerInfo[playerid][pMember];
    if (keyid == 0x5A && facId != 0 && fstream[facId]) SvDetachSpeakerFromStream(fstream[facId], playerid);
}

hook ResetVariables(playerid) {
    PlayerVoice[playerid] = false;
    FactionVoice[playerid] = false;

    return 1;
}

hook OnPlayerConnect(playerid) {
    // Checking for plugin availability
    if (SvGetVersion(playerid) == SV_NULL)
    {
        SendClientMessage(playerid, -1, "Could not find plugin sampvoice.");
    }
    // Checking for a microphone
    else if (SvHasMicro(playerid) == SV_FALSE)
    {
        SendClientMessage(playerid, -1, "The microphone could not be found.");
    }
    // Create a local stream with an audibility distance of 40.0, an unlimited number of listeners
    // and the name 'Local' (the name 'Local' will be displayed in red in the players' speakerlist)
    else if ((lstream[playerid] = SvCreateDLStreamAtPlayer(40.0, SV_INFINITY, playerid, 0xff0000ff, "Local"))) {
        sampvoice_Label[playerid] = CreateDynamic3DTextLabel("[VOICE READY]", COLOR_YELLOW, 0, 0, 0.37, 40, .attachedplayer = playerid, .testlos = 1);

        Iter_Add(SVPlayer, playerid);

        SendClientMessage(playerid, -1, "Press B to talk to local chat.");
        // SendClientMessage(playerid, -1, "Press Z to talk to global chat and B to talk to local chat.");

        // Attach the player to the global stream as a listener
        // if (gstream) SvAttachListenerToStream(gstream, playerid);

        // Assign microphone activation keys to the player
        SvAddKey(playerid, 0x42);
        SvAddKey(playerid, 0x5A);
    }

    return 1;
}

hook OnPlayerDisconnect(playerid, reason) {
    // Removing the player's local stream after disconnecting
    if (lstream[playerid])
    {
        SvDeleteStream(lstream[playerid]);
        lstream[playerid] = SV_NULL;

        DestroyDynamic3DTextLabel(sampvoice_Label[playerid]);

        Iter_Remove(SVPlayer, playerid);
    }

    return 1;
}

hook OnGameModeInit()
{
    // Uncomment the line to enable debug mode
    // SvDebug(SV_TRUE);

    // gstream = SvCreateGStream(0xffff0000, "Global");

    // init faction stream
    for (new i = 0; i < MAX_FACTIONS; i++)
    {
        new name[40];
        format(name, sizeof(name), "Faction %d", i);
        
        fstream[i] = SvCreateGStream(0xffff0000, name);
    }

    return 1;
}

hook OnGameModeExit()
{
    // if (gstream) SvDeleteStream(gstream);
}

Sampvoice_IsInstalled(playerid) {
    return Iter_Contains(SVPlayer, playerid);
}

CMD:sampvoice(playerid, params[]) {
    if(!Sampvoice_IsInstalled(playerid)) {
        return SendFailMessage(playerid, "Ban chua cai dat Sampvoice");
    }

    new caption[500];

    strcat(caption, "Ten\tTrang thai\n");
    
    format(caption, sizeof(caption), "%s\nVoice ca nhan\t%s\nVoice faction\t%s\n", caption, 
        PlayerVoice[playerid] ? "{00FF00}ON{FFFFFF}" : "{FF0000}OFF{FFFFFF}", 
        FactionVoice[playerid] ? "{00FF00}ON{FFFFFF}" : "{FF0000}OFF{FFFFFF}");
	
    Dialog_Show(playerid, DIALOG_SAMPVOICE, DIALOG_STYLE_TABLIST_HEADERS, "Sampvoice settings", caption, "Toggle", "Cancel");

    return 1;
}

Dialog:DIALOG_SAMPVOICE(playerid, response, listitem, inputtext[]) {
    if(!response) return SendSuccessMessage(playerid, "Close dialog");

    if(listitem == 0) {
        PlayerVoice[playerid] = !PlayerVoice[playerid];
        if(PlayerVoice[playerid]) {
            SendSuccessMessage(playerid, "Voice ca nhan ON");
            SvAttachSpeakerToStream(lstream[playerid], playerid);
        } else {
            SendSuccessMessage(playerid, "Voice ca nhan OFF");
            SvDetachSpeakerFromStream(lstream[playerid], playerid);
        }
    } else if(listitem == 1) {
        FactionVoice[playerid] = !FactionVoice[playerid];

        if(PlayerInfo[playerid][pMember] == 0) {
            SendFailMessage(playerid, "Ban khong phai thanh vien cua mot faction");
            return 1;
        }
        
        if(FactionVoice[playerid]) {
            SendSuccessMessage(playerid, "Voice faction ON");
            SvAttachSpeakerToStream(fstream[PlayerInfo[playerid][pMember]], playerid);
        } else {
            SendSuccessMessage(playerid, "Voice faction OFF");
            SvDetachSpeakerFromStream(fstream[PlayerInfo[playerid][pMember]], playerid);
        }
    }

    Sampvoice_SaveToDB(playerid);

    return 1;
}

Sampvoice_SaveToDB(playerid) {
    va_mysql_query("UPDATE users SET voice_personal = %d, voice_faction = %d WHERE id = %d", PlayerVoice[playerid], FactionVoice[playerid], PlayerInfo[playerid][pSQLID]);

    printf("Saved voice settings for player %d", playerid);
}

Sampvoice_LoadFromDB(playerid) {
    new query[200];

    format(query, sizeof(query), "SELECT voice_personal, voice_faction FROM users WHERE id = %d", PlayerInfo[playerid][pSQLID]);
    new Cache:result = mysql_query(SQL, query);

    for(new i, j = cache_num_rows(); i < j; i++) {
		cache_get_value_name(i, "voice_personal", PlayerVoice[playerid]);
		cache_get_value_name(i, "voice_faction", FactionVoice[playerid]);
    }
    
    cache_delete(result);
    printf("Loaded voice settings for player %d", playerid);

    if(PlayerVoice[playerid]) {
        SvAttachSpeakerToStream(lstream[playerid], playerid);
    }
    if(FactionVoice[playerid]) {
        SvAttachSpeakerToStream(fstream[PlayerInfo[playerid][pMember]], playerid);
    }
}

hook AfterDBLoad(playerid) {
    Sampvoice_LoadFromDB(playerid);
}

// get all players that installed Sampvoice
CMD:sampvoicelist(playerid, params[]) {
    new caption[2000];

    strcat(caption, "Ten\n");
    
    foreach(new i: SVPlayer) {
        format(caption, sizeof(caption), "%s%s\n", caption, ret_GetPlayerName(i));
    }

    if(Iter_Count(SVPlayer) == 0) {
        SendFailMessage(playerid, "Khong co nguoi nao cai dat Sampvoice");
        return 1;
    } 

    Dialog_Show(playerid, DIALOG_SAMPVOICELIST, DIALOG_STYLE_TABLIST_HEADERS, "Sampvoice players", caption, "Close", "Cancel");

    return 1;
}

CMD:fsettings(playerid, params[]) {
    if(PlayerInfo[playerid][pLeader] == 0) {
        SendFailMessage(playerid, "Ban khonng phai la leader");
        return 1;
    }
    
    new caption[500];
    new title[100];

    format(title, sizeof(title), "Faction settings for %s", ret_GetPlayerName(playerid));

    strcat(caption, "Ten\tTrang thai\n");
    format(caption, sizeof(caption), "SAMPVOICE\t%s\n", FactionVoice[playerid] ? "ON" : "OFF");

    Dialog_Show(playerid, DIALOG_FSETTINGS, DIALOG_STYLE_TABLIST_HEADERS, title, caption, "Toggle", "Cancel");
    return 1;
}

Dialog:DIALOG_FSETTINGS(playerid, response, listitem, inputtext[]) {
    if(!response) return SendSuccessMessage(playerid, "Close dialog");
    
    if(listitem == 0) {
        FactionVoice[playerid] = !FactionVoice[playerid];
        if(FactionVoice[playerid]) {
            SendSuccessMessage(playerid, "Voice faction ON");
            SvAttachSpeakerToStream(fstream[PlayerInfo[playerid][pMember]], playerid);

            foreach(new i: SVPlayer) {
                if(PlayerInfo[i][pMember] == PlayerInfo[playerid][pMember] && PlayerVoice[i]) {
                    SvAttachSpeakerToStream(lstream[i], i);
                }
            }
        } else {
            SendSuccessMessage(playerid, "Voice faction OFF");
            SvDetachAllListenersFromStream(fstream[PlayerInfo[playerid][pMember]]);
        }
    }
    
    Sampvoice_SaveToDB(playerid);
    
    return 1;
}

stock getVoiceHelpText() {
    new str[400];

    strcat(str, "- /sampvoice: Bat tat SAMPVOICE\n\
- /fsettings: Lenh cua LEADER de bat su dung mo SAMPVOICE cho moi nguoi\n\
- /sampvoicelist: Xem danh sach nguoi su dung SAMPVOICE\n\
- Cai Dat Voice F11\n\n\
- Voice Gang/Faction: Phim Z\n\
- Voice Server: Phim B");
    return str;
}
