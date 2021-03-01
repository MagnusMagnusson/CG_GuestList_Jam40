var _id = ds_map_find_value(async_load, "id")
var pos = global.networking.requests.find(_id)
if (pos > -1){
   if (ds_map_find_value(async_load, "status") == 0){
      global.networking.callbacks[$ _id](ds_map_find_value(async_load, "result"));
	  global.networking.requests.remove(pos);
	  global.networking.callbacks[$ _id] = -4;
	}
}