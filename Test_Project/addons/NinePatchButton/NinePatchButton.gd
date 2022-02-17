tool
extends NinePatchRect
# A new type of node that combines the features of the NinePatchRect, the
# Button and the TextureButton, with the NinePatchRect being used as the base.
# We also took the liberty to add a custom sound system to the NinePatchButton,
# which allows you to assign sounds for pressing it, hovering over it,
# attempting to press it while it is disabled, and focusing it.
# This Godot 3.x plugin was brought to you by Jurubu Entertainment.


signal button_down()
signal button_up()
signal pressed()
signal toggled(button_pressed)

export var normal_texture : Texture
export var pressed_texture : Texture
export var hovered_texture : Texture
export var disabled_texture : Texture
export var focused_texture : Texture
export var pressed_sound : AudioStream
export var hovered_sound : AudioStream
export var disabled_sound : AudioStream
export var focused_sound : AudioStream
export var disabled : bool
export var toggle_mode : bool
export var shortcut_in_tooltip : bool = true
export var pressed : bool
export (int, "Button Press", "Button Release") var action_mode = 1
export (int, FLAGS, "Mouse Left", "Mouse Right", "Mouse Middle") var button_mask = 1
export var keep_pressed_outside : bool
export var shortcut : ShortCut
export var group : ButtonGroup

var hovered : bool = false
var focused : bool = false
var ready : bool = false
var just_pressed : bool = false
var fake_pressed : bool = false

onready var button : Button
onready var audio : AudioStreamPlayer
onready var hovered_sprite : NinePatchRect
onready var focused_sprite : NinePatchRect


func _ready() -> void:
	instance_missing_nodes()
	node_property_changer()
	button_mask_handler()


func instance_missing_nodes() -> void:
	var a = Button.new()
	var b = AudioStreamPlayer.new()
	var c = NinePatchRect.new()
	var d = NinePatchRect.new()
	add_child(a)
	add_child(b)
	add_child(c)
	add_child(d)
	a.owner = self
	b.owner = self
	c.owner = self
	d.owner = self
	a.name = "Button"
	b.name = "AudioStreamPlayer"
	c.name = "NinePatchHover"
	d.name = "NinePatchFocus"
	button = $Button
	audio = $AudioStreamPlayer
	hovered_sprite = $NinePatchHover
	focused_sprite = $NinePatchFocus


func node_property_changer() -> void:
	# Button Signals
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
	
	# Button Properties
	button.flat = true # This property should not be touched
	button.shortcut_in_tooltip = shortcut_in_tooltip
	if toggle_mode:
		button.toggle_mode  = toggle_mode
	button.action_mode = action_mode
	button.keep_pressed_outside = keep_pressed_outside
	button.shortcut = shortcut
	button.group = group
	button.rect_size = self.rect_size * 2
	button.rect_scale.x = 0.5
	button.rect_scale.y = 0.5
	button.hint_tooltip = self.hint_tooltip
	button.focus_mode = focus_mode
	
	# Hovered Texture Properties
	hovered_sprite.region_rect = self.region_rect
	hovered_sprite.rect_size = self.rect_size
	hovered_sprite.patch_margin_left = self.patch_margin_left
	hovered_sprite.patch_margin_top = self.patch_margin_top
	hovered_sprite.patch_margin_right = self.patch_margin_right
	hovered_sprite.patch_margin_bottom = self.patch_margin_bottom
	hovered_sprite.axis_stretch_horizontal = self.axis_stretch_horizontal
	hovered_sprite.axis_stretch_vertical = self.axis_stretch_vertical
	
	# Focused Texture Properties
	focused_sprite.rect_size = self.rect_size
	focused_sprite.region_rect = self.region_rect
	focused_sprite.axis_stretch_horizontal = self.axis_stretch_horizontal
	focused_sprite.axis_stretch_vertical = self.axis_stretch_vertical
	focused_sprite.patch_margin_bottom = self.patch_margin_bottom
	focused_sprite.patch_margin_left = self.patch_margin_left
	focused_sprite.patch_margin_right = self.patch_margin_right
	focused_sprite.patch_margin_top = self.patch_margin_right
	
	# Other Variables
	ready = true


func button_mask_handler() -> void:
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


func _process(_delta : float) -> void:
	if ready:
		if not disabled:
			if just_pressed:
				if pressed:
					pressed = false
					just_pressed = false
				if not pressed:
					pressed = true
					just_pressed = false
			if pressed or fake_pressed:
				self.texture = pressed_texture
			else:
				if not disabled:
					self.texture = normal_texture
			if hovered:
				hovered_sprite.texture = hovered_texture
			else:
				hovered_sprite.texture = null
			if focused:
				focused_sprite.texture = focused_texture
			else:
				focused_sprite.texture = null
		if disabled:
			self.texture = disabled_texture


func _on_Button_button_down() -> void:
	if not disabled:
		fake_pressed = true
		emit_signal("button_down")


func _on_Button_button_up() -> void:
	if not toggle_mode and not disabled:
		pressed = false
		fake_pressed = false
		emit_signal("button_up")


func _on_Button_pressed() -> void:
	if not disabled:
		audio.stream = pressed_sound
		audio.playing = true
		pressed = true
		emit_signal("pressed")


func _on_Button_toggled(button_pressed: bool) -> void:
	if not disabled:
		if button_pressed:
			pressed = true
		else:
			pressed = false
		emit_signal("toggled")


func _on_Button_focus_entered() -> void:
	if not disabled:
		audio.stream = focused_sound
		audio.playing = true
		focused = true
		emit_signal("focus_entered")


func _on_Button_focus_exited() -> void:
	if not disabled:
		focused = false
		emit_signal("focus_exited")


func _on_Button_mouse_entered() -> void:
	if not disabled:
		audio.stream = hovered_sound
		audio.playing = true
		hovered = true
		emit_signal("mouse_entered")


func _on_Button_mouse_exited() -> void:
	if not disabled:
		hovered = false
		fake_pressed = false
		emit_signal("mouse_exited")
