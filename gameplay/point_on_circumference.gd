extends CharacterBody2D

const CIRCLE_SCENE = preload("res://gameplay/circle.tscn")

var circle_scene

const RULER = preload("res://utility/ruler.tscn")
var ruler
var circle
var camera
var level
var test
const MOVING = 1
const DRAWING = 2
const FINALIZED = 3

var state = MOVING

var theta = 0

var cen
var r
var x
var y
var new_r

func _ready():
	test =$"../../../test"
	circle = $"../Sprite2D"
	camera = $"../../Camera2D"
	level = get_parent().get_parent()

func _physics_process(delta):
	if state == MOVING:
		if Input.is_action_just_pressed("ui_down"):
			test.CC.text = "x %d" % (int(test.CC.text) - 1)
			state = DRAWING
			handle_drawing()
		else:
			theta+=0.05
			move_around_circle()

func handle_drawing():
	print("UI down triggered")
	state = FINALIZED
	ruler = RULER.instantiate()
	camera.show_ruler(ruler)
	new_r = await ruler.get_len()
	ruler.queue_free()
	add_new_circle(global_position, new_r)

func move_around_circle():
	cen = circle.position
	r = get_parent().radius
	
	position.x = cen.x + r * sin(theta)
	position.y = cen.y + r * cos(theta)

func add_new_circle(centre_position, radius):
	circle_scene = CIRCLE_SCENE.instantiate()
	circle_scene.global_position = centre_position
	circle_scene.set_radius(radius)
	get_parent().get_parent().add_child(circle_scene)
