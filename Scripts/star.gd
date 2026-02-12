extends RigidBody2D

enum Stars{
	Small = 100,
	Large = 100
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()


func _on_area_2d_body_shape_entered(_body_rid: RID, body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	if body.name == "Prince":
		body.score += 1
		body.add_fuel(Stars.Small)
		$PickUpSfx.play() 
		self.queue_free()
		#print(body.score)
		#print(body.fuel)
		
