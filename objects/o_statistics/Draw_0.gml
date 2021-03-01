if(o_results.gamemode !=  "" && global.networking.status = networkstatus.connected){
	draw_set_color(c_black);
	draw_text(x,y,"Global Statistics!")
	draw_text(x,y + 20*1, "Attempts made: "+ string(o_online_scoreboard.stats[$ o_results.gamemode].count));
	draw_text(x,y + 20*2, "Average Score: "+ string(o_online_scoreboard.stats[$ o_results.gamemode].avg));
	draw_text(x,y + 20*3, "Median Score: "+ string(o_online_scoreboard.stats[$ o_results.gamemode].med));
	draw_text(x,y + 20*4, "Highest Score: "+ string(o_online_scoreboard.stats[$ o_results.gamemode].max));
	draw_text(x,y + 20*5, "Lowest Score: "+ string(o_online_scoreboard.stats[$ o_results.gamemode].min));
} else{
	draw_text(x,y + 50, "["+o_results.gamemode + "] - ");
	draw_text(x,y,"Global Statistics!");
	draw_text(x,y + 20*1, "Can't Display Global Statistics");

}

var xOff;
xOff = 350;

if(o_results.gamemode !=  ""){
	draw_set_color(c_black);
	draw_text(x + xOff,y,"Local Statistics!")
	
	draw_text(x + xOff,y + 20*1, "Attempts made: "+ string(total));
	draw_text(x + xOff,y + 20*2, "Average Score: "+ string((avg)));
	draw_text(x + xOff,y + 20*3, "Median Score: "+ string(med));
	draw_text(x + xOff,y + 20*4, "Highest Score: "+ string(high));
	draw_text(x + xOff,y + 20*5, "Lowest Score: "+ string(low));
}