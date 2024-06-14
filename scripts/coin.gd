extends RigidBody2D

class_name coin

@onready var sprite = $AnimatedSprite2D
@onready var current = $"."
# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_area_entered(area):
	current.queue_free()


