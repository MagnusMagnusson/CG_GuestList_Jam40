o_asif(!prepared && o_results.gamemode !=  ""){
	var attempts = array_to_Array(ctrl.highScores.attempts[$ o_results.gamemode]);
	prepared = true;
	avg = 0;
	med = 0;
	var tot = 0;
	low = 999999;
	high = -1;
	total = attempts.size;
	
	for(var i = 0; i < attempts.size; i++){
		var att = attempts.get(i);
		if(o_results.gamemode == "marathon"){
			tot += att.stage;
			if((i + 1) >= (attempts.size/2) && (i) < (attempts.size/2)){
				med = att.stage;
			}
			if(att.stage > high){
				high = att.stage;
			}
			if(att.stage < low){
				low = att.stage;
			}
		} else{
			tot += att.time;
			if((i + 1) >= (attempts.size/2) && (i) < (attempts.size/2)){
				med = att.time;
			}
			if(att.time > high){
				high = att.time;
			}
			if(att.time < low){
				low = att.time;
			}
		}
	}
	avg = tot/attempts.size;
} 

if(o_results.gamemode == ""){
	prepared = false;
}