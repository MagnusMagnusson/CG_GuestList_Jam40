function randomString(n){
	var r = "";
	var p = "qwertyuyiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890"
	for(var i = 0; i < n; i++){
		r += string(string_char_at(p, irandom(string_length(p) - 1)));
	}
	return r;
}

global.options = {
	fullscreen : false,
	play_sounds : true,
	play_music : true,
	sound_volume : 1,
	music_volume : 1,
	master_volume : 1,
	skip_splash : false,
	skip_accessibility : false,
	userKey : randomString(16),
	version : VERSION
}


function init_options(){
	var options = load_options("options");
	if(options != false && (!is_undefined(options[$ "version"]) && options.version == global.options.version)){
		global.options = options;
	} else {
		save_options("options", global.options);
	}
	
	audio_master_gain(global.options.master_volume);
	window_set_fullscreen(global.options.fullscreen);
	init_accessibility();
}

function init_accessibility(){
	var options = load_options("accessibility");
	if(options != false && (!is_undefined(options[$ "version"]) && options.version == global.options.version)){
		global.accessibility = options;
		show_debug_message(global.accessibility.colors);
		global.accessibility.colors.list = array_to_Array(global.accessibility.colors.list.content);
	} else {
		save_options("accessibility", global.accessibility);
	}
}