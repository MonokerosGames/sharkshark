
extends Area2D

func _ready():
	pass

func effect_on_other(other):
	# destroy the object
	queue_free()
	
	# kills the fish
	other.die()
