extends Node2D

var entrance0 : Entrance
var entrance1 : Entrance

# Called when the node enters the scene tree for the first time.
func _ready():
	setup()

func setup():
	for child in get_children():
		if child is Entrance:
			if !is_instance_valid(entrance0) and child != entrance1:
				entrance0 = child
				continue
			if !is_instance_valid(entrance1) and child != entrance0:
				entrance1 = child
				break

	if !is_valid():
		return
	connect_entrance(entrance0, entrance1)
	connect_entrance(entrance1, entrance0)

func connect_entrance(entrance0, entrance1):
	entrance0.connect("ray_entered",entrance1,"re_emit_ray")
	entrance0.connect("ray_exited",entrance1,"exit_ray")
	entrance0.connect("warp",entrance1,"warp",[entrance0])
	
func _process(delta):
	update()

func is_valid():
	return is_instance_valid(entrance0) and is_instance_valid(entrance1)
	
const colors = [Color.cyan, Color.magenta, Color.yellow]
func _draw():
	if !is_valid():
		return
	for entrances in [[entrance0, entrance1], [entrance1, entrance0]]:
		var entry = entrances[0]
		var exit = entrances[1]
		for ray in entry.ray_map.values():
			if !ray.visible:
				continue
			var line : RayDisplay = ray.display
			var start = exit.to_global(-entry.to_local(line.to_global(line.points[0])))
			var end = exit.to_global(-entry.to_local(line.to_global(line.points[1])))
			
#			draw_line(start, end, line.default_color)
#			draw_line(start, end, Color(randf(),randf(),randf()))
#			draw_line(start, end, Color8(255*(randi()%2), 255*(randi()%2), 255*(randi()%2),255))
#			end = Blur.blur(start, end, 256.0)
			
			var color = colors[randi()%colors.size()]
			color.a = line.color.a*2.0
			
			Render.draw_ray(self, start, end, line.color/2+color, line.width)
			
			if line.color.a:
				Render.draw_surface_collided_with(self, end, line.normal, line.surface_color)
		
		
		
func rand():
	return rand_range(-1,1)
