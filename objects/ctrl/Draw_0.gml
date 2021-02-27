if(playing && !paused){
	gamemode.draw();
	if(mouse_check_button(mb_right) || keyboard_check(vk_control)){
		var scale = 4;
		var size = 325;
		var halfSize = size / 2;
		if(!surface_exists(magnifierSurface)){
			magnifierSurface = surface_create(size,size);
		}
		surface_set_target(magnifierSurface);
		draw_set_color(c_black)
		draw_rectangle(mouse_x-halfSize-2, mouse_y - halfSize-2, mouse_x+halfSize+2, 2 + mouse_y + halfSize, false);
	
		draw_surface_ext(application_surface,-scale*mouse_x +halfSize,-scale*mouse_y +halfSize,scale,scale,0,c_white,1)
		surface_reset_target();
		draw_rectangle(mouse_x - halfSize - 6, mouse_y - halfSize - 6, mouse_x + halfSize + 6, mouse_y + halfSize + 6, false);
		draw_surface(magnifierSurface,mouse_x-halfSize,mouse_y-halfSize);
	}
}

if(paused){
	draw_set_alpha(0.75);
	draw_set_color(c_black);
	draw_rectangle(0,0,room_width,room_height,false);
	draw_set_alpha(1);
}

