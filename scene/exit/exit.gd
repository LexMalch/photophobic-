extends Node2D
var opend_text =  preload("res://scene/exit/exit.png")
func _ready() -> void:
	$Sprite2D.texture = preload("res://scene/exit/exitclose.png")
	$lock.hide()
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and $Sprite2D.texture != opend_text:
		$lock.show()
		$lock/AnimationPlayer.play("ready")
		
		



func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player") and $Sprite2D.texture != opend_text:
		$lock/AnimationPlayer.play_backwards("ready")
		await $lock/AnimationPlayer.animation_finished
		$lock.hide()
func right_password():
	$Sprite2D.texture = opend_text
	
