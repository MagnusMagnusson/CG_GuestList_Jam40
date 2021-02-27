save_gif = false;
level = 1;

paused = true;
playing = false;

guestList = new Array();


successClick = function(guest, pos){
	gamemode.successClick(guest, pos);
};
failedClick = function(guest){
	gamemode.failedClick(guest);
};

gamemode = noone;