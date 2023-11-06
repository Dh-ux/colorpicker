extends Node2D


#depricated

@onready var timer = $Timer

var color_types = ["red","green","grey","yellow","darkblue","lightblue","lightpurple","lightyellow","white","orange","lightgreen","blue","darkpurple","purple","darkorange" ]
var target_color = "red"

var target_button = null

var beat = 0
var internal_beat = 0
var started = false
@export var inital_blank = 4.6
var beat_speed = 0.5


var confetti = preload("res://resources/vfx/confetti.tscn")
var hint_ref

func _ready():
	timer.start(4.6) 
	hint_ref = $Track/key/hint
	print("1")
	
func on_beats():
	print("2")
	internal_beat += 1
	if beat%4 == 0:
		internal_beat = 0
		on_bar()
		
func on_bar():
	print("onbar")
	if color_types.size() !=0:
		var color_index = randi()%color_types.size()
		target_color = color_types[color_index]
	#	Red -= 1
	#	if colortype['Red'] == 0:
	#		#color_types.erase(target_color)
		color_types.erase(target_color)
		$Track.start()
		print(target_color)
		
		if target_color == 'red':
			hint_ref.texture = load("res://resources/image3/key/red.PNG")
		elif target_color == 'darkblue':
			hint_ref.texture = load("res://resources/image3/key/darkblue.PNG")
		elif target_color == 'green':
			hint_ref.texture = load("res://resources/image3/key/green.PNG")
		elif target_color == 'yellow':
			hint_ref.texture = load("res://resources/image3/key/yellow.PNG")
		elif target_color == 'lightpurple':
			hint_ref.texture = 	load("res://resources/image3/key/lightpurple.PNG")
		elif target_color == 'white':
			hint_ref.texture = 	load("res://resources/image3/key/white.PNG")
		elif target_color == 'darkpurple':
			hint_ref.texture = 	load("res://resources/image3/key/darkpurple.PNG")	
		elif target_color == 'purple':
			hint_ref.texture = 	load("res://resources/image3/key/purple.PNG")	
		elif target_color == 'lightyellow':
			hint_ref.texture = 	load("res://resources/image3/key/lightyellow.PNG")
		elif target_color == 'grey':
			hint_ref.texture = 	load("res://resources/image3/key/grey.PNG")
		elif target_color == 'lightgreen':
			hint_ref.texture = 	load("res://resources/image3/key/lightgreen.PNG")
		elif target_color == 'orange':
			hint_ref.texture = 	load("res://resources/image3/key/orange.PNG")
		elif target_color == 'lightblue':
			hint_ref.texture = 	load("res://resources/image3/key/lightblue.PNG")
		elif target_color == 'darkorange':
			hint_ref.texture = 	load("res://resources/image3/key/darkorange.PNG")
		elif target_color == 'blue':
			hint_ref.texture = 	load("res://resources/image3/key/blue.PNG")	
		
		hint_ref.visible = true
		#timer.start(4)
	else:
		var c = confetti.instantiate()
		add_child(c)
		c.set_position($Background.get_position())
		hint_ref.visible = false
		$Track.reset()
		$BeatCounter.stop()
		game_over()

func create_key():
	pass

func timeout():
	if not started:
		started = true
		on_beats()
		$BeatCounter.start(beat_speed)
		$Track.start()
		



func color_picked(target):
	#target.get_node('color_block').hide()
	$Track.reset()
	if target_color == 'red':
		$Node/red.visible = true
	elif target_color == 'darkblue':
		$Node/darkblue.visible = true
	elif target_color == 'green':
		$Node/green.visible = true
	elif target_color == 'yellow':
		$Node/yellow.visible = true
	elif target_color == 'white':
		$Node/white.visible = true
	elif target_color == 'lightpurple':
		$Node/lightpurple.visible = true	
	elif target_color == 'grey':
		$Node/grey.visible = true	
	elif target_color == 'lightyellow':
		$Node/lightyellow.visible = true	
	elif target_color == 'lightblue':
		$Node/lightblue.visible = true	
	elif target_color == 'orange':
		$Node/orange.visible = true	
	elif target_color == 'darkorange':
		$Node/darkorange.visible = true
	elif target_color == 'lightgreen':
		$Node/lightgreen.visible = true
	elif target_color == 'blue':
		$Node/blue.visible = true
	elif target_color == 'purple':
		$Node/purple.visible = true	
	elif target_color == 'darkpurple':
		$Node/darkpurple.visible = true				

func game_over():
	$OverPanel.visible = true





#func _on_area_2d_input_event(viewport, event, shape_idx):
#	if (event is InputEventMouseButton && event.pressed):
#		if $Node/picker1 == target_button:
#			print("Correct!")
#			print("color 1 is picked")
#			target_button.disabled = true
#			$Node/picker1/block1.texture = load("res://resources/art/yellownocolor.jpg")
#			$Node2/block2.texture = load("res://resources/art/redcolor.jpg")
#			$Node/picker1.disabled = true
#		else:
#			pass	






func _on_beat_counter_timeout():
	print("3")
	beat += 1
	on_beats()



func _on_timer_timeout():
	print("out")
	timeout()


func _on_next_button_pressed():
	get_tree().change_scene_to_file("res://start.tscn")
