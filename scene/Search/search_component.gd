extends Node2D
func _ready() -> void:
	$CanvasLayer.visible = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	$CanvasLayer.visible = true
