extends Resource

class_name PlayerInv

@export var items : Array[InvItem]




func add (item : InvItem):
	if item in items:
		var index = items.find(item )
		if index != -1:
			if item:
				items[index].amount += item.amount
				return
	else:
		for i in range(items.size()):
			if items[i] == null:
				items[i] = item
				print(items)
				return

func clearUpItems():
	for i in range(items.size()):
		if items[i] != null:
			var item : InvItem = items[i]
			if item.amount == 0 :
				items[i] = null
