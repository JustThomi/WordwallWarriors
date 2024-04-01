extends PathFollow2D

@onready var text := $Label

# will move this to separate file 
var words = [
	'circle',
	'study',
	'rain',
	'exam',
	'tree',
	'blue',
	'green',
	'red',
	'phone',
	'enemy',
]

const SPEED := 100
var rng = RandomNumberGenerator.new()

func set_word():
	var rnr = rng.randi_range(0, len(words) - 1)
	text.text = words[rnr]

func move(delta):
	self.progress += SPEED * delta

func _ready():
	rng.randomize()
	set_word()

func _process(delta):
	move(delta)
