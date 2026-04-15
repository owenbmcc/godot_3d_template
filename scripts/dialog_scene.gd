extends Control
## dialog scene
## use as intro, or between levels
## node setup:
## • Node (intro scene)
## 	• Control (dialog) # dialog_scene.gd
## 	~ Camera(2D/3D) (if no player or other scene camera)
## 	~ Visuals, other stuff
##
## requires Dialgue Manager plugin
## go to AssetLib, search "Dialogue Manager 3" and install
## setup: Project > Project Settings > Plugins -> check Enabled On

## dialog file to load
@export_file("*.dialogue") var dialog_file

## dialog name, if dialog file has more than one section
@export var dialog_name : String

## scene to load after dialog is done
@export_file("*.tscn") var next_scene

var dm # ref for dialoguemanager instance

func _ready():
	assert(Engine.has_singleton("DialogueManager"), "requires Dialogue Manager plugin, make sure it is installed and enabled")
	assert(dialog_file != null, "add a dialog file")
	assert(next_scene != null, "add a scene to load after intro dialog")
	
	dm = get_tree().get_root().get_node("DialogueManager")
	dm.show_example_dialogue_balloon(load(dialog_file), dialog_name)
	dm.connect("dialogue_ended", _on_dialogue_ended)

func _on_dialogue_ended(_dialogue):
	get_tree().change_scene_to_file(next_scene)
