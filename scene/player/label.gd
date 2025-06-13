class_name CROSSES
extends Label
func _ready() -> void:
	Global.change_text.connect(change_text)
	text = "0"
func change_text():
	text = str(Global.croses)
