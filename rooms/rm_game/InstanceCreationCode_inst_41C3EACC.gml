text = "Highscores & Statistics"
parent = inst_54A8A701; 
action = function(){
	var stat, res;
	stat = layer_get_id("your_statistics");
	res = layer_get_id("your_results");
	if(layer_get_visible(res)){
		text = "Results";
		layer_set_visible(stat,1);
		layer_set_visible(res,0)
	} else{
text = "Highscores & Statistics"
		layer_set_visible(stat,0);
		layer_set_visible(res,1);
	}
	
}