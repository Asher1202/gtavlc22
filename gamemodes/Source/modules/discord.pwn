#include <discord-connector>
#include <YSI_Coding\y_hooks>
#include <BCMD1>

static DCC_Channel:g_Discord_Chat;

static channelId[] = "994614591130706040";

hook OnGameModeInit()
{
	g_Discord_Chat = DCC_FindChannelById(channelId); // Discord channel ID

    return 1;
}

public DCC_OnMessageCreate(DCC_Message:message)
{
	// new realMsg[100];
    // DCC_GetMessageContent(message, realMsg, 100);
    // new bool:IsBot;
    // new DCC_Channel:channel;
 	// DCC_GetMessageChannel(message, channel);
    // new DCC_User:author;
	// DCC_GetMessageAuthor(message, author);
    // DCC_IsUserBot(author, IsBot);

    // if(channel == g_Discord_Chat && !IsBot) //!IsBot will block BOT's message in game
    // {
    //     new user_name[32 + 1], str[152];
    //    	DCC_GetUserName(author, user_name, 32);
    //     format(str,sizeof(str), "{8a6cd1}[DISCORD] {aa1bb5}%s: {ffffff}%s",user_name, realMsg);
    //     SendClientMessageToAll(-1, str);
    // }

    return 1;
}

// hook OnPlayerText(playerid, text[])
// {

//     new name[MAX_PLAYER_NAME + 1];
//     GetPlayerName(playerid, name, sizeof name);
//     new msg[128]; 
//     format(msg, sizeof(msg), "```%s: %s```", name, text);
//     DCC_SendChannelMessage(g_Discord_Chat, msg);
//     return 1;
// }

hook OnPlayerConnect(playerid)
{
   	new name[MAX_PLAYER_NAME + 1];
    GetPlayerName(playerid, name, sizeof name);

    if (_:g_Discord_Chat == 0)
    g_Discord_Chat = DCC_FindChannelById("994614591130706040"); // Discord channel ID

    new string[128];
    format(string, sizeof string, " ```%s vua vao game. :)```", name);
    DCC_SendChannelMessage(g_Discord_Chat, string);
    return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
    new name[MAX_PLAYER_NAME + 1];
    GetPlayerName(playerid, name, sizeof name);

    if (_:g_Discord_Chat == 0)
    g_Discord_Chat = DCC_FindChannelById("994614591130706040"); // Discord channel ID

    new string[128];
    format(string, sizeof string, " ```%s vua roi game. :(```", name);
    DCC_SendChannelMessage(g_Discord_Chat, string);
    return 1;
}

BCMD:players(user, channel, params[]) {
    new iPlayers = Iter_Count(Player);
    new playerid;
    new count = 0;
    new name69[MAX_PLAYER_NAME];
    GetPlayerName(playerid, name69, sizeof(name69));
    new _szBigString[ 0 ] = '\0';
    if ( iPlayers <= 30 )
    {
    foreach(new i : Player) {
        if ( IsPlayerConnected( i ) ) {
            format( _szBigString, sizeof( _szBigString ), "%s%s (ID: %d)\n", _szBigString, name69, playerid );
            count++;
        }
    }
    }
    format( _szBigString, sizeof( _szBigString ), "%sThere are %d player(s) online.", _szBigString, count );
    DCC_SendChannelMessage( channel, _szBigString );
    return 1;
}