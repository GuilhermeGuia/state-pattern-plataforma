class_name BaseState
extends Node

enum State {
	Null,
	Idle,
	Walk,
	Jump,
	Fall
}

@export var animation_name: String

var player: Player

func enter() -> void:
	player.anima.play(animation_name)
	player.update_text(name)

func exit() -> void:
	pass
	
func input(event: InputEvent) -> int:
	return State.Null

func process(delta: float) -> int:
	return State.Null

func physics_process(delta: float) -> int:
	return State.Null
