extends Control

var scene_path_to_load

func _on_TextureButton_pressed():
	var buttonPlayer = AudioStreamPlayer.new()
	self.add_child(buttonPlayer)
	buttonPlayer.stream  = load("res://soundscrate-switch-click-1.wav")
	buttonPlayer.play()
	get_tree().change_scene('res://title_screen/Title Screen.tscn')
	
