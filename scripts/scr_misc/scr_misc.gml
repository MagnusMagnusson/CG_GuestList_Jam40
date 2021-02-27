function draw_crimsonBox(x,y,x2,y2){
	draw_set_color(crimsonRed);
	draw_rectangle(x,y,x2,y2,false);
	draw_set_color($FFF4FF);
	draw_rectangle(x+5,y+5,x2-5,y2-5,false);
}