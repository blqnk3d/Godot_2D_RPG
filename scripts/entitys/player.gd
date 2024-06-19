extends CharacterBody2D

class_name Player

const SPEED = 90.0


var health = 100
var maxHP = 100
var defence = 5

@export var weapon : Weapon
@export var healthbar : HealthBarComponent
@export var invPlayer : PlayerInv

@onready var sprite = $AnimatedSprite2D
@onready var player = $"."

var currentAreaToAttack : HitboxComponent= null
@onready var getoffsetWeapon = weapon.position.x # Temp solution 




func _physics_process(delta):
	invPlayer.clearUpItems()
	healthbar.health.health = health
	sprite.play("idle")
	
	if Input.is_action_just_pressed("attack"):
			weapon.damage()
	
			

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	
	
	if direction == -1:
		sprite.flip_h = true
		weapon.sprite.flip_h = true
		weapon.position.x = -getoffsetWeapon
	elif direction == 1:
		sprite.flip_h = false
		weapon.sprite.flip_h = false
		weapon.position.x = getoffsetWeapon
		
	if Input.is_action_pressed("up"):
		velocity.y = -1 * SPEED
	elif Input.is_action_pressed("down"):
		velocity.y = 1 * SPEED
	else :
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()



func _on_button_pressed():
	print(invPlayer.items)
	for i in invPlayer.items:
		if i:
			print(i.amount)
