extends CharacterBody2D

const MAX_SPEED = 90
const FRICTION = 500
const ACCELERATION = 500

var vel = Vector2.ZERO
@onready var animationPlayer = $AnimationPlayer
@onready var animationTree = $AnimationTree
@onready var animationState = animationTree.get("parameters/playback")

func _physics_process(delta):
	var input_vec = Vector2.ZERO
	input_vec.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vec.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vec = input_vec.normalized()
	velocity = vel

	if input_vec != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_vec)
		animationTree.set("parameters/Run/blend_position", input_vec)
		animationState.travel("Run")
		vel = vel.move_toward(input_vec * MAX_SPEED, ACCELERATION * delta)
	else:
		vel = vel.move_toward(Vector2.ZERO, FRICTION * delta)
		animationState.travel("Idle")
	move_and_slide()
