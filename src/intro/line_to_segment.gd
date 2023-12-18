extends Line2D

onready var body = get_parent()

func _ready():
	if !points:
		return
	for i in points.size()-1:
		var collision_shape = CollisionShape2D.new()
		var segment = SegmentShape2D.new()
		segment.a = points[i+0]
		segment.b = points[i+1]
		collision_shape.shape = segment
		collision_shape.transform = self.transform
		body.call_deferred("add_child",collision_shape)

	var old_transform = transform
	for i in points.size():
		points[i] = old_transform.xform(points[i])
	transform = Transform2D.IDENTITY
