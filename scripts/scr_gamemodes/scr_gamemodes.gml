enum GameModes {
	MARATHON,
	FASTHOST_10,
	FASTHOST_25,
	FASTHOST_50,
	FINDTHEGUEST
}


global.GameModeStructs = {
}

var addGameMode = function(gamemode, struct){
	global.GameModeStructs[$ gamemode] = struct;
}

addGameMode(GameModes.MARATHON,marathonGameMode());
addGameMode(GameModes.FASTHOST_10,new fastestHostGameMode(10));
addGameMode(GameModes.FASTHOST_25,new fastestHostGameMode(25));
addGameMode(GameModes.FASTHOST_50,new fastestHostGameMode(50));

function gameModeGet(gameMode){
	return global.GameModeStructs[$ gameMode]
}