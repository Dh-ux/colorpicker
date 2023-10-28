extends Node2D



@onready var block1 = $Node2/block1
@onready var block2 = $Node2/block2
@onready var block3 = $Node2/block3
@onready var block4 = $Node2/block4
@onready var buttons = $Node.get_children()
#depricated

@onready var timer = $Timer

var color_types = ["Red","Green","Blue",'Yellow']
var target_color = "Red"

var target_button = null

func _ready():
	timer.start(1) 

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
		timer.start(2)
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

func _all_button_disabled():
	for button in buttons:
		if not button.disabled:
			return false
	return true		
	
	
func _on_1_pressed():
#	var color_matched = false
#	for button in red_blocks:
#		if button == target_button:
#			color_matched = true
#			break
	if $Node/picker1 == target_button:
		print("Correct!")
		print("color 1 is picked")
		target_button.disabled = true
		$Node/picker1/block1.texture = load("res://resources/art/yellownocolor.jpg")
		$Node2/block2.texture = load("res://resources/art/redcolor.jpg")
		$Node/picker1.disabled = true
	else:
		pass	
	

func _on_2_pressed():
	if $Node/picker2 == target_button:
		print("Correct!")
		print("color 2 is picked")
		$Node/picker2/block2.texture = load("res://resources/art/rednocolor.jpg")
		$Node2/block3.texture = load("res://resources/art/bluecolor.jpg")
		$Node/picker2.disabled = true
	else:
		pass	


func _on_3_pressed():
	if $Node/picker3 == target_button:
		print("Correct!")
		print("color 3 is picked")
		$Node/picker3/block3.texture = load("res://resources/art/bluenocolor.jpg")
		$Node2/block4.texture = load("res://resources/art/greencolor.jpg")
		$Node/picker3.disabled = true
	else:
		pass	
	

func _on_4_pressed():
	if $Node/picker4 == target_button:
		print("Correct!")
		print("color 4 is picked")
		$Node/picker4/block4.texture = load("res://resources/art/greennocolor.jpg")
		$Node2/block1.texture = load("res://resources/art/yellowcolor.jpg")
		$Node/picker4.disabled = true
	else:
		pass	
	

func _on_picker_1_ready():
	pass


func _on_picker_2_ready():
	pass # Replace with function body.


func _on_picker_3_ready():
	pass # Replace with function body.


func _on_picker_4_ready():
	pass # Replace with function body.


func _on_picker_1_pressed():
	_on_1_pressed()

func _on_picker_2_pressed():
	_on_2_pressed()


func _on_picker_3_pressed():
	_on_3_pressed()


func _on_picker_4_pressed():
	_on_4_pressed()


func _on_timer_timeout():
	if _all_button_disabled():
		get_tree().quit()
	else:	
		_timeout()


func _on_picker_5_pressed():
	pass # Replace with function body.


func _on_area_2d_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		if $Node/picker1 == target_button:
			print("Correct!")
			print("color 1 is picked")
			target_button.disabled = true
			$Node/picker1/block1.texture = load("res://resources/art/yellownocolor.jpg")
			$Node2/block2.texture = load("res://resources/art/redcolor.jpg")
			$Node/picker1.disabled = true
		else:
			pass	
