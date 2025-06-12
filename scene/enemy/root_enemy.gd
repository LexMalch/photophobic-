extends CharacterBody2D
var  seek_speed = 30
var chase_speed = 60
var dir: Vector2 = Vector2.ZERO
func  _physics_process(delta: float) -> void:
	move()
	
func move():
	velocity = dir * seek_speed
	move_and_slide()
func _on_seek_timer_timeout():
	$seek_timer.start()
	dir = (Vector2(randf_range(-50, 50), randf_range(-50, 50))).normalized()
	print(dir)


func _on_seek_area_body_entered(body):
	$seek_timer.stop()
	#dir = look_at(player.)
	velocity = dir * chase_speed
func _on_seek_area_body_exited(body):
	$seek_timer.start()
	velocity = dir * seek_speed
