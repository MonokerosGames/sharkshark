
extends KinematicBody2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func effect_on_player(player):
	# destroy the object
	queue_free()
	
	# kills the fish
	player.die()

func _on_hitbox_player_enter(player):
	effect_on_player(player)