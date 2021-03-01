if(layer_get_visible(layer)){
	network_getHighscores("marathon",function(result){
		show_debug_message(result);
		marathonList = json_parse(result);
	})
}