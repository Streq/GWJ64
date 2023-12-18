extends Area2D
signal win



func win():
	emit_signal("win")

func _on_body_entered(body):
	if body.is_in_group("player"):
		win()
