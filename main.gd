extends Node2D


#depricated

@onready var timer = $Timer

var color_types = ["Red","Green","Blue",'Yellow']
var target_color = "Red"

var target_button = null

func _ready():
	timer.start(4.6) 

func _timeout():
	if color_types.size() !=0:
		var color_index = randi()%color_types.size()
		target_color = color_types[color_index]
	#	Red -= 1
	#	if colortype['Red'] == 0:
	#		#color_types.erase(target_color)
		color_types.erase(target_color)
		
		print(target_color)
		
		if target_color == 'Red':
			$hint/Sprite2D.texture = load("res://resources/art/redcolor.jpg")
		elif target_color == 'Blue':
			$hint/Sprite2D.texture = load("res://resources/art/bluecolor.jpg")
		elif target_color == 'Green':
			$hint/Sprite2D.texture = load("res://resources/art/greencolor.jpg")
		elif target_color == 'Yellow':
			$hint/Sprite2D.texture = load("res://resources/art/yellowcolor.jpg")
		
		$hint.visible = true
		timer.start(4)
	else:
		$hint.visible = false
		game_over()



func color_picked(target):
	#target.get_node('color_block').hide()
	
	if target_color == 'Red':
		$Node2/block2.texture = load("res://resources/art/redcolor.jpg")
	elif target_color == 'Blue':
		$Node2/block3.texture = load("res://resources/art/bluecolor.jpg")
	elif target_color == 'Green':
		$Node2/block4.texture = load("res://resources/art/greencolor.jpg")
	elif target_color == 'Yellow':
		$Node2/block1.texture = load("res://resources/art/yellowcolor.jpg")
	elif target_color == 'Purple':
		$Node2/block1.texture = load("res://resources/art/yellowcolor.jpg")

func game_over():
	pass



func _on_timer_timeout():
	_timeout()




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
