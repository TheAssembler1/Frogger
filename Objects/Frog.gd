extends Node2D

#used to signal wether the frog is moving
var moving = false

#used to move absolutely between inputs
var needed_position_vector = Vector2()
var needed_position_distance = Vector2()

export var total_move_distance = 16
export var move_speed = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	needed_position_vector = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	handle_input_movement()

#used to get the input and movement of the frog
func handle_input_movement():
	if !moving:
		if Input.is_action_just_pressed("ui_right"):
			play_animation("jump_right")
			move_frog(Vector2(position.x + total_move_distance, position.y), Vector2(move_speed, 0))
		if Input.is_action_just_pressed("ui_left"):
			play_animation("jump_left")
			move_frog(Vector2(position.x - total_move_distance, position.y), Vector2(-move_speed, 0))
		if Input.is_action_just_pressed("ui_up"):
			play_animation("jump_up")
			move_frog(Vector2(position.x, position.y - total_move_distance), Vector2(0, -move_speed))
		if Input.is_action_just_pressed("ui_down"):
			play_animation("jump_down")
			move_frog(Vector2(position.x, position.y + total_move_distance), Vector2(0, move_speed))
	else:
		if needed_position_vector != position:
			position += needed_position_distance
		else:
			moving = false

#used to set the movement variables of the frog
func move_frog(needed_abs_position, needed_abs_distance):
	moving = true
	needed_position_vector = needed_abs_position
	needed_position_distance = needed_abs_distance

#used to play animation of the frog
func play_animation(animation_name):
	$AnimatedSprite.frame = 0
	$AnimatedSprite.play(animation_name)
