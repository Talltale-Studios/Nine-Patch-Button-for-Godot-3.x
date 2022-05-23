tool
extends Button


export var is_disabled : bool = false
export var can_hover_while_pressed : bool = false
export (int, "None", "On Exit", "On Enter", "Both") var hover_focus_mode = 0
export (int, "Stereo", "Surround", "Center") var mix_target = 0
export var bus_name = "Master"


var default_parameters = {
	# Enabled Textures
	enabled_normal_texture = null,
	enabled_normal_hover_texture = null,
	enabled_normal_focus_texture = null,
	enabled_pressed_texture = null,
	enabled_pressed_hover_texture = null,
	enabled_pressed_focus_texture = null,
	# Disabled Textures
	disabled_normal_texture = null,
	disabled_normal_hover_texture = null,
	disabled_normal_focus_texture = null,
	disabled_pressed_texture = null,
	disabled_pressed_hover_texture = null,
	disabled_pressed_focus_texture = null,
	# Enabled Sounds
	enabled_hover_sound = null,
	enabled_hover_volume_db = 0.0,
	enabled_hover_pitch_scale = 1.0,
	enabled_focus_sound = null,
	enabled_focus_volume_db = 0.0,
	enabled_focus_pitch_scale = 1.0,
	enabled_pressed_sound = null,
	enabled_pressed_volume_db = 0.0,
	enabled_pressed_pitch_scale = 1.0,
	enabled_pressed_hover_sound = null,
	enabled_pressed_hover_volume_db = 0.0,
	enabled_pressed_hover_pitch_scale = 1.0,
	enabled_pressed_focus_sound = null,
	enabled_pressed_focus_volume_db = 0.0,
	enabled_pressed_focus_pitch_scale = 1.0,
	enabled_pressed_release_sound = null,
	enabled_pressed_release_volume_db = 0.0,
	enabled_pressed_release_pitch_scale = 1.0,
	# Disabled Sounds
	disabled_hover_sound = null,
	disabled_hover_volume_db = 0.0,
	disabled_hover_pitch_scale = 1.0,
	disabled_focus_sound = null,
	disabled_focus_volume_db = 0.0,
	disabled_focus_pitch_scale = 1.0,
	disabled_pressed_sound = null,
	disabled_pressed_volume_db = 0.0,
	disabled_pressed_pitch_scale = 1.0,
	disabled_pressed_hover_sound = null,
	disabled_pressed_hover_volume_db = 0.0,
	disabled_pressed_hover_pitch_scale = 1.0,
	disabled_pressed_focus_sound = null,
	disabled_pressed_focus_volume_db = 0.0,
	disabled_pressed_focus_pitch_scale = 1.0,
}

# Enabled Texture Variables
var enabled_normal_texture : StyleBox
var enabled_normal_hover_texture : StyleBox
var enabled_normal_focus_texture : StyleBox
var enabled_pressed_texture : StyleBox
var enabled_pressed_hover_texture : StyleBox
var enabled_pressed_focus_texture : StyleBox
# Disabled Texture Variables
var disabled_normal_texture : StyleBox
var disabled_normal_hover_texture : StyleBox
var disabled_normal_focus_texture : StyleBox
var disabled_pressed_texture : StyleBox
var disabled_pressed_hover_texture : StyleBox
var disabled_pressed_focus_texture : StyleBox
# Enabled Sound Variables
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
var enabled_pressed_release_sound : AudioStream
var enabled_pressed_release_volume_db : float
var enabled_pressed_release_pitch_scale : float
# Disabled Sound Variables
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

# Script Logic Variables
var hovered : bool = false
var focused : bool = false

# Instanced Nodes
var audio : AudioStreamPlayer
var volume_db : float
var pitch_scale : float


func _ready() -> void:
	_prepare_signals("button_down", self, "_button_down")
	_prepare_signals("button_up", self, "_button_up")
	_prepare_signals("pressed", self, "_pressed")
	_prepare_signals("toggled", self, "_toggled")
	_prepare_signals("mouse_entered", self, "_mouse_entered")
	_prepare_signals("mouse_exited", self, "_mouse_exited")
	_prepare_signals("focus_entered", self, "_focus_entered")
	_prepare_signals("focus_exited", self, "_focus_exited")
	_prepare_styles()
	_prepare_audioplayer()


func _physics_process(delta: float) -> void:
	_prepare_styles()


# See https://github.com/Arnklit/ShellFurGodot/blob/main/addons/shell_fur/shell_fur_manager.gd
# for examples on how to use the `_get_property_list()` and the related
# `property_can_revert` and `property_get_revert` built-in functions!
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
		hint_string = "StyleBox",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	properties.append({
		name = "enabled_normal_hover_texture",
		type = TYPE_OBJECT,
		hint = PROPERTY_HINT_RESOURCE_TYPE,
		hint_string = "StyleBox",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	properties.append({
		name = "enabled_normal_focus_texture",
		type = TYPE_OBJECT,
		hint = PROPERTY_HINT_RESOURCE_TYPE,
		hint_string = "StyleBox",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	properties.append({
		name = "enabled_pressed_texture",
		type = TYPE_OBJECT,
		hint = PROPERTY_HINT_RESOURCE_TYPE,
		hint_string = "StyleBox",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	properties.append({
		name = "enabled_pressed_hover_texture",
		type = TYPE_OBJECT,
		hint = PROPERTY_HINT_RESOURCE_TYPE,
		hint_string = "StyleBox",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	properties.append({
		name = "enabled_pressed_focus_texture",
		type = TYPE_OBJECT,
		hint = PROPERTY_HINT_RESOURCE_TYPE,
		hint_string = "StyleBox",
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
		hint_string = "StyleBox",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	properties.append({
		name = "disabled_normal_hover_texture",
		type = TYPE_OBJECT,
		hint = PROPERTY_HINT_RESOURCE_TYPE,
		hint_string = "StyleBox",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	properties.append({
		name = "disabled_normal_focus_texture",
		type = TYPE_OBJECT,
		hint = PROPERTY_HINT_RESOURCE_TYPE,
		hint_string = "StyleBox",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	properties.append({
		name = "disabled_pressed_texture",
		type = TYPE_OBJECT,
		hint = PROPERTY_HINT_RESOURCE_TYPE,
		hint_string = "StyleBox",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	properties.append({
		name = "disabled_pressed_hover_texture",
		type = TYPE_OBJECT,
		hint = PROPERTY_HINT_RESOURCE_TYPE,
		hint_string = "StyleBox",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	properties.append({
		name = "disabled_pressed_focus_texture",
		type = TYPE_OBJECT,
		hint = PROPERTY_HINT_RESOURCE_TYPE,
		hint_string = "StyleBox",
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
		hint_string = "-80.0, 24.0",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	properties.append({
		name = "enabled_hover_pitch_scale",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "0.01, 4.0",
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
		hint_string = "-80.0, 24.0",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	properties.append({
		name = "enabled_focus_pitch_scale",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "0.01, 4.0",
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
		hint_string = "-80.0, 24.0",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	properties.append({
		name = "enabled_pressed_pitch_scale",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "0.01, 4.0",
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
		hint_string = "-80, 24.0",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	properties.append({
		name = "enabled_pressed_hover_pitch_scale",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "0.01, 4.0",
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
		hint_string = "-80.0, 24.0",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	properties.append({
		name = "enabled_pressed_focus_pitch_scale",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "0.01, 4.0",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	properties.append({
		name = "enabled_pressed_release_sound",
		type = TYPE_OBJECT,
		hint = PROPERTY_HINT_RESOURCE_TYPE,
		hint_string = "AudioStream",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	properties.append({
		name = "enabled_pressed_release_volume_db",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "-80.0, 24.0",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	properties.append({
		name = "enabled_pressed_release_pitch_scale",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "0.01, 4.0",
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
		hint_string = "-80.0, 24.0",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	properties.append({
		name = "disabled_hover_pitch_scale",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "0.01, 4.0",
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
		hint_string = "-80.0, 24.0",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	properties.append({
		name = "disabled_focus_pitch_scale",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "0.01, 4.0",
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
		hint_string = "-80.0, 24.0",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	properties.append({
		name = "disabled_pressed_pitch_scale",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "0.01, 4.0",
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
		hint_string = "-80.0, 24.0",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	properties.append({
		name = "disabled_pressed_hover_pitch_scale",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "0.01, 4.0",
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
		hint_string = "-80.0, 24.0",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	properties.append({
		name = "disabled_pressed_focus_pitch_scale",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "0.01, 4.0",
		usage = PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
	})
	
	return properties


func property_can_revert(property : String) -> bool:
	if not default_parameters.has(property):
		return false
	if get(property) != default_parameters[property]:
		return true
	return false


func property_get_revert(property : String):
	return default_parameters[property]


func play_sound(file) -> void:
	audio.stream = file
	audio.play()


func _prepare_signals(signal_name, object, method) -> void:
	if not is_connected(signal_name, object, method):
		var err = connect(signal_name, object, method)
		if err != OK:
			print("Error can't connect signal on: ", str(object))


func _prepare_styles() -> void:
	match disabled:
		true:
			set("custom_styles/disabled", disabled_normal_texture)
		false:
			match is_disabled:
				false:
					set("custom_styles/normal", enabled_normal_texture)
					set("custom_styles/pressed", enabled_pressed_texture)
					match pressed:
						true:
							set("custom_styles/hover", enabled_pressed_hover_texture)
							set("custom_styles/focus", enabled_pressed_focus_texture)
						false:
							set("custom_styles/hover", enabled_normal_hover_texture)
							set("custom_styles/focus", enabled_normal_focus_texture)
				true:
					set("custom_styles/normal", disabled_normal_texture)
					set("custom_styles/pressed", disabled_pressed_texture)
					set("custom_styles/hover", disabled_normal_hover_texture)
					set("custom_styles/focus", disabled_normal_focus_texture)


func _prepare_audioplayer() -> void:
	var stream_player = AudioStreamPlayer.new()
	self.add_child(stream_player)
	stream_player.name = "AudioStreamPlayer"
	audio = $AudioStreamPlayer
	audio.autoplay = false
	volume_db = audio.volume_db
	pitch_scale = audio.pitch_scale


func _button_down() -> void:
	match is_disabled:
		false:
			pass
		true:
			pass


func _pressed() -> void:
	match is_disabled:
		false:
			match pressed:
				true:
					play_sound(enabled_pressed_sound)
					volume_db = enabled_pressed_volume_db
					pitch_scale = enabled_pressed_pitch_scale
				false:
					play_sound(enabled_pressed_release_sound)
					volume_db = enabled_pressed_release_volume_db
					pitch_scale = enabled_pressed_release_pitch_scale
		true:
			play_sound(disabled_pressed_sound)
			volume_db = disabled_pressed_volume_db
			pitch_scale = disabled_pressed_pitch_scale
			pressed = true


func _toggled(button_pressed: bool) -> void:
	match is_disabled:
		false:
			pass
		true:
			pass


func _button_up() -> void:
	match is_disabled:
		false:
			pass
		true:
			pass


func _mouse_entered() -> void:
	hovered = true
	if hover_focus_mode == 2 or hover_focus_mode == 3:
		focused = true
		grab_focus()
	match is_disabled:
		false:
			if hovered and not pressed:
				play_sound(enabled_hover_sound)
				volume_db = enabled_hover_volume_db
				pitch_scale = enabled_hover_pitch_scale
			if hovered and pressed:
				play_sound(enabled_pressed_hover_sound)
				volume_db = enabled_pressed_hover_volume_db
				pitch_scale = enabled_pressed_hover_pitch_scale
		true:
			if hovered and not pressed:
				play_sound(disabled_hover_sound)
				volume_db = disabled_hover_volume_db
				pitch_scale = disabled_hover_pitch_scale
			if hovered and pressed:
				play_sound(disabled_pressed_hover_sound)
				volume_db = disabled_pressed_hover_volume_db
				pitch_scale = disabled_pressed_hover_pitch_scale


func _mouse_exited() -> void:
	hovered = false
	if hover_focus_mode == 1 or hover_focus_mode == 3:
		focused = false
		release_focus()
	match is_disabled:
		false:
			pass
		true:
			pass


func _focus_entered() -> void:
	focused = true
	match is_disabled:
		false:
			if focused and not pressed:
				play_sound(enabled_focus_sound)
				volume_db = enabled_focus_volume_db
				pitch_scale = enabled_focus_pitch_scale
			if focused and pressed:
				play_sound(enabled_pressed_focus_sound)
				volume_db = enabled_pressed_focus_volume_db
				pitch_scale = enabled_pressed_focus_pitch_scale
		true:
			if focused and not pressed:
				play_sound(disabled_focus_sound)
				volume_db = disabled_focus_volume_db
				pitch_scale = disabled_focus_pitch_scale
			if focused and pressed:
				play_sound(disabled_pressed_focus_sound)
				volume_db = disabled_pressed_focus_volume_db
				pitch_scale = disabled_pressed_focus_pitch_scale


func _focus_exited() -> void:
	focused = false
	match is_disabled:
		false:
			pass
		true:
			pass
