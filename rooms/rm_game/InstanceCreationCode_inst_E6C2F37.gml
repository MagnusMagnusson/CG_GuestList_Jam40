image_index = global.options.play_music;
text = "Play Music";
action = function(){
	image_index = !image_index;
	global.options.play_music = image_index;
	if(audio_is_playing(mus_lilyswing)){
		audio_stop_sound(mus_lilyswing);
	} else{
		play_music(mus_lilyswing,60,true);
		ctrl.beatCounter = 0;
	}
	
}