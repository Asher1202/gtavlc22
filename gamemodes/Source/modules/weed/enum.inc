/*
	Drug Dealer được viết bởi Trung Tín Nguyễn
*/

#define MAX_SEEDS_TYPES 	20
#define MAX_PLANT 			1000

enum e_PlantData {
	PlantSQLID,
	PlantObject,
	PlantType,
	Timer: PlantTimer,
	PlantProgress,
	PlantName[MAX_PLAYER_NAME],
	PlantOwnerSQLID,
	Text3D: Plant3DText,
	Float: PlantPosX,
	Float: PlantPosY,
	Float: PlantPosZ,
	Float: PlantOPosZ,
	NguoiTrong[30],
}
enum e_Seed {
	SeedID,
	SeedName[30],
	SeedObjectID,
	SeedTime,
	SeedBuyingDelay,
	SeedAmount
}

new 
	Seed[MAX_SEEDS_TYPES][e_Seed],
	Plant[MAX_PLANT][e_PlantData],
	Iterator:IterSeed<MAX_SEEDS_TYPES>,
	Iterator:IterPlant<MAX_PLANT>,
	Iterator:CollectablePlant<MAX_PLANT>;