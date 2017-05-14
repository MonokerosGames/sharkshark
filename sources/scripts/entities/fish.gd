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
	
func effect_on_other(other):
	if other.size < size:
		eat(other)
		
func effect_from_other(other):
	other.effect_on_other(self)
	
func _on_hitbox_area_enter( area ):	
	print("prout")
	if area.has_method("effect_from_other"):
		area.effect_from_other(self)
	if area.has_method("effect_on_other"):
		area.effect_on_other(self)

func _on_hitbox_effect_from_other(other):
	effect_from_other(other)


func _on_hitbox_effect_on_other(other):
	effect_on_other(other)
