
extends Area2D

func _ready():
	pass

func effect_on_player(player):
	# destroy the object
	queue_free()
	
	# kills the fish
	player.die()
