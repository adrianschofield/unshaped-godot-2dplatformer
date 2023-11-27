extends Area2D

# @export_file("*.tscn") var next_scene

func _on_body_entered(body):
	if body.is_in_group("player"):
		print("end_of_level emit")
		Global.next_level()
