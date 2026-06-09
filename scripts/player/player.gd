class_name Player
extends CharacterBody2D

@onready var anima := $AnimatedSprite2D
@onready var states = $state_manager

const JUMP_VELOCITY = -300.0
const SPEED := 60

func _ready() -> void:
	states.iniciar(self)

func _unhandled_input(event: InputEvent) -> void:
	states.input(event)

func _physics_process(delta: float) -> void:	
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	states.physics_process(delta)
	
	move_and_slide()

#func _physics_process(delta: float) -> void:
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	#var direction := Input.get_axis("mover_esquerda", "mover_direita")
	#if is_on_floor():
		#if direction != 0.0:
			#flip_animacao_jogador(direction)
			#anima.play("walk")
			#velocity.x = direction * SPEED
		#else:
			#anima.play("idle")
			#velocity.x = move_toward(velocity.x, 0, SPEED)
	#else:
		#anima.play("jump")
#
	#move_and_slide()
#
#func flip_animacao_jogador(direction: float):
	#anima.flip_h = direction < 0
