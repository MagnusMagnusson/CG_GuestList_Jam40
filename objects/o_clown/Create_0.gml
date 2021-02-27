image_xscale = 0.25;
image_yscale = 0.25;

hspeed = choose(3.5,-3.5) * power(1.025,ctrl.stage-1);
play_sound(snd_clown, 40,false);
alarm[0] = room_speed * 3.5;