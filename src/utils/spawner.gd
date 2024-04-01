extends Path2D

@onready var enemy := preload("res://src/entities/enemy/enemy.tscn")
@onready var spawn_timer := $Timer

var rng = RandomNumberGenerator.new()

func reset_timer():
	spawn_timer.wait_time = rng.randi_range(2, 4)
	spawn_timer.start()

func spawn_enemy():
	var e = enemy.instantiate()
	CombatManager.add_enemy(e)
	self.add_child.call_deferred(e)

func _ready():
	rng.randomize()
	spawn_enemy()
	reset_timer()

func _on_timer_timeout():
	spawn_enemy()
	reset_timer()
