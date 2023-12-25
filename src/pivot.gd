extends Node2D
var weighted_items := {}


func _physics_process(delta):
#	look_at(get_global_mouse_position())
	var weight = 1.0 + get_weight()
#	print(get_global_mouse_position())
	var screen_transform = get_viewport_transform()
	
	var global_mouse_position = calc_global_mouse_position()
	
	DebugInfo.set_label(
	"pov_pivot",get_debug_info())
	
	global_rotation = lerp_angle(global_rotation, (get_global_mouse_position() - global_position).angle(), delta*10.0/weight)

	pass
	

func get_weight():
	var accum_weight := 0.0
	for weight in weighted_items.keys():
		accum_weight += weight.get_weight()
	return accum_weight


func calc_global_mouse_position():
	return MouseUtils.get_global_mouse_position_for(self)

const debug_string = """
global_mouse_position:{}
local_mouse_position:{}
get_viewport_transform():{}
viewport_mouse_position:{}
viewport_final_transform:{}
"""

func get_debug_info():
	return (debug_string.format([
		get_global_mouse_position(),
		get_local_mouse_position(),
		get_viewport_transform(),
		get_viewport().get_mouse_position(),
		get_viewport().get_final_transform()
	],"{}")
	)
