extends CanvasLayer

onready var container: VBoxContainer = $container

var log_entities = {}


func _add_label(key):
	var label = Label.new()
	log_entities[key] = label
	container.call_deferred("add_child",label)

func set_label(key, text):
	if !log_entities.has(key):
		_add_label(key)
	log_entities[key].text = str(text)
