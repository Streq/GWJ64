extends Sprite


func _process(delta: float) -> void:
	var screen_transform = get_viewport_transform() * get_global_transform()
	global_position = get_global_mouse_position()
	DebugInfo.set_label(name, global_position)
