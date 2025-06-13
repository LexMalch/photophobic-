extends Node2D
var shakes_total:int
var shakes: = 0
var original_position 
func _ready() -> void:
	$CanvasLayer.visible = false
	shakes_total = randf_range(3,6)
	original_position = $CanvasLayer/Sprite2D.position
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if shakes< shakes_total:
			$CanvasLayer.visible = true
			$AnimationPlayer.play("on_player")
			$CanvasLayer/Button.disabled = false


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		$AnimationPlayer.play_backwards("on_player")
		await  get_tree().create_timer(0.5).timeout
		$CanvasLayer.visible = false
		$CanvasLayer/Button.disabled = true



var shake_duration = 0.05  # Длительность тряски
var shake_magnitude = 3   # Амплитуда тряски
var is_shaking = false

func start_shake():
	if not is_shaking:
		is_shaking = true
		
		var shake_time = 0.0
		
		# Запускаем корутину для тряски
		while shake_time < shake_duration:
			var offset = Vector2(randf_range(-shake_magnitude, shake_magnitude), randf_range(-shake_magnitude, shake_magnitude))
			$CanvasLayer/Sprite2D.position = original_position + offset
			shake_time += get_process_delta_time()
			await get_tree().create_timer(0.05).timeout  # Задержка между изменениями позиции

		$CanvasLayer/Sprite2D.position = original_position  # Возвращаем на исходную позицию
		is_shaking = false
		$CanvasLayer/Button.disabled = false
	if shakes >= shakes_total:
		$CanvasLayer/Button.disabled = true
		$AnimationPlayer.play_backwards("on_player")
		await  get_tree().create_timer(0.5).timeout
		$AnimationPlayer.play("pick_up")
		await  get_tree().create_timer(1.9).timeout
		
		$CanvasLayer.visible = false
		$CanvasLayer/Button.disabled = true
	shakes+=1

func _on_button_pressed() -> void:
	start_shake()
	$CanvasLayer/Button.disabled = true
func pick_up_item():
	$CanvasLayer/Picable.show()
