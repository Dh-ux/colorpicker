extends Node2D


#depricated

@onready var timer = $Timer

var color_types = ["DarkOrange", "DarkYellow", "DarkPurple", "DarkGreen", "DarkBlue","BrightOrange","BrightPurple", "BrightGreen","BrightBlue","BrightYellow" ]
var target_color = "DarkOrange"
var color_track = color_types.duplicate()
var target_button = null

var beat = 0
var internal_beat = 0
@export var inital_blank = 4.6
@export var beat_speed = 0.5
var started = false

var confetti = preload("res://resources/vfx/confetti.tscn")

var hint_ref

func _ready():
	timer.start(inital_blank) 
	hint_ref = $Track/key/hint
	
func on_beats():
	internal_beat += 1
	if beat%4 == 0:
		internal_beat = 0
		on_bar()
		
func on_bar():
	if color_types.size() !=0:
		var color_index = randi()%color_types.size()
		target_color = color_types[color_index]
	#	Red -= 1
	#	if colortype['Red'] == 0:
	#		#color_types.erase(target_color)
		color_types.erase(target_color)
		$Track.start()
		print(target_color)
		
		if target_color == 'DarkOrange':
			hint_ref.texture = load("res://resources/image1key/darkorange.PNG")
		elif target_color == 'DarkBlue':
			hint_ref.texture = load("res://resources/image1key/darkblue.PNG")
		elif target_color == 'DarkGreen':
			hint_ref.texture = load("res://resources/image1key/darkgreen.PNG")
		elif target_color == 'DarkYellow':
			hint_ref.texture = load("res://resources/image1key/darkyellow.PNG")
		elif target_color == 'DarkPurple':
			hint_ref.texture = 	load("res://resources/image1key/darkpurple.PNG")
		elif target_color == 'BrightPurple':
			hint_ref.texture = 	load("res://resources/image1key/brightpurple.PNG")
		elif target_color == 'BrightBlue':
			hint_ref.texture = 	load("res://resources/image1key/brightblue.PNG")	
		elif target_color == 'BrightGreen':
			hint_ref.texture = 	load("res://resources/image1key/brightgreen.PNG")	
		elif target_color == 'BrightYellow':
			hint_ref.texture = 	load("res://resources/image1key/brightyellow.PNG")
		elif target_color == 'BrightOrange':
			hint_ref.texture = 	load("res://resources/image1key/brightorange.PNG")			
			
		
		hint_ref.visible = true
		#timer.start(4)
	else:
		#if color_track.size() == 0:
			var c = confetti.instantiate()
			add_child(c)
			c.set_position($Background.get_position())
			hint_ref.visible = false
			$Track.stop()
			game_over()

			
			

func create_key():
	pass

func _timeout():
	if not started:
		started = true
		on_beats()
		$BeatCounter.start(beat_speed)
		$Track.start()
		



func color_picked(target):
	#target.get_node('color_block').hide()
	color_track.erase(target.color_type)
	$Track.reset()
	if target_color == 'DarkOrange':
		$Node/darkorange.visible = true
	elif target_color == 'DarkBlue':
		$Node/darkblue.visible = true
	elif target_color == 'DarkGreen':
		$Node/darkgreen.visible = true
	elif target_color == 'DarkYellow':
		$Node/darkyellow.visible = true
	elif target_color == 'DarkPurple':
		$Node/darkpurple.visible = true
	elif target_color == 'BrightPurple':
		$Node/brightpurple.visible = true	
	elif target_color == 'BrightOrange':
		$Node/brightorange.visible = true	
	elif target_color == 'BrightYellow':
		$Node/brightyellow.visible = true	
	elif target_color == 'BrightBlue':
		$Node/brightblue.visible = true	
	elif target_color == 'BrightGreen':
		$Node/brightgreen.visible = true	

func game_over():
	$OverPanel.visible = true



func _on_timer_timeout():
	_timeout()
	$Label.visible = false




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
	beat += 1
	on_beats()


func _on_next_button_pressed():
	get_tree().change_scene_to_file("res://dialouge2.tscn")
