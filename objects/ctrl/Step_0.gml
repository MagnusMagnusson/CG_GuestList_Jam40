if(playing && !paused){
	o_results.gamemode = "";
	gamemode.tick();
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