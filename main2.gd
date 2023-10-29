extends Node2D


#depricated

@onready var timer = $Timer

var color_types = ["red","darkgreen","grey","darkyellow","darkblue","brightblue","brightgreen","brightyellow","white","brightred","lightgreen","brown" ]
var target_color = "red"

var target_button = null

var beat = 0
var internal_beat = 0
var beat_speed = 0.5
var started = false

var hint_ref

func _ready():
	timer.start(4.7) 
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
			hint_ref.texture = load("res://resources/image1/keys/darkorange.PNG")
		elif target_color == 'darkblue':
			hint_ref.texture = load("res://resources/image1/keys/darkblue.PNG")
		elif target_color == 'darkgreen':
			hint_ref.texture = load("res://resources/image1/keys/darkgreen.PNG")
		elif target_color == 'darkyellow':
			hint_ref.texture = load("res://resources/image1/keys/darkyellow.PNG")
		elif target_color == 'brown':
			hint_ref.texture = 	load("res://resources/image1/keys/darkpurple.PNG")
		elif target_color == 'white':
			hint_ref.texture = 	load("res://resources/image1/keys/brightpurple.PNG")
		elif target_color == 'brightblue':
			hint_ref.texture = 	load("res://resources/image1/keys/brightblue.PNG")	
		elif target_color == 'brightgreen':
			hint_ref.texture = 	load("res://resources/image1/keys/brightgrenn.PNG")	
		elif target_color == 'brightyellow':
			hint_ref.texture = 	load("res://resources/image1/keys/brightyellow.PNG")
		elif target_color == 'grey':
			hint_ref.texture = 	load("res://resources/image1/keys/brightorange.PNG")
		elif target_color == 'lightgreen':
			hint_ref.texture = 	load("res://resources/image1/keys/brightorange.PNG")
		elif target_color == 'brightred':
			hint_ref.texture = 	load("res://resources/image1/keys/brightorange.PNG")					
			
		
		hint_ref.visible = true
		#timer.start(4)
	else:
		hint_ref.visible = false
		$Track.reset()
		game_over()

func create_key():
	pass

func timeout():
	print("20")
	if not started:
		started = true
		on_beats()
		$BeatCounter.start(beat_speed)
		$Track.start()
		



func color_picked(target):
	#target.get_node('color_block').hide()
	
	if target_color == 'red':
		$Node/red.visible = true
	elif target_color == 'darkblue':
		$Node/darkblue.visible = true
	elif target_color == 'darkgreen':
		$Node/darkgreen.visible = true
	elif target_color == 'darkyellow':
		$Node/darkyellow.visible = true
	elif target_color == 'white':
		$Node/white.visible = true
	elif target_color == 'brown':
		$Node/brown.visible = true	
	elif target_color == 'grey':
		$Node/grey.visible = true	
	elif target_color == 'brightyellow':
		$Node/yellow.visible = true	
	elif target_color == 'brightblue':
		$Node/blue.visible = true	
	elif target_color == 'brightGreen':
		$Node/green.visible = true	
	elif target_color == 'darkred':
		$Node/darkred.visible = true
	elif target_color == 'lightgreen':
		$Node/lightgreen.visible = true				

func game_over():
	pass





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
