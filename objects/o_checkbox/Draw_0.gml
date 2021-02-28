draw_self();
draw_set_font(access_getBigFont());
draw_set_valign(fa_middle);
draw_text_outlined(x + image_xscale*(64 + 16), y + image_yscale * (32), text, c_white,c_black);

draw_reset();