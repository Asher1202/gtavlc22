// TextDraw(s) developed using Gammix's TextDraw editor
#include <a_samp>

// variable decleration on top of script
/*
** textdarw group: "ok"
*/
new Text:okTD;

// creating global textdraw(s) under "OnGameModeInit" preferably
public OnGameModeInit() {
	/*
	** textdarw group: "ok"
	*/
	okTD = TextDrawCreate(308.5000, 436.0000, "level 20");
	TextDrawFont(okTD, 2);
	TextDrawLetterSize(okTD, 0.1900, 1.1000);
	TextDrawAlignment(okTD, 2);
	TextDrawColor(okTD, -1);
	TextDrawSetShadow(okTD, 0);
	TextDrawSetOutline(okTD, 1);
	TextDrawBackgroundColor(okTD, 255);
	TextDrawSetProportional(okTD, 1);
	TextDrawTextSize(okTD, 22.5000, 18.0000);

	return 1;
}

