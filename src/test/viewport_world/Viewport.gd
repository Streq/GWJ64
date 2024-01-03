extends Viewport


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(owner,"ready")
	world_2d = Group.get_one("vp").world_2d
