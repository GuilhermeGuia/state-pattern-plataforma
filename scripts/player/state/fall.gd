extends BaseState

@export var SPEED: float = 60
@onready var state_label = $CanvasLayer/StateLabel

func enter() -> void:
	player.anima.play("jump")
	player.update_text(name)

func physics_process(delta: float) -> int:
	var move = Input.get_axis("mover_esquerda", "mover_direita")

	player.velocity.x = move * player.SPEED

	if(move != 0):
		player.anima.flip_h = move < 0

	if player.is_on_floor():
		if move != 0:
			return State.Walk
		return State.Idle

	return State.Null
