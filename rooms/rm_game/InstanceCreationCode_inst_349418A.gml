group = "colorHair";
text = "All Hair Colors";
image_index = global.accessibility.colors.canBeMatchedSettings.hair == accessability_colorMatch.ALL;

action = function(){
	global.accessibility.colors.canBeMatchedSettings.hair = accessability_colorMatch.ALL;
}