if(!place_meeting(x,y,o_guestList)){
	var match = doIMatch(id);

	if(match > -1){
		ctrl.successClick(id, match);
	} else{
		ctrl.failedClick(id);
	}
}
