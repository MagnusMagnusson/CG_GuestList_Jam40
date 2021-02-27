text = "Main Menu";
parent = inst_54A8A701;

action = function(){
	ctrl.gamemode = -4;
	hideGameOver();
	layer_set_visible(layer_get_id("MainMenu"), true);
}