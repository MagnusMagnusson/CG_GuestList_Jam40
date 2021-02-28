if(layer_get_visible(layer) && !ctrl.killInput && !instance_exists(o_InGameColorWheel)){
	ColorWheel_open(x, y + sprite_width, layer, 256,15,color.color,4,true,function(h,s,v){
		var c = make_color_hsv(h,s,v);
		access_setColor(color.name, c);
	})
}