extends "res://scripts/entities/enemy_fish.gd"

export (NodePath) var target_path

func _ready():
	
	if target_path == null:
		print("ERROR: following_enemy_fish (", self.get_path(), ") target has not been assigned.")
	else:
		set_fixed_process(true)
		
func _fixed_process(delta):
	if has_node(target_path):
		var target = get_node(target_path)
		if target != null:
			var direction = (target.get_pos() - get_pos()).normalized()
			move(swim_speed * direction * delta)