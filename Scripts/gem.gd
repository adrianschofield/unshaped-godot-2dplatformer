extends Area2D

var bob_height : float = 5.0
var bob_speed : float = 5.0

const gem_points : int = 10

@onready var start_y : float = global_position.y
var t : float = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	t += delta
	
	var d = (sin(t *bob_speed) + 1) / 2
	global_position.y = start_y + (d * bob_height)

func _on_body_entered(body):
	if body.is_in_group("player"):
		# The first thing we do here is to tell our global script
		# to update the score
		Global.do_update_score(gem_points)
		# Because the audio plays async we can't destroy the gem
		# straight away so let's hide the sprite
		get_node("Sprite").visible = false
		# Play the audio and then tidy up when the audio finishes
		get_node("Pickup").play()
		
		
func _on_pickup_finished():
	queue_free()
