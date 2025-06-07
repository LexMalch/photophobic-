extends Node2D
var id =0


func _on_area_2d_mouse_entered() -> void:
	$AnimationPlayer.play("scale")
	$label.text = str(id)
