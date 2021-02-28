if(!instance_exists(ctrl)){
	action();
} else{
	if(layer_get_visible(layer) && !ctrl.killInput){
		ctrl.killInput = 5;
		action();
	}
}