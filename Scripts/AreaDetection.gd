extends Area2D

export(String, FILE, "*.tscn") var next_world_scene

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "player":
			Global.Player.take_damage(20)
			#Global.Health.take_damage()
			get_tree().change_scene(next_world_scene)
			
			
		