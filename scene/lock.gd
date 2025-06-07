extends Node2D
var firstPoint 
var firstId
var curcode = []
var needcode = [0,1,2,4,6,7,8]

var over = []
var line = Line2D
var mouse_pressed = false

func _ready():
	for a in range(9):
		var dots = preload("res://scene/dot.tscn").instantiate()
		add_child(dots)
		dots.position = Vector2(200+(a%3*100),200+((a-a%3)*33))
		dots.id = a

func _process(delta):
	if Input.is_action_just_pressed("mb"):  # одиночный клик
		curcode.append(firstId)
		over.append(firstPoint)
		over.append(firstPoint)
		line= Line2D.new()
		add_child(line)
		line.points = over
		
	if Input.is_action_pressed("mb"):  # нажатие кнопки
		mouse_pressed = true
		line.points = over
		line.set_point_position(over.size()-1,get_global_mouse_position())
		
	if Input.is_action_just_released("mb"):  # отпускание кнопки
		print(curcode,needcode)
		if curcode == needcode:
			queue_free()
		else:
			print("loh")
		mouse_pressed = false
		over = []
		curcode = []
		line.queue_free()
