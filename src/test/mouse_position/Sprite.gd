extends Sprite


func _process(delta: float) -> void:
	global_position = get_global_mouse_position()
	DebugInfo.set_label("pos", global_position)
