extends KinematicBody2D

export var gravity = 9.8
export var swim_speed = 100

signal die

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

	var movement = direction * swim_speed * delta
	
	move(movement)
	
func die():
	queue_free()
	emit_signal("die")
	
func _on_hitbox_area_enter( area ):
	if area.has_method("effect_on_player"):
		area.effect_on_player(self)