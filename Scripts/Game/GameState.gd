extends Node

onready var map_loader = $maploader
onready var inventory = $maploader/CanvasLayer2/Inventory
onready var tree = get_tree()


#var spawned = []



func _ready():
	Global.GameState = self #this makes this script global so this script can be acessed from anywhere.
	
	map_loader.initialize() 
	
	
	# this loops through the doors in the array which is returned my get_doors() function in maploader script.
	#then connects the doors to a method which calls change_map which calls a change_map method in map loader.
	
	for door in map_loader.get_doors():   
		door.connect("player_entered", self, "_on_Door_player_entered")
		
#
#func addAlien():
#	spawned.append(1)
#
#func getLength():
#	return spawned.size()		
	

func _on_Door_player_entered(target_map):
	change_map(target_map)

func change_map(scene_path):
	tree.paused = true        #this stops everything from processing while the map is being changed.
	map_loader.change_map(scene_path) #this calls change map method in map_loader script with destination map as a argument.
	
	for door in map_loader.get_doors():   #also connects doors to different rooms.
		door.connect("player_entered", self, "_on_Door_player_entered")
		print("successDoor")
	tree.paused = false		 #resumes processing after map has been changed.
	

