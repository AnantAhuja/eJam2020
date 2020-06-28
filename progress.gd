extends Node

# If you already have an AutoLoad script where you keep track of the player progress, you can just add there the code bellow and edit the 'progress' var in the DialogueSystem.gd file.
const indoors = preload('res://Indoors.tscn')
const upstairs = preload('res://Upstairs.tscn')
const store = preload("res://Store.tscn")
const PLAYER = preload("res://Player/Player.tscn")

var dialogues = { # Everytime the player talks with an NPC it will be stored here so the system use the "repeat" block (if available) on the next interaction.
#	'question': true # This is here just for demonstration (and debugging) pourposes.
}

var variables = { # Variables used as conditions to know what dialogue block the player should see next. 
	'first_loop': false,
	'got_asparagus': false,
	'store_open': false, 
	'has_body_spray': false,
	'has_epipen': false,
	'is_hana_following': true
	}
	
func go_upstairs():
	get_tree().change_scene_to(upstairs)
	var player = PLAYER.instance()
	player.position = $'Upstairs/Position2D'.position
	
func go_downstairs():
	get_tree().change_scene_to(indoors)
	var player = PLAYER.instance()
	player.position = $'Indoors/StairsPosition'.position

func go_to_store():
	get_tree().change_scene_to(store)
	var player = PLAYER.instance()
	self.add_child(player)
	player.position = $'Store/PlayerPosition'.global_position

func go_back_home():
	get_tree().change_scene_to(indoors)
	var player = PLAYER.instance()
	player.position = $'Indoors/DoorPosition'.position
