extends CharacterBody2D

class_name Player

const SPEED = 100.0
const JUMP_VELOCITY = -250.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var health = 100
var maxHP = 100
var defence = 5
var attack = 5

var coins = 0


@onready var sprite = $AnimatedSprite2D
@onready var player = $"."
@onready var hpBar = $ProgressBar
@onready var showDebug = $Label
@onready var chest = $"../chest"


func _physics_process(delta):
	hpBar.value = health
	sprite.play("idle")
	


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	
	
	if direction == -1:
		sprite.flip_h = true
	elif direction == 1:
		sprite.flip_h = false
		
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




