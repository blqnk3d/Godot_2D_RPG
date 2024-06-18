extends Resource

class_name InvItem
@export var name : String = ""
@export var texture : Texture2D
@export_enum("heal1","heal2","heal3","noUse") var usage :String 
@export var amount : int



func use():
	if  usage == "noUse":
		return
	
	if usage == "heal1":
		pass
	if amount - 1 <= 0 :
		pass
	else:
		amount -= 1
