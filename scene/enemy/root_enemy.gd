extends RigidBody2D
var seek_speed = 30
var speed = 50
var pos = position
func _ready():
	pass
func _physics_process(delta):
	pass

func _on_seek_area_body_entered(body):
	pass

func _on_seek_area_body_exited(body):
	pass # Replace with function body.
func move():
	apply_central_impulse(Vector2(randf_range(-50, 50), randf_range(-50, 50)))
	


func _on_seek_timer_timeout():
	$seek_timer.start()
	apply_central_impulse(Vector2(0,0))
	move()
	
