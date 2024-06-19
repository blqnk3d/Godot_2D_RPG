extends Node2D

@export var player : Player
@export var enemy : CharacterBody2D
@export var SPEED = 20
@export var RADIUS_TO_SEARCH  = 50

@onready var shape = $StaticBody2D/CollisionShape2D
# Called when the node enters the scene tree for the first time.
func _ready():
	shape.shape.extents = Vector2(RADIUS_TO_SEARCH, RADIUS_TO_SEARCH)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if abs(enemy.position.y - player.position.y) > RADIUS_TO_SEARCH or abs(enemy.position.x - player.position.x) > RADIUS_TO_SEARCH :
		return
	if abs(player.position.x - enemy.position.x) + abs(player.position.y - enemy.position.y) < 10:
		return 
		
	if enemy.position.y - player.position.y > 10:
		enemy.velocity.y = -1 * SPEED
	elif enemy.position.y - player.position.y < -10:
		enemy.velocity.y = 1 * SPEED
	else :
		enemy.velocity.y = move_toward(enemy.velocity.y, 0, SPEED)
	
	if enemy.position.x - player.position.x > 10:
		enemy.velocity.x = -1 * SPEED
	elif enemy.position.x - player.position.x < -10:
		enemy.velocity.x = 1 * SPEED
	else:
		enemy.velocity.x = move_toward(enemy.velocity.x, 0, SPEED)
	enemy.move_and_slide()
	
	
	
