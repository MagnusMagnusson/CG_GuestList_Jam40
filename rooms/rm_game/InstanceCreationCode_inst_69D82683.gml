text = "Exit To Desktop";

action = function(){
	if(show_question("Are you sure? Your progress will be lost")){
		game_end();
	}
}