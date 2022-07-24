#include <YSI_Coding\y_hooks>

new jackpotactual,jackpotvechi,Text3D:lottolabel,lottoclick[MAX_PLAYERS];
/// TAO COT SO MAY MAN TRONG USER DE TRÁNH BỊ MẤT VÉ SỐ CUA MEMBER <#33
hook OnGameModeInit() {

    LottoTD[0] = TextDrawCreate(323.265228, 187.083328, "box");
    TextDrawLetterSize(LottoTD[0], 0.000000, 12.788713);
    TextDrawTextSize(LottoTD[0], 0.000000, 99.000000);
    TextDrawAlignment(LottoTD[0], 2);
    TextDrawColor(LottoTD[0], -1);
    TextDrawUseBox(LottoTD[0], 1);
    TextDrawBoxColor(LottoTD[0], 255);
    TextDrawSetShadow(LottoTD[0], 0);
    TextDrawSetOutline(LottoTD[0], 0);
    TextDrawBackgroundColor(LottoTD[0], 255);
    TextDrawFont(LottoTD[0], 1);
    TextDrawSetProportional(LottoTD[0], 1);
    TextDrawSetShadow(LottoTD[0], 0);

    LottoTD[1] = TextDrawCreate(320.453918, 174.250061, "LOTO");
    TextDrawLetterSize(LottoTD[1], 0.301610, 2.247502);
    TextDrawAlignment(LottoTD[1], 2);
    TextDrawColor(LottoTD[1], -1);
    TextDrawSetShadow(LottoTD[1], 0);
    TextDrawSetOutline(LottoTD[1], 1);
    TextDrawBackgroundColor(LottoTD[1], 255);
    TextDrawFont(LottoTD[1], 2);
    TextDrawSetProportional(LottoTD[1], 1);
    TextDrawSetShadow(LottoTD[1], 0);

    LottoTD[2] = TextDrawCreate(389.795135, 185.916702, "box");
    TextDrawLetterSize(LottoTD[2], 0.000000, 3.815521);
    TextDrawTextSize(LottoTD[2], 488.000000, 0.000000);
    TextDrawAlignment(LottoTD[2], 1);
    TextDrawColor(LottoTD[2], -1);
    TextDrawUseBox(LottoTD[2], 1);
    TextDrawBoxColor(LottoTD[2], 255);
    TextDrawSetShadow(LottoTD[2], 0);
    TextDrawSetOutline(LottoTD[2], 0);
    TextDrawBackgroundColor(LottoTD[2], 255);
    TextDrawFont(LottoTD[2], 1);
    TextDrawSetProportional(LottoTD[2], 1);
    TextDrawSetShadow(LottoTD[2], 0);

    LottoTD[3] = TextDrawCreate(403.382385, 206.333312, "XO SO: 18:00");
    TextDrawLetterSize(LottoTD[3], 0.270688, 1.506666);
    TextDrawAlignment(LottoTD[3], 1);
    TextDrawColor(LottoTD[3], -1);
    TextDrawSetShadow(LottoTD[3], 0);
    TextDrawSetOutline(LottoTD[3], 1);
    TextDrawBackgroundColor(LottoTD[3], 255);
    TextDrawFont(LottoTD[3], 2);
    TextDrawSetProportional(LottoTD[3], 1);
    TextDrawSetShadow(LottoTD[3], 0);

    LottoTD[4] = TextDrawCreate(398.275085, 187.066589, "GIAI THUONG: $50,000,000");
    TextDrawLetterSize(LottoTD[4], 0.138096, 1.372499);
    TextDrawAlignment(LottoTD[4], 1);
    TextDrawColor(LottoTD[4], -1);
    TextDrawSetShadow(LottoTD[4], 0);
    TextDrawSetOutline(LottoTD[4], 1);
    TextDrawBackgroundColor(LottoTD[4], 255);
    TextDrawFont(LottoTD[4], 2);
    TextDrawSetProportional(LottoTD[4], 1);
    TextDrawSetShadow(LottoTD[4], 0);

    LottoTD[5] = TextDrawCreate(266.105468, 305.500152, "Hay chon~r~ so may man ~w~cua ban");
    TextDrawLetterSize(LottoTD[5], 0.315666, 1.588332);
    TextDrawAlignment(LottoTD[5], 1);
    TextDrawColor(LottoTD[5], -1);
    TextDrawSetShadow(LottoTD[5], 0);
    TextDrawSetOutline(LottoTD[5], 1);
    TextDrawBackgroundColor(LottoTD[5], 255);
    TextDrawFont(LottoTD[5], 0);
    TextDrawSetProportional(LottoTD[5], 1);
    TextDrawSetShadow(LottoTD[5], 0);

    LottoChonSo[0] = TextDrawCreate(284.846160, 201.083374, "1");
    TextDrawLetterSize(LottoChonSo[0], 0.514787, 1.734166);
    TextDrawAlignment(LottoChonSo[0], 2);
    TextDrawColor(LottoChonSo[0], -1);
    TextDrawSetShadow(LottoChonSo[0], 0);
    TextDrawSetOutline(LottoChonSo[0], 1);
    TextDrawBackgroundColor(LottoChonSo[0], 255);
    TextDrawFont(LottoChonSo[0], 2);
    TextDrawSetProportional(LottoChonSo[0], 1);
    TextDrawSetShadow(LottoChonSo[0], 0);
    TextDrawSetSelectable(LottoChonSo[0], true);

    LottoChonSo[1] = TextDrawCreate(304.055694, 201.083312, "2");
    TextDrawLetterSize(LottoChonSo[1], 0.375167, 1.710831);
    TextDrawAlignment(LottoChonSo[1], 2);
    TextDrawColor(LottoChonSo[1], -1);
    TextDrawSetShadow(LottoChonSo[1], 0);
    TextDrawSetOutline(LottoChonSo[1], 1);
    TextDrawBackgroundColor(LottoChonSo[1], 255);
    TextDrawFont(LottoChonSo[1], 2);
    TextDrawSetProportional(LottoChonSo[1], 1);
    TextDrawSetShadow(LottoChonSo[1], 0);
    TextDrawSetSelectable(LottoChonSo[1], true);

    LottoChonSo[2] = TextDrawCreate(321.390930, 201.083312, "3");
    TextDrawLetterSize(LottoChonSo[2], 0.375167, 1.710831);
    TextDrawAlignment(LottoChonSo[2], 2);
    TextDrawColor(LottoChonSo[2], -1);
    TextDrawSetShadow(LottoChonSo[2], 0);
    TextDrawSetOutline(LottoChonSo[2], 1);
    TextDrawBackgroundColor(LottoChonSo[2], 255);
    TextDrawFont(LottoChonSo[2], 2);
    TextDrawSetProportional(LottoChonSo[2], 1);
    TextDrawSetShadow(LottoChonSo[2], 0);
    TextDrawSetSelectable(LottoChonSo[2], true);

    LottoChonSo[3] = TextDrawCreate(341.069305, 200.499969, "4");
    TextDrawLetterSize(LottoChonSo[3], 0.302547, 1.915001);
    TextDrawAlignment(LottoChonSo[3], 2);
    TextDrawColor(LottoChonSo[3], -1);
    TextDrawSetShadow(LottoChonSo[3], 0);
    TextDrawSetOutline(LottoChonSo[3], 1);
    TextDrawBackgroundColor(LottoChonSo[3], 255);
    TextDrawFont(LottoChonSo[3], 2);
    TextDrawSetProportional(LottoChonSo[3], 1);
    TextDrawSetShadow(LottoChonSo[3], 0);
    TextDrawSetSelectable(LottoChonSo[3], true);

    LottoChonSo[4] = TextDrawCreate(360.278930, 200.499984, "5");
    TextDrawLetterSize(LottoChonSo[4], 0.337686, 1.950003);
    TextDrawAlignment(LottoChonSo[4], 2);
    TextDrawColor(LottoChonSo[4], -1);
    TextDrawSetShadow(LottoChonSo[4], 0);
    TextDrawSetOutline(LottoChonSo[4], 1);
    TextDrawBackgroundColor(LottoChonSo[4], 255);
    TextDrawFont(LottoChonSo[4], 2);
    TextDrawSetProportional(LottoChonSo[4], 1);
    TextDrawSetShadow(LottoChonSo[4], 0);
    TextDrawSetSelectable(LottoChonSo[4], true);

    LottoChonSo[5] = TextDrawCreate(283.909118, 217.416748, "6");
    TextDrawLetterSize(LottoChonSo[5], 0.347992, 1.722499);
    TextDrawAlignment(LottoChonSo[5], 2);
    TextDrawColor(LottoChonSo[5], -1);
    TextDrawSetShadow(LottoChonSo[5], 0);
    TextDrawSetOutline(LottoChonSo[5], 1);
    TextDrawBackgroundColor(LottoChonSo[5], 255);
    TextDrawFont(LottoChonSo[5], 2);
    TextDrawSetProportional(LottoChonSo[5], 1);
    TextDrawSetShadow(LottoChonSo[5], 0);
    TextDrawSetSelectable(LottoChonSo[5], true);

    LottoChonSo[6] = TextDrawCreate(304.055877, 216.833343, "7");
    TextDrawLetterSize(LottoChonSo[6], 0.347992, 1.722499);
    TextDrawAlignment(LottoChonSo[6], 2);
    TextDrawColor(LottoChonSo[6], -1);
    TextDrawSetShadow(LottoChonSo[6], 0);
    TextDrawSetOutline(LottoChonSo[6], 1);
    TextDrawBackgroundColor(LottoChonSo[6], 255);
    TextDrawFont(LottoChonSo[6], 2);
    TextDrawSetProportional(LottoChonSo[6], 1);
    TextDrawSetShadow(LottoChonSo[6], 0);
    TextDrawSetSelectable(LottoChonSo[6], true);

    LottoChonSo[7] = TextDrawCreate(321.391326, 216.833343, "8");
    TextDrawLetterSize(LottoChonSo[7], 0.347992, 1.722499);
    TextDrawAlignment(LottoChonSo[7], 2);
    TextDrawColor(LottoChonSo[7], -1);
    TextDrawSetShadow(LottoChonSo[7], 0);
    TextDrawSetOutline(LottoChonSo[7], 1);
    TextDrawBackgroundColor(LottoChonSo[7], 255);
    TextDrawFont(LottoChonSo[7], 2);
    TextDrawSetProportional(LottoChonSo[7], 1);
    TextDrawSetShadow(LottoChonSo[7], 0);
    TextDrawSetSelectable(LottoChonSo[7], true);

    LottoChonSo[8] = TextDrawCreate(340.132354, 216.833343, "9");
    TextDrawLetterSize(LottoChonSo[8], 0.347992, 1.722499);
    TextDrawAlignment(LottoChonSo[8], 2);
    TextDrawColor(LottoChonSo[8], -1);
    TextDrawSetShadow(LottoChonSo[8], 0);
    TextDrawSetOutline(LottoChonSo[8], 1);
    TextDrawBackgroundColor(LottoChonSo[8], 255);
    TextDrawFont(LottoChonSo[8], 2);
    TextDrawSetProportional(LottoChonSo[8], 1);
    TextDrawSetShadow(LottoChonSo[8], 0);
    TextDrawSetSelectable(LottoChonSo[8], true);

    LottoChonSo[9] = TextDrawCreate(360.279052, 217.416671, "10");
    TextDrawLetterSize(LottoChonSo[9], 0.347992, 1.722499);
    TextDrawAlignment(LottoChonSo[9], 2);
    TextDrawColor(LottoChonSo[9], -1);
    TextDrawSetShadow(LottoChonSo[9], 0);
    TextDrawSetOutline(LottoChonSo[9], 1);
    TextDrawBackgroundColor(LottoChonSo[9], 255);
    TextDrawFont(LottoChonSo[9], 2);
    TextDrawSetProportional(LottoChonSo[9], 1);
    TextDrawSetShadow(LottoChonSo[9], 0);
    TextDrawSetSelectable(LottoChonSo[9], true);

    LottoChonSo[10] = TextDrawCreate(282.972137, 232.000061, "11");
    TextDrawLetterSize(LottoChonSo[10], 0.347992, 1.722499);
    TextDrawAlignment(LottoChonSo[10], 2);
    TextDrawColor(LottoChonSo[10], -1);
    TextDrawSetShadow(LottoChonSo[10], 0);
    TextDrawSetOutline(LottoChonSo[10], 1);
    TextDrawBackgroundColor(LottoChonSo[10], 255);
    TextDrawFont(LottoChonSo[10], 2);
    TextDrawSetProportional(LottoChonSo[10], 1);
    TextDrawSetShadow(LottoChonSo[10], 0);
    TextDrawSetSelectable(LottoChonSo[10], true);

    LottoChonSo[11] = TextDrawCreate(303.118682, 232.000061, "12");
    TextDrawLetterSize(LottoChonSo[11], 0.347992, 1.722499);
    TextDrawAlignment(LottoChonSo[11], 2);
    TextDrawColor(LottoChonSo[11], -1);
    TextDrawSetShadow(LottoChonSo[11], 0);
    TextDrawSetOutline(LottoChonSo[11], 1);
    TextDrawBackgroundColor(LottoChonSo[11], 255);
    TextDrawFont(LottoChonSo[11], 2);
    TextDrawSetProportional(LottoChonSo[11], 1);
    TextDrawSetShadow(LottoChonSo[11], 0);
    TextDrawSetSelectable(LottoChonSo[11], true);

    LottoChonSo[12] = TextDrawCreate(323.733825, 231.416732, "13");
    TextDrawLetterSize(LottoChonSo[12], 0.347992, 1.722499);
    TextDrawAlignment(LottoChonSo[12], 2);
    TextDrawColor(LottoChonSo[12], -1);
    TextDrawSetShadow(LottoChonSo[12], 0);
    TextDrawSetOutline(LottoChonSo[12], 1);
    TextDrawBackgroundColor(LottoChonSo[12], 255);
    TextDrawFont(LottoChonSo[12], 2);
    TextDrawSetProportional(LottoChonSo[12], 1);
    TextDrawSetShadow(LottoChonSo[12], 0);
    TextDrawSetSelectable(LottoChonSo[12], true);

    LottoChonSo[13] = TextDrawCreate(341.069366, 232.000061, "14");
    TextDrawLetterSize(LottoChonSo[13], 0.347992, 1.722499);
    TextDrawAlignment(LottoChonSo[13], 2);
    TextDrawColor(LottoChonSo[13], -1);
    TextDrawSetShadow(LottoChonSo[13], 0);
    TextDrawSetOutline(LottoChonSo[13], 1);
    TextDrawBackgroundColor(LottoChonSo[13], 255);
    TextDrawFont(LottoChonSo[13], 2);
    TextDrawSetProportional(LottoChonSo[13], 1);
    TextDrawSetShadow(LottoChonSo[13], 0);
    TextDrawSetSelectable(LottoChonSo[13], true);

    LottoChonSo[14] = TextDrawCreate(360.584564, 232.000061, "15");
    TextDrawLetterSize(LottoChonSo[14], 0.347992, 1.722499);
    TextDrawAlignment(LottoChonSo[14], 2);
    TextDrawColor(LottoChonSo[14], -1);
    TextDrawSetShadow(LottoChonSo[14], 0);
    TextDrawSetOutline(LottoChonSo[14], 1);
    TextDrawBackgroundColor(LottoChonSo[14], 255);
    TextDrawFont(LottoChonSo[14], 2);
    TextDrawSetProportional(LottoChonSo[14], 1);
    TextDrawSetShadow(LottoChonSo[14], 0);
    TextDrawSetSelectable(LottoChonSo[14], true);

    LottoChonSo[15] = TextDrawCreate(284.846099, 247.750000, "16");
    TextDrawLetterSize(LottoChonSo[15], 0.347992, 1.722499);
    TextDrawAlignment(LottoChonSo[15], 2);
    TextDrawColor(LottoChonSo[15], -1);
    TextDrawSetShadow(LottoChonSo[15], 0);
    TextDrawSetOutline(LottoChonSo[15], 1);
    TextDrawBackgroundColor(LottoChonSo[15], 255);
    TextDrawFont(LottoChonSo[15], 2);
    TextDrawSetProportional(LottoChonSo[15], 1);
    TextDrawSetShadow(LottoChonSo[15], 0);
    TextDrawSetSelectable(LottoChonSo[15], true);

    LottoChonSo[16] = TextDrawCreate(304.055725, 247.749984, "17");
    TextDrawLetterSize(LottoChonSo[16], 0.347992, 1.722499);
    TextDrawAlignment(LottoChonSo[16], 2);
    TextDrawColor(LottoChonSo[16], -1);
    TextDrawSetShadow(LottoChonSo[16], 0);
    TextDrawSetOutline(LottoChonSo[16], 1);
    TextDrawBackgroundColor(LottoChonSo[16], 255);
    TextDrawFont(LottoChonSo[16], 2);
    TextDrawSetProportional(LottoChonSo[16], 1);
    TextDrawSetShadow(LottoChonSo[16], 0);
    TextDrawSetSelectable(LottoChonSo[16], true);

    LottoChonSo[17] = TextDrawCreate(324.202423, 245.999969, "18");
    TextDrawLetterSize(LottoChonSo[17], 0.347992, 1.722499);
    TextDrawAlignment(LottoChonSo[17], 2);
    TextDrawColor(LottoChonSo[17], -1);
    TextDrawSetShadow(LottoChonSo[17], 0);
    TextDrawSetOutline(LottoChonSo[17], 1);
    TextDrawBackgroundColor(LottoChonSo[17], 255);
    TextDrawFont(LottoChonSo[17], 2);
    TextDrawSetProportional(LottoChonSo[17], 1);
    TextDrawSetShadow(LottoChonSo[17], 0);
    TextDrawSetSelectable(LottoChonSo[17], true);

    LottoChonSo[18] = TextDrawCreate(342.006225, 247.166656, "19");
    TextDrawLetterSize(LottoChonSo[18], 0.347992, 1.722499);
    TextDrawAlignment(LottoChonSo[18], 2);
    TextDrawColor(LottoChonSo[18], -1);
    TextDrawSetShadow(LottoChonSo[18], 0);
    TextDrawSetOutline(LottoChonSo[18], 1);
    TextDrawBackgroundColor(LottoChonSo[18], 255);
    TextDrawFont(LottoChonSo[18], 2);
    TextDrawSetProportional(LottoChonSo[18], 1);
    TextDrawSetShadow(LottoChonSo[18], 0);
    TextDrawSetSelectable(LottoChonSo[18], true);

    LottoChonSo[19] = TextDrawCreate(361.215759, 246.583282, "20");
    TextDrawLetterSize(LottoChonSo[19], 0.347992, 1.722499);
    TextDrawAlignment(LottoChonSo[19], 2);
    TextDrawColor(LottoChonSo[19], -1);
    TextDrawSetShadow(LottoChonSo[19], 0);
    TextDrawSetOutline(LottoChonSo[19], 1);
    TextDrawBackgroundColor(LottoChonSo[19], 255);
    TextDrawFont(LottoChonSo[19], 2);
    TextDrawSetProportional(LottoChonSo[19], 1);
    TextDrawSetShadow(LottoChonSo[19], 0);
    TextDrawSetSelectable(LottoChonSo[19], true);

    LottoChonSo[20] = TextDrawCreate(284.377624, 260.583343, "21");
    TextDrawLetterSize(LottoChonSo[20], 0.347992, 1.722499);
    TextDrawAlignment(LottoChonSo[20], 2);
    TextDrawColor(LottoChonSo[20], -1);
    TextDrawSetShadow(LottoChonSo[20], 0);
    TextDrawSetOutline(LottoChonSo[20], 1);
    TextDrawBackgroundColor(LottoChonSo[20], 255);
    TextDrawFont(LottoChonSo[20], 2);
    TextDrawSetProportional(LottoChonSo[20], 1);
    TextDrawSetShadow(LottoChonSo[20], 0);
    TextDrawSetSelectable(LottoChonSo[20], true);

    LottoChonSo[21] = TextDrawCreate(303.587005, 261.166656, "22");
    TextDrawLetterSize(LottoChonSo[21], 0.347992, 1.722499);
    TextDrawAlignment(LottoChonSo[21], 2);
    TextDrawColor(LottoChonSo[21], -1);
    TextDrawSetShadow(LottoChonSo[21], 0);
    TextDrawSetOutline(LottoChonSo[21], 1);
    TextDrawBackgroundColor(LottoChonSo[21], 255);
    TextDrawFont(LottoChonSo[21], 2);
    TextDrawSetProportional(LottoChonSo[21], 1);
    TextDrawSetShadow(LottoChonSo[21], 0);
    TextDrawSetSelectable(LottoChonSo[21], true);

    LottoChonSo[22] = TextDrawCreate(324.201965, 261.166625, "23");
    TextDrawLetterSize(LottoChonSo[22], 0.347992, 1.722499);
    TextDrawAlignment(LottoChonSo[22], 2);
    TextDrawColor(LottoChonSo[22], -1);
    TextDrawSetShadow(LottoChonSo[22], 0);
    TextDrawSetOutline(LottoChonSo[22], 1);
    TextDrawBackgroundColor(LottoChonSo[22], 255);
    TextDrawFont(LottoChonSo[22], 2);
    TextDrawSetProportional(LottoChonSo[22], 1);
    TextDrawSetShadow(LottoChonSo[22], 0);
    TextDrawSetSelectable(LottoChonSo[22], true);

    LottoChonSo[23] = TextDrawCreate(343.880035, 261.166656, "24");
    TextDrawLetterSize(LottoChonSo[23], 0.347992, 1.722499);
    TextDrawAlignment(LottoChonSo[23], 2);
    TextDrawColor(LottoChonSo[23], -1);
    TextDrawSetShadow(LottoChonSo[23], 0);
    TextDrawSetOutline(LottoChonSo[23], 1);
    TextDrawBackgroundColor(LottoChonSo[23], 255);
    TextDrawFont(LottoChonSo[23], 2);
    TextDrawSetProportional(LottoChonSo[23], 1);
    TextDrawSetShadow(LottoChonSo[23], 0);
    TextDrawSetSelectable(LottoChonSo[23], true);

    LottoChonSo[24] = TextDrawCreate(364.026580, 260.583251, "25");
    TextDrawLetterSize(LottoChonSo[24], 0.347992, 1.722499);
    TextDrawAlignment(LottoChonSo[24], 2);
    TextDrawColor(LottoChonSo[24], -1);
    TextDrawSetShadow(LottoChonSo[24], 0);
    TextDrawSetOutline(LottoChonSo[24], 1);
    TextDrawBackgroundColor(LottoChonSo[24], 255);
    TextDrawFont(LottoChonSo[24], 2);
    TextDrawSetProportional(LottoChonSo[24], 1);
    TextDrawSetShadow(LottoChonSo[24], 0);
    TextDrawSetSelectable(LottoChonSo[24], true);

    LottoChonSo[25] = TextDrawCreate(283.909240, 273.999969, "26");
    TextDrawLetterSize(LottoChonSo[25], 0.347992, 1.722499);
    TextDrawAlignment(LottoChonSo[25], 2);
    TextDrawColor(LottoChonSo[25], -1);
    TextDrawSetShadow(LottoChonSo[25], 0);
    TextDrawSetOutline(LottoChonSo[25], 1);
    TextDrawBackgroundColor(LottoChonSo[25], 255);
    TextDrawFont(LottoChonSo[25], 2);
    TextDrawSetProportional(LottoChonSo[25], 1);
    TextDrawSetShadow(LottoChonSo[25], 0);
    TextDrawSetSelectable(LottoChonSo[25], true);

    LottoChonSo[26] = TextDrawCreate(304.055664, 274.583312, "27");
    TextDrawLetterSize(LottoChonSo[26], 0.347992, 1.722499);
    TextDrawAlignment(LottoChonSo[26], 2);
    TextDrawColor(LottoChonSo[26], -1);
    TextDrawSetShadow(LottoChonSo[26], 0);
    TextDrawSetOutline(LottoChonSo[26], 1);
    TextDrawBackgroundColor(LottoChonSo[26], 255);
    TextDrawFont(LottoChonSo[26], 2);
    TextDrawSetProportional(LottoChonSo[26], 1);
    TextDrawSetShadow(LottoChonSo[26], 0);
    TextDrawSetSelectable(LottoChonSo[26], true);

    LottoChonSo[27] = TextDrawCreate(323.733764, 274.583312, "28");
    TextDrawLetterSize(LottoChonSo[27], 0.347992, 1.722499);
    TextDrawAlignment(LottoChonSo[27], 2);
    TextDrawColor(LottoChonSo[27], -1);
    TextDrawSetShadow(LottoChonSo[27], 0);
    TextDrawSetOutline(LottoChonSo[27], 1);
    TextDrawBackgroundColor(LottoChonSo[27], 255);
    TextDrawFont(LottoChonSo[27], 2);
    TextDrawSetProportional(LottoChonSo[27], 1);
    TextDrawSetShadow(LottoChonSo[27], 0);
    TextDrawSetSelectable(LottoChonSo[27], true);

    LottoChonSo[28] = TextDrawCreate(342.943115, 273.416625, "29");
    TextDrawLetterSize(LottoChonSo[28], 0.347992, 1.722499);
    TextDrawAlignment(LottoChonSo[28], 2);
    TextDrawColor(LottoChonSo[28], -1);
    TextDrawSetShadow(LottoChonSo[28], 0);
    TextDrawSetOutline(LottoChonSo[28], 1);
    TextDrawBackgroundColor(LottoChonSo[28], 255);
    TextDrawFont(LottoChonSo[28], 2);
    TextDrawSetProportional(LottoChonSo[28], 1);
    TextDrawSetShadow(LottoChonSo[28], 0);
    TextDrawSetSelectable(LottoChonSo[28], true);

    LottoChonSo[29] = TextDrawCreate(363.089691, 273.416656, "30");
    TextDrawLetterSize(LottoChonSo[29], 0.347992, 1.722499);
    TextDrawAlignment(LottoChonSo[29], 2);
    TextDrawColor(LottoChonSo[29], -1);
    TextDrawSetShadow(LottoChonSo[29], 0);
    TextDrawSetOutline(LottoChonSo[29], 1);
    TextDrawBackgroundColor(LottoChonSo[29], 255);
    TextDrawFont(LottoChonSo[29], 2);
    TextDrawSetProportional(LottoChonSo[29], 1);
    TextDrawSetShadow(LottoChonSo[29], 0);
    TextDrawSetSelectable(LottoChonSo[29], true);

    LottoChonSo[30] = TextDrawCreate(282.972198, 286.833312, "31");
    TextDrawLetterSize(LottoChonSo[30], 0.347992, 1.722499);
    TextDrawAlignment(LottoChonSo[30], 2);
    TextDrawColor(LottoChonSo[30], -1);
    TextDrawSetShadow(LottoChonSo[30], 0);
    TextDrawSetOutline(LottoChonSo[30], 1);
    TextDrawBackgroundColor(LottoChonSo[30], 255);
    TextDrawFont(LottoChonSo[30], 2);
    TextDrawSetProportional(LottoChonSo[30], 1);
    TextDrawSetShadow(LottoChonSo[30], 0);
    TextDrawSetSelectable(LottoChonSo[30], true);

    LottoChonSo[31] = TextDrawCreate(300.776306, 286.833343, "32");
    TextDrawLetterSize(LottoChonSo[31], 0.347992, 1.722499);
    TextDrawAlignment(LottoChonSo[31], 2);
    TextDrawColor(LottoChonSo[31], -1);
    TextDrawSetShadow(LottoChonSo[31], 0);
    TextDrawSetOutline(LottoChonSo[31], 1);
    TextDrawBackgroundColor(LottoChonSo[31], 255);
    TextDrawFont(LottoChonSo[31], 2);
    TextDrawSetProportional(LottoChonSo[31], 1);
    TextDrawSetShadow(LottoChonSo[31], 0);
    TextDrawSetSelectable(LottoChonSo[31], true);

    LottoChonSo[32] = TextDrawCreate(321.391448, 286.833404, "33");
    TextDrawLetterSize(LottoChonSo[32], 0.347992, 1.722499);
    TextDrawAlignment(LottoChonSo[32], 2);
    TextDrawColor(LottoChonSo[32], -1);
    TextDrawSetShadow(LottoChonSo[32], 0);
    TextDrawSetOutline(LottoChonSo[32], 1);
    TextDrawBackgroundColor(LottoChonSo[32], 255);
    TextDrawFont(LottoChonSo[32], 2);
    TextDrawSetProportional(LottoChonSo[32], 1);
    TextDrawSetShadow(LottoChonSo[32], 0);
    TextDrawSetSelectable(LottoChonSo[32], true);

    LottoChonSo[33] = TextDrawCreate(342.475280, 286.249969, "34");
    TextDrawLetterSize(LottoChonSo[33], 0.347992, 1.722499);
    TextDrawAlignment(LottoChonSo[33], 2);
    TextDrawColor(LottoChonSo[33], -1);
    TextDrawSetShadow(LottoChonSo[33], 0);
    TextDrawSetOutline(LottoChonSo[33], 1);
    TextDrawBackgroundColor(LottoChonSo[33], 255);
    TextDrawFont(LottoChonSo[33], 2);
    TextDrawSetProportional(LottoChonSo[33], 1);
    TextDrawSetShadow(LottoChonSo[33], 0);
    TextDrawSetSelectable(LottoChonSo[33], true);

    LottoChonSo[34] = TextDrawCreate(362.621765, 286.249938, "35");
    TextDrawLetterSize(LottoChonSo[34], 0.347992, 1.722499);
    TextDrawAlignment(LottoChonSo[34], 2);
    TextDrawColor(LottoChonSo[34], -1);
    TextDrawSetShadow(LottoChonSo[34], 0);
    TextDrawSetOutline(LottoChonSo[34], 1);
    TextDrawBackgroundColor(LottoChonSo[34], 255);
    TextDrawFont(LottoChonSo[34], 2);
    TextDrawSetProportional(LottoChonSo[34], 1);
    TextDrawSetShadow(LottoChonSo[34], 0);
    TextDrawSetSelectable(LottoChonSo[34], true);
    return 1;
}
Dialog:LOTO(playerid, response, listitem, inputtext[])
{
    if(response)
    switch(listitem) {
        case 0:
        {
            SetPVarInt(playerid, "LotoAfisat", 1);
            SendClientMessage(playerid,-1,"{5F9CC9}(Loto) {ffffff}Hay Chon So May Man Cua Ban.");
            new string[180];
            format(string,sizeof string,"Giai Thuong Cu: $%s~n~Giai Thuong: $%s",FormatNumber(jackpotvechi),FormatNumber(jackpotactual));
            TextDrawSetString(LottoTD[4], string);
            new hour,minn,sec;gettime(hour, minn, sec);
            TextDrawSetString(LottoTD[3], "XO SO: 18:00");
            for(new xx = 0; xx < 6; xx++) TextDrawShowForPlayer(playerid, LottoTD[xx]);
            for(new xx = 0; xx < 35; xx++) TextDrawColor(LottoChonSo[xx], COLOR_WHITE), TextDrawTextSize(LottoChonSo[xx], 10.000000, 10.000000), TextDrawShowForPlayer(playerid, LottoChonSo[xx]);
            SelectTextDraw(playerid, COLOR_GREEN);
        }
    }
    return 1;
}
Dialog:LOTO2(playerid, response, listitem, inputtext[])
{

    for(new xx = 0; xx < 6; xx++) TextDrawHideForPlayer(playerid, LottoTD[xx]);
    for(new xx = 0; xx < 35; xx++) TextDrawHideForPlayer(playerid, LottoChonSo[xx]);
    CancelSelectTextDraw(playerid);
    SetPVarInt(playerid, "LotoAfisat", 0);
    if(!response) {
        for(new z = 0; z < 5; z ++) PlayerInfo[playerid][plottonumber][z] = 0;
        luuveso(playerid);
        return 1;
    }
    if(GetPlayerCash(playerid) < 500000) {
        SendClientMessage(playerid,-1,"Ban khong du $500.000!");
        PlayerInfo[playerid][plottonumber][0] = 0,PlayerInfo[playerid][plottonumber][1] = 0,PlayerInfo[playerid][plottonumber][2] = 0,PlayerInfo[playerid][plottonumber][3] = 0,PlayerInfo[playerid][plottonumber][4] = 0;
        luuveso(playerid);
        return 1;
    }
    new hour,minn,sec;gettime(hour, minn, sec);
    GivePlayerCash(playerid, -500000);
    Update(playerid,pCashx);
    SendClientMessage(playerid,-1,"{5F9CC9}(Loto) {ffffff}Mua Ve So Thanh Cong! Xo So Se Dien Ra Vao Luc 18:00. Ban Da Tra $500.000 Cho Ve So.");
    if(jackpotactual < 100000000) jackpotactual+=500000;
    if(jackpotactual > 100000000) jackpotactual = 100000000;
    Lotoupdate(1);
    luuveso(playerid);
    return 1;
}
function load_lotto() {
    cache_get_value_name_int(0,"jackpotactual", jackpotactual);
    cache_get_value_name_int(0,"jackpotvechi", jackpotvechi);
    new string[128],hour,minn,sec;gettime(hour, minn, sec);
    format(string,sizeof string,"{33AA33}(Lotto)\n\nGiai Lan Truoc: $%s\nGiai Thuong Hien Tai: $%s\n\nXo So Vao Luc %d:00 PM\n\nSu Dung /loto de mua ve so",FormatNumber(jackpotvechi),FormatNumber(jackpotactual),hour+1);
    lottolabel = CreateDynamic3DTextLabel(string, COLOR_WHITE, 822.3647,2.3906,1004.1797, 30);
    return 1;
}
CMD:loto(playerid, params[])
{
    if(!IsPlayerInRangeOfPoint(playerid, 20, 833.269775,10.588416,1004.179687)) return SendClientMessage(playerid,-1,"Ban khong o dai ly ve so!");
    if(PlayerInfo[playerid][plottonumber][0] != 0) return SendClientMessage(playerid,-1,"Ban da co ve so!");
    lottoclick[playerid] = 0;
    SetPVarInt(playerid, "LotoAfisat", 0);
    for(new i = 0; i < 5;i++) PlayerInfo[playerid][plottonumber][i] = 0;
    Dialog_Show(playerid, LOTO, DIALOG_STYLE_LIST, "Loto", "Mua Ve So ($500.000)", "Place", "No");
    return true;
}
CMD:xemveso(playerid, params[])
{
	new string[300];
	if(PlayerInfo[playerid][plottonumber][0] == 0) return SendClientMessage(playerid, COLOR_WHITE,"Ban Khong Co Ve So");
	{
		format(string,sizeof string,"So May Man Cua Ban La: %d, %d, %d, %d, %d",PlayerInfo[playerid][plottonumber][0],PlayerInfo[playerid][plottonumber][1],PlayerInfo[playerid][plottonumber][2],PlayerInfo[playerid][plottonumber][3],PlayerInfo[playerid][plottonumber][4]);
	    SendClientMessage(playerid, COLOR_YELLOW,string);
	}
    return true;
}
CMD:xoso(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, COLOR_RED, "Ban khong Phai Admin 6");
	{
		lotowinner();
	}
	return true;
}
function Lotoupdate(x) {
    new string[128];
    new hour,minn,sec;gettime(hour, minn, sec);

    DestroyDynamic3DTextLabel(lottolabel);
    format(string,sizeof string,"{33AA33}(Lotto)\n\nGiai Lan Truoc: $%s\nGiai Thuong Hien Tai: $%s\n\nXo So Vao Luc %d:00 PM\n\nSu Dung /loto de mua ve so",FormatNumber(jackpotvechi),FormatNumber(jackpotactual),hour+1);
    lottolabel = CreateDynamic3DTextLabel(string, COLOR_WHITE, 822.3647,2.3906,1004.1797, 30);

    switch(x) {
        case 1: {
            mysql_format(SQL,string,sizeof string,"UPDATE `lotto` SET `jackpotactual` = '%d' LIMIT 1",jackpotactual);
        }
        case 2: {
            mysql_format(SQL,string,sizeof string,"UPDATE `lotto` SET `jackpotvechi` = '%d' LIMIT 1",jackpotvechi);
        }
    }
    mysql_tquery(SQL,string,"","");
    return 1;
}
function luuveso(i)
{
	new Query[128];
	mysql_format(SQL, Query, sizeof(Query), "UPDATE users SET `SoMayMan` = '%d|%d|%d|%d|%d' WHERE `ID` = '%d'", PlayerInfo[i][plottonumber][0],PlayerInfo[i][plottonumber][1],PlayerInfo[i][plottonumber][2],PlayerInfo[i][plottonumber][3],PlayerInfo[i][plottonumber][4], PlayerInfo[i][pSQLID]);
	mysql_tquery(SQL, Query, "", "");
	return true;
}
function lotowinner() {
    new numbm[5],winxn[500],wine[300],winco,wincox,string[300];
    format(wine,50,"Khong Mot Ai");
    numbm[0] = 1 + random(35);
    numbm[1] = 1 + random(35);
    numbm[2] = 1 + random(35);
    numbm[3] = 1 + random(35);
    numbm[4] = 1 + random(35);
    foreach(new i : Player) if(PlayerInfo[i][plottonumber][0] == numbm[0] && PlayerInfo[i][plottonumber][1] == numbm[1] && PlayerInfo[i][plottonumber][2] == numbm[2] && PlayerInfo[i][plottonumber][3] == numbm[3] && PlayerInfo[i][plottonumber][4] == numbm[4]) winco++;
    foreach(new i : Player) {
        if(PlayerInfo[i][plottonumber][0] == numbm[0] && PlayerInfo[i][plottonumber][1] == numbm[1] && PlayerInfo[i][plottonumber][2] == numbm[2] && PlayerInfo[i][plottonumber][3] == numbm[3] && PlayerInfo[i][plottonumber][4] == numbm[4]) {
            wincox++;
            format(string,sizeof string,"%s%s",GetName(i), (winco < wincox) ? (","):("."));
            strcat(winxn, string);
            format(wine,sizeof wine,"Nguoi May Man: %s",winxn);
            new money = jackpotactual/winco;
            GivePlayerCash(i, money);
            SCMf(i,-1,"Ban Da Thang $%s Tai Loto!",FormatNumber(money));
            Update(i,pCashx);
        }
        if(PlayerInfo[i][plottonumber][0] == numbm[0]) {
            GivePlayerCash(i, 50000);
            SCMf(i,-1,"Ban Da Thang $50.000 Tai Loto (So May Man: %d)!", PlayerInfo[i][plottonumber][0]);
            Update(i,pCashx);
        }
        if(PlayerInfo[i][plottonumber][0] == numbm[0]) {
            GivePlayerCash(i, 50000);
            SCMf(i,-1,"Ban Da Thang $50.000 Tai Loto (So May Man: %d)!", PlayerInfo[i][plottonumber][0]);
            Update(i,pCashx);
        }
        if(PlayerInfo[i][plottonumber][1] == numbm[1]) {
            GivePlayerCash(i, 50000);
            SCMf(i,-1,"Ban Da Thang $50.000 Tai Loto (So May Man: %d)!", PlayerInfo[i][plottonumber][1]);
            Update(i,pCashx);
        }
        if(PlayerInfo[i][plottonumber][2] == numbm[2]) {
            GivePlayerCash(i, 50000);
            SCMf(i,-1,"Ban Da Thang $50.000 Tai Loto (So May Man: %d)!", PlayerInfo[i][plottonumber][2]);
            Update(i,pCashx);
        }
        if(PlayerInfo[i][plottonumber][3] == numbm[3]) {
            GivePlayerCash(i, 50000);
            SCMf(i,-1,"Ban Da Thang $50.000 Tai Loto (So May Man: %d)!", PlayerInfo[i][plottonumber][3]);
            Update(i,pCashx);
        }
        if(PlayerInfo[i][plottonumber][4] == numbm[4]) {
            GivePlayerCash(i, 50000);
            SCMf(i,-1,"Ban Da Thang $50.000 Tai Loto (So May Man: %d)!", PlayerInfo[i][plottonumber][4]);
            Update(i,pCashx);
        }
    }
    foreach(new i : Player) PlayerInfo[i][plottonumber][0] = 0,PlayerInfo[i][plottonumber][1] = 0,PlayerInfo[i][plottonumber][2] = 0,PlayerInfo[i][plottonumber][3] = 0,PlayerInfo[i][plottonumber][4] = 0, luuveso(i);
    SCMTA(COLOR_LGREEN,"----- LOTO -----");
    format(string,sizeof string,"So May Man La: %d, %d, %d, %d, %d",numbm[0],numbm[1],numbm[2],numbm[3],numbm[4]);
    SCMTA(COLOR_LGREEN,string);
    format(string,sizeof string,"%s Da Trung Giai Doc Dac $%s.",wine,FormatNumber(jackpotactual));
    SCMTA(COLOR_LGREEN,string);
    SCMTA(COLOR_LGREEN,"----------------");
    jackpotvechi = jackpotactual;
    Lotoupdate(1);
    Lotoupdate(2);
    return 1;
}
hook OnPlayerClickTD(playerid, Text:clickedid) {
    new str[200];
	for(new i = 0; i < 35; i ++) {
        if(clickedid == LottoChonSo[i]) {
            TextDrawColor(LottoChonSo[i], COLOR_GREEN);
            TextDrawShowForPlayer(playerid, LottoChonSo[i]);
            lottoclick[playerid]++;
            for(new z = 0; z < 5; z ++) {
                if(PlayerInfo[playerid][plottonumber][z] == 0) 
                {
                    PlayerInfo[playerid][plottonumber][z] = i+1;
                    break;
                }
            }
            if(lottoclick[playerid] == 5) {
                format(str,128,"Ban da chac chan voi muon chon nhung so nay chua?\n\n So May Man: %d, %d, %d, %d, %d\nGia cua ve so la 500,000",PlayerInfo[playerid][plottonumber][0],PlayerInfo[playerid][plottonumber][1],PlayerInfo[playerid][plottonumber][2],PlayerInfo[playerid][plottonumber][3],PlayerInfo[playerid][plottonumber][4]);
                Dialog_Show(playerid, LOTO2, DIALOG_STYLE_MSGBOX, "LOTO", str, "Mua", "No");
            }
            return ~0;
        }
    }    
	if(clickedid == Text:INVALID_TEXT_DRAW) {
		if(GetPVarInt(playerid, "LotoAfisat") == 1) {
			//new str[128];
			format(str,sizeof str,"Giai Thuong Cu: $%s~n~Giai Thuong: $%s",FormatNumber(jackpotvechi),FormatNumber(jackpotactual));
			TextDrawSetString(LottoTD[4], str);
			new hour,minn,sec;gettime(hour, minn, sec);
			TextDrawSetString(LottoTD[3], "XO SO: 18:00");
			for(new xx = 0; xx < 6; xx++) TextDrawShowForPlayer(playerid, LottoTD[xx]);
			for(new xx = 0; xx < 35; xx++) TextDrawColor(LottoChonSo[xx], COLOR_WHITE), TextDrawTextSize(LottoChonSo[xx], 10.000000, 10.000000), TextDrawShowForPlayer(playerid, LottoChonSo[xx]);
			SelectTextDraw(playerid, COLOR_GREEN);
		   	for(new z = 0; z < 5; z ++)	PlayerInfo[playerid][plottonumber][z] = 0;
		   	lottoclick[playerid] = 0;
		   	luuveso(playerid);
            return ~0;
    	}
    }
    return 1;
}