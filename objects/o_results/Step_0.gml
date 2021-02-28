if(x != xstart){
	x -= 5*sign(x - xstart) * x/xstart;
	if(abs(x-xstart < 3)){
		x = xstart;
	}
}