if(playing && !paused){
	gamemode.tick();
	o_results.gamemode = "";
}

if(killInput > 0){
	killInput--;
}

beatCounter++;
if(beatCounter >= 1714){
	beatCounter = 1;
}

if(beatCounter % (2*17) == 0){
	with(o_genericHuman){
		if(class == "walking"){
			x += -image_xscale * 15 * baseSpeed;
		}
	}
}