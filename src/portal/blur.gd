extends Node
class_name Blur


static func blur(start:Vector2,end:Vector2,factor:float):
	var dist : Vector2 = end-start
	var dist_factor = dist.length()/factor
	var dist_deviated = dist.rotated(rand()*deg2rad(dist_factor))
	
	var offset = Vector2(rand(),rand()).limit_length() * dist_factor
	
	
	end = start + dist_deviated + offset
	return end
	
static func rand():
	return rand_range(-1.0, 1.0)
