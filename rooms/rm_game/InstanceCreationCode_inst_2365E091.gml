group = "font_size";
size = 14;
image_index = global.accessibility.text.fontSize == size;
text = "Normal";

action = function(){
	global.accessibility.text.fontSize = size;
}