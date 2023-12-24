extends Node


export var death_reason: String

onready var resolution = Vector2(
	ProjectSettings.get("display/window/size/width"),
	ProjectSettings.get("display/window/size/height")
)
