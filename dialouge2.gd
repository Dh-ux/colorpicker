extends Node2D

var dialogues = ['Nicely done!','I have rummaged through the workshop and it looks like there are more paintings that have been damaged...','The one with the ticking clock is this one.','Looks like it is a... wedding anniversary oil painting?','Why on earth would the pixies want to destroy something like this? Out of jealousy, perhaps?','Anyway, let us stick to our earlier teamwork, and I’m counting on you again!']
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
		get_tree().change_scene_to_file("res://main2.tscn")
