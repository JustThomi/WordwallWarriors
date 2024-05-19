extends Control

# LOOKS ARE A WORK IN PROGRESS! FUNCTIONALITY FIRST

@onready var settings = $CanvasLayer/Settings
@onready var menu_ui = $CanvasLayer/MenuUi
@onready var score = $CanvasLayer/ScoreScreen
@onready var mixed_words_check = $CanvasLayer/Settings/VBoxContainer/VBoxContainer/CheckBox

var level_select = preload("res://src/scenes/level_select.tscn")

func _ready():
	mixed_words_check.button_pressed = WordsLoader.is_mixed

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

func _on_check_box_toggled(toggled_on):
	WordsLoader.is_mixed = toggled_on
