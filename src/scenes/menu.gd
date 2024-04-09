extends Control

# LOOKS ARE A WORK IN PROGRESS! FUNCTIONALITY FIRST

@onready var settings = $CanvasLayer/Settings
@onready var menu_ui = $CanvasLayer/MenuUi
#var level_select = preload("res://src/scenes/levels/level_select.tscn")
var level_1 = preload("res://src/scenes/levels/level.tscn")


func _on_play_pressed():
	# will go to level select once I add that
	get_tree().change_scene_to_packed(level_1)

func _on_settings_pressed():
	settings.visible = true
	menu_ui.visible = false

func _on_quit_pressed():
	get_tree().quit()

# SETTINGS SIGNALS
func _on_back_pressed():
	settings.visible = false
	menu_ui.visible = true
