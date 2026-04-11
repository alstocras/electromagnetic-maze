extends CharacterBody2D;

var charge: int = 1;

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("flip"):
		charge *= -1;
	$Sprite2D.texture = load("res://assets/sprites/objects/player/" + str(charge) + "player.png");
	
func _physics_process(delta: float) -> void:
	pass
