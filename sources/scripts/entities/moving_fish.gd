extends "res://scripts/entities/enemy_fish.gd"

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	var direction = Vector2(0,0)
	direction.x += 1

	var movement = direction * swim_speed * delta
	
	move(movement)