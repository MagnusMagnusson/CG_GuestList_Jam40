text = "Play!";
action = function(){
	layer_set_visible(layer_get_id("MainMenu"), false)
	layer_set_visible(layer_get_id("GamesMenu"), true)
}