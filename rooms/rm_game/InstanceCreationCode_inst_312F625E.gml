group = "colorPants";
text = "All Pants Colors";
image_index = global.accessibility.colors.canBeMatchedSettings.pants == accessability_colorMatch.ALL;

action = function(){
	global.accessibility.colors.canBeMatchedSettings.pants = accessability_colorMatch.ALL;
}