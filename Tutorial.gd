extends Node2D

onready var Tutorial_loader = $TutorialLoader

func _ready():
	Tutorial_loader.initialize()