draw_set_color(c_white);
draw_set_font(access_getFontSize(14));

if(layer_get_visible(layer)){
	draw_text(x,y, "Top Longest List Scores Globally!");
	i = 0;
	for(i = 0; i < min(10,array_length(marathonList.top)); i++){
		var t = marathonList.top[i]
		var p = t.player;
		var s = t._score
		var ss = t.subscore
		draw_text(x,y + 24 * (1+i), string(i + 1) + ". " + string(p) + " - Stage " + string(s) + " and " + string(ss) + " total guests (Attempt #"+string(t.attemptNr)+")");
	}

	draw_text(x,y + 24*(i+2), "Most Recent Longest List Attempts!");
	for(var j = 0; j < min(10,array_length(marathonList.top)); j++){
		var t = marathonList.recent[j]
		var p = t.player;
		var s = t._score
		var ss = t.subscore
		draw_text(x,y + 24 * (i+3+j), string(j+1) + ". " + string(p) + " - Stage " + string(s) + " and " + string(ss) + " total guests (Attempt #"+string(t.attemptNr)+")");
	}
}