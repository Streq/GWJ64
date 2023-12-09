extends Node
signal fade_out_finished()

var song_map = {}
onready var songs: Node = $songs
onready var player: AudioStreamPlayer = $player

var fade : SceneTreeTween
var next_up = []

var current_song := ""

func _ready() -> void:
	fade = create_tween()
	fade.tween_property(player,"volume_db",-80.0,1.5)
	fade.stop()
	fade.connect("finished",self,"_on_tween_finished")

	for song in songs.get_children():
		song_map[song.name] = song.stream
		song.queue_free()
func play(song:String, from:float = 0.0)->void:
	if player.stream == song_map[song] and player.playing:
		player.volume_db = 0.0
		return
	fade.stop()
	player.stream = song_map[song]
	player.play(from)
	current_song = song
	player.volume_db = 0.0

func _on_tween_finished():
	fade.stop()
	emit_signal("fade_out_finished")
	if next_up:
		callv("play", next_up)
		player.volume_db = 0.0

func fade_out():
	if !fade.is_running():
		fade.stop()
		fade.play()
	return fade

func transition(song:String, from:float = 0.0)->void:
	if player.playing and player.stream != song_map[song]:
		fade_out()
		next_up = [song, from]
		return
	play(song, from)



func stop():
	player.stop()

func gradual_stop():
	player.volume_db

func start():
	player.playing = true

