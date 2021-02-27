image_index = global.options.play_sounds;
text = "Play Sounds";
action = function(){
	image_index = !image_index;
	global.options.play_sounds = image_index;
}