extends StaticBody2D

onready var dialogue = $'../Dialogue'
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func interact():
	dialogue.initiate('washing_machine')
	Progress.variables['has_seen_Washing_machine'] = true
