extends Resource

class_name InvItem
@export var name : String = ""
@export var texture : Texture2D
@export_enum("heal1","heal2","heal3","noUse") var usage :String 
@export var amount : int

@export var saveAmount : int # If possible temp


func use():
	if  usage == "noUse":
		print("cant be used")
		return
	elif usage == "heal1":
		print("should have healt 10hp")
	
	if amount  <= 0 :
		return
	else:
		amount -= 1
	
	
func resetAmount():
	amount = saveAmount
	
