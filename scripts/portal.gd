"""
loads a new level
option for player to confirm with key command (require HUD w/console)
• Area3D (portal) # portal.gd
	• CollisionShape3D
	• Mesh/Object (visual for portal)

confirm input: "portal"
"""

extends Area3D

@export var player_confirm: bool = false
@export var requires_key: bool = false
@export var key_name: String = "special_key" # must match global.special key
@export_file var level_to_load

var player_entered = false
signal update_console

func _unhandled_input(_event):
	if not player_entered:
		return
	if requires_key and not global[key_name]:
		return
	if player_confirm and Input.is_action_just_pressed("portal"):
		get_tree().call_deferred("change_scene_to_file", level_to_load)

func _on_body_entered(_body):
	if not player_confirm and not requires_key:
		get_tree().call_deferred("change_scene_to_file", level_to_load)
		return
	player_entered = true
	
	if requires_key:
		if not global[key_name]:
			emit_signal("update_console", "You need to find the key")
		elif not player_confirm:
			get_tree().call_deferred("change_scene_to_file", level_to_load)
		else:
			emit_signal("update_console", "Press G to go to the next level")

func _on_body_exited(_body):
	player_entered = false
	emit_signal("update_console", "")
