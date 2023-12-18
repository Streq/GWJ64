extends Label

onready var timer : Timer = $Timer
func _ready():
	var player = Group.get_one("player")
	if !is_instance_valid(player):
		return
	
	player.connect("radar_grabbed", self, "radar_grabbed")


func radar_grabbed():
	timer.start()
	show()
