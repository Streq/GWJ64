extends TileMap

func _on_ray_entered(ray: RayCast2D):
	return

func get_color():
	return Color.white

export var should_hide:=true
func _ready():
	if should_hide:
		hide()
	pass
