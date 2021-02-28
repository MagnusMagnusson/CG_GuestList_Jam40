image_index = !global.options.skip_splash;
text = "Show Crimson Guild Splash Screen on Startup";
action = function(){
	image_index = !image_index;
	global.options.skip_splash = !image_index;
}