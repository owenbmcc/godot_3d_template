extends CharacterBody3D
## non-player character, dialog with player
## requires DialogueManager addon, download from AssetLib

@export_file var dialogue_file
@export var dialog_name: String

var player : CharacterBody3D
var dm # ref for dialoguemanager instance

func _ready():
	if Engine.has_singleton("DialogueManager"):
		dm = get_tree().get_root().get_node("DialogueManager")
	dm.connect("dialogue_ended", _on_dialogue_ended)

func _on_dialogue_detector_body_entered(body):
	dm.show_example_dialogue_balloon(load(dialogue_file), dialog_name)
	player = body # get a reference to the player
	player.is_talking = true # pauses player movement

func _on_dialogue_ended(_dialog):
	player.is_talking = false # re-enables player movement
