extends CharacterBody2D

var move_speed : float = 200.0
var jump_force : float = 550.0
var gravity : float = 1000.0

# define when the player is out of bounds
const out_of_bounds_y : float = 250.0

func _ready():
	# store our start position
	Global.player_start_position = global_position
	# Connect up our signals
	Global.respawn.connect(player_respawn)

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
		out_of_bounds()

func out_of_bounds():
	Global.do_life_lost()
	
func player_respawn():
	global_position = Global.player_start_position
