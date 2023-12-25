extends Camera2D


func _process(delta: float) -> void:
	global_position += 10.0*delta*Input.get_vector("ui_left","ui_right","ui_up","ui_down")
