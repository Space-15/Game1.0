extends Node

onready var map_loader = $maploader
onready var inventory = $maploader/CanvasLayer2/Inventory
onready var tree = get_tree()


var inventory_state = false


var spawned = []



func _ready():
	Global.GameState = self
	
	map_loader.initialize()
	
	for door in map_loader.get_doors():
		door.connect("player_entered", self, "_on_Door_player_entered")
		
		

		
		
	
func addAlien():
	spawned.append(1)
	
func getLength():
	return spawned.size()		
	

func _on_Door_player_entered(target_map):
	change_map(target_map)

func change_map(scene_path):
	tree.paused = true
	map_loader.change_map(scene_path)
	
	for door in map_loader.get_doors():
		door.connect("player_entered", self, "_on_Door_player_entered")
		print("successDoor")
	tree.paused = false		
	

#func changeMap():
#	tree_entered().change_scene("res://Map/Tutorial/Map1.tscn")