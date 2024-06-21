extends Node2D

class_name Potion

@export var ownItem : InvItem


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.





func _on_pick_up_component_area_entered(area ):
	if area is HitboxComponent:
		if area.is_in_group("player"):
			var player : Player = area.get_parent()
			player.invPlayer.add(ownItem)
			queue_free()
