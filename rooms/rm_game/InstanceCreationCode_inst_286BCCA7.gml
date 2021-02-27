text = "Main Menu";
parent = inst_54A8A701;

action = function(){
	ctrl.gamemode = -4;
	layer_set_visible(layer,false);
	layer_set_visible(layer_get_id("MainMenu"), true);
}