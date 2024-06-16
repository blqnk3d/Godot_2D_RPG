extends Node2D

class_name  HealthBarComponent
@export var health : HealthComponent
@onready var bar = $ProgressBar
# Called when the node enters the scene tree for the first time.
func _ready():
	bar.max_value = health.MAX_HEALTH
	bar.set_value_no_signal(health.health) 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	bar.set_value_no_signal(health.health) 
