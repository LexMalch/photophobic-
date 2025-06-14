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
			
func move():
	velocity = dir * seek_speed
	move_and_slide()
func _on_seek_timer_timeout():
	dir = (Vector2(randf_range(-50, 50), randf_range(-50, 50))).normalized()
	$seek_timer.start()
	print(dir)
func _on_seek_area_body_entered(body):
	if body.is_in_group("player"):
		$seek_timer.stop()
		velocity = dir * chase_speed
		player_body = body
		$Chase_timer.start()
		
func _on_seek_area_body_exited(body):
	player_body = null
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
