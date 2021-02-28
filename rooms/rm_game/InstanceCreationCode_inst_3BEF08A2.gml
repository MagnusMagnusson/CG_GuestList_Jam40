text = "save";
action = function(){
	layer_set_visible(layer,false);
	layer_set_visible(layer_get_id("OptionsMenu"),true);
	save_options("accessibility",global.accessibility);
}