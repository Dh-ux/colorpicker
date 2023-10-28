extends Area2D

@onready var console = get_parent().get_parent()
@export_enum("DarkOrange", "DarkYellow", "DarkPurple", "DarkGreen", "DarkBlue") var color_type: String = "DarkOrange"

var health

func _ready():
	add_to_group(color_type)



func _on_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		if color_type == console.target_color:
			on_picked()
			console.color_picked(self)
			get_tree ().call_group(color_type,'on_picked')
			#call_groups(on_picked)



func on_picked():
	#health -= 1
	#set modular aplha -= 0.2
	$colorblock.hide()
	#health == 0:
		#console.color_fully_picked()






func _on_mouse_entered():
	set_modulate(Color(1.2,1.2,1.2,1))


func _on_mouse_exited():
	set_modulate(Color(1,1,1,1))
