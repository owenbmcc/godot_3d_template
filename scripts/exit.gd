extends Node
## quit game with escape key (or another key)
## 
## node setup
## • Node (exit) # exit.gd
## 
## set "exit" in input map
## Project > Project Settings > Input Map

@export var debug_only : bool = true

var is_active = true

func _ready() -> void:
	if debug_only and not OS.is_debug_build():
		is_active = false

func _unhandled_input(_event: InputEvent) -> void:
	if not is_active:
		return
	if Input.is_action_just_pressed("exit"): 
		get_tree().quit()
