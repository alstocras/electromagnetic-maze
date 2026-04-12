extends StaticBody2D

@export var levelNum: int;

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		var filePath = "res://level" + str(levelNum + 1) + ".tscn"
		get_tree().change_scene_to_file(filePath);
