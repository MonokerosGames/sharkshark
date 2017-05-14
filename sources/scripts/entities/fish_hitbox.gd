extends Area2D

signal effect_on_other
signal effect_from_other

func _ready():
	pass

func effect_on_other(other):
	emit_signal("effect_on_other", other)
	
func effect_from_other(other):
	emit_signal("effect_from_other", other)