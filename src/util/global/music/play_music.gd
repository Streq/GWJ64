extends Node

export var song := ""
export var from := 0.0
export var transition := false
export var autotrigger := false

func _ready() -> void:
	if autotrigger:
		trigger()

func trigger():
	if transition:
		Music.transition(song, from)
	else:
		Music.play(song, from)

func stop():
	Music.stop()
