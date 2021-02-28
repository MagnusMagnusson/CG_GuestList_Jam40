group = "font_size";
size = 16;
image_index = global.accessibility.text.fontSize == size;
text = "Big";

action = function(){
	global.accessibility.text.fontSize = size;
}