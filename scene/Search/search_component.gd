extends Node2D
func _ready() -> void:
	$CanvasLayer.visible = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	$CanvasLayer.visible = true
	$AnimationPlayer.play("on_player")


func _on_area_2d_body_exited(body: Node2D) -> void:
	$AnimationPlayer.play_backwards("on_player")
	await  get_tree().create_timer(0.5).timeout
	$CanvasLayer.visible = false
