save_gif = false;
level = 1;
stage = 1;
paused = true;
playing = false;
magnifierSurface = -1;
lastFound = 0;
ticker = 0;
load_highScores();

guestList = new Array();
beatCounter = 0;
off = 0;

successClick = function(guest, pos){
	gamemode.successClick(guest, pos);
};
failedClick = function(guest){
	gamemode.failedClick(guest);
};


gameOver = function(silent){
	gamemode.gameOver(silent);
}
gamemode = noone;
killInput = 0;
clownAlert = false;

alarm[0] = 5;