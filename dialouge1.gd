extends Node2D

var dialogues = ['Aaaaah my painting!!!','I just stepped out for a moment, how did my painting end up like this?','Curse those color-thieving pixies, feasting on my paints like they are some kind of buffet!','Picking on me, a poor city bird just trying to cope with the daily grind! I will catch you all.','Give me back my colors, my painting, my dreams!!','...But some of the colors seem to be drying.','I need to hurry and restore them before time runs out, would you lend me a hand?','Hmm, it’s quite straightforward.','Just absorb the paint from the damaged palette in the order I caught the pixies.','Let us get to work!']
var d_index = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	update_text(dialogues[d_index])
	d_index = 1

func update_text(text = "error"):
	$Panel/Label.set_text(text)
	
	$Panel/Label.visible_ratio = 0
	var tween = create_tween()
	tween.tween_property($Panel/Label, "visible_ratio", 1, 2)
	#tween.set_trans(Tween.TRANS_CUBIC)


func _on_button_pressed():
	if d_index < dialogues.size():
		update_text(dialogues[d_index])
		d_index += 1
	else:
		get_tree().change_scene_to_file("res://main.tscn")
