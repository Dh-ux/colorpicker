extends CPUParticles2D


# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(4.1).timeout
	emitting = true
	await get_tree().create_timer(1).timeout
	queue_free()
