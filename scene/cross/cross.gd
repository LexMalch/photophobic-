extends Area2D
var cross_dir = null
func _physics_process(delta):
	global_position += cross_dir * 100 * delta
	rotation += 1 * 0.1

func _on_body_entered(body):
	if body.is_in_group("root_enemy"):
		body.take_damage()
		queue_free()
