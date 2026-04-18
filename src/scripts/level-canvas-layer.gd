extends CanvasLayer

@onready var forceIndicator: RichTextLabel = $ForceIndicatorBase

func _process(delta: float) -> void:
	forceIndicator.text = "F = " + str(round(Global.playerForce.y)) + " kg⋅px⋅s⁻²";
