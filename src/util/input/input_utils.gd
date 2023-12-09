class_name InputUtils

static func get_input_dir() -> Vector2:
	return Input.get_vector("ui_left","ui_right","ui_up","ui_down")


static func get_first_key_event(action) -> InputEventKey:
	for e in InputMap.get_action_list(action):
		var event : InputEventKey = e as InputEventKey
		if !event:
			continue
		return event
	printerr("no input key for action '", action, "'")
	return null

static func get_input_map_key(action):
	var event = get_first_key_event(action)
	var scancode = event.scancode if event.scancode else event.physical_scancode
	return OS.get_scancode_string(scancode)

static func set_input_map_key(action: String, scancode: int, physical_scancode:= 0):
	var event = InputMap.get_action_list(action)[0]
	event.scancode = scancode
	event.physical_scancode = physical_scancode
