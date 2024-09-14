extends Node2D

const CIRCLE_SCENE = preload("res://gameplay/circle.tscn")

var circle_scene

func add_new_circle(centre_position, radius):
	circle_scene = CIRCLE_SCENE.instantiate()
	circle_scene.global_position = centre_position
	add_child(circle_scene)
	circle_scene.set_radius(radius)
