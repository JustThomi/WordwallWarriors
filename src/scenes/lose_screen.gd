extends Control

func _ready():
	CombatManager.lose_screen = self

# reset in case u fail
func _input(event):
	if visible and event.is_action_pressed("ui_accept"):
		CombatManager.reset()
		get_tree().reload_current_scene()
