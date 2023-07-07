extends Node

var input_dir: Vector2
var input_speed: int = 1

func _input(_event):
	input_dir = Input.get_vector("left", "right", "backward", "forward")
	input_dir = input_dir.normalized()
	
	# using match?
	if Input.is_action_pressed("first_speed"):
		input_speed = 1
	if Input.is_action_pressed("second_speed"):
		input_speed = 2
	if Input.is_action_pressed("third_speed"):
		input_speed = 3
	if Input.is_action_pressed("fourth_speed"):
		input_speed = 4
