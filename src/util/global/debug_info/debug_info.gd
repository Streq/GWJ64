extends CanvasLayer

onready var container: VBoxContainer = $container

var log_entities = {}
var log_values = {}

func _add_label(key):
	var label = Label.new()
	log_entities[key] = label
	container.call_deferred("add_child",label)

func set_label(key, value):
	_set_label("{0}: {1}", key, value)
func set_label_no_key(key, value):
	_set_label("{1}", key, value)

func _set_label(format, key, value):
	if !log_entities.has(key):
		_add_label(key)
	log_values[key] = value
	log_entities[key].text = format.format([key, str(value)])

func get_value(key):
	return log_values[key]
