group = "colorCar";
text = "Distinct Car";
image_index = global.accessibility.colors.canBeMatchedSettings.car ==accessability_colorMatch.UNIQUE;

action = function(){
	global.accessibility.colors.canBeMatchedSettings.car=accessability_colorMatch.UNIQUE;
}