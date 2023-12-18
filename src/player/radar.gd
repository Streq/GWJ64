extends Area2D

func _ready():
	connect("body_entered",self,"body_entered")
	timer.connect("timeout",self,"disable")

var bodies = {}
onready var timer = $Timer

func enable():
	timer.start()
	set_deferred("monitoring", true)
	set_deferred("monitorable", true)

	for body in bodies.keys():
		body.show_on_radar()

func disable():
	timer.stop()
	set_deferred("monitoring", false)
	set_deferred("monitorable", false)
	for body in bodies.keys():
		if is_instance_valid(body):
			body.hide_on_radar()
	
	bodies.clear()

func body_entered(body):
	if body.is_in_group("ghoul"):
		body.show_on_radar()
		bodies[body] = true
func body_exited(body):
	if is_instance_valid(body):
		if body.is_in_group("ghoul"):
			body.hide_on_radar()
	bodies.erase(body)

