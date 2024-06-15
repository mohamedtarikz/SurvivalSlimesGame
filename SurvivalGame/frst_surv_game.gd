extends Node2D


func mob_spawn():
	var mob = preload("res://mob.tscn").instantiate()
	var rv = randf_range(0,7400)
	%PathFollow2D.progress = rv
	mob.global_position = %PathFollow2D.global_position
	add_child(mob)


func tree_plant():
	var tree = preload("res://pine_tree.tscn").instantiate()
	var rv = randf_range(0,7400)
	%PathFollow2D.progress = rv
	tree.global_position = %PathFollow2D.global_position
	add_child(tree)

func _on_timer_timeout():
	mob_spawn()


func _on_player_game_over():
	%GameOver.visible = 1
	get_tree().paused = 1


func _on_tree_timer_timeout():
	tree_plant()
