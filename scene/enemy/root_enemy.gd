extends CharacterBody2D
var  seek_speed = 30
var chase_speed = 60
var dir: Vector2 = Vector2.ZERO
var damage_araa = null







func  _physics_process(delta: float) -> void:
	move()
	if $Invin.time_left == 0:
		if damage_araa != null:
			take_damage
			$Invin.start()
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

func take_damage():
	print("fafa")
func _on_hitbox_body_entered(body):
	damage_araa = body
func _on_hitbox_body_exited(body):
	if body == damage_araa:
		damage_araa - null
