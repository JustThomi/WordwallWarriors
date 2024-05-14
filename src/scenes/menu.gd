extends Control

# LOOKS ARE A WORK IN PROGRESS! FUNCTIONALITY FIRST

@onready var settings = $CanvasLayer/Settings
@onready var menu_ui = $CanvasLayer/MenuUi
@onready var score = $CanvasLayer/ScoreScreen
var level_select = preload("res://src/scenes/level_select.tscn")

# this is nooooot a good slution but it's quick af
func _on_play_pressed():
	get_tree().change_scene_to_packed(level_select)

func _on_settings_pressed():
	settings.show()
	menu_ui.hide()

func _on_quit_pressed():
	get_tree().quit()

func _on_score_pressed():
	score.show()
	menu_ui.hide()

# SETTINGS/SCORE SIGNALS
func _on_back_pressed():
	settings.hide()
	score.hide()
	menu_ui.show()
