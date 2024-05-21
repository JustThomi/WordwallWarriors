extends PathFollow2D

@onready var text := $Label
@onready var move_up = $Area2D/AnimatedSprite2D

var verStr : String
var lvl = 0
var lvlWords = 0

var dead := false
var speed := 100
var rng = RandomNumberGenerator.new()

func set_word():
	var index = rng.randi_range(0, lvlWords)
	
	if WordsLoader.is_mixed:
		verStr = WordsLoader.words[index]
		text.text = WordsLoader.mixed_words[index]
		speed = 50
	else: # for normal words gamemode
		verStr = WordsLoader.words[index]
		text.text = WordsLoader.words[index]

func move(delta):
	self.progress += speed * delta

func get_current_level():
	lvl = get_tree().root.get_child(2).get_name()
	
	match lvl:
		"Level1":
			lvlWords = 100
		"Level2":
			lvlWords = 150
		"Level3":
			lvlWords = 200
		"Level4":
			lvlWords = 250
		"Level5":
			lvlWords = 350

func _ready():
	rng.randomize()
	get_current_level()
	set_word()
	move_up.play("move")

func _process(delta):
	move(delta)
	if dead:
		queue_free()
