extends Node2D

func get_global_mouse_position_for(node: Node2D):
	var viewport = node.get_viewport()
	var parent = viewport.get_parent()

	if parent == null:
		return node.get_global_mouse_position()

	return calc_global_mouse_position_for_embedded_viewport(
		node.get_global_mouse_position(),
		parent.rect_global_position,
		viewport
	)

func calc_global_mouse_position_for_embedded_viewport(
		global_mouse_position, 
		global_rect_position,
		viewport:Viewport
	):
	var window_size = OS.window_size
	var original_display_size = Global.resolution
	var scale = (window_size/original_display_size)
	var min_scale = min(scale.x, scale.y)
	var display_scale = Vector2(min_scale,min_scale)
	
	var margin = window_size - (original_display_size*display_scale)
	
	return (
		(
			+ global_mouse_position 
			- global_rect_position*(min_scale - 1.0) 
			- margin*0.5
			- viewport.canvas_transform.origin
		)/min_scale
	)
