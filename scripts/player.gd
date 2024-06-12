extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -250.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var sprite = $AnimatedSprite2D
@onready var player = $"."


func _physics_process(delta):
	sprite.play("idle")
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	
	if direction == -1:
		sprite.flip_h = true
	elif direction == 1:
		sprite.flip_h = false
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func setPositionRel(xOff,yOff):
	print("x: ",player.global_transform.origin.x,"y: ",player.global_transform.origin.y)
	var position = Vector2(player.global_transform.origin.x+ xOff,player.global_transform.origin.y + yOff)
	player.global_transform.origin = position

func setPosition(x,y):
	var position = Vector2(x,y)
	player.global_transform.origin = position

func _on_area_2d_area_entered(area):
	if area.is_in_group("death"):
		setPosition(0,0)
	elif area.is_in_group("spring"):
		player.set_velocity(Vector2(player.global_transform.origin.x,-450))
