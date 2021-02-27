
function fastestHostpopulateGuestList(n){
	guestList = findGuests(n);
	for(var i = 0; i < guestList.size; i++){
		guestList.set(i, getLimitedDescriptionStruct(guestList.get(i), 1 + ((floor(i/2))%8)));
	}
	return guestList;
}


function fastestHostGameMode(n) constructor{
		_n = n;
		static setup = function(){
			with(ctrl){
				timer = 0;
				found = 0;
				countdown = 3;
				paused = false;
				playing = true;
				target = other._n;
			
				fastestHostpopulateGuestList(other._n);
			}
		};
			
		static tick = function(){
			with(ctrl){
				timer += 1/room_speed;
			}
		};
			
		static draw = function(){			
				draw_crimsonBox(0,room_height - 64,room_width,room_height);
				draw_set_color(c_black);
				draw_set_font(fnt_consolas_18);
				var displayTime = ctrl.timer;
				draw_set_valign(fa_middle);
				
				var gameName, instructions, time, stage;
				
				if(ctrl.clownAlert){
					gameName = "Longest Clown";
					instructions = "RMB/CTRL for Clown";
					time = "Clown Clock: " +string(displayTime)
					stage = "CLOWNS FOUND (0/1)";
				} else{
					gameName = "Fastest Host " + string(_n);
					instructions = "RMB/CTRL to magnify";
					time = "Time: "+ string(displayTime);
					stage = "GUESTS FOUND "+string(ctrl.found)+"/"+string(ctrl.target)+")";
				}
				
				draw_text(32,room_height - 32, gameName);
				
				draw_set_font(fnt_consolas_16);
				draw_text(128+64+64,room_height - 32, instructions);
				
				draw_set_font(fnt_consolas_18);
				draw_text(hud_width - 256,room_height - 32, time);
				draw_text((hud_width / 2) + 32,room_height - 32, stage);
				draw_reset();
		};
			
		static successClick = function(guest, pos){
			with(ctrl){
				guestList.remove(pos);
				found++;
				killInput = 3;
				if(found % 5 == 0){
					ctrl.clownAlert = true;
					var n = instance_number(o_walking_left_human);
					var c = irandom(n - 1);
					var i = 0;
					with(o_walking_left_human){
						if(c == i){
							var clown = instance_create_layer(x,y,layer,o_clown);
						}
						i++;
					}
				}
				if(found >= target){
					gameOver();
				}
				guest.visible = false;
			}
		};
			
		static failedClick = function(guest){
			killInput = 3;
			var award = instance_create_layer(guest.x, guest.y - 5, layer_get_name("il_heaven"),o_award);
			award.text = " :( ";
			award.color = c_red;
			ctrl.timer++;
		};
			
		static gameOver = function(silent){
			if(!silent){
				var result = fastestHostHighScore(_n);
				save_highScores();
				showGameOver();
				o_results.bigText = "You found all the guests in " + string(ctrl.timer) + " seconds!";
				o_results.commentary = "Care to try again?";
				o_results.gamemode = "fastest_"+string(_n);
				o_results.drawMethod = function(elem, pos) {
					return "Attempt #"+string(elem.attempt) + " - "+ string(elem.time) + " seconds";
				};
				o_results.highSort = function(a,b){
					return a.time < b.time;
				}
				switch(result){
					case -1:{
						o_results.highScoreText = "A valiant effort!";
						break;
					}
					case 0:{
						o_results.highScoreText = "That's equal to your personal best!";
						break;
					}
					case 1:{
						o_results.highScoreText = "A NEW PERSONAL BEST!";
						break;
					}
				}
			} else{
				ctrl.gamemode = -4;
			}
			ctrl.paused = true;
			ctrl.playing = false;
		}
	
}

function fastestHostHighScore(n){
	var attempts = array_length(ctrl.highScores.attempts[$ "fastest_"+string(n)]);
	var attempt = {
		attempt: attempts + 1,
		time: ctrl.timer,
		date : date_current_datetime()
	}
	ctrl.highScores.attempts[$ "fastest_"+string(n)][attempts] = attempt;
				
	var bestAttempt = ctrl.highScores.bestAttempt[$ "fastest_"+string(n)];
	if(bestAttempt == -1){
		ctrl.highScores.bestAttempt[$ "fastest_"+string(n)] = attempts;
		return 1;
	} else{
		var champion = ctrl.highScores.attempts[$ "fastest_"+string(n)][ctrl.highScores.bestAttempt[$ "fastest_"+string(n)]];
		if(attempt.time < champion.time){
			ctrl.highScores.bestAttempt[$ "fastest_"+string(n)] = attempts;
			return 1;
		} else{
			if(attempt.time == champion.time){
				return 0;
			}
		}
	}
	return -1;	
}