extends Node3D
## replace defeated enemy with particle system explosion
## packed scene in enemy @export var explosion
## 
## • Node3D (Explosion) # explosion.gd
## 	• $GPUParticles3D
## 	~ $AudioStreamPlayer3d

func _ready():
	# start particles
	$GPUParticles3D.emitting = true
	
	if $AudioStreamPlayer3D:
		$AudioStreamPlayer3D.play()
	
	# remove particle instance after playing
	await $GPUParticles3D.finished
	queue_free()
