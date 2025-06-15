extends Node2D

func _on_fernzy_timer_timeout() -> void:
	if $PointLight2D.visible == false:
		$PointLight2D.visible = true
		$envierment/hints.visible =true
	else:
		$PointLight2D.visible = false
		$envierment/hints.visible =false
