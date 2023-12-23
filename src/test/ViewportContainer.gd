extends ViewportContainer


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
onready var viewport: Viewport = $Viewport


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	viewport.size = rect_size
