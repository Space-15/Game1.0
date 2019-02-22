extends Node

#this script is a singleton script a script which allows the multiple scripts to be acessed from anywhere.

#in this script any data is persistent so will stay when switching scenes. 



var GameState
var Player
var Alien
var Health
var Oxygen
var Map1
var Inventory
 
func _ready():  # this function is called once  
	var musicPlayer = AudioStreamPlayer.new()
	self.add_child(musicPlayer)
	musicPlayer.stream  = load("res://Purple Planet Music - Cinematic - Battle Plan.wav")
	musicPlayer.play() # this plays music and the music keeps playing even when switching scenes.
	

	