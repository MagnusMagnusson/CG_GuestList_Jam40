if(isBeingDragged){
	x = xprevious - (lastMouseX - mouse_x);
	y = yprevious -(lastMouseY - mouse_y);
}
safe--;

isBeingDragged = false;
if(mouse_check_button(mb_left)){
	//Color box
	if(mouse_x > x && mouse_x < x + size && mouse_y > y && mouse_y < y + size){
		h = 255*((mouse_x - x) / size);
		s = 255*((mouse_y - y) / size);
		if(onChangeColor){
			onChangeColor(h,s,b);
		}
	} else if(mouse_x > x && mouse_x < x + size && mouse_y > y + size + 5 && mouse_y < y + size + 32){
		b = 255*((mouse_x - x)/size)
		myWheel = scr_InGameColorWheel_generateWheelSurface(size,b, increment);
		if(onChangeColor){
			onChangeColor(h,s,b);
		}
	} else if(mouse_x > x - frame && mouse_x < x + size + frame && mouse_y > y - frame && mouse_y < y + frame + 32 + size){
		if(draggable){
			isBeingDragged = true;
			lastMouseX = mouse_x;
			lastMouseY = mouse_y;
		}
	} else{
		if(mouse_check_button_pressed(mb_left) && safe <= 0){
			instance_destroy();
		}
	}
}

if(mouse_check_button_pressed(mb_right)){
	instance_destroy();
}