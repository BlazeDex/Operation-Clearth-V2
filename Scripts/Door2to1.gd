extends Area2D
var entered = false

func _on_Area2D_body_entered(body):
	if body.name == "Quote":
		entered = true
		
func _on_Area2D_body_exited(body):
	if body.name == "Quote":
		entered = false
	
func _process(delta):
	$AnimationPlayer.play("Idle")
		
	if entered == true:
		if Input.is_action_just_pressed("ui_down"):
			get_node("../Mensaje/Node2D").visible = true
			get_node("../Mensaje/Label").visible = true
			yield(get_tree().create_timer(4.0), "timeout")
			get_node("../Mensaje/Node2D").visible = false
			get_node("../Mensaje/Label").visible = false
			print("Cambié de escena")
