extends Node2D

var enabled = false

func _ready():
	pass # Replace with function body.

func start():
	enabled = true
	$key.position = Vector2(-200,0)

func _process(delta):
	if enabled:
		$key.position += Vector2(1,0)*200*delta
		

func reset():
	enabled = false
	$key.position = Vector2(-200,0)
