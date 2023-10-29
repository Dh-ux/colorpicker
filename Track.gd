extends Node2D

var enabled = false

func _ready():
	pass # Replace with function body.

func start():
	enabled = true
	$key.position = Vector2(-200,0)
	$key.pop()
	$StartParticle2.set_position($key.get_position())
	$StartParticle2.set_emitting(true)

func _process(delta):
	if enabled:
		$key.position += Vector2(1,0)*200*delta

func stop():
	enabled = false

func reset():
	enabled = false
	$ColorParticle.set_position($key.get_position())
	$ColorParticle.set_emitting(true)
	$key.explode()
	#$key.position = Vector2(-200,0)
