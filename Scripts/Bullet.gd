extends Area2D

var speed : int

func _ready():
	pass

func _process(delta):
	global_position.x += speed * delta

func _on_VisibilityEnabler2D_screen_exited():
	queue_free()
	print("Se eliminó")


func _on_Bullet_body_entered(body):
	if("Enemy" in body.get_name()):
		if Resources.p1 == false:
			get_node("../" + body.get_name()).queue_free()
			queue_free()
		else:
			get_node("../Enemies/" + body.get_name()).queue_free()
			queue_free()
			print("Se mató")
