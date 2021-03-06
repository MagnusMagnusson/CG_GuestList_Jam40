text = "Fastest Host - 10 Guests";

mouseEnter = function(){
	inst_infobox_gameMenu.text =  @"Fastest Host - 10 Guests

Do you have a quick eye? Prove it in this fast action invitation frenzy!

Goal: You are given ten descriptions of varying detail. Find 10 guests to invite who match the descriptions: Fastest time counts. Every wrong invite adds one second to your time. ";
}

mouseLeave = function(){
	inst_infobox_gameMenu.text =  inst_infobox_gameMenu.defaultText;
}

action = function(){
	with(ctrl){
		gamemode = gameModeGet(GameModes.FASTHOST_10);
		gamemode.setup();
	}
	layer_set_visible(layer, false);
}