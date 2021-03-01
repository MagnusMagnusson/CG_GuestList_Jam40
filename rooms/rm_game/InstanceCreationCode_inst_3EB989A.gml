text = "Save Name";
action = function(){
	with(textBox){
		if(name == "online_name"){
			network_renameMe(text);
		}
	}
}