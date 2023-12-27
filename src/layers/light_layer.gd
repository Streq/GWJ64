extends CanvasLayer

export var LIGHT_RENDERER : PackedScene

onready var viewport: Viewport = $"%Viewport"

var renderers = {}

func _ready() -> void:
	for light in Group.get_all("light"):
		call_deferred("register_light", light)

func register_light(light):
	var renderer = LIGHT_RENDERER.instance()
	renderer.follow(light)
	viewport.add_child(renderer)
	renderers[light] = renderer
