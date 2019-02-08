extends KinematicBody2D

const MAXHEALTH = 25
const TYPE = "ENEMY"
var speed = 0

onready var tree = get_tree()


var movedir = Vector2(0,0)
var knockdir = Vector2(0,0)
var spritedir = "down"

var hitstun = 0 
var health = MAXHEALTH
var texture_default = null
var texture_hurt = null

func _ready():
	texture_default = $sprite.texture
	texture_hurt = load($sprite.texture.get_path().replace(".png","_hurt.png"))

func movement_loop():
	var motion
	if hitstun == 0:
		motion = movedir.normalized() * speed
	else:
		motion = knockdir.normalized() * 125
	move_and_slide(motion, Vector2(0,0))

func spritedir_loop():
	match  movedir:
		Vector2(-1,0):
			spritedir = "left"
		Vector2(1,0):
			spritedir = "right"
		Vector2(0,-1):
			spritedir = "up"
		Vector2(0,1):
			spritedir = "down"

func anim_switch(animation):
	var newanim = str(animation,spritedir)
	if $anim.current_animation != newanim:
		$anim.play(newanim)

func damage_loop():

	var dropChance = randi() % 4 + 1
	
	if hitstun > 0:
		hitstun -= 1	
		$sprite.texture = texture_hurt
	else:
		$sprite.texture = texture_default
		if TYPE  == "ENEMY" and health <=0:
			var  death_animation = preload("res://Scenes/Character/enemy_death.tscn").instance()
			var  baguette = preload("res://Items/baguette.tscn").instance()
			get_parent().add_child(death_animation)
			death_animation.global_transform = global_transform
			queue_free()
			if dropChance == 3:
				get_parent().add_child(baguette)
				baguette.global_transform = global_transform
			
			
	if TYPE == "PLAYER":
		if Global.Health.getHealth() <=0 or Global.Oxygen.getOxygen() <= 0:
			queue_free()
			game_over()
			
	for area in $hitbox.get_overlapping_areas():
		  
		var body = area.get_parent()
		if hitstun == 0 and body.get("DAMAGE") != null and body.get("TYPE") != TYPE:
			if TYPE == "PLAYER":
				take_dmg(body.get("DAMAGE"))
			health -= body.get("DAMAGE")
			hitstun = 10
			knockdir = global_transform.origin - body.global_transform.origin

func use_item(item):
	var newitem = item.instance()
	newitem.add_to_group(str(newitem.get_name(), self))
	add_child((newitem)) 
	if get_tree().get_nodes_in_group(str(newitem.get_name(), self)).size() > newitem.maxamount:
		newitem.queue_free()
		
func take_dmg(num):
	Global.Player.take_damage(num)
	
func game_over():
	tree.change_scene("res://title_screen/GameOverScreen.tscn")		
			
func damage_sound():
	var damagePlayer = AudioStreamPlayer.new()
	self.add_child(damagePlayer)
	damagePlayer.stream  = load("res://soundscrate-arrow-hit-1.wav")
	damagePlayer.play()	
	
	