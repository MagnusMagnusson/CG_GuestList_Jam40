group = "font_size";
size = 10;
image_index = global.accessibility.text.fontSize == size;
text = "Tiny";

action = function(){
	global.accessibility.text.fontSize = size;
}