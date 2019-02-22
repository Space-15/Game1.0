extends Node



export(String, FILE, "*.tscn") var START_Tutorial


var map
var spawned = false
onready var player = $player
#onready var interface = $player/Interface
onready var pause = $CanvasLayer

#var alien = preload("res://Scenes/Character/Heydies.tscn").instance()





func initialize():
	remove_child(player)
	#remove_child(interface)
	remove_child(pause)

		
	  
	
	change_map(START_Tutorial)
	
func change_map(scene_path):
	
	
	#$AlienTimer.start()
	
	if map:
		map.remove_child(player)
		#map.remove_child(interface)
		map.remove_child(pause)
		
		remove_child(map)
		map.queue_free()
		
	map = load(scene_path).instance()
	
		
	add_child(map)
	#map.add_child(interface)
	map.add_child(pause)
	
	var playerSpawn = map.get_node("playerSpawnPoint")    
	
		

	
	map.add_child(player)
	
	player.global_position = playerSpawn.global_position
	

	
	
			
			
			
	
	#map.initialize()

	
	
func get_maps():
	var maps = []
	
	for Map in get_tree().get_nodes_in_group("maps"):
		maps.append(Map)
		
	return maps		
		
	
func get_doors():
	var doors = []
	for door in get_tree().get_nodes_in_group("doors"):
		if not map.is_a_parent_of(door):
			continue
		doors.append(door)
	print(doors.size())	
	return doors
	



##func _on_Timer_timeout():
#	for maps in get_maps():
#		if maps.has_node("AlienSpawnPoint"):
#			maps.add_child(alien)
#
#			var alienSpawn =  map.get_node("AlienSpawnPoint")
#			alien.global_position = alienSpawn.global_position
#			$AlienTimer.stop()
#
