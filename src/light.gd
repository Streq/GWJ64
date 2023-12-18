extends Node2D
class_name LightSource

signal process_ray(ray_instance, side, index, rays_amount_halved, vision_arc_rads)


export var RAY : PackedScene
export var rays : int = 100
export var vision_arc_degrees : float = 360.0
export var ray_length = 270.0


export var MAX_WIDTH = 360
export var MIN_WIDTH = 5
export var MAX_LENGTH = 270
export var MIN_LENGTH = 200

export var MAX_RAYS = 128
export var MIN_RAYS = 0



var ray_instances = []
# Called when the node enters the scene tree for the first time.
func _ready():
	adjust()

func add_new_ray():
	var ray_instance : RayCast2D = RAY.instance()
	call_deferred("add_child",ray_instance)
	ray_instances.append(ray_instance)	
export var width_to_length_curve : Curve
export var length_to_alpha_curve : Curve

func adjust():
#	var interpolate = width_to_length_curve.interpolate_baked(inverse_lerp(MAX_WIDTH, MIN_WIDTH, vision_arc_degrees))
#	ray_length = lerp(MIN_LENGTH, MAX_LENGTH, interpolate)
	
	while rays > ray_instances.size():
		add_new_ray()
	
	for ray in ray_instances:
		ray.cast_to = Vector2.ZERO
	
	var vision_arc_rads = deg2rad(vision_arc_degrees)/2
	var offset_from_blindspot = -vision_arc_rads/2
	var half_rays = self.rays/2
	var iterator = 0
	for side in [-1.0,1.0]:
		var offset = 1 if side == -1.0 else 0 
		for i in range(offset, half_rays+offset):
			var ray_instance = ray_instances[iterator]
			emit_signal("process_ray", ray_instance, side, i, half_rays, vision_arc_rads)
			iterator+=1

func process_ray(ray_instance, side, index, rays_amount_halved, vision_arc_rads):
	ray_instance.rotation = index * side * vision_arc_rads / rays_amount_halved
	var length = ray_length * (1.0 - 0.25 * pow(float(index) / rays_amount_halved, 2.0))
#	var length = ray_length
	ray_instance.cast_to = Vector2.RIGHT * length
	var alpha = length_to_alpha_curve.interpolate_baked(inverse_lerp(MIN_LENGTH, MAX_LENGTH, length))
	set_alpha(ray_instance, alpha)


func set_alpha(ray, val):
	if !is_instance_valid(ray.display):
		yield(ray, "ready")
	ray.display.color.a = val
