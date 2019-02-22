extends "res://Scripts/Engine/Entity.gd"


const DAMAGE = 0 #how much damage alien does to player.
#var health = 30

var distance_2_player = self.position.distance_to(Global.Player.position) #stores players's position.
var movetimer_length = 100 #total time to  which is used by movetimer variable.
var movetimer = 0 #timer intiliazed to zero deciding how long to walk randomly  before changing direction.

#var stuck = true



func _ready(): # method is called when first loaded sets alien direction to a random direction and intiliazes speed to 40.
	movedir = dir.rand()
	speed = 40
	Global.Alien = self
	
func move_randomly(): # this function makes alien move randomly changing directions but moving slowly.
	speed = 40
	
	if movetimer > 0:
		movetimer -=1
	if movetimer == 0 || is_on_wall(): # alien chaneges direction if its colliding with anything like a wall or object or till timer has reached 0.
		movedir = dir.rand()
		movetimer = movetimer_length	
		
		
		
		
	
func move_to_player(): #this function makes alien follow player by first moving towards's players x direction and then to y direction.
	speed = 175  # when following player speed is increased.
	
	# dependng on the player's x and y position the aliens direction is changes and alien follows player.
	#alien doesnt stop moving when its close to player but keeps moving bumping (attacking) into the player. 
	
	if self.position.x <= Global.Player.position.x-5:
		movedir = dir.right
		
	elif self.position.x >= Global.Player.position.x+5:
		movedir = dir.left
		
	else:
		
		if self.position.y < Global.Player.position.y:
			movedir = dir.down
			
		elif self.position.y > Global.Player.position.y:
			movedir = dir.up	
	
	
func take_damage(damage):
	health-=damage
	
	
func _physics_process(delta): # everything in this function is a loop. so everything excecuted constantly.
	movement_loop()
	spritedir_loop()
	damage_loop()
	
	distance_2_player = self.position.distance_to(Global.Player.position) #players's distance is updated constantly.
	
	
	if movedir != dir.center:
		anim_switch("walk")
		
	if distance_2_player > 400:  # if player is not close then alien will walk randomly in the map.
		move_randomly()
		
	elif distance_2_player < 400:  # if player is within visible distance alien will start following player

		move_to_player()
		
		if distance_2_player <=150:  # if player is really close to alien then alien will speed up drastically.
			speed = 250
		
			
			
	
		
		
		 
	
		
		
