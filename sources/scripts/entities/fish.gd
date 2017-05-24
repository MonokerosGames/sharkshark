extends KinematicBody2D

export var gravity = 9.8
export var swim_speed = 100
export var size = 1

signal die

func _ready():
	pass
	
func eat(fish):
	fish.die()
	
func die():
	queue_free()
	emit_signal("die")


func on_fish_collision(other_fish):
	if other_fish.size < size:
		on_smaller_fish_collision(other_fish)
	elif other_fish.size > size:
		on_bigger_fish_collision(other_fish)
	else:
		on_same_size_fish_collision(other_fish)

func on_smaller_fish_collision(other_fish):
	eat(other_fish)

func on_bigger_fish_collision(other_fish):
	pass
	
func on_same_size_fish_collision(other_fish):
	pass

func _on_hitbox_area_enter( other_area ):
	var other_fish = other_area.get_parent()
	if other_fish.has_method("on_fish_collision") :
		on_fish_collision(other_fish)