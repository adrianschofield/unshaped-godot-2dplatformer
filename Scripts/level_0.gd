extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.game_over_state:
		get_node("GameOver").visible = true
		get_node("Button").visible = true
	else:
		get_node("GameOver").visible = true
		get_node("GameOver").text = "Welcome!"
		get_node("Button").visible = true
		get_node("Button").text = "Start"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	# When the button is pressed all we need to do is switch to the next level
	Global.next_level()
