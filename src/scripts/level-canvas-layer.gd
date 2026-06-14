extends CanvasLayer

@onready var stopwatch: RichTextLabel = $Stopwatch
var elapsedTimeSeconds: float = 0


func _process(delta: float) -> void:
	elapsedTimeSeconds += 1 * delta
	stopwatch.text = str(roundi(elapsedTimeSeconds)) + " s"
	
