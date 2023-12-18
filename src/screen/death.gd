extends CanvasLayer


func _ready():
	get_tree().create_timer(5.0).connect("timeout",self,"restart")

func restart():
	get_tree().change_scene("res://src/main.tscn")

func _input(event):
	if event.is_action_pressed("ui_accept"):
		get_tree().change_scene("res://src/main.tscn")
