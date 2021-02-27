function marathon_getStageList(stage){
	var ratio = [
		20 - stage,
		10 + stage,
		0 + 2*stage,
		-5 + 1.75 * stage,
		-10 + 1.75 * stage,
		-15 + 1.5 * stage,
		-30 + 2 * stage,
		-40 + 3 * stage
	];
	var res = [0];
	var count = min(10,floor(3 + stage/3)); 
	
	var total = 0;
	for(var i = 0; i < 8; i++){
		ratio[i] = max(0, ratio[i]);
		total += ratio[i];
	}
	show_debug_message("count = " + string(count))
	show_debug_message("total = " + string(total))
	for(var i = 0; i < 8; i++){
		show_debug_message(string(i + 1) + " = " + string(round(((ratio[i])/total) * count)))
		res[i + 1] = round(((ratio[i])/total) * count);
		res[0] += res[i + 1];
	}
	if(res[0] == count + 1){
		res[1]++;
		res[0]++;
	}
	return res;
}

function marathon_populateGuestList(stage){
	var stageList = marathon_getStageList(stage);
	target = stageList[0]/2;
	found = 0;
	guestList = findGuests(stageList[0]);
	show_debug_message("generating " + string(stageList[0]) + " guests");
	var currentCount = 0;
	var currentLevel = 1;
	var i = 0;
	while(currentLevel <= 8){
		while(currentCount < stageList[currentLevel]){
			show_debug_message("mapping " + string(currentLevel)+ ","+string(currentCount));
			show_debug_message("i = "+ string(i));
			guestList.set(i, getLimitedDescriptionStruct(guestList.get(i), currentLevel));
			currentCount++;
			i++;
		}
		show_debug_message(string(currentCount) + " <= " + string(stageList[currentLevel]));
		currentLevel++;
		currentCount = 0;
	}
	show_debug_message("Done!");
}