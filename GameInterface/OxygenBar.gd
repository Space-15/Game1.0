extends HBoxContainer

signal maximum_changed(maximum)

var max_oxygen = 100 
var current_oxygen = 0 


	
func initialize(maximum):
	max_oxygen = maximum
	$TextureProgress.max_value = maximum
	$TextureProgress.value	= 100
	emit_signal("maximum_changed",max_oxygen)
	update_count_text($TextureProgress.value)
		
func _on_Interface_oxygen_changed(new_oxygen):
	$TextureProgress.value = new_oxygen
	update_count_text(new_oxygen)
	#animate_value(current_health, new_health)
	#update_count_text(new_health)
	#current_health = new_health
	

func update_count_text(value):
	$counter/Label.text = str(round(value)) + '/' + str(max_oxygen)
	
	
