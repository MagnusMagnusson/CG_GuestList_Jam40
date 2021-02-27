if(!ctrl.paused){
	
	draw_self();
	draw_set_color(0);

	if(!ctrl.clownAlert){
		h = 0;
		ctrl.guestList.forEach(function(elem, pos){
			var yPos = y + 70 + h + 15*pos;
	
			var desc = getDescriptionFromStruct(elem);
			var text = string(1+pos) + ". " + desc;
			//make room for next item
			var tLength = string_width(text);
			var tHeight = (tLength+10) div w;
	
			if(yPos + string_height(text) * (tHeight)> y + sprite_height){
				return 0;
			}
			draw_set_color(c_black);
			if(elem.done){
				draw_set_color(c_gray);
			}
			draw_text_ext(x + 10, yPos, string(1+pos) + ". " + desc, sep, w);
			h += 15 + string_height(text) * (tHeight)
		});
	} else{
		draw_set_font(fnt_ComicSans_18);
		draw_sprite(s_clown,0,x + sprite_width / 2, 30+y + sprite_height / 2);
		draw_text_outlined(x + 50, y  + 70, "  CLOWN ALERT!",c_red,c_black);		
		draw_text_outlined(x + 50, y  + 90+256, "CATCH THE CLOWN!",c_red,c_black);
		draw_reset();
	}
}