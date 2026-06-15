extends BaseState

func enter() -> void:
	player.anima.play("idle")
	player.update_text(name)

func input(event: InputEvent) -> int:
	if Input.get_axis("mover_esquerda", "mover_direita"):
		return State.Walk
	elif Input.is_action_just_pressed("pular") && player.is_on_floor():
		return State.Jump
	return State.Null

func physics_process(delta: float) -> int:
	player.velocity.x = 0
	
	return State.Null
