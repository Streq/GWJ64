extends ViewportContainer

onready var viewport: Viewport = $Viewport

func _ready() -> void:
	print(viewport.size)
	viewport.size = rect_size
