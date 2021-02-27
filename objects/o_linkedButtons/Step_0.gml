// Inherit the parent event
event_inherited();

if(parent){
	x = parent.x + (xstart - parent.xstart);
	y = parent.y + (ystart - parent.ystart);
}