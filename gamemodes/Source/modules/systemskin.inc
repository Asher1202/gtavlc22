// new 
	// ChosenSkin[MAX_PLAYERS], PlayerText:FindSkinTD, SkinsActions[MAX_PLAYERS],
    // IsSkins[MAX_PLAYERS], PlayerText:SkinsPTD[11], Text:SkinsTD[11];

// function LoadSkinPTD(playerid) {
//     FindSkinTD = CreatePlayerTextDraw(playerid, 130.065902, 303.750305, "");
//     PlayerTextDrawLetterSize(playerid, FindSkinTD, 0.000000, 0.000000);
//     PlayerTextDrawTextSize(playerid, FindSkinTD, 77.000000, 76.000000);
//     PlayerTextDrawAlignment(playerid, FindSkinTD, 1);
//     PlayerTextDrawColor(playerid, FindSkinTD, -1);
//     PlayerTextDrawSetShadow(playerid, FindSkinTD, 0);
//     PlayerTextDrawSetOutline(playerid, FindSkinTD, 0);
//     PlayerTextDrawBackgroundColor(playerid, FindSkinTD, 6);
//     PlayerTextDrawFont(playerid, FindSkinTD, 5);
//     PlayerTextDrawSetProportional(playerid, FindSkinTD, 0);
//     PlayerTextDrawSetShadow(playerid, FindSkinTD, 0);
//     PlayerTextDrawSetPreviewModel(playerid, FindSkinTD, 285);
//     PlayerTextDrawSetPreviewRot(playerid, FindSkinTD, 0.000000, 0.000000, 0.000000, 1.000000);

//     SkinsPTD[0] = CreatePlayerTextDraw(playerid, 107.567009, 161.496185, "");
//     PlayerTextDrawLetterSize(playerid, SkinsPTD[0], 0.000000, 0.000000);
//     PlayerTextDrawTextSize(playerid, SkinsPTD[0], 80.000000, 73.000000);
//     PlayerTextDrawAlignment(playerid, SkinsPTD[0], 1);
//     PlayerTextDrawColor(playerid, SkinsPTD[0], 0xFFFFFFFF);
//     PlayerTextDrawUseBox(playerid, SkinsPTD[0], 0);
//     PlayerTextDrawBoxColor(playerid, SkinsPTD[0], 0x80808080);
//     PlayerTextDrawSetShadow(playerid, SkinsPTD[0], 0);
//     PlayerTextDrawSetOutline(playerid, SkinsPTD[0], 0);
//     PlayerTextDrawBackgroundColor(playerid, SkinsPTD[0], 0xFFFFFF20);
//     PlayerTextDrawFont(playerid, SkinsPTD[0], 5);
//     PlayerTextDrawSetProportional(playerid, SkinsPTD[0], 0);
//     PlayerTextDrawSetSelectable(playerid, SkinsPTD[0], 1);
//     PlayerTextDrawSetPreviewModel(playerid, SkinsPTD[0], 250);
//     PlayerTextDrawSetPreviewRot(playerid, SkinsPTD[0], 0.000000, 0.000000, 0.000000, 1.000000);

//     SkinsPTD[1] = CreatePlayerTextDraw(playerid, 190.866989, 161.396210, "");
//     PlayerTextDrawLetterSize(playerid, SkinsPTD[1], 0.000000, 0.000000);
//     PlayerTextDrawTextSize(playerid, SkinsPTD[1], 80.000000, 73.000000);
//     PlayerTextDrawAlignment(playerid, SkinsPTD[1], 1);
//     PlayerTextDrawColor(playerid, SkinsPTD[1], 0xFFFFFFFF);
//     PlayerTextDrawUseBox(playerid, SkinsPTD[1], 0);
//     PlayerTextDrawBoxColor(playerid, SkinsPTD[1], 0x80808080);
//     PlayerTextDrawSetShadow(playerid, SkinsPTD[1], 0);
//     PlayerTextDrawSetOutline(playerid, SkinsPTD[1], 0);
//     PlayerTextDrawBackgroundColor(playerid, SkinsPTD[1], 0xFFFFFF20);
//     PlayerTextDrawFont(playerid, SkinsPTD[1], 5);
//     PlayerTextDrawSetProportional(playerid, SkinsPTD[1], 0);
//     PlayerTextDrawSetSelectable(playerid, SkinsPTD[1], 1);
//     PlayerTextDrawSetPreviewModel(playerid, SkinsPTD[1], 18631);
//     PlayerTextDrawSetPreviewRot(playerid, SkinsPTD[1], 0.000000, 0.000000, 0.000000, 1.000000);

//     SkinsPTD[2] = CreatePlayerTextDraw(playerid, 275.434265, 161.710999, "");
//     PlayerTextDrawLetterSize(playerid, SkinsPTD[2], 0.000000, 0.000000);
//     PlayerTextDrawTextSize(playerid, SkinsPTD[2], 80.000000, 73.000000);
//     PlayerTextDrawAlignment(playerid, SkinsPTD[2], 1);
//     PlayerTextDrawColor(playerid, SkinsPTD[2], 0xFFFFFFFF);
//     PlayerTextDrawUseBox(playerid, SkinsPTD[2], 0);
//     PlayerTextDrawBoxColor(playerid, SkinsPTD[2], 0x80808080);
//     PlayerTextDrawSetShadow(playerid, SkinsPTD[2], 0);
//     PlayerTextDrawSetOutline(playerid, SkinsPTD[2], 0);
//     PlayerTextDrawBackgroundColor(playerid, SkinsPTD[2], 0xFFFFFF20);
//     PlayerTextDrawFont(playerid, SkinsPTD[2], 5);
//     PlayerTextDrawSetProportional(playerid, SkinsPTD[2], 0);
//     PlayerTextDrawSetSelectable(playerid, SkinsPTD[2], 1);
//     PlayerTextDrawSetPreviewModel(playerid, SkinsPTD[2], 18631);
//     PlayerTextDrawSetPreviewRot(playerid, SkinsPTD[2], 0.000000, 0.000000, 0.000000, 1.000000);

//     SkinsPTD[3] = CreatePlayerTextDraw(playerid, 359.799805, 161.396225, "");
//     PlayerTextDrawLetterSize(playerid, SkinsPTD[3], 0.000000, 0.000000);
//     PlayerTextDrawTextSize(playerid, SkinsPTD[3], 80.000000, 73.000000);
//     PlayerTextDrawAlignment(playerid, SkinsPTD[3], 1);
//     PlayerTextDrawColor(playerid, SkinsPTD[3], 0xFFFFFFFF);
//     PlayerTextDrawUseBox(playerid, SkinsPTD[3], 0);
//     PlayerTextDrawBoxColor(playerid, SkinsPTD[3], 0x80808080);
//     PlayerTextDrawSetShadow(playerid, SkinsPTD[3], 0);
//     PlayerTextDrawSetOutline(playerid, SkinsPTD[3], 0);
//     PlayerTextDrawBackgroundColor(playerid, SkinsPTD[3], 0xFFFFFF20);
//     PlayerTextDrawFont(playerid, SkinsPTD[3], 5);
//     PlayerTextDrawSetProportional(playerid, SkinsPTD[3], 0);
//     PlayerTextDrawSetSelectable(playerid, SkinsPTD[3], 1);
//     PlayerTextDrawSetPreviewModel(playerid, SkinsPTD[3], 18631);
//     PlayerTextDrawSetPreviewRot(playerid, SkinsPTD[3], 0.000000, 0.000000, 0.000000, 1.000000);

//     SkinsPTD[4] = CreatePlayerTextDraw(playerid, 444.798798, 161.266647, "");
//     PlayerTextDrawLetterSize(playerid, SkinsPTD[4], 0.000000, 0.000000);
//     PlayerTextDrawTextSize(playerid, SkinsPTD[4], 80.000000, 73.000000);
//     PlayerTextDrawAlignment(playerid, SkinsPTD[4], 1);
//     PlayerTextDrawColor(playerid, SkinsPTD[4], 0xFFFFFFFF);
//     PlayerTextDrawUseBox(playerid, SkinsPTD[4], 0);
//     PlayerTextDrawBoxColor(playerid, SkinsPTD[4], 0x80808080);
//     PlayerTextDrawSetShadow(playerid, SkinsPTD[4], 0);
//     PlayerTextDrawSetOutline(playerid, SkinsPTD[4], 0);
//     PlayerTextDrawBackgroundColor(playerid, SkinsPTD[4], 0xFFFFFF20);
//     PlayerTextDrawFont(playerid, SkinsPTD[4], 5);
//     PlayerTextDrawSetProportional(playerid, SkinsPTD[4], 0);
//     PlayerTextDrawSetSelectable(playerid, SkinsPTD[4], 1);
//     PlayerTextDrawSetPreviewModel(playerid, SkinsPTD[4], 18631);
//     PlayerTextDrawSetPreviewRot(playerid, SkinsPTD[4], 0.000000, 0.000000, 0.000000, 1.000000);

//     SkinsPTD[5] = CreatePlayerTextDraw(playerid, 107.567009, 238.500885, "");
//     PlayerTextDrawLetterSize(playerid, SkinsPTD[5], 0.000000, 0.000000);
//     PlayerTextDrawTextSize(playerid, SkinsPTD[5], 80.000000, 73.000000);
//     PlayerTextDrawAlignment(playerid, SkinsPTD[5], 1);
//     PlayerTextDrawColor(playerid, SkinsPTD[5], 0xFFFFFFFF);
//     PlayerTextDrawUseBox(playerid, SkinsPTD[5], 0);
//     PlayerTextDrawBoxColor(playerid, SkinsPTD[5], 0x80808080);
//     PlayerTextDrawSetShadow(playerid, SkinsPTD[5], 0);
//     PlayerTextDrawSetOutline(playerid, SkinsPTD[5], 0);
//     PlayerTextDrawBackgroundColor(playerid, SkinsPTD[5], 0xFFFFFF20);
//     PlayerTextDrawFont(playerid, SkinsPTD[5], 5);
//     PlayerTextDrawSetProportional(playerid, SkinsPTD[5], 0);
//     PlayerTextDrawSetSelectable(playerid, SkinsPTD[5], 1);
//     PlayerTextDrawSetPreviewModel(playerid, SkinsPTD[5], 18631);
//     PlayerTextDrawSetPreviewRot(playerid, SkinsPTD[5], 0.000000, 0.000000, 0.000000, 1.000000);

//     SkinsPTD[6] = CreatePlayerTextDraw(playerid, 190.866989, 238.500916, "");
//     PlayerTextDrawLetterSize(playerid, SkinsPTD[6], 0.000000, 0.000000);
//     PlayerTextDrawTextSize(playerid, SkinsPTD[6], 80.000000, 73.000000);
//     PlayerTextDrawAlignment(playerid, SkinsPTD[6], 1);
//     PlayerTextDrawColor(playerid, SkinsPTD[6], 0xFFFFFFFF);
//     PlayerTextDrawUseBox(playerid, SkinsPTD[6], 0);
//     PlayerTextDrawBoxColor(playerid, SkinsPTD[6], 0x80808080);
//     PlayerTextDrawSetShadow(playerid, SkinsPTD[6], 0);
//     PlayerTextDrawSetOutline(playerid, SkinsPTD[6], 0);
//     PlayerTextDrawBackgroundColor(playerid, SkinsPTD[6], 0xFFFFFF20);
//     PlayerTextDrawFont(playerid, SkinsPTD[6], 5);
//     PlayerTextDrawSetProportional(playerid, SkinsPTD[6], 0);
//     PlayerTextDrawSetSelectable(playerid, SkinsPTD[6], 1);
//     PlayerTextDrawSetPreviewModel(playerid, SkinsPTD[6], 18631);
//     PlayerTextDrawSetPreviewRot(playerid, SkinsPTD[6], 0.000000, 0.000000, 0.000000, 1.000000);

//     SkinsPTD[7] = CreatePlayerTextDraw(playerid, 275.434265, 238.315674, "");
//     PlayerTextDrawLetterSize(playerid, SkinsPTD[7], 0.000000, 0.000000);
//     PlayerTextDrawTextSize(playerid, SkinsPTD[7], 80.000000, 73.000000);
//     PlayerTextDrawAlignment(playerid, SkinsPTD[7], 1);
//     PlayerTextDrawColor(playerid, SkinsPTD[7], 0xFFFFFFFF);
//     PlayerTextDrawUseBox(playerid, SkinsPTD[7], 0);
//     PlayerTextDrawBoxColor(playerid, SkinsPTD[7], 0x80808080);
//     PlayerTextDrawSetShadow(playerid, SkinsPTD[7], 0);
//     PlayerTextDrawSetOutline(playerid, SkinsPTD[7], 0);
//     PlayerTextDrawBackgroundColor(playerid, SkinsPTD[7], 0xFFFFFF20);
//     PlayerTextDrawFont(playerid, SkinsPTD[7], 5);
//     PlayerTextDrawSetProportional(playerid, SkinsPTD[7], 0);
//     PlayerTextDrawSetSelectable(playerid, SkinsPTD[7], 1);
//     PlayerTextDrawSetPreviewModel(playerid, SkinsPTD[7], 18631);
//     PlayerTextDrawSetPreviewRot(playerid, SkinsPTD[7], 0.000000, 0.000000, 0.000000, 1.000000);

//     SkinsPTD[8] = CreatePlayerTextDraw(playerid, 359.799805, 238.200912, "");
//     PlayerTextDrawLetterSize(playerid, SkinsPTD[8], 0.000000, 0.000000);
//     PlayerTextDrawTextSize(playerid, SkinsPTD[8], 80.000000, 73.000000);
//     PlayerTextDrawAlignment(playerid, SkinsPTD[8], 1);
//     PlayerTextDrawColor(playerid, SkinsPTD[8], 0xFFFFFFFF);
//     PlayerTextDrawUseBox(playerid, SkinsPTD[8], 0);
//     PlayerTextDrawBoxColor(playerid, SkinsPTD[8], 0x80808080);
//     PlayerTextDrawSetShadow(playerid, SkinsPTD[8], 0);
//     PlayerTextDrawSetOutline(playerid, SkinsPTD[8], 0);
//     PlayerTextDrawBackgroundColor(playerid, SkinsPTD[8], 0xFFFFFF20);
//     PlayerTextDrawFont(playerid, SkinsPTD[8], 5);
//     PlayerTextDrawSetProportional(playerid, SkinsPTD[8], 0);
//     PlayerTextDrawSetSelectable(playerid, SkinsPTD[8], 1);
//     PlayerTextDrawSetPreviewModel(playerid, SkinsPTD[8], 18631);
//     PlayerTextDrawSetPreviewRot(playerid, SkinsPTD[8], 0.000000, 0.000000, 0.000000, 1.000000);

//     SkinsPTD[9] = CreatePlayerTextDraw(playerid, 444.798798, 238.000916, "");
//     PlayerTextDrawLetterSize(playerid, SkinsPTD[9], 0.000000, 0.000000);
//     PlayerTextDrawTextSize(playerid, SkinsPTD[9], 80.000000, 73.000000);
//     PlayerTextDrawAlignment(playerid, SkinsPTD[9], 1);
//     PlayerTextDrawColor(playerid, SkinsPTD[9], 0xFFFFFFFF);
//     PlayerTextDrawUseBox(playerid, SkinsPTD[9], 0);
//     PlayerTextDrawBoxColor(playerid, SkinsPTD[9], 0x80808080);
//     PlayerTextDrawSetShadow(playerid, SkinsPTD[9], 0);
//     PlayerTextDrawSetOutline(playerid, SkinsPTD[9], 0);
//     PlayerTextDrawBackgroundColor(playerid, SkinsPTD[9], 0xFFFFFF20);
//     PlayerTextDrawFont(playerid, SkinsPTD[9], 5);
//     PlayerTextDrawSetProportional(playerid, SkinsPTD[9], 0);
//     PlayerTextDrawSetSelectable(playerid, SkinsPTD[9], 1);
//     PlayerTextDrawSetPreviewModel(playerid, SkinsPTD[9], 18631);
//     PlayerTextDrawSetPreviewRot(playerid, SkinsPTD[9], 0.000000, 0.000000, 0.000000, 1.000000);

//     SkinsPTD[10] = CreatePlayerTextDraw(playerid, 497.500000, 345.312500, "~y~1/2");
//     PlayerTextDrawLetterSize(playerid, SkinsPTD[10], 0.240999, 1.245625);
//     PlayerTextDrawAlignment(playerid, SkinsPTD[10], 2);
//     PlayerTextDrawColor(playerid, SkinsPTD[10], -1);
//     PlayerTextDrawSetShadow(playerid, SkinsPTD[10], 0);
//     PlayerTextDrawSetOutline(playerid, SkinsPTD[10], 1);
//     PlayerTextDrawBackgroundColor(playerid, SkinsPTD[10], 113);
//     PlayerTextDrawFont(playerid, SkinsPTD[10], 2);
//     PlayerTextDrawSetProportional(playerid, SkinsPTD[10], 1);
//     PlayerTextDrawSetShadow(playerid, SkinsPTD[10], 0);

//     return 1;
// }

// function LoadSkinsTD() {

//     SkinsTD[10] = TextDrawCreate(508.500000, 344.437500, "LD_BEAT:right");
//     TextDrawLetterSize(SkinsTD[10], 0.000000, 0.000000);
//     TextDrawTextSize(SkinsTD[10], 15.000000, 15.000000);
//     TextDrawAlignment(SkinsTD[10], 1);
//     TextDrawColor(SkinsTD[10], -1);
//     TextDrawSetShadow(SkinsTD[10], 0);
//     TextDrawSetOutline(SkinsTD[10], 0);
//     TextDrawBackgroundColor(SkinsTD[10], 255);
//     TextDrawFont(SkinsTD[10], 4);
//     TextDrawSetProportional(SkinsTD[10], 0);
//     TextDrawSetShadow(SkinsTD[10], 0);

//     SkinsTD[9] = TextDrawCreate(471.500000, 344.875000, "LD_BEAT:left");
//     TextDrawLetterSize(SkinsTD[9], 0.000000, 0.000000);
//     TextDrawTextSize(SkinsTD[9], 15.000000, 15.000000);
//     TextDrawAlignment(SkinsTD[9], 1);
//     TextDrawColor(SkinsTD[9], -1);
//     TextDrawSetShadow(SkinsTD[9], 0);
//     TextDrawSetOutline(SkinsTD[9], 0);
//     TextDrawBackgroundColor(SkinsTD[9], 255);
//     TextDrawFont(SkinsTD[9], 4);
//     TextDrawSetProportional(SkinsTD[9], 0);
//     TextDrawSetShadow(SkinsTD[9], 0);

//     SkinsTD[8] = TextDrawCreate(105.900276, 158.474091, "box");
//     TextDrawLetterSize(SkinsTD[8], 0.000000, 22.299999);
//     TextDrawTextSize(SkinsTD[8], 526.903931, 0.000000);
//     TextDrawAlignment(SkinsTD[8], 1);
//     TextDrawColor(SkinsTD[8], 0xFFFFFFFF);
//     TextDrawUseBox(SkinsTD[8], 1);
//     TextDrawBoxColor(SkinsTD[8], 0x00000072);
//     TextDrawSetShadow(SkinsTD[8], 0);
//     TextDrawSetOutline(SkinsTD[8], 0);
//     TextDrawBackgroundColor(SkinsTD[8], 0x000000FF);
//     TextDrawFont(SkinsTD[8], 1);
//     TextDrawSetProportional(SkinsTD[8], 1);
//     TextDrawSetSelectable(SkinsTD[8], 0);

//     SkinsTD[7] = TextDrawCreate(316.333282, 136.962814, "My Skins");
//     TextDrawLetterSize(SkinsTD[7], 0.344999, 1.633185);
//     TextDrawTextSize(SkinsTD[7], 0.000000, 421.000000);
//     TextDrawAlignment(SkinsTD[7], 2);
//     TextDrawColor(SkinsTD[7], 0xFFFFFFFF);
//     TextDrawUseBox(SkinsTD[7], 1);
//     TextDrawBoxColor(SkinsTD[7], 0x000000FF);
//     TextDrawSetShadow(SkinsTD[7], 0);
//     TextDrawSetOutline(SkinsTD[7], 0);
//     TextDrawBackgroundColor(SkinsTD[7], 0x000000FF);
//     TextDrawFont(SkinsTD[7], 2);
//     TextDrawSetProportional(SkinsTD[7], 1);
//     TextDrawSetSelectable(SkinsTD[7], 0);

//     SkinsTD[6] = TextDrawCreate(105.733322, 156.400024, "box");
//     TextDrawLetterSize(SkinsTD[6], 0.000000, -0.518000);
//     TextDrawTextSize(SkinsTD[6], 527.000000, 0.000000);
//     TextDrawAlignment(SkinsTD[6], 1);
//     TextDrawColor(SkinsTD[6], 0xFFFFFFFF);
//     TextDrawUseBox(SkinsTD[6], 1);
//     TextDrawBoxColor(SkinsTD[6], 0xFFE15CFF);
//     TextDrawSetShadow(SkinsTD[6], 0);
//     TextDrawSetOutline(SkinsTD[6], 0);
//     TextDrawBackgroundColor(SkinsTD[6], 0x000000FF);
//     TextDrawFont(SkinsTD[6], 1);
//     TextDrawSetProportional(SkinsTD[6], 1);
//     TextDrawSetSelectable(SkinsTD[6], 0);

//     SkinsTD[5] = TextDrawCreate(105.866631, 363.607635, "box");
//     TextDrawLetterSize(SkinsTD[5], 0.000000, -0.566666);
//     TextDrawTextSize(SkinsTD[5], 527.000000, 0.000000);
//     TextDrawAlignment(SkinsTD[5], 1);
//     TextDrawColor(SkinsTD[5], 0xFFFFFFFF);
//     TextDrawUseBox(SkinsTD[5], 1);
//     TextDrawBoxColor(SkinsTD[5], 0xFFE15CFF);
//     TextDrawSetShadow(SkinsTD[5], 0);
//     TextDrawSetOutline(SkinsTD[5], 0);
//     TextDrawBackgroundColor(SkinsTD[5], 0x000000FF);
//     TextDrawFont(SkinsTD[5], 1);
//     TextDrawSetProportional(SkinsTD[5], 1);
//     TextDrawSetSelectable(SkinsTD[5], 0);

//     SkinsTD[4] = TextDrawCreate(511.700012, 137.148224, "LD_BEAT:cross");
//     TextDrawLetterSize(SkinsTD[4], 0.000000, 0.000000);
//     TextDrawTextSize(SkinsTD[4], 15.000000, 15.000000);
//     TextDrawAlignment(SkinsTD[4], 1);
//     TextDrawColor(SkinsTD[4], 0xFFE15CFF);
//     TextDrawUseBox(SkinsTD[4], 0);
//     TextDrawBoxColor(SkinsTD[4], 0x80808080);
//     TextDrawSetShadow(SkinsTD[4], 0);
//     TextDrawSetOutline(SkinsTD[4], 0);
//     TextDrawBackgroundColor(SkinsTD[4], 0x000000FF);
//     TextDrawFont(SkinsTD[4], 4);
//     TextDrawSetProportional(SkinsTD[4], 0);
//     TextDrawSetSelectable(SkinsTD[4], 1);

//     SkinsTD[3] = TextDrawCreate(257.999939, 337.188934, "select skin");
//     TextDrawLetterSize(SkinsTD[3], 0.292999, 1.500444);
//     TextDrawTextSize(SkinsTD[3], 15.000000, 87.000000);
//     TextDrawAlignment(SkinsTD[3], 2);
//     TextDrawColor(SkinsTD[3], 0xFFFFFFFF);
//     TextDrawUseBox(SkinsTD[3], 1);
//     TextDrawBoxColor(SkinsTD[3], 0x000000FF);
//     TextDrawSetShadow(SkinsTD[3], 0);
//     TextDrawSetOutline(SkinsTD[3], 0);
//     TextDrawBackgroundColor(SkinsTD[3], 0x000000FF);
//     TextDrawFont(SkinsTD[3], 2);
//     TextDrawSetProportional(SkinsTD[3], 1);
//     TextDrawSetSelectable(SkinsTD[3], 1);

//     SkinsTD[2] = TextDrawCreate(374.807068, 337.188934, "Remove skin");
//     TextDrawLetterSize(SkinsTD[2], 0.292999, 1.500444);
//     TextDrawTextSize(SkinsTD[2], 15.000000, 87.000000);
//     TextDrawAlignment(SkinsTD[2], 2);
//     TextDrawColor(SkinsTD[2], 0xFFFFFFFF);
//     TextDrawUseBox(SkinsTD[2], 1);
//     TextDrawBoxColor(SkinsTD[2], 0x000000FF);
//     TextDrawSetShadow(SkinsTD[2], 0);
//     TextDrawSetOutline(SkinsTD[2], 0);
//     TextDrawBackgroundColor(SkinsTD[2], 0x000000FF);
//     TextDrawFont(SkinsTD[2], 2);
//     TextDrawSetProportional(SkinsTD[2], 1);
//     TextDrawSetSelectable(SkinsTD[2], 1);

//     SkinsTD[1] = TextDrawCreate(214.533249, 354.481689, "box");
//     TextDrawLetterSize(SkinsTD[1], 0.000000, -0.466666);
//     TextDrawTextSize(SkinsTD[1], 301.459473, 0.000000);
//     TextDrawAlignment(SkinsTD[1], 1);
//     TextDrawColor(SkinsTD[1], 0xFFFFFFFF);
//     TextDrawUseBox(SkinsTD[1], 1);
//     TextDrawBoxColor(SkinsTD[1], 0xFFE15CFF);
//     TextDrawSetShadow(SkinsTD[1], 0);
//     TextDrawSetOutline(SkinsTD[1], 0);
//     TextDrawBackgroundColor(SkinsTD[1], 0x000000FF);
//     TextDrawFont(SkinsTD[1], 1);
//     TextDrawSetProportional(SkinsTD[1], 1);
//     TextDrawSetSelectable(SkinsTD[1], 0);

//     SkinsTD[0] = TextDrawCreate(331.533295, 354.511322, "box");
//     TextDrawLetterSize(SkinsTD[0], 0.000000, -0.465666);
//     TextDrawTextSize(SkinsTD[0], 418.131104, 0.000000);
//     TextDrawAlignment(SkinsTD[0], 1);
//     TextDrawColor(SkinsTD[0], 0xFFFFFFFF);
//     TextDrawUseBox(SkinsTD[0], 1);
//     TextDrawBoxColor(SkinsTD[0], 0xFFE15CFF);
//     TextDrawSetShadow(SkinsTD[0], 0);
//     TextDrawSetOutline(SkinsTD[0], 0);
//     TextDrawBackgroundColor(SkinsTD[0], 0x000000FF);
//     TextDrawFont(SkinsTD[0], 1);
//     TextDrawSetProportional(SkinsTD[0], 1);
//     TextDrawSetSelectable(SkinsTD[0], 0);
//     return 1;
// }
// Dialog:DIALOG_SKINS(playerid, response, listitem, inputtext[]) {
//     if(!response) return true;
//     new string[420];
//     new x = GetPVarInt(playerid, "skin"), id = PlayerInfo[playerid][pSkins][x];
//     if(GetPVarInt(playerid, "skin") == 0) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong the thay doi trang phuc.");
//     if(GetPlayerSkin(playerid) == id) {
//         PlayerInfo[playerid][pChar] = 250;
//         SetPlayerSkinEx(playerid, 250);
//         UpdateVar(playerid, "CChar", id);
//     }
//     format(string, sizeof(string), "{DF80F9}(Skin) {FFFFFF}Skin #%d da xoa. (model: %d | type: %s)", x + 1, PlayerInfo[playerid][pSkins][x], GetSkinType(PlayerInfo[playerid][pSkins][x]));
//     SendClientMessage(playerid, COLOR_WHITE, string);
//     PlayerInfo[playerid][pSkins][x] = -1;
//     PlayerTextDrawSetPreviewModel(playerid, SkinsPTD[x], 18631);
//     PlayerTextDrawColor(playerid, SkinsPTD[x], 0xFFFFFFFF);
//     PlayerTextDrawBackgroundColor(playerid, SkinsPTD[x], 0xFFFFFF20);
//     PlayerTextDrawShow(playerid, SkinsPTD[x]);
//     save_skin(playerid);
//     DeletePVar(playerid, "skin");
//     return 1;
// }
Dialog:DIALOG_SKIN(playerid, response, listitem, inputtext[]) {
    if(!response) return true;
    new id = listitem;
    if(PlayerInfo[playerid][pSkins][id] == -1) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong co skin trong slot nay");
    Dialog_Show(playerid, DIALOG_SKIN1, DIALOG_STYLE_MSGBOX,  "My Skins",  "Chon skin ma ban muon mac",  "Chon", "Xoa");
    SetPVarInt(playerid, "skin", id);
    return 1;
}
Dialog:DIALOG_SKIN1(playerid, response, listitem, inputtext[]) {
    new id = PlayerInfo[playerid][pSkins][GetPVarInt(playerid, "skin")];
    switch(response) {
        case 0: {
            if(GetPVarInt(playerid, "skin") == 0) return SendClientMessage(playerid, COLOR_LGREEN, "Ban khong the xoa skin Civilian");
            if(GetPlayerSkin(playerid) == id) {
                PlayerInfo[playerid][pChar] = 250;
                SetPlayerSkinEx(playerid, 250);
                UpdateVar(playerid, "CChar", id);
        }
            PlayerInfo[playerid][pSkins][GetPVarInt(playerid, "skin")] = -1;
            save_skin(playerid);
            SendClientMessage(playerid, COLOR_YELLOW, "Da xoa skin!");
        }
        case 1: {
            PlayerInfo[playerid][pChar] = id;
            SetPlayerSkinEx(playerid, id);
            UpdateVar(playerid, "CChar", id);
            SendClientMessage(playerid, COLOR_YELLOW, "Da thay skin!");
        }

    }
    DeletePVar(playerid, "skin");
    return 1;
}
/*total_skins(playerid) {
    new x;
    for (new i; i < 10; i++) {
        if(PlayerInfo[playerid][pSkins][i] != -1) x++;
    }
    return x;
}*/
// are_acest_skin(playerid, model) {
//     for (new i; i < 10; i++) {
//         if(PlayerInfo[playerid][pSkins][i] == model) return true;
//     }
//     return false;
// }
save_skin(playerid) {
    new string[128];
    mysql_format(SQL, string, sizeof(string), "UPDATE `users` SET `Skin`='%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|' WHERE `ID`='%d'",
        PlayerInfo[playerid][pSkins][0], PlayerInfo[playerid][pSkins][1], PlayerInfo[playerid][pSkins][2], PlayerInfo[playerid][pSkins][3], PlayerInfo[playerid][pSkins][4],
        PlayerInfo[playerid][pSkins][5], PlayerInfo[playerid][pSkins][6], PlayerInfo[playerid][pSkins][7], PlayerInfo[playerid][pSkins][8], PlayerInfo[playerid][pSkins][9],
        PlayerInfo[playerid][pSQLID]);

    mysql_query(SQL, string, false);
}
give_skin(playerid, model) {
    for (new i; i < 10; i++) {
        if(PlayerInfo[playerid][pSkins][i] == -1) {
            PlayerInfo[playerid][pSkins][i] = model;
            save_skin(playerid);
            break;
        }
    }
}
// stock LoadSkins(crates, & skin) {
//     switch (crates) {
//         case 0:{
//             new rand = random(9);//skin hiem va sieu hiem
//             switch (rand) {
//                 case 0:
//                     skin = 170;
//                 case 1:
//                     skin = 188;
//                 case 2:
//                     skin = 249;
//                 case 3:
//                     skin = 159;
//                 case 4:
//                     skin = 260;
//                 case 5:
//                     skin = 248;
//                 case 6:
//                     skin = 264;
//                 case 7:
//                     skin = 185;
//                 case 8:
//                     skin = 289;
//                 case 9:
//                     skin = 249;
//             }
//         }
//         case 1:{
//             new rand = random(6);
//             switch (rand) {
//                 case 0:
//                     skin = 0;
//                 case 1:
//                     skin = 164;
//                 case 2:
//                     skin = 242;
//                 case 3:
//                     skin = 241;
//                 case 4:
//                     skin = 212;
//                 case 5:
//                     skin = 83;
//                 case 6:
//                     skin = 111;
//             }
//         }
//         case 2:{
//             new rand = random(9);
//             switch (rand) {
//                 case 0:
//                     skin = 0;
//                 case 1:
//                     skin = 104;
//                 case 2:
//                     skin = 116;
//                 case 3:
//                     skin = 164;
//                 case 4:
//                     skin = 149;
//                 case 5:
//                     skin = 306;
//                 case 6:
//                     skin = 293;
//                 case 7:
//                     skin = 285;
//                 case 8:
//                     skin = 289;
//                 case 9:
//                     skin = 294;
//             }
//         }
//         case 3:{
//             new rand = random(5);
//             switch (rand) {
//                 case 0:
//                     skin = 93;
//                 case 1:
//                     skin = 108;
//                 case 2:
//                     skin = 171;
//                 case 3:
//                     skin = 177;
//                 case 4:
//                     skin = 217;
//                 case 5:
//                     skin = 271;
//             }
//         }
//     }
//     return true;
// }
stock GetSkinType(skin) {
    new string[20];
    switch (skin) {
        case 170, 188, 249, 159, 260:
            string = "Hiem";
        case 248, 264, 185, 289:
            string = "Sieu Cap";
        case 0, 164,242,241:
            string = "Huyen Thoai";
        case 124, 181, 284, 294, 292,309:
            string = "SIEU VIET";
        case 212, 83, 111:
            string = "GIOI HAN";
        default:
            string = "BINH THUONG";
    }
    return string;
}
// CMD:skins(playerid, params[]) {
// 	//  if(PlayerInfo[playerid][pMember] !=0) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000} [HE THONG] {FFFFFF}: Ban khong the su dung lenh nay vi ban o trong mot to chuc!");
// 	 if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_LGREEN, "{FF0000} [HE THONG] {FFFFFF}: Ban khong the tiep tuc neu ban khong xuong xe");
//      new szDialog[512], string[128];
//      strcat(szDialog, "#\tSkin ID\tStatus\n");
//      for(new i; i< 10; i++) {
//          if(PlayerInfo[playerid][pSkins][i] == GetPlayerSkin(playerid)) format(string, sizeof(string), "%d.\t%d\t{FFEA00}Da trang bi\n", i+1, PlayerInfo[playerid][pSkins][i]);
//          else if(PlayerInfo[playerid][pSkins][i] != -1) format(string, sizeof(string), "%d.\t%d\t{FF0000}Dang ban\n", i+1, PlayerInfo[playerid][pSkins][i]);
//          else if(PlayerInfo[playerid][pSkins][i] == -1) format(string, sizeof(string), "%d.\tkhong\t{00FF00}Trong\n", i+1);
//          strcat(szDialog, string);
//      }
//      Dialog_Show(playerid, DIALOG_SKIN, DIALOG_STYLE_TABLIST_HEADERS, "My Skins", szDialog, "Chon", "Huy bo");
//      return 1;
// }

stock GetSkinRareCMD(skin) {
    new x;
    switch (skin) {
        case 170, 188, 146, 159, 260, 226, 32, 14, 56, 15, 25, 41:
            x = 0x87CCEEFF;
        case 248, 264, 185, 289, 249:
            x = 0xC844B2FF;
        case 0, 34,242,241:
            x = 0xFFA31FFF;
        case 212, 83, 111:
            x = 0xe7331eFF;
        case 294:
            x = 0x00ffdcFF;
        default:
            x = X11_GHOST_WHITE;
    }
    return x;
}
stock GetSkinRare(skin) {
    switch (skin) {
        case 170, 188, 146, 159, 260, 226, 14, 32, 56:
            return true;
    }
    return false;
}


are_acest_skin(playerid, model) {
	for(new i; i < 10; i++) {
		if (PlayerInfo[playerid][pSkins][i] == model) return 1;
    }
    return 0;
}
