extends Node2D

func _physics_process(delta):
	global_position += Input.get_vector("ui_left","ui_right","ui_up","ui_down")*5.0
#	look_at(get_global_mouse_position())
	
