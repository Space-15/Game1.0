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
    var save_game = File.new()
    save_game.open("user://savegame.save", File.WRITE)
    var save_nodes = get_tree().get_nodes_in_group("Persistant")
    for i in save_nodes:
        var node_data = i.call("save");
        save_game.store_line(to_json(node_data))
    save_game.close()
    print ("saved")

func _on_loadBtn_pressed():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.READ)
	var save_nodes = get_tree().get_nodes_in_group("Persistant")
	var data = {}
	data = parse_json(save_game.get_as_text())
	for k in data.keys():
		for n in save_nodes:
			if k == n.get_name():
				n.load_state(data[k])
	print("loaded")

func _on_pauseBtn_pressed():
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state
