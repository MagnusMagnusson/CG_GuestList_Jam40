function draw_crimsonBox(x,y,x2,y2){
	draw_set_color(crimsonRed);
	draw_rectangle(x,y,x2,y2,false);
	draw_set_color($FFF4FF);
	draw_rectangle(x+5,y+5,x2-5,y2-5,false);
}

function draw_reset(){
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	draw_accessFont();
}

function draw_text_outlined(x, y, text, color, outline_color){
	draw_set_color(outline_color);
	for(var i = -1; i < 2; i++){
		for(var j = -1; j < 2; j++){
			draw_text(x+i,y+j,text);
		}
	}
	draw_set_color(color);
	draw_text(x,y,text);
}

function draw_text_outlined_ext(x, y, text, color, outline_color,s,w){
	draw_set_color(outline_color);
	for(var i = -1; i < 2; i++){
		for(var j = -1; j < 2; j++){
			draw_text_ext(x+i,y+j,text,s,w);
		}
	}
	draw_set_color(color);
	draw_text_ext(x,y,text,s,w);
}



function showGameOver(){
	ctrl.playing = false;
	ctrl.paused = true;
	layer_set_visible(layer_get_id("il_results"), true);
	layer_set_visible(layer_get_id("your_results"), true);
	o_results.x = room_width;
}

function hideGameOver(){
	with(o_localHighScoreList){
		prepared = false;
		list = [];
	}
	layer_set_visible(layer_get_id("il_results"), false);
	layer_set_visible(layer_get_id("your_results"), false);
	layer_set_visible(layer_get_id("your_statistics"), false);
}