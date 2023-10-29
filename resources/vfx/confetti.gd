extends CPUParticles2D


# Called when the node enters the scene tree for the first time.
func _ready():
	#SoundPlayer.play_positional("Confetti", get_global_position())
	
	emitting = true
	await get_tree().create_timer(3).timeout
	queue_free()


