tool
extends EditorPlugin


func _enter_tree() -> void:
	add_custom_type("NinePatchButton", "NinePatchRect", preload("res://addons/ninepatchbutton/ninepatchbutton.gd"), preload("res://addons/ninepatchbutton/ninepatchbutton.png"))


func _exit_tree() -> void:
	remove_custom_type("NinePatchButton")
