extends RigidBody2D;

var k: float = 1e6;

var charge: int = 1;
@onready var walls := get_tree().get_first_node_in_group("walls")

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
	moveWithForce();
	
func moveWithForce() -> void:
	var playerPos = walls.local_to_map(position)
	var searchRadius = 6;
	var force = Vector2.ZERO
	for q in range(-searchRadius, searchRadius + 1):
		for r in range(-searchRadius, searchRadius + 1):
			var cell = playerPos + Vector2i(q, r);
			var tileData = walls.get_cell_tile_data(cell);
			if not tileData:
				continue;
			
			var wallCharge = tileData.get_custom_data("charge");
			var displacement = walls.map_to_local(cell) - position
			
			force -= displacement.normalized() * (k * wallCharge * charge / displacement.length_squared()); 
		
	apply_central_force(force);
