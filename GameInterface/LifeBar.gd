extends HBoxContainer

signal maximum_changed(maximum)

var max_health = 100 
var current_health = 0 


	
func initialize(maximum):
	max_health = maximum
	$TextureProgress.max_value = maximum
	$TextureProgress.value	= 100
	emit_signal("maximum_changed",max_health)
	update_count_text($TextureProgress.value)
		
func _on_Interface_health_changed(new_health):
	$TextureProgress.value = new_health
	update_count_text(new_health)
	#animate_value(current_health, new_health)
	#update_count_text(new_health)
	#current_health = new_health
	

func update_count_text(value):
	$counter/Label.text = str(round(value)) + '/' + str(max_health)
	
	


#func initialize(actor):
#	var health_node = actor.get_node("Health")
#	health_node.connect("health_changed",self,"_on_Actor_health_changed")
#	health_node.connect("health_depleted",self,"_on_Actor_health_depleted")
#
#	self.current_health = health_node.health
#	self.maximum_health = health_node.maximum_health
#
	
#
#func _on_Actor_health_changed(new_health):
#	self.health = new_health
#
#func _on_Actor_health_depleted():
#	queue_free()	
	
	


#func _on_Interface_health_changed(new_health):
#	self.health = new_health
#	animate_value(current_health)
#	current_health = health
#	$TextureProgress.value = health
#	#$Count/Number.text = "%s / %s" % [health, maximum_value]

#func animate_value(start, end):
	# $Tween.interpolate_property($TextureProgress, "value", start, end, 0.3, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	# $Tween.start() 
	
	








