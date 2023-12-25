extends Node2D


func _physics_process(delta):
	global_position = MouseUtils.get_global_mouse_position_for(self)
