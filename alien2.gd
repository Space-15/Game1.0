extends "res://Scripts/Engine/Entity.gd"

const SPEED = 60
const DAMAGE = 5 #default 5
#var health = 30





var arrived_y = false




	
func take_damage(damage):
	health-=damage
	
func move_to_player():
	
	if self.position.x <= Global.Player.position.x-5:
		movedir = dir.right
		
	elif self.position.x >= Global.Player.position.x+5:
		movedir = dir.left
		
	else:
		movedir = dir.center
		
		if self.position.y < Global.Player.position.y:
			movedir = dir.down
			
		elif self.position.y > Global.Player.position.y:
			movedir = dir.up		
		
    
func _physics_process(delta):
	movement_loop()
	spritedir_loop()
	damage_loop()
	
	if movedir != dir.center:
		anim_switch("walk")
		
	else:
		anim_switch("idle")	
		
	
	

#	if is_on_wall():
#		if movedir == dir.up:
#			movedir = dir.down
#
#	elif movedir == dir.down:
#			movedir = dir.up	



	move_to_player()

	

	
	
			
	
	
	
		
	
					
		

       
			
			