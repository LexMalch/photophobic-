extends CharacterBody2D
var seek_speed = 30
var chase_speed = 60
var dir: Vector2 = Vector2.ZERO
var damage_araa = null
enum State{
	CHASE,
	SEEK,
	ATTACK,
	GETHIT
	
}

var current_state = State.SEEK

#func _process(delta: float) -> void:

func  _physics_process(delta: float) -> void:
	match current_state:
		State.SEEK:
			move()
		State.CHASE:
			pass
		State.ATTACK:
			pass
		State.GETHIT:
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
	if body.is_in_group("player"):
		$seek_timer.stop()
		var dir = (body.position - position).normalized()
		velocity = dir * chase_speed
		print(dir)
func _on_chase_timer_timeout():
	pass
func _on_seek_area_body_exited(body):

	$seek_timer.start()
	velocity = dir * seek_speed

func take_damage():
	print("fafa")

func _on_hitbox_area_entered(area):
	pass # Replace with function body.
