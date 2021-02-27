function findGuest(){
	var guest = noone;
	var count = instance_number(o_genericHuman);
	var rand = 1+irandom(count-1);
	var i = 0;
	with(o_genericHuman){
		i++;
		if(i == rand){
			if(location == "Back Street"){
				if(random(1) > guest_farAwayChance){
					count++;
					continue;
				}
			}
			guest = id;
			break;
		}
	}
	if(guest == noone){
		return findGuest();
	}
	return {
		data: guest.me,
		class: guest.class,
		id: guest.id,
	};
}

function findGuests(n){
	var list = new Array();
	var idList = new Array();
	repeat(n){
		var guest = findGuest();
		while(idList.find(guest.id) != -1){
			var guest = findGuest();
		}
		list.add(guest);
		idList.add(guest.id);
	}
	delete idList;
	return list;
}

function getAllDescriptions(guestList){
	var descriptionList = guestList.map(function(elem) {
		return getFullDescriptionStruct(elem);
	});
	return descriptionList;
}

function getFullDescriptionStruct(guest){
	var description = {
		done: false,
	};
	description.skin = {
		color:-1,
		description: -1,
	};
	description.hair = {
		color:-1,
		description: -1,
	};
	description.shirt = {
		color:-1,
		description: -1,
	};
	description.pants = {
		color:-1,
		description: -1,
	};
	description.car = {
		color:-1,
		description: -1,
	};
	description.location = {
		description: -1,
		color: -1,
	};
	description.activity= {
		description: -1,
		color: -1,
	};
	description.isCar = guest.id.class == "car";
	
	description.length = 0;
				
	if(access_colorCanBeMatched(guest.data.color.hair.name, "hair")){
		description.hair.color = guest.data.color.hair.name;
		description.length++;
	}
	
	
	description.skin.description = guest.data.skin;
	description.length++;
			
	description.location.description = guest.id.location;
	description.length++;
			
	switch(guest.class){
		case "walking":{
			if(guest.data.hair.canBeMatched){
				description.hair.description = guest.data.hair;
				description.length++;
			}

			if(guest.data.shirt.canBeMatched){
				description.shirt.description = guest.data.shirt;
				description.length++;
			}
			
			if(access_colorCanBeMatched(guest.data.color.shirt.name, "shirt")){
				description.shirt.color = guest.data.color.shirt.name;
				description.length++;
			}
			
			if(guest.data.pants.canBeMatched){
				description.pants.description = guest.data.pants;
				description.length++;
			}
			
			if(access_colorCanBeMatched(guest.data.color.pants.name, "pants")){
				description.pants.color = guest.data.color.pants.name;
				description.length++;
			}

			break;
		}
		case "car":{
			if(access_colorCanBeMatched(guest.data.color.car.name, "car")){
				description.car.color = guest.data.color.car.name;
				description.length++;
			}
			
			if(guest.data.car.canBeMatched){
				description.car.description = guest.data.car;
				description.length++;
			}
			break;
		}
	}
	return description;
}

function getDescriptionFromStruct(descriptionStruct){
	var desc = "";
	var mustMentionShirt = false;
	var mustMentionHair= false;
	var mustMentionPants = false;
	var mustMentionCar = false;
	
	//Skin
	if(descriptionStruct.skin.description != -1){
		desc += descriptionStruct.skin.description.description + ", ";
	}
	
	
	//Hair
	if(descriptionStruct.hair.color != -1){
		desc += descriptionStruct.hair.color+ " ";
		mustMentionHair = true;
	}
	
	if(descriptionStruct.hair.description != -1){
		desc += descriptionStruct.hair.description.description + " ";
		mustMentionHair = true;
	}
	
	if(mustMentionHair){
		desc += "hair, "
	}
	
	//Shirt
	if(descriptionStruct.shirt.color != -1){
		desc += descriptionStruct.shirt.color+ " ";
		mustMentionShirt = true;
	}
	
	if(descriptionStruct.shirt.description != -1){
		desc += descriptionStruct.shirt.description.description + ", ";
		mustMentionShirt = false;
	}
	
	if(mustMentionShirt){
		desc += "shirt, "
	} 
	
	//Pants
	if(descriptionStruct.pants.color != -1){
		desc += descriptionStruct.pants.color+ " ";
		mustMentionPants = true;
	}
	
	if(descriptionStruct.pants.description != -1){
		desc += descriptionStruct.pants.description.description + ", ";
		mustMentionPants = false;
	}
	
	if(mustMentionPants){
		desc += "Pants or Skirt, "
	}
	
		//Car
	if(descriptionStruct.car.color != -1){
		desc += descriptionStruct.car.color+ " ";
		mustMentionCar = true;
	}
	
	if(descriptionStruct.car.description != -1){
		desc += descriptionStruct.car.description.description + ", ";
		mustMentionCar = false;
	}
	
	if(mustMentionCar){
		desc += "Car, "
	}
		
	//Location
	if(descriptionStruct.location.description != -1){
		desc += "Located " + descriptionStruct.location.description + ", ";
	}
	
	return desc;
}

function getLimitedDescriptionStruct(guest, n){
	var struct = getFullDescriptionStruct(guest);
	
	while(struct.length > n){
		var elem = choose("skin", "hair","shirt","pants","car","location","activity");
		if(elem != "skin" && struct.skin.description != -1 && random(1) < guest_skinRerollChance){
			elem = "skin";
		}
		var colOrDesc = choose("color","description");
		if(struct[$ elem][$ colOrDesc] != -1){
			struct[$ elem][$ colOrDesc] = -1;
			struct.length--;
		}
	}
	
	if(struct.location.description == "Far Away"){
			if(struct.pants.description != -1 || struct.shirt.description != -1 || struct.hair.description != -1){
				struct.location.description = -1;
				struct.length--;
			}
	}
	
	return struct;
}