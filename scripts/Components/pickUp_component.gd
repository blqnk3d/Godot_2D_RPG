extends Area2D

class_name   PickUpComponent
var inventory : Inventory
@export var itemToAdd : Item


# Called when the node enters the scene tree for the first time.
func _ready():
	if get_parent().inv:
		inventory = get_parent().inv


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	var item : Item = get_parent()
	print(area)
	if  !item.disabled and area is HitboxComponent: 
		item.disabled = true
		item.visible = false
		inventory.add(item)
		for i in inventory.inv:
			print(i)
