init_options();

if(global.options.skip_accessibility){
	room_goto_next();
} else{
	global.options.skip_accessibility = true;
	save_options("options",global.options);
}