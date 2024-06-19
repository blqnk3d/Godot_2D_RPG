extends Area2D


@export var moveToPlayer : MoveToPlayerComponent
@export var attackComponent : AttackComponent
var player : Player = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player:
		player.damage(attackComponent.attackDmg,attackComponent.knockback,moveToPlayer.test,attackComponent.timeBetweenAttack) #


func _on_area_entered(area : Area2D):
	if area.is_in_group("player"):
		player = area.get_parent()


func _on_area_exited(area):
	player = null # Replace with function body.
