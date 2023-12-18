extends Control


onready var rays = $rays
onready var angle = $angle
onready var ray_length = $ray_length

export var light_path : NodePath
onready var light : LightSource = get_node(light_path)

func _process(delta):
	if !OS.is_debug_build():
		queue_free()
	rays.text = "rays: %s".format([light.rays], "%s")
	angle.text = "vision_arc_degrees: %s".format([light.vision_arc_degrees], "%s")
	ray_length.text = "ray_length: %s".format([light.ray_length], "%s")
