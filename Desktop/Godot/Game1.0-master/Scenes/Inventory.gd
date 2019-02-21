extends Node




func _physics_process(delta):
	if Input.is_action_just_pressed("i"):
		var new_inventory_state = not get_tree().paused
		get_tree.paused = new_inventory_state
		visible = new_inventory_state	