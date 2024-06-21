extends Node2D
class_name Weapon
@export var attack : AttackComponent
@export var sprite : AnimatedSprite2D

var currentArea : HitboxComponent = null

func _ready():
	if  sprite:
		sprite.play("idle")
		
	
func damage():
	if  sprite and currentArea != null :
		sprite.play("attack")
		await get_tree().create_timer(0.3).timeout
		if currentArea != null:
			currentArea.damage(attack.attackDmg)
		sprite.play("idle")





func _on_area_2d_area_entered(area):
	if  area is HitboxComponent:
		currentArea  = area


func _on_area_2d_area_exited(area):
	area = null
