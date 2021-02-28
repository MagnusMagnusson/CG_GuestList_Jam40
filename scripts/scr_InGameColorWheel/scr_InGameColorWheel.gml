function ColorWheel_open(_x,_y,layer, size, frame, defaultColor, increment, draggable, onChangeColor){
	ColorWheel_close();
	var o = instance_create_depth(_x,_y,-9999,o_InGameColorWheel);
	o.size = size;
	o.frame = frame;

	o.h = color_get_hue(defaultColor);
	o.s = color_get_saturation(defaultColor);
	o.b = color_get_value(defaultColor);
	o.increment = increment;


	o.draggable = draggable;
	o.onChangeColor = onChangeColor;

	o.myWheel = scr_InGameColorWheel_generateWheelSurface(o.size, o.b, o.increment);
}

function ColorWheel_close(){
	instance_destroy(o_InGameColorWheel);
}

function scr_InGameColorWheel_generateWheelSurface(size, brightness, increment){
	var surf,cent;
	cent = size/2;
	surf = surface_create(size,size);
	surface_set_target(surf);
	for(var h = 0; h <= 255; h+=increment){
		for(var s = 0; s <= 255; s+=increment){
			draw_set_color(make_color_hsv(h,s,brightness));
			draw_rectangle((h/255)*size,(s/255)*size,((h+increment)/255)*size,((s+increment)/255)*size,false)
		}
	}
	surface_reset_target();
	return surf;
}