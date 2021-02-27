enum GameModes {
	MARATHON,
	FASTHOST_10,
	FASTHOST_25,
	FASTHOST_50,
	FINDTHEGUEST
}


global.GameModeStructs = {
}

var addGameMode = function(gamemode, struct){
	global.GameModeStructs[$ gamemode] = struct;
}

addGameMode(GameModes.MARATHON,{
		setup : function(){
			with(ctrl){
				surf_night = noone;
				timer = 5;
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
				timer-= 1/room_speed;
				if(timer <= 0){
					gameOver(false);
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
				draw_set_font(fnt_consolas_18);
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
				
				draw_set_font(fnt_consolas_16);
				draw_text(128+64+64,room_height - 32, instructions);
				
				draw_set_font(fnt_consolas_18);
				draw_text(hud_width - 256,room_height - 32, time);
				draw_text((hud_width / 2) + 32,room_height - 32, stage);
				draw_reset();
		},
			
		successClick : function(guest, pos){
			with(ctrl){
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
					with(o_walking_left_human){
						if(c == i){
							var clown = instance_create_layer(x,y,layer,o_clown);
						}
						i++;
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
			
			if(!silent){
				var result = marathonHighscore();
				save_highScores();
				showGameOver();
				o_results.bigText = "You got to stage " +string(ctrl.stage) + " and invited " + string(ctrl.totalFound) + " guests!";
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
					o_results.commentary = "That's nice. However, we were kind of hoping for a bigger turnout. Won't you try again and see if you can't at least make it to stage 10?";
				} else {
					if(ctrl.stage < MetaThreshold_higher){
						o_results.commentary = "That's great! There are plenty of people here. However, can you make it the biggest party that's ever been? See if you can't make it to stage 20.";
					} else{
						o_results.commentary = "Incredilbe! We knew we could count on you! Go on, the Crimson party is waiting for it's guest of honour! (Assuming you've played all the other Guild Games). See you there!";
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
);

function gameModeGet(gameMode){
	return global.GameModeStructs[$ gameMode]
}