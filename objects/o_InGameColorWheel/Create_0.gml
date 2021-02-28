size = 256;
frame = 15;

h = color_get_hue(c_white);
s = color_get_saturation(c_white);
b = color_get_value(c_white);
increment = 3;

isBeingDragged = false;
draggable = true;
onChangeColor = noone;

myWheel = scr_InGameColorWheel_generateWheelSurface(size, b, increment);

safe = 5;