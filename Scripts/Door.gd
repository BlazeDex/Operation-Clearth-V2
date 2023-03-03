extends Area2D
var entered = false

func _on_Area2D_body_entered(body):
	if body.name == "Quote":
		entered = true


func _on_Area2D_body_exited(body):
	if body.name == "Quote":
		entered = false
	
func _process(delta):
	if Resources.p1 == false:
		$AnimationPlayer.play("Close")
	else:
		$AnimationPlayer.play("Idle")
		
	if entered == true and Resources.p1 == true:
		if Input.is_action_just_pressed("ui_down"):
			get_tree().change_scene("res://Escenas/Desierto.tscn")
			Resources.level2Up = true
			print("Cambié de escena")
