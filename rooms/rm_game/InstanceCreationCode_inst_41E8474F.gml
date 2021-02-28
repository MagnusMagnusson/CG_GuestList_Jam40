group = "colorShirt";
text = "Distinct Shirt";
image_index = global.accessibility.colors.canBeMatchedSettings.shirt ==accessability_colorMatch.UNIQUE;

action = function(){
	global.accessibility.colors.canBeMatchedSettings.shirt=accessability_colorMatch.UNIQUE;
}