extends Node2D
const Scissors = preload("res://element/scissors.tscn")
const Compass = preload("res://element/compass.tscn")
const Circle = preload("res://gameplay/circle.tscn")
const MAX_COMPASS_COUNT = 10
const MAX_SCISSORS_COUNT = 20
var cc = 5
var current_max_height = 230
var starting_compass_height = 200
var starting_scissors_height = 0
var current_compass_count = 0
var current_scissors_count = 0
var scissor_list = []
var compass_list=[]
var score
var CC
var lose
# Called when the node enters the scene tree for the first time.
func _ready():
	score = $"Control/Score"
	CC= $"Control/Compass Count"
	lose =$"Control/Lose"
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if cc <= 0:
		lose.visible = true
		get_tree().paused = true
		pass	
	var camera_position = get_viewport().get_camera_2d().global_position
	score.text = "score: %d" % (-1*camera_position.y)
	if current_compass_count <= MAX_COMPASS_COUNT:
		starting_compass_height = generate_compass(starting_compass_height)
	if current_scissors_count <= MAX_SCISSORS_COUNT:
		starting_scissors_height = generate_scissors(starting_scissors_height)
	if scissor_list[0].position.y - camera_position.y >= 1000:
		scissor_list[0].queue_free()
		scissor_list=scissor_list.slice(1,)
		current_scissors_count-=1
	if compass_list[0].position.y - camera_position.y >= 1000:
		compass_list[0].queue_free()
		compass_list=compass_list.slice(1,)
		current_compass_count-=1
		
		

	#print(delta)
	pass
func _input(event):
	if event is InputEventMouseButton:
		var camera_position = get_viewport().get_camera_2d().global_position	
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var cir = Circle.instantiate()
			cir.position.y = event.position.y -330 + camera_position.y
			cir.global_position.x = event.global_position.x
			add_child(cir)
			print(camera_position)
			var c_p = get_global_mouse_position()
			print(c_p)
	
func generate_scissors(height):
	var random_number_y = randi() % 250 
	var random_number_x = randi() % 1000
	var sci = Scissors.instantiate()
	sci.scale=Vector2(0.1,0.1)
	sci.position = Vector2(500-random_number_x,height-random_number_y)
	scissor_list+=[sci]
	add_child(sci)
	current_scissors_count+=1
	return height-random_number_y
func generate_compass(height):
	var random_number_y = randi() % 250 
	var random_number_x = randi() % 1000
	var com = Compass.instantiate()
	com.scale=Vector2(0.07,0.07)
	com.position = Vector2(500-random_number_x,height-200-random_number_y)
	for S in scissor_list:
		if (com.position).distance_to(S.position) <= 500:
			return height
	compass_list+=[com]
	add_child(com)
	current_compass_count+=1
	return height-random_number_y-200

			
