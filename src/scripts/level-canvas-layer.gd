extends CanvasLayer

@onready var forceX: RichTextLabel = $ForceX
@onready var forceY: RichTextLabel = $ForceY

func _process(delta: float) -> void:
	forceX.text = "Fx = " + str(round(Global.playerForce.x)) + " kg⋅px⋅s⁻²";
	forceY.text = "Fy = " + str(round(Global.playerForce.y)) + " kg⋅px⋅s⁻²";
