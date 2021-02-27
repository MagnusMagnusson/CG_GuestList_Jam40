var pauseMenu, optionsMenu, accessabilityMenu;
pauseMenu = layer_get_id("PauseMenu");
optionsMenu = layer_get_id("OptionsMenu");
accesabilityMenu = layer_get_id("AccessabilityMenu");

if(paused && playing){
	if(layer_get_visible(pauseMenu)){
		layer_set_visible(pauseMenu, false);
		paused = false;
	} else{
		if(layer_get_visible(optionsMenu)){
			layer_set_visible(optionsMenu,false);
			layer_set_visible(pauseMenu, true);
		} else{
			layer_set_visible(accessabilityMenu,false);
			layer_set_visible(optionsMenu, true);
		}
	}
} else if(!paused && playing){
	paused = true;
	layer_set_visible(pauseMenu, true);
}