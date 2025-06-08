extends Node2D
func _ready() -> void:
	Global.change_shiza.connect(_local_change_shiza)
func _local_change_shiza():
	if $PointLight2D.visible == true:
		$PointLight2D.hide()
	else:
		$PointLight2D.show()
