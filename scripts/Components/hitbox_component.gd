extends Area2D

class_name HitboxComponent

@export var healthComponent : HealthComponent
@export var attackComponent : AttackComponent

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func damage(dmgVal : float):
	if healthComponent:
		healthComponent.damage(dmgVal)


func _on_area_entered(area : Area2D):
	print("in HitboxComponent")
	if area.is_in_group("player"):
		print("hitplayer")
		area.get_parent().damage(attackComponent.attackDmg,attackComponent.knockback)
