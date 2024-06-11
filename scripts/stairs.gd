extends StaticBody2D



# Signal handler for when a body enters the StaticBody2D
func _on_StaticBody2D_body_entered(body):
	if body.is_in_group("character"):
		print("Character entered the StaticBody2D")



