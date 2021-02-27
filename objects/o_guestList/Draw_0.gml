if(!ctrl.paused){
	draw_self();
	draw_set_color(0);

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
	
		draw_text_ext(x + 10, yPos, string(1+pos) + ". " + desc, sep, w);
		
		h += 15 + string_height(text) * (tHeight)
	});

	draw_text(0,0,string(sep) + " , " + string(w));
}