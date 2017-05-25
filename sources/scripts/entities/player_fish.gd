extends "res://scripts/entities/fish.gd"

var old_direction = Vector2(0, 0)

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
	
	# compute new motion
	var movement = direction * swim_speed * delta
	
	# add old motion
	movement += old_direction * swim_speed * delta
	
	# move
	movement = move(movement)
	
	# slide along walls	
	if (is_colliding()):
		var normale = get_collision_normal()
		movement = normale.slide(movement)
		move(movement)
	
	if direction != Vector2(0,0):
		old_direction = direction
	
func on_same_size_fish_collision(other_fish):
	eat(other_fish)