extends ViewportContainer

onready var viewport: Viewport = $Viewport

func _ready() -> void:
	rect_size = Global.main_viewport_resolution
	viewport.size = rect_size
