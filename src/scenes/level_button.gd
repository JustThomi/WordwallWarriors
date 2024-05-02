extends Button

var level_path = "res://src/scenes/levels/"

func _on_pressed():
	get_tree().change_scene_to_file(level_path + text + '.tscn')
