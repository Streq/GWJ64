extends Node2D

onready var viewport_container = $ViewportContainer

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_accept"):
		Input.warp_mouse_position(viewport_container.rect_global_position)
#	DebugInfo.set_label("pos2", get_global_mouse_position())
	pass
