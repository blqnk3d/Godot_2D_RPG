extends Node2D


@export var sprite : AnimatedSprite2D
@export var timeBetween = 0.25
@export var movementUpAndDown = 1
var down = true
var running = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if down and running:
		running = false
		for i in range(movementUpAndDown):
			sprite.position.y += 1
			await get_tree().create_timer(timeBetween).timeout
		down = false
		running = true
		
	elif !down  and running:
		running = false
		for i in range(movementUpAndDown):
			sprite.position.y -= 1
			await get_tree().create_timer(timeBetween).timeout
		down = true
		running = true
	
	
