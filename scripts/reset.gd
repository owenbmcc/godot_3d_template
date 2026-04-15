extends Node
## reset level, for debugging
## 
## node setup
## • Node (Reset) # reset.gd
## 
## set "reset" in input map
## Project > Project Settings > Input Map

@export var debug_only : bool = true

var is_active = true

func _ready() -> void:
	if debug_only and not OS.is_debug_build():
		is_active = false

func _unhandled_input(_event: InputEvent) -> void:
	if not is_active:
		return
	if Input.is_action_just_pressed("reset"): 
		get_tree().reload_current_scene()
