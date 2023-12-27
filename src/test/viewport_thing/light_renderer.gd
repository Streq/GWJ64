extends Node2D

var light : LightSource

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


func sleep():
	set_process(false)
	visible = false
func wake():
	set_process(true)
	visible = true



func follow(light):
	self.light = light
	set_process(true)
	light.connect("tree_exited",self,"sleep")
	light.connect("tree_entered",self,"wake")
func unfollow():
	if is_instance_valid(light):
		light.disconnect("tree_exited",self,"sleep")
		light.disconnect("tree_entered",self,"wake")
	light = null
