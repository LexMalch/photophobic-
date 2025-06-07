extends Node2D
var id = 0


func _on_area_2d_mouse_entered() -> void:
	get_parent().firstPoint = self.position
	get_parent().firstId = id
	$Label.text = str(id)
	if get_parent().mouse_pressed == true:
		
		get_parent().over.pop_back()
		get_parent().over.append(self.position)
		get_parent().over.append(self.position)
		get_parent().curcode.append(id)
		$AnimationPlayer.play("scale")
