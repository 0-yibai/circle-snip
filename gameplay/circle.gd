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
	var test =$".."
	if body.collision_layer == 4:
		test.compass_list[0].queue_free()
		test.compass_list=test.compass_list.slice(1,)
		test.current_compass_count-=1
		test.CC.text = "x %d" % (int(test.CC.text) + 1)
	if body.collision_layer == 2:
		pass
		#lose ???? or minus compass
	print("1")
	pass # Replace with function body.
