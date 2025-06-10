extends Area2D
var target 
var speed = 200
func _physics_process(delta: float) -> void:
		if target:
			var direction = (target.global_position - global_position).normalized()
			position += direction * speed * delta  # Плавное движение

func _on_detection_area_body_entered(body: Node2D) -> void:
	target = body
