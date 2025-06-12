extends Sprite2D


var shake_duration = 0.05  # Длительность тряски
var shake_magnitude = 3   # Амплитуда тряски
var is_shaking = false

func _ready():
	
	pass

func start_shake():
	if not is_shaking:
		is_shaking = true
		var original_position = position
		var shake_time = 0.0
		
		# Запускаем корутину для тряски
		while shake_time < shake_duration:
			var offset = Vector2(randf_range(-shake_magnitude, shake_magnitude), randf_range(-shake_magnitude, shake_magnitude))
			position = original_position + offset
			shake_time += get_process_delta_time()
			await get_tree().create_timer(0.05).timeout  # Задержка между изменениями позиции

		position = original_position  # Возвращаем на исходную позицию
		is_shaking = false


func _on_button_pressed() -> void:
	start_shake()
