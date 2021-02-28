group = "font_size";
size = 12;
image_index = global.accessibility.text.fontSize == size;
text = "Small";

action = function(){
	global.accessibility.text.fontSize = size;
}