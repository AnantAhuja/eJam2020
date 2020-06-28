extends StaticBody2D
onready var dialogue = $'../Dialogue'
func _ready():
	pass # Replace with function body.

func interact():
	dialogue.initiate('key')
