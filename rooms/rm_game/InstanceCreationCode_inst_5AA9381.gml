c = "red"

text = "Unique";
image_index = global.accessibility.colors[$ c].unique;
action = function(){
	image_index = !global.accessibility.colors[$ c].unique;
	global.accessibility.colors[$ c].unique = image_index;
}