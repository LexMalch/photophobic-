extends Timer
func _ready() -> void:
	pass
	#Global.change_shiza.connect(_on_signal_name)


func _on_timeout() -> void:
	Global.emit_signal("change_shiza")
