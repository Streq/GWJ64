extends TextureProgress

export var node_path : NodePath

onready var timer : Timer = get_node(node_path) as Timer


func _process(delta):
	if !timer.is_stopped():
		ratio = timer.time_left/timer.wait_time
	else:
		ratio = 0.0
