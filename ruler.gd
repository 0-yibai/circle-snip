extends StaticBody2D

const GROWTH_RATE = 2
const MAX = 100
const ORIGINAL_PIXEL_LEN = 178

var shape
var STOPPED = false

func _ready():
	shape = $Sprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	shape.scale.y += 0.1
	if Input.is_action_pressed("ui_down"):
		STOPPED = true

func get_len():
	await STOPPED == true
	return shape.scale * ORIGINAL_PIXEL_LEN
