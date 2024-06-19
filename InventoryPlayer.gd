extends Resource

class_name PlayerInv

@export var items : Array[InvItem]




func add (item : InvItem):
	item.resetAmount()
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
				
				return
				
	print(items)
	for i in items:
		if i :
			print(i.amount)

func clearUpItems():
	for i in range(items.size()):
		if items[i] != null:
			var item : InvItem = items[i]
			if item.amount == 0 :
				items[i] = null
