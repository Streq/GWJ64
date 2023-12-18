extends KinematicBody2D
signal grabbed

func _on_grab_area_body_entered(body):
	if body.is_in_group("player"):
		body.radar.enable()
		queue_free()
		body.radar_grabbed()
