extends ViewportContainer


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
onready var viewport: Viewport = $Viewport


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	viewport.size = rect_size


func _process(delta: float) -> void:
	DebugInfo.set_label("viewport_container_pos", rect_global_position)
