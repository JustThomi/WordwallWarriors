extends CharacterBody2D

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

const SPEED := 100.0
var vel : Vector2
var target : Vector2
var rng = RandomNumberGenerator.new()

func set_word():
	var rnr = rng.randi_range(0, len(words) - 1)
	text.text = words[rnr]

func get_tower_position():
	return Vector2.ZERO

func _ready():
	rng.randomize()
	set_word()

# this moves in streight line. Will add path following later
func _physics_process(_delta):
	target = get_tower_position()
	velocity = position.direction_to(target) * SPEED

	move_and_slide()
