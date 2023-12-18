extends Node2D

onready var portal = $portal

onready var raycast = $RayCast2D

# Called when the node enters the scene tree for the first time.
func _ready():
	queue_free()
	yield(get_tree(),"idle_frame")
	NodeUtils.reparent_keep_transform(portal.entrance0,owner)
	NodeUtils.reparent_keep_transform(portal.entrance1,owner)

func _process(delta):
	if raycast.is_colliding():
		if Input.is_action_just_pressed("shoot"):
			portal.entrance0.global_position = raycast.get_collision_point()
			portal.entrance0.global_rotation = raycast.get_collision_normal().angle()
		
		if Input.is_action_just_pressed("shoot2"):
			portal.entrance1.global_position = raycast.get_collision_point()
			portal.entrance1.global_rotation = raycast.get_collision_normal().angle()
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
