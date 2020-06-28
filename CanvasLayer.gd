#extends CanvasLayer
#
## Declare member variables here. Examples:
## var a = 2
## var b = "text"
#
#
## Called when the node enters the scene tree for the first time.
#func _ready():
#	self.connect("game_over", self, "gameover")
#
#func gameover():
#	$RichTextLabel.show()
#	$'../Music'.stop()
#	$Timer.start()
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
##func _process(delta):
##	pass
#
#
#func _on_Timer_timeout():
#	$RichTextLabel.hide()
#	$'../Music'.play()
