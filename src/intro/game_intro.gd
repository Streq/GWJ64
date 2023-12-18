extends Node2D

var arr = []

var light_switch_array = [0.55, 0.833333, 1, 1.15, 1.466667, 2.05, 2.35]

onready var helios = $"%HELIOS"
onready var bystreq = $"%bystreq"


onready var walls = $walls

var i = 0
var time = 0.0

var light_layer = 0

func hide_body(body):
	body.hide()
	body.collision_layer = 0

func show_body(body):
	body.show()
	body.collision_layer = light_layer

func flip_body(body):
	body.collision_layer = light_layer if !body.collision_layer else 0
	body.visible = !body.visible

func _ready():
	light_layer = helios.collision_layer
	hide_body(bystreq)
	hide_body(helios)
func _physics_process(delta):
	time += delta
#	if Input.is_action_just_pressed("ui_accept"):
#		arr.append(time)
#		walls.visible = !walls.visible
#		print(arr)
	if i < light_switch_array.size() and time > light_switch_array[i]:
		i += 1
		flip_body(helios)
	if time > 3.0:
		show_body(bystreq)
		
	if time > 7.0 or Input.is_action_just_pressed("ui_accept"):
		hide()
		get_tree().change_scene("res://src/main.tscn")
#
	
