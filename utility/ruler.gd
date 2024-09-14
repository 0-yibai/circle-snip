extends StaticBody2D

const GROWTH_RATE = 0.01
const MAX_SCALE = 5
const ORIGINAL_PIXEL_LEN = 178 * 0.3

var shape
var len
var STOPPED = false

signal STOPPED_SIGNAL

func _ready():
	shape = $Sprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !STOPPED and shape.scale.y < MAX_SCALE:
		shape.scale.y += GROWTH_RATE
	if Input.is_action_just_pressed("ui_up"):
		len = shape.scale.y * ORIGINAL_PIXEL_LEN
		STOPPED = true
		emit_signal("STOPPED_SIGNAL")

func get_len():
	await self.STOPPED_SIGNAL
	return len
