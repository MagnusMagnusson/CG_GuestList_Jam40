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
	hairs : 11,
	shirts: 6,
	pants: 7
}

global.humanSet = {
	hairs : [
		createAttribute("hair_genericShort", 0, "", false),
		createAttribute("hair_genericMiddleLong", 1, "", false),
		createAttribute("hair_scruffy", 2, "", false),
		createAttribute("hair_verylong", 3, "", false),
		createAttribute("hair_elvis", 4, "", false),
		createAttribute("hair_balding", 5, "", false),
		createAttribute("hair_puff", 6, "", false),
		createAttribute("hair_uncombed", 7, "", false),
		createAttribute("hair_80s", 8, "", false),
		createAttribute("hair_female", 9, "", false),
		createAttribute("hair_female_long", 10, "", false),
	],
	
	shirts : [
		createAttribute("shirt_buttons",0,"Buttoned Shirt", true),
		createAttribute("shirt_striped",1,"Striped Shirt", true),
		createAttribute("shirt_suit",2,"Suit and Tie", true),
		createAttribute("shirt_short",3,"Belly Shirt", true),
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
	]
}

function getRandomColor(){
	var randColor = access_colorList().getRandom();
	var color =  access_getColor(randColor);
	return color;
}

function generateHuman(){
	var humanus = {
		shirt:-1,
		hair:-1,
		pants:-1,
		color:{
			hair:-1,
			shirt:-1,
			pants:-1,
		}
	};
	humanus.hair = global.humanSet.hairs[irandom(global.humanSetSizes.hairs - 1)];
	humanus.pants = global.humanSet.pants[irandom(global.humanSetSizes.pants - 1)];
	humanus.shirt = global.humanSet.shirts[irandom(global.humanSetSizes.shirts - 1)];
	
	humanus.color.hair = getRandomColor();
	humanus.color.pants = getRandomColor();	
	humanus.color.shirt = getRandomColor();
	return humanus;
}