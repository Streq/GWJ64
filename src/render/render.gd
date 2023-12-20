extends Node
class_name Render

static func draw_surface_collided_with(canvas_item:Node2D, global_point:Vector2, normal:Vector2, color:Color):
#	points[1] = Blur.blur(points[0],points[1],64.0)
	if color.a:
#		draw_circle(points[1],1,color)
		var tangent = normal.tangent()*1.5
		canvas_item.draw_line(
				canvas_item.to_local(global_point-tangent), 
				canvas_item.to_local(global_point+tangent), 
				color, 
				1
			)
static func draw_ray(item:Node2D, global_start:Vector2, global_end:Vector2, color:Color, width:float):
	item.draw_line(
			item.to_local(global_start), 
			item.to_local(global_end), 
			color, 
			width
		)
static func draw_ray_local(item:Node2D, local_start:Vector2, local_end:Vector2, color:Color, width:float, transform : Transform2D = Transform2D.IDENTITY):
	item.draw_line(
			transform.xform(local_start),
			transform.xform(local_end), 
			color, 
			width
		)
static func draw_surface_collided_with_local(
	canvas_item:Node2D, 
	local_point:Vector2, 
	local_normal:Vector2, 
	color:Color, 
	transform : Transform2D = Transform2D.IDENTITY
):
	if color.a:
		var tangent = local_normal.tangent()*1.5
		canvas_item.draw_line(
				transform.xform(local_point-local_normal-tangent), 
				transform.xform(local_point-local_normal+tangent),
				color, 
				1.0
			)
