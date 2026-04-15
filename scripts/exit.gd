"""
quit game with escape
attach to generic node
use "exit" in input map
Project > Project Settings > Input Map
"""

extends Node

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("exit"): 
		get_tree().quit()
