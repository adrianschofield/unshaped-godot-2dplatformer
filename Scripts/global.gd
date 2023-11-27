extends Node

# our signals need to be defined here
signal update_score
signal update_lives
signal game_over
signal respawn

# player state
var score : int = 0
var lives : int = 3
var player_start_position : Vector2

# levels
var current_scene = null
var level1_scene = preload("res://Scenes/level_1.tscn")
var level2_scene = preload("res://Scenes/level_2.tscn")
const max_level : int = 2
var current_level : int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	# All this does is set up the current scene in our case that
	# will be level 1
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)

# This is called by the FinishFlag when it's entered
func next_level():
	# Update the current level
	current_level += 1
	# DBG
	print(current_level)
	# TODO Check for the end etc etc
	if current_level > max_level:
		do_game_over()
	else:
		# Then because the current scene may still be doing something
		# defer the call until that is all finished
		call_deferred("_deferred_goto_scene")
	
# This is called once the previous level has cleaned up
# and loads the next scene/level

func _deferred_goto_scene():
	# DBG
	print("_deferred_goto_scene")
	
	# Remove the current scene
	current_scene.free()
		
	if current_level == 1:
		current_scene = level1_scene.instantiate()
		get_tree().root.add_child(current_scene)
		get_tree().current_scene = current_scene
	else:
		current_scene = level2_scene.instantiate()
		get_tree().root.add_child(current_scene)
		get_tree().current_scene = current_scene
		
# Called by the gem scene when it's hit so that score is updated
func do_update_score(amount):
	# increase the score
	# TODO should this have a parameter for different values
	score += amount
	# Now update the UI using our signal
	Global.update_score.emit()
	
# Called by player and enemies when a life is lost
func do_life_lost():
	# decrease the life count
	lives -= 1
	# and update the UI using our signal
	Global.update_lives.emit()
	if lives > 0:
		# reset the level, we can use our deferred function above
		# as we haven't changed the current level number it will reload
		# the current scene
		# call_deferred("_deferred_goto_scene")
		do_respawn()
	else:
		# all lives are lost so Game Over!
		do_game_over()
	
func do_game_over():
	current_level = 1
	Global.game_over.emit()
	
func do_respawn():
	Global.respawn.emit()
