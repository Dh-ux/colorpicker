extends Node2D

var dialogues = ['Hello, I am XXX','Next line','Start Game!','New lines here']
var d_index = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	update_text(dialogues[d_index])
	d_index = 1

func update_text(text = "error"):
	$Panel/Label.set_text(text)
	
	$Panel/Label.visible_ratio = 0
	var tween = create_tween()
	tween.tween_property($Panel/Label, "visible_ratio", 1, 1)
	#tween.set_trans(Tween.TRANS_CUBIC)


func _on_button_pressed():
	if d_index < dialogues.size():
		update_text(dialogues[d_index])
		d_index += 1
	else:
		get_tree().change_scene_to_file("res://main.tscn")
