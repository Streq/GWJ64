extends Node2D
class_name RayDisplay

var ray : RayCast2D
var surface_color : Color
var normal : Vector2 = Vector2()
var points := [Vector2(), Vector2()]

export var color : Color
export var width := 2.0

func copy_props(from:RayDisplay):
	color = from.color
	width = from.width

func _ready():
	yield(owner,"ready")
	owner.connect("collision",self,"_on_collision")
	owner.connect("no_collision",self,"_on_no_collision")
	points = PoolVector2Array([Vector2(), Vector2()])

	
func _on_collision(point, normal, color):
#	point = Blur.blur(points[0],point,1024.0)
	points[1] = point
	self.surface_color = color if color.a!=0.0 else self.color
	self.normal = normal
	
func _on_no_collision(point):
#	point = Blur.blur(points[0],point,1024.0)
	points[1] = point
	self.surface_color = Color.transparent

func _process(delta):
	update()

func _draw():
#	draw_ray(self)
#	draw_surface(self)
	pass
func draw(canvas_item, transform := Transform2D.IDENTITY):
	draw_ray(canvas_item, transform)
	draw_surface(canvas_item, transform)
	

func draw_surface(canvas_item : Node2D, transform := Transform2D.IDENTITY):
	if !surface_color.a:
		return
#	var final_color = surface_color
	var final_color = surface_color * color
	final_color.a = surface_color.a
	
	Render.draw_surface_collided_with_local(
		canvas_item, 
		points[1], 
		to_local(normal + global_position), 
		final_color,
		transform
	)

func draw_ray(canvas_item : Node2D, transform := Transform2D.IDENTITY):
	Render.draw_ray_local(
		canvas_item, 
		points[0], 
		points[1], 
		color, 
		width, 
		transform
	)
