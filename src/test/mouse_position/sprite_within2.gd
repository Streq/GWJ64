extends Sprite
onready var viewport_container: ViewportContainer = $"../.."

func _process(delta: float) -> void:
	global_position = MouseUtils.get_global_mouse_position_for(self)
	
	
#	var display_container_position = DebugInfo.get_value("viewport_container_pos")
#	var scale = (OS.window_size/Global.resolution)
#	var min_scale = min(scale.x, scale.y)
#	var display_scale = Vector2(min_scale,min_scale)
#	var original_display_size = Global.resolution
#	var window_size = OS.window_size
#	var margin = OS.window_size-(Global.resolution*display_scale)
#	var mouse_position = get_global_mouse_position()
#
#	global_position = (
#		(
#			+ mouse_position 
#			- display_container_position*(min_scale - 1.0) 
#			- margin*0.5
#		)/min_scale
#	)
#
#
#	DebugInfo.set_label("OS.get_screen_size()",OS.get_screen_size())
#	DebugInfo.set_label("OS.get_real_window_size()",OS.get_real_window_size())
#	DebugInfo.set_label("OS.window_size",OS.window_size)
#	DebugInfo.set_label("margin",margin)
	DebugInfo.set_label("get_viewport_transform() * get_global_transform()", get_viewport_transform() * get_global_transform())
	DebugInfo.set_label("get_viewport_transform() ", get_viewport_transform())
	DebugInfo.set_label(name, global_position)
	DebugInfo.set_label("viewport_canvas_transform", get_viewport().canvas_transform)
	DebugInfo.set_label("mouse_position_within_container", viewport_container.get_local_mouse_position())
#
