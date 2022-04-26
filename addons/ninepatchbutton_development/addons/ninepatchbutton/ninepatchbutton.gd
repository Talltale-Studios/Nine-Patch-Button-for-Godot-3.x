## This plugin adds a new type of node that combines the features of the
## NinePatchRect, the Button, and the TextureButton, with the NinePatchRect
## being used as the base. We also added a custom sound system to the
## NinePatchButton, which allows you to assign sounds for some of its functions
## such as pressing it or hovering over it.
tool
extends NinePatchRect


signal button_down()
signal button_up()
signal pressed()
signal toggled(button_pressed)


export var normal_texture : Texture
export var hovered_texture : Texture
export var focused_texture : Texture
export var pressed_texture : Texture
export var pressed_hovered_texture : Texture
export var pressed_focused_texture : Texture
export var disabled_texture : Texture
export var disabled_hovered_texture : Texture
export var disabled_focused_texture : Texture
export var hovered_sound : AudioStream
export (float, -80, 24) var hovered_volume_db = 0
export (float, 0.01, 4) var hovered_pitch_scale = 1
export var focused_sound : AudioStream
export (float, -80, 24) var focused_volume_db = 0
export (float, 0.01, 4) var focused_pitch_scale = 1
export var pressed_sound : AudioStream
export (float, -80, 24) var pressed_volume_db = 0
export (float, 0.01, 4) var pressed_pitch_scale = 1
export var pressed_released_sound: AudioStream
export (float, -80, 24) var pressed_released_volume_db = 0
export (float, 0.01, 4) var pressed_released_pitch_scale = 1
export var pressed_hovered_sound : AudioStream
export (float, -80, 24) var pressed_hovered_volume_db = 0
export (float, 0.01, 4) var pressed_hovered_pitch_scale = 1
export var pressed_focused_sound : AudioStream
export (float, -80, 24) var pressed_focused_volume_db = 0
export (float, 0.01, 4) var pressed_focused_pitch_scale = 1
export var disabled_pressed_sound : AudioStream
export (float, -80, 24) var disabled_pressed_volume_db = 0
export (float, 0.01, 4) var disabled_pressed_pitch_scale = 1
export var disabled_hovered_sound : AudioStream
export (float, -80, 24) var disabled_hovered_volume_db = 0
export (float, 0.01, 4) var disabled_hovered_pitch_scale = 1
export var disabled_focused_sound : AudioStream
export (float, -80, 24) var disabled_focused_volume_db = 0
export (float, 0.01, 4) var disabled_focused_pitch_scale = 1
export (int, "Stereo", "Surround", "Center") var mix_target = 0
export var bus_name = "Master"
export var disabled : bool
export var toggle_mode : bool
export var shortcut_in_tooltip : bool = true
export var pressed : bool
export (int, "Button Press", "Button Release") var action_mode = 1
export (int, FLAGS, "Mouse Left", "Mouse Right", "Mouse Middle") var button_mask = 1
#export var keep_pressed_outside : bool
export var shortcut : ShortCut
export var group : ButtonGroup
export(String, FILE) var theme_path = "res://addons/ninepatchbutton/custom_theme.tres"


var flat : bool = true
var hovered : bool = false
var focused : bool = false
var just_pressed : bool = false


onready var button : Button
onready var txr_button : TextureButton
onready var audio : AudioStreamPlayer
onready var bus = AudioServer.get_bus_index(bus_name)


func _ready() -> void:
	theme = load(theme_path)
	instance_missing_nodes()
	connect_button_signals()
	node_properties_changer()


# Instance the Button, the TextureButton, and the AudioStreamPlayer nodes
# so that their properties and signals can be used for the NinePatchButton
func instance_missing_nodes() -> void:
	var a = Button.new()
	var b = TextureButton.new()
	var c = AudioStreamPlayer.new()
	add_child(a)
	add_child(b)
	add_child(c)
	a.owner = self
	b.owner = self
	c.owner = self
	a.name = "Button"
	b.name = "TextureButton"
	c.name = "AudioStreamPlayer"
	button = $Button
	txr_button = $TextureButton
	audio = $AudioStreamPlayer


# Connect the signals of the instanced Button to the NinePatchButton
func connect_button_signals() -> void:
	if not button.is_connected("button_down", self, "_on_Button_button_down"):
		button.connect("button_down", self, "_on_Button_button_down")
	if not button.is_connected("button_up", self, "_on_Button_button_up"):
		button.connect("button_up", self, "_on_Button_button_up")
	if not button.is_connected("pressed", self, "_on_Button_pressed"):
		button.connect("pressed", self, "_on_Button_pressed")
	if not button.is_connected("toggled", self, "_on_Button_toggled"):
		button.connect("toggled", self, "_on_Button_toggled")
	if not button.is_connected("focus_entered", self, "_on_Button_focus_entered"):
		button.connect("focus_entered", self, "_on_Button_focus_entered")
	if not button.is_connected("focus_exited", self, "_on_Button_focus_exited"):
		button.connect("focus_exited", self, "_on_Button_focus_exited")
	if not button.is_connected("mouse_entered", self, "_on_Button_mouse_entered"):
		button.connect("mouse_entered", self, "_on_Button_mouse_entered")
	if not button.is_connected("mouse_exited", self, "_on_Button_mouse_exited"):
		button.connect("mouse_exited", self, "_on_Button_mouse_exited")


# Change the properties of the instanced nodes so they're fit for use
func node_properties_changer() -> void:
	# Button Properties
	button.flat = flat
	button.shortcut_in_tooltip = shortcut_in_tooltip
	if toggle_mode:
		button.toggle_mode  = toggle_mode
	button.action_mode = action_mode
#	button.keep_pressed_outside = keep_pressed_outside
	button.shortcut = shortcut
	button.group = group
	button.rect_size = self.rect_size * 2
	button.rect_scale.x = 0.5
	button.rect_scale.y = 0.5
	button.hint_tooltip = self.hint_tooltip
	if button_mask == 1:
		button.button_mask == 1
	if button_mask == 2:
		button.button_mask == 2
	if button_mask == 3:
		button.button_mask == 3
	if button_mask == 4:
		button.button_mask == 4
	if button_mask == 5:
		button.button_mask == 5
	if button_mask == 6:
		button.button_mask == 6
	
	# AudioStreamPlayer Properties
	audio.mix_target = mix_target
	audio.bus = bus_name


func _process(_delta : float) -> void:
	button_texture_handler()


# Handle the textures of the NinePatchButton
func button_texture_handler() -> void:
	if not disabled:
		if just_pressed:
			if pressed:
				pressed = false
				just_pressed = false
			if not pressed:
				pressed = true
				just_pressed = false
		if pressed:
			if hovered:
				self.texture = pressed_hovered_texture
			if focused:
				self.texture = pressed_focused_texture
			if not hovered and not focused:
				self.texture = pressed_texture
		else:
			if hovered:
				self.texture = hovered_texture
			if focused:
				self.texture = focused_texture
			if not hovered and not focused:
				self.texture = normal_texture
	if disabled:
		if hovered:
			self.texture = disabled_hovered_texture
		if focused:
			self.texture = disabled_focused_texture
		if not hovered and not focused:
			self.texture = disabled_texture


func _on_Button_button_down() -> void:
	if not disabled:
		if not toggle_mode:
			audio.stream = pressed_sound
			audio.volume_db = pressed_volume_db
			audio.pitch_scale = pressed_pitch_scale
			audio.playing = true
		pressed = button.pressed
		emit_signal("button_down")
	else:
		audio.stream = disabled_pressed_sound
		audio.volume_db = disabled_pressed_volume_db
		audio.pitch_scale = disabled_pressed_pitch_scale
		audio.playing = true


func _on_Button_button_up() -> void:
	if not toggle_mode and not disabled:
		audio.stream = pressed_released_sound
		audio.volume_db = pressed_released_volume_db
		audio.pitch_scale = pressed_released_pitch_scale
		audio.playing = true
		pressed = button.pressed
		emit_signal("button_up")


func _on_Button_pressed() -> void:
	if not disabled:
		pressed = button.pressed
		emit_signal("pressed")


func _on_Button_toggled(button_pressed: bool) -> void:
	if not disabled:
		if button.pressed:
			audio.stream = pressed_sound
			audio.volume_db = pressed_volume_db
			audio.pitch_scale = pressed_pitch_scale
			audio.playing = true
		if not button.pressed:
			audio.stream = pressed_released_sound
			audio.volume_db = pressed_released_volume_db
			audio.pitch_scale = pressed_released_pitch_scale
			audio.playing = true
		pressed = button.pressed
		emit_signal("toggled")
	if disabled:
		audio.stream = disabled_pressed_sound
		audio.playing = true


func _on_Button_focus_entered() -> void:
	focused = true
	if not disabled:
		if focused and not pressed:
			audio.stream = focused_sound
			audio.volume_db = focused_volume_db
			audio.pitch_scale = focused_pitch_scale
			audio.playing = true
		if focused and pressed:
			audio.stream = pressed_focused_sound
			audio.volume_db = pressed_focused_volume_db
			audio.pitch_scale = pressed_focused_pitch_scale
			audio.playing = true
	if disabled:
		audio.stream = disabled_focused_sound
		audio.playing = true
	emit_signal("focus_entered")


func _on_Button_focus_exited() -> void:
	focused = false
	emit_signal("focus_exited")


func _on_Button_mouse_entered() -> void:
	hovered = true
	if not disabled:
		if hovered and not pressed:
			audio.stream = hovered_sound
			audio.volume_db = hovered_volume_db
			audio.pitch_scale = hovered_pitch_scale
			audio.playing = true
		if hovered and pressed:
			audio.stream = pressed_hovered_sound
			audio.volume_db = pressed_hovered_volume_db
			audio.pitch_scale = pressed_hovered_pitch_scale
			audio.playing = true
	if disabled:
		audio.stream = disabled_hovered_sound
		audio.volume_db = disabled_hovered_volume_db
		audio.pitch_scale = disabled_hovered_pitch_scale
		audio.playing = true
	emit_signal("mouse_entered")


func _on_Button_mouse_exited() -> void:
	hovered = false
	focused = false
	button.release_focus()
	emit_signal("mouse_exited")
