extends Node

@export var SPEED_VALUES = {1: 300.0, 
							2: 1000.0, 
							3: 1500.0,
							4: 2500.0}
@export var cube: Node3D

var input_speed: int = 1

func _input(_event):
	# using match?
	if Input.is_action_pressed("first_speed"):
		input_speed = 1
	if Input.is_action_pressed("second_speed"):
		input_speed = 2
	if Input.is_action_pressed("third_speed"):
		input_speed = 3
	if Input.is_action_pressed("fourth_speed"):
		input_speed = 4
		
	if cube.speed > 0:
		cube.speed = SPEED_VALUES[input_speed]
	else:
		cube.speed = -SPEED_VALUES[input_speed]
