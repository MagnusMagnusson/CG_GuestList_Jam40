image_index = global.options.play_music;
text = "Play Music";
action = function(){
	image_index = !image_index;
	global.options.play_music = image_index;
}