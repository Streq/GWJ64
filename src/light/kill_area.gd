extends Area2D




func on_kill_area_entered(body):
	if body.is_in_group("player"):
		body.die()
