extends Camera2D

func change_visible():
	for child in get_children():
		if "visible" in child:
			child.visible = visible

func _ready() -> void:
	connect("visibility_changed", self, "change_visible")
	change_visible()
