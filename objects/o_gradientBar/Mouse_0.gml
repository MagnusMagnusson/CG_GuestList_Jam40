if(layer_get_visible(layer) && !ctrl.killInput){
	value = (mouse_x - x)/(image_xscale * sprite_width);
	action(value);
}