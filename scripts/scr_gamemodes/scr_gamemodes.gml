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
			timer = 60;
		},
			
		tick : function(){
			if(timer > 99){
				timer = 99;
			}
			timer-= 1/room_speed;
			if(timer <= 0){
				gameOver();
			}
		},
			
		draw : function(){
				var tens = timer div 10;
				var ones = timer % 10;
				draw_sprite(s_segments,tens,0,0);
				draw_sprite(s_segments,ones,64,0);
		},
			
		successClick : function(){
		},
			
		failedClick : function(){
		},
			
		gameOver : function(){
		}
	}
);

function gameModeGet(gameMode){
	return global.gameModeStructs[$ gameMode]
}