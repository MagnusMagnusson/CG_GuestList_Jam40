draw_set_color(c_maroon);
draw_set_alpha(0.5);
draw_rectangle(x,y,x + sprite_width, y + sprite_height,false);


draw_set_color(c_black);
for(var i = -1; i < 2; i++){
	for(var j = -1; j < 2; j++){
		draw_text_ext(x + 15 + i, y + 10 + j, text, 20, sprite_width - 15);
	}
}

draw_set_color(c_white);
draw_set_alpha(1);
draw_rectangle(x,y,x + sprite_width, y + sprite_height,true);
draw_text_ext(x + 15, y + 10, text, 20, sprite_width - 15);
