ptask CaseTimer[1000](i) {
    if(CrateTime{i} > 0) {
        CrateTime{i} --;

        new amount, rand = random(28), string[128];
        switch(rand) {
            /*case 0..7: {
                amount = random(20) + 10;
                format(string, sizeof(string), "~r~Box System~w~~b~~n~~n~Step: %d/30~n~~y~%s xu", 30-CrateTime{i}, FormatNumber(amount));
                PlayerTextDrawSetString(i, CrateTD, string);
                if(CrateTime{i} == 0)
                {
                    static stringg[100];
                    PlayerInfo[i][pPremiumPoints] += amount, Update(i, pPremiumPointsx);
                    PlayerTextDrawHide(i, CrateTD);
                    format(stringg,sizeof stringg,"Ban nhan duoc %d xu",amount);
                    SendClientMessage(i, COLOR_YELLOW,stringg);
                }
            }*/
            case 8..21: {
                amount = random(5) + 2;
                format(string, sizeof(string), "~r~Box System~w~~b~~n~~n~Step: %d/30~n~~y~%sx RP", 30-CrateTime{i}, FormatNumber(amount));
                PlayerTextDrawSetString(i, CrateTD, string);
                if(CrateTime{i} == 0)
                {
                    static stringg[100];
                    PlayerInfo[i][pExp] += amount, Update(i, pRP);
                    PlayerTextDrawHide(i, CrateTD);
                    format(stringg,sizeof stringg,"Ban nhan duoc %d respect points",amount);
                    SendClientMessage(i, COLOR_YELLOW,stringg);
                }
            }
            // case 17..21: {
            //     amount = 100 + random(100);
            //     format(string, sizeof(string), "~r~Box System~w~~b~~n~~n~Step: %d/30~n~~p~Skin ID: %s", 30-CrateTime{i}, FormatNumber(amount));
            //     PlayerTextDrawSetString(i, CrateTD, string);
            //     if(CrateTime{i} == 0) { 
            //         if(total_skins(i) == 10 ) {
            //             PlayerInfo[i][pCrates] ++;
            //             save_crates(i);
            //             PlayerTextDrawHide(i, CrateTD);
            //             SendClientMessage(i, COLOR_YELLOW, "Ban nhan duoc skin, boi vi ban da so huu toi da 10 skin!");
            //         }
            //         else {
            //             PlayerTextDrawHide(i, CrateTD), SendClientMessage(i, COLOR_YELLOW, "Ban nhan duoc skin!");
            //             give_skin(i, amount);
            //         } 
            //     }    
            // }   
            default: {
                amount = random(300000) + 200000;
                format(string, sizeof(string), "~r~Box System~w~~b~~n~~n~Step: %d/30~n~~g~$%s", 30-CrateTime{i}, FormatNumber(amount));
                PlayerTextDrawSetString(i, CrateTD, string);
                if(CrateTime{i} == 0)
                {
                    static stringg[100];
                    GivePlayerCash(i, amount);
                    PlayerTextDrawHide(i, CrateTD);
                    format(stringg,sizeof stringg,"Ban nhan duoc $%d",amount);
                    SendClientMessage(i, COLOR_YELLOW,stringg);
                }
            }      
        }
    }
}
Dialog:DIALOG_CRATES(playerid, response, listitem, inputtext[])
{
    if(!response) return 1;
    switch(listitem) {
        case 0: {
            if(PlayerInfo[playerid][pCrates] == 0) return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong co mot cai Premium Box!");
            PlayerInfo[playerid][pCrates] --;
            UpdateVar(playerid, "Crates", PlayerInfo[playerid][pCrates]);
        }
    }
    CrateTime{playerid} = 20;
    PlayerTextDrawSetString(playerid, CrateTD, "Loading...");
    PlayerTextDrawShow(playerid, CrateTD);
    return 1;
}
CMD:openbox(playerid, params[]) 
{
    if(GetPVarInt(playerid, "LoadOpenBoxTD") != 1) {
        SetPVarInt(playerid, "LoadOpenBoxTD", 1);
        CrateTD = CreatePlayerTextDraw(playerid, 323.333129, 192.488830, "~r~Hom kho bao~w~~h~n~~n~~Crate Step: 30/30~n~Won: ~g~$500,000");
        PlayerTextDrawLetterSize(playerid, CrateTD, 0.400000, 1.600000);//0.291666, 1.479703
        PlayerTextDrawTextSize(playerid, CrateTD, 0.000000, 120.000000);//0.000000, 141.000000
        PlayerTextDrawAlignment(playerid, CrateTD, 2);
        PlayerTextDrawColor(playerid, CrateTD, -1);
        PlayerTextDrawUseBox(playerid, CrateTD, 1);
        PlayerTextDrawBoxColor(playerid, CrateTD, 3553631);
        PlayerTextDrawSetShadow(playerid, CrateTD, 0);
        PlayerTextDrawSetOutline(playerid, CrateTD, 1);
        PlayerTextDrawBackgroundColor(playerid, CrateTD, 105);
        PlayerTextDrawFont(playerid, CrateTD, 2);
        PlayerTextDrawSetProportional(playerid, CrateTD, 1);
        PlayerTextDrawSetShadow(playerid, CrateTD, 0);
    }
    new string[128];
    format(string, sizeof(string),
    "#\tAmount\n\
    Hop Qua Box\t%d\n",
    PlayerInfo[playerid][pCrates]);
    Dialog_Show(playerid, DIALOG_CRATES, DIALOG_STYLE_TABLIST_HEADERS, "My Box", string, "Chon", "Huy bo");
    return 1;
}
CMD:givecase(playerid, params[])
{
    new id, amount;
    if(PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, -1, "Admin 6 required."); 
    if(sscanf(params, "ii", id, amount)) return SendClientMessage(playerid, -1, "/givecase [playerid] [amount]");
    if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, "Nguoi choi do khong ket noi");
    PlayerInfo[id][pCrates] += amount;
    UpdateVar(id, "Crates", amount);
    new string[128];
    format(string, sizeof(string), "Ban da dua cho %s %d chia khoa.", GetName(id), amount);
    SendClientMessage(playerid, -1, string);
    format(string, sizeof(string), "%s da cho ban %d chia khoa.", GetName(playerid), amount);
    SendClientMessage(id, -1, string);
    return 1;
}
CMD:giveallcase(playerid, params[])
{
    new amount;
    if(PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, -1, "Admin 6 required."); 
    if(sscanf(params, "ii", amount)) return SendClientMessage(playerid, -1, "/giveallcase  [amount]");
    new string[128];
    foreach(new i: Player) {
        if(IsPlayerConnected(i) && IsPlayerLogged[i] == 1) {
            PlayerInfo[i][pCrates] += amount;
            UpdateVar(i, "Crates", amount);
            format(string, sizeof(string), " Admin {F03636}%s{FFFFFF} da tang tat ca nguoi choi %d hop qua! [/openbox de mo]", amount);
            SendClientMessage(i,COLOR_WHITE,string);
        }
    }
    return 1;
}