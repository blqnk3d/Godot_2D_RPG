extends Node

@onready var sprite :  AnimatedSprite2D= $AnimatedSprite2D


func _ready():
	sprite.play("default")
