class_name Math
static func approach(val: float, target: float, amount: float) -> float:
	if val == target:
		return target
	elif val > target:
		return clamp(val-amount, target, val)
	else:
		return clamp(val+amount, val, target)
	
static func angle_distance(from:float, to:float):
	var difference: float = fmod(to - from, TAU)
	var distance: float = fmod(2.0 * difference, TAU) - difference
	return distance
	
static func approach_angle(from: float, to: float, amount: float) -> float:
	var result = approach(from, from + angle_distance(from, to), amount)
	return result

static func between(val:float, min_:float, max_:float):
	return val > min_ and val < max_
static func between_inclusive(val:float, min_:float, max_:float):
	return val >= min_ and val <= max_

static func log_lerp_base(from, to, weight, e := 2.71828):
	var exp_from = log(from) / log(e)
	var exp_to = log(to) / log(e)
	var v = pow(e, lerp(exp_from, exp_to, weight))
	return v
static func log_lerp(from, to, weight):
	var exp_from = log(from)
	var exp_to = log(to)
	var v = exp(lerp(exp_from, exp_to, weight))
	return v
