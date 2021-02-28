group = "colorHair";
text = "Distinct Hair";
image_index = global.accessibility.colors.canBeMatchedSettings.hair ==accessability_colorMatch.UNIQUE;

action = function(){
	global.accessibility.colors.canBeMatchedSettings.hair=accessability_colorMatch.UNIQUE;
}