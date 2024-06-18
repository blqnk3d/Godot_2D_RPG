extends Resource

class_name PlayerInv

@export var items : Array[InvItem]




func add (item : InvItem):
	print(item in items)
	if item in items:
		var index = items.find(item )
		if index != -1:
			items[index].amount += 1
			return
	else:
		items.append(item)
	print(items)
