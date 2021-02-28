group = "colorPants";
text = "No Pants Colors";
image_index = global.accessibility.colors.canBeMatchedSettings.pants ==accessability_colorMatch.NONE;

action = function(){
	global.accessibility.colors.canBeMatchedSettings.pants =accessability_colorMatch.NONE;
}