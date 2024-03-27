extends Label

# should set score lable somewhere else but this will do for now
func _ready():
	CombatManager.score_lable = self
