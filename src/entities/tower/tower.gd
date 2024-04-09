extends Sprite2D

@onready var hp_bar = $HealthBar
var health = 100

func take_damage(dmg):
	health -= dmg
	hp_bar.value = health
	
	if check_dead():
		CombatManager.lose_screen.visible = true
	
func check_dead():
	if health <= 0:
		return true
	return false

func _ready():
	hp_bar.value = health

func _on_hit_box_area_entered(area):
	CombatManager.remove_enemy(area.get_parent())
	take_damage(10)
