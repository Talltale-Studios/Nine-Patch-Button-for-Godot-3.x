tool
extends Button


signal on_button_pressed()
signal on_button_toggled()
signal on_button_down()
signal on_button_up()
signal on_mouse_entered()
signal on_mouse_exited()

export var is_disabled : bool = false
export (int, "Stereo", "Surround", "Center") var mix_target = 0
export var bus_name = "Master"

var default_parameters = {
	# Enabled Textures
	enabled_normal_texture = null,
	enabled_hover_texture = null,
	enabled_focus_texture = null,
	enabled_pressed_texture = null,
	# Disabled Textures
	disabled_normal_texture = null,
	disabled_hover_texture = null,
	disabled_focus_texture = null,
	disabled_pressed_texture = null,
	# Enabled Sounds
	enabled_hover_sound = null,
	enabled_hover_volume_db = 0,
	enabled_hover_pitch_scale = 1,
	enabled_focus_sound = null,
	enabled_focus_volume_db = 0,
	enabled_focus_pitch_scale = 1,
	enabled_pressed_sound = null,
	enabled_pressed_volume_db = 0,
	enabled_pressed_pitch_scale = 1,
	enabled_pressed_hover_sound = null,
	enabled_pressed_hover_volume_db = 0,
	enabled_pressed_hover_pitch_scale = 1,
	enabled_pressed_focus_sound = null,
	enabled_pressed_focus_volume_db = 0,
	enabled_pressed_focus_pitch_scale = 1,
	# Disabled Sounds
	disabled_hover_sound = null,
	disabled_hover_volume_db = 0,
	disabled_hover_pitch_scale = 1,
	disabled_focus_sound = null,
	disabled_focus_volume_db = 0,
	disabled_focus_pitch_scale = 1,
	disabled_pressed_sound = null,
	disabled_pressed_volume_db = 0,
	disabled_pressed_pitch_scale = 1,
	disabled_pressed_hover_sound = null,
	disabled_pressed_hover_volume_db = 0,
	disabled_pressed_hover_pitch_scale = 1,
	disabled_pressed_focus_sound = null,
	disabled_pressed_focus_volume_db = 0,
	disabled_pressed_focus_pitch_scale = 1,
}

# Enabled Textures
var enabled_normal_texture : StyleBoxTexture
var enabled_hover_texture : StyleBoxTexture
var enabled_focus_texture : StyleBoxTexture
var enabled_pressed_texture : StyleBoxTexture
# Disabled Textures
var disabled_normal_texture : StyleBoxTexture
var disabled_hover_texture : StyleBoxTexture
var disabled_focus_texture : StyleBoxTexture
var disabled_pressed_texture : StyleBoxTexture
# Enabled Sounds
var enabled_hover_sound : AudioStream
var enabled_hover_volume_db : float
var enabled_hover_pitch_scale : float
var enabled_focus_sound : AudioStream
var enabled_focus_volume_db : float
var enabled_focus_pitch_scale : float
var enabled_pressed_sound : AudioStream
var enabled_pressed_volume_db : float
var enabled_pressed_pitch_scale : float
var enabled_pressed_hover_sound : AudioStream
var enabled_pressed_hover_volume_db : float
var enabled_pressed_hover_pitch_scale : float
var enabled_pressed_focus_sound : AudioStream
var enabled_pressed_focus_volume_db : float
var enabled_pressed_focus_pitch_scale : float
# Disabled Sounds
var disabled_hover_sound : AudioStream
var disabled_hover_volume_db : float
var disabled_hover_pitch_scale : float
var disabled_focus_sound : AudioStream
var disabled_focus_volume_db : float
var disabled_focus_pitch_scale : float
var disabled_pressed_sound : AudioStream
var disabled_pressed_volume_db : float
var disabled_pressed_pitch_scale : float
var disabled_pressed_hover_sound : AudioStream
var disabled_pressed_hover_volume_db : float
var disabled_pressed_hover_pitch_scale : float
var disabled_pressed_focus_sound : AudioStream
var disabled_pressed_focus_volume_db : float
var disabled_pressed_focus_pitch_scale : float

var audio


# See https://github.com/Arnklit/ShellFurGodot/blob/main/addons/shell_fur/shell_fur_manager.gd
# for examples on how to work with the `_get_property_list()` built-in function!
func _get_property_list() -> Array:
	var properties := Array()

	properties.append({
		name = "Enabled Textures",
		type = TYPE_NIL,
		hint_string = "enabled_",
		usage = PROPERTY_USAGE_GROUP | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "enabled_normal_texture",
		type = TYPE_OBJECT,
		hint = PROPERTY_HINT_RESOURCE_TYPE,
		hint_string = "StyleBoxTexture",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "enabled_hover_texture",
		type = TYPE_OBJECT,
		hint = PROPERTY_HINT_RESOURCE_TYPE,
		hint_string = "StyleBoxTexture",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "enabled_focus_texture",
		type = TYPE_OBJECT,
		hint = PROPERTY_HINT_RESOURCE_TYPE,
		hint_string = "StyleBoxTexture",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	properties.append({
		name = "enabled_pressed_texture",
		type = TYPE_OBJECT,
		hint = PROPERTY_HINT_RESOURCE_TYPE,
		hint_string = "StyleBoxTexture",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "Disabled Textures",
		type = TYPE_NIL,
		hint_string = "disabled_",
		usage = PROPERTY_USAGE_GROUP | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "disabled_normal_texture",
		type = TYPE_OBJECT,
		hint = PROPERTY_HINT_RESOURCE_TYPE,
		hint_string = "StyleBoxTexture",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "disabled_hover_texture",
		type = TYPE_OBJECT,
		hint = PROPERTY_HINT_RESOURCE_TYPE,
		hint_string = "StyleBoxTexture",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "disabled_focus_texture",
		type = TYPE_OBJECT,
		hint = PROPERTY_HINT_RESOURCE_TYPE,
		hint_string = "StyleBoxTexture",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	properties.append({
		name = "disabled_pressed_texture",
		type = TYPE_OBJECT,
		hint = PROPERTY_HINT_RESOURCE_TYPE,
		hint_string = "StyleBoxTexture",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})


	properties.append({
		name = "Enabled Sounds",
		type = TYPE_NIL,
		hint_string = "enabled_",
		usage = PROPERTY_USAGE_GROUP | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "enabled_hover_sound",
		type = TYPE_OBJECT,
		hint = PROPERTY_HINT_RESOURCE_TYPE,
		hint_string = "AudioStream",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "enabled_hover_volume_db",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "-80, 24",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "enabled_hover_pitch_scale",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "0.01, 4",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "enabled_focus_sound",
		type = TYPE_OBJECT,
		hint = PROPERTY_HINT_RESOURCE_TYPE,
		hint_string = "AudioStream",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "enabled_focus_volume_db",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "-80, 24",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "enabled_focus_pitch_scale",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "0.01, 4",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "enabled_pressed_sound",
		type = TYPE_OBJECT,
		hint = PROPERTY_HINT_RESOURCE_TYPE,
		hint_string = "AudioStream",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "enabled_pressed_volume_db",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "-80, 24",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "enabled_pressed_pitch_scale",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "0.01, 4",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "enabled_pressed_hover_sound",
		type = TYPE_OBJECT,
		hint = PROPERTY_HINT_RESOURCE_TYPE,
		hint_string = "AudioStream",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "enabled_pressed_hover_volume_db",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "-80, 24",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "enabled_pressed_hover_pitch_scale",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "0.01, 4",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "enabled_pressed_focus_sound",
		type = TYPE_OBJECT,
		hint = PROPERTY_HINT_RESOURCE_TYPE,
		hint_string = "AudioStream",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "enabled_pressed_focus_volume_db",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "-80, 24",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "enabled_pressed_focus_pitch_scale",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "0.01, 4",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})

	properties.append({
		name = "Disabled Sounds",
		type = TYPE_NIL,
		hint_string = "disabled_",
		usage = PROPERTY_USAGE_GROUP | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "disabled_hover_sound",
		type = TYPE_OBJECT,
		hint = PROPERTY_HINT_RESOURCE_TYPE,
		hint_string = "AudioStream",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "disabled_hover_volume_db",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "-80, 24",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "disabled_hover_pitch_scale",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "0.01, 4",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "disabled_focus_sound",
		type = TYPE_OBJECT,
		hint = PROPERTY_HINT_RESOURCE_TYPE,
		hint_string = "AudioStream",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "disabled_focus_volume_db",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "-80, 24",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "disabled_focus_pitch_scale",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "0.01, 4",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "disabled_pressed_sound",
		type = TYPE_OBJECT,
		hint = PROPERTY_HINT_RESOURCE_TYPE,
		hint_string = "AudioStream",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "disabled_pressed_volume_db",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "-80, 24",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "disabled_pressed_pitch_scale",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "0.01, 4",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "disabled_pressed_hover_sound",
		type = TYPE_OBJECT,
		hint = PROPERTY_HINT_RESOURCE_TYPE,
		hint_string = "AudioStream",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "disabled_pressed_hover_volume_db",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "-80, 24",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "disabled_pressed_hover_pitch_scale",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "0.01, 4",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "disabled_pressed_focus_sound",
		type = TYPE_OBJECT,
		hint = PROPERTY_HINT_RESOURCE_TYPE,
		hint_string = "AudioStream",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "disabled_pressed_focus_volume_db",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "-80, 24",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	properties.append({
		name = "disabled_pressed_focus_pitch_scale",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "0.01, 4",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})

	return properties


func property_can_revert(property : String) -> bool:
	if not default_parameters.has(property):
		return false
	if get(property) != default_parameters[property]:
		return true
	return false


func _ready() -> void:
	_prepare_signals("button_down", self, "_button_down")
	_prepare_signals("button_up", self, "_button_up")
	_prepare_signals("pressed", self, "_pressed")
	_prepare_signals("toggled", self, "_toggled")
	_prepare_signals("mouse_entered",self,"_mouse_entered")
	_prepare_signals("mouse_exited",self,"_mouse_exited")
	_prepare_styles()
	_prepare_audioplayer()


func _physics_process(delta: float) -> void:
	_prepare_styles()


func _prepare_audioplayer() -> void:
	var node = AudioStreamPlayer.new()
	self.add_child(node)
	node.name = "AudioStreamPlayer"
	audio = $AudioStreamPlayer
	audio.autoplay = false


func _prepare_styles() -> void:
	match disabled:
		true:
			set("custom_styles/disabled", disabled_normal_texture)
		false:
			match is_disabled:
				false:
					set("custom_styles/normal", enabled_normal_texture)
					set("custom_styles/hover", enabled_hover_texture)
					set("custom_styles/focus", enabled_focus_texture)
					set("custom_styles/pressed", enabled_pressed_texture)
				true:
					set("custom_styles/normal", disabled_normal_texture)
					set("custom_styles/hover", disabled_hover_texture)
					set("custom_styles/focus", disabled_focus_texture)
					set("custom_styles/pressed", disabled_pressed_texture)


func _prepare_signals(signal_name, object, method) -> void:
	if not is_connected(signal_name, object, method):
		var err = connect(signal_name, object, method)
		if err != OK:
			print("Error can't connect signal on: ", str(object))


func _button_down() -> void:
	match is_disabled:
		false:
			emit_signal("on_button_down")
		true:
			pass


func _button_up() -> void:
	match is_disabled:
		false:
			emit_signal("on_button_up")
		true:
			pass


func _mouse_entered() -> void:
	match is_disabled:
		false:
			play_sound(enabled_hover_sound)
			emit_signal("on_mouse_entered")
		true:
			play_sound(disabled_hover_sound)


func _mouse_exited() -> void:
	match is_disabled:
		false:
			emit_signal("on_mouse_exited")
		true:
			pass


func _pressed() -> void:
	match is_disabled:
		false:
			play_sound(enabled_pressed_sound)
			emit_signal("is_button_pressed")
		true:
			play_sound(disabled_pressed_sound)
			pressed = false


func _toggled(button_pressed: bool) -> void:
	match is_disabled:
		false:
			emit_signal("is_button_toggled")
		true:
			pass


func play_sound(file) -> void:
	audio.stream = file
	audio.play()
