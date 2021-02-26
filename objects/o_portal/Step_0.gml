
if(linkedPortal != "" && place_meeting(x,y,o_genericHuman)){
	var human = instance_place(x,y,o_genericHuman);
	with(o_portal){
		if(name == other.linkedPortal){
			human.x = x;
		}
	}
}