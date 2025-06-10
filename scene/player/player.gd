extends CharacterBody2D
var speed = 100
func _ready() -> void:
	Global.change_shiza.connect(_local_change_shiza)
func _physics_process(delta: float) -> void:
	movement()
	$Flashlight.look_at(get_global_mouse_position())
func movement():
	velocity = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down")).normalized() * speed
	move_and_slide()

func _local_change_shiza():
	if $PointLight2D.visible == true:
		$PointLight2D.hide()
	else:
		$PointLight2D.show()
