extends Node2D

var alien = preload("res://Scenes/Character/Heydies.tscn").instance()



func _ready():
	if(Global.GameState.getLength() <=0):
		add_child(alien)
		Global.GameState.addAlien()

		
      