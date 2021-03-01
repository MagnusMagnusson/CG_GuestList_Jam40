if(layer_get_visible(layer)){
	if(mouse_check_button_pressed(mb_left)){
		if(mouse_x > x && mouse_x < x + sprite_width && mouse_y > y && mouse_y < y + sprite_height){
			inFocus = true;
			keyboard_string = text;
			
		}
		else{
			inFocus = false
		}
	} 
} else{
	inFocus = false;
}

if(inFocus){
	if(string_length(keyboard_string) > charLimit){
		keyboard_string = string_delete(keyboard_string,30,1);
	}
	text = keyboard_string;
}