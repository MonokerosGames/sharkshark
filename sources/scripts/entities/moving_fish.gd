extends "res://scripts/entities/enemy_fish.gd"

export var direction = Vector2(0,0)

func _ready():
	direction = direction.normalized()
	set_fixed_process(true)
	
func _fixed_process(delta):
	var movement = direction.normalized() * swim_speed * delta
	
	move(movement)