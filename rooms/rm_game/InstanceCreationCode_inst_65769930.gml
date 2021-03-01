value = global.options.music_volume
text = "Music Volume";

action = function(val){
	global.options.music_volume = val;
	audio_sound_gain(mus_lilyswing,val,0);
}