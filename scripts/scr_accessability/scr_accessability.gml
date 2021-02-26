global.accessibility = {
	colors:{
		list: new Array()
	}
}

var makeColor = function(name, color){
	global.accessibility.colors.list.add(name);
	global.accessibility.colors[$ name] = {
		name:name,
		color:color,
		default_color:color,
		unique: true,
		canBeAskedAbout: true,
	}
};

makeColor("white",c_white);
makeColor("black",c_black);
makeColor("red",c_red);
makeColor("yellow",c_yellow);
makeColor("green",c_green);
makeColor("blue",c_aqua);
makeColor("purple",c_purple);

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
