extends CharacterBody2D
var seek_speed = 30
var chase_speed = 60
var dir: Vector2 = Vector2.ZERO
var damage_araa = null
var player_body = null
var max_hp = 3
var curr_hp
func _ready():
	curr_hp = max_hp
enum State{
	CHASE,
	SEEK,
	ATTACK,
	
}

var current_state = State.SEEK

#func _process(delta: float) -> void:

func  _physics_process(delta: float) -> void:
	match current_state:
		State.SEEK:
			move()
			print(dir.x)
		State.CHASE:
			velocity = dir * chase_speed
			move_and_slide()
		State.ATTACK:
			pass
			
func move():
	velocity = dir * seek_speed
	if dir.x > 0:
		$Sprite2D.flip_h = true
	else:
		$Sprite2D.flip_h = false
	move_and_slide()
func _on_seek_timer_timeout():
	dir = (Vector2(randf_range(-50, 50), randf_range(-50, 50))).normalized()
	$seek_timer.start()
func _on_seek_area_body_entered(body):
	if body.is_in_group("player"):
		current_state = State.CHASE
		$seek_timer.stop()
		
		player_body = body
		$Chase_timer.start()
		
func _on_seek_area_body_exited(body):
	if body.is_in_group("player"):
		player_body = null
		current_state = State.SEEK
		$Chase_timer.stop()
		$seek_timer.start()

func _on_chase_timer_timeout():
	dir = (player_body.position - position).normalized()
	$Chase_timer.start()
	
func take_damage():
	curr_hp -= 1
	if curr_hp <= 0:
		queue_free()
func _on_hitbox_area_entered(area):
	pass # Replace with function body.
