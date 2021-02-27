text = "Back To Menu";

action = function(){
	layer_set_visible(layer_get_id("GamesMenu"), false);
	layer_set_visible(layer_get_id("MainMenu"), true);
}

mouseEnter = function(){
	inst_infobox_gameMenu.text =  @"Back To Menu.

Nothing to your fancy? Head back to the main menu then and click some other buttons.";
}

mouseLeave = function(){
	inst_infobox_gameMenu.text =  inst_infobox_gameMenu.defaultText;
}