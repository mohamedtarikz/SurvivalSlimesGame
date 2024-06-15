extends CharacterBody2D

@onready var player = get_node("/root/Game/Player")
@onready var mob = get_node("Slime")

var hp = 2

func _ready():
	mob.play_walk()

func _physics_process(delta):
	var dir = global_position.direction_to(player.global_position)
	velocity = dir * 225
	move_and_slide()

func take_damage():
	hp -= 1
	mob.play_hurt()
	if !hp:
		queue_free()
		const smk_scn = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smk = smk_scn.instantiate()
		get_parent().add_child(smk)
		smk.global_position = global_position
