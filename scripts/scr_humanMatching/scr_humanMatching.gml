function doIMatch(guest_id){
	var guestList = ctrl.guestList;
	var match, matchPos, matchSize;
	matchSize = 0;
	match = false;
	for(var i = 0; i < guestList.size; i++){
		var desc = guestList.get(i);
		if(descriptionMatch(guest_id, desc)){
			match = true;
			if(desc.length > matchSize){
				matchSize = desc.length;
				matchPos = i;
			}
		}
	}
	if(match){
		return matchPos;
	} else{
		return -1;
	}
}

function descriptionMatch(guest, descriptionStruct){
	var res = partialMatch(guest, descriptionStruct, "hair") &&
	partialMatch(guest, descriptionStruct, "shirt") &&
	partialMatch(guest, descriptionStruct, "pants") &&
	(guest.class != "car" || partialMatch(guest, descriptionStruct, "car"));
	return res;
}

function partialMatch(guest, description, field){
	var me = guest.me;
	var res =  ( (description[$ field].color == -1 || description[$ field].color == me.color[$ field].name) &&
		(description[$ field].description == -1 || description[$ field].description.description == me[$ field].description));
	return res;
}