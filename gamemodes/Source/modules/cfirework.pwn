#define MAX_FIREWORKS 20
static FireworksObjects[MAX_FIREWORKS][10],
CountingFireworksObjects, Timer:KillUploaFireworks,
bool:FireworksObjectsActivated[MAX_FIREWORKS],
SaveFireworksObjects[MAX_PLAYERS],
ObjectsFireworks[7]={
(19295),(19296),(19297),(19298),(18716),(18848),(18716) };

InFO CMD: to turn the machine fireworks.
CMD:fireworks(playerid, params[]){
	if(PlayerInfo[playerid][pAdmin] < 4) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly); 	
	new Float:pos[3];
	//if(!IsChristmasDay()) return SendClientMessage(playerid,-1,"{FFFFFF}INFO:{D50000}You can only use the function on Christmas Day{FFFFFF}!.");
	if(GetPlayerState(playerid)!=PLAYER_STATE_ONFOOT) return SendClientMessage(playerid,-1,"{FFFFFF}INFO:{D50000}You do not see standing{FFFFFF}!.");
	if(DistanceBetweenMachineAndPlayer(playerid, 3.5)){
		if(!FireworksObjectsActivated[SaveFireworksObjects[playerid]]){
			FireworksObjectsActivated[SaveFireworksObjects[playerid]]=true;
			for(new slots=1,index=10;slots!=index;slots++) {DestroyObject(FireworksObjects[SaveFireworksObjects[playerid]][slots]);}
			GetObjectPos(FireworksObjects[SaveFireworksObjects[playerid]][0], pos[0], pos[1], pos[2]);
			FireworksObjects[SaveFireworksObjects[playerid]][1] = CreateObject(ObjectsFireworks[1],pos[0],pos[1],pos[2]+0.5,0,0,0,0);
			FireworksObjects[SaveFireworksObjects[playerid]][2] = CreateObject(ObjectsFireworks[random(4)],pos[0],pos[1],pos[2]+0.5,0,0,0,0);
			FireworksObjects[SaveFireworksObjects[playerid]][3] = CreateObject(ObjectsFireworks[6],pos[0],pos[1],pos[2]+0.5,0,0,0,0);
			MoveObject(FireworksObjects[SaveFireworksObjects[playerid]][2],pos[0],pos[1],pos[2]+30, 10.0);
			MoveObject(FireworksObjects[SaveFireworksObjects[playerid]][3],pos[0],pos[1],pos[2]+30, 10.0);
			SendClientMessage(playerid,-1,"{FFFFFF}INFO:{D50000}You have turned on the machine fireworks{FFFFFF}!.");
		}else{
			FireworksObjectsActivated[SaveFireworksObjects[playerid]]=false;
			for(new slots=1,index=10;slots!=index;slots++) {DestroyObject(FireworksObjects[SaveFireworksObjects[playerid]][slots]);}
			SendClientMessage(playerid,-1,"{FFFFFF}INFO:{D50000}You have turned off the machine fireworks{FFFFFF}!.");
		}
	}else{SendClientMessage(playerid,-1,"{FFFFFF}INFO:{D50000}You are not near a machine fireworks{FFFFFF}!.");}
	return true;
}
stock DistanceBetweenMachineAndPlayer(playerid, Float:dist){
new Float:pos[3];
for(new slots=0,idx=CountingFireworksObjects+1;slots!=idx;slots++){
    GetObjectPos(FireworksObjects[slots][0], pos[0], pos[1], pos[2]);
	if(IsPlayerInRangeOfPoint(playerid, dist, pos[0], pos[1], pos[2]))return SaveFireworksObjects[playerid]=slots;
}return false;}

timer UploaFireworks[2000](){
	new Float:pos[3];
	for(new slots=0,index=MAX_FIREWORKS;slots!=index;slots++){
		if(FireworksObjectsActivated[slots]==true){
			if(!IsObjectMoving(FireworksObjects[slots][2])){
				GetObjectPos(FireworksObjects[slots][2], pos[0], pos[1], pos[2]);
		    	CreateExplosion(pos[0] + float(30 - (30 / 2)), pos[1], pos[2], 7, 10);
		    	CreateExplosion(pos[0], pos[1] + float(30 - (30 / 2)), pos[2], 7, 10);
		    	CreateExplosion(pos[0], pos[1], pos[2] + float(30 - (30 / 2)), 7, 10);
				GetObjectPos(FireworksObjects[slots][0], pos[0], pos[1], pos[2]);
				SetObjectPos(FireworksObjects[slots][2], pos[0], pos[1], pos[2]);
				SetObjectPos(FireworksObjects[slots][3], pos[0], pos[1], pos[2]);
				MoveObject(FireworksObjects[slots][2],pos[0],pos[1],pos[2]+30, 10.0);
				MoveObject(FireworksObjects[slots][3],pos[0],pos[1],pos[2]+30, 10.0);
			}
		}
	}
}
InFO CMD: to place the base of the fireworks.
CMD:createfireworks(playerid, params[]){
	if(PlayerInfo[playerid][pAdmin] < 4) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly); 	
    new Float:pos[4],data[100];
    //if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid,-1,"{FFFFFF}INFO:{D50000}You are not authorized to use this command{FFFFFF}!.");
	//if(!IsChristmasDay()) return SendClientMessage(playerid,-1,"{FFFFFF}INFO:{D50000}You can only use the function on Christmas Day{FFFFFF}!.");
	if(GetPlayerState(playerid)!=PLAYER_STATE_ONFOOT) return SendClientMessage(playerid,-1,"{FFFFFF}INFO:{D50000}You do not see standing{FFFFFF}!.");
	if(CountingFireworksObjects>=MAX_FIREWORKS) return SendClientMessage(playerid,-1,"{FFFFFF}INFO:{D50000}You have already created too many machines fireworks{FFFFFF}!.");
    GetPlayerPos(playerid,pos[0],pos[1],pos[2]);
    GetPlayerFacingAngle(playerid,pos[3]);
    pos[0] = pos[0] + (3.0 * floatsin(-pos[3], degrees));
    pos[1] = pos[1] + (3.0 * floatcos(-pos[3], degrees));
    if(CountingFireworksObjects==0){
    	stop KillUploaFireworks; 
    	KillUploaFireworks= defer UploaFireworks[2*1000]();
    }
	CountingFireworksObjects++;
	FireworksObjects[CountingFireworksObjects][0] = CreateObject(ObjectsFireworks[5], pos[0],pos[1],pos[2]-1.5,0,0,pos[3],3000.0);
	SetObjectMaterial(FireworksObjects[CountingFireworksObjects][0], 1, 18848, "milbase", "ws_oldpainted", -1);
	SetObjectMaterial(FireworksObjects[CountingFireworksObjects][0], 4, 18848, "milbase", "ws_oldpainted", -1);
	SetObjectMaterial(FireworksObjects[CountingFireworksObjects][0], 5, 18848, "milbase", "ws_oldpainted", -1);
	SendClientMessage(playerid,-1,"{FFFFFF}INFO:{D50000}You have created artificial machine fires successfully{FFFFFF}!.");
	format(data,sizeof(data),"{FFFFFF}INFO:{D50000}machine created fireworks: {FFFFFF}[%02d/%02d]",CountingFireworksObjects,MAX_FIREWORKS);
	SendClientMessage(playerid,-1,data);
	return true;
}

InFO CMD: to remove created fireworks machines, counting from the most recently created.
CMD:clearfireworks(playerid, params[]){
	if(PlayerInfo[playerid][pAdmin] < 4) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly); 
    new data[100];
    //if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid,-1,"{FFFFFF}INFO:{D50000}You are not authorized to use this command{FFFFFF}!.");
	//if(!IsChristmasDay()) return SendClientMessage(playerid,-1,"{FFFFFF}INFO:{D50000}You can only use the function on Christmas Day{FFFFFF}!.");
	if(GetPlayerState(playerid)!=PLAYER_STATE_ONFOOT) return SendClientMessage(playerid,-1,"{FFFFFF}INFO:{D50000}You do not see standing{FFFFFF}!.");
	if(CountingFireworksObjects<=0) return SendClientMessage(playerid,-1,"{FFFFFF}INFO:{D50000}You have not created any machine fireworks{FFFFFF}!.");
	for(new slots=0,index=10;slots!=index;slots++) {DestroyObject(FireworksObjects[CountingFireworksObjects][slots]);}
    FireworksObjectsActivated[CountingFireworksObjects]=false;
	CountingFireworksObjects--;
    SendClientMessage(playerid,-1,"{FFFFFF}INFO:{D50000}You have removed the last machine fireworks created successfully{FFFFFF}!.");
	format(data,sizeof(data),"{FFFFFF}INFO:{D50000}machine created fireworks: {FFFFFF}[%02d/%02d]",CountingFireworksObjects,MAX_FIREWORKS);
	SendClientMessage(playerid,-1,data);
	return true;
}

InFO CMD: to eliminate all machines created fireworks.
CMD:clearallfireworks(playerid, params[]){
	if(PlayerInfo[playerid][pAdmin] < 4) return SendClientMessage(playerid, COLOR_WHITE, AdminOnly); 
    new data[100];
    //if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid,-1,"{FFFFFF}INFO:{D50000}You are not authorized to use this command{FFFFFF}!.");
	//if(!IsChristmasDay()) return SendClientMessage(playerid,-1,"{FFFFFF}INFO:{D50000}You can only use the function on Christmas Day{FFFFFF}!.");
	if(GetPlayerState(playerid)!=PLAYER_STATE_ONFOOT) return SendClientMessage(playerid,-1,"{FFFFFF}INFO:{D50000}You do not see standing{FFFFFF}!.");
	if(CountingFireworksObjects<=0) return SendClientMessage(playerid,-1,"{FFFFFF}INFO:{D50000}You have not created any machine fireworks{FFFFFF}!.");
	for(new slots=0,idx=CountingFireworksObjects+1;slots!=idx;slots++){
	FireworksObjectsActivated[slots]=false;
	for(new object=0,index=10;object!=index;object++){DestroyObject(FireworksObjects[slots][object]); CountingFireworksObjects=0;} }
    stop KillUploaFireworks;
	SendClientMessage(playerid,-1,"{FFFFFF}INFO:{D50000}You've eliminated all machines fireworks created successfully{FFFFFF}!.");
	format(data,sizeof(data),"{FFFFFF}INFO:{D50000}machine created fireworks: {FFFFFF}[%02d/%02d]",CountingFireworksObjects,MAX_FIREWORKS);
	SendClientMessage(playerid,-1,data);
	return true;
}