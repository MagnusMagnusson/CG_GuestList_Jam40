enum accessability_colorMatch {
	ALL,
	UNIQUE,
	NONE
}

global.fonts = {
	consolas:{},
	comicsans:{},
	arial:{},
	dubai:{},
	opendyslexic:{}
}

var addFont = function(name, size, font){
	global.fonts[$ name][$ size] = font;
}

addFont("consolas",10,fnt_consolas_10);
addFont("consolas",12,fnt_consolas_12);
addFont("consolas",14,fnt_consolas_14);
addFont("consolas",16,fnt_consolas_16);
addFont("consolas",18,fnt_consolas_18);

addFont("comicsans",10,fnt_ComicSans_10);
addFont("comicsans",12,fnt_ComicSans_12);
addFont("comicsans",14,fnt_ComicSans_14);
addFont("comicsans",16,fnt_ComicSans_16);
addFont("comicsans",18,fnt_ComicSans_18);

addFont("dubai",10,Dubai_10);
addFont("dubai",12,Dubai_12);
addFont("dubai",14,Dubai_14);
addFont("dubai",16,Dubai_16);
addFont("dubai",18,Dubai_18);

addFont("arial",10,Arial_10);
addFont("arial",12,Arial_12);
addFont("arial",14,Arial_14);
addFont("arial",16,Arial_16);
addFont("arial",18,Arial_18);

addFont("opendyslexic",10,OpenDyslexic_10);
addFont("opendyslexic",12,OpenDyslexic_12);
addFont("opendyslexic",14,OpenDyslexic_14);
addFont("opendyslexic",16,OpenDyslexic_16);
addFont("opendyslexic",18,OpenDyslexic_18);

show_debug_message(global.fonts);

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
		font: "consolas",
		fontSize: 14,
	},
	movement:{
		moveSpeed : 1,
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
	return global.fonts[$ global.accessibility.text.font][$ string(global.accessibility.text.fontSize)];
}

function access_setFont(font){
	global.accessibility.text.font = font;
}

function access_setSize(size){
	global.accessibility.text.fontSize = size;
}


function access_getBigFont(){
	return global.fonts[$ global.accessibility.text.font][$ "18"];
}

function draw_accessFont(){
	draw_set_font(access_getFont());
}

function draw_access_font_size(size){
}

draw_accessFont();