extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$FinalScore.text = "Stars Collected: {score}".format({"score": GlobalScore.score})
	$EndMusic.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta: float) -> void:
	#if $EndMusic.finished:
		#$EndMusic.play()
