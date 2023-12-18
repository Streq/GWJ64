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
