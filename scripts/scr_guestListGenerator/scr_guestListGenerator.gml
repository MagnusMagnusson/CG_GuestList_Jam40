function find_guest(){
	var guest = noone;
	var count = instance_number(o_genericHuman);
	var rand = 1+irandom(count-1);
	var i = 0;
	with(o_genericHuman){
		i++;
		if(i == rand){
			guest = me;
			break;
		}
	}
	show_message(me);
}