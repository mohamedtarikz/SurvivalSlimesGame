extends Area2D

var trvld_dist = 0
const spd = 750
const rng = 1500

func _physics_process(delta):
	var dir = Vector2.RIGHT.rotated(rotation)
	position += dir * delta * spd
	
	trvld_dist += spd * delta
	if trvld_dist > rng:
		queue_free()


func _on_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage()
	queue_free()
