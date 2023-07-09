extends CharacterBody3D

var speed: float = 0.0

func _physics_process(delta):
	velocity.z = speed * delta
	move_and_slide()
