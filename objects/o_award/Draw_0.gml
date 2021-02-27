draw_set_alpha(image_alpha);

draw_set_halign(fa_center);
draw_set_color(c_black);

for(var i = -1; i < 2; i++){
	for(var j = -1; j < 2; j++){
		draw_text(x+i,y+j,text);
	}
}

draw_set_color(color);

draw_text(x,y,text);

draw_set_color(c_black);
draw_set_halign(fa_left);
draw_set_alpha(1);
