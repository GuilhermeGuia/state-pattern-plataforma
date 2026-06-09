extends BaseState

@export var SPEED: float = 60
@onready var state_label = $CanvasLayer/StateLabel

func enter() -> void:
	player.anima.play("jump")
	player.velocity.y = player.JUMP_VELOCITY

func physics_process(delta: float) -> int:
	var move = 0
	if Input.is_action_pressed("mover_esquerda"):
		move = -1
		player.anima.flip_h = true
	elif Input.is_action_pressed("mover_direita"):
		move = 1
		player.anima.flip_h = false

	player.velocity.x = move * player.SPEED

	if not player.is_on_floor():
		player.velocity.y += player.get_gravity().y * delta

	if player.is_on_floor():
		if move != 0:
			return State.Walk
		else:
			return State.Idle

	return State.Null
