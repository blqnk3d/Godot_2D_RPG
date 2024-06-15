extends StaticBody2D

class_name  Chest

var inv = [item.new("test",1)]
var opened = false
var inreach = false

func _init():
	pass

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func showInventory():
	if  inreach == false :
		return
	for i in inv:
		print(i)
	
	
	


func _on_area_2d_area_entered(area):
	inreach = true


func _on_area_2d_area_exited(area):
	inreach = false
