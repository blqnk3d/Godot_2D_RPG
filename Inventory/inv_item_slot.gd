extends Panel

@onready var item_visual : Sprite2D = $CenterContainer/Panel/ItemDisplay
@onready var amountDisplay = $Label
var storedItem : InvItem

func update (item : InvItem):
	if !item:
		item_visual.visible = false
	else:
		print(item.amount)
		if item.amount !=  1 or item.amount != 0: 
			amountDisplay.text = str(item.amount)
		storedItem = item
		item_visual.visible = true
		item_visual.texture = item.texture


func _on_button_pressed():
	print("pressed")
	if storedItem:
		print("item used")
		storedItem.use()
		update(storedItem)
		
