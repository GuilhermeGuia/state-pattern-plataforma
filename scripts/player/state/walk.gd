extends BaseState

func enter() -> void:
	player.anima.play("walk")

func input(event: InputEvent) -> int:
	if Input.is_action_just_pressed("pular") && player.is_on_floor():
		return State.Jump
	return State.Null

func physics_process(delta: float) -> int:
	var move = 0
	if Input.is_action_pressed("mover_esquerda"):
		move = -1
		player.anima.flip_h = true
	elif Input.is_action_pressed("mover_direita"):
		move = 1
		player.anima.flip_h = false
	
	player.velocity.y += player.get_gravity().y * delta
	player.velocity.x = move * player.SPEED
	
	if move == 0:
		return State.Idle

	return State.Null
