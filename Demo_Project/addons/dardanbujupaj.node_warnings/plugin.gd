tool
extends EditorPlugin


const custom_warning_rules_file = "res://.node_warning_rules.json"
const default_warning_rules_file = "res://addons/dardanbujupaj.node_warnings/default_warning_rules.json"


var warning_list: Control
var tool_button: ToolButton
var warning_rules = {}


func _enter_tree() -> void:
	
	_load_warning_rules()
	
	warning_list = preload("res://addons/dardanbujupaj.node_warnings/WarningList.tscn").instance()
	warning_list.connect("warning_selected", self, "_on_WarningList_warning_selected")
	tool_button = add_control_to_bottom_panel(warning_list, "Warning List")
	
	# connect to signals for updating warning list
	connect("scene_changed", self, "_on_scene_changed")
	get_editor_interface().get_inspector().connect("property_edited", self, "_on_property_edited")
	
	# connect to updates to scene tree
	get_tree().connect("node_added", self, "_on_node_changed")
	get_tree().connect("node_removed", self, "_on_node_changed")
	get_tree().connect("node_renamed", self, "_on_node_changed")
	
	# initially update warning list
	check_current_scene()


func _exit_tree() -> void:
	# remove warning list from bottom dock
	remove_control_from_bottom_panel(warning_list)


# save current rules to custom rules file
func _save_warning_rules() -> void:
	var file = File.new()
	var err = file.open(custom_warning_rules_file, File.WRITE)
	if err != OK:
		printerr("Could not save rules. " + str(err))
	else:
		file.store_string(to_json(warning_rules))
	file.close()


# load rule from file
func _load_warning_rules(filename: String = custom_warning_rules_file) -> void:
	var file = File.new()
	if !file.file_exists(filename):
		filename = default_warning_rules_file
	
	var err = file.open(filename, File.READ)
	if err != OK:
		# TODO load default rules if tried to load custom
		printerr("Could not load rules. " + str(err))
	else:
		var line = file.get_as_text()
		warning_rules = parse_json(line)
		
	file.close()


# Update warning list when a property is edited
func _on_property_edited(property: String) -> void:
	check_current_scene()


# Update warning list when scene is changed
func _on_scene_changed(new_scene: Node) -> void:
	check_current_scene()


# Update warning list when tree is modified
func _on_node_changed(node: Node) -> void:
	var edited_scene = get_editor_interface().get_edited_scene_root()
	
	if edited_scene != null and edited_scene.is_a_parent_of(node):
		check_current_scene()



# check all nodes in the current scene for rule violations
func check_current_scene() -> void:
	
	var warnings = _check_for_possible_errors(get_editor_interface().get_edited_scene_root())
	
	# update warning list
	warning_list.warnings = warnings
	
	if tool_button != null:
		if len(warnings) > 0:
			tool_button.icon = preload("res://addons/dardanbujupaj.node_warnings/NodeWarning.svg")
		else:
			tool_button.icon = null


# select corresponding node when a warning was selected
func _on_WarningList_warning_selected(metadata: Dictionary):
	var node = metadata["node"]
	var property = metadata["rule"]["property"]
	
	get_editor_interface().inspect_object(node, property)


# check node and children recursively for rule violations
# returns an Array of Dictionarys conaining information for the warnings
func _check_for_possible_errors(node: Node) -> Array:
	var warnings = []
	
	if node != null:
		for type in warning_rules.keys():
			# check if there are rules for this node type
			if ClassDB.is_parent_class(node.get_class(), type):
				# check rules
				for rule in warning_rules[type]:
					if node.get(rule["property"]) == rule["critical_value"]:
						warnings.append({
							"node": node,
							"rule": rule
						})
			
		for child in node.get_children():
			warnings += _check_for_possible_errors(child)
	
	return warnings
