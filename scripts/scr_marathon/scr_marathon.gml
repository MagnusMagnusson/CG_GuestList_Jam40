function marathon_getStageList(stage){
	var ratio = [
		20 - 2*stage,
		10 + stage,
		0 + 2*stage,
		-5 + 1.5 * stage,
		-10 + 1.5 * stage,
		-15 + 1.5 * stage,
		-30 + 2 * stage,
		-40 + 3 * stage
	];
	var res = [0];
	var count = min(10,floor(3 + (stage/3))); 
	
	var total = 0;
	for(var i = 0; i < 8; i++){
		ratio[i] = max(0, ratio[i]);
		total += ratio[i];
	}
	show_debug_message("count = " + string(count))
	show_debug_message("total = " + string(total))
	res = [0,0,0,0,0,0,0,0,0];
	for(var i = 0; i < 8; i++){
		show_debug_message(string(i + 1) + " = " + string(round(((ratio[i])/total) * count)))
		res[i + 1] = round(((ratio[i])/total) * count);
		res[0] += res[i + 1];
		if(res[0] >= count){
			break;
		}
	}
	return res;
}

function marathon_populateGuestList(stage){
	var stageList = marathon_getStageList(stage);
	target = stageList[0]/2;
	found = 0;
	guestList = findGuests(stageList[0]);
	show_debug_message("generating " + string(stageList[0]) + " guests");
	var currentCount = 0;
	var currentLevel = 1;
	var i = 0;
	while(currentLevel <= 8){
		while(currentCount < stageList[currentLevel]){
			show_debug_message("mapping " + string(currentLevel)+ ","+string(currentCount));
			show_debug_message("i = "+ string(i));
			guestList.set(i, getLimitedDescriptionStruct(guestList.get(i), currentLevel));
			currentCount++;
			i++;
		}
		show_debug_message(string(currentCount) + " <= " + string(stageList[currentLevel]));
		currentLevel++;
		currentCount = 0;
	}
	show_debug_message("Done!");
}


function marathonGameMode(){
	return {
		setup : function(){
			with(ctrl){
				ticker = 0;
				surf_night = noone;
				timer = 60;
				stage = 1;
				totalFound = 0;
				countdown = 3;
				paused = false;
				playing = true;
			
				marathon_populateGuestList(stage);
			}
		},
			
		tick : function(){
			with(ctrl){
				ticker++;
				timer-= 1/room_speed;
				if(timer <= 0){
					gameOver(false);
				}
				if(timer < 10 && floor(timer) < floor(timer + 1/room_speed)){
					play_sound(snd_one_note,10,false);
				}
			}
		},
			
		draw : function(){
				if(ctrl.stage >= 7 && (ctrl.stage - 7) % 4 == 0){
					if(!surface_exists(ctrl.surf_night)){
						ctrl.surf_night = surface_create(room_width, room_height);
					}
					surface_set_target(ctrl.surf_night);
					draw_set_alpha(0.9);
					draw_set_color(c_black);
					draw_rectangle(0,0,room_width,room_height, false);
					draw_set_color(c_white)
					gpu_set_blendmode(bm_subtract);
					for(var i = 0; i < 1; i+=0.025){
						draw_set_alpha(0.05);
						draw_circle(mouse_x,mouse_y,128 - ((1-i)*70),false);
					}
					gpu_set_blendmode(bm_normal);
					surface_reset_target();
					draw_set_alpha(1);
					draw_surface(ctrl.surf_night,0,0);
				}
			
				draw_crimsonBox(0,room_height - 64,room_width,room_height);
				draw_set_color(c_black);
				draw_set_font(access_getFontSize(18));
				var displayTime = ctrl.timer;
				if(displayTime > 10){
					displayTime = floor(displayTime)
				}
				draw_set_valign(fa_middle);
				
				var gameName, instructions, time, stage;
				
				if(ctrl.clownAlert){
					gameName = "Longest Clown";
					instructions = "RMB/CTRL for Clown";
					time = "Clown Clock: " +string(displayTime)
					stage = "STAGE CLOWN (0/1)";
				} else{
					gameName = "Longest List";
					instructions = "RMB/CTRL to magnify";
					time = "Time: "+ string(displayTime);
					stage = "STAGE "+ string(ctrl.stage) + "("+string(ctrl.found)+"/"+string(ceil(0.1 + ctrl.target))+")";
				}
				
				draw_text(32,room_height - 32, gameName);
				
				draw_set_font(access_getFontSize(16));
				draw_text(128+64+64,room_height - 32, instructions);
				
				draw_set_font(access_getBigFont());
				draw_text(hud_width - 256,room_height - 32, time);
				draw_text((hud_width / 2) + 32,room_height - 32, stage);
				draw_reset();
		},
			
		successClick : function(guest, pos){
			with(ctrl){
				ticker = 0;
				timer += 5;
				guestList.get(pos).done = true;
				found++;
				totalFound++;
				killInput = 3;
				if(ctrl.stage % 5 == 0 && found == 2){
					ctrl.clownAlert = true;
					var n = instance_number(o_walking_left_human);
					var c = irandom(n - 1);
					var i = 0;
					
					if(!instance_exists(o_clown)){
						with(o_walking_left_human){
							if(c == i){
								var clown = instance_create_layer(x,y,layer,o_clown);
							}
							i++;
						}
					}
				}
				if(found > target){
					stage++;
					timer += 5;
					with(o_genericHuman){
						hspeed *= 1.015;
					}
					marathon_populateGuestList(stage);
				}
				var award = instance_create_layer(guest.x, guest.y - 16, layer_get_name("il_heaven"),o_award);
				award.text = "+5";
				award.color = c_lime;
				guest.visible = false;
			}
		},
			
		failedClick : function(guest){
			killInput = 3;
			var award = instance_create_layer(guest.x, guest.y - 5, layer_get_name("il_heaven"),o_award);
			award.text = "-5";
			award.color = c_red;
			ctrl.timer -= 5;
		},
			
		gameOver : function(silent){
			ctrl.ticker = 0;
			ctrl.paused = true;
			ctrl.playing = false;
			if(!silent){
				var result = marathonHighscore();
				save_highScores();
				o_results.gamemode = "marathon";
				showGameOver();
				o_results.bigText = "You got to stage " +string(ctrl.stage) + " and invited " + string(ctrl.totalFound) + " guests!";
				o_results.drawMethod = function(elem, pos) {
					return "Attempt #"+string(elem.attempt) + " - Stage " + string(elem.stage) + " ["+string(elem.guests)+"]"
				};
				o_results.highSort = function(a,b){
					return a.stage > b.stage || (a.stage == b.stage && a.guests > b.guests);
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
						if(ctrl.stage < MetaThreshold_lower){
							save_meta(0);
						} else{
							if(ctrl.stage < MetaThreshold_higher){
								save_meta(1);
							} else{
								save_meta(2);
							}
						}
						o_results.highScoreText = "A NEW PERSONAL BEST!";
						break;
					}
				}
				if(ctrl.stage < MetaThreshold_lower){
					o_results.commentary = "That's nice. However, we were kind of hoping for a bigger turnout. Won't you try again and see if you can't at least make it to stage "+string(MetaThreshold_lower)+"?";
				} else {
					if(ctrl.stage < MetaThreshold_higher){
						o_results.commentary = "That's great! There are plenty of people here. However, can you make it the biggest party that's ever been? See if you can't make it to stage "+string(MetaThreshold_higher)+".";
					} else{
						o_results.commentary = "incredible! We knew we could count on you! Go on, the Crimson party is waiting for it's guest of honour! (Assuming you've played all the other Guild Games). See you there!";
					}
				}
			} else{
				ctrl.gamemode = -4;
			}
			with(o_genericHuman){
				hspeed = baseSpeed * sign(hspeed);
			}
			ctrl.paused = true;
			ctrl.playing = false;
		}
	}
}

function marathonHighscore(){
	var attempts = array_length(ctrl.highScores.attempts.marathon);
	var attempt = {
		attempt: attempts + 1,
		stage: ctrl.stage,
		guests: ctrl.totalFound,
		date : date_current_datetime()
	}
	ctrl.highScores.attempts.marathon[attempts] = attempt;
	network_submitAttempt("marathon",attempts + 1, ctrl.stage, ctrl.totalFound);
				
	var bestAttempt = ctrl.highScores.bestAttempt.marathon;
	if(bestAttempt == -1){
		ctrl.highScores.bestAttempt.marathon = attempts;
		return 1;
	} else{
		var champion = ctrl.highScores.attempts.marathon[ctrl.highScores.bestAttempt.marathon];
		if(attempt.stage > champion.stage || (attempt.stage == champion.stage && attempt.guests > champion.guests)){
			ctrl.highScores.bestAttempt.marathon = attempts;
			return 1;
		} else{
			if(attempt.stage == champion.stage && attempt.guests == champion.guests){
				return 0;
			}
		}
	}
	return -1;
				
}