extends CharacterBody3D

var speed: float = 0.0

func _physics_process(delta):
	if speed:
		velocity.z = speed * delta
	else:
		velocity.z = move_toward(velocity.z, 0, speed * delta)
	move_and_slide()
