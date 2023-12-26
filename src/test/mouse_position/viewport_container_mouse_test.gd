extends Node2D

onready var viewport_container = $ViewportContainer

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_accept"):
		Input.warp_mouse_position(viewport_container.rect_global_position)
#	DebugInfo.set_label("pos2", get_global_mouse_position())


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
	if event is InputEventKey:
		var key_event = event as InputEventKey
		if key_event.is_pressed():
			if map.has(key_event.scancode):
				OS.window_size.x = Global.default_window_size.x * map[key_event.scancode]
