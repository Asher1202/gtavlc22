#include <YSI_Coding/y_hooks>

#define MAX_TREE 40
#define STOREHOUSE -1080.3639,-1195.3372,129.6956
// new Text:TreeTD[15];

enum enumGardenerTree {
    gntObject,
    gntStair,
    gntStatus,
	Text3D:gntLabel
}
new GardenerTree[MAX_TREE][enumGardenerTree];

enum enumGardener {
	gnTimer,
	gnTreeTaken,
	gnApples,
	gnDeliveryApples,
	gnTreeApples
}
new Gardener[MAX_PLAYERS][enumGardener];



task GardenerTimer[60000]() {
	new gString[200];
	for(new i = 0; i < MAX_TREE; i++) {
		if(GardenerTree[i][gntStatus] > 0) {
			format(gString, sizeof(gString), "{B32020}Cay dang ra trai\n{FFFFFF}%s", CalculeazaTimp2(GardenerTree[i][gntStatus]));
			UpdateDynamic3DTextLabelText(GardenerTree[i][gntLabel], -1, gString);
			GardenerTree[i][gntStatus] -= 60;
		}
		else {
			UpdateDynamic3DTextLabelText(GardenerTree[i][gntLabel], -1, "{8DFF63}Thu hoach cay\n\n\n\n\n\n\n\n\n\n\n\n{FFFFFF}Bam phim {8DFF63}F {FFFFFF}hoac {8DFF63}Enter {FFFFFF}de thu hoach");
		}
	}
}

hook OnPlayerKStateChange(playerid, newkeys, oldkeys) {
    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
	    if(newkeys & KEY_SECONDARY_ATTACK) {
		   	if(JobWorking[playerid] == 2) {
		   		new Float:x,Float:y,Float:z;
				for(new i = 0; i < MAX_TREE; i++) {
					GetDynamicObjectPos(GardenerTree[i][gntStair], x,y,z);
					if(IsPlayerInRangeOfPoint(playerid, 2.0, x,y,z)) {
                        if(Gardener[playerid][gnApples] >= GetMaxPlayerApples(playerid)) return Info(playerid, "Trong kho da day, ban can di giao tao.");
						if(Gardener[playerid][gnTreeTaken] == -1) return 1;
						if(GardenerTree[i][gntStatus] > 0) return Info(playerid, "Cay da duoc thu hoach");
						if(Gardener[playerid][gnTreeApples] > 0) return Info(playerid, "Ban da lay mot hop tao!");
						foreach(new p: Character) { if(Gardener[p][gnTreeTaken] == i) return Info(playerid, "Cay nay da duoc mot nguoi choi khac thu hoach."); }
						SetPlayerFacingAngle(playerid, 90.0), 
						SetPlayerPosEx(playerid, x,y,z), 
						Gardener[playerid][gnTreeTaken] = i;
						RemovePlayerAttachedObject(playerid, ATTACHMENT_ID_BALE), 
						SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE), 
						ApplyAnimation(playerid, "BOMBER", "BOM_Plant_Loop", 4.0, 1, 0, 0, 0, 0), 
						TogglePlayerControllable(playerid, false);
						for(new t = 0; t < sizeof TreeTD; t++) TextDrawShowForPlayer(playerid, TreeTD[t]);
						SelectTextDraw(playerid, 0xFF0000FF), 
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Thu hoach tat ca nhung qua tao ben duoi."), 
						Info(playerid, "De thu hoach tao, nhap chuot vao no");
						return 1;
					}
				}
		   	}
		}
	}
   	return 1;
}

hook OnPlayerConnect(playerid) {
	Gardener[playerid][gnTreeTaken] = -1;
    Gardener[playerid][gnApples] = 0;
    Gardener[playerid][gnDeliveryApples] = 0;
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
    DeletePVar(playerid,"gnApples");
    if(Gardener[playerid][gnTreeTaken]!=-1) GardenerTree[Gardener[playerid][gnTreeTaken]][gntStatus] = -1;
    return 1;
}

hook OnGameModeInit() {

	CreateDynamic3DTextLabel("{4790DE}Nguoi trong vuon\n{FFFFFF}Nhap '/work' de bat dau cong viec\nNhap '/laytraicay' de giao tao", -1, STOREHOUSE, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 15.0);


    TreeTD[0] = TextDrawCreate(509.500000, 308.562500, "");
	TextDrawLetterSize(TreeTD[0], 0.000000, 0.000000);
	TextDrawTextSize(TreeTD[0], 134.000000, 106.000000);
	TextDrawAlignment(TreeTD[0], 1);
	TextDrawColor(TreeTD[0], -1);
	TextDrawSetShadow(TreeTD[0], 0);
	TextDrawSetOutline(TreeTD[0], 0);
	TextDrawBackgroundColor(TreeTD[0], 168430330);
	TextDrawFont(TreeTD[0], 5);
	TextDrawSetProportional(TreeTD[0], 0);
	TextDrawSetShadow(TreeTD[0], 0);
	TextDrawSetPreviewModel(TreeTD[0], 731);
	TextDrawSetPreviewRot(TreeTD[0], 0.000000, 0.000000, 0.000000, 1.000000);

	TreeTD[1] = TextDrawCreate(567.500000, 314.250000, "");
	TextDrawLetterSize(TreeTD[1], 0.000000, 0.000000);
	TextDrawTextSize(TreeTD[1], 34.000000, 26.000000);
	TextDrawAlignment(TreeTD[1], 1);
	TextDrawColor(TreeTD[1], -1);
	TextDrawSetShadow(TreeTD[1], 0);
	TextDrawSetOutline(TreeTD[1], 0);
	TextDrawBackgroundColor(TreeTD[1], 0);
	TextDrawFont(TreeTD[1], 5);
	TextDrawSetProportional(TreeTD[1], 0);
	TextDrawSetShadow(TreeTD[1], 0);
	TextDrawSetSelectable(TreeTD[1], true);
	TextDrawSetPreviewModel(TreeTD[1], 19576);
	TextDrawSetPreviewRot(TreeTD[1], 0.000000, 0.000000, 0.000000, 1.000000);

	TreeTD[2] = TextDrawCreate(578.000000, 327.375000, "");
	TextDrawLetterSize(TreeTD[2], 0.000000, 0.000000);
	TextDrawTextSize(TreeTD[2], 34.000000, 26.000000);
	TextDrawAlignment(TreeTD[2], 1);
	TextDrawColor(TreeTD[2], -1);
	TextDrawSetShadow(TreeTD[2], 0);
	TextDrawSetOutline(TreeTD[2], 0);
	TextDrawBackgroundColor(TreeTD[2], 0);
	TextDrawFont(TreeTD[2], 5);
	TextDrawSetProportional(TreeTD[2], 0);
	TextDrawSetShadow(TreeTD[2], 0);
	TextDrawSetSelectable(TreeTD[2], true);
	TextDrawSetPreviewModel(TreeTD[2], 19576);
	TextDrawSetPreviewRot(TreeTD[2], 0.000000, 0.000000, 0.000000, 1.000000);

	TreeTD[3] = TextDrawCreate(583.000000, 345.750000, "");
	TextDrawLetterSize(TreeTD[3], 0.000000, 0.000000);
	TextDrawTextSize(TreeTD[3], 34.000000, 26.000000);
	TextDrawAlignment(TreeTD[3], 1);
	TextDrawColor(TreeTD[3], -1);
	TextDrawSetShadow(TreeTD[3], 0);
	TextDrawSetOutline(TreeTD[3], 0);
	TextDrawBackgroundColor(TreeTD[3], 0);
	TextDrawFont(TreeTD[3], 5);
	TextDrawSetProportional(TreeTD[3], 0);
	TextDrawSetShadow(TreeTD[3], 0);
	TextDrawSetSelectable(TreeTD[3], true);
	TextDrawSetPreviewModel(TreeTD[3], 19576);
	TextDrawSetPreviewRot(TreeTD[3], 0.000000, 0.000000, 0.000000, 1.000000);

	TreeTD[4] = TextDrawCreate(580.500000, 361.937500, "");
	TextDrawLetterSize(TreeTD[4], 0.000000, 0.000000);
	TextDrawTextSize(TreeTD[4], 34.000000, 26.000000);
	TextDrawAlignment(TreeTD[4], 1);
	TextDrawColor(TreeTD[4], -1);
	TextDrawSetShadow(TreeTD[4], 0);
	TextDrawSetOutline(TreeTD[4], 0);
	TextDrawBackgroundColor(TreeTD[4], 0);
	TextDrawFont(TreeTD[4], 5);
	TextDrawSetProportional(TreeTD[4], 0);
	TextDrawSetShadow(TreeTD[4], 0);
	TextDrawSetSelectable(TreeTD[4], true);
	TextDrawSetPreviewModel(TreeTD[4], 19576);
	TextDrawSetPreviewRot(TreeTD[4], 0.000000, 0.000000, 0.000000, 1.000000);

	TreeTD[5] = TextDrawCreate(581.000000, 376.375000, "");
	TextDrawLetterSize(TreeTD[5], 0.000000, 0.000000);
	TextDrawTextSize(TreeTD[5], 34.000000, 26.000000);
	TextDrawAlignment(TreeTD[5], 1);
	TextDrawColor(TreeTD[5], -1);
	TextDrawSetShadow(TreeTD[5], 0);
	TextDrawSetOutline(TreeTD[5], 0);
	TextDrawBackgroundColor(TreeTD[5], 0);
	TextDrawFont(TreeTD[5], 5);
	TextDrawSetProportional(TreeTD[5], 0);
	TextDrawSetShadow(TreeTD[5], 0);
	TextDrawSetSelectable(TreeTD[5], true);
	TextDrawSetPreviewModel(TreeTD[5], 19576);
	TextDrawSetPreviewRot(TreeTD[5], 0.000000, 0.000000, 0.000000, 1.000000);

	TreeTD[6] = TextDrawCreate(544.000000, 376.812500, "");
	TextDrawLetterSize(TreeTD[6], 0.000000, 0.000000);
	TextDrawTextSize(TreeTD[6], 34.000000, 26.000000);
	TextDrawAlignment(TreeTD[6], 1);
	TextDrawColor(TreeTD[6], -1);
	TextDrawSetShadow(TreeTD[6], 0);
	TextDrawSetOutline(TreeTD[6], 0);
	TextDrawBackgroundColor(TreeTD[6], 0);
	TextDrawFont(TreeTD[6], 5);
	TextDrawSetProportional(TreeTD[6], 0);
	TextDrawSetShadow(TreeTD[6], 0);
	TextDrawSetSelectable(TreeTD[6], true);
	TextDrawSetPreviewModel(TreeTD[6], 19576);
	TextDrawSetPreviewRot(TreeTD[6], 0.000000, 0.000000, 0.000000, 1.000000);

	TreeTD[7] = TextDrawCreate(541.000000, 362.812500, "");
	TextDrawLetterSize(TreeTD[7], 0.000000, 0.000000);
	TextDrawTextSize(TreeTD[7], 34.000000, 26.000000);
	TextDrawAlignment(TreeTD[7], 1);
	TextDrawColor(TreeTD[7], -1);
	TextDrawSetShadow(TreeTD[7], 0);
	TextDrawSetOutline(TreeTD[7], 0);
	TextDrawBackgroundColor(TreeTD[7], 0);
	TextDrawFont(TreeTD[7], 5);
	TextDrawSetProportional(TreeTD[7], 0);
	TextDrawSetShadow(TreeTD[7], 0);
	TextDrawSetSelectable(TreeTD[7], true);
	TextDrawSetPreviewModel(TreeTD[7], 19576);
	TextDrawSetPreviewRot(TreeTD[7], 0.000000, 0.000000, 0.000000, 1.000000);

	TreeTD[8] = TextDrawCreate(538.500000, 347.937500, "");
	TextDrawLetterSize(TreeTD[8], 0.000000, 0.000000);
	TextDrawTextSize(TreeTD[8], 34.000000, 26.000000);
	TextDrawAlignment(TreeTD[8], 1);
	TextDrawColor(TreeTD[8], -1);
	TextDrawSetShadow(TreeTD[8], 0);
	TextDrawSetOutline(TreeTD[8], 0);
	TextDrawBackgroundColor(TreeTD[8], 0);
	TextDrawFont(TreeTD[8], 5);
	TextDrawSetProportional(TreeTD[8], 0);
	TextDrawSetShadow(TreeTD[8], 0);
	TextDrawSetSelectable(TreeTD[8], true);
	TextDrawSetPreviewModel(TreeTD[8], 19576);
	TextDrawSetPreviewRot(TreeTD[8], 0.000000, 0.000000, 0.000000, 1.000000);

	TreeTD[9] = TextDrawCreate(542.500000, 335.250000, "");
	TextDrawLetterSize(TreeTD[9], 0.000000, 0.000000);
	TextDrawTextSize(TreeTD[9], 34.000000, 26.000000);
	TextDrawAlignment(TreeTD[9], 1);
	TextDrawColor(TreeTD[9], -1);
	TextDrawSetShadow(TreeTD[9], 0);
	TextDrawSetOutline(TreeTD[9], 0);
	TextDrawBackgroundColor(TreeTD[9], 0);
	TextDrawFont(TreeTD[9], 5);
	TextDrawSetProportional(TreeTD[9], 0);
	TextDrawSetShadow(TreeTD[9], 0);
	TextDrawSetSelectable(TreeTD[9], true);
	TextDrawSetPreviewModel(TreeTD[9], 19576);
	TextDrawSetPreviewRot(TreeTD[9], 0.000000, 0.000000, 0.000000, 1.000000);

	TreeTD[10] = TextDrawCreate(550.500000, 321.250000, "");
	TextDrawLetterSize(TreeTD[10], 0.000000, 0.000000);
	TextDrawTextSize(TreeTD[10], 34.000000, 26.000000);
	TextDrawAlignment(TreeTD[10], 1);
	TextDrawColor(TreeTD[10], -1);
	TextDrawSetShadow(TreeTD[10], 0);
	TextDrawSetOutline(TreeTD[10], 0);
	TextDrawBackgroundColor(TreeTD[10], 0);
	TextDrawFont(TreeTD[10], 5);
	TextDrawSetProportional(TreeTD[10], 0);
	TextDrawSetShadow(TreeTD[10], 0);
	TextDrawSetSelectable(TreeTD[10], true);
	TextDrawSetPreviewModel(TreeTD[10], 19576);
	TextDrawSetPreviewRot(TreeTD[10], 0.000000, 0.000000, 0.000000, 1.000000);

	TreeTD[11] = TextDrawCreate(562.000000, 339.625000, "");
	TextDrawLetterSize(TreeTD[11], 0.000000, 0.000000);
	TextDrawTextSize(TreeTD[11], 34.000000, 26.000000);
	TextDrawAlignment(TreeTD[11], 1);
	TextDrawColor(TreeTD[11], -1);
	TextDrawSetShadow(TreeTD[11], 0);
	TextDrawSetOutline(TreeTD[11], 0);
	TextDrawBackgroundColor(TreeTD[11], 0);
	TextDrawFont(TreeTD[11], 5);
	TextDrawSetProportional(TreeTD[11], 0);
	TextDrawSetShadow(TreeTD[11], 0);
	TextDrawSetSelectable(TreeTD[11], true);
	TextDrawSetPreviewModel(TreeTD[11], 19576);
	TextDrawSetPreviewRot(TreeTD[11], 0.000000, 0.000000, 0.000000, 1.000000);

	TreeTD[12] = TextDrawCreate(553.000000, 356.687500, "");
	TextDrawLetterSize(TreeTD[12], 0.000000, 0.000000);
	TextDrawTextSize(TreeTD[12], 34.000000, 26.000000);
	TextDrawAlignment(TreeTD[12], 1);
	TextDrawColor(TreeTD[12], -1);
	TextDrawSetShadow(TreeTD[12], 0);
	TextDrawSetOutline(TreeTD[12], 0);
	TextDrawBackgroundColor(TreeTD[12], 0);
	TextDrawFont(TreeTD[12], 5);
	TextDrawSetProportional(TreeTD[12], 0);
	TextDrawSetShadow(TreeTD[12], 0);
	TextDrawSetSelectable(TreeTD[12], true);
	TextDrawSetPreviewModel(TreeTD[12], 19576);
	TextDrawSetPreviewRot(TreeTD[12], 0.000000, 0.000000, 0.000000, 1.000000);

	TreeTD[13] = TextDrawCreate(566.500000, 370.687500, "");
	TextDrawLetterSize(TreeTD[13], 0.000000, 0.000000);
	TextDrawTextSize(TreeTD[13], 34.000000, 26.000000);
	TextDrawAlignment(TreeTD[13], 1);
	TextDrawColor(TreeTD[13], -1);
	TextDrawSetShadow(TreeTD[13], 0);
	TextDrawSetOutline(TreeTD[13], 0);
	TextDrawBackgroundColor(TreeTD[13], 0);
	TextDrawFont(TreeTD[13], 5);
	TextDrawSetProportional(TreeTD[13], 0);
	TextDrawSetShadow(TreeTD[13], 0);
	TextDrawSetSelectable(TreeTD[13], true);
	TextDrawSetPreviewModel(TreeTD[13], 19576);
	TextDrawSetPreviewRot(TreeTD[13], 0.000000, 0.000000, 0.000000, 1.000000);

	TreeTD[14] = TextDrawCreate(568.500000, 353.187500, "");
	TextDrawLetterSize(TreeTD[14], 0.000000, 0.000000);
	TextDrawTextSize(TreeTD[14], 34.000000, 26.000000);
	TextDrawAlignment(TreeTD[14], 1);
	TextDrawColor(TreeTD[14], -1);
	TextDrawSetShadow(TreeTD[14], 0);
	TextDrawSetOutline(TreeTD[14], 0);
	TextDrawBackgroundColor(TreeTD[14], 0);
	TextDrawFont(TreeTD[14], 5);
	TextDrawSetProportional(TreeTD[14], 0);
	TextDrawSetShadow(TreeTD[14], 0);
	TextDrawSetSelectable(TreeTD[14], true);
	TextDrawSetPreviewModel(TreeTD[14], 19576);
	TextDrawSetPreviewRot(TreeTD[14], 0.000000, 0.000000, 0.000000, 1.000000);

    new nrx = 0, nry = 0;
	for(new i = 0; i < sizeof(GardenerTree); i++) {
		GardenerTree[i][gntStatus] = -1;
		GardenerTree[i][gntObject] = CreateDynamicObject(738, -(1138.6129 + (nrx * 10)),-(1216.6497 - nry),128.2188, 0.0000, 0.0000, 0.0000);
		GardenerTree[i][gntStair] = CreateDynamicObject(1428, -(1138.0321 + (nrx * 10)), -(1216.6573 - nry), 129.2255, -8.5999, 1.3000, 95.0000);
		GardenerTree[i][gntLabel] = CreateDynamic3DTextLabel("{8DFF63}Da chin de co the thu hoach", -1, -(1138.0321 + (nrx * 10)), -(1216.6573 - nry), 131.0255, 5.0);
		nrx++;
		if(nrx == 8) {
			nry += 10;
			nrx = 0;
		}
	}
    return 1;
}

hook OnPlayerClickTextDraw(playerid, Text:clickedid) 
{
    if(clickedid == Text:INVALID_TEXT_DRAW) {
    	if(Gardener[playerid][gnTreeTaken]!=-1) GardenerTree[Gardener[playerid][gnTreeTaken]][gntStatus] = -1;
    }
    if(Gardener[playerid][gnTreeTaken] >= 0 && JobWorking[playerid] == 2) {
		for(new i = 1; i < sizeof TreeTD; i++) {
			if(clickedid == TreeTD[i]) {
				TextDrawHideForPlayer(playerid, TreeTD[i]);
				if(++Gardener[playerid][gnTreeApples] == 14) {
                    // Gardener[playerid][gnApples] = 1;
                    SetPVarInt(playerid, "gnApples", 1);
					GardenerTree[Gardener[playerid][gnTreeTaken]][gntStatus] = 300, Gardener[playerid][gnTreeTaken] = -1;
					for(new x = 0; x < sizeof TreeTD; x++) TextDrawHideForPlayer(playerid, TreeTD[x]);
					CancelSelectTextDraw(playerid), TogglePlayerControllable(playerid, true), SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
					SetPlayerAttachedObject(playerid, ATTACHMENT_ID_BALE,19637,1,-0.00,0.50,-0.03,0.0,86.0,83.0,1.00,1.00,1.00), 
					Info(playerid, "Ban da lay tao tu cay, hay den checkpoint de cat tao vao kho.");
					SetPlayerCheckpoint(playerid, -1080.3639,-1195.3372,129.6956, 2.5), 
					CP[playerid] = 2018;
					return 1;
				}
			}
		}
	}
    return 1;
}

hook OnPlayerEnterCheckpoint(playerid) {
	if(CP[playerid] == 2018) {
        if(GetPVarInt(playerid, "gnApples") == 1) {
            new gString[128];
            new maxSkill = GetMaxPlayerApples(playerid);
            if(Gardener[playerid][gnApples] < maxSkill){
                Gardener[playerid][gnApples] += 1,
                RemovePlayerAttachedObject(playerid, ATTACHMENT_ID_BALE),
                DeletePVar(playerid, "gnApples");
                format(gString, sizeof(gString), "Ban da cat tao vao kho [%d/%d]", Gardener[playerid][gnApples], maxSkill);
            }
        }
	}
    if(CP[playerid] == 2022) {
        if(Gardener[playerid][gnDeliveryApples] > 0) {
            GiveJobSalary(playerid);
            Gardener[playerid][gnDeliveryApples] -=1;
            if(Gardener[playerid][gnDeliveryApples] > 0) {
                new randcp = RandomEx(1,101);
                while(GetCity1(HouseInfo[randcp][hEntrancex],HouseInfo[randcp][hEntrancey]) != 3 || randcp == JobCP[playerid]) randcp = RandomEx(1,101);
                SetPlayerCheckpointEx(playerid, HouseInfo[randcp][hEntrancex],HouseInfo[randcp][hEntrancey],HouseInfo[randcp][hEntrancez], 7.0);
                // PlayerInfo[playerid][pGardener] ++;
                JobCP[playerid] = randcp;
                CP[playerid] = 2022;
                GiveJobSalary(playerid);
            }
            else {
                SendClientMessage(playerid, COLOR_GOLD, "INFO: {FFFFFF}Ban da hoan thanh cong viec.");
                CP[playerid] = 0;
                callcmd::stopwork(playerid, "");
            }
        }
    }
    return 1;
}

stock GetMaxPlayerApples(playerid) {
    new skill = GetPlayerSkill(playerid);
    new maxSkill;
    switch (skill) {
        case 1..2: maxSkill = 4;
        case 3..4: maxSkill = 5;
        case 5: maxSkill = 6;
        case 6..8 : maxSkill = 8;
    }
    return maxSkill;
}

CMD:laytraicay(playerid, params[]) {
    if(!IsPlayerInRangeOfPoint(playerid, 3, STOREHOUSE)) return SendClientMessage(playerid, COLOR_GOLD, "INFO: {FFFFFF}Ban khong co o gan nha kho.");
    if(Gardener[playerid][gnApples] < 4) return SendClientMessage(playerid, COLOR_GOLD, "INFO: {FFFFFF}Ban khong co du tao trong kho de di giao [Toi thieu : 4].");
    Gardener[playerid][gnDeliveryApples] = Gardener[playerid][gnApples],
    Gardener[playerid][gnApples] = 0,
    CP[playerid] = 2022;
    Info(playerid, "Dia diem giao tao da duoc xac dinh tren ban do.");
    new randcp = RandomEx(1,101);
	while(GetCity1(HouseInfo[randcp][hEntrancex],HouseInfo[randcp][hEntrancey]) != 3 || JobCP[playerid] == randcp) randcp = RandomEx(1,101);
	JobCP[playerid] = randcp;
	SetPlayerCheckpointEx(playerid, HouseInfo[JobCP[playerid]][hEntrancex], HouseInfo[JobCP[playerid]][hEntrancey], HouseInfo[JobCP[playerid]][hEntrancez], 5.0);
    return 1;
}
