extends Node2D

var dialogues = ['......啊啊啊啊我的画！！！','不过是出了趟门，我的画怎么变成这样了！','可恶的偷色妖精！专盯着我的颜料吸收养分！','专欺负我这日常抗压的可怜城市鸟！看我不把你们抓起来。','还我颜色，还我画，还我梦想！！','...不过有些颜色看起来快干了。','我得加紧在时限之前修复它们，你愿意帮我一下吗？','嗯哼，方法很简单。','只要根据我抓妖精的顺序，吸取损坏画板上面的颜料就好。','加油吧！']
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
