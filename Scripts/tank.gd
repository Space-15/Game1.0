extends Area2D

func _ready():
	connect("body_entered",self,"body_entered")

	
func body_entered(body):
	if body.name == "player":
#		if Input.is_action_just_pressed("e"):
				queue_free()		
				Global.Inventory.addItem("tank")
		

		
