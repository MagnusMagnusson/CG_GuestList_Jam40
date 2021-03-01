text = "Longest List";
mouseEnter = function(){
	inst_infobox_gameMenu.text =  @"Longest List

The Crimson Party is coming up soon and you have been tasked with inviting all the guests. Hurry up however, we only have so much time!

Goal: Find and click on any person matching any description on the guest list. For every correct match extend your time by 5 seconds. For every wrong guess lose 5 seconds.

With every stage the list gets more and more detailed and fewer and fewer guests match. How long can you last?

This is the default gamemode and the one that counts towards the Crimson Guild Meta-entry progression. ";
}

mouseLeave = function(){
	inst_infobox_gameMenu.text =  inst_infobox_gameMenu.defaultText;
}

action = function(){
	with(ctrl){
		gamemode = gameModeGet(GameModes.MARATHON);
		gamemode.setup();
	}
	layer_set_visible(layer, false);
}