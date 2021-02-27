init_options();

if(!global.options.skip_splash){
	timer = 0;
	begin_fade_time = 240;
	end_fade_time = 300;

	alpha = 1;

	play_music(snd_crimson,40,false);
} else{
	room_goto_next();
}