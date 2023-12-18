extends RayCast2D
class_name Ray

signal collision(point, normal, color)
signal no_collision(point)


onready var display = $"%display"
var active = true

var collision_point = Vector2()

func check_colliding():
	return active and is_colliding()

func _physics_process(delta):
	update_ray()

func update_ray():
	active = true
	force_raycast_update()
	if is_colliding():
		var collider = get_collider()
		var color : Color = Color.transparent
		
		if collider.has_method("_on_ray_entered"):
			collider._on_ray_entered(self)
		if collider.has_method("get_color"):
			color = collider.get_color()
		emit_signal("collision", to_local(get_collision_point()), get_collision_normal(), color)
	else:
		emit_signal("no_collision", cast_to)

	
	
