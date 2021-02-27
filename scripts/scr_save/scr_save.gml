function load_highScores(){
	    // ensure that value to be saved is actually a progress compared to existing metadata
    var existing_buffer = buffer_load("scores.data");
    if (existing_buffer != -1) {
        var json = buffer_read(existing_buffer, buffer_string);
        buffer_delete(existing_buffer)
        ctrl.highScores = json_parse(json);
    } else{
		ctrl.highScores = {
			attempts:{
				marathon:[],
				fastest_10:[],
				fastest_25:[],
				fastest_50:[]
			},
			bestAttempt:{				
				marathon:-1,
				fastest_10:-1,
				fastest_25:-1,
				fastest_50:-1
			}
		}
		save_highScores();
	}
}

function save_highScores(){
	var json = json_stringify(ctrl.highScores);
	var buffer = buffer_create(1, buffer_grow, 1);
    buffer_write(buffer, buffer_string, json);
    buffer_save(buffer, "scores.data");
    buffer_delete(buffer);
}

function save_meta(value) {
    // ensure that value to be saved is actually a progress compared to existing metadata
    var existing_buffer = buffer_load("meta.data");
    if (existing_buffer != -1) {
        var current_value = buffer_read(existing_buffer, buffer_string);
        buffer_delete(existing_buffer)
        if (real(current_value) > value)
            exit;
    }

    // once the value is confirmed to be a progress, save it to meta.data file
    var string_value = string(value);
    var buffer = buffer_create(1, buffer_grow, 1);
    buffer_write(buffer, buffer_string, string_value);
    buffer_save(buffer, "meta.data");
    buffer_delete(buffer);
}