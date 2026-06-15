class_name Player
extends CharacterBody2D

@onready var anima := $AnimatedSprite2D
@onready var states = $state_manager
@onready var label: Label = $CanvasLayer/Label

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

func update_text(state: String) -> void:
	label.text = state
