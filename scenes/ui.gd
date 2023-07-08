extends Control

@export var player: Player
@onready var fps : int = int(Performance.get_monitor(Performance.TIME_FPS))

@onready var fpsLabel : Label = $DebugWindow/VBoxContainer/HBoxContainer/FPSLabel
@onready var maxFpsLabel : Label = $DebugWindow/VBoxContainer/FPSLockContainer/FPSMaxLabel
@onready var vSyncCheck : CheckButton = $DebugWindow/VBoxContainer/VSYNCContainer/VSYNCCheckButton
@onready var playerVelocityLabel : Label = $DebugWindow/VBoxContainer/PlayerVelocityContainer/PlayerVelocityLabel
@onready var playerSpeedLabel : Label = $DebugWindow/VBoxContainer/PlayerSpeedContainer/PlayerSpeedLabel

func _ready():
	vSyncCheck.button_pressed = DisplayServer.window_get_vsync_mode()
	maxFpsLabel.text = str(Engine.max_fps)

func _process(_delta):
	_update_fps()
	_update_max_fps()
	_update_player_velocity()
	_update_player_speed()

func _update_fps():
	fps = int(Performance.get_monitor(Performance.TIME_FPS))
	fpsLabel.text = "FPS: " + str(fps)

func _update_max_fps():
	maxFpsLabel.text = str(Engine.max_fps)

func _on_fps_max_h_slider_value_changed(value):
	Engine.max_fps = value

func _on_vsync_check_button_toggled(button_pressed):
	if button_pressed:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)

func _update_player_velocity():
	playerVelocityLabel.text = "PlayerVelocity: " + str(player.velocity.round())

func _update_player_speed():
	playerSpeedLabel.text = "InputSpeed: " + str(player.controller.input_speed)
