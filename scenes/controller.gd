extends Node

var input_dir: Vector2

func _process(delta):
	input_dir = Input.get_vector("left", "right", "backward", "forward")
	input_dir = input_dir.normalized()
