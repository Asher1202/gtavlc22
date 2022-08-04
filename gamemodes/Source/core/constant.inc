#define VW_JAIL                     24
#define UCP "ucp.gtavlc.com"

#define MAX_LOGIN                   (30)

// Disable some YSI functions that takes time
// #define YSI_NO_MODE_CACHE                   
// #define YSI_NO_HEAP_MALLOC
// #define YSI_NO_OPTIMISATION_MESSAGE

#define DYNAMIC_MEMORY (65536)
#define IsPlayerAndroid(%0)                 GetPVarInt(%0, "NotAndroid") == 0
#define YSI_DEFAULT_MALLOC (2047)
#define YSI_YES_HEAP_MALLOC
#pragma dynamic DYNAMIC_MEMORY
#define CGEN_MEMORY 75000                  // Compiler needed

#define SPEED_MULTIPLIER 1.025
#define SPEED_THRESHOLD  0.4

#define AC_MAX_CONNECTS_FROM_IP 15
#define AUTOSAVE_SETTINGS_IN_CONFIG true
#define AC_MIN_TIME_RECONNECT 5

// IMPORTANT
#define MAX_REPUTATION    38
#define MAX_CARS 		3000 //default is 10000
#define MAX_BLOCKED_USER 20
// Change the MAX_CARS when players increase, because the car ID 
// store the SQL car ID.
#define MAX_DSMODEL 	120
#define MAX_FACTIONS	20
#define MAX_SVEHICLES	500
#define MAX_COBJECTS	50
#define MAX_SYSTEMS 	23
#define MAX_SAFEZONES   50
#define MAX_CLANZONES   20
#define GasMax 			100
#define RunOutTime 		40000
#define RefuelWait 		10000
#define CAR_AMOUNT 		700
#define STAMINA_DEFAULT_RECOVERYTIME		(5000)

// DEFINE
#define SANGLAP 				"fb.com/kophaitin"
#define CHU_SERVER 				"fb.com/kophaitin"
#define SCRIPTER 				"fb.com/kophaitin"
#define GROUP 					"fb.com/groups/gtavlc"
#define FANPAGE 				"fb.com/rpg.gtavlc"
#define ADMIN_PASSWORD			"ok"
#define SERVER_URL				"gtavlc.com"
#define SEXUAL_ACCEPTION 		(0)
#define DIEMCAOCAP 				"vip xu"
#define SAMP_VERSION 			"0.3.7"
#define MAX_JOBS 				(18)
#define MAX_CONNECTIONS_PER_IP	15
// SERVER
#define SERVER_NAME 			"GTAVLC"
#define SERVER_VERSION			"v3.5"

new stringDocFileTo[ 2048 ];
new stringDocFileNho[ 144 ];

#define UPDATEDIRECTORY     "update"    
#define LINKMOFILELOG    ( UPDATEDIRECTORY # "/update.cfg" )
// Special
#define QUEST_NAME 				"Nhiem vu he"
#define QUEST_OBJECT 			(2406)
new SpecialWeek = 1;

// DEFINES - OTHERS
#if !defined IsValidVehicle
    native IsValidVehicle(vehicleid); // Unlock the hidden native
#endif

// #define SPECIAL_ACTION_PISSING   68	
#define KEY_AIM 				(128)

#define TOWTRUCK_FACTION_ID 		(8)
#define MEDIC_FACTION_ID 			(13)
#define INSTRUCTOR_FACTION_ID 		(7)
#define MECHANIC_FACTION_ID 		(8)
#define TAXI_FACTION_ID 			(12)
#define MAX_TURFS 					(48)
#define MAX_BIZ 					(120)
#define MAX_HOUSES					(300)

// // FIRE
// #define MAX_FIRES					(100)		// max amout of fires able to exist at once
// // #define BurnOthers								// should players be able to ignite other players by touching?
// #define FireMessageColor			0x00FF55FF	// color used for the extinguishing message

// #define BURNING_RADIUS 				(1.5)     	// radius in which you start burning if you're too close to a fire
// #define ONFOOT_RADIUS				(1.5)		// radius in which you can extinguish the fire by foot
// #define PISSING_DISTANCE			(2.0)		// radius in which you can extinguish the fire by peeing
// #define CAR_RADIUS					(8.0)		// radius in which you can extinguish the fire by firetruck/SWAT Van
// #define Z_DIFFERENCE				(2.5)		// height which is used for technical accurancy of extinguishing. Please do not change
// #define FIRE_UPDATE_TIMER_DELAY     (500)     	// amount of milliseconds the fire timer should loop in
// #define EXTINGUISH_TIME_VEHICLE		(1)			// time you have to spray at the fire with a firetruck (seconds)
// #define EXTINGUISH_TIME_ONFOOT		(4)			// time you have to spray at the fire onfoot (seconds)
// #define EXTINGUISH_TIME_PEEING		(10)		// time you have to pee at the fire (seconds)
// #define EXTINGUISH_TIME_PLAYER		(2)			// time it takes to extinguish a player (seconds)
// #define FIRE_OBJECT_SLOT			(1)			// the slot used with SetPlayerAttachedObject and RemovePlayerAttachedObject	

#define COLOR_ERROR         0xC0241FFF
#define Peeing(%0) (GetPlayerSpecialAction(%0) == SPECIAL_ACTION_PISSING)

#define COL_GREEN                   "{6EF83C}"
#define COL_LGREEN                  "{91FA6B}"
#define COL_RED                     "{F81414}"
#define COL_BLUE                    "{00C0FF}"
#define COL_LRED                    "{FFA1A1}"
#define COL_GOLD                    "{FFDC2E}"
#define COL_PLATINUM                "{E0E0E0}"
#define COL_DIAMOND                 "{4EE2EC}"
#define COL_GREY                    "{C0C0C0}"
#define COL_PINK                    "{FF0770}"
#define COL_PURPLE                  "{885EAD}"
#define COL_WHITE                   "{FFFFFF}"
#define COL_ORANGE                  "{FF7500}"
#define COL_GANG                    "{009999}"
#define COL_YELLOW                  "{FFFF00}"
#define COL_BLACK                   "{333333}"
#define COL_BRONZE                  "{CD7F32}"
#define COL_FIREMAN                 "{A83434}"


