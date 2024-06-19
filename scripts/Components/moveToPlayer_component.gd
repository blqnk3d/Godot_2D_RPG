extends Node2D
class_name MoveToPlayerComponent

@export var player : Player
@export var enemy : CharacterBody2D
@export var SPEED = 30
@export var RADIUS_TO_SEARCH  = 50

var MIN_DISTANCE = 10

@onready var shape = $Area2D/CollisionShape2D
# Called when the node enters the scene tree for the first time.

var test = Vector2(0,0)

func _ready():
	shape.shape.extents = Vector2(RADIUS_TO_SEARCH, RADIUS_TO_SEARCH)

var target = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if target and enemy.position.distance_to(player.position) > MIN_DISTANCE:
		test = enemy.position.direction_to(player.position)
		enemy.velocity = enemy.position.direction_to(player.position) * SPEED 
	else:
		enemy.velocity = Vector2.ZERO
	enemy.move_and_slide()


	
func quare(x):
	return x * x 


func _on_area_2d_area_entered(area):
	if area.is_in_group("player"):
		target = area.get_parent() # Replace with function body.


func _on_area_2d_area_exited(area):
	if area.is_in_group("player"):
		target = null # Replace with function body.
