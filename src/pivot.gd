extends Node2D
var weighted_items := {}


func _physics_process(delta):
#	look_at(get_global_mouse_position())
	var weight = 1.0 + get_weight()
	global_rotation = lerp_angle(global_rotation, (get_global_mouse_position() - global_position).angle(), delta*10.0/weight)

	pass
	

func get_weight():
	var accum_weight := 0.0
	for weight in weighted_items.keys():
		accum_weight += weight.get_weight()
	return accum_weight
