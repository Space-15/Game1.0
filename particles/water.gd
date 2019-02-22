extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	material.set_shader_param("sprite_scale",scale)
	
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
