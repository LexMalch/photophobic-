extends Node2D
func _ready() -> void:
	Global.change_shiza.connect(_local_change_shiza)
func _local_change_shiza():
	if $PointLight2D.visible == true:
		$PointLight2D.hide()
		$lvl1/envierment/hints.visible = false
	else:
		$PointLight2D.show()
		$lvl1/envierment/hints.visible = true
