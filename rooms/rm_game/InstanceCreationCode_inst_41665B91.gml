group = "colorCar";
text = "All Car Colors";
image_index = global.accessibility.colors.canBeMatchedSettings.car == accessability_colorMatch.ALL;

action = function(){
	global.accessibility.colors.canBeMatchedSettings.car = accessability_colorMatch.ALL;
}