extends Camera2D


#const RULER = preload("res://utility/ruler.tscn")

#var ruler

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += 1
	
	#test
	#ruler = RULER.instantiate()
	#show_ruler(ruler)
	
func show_ruler(ruler):
	add_child(ruler)
	ruler.position = Vector2(500,0)
