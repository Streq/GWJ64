extends KinematicBody2D
signal radar_grabbed


onready var radar = $radar

func die(by:Node = null):
	Global.death_reason = by.reason
	get_tree().change_scene("res://src/screen/death.tscn")
	
func _physics_process(delta):
	var dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	move_and_slide(dir.rotated(global_rotation)*100)


func radar_grabbed():
	emit_signal("radar_grabbed")
