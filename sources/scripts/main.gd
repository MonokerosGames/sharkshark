extends Node

export(String, FILE, "*.tscn") var game
onready var game_scn = load(game)

func _ready():
	pass

func _on_play():
	get_node("CanvasLayer/main_menu").hide()
	var game_instance = game_scn.instance()
	game_instance.get_node("player_fish").connect("die", self, "_on_game_over")
	add_child(game_instance)

func _on_game_over():
	get_node("CanvasLayer/main_menu").show()
	get_node("test").queue_free()
	