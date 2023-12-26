extends Node2D
# workaround for mouse input within viewport containers 
func get_global_mouse_position_for(node: Node2D):
	var viewport = node.get_viewport()
	var parent = viewport.get_parent()

	if parent == null:
		return node.get_global_mouse_position()

	return calc_global_mouse_position_for_viewport_container(node)

func calc_global_mouse_position_for_viewport_container(node:Node2D):
	var viewport = node.get_viewport()
	var viewport_container : ViewportContainer = viewport.get_parent()
	if !is_instance_valid(viewport_container):
		return node.get_global_mouse_position()
	var mouse_screen_position = viewport_container.get_local_mouse_position()
	return node.get_viewport_transform().xform_inv(mouse_screen_position)


func get_screen_transform(node:Node2D)->Transform2D:
	return node.get_viewport_transform() * node.get_global_transform()
