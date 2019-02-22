extends Node2D


func _on_switch_pressed():
	$switch.hide()
	$bgload.load_scene("res://loading screen/sculptures.tscn")
