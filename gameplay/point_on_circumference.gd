extends CharacterBody2D

const MOVING = 1
const DRAWING = 2
const FINALIZED = 3

var state = MOVING
var circle

var theta = 0

var cen
var r
var x
var y

func _ready():
	circle = $"../Sprite2D"

func _physics_process(delta):
	if state == MOVING:
		if Input.is_action_just_pressed("ui_down"):
			state = DRAWING
			handle_drawing()
		else:
			move_around_circle()

func handle_drawing():
	state = FINALIZED

func move_around_circle():
	cen = circle.position
	r = get_parent().radius
	
	x = cen.x + r * sin(theta)
	y = cen.y + r * cos(theta)
