extends Sprite2D

@onready var hp_bar = $HealthBar
var health = 100

func take_damage(dmg):
	health -= dmg
	hp_bar.value = health
	
	# this will be used to acutally trigger lose screen later
	if check_dead():
		get_parent().get_node("Enemies").process_mode = Node.PROCESS_MODE_DISABLED
		CombatManager.lose_screen.visible = true
	
func check_dead():
	if health <= 0:
		return true
	return false

func _ready():
	hp_bar.value = health

func _on_hit_box_body_entered(body):
	CombatManager.remove_enemy(body)
	take_damage(10)
