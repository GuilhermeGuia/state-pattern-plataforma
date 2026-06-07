extends CharacterBody2D

@onready var anima := $AnimatedSprite2D

const SPEED =50.0
const JUMP_VELOCITY = -300.0
var _last_direction := 0.0
var _zero_frames := 0
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("mover_esquerda", "mover_direita")

	if is_on_floor():
		print(direction)
		
		if direction != 0.0:
			flip_animacao_jogador(direction)
			anima.play("walk")
			_zero_frames = 0
			velocity.x = direction * SPEED
		else:
			anima.play("idle")
			velocity.x = move_toward(velocity.x, 0, SPEED)
	else:
		anima.play("jump")

	move_and_slide()

func flip_animacao_jogador(direction: float):
	anima.flip_h = direction < 0
