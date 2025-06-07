extends CharacterBody2D
var speed = 200
func _physics_process(delta: float) -> void:
	movement()
	look_at(get_global_mouse_position())
func movement():
	velocity = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down")).normalized() * speed
	move_and_slide()

	
