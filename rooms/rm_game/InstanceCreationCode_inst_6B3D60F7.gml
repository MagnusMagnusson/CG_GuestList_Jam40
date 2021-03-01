text = "Fastest Host 10";
action = function(){
	layer_set_visible(layer,false);
	showGameOver();

	o_results.drawMethod = function(elem, pos) {
		return "Attempt #"+string(elem.attempt) + " - "+ string(elem.time) + " seconds";
	};
	o_results.highSort = function(a,b){
		return a.time < b.time;
	}
	o_results.gamemode = "fastest_10";
	o_results.bigText = "Fastest Host 10 Statistics";
	o_results.commentary = "Ignore the 'Game Over'. I ran out of time am and reusing assets.";
	o_results.highScoreText = "";

	inst_286BCCA7.visible = false;
}