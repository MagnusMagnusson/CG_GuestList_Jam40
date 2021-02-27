text = "Fastest Host - 25 Guests";

mouseEnter = function(){
	inst_infobox_gameMenu.text =  @"Fastest Host - 25 Guests

Do you have a quick eye? Prove it in this fast action invitation frenzy!

Goal: You are given twenty five descriptions of varying detail. Find 25 guests to invite who match the descriptions: Fastest time counts. Every wrong invite adds one second to your time. ";
}

mouseLeave = function(){
	inst_infobox_gameMenu.text =  inst_infobox_gameMenu.defaultText;
}