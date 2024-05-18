extends PathFollow2D

@onready var text := $Label
@onready var move_up = $Area2D/AnimatedSprite2D

var verStr : String
var words = []
var ver_words = []
var index = -1
var lvl = 0
var lvlWords = 0


func read_list():
	var file_path = "res://src/entities/enemy/words.txt"  
	var file = FileAccess.open(file_path, FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	var linii = content.split("\n")
	
	for linie in linii:
		linie = linie.strip_edges()
		if linie.find("-") != -1:
			var parti = linie.split("-")
			ver_words.append(parti[0].strip_edges())
			words.append(parti[1].strip_edges())


const SPEED := 100
var rng = RandomNumberGenerator.new()

func set_word():
	index = rng.randi_range(0, lvlWords)
	print(index)
	print(lvlWords)
	verStr = ver_words[index]
	text.text = words[index]
	

func move(delta):
	self.progress += SPEED * delta

func _ready():
	lvl = get_tree().root.get_child(1).get_name()
	print(lvl)
	if lvl == "Level1":
		lvlWords = 100
	if lvl == "Level2":
		lvlWords = 150
	if lvl == "Level3":
		lvlWords = 200
	if lvl == "Level4":
		lvlWords = 250
	if lvl == "Level5":
		lvlWords = 350
	read_list()
	rng.randomize()
	move_up.play("move")
	set_word()

func _process(delta):
	move(delta)
