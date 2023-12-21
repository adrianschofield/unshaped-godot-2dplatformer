extends Area2D

# @export_file("*.tscn") var next_scene

func _ready():
	# There doesn't seem to be any way to start an animation automatically
	# so let's play it whenever the flag is instantiated
	get_node("AnimatedSprite2D").play()

func _on_body_entered(body):
	if body.is_in_group("player"):
		print("end_of_level emit")
		Global.next_level()
