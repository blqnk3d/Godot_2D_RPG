extends Panel

@onready var item_visual : Sprite2D = $CenterContainer/Panel/ItemDisplay
@onready var amountDisplay = $Label

var storedItem : InvItem

func update (item : InvItem):
	if !item:
		item_visual.visible = false
	else:
		if item.amount > 1: 
			amountDisplay.text = str(item.amount)
		else:
			amountDisplay.text = ""
		storedItem = item
		item_visual.visible = true
		item_visual.texture = item.texture


func _on_button_pressed():
	if storedItem and storedItem.amount >= 1:
		print(storedItem.amount)
		storedItem.use()
	
		
