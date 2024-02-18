extends CharacterBody2D

const MAX_SPEED = 80
const FRICTION = 500
const ACCELERATION = 500

var vel = Vector2.ZERO

func _physics_process(delta):
	var input_vec = Vector2.ZERO
	input_vec.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vec.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vec = input_vec.normalized()
	velocity = vel

	if input_vec != Vector2.ZERO:
		vel = vel.move_toward(input_vec * MAX_SPEED, ACCELERATION * delta)
	else:
		vel = vel.move_toward(Vector2.ZERO, FRICTION * delta)
	move_and_slide()
