


#include 							<YSI_Coding\y_hooks>
// cai nay la bida ok
stock szBigString[ 256 ];

#define POCKET_RADIUS 				( 0.09 )
#define POOL_TIMER_SPEED 			( 25 )
#define DEFAULT_AIM 				( 0.38 )
#define DEFAULT_POOL_STRING 		"BAN BIDA\n{FFFFFF}Bam nut 'F' de choi"
#define POOL_FEE_RATE 				( 0.2 )

#define MAX_POOL_TABLES 			( 48 )
#define MAX_POOL_BALLS 				( 16 ) // 0


#define SendPoolMessage(%0,%1)		SendClientMessageFormatted(%0, -1, "{4B8774}[BI-DA] {E5861A}" # %1)



#define HOLDING(%0)                         ((newkeys & (%0)) == (%0))

#define SendUsage(%0,%1)                    (SendClientMessageFormatted(%0,-1,"{FFAF00}[HUONG DAN]{FFFFFF} " # %1))
#define SendError(%0,%1) 			        (SendClientMessageFormatted(%0,-1,"{F81414}[LOI]{FFFFFF} " # %1))
#define SendClientMessageToAllFormatted(%0) (SendClientMessageFormatted(INVALID_PLAYER_ID, %0))
#define sprintf(%1)                         (format(g_szSprintfBuffer, sizeof(g_szSprintfBuffer), %1), g_szSprintfBuffer)
enum E_POOL_BALL_TYPE {
	E_STRIPED,
	E_SOLID,
	E_CUE,
	E_8BALL
};

stock g_szSprintfBuffer[ 1024 ];

new
	p_HideHelpDialogTimer[ MAX_PLAYERS ] = { -1, ... };

function HidePlayerHelpDialog( playerid )
{
	p_HideHelpDialogTimer[ playerid ] = -1;
	PlayerTextDrawHide( playerid, p_HelpBoxTD[ playerid ] );
}


stock ShowPlayerHelpDialog( playerid, timeout, const format[ ], va_args<> )
{
    static
		out[ 255 ]
	;

	if ( !IsPlayerConnected( playerid ) )
		return 0;

    va_format( out, sizeof( out ), format, va_start<3> );

    PlayerTextDrawSetString( playerid, p_HelpBoxTD[ playerid ], out );
    PlayerTextDrawShow( playerid, p_HelpBoxTD[ playerid ] );

    KillTimer( p_HideHelpDialogTimer[ playerid ] );
    p_HideHelpDialogTimer[ playerid ] = -1;

   	if ( timeout != 0 ) {
   		p_HideHelpDialogTimer[ playerid ] = SetTimerEx( "HidePlayerHelpDialog", timeout, false, "d", playerid );
   	}
	return 1;
}

enum E_POOL_SKINS {
	POOL_SKIN_DEFAULT,
	POOL_SKIN_WOOD_PURPLE,
	POOL_SKIN_WOOD_GREEN,
	POOL_SKIN_GOLD_GREEN,
	POOL_SKIN_WOOD_BLUE,
	POOL_SKIN_LWOOD_GREEN
};

enum E_POOL_BALL_OFFSET_DATA
{
	E_MODEL_ID, 					E_BALL_NAME[ 9 ],				E_POOL_BALL_TYPE: E_BALL_TYPE,
	Float: E_OFFSET_X, 				Float: E_OFFSET_Y
};

static const
	g_poolBallOffsetData[ MAX_POOL_BALLS ] [ E_POOL_BALL_OFFSET_DATA ] =
	{
		{ 3003, "Bi trang", 	E_CUE, 		0.5000, 0.0000 },
		{ 3002, "1",		E_SOLID,	-0.300, 0.0000 },
		{ 3100, "2",		E_SOLID, 	-0.525, -0.040 },
		{ 3101, "3",	E_SOLID,	-0.375, 0.0440 },
		{ 3102, "4",		E_SOLID,	-0.600, 0.0790 },
		{ 3103,	"5",		E_SOLID,	-0.525, 0.1180 },
		{ 3104,	"6",		E_SOLID,	-0.600, -0.157 },
		{ 3105, "7",	E_SOLID,	-0.450, -0.079 },
		{ 3106,	"8",	E_8BALL,	-0.450, 0.0000 },
		{ 2995, "9",		E_STRIPED,	-0.375, -0.044 },
		{ 2996, "10",		E_STRIPED,	-0.450, 0.0790 },
		{ 2997, "11",	E_STRIPED,	-0.525, -0.118 },
		{ 2998, "12",	E_STRIPED,	-0.600, -0.079 },
		{ 2999, "13",	E_STRIPED,	-0.600, 0.0000 },
		{ 3000, "14",	E_STRIPED,	-0.600, 0.1570 },
		{ 3001, "15",	E_STRIPED,	-0.525, 0.0400 }
	},
	Float: g_poolPotOffsetData[ ] [ ] =
	{
		{ 0.955, 0.510 }, { 0.955, -0.49 },
		{ 0.005, 0.550 }, { 0.007, -0.535 },
		{ -0.945, 0.513 }, { -0.945, -0.490 }
	},
	g_poolHoleOpposite[ sizeof( g_poolPotOffsetData ) ] = { 5, 4, 3, 2, 1, 0 }
;

enum E_POOL_BALL_DATA
{
	E_BALL_PHY_HANDLE[ 16 ],		bool: E_POCKETED[ 16 ]
};

enum E_POOL_TABLE_DATA
{
	Float: E_X,						Float: E_Y, 					Float: E_Z,
	Float: E_ANGLE, 				E_WORLD, 						E_INTERIOR,

	E_TIMER, 						E_BALLS_SCORED, 				E_POOL_BALL_TYPE: E_PLAYER_BALL_TYPE[ MAX_PLAYERS ],
	bool: E_STARTED, 				E_AIMER, 						E_AIMER_OBJECT,
	E_NEXT_SHOOTER,

	E_SHOTS_LEFT,					E_FOULS,						E_PLAYER_8BALL_TARGET[ MAX_PLAYERS ],
	bool: E_EXTRA_SHOT,				bool: E_CUE_POCKETED,

	E_WAGER,						bool: E_READY,					E_CUEBALL_AREA,

	Float: E_POWER,					E_DIRECTION,

	E_TABLE,						Text3D: E_LABEL,
}

new
	g_poolTableData 				[ MAX_POOL_TABLES ] [ E_POOL_TABLE_DATA ],
	g_poolBallData 					[ MAX_POOL_TABLES ] [ E_POOL_BALL_DATA ],

	p_PoolID 						[ MAX_PLAYERS ] = { -1, ... },

	bool: p_isPlayingPool			[ MAX_PLAYERS char ],
	bool: p_PoolChalking			[ MAX_PLAYERS char ],
	bool: p_PoolCameraBirdsEye		[ MAX_PLAYERS char ],
	p_PoolScore 					[ MAX_PLAYERS ],
	p_PoolHoleGuide 				[ MAX_PLAYERS ] = { -1, ... },
	Float: p_PoolAngle 				[ MAX_PLAYERS ] [ 2 ],

	PlayerBar: g_PoolPowerBar 		[ MAX_PLAYERS ],
	Text: g_PoolTextdraw			= Text: INVALID_TEXT_DRAW,

	Iterator: pooltables 			< MAX_POOL_TABLES >,
	Iterator: poolplayers 			< MAX_POOL_TABLES, MAX_PLAYERS >
;

forward deleteBall 					( poolid, ballid );
forward RestoreWeapon 				( playerid );
forward RestoreCamera 				( playerid );
forward OnPoolUpdate 				( poolid );
// forward PlayPoolSound 				( poolid, soundid );

hook OnGameModeInit()
{

	g_PoolTextdraw = TextDrawCreate( 529.000000, 218.000000, "Luc" );
	TextDrawBackgroundColor( g_PoolTextdraw, 255 );
	TextDrawFont( g_PoolTextdraw, 1 );
	TextDrawLetterSize( g_PoolTextdraw, 0.300000, 1.299998 );
	TextDrawColor( g_PoolTextdraw, -1 );
	TextDrawSetOutline( g_PoolTextdraw, 1 );
	TextDrawSetProportional( g_PoolTextdraw, 1 );
	TextDrawSetSelectable( g_PoolTextdraw, 0 );

	// server pool
	CreatePoolTableEx( 510.10159, -84.83590, 998.9375, 90.00000, POOL_SKIN_WOOD_PURPLE, 11, 7);
	CreatePoolTableEx( 506.48441, -84.83590, 998.9375, 90.00000, POOL_SKIN_GOLD_GREEN, 11, 7);
	CreatePoolTableEx( 510.12625, -79.61063, 998.93750, 90.00000, POOL_SKIN_WOOD_BLUE, 11, 7);
	CreatePoolTableEx(  506.51486, -79.62738, 998.9375, 90.00000, POOL_SKIN_DEFAULT, 11, 7);
	CreatePoolTableEx( 510.27133, -74.60744, 997.71082, 0.00000, POOL_SKIN_LWOOD_GREEN, 11, 7);
	CreatePoolTableEx(   489.79886, -80.25784, 997.71082, 90.00000, POOL_SKIN_WOOD_GREEN, 11, 7);


	printf( "[BI-DA]: %d da load ban bida.", Iter_Count( pooltables ) );
	return 1;
}
stock Float: GetDistanceFromPointToPoint( Float: fX, Float: fY, Float: fX1, Float: fY1 )
    return Float: floatsqroot( floatpower( fX - fX1, 2 ) + floatpower( fY - fY1, 2 ) );

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	new Float: pooltable_distance = 99999.99;
	new poolid = Pool_GetClosestTable( playerid, pooltable_distance );
	static Float: X, Float: Y, Float: Z;
	if (poolid != -1 && pooltable_distance < 2.5)
	{
		if (g_poolTableData[ poolid ] [ E_STARTED ])
		{
			if ( HOLDING( KEY_SECONDARY_ATTACK ) && IsPlayerPlayingPool( playerid ) ) {
				if ( PRESSED( KEY_CROUCH ) ) {
					HidePlayerHelpDialog( playerid );
					Pool_SendTableMessage( poolid, COLOR_GREY, "-- "COL_WHITE" %s(%d) da roi ban", GetName( playerid ), playerid );
					return Pool_RemovePlayer( playerid );
				} else {
					return GameTextForPlayer( playerid, "~w~~n~~w~ Bam ~r~~k~~PED_DUCK~~w~ de roi ban", 3500, 3 ), 1;
				}
			}

			if ( RELEASED( KEY_FIRE ) && g_poolTableData[ poolid ] [ E_AIMER ] != playerid && ! p_PoolChalking{ playerid } )
			{

				if ( IsPlayerPlayingPool( playerid ) )
				{
					p_PoolChalking{ playerid } = true;

					SetPlayerArmedWeapon( playerid, 0 );
					SetPlayerAttachedObject( playerid, 0, 338, 6, 0, 0.07, -0.85, 0, 0, 0 );
					ApplyAnimation( playerid, "POOL", "POOL_ChalkCue", 3.0, 0, 1, 1, 1, 0, 1 );

					// SetTimerEx( "PlayPoolSound", 1400, false, "dd", playerid, 31807 );
					SetTimerEx( "RestoreWeapon", 3500, false, "d", playerid );
				}
				else
				{
					ClearAnimations( playerid );
				}

				if ( Pool_AreBallsStopped( poolid ) ) {
					Pool_ResetBallPositions( poolid );
				}
				return 1;
			}

			// bat dau game
			if ( IsPlayerPlayingPool( playerid ) && p_PoolID[ playerid ] == poolid )
			{
				if ( RELEASED( KEY_JUMP ) )
				{
					if ( g_poolTableData[ poolid ] [ E_AIMER ] == playerid )
					{
						p_PoolCameraBirdsEye{ playerid } = ! p_PoolCameraBirdsEye{ playerid };
						Pool_UpdatePlayerCamera( playerid, poolid );
					}
				}

				if(newkeys & KEY_HANDBRAKE)
				{
					if ( Pool_AreBallsStopped( poolid ) )
					{
						if ( g_poolTableData[ poolid ] [ E_AIMER ] != playerid )
						{
							if ( g_poolTableData[ poolid ] [ E_NEXT_SHOOTER ] != playerid ) {
								return SendPoolMessage( playerid, "Chua den luot ban." );
							}

							if ( g_poolTableData[ poolid ] [ E_CUE_POCKETED ] ) {
								return SendPoolMessage( playerid, "Ban se duoc hut khi dat banh." );
							}

							if ( ! p_PoolChalking{ playerid } && g_poolTableData[ poolid ] [ E_AIMER ] == -1 )
							{
								new Float:Xa, Float:Ya, Float:Za,
								Float:x, Float:y;

								GetPlayerPos( playerid, X, Y, Z );

								if ( Z > g_poolTableData[ poolid ] [ E_Z ] + 0.5 ) {
									return SendPoolMessage( playerid, "Hay di xuong dung canh mat ban." );
								}

								new objectid = PHY_GetHandleObject( g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ 0 ] );
								GetDynamicObjectPos( objectid, Xa, Ya, Za );

								new
									Float: distance_to_ball = GetDistanceFromPointToPoint( X, Y, Xa, Ya );

								if ( distance_to_ball < 2.0 && Z < 999.5 )
								{
									new
										Float: poolrot = atan2( Ya - Y, Xa - X ) - 90.0;

									TogglePlayerControllable( playerid, false );

	                            	p_PoolAngle[ playerid ] [ 0 ] = poolrot;
	                            	p_PoolAngle[ playerid ] [ 1 ] = poolrot;

									SetPlayerArmedWeapon( playerid, 0 );
									Pool_GetXYInFrontOfPos( Xa, Ya, poolrot + 180, x, y, 0.085 );
									g_poolTableData[ poolid ] [ E_AIMER_OBJECT ] = CreateDynamicObject( 3004, x, y, Za, 7.0, 0, poolrot + 180, .worldid = g_poolTableData[ poolid ] [ E_WORLD ] );

									if ( distance_to_ball < 1.20 ) {
										distance_to_ball = 1.20;
									}

					              	Pool_GetXYInFrontOfPos( Xa, Ya, poolrot + 180 - 5.0, X, Y, distance_to_ball ); 
					                SetPlayerPos( playerid, X, Y, Z );
	                				SetPlayerFacingAngle( playerid, poolrot );

									if ( distance_to_ball > 1.5 ) {
										ApplyAnimation( playerid, "POOL", "POOL_XLong_Start", 4.1, 0, 1, 1, 1, 1, 1 );
									} else {
										ApplyAnimation( playerid, "POOL", "POOL_Long_Start", 4.1, 0, 1, 1, 1, 1, 1 );
									}

									g_poolTableData[ poolid ] [ E_AIMER ] = playerid;
									g_poolTableData[ poolid ] [ E_POWER ] = 1.0;
									g_poolTableData[ poolid ] [ E_DIRECTION ] = 0;

									Pool_UpdatePlayerCamera( playerid, poolid );
									Pool_UpdateScoreboard( poolid );

									TextDrawShowForPlayer( playerid, g_PoolTextdraw );
									ShowPlayerProgressBar( playerid, g_PoolPowerBar[playerid] );
								}
							}
						}
						else
						{
							TogglePlayerControllable( playerid, true );
							ServerWeapon( playerid, 7, 1 );

							ClearAnimations( playerid );
	            			SetCameraBehindPlayer( playerid );
							ApplyAnimation( playerid, "CARRY", "crry_prtial", 4.0, 0, 1, 1, 0, 0 );

							TextDrawHideForPlayer( playerid, g_PoolTextdraw );
							HidePlayerProgressBar( playerid, g_PoolPowerBar[playerid] );

	            			g_poolTableData[ poolid ] [ E_AIMER ] = -1;
	            			DestroyDynamicObject( g_poolTableData[ poolid ] [ E_AIMER_OBJECT ] );
	            			g_poolTableData[ poolid ] [ E_AIMER_OBJECT ] = -1;
						}
					}
				}

				if ( RELEASED( KEY_FIRE ) )
				{
					if ( g_poolTableData[ poolid ] [ E_AIMER ] == playerid )
					{
						new Float: ball_x, Float: ball_y, Float: ball_z;

						g_poolTableData[ poolid ] [ E_SHOTS_LEFT ] --;

						Pool_UpdateScoreboard( poolid );

						GetDynamicObjectPos( PHY_GetHandleObject( g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ 0 ] ), ball_x, ball_y, ball_z );
						new Float: distance_to_ball = GetPlayerDistanceFromPoint( playerid, ball_x, ball_y, ball_z );

						if ( distance_to_ball > 1.5 ) {
							ApplyAnimation( playerid, "POOL", "POOL_XLong_Shot", 4.1, 0, 1, 1, 0, 0, 1 );
						} else {
							ApplyAnimation( playerid, "POOL", "POOL_Long_Shot", 4.1, 0, 1, 1, 0, 0, 1 );
						}

						new Float: speed = 0.4 + ( g_poolTableData[ poolid ] [ E_POWER ] * 2.0 ) / 100.0;
						PHY_SetHandleVelocity( g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ 0 ], speed * floatsin( -p_PoolAngle[ playerid ] [ 0 ], degrees ), speed * floatcos( -p_PoolAngle[ playerid ] [ 0 ], degrees ) );

						SetPlayerCameraPos( playerid, g_poolTableData[ poolid ] [ E_X ], g_poolTableData[ poolid ] [ E_Y ], g_poolTableData[ poolid ] [ E_Z ] + 2.0 );
						SetPlayerCameraLookAt( playerid, g_poolTableData[ poolid ] [ E_X ], g_poolTableData[ poolid ] [ E_Y ], g_poolTableData[ poolid ] [ E_Z ] );

						// PlayPoolSound( poolid, 31810 );
						g_poolTableData[ poolid ] [ E_AIMER ] = -1;
						DestroyDynamicObject( g_poolTableData[ poolid ] [ E_AIMER_OBJECT ] );
						g_poolTableData[ poolid ] [ E_AIMER_OBJECT ] = -1;

						ServerWeapon( playerid, 7, 1 );
					}
					else ClearAnimations( playerid );
				}
			}
		}
		else
		{
			if ( PRESSED( KEY_SECONDARY_ATTACK ) )
			{
				if ( IsPlayerPlayingPool( playerid ) && Iter_Contains( poolplayers< poolid >, playerid ) )
				{
					HidePlayerHelpDialog( playerid );
					Pool_SendTableMessage( poolid, COLOR_GREY, "-- "COL_WHITE" %s(%d) da roi ban", GetName( playerid ), playerid );
					return Pool_RemovePlayer( playerid );
				}

				new
					pool_player_count = Iter_Count( poolplayers< poolid > );

				if ( pool_player_count >= 2 ) {
					return SendUsage( playerid, "Ban nay hien tai da du nguoi." );
				}

				if ( ! IsPlayerPlayingPool( playerid ) && ! Iter_Contains( poolplayers< poolid >, playerid ) )
				{
					if ( pool_player_count == 1 && ! g_poolTableData[ poolid ] [ E_READY ] ) {
						return SendError( playerid, "Ban nay chua san sang de choi." );
					}

					new
						entry_fee = g_poolTableData[ poolid ] [ E_WAGER ];

					if ( GetPlayerCash( playerid ) < entry_fee && g_poolTableData[ poolid ] [ E_READY ] ) {
						return SendError( playerid, "Ban can %s de tham gia ban.", FormatNumber( entry_fee ) );
					}
                    if ( BidaOn == 0){
                        return SendError( playerid, "Bida da dong, hay nghi ngoi thoi nao (Bida mo vao khung gio 8h-12h va 16h -> 3h )");
                    }
					Iter_Add( poolplayers< poolid >, playerid );

					p_isPlayingPool{ playerid } = true;
					p_PoolID[ playerid ] = poolid;

					if ( g_poolTableData[ poolid ] [ E_READY ] ) {
						GivePlayerCash( playerid, -entry_fee );
						Update(playerid, pCashx);
					}

					if ( pool_player_count + 1 >= 2 )
					{
					    new
					    	random_cuer = Iter_Random( poolplayers< poolid > );

						Pool_SendTableMessage( poolid, COLOR_GREY, "-- "COL_WHITE" %s(%d) Da vao ban (2/2)", GetName( playerid ), playerid );
					    Pool_QueueNextPlayer( poolid, random_cuer );

					    foreach ( new i : poolplayers< poolid > ) {
							p_PoolScore[ i ] = 0;
							PlayerPlaySound( i, 1085, 0.0, 0.0, 0.0 );
							GivePlayerWeapon( i, 7, 1 );
					    }

						g_poolTableData[ poolid ] [ E_STARTED ] = true;
				    	Pool_UpdateScoreboard( poolid );
						Pool_RespawnBalls( poolid );
					}
					else
					{
						g_poolTableData[ poolid ] [ E_WAGER ] = 0;
						g_poolTableData[ poolid ] [ E_READY ] = false;
						Dialog_Show( playerid, DIALOG_POOL_WAGER, DIALOG_STYLE_INPUT, "{FFFFFF}Dat cuoc bida", "{FFFFFF}Hay nhap so tien cu the de vao ban:", "Dat", "Mien Phi" );
						ShowPlayerHelpDialog( playerid, 0, "~y~~h~~k~~PED_LOCK_TARGET~ ~w~- Nham co~n~~y~~h~~k~~PED_FIREWEAPON~ ~w~- Ban~n~~y~~h~~k~~PED_JUMPING~ ~w~- Chinh camera~n~~y~~h~~k~~VEHICLE_ENTER_EXIT~ ~w~- Thoat~n~~n~~r~~h~Dang cho them mot nguoi choi..." );
						UpdateDynamic3DTextLabelText( g_poolTableData[ poolid ] [ E_LABEL ], -1, sprintf( "" # COL_GREY "Ban bida\n"COL_ORANGE"... Dang cho %s(%d) ...", GetName( playerid ), playerid ) );
						Pool_SendTableMessage( poolid, COLOR_GREY, "-- "COL_WHITE" %s(%d) da vao ban (1/2)", GetName( playerid ), playerid );
					}
					return 1;
				}
			}
		}
	}
	return 1;
}
Dialog:DIALOG_POOL_WAGER(playerid, response, listitem, inputtext[]) 
{
	new poolid = p_PoolID[ playerid ];
	if (poolid == -1) {
		return SendClientMessage( playerid, COLOR_RED, "Loi khong the xac thuc ban hay thu lai." );
	}
	new wager_amount = strval(inputtext);
	if ( response && wager_amount > 0 && wager_amount < 500000 )
	{
		if ( wager_amount > GetPlayerCash( playerid ) ) {
			Dialog_Show( playerid, DIALOG_POOL_WAGER, DIALOG_STYLE_INPUT, "{FFFFFF}Ban bida", "{FFFFFF}Hay nhap so tien cuoc ban muon cho ban nay:\n\n"COL_RED"Ban khong co du tien!", "Dong y", "Huy" );
		} else {
			GivePlayerCash( playerid, -wager_amount );
			g_poolTableData[ poolid ] [ E_WAGER ] = wager_amount;
			g_poolTableData[ poolid ] [ E_READY ] = true;
			Pool_SendTableMessage( poolid, -1, ""COL_GREY"-- "COL_WHITE" %s(%d) da chinh tien cuoc cua ban thanh %s!", GetName( playerid ), playerid, FormatNumber( wager_amount ) );
			UpdateDynamic3DTextLabelText( g_poolTableData[ poolid ] [ E_LABEL ], -1, sprintf( "" # COL_GREY "Ban bida\n"COL_GREEN"Bam nut F de tham gia %s(%d)\n"COL_RED"%s Tien Cuoc", GetName( playerid ), playerid, FormatNumber( wager_amount ) ) );
		}
		return 1;
	}
	else
	{
		g_poolTableData[ poolid ] [ E_WAGER ] = 0;
		g_poolTableData[ poolid ] [ E_READY ] = true;
		Pool_SendTableMessage( poolid, -1, ""COL_GREY"-- "COL_WHITE" %s(%d) da dat tien cuoc thanh MIEN PHI!", GetName( playerid ), playerid );
		UpdateDynamic3DTextLabelText( g_poolTableData[ poolid ] [ E_LABEL ], -1, sprintf( "" # COL_GREY "Ban bida\n"COL_GREEN"Bam nut F de tham gia %s(%d)", GetName( playerid ), playerid ) );
	}
	return 1;
}
hook OnPlayerDisconnect( playerid, reason )
{
	Pool_RemovePlayer( playerid );
	return 1;
}

#if defined AC_INCLUDED
hook OnPlayerDeathEx( playerid, killerid, reason, Float: damage, bodypart )
#else
hook OnPlayerDeath( playerid, killerid, reason )
#endif
{
	Pool_RemovePlayer( playerid );
	return 1;
}

hook OnPlayerConnect( playerid )
{
	g_PoolPowerBar[ playerid ] = CreatePlayerProgressBar( playerid, 530.000000, 233.000000, 61.000000, 6.199999, -1429936641, 100.0000, 0 );
	RemoveBuildingForPlayer( playerid, 2964, 510.1016, -84.8359, 997.9375, 9999.9 );
	return 1;
}

hook OnPlayerUpdate( playerid )
{
	new
		poolid = p_PoolID[ playerid ];

	if ( IsPlayerPlayingPool( playerid ) && poolid != -1 )
	{
		new
			Float: distance_to_table = GetPlayerDistanceFromPoint( playerid, g_poolTableData[ poolid ] [ E_X ], g_poolTableData[ poolid ] [ E_Y ], g_poolTableData[ poolid ] [ E_Z ] );

		if ( distance_to_table >= 25.0 )
		{
			Pool_SendTableMessage( poolid, COLOR_GREY, "-- "COL_WHITE" %s(%d) da bi kick ra khoi ban [Li do: Ra khoi pham vi ban choi]", GetName( playerid ), playerid );
			return Pool_RemovePlayer( playerid ), 1;
		}
	}
	return 1;
}


stock Pool_RemovePlayer( playerid )
{
	new
		poolid = p_PoolID[ playerid ];

	
	p_isPlayingPool{ playerid } = false;
	p_PoolScore[ playerid ] = 0;
	p_PoolID[ playerid ] = -1;
	DestroyDynamicObject( p_PoolHoleGuide[ playerid ] );
	p_PoolHoleGuide[ playerid ] = -1;
	RestoreCamera( playerid );
	HidePlayerHelpDialog( playerid );
	ResetWeapons(playerid);
	// kiem tra xem co trong pool k
	if ( poolid != -1 && Iter_Contains( poolplayers< poolid >, playerid ) )
	{
		// xoa
		Iter_Remove( poolplayers< poolid >, playerid );

		// dau hang
		if ( g_poolTableData[ poolid ] [ E_STARTED ] )
		{
			// ... neu chi co 1 nguoi thi tinh no la dau hang lun
			if ( Iter_Count( poolplayers< poolid > ) )
			{
				new replacement_winner = Iter_First( poolplayers< poolid > );
				new sweapon, sammo;
				sweapon = GetPlayerWeapon(playerid);
				sammo = GetPlayerAmmo(playerid);
					
				new weapons[13], wammo[13];
				for(new i = 0; i < 12; i++) {
					GetPlayerWeaponData(playerid, i, sweapon, sammo); 
					if(sweapon != 0 && sweapon != GetPlayerWeapon(playerid)) weapons[i] = sweapon, wammo[i] = sammo;
				}	
				ResetWeapons(playerid);
				for(new i = 0; i < 12; i++) {
					if(weapons[i] != 0) ServerWeapon(playerid, weapons[i], wammo[i]);
				}
				SetPlayerArmedWeapon(playerid, 0);
				Pool_OnPlayerWin( poolid, replacement_winner );
			}
			return Pool_EndGame( poolid );
		}
		else
		{
			// khong co ai thi tra tien
			if ( ! Iter_Count( poolplayers< poolid > ) && g_poolTableData[ poolid ] [ E_READY ] )
			{
				GivePlayerCash( playerid, g_poolTableData[ poolid ] [ E_WAGER ] );
				g_poolTableData[ poolid ] [ E_READY ] = false;
				g_poolTableData[ poolid ] [ E_WAGER ] = 0;
			}
			UpdateDynamic3DTextLabelText( g_poolTableData[ poolid ] [ E_LABEL ], COLOR_GREY, DEFAULT_POOL_STRING );
		}
	}
	return 1;
}


stock CreatePoolTableEx( Float: X, Float: Y, Float: Z, Float: A = 0.0, E_POOL_SKINS: skin, interior = 0, ... ) {
	for( new i = 6; i < numargs( ); i++ ) {
		CreatePoolTable( X, Y, Z, A, skin, interior, getarg( i ) );
	}
}

stock CreatePoolTable( Float: X, Float: Y, Float: Z, Float: A = 0.0, E_POOL_SKINS: skin, interior = 0, world = 0 )
{
	if ( A != 0 && A != 90.0 && A != 180.0 && A != 270.0 && A != 360.0 ) {
		return print( "[BI-DA] [Loi] Ban bida phai dat theo goc 0, 90, 180, 270 va 360 do." ), 1;
	}

	new
		poolid = Iter_Free( pooltables );

	if ( poolid != ITER_NONE )
	{
		new
			Float: x_vertex[ 4 ], Float: y_vertex[ 4 ];

		Iter_Add( pooltables, poolid );

		g_poolTableData[ poolid ] [ E_X ] = X;
		g_poolTableData[ poolid ] [ E_Y ] = Y;
		g_poolTableData[ poolid ] [ E_Z ] = Z;
		g_poolTableData[ poolid ] [ E_ANGLE ] = A;

		g_poolTableData[ poolid ] [ E_INTERIOR ] = interior;
		g_poolTableData[ poolid ] [ E_WORLD ] = world;

		g_poolTableData[ poolid ] [ E_TABLE ] = CreateDynamicObject( 2964, X, Y, Z - 1.0, 0.0, 0.0, A, .interiorid = interior, .worldid = world, .priority = 9999 );
		g_poolTableData[ poolid ] [ E_LABEL ] = CreateDynamic3DTextLabel( DEFAULT_POOL_STRING, COLOR_GREY, X, Y, Z, 10.0, .interiorid = interior, .worldid = world, .priority = 9999 );

		Pool_RotateXY( -0.964, -0.51, A, x_vertex[ 0 ], y_vertex[ 0 ] );
		Pool_RotateXY( -0.964, 0.533, A, x_vertex[ 1 ], y_vertex[ 1 ] );
		Pool_RotateXY( 0.976, -0.51, A, x_vertex[ 2 ], y_vertex[ 2 ] );
		Pool_RotateXY( 0.976, 0.533, A, x_vertex[ 3 ], y_vertex[ 3 ] );

		new
			walls[ 4 ];

		walls[ 0 ] = PHY_CreateWall( x_vertex[ 0 ] + X, y_vertex[ 0 ] + Y, x_vertex[ 1 ] + X, y_vertex[ 1 ] + Y );
		walls[ 1 ] = PHY_CreateWall( x_vertex[ 1 ] + X, y_vertex[ 1 ] + Y, x_vertex[ 3 ] + X, y_vertex[ 3 ] + Y );
		walls[ 2 ] = PHY_CreateWall( x_vertex[ 2 ] + X, y_vertex[ 2 ] + Y, x_vertex[ 3 ] + X, y_vertex[ 3 ] + Y );
		walls[ 3 ] = PHY_CreateWall( x_vertex[ 0 ] + X, y_vertex[ 0 ] + Y, x_vertex[ 2 ] + X, y_vertex[ 2 ] + Y );

		// set wall worlds
		for ( new i = 0; i < sizeof( walls ); i ++ ) {
			PHY_SetWallWorld( walls[ i ], world );
		}

		// create boundary for replacing the cueball
		new Float: vertices[ 4 ];

		Pool_RotateXY( 0.94, 0.48, g_poolTableData[ poolid ] [ E_ANGLE ], vertices[ 0 ], vertices[ 1 ] );
		Pool_RotateXY( -0.94, -0.48, g_poolTableData[ poolid ] [ E_ANGLE ], vertices[ 2 ], vertices[ 3 ] );

		vertices[ 0 ] += g_poolTableData[ poolid ] [ E_X ], vertices[ 2 ] += g_poolTableData[ poolid ] [ E_X ];
		vertices[ 1 ] += g_poolTableData[ poolid ] [ E_Y ], vertices[ 3 ] += g_poolTableData[ poolid ] [ E_Y ];

		g_poolTableData[ poolid ] [ E_CUEBALL_AREA ] = CreateDynamicRectangle( vertices[ 2 ], vertices[ 3 ], vertices[ 0 ], vertices[ 1 ], .interiorid = interior, .worldid = world );

		// skins
		if ( skin == POOL_SKIN_WOOD_PURPLE ) // Panther
		{
			SetDynamicObjectMaterial( g_poolTableData[ poolid ] [ E_TABLE ], 1, 8401, "vgshpground", "dirtywhite", 0 );
			SetDynamicObjectMaterial( g_poolTableData[ poolid ] [ E_TABLE ], 2, 11631, "mp_ranchcut", "mpCJ_WOOD_DARK", 0 );
			SetDynamicObjectMaterial( g_poolTableData[ poolid ] [ E_TABLE ], 3, 11631, "mp_ranchcut", "mpCJ_WOOD_DARK", 0 );
			SetDynamicObjectMaterial( g_poolTableData[ poolid ] [ E_TABLE ], 4, 11631, "mp_ranchcut", "mpCJ_WOOD_DARK", 0 );
			SetDynamicObjectMaterial( g_poolTableData[ poolid ] [ E_TABLE ], 0, 10375, "subshops_sfs", "ws_white_wall1", -10072402 );
		}
		else if ( skin == POOL_SKIN_GOLD_GREEN )
		{
			SetDynamicObjectMaterial( g_poolTableData[ poolid ] [ E_TABLE ], 0, 1273, "icons3", "greengrad32", 0 );
			SetDynamicObjectMaterial( g_poolTableData[ poolid ] [ E_TABLE ], 1, 946, "bskball_standext", "drkbrownmetal", 0 );
			SetDynamicObjectMaterial( g_poolTableData[ poolid ] [ E_TABLE ], 2, 8463, "vgseland", "tiadbuddhagold", 0 );
			SetDynamicObjectMaterial( g_poolTableData[ poolid ] [ E_TABLE ], 3, 8463, "vgseland", "tiadbuddhagold", 0 );
			SetDynamicObjectMaterial( g_poolTableData[ poolid ] [ E_TABLE ], 4, 8463, "vgseland", "tiadbuddhagold", 0 );
		}
		else if ( skin == POOL_SKIN_WOOD_GREEN )
		{
			SetDynamicObjectMaterial( g_poolTableData[ poolid ] [ E_TABLE ], 0, 1273, "icons3", "greengrad32", 0 );
			SetDynamicObjectMaterial( g_poolTableData[ poolid ] [ E_TABLE ], 1, 8401, "vgshpground", "dirtywhite", 0 );
			SetDynamicObjectMaterial( g_poolTableData[ poolid ] [ E_TABLE ], 2, 11631, "mp_ranchcut", "mpCJ_WOOD_DARK", 0 );
			SetDynamicObjectMaterial( g_poolTableData[ poolid ] [ E_TABLE ], 3, 11631, "mp_ranchcut", "mpCJ_WOOD_DARK", 0 );
			SetDynamicObjectMaterial( g_poolTableData[ poolid ] [ E_TABLE ], 4, 11631, "mp_ranchcut", "mpCJ_WOOD_DARK", 0 );
		}
		else if ( skin == POOL_SKIN_WOOD_BLUE )
		{
			SetDynamicObjectMaterial( g_poolTableData[ poolid ] [ E_TABLE ], 4, 11100, "bendytunnel_sfse", "blackmetal", -16 );
			SetDynamicObjectMaterial( g_poolTableData[ poolid ] [ E_TABLE ], 3, 11100, "bendytunnel_sfse", "blackmetal", -16 );
		}
		else if ( skin == POOL_SKIN_LWOOD_GREEN )
		{
			SetDynamicObjectMaterial( g_poolTableData[ poolid ] [ E_TABLE ], 0, 10375, "subshops_sfs", "ws_white_wall1", -11731124 );
			SetDynamicObjectMaterial( g_poolTableData[ poolid ] [ E_TABLE ], 3, 16150, "ufo_bar", "sa_wood07_128", -16 );
			SetDynamicObjectMaterial( g_poolTableData[ poolid ] [ E_TABLE ], 4, 16150, "ufo_bar", "sa_wood07_128", -16 );
			SetDynamicObjectMaterial( g_poolTableData[ poolid ] [ E_TABLE ], 1, 9362, "sfn_byofficeint", "CJ_Black_metal", -16 );
			SetDynamicObjectMaterial( g_poolTableData[ poolid ] [ E_TABLE ], 2, 8463, "vgseland", "tiadbuddhagold", -16 );
		}

		// reset pool handles
		for ( new i = 0; i < sizeof( g_poolBallOffsetData ); i ++ ) {
			g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ i ] = ITER_NONE;
		}

	#if defined POOL_DEBUG
		ReloadPotTestLabel( 0, poolid );
		/*new Float: middle_x;
		new Float: middle_y;
		CreateDynamicObject( 18643, x_vertex[0] + X, y_vertex[0] + Y, Z - 1.0, 0.0, -90.0, 0.0 );
		CreateDynamicObject( 18643, x_vertex[1] + X, y_vertex[1] + Y, Z - 1.0, 0.0, -90.0, 0.0 );
		middle_x = ((x_vertex[0] + X) + (x_vertex[1] + X)) / (2.0);
		middle_y = ((y_vertex[0] + Y) + (y_vertex[1] + Y)) / (2.0);
		CreateDynamicObject( 18643, middle_x, middle_y, Z - 1.0, 0.0, -90.0, 0.0 );
		CreateDynamicObject( 18643, x_vertex[1] + X, y_vertex[1] + Y, Z - 1.0, 0.0, -90.0, 0.0 );
		CreateDynamicObject( 18643, x_vertex[3] + X, y_vertex[3] + Y, Z - 1.0, 0.0, -90.0, 0.0 );
		middle_x = ((x_vertex[1] + X) + (x_vertex[3] + X)) / (2.0);
		middle_y = ((y_vertex[1] + Y) + (y_vertex[3] + Y)) / (2.0);
		CreateDynamicObject( 18643, middle_x, middle_y, Z - 1.0, 0.0, -90.0, 0.0 );
		CreateDynamicObject( 18643, ((x_vertex[1] + X) + middle_x) / 2.0, ((y_vertex[1] + Y) + middle_y) / 2.0, Z - 1.0, 0.0, -90.0, 0.0 );
		CreateDynamicObject( 18643, x_vertex[2] + X, y_vertex[2] + Y, Z - 1.0, 0.0, -90.0, 0.0 );
		CreateDynamicObject( 18643, x_vertex[3] + X, y_vertex[3] + Y, Z - 1.0, 0.0, -90.0, 0.0 );
		middle_x = ((x_vertex[2] + X) + (x_vertex[3] + X)) / (2.0);
		middle_y = ((y_vertex[2] + Y) + (y_vertex[3] + Y)) / (2.0);
		CreateDynamicObject( 18643, middle_x, middle_y, Z - 1.0, 0.0, -90.0, 0.0 );
		CreateDynamicObject( 18643, x_vertex[0] + X, y_vertex[0] + Y, Z - 1.0, 0.0, -90.0, 0.0 );
		CreateDynamicObject( 18643, x_vertex[2] + X, y_vertex[2] + Y, Z - 1.0, 0.0, -90.0, 0.0 );
		middle_x = ((x_vertex[0] + X) + (x_vertex[2] + X)) / (2.0);
		middle_y = ((y_vertex[0] + Y) + (y_vertex[2] + Y)) / (2.0);
		CreateDynamicObject( 18643, middle_x, middle_y, Z - 1.0, 0.0, -90.0, 0.0 );
		CreateDynamicObject( 18643, ((x_vertex[0] + X) + middle_x) / 2.0, ((y_vertex[2] + Y) + middle_y) / 2.0, Z - 1.0, 0.0, -90.0, 0.0 );*/
	#endif
	}
	return poolid;
}

stock Pool_GetClosestTable( playerid, &Float: dis = 99999.99 )
{
	new pooltable = -1;
	new player_world = GetPlayerVirtualWorld( playerid );

	foreach ( new i : pooltables ) if ( g_poolTableData[ i ] [ E_WORLD ] == player_world )
	{
    	new
    		Float: dis2 = GetPlayerDistanceFromPoint( playerid, g_poolTableData[ i ] [ E_X ], g_poolTableData[ i ] [ E_Y ], g_poolTableData[ i ] [ E_Z ] );

    	if ( dis2 < dis && dis2 != -1.00 )
    	{
    	    dis = dis2;
    	    pooltable = i;
		}
	}
	return pooltable;
}

stock Pool_RespawnBalls( poolid )
{
	if ( g_poolTableData[ poolid ] [ E_AIMER ] != -1 )
	{
		TogglePlayerControllable(g_poolTableData[ poolid ] [ E_AIMER ], 1);
		//ClearAnimations(g_poolTableData[ poolid ] [ E_AIMER ]);

		//ApplyAnimation(g_poolTableData[ poolid ] [ E_AIMER ], "CARRY", "crry_prtial", 1.0, 0, 0, 0, 0, 0);
        SetCameraBehindPlayer( g_poolTableData[ poolid ] [ E_AIMER ] );
        DestroyDynamicObject( g_poolTableData[ poolid ] [ E_AIMER_OBJECT ] );
        g_poolTableData[ poolid ] [ E_AIMER_OBJECT ] = -1;

        //TextDrawHideForPlayer(g_poolTableData[ poolid ] [ E_AIMER ], gPoolTD);
        //HidePlayerProgressBar(g_poolTableData[ poolid ] [ E_AIMER ], g_PoolPowerBar[g_poolTableData[ poolid ] [ E_AIMER ]]);
		g_poolTableData[ poolid ] [ E_AIMER ] = -1;
	}

	new
		Float: offset_x,
		Float: offset_y;

	for ( new i = 0; i < sizeof( g_poolBallOffsetData ); i ++ )
	{
		// lay vi tri goc
		Pool_RotateXY( g_poolBallOffsetData[ i ] [ E_OFFSET_X ], g_poolBallOffsetData[ i ] [ E_OFFSET_Y ], g_poolTableData[ poolid ] [ E_ANGLE ], offset_x, offset_y );

		// reset pool ball
		if ( PHY_IsHandleValid( g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ i ] ) ) {
			PHY_DeleteHandle( g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ i ] );
			DestroyDynamicObject( PHY_GetHandleObject( g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ i ] ) );
			g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ i ] = ITER_NONE;
		}

		// tao bi
		new objectid = CreateDynamicObject(
			g_poolBallOffsetData[ i ] [ E_MODEL_ID ],
			g_poolTableData[ poolid ] [ E_X ] + offset_x,
			g_poolTableData[ poolid ] [ E_Y ] + offset_y,
			g_poolTableData[ poolid ] [ E_Z ] - 0.045,
			0.0, 0.0, 0.0,
			.worldid = g_poolTableData[ poolid ] [ E_WORLD ],
			.priority = 999
		);

		// tao tinh vat ly
		Pool_InitBalls( poolid, objectid, i );
	}

	KillTimer( g_poolTableData[ poolid ] [ E_TIMER ] );
	g_poolTableData[ poolid ] [ E_TIMER ] = SetTimerEx( "OnPoolUpdate", POOL_TIMER_SPEED, true, "d", poolid );
	g_poolTableData[ poolid ] [ E_BALLS_SCORED ] = 0;
}

stock Pool_InitBalls( poolid, objectid, ballid )
{
	new handleid = PHY_InitObject( objectid, 3003, _, _, PHY_MODE_2D );

	PHY_SetHandleWorld( handleid, g_poolTableData[ poolid ] [ E_WORLD ] );
	PHY_SetHandleFriction( handleid, 0.08 ); // 0.10
	PHY_SetHandleAirResistance( handleid, 0.2 );
	PHY_RollObject( handleid );

	g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ ballid ] = handleid;
	g_poolBallData[ poolid ] [ E_POCKETED ] [ ballid ] = false;
}

stock Pool_RotateXY( Float: xi, Float: yi, Float: angle, &Float: xf, &Float: yf )
{
    xf = xi * floatcos( angle, degrees ) - yi * floatsin( angle, degrees );
    yf = xi * floatsin( angle, degrees ) + yi * floatcos( angle, degrees );
    return 1;
}

stock Pool_AreBallsStopped( poolid )
{
	new
		balls_not_moving = 0;

	for ( new i = 0; i < 16; i ++ )
	{
		new
			ball_handle = g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ i ];

		if ( ! PHY_IsHandleValid( ball_handle ) || g_poolBallData[ poolid ] [ E_POCKETED ] [ i ] || ! PHY_IsHandleMoving( ball_handle ) ) {
			balls_not_moving ++;
		}
	}
	return balls_not_moving >= 16;
}

stock Pool_GetXYInFrontOfPos( Float: xx, Float: yy, Float: a, &Float: x2, &Float: y2, Float: distance )
{
    x2 = xx + ( distance * floatsin( -a, degrees ) );
    y2 = yy + ( distance * floatcos( -a, degrees ) );
}

stock Pool_IsBallInHole( poolid, objectid )
{
	new
		Float: hole_x, Float: hole_y;

	for ( new i = 0; i < sizeof( g_poolPotOffsetData ); i ++ )
	{
		// 
		Pool_RotateXY( g_poolPotOffsetData[ i ] [ 0 ], g_poolPotOffsetData[ i ] [ 1 ], g_poolTableData[ poolid ] [ E_ANGLE ], hole_x, hole_y );

		// kiem tra xem banh co trong lo k
		if ( Pool_IsObjectAtPos( objectid, g_poolTableData[ poolid ] [ E_X ] + hole_x , g_poolTableData[ poolid ] [ E_Y ] + hole_y, g_poolTableData[ poolid ] [ E_Z ], POCKET_RADIUS ) ) {
			return i;
		}
	}
    return -1;
}

stock Pool_UpdateScoreboard( poolid, close = 0 )
{
	new first_player = Iter_First( poolplayers< poolid > );
	new second_player = Iter_Last( poolplayers< poolid > );

	foreach ( new playerid : poolplayers< poolid > )
	{
		new
			is_playing = playerid == first_player ? first_player : ( playerid == second_player ? second_player : -1 );

		if ( g_poolTableData[ poolid ] [ E_BALLS_SCORED ] && is_playing != -1 ) {
			format(
				szBigString, sizeof( szBigString ), "BAN SE CHOI VOI BI (%s). ",
				g_poolTableData[ poolid ] [ E_PLAYER_BALL_TYPE ] [ is_playing ] == E_STRIPED ? ( "Soc" ) : ( "Mau" )
			);
		} else {
			szBigString = "";
		}

		format( szBigString, sizeof( szBigString ),
			"%s~n~%s luot cua %s.~n~~n~~r~~h~~h~%s diem:~w~ %d~n~~b~~h~~h~%s diem:~w~ %d",
			FormatNumber(g_poolTableData[ poolid ] [ E_WAGER ]),szBigString, GetName( g_poolTableData[ poolid ] [ E_NEXT_SHOOTER ] ),
			GetName( first_player ), p_PoolScore[ first_player ],
			GetName( second_player ), p_PoolScore[ second_player ]
		);

		ShowPlayerHelpDialog( playerid, close, szBigString );
	}

	UpdateDynamic3DTextLabelText( g_poolTableData[ poolid ] [ E_LABEL ], -1, "" );
}

stock Pool_EndGame( poolid )
{
	// delay 5 giay
	Pool_UpdateScoreboard( poolid, 5000 );

	// reset lai cac bien cua bida
	foreach ( new i : poolplayers< poolid > )
	{
		DestroyDynamicObject( p_PoolHoleGuide[ i ] );
		p_PoolHoleGuide[ i ] = -1;
		p_isPlayingPool{ i } = false;
		p_PoolScore[ i ] = -1;
		p_PoolID[ i ] = -1;
		RestoreCamera( i );
	}

	Iter_Clear( poolplayers< poolid > );

	g_poolTableData[ poolid ] [ E_STARTED ] = false;
	g_poolTableData[ poolid ] [ E_AIMER ] = -1;
	g_poolTableData[ poolid ] [ E_SHOTS_LEFT ] = 0;
	g_poolTableData[ poolid ] [ E_FOULS ] = 0;
	g_poolTableData[ poolid ] [ E_EXTRA_SHOT ] = false;
	g_poolTableData[ poolid ] [ E_READY ] = false;
	g_poolTableData[ poolid ] [ E_WAGER ] = 0;
	g_poolTableData[ poolid ] [ E_CUE_POCKETED ] = false;

	KillTimer( g_poolTableData[ poolid ] [ E_TIMER ] );
    DestroyDynamicObject( g_poolTableData[ poolid ] [ E_AIMER_OBJECT ] );
    g_poolTableData[ poolid ] [ E_AIMER_OBJECT ] = -1;

	for ( new i = 0; i < 16; i ++ ) if ( PHY_IsHandleValid( g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ i ] ) ) {
		PHY_DeleteHandle( g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ i ] );
		DestroyDynamicObject( PHY_GetHandleObject( g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ i ] ) );
		g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ i ] = ITER_NONE;
	}

	UpdateDynamic3DTextLabelText( g_poolTableData[ poolid ] [ E_LABEL ], COLOR_GREY, DEFAULT_POOL_STRING );
	return 1;
}

stock AngleInRangeOfAngle(Float:a1, Float:a2, Float:range) {
	a1 -= a2;
	return (a1 < range) && (a1 > -range);
}

stock Pool_IsObjectAtPos( objectid, Float: x, Float: y, Float: z, Float: radius )
{
    new
    	Float: object_x, Float: object_y, Float: object_z;

    GetDynamicObjectPos( objectid, object_x, object_y, object_z );

    new
    	Float: distance = GetDistanceBetweenPoints( object_x, object_y, object_z, x, y, z );

    return distance < radius;
}

// public PlayPoolSound( poolid, soundid ) {
// 	foreach ( new playerid : poolplayers< poolid > ) {
// 		PlayerPlaySound( playerid, soundid, 0.0, 0.0, 0.0 );
// 	}
// 	return 1;
// }

public OnPoolUpdate( poolid )
{
	if ( ! g_poolTableData[ poolid ] [ E_STARTED ] ) {
		return 1;
	}

	if ( ! Iter_Count( poolplayers< poolid > ) ) {
		Pool_EndGame( poolid );
		return 1;
	}

	new Float: Xa, Float: Ya, Float: Za;
	new Float: X, Float: Y, Float: Z;
	new keys, ud, lr;

	if ( g_poolTableData[ poolid ] [ E_CUE_POCKETED ] )
	{
		new playerid = g_poolTableData[ poolid ] [ E_NEXT_SHOOTER ];
		new cueball_handle = g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ 0 ];

		if ( PHY_IsHandleValid( cueball_handle ) )
		{
			new cueball_object = PHY_GetHandleObject( cueball_handle );

			GetPlayerKeys( playerid, keys, ud, lr );
			GetDynamicObjectPos( cueball_object, X, Y, Z );

			if ( ud == KEY_UP ) Y += 0.01;
			else if ( ud == KEY_DOWN ) Y -= 0.01;

			if ( lr == KEY_LEFT ) X -= 0.01;
			else if ( lr == KEY_RIGHT ) X += 0.01;

			// set vi tri
			if ( IsPointInDynamicArea( g_poolTableData[ poolid ] [ E_CUEBALL_AREA ], X, Y, 0.0 ) ) {
				SetDynamicObjectPos( cueball_object, X, Y, Z );
			}

			
			if ( keys & KEY_FIRE )
			{
				// kiem tra xem bi co gan bi khac khong
				for ( new i = 1; i < MAX_POOL_BALLS; i ++ ) if ( PHY_IsHandleValid( g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ i ] ) ) {
					GetDynamicObjectPos( PHY_GetHandleObject( g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ i ] ), Xa, Ya, Za );
					if ( GetDistanceFromPointToPoint( X, Y, Xa, Ya ) < 0.085 ) {
						return GameTextForPlayer( playerid, "~n~~n~~n~~r~~h~Bi qua gan voi bi khac!", 500, 3 );
					}
				}

				// check xem nguoi choi co dat banh gan lo k
				new
					Float: hole_x, Float: hole_y;

				for ( new i = 0; i < sizeof( g_poolPotOffsetData ); i ++ )
				{
				
					Pool_RotateXY( g_poolPotOffsetData[ i ] [ 0 ], g_poolPotOffsetData[ i ] [ 1 ], g_poolTableData[ poolid ] [ E_ANGLE ], hole_x, hole_y );

					if ( Pool_IsObjectAtPos( PHY_GetHandleObject( g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ 0 ] ), g_poolTableData[ poolid ] [ E_X ] + hole_x , g_poolTableData[ poolid ] [ E_Y ] + hole_y, g_poolTableData[ poolid ] [ E_Z ], POCKET_RADIUS ) ) {
						return GameTextForPlayer( playerid, "~n~~n~~n~~r~~h~Bi qua gan lo!", 500, 3 );
					}
				}

			
				SetCameraBehindPlayer( playerid );
				TogglePlayerControllable( playerid, true );
				g_poolTableData[ poolid ] [ E_CUE_POCKETED ] = false;
				ApplyAnimation( playerid, "CARRY", "crry_prtial", 4.0, 0, 1, 1, 0, 0 );
				Pool_SendTableMessage( poolid, -1, "{2DD9A9} * * %s(%d) da dat bi danh!", GetName( playerid ), playerid );
			}
		}
	}
	else if ( g_poolTableData[ poolid ] [ E_AIMER ] != -1 )
	{
		new
			playerid = g_poolTableData[ poolid ] [ E_AIMER ];

		GetPlayerKeys( playerid, keys, ud, lr );

		if ( ! ( keys & KEY_FIRE ) )
		{
			if ( lr )
			{
				new Float: x, Float: y, Float: newrot, Float: dist;

				GetPlayerPos(playerid, X, Y ,Z);
				GetDynamicObjectPos( PHY_GetHandleObject( g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ 0 ] ), Xa, Ya, Za);
				newrot = p_PoolAngle[ playerid ] [ 0 ] + ( lr > 0 ? 0.9 : -0.9 );
				dist = GetDistanceBetweenPoints( X, Y, 0.0, Xa, Ya, 0.0 );

				// Lam cho dau k bi vuong vao goc nhin 
				if ( dist < 1.20 ) {
					dist = 1.20;
				}

				if ( AngleInRangeOfAngle( p_PoolAngle[ playerid ] [ 1 ], newrot, 30.0 ) )
	            {
	                p_PoolAngle[ playerid ] [ 0 ] = newrot;
	                Pool_UpdatePlayerCamera( playerid, poolid );

	                Pool_GetXYInFrontOfPos( Xa, Ya, newrot + 180, x, y, 0.085 );
	                SetDynamicObjectPos( g_poolTableData[ poolid ] [ E_AIMER_OBJECT ], x, y, Za );
	              	SetDynamicObjectRot( g_poolTableData[ poolid ] [ E_AIMER_OBJECT ], 7.0, 0, p_PoolAngle[ playerid ] [ 0 ] + 180 );
	              	Pool_GetXYInFrontOfPos( Xa, Ya, newrot + 180 - 5.0, x, y, dist ); // offset 5 degrees
	                SetPlayerPos( playerid, x, y, Z );
	                SetPlayerFacingAngle( playerid, newrot );
	            }
			}
		}
		else
		{
		    if ( g_poolTableData[ poolid ] [ E_DIRECTION ] ) {
		        g_poolTableData[ poolid ] [ E_POWER ] -= 2.0;
		    } else {
			    g_poolTableData[ poolid ] [ E_POWER ] += 2.0;
			}

			if ( g_poolTableData[ poolid ] [ E_POWER ] <= 0 ) {
			    g_poolTableData[ poolid ] [ E_DIRECTION ] = 0;
			    g_poolTableData[ poolid ] [ E_POWER ] = 2.0;
			}
			else if ( g_poolTableData[ poolid ] [ E_POWER ] > 100.0 ) {
			    g_poolTableData[ poolid ] [ E_DIRECTION ] = 1;
			    g_poolTableData[ poolid ] [ E_POWER ] = 80.0;
			}

			SetPlayerProgressBarMaxValue( playerid, g_PoolPowerBar[ playerid ], 67.0 );
			SetPlayerProgressBarValue( playerid, g_PoolPowerBar[ playerid ], ( ( 67.0 * g_poolTableData[ poolid ] [ E_POWER ] ) / 100.0 ) );
			ShowPlayerProgressBar( playerid, g_PoolPowerBar[ playerid ] );
			TextDrawShowForPlayer( playerid, g_PoolTextdraw );
		}
	}

	new
		current_player = g_poolTableData[ poolid ] [ E_NEXT_SHOOTER ];

	if ( ( ! g_poolTableData[ poolid ] [ E_SHOTS_LEFT ] || g_poolTableData[ poolid ] [ E_FOULS ] || g_poolTableData[ poolid ] [ E_EXTRA_SHOT ] ) && Pool_AreBallsStopped( poolid ) ) {
		Pool_QueueNextPlayer( poolid, current_player );
		SetTimerEx( "RestoreCamera", 800, 0, "d", current_player );
	}
	return 1;
}

public RestoreCamera( playerid )
{
	TextDrawHideForPlayer( playerid, g_PoolTextdraw );
	HidePlayerProgressBar( playerid, g_PoolPowerBar[ playerid ] );
	TogglePlayerControllable( playerid, 1 );
	ApplyAnimation( playerid, "CARRY", "crry_prtial", 4.0, 0, 1, 1, 0, 0 );
	return SetCameraBehindPlayer( playerid );
}

public deleteBall( poolid, ballid )
{
	if ( g_poolBallData[ poolid ] [ E_POCKETED ] [ ballid ] && PHY_IsHandleValid( g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ ballid ] ) )
	{
		PHY_DeleteHandle( g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ ballid ] );
		DestroyDynamicObject( PHY_GetHandleObject( g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ ballid ] ) );
		g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ ballid ] = ITER_NONE;
	}
	return 1;
}

public RestoreWeapon( playerid )
{
	RemovePlayerAttachedObject( playerid, 0 );
	p_PoolChalking{ playerid } = false;
	ServerWeapon( playerid, 7, 0 );
	ClearAnimations( playerid );
	return 1;
}

stock GetPoolBallIndexFromModel( modelid ) {
	for ( new i = 0; i < sizeof( g_poolBallOffsetData ); i ++ ) if ( g_poolBallOffsetData[ i ] [ E_MODEL_ID ] == modelid ) {
		return i;
	}
	return -1;
}


public PHY_OnObjectCollideWithObject( handleid_a, handleid_b )
{
	foreach ( new poolid : pooltables ) if ( g_poolTableData[ poolid ] [ E_STARTED ] )
	{
		for ( new i = 0; i < 16; i ++ )
		{
			new
				table_ball_handle = g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ i ];

			if ( PHY_IsHandleValid( table_ball_handle ) && PHY_GetHandleObject( handleid_a ) == PHY_GetHandleObject( table_ball_handle ) )
			{
		        // PlayPoolSound( poolid, 31800 + random( 3 ) );
		        return 1;
			}
		}
	}
	return 1;
}

public PHY_OnObjectCollideWithWall( handleid, wallid )
{
	foreach ( new poolid : pooltables ) if ( g_poolTableData[ poolid ] [ E_STARTED ] )
	{
		for ( new i = 0; i < 16; i ++ )
		{
			new
				table_ball_handle = g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ i ];

			if ( PHY_IsHandleValid( table_ball_handle ) && PHY_GetHandleObject( handleid ) == PHY_GetHandleObject( table_ball_handle ) )
			{
		        // PlayPoolSound( poolid, 31808 );
		        return 1;
			}
		}
	}
	return 1;
}

public PHY_OnObjectUpdate( handleid )
{
	new objectid = PHY_GetHandleObject( handleid );

	if ( ! IsValidDynamicObject( objectid ) ) {
		return 1;
	}

	new poolball_index = GetPoolBallIndexFromModel( Streamer_GetIntData( STREAMER_TYPE_OBJECT, objectid, E_STREAMER_MODEL_ID ) );

	if ( poolball_index == -1 ) {
		return 1;
	}

	foreach ( new poolid : pooltables ) if ( g_poolTableData[ poolid ] [ E_STARTED ] )
	{
		new poolball_handle = g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ poolball_index ];

		if ( ! PHY_IsHandleValid( poolball_handle ) ) {
			return 1;
		}

		if ( objectid == PHY_GetHandleObject( poolball_handle ) && ! g_poolBallData[ poolid ] [ E_POCKETED ] [ poolball_index ] && PHY_IsHandleMoving( g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ poolball_index ] ) )
		{
			new
				holeid = Pool_IsBallInHole( poolid, objectid );

			if ( holeid != -1 )
			{
				new first_player = Iter_First( poolplayers< poolid > );
				new second_player = Iter_Last( poolplayers< poolid > );
				new current_player = g_poolTableData[ poolid ] [ E_NEXT_SHOOTER ];
				new opposite_player = current_player != first_player ? first_player : second_player;


				// kiem tra xem nguoi choi nao hut banh vao truoc de xem ai la nguoi choi bat dau
				if ( g_poolBallOffsetData[ poolball_index ] [ E_BALL_TYPE ] == E_STRIPED || g_poolBallOffsetData[ poolball_index ] [ E_BALL_TYPE ] == E_SOLID )
				{
					if ( ++ g_poolTableData[ poolid ] [ E_BALLS_SCORED ] == 1 )
					{
						// assign first player a type after first one is hit
						g_poolTableData[ poolid ] [ E_PLAYER_BALL_TYPE ] [ current_player ] = g_poolBallOffsetData[ poolball_index ] [ E_BALL_TYPE ];

						// assign second player
						if ( current_player == first_player ) {
							g_poolTableData[ poolid ] [ E_PLAYER_BALL_TYPE ] [ second_player ] = g_poolTableData[ poolid ] [ E_PLAYER_BALL_TYPE ] [ first_player ] == E_STRIPED ? E_SOLID : E_STRIPED;
						} else if ( current_player == second_player ) {
							g_poolTableData[ poolid ] [ E_PLAYER_BALL_TYPE ] [ first_player ] = g_poolTableData[ poolid ] [ E_PLAYER_BALL_TYPE ] [ second_player ] == E_STRIPED ? E_SOLID : E_STRIPED;
						}

						// alert players in table
						foreach ( new playerid : poolplayers< poolid > ) {
							Player_Clearchat( playerid );
	    					SendClientMessageFormatted( playerid, -1, ">"COL_GREY"-- "COL_WHITE" %s(%d) choi voi bi %s", GetName( first_player ), first_player, g_poolTableData[ poolid ] [ E_PLAYER_BALL_TYPE ] [ first_player ] == E_STRIPED ? ( "Soc" ) : ( "Mau" ) );
	    					SendClientMessageFormatted( playerid, -1, ">"COL_GREY"-- "COL_WHITE" %s(%d) choi voi bi %s", GetName( second_player ), second_player, g_poolTableData[ poolid ] [ E_PLAYER_BALL_TYPE ] [ second_player ] == E_STRIPED ? ( "Soc" ) : ( "Mau" ) );
	    				}
	    			}
				}

				new Float: hole_x, Float: hole_y;

				// kiem tra xem banh nao trong lo
				if ( g_poolBallOffsetData[ poolball_index ] [ E_BALL_TYPE ] == E_CUE )
				{
	    			GameTextForPlayer( current_player, "~n~~n~~n~~r~sai banh", 3000, 3);
					Pool_SendTableMessage( poolid, -1, "{2DD9A9} * * %s(%d) da hut bi cua minh vao lo, %s(%d) se duoc quyen dat bi!", GetName( current_player ), current_player, GetName( opposite_player ), opposite_player );

					// phat.
					g_poolTableData[ poolid ] [ E_FOULS ] ++;
					g_poolTableData[ poolid ] [ E_SHOTS_LEFT ] = 0;
					g_poolTableData[ poolid ] [ E_EXTRA_SHOT ] = false;
					g_poolTableData[ poolid ] [ E_CUE_POCKETED ] = true;
				}
				else if ( g_poolBallOffsetData[ poolball_index ] [ E_BALL_TYPE ] == E_8BALL )
				{
					g_poolTableData[ poolid ] [ E_BALLS_SCORED ] ++;


					RestoreCamera( current_player );

					// kiem tra xem co hut nham bi k
					if ( p_PoolScore[ current_player ] < 7 )
					{
						p_PoolScore[ opposite_player ] ++;
						Pool_SendTableMessage( poolid, -1, "{2DD9A9} * * %s(%d) da hut bi 8 vao nham lo ... %s(%d) thang!", GetName( current_player ), current_player, GetName( opposite_player ), opposite_player );
						Pool_OnPlayerWin( poolid, opposite_player );
					}
					else if ( g_poolTableData[ poolid ] [ E_PLAYER_8BALL_TARGET ] [ current_player ] != holeid )
					{
						p_PoolScore[ opposite_player ] ++;
						Pool_SendTableMessage( poolid, -1, "{2DD9A9} * * %s(%d) da hut bi 8 vao nham lo ... %s(%d) thang!", GetName( current_player ), current_player, GetName( opposite_player ), opposite_player );
						Pool_OnPlayerWin( poolid, opposite_player );
					}
					else
					{
						p_PoolScore[ current_player ] ++;
						Pool_OnPlayerWin( poolid, current_player );
					}
					return Pool_EndGame( poolid );
				}
				else
				{
	
					if ( g_poolTableData[ poolid ] [ E_BALLS_SCORED ] > 1 && g_poolTableData[ poolid ] [ E_PLAYER_BALL_TYPE ] [ current_player ] != g_poolBallOffsetData[ poolball_index ] [ E_BALL_TYPE ] )
					{
	    				p_PoolScore[ opposite_player ] += 1;
	    				GameTextForPlayer( current_player, "~n~~n~~n~~r~sai bi", 3000, 3);
	    				Pool_SendTableMessage( poolid, -1, "{2DD9A9}> %s(%d) da hut nham bi %s %s vao lo thay vi bi %s!", GetName( current_player ), current_player, g_poolBallOffsetData[ poolball_index ] [ E_BALL_TYPE ] == E_STRIPED ? ( "Soc" ) : ( "Mau" ), g_poolBallOffsetData[ poolball_index ] [ E_BALL_NAME ], g_poolTableData[ poolid ] [ E_PLAYER_BALL_TYPE ] [ current_player ] == E_STRIPED ? ( "Soc" ) : ( "Mau" ) );

						// penalty for that
						g_poolTableData[ poolid ] [ E_FOULS ] ++;
						g_poolTableData[ poolid ] [ E_SHOTS_LEFT ] = 0;
						g_poolTableData[ poolid ] [ E_EXTRA_SHOT ] = false;
					}
					else
					{
	    				p_PoolScore[ current_player ] ++;
	    				GameTextForPlayer( current_player, "~n~~n~~n~~g~+1 diem", 3000, 3);
	    				Pool_SendTableMessage( poolid, -1, "{2DD9A9}> %s(%d) da hut bi %s %s vao lo!", GetName( current_player ), current_player, g_poolBallOffsetData[ poolball_index ] [ E_BALL_TYPE ] == E_STRIPED ? ( "Soc" ) : ( "Mau" ), g_poolBallOffsetData[ poolball_index ] [ E_BALL_NAME ] );

						// extra shot for scoring one's own
						g_poolTableData[ poolid ] [ E_SHOTS_LEFT ] = g_poolTableData[ poolid ] [ E_FOULS ] > 0 ? 0 : 1;
						g_poolTableData[ poolid ] [ E_EXTRA_SHOT ] = true;
					}

					// mark final target hole
					if ( ( p_PoolScore[ first_player ] == 7 && p_PoolHoleGuide[ first_player ] == -1 ) || ( p_PoolScore[ second_player ] == 7 && p_PoolHoleGuide[ second_player ] == -1 ) )
					{
						foreach ( new player_being_marked : poolplayers< poolid > ) if ( p_PoolScore[ player_being_marked ] == 7 && p_PoolHoleGuide[ player_being_marked ] == -1 )
						{
							new
								opposite_holeid = g_poolHoleOpposite[ holeid ];

							Pool_RotateXY( g_poolPotOffsetData[ opposite_holeid ] [ 0 ], g_poolPotOffsetData[ opposite_holeid ] [ 1 ], g_poolTableData[ poolid ] [ E_ANGLE ], hole_x, hole_y );
							p_PoolHoleGuide[ player_being_marked ] = CreateDynamicObject( 18643, g_poolTableData[ poolid ] [ E_X ] + hole_x, g_poolTableData[ poolid ] [ E_Y ] + hole_y, g_poolTableData[ poolid ] [ E_Z ] - 0.5, 0.0, -90.0, 0.0, .playerid = player_being_marked );
							g_poolTableData[ poolid ] [ E_PLAYER_8BALL_TARGET ] [ player_being_marked ] = opposite_holeid;
							SendPoolMessage( player_being_marked, "> Bay gio ban phai hut vien bi vao trong lo duoc chi dinh." );
							Streamer_Update( player_being_marked );
						}
					}
				}

				Pool_RotateXY( g_poolPotOffsetData[ holeid ] [ 0 ], g_poolPotOffsetData[ holeid ] [ 1 ], g_poolTableData[ poolid ] [ E_ANGLE ], hole_x, hole_y );


				new move_speed = MoveDynamicObject( PHY_GetHandleObject( g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ poolball_index ] ), g_poolTableData[ poolid ] [ E_X ] + hole_x, g_poolTableData[ poolid ] [ E_Y ] + hole_y, g_poolTableData[ poolid ] [ E_Z ] - 0.5, 1.0);


				g_poolBallData[ poolid ] [ E_POCKETED ] [ poolball_index ] = true;


				SetTimerEx( "deleteBall", move_speed + 100, false, "dd", poolid, poolball_index );

				Pool_UpdateScoreboard( poolid );
				PlayerPlaySound( current_player, 31803, 0.0, 0.0, 0.0 );
			}
			return 1;
		}
	}
	return 1;
}

stock Pool_OnPlayerWin( poolid, winning_player )
{
	if ( ! IsPlayerConnected( winning_player ) && ! IsPlayerNPC( winning_player ) )
		return 0;

	new
		win_amount = floatround( float( g_poolTableData[ poolid ] [ E_WAGER ] ) * ( 1 - POOL_FEE_RATE ) * 2.0 );
	new string[128];

	RestoreCamera( winning_player );
	GivePlayerCash( winning_player, win_amount );

	Pool_SendTableMessage( poolid, -1, "{b6e7ff}****************************************************************************************");
	Pool_SendTableMessage( poolid, -1, "{9FCF30}Nguoi choi {FF8000}%s {9FCF30}da thang!", GetName( winning_player ) );
	Pool_SendTableMessage( poolid, -1, "{9FCF30}Tien thang: {377CC8}%s | -%0.0f%s tien thue", FormatNumber( win_amount ), win_amount > 0 ? POOL_FEE_RATE * 100.0 : 0.0, "%%");
	Pool_SendTableMessage( poolid, -1, "{b6e7ff}****************************************************************************************");
	format(string, sizeof(string), "%s da chien thang bida voi so tien .", GetName(winning_player), FormatNumber(win_amount));
	Log("logs/chienthangbida.log", string);
	return 1;
}

stock Pool_QueueNextPlayer( poolid, current_player )
{
	if ( g_poolTableData[ poolid ] [ E_SHOTS_LEFT ] && g_poolTableData[ poolid ] [ E_FOULS ] < 1 )
	{
		g_poolTableData[ poolid ] [ E_EXTRA_SHOT ] = false;
		Pool_SendTableMessage( poolid, -1, "{2DD9A9}> %s(%d) con mot luot ban!", GetName( current_player ), current_player );
	}
	else
	{
		new first_player = Iter_First( poolplayers< poolid > );
		new second_player = Iter_Last( poolplayers< poolid > );

		g_poolTableData[ poolid ] [ E_FOULS ] = 0;
		g_poolTableData[ poolid ] [ E_SHOTS_LEFT ] = 1;
		g_poolTableData[ poolid ] [ E_EXTRA_SHOT ] = false;
	    g_poolTableData[ poolid ] [ E_NEXT_SHOOTER ] = current_player == first_player ? second_player : first_player;


		Pool_SendTableMessage( poolid, -1, "{2DD9A9}> Luot cua %s(%d)!", GetName( g_poolTableData[ poolid ] [ E_NEXT_SHOOTER ] ), g_poolTableData[ poolid ] [ E_NEXT_SHOOTER ] );
	}
	Pool_RespawnCueBall( poolid );
	Pool_UpdateScoreboard( poolid );
	Pool_ResetBallPositions( poolid );
}

stock Pool_SendTableMessage( poolid, colour, const format[ ], va_args<> ) 
{
    static
		out[ 144 ];

    va_format( out, sizeof( out ), format, va_start<3> );

	foreach ( new i : poolplayers< poolid > ) {
		SendClientMessage( i, colour, out );
	}
	return 1;
}

stock Pool_RespawnCueBall( poolid )
{
    if ( g_poolBallData[ poolid ] [ E_POCKETED ] [ 0 ] )
	{
		new
			Float: x, Float: y;

		Pool_RotateXY( 0.5, 0.0, g_poolTableData[ poolid ] [ E_ANGLE ], x, y );

		
		if ( PHY_IsHandleValid( g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ 0 ] ) ) {
			PHY_DeleteHandle( g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ 0 ] );
	        DestroyDynamicObject( PHY_GetHandleObject( g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ 0 ] ) );
		}

        
		new cueball_object = CreateDynamicObject( 3003, g_poolTableData[ poolid ] [ E_X ] + x, g_poolTableData[ poolid ] [ E_Y ] + y, g_poolTableData[ poolid ] [ E_Z ] - 0.045, 0.0, 0.0, 0.0, .worldid = g_poolTableData[ poolid ] [ E_WORLD ], .priority = 999 );
        Pool_InitBalls( poolid, cueball_object, 0 );

		
		new next_shooter = g_poolTableData[ poolid ] [ E_NEXT_SHOOTER ];
		SetPlayerCameraPos( next_shooter, g_poolTableData[ poolid ] [ E_X ], g_poolTableData[ poolid ] [ E_Y ], g_poolTableData[ poolid ] [ E_Z ] + 2.0 );
		SetPlayerCameraLookAt( next_shooter, g_poolTableData[ poolid ] [ E_X ], g_poolTableData[ poolid ] [ E_Y ], g_poolTableData[ poolid ] [ E_Z ] );
		ApplyAnimation( next_shooter, "POOL", "POOL_Idle_Stance", 3.0, 0, 1, 1, 0, 0, 1 );
		TogglePlayerControllable( next_shooter, false );
	}
}

stock Pool_ResetBallPositions( poolid, begining_ball = 0, last_ball = MAX_POOL_BALLS )
{
	static Float: last_x, Float: last_y, Float: last_z;
	static Float: last_rx, Float: last_ry, Float: last_rz;

	for ( new i = begining_ball; i < last_ball; i ++ ) if ( ! g_poolBallData[ poolid ] [ E_POCKETED ] [ i ] )
	{
		new
			ball_handle = g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ i ];

		if ( ! PHY_IsHandleValid( ball_handle ) )
			continue;

		new
			ball_object = PHY_GetHandleObject( ball_handle );

		if ( ! IsValidDynamicObject( ball_object ) )
			continue;

		new
			modelid = Streamer_GetIntData( STREAMER_TYPE_OBJECT, ball_object, E_STREAMER_MODEL_ID );  //FIX

		
		GetDynamicObjectPos( ball_object, last_x, last_y, last_z );
		GetDynamicObjectRot( ball_object, last_rx, last_ry, last_rz );

		
		if ( PHY_IsHandleValid( g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ i ] ) ) {
			PHY_DeleteHandle( g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ i ] );
			DestroyDynamicObject( ball_object );
		}

		
		new object = CreateDynamicObject( modelid, last_x, last_y, last_z, last_rx, last_ry, last_rz, .worldid = g_poolTableData[ poolid ] [ E_WORLD ], .priority = 999 );

		
		Pool_InitBalls( poolid, object, i );
	}

	// show objects
	foreach ( new playerid : poolplayers< poolid > ) {
		Streamer_Update( playerid, STREAMER_TYPE_OBJECT );
	}
}

hook OnPlayerShootDynObject( playerid, weaponid, objectid, Float: x, Float: y, Float: z )
{
	
	new
		poolball_index = GetPoolBallIndexFromModel( Streamer_GetIntData( STREAMER_TYPE_OBJECT, objectid, E_STREAMER_MODEL_ID ) );

	if ( poolball_index != -1 ) {
		foreach ( new poolid : pooltables ) if ( g_poolTableData[ poolid ] [ E_STARTED ] && ( g_poolBallData[ poolid ] [ E_POCKETED ] [ poolball_index ] || ! PHY_IsHandleMoving( g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ poolball_index ] ) ) ) {
			Pool_ResetBallPositions( poolid, poolball_index, poolball_index + 1 );
			break;
		}
		return 0; 
	}
    return 1;
}

stock Pool_UpdatePlayerCamera( playerid, poolid )
{
	new
		Float: Xa, Float: Ya, Float: Za;

	GetDynamicObjectPos( PHY_GetHandleObject( g_poolBallData[ poolid ] [ E_BALL_PHY_HANDLE ] [ 0 ] ), Xa, Ya, Za );

	if ( ! p_PoolCameraBirdsEye{ playerid } )
	{
	    new
	    	Float: x = Xa, Float: y = Ya;

	    x += ( 0.675 * floatsin( -p_PoolAngle[ playerid ] [ 0 ] + 180.0, degrees ) );
	    y += ( 0.675 * floatcos( -p_PoolAngle[ playerid ] [ 0 ] + 180.0, degrees ) );

		SetPlayerCameraPos( playerid, x, y, g_poolTableData[ poolid ] [ E_Z ] + DEFAULT_AIM );
		SetPlayerCameraLookAt( playerid, Xa, Ya, Za + 0.170 );
	}
	else
	{
		SetPlayerCameraPos( playerid, g_poolTableData[ poolid ] [ E_X ], g_poolTableData[ poolid ] [ E_Y ], g_poolTableData[ poolid ] [ E_Z ] + 2.0 );
		SetPlayerCameraLookAt( playerid, g_poolTableData[ poolid ] [ E_X ], g_poolTableData[ poolid ] [ E_Y ], g_poolTableData[ poolid ] [ E_Z ] );
	}
}

stock IsPlayerPlayingPool( playerid ) {
	return p_isPlayingPool{ playerid };
}


CMD:endgame(playerid, params[])
{
	if ( ! IsPlayerAdmin( playerid ) )
		return 0;

	new iPool = Pool_GetClosestTable( playerid );

	if ( iPool == -1 )
		return SendError( playerid, "Ban can phai dung gan mot ban bida de su dung lenh nay" );

	Pool_EndGame( iPool );

	SendClientMessage(playerid, -1, ""COL_PINK"[ADMIN]"COL_WHITE" Ban da ngung van bida!");
	return 1;
}

CMD:addpool(playerid, params[])
{
	if ( PlayerInfo[ playerid ][pAdmin] < 6 )
		return SendError( playerid, ADMIN_COMMAND_REJECT );

	new
		Float: x, Float: y, Float: z;

	if ( GetPlayerPos( playerid, x, y, z ) )
	{
		CreatePoolTable( x + 1.0, y + 1.0, z, floatstr(params), POOL_SKIN_DEFAULT, GetPlayerInterior( playerid ), GetPlayerVirtualWorld( playerid ) );
		SendClientMessage(playerid, -1, ""COL_PINK"[ADMIN]{FFFFFF} Ban da tao mot ban bida.");
	}
	return 1;
}
stock Player_Clearchat( playerid )
{
    for ( new j = 0; j < 30; j ++ ) {
        SendClientMessage( playerid, -1, " " );
    }
    return 1;
}

/* ** DB ** */
#if defined POOL_DEBUG
	new potlabels_x[MAX_POOL_TABLES][sizeof(g_poolPotOffsetData)];
	new potlabels[MAX_POOL_TABLES][sizeof(g_poolPotOffsetData)][36];

	CMD:camtest( playerid, params[ ] )
	{
		new
			iPool = Pool_GetClosestTable( playerid );

		if ( iPool == -1 )
			return SendError( playerid, "Ban khong dung gan ban" );

		new
			index = strval( params );

		new Float: pot_x = g_poolTableData[ iPool ] [ E_X ] + g_poolPotOffsetData[ index ] [ 0 ];
		new Float: pot_y = g_poolTableData[ iPool ] [ E_Y ] + g_poolPotOffsetData[ index ] [ 1 ];
		new Float: pot_z = g_poolTableData[ iPool ] [ E_Z ];

		SetPlayerCameraPos(playerid, pot_x, pot_y, pot_z + 2.5);
		SetPlayerCameraLookAt(playerid, pot_x, pot_y, pot_z);
		return 1;
	}

	CMD:setoffset( playerid, params[ ] )
	{
		new iPool = Pool_GetClosestTable( playerid );
		new offset;
		new Float: x, Float: y;

		if ( ! sscanf( params, "dff", offset, x, y ) )
		{
			g_poolPotOffsetData[ offset ] [ 0 ] = x;
			g_poolPotOffsetData[ offset ] [ 1 ] = y;
			printf("[%d] -> { %f, %f }", offset, x, y);
			ReloadPotTestLabel( playerid, iPool );
		}
		return 1;
	}

	stock ReloadPotTestLabel( playerid, gID )
	{
		for ( new i = 0; i < sizeof( g_poolPotOffsetData ); i ++ )
		{
			new Float: pot_x = g_poolTableData[ gID ] [ E_X ] + g_poolPotOffsetData[ i ] [ 0 ];
			new Float: pot_y = g_poolTableData[ gID ] [ E_Y ] + g_poolPotOffsetData[ i ] [ 1 ];
			new Float: pot_z = g_poolTableData[ gID ] [ E_Z ];

			//DestroyDynamic3DTextLabel( potlabels_x[ gID ] [ i ] );
			//potlabels_x[ gID ] [ i ] = CreateDynamic3DTextLabel( "+", COLOR_GOLD, pot_x, pot_y, pot_z, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0 );
			DestroyDynamicObject( potlabels_x[ gID ] [ i ] );
			potlabels_x[ gID ] [ i ] = CreateDynamicObject( 18643, pot_x, pot_y, pot_z - 1.0, 0.0, -90.0, 0.0, .worldid = g_poolTableData[ poolid ] [ E_WORLD ] );

			for ( new Float: angle = 0.0, c = 0; angle < 360.0; angle += 10.0, c ++ )
			{
			    new Float: rad_x = pot_x + ( POCKET_RADIUS * floatsin( -angle, degrees ) );
			    new Float: rad_y = pot_y + ( POCKET_RADIUS * floatcos( -angle, degrees ) );

				//DestroyDynamic3DTextLabel( potlabels[ gID ] [ i ] [ c ] );
				//potlabels[ gID ] [ i ] [ c ] = CreateDynamic3DTextLabel( ".", COLOR_WHITE, rad_x, rad_y, pot_z, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0 );
				DestroyDynamicObject( potlabels[ gID ] [ i ] [ c ] );
				potlabels[ gID ] [ i ] [ c ] = CreateDynamicObject( 18643, rad_x, rad_y, pot_z - 1.0, 0.0, -90.0, 0.0, .worldid = g_poolTableData[ poolid ] [ E_WORLD ] );
			}
		}
		return Streamer_Update( playerid ), 1;
	}

	CMD:play(playerid)
	{
		new
			iPool = Pool_GetClosestTable( playerid );

		if ( iPool == -1 )
			return SendError( playerid, "Ban khong dung gan ban." );

		if ( ! IsPlayerPlayingPool( playerid ))
		{
			p_isPlayingPool { playerid } = true;
			p_PoolID[ playerid ]		 = iPool;

			PlayerPlaySound( playerid, 1085, 0.0, 0.0, 0.0 );
			ServerWeapon( playerid, 7, 1 );

			p_PoolScore[ playerid ] = 0;

			if ( ! g_poolTableData[ iPool ] [ E_STARTED ] )
			{
				g_poolTableData[ iPool ] [ E_STARTED ] = true;

				Iter_Clear( poolplayers< iPool > );
				Iter_Add( poolplayers< iPool >, playerid );
				Iter_Add( poolplayers< iPool >, playerid );

				UpdateDynamic3DTextLabelText(g_poolTableData[ iPool ] [ E_LABEL ], -1, sprintf( "{FFDC2E}%s dang test game.", GetName( playerid )) );

				Pool_RespawnBalls( iPool );
			}
		}
		else
		{
			Pool_EndGame( iPool );
		}
		return 1;
	}
#endif

stock SendClientMessageFormatted( playerid, colour, const format[ ], va_args<> )
{
    static
		out[ 144 ];

    va_format( out, sizeof( out ), format, va_start<3> );

	if ( playerid == INVALID_PLAYER_ID ) {
		return SendClientMessageToAll( colour, out );
	} else {
        return SendClientMessage( playerid, colour, out );
    }
}