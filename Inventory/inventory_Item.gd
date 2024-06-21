extends Resource

class_name InvItem
@export var name : String = ""
@export var texture : Texture2D
@export_enum("heal1","heal2","heal3","coin") var usage :String 
@export var amount  = 1



func use():
	if  usage == "coin":
		print("cant be used")
		return
	elif usage == "heal1":
		print("should have healed 10hp")

	if amount  <= 0 :
		return
	else:
		amount -= 1
	
	

