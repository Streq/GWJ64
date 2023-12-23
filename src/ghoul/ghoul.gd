extends KinematicBody2D


var rays = 0
var health = 1920
export var color : Color

var triggered := false

func get_color():
	return color

onready var die_particles = $"%die_particles"

onready var detect_particles = $"%detect_particles"

func show_on_radar():
	detect_particles.emitting = true

func hide_on_radar():
	detect_particles.emitting = false
	

func _ready():
	die_particles.set_physics_process(false)

func _physics_process(delta):
	if rays > 32:
		health -= rays
	rays = 0
	if health <= 0:
		die()
	if !triggered:
		return
	var player : Node2D = Group.get_one("player")
	if !is_instance_valid(player):
		return
	
	look_at(player.global_position)
	move_and_slide(Vector2.RIGHT.rotated(rotation)*50.0)


func _on_ray_entered(ray: Ray):
	rays += 1


func _on_trigger_area_body_entered(body):
	if body.is_in_group("player"):
		triggered = true

func die(reason:Node = null):
	NodeUtils.reparent_keep_transform(die_particles,get_parent())
	die_particles.set_physics_process(true)
	die_particles.emitting = true
	Screenshake.shake(Vector2.DOWN.rotated(global_rotation)*8.0, 1.0)
	
	queue_free()
