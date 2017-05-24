extends "res://scripts/entities/fish.gd"

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	var direction = Vector2(0,0)
	
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1

	direction = direction.normalized()

	var movement = direction * swim_speed * delta
	
	move(movement)
	
func on_same_size_fish_collision(other_fish):
	eat(other_fish)