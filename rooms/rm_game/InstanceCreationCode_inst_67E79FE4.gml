group = "colorShirt";
text = "No Shirt Colors";
image_index = global.accessibility.colors.canBeMatchedSettings.shirt ==accessability_colorMatch.NONE;

action = function(){
	global.accessibility.colors.canBeMatchedSettings.shirt =accessability_colorMatch.NONE;
}