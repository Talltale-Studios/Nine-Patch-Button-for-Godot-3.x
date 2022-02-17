tool
extends EditorPlugin


func _enter_tree() -> void:
	add_custom_type("NinePatchButton", "NinePatchRect", preload("res://addons/NinePatchButton/NinePatchButton.gd"), preload("res://addons/NinePatchButton/NinePatchButton.png"))


func _exit_tree() -> void:
	remove_custom_type("NinePatchButton")
