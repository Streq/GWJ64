extends Area2D


export var reason : String = "You fell to your death."


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered",self,"body_entered")

func body_entered(body):
	body.die(self)


