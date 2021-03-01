text = "Longest List";
action = function(){
	layer_set_visible(layer,false);
	showGameOver();
	o_results.gamemode = "marathon";
	o_results.bigText = "Longest List Statistics";
	o_results.commentary = "Ignore the 'Game Over'. I ran out of time am and reusing assets.";
	o_results.highScoreText = "";
	o_results.drawMethod = 	function(elem, pos) {
			return "Attempt #"+string(elem.attempt) + " - Stage " + string(elem.stage) + " ["+string(elem.guests)+"]"
		};
	o_results.highSort = function(a,b){
		return a.stage > b.stage || (a.stage == b.stage && a.guests > b.guests);
	}
	inst_286BCCA7.visible = false;
}