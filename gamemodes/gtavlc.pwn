/*
	* Author: Nguyen Trung Tin

	© Credit to gtavlc.com 2020-2022
*/

// TODO: make anti faction vehicle-driving
// TODO: remake old /newb
// TODO: add /giveall robpoint/escape point/escape point
// #define MYSQL_PREPARE_DEBUG (true)

/*
    cái shop mình để 3 cái trc đi ha, Base shop, Dice shop, Quest shop, hiện tại có skin thì ra thêm 2 cái nguyên liệu mới nữa để mua hộp mở skin trong Skin shop
    à thêm cái trade skin trong /giaodich nha em
    Đổi các vật phẩm á, rob point, escapepoint, thẻ đổi tên, neon bla bla
*/
#include <a_samp>

#if !defined MAX_PLAYERS
    #undef MAX_PLAYERS
    #define MAX_PLAYERS 200                             // Change this when client increase.
#endif

// #include <fixes> 

#include <constant>
#include <init>

// Toggleable systems:
// #define DISABLE_LICENSE_SHOP                         // Disable buy license via /shop
// #define BOXING_MAP                                   // Enable boxing event
// #define SAVE_POS                                     // Save player pos like RP
#define GIFTCODE_GTAVLC "denbubaotri"      // Enable newbie giftcode

#define FISHING_LS_JOB_ID 11
#define FISHING_LV_JOB_ID 15
#define PIZZA_JOB_ID 9
#define TRUCKER_JOB_ID 2
new Text3D:adminLabel[MAX_PLAYERS];
#define MAX_SEED_TYPE 20
#define BUSTAIM_MAX_CONTINOUS_SHOTS 10

// #define BUSTAIM_MAX_PING 600
// #define BUSTAIM_MAX_PL_PERCENT_ALLOWED 5


#include <YSI_Data\y_iterate>
#include <YSI_Server\y_colours> 
#include <crashdetect>
#include <sscanf2>
#include <streamer>
#define DEBUG
#include <nex-ac_vn.lang>	        //Localization
#include <nex-ac>
#include <BustAim>
#include <AntiCbug>
#include <verytopenum>
// #include <FCNPC>
#include <easyDialog>               //Anti dialog spoof/crash- Emmet_ (easyDialog)
#include <a_mysql>
#include <Pawn.CMD>
#include <colandreas>
    
// NON PLUGIN HEADER
#include <YSI_Coding\y_inline>
#include <YSI_Coding\y_timers>
#include <YSI_Coding\y_va>
#include <YSI_Game\y_vehicledata>      
#include <fader>
#include <playerzone>
#include <a_zone>
#include <mSelection>  
#include <strlib>
#include <fly>
#include <progress2>
#include <AutoAFK>
//#include <sampcac>
#include <EVF> //for vehiclespeedcap and stufsf
// #include <td-streamer-player> 
DEFINE_HOOK_REPLACEMENT(KeyState, KState);
#include <enum>
#include <VIP>
#include <utils>
#include <casino>
#include <taixiu>
// #include <inventory>
#include "Source/modules/fisherman.pwn"
#include "Source/modules/progress.inc" //for jobs
#include "Source/modules/update.pwn"
// #include <battlepass>
#include "Source/modules/crate.inc"
#include <core/timers.pwn>
#include "Source/modules/jail_escape"
#include "Source/modules/tutorial.pwn"
#include <jobs>
#include <cpn>
#include <core/callbacks>
#include <systems>
#include "Source/modules/tax.pwn" // Thuế
#include <toy>
#include <weed>
#include <newinventory/function_inventory>
#include <reputation>   // danh hiệu in vietnamese
#include <shop>



// #include <poker>
#include "Source/modules/lotto"
#include "Source/modules/event"
#include "Source/modules/personal-vehicle.pwn"
//#include "Source/modules/jobgoal"
// #include "Source/modules/lauxanh.pwn"
#include "Source/modules/penhouse.pwn"
#include "Source/modules/growth_point.pwn"
#include "Source/modules/bust_aim_helper.pwn"

#include "Source/modules/nerfWeapon.pwn"


// #include "Source/modules/discord.pwn"

#include "Source/modules/canabis.pwn"
#include "Source/core/stamina.inc"
//#include "Source/modules/sampvoice.pwn"
#include "Source/modules/toll.pwn"
// #include "Source/modules/future.pwn"
// #include "Source/modules/zombie.pwn"
// #include "Source/modules/vehcontainer.pwn"
#include "Source/modules/systemskin.inc"
//#include "Source/modules/levelMission.pwn" disabled cause of bugs.
#include "Source/core/physics_dynamic.pwn"// for bida
#include "Source/modules/pool.pwn"

#include "Source/core/dialog.pwn"
#include "Source/core/functions.pwn"
#include "Source/core/stocks.pwn"


//Systems
#include "Source/modules/punish.pwn"
#include "Source/modules/pin.pwn" 
#include "Source/modules/paintball.pwn"
#include "Source/modules/bizz.pwn"
#include "Source/modules/bangxephang"
// #include "Source/modules/refund"
// #include "Source/modules/acccheck.pwn"
// #include "Source/modules/ghidanhboxing"
#include "Source/modules/email.pwn"
#include "Source/modules/trade.pwn"
#include "Source/modules/giftcode"
#include "Source/modules/boombox.pwn"
#include "Source/modules/gps.pwn"           //need to fix
#include "Source/modules/ls_beachside.pwn"
#include "Source/modules/dmv.pwn"
#include "Source/modules/catsung.pwn"
#include "Source/core/foodsystem.inc"

// Map
#include "Source/map/interior2"
#include "Source/map/exterior3"
// #include "Source/map/grays"
#include <map/exterior9>
#include <map/interior8>
#include <map/interior10>
 #include <map/hq.inc>

// #include <map/yellow>
#include <map/islandevent>
// #include <map/grays2s>
// #include <map/grays3s>

// #include "Source/modules/cfirework.pwn" //firework for admin

//Commands
#include "Source/player/base.pwn"
#include "Source/admin/base.pwn"
#include "Source/helper/base.pwn"

#include "Source/core/callbacks/anticheat"

main() {
}

public OnGameModeExit() {
    mysql_close(SQL);    
}