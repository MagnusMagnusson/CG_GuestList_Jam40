var mult = 0.5;
if(inFocus){
	mult = 1;
}

access_getFontSize(14);
var w,h;
w = max(string_width(text), string_width("Default text"));
h = max(string_height(text), string_height("Default text"));

draw_set_alpha(mult*0.75);
draw_set_color(c_black);
draw_rectangle(x,y,x + 10 + w, 10 +y + h,false);
draw_set_alpha(mult*1);
draw_set_color(c_white);
draw_rectangle(x,y,x + 10 + w, 10+ y + h,true);


draw_text(x + 5, y+5,text);

draw_text(x, y - 25,title);
