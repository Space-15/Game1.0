extends Node



export(String, FILE, "*.tscn") var START  # this allows maploader to setup which scene to first load and can be changes anytime.


var map
var spawned = false
onready var player = $player #this gets the player node ready for use.
#onready var interface = $player/Interface
onready var pause = $CanvasLayer # this gets the pause node ready for use.
onready var inventory = $CanvasLayer2 # this gets the inventory ready for use. 

#var alien = preload("res://Scenes/Character/Heydies.tscn").instance()






		
	



func initialize(): # this method removes the instances of player, pause and inventory nodes on the maploader node
	remove_child(player)
	#remove_child(interface)
	remove_child(pause)
	remove_child(inventory)

		
	  
	
	change_map(START)
	
func change_map(scene_path):
	
	
	#$AlienTimer.start()  
	
	
	# this method is used when changing rooms /changing scenes  including loading first map.
	
	if map:     # a map's player, pause and inventory instances are removed from map before removing map instance and changing scene.
		map.remove_child(player) 
		map.remove_child(pause)
		map.remove_child(inventory)
		
		remove_child(map)
		map.queue_free()
		
	map = load(scene_path).instance()
	
		
		# new room/map/scene is added and then instances of the pause inventoryy and player are added.
		#carrying over the instances  allows data to be carried over so for example players health and oxygen arent reset to defaults.
		
	add_child(map)
	map.add_child(pause)
	map.add_child(inventory)
	
	var playerSpawn = map.get_node("playerSpawnPoint")     # stores spawnpoint node which is a position2D node which  has been placed on maps.
	
	map.add_child(player)
	
	player.global_position = playerSpawn.global_position # after adding player instance on map this changes players position to spawnpoint position.
	
	
	#map.initialize()

	
	
#func get_maps():
#	var maps = []
#
#	for Map in get_tree().get_nodes_in_group("maps"):
#		maps.append(Map)
#
#	return maps		
#
	
	
	
	# this function sets up a array which contains doors in a certain room/map/scene.
	# so in each room this function is run once to see how much doors there are and then they are connected to rooms in maingame node.
	
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
