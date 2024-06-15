extends CharacterBody2D

var hp = 100
const dmg_rat = 5

signal game_over

func _physics_process(delta):
	var dir = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = dir * 300
	move_and_slide()
	
	var hb = get_node("HappyBoo")
	if dir:
		hb.play_walk_animation()
	else:
		hb.play_idle_animation()
	
	var enmy = %HurtBox.get_overlapping_bodies()
	hp -= dmg_rat * enmy.size() * delta
	%HealthBar.value = hp
	if hp <= 0:
		game_over.emit()
