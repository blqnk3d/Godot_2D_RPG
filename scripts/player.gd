extends CharacterBody2D

# Speed of the player
@export var speed: float = 150.0

@onready var sprite = $AnimatedSprite2D
var inStair = false

func _process(_delta: float) -> void:
	
		 
	if  Input.is_action_pressed("interact") and inStair == true:
		print("collided and pressed")
	
		inStair = false
		
	
	# Create a new Vector2 to store the movement direction
	var direction = Vector2.ZERO
	
	# Check for input and set the direction accordingly
	if Input.is_action_pressed("up"):
		direction.y -= 1
	if Input.is_action_pressed("down"):
		direction.y += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
		sprite.flip_h = true
	if Input.is_action_pressed("right"):
		direction.x += 1
		sprite.flip_h = false

	# Normalize direction to prevent faster diagonal movement and scale by speed
	if direction != Vector2.ZERO:
		direction = direction.normalized() * speed
	var directionStandinOrRunning = Input.get_axis("left","right")
	
	if directionStandinOrRunning == 0:
		sprite.play("idle")
	else:
		sprite.play("walk")
	
	# Move the character using move_and_slide
	velocity = direction
	move_and_slide()
	






func _on_area_2d_area_entered(area):
	if area.is_in_group("stair"):
		inStair = true
		


func _on_area_2d_area_exited(area):
	if area.is_in_group("stair"):
		inStair = false
