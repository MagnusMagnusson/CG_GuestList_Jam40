draw_self();
draw_set_halign(fa_middle);
draw_set_valign(fa_bottom);
if(font){
	draw_set_font(font);
} else{
	access_getFont();
}
draw_text_outlined_ext(x, y - 26, text,c_white, c_black, 20, string_width("Comic San"));
draw_reset()