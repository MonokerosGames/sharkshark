extends Control

signal play

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _on_play_pressed():
	emit_signal("play")
