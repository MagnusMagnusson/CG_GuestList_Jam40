value = global.options.master_volume
text = "Master Volume";

action = function(val){
	global.options.master_volume = val;
	audio_master_gain(val);
}