extends Control

func _input(event):
	if event.is_action_pressed("pause"):
		var buttonPlayer = AudioStreamPlayer.new()
		self.add_child(buttonPlayer)
		buttonPlayer.stream  = load("res://soundscrate-switch-click-1.wav")
		buttonPlayer.play()
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state
		visible = new_pause_state
	

func _on_resumeBtn_pressed():
	var buttonPlayer = AudioStreamPlayer.new()
	self.add_child(buttonPlayer)
	buttonPlayer.stream  = load("res://soundscrate-switch-click-1.wav")
	buttonPlayer.play()
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state


func _on_menuBtn_pressed():
	var buttonPlayer = AudioStreamPlayer.new()
	self.add_child(buttonPlayer)
	buttonPlayer.stream  = load("res://soundscrate-switch-click-1.wav")
	buttonPlayer.play()
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	get_tree().change_scene("res://title_screen/Title Screen.tscn")
	

func _on_saveBtn_pressed():
	pass # replace with function body


func _on_pauseBtn_pressed():
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state
