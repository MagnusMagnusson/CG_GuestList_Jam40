
draw_self();
draw_sprite_part_ext(s_gradientBar,1,0,0,sprite_width * value, sprite_height,x,y,image_xscale,image_yscale,c_white,1);

draw_set_font(access_getBigFont());
draw_set_valign(fa_middle);
draw_text_outlined(x + 16, y - 32, text, c_black,c_white);

draw_reset();