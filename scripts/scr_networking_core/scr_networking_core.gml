enum networkstatus {
	not_initialized,
	initializing,
	connected,
}

global.networking = {
	address : -1,
	requests : new Array(),
	status: networkstatus.not_initialized,
	callbacks : {},
	user : -1
};

function network_init(){
	if !NETWORKING_ENABLED return;
	if(isProd){
		global.networking.address = PRODSERVER;
	} else{
		global.networking.address = DEVSERVER;
	}
	global.networking.headers = boilerPlateHeaders();
	global.networking.status = networkstatus.initializing;
	network_init_ping();
}

function fetch(url, callback){
	if !NETWORKING_ENABLED return;
	var ping = http_get(url);
	global.networking.requests.add(ping);
	global.networking.callbacks[$ ping] = callback;
}

function network_init_ping(){
	if !NETWORKING_ENABLED return;
	fetch(global.networking.address+"/ping",function(results){
		global.networking.status = networkstatus.connected;
		network_getUser();
	});
}

function network_getUser(){
	if !NETWORKING_ENABLED return;
	if(global.networking.status = networkstatus.connected){
		var userKey = global.options.userKey;
		fetch(global.networking.address+"/jam40/player?userKey="+userKey, function(results){
			var user = json_parse(results);
			global.networking.user = user;
			with(textBox){
				if(name == "online_name"){
					title = "Your Display Name [#" + global.networking.user.salt+"]" ;
					text = global.networking.user.name;
				}
			}
		});
		
	}
}

function network_submitAttempt(gamemode, attempt, _score, subscore){
	if !NETWORKING_ENABLED return;
	if(global.networking.status == networkstatus.connected && global.networking.user != -1){
		var body = {
			userKey : global.networking.user.key,
			attemptNr:attempt,
			_score:_score,
			subscore:subscore,
			gamemode: gamemode,
			api_key: API_KEY
		}
		var b = json_stringify(body);
		show_debug_message(b);
		http_request(global.networking.address + "/jam40/attempt","POST",global.networking.headers , b)
	}
}

function network_getHighscores(gamemode, callback){
	if !NETWORKING_ENABLED return;
	fetch(global.networking.address + "/jam40/attempt?gamemode="+gamemode, callback);
}

function network_renameMe(newName){
	if !NETWORKING_ENABLED return;
		if(global.networking.status == networkstatus.connected && global.networking.user != -1){
		var body = {
			userKey : global.networking.user.key,
			name: newName,
			api_key: API_KEY
		}
		var b = json_stringify(body);
		var i = http_request(global.networking.address + "/jam40/player/rename","POST",global.networking.headers , b)

		global.networking.requests.add(i);
		global.networking.callbacks[$ i] = function(){
			o_networker.alarm[0] = 2;
		};
	}
}

function network_getStatistics(gamemode, callback){
	if !NETWORKING_ENABLED return;
	fetch(global.networking.address + "/jam40/attempt/stats?gamemode="+gamemode, callback);
}

function boilerPlateHeaders(){
	var map = ds_map_create();
	ds_map_add(map, "Connection", "close");
	ds_map_add(map, "Cache-Control", "max-age=0");
	return map
}
