extends CharacterBody2D

@export var fuel = 1000.0 #serve as game over ?
@export var speed = 800.0
@export var accel = 800.0
@export var friction = 320.0
@export var fuel_loss = 50.0

var score = GlobalScore.score

var input = Vector2.ZERO
#var screen_size 

#signal touch
# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#screen_size = get_viewport_rect().size
	
func get_input():
	input.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
	return input.normalized()

func player_movement(delta):
	input = get_input()
	
	if fuel > 0:
		if input == Vector2.ZERO:
			if velocity.length() > (friction * delta):
				velocity -= velocity.normalized() * (friction * delta)
			else:
				velocity = Vector2.ZERO
		else:
			velocity += (input * accel * delta)
			velocity = velocity.limit_length(speed)
			fuel -= (delta * fuel_loss)
			##print(fuel)
	else:
		get_gravity()
	move_and_slide()

func add_fuel(star):
	fuel += star

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func _physics_process(delta: float) -> void:
	player_movement(delta)
	$AnimatedSprite2D.play()
			
	#position = position.clamp(Vector2.ZERO, screen_size)
#	
