extends Node

var is_mixed := false 

var mixed_words := []
var words := []

func load_words_lists():
	var file_path = "res://src/entities/enemy/words.txt"  
	var file = FileAccess.open(file_path, FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	var linii = content.split("\n")
	
	for linie in linii:
		linie = linie.strip_edges()
		if linie.find("-") != -1:
			var parti = linie.split("-")
			words.append(parti[0].strip_edges())
			mixed_words.append(parti[1].strip_edges())

func _ready():
	load_words_lists()
