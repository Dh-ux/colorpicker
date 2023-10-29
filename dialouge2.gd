extends Node2D

var dialogues = ['干得不错！','我翻了翻工坊，看起来还有一些受损的画...','看标签时间紧迫的是这一副。','好像是一张...结婚纪念油画？','怎么这种作品妖精都要毁掉啊，因为酸吗？','总之，还是按照刚才的配合，这次也拜托你了！']
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
