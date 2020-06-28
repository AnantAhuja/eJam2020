extends StaticBody2D

onready var progress = Progress
onready var dialogue = $'../Dialogue'
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func interact():
	if Progress.variables['has_body_spray']:
		self.explode()
	else:
		dialogue.initiate('microwave')

func explode():
	$'../Music'.stop()
	
	$Sprite.hide()
	$'../Player'.hide()
	$AnimatedSprite.show()
	$AnimatedSprite.play()
	
func _on_AnimatedSprite_animation_finished():
	self.hide()
	progress.variables['first_loop'] = true
	
