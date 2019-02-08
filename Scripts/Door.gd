extends Area2D

signal player_entered(next_map)



export(String, FILE, "*.tscn") var next_map
var player = preload("res://Scenes/Character/attack2.tscn")


export(bool) var ACTIVE_AT_START = true

func _ready():
	set_active(ACTIVE_AT_START)
	assert next_map !=""
	
		
#func _on_body_entered(body):
#	if body.name == "player":
#		print("player detected")
#		emit_signal("player_entered", next_map)
		
	    
		
		
		
		
		
		
		
	
	

	
func set_active(value):
	visible = value
	$CollisionShape2D.disabled = not value			

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "player":
			#Global.Player.take_damage(20)
			#Global.Health.take_damage()
			emit_signal("player_entered", next_map)
			#get_tree().change_scene(next_world_scene)

			
		




# replace with function body



