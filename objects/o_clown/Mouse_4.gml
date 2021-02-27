ctrl.clownAlert = false;

repeat(100){
	var i = instance_create_layer(x - 0.5*sprite_width + random(sprite_width),y - 0.5 * sprite_height + random(sprite_height),layer,o_confetti);
	i.hspeed += hspeed;
}

instance_destroy();

audio_stop_sound(snd_clown);
play_sound(snd_rimshot,50,false);