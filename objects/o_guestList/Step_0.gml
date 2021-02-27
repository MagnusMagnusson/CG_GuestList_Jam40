if(!ctrl.paused){
	if(targetY != y){
		y -= sign(y - targetY) * abs(y - targetY)/7;
		if(abs(targetY - y) < 3){
			y = targetY;
		}
	}
}