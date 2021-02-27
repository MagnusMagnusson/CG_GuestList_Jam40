text = "Collect The Guest";


mouseEnter = function(){
	inst_infobox_gameMenu.text =  @"Collect The Guest
		Not much for time pressure? That's all right, the Crimson Guild puts much value in a good rest and relaxation. Let's just invite guests, no pressure attatched. 
		
		Goal: You are given a picture and description of a specific person you've never clicked before. Find them, click them, and see them pop up in your collection (assuming we had the time to implement it).
		
		No time pressure, no end goal, and given the amazing magic of combinatorics you can be clicking for hours. Literally. There are a lot of different possible people in this game. I advise against trying to be a completionist about this. 
		
		Have fun!		
	";
}

mouseLeave = function(){
	inst_infobox_gameMenu.text =  inst_infobox_gameMenu.defaultText;
}