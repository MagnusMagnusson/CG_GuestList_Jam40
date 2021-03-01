
network_getHighscores("marathon",function(result){
	show_debug_message(result);
	marathonList = json_parse(result);
})

network_getStatistics("marathon",function(result){
	stats.marathon = json_parse(result);
})

network_getStatistics("fastest_10",function(result){
	stats.fastest_10 = json_parse(result);
})

network_getStatistics("fastest_25",function(result){
	stats.fastest_25 = json_parse(result);
})



network_getStatistics("fastest_50",function(result){
	stats.fastest_50 = json_parse(result);
})


