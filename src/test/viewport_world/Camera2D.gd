extends Camera2D


func _process(delta):
	global_position = get_viewport().get_mouse_position()*0.5
