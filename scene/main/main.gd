extends Node2D
var max_point
var enemy = preload("res://scene/enemy/root_enemy.tscn")
var max_distance = 0
func _ready() -> void:
	Global.change_shiza.connect(_local_change_shiza)
func _local_change_shiza():
	if $PointLight2D.visible == true:
		$PointLight2D.hide()
		$lvl1/envierment/hints.visible = false
		for dude in	get_tree().get_nodes_in_group("root_enemy"):
			dude.queue_free()
		
	else:
		max_distance = 0
		var player_position = $Player.global_position
		var cur_enemy = enemy.instantiate()
		for node in $lvl1/envierment/Spawns.get_children():
			
			if node.global_position.distance_to(player_position) > max_distance:
				max_distance = node.global_position.distance_to(player_position)
				max_point = node
		cur_enemy.global_position = max_point.global_position
		add_child(cur_enemy)
		
		
		
		$PointLight2D.show()
		$lvl1/envierment/hints.visible = true
	
