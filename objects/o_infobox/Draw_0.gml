var height = max(y + sprite_height,15+ y + string_height_ext(text,20,sprite_width - 15))

access_getFont();
draw_set_color(c_maroon);
draw_set_alpha(0.5);
draw_rectangle(x,y,x + sprite_width,height,false);
draw_reset();

draw_set_color(c_black);
for(var i = -1; i < 2; i++){
	for(var j = -1; j < 2; j++){
		draw_text_ext(x + 15 + i, y + 10 + j, text, 20, sprite_width - 15);
	}
}

draw_set_color(c_white);
draw_set_alpha(1);
draw_rectangle(x,y,x + sprite_width, height,true);
draw_text_ext(x + 15, y + 10, text, 20, sprite_width - 15);
