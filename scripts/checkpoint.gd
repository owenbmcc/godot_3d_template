extends Area3D
## sets player respawn point to position of area 3d
## only persists while level is loaded
## save globally for more robust checkpoint system
## 
## node setup
## • Area3D (checkpoint) # checkpoint.gd [checkpoints|platforms] {player}
## 	• CollisionShape3D
## 	~ Mesh/Visual
## 	~ $AudioStreamPlayer3D
## 	~ $AnimationPlayer
## 
## optional sound and animation
## animation must have "idle" and "activated" animations

## respawn positions, shared by respawn player component
@export var player_respawn_position : Node3D

var is_activated : bool = false

func _on_body_entered(_body) -> void:
	if not is_activated:
		is_activated = true
		
		# change player respawn to position of checkpoint
		player_respawn_position.position = position
		
		if $AudioStreamPlayer3D:
			$AudioStreamPlayer3D.play()
		
		if $AnimationPlayer:
			$AnimationPlayer.play("activated")
			await $AnimationPlayer.animation_finished
			$AnimationPlayer.play("idle")
