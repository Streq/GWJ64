extends Area2D


export var reason : String = "You got killed by a ghoul.\nI'm sorry."


func on_kill_area_entered(body):
	if body.is_in_group("player"):
		body.die(self)
