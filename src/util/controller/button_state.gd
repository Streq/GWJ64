extends Reference
class_name ButtonState

var pressed := false setget set_pressed
var just_updated := false
var frames_since_update := 0

func set_pressed(val:bool):
	just_updated = pressed!=val
	if just_updated:
		frames_since_update = 0
	pressed = val
func press():
	set_pressed(true)
func release():
	set_pressed(false)

func is_just_pressed(grace_frames := 0):
	return pressed and (just_updated or grace_frames >= frames_since_update)
func is_just_released(grace_frames := 0):
	return !pressed and (just_updated or grace_frames >= frames_since_update)
func is_pressed():
	return pressed
func stale():
	just_updated = false
	frames_since_update += 1

func copy_from(state: ButtonState):
	pressed = state.pressed
	just_updated = state.just_updated
	frames_since_update = state.frames_since_update

func clear():
	pressed = false
	just_updated = false

func _to_string() -> String:
	return "(pressed:%s,just_updated:%s)" % [pressed,just_updated]
