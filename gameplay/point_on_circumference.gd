extends CharacterBody2D

const RULER = preload("res://ruler.tscn")
var ruler
var circle
var game

const MOVING = 1
const DRAWING = 2
const FINALIZED = 3

var state = MOVING
var theta = 0

var cen
var r

func _ready():
	circle = $"../Sprite2D"
	game = get_parent().get_parent().get_parent()

func _physics_process(delta):
	if state == MOVING:
		if Input.is_action_just_pressed("ui_down"):
			state = DRAWING
			handle_drawing()
		else:
			theta += 0.02
			move_around_circle()

func handle_drawing():
	state = FINALIZED
	ruler = RULER.instantiate()
	game.show_ruler(ruler)

func move_around_circle():
	cen = circle.position
	r = get_parent().radius
	
	position.x = cen.x + r * sin(theta)
	position.y = cen.y + r * cos(theta)
