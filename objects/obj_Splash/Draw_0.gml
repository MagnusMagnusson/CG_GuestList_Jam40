var _xscale = room_width / sprite_get_width(sprite_index);
var _yscale = room_height / sprite_get_height(sprite_index);

var _alpha;
if (timer < begin_fade_time)
	_alpha = 1;
else
	_alpha = (end_fade_time - timer) / (end_fade_time - begin_fade_time);

draw_sprite_ext(sprite_index, 0, x, y, _xscale, _yscale, 0, c_white, _alpha);
