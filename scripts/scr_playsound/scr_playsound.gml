function play_sound(snd, prio, loops){
	if(global.options.play_sounds){
		audio_sound_gain(snd,  global.options.sound_volume,0);
		audio_play_sound(snd,prio,loops);
	}
}

function play_music(snd, prio, loops){
	if(global.options.play_music){
		audio_sound_gain(snd,global.options.music_volume,0);
		audio_play_sound(snd,prio,loops);
	}
}