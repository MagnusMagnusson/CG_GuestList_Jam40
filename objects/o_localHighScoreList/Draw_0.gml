draw_set_font(fnt_consolas_14);
draw_set_color(c_black);

draw_text(x,y,title);
if(prepared){
	for(var i = 0; i < min(list.size,10); i++){
		var elem = list.get(i);
		var text = drawMethod(elem, i);
		draw_text(x,y + (i+1)*string_height(text), text);
	}
}

draw_reset();