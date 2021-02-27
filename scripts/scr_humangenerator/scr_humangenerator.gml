randomize();
var createAttribute = function(name, sprite_ind, description, canBeMatched){
	return {
		name: name,
		sprite: sprite_ind,
		description: description,
		canBeMatched : canBeMatched
	}
}

global.humanSetSizes = {
	hats : 2,
	hairs : 11,
	shirts: 6,
	pants: 7,
	cars: 4,
	skins: 3,
}

global.humanSet = {
	hats : [
		createAttribute("hat_pipehat", 0, "No Hat", false),
		createAttribute("hat_none", 1, "Tophat", true),
	],
	hairs : [
		createAttribute("hair_genericShort", 0, "", false),
		createAttribute("hair_genericMiddleLong", 1, "", false),
		createAttribute("hair_scruffy", 2, "", false),
		createAttribute("hair_verylong", 3, "", false),
		createAttribute("hair_elvis", 4, "", false),
		createAttribute("hair_balding", 5, "Balding", true),
		createAttribute("hair_puff", 6, "", false),
		createAttribute("hair_uncombed", 7, "", false),
		createAttribute("hair_80s", 8, "", false),
		createAttribute("hair_female", 9, "", false),
		createAttribute("hair_female_long", 10, "", false),
	],
	
	shirts : [
		createAttribute("shirt_buttons",0,"Buttoned Shirt", true),
		createAttribute("shirt_striped",1,"Striped Shirt", true),
		createAttribute("shirt_suit",2,"Suit and Red Tie", true),
		createAttribute("shirt_short",3,"Crop-Top", true),
		createAttribute("shirt_checkered",4,"Checkered Shirt", true),
		createAttribute("shirt_vNeck",5,"V-Neck Shirt", true),
	],
	
	pants : [
		createAttribute("pants_standard",0,"Plain Pants", true),
		createAttribute("pants_short",1,"Plain Shorts", true),
		createAttribute("pants_striped",2,"Striped Pants", true),
		createAttribute("pants_checkered",3,"Checkered Pants", true),
		createAttribute("pants_skirt",4,"Plain Skirt", true),
		createAttribute("pants_stripeSkirt",5,"Striped Skirt", true),
		createAttribute("pants_checkeredSkirt",6,"Checkered Skirt", true),
	], 
	
	skin : [
		createAttribute("skin_light",0,"Light Complexion", true),
		createAttribute("skin_tan",1,"Olive Complexion", true),
		createAttribute("skin_dark",2,"Dark Complexion", true),
	
	],
	
	cars : [
		createAttribute("car_family",0,"Family Car", true),
		createAttribute("car_convertible",1,"Convertible Car", true),
		createAttribute("car_van",2,"Van", true),
		createAttribute("car_truck",3,"Flatbed Truck", true),
	]
}

function getRandomColor(){
	var randColor = access_colorList().getRandom();
	var color =  access_getColor(randColor);
	return color;
}

function generateHuman(){
	var humanus = {
		skin:-1,
		shirt:-1,
		hair:-1,
		pants:-1,
		hat : -1,
		color:{
			hair:-1,
			shirt:-1,
			pants:-1,
			hat: -1,
		}
	};
	
	if(random(1) < hatChance){
		humanus.hat = global.humanSet.hats[0];
	} else{
		humanus.hat = global.humanSet.hats[1];
	}
	humanus.skin = global.humanSet.skin[irandom(global.humanSetSizes.skins - 1)];
	humanus.hair = global.humanSet.hairs[irandom(global.humanSetSizes.hairs - 1)];
	humanus.pants = global.humanSet.pants[irandom(global.humanSetSizes.pants - 1)];
	humanus.shirt = global.humanSet.shirts[irandom(global.humanSetSizes.shirts - 1)];
	
	humanus.color.hat = getRandomColor();	
	humanus.color.hair = getRandomColor();
	humanus.color.pants = getRandomColor();	
	humanus.color.shirt = getRandomColor();
	return humanus;
}

function generateCar(){
	var humanus = generateHuman();
	humanus.car = global.humanSet.cars[irandom(global.humanSetSizes.cars - 1)];
	
	humanus.color.car = getRandomColor();
	while(humanus.color.car.name == "black"){
		humanus.color.car = getRandomColor();
	}
	return humanus;
}

function draw_car(data, _x,_y, xscale, yscale){
	draw_human(data, _x + 50*xscale, _y - 40*yscale,-xscale*0.8,0.8*yscale);
	draw_sprite_ext(s_car_bodies, data.car.sprite,_x,_y,xscale,yscale,0,data.color.car.color,1);
	draw_sprite_ext(s_car_parts, data.car.sprite,_x,_y,xscale,yscale,0,c_white,1);
}

function draw_human(data, _x,_y, xscale,yscale){
	var headSprite = 2*data.skin.sprite;
	if(ctrl.clownAlert){
		headSprite = data.skin.sprite + 6;
	}
	draw_sprite_ext(s_nakedHuman, headSprite,_x,_y,xscale,yscale,0,c_white,1);
	draw_sprite_ext(s_hair, data.hair.sprite,_x,_y,xscale,yscale,0,data.color.hair.color,1);
	draw_sprite_ext(s_nakedHuman, 1 + 2*data.skin.sprite,_x,_y,xscale,yscale,0,c_white,1);
	draw_sprite_ext(s_pants, data.pants.sprite,_x,_y,xscale,yscale,0,data.color.pants.color,1);
	draw_sprite_ext(s_shirt, data.shirt.sprite,_x,_y,xscale,yscale,0,data.color.shirt.color,1);
	draw_sprite_ext(s_hat, data.hat.sprite,_x,_y,xscale,yscale,0,data.color.hat.color,1);
	if(data.shirt.name == "shirt_suit"){
		draw_sprite_ext(s_tie, 0,_x,_y,xscale,yscale,0,c_white,1);
	}
}

function draw_human_dancing(data, _x,_y, xscale,yscale, dancing){
	var dancingX, dancingY;
	dancingX = 0;
	dancingY = (2*5/pi) * arcsin(sin((2*pi/20) * dancing));
	draw_human(data,_x + dancingX, _y + dancingY,xscale, yscale);
}