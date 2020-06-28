extends StaticBody2D

onready var dialogue = $'../Dialogue'
onready var progress = Progress
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func interact():
	dialogue.initiate('cake')
	if progress.variables['has_epipen']:
		# Alive
		dialogue.initiate('cake_2')
	else:
		# Death scene
		progress.variables['first_loop'] = true
