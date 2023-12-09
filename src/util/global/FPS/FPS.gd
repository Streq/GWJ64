extends Node

export var value := -1.0 setget set_value

const BASE_FPS := 60.0
const FAST_FPS := 240.0
const SLOW_FPS := 15.0


func set_value(val):
	value = val
	if val >= 0.0:
		Engine.target_fps = val
		Engine.time_scale = val / BASE_FPS
		Engine.iterations_per_second = val
		#change audio_speed
		AudioServer.global_rate_scale = BASE_FPS / float(value)
		match value:
			FAST_FPS, SLOW_FPS:
				AudioServer.set_bus_volume_db(0, -10.0)
			BASE_FPS:
				AudioServer.set_bus_volume_db(0, 0.0)
			
#		var effect: AudioEffectPitchShift = AudioServer.get_bus_effect(0, 0)
#		effect.pitch_scale = AudioServer.global_rate_scale
#		effect.oversampling = 100
#		effect.fft_size = 100
		
#		AudioServer.set_bus_effect_enabled(0, 0, effect.pitch_scale != 1.0)
#		AudioServer.set_bus_effect_enabled(0, 0, false)


func _physics_process(delta):
	set_value(BASE_FPS)
	if !OS.is_debug_build():
		return
	if Input.is_action_pressed("speed_up"):
		set_value(FAST_FPS)

	if Input.is_action_pressed("speed_down"):
		set_value(SLOW_FPS)
