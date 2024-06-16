extends Node2D

class_name HealthComponent

@export var MAX_HEALTH : float = 10
var health : float


# Called when the node enters the scene tree for the first time.
func _ready():
	health = MAX_HEALTH

func damage(dmgVal : float):
	health -= dmgVal
	if health <= 0 :
		get_parent().queue_free()
