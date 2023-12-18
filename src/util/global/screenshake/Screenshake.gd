extends Node


func shake(vec:Vector2, delta:float, frames_per_shake:int = 1):
	var camera := _find_camera()
	if !camera:
		return
	_shake_camera(camera, vec, delta, frames_per_shake)

func _find_camera() -> Camera2D:
	var camera : Camera2D = null
	for cam in Group.get_all("player_camera"):
		if cam.current:
			camera = cam
			break
	return camera

var shaking = false
func _shake_camera(camera: Camera2D, vec:Vector2, delta:float, frames_per_shake:int = 1):
	if shaking:
		return
	shaking = true
#	var offset = 8.0
	var offset_sign = 1.0 
	while !vec.is_equal_approx(Vector2.ZERO) and is_instance_valid(camera):
		camera.offset = vec*offset_sign
		vec = vec.move_toward(Vector2.ZERO, delta)
		offset_sign = -offset_sign
		for i in frames_per_shake:
			yield(get_tree(),"idle_frame")
	if is_instance_valid(camera):
		camera.offset = Vector2()
	shaking = false

#func _input(event: InputEvent) -> void:
#	if event.is_action_pressed("A"):
#		shake(Vector2(4,0).rotated(randf()*TAU),1.0,2)
