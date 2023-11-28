extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	
	# set up default values
	ui_set_default_values()
	
	# Connect our signals
	Global.update_score.connect(ui_update_score)
	Global.update_lives.connect(ui_update_lives)
	# Global.game_over.connect(ui_game_over)

func ui_set_default_values():
	get_node("CanvasLayer/Lives").text = str("Lives: ", Global.lives)
	get_node("CanvasLayer/Score").text = str("Score: ", Global.score)
	
func ui_update_score():
	get_node("CanvasLayer/Score").text = str("Score: ", Global.score)
	
func ui_update_lives():
	get_node("CanvasLayer/Lives").text = str("Lives: ", Global.lives)
	
#func ui_game_over():
#	get_node("CanvasLayer/GameOver").visible = true
