extends Node2D

var dialogues = ['Fantastic! Your help is like divine inspiration on a canvas!','Oh, take a look at this painting—it has quite the story behind it.','I created it while basking in the afterglow of my favorite concert, slightly tipsy with enthusiasm.','The joy and melodies of that night are all sealed within this canvas!','But those mischievous pixies have left their mark here, too.','You have got the hang of this restoration rhythm, right?','Let us get started, we must revive the symphony of colors before they are hushed into oblivion.']
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
		get_tree().change_scene_to_file("res://main3.tscn")
