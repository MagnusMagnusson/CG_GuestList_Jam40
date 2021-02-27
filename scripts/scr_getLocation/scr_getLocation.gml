function humanGetLocation(){
	var location = "Nearby";
	if(layer == layer_get_id("il_backStreet") || layer == layer_get_id("il_backSidewalk")){
		location = "On The Back Street";
	} else {
		if(layer == layer_get_id("il_rooftop")){
			location = "On The Rooftops";
		} 
	}
	return location;
}