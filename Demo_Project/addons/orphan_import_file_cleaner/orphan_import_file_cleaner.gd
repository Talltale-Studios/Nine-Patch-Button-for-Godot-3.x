tool
extends EditorPlugin


var _orphan_imports: Array = []

onready var confirmation_dialog: ConfirmationDialog = $ConfirmationDialog
onready var accept_dialog: AcceptDialog = $AcceptDialog


func _ready():
	confirmation_dialog.connect("confirmed", self, "_on_ConfirmationDialog_confirmed")


func _enter_tree():
	add_tool_menu_item("Orphan .import file cleaner", self, "_on_cleaner_pressed")
	add_child(preload("./confirmation_dialog.tscn").instance())
	add_child(preload("./accept_dialog.tscn").instance())


func _exit_tree():
	remove_tool_menu_item("Orphan .import file cleaner")
	confirmation_dialog.free()
	accept_dialog.free()


func _on_cleaner_pressed(ub):
	accept_dialog.rect_size = Vector2(83, 58)
	accept_dialog.dialog_text = ""

	var item_list: ItemList = confirmation_dialog.get_node("VBoxContainer/ScrollContainer/VBoxContainer/ItemList")
	item_list.clear()

	var found_files: Array = []
	var dir: Directory = Directory.new()
	var sub_directories: Array = ["res://"]

	while sub_directories.size() > 0:
		var path: String = sub_directories[0]
		var err: int = dir.open(path)
		if err == OK:
			dir.list_dir_begin()
			var file_name: String = dir.get_next()
			while not file_name.empty():
				if not file_name.begins_with("."):
					if dir.current_is_dir():
						sub_directories.append(path + file_name + "/")
					else:
						found_files.append(path + file_name)
				file_name = dir.get_next()
			sub_directories.erase(path)
		else:
			accept_dialog.dialog_text = "An error has occurred. Code: %d" % err
			accept_dialog.popup_centered()
			dir.list_dir_end()
			return

	dir.list_dir_end()

	_orphan_imports = []
	for import_file in found_files:
		if import_file.ends_with(".import"):
			var original_file: String = import_file.trim_suffix(".import")
			if not original_file in found_files:
				_orphan_imports.append(import_file)

	if not _orphan_imports.empty():
		for orphan_file in _orphan_imports:
			item_list.add_item(orphan_file)
		confirmation_dialog.popup_centered()
	else:
		accept_dialog.dialog_text = "No orphan .import files to delete."
		accept_dialog.popup_centered()


func _on_ConfirmationDialog_confirmed():
	var dir: Directory = Directory.new()
	var errors: Array = []
	for file in _orphan_imports:
		var err: int = dir.remove(file)
		if not err == OK:
			errors.append("%s (Error code %d)" % [file, err])

	_orphan_imports = []

	if not errors.empty():
		accept_dialog.dialog_text = "Could not remove the following files: \n"
		for e in errors:
			accept_dialog.dialog_text += e + " \n"
		accept_dialog.popup_centered()
