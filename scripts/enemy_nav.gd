extends NavigationRegion3D
## nav region for enemy
## nav area platforms/meshes must be child nodes
## Bake Navigation mesh to set
## needs reference to player, updates enemies to player position
## 
## • NavigationRegion3D # enemy_nav.gd
## 	• Mesh/Platform
## 	• ...

@export var player : CharacterBody3D
var wait_a_frame : bool = true

func _physics_process(_delta) -> void:
	if wait_a_frame:
		wait_a_frame = false
		return
	get_tree().call_group("enemies", "update_target_location", player.global_transform.origin)
