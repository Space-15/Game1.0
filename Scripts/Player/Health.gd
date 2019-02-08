extends Node

signal health_changed(new_health)
#signal damage_taken(new_health)

var health = 0
export(int) var max_health = 100 

func _ready():
	Global.Health = self
	health =  max_health
	emit_signal("health_changed", health)
	
func set_maximum(value):
	max_health = max(0,value)
	
func take_damage(amount):
	health -=amount
	health = max(0,health)
	emit_signal("health_changed", health)
	#emit_signal("damage_taken",health)
	
		
func heal(amount):
	if health + amount > 100:
		health = 100
	else:
		health+=amount	
	
	emit_signal("health_changed", health)
	
func getHealth():
	return health					