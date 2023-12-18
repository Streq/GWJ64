extends Node2D

onready var state_machine = $"%state_machine"

onready var light = $"%light"


export var width_curve : Curve
export var length_curve : Curve
export var weight_curve : Curve

var light_value := 0.0

func _ready():
	get_parent().weighted_items[self] = true
	state_machine.initialize()

func _physics_process(delta):
	
	if Input.is_action_pressed("shoot"):
		state_machine.current.goto("focused")
	elif Input.is_action_pressed("shoot2"):
		state_machine.current.goto("dim")
	else:
		state_machine.current.goto("normal")
	var old_value = light_value
	state_machine.physics_update(delta)
	if old_value == light_value:
		return
	light.vision_arc_degrees = width_curve.interpolate(light_value)
	light.ray_length = length_curve.interpolate(light_value)
	
	light.adjust()

func get_weight():
	return weight_curve.interpolate(light_value)

func process_ray(ray_instance, side, index, rays_amount_halved, vision_arc_rads):
	state_machine.current.process_ray(ray_instance, side, index, rays_amount_halved, vision_arc_rads)
