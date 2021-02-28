group = "colorShirt";
text = "All Shirt Colors";
image_index = global.accessibility.colors.canBeMatchedSettings.shirt == accessability_colorMatch.ALL;

action = function(){
	global.accessibility.colors.canBeMatchedSettings.shirt = accessability_colorMatch.ALL;
}