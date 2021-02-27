enum accessability_colorMatch {
	ALL,
	UNIQUE,
	NONE
}

global.accessibility = {
	colors:{
		list: new Array(),
		canBeMatchedSettings : {
			hair : accessability_colorMatch.ALL,
			shirt : accessability_colorMatch.ALL,
			pants : accessability_colorMatch.ALL,
			car: accessability_colorMatch.ALL
		}
	},
	text:{
		font: fnt_consolas_18,
		fontSize: 12,
		defaultfont: fnt_consolas_14,
	}
}

var makeColor = function(name, color){
	global.accessibility.colors.list.add(name);
	global.accessibility.colors[$ name] = {
		name:name,
		color:color,
		default_color:color,
		unique: true,
	}
};

makeColor("white",$D7D2D6);
makeColor("brown",$313156);
makeColor("red",$1717F2);
makeColor("yellow",$10F7F7);
makeColor("green",$2DA107);
makeColor("blue",$D45417);
makeColor("purple",$D100AD);

function access_colorList(){
	return global.accessibility.colors.list;
}

function access_getColor(color){
	return global.accessibility.colors[$ color];
}

function access_setColor(color, newColor){
	global.accessibility.colors[$ color].color = newColor;
}

function access_restoreDefaultColor(color){
	var def = global.accessibility.colors[$ color].default_color;
	access_setColor(color, def);
}

function access_restoreAllDefaults(){
	for(var i = 0; i < access_colorList().size; i++){
		var col = global.accessibility.colors.list.get(i);
		access_restoreDefaultColor(col);
	}
}

function access_colorCanBeMatched(color, category){
	return global.accessibility.colors.canBeMatchedSettings[$ category] == accessability_colorMatch.ALL || 
	global.accessibility.colors.canBeMatchedSettings[$ category] == accessability_colorMatch.UNIQUE && access_getColor(color).unique;
	
}

function access_getFont(){
	return global.accessibility.text.font;
}

function access_setFont(font){
	global.accessibility.text.font = font;
}


function draw_accessFont(){
	draw_set_font(access_getFont());
}

draw_accessFont();