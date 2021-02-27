image_index = global.options.fullscreen;
text = "Fullscreen";
action = function(){
	image_index = !image_index;
	global.options.fullscreen = image_index;
	window_set_fullscreen(global.options.fullscreen);
}