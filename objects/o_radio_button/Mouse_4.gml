if(layer_get_visible(layer) && !ctrl.killInput && !instance_exists(o_InGameColorWheel)){
	with(o_radio_button){
		if(group == other.group){
			image_index = 0;
		}
	}
	image_index = 1;
	action();
}