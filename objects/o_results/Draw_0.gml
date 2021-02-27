draw_self()

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_font(fnt_consolas_18);
draw_text_outlined(x + sprite_width / 2, y + 90,bigText, crimsonRed, c_white);
draw_set_font(fnt_consolas_16);
draw_text_outlined(x + sprite_width / 2, y + 110,highScoreText, crimsonRed, c_white);

draw_set_color(crimsonRed);
draw_set_font(fnt_consolas_14);
draw_text_ext(x + sprite_width / 2, y + 150, commentary,15,sprite_width - 30);

draw_reset();