extends Node2D


@export var sprite : AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.play("default")



