extends Control

var lives : int = 3
var score : int = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("CanvasLayer/Lives").text = "Lives: 3"
	get_node("CanvasLayer/Score").text = "Score: 0"

func update_lives():
	lives -= 1
	get_node("CanvasLayer/Lives").text = str("Lives: ", lives)
	
func update_score(amount):
	score += amount
	get_node("CanvasLayer/Score").text = str("Score: ", score)
	
