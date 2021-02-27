if(parent){
	x = parent.x + (xstart - parent.xstart);
	y = parent.y + (ystart - parent.ystart);
}

if(!prepared && "" != o_results.gamemode){
	drawMethod = o_results.drawMethod;
	prepared = true;
	list = array_to_Array(ctrl.highScores.attempts[$ o_results.gamemode]);
	if(setting == "highest"){
		list = list.sort(o_results.highSort);
	} else if (setting == "recent"){
		list = list.sort(function(a,b){
			return a.attempt > b.attempt;
		});
	}
}