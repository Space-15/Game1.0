extends Node

var GameState
var Player
var Health
var Oxygen
var Map1
var Inventory
 
func _ready():
	var musicPlayer = AudioStreamPlayer.new()
	self.add_child(musicPlayer)
	musicPlayer.stream  = load("res://Purple Planet Music - Cinematic - Battle Plan.wav")
	musicPlayer.play()
	

	