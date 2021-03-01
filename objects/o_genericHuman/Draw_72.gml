	if(ctrl.ticker > room_speed * 10){
		var safe = false;
		for(var i = 0; i < ctrl.guestList.size; i++){
			guest = ctrl.guestList.get(i);
			if(!guest.done && guest.target.id == id){
				safe = true;
			}
		}
		if(!safe){
			image_alpha = room_speed * 10 / ctrl.ticker
		}
	}