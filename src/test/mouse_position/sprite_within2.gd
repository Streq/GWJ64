extends Sprite

onready var viewport_container : Control = $"../.."

func _process(delta: float) -> void:
	var screen_transform = get_viewport_transform() * get_global_transform()
	
	var rect_pos = viewport_container.get_global_rect().position
	DebugInfo.set_label("OS.get_screen_size()",OS.get_screen_size())
	DebugInfo.set_label("OS.get_real_window_size()",OS.get_real_window_size())
	DebugInfo.set_label("OS.window_size",OS.window_size)
	var scale = (OS.window_size/Global.resolution)
	var min_scale = min(scale.x, scale.y)
	var max_scale = max(scale.x, scale.y)
	var identity = Vector2(1,1)
	
	DebugInfo.set_label("size", scale)
	var mouse_position = get_global_mouse_position()
	global_position = (
		(mouse_position-rect_pos*(min_scale-1.0))/min_scale
	)
	DebugInfo.set_label(name, global_position)
	
