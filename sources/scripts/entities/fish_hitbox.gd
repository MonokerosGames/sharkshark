extends Area2D

signal player_enter

func _ready():
	pass

func effect_on_player(player):
	emit_signal("player_enter", player)