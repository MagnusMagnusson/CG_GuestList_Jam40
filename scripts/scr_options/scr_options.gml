global.options = {
	fullscreen : false,
	play_sounds : true,
	play_music : true,
	sound_volume : 1,
	music_volume : 1,
	master_volume : 1,
	skip_splash : false,
	skip_accessibility : false,
}


function init_options(){
	var options = load_options("options");
	if(options != false){
		global.options = options;
	} else {
		save_options("options", global.options);
	}
	
	window_set_fullscreen(global.options.fullscreen);
	init_accessibility();
}

function init_accessibility(){
	var options = load_options("accessibility");
	if(options != false){
		global.accessibility = options;
		show_debug_message(global.accessibility.colors);
		global.accessibility.colors.list = array_to_Array(global.accessibility.colors.list.content);
	} else {
		save_options("accessibility", global.accessibility);
	}
}