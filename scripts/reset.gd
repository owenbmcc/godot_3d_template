"""
reset level
mostly for debugging
attach to generic node
"reset" in input map
Project > Project Settings > Input Map
"""

extends Node

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("reset"): 
		get_tree().reload_current_scene()
