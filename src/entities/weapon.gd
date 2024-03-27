extends LineEdit

func _ready():
	grab_focus()

# basically the attack function
func _on_text_submitted(new_text):
	CombatManager.check_attack(new_text)
	clear()
