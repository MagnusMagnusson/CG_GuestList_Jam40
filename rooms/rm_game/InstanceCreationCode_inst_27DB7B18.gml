text = "Back";

action = function(){
	save_options("options",global.options);
	layer_set_visible(layer,false);
	if(ctrl.playing){
		layer_set_visible(layer_get_id("PauseMenu"),true);
	} else{
		layer_set_visible(layer_get_id("MainMenu"), true);
	}
}