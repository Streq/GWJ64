extends State

signal animation_finished()

export var light_target := 0.5

export var delta_factor := 1.0

func _physics_update(delta):
	root.light_value = Math.approach(root.light_value, light_target, delta*delta_factor)
