extends Node2D
func free() -> void:
	for a in range(9):
		var dots = preload("res://scene/dot.tscn").instantiate()
		add_child(dots)
		dots.position = Vector2(200+(a%3*100),200+((a-a%3)*33))
		dots.id =a 
