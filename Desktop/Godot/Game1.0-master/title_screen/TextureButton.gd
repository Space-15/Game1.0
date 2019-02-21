extends TextureButton

export(String, FILE, "*.tscn") var scene_to_load

func _ready():
	var endPlayer = AudioStreamPlayer.new()
	self.add_child(endPlayer)
	endPlayer.stream  = load("res://Sound_Effect_-_Mission_failed_we_ll_get_em_next_time-9RAbYECBpVA.wav")
	endPlayer.play()	

func _on_TextureButton_pressed():
	button_sfx()
	get_tree().change_scene(scene_to_load)
	

func _on_TextureButton2_pressed():
	button_sfx()
	get_tree().quit()
	
func button_sfx():
	var musicPlayer = AudioStreamPlayer.new()
	self.add_child(musicPlayer)
	musicPlayer.stream  = load("res://soundscrate-switch-click-1.wav")
	musicPlayer.play()