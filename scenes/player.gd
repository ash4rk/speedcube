extends CharacterBody3D

class_name Player

const SPEED = 5.0

@onready var controller = $Controller

func _physics_process(delta):
		_process_movement(delta)

func _process_movement(delta):
	var input_dir = controller.input_dir
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = -direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
