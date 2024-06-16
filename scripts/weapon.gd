extends Node2D
class_name Weapon
@export var attack : AttackComponent
@export var sprite : AnimatedSprite2D

func _ready():
	if  sprite:
		sprite.play("idle")
		
	
func damage( hitbox : HitboxComponent):
	if  sprite and hitbox :
		sprite.play("attack")
		await get_tree().create_timer(0.5).timeout
		if hitbox != null:
			hitbox.damage(attack.attackDmg)
		sprite.play("idle")
