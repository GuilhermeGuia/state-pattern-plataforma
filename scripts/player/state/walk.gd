extends BaseState

func enter() -> void:
	player.anima.play("walk")
	player.update_text(name)

func input(event: InputEvent) -> int:
	if Input.is_action_just_pressed("pular") && player.is_on_floor():
		return State.Jump
	return State.Null

func physics_process(delta: float) -> int:
	var move = Input.get_axis("mover_esquerda", "mover_direita")	
	player.velocity.x = move * player.SPEED
	
	if(move != 0):
		player.anima.flip_h = move < 0

	if player.velocity.y > 0:
		return State.Fall

	if move == 0:
		return State.Idle
	
	return State.Null
