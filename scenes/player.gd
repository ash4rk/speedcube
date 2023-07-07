extends CharacterBody3D

class_name Player

@export var SPEED_VALUES = {1: 3.0, 
							2: 10.0, 
							3: 15.0,
							4: 25.0}

@onready var controller = $Controller

func _physics_process(delta):
	_process_movement(delta)

func _process_movement(delta):
	var input_dir = controller.input_dir
	var speed = SPEED_VALUES[controller.input_speed]
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = -direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0,speed)
		velocity.z = move_toward(velocity.z, 0, speed)

	move_and_slide()
