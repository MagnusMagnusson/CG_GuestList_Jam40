group = "colorCar";
text = "No Car Colors";
image_index = global.accessibility.colors.canBeMatchedSettings.car ==accessability_colorMatch.NONE;

action = function(){
	global.accessibility.colors.canBeMatchedSettings.car =accessability_colorMatch.NONE;
}