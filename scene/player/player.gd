extends CharacterBody2D
enum State {DEFFAULT, SEARCH}
var current_state = State.DEFFAULT
var speed = 100
var cross_scene = preload("res://scene/cross/cross.tscn")
func _ready() -> void:
	
	Global.change_shiza.connect(_local_change_shiza)
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("mb") and Global.croses > 0 and current_state == State.DEFFAULT:
		var cross = cross_scene.instantiate()
		cross.cross_dir = global_position.direction_to(get_global_mouse_position())
		cross.position = global_position
		get_parent().add_child(cross)
		Global.croses -=1
		Global.emit_signal("change_text")
	movement()
	$Flashlight.look_at(get_global_mouse_position())
func movement():
	velocity = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down")).normalized() * speed
	move_and_slide()

func _local_change_shiza():
	if $Flashlight/PointLight2D.visible == true:
		$Flashlight/PointLight2D.hide()
	else:
		$Flashlight/PointLight2D.show()
func change_state(state):
	match state:
		"search":
			current_state = State.SEARCH
		"deffault":
			current_state = State.DEFFAULT
			
	
