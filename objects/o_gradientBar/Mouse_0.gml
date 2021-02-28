if(layer_get_visible(layer) && !ctrl.killInput && !instance_exists(o_InGameColorWheel)){
	value = (mouse_x - x)/(image_xscale * sprite_width);
	action(value);
}