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
				if(timer > 99){
					timer = 99;
				}
				timer-= 1/room_speed;
				if(timer <= 0){
					gameOver(false);
				}
			}
		},
			
		draw : function(){
				draw_crimsonBox(0,room_height - 64,room_width,room_height);
				draw_set_color(c_black);
				draw_text(64,room_height - 32, "Time: 60");
		},
			
		successClick : function(guest, pos){
			with(ctrl){
				timer += 5;
				guestList.get(pos).done = true;
				found++;
				totalFound++;
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
			var award = instance_create_layer(guest.x, guest.y - 5, layer_get_name("il_heaven"),o_award);
			award.text = "-5";
			award.color = c_red;
			ctrl.timer -= 5;
		},
			
		gameOver : function(silent){
			if(!silent){
				show_message("Game Over! \n You got to stage " + string(ctrl.stage) + " and invited " +string(ctrl.totalFound) + " guests! Hurrah! (Placeholder result screen)");
			}
			with(o_genericHuman){
				hspeed = baseSpeed * sign(hspeed);
			}
			ctrl.paused = true;
			ctrl.playing = false;
			ctrl.gamemode = -4;
			layer_set_visible(layer_get_id("MainMenu"),true);
		}
	}
);

function gameModeGet(gameMode){
	return global.GameModeStructs[$ gameMode]
}