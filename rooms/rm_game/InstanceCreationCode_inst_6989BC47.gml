text = "Main Menu";
parent = inst_54A8A701;

action = function(){
	ctrl.gamemode = -4;	
	layer_set_visible(layer, false);
	layer_set_visible(layer_get_id("your_results"), false);
	layer_set_visible(layer_get_id("your_statistics"), false);
	layer_set_visible(layer_get_id("MainMenu"), true);
	inst_92F7B3F.prepared = false;
	inst_1D977E5E.prepared = false;
} 