extends CharacterBody2D;

var charge: int = 1;
var walls := get_tree().get_first_node_in_group("walls")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("flip"):
		charge *= -1;
	$Sprite2D.texture = load("res://assets/sprites/objects/player/" + str(charge) + "player.png");
	
	if Input.is_action_just_pressed("zoomIn"):
		var zoomAmount: float = 1.2
		$Camera2D.zoom *= zoomAmount;
		$Camera2D.zoom = clamp($Camera2D.zoom, Vector2(0.01, 0.01), Vector2(2.0, 2.0));
	if Input.is_action_just_pressed("zoomOut"):
		var zoomAmount: float = 0.8
		$Camera2D.zoom *= zoomAmount;
		$Camera2D.zoom = clamp($Camera2D.zoom, Vector2(0.01, 0.01), Vector2(2.0, 2.0));
	
func _physics_process(delta: float) -> void:
	pass
	
func moveWithForce() -> void:
	pass
