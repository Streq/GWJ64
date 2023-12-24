extends CanvasLayer

onready var container: VBoxContainer = $container

var log_entities = {}


func _add_label(key):
	var label = Label.new()
	log_entities[key] = label
	container.call_deferred("add_child",label)

func set_label(key, text):
	_set_label("{0}: {1}", key, text)
func set_label_no_key(key, text):
	_set_label("{1}", key, text)

func _set_label(format, key, text):
	if !log_entities.has(key):
		_add_label(key)
	log_entities[key].text = format.format([key, str(text)])
