extends Control

@export var _cube: CharacterBody3D
@export var _controller: Node
@onready var _fps : int = int(Performance.get_monitor(Performance.TIME_FPS))

@onready var _fpsLabel : Label = $DebugWindow/VBoxContainer/HBoxContainer/FPSLabel
@onready var _maxFpsLabel : Label = $DebugWindow/VBoxContainer/FPSLockContainer/FPSMaxLabel
@onready var _vSyncCheck : CheckButton = $DebugWindow/VBoxContainer/VSYNCContainer/VSYNCCheckButton
@onready var _playerVelocityLabel : Label = $DebugWindow/VBoxContainer/PlayerVelocityContainer/PlayerVelocityLabel
@onready var _playerSpeedLabel : Label = $DebugWindow/VBoxContainer/PlayerSpeedContainer/PlayerSpeedLabel
@onready var _inputLabel : Label = $DebugWindow/VBoxContainer/InputContainer/InputLabel

func _ready():
	_vSyncCheck.button_pressed = DisplayServer.window_get_vsync_mode()
	_maxFpsLabel.text = str(Engine.max_fps)

func _process(_delta):
	_update_fps()
	_update_max_fps()
	_update_player_velocity()
	_update_player_speed()
	_update_input()

func _update_fps():
	_fps = int(Performance.get_monitor(Performance.TIME_FPS))
	_fpsLabel.text = "FPS: " + str(_fps)

func _update_max_fps():
	_maxFpsLabel.text = str(Engine.max_fps)

func _on_fps_max_h_slider_value_changed(value):
	Engine.max_fps = value

func _on_vsync_check_button_toggled(button_pressed):
	if button_pressed:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)

func _update_player_velocity():
	_playerVelocityLabel.text = "Velocity: " + str(_cube.velocity.round())

func _update_player_speed():
	_playerSpeedLabel.text = "Speed: " + str(_cube.speed)

func _update_input():
	_inputLabel.text = "Input: " + str(_controller.input_speed)
