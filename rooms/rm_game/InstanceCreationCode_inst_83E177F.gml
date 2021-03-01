text = "Exit to menu";

action = function(){
	if(show_question("Are you sure? your progress will be lost.")){
		ctrl.gameOver(true);
		layer_set_visible(layer_get_id("MainMenu"),true);
		o_networker.alarm[0] = 5;
		layer_set_visible(layer,false);
	}
}