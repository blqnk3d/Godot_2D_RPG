extends Resource

class_name PlayerInv

@export var items : Array[InvItem]




func add (item : InvItem):
	var addingItem : InvItem = item.duplicate(true)
	
	var index = findItem(item,items)

	if index != -1:
		if item:
			items[index].amount += item.amount
			return
	else:
		for i in range(items.size()):
			if items[i] == null:
				items[i] = addingItem
				
				return


func findItem(item : InvItem,array: Array[InvItem]):
	for i in range(array.size()):
		if items[i] != null and items[i].usage == item.usage:
			return i
	return -1

func clearUpItems():
	for i in range(items.size()):
		if items[i] != null and items[i].amount == 0 :
			items[i] = null
