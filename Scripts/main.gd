extends Node

@export var star_scene: PackedScene

func _ready():
	new_game()
	$HUD.setFuelMaxValue($Prince.fuel)
	$MainMusic.play()

func new_game():
	$Prince.score = 0
	$Prince.start($StartPosition.position)
	$BeginTimer.start()

# modular code to add stars and asteriods
#func add_to_scene(scene, spawnLocation, a, b):
	#var sc = scene.instantiate()
#
	#var scene_spawn_location = spawnLocation
	#scene_spawn_location.progress_ratio = randf()
#
	#sc.position = scene_spawn_location.position
#
	#var direction = scene_spawn_location.rotation + PI / 2
#
	#var velocity = Vector2(randf_range( a, b ),0.0)
	#sc.linear_velocity = velocity.rotated(direction)
	#
	#add_child(sc)

func _on_star_timer_timeout() -> void:
	#add_to_scene(star_scene, $StarPath/StarSpawnLocation, 180.0 , 250.0)
	var star = star_scene.instantiate()
	
	var star_spawn_location = $StarPath/StarSpawnLocation
	star_spawn_location.progress_ratio = randf()
	
	star.position = star_spawn_location.position
	
	var direction = star_spawn_location.rotation + PI / 2
	
	var velocity = Vector2(randf_range(150.0, 250.0),0.0)
	star.linear_velocity = velocity.rotated(direction)
	
	add_child(star)

func _on_begin_timer_timeout() -> void:
	$StarTimer.start()
	$FuelTimer.start()
	$EndGameTimer.start()

func _on_fuel_timer_timeout() -> void:
	if $Prince.fuel > 0:
		$Prince.fuel -= 25
	#print($Prince.fuel)

func _process(_delta: float) -> void:
	$HUD.update_score($Prince.score)
	$HUD.updateFuelValue($Prince.fuel) 
	

func _on_end_game_timer_timeout() -> void:
	TransitionScreen.transition()
	await  TransitionScreen.on_transition_finished
	$MainMusic.stop()
	GlobalScore.score = $Prince.score
	get_tree().change_scene_to_file("res://Scenes/end_screen.tscn")

#Notes / ToDo
# should be 5 minutes atleast? 
# add Cutscene to end at gameover and final score
