extends "res://Scripts/Engine/Entity.gd"


const DAMAGE = 0
#var health = 30

var distance_2_player = self.position.distance_to(Global.Player.position)
var movetimer_length = 100
var movetimer = 0
var lastlocation = 0

var stuck = false


func _ready():
	movedir = dir.rand()
	speed = 40
	
func move_randomly():
	speed = 40
	
	if movetimer > 0:
		movetimer -=1
	if movetimer == 0 || is_on_wall():
		movedir = dir.rand()
		movetimer = movetimer_length	
		
		
		
		
	
func move_to_player():
	speed = 175
	
	if self.position.x <= Global.Player.position.x-5:
		movedir = dir.right
		
	elif self.position.x >= Global.Player.position.x+5:
		movedir = dir.left
		
	else:
		#movedir = dir.center
		
		if self.position.y < Global.Player.position.y:
			movedir = dir.down
			
		elif self.position.y > Global.Player.position.y:
			movedir = dir.up	
	
	
func take_damage(damage):
	health-=damage
	
	
func _physics_process(delta):
	movement_loop()
	spritedir_loop()
	damage_loop()
	
	distance_2_player = self.position.distance_to(Global.Player.position)
	
	
	if movedir != dir.center:
		anim_switch("walk")
		
	if distance_2_player > 400 and stuck == false:
		move_randomly()
		
	elif distance_2_player < 400 and stuck == false:

		move_to_player()
		
		if distance_2_player <=150:
			speed = 250
		
			
		
	
func _on_Timer_timeout():
	if is_on_wall():
		stuck = true
		print(stuck)
		move_randomly()
	else:
		stuck = false	
	print ("timeout")
	
