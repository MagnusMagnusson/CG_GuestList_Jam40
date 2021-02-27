
if(linkedPortal != "" && place_meeting(x,y,o_genericHuman)){
	var human = instance_place(x,y,o_genericHuman);
	if(human.hspeed != 0){
		with(o_portal){
			if(id == other.linkedPortal){
				human.x = x;
			}
		}
	}
}


if(linkedPortal != "" && place_meeting(x,y,o_car)){
	var car = instance_place(x,y,o_car);
	with(o_portal){
		if(id == other.linkedPortal){
			car.x = x;
		}
	}
}