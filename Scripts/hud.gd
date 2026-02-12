extends Control


# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#setFuelMaxValue()
	#updateTimerMax()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

func setFuelMaxValue(Fuel):
	$FuelBar.max_value = Fuel
	$FuelBar.value = Fuel

func updateFuelValue(Fuel):
	$FuelBar.value = Fuel

#func updateTimerMessage():
	#pass 
	
func update_score(score):
	$ScoreLabel.text = "Stars: {score}".format({"score": score})
