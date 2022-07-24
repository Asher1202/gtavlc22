/*
	Car type: 
	1 : Cheap
	2 : Normal
	3 : Premium
	4 : Heavy
	5 : Super

	* Author: Nguyen Trung Tin

	© Credit to gamegta.net	
*/

#define MAX_DEALERSHIP_CAR 			200
#define MAX_DEALERSHIP 				10
#define DEALERSHIP_MINIUM_LEVEL		3
#define MAX_CAR_TYPE 				5

enum dcInfo {
	dSQLID,
	dModel,
	dPrice,
	dStock,
	dLevel,
	dCoins
}
new 
	Iterator: Cars<MAX_CAR_TYPE,MAX_DEALERSHIP_CAR>;

new 
	D_Vehicles[MAX_DEALERSHIP_CAR][dcInfo],
	D_Model[212]; // Transfering Array: model >> array index

new const Float:dealershipPos[][] = {
	{1303.61, -1428.49, 13.506}
};