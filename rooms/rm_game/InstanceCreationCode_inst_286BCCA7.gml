text = "Try Again";
parent = inst_54A8A701;

action = function(){
	ctrl.gamemode.setup();
	layer_set_visible(layer, false);
	layer_set_visible(layer_get_id("your_results"), false);
	layer_set_visible(layer_get_id("your_statistics"), false);
	inst_92F7B3F.prepared = false;
	inst_1D977E5E.prepared = false;
} 