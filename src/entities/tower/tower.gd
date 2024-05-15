extends Sprite2D
@onready var animated_sprite_2d = $HitBox/AnimatedSprite2D
@onready var hp_bar = $HealthBar
var health = 100
var animation_played = false
func take_damage(dmg):
	animated_sprite_2d.speed_scale = 3.0 
	health -= dmg
	hp_bar.value = health
	start_fire_animation()
	if check_dead():
		CombatManager.lose_screen.visible = true
	await get_tree().create_timer(0.2).timeout
	stop_fire_animation()
func start_fire_animation():
	if not animated_sprite_2d.is_playing():
		animated_sprite_2d.visible = true
		print("Starting fire animation")
		animated_sprite_2d.play("fire")
		animated_sprite_2d.speed_scale = 10.0

func stop_fire_animation():
	if animated_sprite_2d.is_playing():
		animated_sprite_2d.visible = false
		print("Stopping fire animation")
		animated_sprite_2d.stop()
func check_dead():
	if health <= 0:
		return true
	return false

func _ready():
	hp_bar.value = health
	

func _on_hit_box_area_entered(area):
	CombatManager.remove_enemy(area.get_parent())
	take_damage(10)
