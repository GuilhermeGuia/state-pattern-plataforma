extends BaseState

func enter() -> void:
	player.anima.play("idle")

func input(event: InputEvent) -> int:
	if Input.is_action_just_pressed("mover_esquerda") or Input.is_action_just_pressed("mover_direita"):
		return State.Walk
	elif Input.is_action_just_pressed("pular"):
		return State.Jump
	return State.Null

func physics_process(delta: float) -> int:
	
	player.velocity.y += player.get_gravity().y * delta

	return State.Null
