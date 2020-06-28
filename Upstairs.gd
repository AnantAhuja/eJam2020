extends Node2D
const PLAYER = preload('res://Player/Player.tscn')

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var player = PLAYER.instance()
	player.set_position($Position2D.position)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
