tool
extends Control


signal warning_selected


var warnings: Array = [] setget _set_warnings

onready var item_list: ItemList = $ItemList
onready var filter: LineEdit = $Toolbar/Filter
onready var warning_count: Label = $Toolbar/WarningCount


func _set_warnings(new_warnings: Array):
	warnings = new_warnings
	_update_warning_list()


func _on_Filter_text_changed(new_text: String):
	_update_warning_list()


func _update_warning_list():
	warning_count.text = "%d warnings" % len(warnings) 
	
	item_list.clear()
	for warning in warnings:
		var node = warning["node"]
		var text = node.name + ": {property} == {critical_value}".format(warning["rule"])
		if filter.text == "" or filter.text in text:
			var index = item_list.get_item_count()
			item_list.add_item(text, preload("./NodeWarning.svg"), true)
			item_list.set_item_tooltip(index, warning["rule"]["description"])
			item_list.set_item_metadata(index, warning)


# select corresponding node when a warning was selected
func _on_ItemList_item_selected(index):
	var metadata = item_list.get_item_metadata(index)
	emit_signal("warning_selected", metadata)
