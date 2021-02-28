group = "colorPants";
text = "Distinct Pants";
image_index = global.accessibility.colors.canBeMatchedSettings.pants ==accessability_colorMatch.UNIQUE;

action = function(){
	global.accessibility.colors.canBeMatchedSettings.pants=accessability_colorMatch.UNIQUE;
}