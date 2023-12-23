extends Node2D


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	DebugInfo.set_label("pos2", get_global_mouse_position())
