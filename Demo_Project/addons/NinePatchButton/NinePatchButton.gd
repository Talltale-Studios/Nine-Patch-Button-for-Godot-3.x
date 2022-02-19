## A new type of node that combines the features of the NinePatchRect, the
## Button and the TextureButton, with the NinePatchRect being used as the base.
## We also took the liberty to add a custom sound system to the NinePatchButton,
## which allows you to assign sounds for pressing it, hovering over it,
## attempting to press it while it is disabled, and focusing it.
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
export var focused_sound : AudioStream
export var pressed_sound : AudioStream
export var pressed_released_sound: AudioStream
export var pressed_hovered_sound : AudioStream
export var pressed_focused_sound : AudioStream
export var disabled_pressed_sound : AudioStream
export var disabled_hovered_sound : AudioStream
export var disabled_focused_sound : AudioStream
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


func _ready() -> void:
	instance_missing_nodes()
	node_property_changer()
	button_mask_handler()


func instance_missing_nodes() -> void:
	var a = Button.new()
	var b = AudioStreamPlayer.new()
	add_child(a)
	add_child(b)
	a.owner = self
	b.owner = self
	a.name = "Button"
	b.name = "AudioStreamPlayer"
	button = $Button
	audio = $AudioStreamPlayer


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
				if hovered:
					self.texture = pressed_hovered_texture
				if focused:
					self.texture = pressed_focused_texture
				if not hovered and not focused:
					self.texture = pressed_texture
			else:
				if not hovered and not focused:
					self.texture = normal_texture
				if hovered:
					self.texture = hovered_texture
				if focused:
					self.texture = focused_texture
		
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
			audio.playing = true
		pressed = button.pressed
		fake_pressed = button.pressed
		emit_signal("button_down")
	else:
		audio.stream = disabled_pressed_sound
		audio.playing = true


func _on_Button_button_up() -> void:
	if not toggle_mode and not disabled:
		audio.stream = pressed_released_sound
		audio.playing = true
		pressed = button.pressed
		fake_pressed = button.pressed
		emit_signal("button_up")


func _on_Button_pressed() -> void:
	if not disabled:
		pressed = button.pressed
		emit_signal("pressed")


func _on_Button_toggled(button_pressed: bool) -> void:
	if not disabled:
		if button.pressed:
			audio.stream = pressed_sound
			audio.playing = true
		if not button.pressed:
			audio.stream = pressed_released_sound
			audio.playing = true
		pressed = button.pressed
		fake_pressed = button.pressed
		emit_signal("toggled")
	if disabled:
		audio.stream = disabled_pressed_sound
		audio.playing = true


func _on_Button_focus_entered() -> void:
	focused = true
	if not disabled:
		if focused and not pressed:
			audio.stream = focused_sound
			audio.playing = true
		if focused and pressed:
			audio.stream = pressed_focused_sound
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
			audio.playing = true
		if hovered and pressed:
			audio.stream = pressed_hovered_sound
			audio.playing = true
	if disabled:
		audio.stream = disabled_hovered_sound
		audio.playing = true
	emit_signal("mouse_entered")


func _on_Button_mouse_exited() -> void:
	hovered = false
	fake_pressed = false
	emit_signal("mouse_exited")
