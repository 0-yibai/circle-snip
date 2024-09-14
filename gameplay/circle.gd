extends CharacterBody2D

var radius = 1544 * 0.05 / 2

var circle
var point

func _ready():
	point = $PointOnCircumference
	circle = $Sprite2D
	point.position.x = circle.position.x
	point.position.y = circle.position.y - radius

func set_radius(new_radius):
	radius = new_radius
	$Sprite2D.scale.x = float(new_radius) / 1544.0 * 2.0
	$Sprite2D.scale.y = float(new_radius) / 1544.0 * 2.0
