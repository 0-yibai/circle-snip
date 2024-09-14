extends CharacterBody2D

var radius = 1544 * 0.05 / 2

var circle
var point

func _ready():
	
	point = $PointOnCircumference
	circle = $Sprite2D
	point.position.x = circle.position.x
	point.position.y = circle.position.y - radius
	



func _on_area_2d_body_entered(body):
	var test =$"../../test"
	var lose =$"../../test/Control/Lose"
	if body.collision_layer == 4:
		test.compass_list[0].queue_free()
		test.compass_list=test.compass_list.slice(1,)
		test.cc+=1
		test.CC.text = "x %d" % (int(test.CC.text) + 1)
	if body.collision_layer == 2:
		lose.visible = true
		get_tree().paused = true
		pass
		#lose ???? or minus compass
	print("1")
	pass # Replace with function body.
	
func set_radius(new_radius):
	radius = new_radius
	$Sprite2D.scale.x = float(new_radius) / 1544.0 * 2.0
	$Sprite2D.scale.y = float(new_radius) / 1544.0 * 2.0
