timer++;

// advance timer faster after player does some interaction
if (keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_any)) {
	begin_fade_time = 0;
	end_fade_time = 15;
	timer = round((1 - alpha) * end_fade_time);
}

// adjust alpha based on current timer state
if (timer < begin_fade_time)
	alpha = 1;
else
	alpha = (end_fade_time - timer) / (end_fade_time - begin_fade_time);

// proceed to the actual game after the splash screen
if (timer >= end_fade_time)
	room_goto_next();