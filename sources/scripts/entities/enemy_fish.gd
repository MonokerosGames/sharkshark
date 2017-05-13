
extends KinematicBody2D


func _ready():
	pass

func effect_on_player(player):
	# destroy the object
	queue_free()
	
	# kills the fish
	player.die()

func _on_hitbox_player_enter(player):
	effect_on_player(player)