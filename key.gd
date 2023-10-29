extends Node2D

func _ready():
	pop()

func pop():
	set_modulate(Color(1,1,1,1))
	scale = Vector2.ZERO
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_BACK).set_ease(1)
	tween.tween_property(self, "scale", Vector2(1.38,1.38), 0.45)
	
func explode():
	
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_EXPO).set_ease(0)
	tween.tween_property(self, "scale", Vector2(3,3), 0.12)
	var tween1 = get_tree().create_tween()
	tween1.tween_property(self, "modulate", Color(1,1,1,0), 0.12)

func _process(delta):
	pass
