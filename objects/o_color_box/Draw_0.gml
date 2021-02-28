draw_set_color(color.color);

draw_rectangle(x,y,x + sprite_width,y + sprite_height,false);
draw_set_color(c_white)
draw_rectangle(x,y,x + sprite_width,y + sprite_height,true);

draw_set_font(access_getBigFont());
draw_text_outlined(x,y - 32,color.name, c_white, c_black);