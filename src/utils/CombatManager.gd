extends Node

var score = 0
var score_lable : Label
var enemies = []

# BAD solution but it works for now
var lose_screen : Control

func reset():
	enemies = []
	score = 0

func add_enemy(e):
	enemies.append(e)

func remove_enemy(enemy):
	enemy.queue_free()
	enemies.remove_at(enemies.find(enemy))

func check_attack(word: String):
	for enemy in enemies:
		if word == enemy.verStr:
			score += 1
			score_lable.text = str(score)
			remove_enemy(enemy)

# TEMP EXIT TO MENU LOGIC
func _input(_event):
	if Input.is_action_just_pressed("pause"):
		get_tree().change_scene_to_file("res://src/scenes/menu.tscn")
