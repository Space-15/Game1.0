extends Control

var scene_path_to_load

func _ready():
	$Menu/CenterRow/MainButtons/NewGameBut.grab_focus()
	for button in $Menu/CenterRow/MainButtons.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])
		
func _on_Button_pressed(scene_to_load):
	scene_path_to_load = scene_to_load
	$FadeIn.show()
	$FadeIn.fade_in()
	var musicPlayer = AudioStreamPlayer.new()
	self.add_child(musicPlayer)
	musicPlayer.stream  = load("res://soundscrate-switch-click-1.wav")
	musicPlayer.play()

func _on_TransitionFX_fade_finished():
	get_tree().change_scene(scene_path_to_load)



	