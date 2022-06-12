extends Node2D

var time_elapsed = 0

export var car_spawn_times = [5, 5, 5, 5]
var current_car_spawn_times = car_spawn_times

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#updating the elapsed time
	for i in range(0, car_spawn_times.size()):
		current_car_spawn_times[i] -= delta
		
		#spawn the car if the timer as run out
		if current_car_spawn_times[i] <= 0:
			current_car_spawn_times[i] = car_spawn_times[i]
