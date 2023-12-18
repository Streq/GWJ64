extends CPUParticles2D

var started = false


func _physics_process(delta):
	if emitting:
		started = true
	if started and !emitting:
		queue_free()
