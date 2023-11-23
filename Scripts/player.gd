extends CharacterBody2D

var move_speed : float = 200.0
var jump_force : float = 500.0
var gravity : float = 1000.0

var score : int = 0
var lives : int = 3

const out_of_bounds_y : float = 250.0

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
	velocity.x = 0
	
	if Input.is_key_pressed(KEY_LEFT) or Input.is_key_pressed(KEY_A):
		velocity.x -= move_speed
	if Input.is_key_pressed(KEY_RIGHT) or Input.is_key_pressed(KEY_D):
		velocity.x += move_speed
		
	if Input.is_key_pressed(KEY_SPACE) and is_on_floor():
		velocity.y = -jump_force
		
	move_and_slide()
	
	if global_position.y > out_of_bounds_y:
		game_over()

func game_over():
	get_tree().reload_current_scene()
	
func add_score(amount):
	get_node("Camera2D/UI").update_score(10)
	score += amount
	print (score)
	# score_text.text = str("Score: ", score)
	
