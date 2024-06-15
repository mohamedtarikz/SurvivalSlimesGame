extends Area2D


func _physics_process(delta):
	var eir = get_overlapping_bodies()
	if eir.size() > 0:
		var enmy = eir[0]
		look_at(enmy.global_position)

var cold = true

func shoot():
	const blt = preload("res://bullet.tscn")
	var shot_blt = blt.instantiate()
	shot_blt.global_position = %BulletSpawn.global_position
	shot_blt.global_rotation = %BulletSpawn.global_rotation
	%BulletSpawn.add_child(shot_blt)
	cold = false
	$Timer.start()

func _process(delta):
	if Input.is_action_just_pressed("shot") and cold:
		shoot()


func _on_timer_timeout():
	cold = true
