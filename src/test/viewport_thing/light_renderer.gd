extends Node2D
export var flashlight_node_path : NodePath
onready var flashlight : Node2D = get_node(flashlight_node_path) as Node2D
var light : LightSource

func _ready():
	if !is_instance_valid(flashlight.light):
		yield(flashlight,"ready") 
	light = flashlight.light
	
	
func _process(delta):
	var screen_transform = light.get_viewport_transform() * light.get_global_transform()
	transform = screen_transform
	update()
func _draw():
	for r in light.ray_instances:
		if !is_instance_valid(r):
			continue
		var ray = r.display
		if !is_instance_valid(ray):
			continue
		ray.draw(self, r.transform)

