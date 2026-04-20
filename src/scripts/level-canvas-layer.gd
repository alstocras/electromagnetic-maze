extends CanvasLayer

@onready var forceX: RichTextLabel = $ForceX
@onready var forceY: RichTextLabel = $ForceY
@onready var stopwatch: RichTextLabel = $Stopwatch
var elapsedTimeSeconds: float = 0


func _process(delta: float) -> void:
	elapsedTimeSeconds += 1 * delta
	forceX.text = "Fx = " + str(round(Global.playerForce.x)) + " kg⋅px⋅s⁻²";
	forceY.text = "Fy = " + str(round(Global.playerForce.y)) + " kg⋅px⋅s⁻²";
	stopwatch.text = str(roundi(elapsedTimeSeconds)) + " s"
	
