extends Node2D

@onready var enemy := preload("res://src/entities/enemy/enemy.tscn")
var rng = RandomNumberGenerator.new()

func spawn_enemy():
	var e = enemy.instantiate()
	CombatManager.add_enemy(e)
	
	# set pos to a random marker (no matter how many markers there are)
	var random_pos = rng.randi_range(0, get_child_count() - 1)
	e.transform = get_child(random_pos).transform

	get_parent().get_node('Enemies').add_child.call_deferred(e)

func _ready():
	rng.randomize()
	spawn_enemy()

# quick and dirty continuous spawn for testing
func _process(_delta):
	if len(CombatManager.enemies) < 4:
		spawn_enemy()
