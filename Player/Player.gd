extends KinematicBody2D

export (int) var speed = 50

var velocity = Vector2()
var facing = 'up'
var idle_dict = {'left': 'idle_left', 'right': 'idle_right', 'up': 'idle_up', 'down': 'idle_down'}
onready var sprite = $AnimatedSprite

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		sprite.play('walk_right')
		facing = 'right'
		velocity.x += 1
	elif Input.is_action_pressed('ui_left'):
		sprite.play('walk_left')
		facing = 'left'
		velocity.x -= 1
	elif Input.is_action_pressed('ui_down'):
		sprite.play('walk_down')
		facing = 'down'
		velocity.y += 1
	elif Input.is_action_pressed('ui_up'):
		sprite.play('walk_up')
		facing = 'up'
		velocity.y -= 1
	else:
		velocity = Vector2()
		sprite.play(idle_dict[facing])

	velocity = velocity.normalized() * speed

func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)
