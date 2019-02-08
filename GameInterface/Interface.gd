extends Control

signal health_changed(health)
signal oxygen_changed(oxygen)

func _ready():
	var health_node = null
	var oxygen_node = null
	for node in get_tree().get_nodes_in_group("actors"):
		if node.name =="player":
			health_node = node.get_node("Health")
			$Bars/LifeBar.initialize(health_node.max_health)
			oxygen_node = node.get_node("Oxygen")
			$Bars/OxygenBar.initialize(oxygen_node.max_oxygen)
			break
			
func _on_Health_health_changed(health):
	emit_signal("health_changed", health)

func _on_Oxygen_oxygen_changed(oxygen):
	emit_signal("oxygen_changed", oxygen)
	
	

	