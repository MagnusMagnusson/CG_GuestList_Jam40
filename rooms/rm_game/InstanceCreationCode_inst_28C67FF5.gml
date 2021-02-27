text = "Fastest Host - 50 Guests";

text = "Fastest Host - 25 Guests";

mouseEnter = function(){
	inst_infobox_gameMenu.text =  @"Fastest Host - 10 Guests
		Do you have a quick eye and some real dexterity? Prove it in this fast action invitation frenzy!
		
		Goal: You are given fifty descriptions of varying detail. Find 50 guests to invite who match the descriptions: Fastest time counts. Every wrong invite adds one second to your time. 
		
	";
}

mouseLeave = function(){
	inst_infobox_gameMenu.text =  inst_infobox_gameMenu.defaultText;
}