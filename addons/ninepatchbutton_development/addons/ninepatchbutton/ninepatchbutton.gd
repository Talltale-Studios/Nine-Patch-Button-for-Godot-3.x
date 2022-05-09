tool
extends Button


signal on_button_pressed()
signal on_button_toggled()
signal on_button_down()
signal on_button_up()
signal on_mouse_entered()
signal on_mouse_exited()


export var is_disabled : bool = false
export var enabled_normal : StyleBoxTexture
export var enabled_hover : StyleBoxTexture
export var enabled_focus : StyleBoxTexture
export var enabled_pressed : StyleBoxTexture


export var disabled_normal : StyleBoxTexture
export var disabled_hover : StyleBoxTexture
export var disabled_focus : StyleBoxTexture
export var disabled_pressed : StyleBoxTexture


export var enabled_pressed_sound : AudioStream
export var enabled_hover_sound : AudioStream
export var enabled_focus_sound : AudioStream

export var disabled_pressed_sound : AudioStream
export var disabled_hover_sound : AudioStream
export var disabled_focus_sound : AudioStream

var audio





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
	print(node,audio)
	audio.autoplay = false


func _prepare_styles() -> void:
	match is_disabled:
		false:
			set("custom_styles/hover", enabled_hover)
			set("custom_styles/pressed", enabled_pressed)
			set("custom_styles/focus", enabled_focus)
			set("custom_styles/normal", enabled_normal)
		true:
			set("custom_styles/hover", disabled_hover)
			set("custom_styles/pressed", disabled_pressed)
			set("custom_styles/focus", disabled_focus)
			set("custom_styles/normal", disabled_normal)

	#set("custom_styles/disabled", disabled_texture)


func _prepare_signals(signal_name,object,method) -> void:
	if not is_connected(signal_name,object,method):
		var err = connect(signal_name,object,method)
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


func _mouse_entered():
	match is_disabled:
		false:
			play_sound(enabled_hover_sound)
			emit_signal("on_mouse_entered")
		true:
			play_sound(disabled_hover_sound)


func _mouse_exited():
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
