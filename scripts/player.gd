extends CharacterBody2D

@onready var player = get_parent()
@onready var margic = load("res://scenes/margic.tscn")

var speed = 400  # speed in pixels/sec

func _physics_process(delta):
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	var is_attacking = Input.is_action_pressed("Strike")
	velocity = direction * speed
	rotation = PI
	if is_attacking:
		velocity = direction * 0
	else:
		move_and_slide()

func attack():
	var instance = margic.instantiate()
	instance.dir = rotation
	instance.spawn_pos = global_position
	instance.spawn_rot = -rotation
	player.add_child.call_deferred(instance)
