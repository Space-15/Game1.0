extends Node

signal oxygen_changed(new_oxygen)
#signal damage_taken(new_health)

var oxygen = 0
export(int) var max_oxygen = 100 

func _ready():
	Global.Oxygen = self
	oxygen =  max_oxygen
	emit_signal("oxygen_changed", oxygen)
	
#func set_maximum(value):
	#max_oxygen = max(0,value)
	
func lose_oxygen(amount):
	oxygen -=amount
	oxygen = max(0,oxygen)
	emit_signal("oxygen_changed", oxygen)
	#emit_signal("oxygen_lost",oxygen)
	
		
func gain_oxygen(amount):
	if oxygen + amount > 100:
		oxygen = 100
	else:
		oxygen+=amount
			
	
	
	#oxygen = max(oxygen, max_oxygen)
	emit_signal("oxygen_changed", oxygen)

func getOxygen():
	return oxygen						