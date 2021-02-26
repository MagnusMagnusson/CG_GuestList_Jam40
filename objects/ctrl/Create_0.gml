save_gif = false;
level = 1;
guestList = new Array();

successClick = function(id, pos){
	guestList.remove(pos)
}; 

failedClick = function(id){
	//noop
} 