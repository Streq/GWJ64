extends Node

func _ready() -> void:
	pause_mode = PAUSE_MODE_PROCESS


const map = {
	KEY_0 : 1.0,
	KEY_1 : 1.1,
	KEY_2 : 1.2,
	KEY_3 : 1.3,
	KEY_4 : 1.4,
	KEY_5 : 1.5,
	KEY_6 : 1.6,
	KEY_7 : 1.7,
	KEY_8 : 1.8,
	KEY_9 : 1.9,
	KEY_Q : 2.0
}

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("restart"):
		get_tree().paused = false
		get_tree().reload_current_scene()
	if event.is_action_pressed("fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
	if event.is_action_pressed("pause"):
		get_tree().paused = !get_tree().paused

	if !OS.is_debug_build():
		return
	if event.is_action_pressed("exit"):
		get_tree().quit()
	if event is InputEventKey:
		var key_event = event as InputEventKey
		if key_event.is_pressed() and map.has(key_event.scancode):
			OS.window_size.x = Global.default_window_size.x * map[key_event.scancode]
