draw_self();

if(font){
	draw_set_font(font);
} else{
	access_getFont();
}
draw_text_outlined(x, y - image_yscale * 16, text,c_white, c_black);
