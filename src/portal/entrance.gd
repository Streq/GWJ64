extends Area2D
class_name Entrance


signal ray_entered(ray, local_entry_point, local_depth)
signal ray_exited(ray)

signal warp(body)


var entering_rays = {}

func _ready():
	hide()
	connect("body_entered",self,"_on_body_entered")

func _on_body_entered(body):
#	if overlapping.has(body):
#		overlapping.erase(body)
#		return
		
	emit_signal("warp", body)


func _on_ray_entered(ray: RayCast2D):
	var normal = ray.get_collision_normal()
	if !coming_from_the_front(normal):
		return
	
	var global_point_of_collision = ray.get_collision_point()
	var global_cast_to = ray.to_global(ray.cast_to)
	
	var local_entry_point = to_local(global_point_of_collision)
	var local_depth = to_local(global_cast_to) - local_entry_point
	
	
#	print("ray entered at %s, with cast_to %s".format([local_point_of_collision, local_cast_to], "%s"))
	entering_rays[ray] = true
	emit_signal("ray_entered", ray, local_entry_point, local_depth)

const colors = [Color.red, Color.blue, Color.green]
func get_color():
	return colors[randi()%colors.size()]

func _on_ray_exited(ray:RayCast2D):
	entering_rays.erase(ray)
	emit_signal("ray_exited", ray)
	

func _physics_process(delta):
	for _r in entering_rays.keys():
		var ray : RayCast2D = _r
		if !ray.check_colliding() or ray.get_collider() != self:
			_on_ray_exited(ray)

const HALF_PI := PI/2.0
func coming_from_the_front(normal: Vector2)->bool:
	var normal_angle = normal.angle()
	var dist = Math.angle_distance(normal_angle, global_rotation)
	return abs(dist)<HALF_PI

var ray_map : Dictionary = {}
var original_ray_map : Dictionary = {}
func re_emit_ray(ray:RayCast2D, local_entry_point:Vector2, local_depth:Vector2):
	if !ray_map.has(ray):
		var packed : PackedScene = load(ray.filename)
		var new_ray = packed.instance()
		
		add_child(new_ray)
		
		NodeUtils.pause(new_ray, false)
		new_ray.hide()
		ray_map[ray] = new_ray
		original_ray_map[new_ray] = ray
		
	var saved_ray : Ray = ray_map[ray]
	saved_ray.display.copy_props(ray.display)
	saved_ray.position = Vector2(local_entry_point.x,-local_entry_point.y)
	saved_ray.cast_to = -local_depth
	saved_ray.show()
	saved_ray.update_ray()
	pass

func exit_ray(ray:RayCast2D):
	if !ray_map.has(ray):
		return

	var saved_ray : RayCast2D = ray_map[ray]
	saved_ray.hide()
	saved_ray.cast_to = Vector2.ZERO
	saved_ray.active = false
	pass

var overlapping = {}

func warp(body:Node2D, portal_from:Node2D):
	var pos = portal_from.to_local(body.global_position)
	var angle_difference = Math.angle_distance(portal_from.global_rotation+PI, self.global_rotation)
	body.global_rotation += angle_difference
	body.global_position = self.to_global(Vector2(max(pos.x,4.0), -pos.y)) 
	if body.is_in_group("player"):
		Screenshake.shake(Vector2.DOWN.rotated(body.global_rotation)*8.0, 2.0)
		
#	overlapping[body] = true
	
	
	
