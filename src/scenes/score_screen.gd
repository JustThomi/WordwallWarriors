extends Control

# quick and dirty fix...
func _ready():
	$VBoxContainer/Score.text = str(CombatManager.highscore)
