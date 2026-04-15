extends Node
## non-player character, dialog with player
## attach to NPC character
##
## node setup:
## • npc (whatever root node, such as CharacterBody3D) [npcs] {platforms}
## 	• Node (dialog) # dialog_npc.gd
##	• Area3D (player detector) [dialog detector]
##	-> body_entered -> _on_player_detector_body_entered (dialog)
##		• CollisionShape3D
## requires Dialgue Manager plugin
## go to AssetLib, search "Dialogue Manager 3" and install
## setup: Project > Project Settings > Plugins -> check Enabled On
##
## check out dialogue manager API for features, like branching, 
##   calling functions, giving player resources etc.
##
## future update: make player look at NPC on enter

## dialog file to load
@export_file("*.dialogue") var dialog_file

## dialog name, if dialog file has more than one section
@export var dialog_name : String

var player : CharacterBody3D # gets from signal
var dm # ref for dialoguemanager instance

func _ready() -> void:
	assert(Engine.has_singleton("DialogueManager"), "requires Dialogue Manager plugin, make sure it is installed and enabled")
	assert(dialog_file != null, "add a dialog file")
	dm = get_tree().get_root().get_node("DialogueManager")
	dm.connect("dialogue_ended", _on_dialogue_ended)

## detects player is in range to begin dialog
func _on_player_detector_body_entered(body) -> void:
	dm.show_example_dialogue_balloon(load(dialog_file), dialog_name)
	player = body # get a reference to the player
	player.is_talking = true # pauses player movement

func _on_dialogue_ended(_dialog) -> void:
	player.is_talking = false # re-enables player movement
