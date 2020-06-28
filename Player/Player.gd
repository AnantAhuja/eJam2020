extends KinematicBody2D

export (int) var speed = 50

var velocity = Vector2()
var facing = 'down'
var idle_dict = {'left': 'idle_left', 'right': 'idle_right', 'up': 'idle_up', 'down': 'idle_down'}
var cast_to_dict = {'left': Vector2(-5, 0), 'right': Vector2(5, 0), 'up': Vector2(0, -4), 'down': Vector2(0, 4)}

onready var sprite = $AnimatedSprite
onready var raycast =  $RayCast2D
onready var dialogue = $'../Dialogue'
onready var frame = $'../Dialogue/Frame'

func get_input():
	velocity = Vector2()
	if (not frame.visible) and Input.is_action_pressed('ui_right'):
		sprite.play('walk_right')
		facing = 'right'
		velocity.x += 1
	elif (not frame.visible) and Input.is_action_pressed('ui_left'):
		sprite.play('walk_left')
		facing = 'left'
		velocity.x -= 1
	elif (not frame.visible) and Input.is_action_pressed('ui_down'):
		sprite.play('walk_down')
		facing = 'down'
		velocity.y += 1
	elif (not frame.visible) and Input.is_action_pressed('ui_up'):
		sprite.play('walk_up')
		facing = 'up'
		velocity.y -= 1
	elif Input.is_action_just_pressed(("ui_accept")):
		velocity = Vector2()
		sprite.play(idle_dict[facing])
		
		var object = raycast.get_collider()
		if raycast.is_colliding() and object.has_method('interact'):
			if frame.visible:
				dialogue.next()
			else:
				object.interact()

	else:
		velocity = Vector2()
		sprite.play(idle_dict[facing])

	raycast.set_cast_to(cast_to_dict[facing])
	velocity = velocity.normalized() * speed

func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)
