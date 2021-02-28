draw_set_color(make_color_hsv(h,s,b))
draw_rectangle(x - frame,y - frame, x + size + frame, y + size + 32 + frame,false)
if(!surface_exists(myWheel)){
	myWheel = scr_InGameColorWheel_generateWheelSurface(size, b, increment);
}
draw_surface(myWheel,x,y);
draw_set_color(c_gray);
draw_rectangle(x,y,x+size,y+size,true);
draw_set_color(c_white);

draw_rectangle_color(x, y + size + 5,x + size, y + size + 32,c_black,c_white,  c_white, c_black, false)


var hx,sy;

xx = x + (h/255)*size;
yy = y + (s/255)*size;

draw_set_color(c_black)
draw_rectangle(xx-1,yy-1,xx+1,yy+1,true)
draw_set_color(c_white)
draw_rectangle(xx-2,yy-2,xx+2,yy+2,true)
draw_set_color(c_black)
draw_rectangle(xx-3,yy-3,xx+3,yy+3,true)

draw_set_color(c_red);

var bx;
bx = x + (b/255)*size;

draw_set_color(c_black)
draw_rectangle(bx-1,y+size+5,bx+1,y + size + 32, true)
draw_set_color(c_red)
draw_rectangle(bx-2,y+size+5,bx+2,y + size + 32, true)
draw_set_color(c_black)
draw_rectangle(bx-3,y+size+5,bx+3,y + size + 32, true)