extends Area2D

func _ready():
	pass

func effect_on_player(player):
	# destroy the object
	queue_free()
	
	# speed up the fish
	player.swim_speed *= 2