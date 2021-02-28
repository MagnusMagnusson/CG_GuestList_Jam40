group = "font_size";
size = 18;
image_index = global.accessibility.text.fontSize == size;
text = "Giant";

action = function(){
	global.accessibility.text.fontSize = size;
}