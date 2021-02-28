group = "colorHair";
text = "No Hair Colors";
image_index = global.accessibility.colors.canBeMatchedSettings.hair ==accessability_colorMatch.NONE;

action = function(){
	global.accessibility.colors.canBeMatchedSettings.hair =accessability_colorMatch.NONE;
}