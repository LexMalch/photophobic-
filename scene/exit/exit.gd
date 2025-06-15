extends Node2D
var player
var opend_text =  preload("res://scene/exit/exit.png")
func _ready() -> void:
	$Sprite2D.texture = preload("res://scene/exit/exitclose.png")
	
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and $Sprite2D.texture != opend_text:
		player = body
		player.change_state("search")
		
		$CanvasLayer/lock/AnimationPlayer.play("ready")
		$CanvasLayer.visible = true
		



func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player.change_state("deffault")
	
	if body.is_in_group("player") and $Sprite2D.texture != opend_text:
		$CanvasLayer/lock/AnimationPlayer.play_backwards("ready")
		await $CanvasLayer/lock/AnimationPlayer.animation_finished
		$CanvasLayer.visible = false
func right_password():
	$Sprite2D.texture = opend_text
	player.change_state("deffault")
	
