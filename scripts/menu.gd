extends Control
## example start menu, with start and quit buttons
## also works as in game overlay
## duplicate for multiple menus
## 
## node setup varies based on design, one example:
## • Control (menu) # menu.gd
## 	~ CenterContainer
## 		~ HBoxContainer
## 			~ CenterContainer
## 				~ TextureRect (logo) - icon or logo for game
## 			~ CenterContainer
## 				~ HBoxContainer
## 					• Button (start)
## 						-> pressed -> _on_start_pressed (self)
## 					• Button (quit)
## 						-> pressed -> _on_quit_pressed (self)
## 
## in-game, instance in level:
## • Node (level)
## 	% menu

## scene to load when clicking start button
## example, add other scenes for instructions, stage selection, etc
@export_file("*.tscn") var start_level_scene

## if menu scene, mouse will automatically appear
## if instanced in-game, mouse will appear when menu is opened
var is_root_scene : bool = true

func _ready():
	assert(start_level_scene != null, "add start level scene to menu")
	is_root_scene = (get_parent() == get_tree().root)
	if is_root_scene:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		visible = false
	
func _unhandled_input(event: InputEvent) -> void:
	if is_root_scene:
		return
	if Input.is_action_just_pressed("menu"):
		if !visible:
			open()
		else:
			close()

func _on_start_pressed():
	get_tree().change_scene_to_file(start_level_scene)

func _on_quit_pressed():
	get_tree().quit()

## opens in-game menu
func open():
	visible = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

## closes in-game menu
func close():
	visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
