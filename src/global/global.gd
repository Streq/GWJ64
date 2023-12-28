extends Node


export var death_reason: String

onready var resolution = Vector2(
	ProjectSettings.get("display/window/size/width"),
	ProjectSettings.get("display/window/size/height")
)
onready var main_viewport_resolution = resolution * 1.5


onready var default_window_size = resolution
