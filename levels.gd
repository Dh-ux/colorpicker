extends Node2D



func _on_button_1_pressed():
	get_tree().change_scene_to_file("res://dialouge1.tscn")


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://dialouge2.tscn")


func _on_button_3_pressed():
	get_tree().change_scene_to_file("res://main3.tscn")
