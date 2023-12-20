extends Node2D

export var texture: Texture

func _process(delta):
	update()
	
func _draw():
	var radius = 270
	var half_width :float = 1.0
	var pol = PoolVector2Array([Vector2(-half_width,0),Vector2(half_width,0),Vector2(half_width,radius), Vector2(-half_width,radius)])
	var cols_a = []
	cols_a.resize(4)
	cols_a.fill(Color.white)
	var cols = PoolColorArray(cols_a)
	var rays : int = 64*4
	
	var arc : float = 90.0*4
	for i in rays:
		var transform = Transform2D(deg2rad(float(i)/rays*arc),Vector2())
		var pol_x = transform.xform(pol)
		var uv_pol_x : PoolVector2Array = pol_x
#		var color : Color = [Color.cyan,Color.yellow,Color.magenta][randi()%3]
		var color : Color = Color.white
		color.a = 0.2
		cols.fill(color)
	
#		for j in uv_pol_x.size():
#			var v = uv_pol_x[j]
#			v += global_position
#			uv_pol_x[j] = Vector2(
#				range_lerp(v.x, 0, texture.get_width(), 0, 1.0),
#				range_lerp(v.y, 0, texture.get_height(), 0, 1.0)
#			)
#
			
		draw_polygon(pol_x, cols, uv_pol_x, texture)
